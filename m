Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D4176DAD
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 04:49:13 +0100 (CET)
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8yYS-0005IW-4o
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 22:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35274)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j8yTU-0004ho-UO
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:44:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j8yTT-0002Ei-FR
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:44:04 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:45057)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j8yTT-0002Bu-4w; Mon, 02 Mar 2020 22:44:03 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48WjY628plz9sSs; Tue,  3 Mar 2020 14:43:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1583207034;
 bh=lW+OJt/EIRex+r1jIEvF3RrwgcZ9EFrGxf6iw6OaAyk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oP7C8mA/w4bSdl6e9989fHca687CJrmSdmwwg6+jzKSHRHY+gmpknDBUQSYu12EEK
 8mgdINew4u2eHJBOmBTjkaYR+BxWvvj0I013UW2rObTlxi3cNMvBKNfHHzMPgeWHWO
 gLG/BCIoAVJVywQmHpwx4800g4+fT/Mtd+LVYTr4=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org, clg@kaod.org, qemu-devel@nongnu.org, groug@kaod.org
Subject: [PATCH v7 11/17] target/ppc: Don't store VRMA SLBE persistently
Date: Tue,  3 Mar 2020 14:43:45 +1100
Message-Id: <20200303034351.333043-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200303034351.333043-1-david@gibson.dropbear.id.au>
References: <20200303034351.333043-1-david@gibson.dropbear.id.au>
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
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, farosas@linux.ibm.com,
 aik@ozlabs.ru, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, paulus@samba.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, we construct the SLBE used for VRMA translations when the LPCR
is written (which controls some bits in the SLBE), then use it later for
translations.

This is a bit complex and confusing - simplify it by simply constructing
the SLBE directly from the LPCR when we need it.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h        |  3 --
 target/ppc/mmu-hash64.c | 92 ++++++++++++++++-------------------------
 2 files changed, 35 insertions(+), 60 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f9871b1233..5a55fb02bd 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1044,9 +1044,6 @@ struct CPUPPCState {
     uint32_t flags;
     uint64_t insns_flags;
     uint64_t insns_flags2;
-#if defined(TARGET_PPC64)
-    ppc_slb_t vrma_slb;
-#endif
=20
     int error_code;
     uint32_t pending_interrupts;
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 4fd7b7ee74..34f6009b1e 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -784,11 +784,41 @@ static target_ulong rmls_limit(PowerPCCPU *cpu)
     return rma_sizes[rmls];
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
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
+    ppc_slb_t vrma_slbe;
     ppc_slb_t *slb;
     unsigned apshift;
     hwaddr ptex;
@@ -827,8 +857,8 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vadd=
r eaddr,
             }
         } else if (ppc_hash64_use_vrma(env)) {
             /* Emulated VRMA mode */
-            slb =3D &env->vrma_slb;
-            if (!slb->sps) {
+            slb =3D &vrma_slbe;
+            if (build_vrma_slbe(cpu, slb) !=3D 0) {
                 /* Invalid VRMA setup, machine check */
                 cs->exception_index =3D POWERPC_EXCP_MCHECK;
                 env->error_code =3D 0;
@@ -976,6 +1006,7 @@ skip_slb_search:
 hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr=
)
 {
     CPUPPCState *env =3D &cpu->env;
+    ppc_slb_t vrma_slbe;
     ppc_slb_t *slb;
     hwaddr ptex, raddr;
     ppc_hash_pte64_t pte;
@@ -997,8 +1028,8 @@ hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cp=
u, target_ulong addr)
             return raddr | env->spr[SPR_HRMOR];
         } else if (ppc_hash64_use_vrma(env)) {
             /* Emulated VRMA mode */
-            slb =3D &env->vrma_slb;
-            if (!slb->sps) {
+            slb =3D &vrma_slbe;
+            if (build_vrma_slbe(cpu, slb) !=3D 0) {
                 return -1;
             }
         } else {
@@ -1037,65 +1068,12 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, t=
arget_ulong ptex,
     cpu->env.tlb_need_flush =3D TLB_NEED_GLOBAL_FLUSH | TLB_NEED_LOCAL_F=
LUSH;
 }
=20
-static void ppc_hash64_update_vrma(PowerPCCPU *cpu)
-{
-    CPUPPCState *env =3D &cpu->env;
-    const PPCHash64SegmentPageSizes *sps =3D NULL;
-    target_ulong esid, vsid, lpcr;
-    ppc_slb_t *slb =3D &env->vrma_slb;
-    uint32_t vrmasd;
-    int i;
-
-    /* First clear it */
-    slb->esid =3D slb->vsid =3D 0;
-    slb->sps =3D NULL;
-
-    /* Is VRMA enabled ? */
-    if (!ppc_hash64_use_vrma(env)) {
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
-        }
-    }
-
-    if (!sps) {
-        error_report("Bad page size encoding esid 0x"TARGET_FMT_lx
-                     " vsid 0x"TARGET_FMT_lx, esid, vsid);
-        return;
-    }
-
-    slb->vsid =3D vsid;
-    slb->esid =3D esid;
-    slb->sps =3D sps;
-}
-
 void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
 {
     PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
     CPUPPCState *env =3D &cpu->env;
=20
     env->spr[SPR_LPCR] =3D val & pcc->lpcr_mask;
-    ppc_hash64_update_vrma(cpu);
 }
=20
 void helper_store_lpcr(CPUPPCState *env, target_ulong val)
--=20
2.24.1


