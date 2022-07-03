Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33C564606
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:51:35 +0200 (CEST)
Received: from localhost ([::1]:43550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vKI-0004Lg-4O
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvo-0001R5-Gt
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:16 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvm-0006GD-Ta
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:16 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so2183299pjf.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0mD6vxNSf+I50Th5Elr1blnSVn6mQpha4WrhIJX+W14=;
 b=dG50zlkicATMWfoLUCzIcNqFbb3hbpJPYI3VJs3a9UaSn41+2PXIxFpAK+ENWUhGy/
 52A3wQap/T84l/lln+i3O/sLTzv9uhmwG+mw8XnwhRKb9XHYdW1raMfgX8rcbLF6c4vV
 G8h7hpR3IZM1dJGI6JUnbGGWRagUckwckZlVqTBmUa91heaYnd0Bv1HCPHBKDN3k8Ohl
 s8t3YjHk2BH19NqtroktrM8+wkO0F0/5VxhgnkJdblh4ZnPeTFYPdezcNOjvij/pzRhq
 NGBdIINZfGT84gzuIIsp34e9Dn5znXukPTAaXon86hKsVOIw5cJunjbppNx2pZPR04gL
 08lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0mD6vxNSf+I50Th5Elr1blnSVn6mQpha4WrhIJX+W14=;
 b=3MKL5qExEFqIb9KWiO/Lz3O8xJK0jrbBRSdvoF261c4BNdY2Tb+foAguT3j6WAlZp2
 JfMBMXC/mTq+C0JI6/e/HJoJH5uOEPemXlu+1oyyikz0u0qNaQsEZB+FjX6Q8AInw/Yt
 KSV2Yz0Zs5GsuBCwezw19oVLbUeBmcwVJXLCy8IJMip19s6gFNxSUcGdhclHLU2PgNnd
 +sZbvDNEWm//gZTGOHHNmSofhrSYYTcFjfmdTt0jklPOqRiuWaYDc2MogbOxD9BQQNUs
 IHBPSlelERJ188Wh1T+HKqzEJBBp7XYMT8jIeL0swiuetWOu+gLJucXQIgywOQBzJTAl
 AbRQ==
X-Gm-Message-State: AJIora8H7vvR37QdBGNuHR7x1rvF0rsNeTvDC8ollxqzrtlKce0o3TSl
 oflriD8zZn7EVqbceJ+Bkw7lYMhn70Tiy8vt
X-Google-Smtp-Source: AGRyM1s52YbXJtHiObv/Q5MJth0yQh3WOKvSIacE/4iQErVgavU6jtthZVALQvOHTcdqa7bwVinZzw==
X-Received: by 2002:a17:903:204c:b0:169:9e3:6840 with SMTP id
 q12-20020a170903204c00b0016909e36840mr28823902pla.77.1656836774170; 
 Sun, 03 Jul 2022 01:26:14 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:26:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 36/62] target/arm: Introduce arm_hcr_el2_eff_secstate
Date: Sun,  3 Jul 2022 13:53:53 +0530
Message-Id: <20220703082419.770989-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

For page walking, we may require HCR for a security state
that is not "current".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 20 +++++++++++++-------
 target/arm/helper.c | 11 ++++++++---
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 04423f8d6c..dd577a08bc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2376,15 +2376,15 @@ static inline bool arm_is_secure(CPUARMState *env)
  * Return true if the current security state has AArch64 EL2 or AArch32 Hyp.
  * This corresponds to the pseudocode EL2Enabled()
  */
+static inline bool arm_is_el2_enabled_secstate(CPUARMState *env, bool secure)
+{
+    return (arm_feature(env, ARM_FEATURE_EL2)
+            && (!secure || (env->cp15.scr_el3 & SCR_EEL2)));
+}
+
 static inline bool arm_is_el2_enabled(CPUARMState *env)
 {
-    if (arm_feature(env, ARM_FEATURE_EL2)) {
-        if (arm_is_secure_below_el3(env)) {
-            return (env->cp15.scr_el3 & SCR_EEL2) != 0;
-        }
-        return true;
-    }
-    return false;
+    return arm_is_el2_enabled_secstate(env, arm_is_secure_below_el3(env));
 }
 
 #else
@@ -2398,6 +2398,11 @@ static inline bool arm_is_secure(CPUARMState *env)
     return false;
 }
 
+static inline bool arm_is_el2_enabled_secstate(CPUARMState *env, bool secure)
+{
+    return false;
+}
+
 static inline bool arm_is_el2_enabled(CPUARMState *env)
 {
     return false;
@@ -2410,6 +2415,7 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
  * "for all purposes other than a direct read or write access of HCR_EL2."
  * Not included here is HCR_RW.
  */
+uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure);
 uint64_t arm_hcr_el2_eff(CPUARMState *env);
 uint64_t arm_hcrx_el2_eff(CPUARMState *env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7d9d4a9ad9..176be48c46 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5197,15 +5197,15 @@ static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 /*
- * Return the effective value of HCR_EL2.
+ * Return the effective value of HCR_EL2, at the given security state.
  * Bits that are not included here:
  * RW       (read from SCR_EL3.RW as needed)
  */
-uint64_t arm_hcr_el2_eff(CPUARMState *env)
+uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure)
 {
     uint64_t ret = env->cp15.hcr_el2;
 
-    if (!arm_is_el2_enabled(env)) {
+    if (!arm_is_el2_enabled_secstate(env, secure)) {
         /*
          * "This register has no effect if EL2 is not enabled in the
          * current Security state".  This is ARMv8.4-SecEL2 speak for
@@ -5264,6 +5264,11 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return ret;
 }
 
+uint64_t arm_hcr_el2_eff(CPUARMState *env)
+{
+    return arm_hcr_el2_eff_secstate(env, arm_is_secure_below_el3(env));
+}
+
 /*
  * Corresponds to ARM pseudocode function ELIsInHost().
  */
-- 
2.34.1


