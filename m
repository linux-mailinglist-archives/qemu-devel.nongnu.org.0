Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E13725C0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:19:19 +0200 (CEST)
Received: from localhost ([::1]:60736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoOr-0007ml-8x
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo06-0005JT-DP; Tue, 04 May 2021 01:53:43 -0400
Received: from ozlabs.org ([203.11.71.1]:44901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo02-0004mZ-QF; Tue, 04 May 2021 01:53:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK5GgVz9sXM; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=PqIL/NNdjNzqldj5TBgHl3AG7TfjMwpEseQKUgN7u/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YICwhH+PdEqi2j1lr/vqi1jyfu3DOdxQgkwywDqD4GY2n5jhTi3ue5qb6PS5a//Ww
 Hi6MKrlK2U4z+fzDLSc3r197bqkWwPB1cwlH6fIsb/7p7nh8Kg1ukQ8DKW3qHw9AaK
 wFFmyF15MW3Me3vuD8aRttgWx3hBF1mLXnbbBVhg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 17/46] target/ppc: Remove env->immu_idx and env->dmmu_idx
Date: Tue,  4 May 2021 15:52:43 +1000
Message-Id: <20210504055312.306823-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We weren't recording MSR_GS in hflags, which means that BookE
memory accesses were essentially random vs Guest State.

Instead of adding this bit directly, record the completed mmu
indexes instead.  This makes it obvious that we are recording
exactly the information that we need.

This also means that we can stop directly recording MSR_IR.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210323184340.619757-9-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h         | 12 ++++--
 target/ppc/helper_regs.c | 89 +++++++++++++++++++---------------------
 target/ppc/helper_regs.h |  1 -
 target/ppc/machine.c     |  2 +-
 target/ppc/mem_helper.c  |  2 +-
 target/ppc/translate.c   |  6 +--
 6 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2f72f83ee3..3d021f61f3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -598,7 +598,6 @@ enum {
     HFLAGS_64 = 2,   /* computed from MSR_CE and MSR_SF */
     HFLAGS_GTSE = 3, /* computed from SPR_LPCR[GTSE] */
     HFLAGS_DR = 4,   /* MSR_DR */
-    HFLAGS_IR = 5,   /* MSR_IR */
     HFLAGS_SPE = 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ MSR_VR */
     HFLAGS_TM = 8,   /* computed from MSR_TM */
     HFLAGS_BE = 9,   /* MSR_BE -- from elsewhere on embedded ppc */
@@ -607,6 +606,9 @@ enum {
     HFLAGS_PR = 14,  /* MSR_PR */
     HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
+
+    HFLAGS_IMMU_IDX = 26, /* 26..28 -- the composite immu_idx */
+    HFLAGS_DMMU_IDX = 29, /* 29..31 -- the composite dmmu_idx */
 };
 
 /*****************************************************************************/
@@ -1131,8 +1133,6 @@ struct CPUPPCState {
     /* These resources are used only in TCG */
     uint32_t hflags;
     target_ulong hflags_compat_nmsr; /* for migration compatibility */
-    int immu_idx;     /* precomputed MMU index to speed up insn accesses */
-    int dmmu_idx;     /* precomputed MMU index to speed up data accesses */
 
     /* Power management */
     int (*check_pow)(CPUPPCState *env);
@@ -1368,7 +1368,11 @@ int ppc_dcr_write(ppc_dcr_t *dcr_env, int dcrn, uint32_t val);
 #define MMU_USER_IDX 0
 static inline int cpu_mmu_index(CPUPPCState *env, bool ifetch)
 {
-    return ifetch ? env->immu_idx : env->dmmu_idx;
+#ifdef CONFIG_USER_ONLY
+    return MMU_USER_IDX;
+#else
+    return (env->hflags >> (ifetch ? HFLAGS_IMMU_IDX : HFLAGS_DMMU_IDX)) & 7;
+#endif
 }
 
 /* Compatibility modes */
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index dd3cd770a3..5411a67e9a 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -43,49 +43,6 @@ void hreg_swap_gpr_tgpr(CPUPPCState *env)
     env->tgpr[3] = tmp;
 }
 
-void hreg_compute_mem_idx(CPUPPCState *env)
-{
-    /*
-     * This is our encoding for server processors. The architecture
-     * specifies that there is no such thing as userspace with
-     * translation off, however it appears that MacOS does it and some
-     * 32-bit CPUs support it. Weird...
-     *
-     *   0 = Guest User space virtual mode
-     *   1 = Guest Kernel space virtual mode
-     *   2 = Guest User space real mode
-     *   3 = Guest Kernel space real mode
-     *   4 = HV User space virtual mode
-     *   5 = HV Kernel space virtual mode
-     *   6 = HV User space real mode
-     *   7 = HV Kernel space real mode
-     *
-     * For BookE, we need 8 MMU modes as follow:
-     *
-     *  0 = AS 0 HV User space
-     *  1 = AS 0 HV Kernel space
-     *  2 = AS 1 HV User space
-     *  3 = AS 1 HV Kernel space
-     *  4 = AS 0 Guest User space
-     *  5 = AS 0 Guest Kernel space
-     *  6 = AS 1 Guest User space
-     *  7 = AS 1 Guest Kernel space
-     */
-    if (env->mmu_model & POWERPC_MMU_BOOKE) {
-        env->immu_idx = env->dmmu_idx = msr_pr ? 0 : 1;
-        env->immu_idx += msr_is ? 2 : 0;
-        env->dmmu_idx += msr_ds ? 2 : 0;
-        env->immu_idx += msr_gs ? 4 : 0;
-        env->dmmu_idx += msr_gs ? 4 : 0;
-    } else {
-        env->immu_idx = env->dmmu_idx = msr_pr ? 0 : 1;
-        env->immu_idx += msr_ir ? 0 : 2;
-        env->dmmu_idx += msr_dr ? 0 : 2;
-        env->immu_idx += msr_hv ? 4 : 0;
-        env->dmmu_idx += msr_hv ? 4 : 0;
-    }
-}
-
 void hreg_compute_hflags(CPUPPCState *env)
 {
     target_ulong msr = env->msr;
@@ -97,10 +54,9 @@ void hreg_compute_hflags(CPUPPCState *env)
     QEMU_BUILD_BUG_ON(MSR_LE != HFLAGS_LE);
     QEMU_BUILD_BUG_ON(MSR_PR != HFLAGS_PR);
     QEMU_BUILD_BUG_ON(MSR_DR != HFLAGS_DR);
-    QEMU_BUILD_BUG_ON(MSR_IR != HFLAGS_IR);
     QEMU_BUILD_BUG_ON(MSR_FP != HFLAGS_FP);
     msr_mask = ((1 << MSR_LE) | (1 << MSR_PR) |
-                (1 << MSR_DR) | (1 << MSR_IR) | (1 << MSR_FP));
+                (1 << MSR_DR) | (1 << MSR_FP));
 
     if (ppc_flags & POWERPC_FLAG_HID0_LE) {
         /*
@@ -155,10 +111,51 @@ void hreg_compute_hflags(CPUPPCState *env)
     if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
         hflags |= 1 << HFLAGS_HV;
     }
+
+    /*
+     * This is our encoding for server processors. The architecture
+     * specifies that there is no such thing as userspace with
+     * translation off, however it appears that MacOS does it and some
+     * 32-bit CPUs support it. Weird...
+     *
+     *   0 = Guest User space virtual mode
+     *   1 = Guest Kernel space virtual mode
+     *   2 = Guest User space real mode
+     *   3 = Guest Kernel space real mode
+     *   4 = HV User space virtual mode
+     *   5 = HV Kernel space virtual mode
+     *   6 = HV User space real mode
+     *   7 = HV Kernel space real mode
+     *
+     * For BookE, we need 8 MMU modes as follow:
+     *
+     *  0 = AS 0 HV User space
+     *  1 = AS 0 HV Kernel space
+     *  2 = AS 1 HV User space
+     *  3 = AS 1 HV Kernel space
+     *  4 = AS 0 Guest User space
+     *  5 = AS 0 Guest Kernel space
+     *  6 = AS 1 Guest User space
+     *  7 = AS 1 Guest Kernel space
+     */
+    unsigned immu_idx, dmmu_idx;
+    dmmu_idx = msr & (1 << MSR_PR) ? 0 : 1;
+    if (env->mmu_model & POWERPC_MMU_BOOKE) {
+        dmmu_idx |= msr & (1 << MSR_GS) ? 4 : 0;
+        immu_idx = dmmu_idx;
+        immu_idx |= msr & (1 << MSR_IS) ? 2 : 0;
+        dmmu_idx |= msr & (1 << MSR_DS) ? 2 : 0;
+    } else {
+        dmmu_idx |= msr & (1ull << MSR_HV) ? 4 : 0;
+        immu_idx = dmmu_idx;
+        immu_idx |= msr & (1 << MSR_IR) ? 0 : 2;
+        dmmu_idx |= msr & (1 << MSR_DR) ? 0 : 2;
+    }
+    hflags |= immu_idx << HFLAGS_IMMU_IDX;
+    hflags |= dmmu_idx << HFLAGS_DMMU_IDX;
 #endif
 
     env->hflags = hflags | (msr & msr_mask);
-    hreg_compute_mem_idx(env);
 }
 
 void cpu_interrupt_exittb(CPUState *cs)
diff --git a/target/ppc/helper_regs.h b/target/ppc/helper_regs.h
index 4148a442b3..42f26870b9 100644
--- a/target/ppc/helper_regs.h
+++ b/target/ppc/helper_regs.h
@@ -21,7 +21,6 @@
 #define HELPER_REGS_H
 
 void hreg_swap_gpr_tgpr(CPUPPCState *env);
-void hreg_compute_mem_idx(CPUPPCState *env);
 void hreg_compute_hflags(CPUPPCState *env);
 void cpu_interrupt_exittb(CPUState *cs);
 int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv);
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 09c5765a87..e5bffbe365 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -16,7 +16,7 @@ static void post_load_update_msr(CPUPPCState *env)
 
     /*
      * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
-     * before restoring.  Note that this recomputes hflags and mem_idx.
+     * before restoring.  Note that this recomputes hflags.
      */
     env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index f4f7e730de..444b2a30ef 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -278,7 +278,7 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
     target_ulong mask, dcbz_size = env->dcache_line_size;
     uint32_t i;
     void *haddr;
-    int mmu_idx = epid ? PPC_TLB_EPID_STORE : env->dmmu_idx;
+    int mmu_idx = epid ? PPC_TLB_EPID_STORE : cpu_mmu_index(env, false);
 
 #if defined(TARGET_PPC64)
     /* Check for dcbz vs dcbzl on 970 */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 5e629291d3..a53463b9b8 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7658,8 +7658,8 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  cs->cpu_index);
     qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
                  "%08x iidx %d didx %d\n",
-                 env->msr, env->spr[SPR_HID0],
-                 env->hflags, env->immu_idx, env->dmmu_idx);
+                 env->msr, env->spr[SPR_HID0], env->hflags,
+                 cpu_mmu_index(env, true), cpu_mmu_index(env, false));
 #if !defined(NO_TIMER_DUMP)
     qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
 #if !defined(CONFIG_USER_ONLY)
@@ -7885,7 +7885,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->exception = POWERPC_EXCP_NONE;
     ctx->spr_cb = env->spr_cb;
     ctx->pr = (hflags >> HFLAGS_PR) & 1;
-    ctx->mem_idx = env->dmmu_idx;
+    ctx->mem_idx = (hflags >> HFLAGS_DMMU_IDX) & 7;
     ctx->dr = (hflags >> HFLAGS_DR) & 1;
     ctx->hv = (hflags >> HFLAGS_HV) & 1;
     ctx->insns_flags = env->insns_flags;
-- 
2.31.1


