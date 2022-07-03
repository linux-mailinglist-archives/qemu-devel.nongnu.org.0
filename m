Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9AE5645DC
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:40:15 +0200 (CEST)
Received: from localhost ([::1]:40422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7v9K-00086G-I6
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvD-00084O-Qg
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:41 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvC-0006As-8l
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:39 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 145so6225248pga.12
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5cg/L7Tmrf48Jc3I5pInXguHqlazi2G1pFqTrme/O8Y=;
 b=R4FWNolkFHLurp/p1MbyFMuSYbN/xvZHkEjc57l+62NxjB8Z43ZfWJDYxNWeRqAOY8
 nZvs23xS5TNnrvOrjLlWHkunGnEBLInJ2NUjt/bTzMx9Sw/RzYg8OmxERVEp4ATbLmLR
 Ih13P6gXfViD485ac8WGjnygxwJa4LGALXAByPUByAeRdp7PxvvP/s1FV2/hCrwFao9g
 kLYJtgNB7EcML2QAXYoBkQO36pgXSj659/QAOhV7FBZ3dW59rch3gcts/Cp7VpKJ+oPC
 nBcKyQ8tPY6HPxK4zeIOEnzGbZpopu43g3x4Gk3OXa6MlQMlsDky8q0c7NwpEMg9q8LJ
 uzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5cg/L7Tmrf48Jc3I5pInXguHqlazi2G1pFqTrme/O8Y=;
 b=b6Tn2sL+/g5wpQx0w1YZyZc7XHtma9kFhzTbdqnySnisQvDQ6frjVRxZC334q5zfaH
 tePChNVsIBgGQCjnMrLZGp/Pt7CQyiJ083nIBE4jXc7JEGlsclAGVYg2NnJJvmW9vpU+
 0tDh95MZ3144HIUQxGZD39HQlRa7BPvVu6SnLJYEUkbxMFiiKCAbwk8rYLjZvqJIWuEY
 l72Lw7xjqUCKecD//k7bBpdMOmpLqCtQowyFugniDJVI5AnbofK6rDkXvpCMzXVS5YWw
 A+dUcRLo55HmqGCKaW5+KmLkldF78nZyUqN6L+WvEkZ6H7ue0spF2zijEMT7YpUGpw8W
 fJpQ==
X-Gm-Message-State: AJIora8g0r40JnJZxx+SDihNzulQzlz3iGB8I7ia4uakY11nFQOeLsM3
 Q4Kd8nYX0i7HK8ZZ/BKQQK4RhzY7X2p8rUF+
X-Google-Smtp-Source: AGRyM1s/zJHZmGb+uF6WGjDKVbZHzLFdzuLyDQkMgMs+MNsXGntSuA7WjcXgx8/wen5BtZmX7RMjqA==
X-Received: by 2002:a05:6a00:4295:b0:528:49a0:131 with SMTP id
 bx21-20020a056a00429500b0052849a00131mr6658273pfb.70.1656836736353; 
 Sun, 03 Jul 2022 01:25:36 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 23/62] target/arm: Add is_secure parameter to
 pmsav7_use_background_region
Date: Sun,  3 Jul 2022 13:53:40 +0530
Message-Id: <20220703082419.770989-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Remove the use of regime_is_secure from pmsav7_use_background_region.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f7892a0c48..23cfccce6c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1485,7 +1485,7 @@ static bool m_is_system_region(CPUARMState *env, uint32_t address)
 }
 
 static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
-                                         bool is_user)
+                                         bool is_secure, bool is_user)
 {
     /*
      * Return true if we should use the default memory map as a
@@ -1498,8 +1498,7 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     }
 
     if (arm_feature(env, ARM_FEATURE_M)) {
-        return env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)]
-            & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
+        return env->v7m.mpu_ctrl[is_secure] & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
     } else {
         return regime_sctlr(env, mmu_idx) & SCTLR_BR;
     }
@@ -1512,6 +1511,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 {
     ARMCPU *cpu = env_archcpu(env);
     int n;
+    bool secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
     result->phys = address;
@@ -1614,7 +1614,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
         }
 
         if (n == -1) { /* no hits */
-            if (!pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+            if (!pmsav7_use_background_region(cpu, mmu_idx, secure, is_user)) {
                 /* background fault */
                 fi->type = ARMFault_Background;
                 return true;
@@ -1734,7 +1734,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     } else if (m_is_ppb_region(env, address)) {
         hit = true;
     } else {
-        if (pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+        if (pmsav7_use_background_region(cpu, mmu_idx, secure, is_user)) {
             hit = true;
         }
 
-- 
2.34.1


