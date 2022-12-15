Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669F664DCED
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 15:36:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5pK0-0007HH-K2; Thu, 15 Dec 2022 09:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1p5pJy-0007Di-Mm
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:34:50 -0500
Received: from mail-sgaapc01olkn20802.outbound.protection.outlook.com
 ([2a01:111:f400:feab::802]
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1p5pJu-0004gi-KJ
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:34:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0PQ5j+3dqgk1+P+spTIgQF7wooD2HUMU/mEScre4bhIDkrjdnQXmx0s+MhF4QUjQuA2lR9x2LW2lETd/28Ibyi/GceAO7cLvP6W/ywQOoa4X5TVJssr5ggtF7pRJL4L24+VFgHiSoe31nvxybcGgTW7sDxDBoo4u0EDNjifcKwPcBg7IG2Q0aVoEItDKzvvYa2WDA913uVMCoSrC5lKo6Iw73VO27jRlNPia1fcrjQbkC9vFU0bNfBwQ8KOWWAxGuN1RHxtUPUbz20/1M8qvvYarlMQ4uZ5FyWczV9/MdYlwJpBse/fVGmAR5xIdG3cjfZcEZ8WaR5oSLtKqBM/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E76hc1o/eFz9acrAcDwR16MyNaw+FoPaK0CHNCJtvcw=;
 b=RG8AHGyXfYegBku9zk0N6vRd8u0r2/k+94ZCOcJNXpwQltgr5/Mkl2Rr8yIAsm1dK4HzV6B/q9WEeJuFMObZ71WfMcqrGubCHS8wEkTB8JhWt0AkDFfWsbgz7z2VWbXcLsxP8I50SWDFFikt5UDQt+UfIv1VbNrp8TFC9BxdQp9L9hpZ/bp5ixqxDMjLGuFNnunMUoliR8+eOfO+Mh+nxHgzn9RmNxYKF9+XzhLpl9LDDUa6BKH4QOquok1/8QLO4AiHMKIk2a1q3G0ckfqLb3isXITw5nKBvxbWt1KL5953gV9Bj/E2EtvcF+pcYlHtFMZfFkHO9P5w9zYmS3FNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11) by SEYPR01MB5340.apcprd01.prod.exchangelabs.com
 (2603:1096:101:d2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 14:29:36 +0000
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::56db:1c2:8886:e624]) by
 TY0PR0101MB4285.apcprd01.prod.exchangelabs.com ([fe80::56db:1c2:8886:e624%3])
 with mapi id 15.20.5924.011; Thu, 15 Dec 2022 14:29:35 +0000
From: =?iso-2022-jp?B?GyRCMEtGIxsoQiAbJEJCQEA2GyhC?= <taisei1212@outlook.jp>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Subject: RE: [PATCH] target/i386/gdbstub: Fix a bug about order of FPU stack
 in 'g' packets.
Thread-Topic: [PATCH] target/i386/gdbstub: Fix a bug about order of FPU stack
 in 'g' packets.
Thread-Index: AQHZCwDjZBKywugnIkOkwi5hlpwfcq5vDPNt
Date: Thu, 15 Dec 2022 14:29:35 +0000
Message-ID: <TY0PR0101MB428539D1FC8F61D7D780ACFEA4E19@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
References: <TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
In-Reply-To: <TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [voNisQI8zzOVq0apC9cvz/+fdvEM9bEQ]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR0101MB4285:EE_|SEYPR01MB5340:EE_
x-ms-office365-filtering-correlation-id: c3b8ef00-65fb-4e29-aec7-08dadea8ca4b
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: modF6UA5WND6ssOCj8OedaiEaysoxkpDf/+ZSKxusPF39NSlIR8Tw4SCg+oXs52OgQ7zNjqeTFhnQx/eMGZEmYy/apTYaXG5mZbdqC/EEOfShEh5D7ES9df+ooQ238Yo2USDyX7Ff731Klxf+0TTtVeHvGxL9oRQ+fSmGhYxQ4VlL0sM2ZSHLpQCcwwSefUQ4hbQhuS3tJeAf6Xw7NQ10Geql9611wKM+P5VPToNls0DDx8dGKjnH0sKY/89Pa7AkbsQp2MtsZdmWrTvNS44o2LRJY4H9j8y4hLhaeJ9oRDpZliE/PA2b7ufz2wkyHB6bu6clHcytXtbUqTAMBCUZsSxRkPo2dduXZ8yfFWX0yGXIsUKPRlDuohE0KxbDxm9pELnPEIEy44YlcPRBcuveMJULzBOAmpujXJ5DSnkoFr010N6M6E0hNepBlt6PtGxicPvp1cV0qzfCMnbcdhUCbU0pL4B7D97aM4+Kw8gEh+ms56k8z0H5mTxWU96lh2y2+gT09cDPwMByoTzYv5zoK3qfUy2V5lHLsK576hYpWtI99pH4V93ZOKiAV3uXpCt5Zw5ppIGDxtx/hrBEOZP4vzoji5vWeCeHPzjRwjLzoXVfutjQH97JuAoa+xTzxgXR/AGQDAoaiAkhY9RzAsjpQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?cS9NOUEycXF3SnlpVXgyVzhPY2tVY3lEckNxclVoZ3hHLzh0S1BJUEJM?=
 =?iso-2022-jp?B?NTYxbTJXejNranphVjFpSTE2K2N5eGIvQ09DTVhtNnRVNU56REsrOXVa?=
 =?iso-2022-jp?B?V0dBeGtwWWwyV3NuNTVTaGhLVmtYMElvRjdRbm5GR01YWmhlWmdXTmx2?=
 =?iso-2022-jp?B?NlhmOFJIcEVVYnFvNDhlanRnU1YySWJoZ3hscFdsN052SkdWTkUxQWJX?=
 =?iso-2022-jp?B?UUdkUmZDSFJwWXVUMjlyZlR2N2Z0UENxMFFFNjZiSnFxRlBFVzEyVWQw?=
 =?iso-2022-jp?B?TFkvbkZqWUp6S0x3QnFjdG9BbzNCRWJPRTZZUzdTUXFMeFJBRlZ3RVIr?=
 =?iso-2022-jp?B?YmJKOWJhSk1RTEVOWmxydFhja1l0MnpHdzZIckI5ckNvNCt1RTJSOCtM?=
 =?iso-2022-jp?B?ZzRBNW9ScnFlY2sySjBaU1lMVWREbVhnNW1qQkdQMVU1a1NVRWIzV1RD?=
 =?iso-2022-jp?B?d1NoZ21rQU90bERjRTk2OVlnS0I5bHIzWk1IUkh0LzhJMEViL3VsV2px?=
 =?iso-2022-jp?B?WXRXczRyQnJ1MkxFbG9tVW1PazN1SjZubFZXTFIram13aXZpcHhLM1I5?=
 =?iso-2022-jp?B?Tlh3N25Zd0ZQNCthQmRkQmJSakdvU1NsU0l6dENyMHBjMVhmQVJ4T1Az?=
 =?iso-2022-jp?B?NU8vSmE1KytLSXVqZXdyRVh0SElMNEpzcjVmUS9tU0h2eFU5YWdhRVJQ?=
 =?iso-2022-jp?B?VmZhV1UzNTkxdmFVKys2VW5id2laVHFFSHl1VGNRVU44aVZubG90MEhK?=
 =?iso-2022-jp?B?eVZ1alZCaWgzUWZPZmtCLzZTQm1jU2llWldTK0UrRlcvNElHTnVqa29F?=
 =?iso-2022-jp?B?ZFcrS1hWK2VZS0dzZGQ5SCt4VC83VXovY3o4S3F0eU5RWGVVUHlkZE8v?=
 =?iso-2022-jp?B?OFlnWGo4VHBsTUVza3ZGMEpZa2VGd3ZURE5JZmZSZHlXUWQwYjZacXV4?=
 =?iso-2022-jp?B?QnZlRFgvUkhIY0dOczBuZElMblQ0OUI4ZUZ4UmFWUkZvKzZOdmgzeGlW?=
 =?iso-2022-jp?B?NXZsQlZvUmRUbzZXRHlrOEt2YndjM3pQVFNWS0ZjeGh2WTNmR21BUHQ3?=
 =?iso-2022-jp?B?M3N3eHptUjJLdVhrNUl3T05SR3IyUGFTMW13NjdDOExFNWh3dHpHRStH?=
 =?iso-2022-jp?B?OFphTzA0b3FUcEhCSnVuMlZtdU12N002U2hRcmlxUys2YVlXTTNRRnA2?=
 =?iso-2022-jp?B?MEJ5cHl1dWczc29BbTZLcTVOTjBXNzFEbXhRdGtyaU5sWDBtSXBRenVY?=
 =?iso-2022-jp?B?K0ZiRnpLVVR4S0hzNGVZWGtOb052UnZSYXJidDlnK2VUVlNHSWtyVzFm?=
 =?iso-2022-jp?B?MUdKNnNoNUoyVkdET0tabWQzdkFjVk81bXJ4MWtkYU4ySGJDWnRFTzE1?=
 =?iso-2022-jp?B?TG54QThFblJ5Q3E3bEtlM0dSeUdoaDYzZmM0SjA5Z0xoakRiQUNNSkZC?=
 =?iso-2022-jp?B?VmhzeVl2d1JUWDBGYlRsckZiUWpTR3FBVVBJNDZLK3ZnalZMVmNEU3Bi?=
 =?iso-2022-jp?B?QThGc29UZk1MLzVBWkFSWFhCWTBRRmxYK0dBRFBXajRkRE01eG91dzJv?=
 =?iso-2022-jp?B?ZWthT0UzMG5kTHQ3RHQxMlZEVzRDamk3ODRxWG94M1gxVWUwQ1dTTG1j?=
 =?iso-2022-jp?B?QnF5YUNMZWY4QzAwMUlPWWkzZFA1UWNYbmZFZUpWK3ZUUkxVVWpsT2VS?=
 =?iso-2022-jp?B?ZHlSczFuMEFGanlyMDYvTzNZSXdSczNZZlNrMndRZ2JJOWhnSGtPTDNp?=
 =?iso-2022-jp?B?WWRrdjlaNm1YNys5WFRSN3NJZjZheGZsUXhKamZMZ2lzaEJFaVI2VWR1?=
 =?iso-2022-jp?B?NGg0ZW5QdWlBUEJ4bzBwRjNVSnN1NURGTHJ4UUVvTVJlYktVL1BNYTJo?=
 =?iso-2022-jp?B?TXBPSEZTTUxhLzA5ck1IVmhVK2NNPQ==?=
Content-Type: multipart/alternative;
 boundary="_000_TY0PR0101MB428539D1FC8F61D7D780ACFEA4E19TY0PR0101MB4285_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b8ef00-65fb-4e29-aec7-08dadea8ca4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 14:29:35.5863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR01MB5340
Received-SPF: pass client-ip=2a01:111:f400:feab::802;
 envelope-from=taisei1212@outlook.jp;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: 16
X-Spam_score: 1.6
X-Spam_bar: +
X-Spam_report: (1.6 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_TY0PR0101MB428539D1FC8F61D7D780ACFEA4E19TY0PR0101MB4285_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Supplementary explanation about the patch

1. Reproduction of the bug

The following 3 files are needed to reproduce the bug.

* test_os.s
* test_os.ld
* Makefile

And the following 2 tools, too.

* build-essential
* gdb

The contents of the above files are below.

---------- Begin of test_os.s ----------

            .code16
            .text
main:
            fninit  # Initialize the FPU
            fld1    # Push 1.0
            fldl2t  # Push log 2 10
            fldl2e # Push log 2 e
            fldpi   # Push pi
            fldlg2 # Push log 10 2
            fldln2 # Push log e 2
            fldz     # Push 0.0
loop:
            hlt
            jmp loop

---------- End of test_os.s ----------

---------- Begin of test_os.ld ----------

OUTPUT_FORMAT("binary");

BASE =3D 0x00007c00;

SECTIONS
{
            . =3D BASE;
            .text :
            {
                       test_os.o(.text)
            }
            . =3D BASE;
            . +=3D 0x00000200;
            . -=3D 0x00000002;
            .boot_sector_sign :
            {
                       BYTE(0x55);
                       BYTE(0xaa);
            }
            /DISCARD/ :
            {
                       *(.eh_frame)
                       *(.note.gnu.property)
            }
}

---------- End of test_os.ld ----------

---------- Begin of Makefile ----------

TEST_OS_NAME =3D test_o
TEST_OS_NAME =3D test_os
TEST_OS_ASM =3D $(TEST_OS_NAME).s
TEST_OS_IMG =3D $(TEST_OS_NAME).img
TEST_OS_LNK =3D $(TEST_OS_NAME).ld
TEST_OS_MAP =3D $(TEST_OS_NAME).map
TEST_OS_OBJ =3D $(TEST_OS_NAME).o

all: $(TEST_OS_IMG)

test: $(TEST_OS_IMG)
            (qemu-system-i386 -boot order=3Da \
            -drive file=3D$<,format=3Draw,if=3Dfloppy \
            -S -gdb tcp::2159 -vnc localhost:0 &) && \
            gdb

$(TEST_OS_IMG): $(TEST_OS_OBJ) $(TEST_OS_LNK)
            ld $< -Map $(TEST_OS_MAP) -o $@ -T $(word 2, $^)

$(TEST_OS_OBJ): $(TEST_OS_ASM)
            gcc $^ -c -nostdlib -o $@ -Wall -Wextra

---------- End of Makefile ----------

Put these files on a same directory. "test_os.s" is source code of tiny OS
to run on QEMU. The OS consists only a boot sector. It initialize x87 FPU
and pushes some floating point values onto x87 FPU stack. "test_os.ld" is
its linker script. And you can make "test_os.img", a raw image of the OS.
Now, there are all things to reproduce the bug. You can "make test" to let
QEMU run the OS and wait for GDB, then GDB will start. Then you can execute
some GDB commands to reproduce the bug. Below is "result 1" reproducing the
bug.

---------- Begin of result 1 ----------

GNU gdb (GDB) 13.0.50.20221204-git
Copyright (C) 2022 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.htm=
l>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-pc-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word".
(gdb) target remote localhost:2159
Remote debugging using localhost:2159
warning: No executable has been specified and target does not support
determining executable automatically.  Try using the "file" command.
0x0000fff0 in ?? ()
(gdb) break *0x7c00
Breakpoint 1 at 0x7c00
(gdb) continue
Continuing.

Breakpoint 1, 0x00007c00 in ?? ()
(gdb) x/10i $eip
=3D> 0x7c00:      fninit
   0x7c02:      fld1
   0x7c04:      fldl2t
   0x7c06:      fldl2e
   0x7c08:      fldpi
   0x7c0a:      fldlg2
   0x7c0c:      fldln2
   0x7c0e:      fldz
   0x7c10:      hlt
   0x7c11:      jmp    0x7c10
(gdb) stepi
0x00007c02 in ?? ()
(gdb) info float
  R7: Valid   0x00000000000000000000 +0
  R6: Valid   0x00000000000000000000 +0
  R5: Valid   0x00000000000000000000 +0
  R4: Valid   0x00000000000000000000 +0
  R3: Valid   0x00000000000000000000 +0
  R2: Valid   0x00000000000000000000 +0
  R1: Valid   0x00000000000000000000 +0
=3D>R0: Valid   0x00000000000000000000 +0

Status Word:         0x0000
                       TOP: 0
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c04 in ?? ()
(gdb) info float
=3D>R7: Valid   0x00000000000000000000 +0
  R6: Valid   0x3fff8000000000000000 +1
  R5: Valid   0x00000000000000000000 +0
  R4: Valid   0x00000000000000000000 +0
  R3: Valid   0x00000000000000000000 +0
  R2: Valid   0x00000000000000000000 +0
  R1: Valid   0x00000000000000000000 +0
  R0: Valid   0x00000000000000000000 +0

Status Word:         0x3800
                       TOP: 7
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c06 in ?? ()
(gdb) info float
  R7: Valid   0x00000000000000000000 +0
=3D>R6: Valid   0x00000000000000000000 +0
  R5: Valid   0x3fff8000000000000000 +1
  R4: Valid   0x4000d49a784bcd1b8afe +3.321928094887362348
  R3: Valid   0x00000000000000000000 +0
  R2: Valid   0x00000000000000000000 +0
  R1: Valid   0x00000000000000000000 +0
  R0: Valid   0x00000000000000000000 +0

Status Word:         0x3000
                       TOP: 6
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c08 in ?? ()
(gdb) info float
  R7: Valid   0x00000000000000000000 +0
  R6: Valid   0x00000000000000000000 +0
=3D>R5: Valid   0x00000000000000000000 +0
  R4: Valid   0x3fff8000000000000000 +1
  R3: Valid   0x4000d49a784bcd1b8afe +3.321928094887362348
  R2: Valid   0x3fffb8aa3b295c17f0bc +1.442695040888963407
  R1: Valid   0x00000000000000000000 +0
  R0: Valid   0x00000000000000000000 +0

Status Word:         0x2800
                       TOP: 5
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c0a in ?? ()
(gdb) info float
  R7: Valid   0x00000000000000000000 +0
  R6: Valid   0x00000000000000000000 +0
  R5: Valid   0x00000000000000000000 +0
=3D>R4: Valid   0x00000000000000000000 +0
  R3: Valid   0x3fff8000000000000000 +1
  R2: Valid   0x4000d49a784bcd1b8afe +3.321928094887362348
  R1: Valid   0x3fffb8aa3b295c17f0bc +1.442695040888963407
  R0: Valid   0x4000c90fdaa22168c235 +3.141592653589793239

Status Word:         0x2000
                       TOP: 4
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c0c in ?? ()
(gdb) info float
  R7: Valid   0x4000c90fdaa22168c235 +3.141592653589793239
  R6: Valid   0x3ffd9a209a84fbcff799 +0.3010299956639811952
  R5: Valid   0x00000000000000000000 +0
  R4: Valid   0x00000000000000000000 +0
=3D>R3: Valid   0x00000000000000000000 +0
  R2: Valid   0x3fff8000000000000000 +1
  R1: Valid   0x4000d49a784bcd1b8afe +3.321928094887362348
  R0: Valid   0x3fffb8aa3b295c17f0bc +1.442695040888963407

Status Word:         0x1800
                       TOP: 3
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c0e in ?? ()
(gdb) info float
  R7: Valid   0x3fffb8aa3b295c17f0bc +1.442695040888963407
  R6: Valid   0x4000c90fdaa22168c235 +3.141592653589793239
  R5: Valid   0x3ffd9a209a84fbcff799 +0.3010299956639811952
  R4: Valid   0x3ffeb17217f7d1cf79ac +0.6931471805599453094
  R3: Valid   0x00000000000000000000 +0
=3D>R2: Valid   0x00000000000000000000 +0
  R1: Valid   0x3fff8000000000000000 +1
  R0: Valid   0x4000d49a784bcd1b8afe +3.321928094887362348

Status Word:         0x1000
                       TOP: 2
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c10 in ?? ()
(gdb) info float
  R7: Valid   0x4000d49a784bcd1b8afe +3.321928094887362348
  R6: Valid   0x3fffb8aa3b295c17f0bc +1.442695040888963407
  R5: Valid   0x4000c90fdaa22168c235 +3.141592653589793239
  R4: Valid   0x3ffd9a209a84fbcff799 +0.3010299956639811952
  R3: Valid   0x3ffeb17217f7d1cf79ac +0.6931471805599453094
  R2: Valid   0x00000000000000000000 +0
=3D>R1: Valid   0x00000000000000000000 +0
  R0: Valid   0x3fff8000000000000000 +1

Status Word:         0x0800
                       TOP: 1
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000

---------- End of result 1 ----------

As you can see, the FPU stack rotates every pushing.

2. Cause

There is a cause of the bug in a function "x86_cpu_gdb_read_register" in
"qemu/target/i386/gdbstub.c". GDB receives a command "info float" from stdi=
n
and get values of the all registers containing FPU stack registers from QEM=
U
to print them. Then, QEMU picks registers in the function to form 'g' packe=
t
to send to GDB. In line 124 of the c source file, absolute indexed FPU stac=
k
registers, namely, R0, ... and R7 , are picked and inserted in 'g' packet.
However, GDB, the packet receiver, extracts FPU stack registers from the
packet and interpret these registers are stack top relative indexed, namely=
,
ST0, ... and ST7. As a result, GDB can't print FPU stack correctly.

3. Modification

In added lines of this patch, "n" is a register number of a register to
read. And "IDX_FP_REGS" is register number of the first FPU stack register
"R0". So, "r_index" is absolute index of FPU stack register to read. And
"env->fpstt" is a pointer to top of FPU stack. So, "st_index" is stack top
relative index of FPU stack register to read. By applying this modification=
,
QEMU inserts FPU stack registers ordered by stack top relative index in 'g'
packet.

4. After this patch

Below is "result 2" operating as same as "result 1" after applying this
patch.

---------- Begin of result 2 ----------

GNU gdb (GDB) 13.0.50.20221204-git
Copyright (C) 2022 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.htm=
l>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-pc-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word".
(gdb) target remote localhost:2159
Remote debugging using localhost:2159
warning: No executable has been specified and target does not support
determining executable automatically.  Try using the "file" command.
0x0000fff0 in ?? ()
(gdb) break *0x7c00
Breakpoint 1 at 0x7c00
(gdb) continue
Continuing.

Breakpoint 1, 0x00007c00 in ?? ()
(gdb) x/10i $eip
=3D> 0x7c00:      fninit
   0x7c02:      fld1
   0x7c04:      fldl2t
   0x7c06:      fldl2e
   0x7c08:      fldpi
   0x7c0a:      fldlg2
   0x7c0c:      fldln2
   0x7c0e:      fldz
   0x7c10:      hlt
   0x7c11:      jmp    0x7c10
(gdb) stepi
0x00007c02 in ?? ()
(gdb) info float
  R7: Valid   0x00000000000000000000 +0
  R6: Valid   0x00000000000000000000 +0
  R5: Valid   0x00000000000000000000 +0
  R4: Valid   0x00000000000000000000 +0
  R3: Valid   0x00000000000000000000 +0
  R2: Valid   0x00000000000000000000 +0
  R1: Valid   0x00000000000000000000 +0
=3D>R0: Valid   0x00000000000000000000 +0

Status Word:         0x0000
                       TOP: 0
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c04 in ?? ()
(gdb) info float
=3D>R7: Valid   0x3fff8000000000000000 +1
  R6: Valid   0x00000000000000000000 +0
  R5: Valid   0x00000000000000000000 +0
  R4: Valid   0x00000000000000000000 +0
  R3: Valid   0x00000000000000000000 +0
  R2: Valid   0x00000000000000000000 +0
  R1: Valid   0x00000000000000000000 +0
  R0: Valid   0x00000000000000000000 +0

Status Word:         0x3800
                       TOP: 7
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c06 in ?? ()
(gdb) info float
  R7: Valid   0x3fff8000000000000000 +1
=3D>R6: Valid   0x4000d49a784bcd1b8afe +3.321928094887362348
  R5: Valid   0x00000000000000000000 +0
  R4: Valid   0x00000000000000000000 +0
  R3: Valid   0x00000000000000000000 +0
  R2: Valid   0x00000000000000000000 +0
  R1: Valid   0x00000000000000000000 +0
  R0: Valid   0x00000000000000000000 +0

Status Word:         0x3000
                       TOP: 6
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c08 in ?? ()
(gdb) info float
  R7: Valid   0x3fff8000000000000000 +1
  R6: Valid   0x4000d49a784bcd1b8afe +3.321928094887362348
=3D>R5: Valid   0x3fffb8aa3b295c17f0bc +1.442695040888963407
  R4: Valid   0x00000000000000000000 +0
  R3: Valid   0x00000000000000000000 +0
  R2: Valid   0x00000000000000000000 +0
  R1: Valid   0x00000000000000000000 +0
  R0: Valid   0x00000000000000000000 +0

Status Word:         0x2800
                       TOP: 5
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c0a in ?? ()
(gdb) info float
  R7: Valid   0x3fff8000000000000000 +1
  R6: Valid   0x4000d49a784bcd1b8afe +3.321928094887362348
  R5: Valid   0x3fffb8aa3b295c17f0bc +1.442695040888963407
=3D>R4: Valid   0x4000c90fdaa22168c235 +3.141592653589793239
  R3: Valid   0x00000000000000000000 +0
  R2: Valid   0x00000000000000000000 +0
  R1: Valid   0x00000000000000000000 +0
  R0: Valid   0x00000000000000000000 +0

Status Word:         0x2000
                       TOP: 4
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c0c in ?? ()
(gdb) info float
  R7: Valid   0x3fff8000000000000000 +1
  R6: Valid   0x4000d49a784bcd1b8afe +3.321928094887362348
  R5: Valid   0x3fffb8aa3b295c17f0bc +1.442695040888963407
  R4: Valid   0x4000c90fdaa22168c235 +3.141592653589793239
=3D>R3: Valid   0x3ffd9a209a84fbcff799 +0.3010299956639811952
  R2: Valid   0x00000000000000000000 +0
  R1: Valid   0x00000000000000000000 +0
  R0: Valid   0x00000000000000000000 +0

Status Word:         0x1800
                       TOP: 3
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c0e in ?? ()
(gdb) info float
  R7: Valid   0x3fff8000000000000000 +1
  R6: Valid   0x4000d49a784bcd1b8afe +3.321928094887362348
  R5: Valid   0x3fffb8aa3b295c17f0bc +1.442695040888963407
  R4: Valid   0x4000c90fdaa22168c235 +3.141592653589793239
  R3: Valid   0x3ffd9a209a84fbcff799 +0.3010299956639811952
=3D>R2: Valid   0x3ffeb17217f7d1cf79ac +0.6931471805599453094
  R1: Valid   0x00000000000000000000 +0
  R0: Valid   0x00000000000000000000 +0

Status Word:         0x1000
                       TOP: 2
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000
(gdb) stepi
0x00007c10 in ?? ()
(gdb) info float
  R7: Valid   0x3fff8000000000000000 +1
  R6: Valid   0x4000d49a784bcd1b8afe +3.321928094887362348
  R5: Valid   0x3fffb8aa3b295c17f0bc +1.442695040888963407
  R4: Valid   0x4000c90fdaa22168c235 +3.141592653589793239
  R3: Valid   0x3ffd9a209a84fbcff799 +0.3010299956639811952
  R2: Valid   0x3ffeb17217f7d1cf79ac +0.6931471805599453094
=3D>R1: Valid   0x00000000000000000000 +0
  R0: Valid   0x00000000000000000000 +0

Status Word:         0x0800
                       TOP: 1
Control Word:        0x037f   IM DM ZM OM UM PM
                       PC: Extended Precision (64-bits)
                       RC: Round to nearest
Tag Word:            0x0000
Instruction Pointer: 0x00:0x00000000
Operand Pointer:     0x00:0x00000000
Opcode:              0x0000

---------- End of result 2 ----------


--_000_TY0PR0101MB428539D1FC8F61D7D780ACFEA4E19TY0PR0101MB4285_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:99.25pt 85.05pt 85.05pt 85.05pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Supplementary explanation about the patch</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1. Reproduction of the bug</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following 3 files are needed to reproduce the bu=
g.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">* test_os.s</p>
<p class=3D"MsoNormal">* test_os.ld</p>
<p class=3D"MsoNormal">* Makefile</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">And the following 2 tools, too.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">* build-essential</p>
<p class=3D"MsoNormal">* gdb</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The contents of the above files are below.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---------- Begin of test_os.s ----------</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; .code16</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; .text</p>
<p class=3D"MsoNormal">main:</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fninit&nbsp; # Initialize the FPU</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fld1&nbsp;&nbsp;&nbsp; # Push 1.0</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fldl2t&nbsp; # Push log 2 10</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fldl2e # Push log 2 e</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fldpi&nbsp;&nbsp; # Push pi</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fldlg2 # Push log 10 2</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fldln2 # Push log e 2</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fldz&nbsp;&nbsp;&nbsp;&nbsp; # Push 0.0</p>
<p class=3D"MsoNormal">loop:</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; hlt</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; jmp loop</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---------- End of test_os.s ----------</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---------- Begin of test_os.ld ----------</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">OUTPUT_FORMAT(&quot;binary&quot;);</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">BASE =3D 0x00007c00;</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">SECTIONS</p>
<p class=3D"MsoNormal">{</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; . =3D BASE;</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; .text :</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; {</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; test_os.o(.text)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;. =3D BASE;</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; . +=3D 0x00000200;</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; . -=3D 0x00000002;</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; .boot_sector_sign :</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; {</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; BYTE(0x55);</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; BYTE(0xaa);</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /DISCARD/ :</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; {</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; *(.eh_frame)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; *(.note.gnu.property)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }</p>
<p class=3D"MsoNormal">}</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---------- End of test_os.ld ----------</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---------- Begin of Makefile ----------</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">TEST_OS_NAME =3D test_o</p>
<p class=3D"MsoNormal">TEST_OS_NAME =3D test_os</p>
<p class=3D"MsoNormal">TEST_OS_ASM =3D $(TEST_OS_NAME).s</p>
<p class=3D"MsoNormal">TEST_OS_IMG =3D $(TEST_OS_NAME).img</p>
<p class=3D"MsoNormal">TEST_OS_LNK =3D $(TEST_OS_NAME).ld</p>
<p class=3D"MsoNormal">TEST_OS_MAP =3D $(TEST_OS_NAME).map</p>
<p class=3D"MsoNormal">TEST_OS_OBJ =3D $(TEST_OS_NAME).o</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">all: $(TEST_OS_IMG)</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">test: $(TEST_OS_IMG)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; (qemu-system-i386 -boot order=3Da \</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; -drive file=3D$&lt;,format=3Draw,if=3Dfloppy \</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; -S -gdb tcp::2159 -vnc localhost:0 &amp;) &amp;&amp; \</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; gdb</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">$(TEST_OS_IMG): $(TEST_OS_OBJ) $(TEST_OS_LNK)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ld $&lt; -Map $(TEST_OS_MAP) -o $@ -T $(word 2, $^)</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">$(TEST_OS_OBJ): $(TEST_OS_ASM)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; gcc $^ -c -nostdlib -o $@ -Wall -Wextra</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---------- End of Makefile ----------</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Put these files on a same directory. &quot;test_os.s=
&quot; is source code of tiny OS</p>
<p class=3D"MsoNormal">to run on QEMU. The OS consists only a boot sector. =
It initialize x87 FPU</p>
<p class=3D"MsoNormal">and pushes some floating point values onto x87 FPU s=
tack. &quot;test_os.ld&quot; is</p>
<p class=3D"MsoNormal">its linker script. And you can make &quot;test_os.im=
g&quot;, a raw image of the OS.</p>
<p class=3D"MsoNormal">Now, there are all things to reproduce the bug. You =
can &quot;make test&quot; to let</p>
<p class=3D"MsoNormal">QEMU run the OS and wait for GDB, then GDB will star=
t. Then you can execute</p>
<p class=3D"MsoNormal">some GDB commands to reproduce the bug. Below is &qu=
ot;result 1&quot; reproducing the</p>
<p class=3D"MsoNormal">bug.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---------- Begin of result 1 ----------</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">GNU gdb (GDB) 13.0.50.20221204-git</p>
<p class=3D"MsoNormal">Copyright (C) 2022 Free Software Foundation, Inc.</p=
>
<p class=3D"MsoNormal">License GPLv3+: GNU GPL version 3 or later &lt;http:=
//gnu.org/licenses/gpl.html&gt;</p>
<p class=3D"MsoNormal">This is free software: you are free to change and re=
distribute it.</p>
<p class=3D"MsoNormal">There is NO WARRANTY, to the extent permitted by law=
.</p>
<p class=3D"MsoNormal">Type &quot;show copying&quot; and &quot;show warrant=
y&quot; for details.</p>
<p class=3D"MsoNormal">This GDB was configured as &quot;x86_64-pc-linux-gnu=
&quot;.</p>
<p class=3D"MsoNormal">Type &quot;show configuration&quot; for configuratio=
n details.</p>
<p class=3D"MsoNormal">For bug reporting instructions, please see:</p>
<p class=3D"MsoNormal">&lt;https://www.gnu.org/software/gdb/bugs/&gt;.</p>
<p class=3D"MsoNormal">Find the GDB manual and other documentation resource=
s online at:</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; &lt;http://www.gnu.org/software/g=
db/documentation/&gt;.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For help, type &quot;help&quot;.</p>
<p class=3D"MsoNormal">Type &quot;apropos word&quot; to search for commands=
 related to &quot;word&quot;.</p>
<p class=3D"MsoNormal">(gdb) target remote localhost:2159</p>
<p class=3D"MsoNormal">Remote debugging using localhost:2159</p>
<p class=3D"MsoNormal">warning: No executable has been specified and target=
 does not support</p>
<p class=3D"MsoNormal">determining executable automatically.&nbsp; Try usin=
g the &quot;file&quot; command.</p>
<p class=3D"MsoNormal">0x0000fff0 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) break *0x7c00</p>
<p class=3D"MsoNormal">Breakpoint 1 at 0x7c00</p>
<p class=3D"MsoNormal">(gdb) continue</p>
<p class=3D"MsoNormal">Continuing.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Breakpoint 1, 0x00007c00 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) x/10i $eip</p>
<p class=3D"MsoNormal">=3D&gt; 0x7c00:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fninit=
</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c02:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ld1</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c04:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ldl2t</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c06:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ldl2e</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c08:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ldpi</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c0a:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ldlg2</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c0c:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ldln2</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c0e:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ldz</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; h=
lt</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c11:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j=
mp&nbsp;&nbsp;&nbsp; 0x7c10</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c02 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">=3D&gt;R0: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 0</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c04 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">=3D&gt;R7: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x3800</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 7</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c06 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">=3D&gt;R6: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x4000d49a784bcd1b8afe =
+3.321928094887362348</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x3000</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 6</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c08 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">=3D&gt;R5: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x4000d49a784bcd1b8afe =
+3.321928094887362348</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x3fffb8aa3b295c17f0bc =
+1.442695040888963407</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x2800</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 5</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c0a in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">=3D&gt;R4: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x4000d49a784bcd1b8afe =
+3.321928094887362348</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x3fffb8aa3b295c17f0bc =
+1.442695040888963407</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x4000c90fdaa22168c235 =
+3.141592653589793239</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x2000</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 4</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c0c in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x4000c90fdaa22168c235 =
+3.141592653589793239</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x3ffd9a209a84fbcff799 =
+0.3010299956639811952</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">=3D&gt;R3: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x4000d49a784bcd1b8afe =
+3.321928094887362348</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x3fffb8aa3b295c17f0bc =
+1.442695040888963407</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x1800</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 3</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c0e in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x3fffb8aa3b295c17f0bc =
+1.442695040888963407</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x4000c90fdaa22168c235 =
+3.141592653589793239</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x3ffd9a209a84fbcff799 =
+0.3010299956639811952</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x3ffeb17217f7d1cf79ac =
+0.6931471805599453094</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">=3D&gt;R2: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x4000d49a784bcd1b8afe =
+3.321928094887362348</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x1000</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 2</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c10 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x4000d49a784bcd1b8afe =
+3.321928094887362348</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x3fffb8aa3b295c17f0bc =
+1.442695040888963407</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x4000c90fdaa22168c235 =
+3.141592653589793239</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x3ffd9a209a84fbcff799 =
+0.3010299956639811952</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x3ffeb17217f7d1cf79ac =
+0.6931471805599453094</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">=3D&gt;R1: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x0800</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 1</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---------- End of result 1 ----------</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As you can see, the FPU stack rotates every pushing.=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">2. Cause</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">There is a cause of the bug in a function &quot;x86_=
cpu_gdb_read_register&quot; in</p>
<p class=3D"MsoNormal">&quot;qemu/target/i386/gdbstub.c&quot;. GDB receives=
 a command &quot;info float&quot; from stdin</p>
<p class=3D"MsoNormal">and get values of the all registers containing FPU s=
tack registers from QEMU</p>
<p class=3D"MsoNormal">to print them. Then, QEMU picks registers in the fun=
ction to form 'g' packet</p>
<p class=3D"MsoNormal">to send to GDB. In line 124 of the c source file, ab=
solute indexed FPU stack</p>
<p class=3D"MsoNormal">registers, namely, R0, ... and R7 , are picked and i=
nserted in 'g' packet.</p>
<p class=3D"MsoNormal">However, GDB, the packet receiver, extracts FPU stac=
k registers from the</p>
<p class=3D"MsoNormal">packet and interpret these registers are stack top r=
elative indexed, namely,</p>
<p class=3D"MsoNormal">ST0, ... and ST7. As a result, GDB can't print FPU s=
tack correctly.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">3. Modification</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In added lines of this patch, &quot;n&quot; is a reg=
ister number of a register to</p>
<p class=3D"MsoNormal">read. And &quot;IDX_FP_REGS&quot; is register number=
 of the first FPU stack register</p>
<p class=3D"MsoNormal">&quot;R0&quot;. So, &quot;r_index&quot; is absolute =
index of FPU stack register to read. And</p>
<p class=3D"MsoNormal">&quot;env-&gt;fpstt&quot; is a pointer to top of FPU=
 stack. So, &quot;st_index&quot; is stack top</p>
<p class=3D"MsoNormal">relative index of FPU stack register to read. By app=
lying this modification,</p>
<p class=3D"MsoNormal">QEMU inserts FPU stack registers ordered by stack to=
p relative index in 'g'</p>
<p class=3D"MsoNormal">packet.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">4. After this patch</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Below is &quot;result 2&quot; operating as same as &=
quot;result 1&quot; after applying this</p>
<p class=3D"MsoNormal">patch.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---------- Begin of result 2 ----------</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">GNU gdb (GDB) 13.0.50.20221204-git</p>
<p class=3D"MsoNormal">Copyright (C) 2022 Free Software Foundation, Inc.</p=
>
<p class=3D"MsoNormal">License GPLv3+: GNU GPL version 3 or later &lt;http:=
//gnu.org/licenses/gpl.html&gt;</p>
<p class=3D"MsoNormal">This is free software: you are free to change and re=
distribute it.</p>
<p class=3D"MsoNormal">There is NO WARRANTY, to the extent permitted by law=
.</p>
<p class=3D"MsoNormal">Type &quot;show copying&quot; and &quot;show warrant=
y&quot; for details.</p>
<p class=3D"MsoNormal">This GDB was configured as &quot;x86_64-pc-linux-gnu=
&quot;.</p>
<p class=3D"MsoNormal">Type &quot;show configuration&quot; for configuratio=
n details.</p>
<p class=3D"MsoNormal">For bug reporting instructions, please see:</p>
<p class=3D"MsoNormal">&lt;https://www.gnu.org/software/gdb/bugs/&gt;.</p>
<p class=3D"MsoNormal">Find the GDB manual and other documentation resource=
s online at:</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; &lt;http://www.gnu.org/software/g=
db/documentation/&gt;.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For help, type &quot;help&quot;.</p>
<p class=3D"MsoNormal">Type &quot;apropos word&quot; to search for commands=
 related to &quot;word&quot;.</p>
<p class=3D"MsoNormal">(gdb) target remote localhost:2159</p>
<p class=3D"MsoNormal">Remote debugging using localhost:2159</p>
<p class=3D"MsoNormal">warning: No executable has been specified and target=
 does not support</p>
<p class=3D"MsoNormal">determining executable automatically.&nbsp; Try usin=
g the &quot;file&quot; command.</p>
<p class=3D"MsoNormal">0x0000fff0 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) break *0x7c00</p>
<p class=3D"MsoNormal">Breakpoint 1 at 0x7c00</p>
<p class=3D"MsoNormal">(gdb) continue</p>
<p class=3D"MsoNormal">Continuing.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Breakpoint 1, 0x00007c00 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) x/10i $eip</p>
<p class=3D"MsoNormal">=3D&gt; 0x7c00:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fninit=
</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c02:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ld1</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c04:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ldl2t</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c06:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ldl2e</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c08:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ldpi</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c0a:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ldlg2</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c0c:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ldln2</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c0e:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ldz</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; h=
lt</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 0x7c11:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j=
mp&nbsp;&nbsp;&nbsp; 0x7c10</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c02 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">=3D&gt;R0: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 0</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c04 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">=3D&gt;R7: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x3800</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 7</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c06 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal">=3D&gt;R6: Valid&nbsp;&nbsp; 0x4000d49a784bcd1b8afe =
+3.321928094887362348</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x3000</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 6</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c08 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x4000d49a784bcd1b8afe =
+3.321928094887362348</p>
<p class=3D"MsoNormal">=3D&gt;R5: Valid&nbsp;&nbsp; 0x3fffb8aa3b295c17f0bc =
+1.442695040888963407</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x2800</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 5</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c0a in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x4000d49a784bcd1b8afe =
+3.321928094887362348</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x3fffb8aa3b295c17f0bc =
+1.442695040888963407</p>
<p class=3D"MsoNormal">=3D&gt;R4: Valid&nbsp;&nbsp; 0x4000c90fdaa22168c235 =
+3.141592653589793239</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x2000</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 4</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c0c in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x4000d49a784bcd1b8afe =
+3.321928094887362348</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x3fffb8aa3b295c17f0bc =
+1.442695040888963407</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x4000c90fdaa22168c235 =
+3.141592653589793239</p>
<p class=3D"MsoNormal">=3D&gt;R3: Valid&nbsp;&nbsp; 0x3ffd9a209a84fbcff799 =
+0.3010299956639811952</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x1800</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 3</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c0e in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x4000d49a784bcd1b8afe =
+3.321928094887362348</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x3fffb8aa3b295c17f0bc =
+1.442695040888963407</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x4000c90fdaa22168c235 =
+3.141592653589793239</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x3ffd9a209a84fbcff799 =
+0.3010299956639811952</p>
<p class=3D"MsoNormal">=3D&gt;R2: Valid&nbsp;&nbsp; 0x3ffeb17217f7d1cf79ac =
+0.6931471805599453094</p>
<p class=3D"MsoNormal">&nbsp; R1: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x1000</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 2</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">(gdb) stepi</p>
<p class=3D"MsoNormal">0x00007c10 in ?? ()</p>
<p class=3D"MsoNormal">(gdb) info float</p>
<p class=3D"MsoNormal">&nbsp; R7: Valid&nbsp;&nbsp; 0x3fff8000000000000000 =
+1</p>
<p class=3D"MsoNormal">&nbsp; R6: Valid&nbsp;&nbsp; 0x4000d49a784bcd1b8afe =
+3.321928094887362348</p>
<p class=3D"MsoNormal">&nbsp; R5: Valid&nbsp;&nbsp; 0x3fffb8aa3b295c17f0bc =
+1.442695040888963407</p>
<p class=3D"MsoNormal">&nbsp; R4: Valid&nbsp;&nbsp; 0x4000c90fdaa22168c235 =
+3.141592653589793239</p>
<p class=3D"MsoNormal">&nbsp; R3: Valid&nbsp;&nbsp; 0x3ffd9a209a84fbcff799 =
+0.3010299956639811952</p>
<p class=3D"MsoNormal">&nbsp; R2: Valid&nbsp;&nbsp; 0x3ffeb17217f7d1cf79ac =
+0.6931471805599453094</p>
<p class=3D"MsoNormal">=3D&gt;R1: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal">&nbsp; R0: Valid&nbsp;&nbsp; 0x00000000000000000000 =
+0</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Status Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0x0800</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; TOP: 1</p>
<p class=3D"MsoNormal">Control Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0x037f&nbsp;&nbsp; IM DM ZM OM UM PM</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; PC: Extended Precision (64-bits)</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; RC: Round to nearest</p>
<p class=3D"MsoNormal">Tag Word:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal">Instruction Pointer: 0x00:0x00000000</p>
<p class=3D"MsoNormal">Operand Pointer:&nbsp;&nbsp;&nbsp;&nbsp; 0x00:0x0000=
0000</p>
<p class=3D"MsoNormal">Opcode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---------- End of result 2 ----------</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_TY0PR0101MB428539D1FC8F61D7D780ACFEA4E19TY0PR0101MB4285_--

