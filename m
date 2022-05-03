Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6702518F78
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:56:11 +0200 (CEST)
Received: from localhost ([::1]:40844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzZ4-0003bN-9J
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZz-0000np-3s
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:53:03 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZw-0006Og-Kq
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:53:02 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso2880402pjb.5
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=M6M9lcOtJHcXS0OKn/tF20xzatLhV5u4RJXc0wtgF7E=;
 b=IIsJn8nEcvEVsQqLbbj1DUQtXzbnRWqguqyho+nZiwXNBOZ5dfHa3hR8kiiiBONZC3
 4jOsJsqzg3aS3ACXD8H90Lro2pvSo90S9tSUhO+dpJyQo6ubzEMP3qIpL7fvOy5/lhTY
 8tSDF9Rpk89ej0lsjyPh8Ki603PpRy2VHfizlqbrqu5cXKj+pif+H54GZkiQfAJlLEb4
 tWTspQEpblWTN3B6ELHSFdVpDagW4ga/L4A36Kd660wmgXCPl5IcIL09LaC5AF62Qqdh
 HUyC/p9sjADWFKF3+mahYgJ6bbPPETUT1urhxL0f9FDWfuHjxPNbiIGaHRDJc5Jow4e9
 Kzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M6M9lcOtJHcXS0OKn/tF20xzatLhV5u4RJXc0wtgF7E=;
 b=32KwjiEVHRX8e/7+lvZ5AAL/V+ic051TMsdQcNCUCwTXiNiz1+tvOTIuF3LIDqTna8
 cnB+qXcYAMbdoEibfY4dbjzb7mpfvU6EQBRd8jF1UyYcj4h3uxPSEWkIxs0xnSVKgM3O
 ma+60ZPy4uXYsVfvXTgW9BlI0D/TnbvSyOCqGpvQQZxbbHExgx2bDjxLOhWVa8iZDWrD
 UCol5B6NRSjJnxYb4Kro5FD7GOsswvfKbfT41+5VGCRXOhmj711SCA20W231H0XaGoid
 +Tv4d5oOJ6ZqEe+gmnobaO1hfD+oR/ycfjiYB5hqJLZIPG1QgfsxYGuoyHNLFmykCL2H
 jPQQ==
X-Gm-Message-State: AOAM5308WhvWa+cRG7W+A5Z8s1TyILVfkYMqKRO5oPWFU9gfwa86DMOe
 ay/4WdDzZwieteZpSU5XlkFrewWMBfw5/Q==
X-Google-Smtp-Source: ABdhPJwDfO7SI8OgrNUzwHkFaFeeyvOx17LO1xJRX43xWmhndNinMgOp418h6k6U0UHfVxFA3fmlZg==
X-Received: by 2002:a17:903:3009:b0:15c:f92b:7fba with SMTP id
 o9-20020a170903300900b0015cf92b7fbamr18075831pla.82.1651607578586; 
 Tue, 03 May 2022 12:52:58 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 73/74] target/rx: Implement libgloss semihosting
Date: Tue,  3 May 2022 12:48:42 -0700
Message-Id: <20220503194843.1379101-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/devices/rx-softmmu/default.mak |   1 +
 target/rx/cpu.h                        |   2 +
 target/rx/helper.c                     |   5 +
 target/rx/rx-semi.c                    | 165 +++++++++++++++++++++++++
 target/rx/translate.c                  |   7 +-
 qemu-options.hx                        |  13 +-
 target/rx/meson.build                  |   4 +-
 7 files changed, 189 insertions(+), 8 deletions(-)
 create mode 100644 target/rx/rx-semi.c

diff --git a/configs/devices/rx-softmmu/default.mak b/configs/devices/rx-softmmu/default.mak
index df2b4e4f42..5c1033a2d3 100644
--- a/configs/devices/rx-softmmu/default.mak
+++ b/configs/devices/rx-softmmu/default.mak
@@ -1,3 +1,4 @@
 # Default configuration for rx-softmmu
 
 CONFIG_RX_GDBSIM=y
+CONFIG_SEMIHOSTING=y
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 5b93c0dcb0..117cfea027 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -88,6 +88,7 @@ enum {
     /* Private to the qemu implementation. */
     EXCP_IRQ,
     EXCP_FIRQ,
+    EXCP_SEMIHOST,
 };
 
 typedef struct CPUArchState {
@@ -147,6 +148,7 @@ const char *rx_crname(uint8_t cr);
 #ifndef CONFIG_USER_ONLY
 void rx_cpu_do_interrupt(CPUState *cpu);
 bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);
+void rx_cpu_do_semihosting(CPURXState *env);
 #endif /* !CONFIG_USER_ONLY */
 void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/rx/helper.c b/target/rx/helper.c
index d12e551cc2..00f72b2090 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -53,6 +53,11 @@ void rx_cpu_do_interrupt(CPUState *cs)
 
     env->in_sleep = 0;
 
+    if (vec == EXCP_SEMIHOST) {
+        rx_cpu_do_semihosting(env);
+        return;
+    }
+
     if (env->psw_u) {
         env->usp = env->regs[0];
     } else {
diff --git a/target/rx/rx-semi.c b/target/rx/rx-semi.c
new file mode 100644
index 0000000000..f2406ad219
--- /dev/null
+++ b/target/rx/rx-semi.c
@@ -0,0 +1,165 @@
+/*
+ *  gdbsim semihosting syscall interface.
+ *  The semihosting protocol implemented here is described in
+ *
+ *  libgloss sources:
+ *  https://sourceware.org/git/gitweb.cgi?p=newlib-cygwin.git;a=blob;f=libgloss/syscall.h;hb=HEAD
+ *
+ *  gdb sources:
+ *  https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=sim/rx/syscalls.c;hb=HEAD
+ *
+ *  Copyright (c) 2022 Linaro, Ltd.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/gdbstub.h"
+#include "semihosting/syscalls.h"
+#include "qemu/log.h"
+
+/*
+ * These are the syscall numbers from libgloss/syscall.h,
+ * but note that not all of them are implemented.
+ */
+enum {
+    TARGET_SYS_exit = 1,
+    TARGET_SYS_open,
+    TARGET_SYS_close,
+    TARGET_SYS_read,
+    TARGET_SYS_write,
+    TARGET_SYS_lseek,
+    TARGET_SYS_unlink,
+    TARGET_SYS_getpid,
+    TARGET_SYS_kill,
+    TARGET_SYS_fstat,
+    TARGET_SYS_sbrk,
+    TARGET_SYS_argvlen,
+    TARGET_SYS_argv,
+    TARGET_SYS_chdir,
+    TARGET_SYS_stat,
+    TARGET_SYS_chmod,
+    TARGET_SYS_utime,
+    TARGET_SYS_time,
+    TARGET_SYS_gettimeofday,
+    TARGET_SYS_times,
+    TARGET_SYS_link,
+    TARGET_SYS_argc,
+    TARGET_SYS_argnlen,
+    TARGET_SYS_argn,
+    TARGET_SYS_reconfig,
+};
+
+static void rx_semi_cb(CPUState *cs, uint64_t ret, int err)
+{
+    CPURXState *env = cs->env_ptr;
+
+    /* There is no concept of errno in this interface. */
+    env->regs[1] = ret;
+}
+
+static bool rx_semi_arg(CPURXState *env, uint32_t *ret, int argn)
+{
+    if (argn < 4) {
+        *ret = env->regs[argn + 1];
+    } else {
+        uint32_t stack_addr = env->regs[0] + 4 + (argn - 4) * 4;
+        if (cpu_memory_rw_debug(env_cpu(env), stack_addr, ret, 4, 0)) {
+            return false;
+        }
+        tswap32s(ret);
+    }
+    return true;
+}
+
+#define GET_ARG(E, N) \
+    ({ uint32_t v_; if (!rx_semi_arg((E), &v_, (N))) goto failed; v_; })
+
+void rx_cpu_do_semihosting(CPURXState *env)
+{
+    CPUState *cs = env_cpu(env);
+    uint32_t nr = env->regs[5];
+    uint32_t a0, a1, a2;
+
+    switch (nr) {
+    case TARGET_SYS_exit:
+        a0 = GET_ARG(env, 0);
+        gdb_exit(a0);
+        exit(a0);
+
+    case TARGET_SYS_open:
+        /*
+         * This function is declared int open(char *path, int flags, ...),
+         * which means that only the first argument is in registers.
+         */
+        a0 = GET_ARG(env, 0);
+        a1 = GET_ARG(env, 4);
+        a2 = GET_ARG(env, 5);
+        semihost_sys_open(cs, rx_semi_cb, a0, 0, a1, a2);
+        break;
+
+    case TARGET_SYS_close:
+        a0 = GET_ARG(env, 0);
+        semihost_sys_close(cs, rx_semi_cb, a0);
+        break;
+
+    case TARGET_SYS_read:
+        a0 = GET_ARG(env, 0);
+        a1 = GET_ARG(env, 1);
+        a2 = GET_ARG(env, 2);
+        semihost_sys_read(cs, rx_semi_cb, a0, a1, a2);
+        break;
+
+    case TARGET_SYS_write:
+        a0 = GET_ARG(env, 0);
+        a1 = GET_ARG(env, 1);
+        a2 = GET_ARG(env, 2);
+        semihost_sys_write(cs, rx_semi_cb, a0, a1, a2);
+        break;
+
+    case TARGET_SYS_getpid:
+        rx_semi_cb(cs, 42, 0);
+        break;
+
+    case TARGET_SYS_gettimeofday:
+        a0 = GET_ARG(env, 0);
+        semihost_sys_gettimeofday(cs, rx_semi_cb, a0, 0);
+        break;
+
+    case TARGET_SYS_kill:
+        a0 = GET_ARG(env, 0);
+        if (a0 != 42) {
+            goto failed;
+        }
+        /* Without defined signal numbers, pretend they're all SIGABRT. */
+        gdb_exit(-1);
+        abort();
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "rx-semihosting: unsupported "
+                      "semihosting syscall %u\n", nr);
+        /* fall through */
+
+    failed:
+        rx_semi_cb(cs, -1, 0);
+        break;
+    }
+
+    /*
+     * Skip the semihosting insn (int #255).
+     * Must be done after any cpu_loop_exit() within the syscalls.
+     */
+    env->pc += 3;
+}
diff --git a/target/rx/translate.c b/target/rx/translate.c
index ddf31afb11..4a072661ca 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -27,6 +27,7 @@
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
 #include "exec/log.h"
+#include "semihosting/semihost.h"
 
 typedef struct DisasContext {
     DisasContextBase base;
@@ -2276,7 +2277,11 @@ static bool trans_BRK(DisasContext *ctx, arg_BRK *a)
 static bool trans_INT(DisasContext *ctx, arg_INT *a)
 {
     tcg_debug_assert(a->imm < 0x100);
-    gen_raise_exception(ctx, EXCP_INTB_0 + a->imm, true);
+    if (semihosting_enabled() && a->imm == 0xff) {
+        gen_raise_exception(ctx, EXCP_SEMIHOST, false);
+    } else {
+        gen_raise_exception(ctx, EXCP_INTB_0 + a->imm, true);
+    }
     return true;
 }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 5f69b94b8e..4feb969b14 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4530,10 +4530,11 @@ ERST
 DEF("semihosting", 0, QEMU_OPTION_semihosting,
     "-semihosting    semihosting mode\n",
     QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA |
-    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
+    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV | QEMU_ARCH_RX)
 SRST
 ``-semihosting``
-    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V only).
+    Enable semihosting mode
+    (Only ARM, M68K, Xtensa, MIPS, Nios II, RISC-V, RX).
 
     Note that this allows guest direct access to the host filesystem, so
     should only be used with a trusted guest OS.
@@ -4545,11 +4546,11 @@ DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
     "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]\n" \
     "                semihosting configuration\n",
 QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA |
-QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
+QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV | QEMU_ARCH_RX)
 SRST
 ``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]``
-    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
-    only).
+    Enable and configure semihosting
+    (Only ARM, M68K, Xtensa, MIPS, Nios II, RISC-V, RX).
 
     Note that this allows guest direct access to the host filesystem, so
     should only be used with a trusted guest OS.
@@ -4557,7 +4558,7 @@ SRST
     On Arm this implements the standard semihosting API, version 2.0.
 
     On M68K this implements the "ColdFire GDB" interface used by
-    libgloss.
+    libgloss.  Nios II and RX also use the libgloss interface.
 
     Xtensa semihosting provides basic file IO calls, such as
     open/read/write/seek/select. Tensilica baremetal libc for ISS and
diff --git a/target/rx/meson.build b/target/rx/meson.build
index 8de0ad49b9..2eeac0c1b5 100644
--- a/target/rx/meson.build
+++ b/target/rx/meson.build
@@ -10,7 +10,9 @@ rx_ss.add(files(
   'helper.c',
   'cpu.c',
   'gdbstub.c',
-  'disas.c'))
+  'disas.c',
+  'rx-semi.c',
+))
 
 target_arch += {'rx': rx_ss}
 target_softmmu_arch += {'rx': ss.source_set()}
-- 
2.34.1


