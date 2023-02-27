Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D708A6A4F7A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:04:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmVN-0007l9-Sz; Mon, 27 Feb 2023 18:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUz-0007fY-3w
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:37 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUx-0000zp-6V
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:36 -0500
Received: by mail-pj1-x102f.google.com with SMTP id oj5so3878164pjb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2H/Gk1sBZb1zXekpLJvx4pEHghvfBzjstzPZ4R0ZjE=;
 b=Mnn2xqoVUyaEtMsfWEBI/Avs2nY20c7q7zcAoC2/VFE0M6/XgkoOBLtjHfbGAbmwhZ
 9J4E5kG4dXYK5g8KmHZUiz8lfvvC2Rgm7Cpq/kNFYjjhSu69y0XRddB76MEGXbd48IFw
 q4P3DqC8TizVDjx3LjvwaWewmakwTdR8uyYJ1+s+JmJ6MPxOL7jOqcBNa9fnbdKcpdwI
 NWfouqldQYlGYY0wftYUYTiB7HQ+3/Ri3eX5/tHG20f0X8fJ0JOOA+D1NYaqOuxmwy3c
 9y/OLOxcs3i1hpJ/pVaiQl2uwX7tFrbN8x8NZW19eS0ru2B5tLA0KYoHV/jYlT0JeKVF
 7x0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2H/Gk1sBZb1zXekpLJvx4pEHghvfBzjstzPZ4R0ZjE=;
 b=xiByrsxXfQQlv9T9dSMDoMngIKXy2vWYJJy+vqkctfqJB4GQ8/swcJWZeP4WFg2LDW
 k3S5mVKhKYcNXucWgYQ9X+63b6T9+te/miUYRtVMWFMPDBXv8UdzyHo2Ars2u5006Egy
 a/sxRpIIB2HHbIX5SotV6tQ/Xe70scl5abrkkbjykmGNUSEc1l7HwxC0kig2xCB+rgb1
 qnCyq8Ch9n6UTmMQGVvX/gfLC3/rK1+AeUk1NZR79TtUbxwKVd4oYB0kyHOvji5S1np5
 ITKhxnv42zQsib1+J7aa3jXdQXdJF/7JlLi7awOT5ypX934/40mTpJhhjW5bUl/zzNVE
 nKuQ==
X-Gm-Message-State: AO0yUKVnT+gpVCS1cTB3x6MGEpFDd2ynBgHF3G/wGIjBIVGD8LsVhFus
 K7V9rV9fWoZlK77PAFJrQ1e0t/+jDgu7ixSxHc8=
X-Google-Smtp-Source: AK7set/7HurfOjHlfPUJNb+DBJqCi+S4G3U8f9Z8KYqRBeQ/HhLqdMB9QjjladFqGrFURA87VWMtUQ==
X-Received: by 2002:a17:90b:3b4b:b0:234:56aa:f176 with SMTP id
 ot11-20020a17090b3b4b00b0023456aaf176mr9561468pjb.24.1677538893487; 
 Mon, 27 Feb 2023 15:01:33 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 05/21] target/arm: Introduce ARMSecuritySpace
Date: Mon, 27 Feb 2023 13:01:06 -1000
Message-Id: <20230227230122.816702-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Introduce both the enumeration and functions to retrieve
the current state, and state outside of EL3.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 89 ++++++++++++++++++++++++++++++++++-----------
 target/arm/helper.c | 60 ++++++++++++++++++++++++++++++
 2 files changed, 127 insertions(+), 22 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8d18d98350..203a3e0046 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2409,25 +2409,53 @@ static inline int arm_feature(CPUARMState *env, int feature)
 
 void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
 
-#if !defined(CONFIG_USER_ONLY)
 /*
+ * ARM v9 security states.
+ * The ordering of the enumeration corresponds to the low 2 bits
+ * of the GPI value, and (except for Root) the concat of NSE:NS.
+ */
+
+typedef enum ARMSecuritySpace {
+    ARMSS_Secure     = 0,
+    ARMSS_NonSecure  = 1,
+    ARMSS_Root       = 2,
+    ARMSS_Realm      = 3,
+} ARMSecuritySpace;
+
+/* Return true if @space is secure, in the pre-v9 sense. */
+static inline bool arm_space_is_secure(ARMSecuritySpace space)
+{
+    return space == ARMSS_Secure || space == ARMSS_Root;
+}
+
+/* Return the ARMSecuritySpace for @secure, assuming !RME or EL[0-2]. */
+static inline ARMSecuritySpace arm_secure_to_space(bool secure)
+{
+    return secure ? ARMSS_Secure : ARMSS_NonSecure;
+}
+
+#if !defined(CONFIG_USER_ONLY)
+/**
+ * arm_security_space_below_el3:
+ * @env: cpu context
+ *
+ * Return the security space of exception levels below EL3, following
+ * an exception return to those levels.  Unlike arm_security_space,
+ * this doesn't care about the current EL.
+ */
+ARMSecuritySpace arm_security_space_below_el3(CPUARMState *env);
+
+/**
+ * arm_is_secure_below_el3:
+ * @env: cpu context
+ *
  * Return true if exception levels below EL3 are in secure state,
- * or would be following an exception return to that level.
- * Unlike arm_is_secure() (which is always a question about the
- * _current_ state of the CPU) this doesn't care about the current
- * EL or mode.
+ * or would be following an exception return to those levels.
  */
 static inline bool arm_is_secure_below_el3(CPUARMState *env)
 {
-    assert(!arm_feature(env, ARM_FEATURE_M));
-    if (arm_feature(env, ARM_FEATURE_EL3)) {
-        return !(env->cp15.scr_el3 & SCR_NS);
-    } else {
-        /* If EL3 is not supported then the secure state is implementation
-         * defined, in which case QEMU defaults to non-secure.
-         */
-        return false;
-    }
+    ARMSecuritySpace ss = arm_security_space_below_el3(env);
+    return ss == ARMSS_Secure;
 }
 
 /* Return true if the CPU is AArch64 EL3 or AArch32 Mon */
@@ -2447,16 +2475,23 @@ static inline bool arm_is_el3_or_mon(CPUARMState *env)
     return false;
 }
 
-/* Return true if the processor is in secure state */
+/**
+ * arm_security_space:
+ * @env: cpu context
+ *
+ * Return the current security space of the cpu.
+ */
+ARMSecuritySpace arm_security_space(CPUARMState *env);
+
+/**
+ * arm_is_secure:
+ * @env: cpu context
+ *
+ * Return true if the processor is in secure state.
+ */
 static inline bool arm_is_secure(CPUARMState *env)
 {
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        return env->v7m.secure;
-    }
-    if (arm_is_el3_or_mon(env)) {
-        return true;
-    }
-    return arm_is_secure_below_el3(env);
+    return arm_space_is_secure(arm_security_space(env));
 }
 
 /*
@@ -2475,11 +2510,21 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
 }
 
 #else
+static inline ARMSecuritySpace arm_security_space_below_el3(CPUARMState *env)
+{
+    return ARMSS_NonSecure;
+}
+
 static inline bool arm_is_secure_below_el3(CPUARMState *env)
 {
     return false;
 }
 
+static inline ARMSecuritySpace arm_security_space(CPUARMState *env)
+{
+    return ARMSS_NonSecure;
+}
+
 static inline bool arm_is_secure(CPUARMState *env)
 {
     return false;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6e9dcb17c4..af71caa7c7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12155,3 +12155,63 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
     }
 }
 #endif
+
+#ifndef CONFIG_USER_ONLY
+ARMSecuritySpace arm_security_space(CPUARMState *env)
+{
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return arm_secure_to_space(env->v7m.secure);
+    }
+
+    /*
+     * If EL3 is not supported then the secure state is implementation
+     * defined, in which case QEMU defaults to non-secure.
+     */
+    if (!arm_feature(env, ARM_FEATURE_EL3)) {
+        return ARMSS_NonSecure;
+    }
+
+    /* Check for AArch64 EL3 or AArch32 Mon. */
+    if (is_a64(env)) {
+        if (extract32(env->pstate, 2, 2) == 3) {
+            if (cpu_isar_feature(aa64_rme, env_archcpu(env))) {
+                return ARMSS_Root;
+            } else {
+                return ARMSS_Secure;
+            }
+        }
+    } else {
+        if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_MON) {
+            return ARMSS_Secure;
+        }
+    }
+
+    return arm_security_space_below_el3(env);
+}
+
+ARMSecuritySpace arm_security_space_below_el3(CPUARMState *env)
+{
+    assert(!arm_feature(env, ARM_FEATURE_M));
+
+    /*
+     * If EL3 is not supported then the secure state is implementation
+     * defined, in which case QEMU defaults to non-secure.
+     */
+    if (!arm_feature(env, ARM_FEATURE_EL3)) {
+        return ARMSS_NonSecure;
+    }
+
+    /*
+     * Note NSE cannot be set without RME, and NSE & !NS is Reserved.
+     * Ignoring NSE when !NS retains consistency without having to
+     * modify other predicates.
+     */
+    if (!(env->cp15.scr_el3 & SCR_NS)) {
+        return ARMSS_Secure;
+    } else if (env->cp15.scr_el3 & SCR_NSE) {
+        return ARMSS_Realm;
+    } else {
+        return ARMSS_NonSecure;
+    }
+}
+#endif /* !CONFIG_USER_ONLY */
-- 
2.34.1


