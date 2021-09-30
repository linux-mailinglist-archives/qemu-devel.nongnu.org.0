Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497141D2D9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:48:42 +0200 (CEST)
Received: from localhost ([::1]:51462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVovx-0004je-HE
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos2-0000tW-4j; Thu, 30 Sep 2021 01:44:38 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:49663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVorz-0003Ky-NB; Thu, 30 Sep 2021 01:44:37 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyQ6gXgz4xbL; Thu, 30 Sep 2021 15:44:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980670;
 bh=QJOiNBhefNqfjqQqjV8v0wHuEi0PBVIBmxJJD/iH+wo=;
 h=From:To:Cc:Subject:Date:From;
 b=cVe2t+cdxVZEK6bRQhXbZZa20s4PNrZgRkmyUwBLv0vcLBNGhQh4zI6u53D+1xag0
 Vuo3kmqufQwjbb92QOxLbHkVOIs7x9HwZcWLTyPvMmj/THuqEgNpoh5r45qUUXkwk5
 OIjT6ICKDlYzJ7x4ROYKaIISuK8aFWIaUKkvexpU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 00/44] ppc-for-6.2 queue 20210930
Date: Thu, 30 Sep 2021 15:43:42 +1000
Message-Id: <20210930054426.357344-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6b54a31bf7b403672a798b6443b1930ae6c74dea:

  Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2021-09-28 13:07:32 +0100)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.2-20210930

for you to fetch changes up to 85d887be82905aa81b5d3d6c483ff0fa9958382b:

  MAINTAINERS: Demote sPAPR from "Supported" to "Maintained" (2021-09-30 12:26:06 +1000)

----------------------------------------------------------------
ppc patch queue for 2021-09-30

Here's the next batch of ppc related patches for qemu-6.2.  Highlights
are:
 * Fixes for several TCG math instructions from the El Dorado Institute
 * A number of improvements to the powernv machine type
 * Support for a new DEVICE_UNPLUG_GUEST_ERROR QAPI event from Daniel
   Barboza
 * Support for the new FORM2 PAPR NUMA representation.  This allows
   more specific NUMA distances, as well as asymmetric configurations
 * Fix for 64-bit decrementer (used on MicroWatt CPUs)
 * Assorted fixes and cleanups
 * A number of updates to MAINTAINERS

Note that the DEVICE_UNPLUG_GUEST_ERROR stuff includes changes to
files outside my normal area, but has suitable Acks.

The MAINTAINERS updates are mostly about marking minor platforms
unmaintained / orphaned, and moving some pieces away from myself and
Greg.  As we move onto other projects, we're going to need to drop
more of the ppc maintainership, though we're hoping we can avoid too
abrupt a change.

----------------------------------------------------------------
Bin Meng (3):
      hw/intc: openpic: Correct the reset value of IPIDR for FSL chipset
      hw/intc: openpic: Drop Raven related codes
      hw/intc: openpic: Clean up the styles

Cédric Le Goater (13):
      ppc/spapr: Add a POWER10 DD2 CPU
      ppc/pnv: Add a comment on the "primary-topology-index" property
      ppc/pnv: Remove useless variable
      ppc/xive: Export priority_to_ipb() helper
      ppc/xive: Export xive_tctx_word2() helper
      ppc/pnv: Rename "id" to "quad-id" in PnvQuad
      docs/system: ppc: Update the URL for OpenPOWER firmware images
      ppc/pnv: Add an assert when calculating the RAM distribution on chips
      target/ppc: Convert debug to trace events (exceptions)
      target/ppc: Replace debug messages by asserts for unknown IRQ pins
      target/ppc: Convert debug to trace events (decrementer and IRQ)
      target/ppc: Fix 64-bit decrementer
      spapr/xive: Fix kvm_xive_source_reset trace event

Daniel Henrique Barboza (15):
      memory_hotplug.c: handle dev->id = NULL in acpi_memory_hotplug_write()
      spapr.c: handle dev->id in spapr_memory_unplug_rollback()
      spapr_drc.c: do not error_report() when drc->dev->id == NULL
      qapi/qdev.json: fix DEVICE_DELETED parameters doc
      qapi/qdev.json: add DEVICE_UNPLUG_GUEST_ERROR QAPI event
      spapr: use DEVICE_UNPLUG_GUEST_ERROR to report unplug errors
      memory_hotplug.c: send DEVICE_UNPLUG_GUEST_ERROR in acpi_memory_hotplug_write()
      spapr_numa.c: split FORM1 code into helpers
      spapr_numa.c: scrap 'legacy_numa' concept
      spapr_numa.c: parametrize FORM1 macros
      spapr_numa.c: rename numa_assoc_array to FORM1_assoc_array
      spapr: move FORM1 verifications to post CAS
      spapr_numa.c: FORM2 NUMA affinity support
      spapr_numa.c: handle auto NUMA node with no distance info
      spapr_numa.c: fixes in spapr_numa_FORM2_write_rtas_tables()

David Gibson (6):
      MAINTAINERS: Remove machine specific files from ppc TCG CPUs entry
      MAINTAINERS: Remove David & Greg as reviewers for a number of boards
      MAINTAINERS: Orphan obscure ppc platforms
      MAINTAINERS: Remove David & Greg as reviewers/co-maintainers of powernv
      MAINTAINERS: Add information for OpenPIC
      MAINTAINERS: Demote sPAPR from "Supported" to "Maintained"

Luis Pires (5):
      host-utils: Fix overflow detection in divu128()
      host-utils: fix missing zero-extension in divs128
      host-utils: introduce uabs64()
      i386/kvm: Replace abs64() with uabs64() from host-utils
      target/ppc: fix setting of CR flags in bcdcfsq

Matheus Ferst (2):
      target/ppc: add LPCR[HR] to DisasContext and hflags
      target/ppc: Check privilege level based on PSR and LPCR[HR] in tlbie[l]

 MAINTAINERS                 |  47 ++----
 docs/about/deprecated.rst   |  10 ++
 docs/system/ppc/powernv.rst |   3 +-
 hw/acpi/memory_hotplug.c    |  11 +-
 hw/i386/kvm/i8254.c         |   7 +-
 hw/intc/openpic.c           |  92 +++++------
 hw/intc/spapr_xive_kvm.c    |   4 +-
 hw/intc/xive.c              |  26 +--
 hw/ppc/pnv.c                |  13 +-
 hw/ppc/pnv_core.c           |   4 +-
 hw/ppc/pnv_xscom.c          |   4 +
 hw/ppc/ppc.c                | 211 +++++++++---------------
 hw/ppc/spapr.c              |  53 +++----
 hw/ppc/spapr_cpu_core.c     |   1 +
 hw/ppc/spapr_drc.c          |  16 +-
 hw/ppc/spapr_hcall.c        |   7 +
 hw/ppc/spapr_numa.c         | 379 ++++++++++++++++++++++++++++++++++++--------
 hw/ppc/trace-events         |  22 ++-
 include/hw/ppc/openpic.h    |  25 +--
 include/hw/ppc/pnv_core.h   |   2 +-
 include/hw/ppc/spapr.h      |  35 ++--
 include/hw/ppc/spapr_numa.h |   1 +
 include/hw/ppc/spapr_ovec.h |   1 +
 include/hw/ppc/xive.h       |  16 ++
 include/qemu/host-utils.h   |  10 +-
 qapi/machine.json           |   7 +-
 qapi/qdev.json              |  31 +++-
 stubs/qdev.c                |   7 +
 target/ppc/cpu.h            |   1 +
 target/ppc/excp_helper.c    |  38 ++---
 target/ppc/helper_regs.c    |   3 +
 target/ppc/int_helper.c     |  61 +++++--
 target/ppc/trace-events     |   8 +
 target/ppc/translate.c      |  28 +++-
 util/host-utils.c           |   2 +-
 35 files changed, 741 insertions(+), 445 deletions(-)

