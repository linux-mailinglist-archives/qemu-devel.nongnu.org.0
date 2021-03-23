Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642EF345536
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:02:34 +0100 (CET)
Received: from localhost ([::1]:38000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWNN-0004CC-CP
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKV-0002E3-Hy
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:35 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKQ-0006tH-IK
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464770; x=1648000770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YHU0culXZFnX+5M1fqhNAwWOU4KPobyrbIUe6pRKTSo=;
 b=O3FzEV4RYkWpvadFoghBMWaoZZfziywxUDoCjahclZ/krU0aHVLnp44c
 2bDx942CC+52yIfQPoNlnDzMhcA/Q3ECg8YoyPbWaHZcxjdz+PisC0Syv
 UXmFRAQWPKxmiNIt+5qKuUPgCCV6O0m+R50/UVnMRXHr9sF/xy6B7Lx1/
 /yNufVCYFVmSvcpKlqwmYxk0zE35t8mRyw1JursnxGI1sKhgp8WuEx0vS
 6GOZCb5H7zqZhZwEiIlrvhzYpU1vJIpg2pE77gNlWMUMg/FIjid+gOGlk
 59cgueqtiXmK8sOAXTqr2x44XSqcaoHQkQDXsB0VKX5hP/vA0LGxXMZZx Q==;
IronPort-SDR: S28EBmy2rUx6yTfSJhN/bnxve0Spj8Dqeic+ijXgIGKpMuatCtA3n29lRO4GfXwn3Lu+PnamHf
 apreejHzN6JLvgfC13z08JCVwwBxqr91dr1gjclWA+Ar7l4w9I1aAxGBveOn3X21GldugNDy5w
 nXwzreOpECzMCfz5t2a2r75h8d2IZ5DQMtOA4pH406mIkLjz0OCpQJhWPP5HMgrCSjRl6kEtwQ
 tzTlzQ0vITHrStUg9XXLd4NfDKhZIc1S9HRmV4YjoriWfEUStOWda2s2N/fgzGsU08BcI6nXzq
 F3o=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707618"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:27 +0800
IronPort-SDR: DEBOADmfJcSchBY//vSW2ObGLhkowWs4sEChCLr8FyJxnIYh6WdyCBmwWhNge02mhXYAlmpvkz
 4sbxya4cUpj6WN5hC1Ak+peiuCR0Iga1brNT2K0yPhjCimsw49F9NhbxK8pe50i3wLN5RpN0u1
 YmifHedfqURKQyEpPqPWkns/VsxKSv77kVsmKT2QcRy4YsOb9nlj25mC0HCEXzNKMbo/Uoqmq7
 JwQ3rEuE2CDi63TGBNPWEUkyJRf7Uqr02NmdHBWG4lY+BcKXUcyDLJD613eGHiTfRtycGGVWb8
 E+fH+daPT3B4BiDARUTXqQ3t
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:35 -0700
IronPort-SDR: KCkXndwDJA81MG/xI6x3XfXoUH6KO2kRb8zBRi+q9MHAmUp34ldt3i9Te2IuTPxcb6ULFIPbtj
 +Pnqa4+dCNpPsMdtvDKhVteShpbGGqQjs5uYZYRRE1qk29Q8UNssr6ZMyPr+ELgbPSmzp3SVyn
 YGhhTEd72vj0LFf+trD2tEK5TyVSm1RmzayYjUQUbwnIMvx5gMStCcOMw3/Nz3hFO7GX3XqyFw
 OxWjil9kc6aWyTre7hUc20MR6T7zpeZhVxnlLoDBjTczlsvWpp9AIb7uVv0dcaXYNluPUfERHS
 Oqc=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:27 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 00/16] riscv-to-apply queue
Date: Mon, 22 Mar 2021 21:57:40 -0400
Message-Id: <20210323015756.3168650-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

The following changes since commit c95bd5ff1660883d15ad6e0005e4c8571604f51a:

  Merge remote-tracking branch 'remotes/philmd/tags/mips-fixes-20210322' into staging (2021-03-22 14:26:13 +0000)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210322-2

for you to fetch changes up to 9a27f69bd668d9d71674407badc412ce1231c7d5:

  target/riscv: Prevent lost illegal instruction exceptions (2021-03-22 21:54:40 -0400)

----------------------------------------------------------------
RISC-V PR for 6.0

This PR includes:
 - Fix for vector CSR access
 - Improvements to the Ibex UART device
 - PMP improvements and bug fixes
 - Hypervisor extension bug fixes
 - ramfb support for the virt machine
 - Fast read support for SST flash
 - Improvements to the microchip_pfsoc machine

----------------------------------------------------------------
Alexander Wagner (1):
      hw/char: disable ibex uart receive if the buffer is full

Asherah Connor (2):
      hw/riscv: Add fw_cfg support to virt
      hw/riscv: allow ramfb on virt

Bin Meng (3):
      hw/block: m25p80: Support fast read for SST flashes
      hw/riscv: microchip_pfsoc: Map EMMC/SD mux register
      docs/system: riscv: Add documentation for 'microchip-icicle-kit' machine

Frank Chang (1):
      target/riscv: fix vs() to return proper error code

Georg Kotheimer (6):
      target/riscv: Adjust privilege level for HLV(X)/HSV instructions
      target/riscv: Make VSTIP and VSEIP read-only in hip
      target/riscv: Use background registers also for MSTATUS_MPV
      target/riscv: Fix read and write accesses to vsip and vsie
      target/riscv: Add proper two-stage lookup exception detection
      target/riscv: Prevent lost illegal instruction exceptions

Jim Shu (3):
      target/riscv: propagate PMP permission to TLB page
      target/riscv: add log of PMP permission checking
      target/riscv: flush TLB pages if PMP permission has been changed

 docs/system/riscv/microchip-icicle-kit.rst |  89 ++++++++++++++
 docs/system/target-riscv.rst               |   1 +
 include/hw/char/ibex_uart.h                |   4 +
 include/hw/riscv/microchip_pfsoc.h         |   1 +
 include/hw/riscv/virt.h                    |   2 +
 target/riscv/cpu.h                         |   4 +
 target/riscv/pmp.h                         |   4 +-
 hw/block/m25p80.c                          |   3 +
 hw/char/ibex_uart.c                        |  23 +++-
 hw/riscv/microchip_pfsoc.c                 |   6 +
 hw/riscv/virt.c                            |  33 ++++++
 target/riscv/cpu.c                         |   1 +
 target/riscv/cpu_helper.c                  | 144 +++++++++++++++--------
 target/riscv/csr.c                         |  77 +++++++------
 target/riscv/pmp.c                         |  84 ++++++++++----
 target/riscv/translate.c                   | 179 +----------------------------
 hw/riscv/Kconfig                           |   1 +
 17 files changed, 367 insertions(+), 289 deletions(-)
 create mode 100644 docs/system/riscv/microchip-icicle-kit.rst

