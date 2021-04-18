Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59436387A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:12:10 +0200 (CEST)
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGaH-0000GY-VZ
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGI0-0005H7-V9
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:53:17 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGHl-00018i-IZ
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:53:16 -0400
Received: by mail-wr1-x42c.google.com with SMTP id s7so31942899wru.6
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6nG8poRcj1wDu49/3j5kVXCk3FjBmpdwDvVGl0DoGNs=;
 b=F3D7/F2a8Mk535rS9siQa7ObZYNUszQqR4Zp69KVj11Xk/qgCoaWnpnnNIKpmaSm5x
 2kbKIWkeJF6CscKDVn7WCOvjRB5A0QkZMVXkhWylreHZqrIwFwxfTQtOKakNIfpJzVF4
 IoiLi7AbffKHaH/BJyVggOpuzN9jfEIPxoIetPxdfT3dSV2yvGBjbPnOCmkwex4tL97O
 Qma1O/AbxohMKzRKnFBU/VIDk2UKUb67vqIhAkYidDDri7RG5VUGrie1H8uyjtCbFiTe
 ROvLNs/9inYEaa+35BIeli4Uf8COG6srv/KYP3Ds9Q6VpagGsFOjI2/0OxveIA85aArb
 6KeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6nG8poRcj1wDu49/3j5kVXCk3FjBmpdwDvVGl0DoGNs=;
 b=ZuXMR6wzbIrlY4jNoEEPWyYNSMSv8aaBlxg/gHfA4x5gBVR/Vvql2hScZZrdsmsDsF
 uZhs4ybfyMRatukVIIpCX6KhnVivt5zUte1l97mz4o8vuxjLo4FHE88Ak2xZgPW1BcA5
 ydKEKFCcHdMN5p79vkncrOpFWsxPZSV8dTHijOl+V8k0MkNJDNoETRxL2YB2FcjI8Z0J
 1XpR04geeSGyxa7q7lYyH+IrXnStLSTlFpFYAYsa7Vt2FXFL/Bk2aWmFdwWrJ/my5jl2
 wuHC1m5ACdj3+/BSfeMG0rElldY++Li6lqT0I7qc6lPEOOe9sK1j3A6mdqYiqxO9TXyl
 A8gA==
X-Gm-Message-State: AOAM532tESYmDqffIWOLQRxpmo5BkhNtoOPNbREGgeW2RB4ddLsfs7i6
 0OI0F0qMACK23SLt1KPGWygLTbuYOyTMaQ==
X-Google-Smtp-Source: ABdhPJwC0edc6blBmRvvcpBmN8gBR71onah937l7jSHSQfFB2pRGtViRLbT6k0kxEfkRipBV/xcklg==
X-Received: by 2002:a5d:55d2:: with SMTP id i18mr10706123wrw.280.1618786379976; 
 Sun, 18 Apr 2021 15:52:59 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l7sm22140880wrb.35.2021.04.18.15.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:52:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/29] target/mips: Move exception management code to
 exception.c
Date: Mon, 19 Apr 2021 00:50:54 +0200
Message-Id: <20210418225058.1257014-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h         |  13 ---
 target/mips/tcg/tcg-internal.h |  14 +++
 target/mips/cpu.c              | 113 ----------------------
 target/mips/exception.c        | 169 +++++++++++++++++++++++++++++++++
 target/mips/op_helper.c        |  37 --------
 target/mips/meson.build        |   1 +
 6 files changed, 184 insertions(+), 163 deletions(-)
 create mode 100644 target/mips/exception.c

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 88020e22365..8158078b08b 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -80,7 +80,6 @@ extern const char fregnames[32][4];
 extern const struct mips_def_t mips_defs[];
 extern const int mips_defs_number;
 
-bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int mips_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
@@ -411,16 +410,4 @@ void sync_c0_status(CPUMIPSState *env, CPUMIPSState *cpu, int tc);
 void cpu_mips_store_status(CPUMIPSState *env, target_ulong val);
 void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val);
 
-const char *mips_exception_name(int32_t exception);
-
-void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env, uint32_t exception,
-                                          int error_code, uintptr_t pc);
-
-static inline void QEMU_NORETURN do_raise_exception(CPUMIPSState *env,
-                                                    uint32_t exception,
-                                                    uintptr_t pc)
-{
-    do_raise_exception_err(env, exception, 0, pc);
-}
-
 #endif
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index e507dd1630f..70f0d5da436 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -14,11 +14,25 @@
 #include "hw/core/cpu.h"
 #include "cpu.h"
 
+void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 void mips_cpu_do_interrupt(CPUState *cpu);
+bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
 
+const char *mips_exception_name(int32_t exception);
+
+void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env, uint32_t exception,
+                                          int error_code, uintptr_t pc);
+
+static inline void QEMU_NORETURN do_raise_exception(CPUMIPSState *env,
+                                                    uint32_t exception,
+                                                    uintptr_t pc)
+{
+    do_raise_exception_err(env, exception, 0, pc);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
 void mmu_init(CPUMIPSState *env, const mips_def_t *def);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 949b8ef94ea..61d0dd69751 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -218,112 +218,12 @@ static void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-static const char * const excp_names[EXCP_LAST + 1] = {
-    [EXCP_RESET] = "reset",
-    [EXCP_SRESET] = "soft reset",
-    [EXCP_DSS] = "debug single step",
-    [EXCP_DINT] = "debug interrupt",
-    [EXCP_NMI] = "non-maskable interrupt",
-    [EXCP_MCHECK] = "machine check",
-    [EXCP_EXT_INTERRUPT] = "interrupt",
-    [EXCP_DFWATCH] = "deferred watchpoint",
-    [EXCP_DIB] = "debug instruction breakpoint",
-    [EXCP_IWATCH] = "instruction fetch watchpoint",
-    [EXCP_AdEL] = "address error load",
-    [EXCP_AdES] = "address error store",
-    [EXCP_TLBF] = "TLB refill",
-    [EXCP_IBE] = "instruction bus error",
-    [EXCP_DBp] = "debug breakpoint",
-    [EXCP_SYSCALL] = "syscall",
-    [EXCP_BREAK] = "break",
-    [EXCP_CpU] = "coprocessor unusable",
-    [EXCP_RI] = "reserved instruction",
-    [EXCP_OVERFLOW] = "arithmetic overflow",
-    [EXCP_TRAP] = "trap",
-    [EXCP_FPE] = "floating point",
-    [EXCP_DDBS] = "debug data break store",
-    [EXCP_DWATCH] = "data watchpoint",
-    [EXCP_LTLBL] = "TLB modify",
-    [EXCP_TLBL] = "TLB load",
-    [EXCP_TLBS] = "TLB store",
-    [EXCP_DBE] = "data bus error",
-    [EXCP_DDBL] = "debug data break load",
-    [EXCP_THREAD] = "thread",
-    [EXCP_MDMX] = "MDMX",
-    [EXCP_C2E] = "precise coprocessor 2",
-    [EXCP_CACHE] = "cache error",
-    [EXCP_TLBXI] = "TLB execute-inhibit",
-    [EXCP_TLBRI] = "TLB read-inhibit",
-    [EXCP_MSADIS] = "MSA disabled",
-    [EXCP_MSAFPE] = "MSA floating point",
-};
-
-const char *mips_exception_name(int32_t exception)
-{
-    if (exception < 0 || exception > EXCP_LAST) {
-        return "unknown";
-    }
-    return excp_names[exception];
-}
-
 void cpu_set_exception_base(int vp_index, target_ulong address)
 {
     MIPSCPU *vp = MIPS_CPU(qemu_get_cpu(vp_index));
     vp->env.exception_base = address;
 }
 
-target_ulong exception_resume_pc(CPUMIPSState *env)
-{
-    target_ulong bad_pc;
-    target_ulong isa_mode;
-
-    isa_mode = !!(env->hflags & MIPS_HFLAG_M16);
-    bad_pc = env->active_tc.PC | isa_mode;
-    if (env->hflags & MIPS_HFLAG_BMASK) {
-        /*
-         * If the exception was raised from a delay slot, come back to
-         * the jump.
-         */
-        bad_pc -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
-    }
-
-    return bad_pc;
-}
-
-bool mips_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
-{
-    if (interrupt_request & CPU_INTERRUPT_HARD) {
-        MIPSCPU *cpu = MIPS_CPU(cs);
-        CPUMIPSState *env = &cpu->env;
-
-        if (cpu_mips_hw_interrupts_enabled(env) &&
-            cpu_mips_hw_interrupts_pending(env)) {
-            /* Raise it */
-            cs->exception_index = EXCP_EXT_INTERRUPT;
-            env->error_code = 0;
-            mips_cpu_do_interrupt(cs);
-            return true;
-        }
-    }
-    return false;
-}
-
-void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env,
-                                          uint32_t exception,
-                                          int error_code,
-                                          uintptr_t pc)
-{
-    CPUState *cs = env_cpu(env);
-
-    qemu_log_mask(CPU_LOG_INT, "%s: %d (%s) %d\n",
-                  __func__, exception, mips_exception_name(exception),
-                  error_code);
-    cs->exception_index = exception;
-    env->error_code = error_code;
-
-    cpu_loop_exit_restore(cs, pc);
-}
-
 static void mips_cpu_set_pc(CPUState *cs, vaddr value)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
@@ -331,19 +231,6 @@ static void mips_cpu_set_pc(CPUState *cs, vaddr value)
     mips_cpu_set_error_pc(&cpu->env, value);
 }
 
-#ifdef CONFIG_TCG
-static void mips_cpu_synchronize_from_tb(CPUState *cs,
-                                         const TranslationBlock *tb)
-{
-    MIPSCPU *cpu = MIPS_CPU(cs);
-    CPUMIPSState *env = &cpu->env;
-
-    env->active_tc.PC = tb->pc;
-    env->hflags &= ~MIPS_HFLAG_BMASK;
-    env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
-}
-#endif /* CONFIG_TCG */
-
 static bool mips_cpu_has_work(CPUState *cs)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
diff --git a/target/mips/exception.c b/target/mips/exception.c
new file mode 100644
index 00000000000..ee8319c4e43
--- /dev/null
+++ b/target/mips/exception.c
@@ -0,0 +1,169 @@
+/*
+ *  MIPS Exceptions processing helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
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
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internal.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+
+target_ulong exception_resume_pc(CPUMIPSState *env)
+{
+    target_ulong bad_pc;
+    target_ulong isa_mode;
+
+    isa_mode = !!(env->hflags & MIPS_HFLAG_M16);
+    bad_pc = env->active_tc.PC | isa_mode;
+    if (env->hflags & MIPS_HFLAG_BMASK) {
+        /*
+         * If the exception was raised from a delay slot, come back to
+         * the jump.
+         */
+        bad_pc -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
+    }
+
+    return bad_pc;
+}
+
+void helper_raise_exception_err(CPUMIPSState *env, uint32_t exception,
+                                int error_code)
+{
+    do_raise_exception_err(env, exception, error_code, 0);
+}
+
+void helper_raise_exception(CPUMIPSState *env, uint32_t exception)
+{
+    do_raise_exception(env, exception, GETPC());
+}
+
+void helper_raise_exception_debug(CPUMIPSState *env)
+{
+    do_raise_exception(env, EXCP_DEBUG, 0);
+}
+
+static void raise_exception(CPUMIPSState *env, uint32_t exception)
+{
+    do_raise_exception(env, exception, 0);
+}
+
+void helper_wait(CPUMIPSState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->halted = 1;
+    cpu_reset_interrupt(cs, CPU_INTERRUPT_WAKE);
+    /*
+     * Last instruction in the block, PC was updated before
+     * - no need to recover PC and icount.
+     */
+    raise_exception(env, EXCP_HLT);
+}
+
+void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb)
+{
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    CPUMIPSState *env = &cpu->env;
+
+    env->active_tc.PC = tb->pc;
+    env->hflags &= ~MIPS_HFLAG_BMASK;
+    env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
+}
+
+bool mips_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
+        MIPSCPU *cpu = MIPS_CPU(cs);
+        CPUMIPSState *env = &cpu->env;
+
+        if (cpu_mips_hw_interrupts_enabled(env) &&
+            cpu_mips_hw_interrupts_pending(env)) {
+            /* Raise it */
+            cs->exception_index = EXCP_EXT_INTERRUPT;
+            env->error_code = 0;
+            mips_cpu_do_interrupt(cs);
+            return true;
+        }
+    }
+    return false;
+}
+
+static const char * const excp_names[EXCP_LAST + 1] = {
+    [EXCP_RESET] = "reset",
+    [EXCP_SRESET] = "soft reset",
+    [EXCP_DSS] = "debug single step",
+    [EXCP_DINT] = "debug interrupt",
+    [EXCP_NMI] = "non-maskable interrupt",
+    [EXCP_MCHECK] = "machine check",
+    [EXCP_EXT_INTERRUPT] = "interrupt",
+    [EXCP_DFWATCH] = "deferred watchpoint",
+    [EXCP_DIB] = "debug instruction breakpoint",
+    [EXCP_IWATCH] = "instruction fetch watchpoint",
+    [EXCP_AdEL] = "address error load",
+    [EXCP_AdES] = "address error store",
+    [EXCP_TLBF] = "TLB refill",
+    [EXCP_IBE] = "instruction bus error",
+    [EXCP_DBp] = "debug breakpoint",
+    [EXCP_SYSCALL] = "syscall",
+    [EXCP_BREAK] = "break",
+    [EXCP_CpU] = "coprocessor unusable",
+    [EXCP_RI] = "reserved instruction",
+    [EXCP_OVERFLOW] = "arithmetic overflow",
+    [EXCP_TRAP] = "trap",
+    [EXCP_FPE] = "floating point",
+    [EXCP_DDBS] = "debug data break store",
+    [EXCP_DWATCH] = "data watchpoint",
+    [EXCP_LTLBL] = "TLB modify",
+    [EXCP_TLBL] = "TLB load",
+    [EXCP_TLBS] = "TLB store",
+    [EXCP_DBE] = "data bus error",
+    [EXCP_DDBL] = "debug data break load",
+    [EXCP_THREAD] = "thread",
+    [EXCP_MDMX] = "MDMX",
+    [EXCP_C2E] = "precise coprocessor 2",
+    [EXCP_CACHE] = "cache error",
+    [EXCP_TLBXI] = "TLB execute-inhibit",
+    [EXCP_TLBRI] = "TLB read-inhibit",
+    [EXCP_MSADIS] = "MSA disabled",
+    [EXCP_MSAFPE] = "MSA floating point",
+};
+
+const char *mips_exception_name(int32_t exception)
+{
+    if (exception < 0 || exception > EXCP_LAST) {
+        return "unknown";
+    }
+    return excp_names[exception];
+}
+
+void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env,
+                                          uint32_t exception,
+                                          int error_code,
+                                          uintptr_t pc)
+{
+    CPUState *cs = env_cpu(env);
+
+    qemu_log_mask(CPU_LOG_INT, "%s: %d (%s) %d\n",
+                  __func__, exception, mips_exception_name(exception),
+                  error_code);
+    cs->exception_index = exception;
+    env->error_code = error_code;
+
+    cpu_loop_exit_restore(cs, pc);
+}
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index c6373d1de3f..94b03be0ea9 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -26,30 +26,6 @@
 #include "exec/memop.h"
 #include "fpu_helper.h"
 
-/*****************************************************************************/
-/* Exceptions processing helpers */
-
-void helper_raise_exception_err(CPUMIPSState *env, uint32_t exception,
-                                int error_code)
-{
-    do_raise_exception_err(env, exception, error_code, 0);
-}
-
-void helper_raise_exception(CPUMIPSState *env, uint32_t exception)
-{
-    do_raise_exception(env, exception, GETPC());
-}
-
-void helper_raise_exception_debug(CPUMIPSState *env)
-{
-    do_raise_exception(env, EXCP_DEBUG, 0);
-}
-
-static void raise_exception(CPUMIPSState *env, uint32_t exception)
-{
-    do_raise_exception(env, exception, 0);
-}
-
 /* 64 bits arithmetic for 32 bits hosts */
 static inline uint64_t get_HILO(CPUMIPSState *env)
 {
@@ -400,19 +376,6 @@ void helper_pmon(CPUMIPSState *env, int function)
     }
 }
 
-void helper_wait(CPUMIPSState *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->halted = 1;
-    cpu_reset_interrupt(cs, CPU_INTERRUPT_WAKE);
-    /*
-     * Last instruction in the block, PC was updated before
-     * - no need to recover PC and icount.
-     */
-    raise_exception(env, EXCP_HLT);
-}
-
 #if !defined(CONFIG_USER_ONLY)
 
 void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
diff --git a/target/mips/meson.build b/target/mips/meson.build
index ff5eb210dfd..e08077bfc18 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -24,6 +24,7 @@
 mips_tcg_ss.add(gen)
 mips_tcg_ss.add(files(
   'dsp_helper.c',
+  'exception.c',
   'fpu_helper.c',
   'ldst_helper.c',
   'lmmi_helper.c',
-- 
2.26.3


