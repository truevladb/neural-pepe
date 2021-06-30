pragma solidity ^0.7.0;

interface IPepeMetadataStore {
    function getIPFSHashHexAtIndex(uint index) external view returns (bytes memory);
    function getTraitBytesAtIndex(uint index) external view returns (bytes4);
}

pragma solidity ^0.7.0;

contract PepeRegistry {
    // Public variables

    //Constants
    address public constant DATASTORE_CONTRACT = ;

    uint256 public startingIndexFromPepeContract;
    uint256 public maxPepeSupply;

    // Internal variables
    bytes internal constant _ALPHABET = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";

    constructor() {
        startingIndexFromPepeContract = 4594;
        maxPepeSupply = 7777;
    }

    function getTraitsOfPepeId(uint256 pepeId)
        public
        view
        returns (
            string memory format,
            string memory backgroundColor,
            string memory color,
            string memory eyes,
            string memory kek,
            string memory special,
            string memory iteration
        )
    {
        require(pepeId < maxPepeSupply, "Pepe ID must be less than 7777");

        // Derives the index of the image in the original sequence assigned to the Pepe ID
        uint256 correspondingOriginalSequenceIndex =
            (pepeId + startingIndexFromPepeContract) % maxPepeSupply;

        bytes4 traitBytes = IPepeMetadataStore(DATASTORE_CONTRACT).getTraitBytesAtIndex(
            correspondingOriginalSequenceIndex)
        ;

        format = _extractFormatTrait(traitBytes);
        backgroundColor = _extractBackgroundColorTrait(traitBytes);
        color = _extractColorTrait(traitBytes);
        eyes = _extractEyesTrait(traitBytes);
        kek = _extractKekTrait(traitBytes);
        special = _extractSpecialTrait(traitBytes);
        iteration = _extractIterationTrait(traitBytes);
    }

    function getIPFSHashOfPepeId(uint256 pepeId)
        public
        view
        returns (string memory ipfsHash)
    {
        require(pepeId < maxPepeSupply, "Pepe ID must be less than 7777");

        // Derives the index of the image in the original sequence assigned to the Pepe ID
        uint256 correspondingOriginalSequenceIndex =
            (pepeId + startingIndexFromPepeContract) % maxPepeSupply;

        ipfsHash = _getIPFSHashOfIndexInOriginalSequence(
            correspondingOriginalSequenceIndex
        );
    }

    function _extractFormatTrait(bytes4 traitBytes)
        internal
        pure
        returns (string memory format)
    {
        bytes1 formatBits = traitBytes[0] & 0x0F;

        if (formatBits == 0x00) {
            format = ".png";
        } else if (formatBits == 0x01) {
            format = ".gif";
        }
    }

    function _extractBackgroundColorTrait(bytes4 traitBytes)
        internal
        pure
        returns (string memory backgroundColor)
    {
        bytes1 backgroundColorBits = traitBytes[1] >> 4;

        if (backgroundColorBits == 0x00) {
            backgroundColor = "Blue";
        } else if (backgroundColorBits == 0x01) {
            backgroundColor = "Orange";
        } else if (backgroundColorBits == 0x02) {
            backgroundColor = "Yellow";
        } else if (backgroundColorBits == 0x03) {
            backgroundColor = "Ultramarine";
        } else if (backgroundColorBits == 0x04) {
            backgroundColor = "Pink";
        } else if (backgroundColorBits == 0x05) {
            backgroundColor = "Black";
        } else if (backgroundColorBits == 0x06) {
            backgroundColor = "Green";
        } else if (backgroundColorBits == 0x07) {
            backgroundColor = "Purple";
        } else if (backgroundColorBits == 0x08) {
            backgroundColor = "Grayish";
        } else if (backgroundColorBits == 0x09) {
            backgroundColor = "Gray";
        } else if (backgroundColorBits == 0x0A) {
            backgroundColor = "Red";
        } else if (backgroundColorBits == 0x0B) {
            backgroundColor = "Violent";
        } else if (backgroundColorBits == 0x0C) {
            backgroundColor = "Silver";
        } else if (backgroundColorBits == 0x0D) {
            backgroundColor = "White";
        } else if (backgroundColorBits == 0x0E) {
            backgroundColor = "Brown";
        } else if (backgroundColorBits == 0x0F) {
            backgroundColor = "Indefinite";
        }
    }

    function _extractColorTrait(bytes4 traitBytes)
        internal
        pure
        returns (string memory color)
    {
        bytes1 colorBits = traitBytes[1] & 0x0F;

        if (colorBits == 0x00) {
            color = "Blue";
        } else if (colorBits == 0x01) {
            color = "Yellow";
        } else if (colorBits == 0x02) {
            color = "Orange";
        } else if (colorBits == 0x03) {
            color = "Pink";
        } else if (colorBits == 0x04) {
            color = "Black";
        } else if (colorBits == 0x05) {
            color = "Green";
        } else if (colorBits == 0x06) {
            color = "Purple";
        } else if (colorBits == 0x07) {
            color = "Grayish";
        } else if (colorBits == 0x08) {
            color = "Red";
        } else if (colorBits == 0x09) {
            color = "Turquoise";
        } else if (colorBits == 0x0A) {
            color = "White";
        } else if (colorBits == 0x0B) {
            color = "Violent";
        } else if (colorBits == 0x0C) {
            color = "Indefinite";
        }
    }

    function _extractEyesTrait(bytes4 traitBytes)
        internal
        pure
        returns (string memory eyes)
    {
        bytes1 eyesBits = traitBytes[2] >> 4;

        if (eyesBits == 0x00) {
            eyes = "0";
        } else if (eyesBits == 0x01) {
            eyes = "1";
        } else if (eyesBits == 0x02) {
            eyes = "2";
        } else if (eyesBits == 0x03) {
            eyes = "3";
        } else if (eyesBits == 0x04) {
            eyes = "4";
        } else if (eyesBits == 0x05) {
            eyes = "5";
        } else if (eyesBits == 0x06) {
            eyes = "6";
        } else if (eyesBits == 0x07) {
            eyes = "Indefinite";
        }
    }

    function _extractKekTrait(bytes4 traitBytes)
        internal
        pure
        returns (string memory kek)
    {
        bytes1 kekBits = traitBytes[2] & 0x0F;

        if (kekBits == 0x00) {
            kek = "Kek";
        } else if (kekBits == 0x01) {
            kek = "Keket";
        } else if (kekBits == 0x02) {
            kek = "Kekui";
        } else if (kekBits == 0x03) {
            kek = "Kekuit";
        }
    }

    function _extractSpecialTrait(bytes4 traitBytes)
        internal
        pure
        returns (string memory special)
    {
        bytes1 specialBits = traitBytes[3] >> 4;

        if (specialBits == 0x00) {
            special = "Soaring";
        } else if (specialBits == 0x01) {
            special = "Trypophobic";
        } else if (specialBits == 0x02) {
            special = "Suit";
        } else if (specialBits == 0x03) {
            special = "Nose";
        } else if (specialBits == 0x04) {
            special = "Joker";
        } else if (specialBits == 0x05) {
            special = "Cute";
        } else if (specialBits == 0x06) {
            special = "Bow tie";
        } else if (specialBits == 0x07) {
            special = "Cursed";
        } else if (specialBits == 0x08) {
            special = "Hair";
        } else if (specialBits == 0x09) {
            special = "Dirty";
        } else if (specialBits == 0x0A) {
            special = "Beard";
        } else if (specialBits == 0x0B) {
            special = "Watermelon";
        } else if (specialBits == 0x0C) {
            special = "Hat";
        } else if (specialBits == 0x0D) {
            special = "Unknown";
        }
    }

    function _extractIterationTrait(bytes4 traitBytes)
        internal
        pure
        returns (string memory iteration)
    {
        bytes1 iterationBits = traitBytes[3] & 0x0F;

        if (iterationBits == 0x00) {
            iteration = "2";
        } else if (iterationBits == 0x01) {
            iteration = "36";
        } else if (iterationBits == 0x02) {
            iteration = "44";
        } else if (iterationBits == 0x03) {
            iteration = "56";
        } else if (iterationBits == 0x04) {
            iteration = "66";
        } else if (iterationBits == 0x05) {
            iteration = "100";
        } else if (iterationBits == 0x06) {
            iteration = "112";
        } else if (iterationBits == 0x07) {
            iteration = "120";
        } else if (iterationBits == 0x08) {
            iteration = "128";
        } else if (iterationBits == 0x09) {
            iteration = "Indefinite";
        }
    }

    function _getIPFSHashOfIndexInOriginalSequence(uint256 index)
        internal
        view
        returns (string memory)
    {
        return
            _toBase58(
                IPepeMetadataStore(DATASTORE_CONTRACT).getIPFSHashHexAtIndex(index)
            );
    }

    // Source: verifyIPFS (https://github.com/MrChico/verifyIPFS/blob/master/contracts/verifyIPFS.sol)
    // @author Martin Lundfall (martin.lundfall@consensys.net)
    // @dev Converts hex string to base 58
    function _toBase58(bytes memory source)
        internal
        pure
        returns (string memory)
    {
        if (source.length == 0) return new string(0);
        uint8[] memory digits = new uint8[](46);
        digits[0] = 0;
        uint8 digitlength = 1;
        for (uint256 i = 0; i < source.length; ++i) {
            uint256 carry = uint8(source[i]);
            for (uint256 j = 0; j < digitlength; ++j) {
                carry += uint256(digits[j]) * 256;
                digits[j] = uint8(carry % 58);
                carry = carry / 58;
            }

            while (carry > 0) {
                digits[digitlength] = uint8(carry % 58);
                digitlength++;
                carry = carry / 58;
            }
        }
        return string(_toAlphabet(_reverse(_truncate(digits, digitlength))));
    }

    function _truncate(uint8[] memory array, uint8 length)
        internal
        pure
        returns (uint8[] memory)
    {
        uint8[] memory output = new uint8[](length);
        for (uint256 i = 0; i < length; i++) {
            output[i] = array[i];
        }
        return output;
    }

    function _reverse(uint8[] memory input)
        internal
        pure
        returns (uint8[] memory)
    {
        uint8[] memory output = new uint8[](input.length);
        for (uint256 i = 0; i < input.length; i++) {
            output[i] = input[input.length - 1 - i];
        }
        return output;
    }

    function _toAlphabet(uint8[] memory indices)
        internal
        pure
        returns (bytes memory)
    {
        bytes memory output = new bytes(indices.length);
        for (uint256 i = 0; i < indices.length; i++) {
            output[i] = _ALPHABET[indices[i]];
        }
        return output;
    }
}
