Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50838362870
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:14:39 +0200 (CEST)
Received: from localhost ([::1]:45044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTvK-0004B0-DA
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThd-0003X7-T8
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:29 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThN-0004Hv-TC
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:29 -0400
Received: by mail-pg1-x536.google.com with SMTP id z16so19807841pga.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QHXjEWeEZoO88te/rMgSkF0yOBhiok3uM+pUtZ6x5+A=;
 b=sAEtib0EZTLF04Gml9jvd12EvCw4TpiecJtqtvHj8t3lao2DAixQdIPuDfmKyIaiy/
 4/ikXR/5q2Ak2LWRhyPMY05vTFfQnbAPT1GzVqIiA9ZDgFihraFw1yCrSsonBFvMmbjW
 eMr4XE84Awb5VlrY+ziZQHY001Kd7LIxgz0dnoVizUNJ2sGz2CBp9AZDNG5CFrpTTEKI
 9upwx8HAc9jDCrh7f6Q81EPwGUBz7e2Cw7NTuyfPMaKa/Nj+r20dDSyfpte8tqhlXyhy
 kZY0giHlcxi6Xq0Xixgfd7A/zZwoUm6gq3qx+uuN8CS4AV2QvaimqYJcD6AjnxUD4Zz+
 HB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QHXjEWeEZoO88te/rMgSkF0yOBhiok3uM+pUtZ6x5+A=;
 b=OvWT8biv+YFRS+HZMJnyWwYW6Qh77VyGjEQJdfWKLlAIWKFlrBFPUSzWqG+3JIBdX5
 AiUC8kf21Waj6UnZV+AG2Y/muMoKNpz/F5yL6BKX6vBe0t8z+xKNh0ZxhFZMH3dPlH6B
 aK4KqfvG9d97pB2G5o86VrLBB2WOwXuSgbatc7IRbotjizopreEQGQ+cnU74+haSN3sH
 M4quz3RtM9h6gfWzhHADNn5JngKXcrJkugq0gzd73i7bRoEWoLQcRUYhHRH9+1dMi4Sz
 ILm/VIKGyQjOqFO7ZERAKdSZ+q/r0YzCvEcyobKjcdBcWHP0cm5+5uq2bhXrFMKYdvtU
 ihFQ==
X-Gm-Message-State: AOAM533LCZfV1ymsS1eRIYio4iDxB631RPYCL4kklBHtSEb7YP04ZAkG
 YNsTlMCIoYyLn5QQFu5EhcuPEFxzvLeGbw==
X-Google-Smtp-Source: ABdhPJxf4sf1mT/zbhaoQKEHN81+OfxUw5FeLrj29LDUsffkKTPc2eY2b5dPYKAxU6CgueJLQPw8Qg==
X-Received: by 2002:a62:6883:0:b029:220:4426:449c with SMTP id
 d125-20020a6268830000b02902204426449cmr8860757pfc.14.1618599609034; 
 Fri, 16 Apr 2021 12:00:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/30] target/arm: Add ALIGN_MEM to TBFLAG_ANY
Date: Fri, 16 Apr 2021 11:59:38 -0700
Message-Id: <20210416185959.1520974-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use this to signal when memory access alignment is required.
This value comes from the CCR register for M-profile, and
from the SCTLR register for A-profile.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  2 ++
 target/arm/translate.h     |  2 ++
 target/arm/helper.c        | 19 +++++++++++++++++--
 target/arm/translate-a64.c |  1 +
 target/arm/translate.c     |  7 +++----
 5 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5e0131be1a..616b393253 100644
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
index 50c2aba066..b185c14a03 100644
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
index 85b7d6add0..cd92a22689 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13018,6 +13018,12 @@ static CPUARMTBFlags
 rebuild_hflags_m32(CPUARMState *env, int fp_el, ARMMMUIdx mmu_idx)
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
@@ -13030,7 +13036,7 @@ rebuild_hflags_m32(CPUARMState *env, int fp_el, ARMMMUIdx mmu_idx)
      */
     if (arm_feature(env, ARM_FEATURE_V8) &&
         !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
-          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
+          (ccr & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
         DP_TBFLAG_M32(flags, STACKCHECK, 1);
     }
 
@@ -13050,12 +13056,17 @@ static CPUARMTBFlags
 rebuild_hflags_a32(CPUARMState *env, int fp_el, ARMMMUIdx mmu_idx)
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
@@ -13100,6 +13111,10 @@ rebuild_hflags_a64(CPUARMState *env, int el, int fp_el, ARMMMUIdx mmu_idx)
 
     sctlr = regime_sctlr(env, stage1);
 
+    if (sctlr & SCTLR_A) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
+
     if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
         DP_TBFLAG_ANY(flags, BE_DATA, 1);
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b32ff56666..92a62b1a75 100644
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
index 5cec3966d6..51897a5113 100644
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
 
@@ -8861,6 +8859,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->user = (dc->current_el == 0);
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
+    dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
-- 
2.25.1


