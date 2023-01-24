Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046C1678C65
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:01:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kM-0000EE-U3; Mon, 23 Jan 2023 19:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kI-0008JG-Rv
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:02 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kG-0001sY-H5
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:02 -0500
Received: by mail-pg1-x529.google.com with SMTP id 141so10283212pgc.0
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4r5uXH4L8nGIwtYKHW9rJtEDV6tOU9ZjQj8r0cJYWOU=;
 b=rQc7qOHEqwS03yHpuF5src3a9lAbce51K6d4Cg2WlB4GXvIyTMDCU15R+EWI9UyQ1T
 xB/WjzWRE1WHUvk7bdcL5XY+xK/s0ikw23n+zJc38rjEEp31c+TsCi7ElnzF9ObjpwNe
 5mlPP7cuFKgvQ1/zmlBiUIDq7nd8bQ/t71i7jrrGwXdKjUw7qONYSElZVhjejRayttbM
 WbV8ZhtJqR9q4y5g2Wp8eL6HVdhvydE7+3jVF6p4bm5H4D8M5I7XCRmG3cQL4XX8aqIU
 Tn1iJu1764njs0IBdpeHwlpdmguG5729n1XRQAHwv/Aa7avDMcvmwCLIpxtVleR+22fF
 nnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4r5uXH4L8nGIwtYKHW9rJtEDV6tOU9ZjQj8r0cJYWOU=;
 b=g3xXO4SFxJc6PlTVFM+pyr2uavpVro9Yb0sgsiJGZFHwnCH8IIvDkNggvO2VmxY/WT
 jUUZ1qhkaI68gFXp+neTMHTEXZjyMo4xtjE4Gx7FIRzbwc+faJXD/AfoA2jeUT9YU0+y
 C9Ob5cfEUiIT4YxStIXU7UBnf14MSC90m0MbzyFsfd0vDLqtZ+hF5eVK0GcVkc+sOto/
 AJaiv7Te9bQ9GaHdxxF9b/GEN8f4c2vqPMxbzwd1cRZ3cxdSLrwa2nm91X8bQOZknDI8
 NJI5FPZU98ZiyszoiMOJSc0nlPjfPU3hG5fXZKr3Bp+B34CnU39y5yd/oflj9NmkhWc2
 142g==
X-Gm-Message-State: AFqh2krejApCBlNbsfzFX3hue35MtzhPFklbWcHTYToIqRa0IuTCIAIs
 k8NXK8z1EYa3czXIM1xppUJUycjiLM4W/IAF
X-Google-Smtp-Source: AMrXdXvVx+r7aR9A3S8fbgCG/8YogtkAE9PpcxB/e+/zdl4AwX/E3l8gvMMQC+pcW1LsM/A0aHt59g==
X-Received: by 2002:a05:6a00:26cc:b0:589:62bd:14d with SMTP id
 p12-20020a056a0026cc00b0058962bd014dmr25668975pfw.1.1674518458914; 
 Mon, 23 Jan 2023 16:00:58 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:00:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 07/22] target/arm: Introduce ARMSecuritySpace
Date: Mon, 23 Jan 2023 14:00:12 -1000
Message-Id: <20230124000027.3565716-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Introduce both the enumeration and functions to retrieve
the current state, and state outside of EL3.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 87 +++++++++++++++++++++++++++++++++++----------
 target/arm/helper.c | 46 ++++++++++++++++++++++++
 2 files changed, 115 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 26bdd6e465..cfc62d60b0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2397,23 +2397,53 @@ static inline int arm_feature(CPUARMState *env, int feature)
 
 void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
 
+/*
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
 #if !defined(CONFIG_USER_ONLY)
-/* Return true if exception levels below EL3 are in secure state,
- * or would be following an exception return to that level.
- * Unlike arm_is_secure() (which is always a question about the
- * _current_ state of the CPU) this doesn't care about the current
- * EL or mode.
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
+ * Return true if exception levels below EL3 are in secure state,
+ * or would be following an exception return to those levels.
  */
 static inline bool arm_is_secure_below_el3(CPUARMState *env)
 {
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
@@ -2432,13 +2462,24 @@ static inline bool arm_is_el3_or_mon(CPUARMState *env)
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
-    if (arm_is_el3_or_mon(env)) {
-        return true;
-    }
-    return arm_is_secure_below_el3(env);
+    ARMSecuritySpace ss = arm_security_space(env);
+    return ss == ARMSS_Secure || ss == ARMSS_Root;
 }
 
 /*
@@ -2457,11 +2498,21 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
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
index 7bd15e9d17..bf78a1d74e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12280,3 +12280,49 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
     }
 }
 #endif
+
+#ifndef CONFIG_USER_ONLY
+ARMSecuritySpace arm_security_space(CPUARMState *env)
+{
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


