Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E202FBB09
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:23:46 +0100 (CET)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1srB-0005mF-Sg
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf9-0007PT-KO
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:19 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf2-0001A3-Uo
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:19 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d13so20036000wrc.13
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DHzkt4IfyalhDCMUKDCDwgoZ2lV9u2g9RGW9C8XTO9s=;
 b=V9v4WGYIMkhSdzPV02Qh7HTxHvWZ/UPQonSu5vzabZ8pnNXE/rLQ7S4GzfQo+LvT73
 E2aPHHh8XHNP/p4vi/5aiS5zu7OhgbgHtR0wce6GNsgGeoMdk6RTNegGY/UC8RPUpAPN
 Oya0WLqAqBB5BupWs8yJ/+fZk7By0ntOP8Am7kqtKIE2G2OyVlBt26q7l0tDOfvZXItT
 zx2qKvNefPViDOFrjdzM/Xv0IHiRpBy2fFQOjsPgQ5s0IYiJwDPH2FRo+OqfhoZyjNzO
 DXpkohZhYrHEKgjE/qTwa5X96sPl9uDL1YChLWLvf3Q1pLub0QwCzf50vGZ3HuuOUUVm
 w2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DHzkt4IfyalhDCMUKDCDwgoZ2lV9u2g9RGW9C8XTO9s=;
 b=coF4FZmvWtlskh0vLtRucArpo9pFb9mNr4AqnjVLTMLpWjLu3cPvSyMHeWeBtcPd+q
 Zr8l2rrffjDzrtbcdBTXiM6jCj1f6Y8iySq8xyCKEZNr+qlwRBAQa5pQZgYyTPaIxLCe
 t80lw1d4HhMlFN+3rk+gOkltyvgIoCgZXh1nwENFBORk3wqiv34wzVOsjit6wGIs/YzR
 Bd1SpExvGY8oHzj947+18JLJ1bR5b7h40xFO6LUPa2yWYZEaoGsPrJgFsStuYezEkUBK
 fVCcXfC614YcReRMNEzlymAaSLpMj0NLrLoTOPjlBAfNsdIVp9/rlYmR7ERWgzBTiw2C
 zp0g==
X-Gm-Message-State: AOAM531p26ZZF0l3yoKQ2gAHQVUeP7BYIhMPT87OZ2ld9RI5ap3Re9Zs
 1DV7iOJo44P3gBsApI9jjxGfjAIAJw6z1A==
X-Google-Smtp-Source: ABdhPJwZzkUFbf3767lJpjeZIZUfMLb5gmTG7T15+vvt1LN+D/IZ/MZA7hK5vA4SUcftOhfv7IS5HA==
X-Received: by 2002:adf:9dc4:: with SMTP id q4mr4744016wre.367.1611069071654; 
 Tue, 19 Jan 2021 07:11:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/33] target/arm: use arm_is_el2_enabled() where applicable
Date: Tue, 19 Jan 2021 15:10:37 +0000
Message-Id: <20210119151104.16264-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Do not assume that EL2 is available in and only in non-secure context.
That equivalence is broken by ARMv8.4-SEL2.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-3-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h        |  4 ++--
 target/arm/helper-a64.c |  8 +-------
 target/arm/helper.c     | 33 +++++++++++++--------------------
 3 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0bdda90914a..66e36032949 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2210,7 +2210,7 @@ static inline bool arm_el_is_aa64(CPUARMState *env, int el)
         return aa64;
     }
 
-    if (arm_feature(env, ARM_FEATURE_EL2) && !arm_is_secure_below_el3(env)) {
+    if (arm_is_el2_enabled(env)) {
         aa64 = aa64 && (env->cp15.hcr_el2 & HCR_RW);
     }
 
@@ -3154,7 +3154,7 @@ static inline int arm_debug_target_el(CPUARMState *env)
     bool secure = arm_is_secure(env);
     bool route_to_el2 = false;
 
-    if (arm_feature(env, ARM_FEATURE_EL2) && !secure) {
+    if (arm_is_el2_enabled(env)) {
         route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
                        env->cp15.mdcr_el2 & MDCR_TDE;
     }
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 30b2ad119f3..c426c23d2c4 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -972,8 +972,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
     if (new_el == -1) {
         goto illegal_return;
     }
-    if (new_el > cur_el
-        || (new_el == 2 && !arm_feature(env, ARM_FEATURE_EL2))) {
+    if (new_el > cur_el || (new_el == 2 && !arm_is_el2_enabled(env))) {
         /* Disallow return to an EL which is unimplemented or higher
          * than the current one.
          */
@@ -985,11 +984,6 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         goto illegal_return;
     }
 
-    if (new_el == 2 && arm_is_secure_below_el3(env)) {
-        /* Return to the non-existent secure-EL2 */
-        goto illegal_return;
-    }
-
     if (new_el == 1 && (arm_hcr_el2_eff(env) & HCR_TGE)) {
         goto illegal_return;
     }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b2ea93c4722..ae208ab00fa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1049,8 +1049,8 @@ static CPAccessResult cpacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     if (arm_feature(env, ARM_FEATURE_V8)) {
         /* Check if CPACR accesses are to be trapped to EL2 */
-        if (arm_current_el(env) == 1 &&
-            (env->cp15.cptr_el[2] & CPTR_TCPAC) && !arm_is_secure(env)) {
+        if (arm_current_el(env) == 1 && arm_is_el2_enabled(env) &&
+            (env->cp15.cptr_el[2] & CPTR_TCPAC)) {
             return CP_ACCESS_TRAP_EL2;
         /* Check if CPACR accesses are to be trapped to EL3 */
         } else if (arm_current_el(env) < 3 &&
@@ -2520,7 +2520,7 @@ static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx,
                                         bool isread)
 {
     unsigned int cur_el = arm_current_el(env);
-    bool secure = arm_is_secure(env);
+    bool has_el2 = arm_is_el2_enabled(env);
     uint64_t hcr = arm_hcr_el2_eff(env);
 
     switch (cur_el) {
@@ -2544,8 +2544,7 @@ static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx,
             }
         } else {
             /* If HCR_EL2.<E2H> == 0: check CNTHCTL_EL2.EL1PCEN. */
-            if (arm_feature(env, ARM_FEATURE_EL2) &&
-                timeridx == GTIMER_PHYS && !secure &&
+            if (has_el2 && timeridx == GTIMER_PHYS &&
                 !extract32(env->cp15.cnthctl_el2, 1, 1)) {
                 return CP_ACCESS_TRAP_EL2;
             }
@@ -2554,8 +2553,7 @@ static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx,
 
     case 1:
         /* Check CNTHCTL_EL2.EL1PCTEN, which changes location based on E2H. */
-        if (arm_feature(env, ARM_FEATURE_EL2) &&
-            timeridx == GTIMER_PHYS && !secure &&
+        if (has_el2 && timeridx == GTIMER_PHYS &&
             (hcr & HCR_E2H
              ? !extract32(env->cp15.cnthctl_el2, 10, 1)
              : !extract32(env->cp15.cnthctl_el2, 0, 1))) {
@@ -2570,7 +2568,7 @@ static CPAccessResult gt_timer_access(CPUARMState *env, int timeridx,
                                       bool isread)
 {
     unsigned int cur_el = arm_current_el(env);
-    bool secure = arm_is_secure(env);
+    bool has_el2 = arm_is_el2_enabled(env);
     uint64_t hcr = arm_hcr_el2_eff(env);
 
     switch (cur_el) {
@@ -2591,8 +2589,7 @@ static CPAccessResult gt_timer_access(CPUARMState *env, int timeridx,
         /* fall through */
 
     case 1:
-        if (arm_feature(env, ARM_FEATURE_EL2) &&
-            timeridx == GTIMER_PHYS && !secure) {
+        if (has_el2 && timeridx == GTIMER_PHYS) {
             if (hcr & HCR_E2H) {
                 /* If HCR_EL2.<E2H,TGE> == '10': check CNTHCTL_EL2.EL1PTEN. */
                 if (!extract32(env->cp15.cnthctl_el2, 11, 1)) {
@@ -4248,11 +4245,9 @@ static const ARMCPRegInfo strongarm_cp_reginfo[] = {
 
 static uint64_t midr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    ARMCPU *cpu = env_archcpu(env);
     unsigned int cur_el = arm_current_el(env);
-    bool secure = arm_is_secure(env);
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_EL2) && !secure && cur_el == 1) {
+    if (arm_is_el2_enabled(env) && cur_el == 1) {
         return env->cp15.vpidr_el2;
     }
     return raw_read(env, ri);
@@ -4279,9 +4274,8 @@ static uint64_t mpidr_read_val(CPUARMState *env)
 static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     unsigned int cur_el = arm_current_el(env);
-    bool secure = arm_is_secure(env);
 
-    if (arm_feature(env, ARM_FEATURE_EL2) && !secure && cur_el == 1) {
+    if (arm_is_el2_enabled(env) && cur_el == 1) {
         return env->cp15.vmpidr_el2;
     }
     return mpidr_read_val(env);
@@ -5348,7 +5342,7 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
 {
     uint64_t ret = env->cp15.hcr_el2;
 
-    if (arm_is_secure_below_el3(env)) {
+    if (!arm_is_el2_enabled(env)) {
         /*
          * "This register has no effect if EL2 is not enabled in the
          * current Security state".  This is ARMv8.4-SecEL2 speak for
@@ -6145,7 +6139,7 @@ int sve_exception_el(CPUARMState *env, int el)
     /* CPTR_EL2.  Since TZ and TFP are positive,
      * they will be zero when EL2 is not present.
      */
-    if (el <= 2 && !arm_is_secure_below_el3(env)) {
+    if (el <= 2 && arm_is_el2_enabled(env)) {
         if (env->cp15.cptr_el[2] & CPTR_TZ) {
             return 2;
         }
@@ -8720,8 +8714,7 @@ static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
         }
         return 0;
     case ARM_CPU_MODE_HYP:
-        return !arm_feature(env, ARM_FEATURE_EL2)
-            || arm_current_el(env) < 2 || arm_is_secure_below_el3(env);
+        return !arm_is_el2_enabled(env) || arm_current_el(env) < 2;
     case ARM_CPU_MODE_MON:
         return arm_current_el(env) < 3;
     default:
@@ -12647,7 +12640,7 @@ int fp_exception_el(CPUARMState *env, int cur_el)
 
     /* CPTR_EL2 : present in v7VE or v8 */
     if (cur_el <= 2 && extract32(env->cp15.cptr_el[2], 10, 1)
-        && !arm_is_secure_below_el3(env)) {
+        && arm_is_el2_enabled(env)) {
         /* Trap FP ops at EL2, NS-EL1 or NS-EL0 to EL2 */
         return 2;
     }
-- 
2.20.1


