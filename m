Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B3E2D9260
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:03:52 +0100 (CET)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kog1X-0002vx-41
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwM-00058f-Nb; Sun, 13 Dec 2020 23:58:31 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:43849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwI-0004pF-Pr; Sun, 13 Dec 2020 23:58:30 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfp5qHVz9sSf; Mon, 14 Dec 2020 15:58:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921890;
 bh=nNGkvPq4LAx8HFkinhIc1prhD0cgyzTVGRIgaRU3wSM=;
 h=From:To:Cc:Subject:Date:From;
 b=AGWDgILE+cqCZaOMGVeTr2avSm0CmXgTPmTa/ueLipKJ748+YNDlgNaLn00J3J+SM
 EK0yaVlIgTNH7BJXU/vDiG5uDi2Nh69caFlZCr+v27PKO2xsdT8oFAtPjQCK+wXqSf
 QiTtnTmUJtv3gd/HgRKfwohLhKl0KRpFr15lELZw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 00/30] ppc-for-6.0 queue 20201214
Date: Mon, 14 Dec 2020 15:57:37 +1100
Message-Id: <20201214045807.41003-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 17584289af1aaa72c932e7e47c25d583b329dc45:

  Merge remote-tracking branch 'remotes/vivier/tags/m68k-for-6.0-pull-request' into staging (2020-12-12 18:33:46 +0000)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20201214

for you to fetch changes up to 07b10bc42cc83a49acaa783383a69fb59d7ff71a:

  spapr.c: set a 'kvm-type' default value instead of relying on NULL (2020-12-14 15:54:12 +1100)

----------------------------------------------------------------
ppc patch queue 2020-12-14

Here's my first pull request for qemu-6.0, with a bunch of things
queued over the freeze.  Highlights are:
 * A bunch of cleanups to hotplug error paths from Greg Kurz
 * A number of TCG fixes from new contributor Giuseppe Musacchio
 * Added Greg Kurz as co-maintainer
 * Assorted other bugfixes and cleanups

This supersedes ppc-for-6.0-20201211, the only change are some patch
authors to better match qemu conventions.

----------------------------------------------------------------
Chen Qun (2):
      target/ppc: replaced the TODO with LOG_UNIMP and add break for silence warnings
      ppc: Add a missing break for PPC6xx_INPUT_TBEN

Cédric Le Goater (1):
      xive: Add trace events

Daniel Henrique Barboza (1):
      spapr.c: set a 'kvm-type' default value instead of relying on NULL

David Gibson (1):
      MAINTAINERS: Add Greg Kurz as co-maintainer for ppc

Gan Qixin (1):
      ppc/e500: Free irqs array to avoid memleak

Giuseppe Musacchio (5):
      ppc/translate: Fix unordered f64/f128 comparisons
      ppc/translate: Turn the helper macros into functions
      ppc/translate: Delay NaN checking after comparison
      ppc/translate: Raise exceptions after setting the cc
      ppc/translate: Rewrite gen_lxvdsx to use gvec primitives

Greg Kurz (17):
      spapr/xive: Turn some sanity checks into assertions
      spapr/xics: Drop unused argument to xics_kvm_has_broken_disconnect()
      spapr: Do PCI device hotplug sanity checks at pre-plug only
      spapr: Do NVDIMM/PC-DIMM device hotplug sanity checks at pre-plug only
      spapr: Make PHB placement functions and spapr_pre_plug_phb() return status
      spapr: Do PHB hoplug sanity check at pre-plug
      spapr: Do TPM proxy hotplug sanity checks at pre-plug
      spapr: Fix pre-2.10 dummy ICP hack
      spapr: Abort if ppc_set_compat() fails for hot-plugged CPUs
      spapr: Simplify error path of spapr_core_plug()
      spapr: spapr_drc_attach() cannot fail
      target/ppc: Remove "compat" property of server class POWER CPUs
      hw/ppc: Do not re-read the clock on pre_save if doing savevm
      target/ppc: Introduce an mmu_is_64bit() helper
      spapr: Pass sPAPR machine state down to spapr_pci_switch_vga()
      spapr: Don't use qdev_get_machine() in spapr_msi_write()
      spapr: Pass sPAPR machine state to some RTAS events handling functions

Philippe Mathieu-Daudé (1):
      hw/ppc/spapr_tpm_proxy: Fix hexadecimal format string specifier

Stephane Duverger (1):
      ppc/translate: Use POWERPC_MMU_64 to detect 64-bit MMU models

 MAINTAINERS                         |  17 ++-
 docs/system/deprecated.rst          |   7 --
 hw/intc/spapr_xive.c                |  47 ++++++--
 hw/intc/spapr_xive_kvm.c            |   5 +
 hw/intc/trace-events                |  33 ++++++
 hw/intc/xics_kvm.c                  |   2 +-
 hw/intc/xive.c                      |  40 ++++++-
 hw/ppc/e500.c                       |   1 +
 hw/ppc/ppc.c                        |   6 +-
 hw/ppc/spapr.c                      | 186 ++++++++++++++++--------------
 hw/ppc/spapr_drc.c                  |   8 +-
 hw/ppc/spapr_events.c               |  21 ++--
 hw/ppc/spapr_hcall.c                |   7 +-
 hw/ppc/spapr_irq.c                  |   2 +-
 hw/ppc/spapr_nvdimm.c               |  11 +-
 hw/ppc/spapr_pci.c                  |  48 +++++---
 hw/ppc/trace-events                 |   2 +-
 include/hw/ppc/spapr.h              |   4 +-
 include/hw/ppc/spapr_drc.h          |   8 +-
 include/hw/ppc/spapr_nvdimm.h       |   2 +-
 include/hw/ppc/xics_spapr.h         |   2 +-
 target/ppc/cpu-qom.h                |   5 +
 target/ppc/excp_helper.c            |   4 +-
 target/ppc/fpu_helper.c             | 220 +++++++++++++++++++++---------------
 target/ppc/machine.c                |   4 +-
 target/ppc/mmu-hash64.c             |   2 +-
 target/ppc/mmu_helper.c             |  15 +--
 target/ppc/translate.c              |   4 +-
 target/ppc/translate/vsx-impl.c.inc |  46 ++++----
 target/ppc/translate_init.c.inc     |  61 +---------
 30 files changed, 478 insertions(+), 342 deletions(-)

