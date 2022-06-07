Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64212541EC8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:36:21 +0200 (CEST)
Received: from localhost ([::1]:40076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhoC-0002dV-FV
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5o-0007J3-Gl
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:25 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5l-0001Kf-U9
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:24 -0400
Received: by mail-pg1-x530.google.com with SMTP id h192so10191908pgc.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=G9K32Uykj512TMGRbyCkUtnhTvXkXswNZtlz1FFInW0=;
 b=ggxYQ7XK8vCza4fF4ufkR2ALuiubsAEdT1YXizhZaGq8ahTHPYCs0gpPfcivojAx2k
 Khl4Z9yJV+EuuSthE3fj2+1HcrpIvRyk0QJG/lp6Vulv85Xes1jnqNDDDJPnFOIL6lvj
 G/5F90X+EqtZwzyz8rShnXuXxo/qm4PIBDKdn925oi1PH2gas3452ZF3/ATRCjQGDZLk
 I0DTfpgnrjChYv40THYvJTkRplq0H0vFnHFZI+zxIflQHuYSnUD9GNMLQ1INwFGe86FK
 jipeS/HzY1+CZDuk+MKEmRau8Sj4ggCrWjXhfpYPXHFl52Ec5+5acybm8lbIpVG6snFh
 kjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G9K32Uykj512TMGRbyCkUtnhTvXkXswNZtlz1FFInW0=;
 b=aXSlnV+7ErBy+zF85b4oZ4T/SOglBgAvPsXQlBkW16EHGTuG1Q0X8F8V/LvNZGWexv
 U2sSb6RNqKjPVk73CNotFUFsepEkwmZ8/KFuWM9Y+fVW3A4YIikmcZ42hUAAP/ZDi6u5
 pCbGbCQOaPeJId/QJ+Cpwvj+QBk6Pd4026PEh4ArW0I17KbO10UAJX3950C4HYBoDj6J
 ZVObB51Sf58czXT/O6B//8PHbHAWmvF5Iqn4pguF17G5NLq9sTBvlQshFIMO4mMo7lR/
 05RN2RQWv6KV+v14DtTh/XQYs3W/jalW5WzO0wt8wfjPnEywSYgHJGzKyMeuNmAGEamf
 plBA==
X-Gm-Message-State: AOAM533cojwpScEb93jBuc9ZvORWqrXTBd0iC5okXcjafSj4S5ifONzL
 4aqtfoxpmPyzPoPi9G6ar3I8b+plRli8Ag==
X-Google-Smtp-Source: ABdhPJxhiXapqqkc7YoPyHyPSgzPl7FP7JpWys19HSB1rG8UGC7loedZn6yBJu1uPUJIeWwBt2iWjw==
X-Received: by 2002:a63:5fc3:0:b0:3fd:f15d:5df6 with SMTP id
 t186-20020a635fc3000000b003fdf15d5df6mr6065351pgb.573.1654634780876; 
 Tue, 07 Jun 2022 13:46:20 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/53] semihosting: Split out common-semi-target.h
Date: Tue,  7 Jun 2022 13:45:28 -0700
Message-Id: <20220607204557.658541-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Move the ARM and RISCV specific helpers into
their own header file.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/common-semi-target.h   | 62 ++++++++++++++++++++
 target/riscv/common-semi-target.h | 50 ++++++++++++++++
 semihosting/arm-compat-semi.c     | 94 +------------------------------
 3 files changed, 113 insertions(+), 93 deletions(-)
 create mode 100644 target/arm/common-semi-target.h
 create mode 100644 target/riscv/common-semi-target.h

diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
new file mode 100644
index 0000000000..629d75ca5a
--- /dev/null
+++ b/target/arm/common-semi-target.h
@@ -0,0 +1,62 @@
+/*
+ * Target-specific parts of semihosting/arm-compat-semi.c.
+ *
+ * Copyright (c) 2005, 2007 CodeSourcery.
+ * Copyright (c) 2019, 2022 Linaro
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_ARM_COMMON_SEMI_TARGET_H
+#define TARGET_ARM_COMMON_SEMI_TARGET_H
+
+#ifndef CONFIG_USER_ONLY
+#include "hw/arm/boot.h"
+#endif
+
+static inline target_ulong common_semi_arg(CPUState *cs, int argno)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    if (is_a64(env)) {
+        return env->xregs[argno];
+    } else {
+        return env->regs[argno];
+    }
+}
+
+static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    if (is_a64(env)) {
+        env->xregs[0] = ret;
+    } else {
+        env->regs[0] = ret;
+    }
+}
+
+static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
+{
+    return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
+}
+
+static inline bool is_64bit_semihosting(CPUArchState *env)
+{
+    return is_a64(env);
+}
+
+static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    return is_a64(env) ? env->xregs[31] : env->regs[13];
+}
+
+static inline bool common_semi_has_synccache(CPUArchState *env)
+{
+    /* Ok for A64, invalid for A32/T32 */
+    return is_a64(env);
+}
+
+#endif
diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
new file mode 100644
index 0000000000..7c8a59e0cc
--- /dev/null
+++ b/target/riscv/common-semi-target.h
@@ -0,0 +1,50 @@
+/*
+ * Target-specific parts of semihosting/arm-compat-semi.c.
+ *
+ * Copyright (c) 2005, 2007 CodeSourcery.
+ * Copyright (c) 2019, 2022 Linaro
+ * Copyright © 2020 by Keith Packard <keithp@keithp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_RISCV_COMMON_SEMI_TARGET_H
+#define TARGET_RISCV_COMMON_SEMI_TARGET_H
+
+static inline target_ulong common_semi_arg(CPUState *cs, int argno)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    return env->gpr[xA0 + argno];
+}
+
+static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    env->gpr[xA0] = ret;
+}
+
+static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
+{
+    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
+}
+
+static inline bool is_64bit_semihosting(CPUArchState *env)
+{
+    return riscv_cpu_mxl(env) != MXL_RV32;
+}
+
+static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    return env->gpr[xSP];
+}
+
+static inline bool common_semi_has_synccache(CPUArchState *env)
+{
+    return true;
+}
+
+#endif
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 50f40a2a1a..5e442e549d 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -46,9 +46,6 @@
 #else
 #include "qemu/cutils.h"
 #include "hw/loader.h"
-#ifdef TARGET_ARM
-#include "hw/arm/boot.h"
-#endif
 #include "hw/boards.h"
 #endif
 
@@ -182,96 +179,7 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
 
 #endif
 
-#ifdef TARGET_ARM
-static inline target_ulong
-common_semi_arg(CPUState *cs, int argno)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    if (is_a64(env)) {
-        return env->xregs[argno];
-    } else {
-        return env->regs[argno];
-    }
-}
-
-static inline void
-common_semi_set_ret(CPUState *cs, target_ulong ret)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    if (is_a64(env)) {
-        env->xregs[0] = ret;
-    } else {
-        env->regs[0] = ret;
-    }
-}
-
-static inline bool
-common_semi_sys_exit_extended(CPUState *cs, int nr)
-{
-    return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
-}
-
-static inline bool is_64bit_semihosting(CPUArchState *env)
-{
-    return is_a64(env);
-}
-
-static inline target_ulong common_semi_stack_bottom(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    return is_a64(env) ? env->xregs[31] : env->regs[13];
-}
-
-static inline bool common_semi_has_synccache(CPUArchState *env)
-{
-    /* Ok for A64, invalid for A32/T32. */
-    return is_a64(env);
-}
-#endif /* TARGET_ARM */
-
-#ifdef TARGET_RISCV
-static inline target_ulong
-common_semi_arg(CPUState *cs, int argno)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    return env->gpr[xA0 + argno];
-}
-
-static inline void
-common_semi_set_ret(CPUState *cs, target_ulong ret)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    env->gpr[xA0] = ret;
-}
-
-static inline bool
-common_semi_sys_exit_extended(CPUState *cs, int nr)
-{
-    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
-}
-
-static inline bool is_64bit_semihosting(CPUArchState *env)
-{
-    return riscv_cpu_mxl(env) != MXL_RV32;
-}
-
-static inline target_ulong common_semi_stack_bottom(CPUState *cs)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    return env->gpr[xSP];
-}
-
-static inline bool common_semi_has_synccache(CPUArchState *env)
-{
-    return true;
-}
-#endif
+#include "common-semi-target.h"
 
 /*
  * The semihosting API has no concept of its errno being thread-safe,
-- 
2.34.1


