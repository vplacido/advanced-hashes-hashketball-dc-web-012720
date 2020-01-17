def game_hash
  newHash = {
    home: {
      team_name: "Brooklyn Nets", 
      colors: ["Black", "White"], 
      players: [
        {player_name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1}, 
        {player_name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7}, 
        {player_name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15}, 
        {player_name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5}, 
        {player_name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}]
    }, 
    away: {
    team_name: "Charlotte Hornets", 
    colors: ["Turquoise", "Purple"], 
    players: [
      {player_name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2}, 
      {player_name: "Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10}, 
      {player_name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5}, 
      {player_name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0}, 
      {player_name: "Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}]
    }
  }
end

def num_points_scored(name)
  game_hash.each do |team_type, t|
    t[:players].each do |player|
      if (player[:player_name] === name)
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team_type, t|
    t[:players].each do |player|
      if (player[:player_name] === name)
        return player[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |team_type, t|
    if (t[:team_name] === team)
      return t[:colors].map(&:capitalize)
    end
  end
end

def team_names
  game_hash.map {|team_type, t| t[:team_name]}
end

def player_numbers(team)
  game_hash.each do |team_type, t|
    if (t[:team_name] === team)
      return t[:players].map {|player| player[:number]}
    end
  end
end

def player_stats(name)
  game_hash.each do |team_type, t|
    t[:players].each do |player|
      if (player[:player_name] === name)
        player.delete(:player_name)
        return player
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = 0 
  rebounds = 0 
  game_hash.each do |team_type, t|
    t[:players].each do |player|
      if (player[:shoe] > shoe_size)
        shoe_size = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  points = 0 
  leader = ""
  game_hash.each do |team_type, t|
    t[:players].each do |player|
      if (player[:points] > points)
        points = player[:points]
        leader = player[:player_name]
      end
    end
  end
  leader
end

def winning_team
  team = {}
  game_hash.each do |team_type, t|
    points = 0 
    t[:players].each do |player|
      points += player[:points]
    end
    team[t[:team_name]] = points
  end
  if (team["Brooklyn Nets"] > team["Charlotte Hornets"])
    return "Brooklyn Nets"
  end
  "Charlotte Hornets"
end

def player_with_longest_name
  name = ""
  game_hash.each do |team_type, t|
    t[:players].each do |player|
      if (player[:player_name].length > name.length)
        name = player[:player_name]
      end
    end
  end
  name
end

def long_name_steals_a_ton?
  steals = 0 
  name = ""
  game_hash.each do |team_type, t|
    t[:players].each do |player|
      if (player[:steals] > steals)
        name = player[:player_name]
        steals = player[:steals]
      end
    end
  end
  name === player_with_longest_name
end
      
  