Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E83B52F6F9
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:45:28 +0200 (CEST)
Received: from localhost ([::1]:50560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDFH-00060O-Ar
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbw-0008Be-5r
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:56 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbc-00040c-1p
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:43 -0400
Received: by mail-pj1-x1031.google.com with SMTP id f10so9289302pjs.3
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fG9arG1tn4b444K5zf/g1JuzGuQmuRsUj+aiYfge+3E=;
 b=y4fNrW4mV30VJPIhWQcFoEZ6CNjNEhkQvJKPlw096guIJ6XndmFCod03U8J+mOWE9j
 2m0kJ8jRTELGs/Ydev5vrbI1UBjSKOltsDKF/OCkk457C/mbdc3y22XOjOezQTl0nToe
 76Q1o/XptqA9F7KQfYBybysTlvsdq77gRFfdwZy1FTACc9OiAQMXqnPN3rXW2+YLB2M+
 zZs4+CHCmQHZWjC5s3M6rFmHDKacBpncU/Ib7zMyJACj73aV4p9URTEUauxy9WqG1Em9
 F5+0jksT8dhW5qTmYKMXCo7VsU0sbjUniwF1oZY8YLcVd751A1UZ6+hjLJLaOps0d4dv
 twkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fG9arG1tn4b444K5zf/g1JuzGuQmuRsUj+aiYfge+3E=;
 b=ItACFJHVSDZtpoE1F7qaSyvJ3l4mNty3DGQ6ORQhct3+7y0buyOfrBxSODhCOqlhEX
 cXEDoLvDtWvkvtdDA5oqqOnVWmTJI2N5yNzGWzmFRb9luWwwwXO8H3PAv/DKnjwcEoA+
 NTPgU3ZQcEUKCWTQS4EhUDdC26knaQLORkgtq9PdR+P5mv5lV6F3/59I4gSE3sx2qlc7
 VUjhqzbxs1pEvHLYKKUJ9Vldqix/lwjHFOYC9kKh0UDQB93tSYrY8G5WDr0yQjhF4N6O
 JXQzRwi8LQto2IE8jTulByQCoyGgorFOcw85BNjwgRs1ehJ0od1X7NTjO65zdH24zU97
 TIlA==
X-Gm-Message-State: AOAM531tkcfuCHRu62uZJz5Vd+89ZLJZvU+7097/uwdOOOd87ac1bQq1
 firlUKIXar7UUFde+WLkbqnONd57a94/sw==
X-Google-Smtp-Source: ABdhPJxMdmB92/j1yrlVXY8CBcPW8KZtKAgeuiR7GQjw9HPKD+Rnng+Ocgy/sGoWIydJHHDL9d01vg==
X-Received: by 2002:a17:902:e484:b0:161:6657:dc5b with SMTP id
 i4-20020a170902e48400b001616657dc5bmr12268974ple.2.1653091466679; 
 Fri, 20 May 2022 17:04:26 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 21/49] semihosting: Use env more often in
 do_common_semihosting
Date: Fri, 20 May 2022 17:03:32 -0700
Message-Id: <20220521000400.454525-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

We've already loaded cs->env_ptr into a local variable; use it.
Since env is unconditionally used, we don't need a dummy use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/common-semi-target.h   |  62 ++++++++++++++++++
 target/riscv/common-semi-target.h |  50 +++++++++++++++
 semihosting/arm-compat-semi.c     | 101 ++----------------------------
 3 files changed, 116 insertions(+), 97 deletions(-)
 create mode 100644 target/arm/common-semi-target.h
 create mode 100644 target/riscv/common-semi-target.h

diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
new file mode 100644
index 0000000000..c20e1cca76
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
+    /* Invalid for A32/T32 */
+    return !is_a64(env);
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
index c53cb1891f..9c6fe7ffd7 100644
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
-    /* Invalid for A32/T32. */
-    return !is_a64(env);
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
@@ -645,7 +553,6 @@ void do_common_semihosting(CPUState *cs)
     GuestFD *gf;
     int64_t elapsed;
 
-    (void) env; /* Used implicitly by arm lock_user macro */
     nr = common_semi_arg(cs, 0) & 0xffffffffU;
     args = common_semi_arg(cs, 1);
 
@@ -728,12 +635,12 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_WRITEC:
-        qemu_semihosting_console_outc(cs->env_ptr, args);
+        qemu_semihosting_console_outc(env, args);
         common_semi_set_ret(cs, 0xdeadbeef);
         break;
 
     case TARGET_SYS_WRITE0:
-        ret = qemu_semihosting_console_outs(cs->env_ptr, args);
+        ret = qemu_semihosting_console_outs(env, args);
         common_semi_set_ret(cs, ret);
         break;
 
@@ -764,7 +671,7 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_READC:
-        ret = qemu_semihosting_console_inc(cs->env_ptr);
+        ret = qemu_semihosting_console_inc(env);
         common_semi_set_ret(cs, ret);
         break;
 
-- 
2.34.1


