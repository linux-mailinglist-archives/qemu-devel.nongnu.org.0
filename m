Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B730C163A1A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 03:24:38 +0100 (CET)
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4F2T-0000sS-RZ
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 21:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4Esd-0004Bz-V1
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 21:14:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4Esc-00019W-Lb
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 21:14:27 -0500
Received: from ozlabs.org ([203.11.71.1]:35139)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4Esa-00015W-Rs; Tue, 18 Feb 2020 21:14:26 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48Mh9g4bs3z9sSY; Wed, 19 Feb 2020 13:14:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582078455;
 bh=mVlgd7ajPj+8NNbAkYBXktzQTbG0IvuomClbgoT7PDU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VVtVcZw1CxnwVfH1f+csOLRIgud17w6knuPq0yUwWTkZPwO/gq4bAjcGNEdbZBJ34
 9j/4NF0fYo6TEhOg+NTybcYtmHmsv8xKoYHotvvbxR9ktG/jmIFLodXDuOTjWk22De
 sBOThB3I4F2JQPuhBIPIWg3se7HrUMgysQIycczM=
From: David Gibson <david@gibson.dropbear.id.au>
To: groug@kaod.org,
	clg@kaod.org,
	philmd@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v4 11/12] target/ppc: Streamline construction of VRMA SLB entry
Date: Wed, 19 Feb 2020 13:14:08 +1100
Message-Id: <20200219021409.21332-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219021409.21332-1-david@gibson.dropbear.id.au>
References: <20200219021409.21332-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, paulus@samba.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When in VRMA mode (i.e. a guest thinks it has the MMU off, but the
hypervisor is still applying translation) we use a special SLB entry,
rather than looking up an SLBE by address as we do when guest translation
is on.

We build that special entry in ppc_hash64_update_vrma() along with some
logic for handling some non-VRMA cases.  Split the actual build of the
VRMA SLBE into a separate helper and streamline it a bit.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-hash64.c | 78 ++++++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 203a41cca1..5ce7cc8359 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -791,6 +791,39 @@ static target_ulong rmls_limit(PowerPCCPU *cpu)
     }
 }
=20
+static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
+{
+    CPUPPCState *env =3D &cpu->env;
+    target_ulong lpcr =3D env->spr[SPR_LPCR];
+    uint32_t vrmasd =3D (lpcr & LPCR_VRMASD) >> LPCR_VRMASD_SHIFT;
+    target_ulong vsid =3D SLB_VSID_VRMA | ((vrmasd << 4) & SLB_VSID_LLP_=
MASK);
+    int i;
+
+    /*
+     * Make one up. Mostly ignore the ESID which will not be needed
+     * for translation
+     */
+    for (i =3D 0; i < PPC_PAGE_SIZES_MAX_SZ; i++) {
+        const PPCHash64SegmentPageSizes *sps =3D &cpu->hash64_opts->sps[=
i];
+
+        if (!sps->page_shift) {
+            break;
+        }
+
+        if ((vsid & SLB_VSID_LLP_MASK) =3D=3D sps->slb_enc) {
+            slb->esid =3D SLB_ESID_V;
+            slb->vsid =3D vsid;
+            slb->sps =3D sps;
+            return 0;
+        }
+    }
+
+    error_report("Bad page size encoding in LPCR[VRMASD]; LPCR=3D0x"
+                 TARGET_FMT_lx"\n", lpcr);
+
+    return -1;
+}
+
 int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
                                 int rwx, int mmu_idx)
 {
@@ -1046,53 +1079,18 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, t=
arget_ulong ptex,
 static void ppc_hash64_update_vrma(PowerPCCPU *cpu)
 {
     CPUPPCState *env =3D &cpu->env;
-    const PPCHash64SegmentPageSizes *sps =3D NULL;
-    target_ulong esid, vsid, lpcr;
     ppc_slb_t *slb =3D &env->vrma_slb;
-    uint32_t vrmasd;
-    int i;
-
-    /* First clear it */
-    slb->esid =3D slb->vsid =3D 0;
-    slb->sps =3D NULL;
=20
     /* Is VRMA enabled ? */
     if (ppc_hash64_use_vrma(env)) {
-        return;
-    }
-
-    /*
-     * Make one up. Mostly ignore the ESID which will not be needed
-     * for translation
-     */
-    lpcr =3D env->spr[SPR_LPCR];
-    vsid =3D SLB_VSID_VRMA;
-    vrmasd =3D (lpcr & LPCR_VRMASD) >> LPCR_VRMASD_SHIFT;
-    vsid |=3D (vrmasd << 4) & (SLB_VSID_L | SLB_VSID_LP);
-    esid =3D SLB_ESID_V;
-
-    for (i =3D 0; i < PPC_PAGE_SIZES_MAX_SZ; i++) {
-        const PPCHash64SegmentPageSizes *sps1 =3D &cpu->hash64_opts->sps=
[i];
-
-        if (!sps1->page_shift) {
-            break;
-        }
-
-        if ((vsid & SLB_VSID_LLP_MASK) =3D=3D sps1->slb_enc) {
-            sps =3D sps1;
-            break;
+        if (build_vrma_slbe(cpu, slb) =3D=3D 0) {
+            return;
         }
     }
=20
-    if (!sps) {
-        error_report("Bad page size encoding esid 0x"TARGET_FMT_lx
-                     " vsid 0x"TARGET_FMT_lx, esid, vsid);
-        return;
-    }
-
-    slb->vsid =3D vsid;
-    slb->esid =3D esid;
-    slb->sps =3D sps;
+    /* Otherwise, clear it to indicate error */
+    slb->esid =3D slb->vsid =3D 0;
+    slb->sps =3D NULL;
 }
=20
 void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
--=20
2.24.1


