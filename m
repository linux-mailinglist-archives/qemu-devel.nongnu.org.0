Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560341655A8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 04:30:19 +0100 (CET)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4cXa-0008Qd-BE
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 22:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4cRA-0004hT-67
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 22:23:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4cR8-0008O1-KH
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 22:23:40 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:41493 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4cR8-0008Lc-8q; Wed, 19 Feb 2020 22:23:38 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NKg14C5jz9sSb; Thu, 20 Feb 2020 14:23:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582169005;
 bh=G9vVCBQAxL325dmu2RbgIx5Jm0SP2MYRe+FEiLxyaO4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mEi1Hdjy9ycQjWRge4BcINSs794W0lUQ5KkNflv/Rqd/7acOnV5qRTie6Tv3R7Pld
 SejIDBCRZyyCkZ7hcxrFgSkgV14XMbedJcK+TznrJmxmjfe5eY9ATDJe4h+vtafr3V
 07RDcM9WREjc05jgse91yLqfiVE04PpJZOCuTx2g=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org,
	groug@kaod.org,
	clg@kaod.org
Subject: [PATCH v5 14/18] spapr,ppc: Simplify signature of kvmppc_rma_size()
Date: Thu, 20 Feb 2020 14:23:12 +1100
Message-Id: <20200220032317.96884-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220032317.96884-1-david@gibson.dropbear.id.au>
References: <20200220032317.96884-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Cedric Le Goater <clg@fr.ibm.com>,
 paulus@samba.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function calculates the maximum size of the RMA as implied by the
host's page size of structure of the VRMA (there are a number of other
constraints on the RMA size which will supersede this one in many
circumstances).

The current interface takes the current RMA size estimate, and clamps it
to the VRMA derived size.  The only current caller passes in an arguably
wrong value (it will match the current RMA estimate in some but not all
cases).

We want to fix that, but for now just keep concerns separated by having t=
he
KVM helper function just return the VRMA derived limit, and let the calle=
r
combine it with other constraints.  We call the new function
kvmppc_vrma_limit() to more clearly indicate its limited responsibility.

The helper should only ever be called in the KVM enabled case, so replace
its !CONFIG_KVM stub with an assert() rather than a dummy value.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Cedric Le Goater <clg@fr.ibm.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 hw/ppc/spapr.c       | 5 +++--
 target/ppc/kvm.c     | 5 ++---
 target/ppc/kvm_ppc.h | 7 +++----
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 272a270b7a..b68d80ba69 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1586,8 +1586,9 @@ void spapr_setup_hpt_and_vrma(SpaprMachineState *sp=
apr)
     spapr_reallocate_hpt(spapr, hpt_shift, &error_fatal);
=20
     if (spapr->vrma_adjust) {
-        spapr->rma_size =3D kvmppc_rma_size(spapr_node0_size(MACHINE(spa=
pr)),
-                                          spapr->htab_shift);
+        hwaddr vrma_limit =3D kvmppc_vrma_limit(spapr->htab_shift);
+
+        spapr->rma_size =3D MIN(spapr_node0_size(MACHINE(spapr)), vrma_l=
imit);
     }
 }
=20
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 7f44b1aa1a..597f72be1b 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2113,7 +2113,7 @@ void kvmppc_error_append_smt_possible_hint(Error *c=
onst *errp)
=20
=20
 #ifdef TARGET_PPC64
-uint64_t kvmppc_rma_size(uint64_t current_size, unsigned int hash_shift)
+uint64_t kvmppc_vrma_limit(unsigned int hash_shift)
 {
     struct kvm_ppc_smmu_info info;
     long rampagesize, best_page_shift;
@@ -2140,8 +2140,7 @@ uint64_t kvmppc_rma_size(uint64_t current_size, uns=
igned int hash_shift)
         }
     }
=20
-    return MIN(current_size,
-               1ULL << (best_page_shift + hash_shift - 7));
+    return 1ULL << (best_page_shift + hash_shift - 7);
 }
 #endif
=20
diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index 9e4f2357cc..332fa0aa1c 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -47,7 +47,7 @@ void *kvmppc_create_spapr_tce(uint32_t liobn, uint32_t =
page_shift,
                               int *pfd, bool need_vfio);
 int kvmppc_remove_spapr_tce(void *table, int pfd, uint32_t window_size);
 int kvmppc_reset_htab(int shift_hint);
-uint64_t kvmppc_rma_size(uint64_t current_size, unsigned int hash_shift)=
;
+uint64_t kvmppc_vrma_limit(unsigned int hash_shift);
 bool kvmppc_has_cap_spapr_vfio(void);
 #endif /* !CONFIG_USER_ONLY */
 bool kvmppc_has_cap_epr(void);
@@ -255,10 +255,9 @@ static inline int kvmppc_reset_htab(int shift_hint)
     return 0;
 }
=20
-static inline uint64_t kvmppc_rma_size(uint64_t current_size,
-                                       unsigned int hash_shift)
+static inline uint64_t kvmppc_vrma_limit(unsigned int hash_shift)
 {
-    return ram_size;
+    g_assert_not_reached();
 }
=20
 static inline bool kvmppc_hpt_needs_host_contiguous_pages(void)
--=20
2.24.1


