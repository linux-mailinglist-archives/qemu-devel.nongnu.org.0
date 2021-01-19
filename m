Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F037D2FBAE6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:19:38 +0100 (CET)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1snC-0008Di-04
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfD-0007b9-Um
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:23 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf7-0001Cx-Nr
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:23 -0500
Received: by mail-wm1-x32d.google.com with SMTP id v184so75794wma.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jUV6xz2k3pmgkuwwZhW+V6KIhCQ4WWFGLQVHI0QAeM0=;
 b=w6rGuzFy4H2jhnhBmo3rMvqWUli13g1zXM7bk7HiJ6G5adO8Vxzdv6Zq5cqbWpxnsj
 QTWKsPp7QVB1CxJvnt8pefGKP9Ke+d9kB93tWgohMrhZNkIyRMXS30V1hVCbnBDyMCUf
 3qXZmp2RySijrmcd4Ws4INNyMnyN+oCs8VBpuC0Mq7FfPU8KRSTa9pRdMHxh9eEhrNn2
 Hbma9bc/GrZxXGBMPA8j62l/RvlYiUBmTVHh0Hegg6BLgCStTvmPsjMqFArRbB0/LKQP
 aubpx3yH/REOoQk0HrRND3JAtHjfz9qp1npArXDVHhnNwdk0cSYs84HXtrRp4Nr/A66D
 BxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jUV6xz2k3pmgkuwwZhW+V6KIhCQ4WWFGLQVHI0QAeM0=;
 b=DR4XFSu2H6n8EMGcJAoqyKXwsW3MdTpNpSLQBb9QbI6x9YKib8wcmL8H2k8GVYWbvI
 YtrR5wNV2fXdg7cqdHPpxLUUiIbgN+XLokrTewdAdEQ1x//EQXvihY2CeMpb2IV21BsP
 DBqWiRfrxHaWxRDLNed9fpGRA3een9ZWIHdDyFERSlAwyOdJFs4k1k0sN7qrIfZNSnzR
 hANg4b4bq5EicWQpQbwseS8FSQXO0fO2uoIWhcdCCUlJZbPZcra5ZqLcg4HForcMwPGo
 HACvQAD6xJJ3dzNM3J4yF+6NY/fNgFLheb8VjD09/SsWYIagpGpvCkGbVG+OxM6+jTVA
 EsxQ==
X-Gm-Message-State: AOAM532GbkBHrlRwOoFFQQYKEf6Ep5ZfUOYkUWkyt4h+4rTEr95H0GwS
 qkl6SU5YPTAxvOZ+Ybqlw4mCPF0RUTNbIg==
X-Google-Smtp-Source: ABdhPJy8mEF8eTOITLhy3+7FEYPrIpPEgvOIG7bpmQ+sv2losMd8Lw6DIk260QuCmM6eDnQCopqCyw==
X-Received: by 2002:a1c:dec6:: with SMTP id v189mr93387wmg.172.1611069075731; 
 Tue, 19 Jan 2021 07:11:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/33] target/arm: add MMU stage 1 for Secure EL2
Date: Tue, 19 Jan 2021 15:10:42 +0000
Message-Id: <20210119151104.16264-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

This adds the MMU indices for EL2 stage 1 in secure state.

To keep code contained, which is largelly identical between secure and
non-secure modes, the MMU indices are reassigned. The new assignments
provide a systematic pattern with a non-secure bit.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-8-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-param.h     |   2 +-
 target/arm/cpu.h           |  35 ++++++----
 target/arm/internals.h     |  12 ++++
 target/arm/helper.c        | 127 ++++++++++++++++++++++++-------------
 target/arm/translate-a64.c |   4 ++
 5 files changed, 123 insertions(+), 57 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 6321385b469..00e7d9e9377 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -29,6 +29,6 @@
 # define TARGET_PAGE_BITS_MIN  10
 #endif
 
-#define NB_MMU_MODES 11
+#define NB_MMU_MODES 15
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 22a3c8a4cfb..cc1ea586c10 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3049,6 +3049,9 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define ARM_MMU_IDX_NOTLB 0x20  /* does not have a TLB */
 #define ARM_MMU_IDX_M     0x40  /* M profile */
 
+/* Meanings of the bits for A profile mmu idx values */
+#define ARM_MMU_IDX_A_NS     0x8
+
 /* Meanings of the bits for M profile mmu idx values */
 #define ARM_MMU_IDX_M_PRIV   0x1
 #define ARM_MMU_IDX_M_NEGPRI 0x2
@@ -3062,20 +3065,22 @@ typedef enum ARMMMUIdx {
     /*
      * A-profile.
      */
-    ARMMMUIdx_E10_0      =  0 | ARM_MMU_IDX_A,
-    ARMMMUIdx_E20_0      =  1 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE10_0     =  0 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE20_0     =  1 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE10_1     =  2 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE20_2     =  3 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE10_1_PAN =  4 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE20_2_PAN =  5 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE2        =  6 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE3        =  7 | ARM_MMU_IDX_A,
 
-    ARMMMUIdx_E10_1      =  2 | ARM_MMU_IDX_A,
-    ARMMMUIdx_E10_1_PAN  =  3 | ARM_MMU_IDX_A,
-
-    ARMMMUIdx_E2         =  4 | ARM_MMU_IDX_A,
-    ARMMMUIdx_E20_2      =  5 | ARM_MMU_IDX_A,
-    ARMMMUIdx_E20_2_PAN  =  6 | ARM_MMU_IDX_A,
-
-    ARMMMUIdx_SE10_0     = 7 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE10_1     = 8 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE10_1_PAN = 9 | ARM_MMU_IDX_A,
-    ARMMMUIdx_SE3        = 10 | ARM_MMU_IDX_A,
+    ARMMMUIdx_E10_0     = ARMMMUIdx_SE10_0 | ARM_MMU_IDX_A_NS,
+    ARMMMUIdx_E20_0     = ARMMMUIdx_SE20_0 | ARM_MMU_IDX_A_NS,
+    ARMMMUIdx_E10_1     = ARMMMUIdx_SE10_1 | ARM_MMU_IDX_A_NS,
+    ARMMMUIdx_E20_2     = ARMMMUIdx_SE20_2 | ARM_MMU_IDX_A_NS,
+    ARMMMUIdx_E10_1_PAN = ARMMMUIdx_SE10_1_PAN | ARM_MMU_IDX_A_NS,
+    ARMMMUIdx_E20_2_PAN = ARMMMUIdx_SE20_2_PAN | ARM_MMU_IDX_A_NS,
+    ARMMMUIdx_E2        = ARMMMUIdx_SE2 | ARM_MMU_IDX_A_NS,
 
     /*
      * These are not allocated TLBs and are used only for AT system
@@ -3122,8 +3127,12 @@ typedef enum ARMMMUIdxBit {
     TO_CORE_BIT(E20_2),
     TO_CORE_BIT(E20_2_PAN),
     TO_CORE_BIT(SE10_0),
+    TO_CORE_BIT(SE20_0),
     TO_CORE_BIT(SE10_1),
+    TO_CORE_BIT(SE20_2),
     TO_CORE_BIT(SE10_1_PAN),
+    TO_CORE_BIT(SE20_2_PAN),
+    TO_CORE_BIT(SE2),
     TO_CORE_BIT(SE3),
 
     TO_CORE_BIT(MUser),
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5460678756d..e4e6afef19e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -860,6 +860,9 @@ static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
     case ARMMMUIdx_SE10_0:
     case ARMMMUIdx_SE10_1:
     case ARMMMUIdx_SE10_1_PAN:
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
         return true;
     default:
         return false;
@@ -890,6 +893,10 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_SE10_0:
     case ARMMMUIdx_SE10_1:
     case ARMMMUIdx_SE10_1_PAN:
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
+    case ARMMMUIdx_SE2:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
@@ -907,6 +914,7 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_E10_1_PAN:
     case ARMMMUIdx_E20_2_PAN:
     case ARMMMUIdx_SE10_1_PAN:
+    case ARMMMUIdx_SE20_2_PAN:
         return true;
     default:
         return false;
@@ -917,10 +925,14 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
 static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
     case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_SE2:
     case ARMMMUIdx_E2:
         return 2;
     case ARMMMUIdx_SE3:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 47f37b82ba3..a11a76adb8d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2862,6 +2862,9 @@ static int gt_phys_redir_timeridx(CPUARMState *env)
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
         return GTIMER_HYP;
     default:
         return GTIMER_PHYS;
@@ -2874,6 +2877,9 @@ static int gt_virt_redir_timeridx(CPUARMState *env)
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
         return GTIMER_HYPVIRT;
     default:
         return GTIMER_VIRT;
@@ -3577,7 +3583,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
             mmu_idx = ARMMMUIdx_SE3;
             break;
         case 2:
-            g_assert(!secure);  /* TODO: ARMv8.4-SecEL2 */
+            g_assert(!secure);  /* ARMv8.4-SecEL2 is 64-bit only */
             /* fall through */
         case 1:
             if (ri->crm == 9 && (env->uncached_cpsr & CPSR_PAN)) {
@@ -3673,7 +3679,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
             }
             break;
         case 4: /* AT S1E2R, AT S1E2W */
-            mmu_idx = ARMMMUIdx_E2;
+            mmu_idx = secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2;
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_SE3;
@@ -3988,10 +3994,15 @@ static void vmsa_tcr_ttbr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
      */
     if (extract64(raw_read(env, ri) ^ value, 48, 16) &&
         (arm_hcr_el2_eff(env) & HCR_E2H)) {
-        tlb_flush_by_mmuidx(env_cpu(env),
-                            ARMMMUIdxBit_E20_2 |
-                            ARMMMUIdxBit_E20_2_PAN |
-                            ARMMMUIdxBit_E20_0);
+        uint16_t mask = ARMMMUIdxBit_E20_2 |
+                        ARMMMUIdxBit_E20_2_PAN |
+                        ARMMMUIdxBit_E20_0;
+
+        if (arm_is_secure_below_el3(env)) {
+            mask >>= ARM_MMU_IDX_A_NS;
+        }
+
+        tlb_flush_by_mmuidx(env_cpu(env), mask);
     }
     raw_write(env, ri, value);
 }
@@ -4442,9 +4453,15 @@ static int vae1_tlbmask(CPUARMState *env)
     uint64_t hcr = arm_hcr_el2_eff(env);
 
     if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-        return ARMMMUIdxBit_E20_2 |
-               ARMMMUIdxBit_E20_2_PAN |
-               ARMMMUIdxBit_E20_0;
+        uint16_t mask = ARMMMUIdxBit_E20_2 |
+                        ARMMMUIdxBit_E20_2_PAN |
+                        ARMMMUIdxBit_E20_0;
+
+        if (arm_is_secure_below_el3(env)) {
+            mask >>= ARM_MMU_IDX_A_NS;
+        }
+
+        return mask;
     } else if (arm_is_secure_below_el3(env)) {
         return ARMMMUIdxBit_SE10_1 |
                ARMMMUIdxBit_SE10_1_PAN |
@@ -4469,17 +4486,20 @@ static int tlbbits_for_regime(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 static int vae1_tlbbits(CPUARMState *env, uint64_t addr)
 {
+    uint64_t hcr = arm_hcr_el2_eff(env);
     ARMMMUIdx mmu_idx;
 
     /* Only the regime of the mmu_idx below is significant. */
-    if (arm_is_secure_below_el3(env)) {
-        mmu_idx = ARMMMUIdx_SE10_0;
-    } else if ((env->cp15.hcr_el2 & (HCR_E2H | HCR_TGE))
-               == (HCR_E2H | HCR_TGE)) {
+    if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
         mmu_idx = ARMMMUIdx_E20_0;
     } else {
         mmu_idx = ARMMMUIdx_E10_0;
     }
+
+    if (arm_is_secure_below_el3(env)) {
+        mmu_idx &= ~ARM_MMU_IDX_A_NS;
+    }
+
     return tlbbits_for_regime(env, mmu_idx, addr);
 }
 
@@ -4525,11 +4545,17 @@ static int alle1_tlbmask(CPUARMState *env)
 
 static int e2_tlbmask(CPUARMState *env)
 {
-    /* TODO: ARMv8.4-SecEL2 */
-    return ARMMMUIdxBit_E20_0 |
-           ARMMMUIdxBit_E20_2 |
-           ARMMMUIdxBit_E20_2_PAN |
-           ARMMMUIdxBit_E2;
+    if (arm_is_secure_below_el3(env)) {
+        return ARMMMUIdxBit_SE20_0 |
+               ARMMMUIdxBit_SE20_2 |
+               ARMMMUIdxBit_SE20_2_PAN |
+               ARMMMUIdxBit_SE2;
+    } else {
+        return ARMMMUIdxBit_E20_0 |
+               ARMMMUIdxBit_E20_2 |
+               ARMMMUIdxBit_E20_2_PAN |
+               ARMMMUIdxBit_E2;
+    }
 }
 
 static void tlbi_aa64_alle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4649,10 +4675,12 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
-    int bits = tlbbits_for_regime(env, ARMMMUIdx_E2, pageaddr);
+    bool secure = arm_is_secure_below_el3(env);
+    int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
+    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
+                                  pageaddr);
 
-    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                                  ARMMMUIdxBit_E2, bits);
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
 }
 
 static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -9954,7 +9982,8 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
     if (el == 0) {
         ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
-        el = (mmu_idx == ARMMMUIdx_E20_0 ? 2 : 1);
+        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
+             ? 2 : 1;
     }
     return env->cp15.sctlr_el[el];
 }
@@ -10083,6 +10112,7 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
     switch (mmu_idx) {
     case ARMMMUIdx_SE10_0:
     case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_SE20_0:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MSUser:
@@ -12676,6 +12706,7 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_SE20_0:
         return 0;
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
@@ -12685,6 +12716,9 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     case ARMMMUIdx_E2:
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_SE2:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
         return 2;
     case ARMMMUIdx_SE3:
         return 3;
@@ -12702,6 +12736,9 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 
 ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
 {
+    ARMMMUIdx idx;
+    uint64_t hcr;
+
     if (arm_feature(env, ARM_FEATURE_M)) {
         return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
     }
@@ -12709,40 +12746,43 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
     /* See ARM pseudo-function ELIsInHost.  */
     switch (el) {
     case 0:
-        if (arm_is_secure_below_el3(env)) {
-            return ARMMMUIdx_SE10_0;
+        hcr = arm_hcr_el2_eff(env);
+        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+            idx = ARMMMUIdx_E20_0;
+        } else {
+            idx = ARMMMUIdx_E10_0;
         }
-        if ((env->cp15.hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)
-            && arm_el_is_aa64(env, 2)) {
-            return ARMMMUIdx_E20_0;
-        }
-        return ARMMMUIdx_E10_0;
+        break;
     case 1:
-        if (arm_is_secure_below_el3(env)) {
-            if (env->pstate & PSTATE_PAN) {
-                return ARMMMUIdx_SE10_1_PAN;
-            }
-            return ARMMMUIdx_SE10_1;
-        }
         if (env->pstate & PSTATE_PAN) {
-            return ARMMMUIdx_E10_1_PAN;
+            idx = ARMMMUIdx_E10_1_PAN;
+        } else {
+            idx = ARMMMUIdx_E10_1;
         }
-        return ARMMMUIdx_E10_1;
+        break;
     case 2:
-        /* TODO: ARMv8.4-SecEL2 */
         /* Note that TGE does not apply at EL2.  */
-        if ((env->cp15.hcr_el2 & HCR_E2H) && arm_el_is_aa64(env, 2)) {
+        if (arm_hcr_el2_eff(env) & HCR_E2H) {
             if (env->pstate & PSTATE_PAN) {
-                return ARMMMUIdx_E20_2_PAN;
+                idx = ARMMMUIdx_E20_2_PAN;
+            } else {
+                idx = ARMMMUIdx_E20_2;
             }
-            return ARMMMUIdx_E20_2;
+        } else {
+            idx = ARMMMUIdx_E2;
         }
-        return ARMMMUIdx_E2;
+        break;
     case 3:
         return ARMMMUIdx_SE3;
     default:
         g_assert_not_reached();
     }
+
+    if (arm_is_secure_below_el3(env)) {
+        idx &= ~ARM_MMU_IDX_A_NS;
+    }
+
+    return idx;
 }
 
 ARMMMUIdx arm_mmu_idx(CPUARMState *env)
@@ -12907,7 +12947,8 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
             break;
         case ARMMMUIdx_E20_2:
         case ARMMMUIdx_E20_2_PAN:
-            /* TODO: ARMv8.4-SecEL2 */
+        case ARMMMUIdx_SE20_2:
+        case ARMMMUIdx_SE20_2_PAN:
             /*
              * Note that EL20_2 is gated by HCR_EL2.E2H == 1, but EL20_0 is
              * gated by HCR_EL2.<E2H,TGE> == '11', and so is LDTR.
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ef63edfc680..ffc060e5d70 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -118,6 +118,10 @@ static int get_a64_user_mem_index(DisasContext *s)
         case ARMMMUIdx_SE10_1_PAN:
             useridx = ARMMMUIdx_SE10_0;
             break;
+        case ARMMMUIdx_SE20_2:
+        case ARMMMUIdx_SE20_2_PAN:
+            useridx = ARMMMUIdx_SE20_0;
+            break;
         default:
             g_assert_not_reached();
         }
-- 
2.20.1


