Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E221A531D3B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:03:02 +0200 (CEST)
Received: from localhost ([::1]:53488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFCe-0000qU-9U
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy3-0008JP-Aq
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:55 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy0-000510-8S
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:54 -0400
Received: by mail-pj1-x102c.google.com with SMTP id l14so15064477pjk.2
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q+QZhQErKHUIz5Yukzx015BIaa2BxFp+5FYfWrFDsdE=;
 b=qsG06/1Y+v9gX1C590KKpyBfGShtarjOQUjGVGu0PygxKViicjiak5e8G73I1/mFHg
 yW1gUlw+J42hHa4PEEp2LeL17bxu/JwnTvTdxbp3MUs+8ynuUFF2TI8gprouJOL2Tto9
 H52Mo0kKV/2WWJmrPyB3sowlFuwNTpw8yjqSW0t/J8+mEJtdaF4ZgrMpNKprqucUo03u
 4DCRurDeRJoX1CZrBLPa0E2PN3xCeZzdzdnzOtfIJhB2KfqxOb4OsD8jpkOUw+/rNNOG
 bJ19SGjckAxhRIvm/5h+gJRL0XS+c0E7vhF79r8vLYZEwmjfhm8c1FDjqONdPZIwPD5V
 Talg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q+QZhQErKHUIz5Yukzx015BIaa2BxFp+5FYfWrFDsdE=;
 b=HEpsHy69XO0rYG1/qoaNAvgeCWFdeACR/EVG1OTvuSLZ4wdWIS04ASXxqiyIlwriNU
 Fokt6HTsnaI5rU09KISa7d2ivzf62uv7nF6d72caST7aK7QIpq03QU0FVgwPGQgC6nS2
 jY0cEJCoiTxIJKOAoXL/xRjYBjSPxS/84DwSDBlO3Elat6NDx5D2mLLNgxYc8ADTZxmY
 kpyuTOt1jDrHTsYSVr6C4YW2WWCKjpgB5Exth6v1qh8Pyq3l4EoGTIijtKqCDEuaFaKT
 IY+ud/nneZuqZvtovdxShGyOui5xMd1E2Rpba4mpKV+Ws5DVhWdm2UW1LQ9D32M7ipzd
 gb2A==
X-Gm-Message-State: AOAM531Fa/sAuTHQRzO5E/Arjq6k3+u9pHgEI7Dy4A+RwSU6pQ4nctIJ
 1cZvnMGmKOv6gIh+OQrllGKDE1EamjsB/A==
X-Google-Smtp-Source: ABdhPJw+C6qr8V+NXZZ9ImQx1wjlhxQZ2RSgdcyRnIuVLXjkVuB2HHVYh2jLmIkT6x9LlCtfcTIrFg==
X-Received: by 2002:a17:903:40d2:b0:161:a2d9:3230 with SMTP id
 t18-20020a17090340d200b00161a2d93230mr24239572pld.57.1653338869913; 
 Mon, 23 May 2022 13:47:49 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/18] target/arm: Move arm_generate_debug_exceptions out of
 line
Date: Mon, 23 May 2022 13:47:30 -0700
Message-Id: <20220523204742.740932-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Move arm_generate_debug_exceptions and its two subroutines,
{aa32,aa64}_generate_debug_exceptions into debug_helper.c,
and the one interface declaration to internals.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 91 -------------------------------------
 target/arm/internals.h    |  1 +
 target/arm/debug_helper.c | 94 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 91 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2e115a0281..92c9758e86 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2996,97 +2996,6 @@ static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
     return (cpu->clidr & R_V7M_CLIDR_CTYPE_ALL_MASK) != 0;
 }
 
-/* See AArch64.GenerateDebugExceptionsFrom() in ARM ARM pseudocode */
-static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
-{
-    int cur_el = arm_current_el(env);
-    int debug_el;
-
-    if (cur_el == 3) {
-        return false;
-    }
-
-    /* MDCR_EL3.SDD disables debug events from Secure state */
-    if (arm_is_secure_below_el3(env)
-        && extract32(env->cp15.mdcr_el3, 16, 1)) {
-        return false;
-    }
-
-    /*
-     * Same EL to same EL debug exceptions need MDSCR_KDE enabled
-     * while not masking the (D)ebug bit in DAIF.
-     */
-    debug_el = arm_debug_target_el(env);
-
-    if (cur_el == debug_el) {
-        return extract32(env->cp15.mdscr_el1, 13, 1)
-            && !(env->daif & PSTATE_D);
-    }
-
-    /* Otherwise the debug target needs to be a higher EL */
-    return debug_el > cur_el;
-}
-
-static inline bool aa32_generate_debug_exceptions(CPUARMState *env)
-{
-    int el = arm_current_el(env);
-
-    if (el == 0 && arm_el_is_aa64(env, 1)) {
-        return aa64_generate_debug_exceptions(env);
-    }
-
-    if (arm_is_secure(env)) {
-        int spd;
-
-        if (el == 0 && (env->cp15.sder & 1)) {
-            /* SDER.SUIDEN means debug exceptions from Secure EL0
-             * are always enabled. Otherwise they are controlled by
-             * SDCR.SPD like those from other Secure ELs.
-             */
-            return true;
-        }
-
-        spd = extract32(env->cp15.mdcr_el3, 14, 2);
-        switch (spd) {
-        case 1:
-            /* SPD == 0b01 is reserved, but behaves as 0b00. */
-        case 0:
-            /* For 0b00 we return true if external secure invasive debug
-             * is enabled. On real hardware this is controlled by external
-             * signals to the core. QEMU always permits debug, and behaves
-             * as if DBGEN, SPIDEN, NIDEN and SPNIDEN are all tied high.
-             */
-            return true;
-        case 2:
-            return false;
-        case 3:
-            return true;
-        }
-    }
-
-    return el != 2;
-}
-
-/* Return true if debugging exceptions are currently enabled.
- * This corresponds to what in ARM ARM pseudocode would be
- *    if UsingAArch32() then
- *        return AArch32.GenerateDebugExceptions()
- *    else
- *        return AArch64.GenerateDebugExceptions()
- * We choose to push the if() down into this function for clarity,
- * since the pseudocode has it at all callsites except for the one in
- * CheckSoftwareStep(), where it is elided because both branches would
- * always return the same value.
- */
-static inline bool arm_generate_debug_exceptions(CPUARMState *env)
-{
-    if (env->aarch64) {
-        return aa64_generate_debug_exceptions(env);
-    } else {
-        return aa32_generate_debug_exceptions(env);
-    }
-}
-
 static inline bool arm_sctlr_b(CPUARMState *env)
 {
     return
diff --git a/target/arm/internals.h b/target/arm/internals.h
index b447d850ae..91702b3ff7 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1318,5 +1318,6 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 
 void aa32_max_features(ARMCPU *cpu);
 bool arm_singlestep_active(CPUARMState *env);
+bool arm_generate_debug_exceptions(CPUARMState *env);
 
 #endif
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 1abf41c5f8..20a0e4261a 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -12,6 +12,100 @@
 #include "exec/helper-proto.h"
 
 
+/* See AArch64.GenerateDebugExceptionsFrom() in ARM ARM pseudocode */
+static bool aa64_generate_debug_exceptions(CPUARMState *env)
+{
+    int cur_el = arm_current_el(env);
+    int debug_el;
+
+    if (cur_el == 3) {
+        return false;
+    }
+
+    /* MDCR_EL3.SDD disables debug events from Secure state */
+    if (arm_is_secure_below_el3(env)
+        && extract32(env->cp15.mdcr_el3, 16, 1)) {
+        return false;
+    }
+
+    /*
+     * Same EL to same EL debug exceptions need MDSCR_KDE enabled
+     * while not masking the (D)ebug bit in DAIF.
+     */
+    debug_el = arm_debug_target_el(env);
+
+    if (cur_el == debug_el) {
+        return extract32(env->cp15.mdscr_el1, 13, 1)
+            && !(env->daif & PSTATE_D);
+    }
+
+    /* Otherwise the debug target needs to be a higher EL */
+    return debug_el > cur_el;
+}
+
+static bool aa32_generate_debug_exceptions(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+
+    if (el == 0 && arm_el_is_aa64(env, 1)) {
+        return aa64_generate_debug_exceptions(env);
+    }
+
+    if (arm_is_secure(env)) {
+        int spd;
+
+        if (el == 0 && (env->cp15.sder & 1)) {
+            /*
+             * SDER.SUIDEN means debug exceptions from Secure EL0
+             * are always enabled. Otherwise they are controlled by
+             * SDCR.SPD like those from other Secure ELs.
+             */
+            return true;
+        }
+
+        spd = extract32(env->cp15.mdcr_el3, 14, 2);
+        switch (spd) {
+        case 1:
+            /* SPD == 0b01 is reserved, but behaves as 0b00. */
+        case 0:
+            /*
+             * For 0b00 we return true if external secure invasive debug
+             * is enabled. On real hardware this is controlled by external
+             * signals to the core. QEMU always permits debug, and behaves
+             * as if DBGEN, SPIDEN, NIDEN and SPNIDEN are all tied high.
+             */
+            return true;
+        case 2:
+            return false;
+        case 3:
+            return true;
+        }
+    }
+
+    return el != 2;
+}
+
+/*
+ * Return true if debugging exceptions are currently enabled.
+ * This corresponds to what in ARM ARM pseudocode would be
+ *    if UsingAArch32() then
+ *        return AArch32.GenerateDebugExceptions()
+ *    else
+ *        return AArch64.GenerateDebugExceptions()
+ * We choose to push the if() down into this function for clarity,
+ * since the pseudocode has it at all callsites except for the one in
+ * CheckSoftwareStep(), where it is elided because both branches would
+ * always return the same value.
+ */
+bool arm_generate_debug_exceptions(CPUARMState *env)
+{
+    if (env->aarch64) {
+        return aa64_generate_debug_exceptions(env);
+    } else {
+        return aa32_generate_debug_exceptions(env);
+    }
+}
+
 /*
  * Is single-stepping active? (Note that the "is EL_D AArch64?" check
  * implicitly means this always returns false in pre-v8 CPUs.)
-- 
2.34.1


