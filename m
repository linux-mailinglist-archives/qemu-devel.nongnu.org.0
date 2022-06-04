Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E27B53D587
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:40:06 +0200 (CEST)
Received: from localhost ([::1]:45786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLa1-00072U-AQ
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3b-00007j-FG
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:35 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3Z-0000DM-Kj
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:35 -0400
Received: by mail-pl1-x633.google.com with SMTP id b5so8098431plx.10
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kWtcVx4mUIA7p+snzfjlyFCseNpogg1BsFjQCw5lpL0=;
 b=Zc7Eocd0JHmn2bDVNaKcrB0O5HybR0NYoFyM1NVksyB2MYSAS1swoYy1J7+fwnnIzf
 aOi4OmEgx68LzNf+9aP4UIcJ3hConJs3Xihu9QO12XNpUBDdd/p06jniNRwueUaIW8zT
 InXP6VOQjHaPke+jr7a+0caGIRT43rF/kqe8jNQ8vQxhgmcvLDD5nITGk/ecRwbmOz8K
 qWJBbcPgVJa152UXjDQrnSx2eETrwmP2F53NaoGoDlN/4Ar23QgUizWpjrUvRlPfetUQ
 VBmDHN6AJV3HRzo+AbgXZMDxGxbblbG+kKVUXC1HYymUkUiLIZSWY+un6ejADuIyIh88
 tOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kWtcVx4mUIA7p+snzfjlyFCseNpogg1BsFjQCw5lpL0=;
 b=Y/R/B8bcCUD5gXtymIn9L/RxJhKYK4do3W7i3NC4duf0g1MCkr3N1WISZZHE5R20wq
 byx7Wv8CVVgnmlMg9G3A51YV4wCFxnjN0OjiZLtYvt+jLsb1UO4JfhEqbWoroSvuScem
 O0FpLeIEl3SoSPrpqSxHMB0/J2fOr1HveOKMQVWtAPpoSoww1LY5uOqSTYvHU0BPpKdu
 +3iSs9uGlEYkncif1Td25gzrRN9WUyQv2+/WVLk5vDjvNsp404YWHjWNEkhCnTIZWP/W
 pmh8ekLFZ2fQLk1gobZoVBR0kMG0fRTPOwLl7l6gZiXlpClPZyPJA4ySKD0g5u6eLEfj
 l5TA==
X-Gm-Message-State: AOAM532raM+zMd05+5eA23Yb81i8VvDwRUNKnEnY+LZqgTdxCQHPvC7q
 mLucXe6Z5yNmbYNB+RD6qjESiTDCA1H25g==
X-Google-Smtp-Source: ABdhPJw1rTsdTp56Idg7NTR9Illo7s7d//bL/Z2G1FB/oi9Nb9YSGpSZGRt4CdhL5vEltOKPKFIQmg==
X-Received: by 2002:a17:902:ebd1:b0:162:224f:abbb with SMTP id
 p17-20020a170902ebd100b00162224fabbbmr12984772plg.160.1654315592307; 
 Fri, 03 Jun 2022 21:06:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 25/28] target/arm: Move regime_translation_disabled to ptw.c
Date: Fri,  3 Jun 2022 21:06:04 -0700
Message-Id: <20220604040607.269301-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    | 17 ----------------
 target/arm/helper.c | 47 ---------------------------------------------
 target/arm/ptw.c    | 47 ++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 46 insertions(+), 65 deletions(-)
 delete mode 100644 target/arm/ptw.h

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
deleted file mode 100644
index ed152ddaf4..0000000000
--- a/target/arm/ptw.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/*
- * ARM page table walking.
- *
- * This code is licensed under the GNU GPL v2 or later.
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
- */
-
-#ifndef TARGET_ARM_PTW_H
-#define TARGET_ARM_PTW_H
-
-#ifndef CONFIG_USER_ONLY
-
-bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
-
-#endif /* !CONFIG_USER_ONLY */
-#endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 07b4f7bcc5..7390798463 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -36,7 +36,6 @@
 #include "semihosting/common-semi.h"
 #endif
 #include "cpregs.h"
-#include "ptw.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -10393,52 +10392,6 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
 }
 
 #ifndef CONFIG_USER_ONLY
-
-/* Return true if the specified stage of address translation is disabled */
-bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    uint64_t hcr_el2;
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        switch (env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)] &
-                (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
-        case R_V7M_MPU_CTRL_ENABLE_MASK:
-            /* Enabled, but not for HardFault and NMI */
-            return mmu_idx & ARM_MMU_IDX_M_NEGPRI;
-        case R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK:
-            /* Enabled for all cases */
-            return false;
-        case 0:
-        default:
-            /* HFNMIENA set and ENABLE clear is UNPREDICTABLE, but
-             * we warned about that in armv7m_nvic.c when the guest set it.
-             */
-            return true;
-        }
-    }
-
-    hcr_el2 = arm_hcr_el2_eff(env);
-
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-        /* HCR.DC means HCR.VM behaves as 1 */
-        return (hcr_el2 & (HCR_DC | HCR_VM)) == 0;
-    }
-
-    if (hcr_el2 & HCR_TGE) {
-        /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
-        if (!regime_is_secure(env, mmu_idx) && regime_el(env, mmu_idx) == 1) {
-            return true;
-        }
-    }
-
-    if ((hcr_el2 & HCR_DC) && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
-        /* HCR.DC means SCTLR_EL1.M behaves as 0 */
-        return true;
-    }
-
-    return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
-}
-
 /* Convert a possible stage1+2 MMU index into the appropriate
  * stage 1 MMU index
  */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index dc559e6bdf..ec60afd9bf 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -12,7 +12,6 @@
 #include "cpu.h"
 #include "internals.h"
 #include "idau.h"
-#include "ptw.h"
 
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
@@ -91,6 +90,52 @@ static uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
     }
 }
 
+/* Return true if the specified stage of address translation is disabled */
+static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    uint64_t hcr_el2;
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        switch (env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)] &
+                (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
+        case R_V7M_MPU_CTRL_ENABLE_MASK:
+            /* Enabled, but not for HardFault and NMI */
+            return mmu_idx & ARM_MMU_IDX_M_NEGPRI;
+        case R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK:
+            /* Enabled for all cases */
+            return false;
+        case 0:
+        default:
+            /*
+             * HFNMIENA set and ENABLE clear is UNPREDICTABLE, but
+             * we warned about that in armv7m_nvic.c when the guest set it.
+             */
+            return true;
+        }
+    }
+
+    hcr_el2 = arm_hcr_el2_eff(env);
+
+    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        /* HCR.DC means HCR.VM behaves as 1 */
+        return (hcr_el2 & (HCR_DC | HCR_VM)) == 0;
+    }
+
+    if (hcr_el2 & HCR_TGE) {
+        /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
+        if (!regime_is_secure(env, mmu_idx) && regime_el(env, mmu_idx) == 1) {
+            return true;
+        }
+    }
+
+    if ((hcr_el2 & HCR_DC) && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
+        /* HCR.DC means SCTLR_EL1.M behaves as 0 */
+        return true;
+    }
+
+    return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
+}
+
 static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 {
     /*
-- 
2.34.1


