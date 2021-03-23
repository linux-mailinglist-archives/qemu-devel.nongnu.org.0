Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A0346908
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:29:16 +0100 (CET)
Received: from localhost ([::1]:44210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmiJ-0000n8-Lz
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm10-0008SU-64
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:30 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:39729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0V-0003jB-0A
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:29 -0400
Received: by mail-oi1-x22b.google.com with SMTP id i81so16608858oif.6
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yR6a5C+RN4aXpJjTSKMGXA72kDkxG0ld+xL4kg1fU/Y=;
 b=PZDcHwkRzDDxCOsd+ew1iCb1+pAm+QjXZvOzpHtSH/Lohgf8/Dpf5gD3KM7qi+v+DE
 ar1jFF9Czvc3quzgX8mE/eFRtqtoGYgJKZT+0dxDafMCEZ66C/ifqGQN0KCxhHD4gxAY
 /cmkhA6u0vcB9vfGzWP3qXG4pr83XTF+zT3SH1Kwnh8f2JJ1N338i6MgNQAEYQomLagC
 ClxcAGBP/mIfDG4RQ9VERyQ6k22c9D+cgNoghn2eyJWErdOKvbv3i2OcK6ftGRZLNNnC
 TjQXKi38scjlxWSaixk5PuW+cFiPrR1PN8CyIt4mvru/0Niy/BFDMW3u0BlQd8UoChAd
 Wm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yR6a5C+RN4aXpJjTSKMGXA72kDkxG0ld+xL4kg1fU/Y=;
 b=bQUElPxSAAAClxQEUsrSKmqYL51ywjWRDeTLqh+Ec6DafJ3Rz5qxOxEffrcV66vNaI
 Kd5Wli0OK2zQ2zYXwae6AQzIoQAELBhdIsIG1l8DCNT6Duzqa+Id5+oKv67jd7UZ7f7u
 c2X7oX64JNXfg7UxztIx3pcLWkZzO8k1LtRz3wFF9532CtJ85sN9x75OX5fUt04AjJxD
 09bCwQ28aA5X7owOiLrVCdCKCBjeRNeOKTexc/gmAJljQtOVdQ0/pclUP0N3mXjwaIHX
 9gtTog8Oal4ABlC4ITDOX0o/tpP0/er7ombYnp28Naz/353eAzfgXC1ajjbmVpwj38Ni
 Jadw==
X-Gm-Message-State: AOAM530lI30xnjS8mc0pKbJi1lO9fgnzLZDmKvPSWvsmhk0X0vOHvrkn
 RJ063X3p1sM0cvc9gb2NbCOZw9C+v+7aeQRl
X-Google-Smtp-Source: ABdhPJyfNDckQxULtdbFO/hn/PCnqmUnN7TJh+HpxwsNjoOYDSv0u3zTGsnFRq6Wb6IRyoUMuH/yPg==
X-Received: by 2002:aca:f550:: with SMTP id t77mr4433641oih.71.1616525034087; 
 Tue, 23 Mar 2021 11:43:54 -0700 (PDT)
Received: from localhost.localdomain (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id x23sm3902825ood.28.2021.03.23.11.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:43:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/10] target/ppc: Remove env->immu_idx and env->dmmu_idx
Date: Tue, 23 Mar 2021 12:43:38 -0600
Message-Id: <20210323184340.619757-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323184340.619757-1-richard.henderson@linaro.org>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We weren't recording MSR_GS in hflags, which means that BookE
memory accesses were essentially random vs Guest State.

Instead of adding this bit directly, record the completed mmu
indexes instead.  This makes it obvious that we are recording
exactly the information that we need.

This also means that we can stop directly recording MSR_IR.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         | 12 ++++--
 target/ppc/helper_regs.h |  1 -
 target/ppc/helper_regs.c | 89 +++++++++++++++++++---------------------
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
2.25.1


