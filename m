Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0C356460B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:55:59 +0200 (CEST)
Received: from localhost ([::1]:54634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vOY-0003eY-TN
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvL-0008A2-B6
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:48 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvJ-0006B6-Kg
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:47 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ju17so1427541pjb.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rkur50bTtgiL1BQusxIr0ufhiN00akHEytOTXsqW27E=;
 b=GPy/VTF2nndpvJfBevIatuwIHDO35nO8B+RHiDf1DbLCN3sX1Ue5+sg2YWMDJRx5Ah
 5igQUonfYslrXXK3tG16CliXlXg3D+4V9VQpkcKBwh1Y+2bk0k4zajriwDZA+xEXUZP2
 cxAWSsB1RdTC2Vl4BcC0ITVB+bhVOdXgbXQDvAOB2zl9RLdqIlFLpYYLv30Fk68lLLce
 3xBxOqrzWcVp4R3qrljvlR65R19P0I0fMwUndltrJnTNViCKDyjd9P1U7lsR9XK5A4as
 AZ4XIvONRd2nSiWFWP6IjjyUPbzSPJL1Rruc2Oj9er5KPy0ZTMB0aOQpzfSrzY+kBMvS
 93XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rkur50bTtgiL1BQusxIr0ufhiN00akHEytOTXsqW27E=;
 b=y2ucHfXYjIVT16KHHKNOOuHK2prNxamOatLxBXtiMB6VVGc7A69LU6FN75rmD+CjUc
 JsQ3uEPjXvLH1Ktn+IzD9mLhUCScC/3A89aYgpHH7cozs5/UXaUcNg6JwSFJUa8OZAa9
 9Vw01Fj+OtJQV6viLM6zqnnrfHntleSonNX7ekyz7ffoZaTWQoZ9V+xe87eLYhfb+Kph
 MBFpPActD3wJYT+8u75pP22G9DDhYNqQa+KvBNrypMPhE2y59ka2JY61JK5NCjoCOkhX
 hIf6ftzLhvLn4tl9Pe3N+uxyLBCK1j6Uerrb0hscwO1VFkceLbiE+9LejZ6o/OnZOF56
 t9+A==
X-Gm-Message-State: AJIora/CBWfdcptWp3HPiOzCzrpg71cwQVGpk0EurCsIFGRpEjo/pKMd
 cYTI8M0ifxXVUVDHtZe2QYIsSdz9zQy8LdQj
X-Google-Smtp-Source: AGRyM1tVAybGpmWmVZsH0G+Gj0nMwWHoVjy2F78Efah6f/zCqSS+sTgCUMvuC3XwOBcqOuBleNB68A==
X-Received: by 2002:a17:90a:304e:b0:1ef:75cd:ade4 with SMTP id
 q14-20020a17090a304e00b001ef75cdade4mr7201978pjl.241.1656836744758; 
 Sun, 03 Jul 2022 01:25:44 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 26/62] target/arm: Add is_secure parameter to
 regime_translation_disabled
Date: Sun,  3 Jul 2022 13:53:43 +0530
Message-Id: <20220703082419.770989-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Remove the use of regime_is_secure from regime_translation_disabled.

This fixes a bug in S1_ptw_translate and get_phys_addr where we had
passed ARMMMUIdx_Stage2 and not ARMMMUIdx_Stage2_S to determine if
Stage2 is disabled, affecting FEAT_SEL2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 33fa8f094b..8313a2d74a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -131,12 +131,13 @@ static uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
 }
 
 /* Return true if the specified stage of address translation is disabled */
-static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
+static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
+                                        bool is_secure)
 {
     uint64_t hcr_el2;
 
     if (arm_feature(env, ARM_FEATURE_M)) {
-        switch (env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)] &
+        switch (env->v7m.mpu_ctrl[is_secure] &
                 (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
         case R_V7M_MPU_CTRL_ENABLE_MASK:
             /* Enabled, but not for HardFault and NMI */
@@ -163,7 +164,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
 
     if (hcr_el2 & HCR_TGE) {
         /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
-        if (!regime_is_secure(env, mmu_idx) && regime_el(env, mmu_idx) == 1) {
+        if (!is_secure && regime_el(env, mmu_idx) == 1) {
             return true;
         }
     }
@@ -201,7 +202,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                ARMMMUFaultInfo *fi)
 {
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
+        !regime_translation_disabled(env, ARMMMUIdx_Stage2, *is_secure)) {
         ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
                                           : ARMMMUIdx_Stage2;
         GetPhysAddrResult s2 = {};
@@ -1351,9 +1352,10 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     int n;
     uint32_t mask;
     uint32_t base;
+    bool is_secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
-    if (regime_translation_disabled(env, mmu_idx)) {
+    if (regime_translation_disabled(env, mmu_idx, is_secure)) {
         /* MPU disabled.  */
         result->phys = address;
         result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -1517,7 +1519,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     result->page_size = TARGET_PAGE_SIZE;
     result->prot = 0;
 
-    if (regime_translation_disabled(env, mmu_idx) ||
+    if (regime_translation_disabled(env, mmu_idx, secure) ||
         m_is_ppb_region(env, address)) {
         /*
          * MPU disabled or M profile PPB access: use default memory map.
@@ -1728,7 +1730,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      * are done in arm_v7m_load_vector(), which always does a direct
      * read using address_space_ldl(), rather than going via this function.
      */
-    if (regime_translation_disabled(env, mmu_idx)) { /* MPU disabled */
+    if (regime_translation_disabled(env, mmu_idx, secure)) { /* MPU disabled */
         hit = true;
     } else if (m_is_ppb_region(env, address)) {
         hit = true;
@@ -2303,7 +2305,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                 result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
-            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
+            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
+                                                   is_secure)) {
                 return ret;
             }
 
@@ -2431,7 +2434,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     /* Definitely a real MMU, not an MPU */
 
-    if (regime_translation_disabled(env, mmu_idx)) {
+    if (regime_translation_disabled(env, mmu_idx, is_secure)) {
         uint64_t hcr;
         uint8_t memattr;
 
-- 
2.34.1


