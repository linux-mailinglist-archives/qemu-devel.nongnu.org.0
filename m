Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9383A3C1ED3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:20:00 +0200 (CEST)
Received: from localhost ([::1]:41556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ivf-0003zx-IY
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1ita-0000s2-5c; Fri, 09 Jul 2021 01:17:50 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40785 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itV-0001pH-H8; Fri, 09 Jul 2021 01:17:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHc5Lmkz9sWX; Fri,  9 Jul 2021 15:17:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807852;
 bh=aa7MGsey37Y3eptsAoRe08PFgphHCdjFLG9sqFce1tQ=;
 h=From:To:Cc:Subject:Date:From;
 b=XfFbS1RxID5X5WE6sM3wrvzXYoHs3lRB0BKdyCiIgANFV+9AsxXNz9Yl8fqoGoxBE
 qyj7oI2vdtTFDQU2xUPXNAuVV9X7cu/cUzffH8yqmOJ4qrWfgIduNniCTUBSmnSL66
 RPJ3XU/2r6kr//Xyx8lrHOxK4XNO4N0DEXQ/IQlM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 00/33] ppc-for-6.1 queue 20210709
Date: Fri,  9 Jul 2021 15:16:55 +1000
Message-Id: <20210709051728.170203-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9db3065c62a983286d06c207f4981408cf42184d:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-07-08 16:30:18 +0100)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210709

for you to fetch changes up to 82123b756a1a2f1965350e5794aaa7b5c6a15282:

  target/ppc: Support for H_RPT_INVALIDATE hcall (2021-07-09 11:01:06 +1000)

----------------------------------------------------------------
ppc patch queue 2021-07-09

Here's a (probably) final pull request before the qemu-6.1 soft
freeze.  Includes:
  * Implementation of the new H_RPT_INVALIDATE hypercall
  * Virtual Open Firmware for pSeries and pegasos2 machine types.
    This is an experimental minimal Open Firmware implementation which
    works by delegating nearly everything to qemu itself via a special
    hypercall.
  * A number of cleanups to the ppc soft MMU code
  * Fix to handling of two-level radix mode translations for the
    powernv machine type
  * Update the H_GET_CPU_CHARACTERISTICS call with newly defined bits.
    This will allow more flexible handling of possible future CPU
    Spectre-like flaws
  * Correctly treat mtmsrd as an illegal instruction on BookE cpus
  * Firmware update for the ppce500 machine type

----------------------------------------------------------------
Alexey Kardashevskiy (3):
      spapr: tune rtas-size
      spapr: Implement Open Firmware client interface
      spapr: Fix implementation of Open Firmware client interface

BALATON Zoltan (4):
      ppc/pegasos2: Introduce Pegasos2MachineState structure
      target/ppc: Allow virtual hypervisor on CPU without HV
      ppc/pegasos2: Use Virtual Open Firmware as firmware replacement
      ppc/pegasos2: Implement some RTAS functions with VOF

Bharata B Rao (2):
      linux-headers: Update
      target/ppc: Support for H_RPT_INVALIDATE hcall

Bin Meng (2):
      roms/u-boot: Bump ppce500 u-boot to v2021.07 to add eTSEC support
      docs/system: ppc: Update ppce500 documentation with eTSEC support

Bruno Larsen (billionai) (4):
      target/ppc: fix address translation bug for radix mmus
      target/ppc: changed ppc_hash64_xlate to use mmu_idx
      target/ppc: introduce mmu-books.h
      target/ppc: change ppc_hash32_xlate to use mmu_idx

David Gibson (1):
      ppc/pegasos2: Fix use of && instead of &

Fabiano Rosas (3):
      target/ppc: Fix compilation with DUMP_PAGE_TABLES debug option
      target/ppc: Fix compilation with FLUSH_ALL_TLBS debug option
      target/ppc: Fix compilation with DEBUG_BATS debug option

Greg Kurz (2):
      target/ppc: Introduce ppc_interrupts_little_endian()
      target/ppc: Drop PowerPCCPUClass::interrupts_big_endian()

Lucas Mateus Castro (alqotel) (1):
      target/ppc: Don't compile ppc_tlb_invalid_all without TCG

Nicholas Piggin (2):
      target/ppc: mtmsrd is an illegal instruction on BookE
      target/ppc/spapr: Update H_GET_CPU_CHARACTERISTICS L1D cache flush bits

Richard Henderson (9):
      target/ppc: Remove PowerPCCPUClass.handle_mmu_fault
      target/ppc: Use MMUAccessType with *_handle_mmu_fault
      target/ppc: Push real-mode handling into ppc_radix64_xlate
      target/ppc: Use bool success for ppc_radix64_xlate
      target/ppc: Split out ppc_hash64_xlate
      target/ppc: Split out ppc_hash32_xlate
      target/ppc: Split out ppc_jumbo_xlate
      target/ppc: Introduce ppc_xlate
      target/ppc: Restrict ppc_cpu_tlb_fill to TCG

 MAINTAINERS                                        |   12 +
 default-configs/devices/ppc-softmmu.mak            |    2 +-
 docs/system/ppc/ppce500.rst                        |   10 +-
 hw/ppc/Kconfig                                     |    5 +
 hw/ppc/meson.build                                 |    3 +
 hw/ppc/pegasos2.c                                  |  789 ++++++++++++++-
 hw/ppc/spapr.c                                     |   77 +-
 hw/ppc/spapr_caps.c                                |   41 +
 hw/ppc/spapr_hcall.c                               |   24 +-
 hw/ppc/spapr_vof.c                                 |  167 ++++
 hw/ppc/trace-events                                |   24 +
 hw/ppc/vof.c                                       | 1053 ++++++++++++++++++++
 include/hw/ppc/spapr.h                             |   31 +-
 include/hw/ppc/vof.h                               |   58 ++
 include/standard-headers/asm-x86/kvm_para.h        |   13 +
 include/standard-headers/drm/drm_fourcc.h          |    7 +
 include/standard-headers/linux/ethtool.h           |    4 +-
 include/standard-headers/linux/input-event-codes.h |    1 +
 include/standard-headers/linux/virtio_ids.h        |    2 +-
 include/standard-headers/linux/virtio_vsock.h      |    9 +
 linux-headers/asm-arm64/kvm.h                      |   11 +
 linux-headers/asm-generic/mman-common.h            |    3 +
 linux-headers/asm-generic/unistd.h                 |    4 +-
 linux-headers/asm-mips/mman.h                      |    3 +
 linux-headers/asm-mips/unistd_n32.h                |    1 +
 linux-headers/asm-mips/unistd_n64.h                |    1 +
 linux-headers/asm-mips/unistd_o32.h                |    1 +
 linux-headers/asm-powerpc/unistd_32.h              |    1 +
 linux-headers/asm-powerpc/unistd_64.h              |    1 +
 linux-headers/asm-s390/unistd_32.h                 |    1 +
 linux-headers/asm-s390/unistd_64.h                 |    1 +
 linux-headers/asm-x86/kvm.h                        |   13 +
 linux-headers/asm-x86/unistd_32.h                  |    7 +-
 linux-headers/asm-x86/unistd_64.h                  |    7 +-
 linux-headers/asm-x86/unistd_x32.h                 |    7 +-
 linux-headers/linux/kvm.h                          |  105 ++
 linux-headers/linux/userfaultfd.h                  |   11 +-
 pc-bios/README                                     |    4 +
 pc-bios/u-boot.e500                                |  Bin 406920 -> 421720 bytes
 pc-bios/vof-nvram.bin                              |  Bin 0 -> 16384 bytes
 pc-bios/vof.bin                                    |  Bin 0 -> 3456 bytes
 pc-bios/vof/Makefile                               |   23 +
 pc-bios/vof/bootmem.c                              |   14 +
 pc-bios/vof/ci.c                                   |   91 ++
 pc-bios/vof/entry.S                                |   49 +
 pc-bios/vof/libc.c                                 |   66 ++
 pc-bios/vof/main.c                                 |   21 +
 pc-bios/vof/vof.h                                  |   41 +
 pc-bios/vof/vof.lds                                |   48 +
 roms/u-boot                                        |    2 +-
 target/ppc/arch_dump.c                             |    8 +-
 target/ppc/cpu-qom.h                               |    2 -
 target/ppc/cpu.c                                   |    2 +-
 target/ppc/cpu.h                                   |   15 +
 target/ppc/cpu_init.c                              |   64 +-
 target/ppc/excp_helper.c                           |    3 +-
 target/ppc/kvm.c                                   |   12 +
 target/ppc/kvm_ppc.h                               |   12 +
 target/ppc/mmu-book3s-v3.c                         |   19 -
 target/ppc/mmu-book3s-v3.h                         |    6 +-
 target/ppc/mmu-books.h                             |   30 +
 target/ppc/mmu-hash32.c                            |  254 +++--
 target/ppc/mmu-hash32.h                            |    8 +-
 target/ppc/mmu-hash64.c                            |  157 ++-
 target/ppc/mmu-hash64.h                            |    6 +-
 target/ppc/mmu-radix64.c                           |  151 ++-
 target/ppc/mmu-radix64.h                           |    6 +-
 target/ppc/mmu_helper.c                            |  215 ++--
 target/ppc/translate.c                             |    5 +
 tests/qtest/rtas-test.c                            |   15 +-
 70 files changed, 3256 insertions(+), 603 deletions(-)
 create mode 100644 hw/ppc/spapr_vof.c
 create mode 100644 hw/ppc/vof.c
 create mode 100644 include/hw/ppc/vof.h
 create mode 100644 pc-bios/vof-nvram.bin
 create mode 100755 pc-bios/vof.bin
 create mode 100644 pc-bios/vof/Makefile
 create mode 100644 pc-bios/vof/bootmem.c
 create mode 100644 pc-bios/vof/ci.c
 create mode 100644 pc-bios/vof/entry.S
 create mode 100644 pc-bios/vof/libc.c
 create mode 100644 pc-bios/vof/main.c
 create mode 100644 pc-bios/vof/vof.h
 create mode 100644 pc-bios/vof/vof.lds
 create mode 100644 target/ppc/mmu-books.h

