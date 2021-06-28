Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D947C3B5F39
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:39:21 +0200 (CEST)
Received: from localhost ([::1]:33076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrTs-0006yx-T6
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lxrRR-0004Ea-SR; Mon, 28 Jun 2021 09:36:49 -0400
Received: from [201.28.113.2] (port=33408 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lxrRQ-0003mD-4F; Mon, 28 Jun 2021 09:36:49 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 28 Jun 2021 10:36:32 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 8372F800976;
 Mon, 28 Jun 2021 10:36:32 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] target/ppc: changed ppc_hash64_xlate to use mmu_idx
Date: Mon, 28 Jun 2021 10:36:10 -0300
Message-Id: <20210628133610.1143-4-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210628133610.1143-1-bruno.larsen@eldorado.org.br>
References: <20210628133610.1143-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 28 Jun 2021 13:36:32.0669 (UTC)
 FILETIME=[9BA504D0:01D76C22]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changed hash64 address translation to use the supplied mmu_idx instead
of using the one stored in the msr, for parity purposes (other book3s
MMUs already use it).

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index a3381e1aa0..0816c889a3 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2916,7 +2916,7 @@ static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     case POWERPC_MMU_2_06:
     case POWERPC_MMU_2_07:
         return ppc_hash64_xlate(cpu, eaddr, access_type,
-                                raddrp, psizep, protp, guest_visible);
+                                raddrp, psizep, protp, mmu_idx, guest_visible);
 #endif
 
     case POWERPC_MMU_32B:
-- 
2.17.1


