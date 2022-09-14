Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3B5B88DA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:10:47 +0200 (CEST)
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSAA-0000iL-LT
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwb-0000Vb-EB
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:41 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwS-00005h-6C
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:41 -0400
Received: by mail-wm1-x330.google.com with SMTP id o5so7351257wms.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=08B8gQb2lmpmsncem0SFN7qjCMuyv6NQI4M/MAS7Oc4=;
 b=w+X8lKz4CgWH26KyKERUhL2HiTwlZQYH9eiTMJlNGmRcnkN5cA84RnB0fhX1RZmdKs
 3DYoBTFKtxxFkzxxab0AymTjbfuYoZIdOookm/Kvw7SQfXR/Khye66k6vGSqnXqdKLSP
 uNzOMOZ0iXBrDxPTEHiyUarFsk9Rkj+whNC2C5sMKiZFbT0fkDcrUiLvMAOQiJ9tGa7S
 N4iD+UPwchzkE60uNSTwAu5aECRIf1UEx2T5Ocn8bdFoLjfifXAW+IN0cYM16AhehthY
 LJwKWV5XIQ+DsCfOrUNy9QJEJVy5HXBY+I95rrxxfxSs8GXg8ZzlVsHn7lgJXJOC1cp3
 OU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=08B8gQb2lmpmsncem0SFN7qjCMuyv6NQI4M/MAS7Oc4=;
 b=LfOfcYtyAYtJ9tri6n3yv2PqehXL3nkAXhbNX0xBtbXuAv7TkJ4wQDiGLuygRjmtbA
 KfFbY30pRwwOmBjtOpw/HPtMUDiSBFUZUi4cp9h1zTcSojZanSH7aoHyeTHC++xl5OrP
 CG1VGNPPZV1tEAsquTIXIAMdXIkLmEexY998MgRjeOIJktuY0RPrcgOUw52vedtHILpY
 d8YKRkli5N/SKbXEGS82BJ+NaHiXeGXN1s0PM07TQO4FKodoSyZ2uCac96IHCN9HMlYx
 50kRdK/Fy96T+C0RbJGCLiOqMIR1sxT2IyNOlJkzCFGNBk3XQ3TuxH7r55S0VO2ZCKQ1
 VUlA==
X-Gm-Message-State: ACgBeo1lySHwW5OUhtFzUKEe2QAhg5dsflOVPNkZ9LYUutLDoPT34wiG
 XUjhYMVUwNOOQjPIWt7ZX9WuS8hUb0zQxrNU
X-Google-Smtp-Source: AA6agR7Xf9eKgy97MQg0n9cJPLHQj9l47LDOWKJDGKp/xUfKwcgunT6kWWlc7w8/KgdglqzWNkcebA==
X-Received: by 2002:a05:600c:3844:b0:3a6:123:5ac5 with SMTP id
 s4-20020a05600c384400b003a601235ac5mr2793863wmr.102.1663156350871; 
 Wed, 14 Sep 2022 04:52:30 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/20] target/arm: Ignore PMCR.D when PMCR.LC is set
Date: Wed, 14 Sep 2022 12:52:09 +0100
Message-Id: <20220914115217.117532-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

The architecture requires that if PMCR.LC is set (for a 64-bit cycle
counter) then PMCR.D (which enables the clock divider so the counter
ticks every 64 cycles rather than every cycle) should be ignored.  We
were always honouring PMCR.D; fix the bug so we correctly ignore it
in this situation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-5-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a348c7407d..f1b20de16d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1172,6 +1172,17 @@ static void pmu_update_irq(CPUARMState *env)
             (env->cp15.c9_pminten & env->cp15.c9_pmovsr));
 }
 
+static bool pmccntr_clockdiv_enabled(CPUARMState *env)
+{
+    /*
+     * Return true if the clock divider is enabled and the cycle counter
+     * is supposed to tick only once every 64 clock cycles. This is
+     * controlled by PMCR.D, but if PMCR.LC is set to enable the long
+     * (64-bit) cycle counter PMCR.D has no effect.
+     */
+    return (env->cp15.c9_pmcr & (PMCRD | PMCRLC)) == PMCRD;
+}
+
 /*
  * Ensure c15_ccnt is the guest-visible count so that operations such as
  * enabling/disabling the counter or filtering, modifying the count itself,
@@ -1184,8 +1195,7 @@ static void pmccntr_op_start(CPUARMState *env)
 
     if (pmu_counter_enabled(env, 31)) {
         uint64_t eff_cycles = cycles;
-        if (env->cp15.c9_pmcr & PMCRD) {
-            /* Increment once every 64 processor clock cycles */
+        if (pmccntr_clockdiv_enabled(env)) {
             eff_cycles /= 64;
         }
 
@@ -1228,8 +1238,7 @@ static void pmccntr_op_finish(CPUARMState *env)
 #endif
 
         uint64_t prev_cycles = env->cp15.c15_ccnt_delta;
-        if (env->cp15.c9_pmcr & PMCRD) {
-            /* Increment once every 64 processor clock cycles */
+        if (pmccntr_clockdiv_enabled(env)) {
             prev_cycles /= 64;
         }
         env->cp15.c15_ccnt_delta = prev_cycles - env->cp15.c15_ccnt;
-- 
2.34.1


