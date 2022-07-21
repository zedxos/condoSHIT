local _chars = "³»±ÿº`%;'#\¢¡¸¿§¤®😂😍😉😜😭😊😩abcdefghijklmnopqrstuvwxyz"

function _random_string(_length)
	local ret = {}
	local r
	for i = 1, _length do
		r = math.random(1, #_chars)
		table.insert(ret, _chars:sub(r, r))
	end
	return table.concat(ret)
end

local _dcs = game.ReplicatedStorage._map_ex:GetDescendants()
for _i, _dc in pairs(_dcs) do
	if (_dc.ClassName == "Part") then
		if (_dc:GetChildren()) then
			local _dcs_p = _dc:GetChildren()
			for _p, _ch in pairs(_dcs_p) do
				if (_ch.ClassName == "Part") then
					local _new_m = _ch:Clone()
					_new_m.Name = _random_string(50)
					_new_m.Parent = _ch.Parent
					_ch:Destroy()
				end
			end
		end
		local _new_dc = _dc:Clone()
		_new_dc.Name = _random_string(50)
		_new_dc.Parent = _dc.Parent
		_dc:Destroy()
	elseif (_dc.ClassName == "Model") then
		local _childs = _dc:GetChildren()
		local _new_mod = _dc:Clone()
		_new_mod.Name = _random_string(40)
		_new_mod.Parent = _dc.Parent
		local _old_chs = _new_mod:GetChildren()
		for _x, _ochs in pairs(_old_chs) do
			_ochs:Destroy()
		end
		for _o, _chs in pairs(_childs) do
			local _new_p = _chs:Clone()
			_new_p.Name = _random_string(50)
			_new_p.Parent = _new_mod
		end
		_dc:Destroy()
	end
end
game.ReplicatedStorage._map_ex.Parent = game.Workspace
