Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DAE37A490
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:26:44 +0200 (CEST)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPb9-0001Pa-KK
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPUz-0008KS-O7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:21 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPUm-0006TG-Og
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728407; x=1652264407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=56GiwN9+awcuDpMMLrs4D/ZAU3zNjuFpfy2VRPWzFek=;
 b=lm9Flt9V5IcB25d29BpOLoD9YaHTaVMegrfx/GW3OFexNqTV4WOBR4J6
 /DruYffaZz8Rg7V1P0lUVSvtQq0CQiV0XeWaqEVXhy21bHG/5fcK0oNqX
 BzDvWH+i1ib83kmXveRV1wDliOlqgUOegAiD8xWs3FGON34RyWFQ8Pl6Z
 KfE2dQhha4Lg6xMWrC1BtWN7tQo3ayA3T4aLxgEL9S+1+0iXUD1rYaSNB
 QKOY86ii3VbHkaORmjcRa5RiUZVsbyNyxNs8EXBqDP9RtpXxG2WgxxvXK
 4dw0yi/+b2Z3XO9PT3FAxcpCE2sfTPpc+Xrf2gbqXGN3pNCVfEUivTX26 g==;
IronPort-SDR: SOH2oi2/JXV0iHZxExzbINM6mpdkkEr6O+QbMEkegx8Id3MT1AssBWTLT7R18/o+ZZaYJypQTQ
 mxiQtzOJPWP/8hdBNW/znKnNNpe6L4WPLpZTjokMkOyM0/Bg1l1wbgw5I8MJ/3otTh9VlsDaph
 hJ6Y/YO2GTUskh9ttXSOT4/ahmgwZ8ME5/yLvEGCOnEpu+2BK8YeHsKOxlY/WCbvlVLGQmyrCm
 h7WvOUyaJmfZ+9isZcsaI2rTVK8zsBna9N8onIb1k8QknocZ8qsy5ME/ATq98AcwtuqGG671Li
 Y6U=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735321"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:02 +0800
IronPort-SDR: PxRl7oU8H0oE2xFgUTeXRRZveSc8qPn++4DAHLg3hWePlh2k5eCPcGjjxH5pSN8uby6rypt34Q
 M6kqqu27PRzMiUMjKhK+dmznI3Rv53kE6AiALgI+Sx+k51F6rOXRXfwWNrn3zGXG7ywOCh9IZw
 6bR5m3R0ENvwl1jhCC7Ai/zMfPGY3PeILV09/ZQOzAKymS7MtL/p5Hm1SqkAW7DmTKw+MZk5D0
 RKYXc3dhQUe9aToGtlWDrbPRd2PCV7yVyHmvpAp25fuD0Egxhjn6v3WZpww3J1iVCNDhKfmr7j
 5/qagFXc3BWKzNO5uW4Jreuh
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:01 -0700
IronPort-SDR: EQp/yL7q7vpP+q60MRQUbS8THVND+P4Uc1Bm4XmxpMO2qnCtr8F5y38oFDC6J6gK05G1Ez7bDY
 FeV0nrG0XRy1WxN4HicJCY3QoF1DNlwq57YfjHInXeuip/1vOJea1IbjC3DSpLkey88GQY8Tbm
 cTIFiWz9RzQRkaT0cnN89D3/7fAFxZ7DpcQw4uo0GOvw3p3sLJI6AhFpkC2mZ1vsHMkXSxATuq
 UMgGkVLxw6Mq63t80oke0v1mBRPXjaj+a7ik0brCLyCGzRmJ6zsYkY1zywNe6jDLa4shTLyYGx
 sGo=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:01 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 00/42] riscv-to-apply queue
Date: Tue, 11 May 2021 20:19:09 +1000
Message-Id: <20210511101951.165287-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e4f3ede95ce813d5705c65e1c0e1c80c70739ebb:

  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210505-pull-request' into staging (2021-05-10 19:55:06 +0100)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210511

for you to fetch changes up to c30a0757f094c107e491820e3d35224eb68859c7:

  target/riscv: Fix the RV64H decode comment (2021-05-11 20:02:07 +1000)

----------------------------------------------------------------
A large collection of RISC-V fixes, improvements and features

 - Clenaup some left over v1.9 code
 - Documentation improvements
 - Support for the shakti_c machine
 - Internal cleanup of the CSR accesses
 - Updates to the OpenTitan platform
 - Support for the virtio-vga
 - Fix for the saturate subtract in vector extensions
 - Experimental support for the ePMP spec
 - A range of other internal code cleanups and bug fixes

----------------------------------------------------------------
Alexander Wagner (1):
      hw/riscv: Fix OT IBEX reset vector

Alistair Francis (22):
      target/riscv: Convert the RISC-V exceptions to an enum
      target/riscv: Use the RISCVException enum for CSR predicates
      target/riscv: Fix 32-bit HS mode access permissions
      target/riscv: Use the RISCVException enum for CSR operations
      target/riscv: Use RISCVException enum for CSR access
      MAINTAINERS: Update the RISC-V CPU Maintainers
      hw/opentitan: Update the interrupt layout
      hw/riscv: Enable VIRTIO_VGA for RISC-V virt machine
      target/riscv: Fix the PMP is locked check when using TOR
      target/riscv: Add the ePMP feature
      target/riscv/pmp: Remove outdated comment
      target/riscv: Add ePMP support for the Ibex CPU
      target/riscv: Remove the hardcoded RVXLEN macro
      target/riscv: Remove the hardcoded SSTATUS_SD macro
      target/riscv: Remove the hardcoded HGATP_MODE macro
      target/riscv: Remove the hardcoded MSTATUS_SD macro
      target/riscv: Remove the hardcoded SATP_MODE macro
      target/riscv: Remove the unused HSTATUS_WPRI macro
      target/riscv: Remove an unused CASE_OP_32_64 macro
      target/riscv: Consolidate RV32/64 32-bit instructions
      target/riscv: Consolidate RV32/64 16-bit instructions
      target/riscv: Fix the RV64H decode comment

Atish Patra (1):
      target/riscv: Remove privilege v1.9 specific CSR related code

Axel Heider (1):
      docs/system/generic-loader.rst: Fix style

Bin Meng (1):
      hw/riscv: sifive_e: Add 'const' to sifive_e_memmap[]

Dylan Jhong (1):
      target/riscv: Align the data type of reset vector address

Emmanuel Blot (2):
      target/riscv: fix exception index on instruction access fault
      target/riscv: fix a typo with interrupt names

Frank Chang (2):
      target/riscv: fix vrgather macro index variable type bug
      fpu/softfloat: set invalid excp flag for RISC-V muladd instructions

Hou Weiying (4):
      target/riscv: Define ePMP mseccfg
      target/riscv: Add ePMP CSR access functions
      target/riscv: Implementation of enhanced PMP (ePMP)
      target/riscv: Add a config option for ePMP

Jade Fink (1):
      riscv: don't look at SUM when accessing memory from a debugger context

LIU Zhiwei (1):
      target/riscv: Fixup saturate subtract function

Vijai Kumar K (5):
      target/riscv: Add Shakti C class CPU
      riscv: Add initial support for Shakti C machine
      hw/char: Add Shakti UART emulation
      hw/riscv: Connect Shakti UART to Shakti platform
      docs: Add documentation for shakti_c machine

 docs/system/generic-loader.rst              |   9 +-
 docs/system/riscv/shakti-c.rst              |  82 +++
 docs/system/target-riscv.rst                |   1 +
 default-configs/devices/riscv64-softmmu.mak |   1 +
 include/hw/char/shakti_uart.h               |  74 +++
 include/hw/riscv/opentitan.h                |  16 +-
 include/hw/riscv/shakti_c.h                 |  75 +++
 target/riscv/cpu.h                          |  42 +-
 target/riscv/cpu_bits.h                     | 114 +---
 target/riscv/helper.h                       |  18 +-
 target/riscv/pmp.h                          |  14 +
 target/riscv/insn16-32.decode               |  28 -
 target/riscv/insn16-64.decode               |  36 --
 target/riscv/insn16.decode                  |  30 +
 target/riscv/insn32-64.decode               |  88 ---
 target/riscv/insn32.decode                  |  67 ++-
 hw/char/shakti_uart.c                       | 185 +++++++
 hw/intc/ibex_plic.c                         |  20 +-
 hw/riscv/opentitan.c                        |  10 +-
 hw/riscv/shakti_c.c                         | 181 ++++++
 hw/riscv/sifive_e.c                         |   2 +-
 target/riscv/cpu.c                          |  26 +-
 target/riscv/cpu_helper.c                   |  88 ++-
 target/riscv/csr.c                          | 824 +++++++++++++++++-----------
 target/riscv/fpu_helper.c                   |  16 +-
 target/riscv/gdbstub.c                      |   8 +-
 target/riscv/machine.c                      |   8 +-
 target/riscv/monitor.c                      |  22 +-
 target/riscv/op_helper.c                    |  18 +-
 target/riscv/pmp.c                          | 218 +++++++-
 target/riscv/translate.c                    |  38 +-
 target/riscv/vector_helper.c                |  18 +-
 fpu/softfloat-specialize.c.inc              |   6 +
 target/riscv/insn_trans/trans_rva.c.inc     |  14 +-
 target/riscv/insn_trans/trans_rvd.c.inc     |  17 +-
 target/riscv/insn_trans/trans_rvf.c.inc     |   6 +-
 target/riscv/insn_trans/trans_rvh.c.inc     |   8 +-
 target/riscv/insn_trans/trans_rvi.c.inc     |  22 +-
 target/riscv/insn_trans/trans_rvm.c.inc     |  12 +-
 target/riscv/insn_trans/trans_rvv.c.inc     |  39 +-
 MAINTAINERS                                 |  14 +-
 hw/char/meson.build                         |   1 +
 hw/char/trace-events                        |   4 +
 hw/riscv/Kconfig                            |  11 +
 hw/riscv/meson.build                        |   1 +
 target/riscv/meson.build                    |  13 +-
 target/riscv/trace-events                   |   3 +
 47 files changed, 1759 insertions(+), 789 deletions(-)
 create mode 100644 docs/system/riscv/shakti-c.rst
 create mode 100644 include/hw/char/shakti_uart.h
 create mode 100644 include/hw/riscv/shakti_c.h
 delete mode 100644 target/riscv/insn16-32.decode
 delete mode 100644 target/riscv/insn16-64.decode
 delete mode 100644 target/riscv/insn32-64.decode
 create mode 100644 hw/char/shakti_uart.c
 create mode 100644 hw/riscv/shakti_c.c

