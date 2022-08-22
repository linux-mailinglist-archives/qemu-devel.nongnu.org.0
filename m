Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F959C2F5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:37:00 +0200 (CEST)
Received: from localhost ([::1]:48914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9U3-0000qZ-4H
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LP-0007ec-Jz
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:03 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LI-0000dc-CI
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:03 -0400
Received: by mail-pl1-x631.google.com with SMTP id 2so10268530pll.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Qgb+9tm2qJZiaV7ObM3Kp5VKd2kY2geHHlay7myc1Lo=;
 b=BdvkrmNKjWAL38fOCA7Viz1NU1Sb7U8NKOCigP2Gyk36OKdgBFtpy9t6gRnuNW/qc8
 RH+n4pZ2V7FjcypVfW0nKZihdHsxWOROIuO4m++AnbdeUMfQmaMqIyXxxEPv5UgB3j1j
 DZ0wi0qew4G5h2dTRix9/Yzyf6hsJktfUST//ImTGxW39GXgSC7jpsDqPRwp5kFHfxx9
 zzqngs2qlxKvPwPsAwVQpTYilbsP/a87N20y9h/rtzACxxhDlRqL3Ev8zGgiCYMSh7kc
 cO/stD4UsXs6mMGvpWI16Li4wwQQ3KeTLQpTTTTjWz3MJsXb+F7eREdvW50H/RdsXaXi
 AXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Qgb+9tm2qJZiaV7ObM3Kp5VKd2kY2geHHlay7myc1Lo=;
 b=xn42bcbH2hSBKw7YnQrNrTVw9bUWtUJhwFD4pSFSyrOZUhvKraDOPG6QRsizRM85rN
 o3pahw39v+uZYnY3YLeeTOSusGVoqwcvgCNb/lOacNlvwQBkb4mFOVvFn5In7VWzsAib
 fFnYu4O7mZNNJhdZHAMDUWzU0iAyvYh8xvaDwH5v9sGzFKzd+R3pIlPho+Y9yzG5WUQr
 K455ZKwHCu8aPtqOLNl1cMfFIky8qHZ5tNITDJucnEpEBrRf9EuuaJhXo9PleihrhW90
 Pc6o/jLwmG71vwWw/sefZmKI4+oFWDNHCAYX+CeZ6KKP2hw74XyPUlz/CpXsYLRRDh4y
 m5OA==
X-Gm-Message-State: ACgBeo0hClYnvCo8QI5l22TaRyO1TIDZlj7m8f6IuKPsPjsErJrTNdxh
 q23vA5ip4MO0kOinbIhwSZlN1gGLQ74NnQ==
X-Google-Smtp-Source: AA6agR4y7ReE142bo2B0kRh7NisiOz5vdlIjbs0jR4ioUMfi4XDMAvtBhPSoGz2hlI8a9jhXjNlW0w==
X-Received: by 2002:a17:902:d714:b0:170:c27c:d4a with SMTP id
 w20-20020a170902d71400b00170c27c0d4amr20347705ply.18.1661182075611; 
 Mon, 22 Aug 2022 08:27:55 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 16/66] target/arm: Add is_secure parameter to
 pmsav7_use_background_region
Date: Mon, 22 Aug 2022 08:26:51 -0700
Message-Id: <20220822152741.1617527-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Remove the use of regime_is_secure from pmsav7_use_background_region,
using the new parameter instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index fccac2d71f..b7911e88c1 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1489,7 +1489,7 @@ static bool m_is_system_region(CPUARMState *env, uint32_t address)
 }
 
 static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
-                                         bool is_user)
+                                         bool is_secure, bool is_user)
 {
     /*
      * Return true if we should use the default memory map as a
@@ -1502,8 +1502,7 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     }
 
     if (arm_feature(env, ARM_FEATURE_M)) {
-        return env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)]
-            & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
+        return env->v7m.mpu_ctrl[is_secure] & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
     } else {
         return regime_sctlr(env, mmu_idx) & SCTLR_BR;
     }
@@ -1516,6 +1515,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 {
     ARMCPU *cpu = env_archcpu(env);
     int n;
+    bool secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
     result->phys = address;
@@ -1618,7 +1618,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
         }
 
         if (n == -1) { /* no hits */
-            if (!pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+            if (!pmsav7_use_background_region(cpu, mmu_idx, secure, is_user)) {
                 /* background fault */
                 fi->type = ARMFault_Background;
                 return true;
@@ -1738,7 +1738,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     } else if (m_is_ppb_region(env, address)) {
         hit = true;
     } else {
-        if (pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+        if (pmsav7_use_background_region(cpu, mmu_idx, secure, is_user)) {
             hit = true;
         }
 
-- 
2.34.1


