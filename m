Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615CC33C692
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:11:40 +0100 (CET)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsct-0007Aa-CH
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEY-0007H9-Ro
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:30 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:35104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEU-0001af-JT
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:30 -0400
Received: by mail-ot1-x331.google.com with SMTP id j22so7499474otp.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hY92A/8JkW6zB37HSUC6YiwaXy9HOEDWasRA8S9xbcA=;
 b=CXs0OcHgDc9c35LThUaom0Zjgm7k2fLo4oJlFr2upMkl12UBWarm8d6IrT3VmfIX6L
 U/V5Y3UvgmpdgyrahP2RYWtw8+gUw4aFmYH/OFXdaJ/n+Tvm2p6sJlsHNZ89C7wo7bqj
 PiEZRORarYzumwIuruVHkHQ4dwv19F3sbbpI9sHrSTqX60M+tRQFoZ3Ib/ML9XBRajb2
 Z4Y4OrLcRgyg5hzlGboS7ixHUVUCYWJVvPKnpZu8xMz/KfJfDAtzrelV3f7zcbJVXbN/
 uqm2sX70SgGRh6zKtery6IVPzWQSxWcgH8eQ7GrHY3YPm/W8WPbZtHY8lGDXb6FmpgGP
 LXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hY92A/8JkW6zB37HSUC6YiwaXy9HOEDWasRA8S9xbcA=;
 b=BELj1OWjoL/41mpLEkyUxRQ++KF1yBfHK7K4r6Ig0YAXPL9KEehr6625mYJFuLGNE9
 hdr6sGYhZLMFv5mQWX/A9+ER8QqdaAW2cw9Gd4JvcqRgF48cNrQvQDb1xVQ0/9Mt7qDz
 pn8yaxOGP7FFZFeAtbcjzm0ssTWKx+J/jxG/wenv1zCYuVApiE0iXGl0c/cLwTWsXkqK
 BaZyRLZPYF4f9Cq0HWQw+940EWgHlRDX/JP6/gBPU1hrZEHPymOgwxH8o+HZxriaf+u+
 PSa+ypxuXtuxq5dR3MbsmMqljLSe5YRHL9G9cVwPdfd+g5CCvZo2C8DiAC+gts9JvgSY
 o7bQ==
X-Gm-Message-State: AOAM5323x67f3EswIb2fk0dvx6sE8/3KRrRGn4rwn5CufYc4OJpW/zkU
 vGrc9/TWt4HeZlmOKji0i/Ho/DfXiX/KxuEL
X-Google-Smtp-Source: ABdhPJy2ED/Vpv8I6AlJa2/2maQKGXOHvuOd5M7d4IZ1UieLPNw/yl8nGNDAHJzKUSfZwzhSpFrreQ==
X-Received: by 2002:a9d:6553:: with SMTP id q19mr386536otl.201.1615833985258; 
 Mon, 15 Mar 2021 11:46:25 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/17] target/ppc: Disconnect hflags from MSR
Date: Mon, 15 Mar 2021 12:46:05 -0600
Message-Id: <20210315184615.1985590-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
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


