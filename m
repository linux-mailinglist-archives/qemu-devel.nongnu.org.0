Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAE43725A5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:01:19 +0200 (CEST)
Received: from localhost ([::1]:59582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldo7S-0002lc-FB
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzr-00058F-2X; Tue, 04 May 2021 01:53:27 -0400
Received: from ozlabs.org ([203.11.71.1]:44051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzl-0004a0-SO; Tue, 04 May 2021 01:53:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CJ26bwz9sV5; Tue,  4 May 2021 15:53:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107596;
 bh=l28+AXJR8BKdzZV23dAsBiDkMgcKddGs+SAYXRf50yA=;
 h=From:To:Cc:Subject:Date:From;
 b=mrf24mF/OmCdFLkhNpEc9vhlyGm5Ke7HQ7v2x204PR0u1/+e/eLf+2vMRREwo784y
 NW9lYuoH1R8Tg7ISG2i0ScRf5atjP4qy9JiLlX3qo/qkHAqRz5xCseM8am4DhmyNwo
 jEZZyZUutPmZUAUyXRgmxWv9MUnp15bJGVGqXAXA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 00/46] ppc-for-6.1 queue 20210504
Date: Tue,  4 May 2021 15:52:26 +1000
Message-Id: <20210504055312.306823-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 15106f7dc3290ff3254611f265849a314a93eb0e:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210502' into staging (2021-05-02 16:23:05 +0100)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210504

for you to fetch changes up to 4bb32cd7b1e42c46d274b727c8be8e45b4df3814:

  hw/ppc/pnv_psi: Use device_cold_reset() instead of device_legacy_reset() (2021-05-04 13:12:59 +1000)

----------------------------------------------------------------
ppc patch queue 2021-05-04

Here's the first ppc pull request for qemu-6.1.  It has a wide variety
of stuff accumulated during the 6.0 freeze.  Highlights are:

 * Multi-phase reset cleanups for PAPR
 * Preliminary cleanups towards allowing !CONFIG_TCG for the ppc target
 * Cleanup of AIL logic and extension to POWER10
 * Further improvements to handling of hot unplug failures on PAPR
 * Allow much larger numbers of CPU on pseries
 * Support for the H_SCM_HEALTH hypercall
 * Add support for the Pegasos II board
 * Substantial cleanup to hflag handling
 * Assorted minor fixes and cleanups

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      spapr: Rename RTAS_MAX_ADDR to FDT_MAX_ADDR

BALATON Zoltan (6):
      vt82c686: QOM-ify superio related functionality
      vt82c686: Add VT8231_SUPERIO based on VIA_SUPERIO
      vt82c686: Introduce abstract TYPE_VIA_ISA and base vt82c686b_isa on it
      vt82c686: Add emulation of VT8231 south bridge
      hw/pci-host: Add emulation of Marvell MV64361 PPC system controller
      hw/ppc: Add emulation of Genesi/bPlan Pegasos II

Bin Meng (3):
      roms/Makefile: Update ppce500 u-boot build directory name
      roms/u-boot: Bump ppce500 u-boot to v2021.04 to fix broken pci support
      docs/system: ppc: Add documentation for ppce500 machine

Bruno Larsen (billionai) (3):
      target/ppc: code motion from translate_init.c.inc to gdbstub.c
      target/ppc: move opcode table logic to translate.c
      target/ppc: removed VSCR from SPR registration

Daniel Henrique Barboza (3):
      spapr.c: do not use MachineClass::max_cpus to limit CPUs
      spapr.h: increase FDT_MAX_SIZE
      spapr_drc.c: handle hotunplug errors in drc_unisolate_logical()

Nicholas Piggin (4):
      target/ppc: Fix POWER9 radix guest HV interrupt AIL behaviour
      target/ppc: POWER10 supports scv
      target/ppc: rework AIL logic in interrupt delivery
      target/ppc: Add POWER10 exception model

Peter Maydell (3):
      hw/intc/spapr_xive: Use device_cold_reset() instead of device_legacy_reset()
      hw/ppc/spapr_vio: Reset TCE table object with device_cold_reset()
      hw/ppc/pnv_psi: Use device_cold_reset() instead of device_legacy_reset()

Philippe Mathieu-Daudé (1):
      hw/ppc/mac_newworld: Restrict RAM to 2 GiB

Ravi Bangoria (1):
      ppc: Rename current DAWR macros and variables

Richard Henderson (20):
      target/ppc: Move helper_regs.h functions out-of-line
      target/ppc: Move 601 hflags adjustment to hreg_compute_hflags
      target/ppc: Properly sync cpu state with new msr in cpu_load_old
      target/ppc: Do not call hreg_compute_mem_idx after ppc_store_msr
      target/ppc: Retain hflags_nmsr only for migration
      target/ppc: Fix comment for MSR_FE{0,1}
      hw/ppc/pnv_core: Update hflags after setting msr
      hw/ppc/spapr_rtas: Update hflags after setting msr
      target/ppc: Extract post_load_update_msr
      target/ppc: Disconnect hflags from MSR
      target/ppc: Reduce env->hflags to uint32_t
      target/ppc: Put dbcr0 single-step bits into hflags
      target/ppc: Create helper_scv
      target/ppc: Put LPCR[GTSE] in hflags
      target/ppc: Remove MSR_SA and MSR_AP from hflags
      target/ppc: Remove env->immu_idx and env->dmmu_idx
      linux-user/ppc: Fix msr updates for signal handling
      target/ppc: Validate hflags with CONFIG_DEBUG_TCG
      target/ppc: Clean up _spr_register et al
      target/ppc: Reduce the size of ppc_spr_t

Vaibhav Jain (1):
      ppc/spapr: Add support for implement support for H_SCM_HEALTH

 MAINTAINERS                             |  10 +
 default-configs/devices/ppc-softmmu.mak |   2 +
 docs/system/ppc/ppce500.rst             | 156 ++++++
 docs/system/target-ppc.rst              |   1 +
 hw/intc/spapr_xive.c                    |   2 +-
 hw/isa/vt82c686.c                       | 422 +++++++++++---
 hw/pci-host/Kconfig                     |   4 +
 hw/pci-host/meson.build                 |   2 +
 hw/pci-host/mv64361.c                   | 951 ++++++++++++++++++++++++++++++++
 hw/pci-host/mv643xx.h                   | 918 ++++++++++++++++++++++++++++++
 hw/pci-host/trace-events                |   6 +
 hw/ppc/Kconfig                          |   9 +
 hw/ppc/mac_newworld.c                   |   4 +
 hw/ppc/meson.build                      |   2 +
 hw/ppc/pegasos2.c                       | 144 +++++
 hw/ppc/pnv_core.c                       |   3 +-
 hw/ppc/pnv_psi.c                        |   4 +-
 hw/ppc/spapr.c                          |  19 +-
 hw/ppc/spapr_drc.c                      |  23 +
 hw/ppc/spapr_hcall.c                    |   8 +-
 hw/ppc/spapr_nvdimm.c                   |  36 ++
 hw/ppc/spapr_rtas.c                     |   2 +
 hw/ppc/spapr_vio.c                      |   2 +-
 include/hw/isa/vt82c686.h               |   2 +-
 include/hw/pci-host/mv64361.h           |   8 +
 include/hw/pci/pci_ids.h                |   4 +-
 include/hw/ppc/spapr.h                  |   7 +-
 linux-user/ppc/cpu_loop.c               |   5 +-
 linux-user/ppc/signal.c                 |  23 +-
 pc-bios/u-boot.e500                     | Bin 349148 -> 406920 bytes
 roms/Makefile                           |   8 +-
 roms/u-boot                             |   2 +-
 target/ppc/cpu-qom.h                    |   2 +
 target/ppc/cpu.h                        |  80 ++-
 target/ppc/excp_helper.c                | 217 ++++++--
 target/ppc/gdbstub.c                    | 258 +++++++++
 target/ppc/helper.h                     |   1 +
 target/ppc/helper_regs.c                | 280 ++++++++++
 target/ppc/helper_regs.h                | 183 +-----
 target/ppc/int_helper.c                 |   1 +
 target/ppc/internal.h                   |  13 +
 target/ppc/machine.c                    |  39 +-
 target/ppc/mem_helper.c                 |   2 +-
 target/ppc/meson.build                  |   1 +
 target/ppc/misc_helper.c                |  13 +-
 target/ppc/mmu-hash64.c                 |   3 +
 target/ppc/translate.c                  | 493 ++++++++++++++---
 target/ppc/translate_init.c.inc         | 833 ++++------------------------
 48 files changed, 4010 insertions(+), 1198 deletions(-)
 create mode 100644 docs/system/ppc/ppce500.rst
 create mode 100644 hw/pci-host/mv64361.c
 create mode 100644 hw/pci-host/mv643xx.h
 create mode 100644 hw/ppc/pegasos2.c
 create mode 100644 include/hw/pci-host/mv64361.h
 create mode 100644 target/ppc/helper_regs.c

