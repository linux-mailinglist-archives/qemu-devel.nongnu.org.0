Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427E93C1EF1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:32:55 +0200 (CEST)
Received: from localhost ([::1]:52368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1j8A-0006qr-Ag
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itl-0001Eg-2z; Fri, 09 Jul 2021 01:18:01 -0400
Received: from ozlabs.org ([203.11.71.1]:36813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iti-00020q-Sw; Fri, 09 Jul 2021 01:18:00 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHf0DCmz9t2b; Fri,  9 Jul 2021 15:17:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807854;
 bh=dt8QWSKUXhXi3hxKjqNx/02uIHryLZDde/rSs0c2ub8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eWE63xwA4Bfl2XA+ljkTBHpixuSOInG/OMRpX/Zi+OAybmrQ8hDeVyCeI2DPlJ4PS
 f2WZXI//cXUDIMqeXdCWTAvxz08bb8b/8Zz9ZW9FiOBMSZxgYdpanh5GJCjDJL6kXQ
 TB/8jI2tJhGW9fcOw+HH3v4W7EMTR514hZQEpcUA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 17/33] target/ppc: changed ppc_hash64_xlate to use mmu_idx
Date: Fri,  9 Jul 2021 15:17:12 +1000
Message-Id: <20210709051728.170203-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aik@ozlabs.ru, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Changed hash64 address translation to use the supplied mmu_idx instead
of using the one stored in the msr, for parity purposes (other book3s
MMUs already use it).

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210628133610.1143-4-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-hash64.c | 43 ++++++++++++++++++++---------------------
 target/ppc/mmu-hash64.h |  2 +-
 target/ppc/mmu_helper.c |  2 +-
 3 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index c1b98a97e9..19832c4b46 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -366,10 +366,9 @@ static inline int ppc_hash64_pte_noexec_guard(PowerPCCPU *cpu,
 }
 
 /* Check Basic Storage Protection */
-static int ppc_hash64_pte_prot(PowerPCCPU *cpu,
+static int ppc_hash64_pte_prot(int mmu_idx,
                                ppc_slb_t *slb, ppc_hash_pte64_t pte)
 {
-    CPUPPCState *env = &cpu->env;
     unsigned pp, key;
     /*
      * Some pp bit combinations have undefined behaviour, so default
@@ -377,7 +376,7 @@ static int ppc_hash64_pte_prot(PowerPCCPU *cpu,
      */
     int prot = 0;
 
-    key = !!(msr_pr ? (slb->vsid & SLB_VSID_KP)
+    key = !!(mmuidx_pr(mmu_idx) ? (slb->vsid & SLB_VSID_KP)
              : (slb->vsid & SLB_VSID_KS));
     pp = (pte.pte1 & HPTE64_R_PP) | ((pte.pte1 & HPTE64_R_PP0) >> 61);
 
@@ -744,17 +743,17 @@ static bool ppc_hash64_use_vrma(CPUPPCState *env)
     }
 }
 
-static void ppc_hash64_set_isi(CPUState *cs, uint64_t error_code)
+static void ppc_hash64_set_isi(CPUState *cs, int mmu_idx, uint64_t error_code)
 {
     CPUPPCState *env = &POWERPC_CPU(cs)->env;
     bool vpm;
 
-    if (msr_ir) {
+    if (!mmuidx_real(mmu_idx)) {
         vpm = !!(env->spr[SPR_LPCR] & LPCR_VPM1);
     } else {
         vpm = ppc_hash64_use_vrma(env);
     }
-    if (vpm && !msr_hv) {
+    if (vpm && !mmuidx_hv(mmu_idx)) {
         cs->exception_index = POWERPC_EXCP_HISI;
     } else {
         cs->exception_index = POWERPC_EXCP_ISI;
@@ -762,17 +761,17 @@ static void ppc_hash64_set_isi(CPUState *cs, uint64_t error_code)
     env->error_code = error_code;
 }
 
-static void ppc_hash64_set_dsi(CPUState *cs, uint64_t dar, uint64_t dsisr)
+static void ppc_hash64_set_dsi(CPUState *cs, int mmu_idx, uint64_t dar, uint64_t dsisr)
 {
     CPUPPCState *env = &POWERPC_CPU(cs)->env;
     bool vpm;
 
-    if (msr_dr) {
+    if (!mmuidx_real(mmu_idx)) {
         vpm = !!(env->spr[SPR_LPCR] & LPCR_VPM1);
     } else {
         vpm = ppc_hash64_use_vrma(env);
     }
-    if (vpm && !msr_hv) {
+    if (vpm && !mmuidx_hv(mmu_idx)) {
         cs->exception_index = POWERPC_EXCP_HDSI;
         env->spr[SPR_HDAR] = dar;
         env->spr[SPR_HDSISR] = dsisr;
@@ -874,7 +873,7 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
 }
 
 bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
-                      hwaddr *raddrp, int *psizep, int *protp,
+                      hwaddr *raddrp, int *psizep, int *protp, int mmu_idx,
                       bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
@@ -897,7 +896,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
      */
 
     /* 1. Handle real mode accesses */
-    if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
+    if (mmuidx_real(mmu_idx)) {
         /*
          * Translation is supposedly "off", but in real mode the top 4
          * effective address bits are (mostly) ignored
@@ -909,7 +908,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
              * In virtual hypervisor mode, there's nothing to do:
              *   EA == GPA == qemu guest address
              */
-        } else if (msr_hv || !env->has_hv_mode) {
+        } else if (mmuidx_hv(mmu_idx) || !env->has_hv_mode) {
             /* In HV mode, add HRMOR if top EA bit is clear */
             if (!(eaddr >> 63)) {
                 raddr |= env->spr[SPR_HRMOR];
@@ -937,13 +936,13 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
                 }
                 switch (access_type) {
                 case MMU_INST_FETCH:
-                    ppc_hash64_set_isi(cs, SRR1_PROTFAULT);
+                    ppc_hash64_set_isi(cs, mmu_idx, SRR1_PROTFAULT);
                     break;
                 case MMU_DATA_LOAD:
-                    ppc_hash64_set_dsi(cs, eaddr, DSISR_PROTFAULT);
+                    ppc_hash64_set_dsi(cs, mmu_idx, eaddr, DSISR_PROTFAULT);
                     break;
                 case MMU_DATA_STORE:
-                    ppc_hash64_set_dsi(cs, eaddr,
+                    ppc_hash64_set_dsi(cs, mmu_idx, eaddr,
                                        DSISR_PROTFAULT | DSISR_ISSTORE);
                     break;
                 default:
@@ -996,7 +995,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     /* 3. Check for segment level no-execute violation */
     if (access_type == MMU_INST_FETCH && (slb->vsid & SLB_VSID_N)) {
         if (guest_visible) {
-            ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
+            ppc_hash64_set_isi(cs, mmu_idx, SRR1_NOEXEC_GUARD);
         }
         return false;
     }
@@ -1009,13 +1008,13 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
         }
         switch (access_type) {
         case MMU_INST_FETCH:
-            ppc_hash64_set_isi(cs, SRR1_NOPTE);
+            ppc_hash64_set_isi(cs, mmu_idx, SRR1_NOPTE);
             break;
         case MMU_DATA_LOAD:
-            ppc_hash64_set_dsi(cs, eaddr, DSISR_NOPTE);
+            ppc_hash64_set_dsi(cs, mmu_idx, eaddr, DSISR_NOPTE);
             break;
         case MMU_DATA_STORE:
-            ppc_hash64_set_dsi(cs, eaddr, DSISR_NOPTE | DSISR_ISSTORE);
+            ppc_hash64_set_dsi(cs, mmu_idx, eaddr, DSISR_NOPTE | DSISR_ISSTORE);
             break;
         default:
             g_assert_not_reached();
@@ -1028,7 +1027,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     /* 5. Check access permissions */
 
     exec_prot = ppc_hash64_pte_noexec_guard(cpu, pte);
-    pp_prot = ppc_hash64_pte_prot(cpu, slb, pte);
+    pp_prot = ppc_hash64_pte_prot(mmu_idx, slb, pte);
     amr_prot = ppc_hash64_amr_prot(cpu, pte);
     prot = exec_prot & pp_prot & amr_prot;
 
@@ -1049,7 +1048,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
             if (PAGE_EXEC & ~amr_prot) {
                 srr1 |= SRR1_IAMR; /* Access violates virt pg class key prot */
             }
-            ppc_hash64_set_isi(cs, srr1);
+            ppc_hash64_set_isi(cs, mmu_idx, srr1);
         } else {
             int dsisr = 0;
             if (need_prot & ~pp_prot) {
@@ -1061,7 +1060,7 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
             if (need_prot & ~amr_prot) {
                 dsisr |= DSISR_AMR;
             }
-            ppc_hash64_set_dsi(cs, eaddr, dsisr);
+            ppc_hash64_set_dsi(cs, mmu_idx, eaddr, dsisr);
         }
         return false;
     }
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index 9f338e1fe9..c5b2f97ff7 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -8,7 +8,7 @@ void dump_slb(PowerPCCPU *cpu);
 int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
                   target_ulong esid, target_ulong vsid);
 bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
-                      hwaddr *raddrp, int *psizep, int *protp,
+                      hwaddr *raddrp, int *psizep, int *protp, int mmu_idx,
                       bool guest_visible);
 void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
                                target_ulong pte_index,
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 46b4afce54..819ee27b62 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2908,7 +2908,7 @@ static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     case POWERPC_MMU_2_06:
     case POWERPC_MMU_2_07:
         return ppc_hash64_xlate(cpu, eaddr, access_type,
-                                raddrp, psizep, protp, guest_visible);
+                                raddrp, psizep, protp, mmu_idx, guest_visible);
 #endif
 
     case POWERPC_MMU_32B:
-- 
2.31.1


