Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE925FA04A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:39:19 +0200 (CEST)
Received: from localhost ([::1]:52532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtw6-0003ve-Px
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkv-00069W-2h
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:45 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtks-0005Yk-U4
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:44 -0400
Received: by mail-wr1-x435.google.com with SMTP id w18so17308806wro.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=chejyLWzKm+amytX5VjNlCtg/brdV5o/nVcOeHFnjvk=;
 b=mbrsbOmU9SkjUpXqqV/47K5N+87SfreWUQFMApH8wqsU5KcYXe09NuXatd4CXZlnTD
 LJGEALqAFAZcroWcDHXvthPxmDQS8cYkX8U+pXYYe+ZecyT9gG2QdJGpcRSFXpfmKBSm
 Qny6hwCAGiUhYVCf30qnPXZ5uBdXDAaO1/pM2uWrj49dROSLqeMiHWPIfFmVqq9FhmaV
 F10osci7CXK0u87QrZjEvknSX3v2ZGdR1x4e+cEPMJTFN17YMH5+ZNoHD/4TkYJP/2MW
 riGbOJigljRqJ6zQ1uUBWzNqTw5rFVUlTwwNf1RVd0k734wlGHNfNWvWeptyuAA6juVn
 jFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=chejyLWzKm+amytX5VjNlCtg/brdV5o/nVcOeHFnjvk=;
 b=bUr/HDBywjsn9q8IdBKSK0PNhUqdhSXOBheeP4c+yhFddFQk7Mn8Txz0fXf+i38iVD
 a6nw2KrNl2w1HNOZ8Dv/P330934X9Q6JMhkDub8szcJ3OetMeDm4yPzqsWUBKsXuYf7x
 odD/PVbt8LBesBSti2UUFpKfVkkLkRvzU6iNeqLm7Z1rNMzeN9DB5C8At3NknwleXfF+
 +VVtf10uIowf8u1h/67YyFgt4+odZsQDP/IyamNnb+a8psgYxZhfTHiiz2sIxo3mGbhR
 JuCaCSPBUj+/1sbmlebL2S0pug2l1ODSyju+KgC7fkF/6LsDIhCf//m8ufdVpHRj4URy
 TRIQ==
X-Gm-Message-State: ACrzQf0aaXLkKUexTll3vMYAMri6MaF1m2yqGEL85CDxHkPlMBNbVcJr
 2bqvcLJLaKrr1XahkWTN6963xbau2wodVA==
X-Google-Smtp-Source: AMsMyM4EpnsBQW/JY/q+mYBijUFR6vBiC13iMeptjOGxiCZlui/Ka66dO0ilo4lsDZ9/89cC1K+tug==
X-Received: by 2002:adf:f407:0:b0:22e:5848:f6b with SMTP id
 g7-20020adff407000000b0022e58480f6bmr11586883wro.46.1665412061217; 
 Mon, 10 Oct 2022 07:27:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/28] target/arm: Add is_secure parameter to
 regime_translation_disabled
Date: Mon, 10 Oct 2022 15:27:10 +0100
Message-Id: <20221010142730.502083-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Remove the use of regime_is_secure from regime_translation_disabled,
using the new parameter instead.

This fixes a bug in S1_ptw_translate and get_phys_addr where we had
passed ARMMMUIdx_Stage2 and not ARMMMUIdx_Stage2_S to determine if
Stage2 is disabled, affecting FEAT_SEL2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221001162318.153420-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 631d1e25f15..d789807b086 100644
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
@@ -203,7 +204,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
     ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
 
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, s2_mmu_idx)) {
+        !regime_translation_disabled(env, s2_mmu_idx, *is_secure)) {
         GetPhysAddrResult s2 = {};
         int ret;
 
@@ -1357,7 +1358,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     uint32_t base;
     bool is_user = regime_is_user(env, mmu_idx);
 
-    if (regime_translation_disabled(env, mmu_idx)) {
+    if (regime_translation_disabled(env, mmu_idx, is_secure)) {
         /* MPU disabled.  */
         result->phys = address;
         result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -1521,7 +1522,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     result->page_size = TARGET_PAGE_SIZE;
     result->prot = 0;
 
-    if (regime_translation_disabled(env, mmu_idx) ||
+    if (regime_translation_disabled(env, mmu_idx, secure) ||
         m_is_ppb_region(env, address)) {
         /*
          * MPU disabled or M profile PPB access: use default memory map.
@@ -1733,7 +1734,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      * are done in arm_v7m_load_vector(), which always does a direct
      * read using address_space_ldl(), rather than going via this function.
      */
-    if (regime_translation_disabled(env, mmu_idx)) { /* MPU disabled */
+    if (regime_translation_disabled(env, mmu_idx, secure)) { /* MPU disabled */
         hit = true;
     } else if (m_is_ppb_region(env, address)) {
         hit = true;
@@ -2307,7 +2308,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                 result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
-            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
+            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
+                                                   is_secure)) {
                 return ret;
             }
 
@@ -2437,7 +2439,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     /* Definitely a real MMU, not an MPU */
 
-    if (regime_translation_disabled(env, mmu_idx)) {
+    if (regime_translation_disabled(env, mmu_idx, is_secure)) {
         uint64_t hcr;
         uint8_t memattr;
 
-- 
2.25.1


