Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9776B399C87
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:27:17 +0200 (CEST)
Received: from localhost ([::1]:54770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loihA-000771-Mw
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicu-000676-VH; Thu, 03 Jun 2021 04:22:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46653 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicr-0008Ms-4p; Thu, 03 Jun 2021 04:22:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5l0nXqz9sVb; Thu,  3 Jun 2021 18:22:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708555;
 bh=c9ng99w72BtSY6o67WDdLGAx8mg5iXQt09NTXK/jS8Q=;
 h=From:To:Cc:Subject:Date:From;
 b=QHW85h3q+uq2B1+ScnWhGaaf3Ub2+MiWyQLZkaiPdDeZ0vYxUPUe78xobbOSv5Fq7
 +XvtlsLUyhww1V7nvpEzCOAfHxr0FZzADmeco/lBEFYHAuWu3Cn0u9dOSzn64gwtL9
 R3NP/mvWj9MFwuCoKLH71uJ9a+g6oN6egTVPD3ks=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 00/42] ppc-for-6.1 queue 20210603
Date: Thu,  3 Jun 2021 18:21:49 +1000
Message-Id: <20210603082231.601214-1-david@gibson.dropbear.id.au>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

The following changes since commit 8c345b3e6a736d4985b2bca6f7f24b985900de63:

  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-06-02' into staging (2021-06-02 17:08:11 +0100)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210603

for you to fetch changes up to eba3c766fe355a4e593c1ee6944770f80b68acad:

  target/ppc: fix single-step exception regression (2021-06-03 18:10:31 +1000)

----------------------------------------------------------------
ppc patch queue 2021-06-03

Next batch of ppc target patches.  Highlights are:
 * A fix for a regression with single-step mode
 * Start of moving ppc to use decodetree
 * Implementation of some POWER10 64-bit prefixed instructions
 * Several cleanups to softmmu code
 * Continued progress towards allowing --disable-tcg
 * Fix for the POWER PEF implementation
 * Fix for LPCR handling of hotplugged CPUs
 * Assorted other bugfixes and cleanups

This patchset does contain a couple of changes to code outside my
normal scope of maintainership, related to the removal of cpu_dump and
cpu_statistics hooks.  ppc was the last target arch implementing these
at all, and they didn't really do anything there either.  The patches
should have relevant acks.

----------------------------------------------------------------
Bruno Larsen (billionai) (17):
      target/ppc: cleaned error_report from ppc_store_sdr1
      target/ppc: moved ppc_store_lpcr and ppc_store_msr to cpu.c
      target/ppc: reduce usage of fpscr_set_rounding_mode
      target/ppc: removed unnecessary inclusion of helper-proto.h
      target/ppc: fold ppc_store_ptcr into it's only caller
      target/ppc: used ternary operator when registering MAS
      target/ppc: added ifdefs around TCG-only code
      target/ppc: created tcg-stub.c file
      target/ppc: updated meson.build to support disable-tcg
      target/ppc: remove ppc_cpu_dump_statistics
      target/ppc: removed mentions to DO_PPC_STATISTICS
      monitor: removed cpustats command
      hw/core/cpu: removed cpu_dump_statistics function
      HMP: added info cpustats to removed_features.rst
      target/ppc: removed GEN_OPCODE decision tree
      target/ppc: removed all mentions to PPC_DUMP_CPU
      target/ppc: overhauled and moved logic of storing fpscr

Daniel Henrique Barboza (1):
      ppc/pef.c: initialize cgs->ready in kvmppc_svm_init()

Fabiano Rosas (3):
      target/ppc: powerpc_excp: Move lpes code to where it is used
      target/ppc: powerpc_excp: Remove dump_syscall_vectored
      target/ppc: powerpc_excp: Consolidade TLB miss code

Greg Kurz (1):
      spapr: Don't hijack current_machine->boot_order

Luis Pires (1):
      target/ppc: fix single-step exception regression

Mahesh Salgaonkar (1):
      spapr: Fix EEH capability issue on KVM guest for PCI passthru

Matheus Ferst (5):
      target/ppc: Implement setbc/setbcr/stnbc/setnbcr instructions
      target/ppc: Implement cfuged instruction
      target/ppc: Implement vcfuged instruction
      target/ppc: Move addpcis to decodetree
      target/ppc: Move cmp/cmpi/cmpl/cmpli to decodetree

Nicholas Piggin (2):
      spapr: Remove stale comment about power-saving LPCR bits
      spapr: Set LPCR to current AIL mode when starting a new CPU

Richard Henderson (9):
      target/ppc: Introduce macros to check isa extensions
      target/ppc: Move page crossing check to ppc_tr_translate_insn
      target/ppc: Add infrastructure for prefixed insns
      target/ppc: Move ADDI, ADDIS to decodetree, implement PADDI
      target/ppc: Implement PNOP
      target/ppc: Move D/DS/X-form integer loads to decodetree
      target/ppc: Implement prefixed integer load instructions
      target/ppc: Move D/DS/X-form integer stores to decodetree
      target/ppc: Implement prefixed integer store instructions

Shivaprasad G Bhat (2):
      spapr: nvdimm: Forward declare and move the definitions
      spapr: nvdimm: Fix the persistent-memory root node name in device tree

 docs/system/removed-features.rst           |   5 +
 hmp-commands-info.hx                       |  13 -
 hw/core/cpu-common.c                       |   9 -
 hw/ppc/pef.c                               |   6 +-
 hw/ppc/spapr.c                             |   8 +-
 hw/ppc/spapr_nvdimm.c                      |  16 +-
 hw/ppc/spapr_pci_vfio.c                    |  40 +-
 hw/ppc/spapr_rtas.c                        |  15 +-
 include/hw/core/cpu.h                      |  12 -
 include/hw/ppc/spapr.h                     |   3 +
 include/hw/ppc/spapr_nvdimm.h              |  14 +-
 monitor/misc.c                             |  11 -
 target/ppc/cpu.c                           |  68 ++-
 target/ppc/cpu.h                           |  15 +-
 target/ppc/cpu_init.c                      | 216 +---------
 target/ppc/excp_helper.c                   | 119 +++---
 target/ppc/fpu_helper.c                    | 246 +----------
 target/ppc/gdbstub.c                       |   7 +-
 target/ppc/helper.h                        |   1 +
 target/ppc/insn32.decode                   | 126 ++++++
 target/ppc/insn64.decode                   | 124 ++++++
 target/ppc/int_helper.c                    |  62 +++
 target/ppc/internal.h                      |   2 -
 target/ppc/meson.build                     |  20 +-
 target/ppc/misc_helper.c                   |  40 +-
 target/ppc/mmu-hash32.c                    |   1 -
 target/ppc/mmu-hash64.c                    |  11 +-
 target/ppc/mmu-radix64.c                   |   1 -
 target/ppc/mmu_helper.c                    |  44 +-
 target/ppc/tcg-stub.c                      |  45 ++
 target/ppc/translate.c                     | 637 ++++-------------------------
 target/ppc/translate/fixedpoint-impl.c.inc | 279 +++++++++++++
 target/ppc/translate/vector-impl.c.inc     |  56 +++
 33 files changed, 1064 insertions(+), 1208 deletions(-)
 create mode 100644 target/ppc/insn32.decode
 create mode 100644 target/ppc/insn64.decode
 create mode 100644 target/ppc/tcg-stub.c
 create mode 100644 target/ppc/translate/fixedpoint-impl.c.inc
 create mode 100644 target/ppc/translate/vector-impl.c.inc

