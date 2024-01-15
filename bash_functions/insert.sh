insert() {
    if [ "$#" -ne 3 ]; then
        echo "Use: insert <source_file> <target_file> <line_number>"
        return 1
    fi

    source_file=$1
    target_file=$2
    line_number=$3

    temp_file=$(mktemp)

    head -n "$line_number" "$target_file" > "$temp_file"

    cat "$source_file" >> "$temp_file"

    tail -n +$((line_number + 1)) "$source_file" >> "$temp_file"

    mv "$temp_file" "$target_file"
}
