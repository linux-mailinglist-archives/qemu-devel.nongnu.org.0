Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934A63722E6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:17:38 +0200 (CEST)
Received: from localhost ([::1]:51076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgsj-0006Mg-EK
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgp4-0004W7-1G
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:13:50 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgoy-0008VN-T6
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080024; x=1651616024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vzzsTopJXTaoXqA4S+0vzny1bPXo6pGQUEJMqqdlQyI=;
 b=J7av4jRzLilGKeQ5NYsKqaVuosG6kjfic5Lj7JQmZlfGPIPoLUsOkPZ5
 hS2Onpu7uUMHvzGelUiuz5WTuW6iK+l56df/J52bRgje+czBF42nKsAsJ
 jBNhyU4eegkNk9Zr1HPYirWAQfx7yzY6ig7KqgQiTNwxBYVBcAMm1fnqi
 F0TopVvcjBfjVgltBm0KnwnqGTCbIaPYdPzGU2K5HcduKvjHXfE4homz7
 BLgYmzwQw2OBijYmU827D5FvFMut0twkm3QZDdfjLilDL68MFV6fcePcY
 /PRDhmhfEeKvWdCbGa+ZVo4jUVEtz0ngTy4N5Ar8Uaz34YzKOY44+bCZA Q==;
IronPort-SDR: uNv5jAF/5Ce3AFOhsRnhh43x2teu9dIW3EyvthNXyWeDuwk3yWpeEBf67OMXsbtXQkQeZODfgs
 MN6+G57LduDGIHbSwJ7j4EexWnN5NII2Pi1yJLZRvmiAF41w70BR1QYQFrKS4AwW1OQDrqm8rA
 mcxBVZzHrTnxSXfSv6z0UMCJklF+qLkTa4J5+d6mYK5LjbaZLoOZ6xZO+FbquoYpTyCOBC41Ei
 ILPiAqQjZJteQdgbyEq9REEL0WbXr3+9IFSsRRuunwZNNMZ5rCUYEK+GCGFpSU6fdge2dEq2SU
 MP0=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114580"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:13:40 +0800
IronPort-SDR: acqJWa/Hc4sy08FQke+NnJpOqor9v488wUhb8WKBKdWYRJssbKXNAx6fGsmjDDcH4uKLpOLFI/
 KqqEJCtEQdyvOgl3WFgvwI/9vQE29w/lSJNy8rG5cupnhlZSoG3Cl5GIJ3DtsH+oEPbt2P+7uX
 7T6EunScxw0+0fKHxL6a+pdPd+iH8HmS8dphtmU/s7ccZcQs5Ph7+PLm6dcg54K0BAWMGTa7lg
 9E7mn5d6w26/00KZGqlEg8ipzesVS4+K6b6SjeMO5XB7cQ72BgmngKMttsHtb0Y1PgUcahcYtT
 48/jXdqs5F3t9/RuCuLeDz6p
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:53:51 -0700
IronPort-SDR: jiLuEpI3sCPaUahDDeHQnTxaTnGi1F8acWGPO1rc0ZstRvpWFbiaSgceqli70FF6sCj2tBsyKR
 jb4D7/I3hIn25HmvZQIjFOaTrtjNYHbTp0CXBmvchY1OX4tLewK9VsXv2Fe/BhbadqjN5v9yiF
 MJLV7LAnq9hp0xTfUlGGpNs6+1XuFE13hVXu5+mFxPHE9STjHk1iTYsDhyanT2J4dVlyjJmVPH
 A2yC9ffXDyJHXp8fwW+PnPeeRvx2fUtTSgdDHLfXGNb3b91N1E6xOHaFgBrsXF5xrFrEw1qEP1
 2aI=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:13:38 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 00/42] riscv-to-apply queue
Date: Tue,  4 May 2021 08:12:45 +1000
Message-Id: <20210503221327.3068768-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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

The following changes since commit 15106f7dc3290ff3254611f265849a314a93eb0e:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210502' into staging (2021-05-02 16:23:05 +0100)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210504-2

for you to fetch changes up to 7a98eab3a704139020bdad35bfae0356d2a31fa0:

  target/riscv: Fix the RV64H decode comment (2021-05-04 08:03:43 +1000)

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
 hw/riscv/shakti_c.c                         | 178 ++++++
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
 46 files changed, 1755 insertions(+), 789 deletions(-)
 create mode 100644 docs/system/riscv/shakti-c.rst
 create mode 100644 include/hw/char/shakti_uart.h
 create mode 100644 include/hw/riscv/shakti_c.h
 delete mode 100644 target/riscv/insn16-32.decode
 delete mode 100644 target/riscv/insn16-64.decode
 delete mode 100644 target/riscv/insn32-64.decode
 create mode 100644 hw/char/shakti_uart.c
 create mode 100644 hw/riscv/shakti_c.c

