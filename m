Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF8233A74F
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:12:02 +0100 (CET)
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLVDd-0003e1-SP
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1X-0002Ju-OY
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:31 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:46676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1O-00029V-NB
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:31 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id j17so6735791qvo.13
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hY92A/8JkW6zB37HSUC6YiwaXy9HOEDWasRA8S9xbcA=;
 b=C+Bi21GjsppqVSh1SowyytuXMChkXH46jsBifaUyRniI00EChXOXMcl4FUIQ6ycNWD
 2MaPL+p9VoXtOUHn8OIfEnBwzuTCTqkGjhmBrzrN4Vm+36PDplcZqUpCfvw+4m/E2DkZ
 6wbyVOiS1P9AqAtn6ZzWwoHe4RtJIBeaIvrwCjwq2ZUFz+521XDS2TVi9BTw4QMOzRpz
 F8zlBCWm9KT42cohIiS8AQPfOJNe8K2Su/3KDDaSpDlZ5Hyt8iSsrOyV+JWrV02Q/AIR
 tVM4IkfxYQzcmgoaUQHKmvMKcg+QVXnO3Bx5eShC4/TzNS5FBr/xgZ6sOGskGWYvF9Uk
 oGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hY92A/8JkW6zB37HSUC6YiwaXy9HOEDWasRA8S9xbcA=;
 b=q6/6FrsMT7IIdv8wzVaH+pdax4gOj2VF4qcdoTKgUGep7lbqFD1fsH+Mu1vDJnRMOE
 YUJeufpsCEz8HJnG11KZy0CP9KOa9gk59LQOkke4sIxijoCBjMjjkCGgcKIsub/zv5tm
 BUy33wiVDDeU8X3VkShbM7xwlK/61/oMQxdkEjDRSqiNWlzFVjme+DHYe5Z4Jfv6qNQM
 MAHh6M048f5ZLWIpH1+NmeCw2+ZnZhgxuIh4LmJWqPX6lebJw7Jb6HdSLcO6d8UeOgBx
 NmsqZnAwH8ZVGuaa6HYpCPUOaLkxDMbWVYCe2pshfFjFejyTI+EUJXjrJ3XrdFBmCGHF
 2NBA==
X-Gm-Message-State: AOAM531/xzhL0WpJ8CLWLYjEuLxtEZrFj70p6nAKEkRxyrjlbmmcxDsT
 SzovTlA8dZz3VVyhniE1BPmGZxqYhxyWMPGh
X-Google-Smtp-Source: ABdhPJxxLLEcdvP95DqG3MHGxbdVenufzotFdfHkMDMZHlpXo1cykHQm3ZSofz7v7X6d1XSGSzQD8A==
X-Received: by 2002:ad4:584d:: with SMTP id de13mr21256770qvb.17.1615744757145; 
 Sun, 14 Mar 2021 10:59:17 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/16] target/ppc: Disconnect hflags from MSR
Date: Sun, 14 Mar 2021 11:58:57 -0600
Message-Id: <20210314175906.1733746-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314175906.1733746-1-richard.henderson@linaro.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copying flags directly from msr has drawbacks: (1) msr bits
mean different things per cpu, (2) msr has 64 bits on 64 cpus
while tb->flags has only 32 bits.

Create a enum to define these bits.  Document the origin of each bit.
This fixes the truncation of env->hflags to tb->flags, because we no
longer have hflags bits set above bit 31.

Most of the code in ppc_tr_init_disas_context is moved over to
hreg_compute_hflags.  Some of it is simple extractions from msr,
some requires examining other cpu flags.  Anything that is moved
becomes a simple extract from hflags in ppc_tr_init_disas_context.

Several existing bugs are left in ppc_tr_init_disas_context, where
additional changes are required -- to be addressed in future patches.

Remove a broken #if 0 block.

Reported-by: Ivan Warren <ivan@vmfacility.fr>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         | 24 ++++++++++++++++++
 target/ppc/helper_regs.c | 55 ++++++++++++++++++++++++++++++++--------
 target/ppc/translate.c   | 55 ++++++++++++----------------------------
 3 files changed, 84 insertions(+), 50 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index fd13489dce..39f35b570c 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -585,6 +585,30 @@ enum {
     POWERPC_FLAG_HID0_LE  = 0x00400000,
 };
 
+/*
+ * Bits for env->hflags.
+ *
+ * Most of these bits overlap with corresponding bits in MSR,
+ * but some come from other sources.  Be cautious when modifying.
+ */
+enum {
+    HFLAGS_LE = 0,   /* MSR_LE -- comes from elsewhere on 601 */
+    HFLAGS_HV = 1,   /* computed from MSR_HV and other state */
+    HFLAGS_64 = 2,   /* computed from MSR_CE and MSR_SF */
+    HFLAGS_PR = 3,   /* MSR_PR */
+    HFLAGS_DR = 4,   /* MSR_DR */
+    HFLAGS_IR = 5,   /* MSR_IR */
+    HFLAGS_SPE = 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ MSR_VR */
+    HFLAGS_VSX = 7,  /* from MSR_VSX if cpu has VSX; avoid overlap w/ MSR_AP */
+    HFLAGS_TM = 8,   /* computed from MSR_TM */
+    HFLAGS_BE = 9,   /* MSR_BE -- from elsewhere on embedded ppc */
+    HFLAGS_SE = 10,  /* MSR_SE -- from elsewhere on embedded ppc */
+    HFLAGS_FP = 13,  /* MSR_FP */
+    HFLAGS_SA = 22,  /* MSR_SA */
+    HFLAGS_AP = 23,  /* MSR_AP */
+    HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
+};
+
 /*****************************************************************************/
 /* Floating point status and control register                                */
 #define FPSCR_DRN2   34 /* Decimal Floating-Point rounding control           */
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index a87e354ca2..0a746bffd7 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
@@ -87,24 +88,56 @@ void hreg_compute_mem_idx(CPUPPCState *env)
 
 void hreg_compute_hflags(CPUPPCState *env)
 {
-    target_ulong hflags_mask;
+    target_ulong msr = env->msr;
+    uint32_t ppc_flags = env->flags;
+    uint32_t hflags = 0;
+    uint32_t msr_mask;
 
-    /* We 'forget' FE0 & FE1: we'll never generate imprecise exceptions */
-    hflags_mask = (1 << MSR_VR) | (1 << MSR_AP) | (1 << MSR_SA) |
-        (1 << MSR_PR) | (1 << MSR_FP) | (1 << MSR_SE) | (1 << MSR_BE) |
-        (1 << MSR_LE) | (1 << MSR_VSX) | (1 << MSR_IR) | (1 << MSR_DR);
-    hflags_mask |= (1ULL << MSR_CM) | (1ULL << MSR_SF) | MSR_HVB;
-    hreg_compute_mem_idx(env);
-    env->hflags = env->msr & hflags_mask;
+    /* Some bits come straight across from MSR. */
+    msr_mask = ((1 << MSR_LE) | (1 << MSR_PR) |
+                (1 << MSR_DR) | (1 << MSR_IR) |
+                (1 << MSR_FP) | (1 << MSR_SA) | (1 << MSR_AP));
 
-    if (env->flags & POWERPC_FLAG_HID0_LE) {
+    if (ppc_flags & POWERPC_FLAG_HID0_LE) {
         /*
          * Note that MSR_LE is not set in env->msr_mask for this cpu,
-         * and so will never be set in msr or hflags at this point.
+         * and so will never be set in msr.
          */
         uint32_t le = extract32(env->spr[SPR_HID0], 3, 1);
-        env->hflags |= le << MSR_LE;
+        hflags |= le << MSR_LE;
     }
+
+    if (ppc_flags & POWERPC_FLAG_BE) {
+        msr_mask |= 1 << MSR_BE;
+    }
+    if (ppc_flags & POWERPC_FLAG_SE) {
+        msr_mask |= 1 << MSR_SE;
+    }
+
+    if (msr_is_64bit(env, msr)) {
+        hflags |= 1 << HFLAGS_64;
+    }
+    if ((ppc_flags & POWERPC_FLAG_SPE) && (msr & (1 << MSR_SPE))) {
+        hflags |= 1 << HFLAGS_SPE;
+    }
+    if (ppc_flags & POWERPC_FLAG_VRE) {
+        msr_mask |= 1 << MSR_VR;
+    }
+    if ((ppc_flags & POWERPC_FLAG_VSX) && (msr & (1 << MSR_VSX))) {
+        hflags |= 1 << HFLAGS_VSX;
+    }
+    if ((ppc_flags & POWERPC_FLAG_TM) && (msr & (1ull << MSR_TM))) {
+        hflags |= 1 << HFLAGS_TM;
+    }
+
+#ifndef CONFIG_USER_ONLY
+    if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
+        hflags |= 1 << HFLAGS_HV;
+    }
+#endif
+
+    env->hflags = hflags | (msr & msr_mask);
+    hreg_compute_mem_idx(env);
 }
 
 void cpu_interrupt_exittb(CPUState *cs)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 0984ce637b..a9325a12e5 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7879,67 +7879,48 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUPPCState *env = cs->env_ptr;
+    uint32_t hflags = ctx->base.tb->flags;
     int bound;
 
     ctx->exception = POWERPC_EXCP_NONE;
     ctx->spr_cb = env->spr_cb;
-    ctx->pr = msr_pr;
+    ctx->pr = (hflags >> HFLAGS_PR) & 1;
     ctx->mem_idx = env->dmmu_idx;
-    ctx->dr = msr_dr;
-#if !defined(CONFIG_USER_ONLY)
-    ctx->hv = msr_hv || !env->has_hv_mode;
-#endif
+    ctx->dr = (hflags >> HFLAGS_DR) & 1;
+    ctx->hv = (hflags >> HFLAGS_HV) & 1;
     ctx->insns_flags = env->insns_flags;
     ctx->insns_flags2 = env->insns_flags2;
     ctx->access_type = -1;
     ctx->need_access_type = !mmu_is_64bit(env->mmu_model);
-    ctx->le_mode = !!(env->hflags & (1 << MSR_LE));
+    ctx->le_mode = (hflags >> HFLAGS_LE) & 1;
     ctx->default_tcg_memop_mask = ctx->le_mode ? MO_LE : MO_BE;
     ctx->flags = env->flags;
 #if defined(TARGET_PPC64)
-    ctx->sf_mode = msr_is_64bit(env, env->msr);
+    ctx->sf_mode = (hflags >> HFLAGS_64) & 1;
     ctx->has_cfar = !!(env->flags & POWERPC_FLAG_CFAR);
 #endif
     ctx->lazy_tlb_flush = env->mmu_model == POWERPC_MMU_32B
         || env->mmu_model == POWERPC_MMU_601
         || env->mmu_model & POWERPC_MMU_64;
 
-    ctx->fpu_enabled = !!msr_fp;
-    if ((env->flags & POWERPC_FLAG_SPE) && msr_spe) {
-        ctx->spe_enabled = !!msr_spe;
-    } else {
-        ctx->spe_enabled = false;
-    }
-    if ((env->flags & POWERPC_FLAG_VRE) && msr_vr) {
-        ctx->altivec_enabled = !!msr_vr;
-    } else {
-        ctx->altivec_enabled = false;
-    }
-    if ((env->flags & POWERPC_FLAG_VSX) && msr_vsx) {
-        ctx->vsx_enabled = !!msr_vsx;
-    } else {
-        ctx->vsx_enabled = false;
-    }
+    ctx->fpu_enabled = (hflags >> HFLAGS_FP) & 1;
+    ctx->spe_enabled = (hflags >> HFLAGS_SPE) & 1;
+    ctx->altivec_enabled = (hflags >> HFLAGS_VR) & 1;
+    ctx->vsx_enabled = (hflags >> HFLAGS_VSX) & 1;
     if ((env->flags & POWERPC_FLAG_SCV)
         && (env->spr[SPR_FSCR] & (1ull << FSCR_SCV))) {
         ctx->scv_enabled = true;
     } else {
         ctx->scv_enabled = false;
     }
-#if defined(TARGET_PPC64)
-    if ((env->flags & POWERPC_FLAG_TM) && msr_tm) {
-        ctx->tm_enabled = !!msr_tm;
-    } else {
-        ctx->tm_enabled = false;
-    }
-#endif
+    ctx->tm_enabled = (hflags >> HFLAGS_TM) & 1;
     ctx->gtse = !!(env->spr[SPR_LPCR] & LPCR_GTSE);
-    if ((env->flags & POWERPC_FLAG_SE) && msr_se) {
-        ctx->singlestep_enabled = CPU_SINGLE_STEP;
-    } else {
-        ctx->singlestep_enabled = 0;
+
+    ctx->singlestep_enabled = 0;
+    if ((hflags >> HFLAGS_SE) & 1) {
+        ctx->singlestep_enabled |= CPU_SINGLE_STEP;
     }
-    if ((env->flags & POWERPC_FLAG_BE) && msr_be) {
+    if ((hflags >> HFLAGS_BE) & 1) {
         ctx->singlestep_enabled |= CPU_BRANCH_STEP;
     }
     if ((env->flags & POWERPC_FLAG_DE) && msr_de) {
@@ -7956,10 +7937,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     if (unlikely(ctx->base.singlestep_enabled)) {
         ctx->singlestep_enabled |= GDBSTUB_SINGLE_STEP;
     }
-#if defined(DO_SINGLE_STEP) && 0
-    /* Single step trace mode */
-    msr_se = 1;
-#endif
 
     bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
     ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
-- 
2.25.1


