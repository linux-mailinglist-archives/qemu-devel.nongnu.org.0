Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB75D59C44C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:42:07 +0200 (CEST)
Received: from localhost ([::1]:56950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAV3-0004IR-Sw
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LT-0007ny-8l
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:07 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LL-0000l3-8F
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:06 -0400
Received: by mail-pg1-x529.google.com with SMTP id c24so9669071pgg.11
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=O81TsU9W9xgRybd2C2RW59kpRj18EtKgy1SuNeOJbJ0=;
 b=kiPm+u8Hc8qLcHnZFBkQXnyuVsYdWL5yXKcw5yyulDrYozxrWW120rmERBEfVYBSf/
 MXkoqAxaMGAbTuH97Gz/bKwySgalZw28mPKBPOBnFE+TqwNbdh5AXFncYPQ5GiRLGkcg
 53UBUnTAWIhzPnOoKD5IWWyRcBIUR+oDKvRtYW5FSdNeXQNvLKribFnh+1oF628WhVHd
 bcju/LMAJrCGqXXToCRyhGJn6s18FIX8doyd9shqer7H/4Bjb7ZRenw4ydWZX7fhW27L
 qxJdK/K2k/s5D/iijieFxcgfjgevlnDOUZwjVm9bYTPQh29XGan0n0zulb2cga1q4BGi
 YgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=O81TsU9W9xgRybd2C2RW59kpRj18EtKgy1SuNeOJbJ0=;
 b=w9t6/ZcGH002dzL49TG2/fsFlyy91Cn2Cfvf960lxeADm6kONT/QaAc0H76YjswMqc
 LtrHmnqqbiOqYbwftJ580zc8fbzKwBAIhIwsCCCRnKG5lGdYfa/SNx73Apb8We1+U0T+
 rwOa43H0aFkbAcTTZJi8xmGIhQiYBPsJiV2jmRXOyaHWDO4pqcnBUqC73JpQoSlulSjH
 XuAh3p7kWVKlCGTONhqQKUui7+kxSfSUEtLF8MXFbPIf4zIsFbu7apxBNPikMIjtML//
 QGbw3JAFd8Bi4Li1RHlvuz5xfi0nJpzIxp/asu7x8EePbyeVzJe/2wk136RkFkX/CNzN
 xHxw==
X-Gm-Message-State: ACgBeo2mjSCF9Is3g3HFPNPPgu3yQ0FR/UppCN1b+SqBy1dhOAfnj6hL
 QI6tCJEwFuEDieUO02DDIwlZrl8nqdq5pQ==
X-Google-Smtp-Source: AA6agR6E4+ybGApzzgDpfTyhyCGROJULZl4dUwPGJIKNQa28w0XmQ346r82ni/MRSuGbyez8qnJfhw==
X-Received: by 2002:a63:86c2:0:b0:42a:42d5:a4a6 with SMTP id
 x185-20020a6386c2000000b0042a42d5a4a6mr12720471pgd.189.1661182077816; 
 Mon, 22 Aug 2022 08:27:57 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 19/66] target/arm: Add is_secure parameter to
 regime_translation_disabled
Date: Mon, 22 Aug 2022 08:26:54 -0700
Message-Id: <20220822152741.1617527-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

Remove the use of regime_is_secure from regime_translation_disabled,
using the new parameter instead.

This fixes a bug in S1_ptw_translate and get_phys_addr where we had
passed ARMMMUIdx_Stage2 and not ARMMMUIdx_Stage2_S to determine if
Stage2 is disabled, affecting FEAT_SEL2.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 224ba09ecd..eca7763367 100644
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
@@ -1355,9 +1356,10 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
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
@@ -1521,7 +1523,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     result->page_size = TARGET_PAGE_SIZE;
     result->prot = 0;
 
-    if (regime_translation_disabled(env, mmu_idx) ||
+    if (regime_translation_disabled(env, mmu_idx, secure) ||
         m_is_ppb_region(env, address)) {
         /*
          * MPU disabled or M profile PPB access: use default memory map.
@@ -1732,7 +1734,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      * are done in arm_v7m_load_vector(), which always does a direct
      * read using address_space_ldl(), rather than going via this function.
      */
-    if (regime_translation_disabled(env, mmu_idx)) { /* MPU disabled */
+    if (regime_translation_disabled(env, mmu_idx, secure)) { /* MPU disabled */
         hit = true;
     } else if (m_is_ppb_region(env, address)) {
         hit = true;
@@ -2306,7 +2308,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                 result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
-            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
+            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
+                                                   is_secure)) {
                 return ret;
             }
 
@@ -2434,7 +2437,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     /* Definitely a real MMU, not an MPU */
 
-    if (regime_translation_disabled(env, mmu_idx)) {
+    if (regime_translation_disabled(env, mmu_idx, is_secure)) {
         uint64_t hcr;
         uint8_t memattr;
 
-- 
2.34.1


