Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61852F6401
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:18:37 +0100 (CET)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04OS-0005LI-LG
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04Ff-0005BL-PO; Thu, 14 Jan 2021 10:09:31 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04Fd-0003hn-P3; Thu, 14 Jan 2021 10:09:31 -0500
Received: by mail-pf1-x42b.google.com with SMTP id m6so3509067pfm.6;
 Thu, 14 Jan 2021 07:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8UE5JTc8nfgwwuFsAclEJ0iZ4yiLi2DQhy02YDC7+JI=;
 b=lmwYYY+o1CM5YsrXLXPQfCaAxg6bb5sTFgkzkh26kAOCUtmBwz8au2aofHf95WkrAb
 apDSLDqS9cvkzNrCiuH8e9/ozMJjZALnNxw6yvEUmJHyfu4D/2jP2aLexEaE+xXjYab5
 kYJYLV1BTm2dUJ/kt5Vx3MS3spP42mRepKiZFJiH4EKbiWlUeWzPVtf9cD5Xh8ZCipbo
 X4GPbvZy1hllOu+++V34+l6pLOBDfcb1PKvUA7dOLirKGIFpqRnHVxCJPks146vJj7Sf
 /RCTPuBQwn+Tt/RCKcbb+n2HvbUbdb1IoLJhph05cyk2y+8i4cq2Q2oCFjiV9EfM0XLA
 NvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8UE5JTc8nfgwwuFsAclEJ0iZ4yiLi2DQhy02YDC7+JI=;
 b=LQ2IL0QvqtozWj+Bq/Pxv10VSX5irfgru+UBPxwFVDcppvNqsLsC5QuWcsdY9IIJta
 HqPgmaQrayJjc5yCwkjr6OMYIKqrPeILY/KlwfDl7ZxC3LWb6u6Ex0w3QDDBVMbyDo2X
 MeJHdJt7R6f7cPluDlD3JMyNqxxBJszaTpQO9Q1efVZzIKhKkScBWJBpTHgh6yxdw9No
 NaHpzgXnUI1IbyC33Sb44CpuIFX5ZqQ+RG6LpBpaSuOEoxkImszjW4EpZzxy7YxUJnZh
 26tH2aFXNehcyjioz8jWJK56Hw223xTQXa5Gdx5ru4RjoYdAVGYJg6shVawjfl9pP6jH
 C9nA==
X-Gm-Message-State: AOAM532kGCXsN6ToYVaP5tvUBqSUfEo+p6vQ8ZzilkvTvdPI7IXKsWsW
 1ygx3beGpX0IfRGVrN6AwnQ=
X-Google-Smtp-Source: ABdhPJx0WdNq5jBwQrpKXSVEDywthQldYWOmI7l2gNSTPY4anSlDzMuDknpb3dE/0VI1pDlmZVSI7g==
X-Received: by 2002:a63:3184:: with SMTP id x126mr7965002pgx.354.1610636967018; 
 Thu, 14 Jan 2021 07:09:27 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id w21sm5372051pfq.67.2021.01.14.07.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 07:09:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed for
 fast read commands
Date: Thu, 14 Jan 2021 23:08:53 +0800
Message-Id: <20210114150902.11515-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Marcin Krzeminski <marcin.krzeminski@nokia.com>,
 Andrew Jeffery <andrew@aj.id.au>, Bin Meng <bin.meng@windriver.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Max Reitz <mreitz@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joe Komlodi <komlodi@xilinx.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The m25p80 model uses s->needed_bytes to indicate how many follow-up
bytes are expected to be received after it receives a command. For
example, depending on the address mode, either 3-byte address or
4-byte address is needed.

For fast read family commands, some dummy cycles are required after
sending the address bytes, and the dummy cycles need to be counted
in s->needed_bytes. This is where the mess began.

As the variable name (needed_bytes) indicates, the unit is in byte.
It is not in bit, or cycle. However for some reason the model has
been using the number of dummy cycles for s->needed_bytes. The right
approach is to convert the number of dummy cycles to bytes based on
the SPI protocol, for example, 6 dummy cycles for the Fast Read Quad
I/O (EBh) should be converted to 3 bytes per the formula (6 * 4 / 8).

Things get complicated when interacting with different SPI or QSPI
flash controllers. There are major two cases:

- Dummy bytes prepared by drivers, and wrote to the controller fifo.
  For such case, driver will calculate the correct number of dummy
  bytes and write them into the tx fifo. Fixing the m25p80 model will
  fix flashes working with such controllers.
- Dummy bytes not prepared by drivers. Drivers just tell the hardware
  the dummy cycle configuration via some registers, and hardware will
  automatically generate dummy cycles for us. Fixing the m25p80 model
  is not enough, and we will need to fix the SPI/QSPI models for such
  controllers.

This series fixes the mess in the m25p80 from the flash side first,
followed by fixes to 3 known SPI controller models that fall into
the 2nd case above.

Please note, I have no way to verify patch 7/8/9 because:

* There is no public datasheet available for the SoC / SPI controller
* There is no QEMU docs, or details that tell people how to boot either
  U-Boot or Linux kernel to verify the functionality

These 3 patches are very likely to be wrong. Hence I would like to ask
help from the original author who wrote these SPI controller models
to help testing, or completely rewrite these 3 patches to fix things.
Thanks!

Patch 6 is unvalidated with QEMU, mainly because there is no doc to
tell people how to boot anything to test. But I have some confidence
based on my read of the ZynqMP manual, as well as some experimental
testing on a real ZCU102 board.

Other flash patches can be tested with the SiFive SPI series:
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=222391

Cherry-pick patch 16 and 17 from the series above, and switch to
different flash model to test with the following command:

$ qemu-system-riscv64 -nographic -M sifive_u -m 2G -smp 5 -kernel u-boot

I've picked up two for testing:

QEMU flash: "sst25vf032b"

  U-Boot 2020.10 (Jan 14 2021 - 21:55:59 +0800)

  CPU:   rv64imafdcsu
  Model: SiFive HiFive Unleashed A00
  DRAM:  2 GiB
  MMC:
  Loading Environment from SPIFlash... SF: Detected sst25vf032b with page size 256 Bytes, erase size 4 KiB, total 4 MiB
  *** Warning - bad CRC, using default environment

  In:    serial@10010000
  Out:   serial@10010000
  Err:   serial@10010000
  Net:   failed to get gemgxl_reset reset

  Warning: ethernet@10090000 MAC addresses don't match:
  Address in DT is                52:54:00:12:34:56
  Address in environment is       70:b3:d5:92:f0:01
  eth0: ethernet@10090000
  Hit any key to stop autoboot:  0
  => sf probe
  SF: Detected sst25vf032b with page size 256 Bytes, erase size 4 KiB,
  total 4 MiB
  => sf test 1ff000 1000
  SPI flash test:
  0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
  1 check: 10 ticks, 400 KiB/s 3.200 Mbps
  2 write: 170 ticks, 23 KiB/s 0.184 Mbps
  3 read: 9 ticks, 444 KiB/s 3.552 Mbps
  Test passed
  0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
  1 check: 10 ticks, 400 KiB/s 3.200 Mbps
  2 write: 170 ticks, 23 KiB/s 0.184 Mbps
  3 read: 9 ticks, 444 KiB/s 3.552 Mbps

QEMU flash: "mx66u51235f"

  U-Boot 2020.10 (Jan 14 2021 - 21:55:59 +0800)

  CPU:   rv64imafdcsu
  Model: SiFive HiFive Unleashed A00
  DRAM:  2 GiB
  MMC:
  Loading Environment from SPIFlash... SF: Detected mx66u51235f with page size 256 Bytes, erase size 4 KiB, total 64 MiB
  *** Warning - bad CRC, using default environment

  In:    serial@10010000
  Out:   serial@10010000
  Err:   serial@10010000
  Net:   failed to get gemgxl_reset reset

  Warning: ethernet@10090000 MAC addresses don't match:
  Address in DT is                52:54:00:12:34:56
  Address in environment is       70:b3:d5:92:f0:01
  eth0: ethernet@10090000
  Hit any key to stop autoboot:  0
  => sf probe
  SF: Detected mx66u51235f with page size 256 Bytes, erase size 4 KiB, total 64 MiB
  => sf test 0 8000
  SPI flash test:
  0 erase: 1 ticks, 32000 KiB/s 256.000 Mbps
  1 check: 80 ticks, 400 KiB/s 3.200 Mbps
  2 write: 83 ticks, 385 KiB/s 3.080 Mbps
  3 read: 79 ticks, 405 KiB/s 3.240 Mbps
  Test passed
  0 erase: 1 ticks, 32000 KiB/s 256.000 Mbps
  1 check: 80 ticks, 400 KiB/s 3.200 Mbps
  2 write: 83 ticks, 385 KiB/s 3.080 Mbps
  3 read: 79 ticks, 405 KiB/s 3.240 Mbps

I am sure there will be bugs, and I have not tested all flashes affected.
But I want to send out this series for an early discussion and comments.
I will continue my testing.


Bin Meng (9):
  hw/block: m25p80: Fix the number of dummy bytes needed for Windbond
    flashes
  hw/block: m25p80: Fix the number of dummy bytes needed for
    Numonyx/Micron flashes
  hw/block: m25p80: Fix the number of dummy bytes needed for Macronix
    flashes
  hw/block: m25p80: Fix the number of dummy bytes needed for Spansion
    flashes
  hw/block: m25p80: Support fast read for SST flashes
  hw/ssi: xilinx_spips: Fix generic fifo dummy cycle handling
  Revert "aspeed/smc: Fix number of dummy cycles for FAST_READ_4
    command"
  Revert "aspeed/smc: snoop SPI transfers to fake dummy cycles"
  hw/ssi: npcm7xx_fiu: Correct the dummy cycle emulation logic

 include/hw/ssi/aspeed_smc.h |   3 -
 hw/block/m25p80.c           | 153 ++++++++++++++++++++++++++++--------
 hw/ssi/aspeed_smc.c         | 116 +--------------------------
 hw/ssi/npcm7xx_fiu.c        |   8 +-
 hw/ssi/xilinx_spips.c       |  29 ++++++-
 5 files changed, 153 insertions(+), 156 deletions(-)

-- 
2.25.1


