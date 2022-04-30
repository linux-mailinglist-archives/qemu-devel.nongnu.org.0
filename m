Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6C2515DAC
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:37:21 +0200 (CEST)
Received: from localhost ([::1]:60938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknHl-0002Xk-1G
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAa-0004mF-6M
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:57 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:42804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAY-0006Gy-7N
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:55 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so9466323pjm.1
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wXLSxy1WX79eMXmNdpTVz+8RqAC6B/BBjkCPMRdeubQ=;
 b=F3vbFVC5jiJID6ZnZtleBggIsZkOAk97VYgmI7WRcSxYz6zoWtfFmZRmLM4RF2myaC
 LtI3QiQNTDN/aNs85QweUwYSr9DrwFbQmMbUFm4Au95aHdEOOINGdXDUR9nVtQIXAI4U
 neGb+bBSe3g6muTAo9OuQNIM7juaIyle9sG5PMmKbwqnMBjC1rYlsyYev6ssMCuzu0gM
 DoSCGxTipcvsF3AI8DLjn784EUSuzpY7a5SUK79JI2QT/dTwQMdHTvG7m9drVtYU4sXB
 MWYb8r1r1tSRc2OP6U1S1+4vZgLahpLrrKl7Z4M7fk+aUo8l1fTLr9D0QRtHcXhRpLav
 Pi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wXLSxy1WX79eMXmNdpTVz+8RqAC6B/BBjkCPMRdeubQ=;
 b=6A27JrDXqfHDUmjkUDNJlTYf8MKzXYdf+TV0t9wSAIYC+00mcgalEwIUWVO3/AmDMq
 K74ralA8/dDsjCZorS3dXhqLaiZXLG3jqVp1UsuBFvUYYH9wowCgVTdJl8souPpiXo+c
 9gSRWPeUUg1KHLGEEkVfguyyzKAQ+gZO1zEJbgPLtqtnpxr3TA3z6RNLYcA6k/s7UMCf
 KIBxg21yLSAccsnnvfVDIkt7yjZAUxaVYgWHY7499umAKShNRMzp2cFaDHn0YV10g6oj
 GrTthGBKhD8AJ8F3RGEgZzhT4v4uZKMaFc6eCNuxMBoB7EiOkDC8fDm87sZjAowcHcKQ
 gebg==
X-Gm-Message-State: AOAM531mkaUNJss5eVQik0qGlEipJHbtNxfQF0gXtumIQ6VBg3ufkoJw
 8Gb2sasnJSqythTmMtQx9D7WhYfmJbWDOg==
X-Google-Smtp-Source: ABdhPJypec9mcCVRHWusTVl9DrEJci7zANFjvZws9M1Gb9I96BNqjsb0RjvvNtMJ4WPX6vgTgaw6cA==
X-Received: by 2002:a17:902:b789:b0:15b:5d52:7542 with SMTP id
 e9-20020a170902b78900b0015b5d527542mr3991538pls.26.1651325392410; 
 Sat, 30 Apr 2022 06:29:52 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/43] semihosting: Use env more often in do_common_semihosting
Date: Sat, 30 Apr 2022 06:29:07 -0700
Message-Id: <20220430132932.324018-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
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
index 6149be404f..3a740482f9 100644
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
@@ -646,7 +554,6 @@ void do_common_semihosting(CPUState *cs)
     GuestFD *gf;
     int64_t elapsed;
 
-    (void) env; /* Used implicitly by arm lock_user macro */
     nr = common_semi_arg(cs, 0) & 0xffffffffU;
     args = common_semi_arg(cs, 1);
 
@@ -729,12 +636,12 @@ void do_common_semihosting(CPUState *cs)
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
 
@@ -765,7 +672,7 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_READC:
-        ret = qemu_semihosting_console_inc(cs->env_ptr);
+        ret = qemu_semihosting_console_inc(env);
         common_semi_set_ret(cs, ret);
         break;
 
-- 
2.34.1


