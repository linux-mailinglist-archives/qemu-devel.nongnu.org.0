Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D20176DA9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 04:47:39 +0100 (CET)
Received: from localhost ([::1]:41612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8yWw-0001q0-Sm
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 22:47:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j8yTQ-0004h0-O7
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:44:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j8yTP-0002AM-6i
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:44:00 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60509 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j8yTO-00026R-HL; Mon, 02 Mar 2020 22:43:59 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48WjY56wz2z9sSN; Tue,  3 Mar 2020 14:43:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1583207033;
 bh=RZjMlsbNKA6+ViTuycxwZ7IU6OPn0vl7+MnQX6dTb5A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l3qnHMeBVzoY4M0fOB+pMKoTXSs1S90xktvuX2s6M4elihIV+DArUbpHH+tIPHiYg
 euX15cR2h9AqRthFFZLdDiUgnIs05jpDsuHUFyB4gArLdEyjDB2NWp2jXxLR+9aHC5
 i5W9p6rYveZepzc7pmwdRRRqyi72JifRg1hWdIgY=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org, clg@kaod.org, qemu-devel@nongnu.org, groug@kaod.org
Subject: [PATCH v7 05/17] spapr, ppc: Remove VPM0/RMLS hacks for POWER9
Date: Tue,  3 Mar 2020 14:43:39 +1100
Message-Id: <20200303034351.333043-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200303034351.333043-1-david@gibson.dropbear.id.au>
References: <20200303034351.333043-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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

For the "pseries" machine, we use "virtual hypervisor" mode where we
only model the CPU in non-hypervisor privileged mode.  This means that
we need guest physical addresses within the modelled cpu to be treated
as absolute physical addresses.

We used to do that by clearing LPCR[VPM0] and setting LPCR[RMLS] to a hig=
h
limit so that the old offset based translation for guest mode applied,
which does what we need.  However, POWER9 has removed support for that
translation mode, which meant we had some ugly hacks to keep it working.

We now explicitly handle this sort of translation for virtual hypervisor
mode, so the hacks aren't necessary.  We don't need to set VPM0 and RMLS
from the machine type code - they're now ignored in vhyp mode.  On the cp=
u
side we don't need to allow LPCR[RMLS] to be set on POWER9 in vhyp mode -
that was only there to allow the hack on the machine side.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_cpu_core.c | 10 +---------
 target/ppc/mmu-hash64.c |  8 --------
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index d09125d9af..36ed3a2b66 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -50,22 +50,14 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
      * the settings below ensure proper operations with TCG in absence o=
f
      * a real hypervisor.
      *
-     * Clearing VPM0 will also cause us to use RMOR in mmu-hash64.c for
-     * real mode accesses, which thankfully defaults to 0 and isn't
-     * accessible in guest mode.
-     *
      * Disable Power-saving mode Exit Cause exceptions for the CPU, so
      * we don't get spurious wakups before an RTAS start-cpu call.
      * For the same reason, set PSSCR_EC.
      */
-    lpcr &=3D ~(LPCR_VPM0 | LPCR_VPM1 | LPCR_ISL | LPCR_KBV | pcc->lpcr_=
pm);
+    lpcr &=3D ~(LPCR_VPM1 | LPCR_ISL | LPCR_KBV | pcc->lpcr_pm);
     lpcr |=3D LPCR_LPES0 | LPCR_LPES1;
     env->spr[SPR_PSSCR] |=3D PSSCR_EC;
=20
-    /* Set RMLS to the max (ie, 16G) */
-    lpcr &=3D ~LPCR_RMLS;
-    lpcr |=3D 1ull << LPCR_RMLS_SHIFT;
-
     ppc_store_lpcr(cpu, lpcr);
=20
     /* Set a full AMOR so guest can use the AMR as it sees fit */
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index e372c42add..caf47ad6fc 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -1126,14 +1126,6 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong =
val)
                       (LPCR_PECE_L_MASK & (LPCR_PDEE | LPCR_HDEE | LPCR_=
EEE |
                       LPCR_DEE | LPCR_OEE)) | LPCR_MER | LPCR_GTSE | LPC=
R_TC |
                       LPCR_HEIC | LPCR_LPES0 | LPCR_HVICE | LPCR_HDICE);
-        /*
-         * If we have a virtual hypervisor, we need to bring back RMLS. =
It
-         * doesn't exist on an actual P9 but that's all we know how to
-         * configure with softmmu at the moment
-         */
-        if (cpu->vhyp) {
-            lpcr |=3D (val & LPCR_RMLS);
-        }
         break;
     default:
         g_assert_not_reached();
--=20
2.24.1


