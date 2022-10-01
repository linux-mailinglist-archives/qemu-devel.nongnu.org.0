Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6155F1D90
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:26:52 +0200 (CEST)
Received: from localhost ([::1]:36682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefKF-00040o-N1
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefH5-0006WJ-FX
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:35 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:47038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefH3-0006EV-UL
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:35 -0400
Received: by mail-qt1-x832.google.com with SMTP id b23so4322506qtr.13
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1FqO/N9pjgiiBZnjptWqpBsjNoDh4nF55unoVGGZ15E=;
 b=J9r8uic4TB2HoXqNDO4naBMrtbWQ/HlsKOqMLd+y1haOoDBx1uPXVhc8CimtzJVhCm
 Jv0dz9l6xhLtKJ2l/7ktGrrK1Z00Bk88H17VL9pKAFYUNdf+K+e+FQiiU5toSaI9by6t
 AS7W+pF+Rhhe9wCB6Y3eAP3XH0EGU8xHx8S6Yyy+XUG106C5C+UaihATPfzCl/9vACAJ
 gz+x6ikWD26iqHs+AaYxXvBCglBGV1iduFEoVF9dxFrThmLK0FrUXmCJ91QOf1iAay91
 n9dg5XBVWKQGpqg2WbLtHShZZ8YE75Yvi8d4dXLTJHwkeDn3lyRAZEyeqP22Vb4a69W4
 uFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1FqO/N9pjgiiBZnjptWqpBsjNoDh4nF55unoVGGZ15E=;
 b=T/zGNuOr5s3I5KviCPe7r/5quC4H+gto6b0lgQWagEvZh872PAbIrBbVrfQlOQHlmq
 6SIxVzcR54FgRzeLyB8ouOhQIFcEKQNgPhnMX/zeGaI4t3pDLdDzuqdrxp/alsqtSZlO
 cjjEDur5dtofodxrAHGLePqcUOpB+aRjOQSXLkonCDrYuKz2nhbM1epVpu/AcKhMXE2z
 h7aPd8xH4PaQ613pqCqaGrVB62QeMmAi45spekNdNISwc0hh/27oPdKX0Rui9/fYP3eW
 7wIAQRnXZog+zdOcxJh6lMvslohSajo6asZfGtHeOlS0wmc5nDYbi3f2LcLSfs0tDHei
 QRcA==
X-Gm-Message-State: ACrzQf2KJ6e9Jruy2EiXpD5dox+t/78wECbYcYFkLH7+Cq0mL2Mw14Uv
 nUCzRBTA/YByOfqA2+ofkJoy57DJYn+x0g==
X-Google-Smtp-Source: AMsMyM6hmDWSAB6weAcqCD4pSBfsr2WeVFqZI49VpInu9i4S7mmoCswPfh7eI9rU0+P+m3+7fh0ClA==
X-Received: by 2002:a05:622a:111:b0:35d:51e8:9620 with SMTP id
 u17-20020a05622a011100b0035d51e89620mr11160539qtw.172.1664641412784; 
 Sat, 01 Oct 2022 09:23:32 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 04/42] target/arm: Add is_secure parameter to
 regime_translation_disabled
Date: Sat,  1 Oct 2022 09:22:40 -0700
Message-Id: <20221001162318.153420-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5192418c0e..f9b7c316d0 100644
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
 
@@ -2438,7 +2440,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     /* Definitely a real MMU, not an MPU */
 
-    if (regime_translation_disabled(env, mmu_idx)) {
+    if (regime_translation_disabled(env, mmu_idx, is_secure)) {
         uint64_t hcr;
         uint8_t memattr;
 
-- 
2.34.1


