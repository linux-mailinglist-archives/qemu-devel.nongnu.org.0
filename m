Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1AF2FBB4B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:36:32 +0100 (CET)
Received: from localhost ([::1]:33622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1t3X-0003cW-Lg
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfI-0007kU-ID
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:28 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfC-0001Gk-3p
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:28 -0500
Received: by mail-wm1-x336.google.com with SMTP id m187so75644wme.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nckMc5z7PTiK90ghv0bCg3vGCgI8lrO2dL5g74ki5JE=;
 b=Lqyk82ALlV03g4Mg4y3tzZlXojkryAVltH2Hwp/MK3f/2JKFtGzhEOeMgrOvzYKC92
 IF52CsIF7g2GATr0vGD1llBFwuRMSFzzMSvWbWN9S50mlObNK9PwdSiXvCiAPETvLElX
 bgrV9SBHOHMtzeSHbbdk13IaHVVXeAATxqpyoUmcAQussfWZfWaji/2O3wuyGnD2op3f
 PCGvww6DIrujNOdYypFj3I8sHOn2G7ctV1zz4sRfM6TW493q9wYODwV5U9H8MMsjLCBX
 gSFYGW01gzCHMcvBZjZbV6WWKoNn2PKFjtjlj3Wycd18DtgP52eLs9k18/9BPsAFjtuU
 2cKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nckMc5z7PTiK90ghv0bCg3vGCgI8lrO2dL5g74ki5JE=;
 b=LGBxbrQThy8JENN353x/QtEpKHOS43BSgMT9TjBKtl6OQhAUjqd5DLot21DVYvwJdI
 T8oXYiP2sfliD2lRYUAGae8dVqcgdxjPpsPl4uC+AQiETPhL4u0sdbluZwM1hSM3JPFi
 fWmQ8O6OBVI1/3LG9LIXLSbtoR0V1urpDjNcW48nI/TJIlYRzBPu+NooxQDX9z2vTLF4
 hQJXLLxJ0Rws8igbMQ52FPuTrVYPo/j272JI8h22xiCgk4P4+kgWJqjWFROsuiB/vkvp
 pmgSg2DnjAX3hoEmty4N/y+WGcsgjSSI8xzKTQJu9bIcTJyFwajXiK/dch9i+abMG8pA
 PUSA==
X-Gm-Message-State: AOAM5330F2Iwqjm2eGMKG+mqsdYQl8bk2q7nHz/NPKYKTzy6o5sGwEtG
 hGuhc0cALb7nqLMiyipVzSQPOUWj2SDfpw==
X-Google-Smtp-Source: ABdhPJxE7tx48eqJmvpd1tOBBxP1yH0RDmdVYvHBNOkXTgfAL8U+JQnihnN92r8tGBhtDDp4i5duyg==
X-Received: by 2002:a1c:e902:: with SMTP id q2mr68145wmc.143.1611069080631;
 Tue, 19 Jan 2021 07:11:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/33] target/arm: secure stage 2 translation regime
Date: Tue, 19 Jan 2021 15:10:48 +0000
Message-Id: <20210119151104.16264-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-14-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |  6 +++-
 target/arm/internals.h | 22 ++++++++++++
 target/arm/helper.c    | 78 +++++++++++++++++++++++++++++-------------
 3 files changed, 81 insertions(+), 25 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 53d0e989f05..235df64cd7a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3096,6 +3096,9 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1_PAN = 2 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage1_SE0 = 3 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage1_SE1 = 4 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage1_SE1_PAN = 5 | ARM_MMU_IDX_NOTLB,
     /*
      * Not allocated a TLB: used only for second stage of an S12 page
      * table walk, or for descriptor loads during first stage of an S1
@@ -3103,7 +3106,8 @@ typedef enum ARMMMUIdx {
      * then various TLB flush insns which currently are no-ops or flush
      * only stage 1 MMU indexes will need to change to flush stage 2.
      */
-    ARMMMUIdx_Stage2     = 3 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage2     = 6 | ARM_MMU_IDX_NOTLB,
+    ARMMMUIdx_Stage2_S   = 7 | ARM_MMU_IDX_NOTLB,
 
     /*
      * M-profile.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index e4e6afef19e..3aec10263e0 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -851,6 +851,9 @@ static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_Stage1_SE1:
+    case ARMMMUIdx_Stage1_SE1_PAN:
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
@@ -896,7 +899,11 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_SE20_0:
     case ARMMMUIdx_SE20_2:
     case ARMMMUIdx_SE20_2_PAN:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_Stage1_SE1:
+    case ARMMMUIdx_Stage1_SE1_PAN:
     case ARMMMUIdx_SE2:
+    case ARMMMUIdx_Stage2_S:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
@@ -911,6 +918,7 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_Stage1_SE1_PAN:
     case ARMMMUIdx_E10_1_PAN:
     case ARMMMUIdx_E20_2_PAN:
     case ARMMMUIdx_SE10_1_PAN:
@@ -932,18 +940,22 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
     case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Stage2_S:
     case ARMMMUIdx_SE2:
     case ARMMMUIdx_E2:
         return 2;
     case ARMMMUIdx_SE3:
         return 3;
     case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_Stage1_SE0:
         return arm_el_is_aa64(env, 3) ? 1 : 3;
     case ARMMMUIdx_SE10_1:
     case ARMMMUIdx_SE10_1_PAN:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_Stage1_SE1:
+    case ARMMMUIdx_Stage1_SE1_PAN:
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
@@ -967,6 +979,13 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     if (mmu_idx == ARMMMUIdx_Stage2) {
         return &env->cp15.vtcr_el2;
     }
+    if (mmu_idx == ARMMMUIdx_Stage2_S) {
+        /*
+         * Note: Secure stage 2 nominally shares fields from VTCR_EL2, but
+         * those are not currently used by QEMU, so just return VSTCR_EL2.
+         */
+        return &env->cp15.vstcr_el2;
+    }
     return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
 
@@ -1169,6 +1188,9 @@ static inline bool arm_mmu_idx_is_stage1_of_2(ARMMMUIdx mmu_idx)
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_Stage1_SE1:
+    case ARMMMUIdx_Stage1_SE1_PAN:
         return true;
     default:
         return false;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 75166a21583..fae5611c603 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3430,7 +3430,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
         uint32_t syn, fsr, fsc;
         bool take_exc = false;
 
-        if (fi.s1ptw && current_el == 1 && !arm_is_secure(env)
+        if (fi.s1ptw && current_el == 1
             && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
             /*
              * Synchronous stage 2 fault on an access made as part of the
@@ -3587,10 +3587,10 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             /* fall through */
         case 1:
             if (ri->crm == 9 && (env->uncached_cpsr & CPSR_PAN)) {
-                mmu_idx = (secure ? ARMMMUIdx_SE10_1_PAN
+                mmu_idx = (secure ? ARMMMUIdx_Stage1_SE1_PAN
                            : ARMMMUIdx_Stage1_E1_PAN);
             } else {
-                mmu_idx = secure ? ARMMMUIdx_SE10_1 : ARMMMUIdx_Stage1_E1;
+                mmu_idx = secure ? ARMMMUIdx_Stage1_SE1 : ARMMMUIdx_Stage1_E1;
             }
             break;
         default:
@@ -3604,10 +3604,11 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             mmu_idx = ARMMMUIdx_SE10_0;
             break;
         case 2:
+            g_assert(!secure);  /* ARMv8.4-SecEL2 is 64-bit only */
             mmu_idx = ARMMMUIdx_Stage1_E0;
             break;
         case 1:
-            mmu_idx = secure ? ARMMMUIdx_SE10_0 : ARMMMUIdx_Stage1_E0;
+            mmu_idx = secure ? ARMMMUIdx_Stage1_SE0 : ARMMMUIdx_Stage1_E0;
             break;
         default:
             g_assert_not_reached();
@@ -3672,10 +3673,10 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         switch (ri->opc1) {
         case 0: /* AT S1E1R, AT S1E1W, AT S1E1RP, AT S1E1WP */
             if (ri->crm == 9 && (env->pstate & PSTATE_PAN)) {
-                mmu_idx = (secure ? ARMMMUIdx_SE10_1_PAN
+                mmu_idx = (secure ? ARMMMUIdx_Stage1_SE1_PAN
                            : ARMMMUIdx_Stage1_E1_PAN);
             } else {
-                mmu_idx = secure ? ARMMMUIdx_SE10_1 : ARMMMUIdx_Stage1_E1;
+                mmu_idx = secure ? ARMMMUIdx_Stage1_SE1 : ARMMMUIdx_Stage1_E1;
             }
             break;
         case 4: /* AT S1E2R, AT S1E2W */
@@ -3689,7 +3690,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     case 2: /* AT S1E0R, AT S1E0W */
-        mmu_idx = secure ? ARMMMUIdx_SE10_0 : ARMMMUIdx_Stage1_E0;
+        mmu_idx = secure ? ARMMMUIdx_Stage1_SE0 : ARMMMUIdx_Stage1_E0;
         break;
     case 4: /* AT S12E1R, AT S12E1W */
         mmu_idx = secure ? ARMMMUIdx_SE10_1 : ARMMMUIdx_E10_1;
@@ -10051,7 +10052,7 @@ static inline bool regime_translation_disabled(CPUARMState *env,
 
     hcr_el2 = arm_hcr_el2_eff(env);
 
-    if (mmu_idx == ARMMMUIdx_Stage2) {
+    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         /* HCR.DC means HCR.VM behaves as 1 */
         return (hcr_el2 & (HCR_DC | HCR_VM)) == 0;
     }
@@ -10084,6 +10085,9 @@ static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
     if (mmu_idx == ARMMMUIdx_Stage2) {
         return env->cp15.vttbr_el2;
     }
+    if (mmu_idx == ARMMMUIdx_Stage2_S) {
+        return env->cp15.vsttbr_el2;
+    }
     if (ttbrn == 0) {
         return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
     } else {
@@ -10099,6 +10103,12 @@ static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
 static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
+    case ARMMMUIdx_SE10_0:
+        return ARMMMUIdx_Stage1_SE0;
+    case ARMMMUIdx_SE10_1:
+        return ARMMMUIdx_Stage1_SE1;
+    case ARMMMUIdx_SE10_1_PAN:
+        return ARMMMUIdx_Stage1_SE1_PAN;
     case ARMMMUIdx_E10_0:
         return ARMMMUIdx_Stage1_E0;
     case ARMMMUIdx_E10_1:
@@ -10143,6 +10153,7 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_SE20_0:
     case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_SE0:
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MSUser:
     case ARMMMUIdx_MUserNegPri:
@@ -10308,6 +10319,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     int wxn = 0;
 
     assert(mmu_idx != ARMMMUIdx_Stage2);
+    assert(mmu_idx != ARMMMUIdx_Stage2_S);
 
     user_rw = simple_ap_to_rw_prot_is_user(ap, true);
     if (is_user) {
@@ -10402,13 +10414,12 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         hwaddr s2pa;
         int s2prot;
         int ret;
+        ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
+                                          : ARMMMUIdx_Stage2;
         ARMCacheAttrs cacheattrs = {};
         MemTxAttrs txattrs = {};
 
-        assert(!*is_secure); /* TODO: S-EL2 */
-
-        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, ARMMMUIdx_Stage2,
-                                 false,
+        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
                                  &s2pa, &txattrs, &s2prot, &s2size, fi,
                                  &cacheattrs);
         if (ret) {
@@ -10884,7 +10895,7 @@ static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 37, 2);
-    } else if (mmu_idx == ARMMMUIdx_Stage2) {
+    } else if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         return 0; /* VTCR_EL2 */
     } else {
         /* Replicate the single TBI bit so we always have 2 bits.  */
@@ -10896,7 +10907,7 @@ static int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 51, 2);
-    } else if (mmu_idx == ARMMMUIdx_Stage2) {
+    } else if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         return 0; /* VTCR_EL2 */
     } else {
         /* Replicate the single TBID bit so we always have 2 bits.  */
@@ -10926,7 +10937,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         tsz = extract32(tcr, 0, 6);
         using64k = extract32(tcr, 14, 1);
         using16k = extract32(tcr, 15, 1);
-        if (mmu_idx == ARMMMUIdx_Stage2) {
+        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
             /* VTCR_EL2 */
             hpd = false;
         } else {
@@ -10991,6 +11002,8 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
     int select, tsz;
     bool epd, hpd;
 
+    assert(mmu_idx != ARMMMUIdx_Stage2_S);
+
     if (mmu_idx == ARMMMUIdx_Stage2) {
         /* VTCR */
         bool sext = extract32(tcr, 4, 1);
@@ -11156,7 +11169,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         goto do_fault;
     }
 
-    if (mmu_idx != ARMMMUIdx_Stage2) {
+    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
         /* The starting level depends on the virtual address size (which can
          * be up to 48 bits) and the translation granule size. It indicates
          * the number of strides (stride bits at a time) needed to
@@ -11264,7 +11277,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         attrs = extract64(descriptor, 2, 10)
             | (extract64(descriptor, 52, 12) << 10);
 
-        if (mmu_idx == ARMMMUIdx_Stage2) {
+        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
             /* Stage 2 table descriptors do not include any attribute fields */
             break;
         }
@@ -11294,8 +11307,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     ap = extract32(attrs, 4, 2);
 
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        ns = true;
+    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        ns = mmu_idx == ARMMMUIdx_Stage2;
         xn = extract32(attrs, 11, 2);
         *prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
@@ -11322,7 +11335,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         arm_tlb_bti_gp(txattrs) = true;
     }
 
-    if (mmu_idx == ARMMMUIdx_Stage2) {
+    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         cacheattrs->attrs = convert_stage2_attrs(env, extract32(attrs, 0, 4));
     } else {
         /* Index into MAIR registers for cache attributes */
@@ -11341,7 +11354,8 @@ do_fault:
     fi->type = fault_type;
     fi->level = level;
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
-    fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2);
+    fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2 ||
+                               mmu_idx == ARMMMUIdx_Stage2_S);
     return true;
 }
 
@@ -12171,6 +12185,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             int s2_prot;
             int ret;
             ARMCacheAttrs cacheattrs2 = {};
+            ARMMMUIdx s2_mmu_idx;
+            bool is_el0;
 
             ret = get_phys_addr(env, address, access_type, s1_mmu_idx, &ipa,
                                 attrs, prot, page_size, fi, cacheattrs);
@@ -12181,9 +12197,11 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 return ret;
             }
 
+            s2_mmu_idx = attrs->secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+            is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
+
             /* S1 is done. Now do S2 translation.  */
-            ret = get_phys_addr_lpae(env, ipa, access_type, ARMMMUIdx_Stage2,
-                                     mmu_idx == ARMMMUIdx_E10_0,
+            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx, is_el0,
                                      phys_ptr, attrs, &s2_prot,
                                      page_size, fi, &cacheattrs2);
             fi->s2addr = ipa;
@@ -12210,6 +12228,18 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 cacheattrs->shareability = 0;
             }
             *cacheattrs = combine_cacheattrs(*cacheattrs, cacheattrs2);
+
+            /* Check if IPA translates to secure or non-secure PA space. */
+            if (arm_is_secure_below_el3(env)) {
+                if (attrs->secure) {
+                    attrs->secure =
+                        !(env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW));
+                } else {
+                    attrs->secure =
+                        !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA | VTCR_NSW))
+                        || (env->cp15.vstcr_el2.raw_tcr & VSTCR_SA));
+                }
+            }
             return 0;
         } else {
             /*
@@ -12278,7 +12308,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
          * MMU disabled.  S1 addresses within aa64 translation regimes are
          * still checked for bounds -- see AArch64.TranslateAddressS1Off.
          */
-        if (mmu_idx != ARMMMUIdx_Stage2) {
+        if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
             int r_el = regime_el(env, mmu_idx);
             if (arm_el_is_aa64(env, r_el)) {
                 int pamax = arm_pamax(env_archcpu(env));
-- 
2.20.1


