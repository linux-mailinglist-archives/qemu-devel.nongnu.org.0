Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D27F51B059
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:21:09 +0200 (CEST)
Received: from localhost ([::1]:42926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMQm-0003fO-LZ
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmME6-0001Qc-UH; Wed, 04 May 2022 17:08:02 -0400
Received: from [187.72.171.209] (port=62190 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmME3-0007Ne-Vu; Wed, 04 May 2022 17:08:02 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 4 May 2022 18:07:47 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 96D39800066;
 Wed,  4 May 2022 18:07:47 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v4 03/22] target/ppc: Remove msr_pr macro
Date: Wed,  4 May 2022 18:05:22 -0300
Message-Id: <20220504210541.115256-4-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
References: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 May 2022 21:07:48.0024 (UTC)
 FILETIME=[01DED380:01D85FFB]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

msr_pr macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ppc/pegasos2.c        |  2 +-
 hw/ppc/spapr.c           |  2 +-
 target/ppc/cpu.h         |  4 +++-
 target/ppc/cpu_init.c    |  4 ++--
 target/ppc/excp_helper.c |  8 +++++---
 target/ppc/mem_helper.c  |  5 +++--
 target/ppc/mmu-radix64.c |  5 +++--
 target/ppc/mmu_common.c  | 23 ++++++++++++-----------
 8 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 56bf203dfd..9411ca6b16 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -461,7 +461,7 @@ static void pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
     /* The TCG path should also be holding the BQL at this point */
     g_assert(qemu_mutex_iothread_locked());
 
-    if (msr_pr) {
+    if (FIELD_EX64(env->msr, MSR, PR)) {
         qemu_log_mask(LOG_GUEST_ERROR, "Hypercall made with MSR[PR]=1\n");
         env->gpr[3] = H_PRIVILEGE;
     } else if (env->gpr[3] == KVMPPC_H_RTAS) {
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 22569305d2..fe9937e811 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1269,7 +1269,7 @@ static void emulate_spapr_hypercall(PPCVirtualHypervisor *vhyp,
 
     g_assert(!vhyp_cpu_in_nested(cpu));
 
-    if (msr_pr) {
+    if (FIELD_EX64(env->msr, MSR, PR)) {
         hcall_dprintf("Hypercall made with MSR[PR]=1\n");
         env->gpr[3] = H_PRIVILEGE;
     } else {
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 112b456220..8f1dc4cb15 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -25,6 +25,7 @@
 #include "exec/cpu-defs.h"
 #include "cpu-qom.h"
 #include "qom/object.h"
+#include "hw/registerfields.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
@@ -353,6 +354,8 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+FIELD(MSR, PR, MSR_PR, 1)
+
 /* PMU bits */
 #define MMCR0_FC     PPC_BIT(32)         /* Freeze Counters  */
 #define MMCR0_PMAO   PPC_BIT(56)         /* Perf Monitor Alert Ocurred */
@@ -474,7 +477,6 @@ typedef enum {
 #define msr_ce   ((env->msr >> MSR_CE)   & 1)
 #define msr_ile  ((env->msr >> MSR_ILE)  & 1)
 #define msr_ee   ((env->msr >> MSR_EE)   & 1)
-#define msr_pr   ((env->msr >> MSR_PR)   & 1)
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_me   ((env->msr >> MSR_ME)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d42e2ba8e0..ac16a64846 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6303,7 +6303,7 @@ static bool cpu_has_work_POWER9(CPUState *cs)
         if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
             (env->spr[SPR_LPCR] & LPCR_EEE)) {
             bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (heic == 0 || !msr_hv || msr_pr) {
+            if (!heic || !msr_hv || FIELD_EX64(env->msr, MSR, PR)) {
                 return true;
             }
         }
@@ -6517,7 +6517,7 @@ static bool cpu_has_work_POWER10(CPUState *cs)
         if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
             (env->spr[SPR_LPCR] & LPCR_EEE)) {
             bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (heic == 0 || !msr_hv || msr_pr) {
+            if (!heic || !msr_hv || FIELD_EX64(env->msr, MSR, PR)) {
                 return true;
             }
         }
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index d3e2cfcd71..7e8e34ef06 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1738,7 +1738,8 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
         bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
         /* HEIC blocks delivery to the hypervisor */
-        if ((async_deliver && !(heic && msr_hv && !msr_pr)) ||
+        if ((async_deliver && !(heic && msr_hv &&
+            !FIELD_EX64(env->msr, MSR, PR))) ||
             (env->has_hv_mode && msr_hv == 0 && !lpes0)) {
             if (books_vhyp_promotes_external_to_hvirt(cpu)) {
                 powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
@@ -1818,7 +1819,8 @@ static void ppc_hw_interrupt(CPUPPCState *env)
              * EBB exception must be taken in problem state and
              * with BESCR_GE set.
              */
-            if (msr_pr == 1 && env->spr[SPR_BESCR] & BESCR_GE) {
+            if (FIELD_EX64(env->msr, MSR, PR) &&
+                (env->spr[SPR_BESCR] & BESCR_GE)) {
                 env->pending_interrupts &= ~(1 << PPC_INTERRUPT_EBB);
 
                 if (env->spr[SPR_BESCR] & BESCR_PMEO) {
@@ -2094,7 +2096,7 @@ static void do_ebb(CPUPPCState *env, int ebb_excp)
         env->spr[SPR_BESCR] |= BESCR_EEO;
     }
 
-    if (msr_pr == 1) {
+    if (FIELD_EX64(env->msr, MSR, PR)) {
         powerpc_excp(cpu, ebb_excp);
     } else {
         env->pending_interrupts |= 1 << PPC_INTERRUPT_EBB;
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index c4ff8fd632..fba7f84b7a 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -613,10 +613,11 @@ void helper_tbegin(CPUPPCState *env)
         (1ULL << TEXASR_FAILURE_PERSISTENT) |
         (1ULL << TEXASR_NESTING_OVERFLOW) |
         (msr_hv << TEXASR_PRIVILEGE_HV) |
-        (msr_pr << TEXASR_PRIVILEGE_PR) |
+        (FIELD_EX64(env->msr, MSR, PR) << TEXASR_PRIVILEGE_PR) |
         (1ULL << TEXASR_FAILURE_SUMMARY) |
         (1ULL << TEXASR_TFIAR_EXACT);
-    env->spr[SPR_TFIAR] = env->nip | (msr_hv << 1) | msr_pr;
+    env->spr[SPR_TFIAR] = env->nip | (msr_hv << 1) |
+                          FIELD_EX64(env->msr, MSR, PR);
     env->spr[SPR_TFHAR] = env->nip + 4;
     env->crf[0] = 0xB; /* 0b1010 = transaction failure */
 }
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 5414fd63c1..e88f51fd34 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -191,12 +191,13 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu, MMUAccessType access_type,
     }
 
     /* Determine permissions allowed by Encoded Access Authority */
-    if (!partition_scoped && (pte & R_PTE_EAA_PRIV) && msr_pr) {
+    if (!partition_scoped && (pte & R_PTE_EAA_PRIV) &&
+        FIELD_EX64(env->msr, MSR, PR)) {
         *prot = 0;
     } else if (mmuidx_pr(mmu_idx) || (pte & R_PTE_EAA_PRIV) ||
                partition_scoped) {
         *prot = ppc_radix64_get_prot_eaa(pte);
-    } else { /* !msr_pr && !(pte & R_PTE_EAA_PRIV) && !partition_scoped */
+    } else { /* !MSR_PR && !(pte & R_PTE_EAA_PRIV) && !partition_scoped */
         *prot = ppc_radix64_get_prot_eaa(pte);
         *prot &= ppc_radix64_get_prot_amr(cpu); /* Least combined permissions */
     }
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index e9c5b14c0f..6ef8b1c00d 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -273,8 +273,8 @@ static inline void bat_size_prot(CPUPPCState *env, target_ulong *blp,
     bl = (*BATu & 0x00001FFC) << 15;
     valid = 0;
     prot = 0;
-    if (((msr_pr == 0) && (*BATu & 0x00000002)) ||
-        ((msr_pr != 0) && (*BATu & 0x00000001))) {
+    if ((!FIELD_EX64(env->msr, MSR, PR) && (*BATu & 0x00000002)) ||
+        (FIELD_EX64(env->msr, MSR, PR) && (*BATu & 0x00000001))) {
         valid = 1;
         pp = *BATl & 0x00000003;
         if (pp != 0) {
@@ -368,16 +368,17 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
     PowerPCCPU *cpu = env_archcpu(env);
     hwaddr hash;
     target_ulong vsid;
-    int ds, pr, target_page_bits;
+    int ds, target_page_bits;
+    bool pr;
     int ret;
     target_ulong sr, pgidx;
 
-    pr = msr_pr;
+    pr = FIELD_EX64(env->msr, MSR, PR);
     ctx->eaddr = eaddr;
 
     sr = env->sr[eaddr >> 28];
-    ctx->key = (((sr & 0x20000000) && (pr != 0)) ||
-                ((sr & 0x40000000) && (pr == 0))) ? 1 : 0;
+    ctx->key = (((sr & 0x20000000) && pr) ||
+                ((sr & 0x40000000) && !pr)) ? 1 : 0;
     ds = sr & 0x80000000 ? 1 : 0;
     ctx->nx = sr & 0x10000000 ? 1 : 0;
     vsid = sr & 0x00FFFFFF;
@@ -386,8 +387,8 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                   "Check segment v=" TARGET_FMT_lx " %d " TARGET_FMT_lx
                   " nip=" TARGET_FMT_lx " lr=" TARGET_FMT_lx
                   " ir=%d dr=%d pr=%d %d t=%d\n",
-                  eaddr, (int)(eaddr >> 28), sr, env->nip, env->lr, (int)msr_ir,
-                  (int)msr_dr, pr != 0 ? 1 : 0,
+                  eaddr, (int)(eaddr >> 28), sr, env->nip, env->lr,
+                  (int)msr_ir, (int)msr_dr, pr ? 1 : 0,
                   access_type == MMU_DATA_STORE, type);
     pgidx = (eaddr & ~SEGMENT_MASK_256M) >> target_page_bits;
     hash = vsid ^ pgidx;
@@ -530,7 +531,7 @@ static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
 
     ret = -1;
     raddr = (hwaddr)-1ULL;
-    pr = msr_pr;
+    pr = FIELD_EX64(env->msr, MSR, PR);
     for (i = 0; i < env->nb_tlb; i++) {
         tlb = &env->tlb.tlbe[i];
         if (ppcemb_tlb_check(env, tlb, &raddr, address,
@@ -618,7 +619,7 @@ static int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
 
 found_tlb:
 
-    if (msr_pr != 0) {
+    if (FIELD_EX64(env->msr, MSR, PR)) {
         prot2 = tlb->prot & 0xF;
     } else {
         prot2 = (tlb->prot >> 4) & 0xF;
@@ -768,7 +769,7 @@ static bool mmubooke206_get_as(CPUPPCState *env,
         return true;
     } else {
         *as_out = msr_ds;
-        *pr_out = msr_pr;
+        *pr_out = FIELD_EX64(env->msr, MSR, PR);
         return false;
     }
 }
-- 
2.25.1


