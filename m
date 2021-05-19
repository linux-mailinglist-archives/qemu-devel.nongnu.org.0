Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F967388ED2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:17:54 +0200 (CEST)
Received: from localhost ([::1]:42880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljM5B-0008Rx-7I
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhh-0002FU-SK; Wed, 19 May 2021 08:53:39 -0400
Received: from ozlabs.org ([203.11.71.1]:43805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhf-0001VL-5L; Wed, 19 May 2021 08:53:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnm5q53z9t5K; Wed, 19 May 2021 22:52:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428732;
 bh=IYhSONt3HOWROP9fH1P2QTeEPObXAsaix9l2v2Bmjac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F4ZlgN5pOWLDPXSSVu27PqlSQnyd+DDXWPG+YsjagQyVSzBrHioul7gYFoM4VVy2W
 YyQHTg3xBPgImiUz3hW67wxKv5vwrBbmETX+1LVZPG6TVgXZCVTrLeziKw6Oqvi3uh
 0wQYsf+zHMftt/RngsdjEVwIeaq9lmCPk03Hq2hE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 36/48] target/ppc: Use MMUAccessType in mmu-hash64.c
Date: Wed, 19 May 2021 22:51:36 +1000
Message-Id: <20210519125148.27720-37-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We must leave the 'int rwx' parameter to ppc_hash64_handle_mmu_fault
for now, but will clean that up later.

Signed-off-by: Ricgard Henderson <richard.henderson@linaro.org>
Message-Id: <20210518201146.794854-4-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-hash64.c | 61 ++++++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index d5b70ddc9c..f48b625f48 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -877,10 +877,12 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     hwaddr ptex;
     ppc_hash_pte64_t pte;
     int exec_prot, pp_prot, amr_prot, prot;
+    MMUAccessType access_type;
     int need_prot;
     hwaddr raddr;
 
     assert((rwx == 0) || (rwx == 1) || (rwx == 2));
+    access_type = rwx;
 
     /*
      * Note on LPCR usage: 970 uses HID4, but our special variant of
@@ -891,7 +893,7 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
      */
 
     /* 1. Handle real mode accesses */
-    if (((rwx == 2) && (msr_ir == 0)) || ((rwx != 2) && (msr_dr == 0))) {
+    if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
         /*
          * Translation is supposedly "off", but in real mode the top 4
          * effective address bits are (mostly) ignored
@@ -924,14 +926,19 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
             /* Emulated old-style RMO mode, bounds check against RMLS */
             if (raddr >= limit) {
-                if (rwx == 2) {
+                switch (access_type) {
+                case MMU_INST_FETCH:
                     ppc_hash64_set_isi(cs, SRR1_PROTFAULT);
-                } else {
-                    int dsisr = DSISR_PROTFAULT;
-                    if (rwx == 1) {
-                        dsisr |= DSISR_ISSTORE;
-                    }
-                    ppc_hash64_set_dsi(cs, eaddr, dsisr);
+                    break;
+                case MMU_DATA_LOAD:
+                    ppc_hash64_set_dsi(cs, eaddr, DSISR_PROTFAULT);
+                    break;
+                case MMU_DATA_STORE:
+                    ppc_hash64_set_dsi(cs, eaddr,
+                                       DSISR_PROTFAULT | DSISR_ISSTORE);
+                    break;
+                default:
+                    g_assert_not_reached();
                 }
                 return 1;
             }
@@ -954,13 +961,19 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
             exit(1);
         }
         /* Segment still not found, generate the appropriate interrupt */
-        if (rwx == 2) {
+        switch (access_type) {
+        case MMU_INST_FETCH:
             cs->exception_index = POWERPC_EXCP_ISEG;
             env->error_code = 0;
-        } else {
+            break;
+        case MMU_DATA_LOAD:
+        case MMU_DATA_STORE:
             cs->exception_index = POWERPC_EXCP_DSEG;
             env->error_code = 0;
             env->spr[SPR_DAR] = eaddr;
+            break;
+        default:
+            g_assert_not_reached();
         }
         return 1;
     }
@@ -968,7 +981,7 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 skip_slb_search:
 
     /* 3. Check for segment level no-execute violation */
-    if ((rwx == 2) && (slb->vsid & SLB_VSID_N)) {
+    if (access_type == MMU_INST_FETCH && (slb->vsid & SLB_VSID_N)) {
         ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
         return 1;
     }
@@ -976,14 +989,18 @@ skip_slb_search:
     /* 4. Locate the PTE in the hash table */
     ptex = ppc_hash64_htab_lookup(cpu, slb, eaddr, &pte, &apshift);
     if (ptex == -1) {
-        if (rwx == 2) {
+        switch (access_type) {
+        case MMU_INST_FETCH:
             ppc_hash64_set_isi(cs, SRR1_NOPTE);
-        } else {
-            int dsisr = DSISR_NOPTE;
-            if (rwx == 1) {
-                dsisr |= DSISR_ISSTORE;
-            }
-            ppc_hash64_set_dsi(cs, eaddr, dsisr);
+            break;
+        case MMU_DATA_LOAD:
+            ppc_hash64_set_dsi(cs, eaddr, DSISR_NOPTE);
+            break;
+        case MMU_DATA_STORE:
+            ppc_hash64_set_dsi(cs, eaddr, DSISR_NOPTE | DSISR_ISSTORE);
+            break;
+        default:
+            g_assert_not_reached();
         }
         return 1;
     }
@@ -997,11 +1014,11 @@ skip_slb_search:
     amr_prot = ppc_hash64_amr_prot(cpu, pte);
     prot = exec_prot & pp_prot & amr_prot;
 
-    need_prot = prot_for_access_type(rwx);
+    need_prot = prot_for_access_type(access_type);
     if (need_prot & ~prot) {
         /* Access right violation */
         qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
-        if (rwx == 2) {
+        if (access_type == MMU_INST_FETCH) {
             int srr1 = 0;
             if (PAGE_EXEC & ~exec_prot) {
                 srr1 |= SRR1_NOEXEC_GUARD; /* Access violates noexec or guard */
@@ -1017,7 +1034,7 @@ skip_slb_search:
             if (need_prot & ~pp_prot) {
                 dsisr |= DSISR_PROTFAULT;
             }
-            if (rwx == 1) {
+            if (access_type == MMU_DATA_STORE) {
                 dsisr |= DSISR_ISSTORE;
             }
             if (need_prot & ~amr_prot) {
@@ -1036,7 +1053,7 @@ skip_slb_search:
         ppc_hash64_set_r(cpu, ptex, pte.pte1);
     }
     if (!(pte.pte1 & HPTE64_R_C)) {
-        if (rwx == 1) {
+        if (access_type == MMU_DATA_STORE) {
             ppc_hash64_set_c(cpu, ptex, pte.pte1);
         } else {
             /*
-- 
2.31.1


