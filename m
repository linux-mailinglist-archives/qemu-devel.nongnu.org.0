Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B896D399D68
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:07:33 +0200 (CEST)
Received: from localhost ([::1]:44964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojK8-0002YA-P2
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojGB-0003tC-LL
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:29 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojG9-00007m-3i
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:27 -0400
Received: by mail-ed1-x529.google.com with SMTP id g18so4223130edq.8
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o0IJ99GBNBgLTCqp2mtuSzLlVDmKBunZStjd7bCnLMU=;
 b=Umd0SHxEJxu7y1eAGW3T4MiU1jZcRufZwB/BjqG27nmQ0gQPmABCWmC5TPyUFyrHAt
 vcnZrhAdDcWOTby+el7frCZ7PwJrxh0Uc2tJfqCvF0RLAClKqj8bn5igqdAq5MXXrTJq
 IalDI8XH4VI6rlU1Up8MrDSthXhpl5bfy2xZRW/qbcbxcPwNeDrwxWaoGKNbqdOZtQVL
 GZbp9sSENbEitExy4qYcUuL6+wDLWLgufNXX1JbP+GbDDJFKAm8KIZE8r2nnh6+oj1i3
 YHdq8XxMTq7zzmPyg37OU8KTd2tamtWYu/xoKEMYnnuyJbJtexHAitdOfC6kMlGxwvu5
 h/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o0IJ99GBNBgLTCqp2mtuSzLlVDmKBunZStjd7bCnLMU=;
 b=Z6UOwrrQIk2vNikKaAIcBV9mQBXa0zefOeLcbDE35jsJsrdilz3L0wOxhzu5qVrrGg
 y5OWhU1+ZcvJ5qZUseHOpVJ1UIMU0eNgkakKb/aMrVQ6thYkVipJVn0343ZKgRAgcSrC
 xD1bwbtiKu2fsG9bg4NcbLaA6CLo9qWuqlROf5mXc13B1FInaw7ikYb2yho0YP7FkpoZ
 4A5UnlFfiMMv8j9+/kvVCadsaawyaPXC/+BoVTrE4QiHaSvqx5qr8plD9SZ62Wg71Hfn
 cT/MRxFSAtkpLlahLUMOJAS+DfukzNPUUeN4yAOQ9agOqil9xY/6JKgybgJCs1fdgzJz
 oF9A==
X-Gm-Message-State: AOAM530hgxn3r/vqwMn0+kYw1KeBDvsfnyvapambAYqfeyXW4Lwim2VO
 3Hbpy6BFN3RmwrWEW+IWaCCVrivTPL0wEg==
X-Google-Smtp-Source: ABdhPJxK2MFlFXwzQspEnvi25vfQrcPApLMakZQZRv5Bj022TCXEPYReDUW65GKIGUkCmLTPfs6OQQ==
X-Received: by 2002:a05:6402:548:: with SMTP id
 i8mr6356535edx.344.1622711002636; 
 Thu, 03 Jun 2021 02:03:22 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id t14sm1419253edv.27.2021.06.03.02.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 02:03:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] target/microblaze: Extract FPU helpers to fpu_helper.c
Date: Thu,  3 Jun 2021 11:03:06 +0200
Message-Id: <20210603090310.2749892-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210603090310.2749892-1-f4bug@amsat.org>
References: <20210603090310.2749892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract FPU helpers to their own file: fpu_helper.c,
so it is easier to focus on the generic helpers in
op_helper.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/microblaze/fpu_helper.c | 308 +++++++++++++++++++++++++++++++++
 target/microblaze/op_helper.c  | 287 +-----------------------------
 target/microblaze/meson.build  |   1 +
 3 files changed, 310 insertions(+), 286 deletions(-)
 create mode 100644 target/microblaze/fpu_helper.c

diff --git a/target/microblaze/fpu_helper.c b/target/microblaze/fpu_helper.c
new file mode 100644
index 00000000000..ce729947079
--- /dev/null
+++ b/target/microblaze/fpu_helper.c
@@ -0,0 +1,308 @@
+/*
+ *  Microblaze FPU helper routines.
+ *
+ *  Copyright (c) 2009 Edgar E. Iglesias <edgar.iglesias@gmail.com>.
+ *  Copyright (c) 2009-2012 PetaLogix Qld Pty Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "fpu/softfloat.h"
+
+static bool check_divz(CPUMBState *env, uint32_t a, uint32_t b, uintptr_t ra)
+{
+    if (unlikely(b == 0)) {
+        env->msr |= MSR_DZ;
+
+        if ((env->msr & MSR_EE) &&
+            env_archcpu(env)->cfg.div_zero_exception) {
+            CPUState *cs = env_cpu(env);
+
+            env->esr = ESR_EC_DIVZERO;
+            cs->exception_index = EXCP_HW_EXCP;
+            cpu_loop_exit_restore(cs, ra);
+        }
+        return false;
+    }
+    return true;
+}
+
+uint32_t helper_divs(CPUMBState *env, uint32_t a, uint32_t b)
+{
+    if (!check_divz(env, a, b, GETPC())) {
+        return 0;
+    }
+    return (int32_t)a / (int32_t)b;
+}
+
+uint32_t helper_divu(CPUMBState *env, uint32_t a, uint32_t b)
+{
+    if (!check_divz(env, a, b, GETPC())) {
+        return 0;
+    }
+    return a / b;
+}
+
+/* raise FPU exception.  */
+static void raise_fpu_exception(CPUMBState *env, uintptr_t ra)
+{
+    CPUState *cs = env_cpu(env);
+
+    env->esr = ESR_EC_FPU;
+    cs->exception_index = EXCP_HW_EXCP;
+    cpu_loop_exit_restore(cs, ra);
+}
+
+static void update_fpu_flags(CPUMBState *env, int flags, uintptr_t ra)
+{
+    int raise = 0;
+
+    if (flags & float_flag_invalid) {
+        env->fsr |= FSR_IO;
+        raise = 1;
+    }
+    if (flags & float_flag_divbyzero) {
+        env->fsr |= FSR_DZ;
+        raise = 1;
+    }
+    if (flags & float_flag_overflow) {
+        env->fsr |= FSR_OF;
+        raise = 1;
+    }
+    if (flags & float_flag_underflow) {
+        env->fsr |= FSR_UF;
+        raise = 1;
+    }
+    if (raise
+        && (env_archcpu(env)->cfg.pvr_regs[2] & PVR2_FPU_EXC_MASK)
+        && (env->msr & MSR_EE)) {
+        raise_fpu_exception(env, ra);
+    }
+}
+
+uint32_t helper_fadd(CPUMBState *env, uint32_t a, uint32_t b)
+{
+    CPU_FloatU fd, fa, fb;
+    int flags;
+
+    set_float_exception_flags(0, &env->fp_status);
+    fa.l = a;
+    fb.l = b;
+    fd.f = float32_add(fa.f, fb.f, &env->fp_status);
+
+    flags = get_float_exception_flags(&env->fp_status);
+    update_fpu_flags(env, flags, GETPC());
+    return fd.l;
+}
+
+uint32_t helper_frsub(CPUMBState *env, uint32_t a, uint32_t b)
+{
+    CPU_FloatU fd, fa, fb;
+    int flags;
+
+    set_float_exception_flags(0, &env->fp_status);
+    fa.l = a;
+    fb.l = b;
+    fd.f = float32_sub(fb.f, fa.f, &env->fp_status);
+    flags = get_float_exception_flags(&env->fp_status);
+    update_fpu_flags(env, flags, GETPC());
+    return fd.l;
+}
+
+uint32_t helper_fmul(CPUMBState *env, uint32_t a, uint32_t b)
+{
+    CPU_FloatU fd, fa, fb;
+    int flags;
+
+    set_float_exception_flags(0, &env->fp_status);
+    fa.l = a;
+    fb.l = b;
+    fd.f = float32_mul(fa.f, fb.f, &env->fp_status);
+    flags = get_float_exception_flags(&env->fp_status);
+    update_fpu_flags(env, flags, GETPC());
+
+    return fd.l;
+}
+
+uint32_t helper_fdiv(CPUMBState *env, uint32_t a, uint32_t b)
+{
+    CPU_FloatU fd, fa, fb;
+    int flags;
+
+    set_float_exception_flags(0, &env->fp_status);
+    fa.l = a;
+    fb.l = b;
+    fd.f = float32_div(fb.f, fa.f, &env->fp_status);
+    flags = get_float_exception_flags(&env->fp_status);
+    update_fpu_flags(env, flags, GETPC());
+
+    return fd.l;
+}
+
+uint32_t helper_fcmp_un(CPUMBState *env, uint32_t a, uint32_t b)
+{
+    CPU_FloatU fa, fb;
+    uint32_t r = 0;
+
+    fa.l = a;
+    fb.l = b;
+
+    if (float32_is_signaling_nan(fa.f, &env->fp_status) ||
+        float32_is_signaling_nan(fb.f, &env->fp_status)) {
+        update_fpu_flags(env, float_flag_invalid, GETPC());
+        r = 1;
+    }
+
+    if (float32_is_quiet_nan(fa.f, &env->fp_status) ||
+        float32_is_quiet_nan(fb.f, &env->fp_status)) {
+        r = 1;
+    }
+
+    return r;
+}
+
+uint32_t helper_fcmp_lt(CPUMBState *env, uint32_t a, uint32_t b)
+{
+    CPU_FloatU fa, fb;
+    int r;
+    int flags;
+
+    set_float_exception_flags(0, &env->fp_status);
+    fa.l = a;
+    fb.l = b;
+    r = float32_lt(fb.f, fa.f, &env->fp_status);
+    flags = get_float_exception_flags(&env->fp_status);
+    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
+
+    return r;
+}
+
+uint32_t helper_fcmp_eq(CPUMBState *env, uint32_t a, uint32_t b)
+{
+    CPU_FloatU fa, fb;
+    int flags;
+    int r;
+
+    set_float_exception_flags(0, &env->fp_status);
+    fa.l = a;
+    fb.l = b;
+    r = float32_eq_quiet(fa.f, fb.f, &env->fp_status);
+    flags = get_float_exception_flags(&env->fp_status);
+    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
+
+    return r;
+}
+
+uint32_t helper_fcmp_le(CPUMBState *env, uint32_t a, uint32_t b)
+{
+    CPU_FloatU fa, fb;
+    int flags;
+    int r;
+
+    fa.l = a;
+    fb.l = b;
+    set_float_exception_flags(0, &env->fp_status);
+    r = float32_le(fa.f, fb.f, &env->fp_status);
+    flags = get_float_exception_flags(&env->fp_status);
+    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
+
+
+    return r;
+}
+
+uint32_t helper_fcmp_gt(CPUMBState *env, uint32_t a, uint32_t b)
+{
+    CPU_FloatU fa, fb;
+    int flags, r;
+
+    fa.l = a;
+    fb.l = b;
+    set_float_exception_flags(0, &env->fp_status);
+    r = float32_lt(fa.f, fb.f, &env->fp_status);
+    flags = get_float_exception_flags(&env->fp_status);
+    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
+    return r;
+}
+
+uint32_t helper_fcmp_ne(CPUMBState *env, uint32_t a, uint32_t b)
+{
+    CPU_FloatU fa, fb;
+    int flags, r;
+
+    fa.l = a;
+    fb.l = b;
+    set_float_exception_flags(0, &env->fp_status);
+    r = !float32_eq_quiet(fa.f, fb.f, &env->fp_status);
+    flags = get_float_exception_flags(&env->fp_status);
+    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
+
+    return r;
+}
+
+uint32_t helper_fcmp_ge(CPUMBState *env, uint32_t a, uint32_t b)
+{
+    CPU_FloatU fa, fb;
+    int flags, r;
+
+    fa.l = a;
+    fb.l = b;
+    set_float_exception_flags(0, &env->fp_status);
+    r = !float32_lt(fa.f, fb.f, &env->fp_status);
+    flags = get_float_exception_flags(&env->fp_status);
+    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
+
+    return r;
+}
+
+uint32_t helper_flt(CPUMBState *env, uint32_t a)
+{
+    CPU_FloatU fd, fa;
+
+    fa.l = a;
+    fd.f = int32_to_float32(fa.l, &env->fp_status);
+    return fd.l;
+}
+
+uint32_t helper_fint(CPUMBState *env, uint32_t a)
+{
+    CPU_FloatU fa;
+    uint32_t r;
+    int flags;
+
+    set_float_exception_flags(0, &env->fp_status);
+    fa.l = a;
+    r = float32_to_int32(fa.f, &env->fp_status);
+    flags = get_float_exception_flags(&env->fp_status);
+    update_fpu_flags(env, flags, GETPC());
+
+    return r;
+}
+
+uint32_t helper_fsqrt(CPUMBState *env, uint32_t a)
+{
+    CPU_FloatU fd, fa;
+    int flags;
+
+    set_float_exception_flags(0, &env->fp_status);
+    fa.l = a;
+    fd.l = float32_sqrt(fa.f, &env->fp_status);
+    flags = get_float_exception_flags(&env->fp_status);
+    update_fpu_flags(env, flags, GETPC());
+
+    return fd.l;
+}
diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index 58d633584d3..8d20522ee88 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -21,10 +21,8 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
-#include "qemu/host-utils.h"
+#include "qemu/log.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
-#include "fpu/softfloat.h"
 
 void helper_put(uint32_t id, uint32_t ctrl, uint32_t data)
 {
@@ -69,289 +67,6 @@ void helper_raise_exception(CPUMBState *env, uint32_t index)
     cpu_loop_exit(cs);
 }
 
-static bool check_divz(CPUMBState *env, uint32_t a, uint32_t b, uintptr_t ra)
-{
-    if (unlikely(b == 0)) {
-        env->msr |= MSR_DZ;
-
-        if ((env->msr & MSR_EE) &&
-            env_archcpu(env)->cfg.div_zero_exception) {
-            CPUState *cs = env_cpu(env);
-
-            env->esr = ESR_EC_DIVZERO;
-            cs->exception_index = EXCP_HW_EXCP;
-            cpu_loop_exit_restore(cs, ra);
-        }
-        return false;
-    }
-    return true;
-}
-
-uint32_t helper_divs(CPUMBState *env, uint32_t a, uint32_t b)
-{
-    if (!check_divz(env, a, b, GETPC())) {
-        return 0;
-    }
-    return (int32_t)a / (int32_t)b;
-}
-
-uint32_t helper_divu(CPUMBState *env, uint32_t a, uint32_t b)
-{
-    if (!check_divz(env, a, b, GETPC())) {
-        return 0;
-    }
-    return a / b;
-}
-
-/* raise FPU exception.  */
-static void raise_fpu_exception(CPUMBState *env, uintptr_t ra)
-{
-    CPUState *cs = env_cpu(env);
-
-    env->esr = ESR_EC_FPU;
-    cs->exception_index = EXCP_HW_EXCP;
-    cpu_loop_exit_restore(cs, ra);
-}
-
-static void update_fpu_flags(CPUMBState *env, int flags, uintptr_t ra)
-{
-    int raise = 0;
-
-    if (flags & float_flag_invalid) {
-        env->fsr |= FSR_IO;
-        raise = 1;
-    }
-    if (flags & float_flag_divbyzero) {
-        env->fsr |= FSR_DZ;
-        raise = 1;
-    }
-    if (flags & float_flag_overflow) {
-        env->fsr |= FSR_OF;
-        raise = 1;
-    }
-    if (flags & float_flag_underflow) {
-        env->fsr |= FSR_UF;
-        raise = 1;
-    }
-    if (raise
-        && (env_archcpu(env)->cfg.pvr_regs[2] & PVR2_FPU_EXC_MASK)
-        && (env->msr & MSR_EE)) {
-        raise_fpu_exception(env, ra);
-    }
-}
-
-uint32_t helper_fadd(CPUMBState *env, uint32_t a, uint32_t b)
-{
-    CPU_FloatU fd, fa, fb;
-    int flags;
-
-    set_float_exception_flags(0, &env->fp_status);
-    fa.l = a;
-    fb.l = b;
-    fd.f = float32_add(fa.f, fb.f, &env->fp_status);
-
-    flags = get_float_exception_flags(&env->fp_status);
-    update_fpu_flags(env, flags, GETPC());
-    return fd.l;
-}
-
-uint32_t helper_frsub(CPUMBState *env, uint32_t a, uint32_t b)
-{
-    CPU_FloatU fd, fa, fb;
-    int flags;
-
-    set_float_exception_flags(0, &env->fp_status);
-    fa.l = a;
-    fb.l = b;
-    fd.f = float32_sub(fb.f, fa.f, &env->fp_status);
-    flags = get_float_exception_flags(&env->fp_status);
-    update_fpu_flags(env, flags, GETPC());
-    return fd.l;
-}
-
-uint32_t helper_fmul(CPUMBState *env, uint32_t a, uint32_t b)
-{
-    CPU_FloatU fd, fa, fb;
-    int flags;
-
-    set_float_exception_flags(0, &env->fp_status);
-    fa.l = a;
-    fb.l = b;
-    fd.f = float32_mul(fa.f, fb.f, &env->fp_status);
-    flags = get_float_exception_flags(&env->fp_status);
-    update_fpu_flags(env, flags, GETPC());
-
-    return fd.l;
-}
-
-uint32_t helper_fdiv(CPUMBState *env, uint32_t a, uint32_t b)
-{
-    CPU_FloatU fd, fa, fb;
-    int flags;
-
-    set_float_exception_flags(0, &env->fp_status);
-    fa.l = a;
-    fb.l = b;
-    fd.f = float32_div(fb.f, fa.f, &env->fp_status);
-    flags = get_float_exception_flags(&env->fp_status);
-    update_fpu_flags(env, flags, GETPC());
-
-    return fd.l;
-}
-
-uint32_t helper_fcmp_un(CPUMBState *env, uint32_t a, uint32_t b)
-{
-    CPU_FloatU fa, fb;
-    uint32_t r = 0;
-
-    fa.l = a;
-    fb.l = b;
-
-    if (float32_is_signaling_nan(fa.f, &env->fp_status) ||
-        float32_is_signaling_nan(fb.f, &env->fp_status)) {
-        update_fpu_flags(env, float_flag_invalid, GETPC());
-        r = 1;
-    }
-
-    if (float32_is_quiet_nan(fa.f, &env->fp_status) ||
-        float32_is_quiet_nan(fb.f, &env->fp_status)) {
-        r = 1;
-    }
-
-    return r;
-}
-
-uint32_t helper_fcmp_lt(CPUMBState *env, uint32_t a, uint32_t b)
-{
-    CPU_FloatU fa, fb;
-    int r;
-    int flags;
-
-    set_float_exception_flags(0, &env->fp_status);
-    fa.l = a;
-    fb.l = b;
-    r = float32_lt(fb.f, fa.f, &env->fp_status);
-    flags = get_float_exception_flags(&env->fp_status);
-    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
-
-    return r;
-}
-
-uint32_t helper_fcmp_eq(CPUMBState *env, uint32_t a, uint32_t b)
-{
-    CPU_FloatU fa, fb;
-    int flags;
-    int r;
-
-    set_float_exception_flags(0, &env->fp_status);
-    fa.l = a;
-    fb.l = b;
-    r = float32_eq_quiet(fa.f, fb.f, &env->fp_status);
-    flags = get_float_exception_flags(&env->fp_status);
-    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
-
-    return r;
-}
-
-uint32_t helper_fcmp_le(CPUMBState *env, uint32_t a, uint32_t b)
-{
-    CPU_FloatU fa, fb;
-    int flags;
-    int r;
-
-    fa.l = a;
-    fb.l = b;
-    set_float_exception_flags(0, &env->fp_status);
-    r = float32_le(fa.f, fb.f, &env->fp_status);
-    flags = get_float_exception_flags(&env->fp_status);
-    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
-
-
-    return r;
-}
-
-uint32_t helper_fcmp_gt(CPUMBState *env, uint32_t a, uint32_t b)
-{
-    CPU_FloatU fa, fb;
-    int flags, r;
-
-    fa.l = a;
-    fb.l = b;
-    set_float_exception_flags(0, &env->fp_status);
-    r = float32_lt(fa.f, fb.f, &env->fp_status);
-    flags = get_float_exception_flags(&env->fp_status);
-    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
-    return r;
-}
-
-uint32_t helper_fcmp_ne(CPUMBState *env, uint32_t a, uint32_t b)
-{
-    CPU_FloatU fa, fb;
-    int flags, r;
-
-    fa.l = a;
-    fb.l = b;
-    set_float_exception_flags(0, &env->fp_status);
-    r = !float32_eq_quiet(fa.f, fb.f, &env->fp_status);
-    flags = get_float_exception_flags(&env->fp_status);
-    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
-
-    return r;
-}
-
-uint32_t helper_fcmp_ge(CPUMBState *env, uint32_t a, uint32_t b)
-{
-    CPU_FloatU fa, fb;
-    int flags, r;
-
-    fa.l = a;
-    fb.l = b;
-    set_float_exception_flags(0, &env->fp_status);
-    r = !float32_lt(fa.f, fb.f, &env->fp_status);
-    flags = get_float_exception_flags(&env->fp_status);
-    update_fpu_flags(env, flags & float_flag_invalid, GETPC());
-
-    return r;
-}
-
-uint32_t helper_flt(CPUMBState *env, uint32_t a)
-{
-    CPU_FloatU fd, fa;
-
-    fa.l = a;
-    fd.f = int32_to_float32(fa.l, &env->fp_status);
-    return fd.l;
-}
-
-uint32_t helper_fint(CPUMBState *env, uint32_t a)
-{
-    CPU_FloatU fa;
-    uint32_t r;
-    int flags;
-
-    set_float_exception_flags(0, &env->fp_status);
-    fa.l = a;
-    r = float32_to_int32(fa.f, &env->fp_status);
-    flags = get_float_exception_flags(&env->fp_status);
-    update_fpu_flags(env, flags, GETPC());
-
-    return r;
-}
-
-uint32_t helper_fsqrt(CPUMBState *env, uint32_t a)
-{
-    CPU_FloatU fd, fa;
-    int flags;
-
-    set_float_exception_flags(0, &env->fp_status);
-    fa.l = a;
-    fd.l = float32_sqrt(fa.f, &env->fp_status);
-    flags = get_float_exception_flags(&env->fp_status);
-    update_fpu_flags(env, flags, GETPC());
-
-    return fd.l;
-}
-
 uint32_t helper_pcmpbf(uint32_t a, uint32_t b)
 {
     unsigned int i;
diff --git a/target/microblaze/meson.build b/target/microblaze/meson.build
index 05ee0ec1635..0a5e46027af 100644
--- a/target/microblaze/meson.build
+++ b/target/microblaze/meson.build
@@ -4,6 +4,7 @@
 microblaze_ss.add(gen)
 microblaze_ss.add(files(
   'cpu.c',
+  'fpu_helper.c',
   'gdbstub.c',
   'helper.c',
   'op_helper.c',
-- 
2.26.3


