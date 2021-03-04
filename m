Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A396932D5AA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:50:39 +0100 (CET)
Received: from localhost ([::1]:33924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpJE-0002uu-Lw
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpGa-0001H0-OH
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:47:52 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:20074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpGY-0007j3-F9
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614870430; x=1646406430;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9TPm2bDqOoLUHKq6HnVa9kIBI8jVACwPi7mLZvJ6wak=;
 b=H1rLcefg7im6yxCtR2Fzw2o8R9UEZelBJEdlVbKIH801DQTbwNXbxDD+
 Inu6VoUT25dXLJ9fZpzQv16mYJx3oP7Tx7DdR+PJ2Bhcu8FZTD0bqQyUn
 3R4UfihIMGb1OY02qyovtHm4KxX/iUk0mJfFCJ48k+mUjESbMXDd9Cm4y
 PuDh6Ej6+wVUKRz8z4eOY3d5nDjQfLgWSBbhDAh4Ujti9PGmANWn5VOVH
 Ows5FVx0xT4BmIqHa/pXnZXy79p6Vo4s0bIeJQjWs2qiIWRHUC5Bskd9R
 LKu892SnKssmjCdFlqThz9mXt25LEzLqp9YQ6wbap8d4vVGRn2Cf7MHaO g==;
IronPort-SDR: pS90B815sWaSMOqtqNKU5Okxe0CmWMoRe32hZ7IfEnCUHMnNhcBEiHABYPi0YHP1oZRDI9+zUB
 nBBoz3Oqo52+1biUToZBbmAIA3706nWtCb84cHFHn7ccGjl/S4KzsTzDtUon1Bqy0yAAX7CVa8
 tdxn4JOInkrJ4UrL0/PJTa8ExsODGl2XOQSEt5U2zVYrcs5WY8RFxYa6fqtAoccEnwLjjkzzad
 Lw/Quqi+U8sMLDP8v34cA5YwxWBrrdIr8DTHzoewyOLALcdvKb0legKPXSYmTKJgU+qn2qRTBj
 y9U=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="265660835"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 23:07:05 +0800
IronPort-SDR: 4gSJiYgWWt+w6avh8WRaHNjSAHIIhrKLCxebnmPZ7v3tRylUCGXSpwl0/WMu2RZranOtIiE0Zq
 zp38UPjCAt60YK7dpiGfgZR3/jhr3CBq0hqCQgGr3JzBhqE0OmX7bhh1Hf1uPRvyc6LiTOvS3J
 EJD//dVKQ6UXzJQxBIVb0v0yG6BwL7fngj0sNmK7eljPv2eUGo6tGpZV9RuQtxW50E2T/1pzZC
 ZLepz42XFhi+TM+foz3hxNDuecKWvodKP4re+E5aWEKyWrvhkLTSfyrZ+t+C4+P8WgM5k0uFfy
 CkOMSZMDE47EpV+4/NSFOXT2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:30:46 -0800
IronPort-SDR: MnyFhpyLSpRZVQolKyVa9mPlv6WFyfYIi0HUh3p8z2Q9Ox7mMGuZzPucE3Un2/a74sZQCiU2bf
 no3PLJp/sRd75tFxZEzn6BT98rTu6Rw1vwXgzFkV+3Ttz1rFlZ0MfTJhAOxJ+MiLsAT+9IjEab
 JEjYL9vjVYxpDT1k2JowS9j2RUfub2MI34A5ZueShjj+DBiCbNmCKzxTWNNE6MFCFqwo1vF+dj
 ZkpGf3jOIdmBS4mkdni+lGHs3hFJVwazioCfKiHoyxx3WWKEvpk0AvwNvjXLQb3AWZWg9Rk5jZ
 CQU=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:47:46 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 00/19] riscv-to-apply queue
Date: Thu,  4 Mar 2021 09:46:32 -0500
Message-Id: <20210304144651.310037-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cb90ecf9349198558569f6c86c4c27d215406095:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210304' into staging (2021-03-04 10:42:46 +0000)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210304

for you to fetch changes up to 19800265d407f09f333cf80dba3e975eb7bc1872:

  hw/riscv: virt: Map high mmio for PCIe (2021-03-04 09:43:29 -0500)

----------------------------------------------------------------
RISC-V PR for 6.0

This PR is a collection of RISC-V patches:
 - Improvements to SiFive U OTP
 - Upgrade OpenSBI to v0.9
 - Support the QMP dump-guest-memory
 - Add support for the SiFive SPI controller (sifive_u)
 - Initial RISC-V system documentation
 - A fix for the Goldfish RTC
 - MAINTAINERS updates
 - Support for high PCIe memory in the virt machine

----------------------------------------------------------------
Alistair Francis (1):
      MAINTAINERS: Add a SiFive machine section

Bin Meng (16):
      target/riscv: Declare csr_ops[] with a known size
      hw/misc: sifive_u_otp: Use error_report() when block operation fails
      roms/opensbi: Upgrade from v0.8 to v0.9
      hw/block: m25p80: Add ISSI SPI flash support
      hw/block: m25p80: Add various ISSI flash information
      hw/ssi: Add SiFive SPI controller support
      hw/riscv: sifive_u: Add QSPI0 controller and connect a flash
      hw/riscv: sifive_u: Add QSPI2 controller and connect an SD card
      hw/riscv: sifive_u: Change SIFIVE_U_GEM_IRQ to decimal value
      docs/system: Sort targets in alphabetical order
      docs/system: Add RISC-V documentation
      docs/system: riscv: Add documentation for sifive_u machine
      hw/riscv: Drop 'struct MemmapEntry'
      hw/riscv: virt: Drop the 'link_up' parameter of gpex_pcie_init()
      hw/riscv: virt: Limit RAM size in a 32-bit system
      hw/riscv: virt: Map high mmio for PCIe

Laurent Vivier (1):
      goldfish_rtc: re-arm the alarm after migration

Yifei Jiang (1):
      target-riscv: support QMP dump-guest-memory

 docs/system/riscv/sifive_u.rst                 | 336 +++++++++++++++++++++++
 docs/system/target-riscv.rst                   |  72 +++++
 docs/system/targets.rst                        |  20 +-
 include/hw/riscv/sifive_u.h                    |   9 +-
 include/hw/ssi/sifive_spi.h                    |  47 ++++
 target/riscv/cpu.h                             |   6 +-
 target/riscv/cpu_bits.h                        |   1 +
 hw/block/m25p80.c                              |  57 +++-
 hw/misc/sifive_u_otp.c                         |  13 +-
 hw/riscv/microchip_pfsoc.c                     |   9 +-
 hw/riscv/opentitan.c                           |   9 +-
 hw/riscv/sifive_e.c                            |   9 +-
 hw/riscv/sifive_u.c                            | 102 ++++++-
 hw/riscv/spike.c                               |   9 +-
 hw/riscv/virt.c                                |  68 +++--
 hw/rtc/goldfish_rtc.c                          |   2 +
 hw/ssi/sifive_spi.c                            | 358 +++++++++++++++++++++++++
 target/riscv/arch_dump.c                       | 202 ++++++++++++++
 target/riscv/cpu.c                             |   2 +
 MAINTAINERS                                    |   9 +
 hw/riscv/Kconfig                               |   3 +
 hw/ssi/Kconfig                                 |   4 +
 hw/ssi/meson.build                             |   1 +
 pc-bios/opensbi-riscv32-generic-fw_dynamic.bin | Bin 62144 -> 78680 bytes
 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf | Bin 558668 -> 727464 bytes
 pc-bios/opensbi-riscv64-generic-fw_dynamic.bin | Bin 70792 -> 75096 bytes
 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf | Bin 620424 -> 781264 bytes
 roms/opensbi                                   |   2 +-
 target/riscv/meson.build                       |   1 +
 29 files changed, 1286 insertions(+), 65 deletions(-)
 create mode 100644 docs/system/riscv/sifive_u.rst
 create mode 100644 docs/system/target-riscv.rst
 create mode 100644 include/hw/ssi/sifive_spi.h
 create mode 100644 hw/ssi/sifive_spi.c
 create mode 100644 target/riscv/arch_dump.c

