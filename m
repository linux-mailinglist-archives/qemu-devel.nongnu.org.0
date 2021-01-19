Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB982FBB0E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:26:21 +0100 (CET)
Received: from localhost ([::1]:37066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1stg-0000w6-J9
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfB-0007Vp-LF
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:21 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf4-0001Bt-Vx
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:21 -0500
Received: by mail-wm1-x332.google.com with SMTP id c127so50809wmf.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xcI/SLUe6b3DJ3lSGr8JVfex0YNCplisyUUDi/qN7sk=;
 b=A1mMxsD/26t/RvOxtHWONc82PFU7prvKATPToy8G/GqcBfFjS8w5lIl/XSefKCrfh5
 UgePuFLOUpV4t0oh5XZ+UzlrN3HG7F1p3qRiYX/kqUzrZnqdevoiKuqtMa5J/xZEFRzI
 4dVt9x7KSabrnGzGpcGyWWCXUmz4Ba4t8AFfbX0c2QARK0Dacrcyjrq+zT6jDaqpALIm
 CTVui4CIMk2ms2/9yrfNYPzcoew+k3lVnvqInlZhUtXNNQnWVBr04KuGLrFg89ZhUc+H
 vO+cmHTTXAqMIS+BKM9bNHmDXfKswZ7SxGZQpEfA+iFQljcOvbnZyy/M8xB2ieP+tDqX
 M7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xcI/SLUe6b3DJ3lSGr8JVfex0YNCplisyUUDi/qN7sk=;
 b=DMoA08Pk0m2wo0egTi89TLtH2kJqQGgGRfyskHx8ewIRrr371JgLnisFJ1n0mB+1Kv
 6k0eMpRn2TzIIaOUu0bp/z6712VDS5JfB6ka4pT00TWsikw8AyxTpj4oWAi8Kr2W35JZ
 jmehEW3X5CJ7G8MClq4WHgLlVKSnbH9Z8czYAbSYKqGmBHrkhNAhWWm8UEwFarLwqiKy
 BvOJW29WruHHPtP+GRf1EwguCTkfkBT+Iw1G2xgTHgmko+KyQB3YbIBlhfPOgq1tMhoT
 4pjSJVpVAg+6GEAdxEDxg2eB7A6tkvCq1Rr4thZlxRLDAux3q077WRDGtiDmsEdRJsdn
 1Cew==
X-Gm-Message-State: AOAM532xN1lBIdb5/7fzo26jRR1tagGzou1hiq/7o+9u/9pd3vQnVaV3
 A3NJRS+jNLQRb1JvVOQUojzu2G9ZU1+NYA==
X-Google-Smtp-Source: ABdhPJxC6FAzTtQFhc9BoTBSCZAe/pv3KnW/UmRsWGZrs7Asz6JEji4SB/fdwfuYOouVMjU/a7QX0A==
X-Received: by 2002:a1c:8095:: with SMTP id b143mr79354wmd.71.1611069073220;
 Tue, 19 Jan 2021 07:11:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/33] target/arm: factor MDCR_EL2 common handling
Date: Tue, 19 Jan 2021 15:10:39 +0000
Message-Id: <20210119151104.16264-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

This adds a common helper to compute the effective value of MDCR_EL2.
That is the actual value if EL2 is enabled in the current security
context, or 0 elsewise.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-5-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 30b4dde6ddf..fdf504464f1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -539,6 +539,11 @@ static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
     return CP_ACCESS_TRAP_UNCATEGORIZED;
 }
 
+static uint64_t arm_mdcr_el2_eff(CPUARMState *env)
+{
+    return arm_is_el2_enabled(env) ? env->cp15.mdcr_el2 : 0;
+}
+
 /* Check for traps to "powerdown debug" registers, which are controlled
  * by MDCR.TDOSA
  */
@@ -546,11 +551,11 @@ static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
     int el = arm_current_el(env);
-    bool mdcr_el2_tdosa = (env->cp15.mdcr_el2 & MDCR_TDOSA) ||
-        (env->cp15.mdcr_el2 & MDCR_TDE) ||
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tdosa = (mdcr_el2 & MDCR_TDOSA) || (mdcr_el2 & MDCR_TDE) ||
         (arm_hcr_el2_eff(env) & HCR_TGE);
 
-    if (el < 2 && mdcr_el2_tdosa && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && mdcr_el2_tdosa) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDOSA)) {
@@ -566,11 +571,11 @@ static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
                                   bool isread)
 {
     int el = arm_current_el(env);
-    bool mdcr_el2_tdra = (env->cp15.mdcr_el2 & MDCR_TDRA) ||
-        (env->cp15.mdcr_el2 & MDCR_TDE) ||
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tdra = (mdcr_el2 & MDCR_TDRA) || (mdcr_el2 & MDCR_TDE) ||
         (arm_hcr_el2_eff(env) & HCR_TGE);
 
-    if (el < 2 && mdcr_el2_tdra && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && mdcr_el2_tdra) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
@@ -586,11 +591,11 @@ static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
                                   bool isread)
 {
     int el = arm_current_el(env);
-    bool mdcr_el2_tda = (env->cp15.mdcr_el2 & MDCR_TDA) ||
-        (env->cp15.mdcr_el2 & MDCR_TDE) ||
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tda = (mdcr_el2 & MDCR_TDA) || (mdcr_el2 & MDCR_TDE) ||
         (arm_hcr_el2_eff(env) & HCR_TGE);
 
-    if (el < 2 && mdcr_el2_tda && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && mdcr_el2_tda) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
@@ -606,9 +611,9 @@ static CPAccessResult access_tpm(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     int el = arm_current_el(env);
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
 
-    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TPM)
-        && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && (mdcr_el2 & MDCR_TPM)) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TPM)) {
@@ -1348,12 +1353,12 @@ static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
      * trapping to EL2 or EL3 for other accesses.
      */
     int el = arm_current_el(env);
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
 
     if (el == 0 && !(env->cp15.c9_pmuserenr & 1)) {
         return CP_ACCESS_TRAP;
     }
-    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TPM)
-        && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && (mdcr_el2 & MDCR_TPM)) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TPM)) {
@@ -1432,7 +1437,8 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
     bool enabled, prohibited, filtered;
     bool secure = arm_is_secure(env);
     int el = arm_current_el(env);
-    uint8_t hpmn = env->cp15.mdcr_el2 & MDCR_HPMN;
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    uint8_t hpmn = mdcr_el2 & MDCR_HPMN;
 
     if (!arm_feature(env, ARM_FEATURE_PMU)) {
         return false;
@@ -1442,13 +1448,13 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
             (counter < hpmn || counter == 31)) {
         e = env->cp15.c9_pmcr & PMCRE;
     } else {
-        e = env->cp15.mdcr_el2 & MDCR_HPME;
+        e = mdcr_el2 & MDCR_HPME;
     }
     enabled = e && (env->cp15.c9_pmcnten & (1 << counter));
 
     if (!secure) {
         if (el == 2 && (counter < hpmn || counter == 31)) {
-            prohibited = env->cp15.mdcr_el2 & MDCR_HPMD;
+            prohibited = mdcr_el2 & MDCR_HPMD;
         } else {
             prohibited = false;
         }
-- 
2.20.1


