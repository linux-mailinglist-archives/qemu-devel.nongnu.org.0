Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4193D36F8AA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:48:38 +0200 (CEST)
Received: from localhost ([::1]:34836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQhJ-0006dH-8x
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU6-0007e1-6U
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:58 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU4-0001Ji-70
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id m9so57258800wrx.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9HWrWug8jmPoHYTE2hJ7tPtwvHTlCshBAknL7qWDnXA=;
 b=nVrLIgtFHbam7kZr+pJcxzlqSRbV7xsXB/4IPH1r+NZMxHTSy6X2+2q3MJ7EoM+yM/
 LQAJehYFRsWWS7yV7WP8zVo3sDL5h2kuX80BMl+1Oc7p0lJMOvXCiOEeLoXgZOwTMnCB
 EuiLlVCscKENPSZW5wmaIrRCZY2on0UrIaytqW38g3yxWntwVFVJq5ubjBxDeifwozeE
 +nlub+IcG/3XJ/59c3iC1xslecs6GwNHIeY+ThXWPg+e8dkJpuSuLx90DE3gt7MR9NUh
 EXWryLkU1htgMnW7yzZ0BI/r3T003ODGOh2ry7jssPw2PEaeWIEwkEbPOGDqnPM8cxyj
 E2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HWrWug8jmPoHYTE2hJ7tPtwvHTlCshBAknL7qWDnXA=;
 b=uIa7gSEQC0CQfN5XsgaWoa+XDYll640lNLmYthur1fZ6imW2hyuA2C7ao8h2HdP/YZ
 2NoT2J40KUWHynwj6QYuXF9d0Jc950gEK8rMGwPeMWPKGl7+/zRC5Cxm6sGO1Lfxib5E
 SCJuO5/T7G/oYls2H8qfiDvfvzGr1Vxo65KTxB5Agu9MUslT/tpSw4K2P8IobVxB9uXa
 9Qgq0cDXfp3ykd3k5P9pl9UfsbedpvK8GTkbSIPT/5EiMv7naxeHbMwN/qI8spIR/I88
 So+Fbgxhs/r2iI/hREJyPVZobrgHWLbHs8KOz0DTfL8GxRGXp7W8aCpn0HTqwe1VjUTY
 25GA==
X-Gm-Message-State: AOAM5306G9dPX7K+eld34CNw0E2dCVJvAlZ+Oix+salKRIVO3qOMBKKT
 CjLdW/Ekcrin+Qi0ZHrlaZWDwyzBxY+kLUJB
X-Google-Smtp-Source: ABdhPJw8QQfdnXALACTtg2wOFUVNJ5KylHZKlZCv789X9vzXcug3nS7VQ/wDpH5aIX/tyP1agmuyHQ==
X-Received: by 2002:adf:f241:: with SMTP id b1mr2377689wrp.150.1619778894787; 
 Fri, 30 Apr 2021 03:34:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/43] target/arm: Add ALIGN_MEM to TBFLAG_ANY
Date: Fri, 30 Apr 2021 11:34:14 +0100
Message-Id: <20210430103437.4140-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use this to signal when memory access alignment is required.
This value comes from the CCR register for M-profile, and
from the SCTLR register for A-profile.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  2 ++
 target/arm/translate.h     |  2 ++
 target/arm/helper.c        | 19 +++++++++++++++++--
 target/arm/translate-a64.c |  1 +
 target/arm/translate.c     |  7 +++----
 5 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5e0131be1a2..616b3932534 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3414,6 +3414,8 @@ FIELD(TBFLAG_ANY, MMUIDX, 4, 4)
 FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
 /* For A-profile only, target EL for debug exceptions.  */
 FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 10, 2)
+/* Memory operations require alignment: SCTLR_ELx.A or CCR.UNALIGN_TRP */
+FIELD(TBFLAG_ANY, ALIGN_MEM, 12, 1)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 50c2aba0667..b185c14a035 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -87,6 +87,8 @@ typedef struct DisasContext {
     bool bt;
     /* True if any CP15 access is trapped by HSTR_EL2 */
     bool hstr_active;
+    /* True if memory operations require alignment */
+    bool align_mem;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4aa7650d3a7..9b1b98705f9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13018,6 +13018,12 @@ static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
     CPUARMTBFlags flags = {};
+    uint32_t ccr = env->v7m.ccr[env->v7m.secure];
+
+    /* Without HaveMainExt, CCR.UNALIGN_TRP is RES1. */
+    if (ccr & R_V7M_CCR_UNALIGN_TRP_MASK) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
 
     if (arm_v7m_is_handler_mode(env)) {
         DP_TBFLAG_M32(flags, HANDLER, 1);
@@ -13030,7 +13036,7 @@ static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
      */
     if (arm_feature(env, ARM_FEATURE_V8) &&
         !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
-          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
+          (ccr & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
         DP_TBFLAG_M32(flags, STACKCHECK, 1);
     }
 
@@ -13049,12 +13055,17 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
     CPUARMTBFlags flags = rebuild_hflags_aprofile(env);
+    int el = arm_current_el(env);
+
+    if (arm_sctlr(env, el) & SCTLR_A) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
 
     if (arm_el_is_aa64(env, 1)) {
         DP_TBFLAG_A32(flags, VFPEN, 1);
     }
 
-    if (arm_current_el(env) < 2 && env->cp15.hstr_el2 &&
+    if (el < 2 && env->cp15.hstr_el2 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
     }
@@ -13099,6 +13110,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     sctlr = regime_sctlr(env, stage1);
 
+    if (sctlr & SCTLR_A) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
+
     if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
         DP_TBFLAG_ANY(flags, BE_DATA, 1);
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b32ff566669..92a62b1a751 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14697,6 +14697,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->user = (dc->current_el == 0);
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
+    dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sve_len = (EX_TBFLAG_A64(tb_flags, ZCR_LEN) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6a15e5d16c1..970e537eae0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -933,8 +933,7 @@ static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
 {
     TCGv addr;
 
-    if (arm_dc_feature(s, ARM_FEATURE_M) &&
-        !arm_dc_feature(s, ARM_FEATURE_M_MAIN)) {
+    if (s->align_mem) {
         opc |= MO_ALIGN;
     }
 
@@ -948,8 +947,7 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
 {
     TCGv addr;
 
-    if (arm_dc_feature(s, ARM_FEATURE_M) &&
-        !arm_dc_feature(s, ARM_FEATURE_M_MAIN)) {
+    if (s->align_mem) {
         opc |= MO_ALIGN;
     }
 
@@ -8877,6 +8875,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->user = (dc->current_el == 0);
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
+    dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
-- 
2.20.1


