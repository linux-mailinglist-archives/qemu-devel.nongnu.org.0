Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A002F1EBC
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:14:43 +0100 (CET)
Received: from localhost ([::1]:45078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2eI-00005u-Qf
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rb-000637-Im
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:35 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:47091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RZ-0006Ql-Pr
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:35 -0500
Received: by mail-pl1-x62d.google.com with SMTP id v3so314821plz.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Gp5YJhUdu7O2iWG1ZDTCi/OY2TUbd2kY+8E+Hd/FJ4=;
 b=Hrwh+m3ahWF0A68aHzHCSsJcTJ2MdggXky1MWjQ8UbK/3xzqALsVjPcGEb6ua3AvAB
 mkEdcSaZFJI8+9YmuHmTtwWz5S55vTvRCH9MfmbMQ7El26sfzx1Gszl2WOItWlokFJkM
 efliDgDbuiJvMzT/CzUtCMDDTplqzw7Q0Sx1loMVYXRu0lXpZzsQJ28i5jdB9kEzCh3N
 Ab8GChSy/af0ly3xPFkw6o3AONctV2VgcnQ0kEm3kNxWZBVBk6b7s3z350QVihXBbXrb
 zUR/TZHkQkc5OIL3M3PF/+YdKl1QtFOHPMe9j6dMQtsnDUP7jOGHIsyRT2pR4KW6Tr9v
 wEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Gp5YJhUdu7O2iWG1ZDTCi/OY2TUbd2kY+8E+Hd/FJ4=;
 b=DoP9jFC6t8v9kmOITS6aM1ChY1qsAOe31Iiz76jEmL704t6tLzAsxZ7OdzzTwkDkiQ
 wuzk01v55XBcdiNTz9tIEr0MNoGGfjPkLyb6pF6+FLDbuesHG7vOSY/Rn3NTIHs0TiwN
 PPRhiHUAyKtuDvilPtCGykfyPTLU0DMMOTnm4EZ2mzWocoCcC0Yl8xdhz3Ex1dvqXbR1
 xdvmg6HoJPGb0VebxI8HkYLSOvu4Sy+5eKE3ttpSX5tUAaMPs5+/wYigfcSBTR4Tk2wZ
 BaS4kFwaJDATXkPnuKmNIWb4JR8vMEorSu+jNF0FUyO93D0nuwKBvfquc1NJFEr20Cav
 DoDw==
X-Gm-Message-State: AOAM530EFvBerIc76ErwTfbfeeSRBPOxGGNjZBMT+mDhKa1zWTlRBcUX
 K6JUItfSuu1z6vaQRj/vejTtSeKZ245Xtg==
X-Google-Smtp-Source: ABdhPJxwk4trQ9IUSW1+XD/ZuaLra9ijGckYYc4rW49vdRJjTnxQ8faaFnli8GO2o522HkTma3hQzg==
X-Received: by 2002:a17:90a:d70e:: with SMTP id y14mr288483pju.9.1610391692145; 
 Mon, 11 Jan 2021 11:01:32 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/30] target/arm: Add ALIGN_MEM to TBFLAG_ANY
Date: Mon, 11 Jan 2021 09:00:52 -1000
Message-Id: <20210111190113.303726-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
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
index aa2f2d3a04..4adac2f193 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3284,6 +3284,8 @@ FIELD(TBFLAG_ANY, MMUIDX, 4, 4)
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
index 0d7c8817b6..fc38cc58aa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12777,6 +12777,12 @@ static CPUARMTBFlags
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
@@ -12789,7 +12795,7 @@ rebuild_hflags_m32(CPUARMState *env, int fp_el, ARMMMUIdx mmu_idx)
      */
     if (arm_feature(env, ARM_FEATURE_V8) &&
         !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
-          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
+          (ccr & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
         DP_TBFLAG_M32(flags, STACKCHECK, 1);
     }
 
@@ -12809,12 +12815,17 @@ static CPUARMTBFlags
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
@@ -12859,6 +12870,10 @@ rebuild_hflags_a64(CPUARMState *env, int el, int fp_el, ARMMMUIdx mmu_idx)
 
     sctlr = regime_sctlr(env, stage1);
 
+    if (sctlr & SCTLR_A) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
+
     if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
         DP_TBFLAG_ANY(flags, BE_DATA, 1);
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 010e81e0b4..69d401da21 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14712,6 +14712,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->user = (dc->current_el == 0);
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
+    dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sve_len = (EX_TBFLAG_A64(tb_flags, ZCR_LEN) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 189b2ee3cb..3fc058e8d0 100644
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
 
@@ -8824,6 +8822,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->user = (dc->current_el == 0);
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
+    dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
-- 
2.25.1


