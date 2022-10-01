Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613195F1DB3
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:39:42 +0200 (CEST)
Received: from localhost ([::1]:51874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefWf-0004xx-F9
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHW-0006kT-8k
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:05 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:46075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHQ-0006HO-EF
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:00 -0400
Received: by mail-qv1-xf32.google.com with SMTP id g9so834498qvo.12
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=7gsclz+yJ1LC9lf4uAjmiJKG45xyG8DkF/pgWvR4z/U=;
 b=OhjW+ZSOGIbPYAfy2rXRKqigSG+IVjzfqEgCODIMYJ0nhqT5sFZ8iyUOz0nlvaj/s5
 xhNYdAZSM5G1O9EtPPxT8xNS2M1uSvPDLJ2SN/KN0INYsWaUWgjzaFdsZlsbr3ddPCQS
 bfEiKpZSe0f6JMAuJlk4/wQRMv73NgjqUV1jE/+ri8TaCTl9mA20zd4IWaB5+xbgkdHu
 ICYmR5X3XV9lkAJ5i5aM0j61lyL/oeANjNb1/6WdVyaE+trBp+FYCMDleHYRH3l7aRqK
 C2jUgjb+/ZGS0vik+dYBtmdHyfiKd+zHHXQLwVvOIzCGCABGnFt64B8vWt1MECjSqmke
 k/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7gsclz+yJ1LC9lf4uAjmiJKG45xyG8DkF/pgWvR4z/U=;
 b=01e520FgOK5O8if597tllYyypB24DbEYwOFpdzYRzncUMhIW3VSZDL4wODqqCPAQnQ
 BVdGbyUdeHthuRtEmdVW1lyGBO+QEF5B6jfpoiX3nUapka7wgYnpPbiL8GDRJzZ6t4nf
 aKhTi5caKyRCWI2vwpTmAM+PDBewmKizbWPVMgOsa0WVBVsJsOErNN4/zoNgcm4Bi1Rf
 RsEJva15CmPL8hQCRBOlmpnFdKkf9JDhtpTXFeSdtGyaPOp7x/gwN9Ohuu4+1VvALkRW
 tw8Vwtm382MZIL7QHC7ocgBnHp/QY8t5kAotJyNXLu59BdlscZKRuhbj0LWR7mptAi3b
 OVGw==
X-Gm-Message-State: ACrzQf32bL54cJO1XHP4CmfpsAIbzxnMMnIuHhC4+HHjUgaVSCBWjKv6
 PYnKpJ/7byNjm450XchYThN9RpKm6BKUvg==
X-Google-Smtp-Source: AMsMyM4isjJbcb6Qmlik/XkvwTHx/QFbIZZDYxohV6PH9JQBhYH66NhN76Iz/L3r77SmvrY4/HKiVQ==
X-Received: by 2002:ad4:5c6c:0:b0:4b1:7030:b195 with SMTP id
 i12-20020ad45c6c000000b004b17030b195mr5809218qvh.107.1664641434351; 
 Sat, 01 Oct 2022 09:23:54 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 13/42] target/arm: Introduce arm_hcr_el2_eff_secstate
Date: Sat,  1 Oct 2022 09:22:49 -0700
Message-Id: <20221001162318.153420-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
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

For page walking, we may require HCR for a security state
that is not "current".

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 20 +++++++++++++-------
 target/arm/helper.c | 11 ++++++++---
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6475dc0cfd..0f82f4aa1d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2406,15 +2406,15 @@ static inline bool arm_is_secure(CPUARMState *env)
  * Return true if the current security state has AArch64 EL2 or AArch32 Hyp.
  * This corresponds to the pseudocode EL2Enabled()
  */
+static inline bool arm_is_el2_enabled_secstate(CPUARMState *env, bool secure)
+{
+    return arm_feature(env, ARM_FEATURE_EL2)
+           && (!secure || (env->cp15.scr_el3 & SCR_EEL2));
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
@@ -2428,6 +2428,11 @@ static inline bool arm_is_secure(CPUARMState *env)
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
@@ -2440,6 +2445,7 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
  * "for all purposes other than a direct read or write access of HCR_EL2."
  * Not included here is HCR_RW.
  */
+uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure);
 uint64_t arm_hcr_el2_eff(CPUARMState *env);
 uint64_t arm_hcrx_el2_eff(CPUARMState *env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0fd0c73092..4eec22b1f8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5216,15 +5216,15 @@ static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -5283,6 +5283,11 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
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


