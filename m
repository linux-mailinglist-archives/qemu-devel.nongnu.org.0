Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D4F362836
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:04:09 +0200 (CEST)
Received: from localhost ([::1]:39798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTlA-0006bR-E8
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThW-0003Rg-Ja
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:23 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThG-0004FJ-5s
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:21 -0400
Received: by mail-pl1-x62b.google.com with SMTP id e2so10169078plh.8
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lyEZ23rEJ0ybvWabyWlgigAm5pXAYsoEK50osfBHHkY=;
 b=PekFZlzIjnq841djhS+jJWS71bo8KJ7AfB4caHtY9JEqlR0rurhN10EnEH1BM8sI4F
 tAmL84E4hYMhbAsm5Nsg7z6HsiZRNCh7oPYk0VEg08rPSaUUk9lfzTRxSXt0tH1TKfk+
 FgsGDjDZ+GCIZ6yuROnEKv3DuyRF/7B9cGlrEWPILsmjVnJB8eYo7hM8i60z+s6dtn0v
 KKfBNe+0nMsIHKkgVBFnRf0kanIrjvrf1We+vmeHUuLjtV1QqFmTpymROVOjKl/RwfhF
 EVeYYE/tTDyfv+m/GVqLtb9Zh9YqCZiUTblqf2lCKwkmL6P8bloyWYQC9zFNZbfKy6Nt
 46AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lyEZ23rEJ0ybvWabyWlgigAm5pXAYsoEK50osfBHHkY=;
 b=cR9c+j38h+HyS6FPUHd3ET/GrQti+PouwefExVz0RDhqzZmmQrabgJqGpTAzZZcHok
 sRHN0LQ63rPIx146jjqFulUGLmH2gVt8OgzQTc1wFXGLEw1I4XdCSa6dLzdtE0lKXwxi
 AC9YbptNphNEiENsS17bzsY3/5HAVswUhRw7sI/1aNAvlngNepR+U/yQzQTzdcmRXGqm
 +eyDxqDxKpQCNQ+SFxTunZ9rmGlkQ5ab9J7wlbHOBhEHqTi+XmINvGyHL2GMAkB6if+U
 CQGTpq0MN1VsX0L1Akk/0E0iCcYhTFiDecx483VNi+upjmmPEGzu3yCcF8Ub9WpO3AMF
 tbUw==
X-Gm-Message-State: AOAM533oox371Gcjd8R7NbHx+I+E+WBo50iXT/DwLu/b10lrFchtr2Qa
 bz7RWcK625PbeiF0flKOCRIRGJlPfajvIQ==
X-Google-Smtp-Source: ABdhPJwKmSHPDdADO61iT5ceEtgviffPxd9rZjbbHB6Qn6E8K/9CqKkEQSJBuCQ/DbNKqrvGh7jgtg==
X-Received: by 2002:a17:902:9b97:b029:eb:7a1b:5b88 with SMTP id
 y23-20020a1709029b97b02900eb7a1b5b88mr9906152plp.77.1618599604532; 
 Fri, 16 Apr 2021 12:00:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/30] target/arm: Add wrapper macros for accessing tbflags
Date: Fri, 16 Apr 2021 11:59:33 -0700
Message-Id: <20210416185959.1520974-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to split tbflags into two parts.  These macros
will ensure that the correct part is used with the correct
set of bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 22 +++++++++-
 target/arm/helper-a64.c    |  2 +-
 target/arm/helper.c        | 85 +++++++++++++++++---------------------
 target/arm/translate-a64.c | 36 ++++++++--------
 target/arm/translate.c     | 48 ++++++++++-----------
 5 files changed, 101 insertions(+), 92 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4cbf2db3e3..b798ff8115 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3462,6 +3462,26 @@ FIELD(TBFLAG_A64, TCMA, 16, 2)
 FIELD(TBFLAG_A64, MTE_ACTIVE, 18, 1)
 FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 
+/*
+ * Helpers for using the above.
+ */
+#define DP_TBFLAG_ANY(DST, WHICH, VAL) \
+    (DST = FIELD_DP32(DST, TBFLAG_ANY, WHICH, VAL))
+#define DP_TBFLAG_A64(DST, WHICH, VAL) \
+    (DST = FIELD_DP32(DST, TBFLAG_A64, WHICH, VAL))
+#define DP_TBFLAG_A32(DST, WHICH, VAL) \
+    (DST = FIELD_DP32(DST, TBFLAG_A32, WHICH, VAL))
+#define DP_TBFLAG_M32(DST, WHICH, VAL) \
+    (DST = FIELD_DP32(DST, TBFLAG_M32, WHICH, VAL))
+#define DP_TBFLAG_AM32(DST, WHICH, VAL) \
+    (DST = FIELD_DP32(DST, TBFLAG_AM32, WHICH, VAL))
+
+#define EX_TBFLAG_ANY(IN, WHICH)   FIELD_EX32(IN, TBFLAG_ANY, WHICH)
+#define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX32(IN, TBFLAG_A64, WHICH)
+#define EX_TBFLAG_A32(IN, WHICH)   FIELD_EX32(IN, TBFLAG_A32, WHICH)
+#define EX_TBFLAG_M32(IN, WHICH)   FIELD_EX32(IN, TBFLAG_M32, WHICH)
+#define EX_TBFLAG_AM32(IN, WHICH)  FIELD_EX32(IN, TBFLAG_AM32, WHICH)
+
 /**
  * cpu_mmu_index:
  * @env: The cpu environment
@@ -3472,7 +3492,7 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
  */
 static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
 {
-    return FIELD_EX32(env->hflags, TBFLAG_ANY, MMUIDX);
+    return EX_TBFLAG_ANY(env->hflags, MMUIDX);
 }
 
 static inline bool bswap_code(bool sctlr_b)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 061c8ff846..9cc3b066e2 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1020,7 +1020,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
          * the hflags rebuild, since we can pull the composite TBII field
          * from there.
          */
-        tbii = FIELD_EX32(env->hflags, TBFLAG_A64, TBII);
+        tbii = EX_TBFLAG_A64(env->hflags, TBII);
         if ((tbii >> extract64(new_pc, 55, 1)) & 1) {
             /* TBI is enabled. */
             int core_mmu_idx = cpu_mmu_index(env, false);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cd8dec126f..2769e6fd35 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12987,12 +12987,11 @@ ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
                                       ARMMMUIdx mmu_idx, uint32_t flags)
 {
-    flags = FIELD_DP32(flags, TBFLAG_ANY, FPEXC_EL, fp_el);
-    flags = FIELD_DP32(flags, TBFLAG_ANY, MMUIDX,
-                       arm_to_core_mmu_idx(mmu_idx));
+    DP_TBFLAG_ANY(flags, FPEXC_EL, fp_el);
+    DP_TBFLAG_ANY(flags, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
 
     if (arm_singlestep_active(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, SS_ACTIVE, 1);
+        DP_TBFLAG_ANY(flags, SS_ACTIVE, 1);
     }
     return flags;
 }
@@ -13003,12 +13002,12 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
     bool sctlr_b = arm_sctlr_b(env);
 
     if (sctlr_b) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR__B, 1);
+        DP_TBFLAG_A32(flags, SCTLR__B, 1);
     }
     if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
+        DP_TBFLAG_ANY(flags, BE_DATA, 1);
     }
-    flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
+    DP_TBFLAG_A32(flags, NS, !access_secure_reg(env));
 
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
@@ -13019,7 +13018,7 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
     uint32_t flags = 0;
 
     if (arm_v7m_is_handler_mode(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_M32, HANDLER, 1);
+        DP_TBFLAG_M32(flags, HANDLER, 1);
     }
 
     /*
@@ -13030,7 +13029,7 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
     if (arm_feature(env, ARM_FEATURE_V8) &&
         !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
           (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
-        flags = FIELD_DP32(flags, TBFLAG_M32, STACKCHECK, 1);
+        DP_TBFLAG_M32(flags, STACKCHECK, 1);
     }
 
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
@@ -13040,8 +13039,7 @@ static uint32_t rebuild_hflags_aprofile(CPUARMState *env)
 {
     int flags = 0;
 
-    flags = FIELD_DP32(flags, TBFLAG_ANY, DEBUG_TARGET_EL,
-                       arm_debug_target_el(env));
+    DP_TBFLAG_ANY(flags, DEBUG_TARGET_EL, arm_debug_target_el(env));
     return flags;
 }
 
@@ -13051,12 +13049,12 @@ static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
     uint32_t flags = rebuild_hflags_aprofile(env);
 
     if (arm_el_is_aa64(env, 1)) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+        DP_TBFLAG_A32(flags, VFPEN, 1);
     }
 
     if (arm_current_el(env) < 2 && env->cp15.hstr_el2 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, HSTR_ACTIVE, 1);
+        DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
     }
 
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
@@ -13071,14 +13069,14 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     uint64_t sctlr;
     int tbii, tbid;
 
-    flags = FIELD_DP32(flags, TBFLAG_ANY, AARCH64_STATE, 1);
+    DP_TBFLAG_ANY(flags, AARCH64_STATE, 1);
 
     /* Get control bits for tagged addresses.  */
     tbid = aa64_va_parameter_tbi(tcr, mmu_idx);
     tbii = tbid & ~aa64_va_parameter_tbid(tcr, mmu_idx);
 
-    flags = FIELD_DP32(flags, TBFLAG_A64, TBII, tbii);
-    flags = FIELD_DP32(flags, TBFLAG_A64, TBID, tbid);
+    DP_TBFLAG_A64(flags, TBII, tbii);
+    DP_TBFLAG_A64(flags, TBID, tbid);
 
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
         int sve_el = sve_exception_el(env, el);
@@ -13093,14 +13091,14 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         } else {
             zcr_len = sve_zcr_len_for_el(env, el);
         }
-        flags = FIELD_DP32(flags, TBFLAG_A64, SVEEXC_EL, sve_el);
-        flags = FIELD_DP32(flags, TBFLAG_A64, ZCR_LEN, zcr_len);
+        DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
+        DP_TBFLAG_A64(flags, ZCR_LEN, zcr_len);
     }
 
     sctlr = regime_sctlr(env, stage1);
 
     if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
+        DP_TBFLAG_ANY(flags, BE_DATA, 1);
     }
 
     if (cpu_isar_feature(aa64_pauth, env_archcpu(env))) {
@@ -13111,14 +13109,14 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
          * The decision of which action to take is left to a helper.
          */
         if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_EnDB)) {
-            flags = FIELD_DP32(flags, TBFLAG_A64, PAUTH_ACTIVE, 1);
+            DP_TBFLAG_A64(flags, PAUTH_ACTIVE, 1);
         }
     }
 
     if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
         /* Note that SCTLR_EL[23].BT == SCTLR_BT1.  */
         if (sctlr & (el == 0 ? SCTLR_BT0 : SCTLR_BT1)) {
-            flags = FIELD_DP32(flags, TBFLAG_A64, BT, 1);
+            DP_TBFLAG_A64(flags, BT, 1);
         }
     }
 
@@ -13130,7 +13128,7 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         case ARMMMUIdx_SE10_1:
         case ARMMMUIdx_SE10_1_PAN:
             /* TODO: ARMv8.3-NV */
-            flags = FIELD_DP32(flags, TBFLAG_A64, UNPRIV, 1);
+            DP_TBFLAG_A64(flags, UNPRIV, 1);
             break;
         case ARMMMUIdx_E20_2:
         case ARMMMUIdx_E20_2_PAN:
@@ -13141,7 +13139,7 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
              * gated by HCR_EL2.<E2H,TGE> == '11', and so is LDTR.
              */
             if (env->cp15.hcr_el2 & HCR_TGE) {
-                flags = FIELD_DP32(flags, TBFLAG_A64, UNPRIV, 1);
+                DP_TBFLAG_A64(flags, UNPRIV, 1);
             }
             break;
         default:
@@ -13159,24 +13157,23 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
          * 4) If no Allocation Tag Access, then all accesses are Unchecked.
          */
         if (allocation_tag_access_enabled(env, el, sctlr)) {
-            flags = FIELD_DP32(flags, TBFLAG_A64, ATA, 1);
+            DP_TBFLAG_A64(flags, ATA, 1);
             if (tbid
                 && !(env->pstate & PSTATE_TCO)
                 && (sctlr & (el == 0 ? SCTLR_TCF0 : SCTLR_TCF))) {
-                flags = FIELD_DP32(flags, TBFLAG_A64, MTE_ACTIVE, 1);
+                DP_TBFLAG_A64(flags, MTE_ACTIVE, 1);
             }
         }
         /* And again for unprivileged accesses, if required.  */
-        if (FIELD_EX32(flags, TBFLAG_A64, UNPRIV)
+        if (EX_TBFLAG_A64(flags, UNPRIV)
             && tbid
             && !(env->pstate & PSTATE_TCO)
             && (sctlr & SCTLR_TCF0)
             && allocation_tag_access_enabled(env, 0, sctlr)) {
-            flags = FIELD_DP32(flags, TBFLAG_A64, MTE0_ACTIVE, 1);
+            DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
         }
         /* Cache TCMA as well as TBI. */
-        flags = FIELD_DP32(flags, TBFLAG_A64, TCMA,
-                           aa64_va_parameter_tcma(tcr, mmu_idx));
+        DP_TBFLAG_A64(flags, TCMA, aa64_va_parameter_tcma(tcr, mmu_idx));
     }
 
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
@@ -13272,10 +13269,10 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     *cs_base = 0;
     assert_hflags_rebuild_correctly(env);
 
-    if (FIELD_EX32(flags, TBFLAG_ANY, AARCH64_STATE)) {
+    if (EX_TBFLAG_ANY(flags, AARCH64_STATE)) {
         *pc = env->pc;
         if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
-            flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
+            DP_TBFLAG_A64(flags, BTYPE, env->btype);
         }
     } else {
         *pc = env->regs[15];
@@ -13284,7 +13281,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
                 FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S)
                 != env->v7m.secure) {
-                flags = FIELD_DP32(flags, TBFLAG_M32, FPCCR_S_WRONG, 1);
+                DP_TBFLAG_M32(flags, FPCCR_S_WRONG, 1);
             }
 
             if ((env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
@@ -13296,12 +13293,12 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                  * active FP context; we must create a new FP context before
                  * executing any FP insn.
                  */
-                flags = FIELD_DP32(flags, TBFLAG_M32, NEW_FP_CTXT_NEEDED, 1);
+                DP_TBFLAG_M32(flags, NEW_FP_CTXT_NEEDED, 1);
             }
 
             bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
             if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
-                flags = FIELD_DP32(flags, TBFLAG_M32, LSPACT, 1);
+                DP_TBFLAG_M32(flags, LSPACT, 1);
             }
         } else {
             /*
@@ -13309,21 +13306,18 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
              * Note that VECLEN+VECSTRIDE are RES0 for M-profile.
              */
             if (arm_feature(env, ARM_FEATURE_XSCALE)) {
-                flags = FIELD_DP32(flags, TBFLAG_A32,
-                                   XSCALE_CPAR, env->cp15.c15_cpar);
+                DP_TBFLAG_A32(flags, XSCALE_CPAR, env->cp15.c15_cpar);
             } else {
-                flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN,
-                                   env->vfp.vec_len);
-                flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE,
-                                   env->vfp.vec_stride);
+                DP_TBFLAG_A32(flags, VECLEN, env->vfp.vec_len);
+                DP_TBFLAG_A32(flags, VECSTRIDE, env->vfp.vec_stride);
             }
             if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)) {
-                flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+                DP_TBFLAG_A32(flags, VFPEN, 1);
             }
         }
 
-        flags = FIELD_DP32(flags, TBFLAG_AM32, THUMB, env->thumb);
-        flags = FIELD_DP32(flags, TBFLAG_AM32, CONDEXEC, env->condexec_bits);
+        DP_TBFLAG_AM32(flags, THUMB, env->thumb);
+        DP_TBFLAG_AM32(flags, CONDEXEC, env->condexec_bits);
     }
 
     /*
@@ -13335,9 +13329,8 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
      *     1            1       Active-not-pending
      * SS_ACTIVE is set in hflags; PSTATE__SS is computed every TB.
      */
-    if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE) &&
-        (env->pstate & PSTATE_SS)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE__SS, 1);
+    if (EX_TBFLAG_ANY(flags, SS_ACTIVE) && (env->pstate & PSTATE_SS)) {
+        DP_TBFLAG_ANY(flags, PSTATE__SS, 1);
     }
 
     *pflags = flags;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 64b3a5200c..05d83a5f7a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14684,28 +14684,28 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
                                !arm_el_is_aa64(env, 3);
     dc->thumb = 0;
     dc->sctlr_b = 0;
-    dc->be_data = FIELD_EX32(tb_flags, TBFLAG_ANY, BE_DATA) ? MO_BE : MO_LE;
+    dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
     dc->condexec_mask = 0;
     dc->condexec_cond = 0;
-    core_mmu_idx = FIELD_EX32(tb_flags, TBFLAG_ANY, MMUIDX);
+    core_mmu_idx = EX_TBFLAG_ANY(tb_flags, MMUIDX);
     dc->mmu_idx = core_to_aa64_mmu_idx(core_mmu_idx);
-    dc->tbii = FIELD_EX32(tb_flags, TBFLAG_A64, TBII);
-    dc->tbid = FIELD_EX32(tb_flags, TBFLAG_A64, TBID);
-    dc->tcma = FIELD_EX32(tb_flags, TBFLAG_A64, TCMA);
+    dc->tbii = EX_TBFLAG_A64(tb_flags, TBII);
+    dc->tbid = EX_TBFLAG_A64(tb_flags, TBID);
+    dc->tcma = EX_TBFLAG_A64(tb_flags, TCMA);
     dc->current_el = arm_mmu_idx_to_el(dc->mmu_idx);
 #if !defined(CONFIG_USER_ONLY)
     dc->user = (dc->current_el == 0);
 #endif
-    dc->fp_excp_el = FIELD_EX32(tb_flags, TBFLAG_ANY, FPEXC_EL);
-    dc->sve_excp_el = FIELD_EX32(tb_flags, TBFLAG_A64, SVEEXC_EL);
-    dc->sve_len = (FIELD_EX32(tb_flags, TBFLAG_A64, ZCR_LEN) + 1) * 16;
-    dc->pauth_active = FIELD_EX32(tb_flags, TBFLAG_A64, PAUTH_ACTIVE);
-    dc->bt = FIELD_EX32(tb_flags, TBFLAG_A64, BT);
-    dc->btype = FIELD_EX32(tb_flags, TBFLAG_A64, BTYPE);
-    dc->unpriv = FIELD_EX32(tb_flags, TBFLAG_A64, UNPRIV);
-    dc->ata = FIELD_EX32(tb_flags, TBFLAG_A64, ATA);
-    dc->mte_active[0] = FIELD_EX32(tb_flags, TBFLAG_A64, MTE_ACTIVE);
-    dc->mte_active[1] = FIELD_EX32(tb_flags, TBFLAG_A64, MTE0_ACTIVE);
+    dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
+    dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
+    dc->sve_len = (EX_TBFLAG_A64(tb_flags, ZCR_LEN) + 1) * 16;
+    dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
+    dc->bt = EX_TBFLAG_A64(tb_flags, BT);
+    dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
+    dc->unpriv = EX_TBFLAG_A64(tb_flags, UNPRIV);
+    dc->ata = EX_TBFLAG_A64(tb_flags, ATA);
+    dc->mte_active[0] = EX_TBFLAG_A64(tb_flags, MTE_ACTIVE);
+    dc->mte_active[1] = EX_TBFLAG_A64(tb_flags, MTE0_ACTIVE);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
@@ -14732,10 +14732,10 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
      *   emit code to generate a software step exception
      *   end the TB
      */
-    dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
-    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE__SS);
+    dc->ss_active = EX_TBFLAG_ANY(tb_flags, SS_ACTIVE);
+    dc->pstate_ss = EX_TBFLAG_ANY(tb_flags, PSTATE__SS);
     dc->is_ldex = false;
-    dc->debug_target_el = FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
+    dc->debug_target_el = EX_TBFLAG_ANY(tb_flags, DEBUG_TARGET_EL);
 
     /* Bound the number of insns to execute to those left on the page.  */
     bound = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 45e320f4b3..6774d17e8f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8848,46 +8848,42 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
      */
     dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
                                !arm_el_is_aa64(env, 3);
-    dc->thumb = FIELD_EX32(tb_flags, TBFLAG_AM32, THUMB);
-    dc->be_data = FIELD_EX32(tb_flags, TBFLAG_ANY, BE_DATA) ? MO_BE : MO_LE;
-    condexec = FIELD_EX32(tb_flags, TBFLAG_AM32, CONDEXEC);
+    dc->thumb = EX_TBFLAG_AM32(tb_flags, THUMB);
+    dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
+    condexec = EX_TBFLAG_AM32(tb_flags, CONDEXEC);
     dc->condexec_mask = (condexec & 0xf) << 1;
     dc->condexec_cond = condexec >> 4;
 
-    core_mmu_idx = FIELD_EX32(tb_flags, TBFLAG_ANY, MMUIDX);
+    core_mmu_idx = EX_TBFLAG_ANY(tb_flags, MMUIDX);
     dc->mmu_idx = core_to_arm_mmu_idx(env, core_mmu_idx);
     dc->current_el = arm_mmu_idx_to_el(dc->mmu_idx);
 #if !defined(CONFIG_USER_ONLY)
     dc->user = (dc->current_el == 0);
 #endif
-    dc->fp_excp_el = FIELD_EX32(tb_flags, TBFLAG_ANY, FPEXC_EL);
+    dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
         dc->be_data = MO_TE;
-        dc->v7m_handler_mode = FIELD_EX32(tb_flags, TBFLAG_M32, HANDLER);
+        dc->v7m_handler_mode = EX_TBFLAG_M32(tb_flags, HANDLER);
         dc->v8m_secure = arm_feature(env, ARM_FEATURE_M_SECURITY) &&
             regime_is_secure(env, dc->mmu_idx);
-        dc->v8m_stackcheck = FIELD_EX32(tb_flags, TBFLAG_M32, STACKCHECK);
-        dc->v8m_fpccr_s_wrong =
-            FIELD_EX32(tb_flags, TBFLAG_M32, FPCCR_S_WRONG);
+        dc->v8m_stackcheck = EX_TBFLAG_M32(tb_flags, STACKCHECK);
+        dc->v8m_fpccr_s_wrong = EX_TBFLAG_M32(tb_flags, FPCCR_S_WRONG);
         dc->v7m_new_fp_ctxt_needed =
-            FIELD_EX32(tb_flags, TBFLAG_M32, NEW_FP_CTXT_NEEDED);
-        dc->v7m_lspact = FIELD_EX32(tb_flags, TBFLAG_M32, LSPACT);
+            EX_TBFLAG_M32(tb_flags, NEW_FP_CTXT_NEEDED);
+        dc->v7m_lspact = EX_TBFLAG_M32(tb_flags, LSPACT);
     } else {
-        dc->be_data =
-            FIELD_EX32(tb_flags, TBFLAG_ANY, BE_DATA) ? MO_BE : MO_LE;
-        dc->debug_target_el =
-            FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
-        dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR__B);
-        dc->hstr_active = FIELD_EX32(tb_flags, TBFLAG_A32, HSTR_ACTIVE);
-        dc->ns = FIELD_EX32(tb_flags, TBFLAG_A32, NS);
-        dc->vfp_enabled = FIELD_EX32(tb_flags, TBFLAG_A32, VFPEN);
+        dc->debug_target_el = EX_TBFLAG_ANY(tb_flags, DEBUG_TARGET_EL);
+        dc->sctlr_b = EX_TBFLAG_A32(tb_flags, SCTLR__B);
+        dc->hstr_active = EX_TBFLAG_A32(tb_flags, HSTR_ACTIVE);
+        dc->ns = EX_TBFLAG_A32(tb_flags, NS);
+        dc->vfp_enabled = EX_TBFLAG_A32(tb_flags, VFPEN);
         if (arm_feature(env, ARM_FEATURE_XSCALE)) {
-            dc->c15_cpar = FIELD_EX32(tb_flags, TBFLAG_A32, XSCALE_CPAR);
+            dc->c15_cpar = EX_TBFLAG_A32(tb_flags, XSCALE_CPAR);
         } else {
-            dc->vec_len = FIELD_EX32(tb_flags, TBFLAG_A32, VECLEN);
-            dc->vec_stride = FIELD_EX32(tb_flags, TBFLAG_A32, VECSTRIDE);
+            dc->vec_len = EX_TBFLAG_A32(tb_flags, VECLEN);
+            dc->vec_stride = EX_TBFLAG_A32(tb_flags, VECSTRIDE);
         }
     }
     dc->cp_regs = cpu->cp_regs;
@@ -8908,8 +8904,8 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
      *   emit code to generate a software step exception
      *   end the TB
      */
-    dc->ss_active = FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
-    dc->pstate_ss = FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE__SS);
+    dc->ss_active = EX_TBFLAG_ANY(tb_flags, SS_ACTIVE);
+    dc->pstate_ss = EX_TBFLAG_ANY(tb_flags, PSTATE__SS);
     dc->is_ldex = false;
 
     dc->page_start = dc->base.pc_first & TARGET_PAGE_MASK;
@@ -9353,11 +9349,11 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
     DisasContext dc = { };
     const TranslatorOps *ops = &arm_translator_ops;
 
-    if (FIELD_EX32(tb->flags, TBFLAG_AM32, THUMB)) {
+    if (EX_TBFLAG_AM32(tb->flags, THUMB)) {
         ops = &thumb_translator_ops;
     }
 #ifdef TARGET_AARCH64
-    if (FIELD_EX32(tb->flags, TBFLAG_ANY, AARCH64_STATE)) {
+    if (EX_TBFLAG_ANY(tb->flags, AARCH64_STATE)) {
         ops = &aarch64_translator_ops;
     }
 #endif
-- 
2.25.1


