Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0DE176DAE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 04:49:21 +0100 (CET)
Received: from localhost ([::1]:41636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8yYa-0005b1-78
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 22:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35176)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j8yTS-0004hO-Ox
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:44:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j8yTR-0002Cv-GX
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:44:02 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:47669)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j8yTR-00026W-68; Mon, 02 Mar 2020 22:44:01 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48WjY53n6nz9sSG; Tue,  3 Mar 2020 14:43:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1583207033;
 bh=F8rVUjH+BDs+QSlQo5yN41P6uo1AK1rw7Ini4faroHM=;
 h=From:To:Cc:Subject:Date:From;
 b=XjiuiD68xE0F5Wt1lZdqJMFlC7NWvRz64TlPk87zmp1eLBJTWGCN1nWbIsg9DhXfv
 v7pAFPxRsv7kF5De6iDc4N92Msm8pRmH/53/63d6T5at4xO91ii5ZRMNtjU1cXNu2O
 07RnMQcCn32Dzt6Gr8gr20W+u2H6powPh7zNByV4=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org, clg@kaod.org, qemu-devel@nongnu.org, groug@kaod.org
Subject: [PATCH v7 00/17] target/ppc: Correct some errors with real mode
 handling
Date: Tue,  3 Mar 2020 14:43:34 +1100
Message-Id: <20200303034351.333043-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, Thomas Huth <thuth@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, farosas@linux.ibm.com,
 aik@ozlabs.ru, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, paulus@samba.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

POWER "book S" (server class) cpus have a concept of "real mode" where
MMU translation is disabled... sort of.  In fact this can mean a bunch
of slightly different things when hypervisor mode and other
considerations are present.

We had some errors in edge cases here, so clean some things up and
correct them.

Some of those limitations caused problems with calculating the size of
the Real Mode Area of pseries guests, so continue on to clean up and
correct those calculations as well.

Changes since v6:
 * Removed a no-longer-meaningful comment
 * Reworked RMLS handling for brevity and clarity
 * Fix some earlier rebase damage that mixed hunks between some patches
 * Fix a compile error mid-series
 * Fix a bug caused by patch re-ordering
 * Fixed some bugs in RMA calculation due to muddling local and global
   copies of the rma size
Changes since v5:
 * Fixed an error in the sense of a test (pointed out by Fabiano Rosas)
Changes since v4:
 * Some tiny cosmetic fixes to the original patches
 * Added a bunch of extra patches correcting RMA calculation
Changes since v3:
 * Fix style errors reported by checkpatch
Changes since v2:
 * Removed 32-bit hypervisor stubs more completely
 * Minor polish based on review comments
Changes since RFCv1:
 * Add a number of extra patches taking advantage of the initial
   cleanups

David Gibson (17):
  ppc: Remove stub support for 32-bit hypervisor mode
  ppc: Remove stub of PPC970 HID4 implementation
  target/ppc: Correct handling of real mode accesses with vhyp on hash
    MMU
  target/ppc: Introduce ppc_hash64_use_vrma() helper
  spapr, ppc: Remove VPM0/RMLS hacks for POWER9
  target/ppc: Remove RMOR register from POWER9 & POWER10
  target/ppc: Use class fields to simplify LPCR masking
  target/ppc: Streamline calculation of RMA limit from LPCR[RMLS]
  target/ppc: Correct RMLS table
  target/ppc: Only calculate RMLS derived RMA limit on demand
  target/ppc: Don't store VRMA SLBE persistently
  spapr: Don't use weird units for MIN_RMA_SLOF
  spapr,ppc: Simplify signature of kvmppc_rma_size()
  spapr: Don't attempt to clamp RMA to VRMA constraint
  spapr: Don't clamp RMA to 16GiB on new machine types
  spapr: Clean up RMA size calculation
  spapr: Fold spapr_node0_size() into its only caller

 hw/ppc/spapr.c                  | 125 +++++++------
 hw/ppc/spapr_cpu_core.c         |  10 +-
 hw/ppc/spapr_hcall.c            |   4 +-
 include/hw/ppc/spapr.h          |   4 +-
 target/ppc/cpu-qom.h            |   1 +
 target/ppc/cpu.h                |  25 +--
 target/ppc/kvm.c                |   5 +-
 target/ppc/kvm_ppc.h            |   7 +-
 target/ppc/mmu-hash64.c         | 319 ++++++++++++--------------------
 target/ppc/translate_init.inc.c |  63 ++++---
 10 files changed, 246 insertions(+), 317 deletions(-)

--=20
2.24.1


