Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D5F3CC6BD
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:23:08 +0200 (CEST)
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4teF-0004RG-QU
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcN-0001e5-W5
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:12 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcL-0000gm-5D
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:11 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so10422334wmi.2
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ndl+zZXziO/4kEyeYe5L5/rATAXmmolk95+4TmPUIF8=;
 b=o28XfSleMljKczJ8p+oaQYjOwflbHdUZxCusmQaCcgF7MfempHsvv+b9j8dF//Lkcl
 9jNgvO0WjtfH+ukJqOOgEdAxk4hhLobe6MYphi8HwlGjpM3cgDK79HyiL5bMmgwaT+81
 zPmYL7O/JeD6zt0+Gzvlp11ZcCeE0SvwdYbuy+Ej9s4sgfgM7DTRMaxZ0DmANP5mdV9y
 XEwkvBywvTj6taz1t2C05HPReoAfE0EpHjwBKTxJcXEq0a2+q8lvmf8ojRgf8UTuaFYW
 lxg1UAP7fzmjS/GVMrkJnw9SwYSc1pFLeqjMPdPfZk/bq7pceDGypyuODG8qQTMRWj3J
 3SCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ndl+zZXziO/4kEyeYe5L5/rATAXmmolk95+4TmPUIF8=;
 b=HmPwrjZfDJFZWhNfkeZCIH5KCld2HcQYzYQft4v45c/SyH3mU+Ky2zzlSBl6mpUy/g
 Jf70UiCK/d7Xu/O5Jut/6/6jrdHPsR9sneVdVKjFnBgsT9e8v6WsO/1vHb3cF36HAp/O
 RbeJL5v22KzBBNAZnTUc1pfYAp30c9+uXUEWbQBPKbYwvHmTAZ0XzCTPt1GQKOKu5Po/
 o7HKcgsSlh+Q14+KRKvPNcmSwfJE1RkhMu1JkaitMKYojJBTXiZx73WNZ1cQIQL4nlwu
 Qx/+ZUYqOb2qkv2P0KEvtAAolqzVryHOA265IrToKwDg2gEy4iIM1LC2fbR5655ibSZm
 T3BA==
X-Gm-Message-State: AOAM53034vVYk0nnn4uIugLQqZIEvh1rD96chEOBQHA1pfQ3+5QyGlTJ
 K2d8RCY2FzQNd10dIhi5oziv5Q5jdn1CuQ==
X-Google-Smtp-Source: ABdhPJzXd9VPdNS8Se1TI2kIIJ9CWohuH7TtJZBA3qQrlkyXZhrzOX3AZJ6DABuLHTAocwjXz5PQvg==
X-Received: by 2002:a05:600c:4856:: with SMTP id
 j22mr24123331wmo.126.1626564067736; 
 Sat, 17 Jul 2021 16:21:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o15sm7082517wmh.40.2021.07.17.16.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:21:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 03/10] linux-user: Split signal-related prototypes
 into sighandling.h
Date: Sun, 18 Jul 2021 00:20:56 +0100
Message-Id: <20210717232103.18047-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210717232103.18047-1-peter.maydell@linaro.org>
References: <20210717232103.18047-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split the signal related prototypes into a new header file
sighandling.h, and include it in those places that require it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h                | 36 --------------------
 linux-user/sighandling.h         | 56 ++++++++++++++++++++++++++++++++
 linux-user/aarch64/cpu_loop.c    |  1 +
 linux-user/aarch64/signal.c      |  1 +
 linux-user/alpha/cpu_loop.c      |  1 +
 linux-user/alpha/signal.c        |  1 +
 linux-user/arm/cpu_loop.c        |  1 +
 linux-user/arm/signal.c          |  1 +
 linux-user/cris/cpu_loop.c       |  1 +
 linux-user/cris/signal.c         |  1 +
 linux-user/fd-trans.c            |  1 +
 linux-user/hexagon/cpu_loop.c    |  1 +
 linux-user/hexagon/signal.c      |  1 +
 linux-user/hppa/cpu_loop.c       |  1 +
 linux-user/hppa/signal.c         |  1 +
 linux-user/i386/cpu_loop.c       |  1 +
 linux-user/i386/signal.c         |  1 +
 linux-user/m68k/cpu_loop.c       |  1 +
 linux-user/m68k/signal.c         |  1 +
 linux-user/main.c                |  1 +
 linux-user/microblaze/cpu_loop.c |  1 +
 linux-user/microblaze/signal.c   |  1 +
 linux-user/mips/cpu_loop.c       |  1 +
 linux-user/mips/signal.c         |  1 +
 linux-user/nios2/cpu_loop.c      |  1 +
 linux-user/nios2/signal.c        |  1 +
 linux-user/openrisc/cpu_loop.c   |  1 +
 linux-user/openrisc/signal.c     |  1 +
 linux-user/ppc/cpu_loop.c        |  1 +
 linux-user/ppc/signal.c          |  1 +
 linux-user/riscv/cpu_loop.c      |  1 +
 linux-user/riscv/signal.c        |  1 +
 linux-user/s390x/cpu_loop.c      |  1 +
 linux-user/s390x/signal.c        |  1 +
 linux-user/sh4/cpu_loop.c        |  1 +
 linux-user/sh4/signal.c          |  1 +
 linux-user/signal.c              |  1 +
 linux-user/sparc/cpu_loop.c      |  1 +
 linux-user/sparc/signal.c        |  1 +
 linux-user/syscall.c             |  1 +
 linux-user/xtensa/cpu_loop.c     |  1 +
 linux-user/xtensa/signal.c       |  1 +
 42 files changed, 96 insertions(+), 36 deletions(-)
 create mode 100644 linux-user/sighandling.h

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index ad2d49fed9f..76d3f5e7eb9 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -415,42 +415,6 @@ extern long safe_syscall_base(int *pending, long number, ...);
 /* syscall.c */
 int host_to_target_waitstatus(int status);
 
-/* signal.c */
-void process_pending_signals(CPUArchState *cpu_env);
-void signal_init(void);
-int queue_signal(CPUArchState *env, int sig, int si_type,
-                 target_siginfo_t *info);
-void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
-void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
-int target_to_host_signal(int sig);
-int host_to_target_signal(int sig);
-long do_sigreturn(CPUArchState *env);
-long do_rt_sigreturn(CPUArchState *env);
-abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
-                        CPUArchState *env);
-int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset);
-abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
-                        abi_ulong unew_ctx, abi_long ctx_size);
-/**
- * block_signals: block all signals while handling this guest syscall
- *
- * Block all signals, and arrange that the signal mask is returned to
- * its correct value for the guest before we resume execution of guest code.
- * If this function returns non-zero, then the caller should immediately
- * return -TARGET_ERESTARTSYS to the main loop, which will take the pending
- * signal and restart execution of the syscall.
- * If block_signals() returns zero, then the caller can continue with
- * emulation of the system call knowing that no signals can be taken
- * (and therefore that no race conditions will result).
- * This should only be called once, because if it is called a second time
- * it will always return non-zero. (Think of it like a mutex that can't
- * be recursively locked.)
- * Signals will be unblocked again by process_pending_signals().
- *
- * Return value: non-zero if there was a pending signal, zero if not.
- */
-int block_signals(void); /* Returns non zero if signal pending */
-
 #ifdef TARGET_I386
 /* vm86.c */
 void save_v86_state(CPUX86State *env);
diff --git a/linux-user/sighandling.h b/linux-user/sighandling.h
new file mode 100644
index 00000000000..8da369b0381
--- /dev/null
+++ b/linux-user/sighandling.h
@@ -0,0 +1,56 @@
+/*
+ * sighandling.h: prototypes for linux-user signal handling
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
+#ifndef LINUX_USER_SIGHANDLING_H
+#define LINUX_USER_SIGHANDLING_H
+
+/* signal.c */
+void process_pending_signals(CPUArchState *cpu_env);
+void signal_init(void);
+int queue_signal(CPUArchState *env, int sig, int si_type,
+                 target_siginfo_t *info);
+void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
+void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
+int target_to_host_signal(int sig);
+int host_to_target_signal(int sig);
+long do_sigreturn(CPUArchState *env);
+long do_rt_sigreturn(CPUArchState *env);
+abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
+                        CPUArchState *env);
+int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset);
+abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
+                        abi_ulong unew_ctx, abi_long ctx_size);
+/**
+ * block_signals: block all signals while handling this guest syscall
+ *
+ * Block all signals, and arrange that the signal mask is returned to
+ * its correct value for the guest before we resume execution of guest code.
+ * If this function returns non-zero, then the caller should immediately
+ * return -TARGET_ERESTARTSYS to the main loop, which will take the pending
+ * signal and restart execution of the syscall.
+ * If block_signals() returns zero, then the caller can continue with
+ * emulation of the system call knowing that no signals can be taken
+ * (and therefore that no race conditions will result).
+ * This should only be called once, because if it is called a second time
+ * it will always return non-zero. (Think of it like a mutex that can't
+ * be recursively locked.)
+ * Signals will be unblocked again by process_pending_signals().
+ *
+ * Return value: non-zero if there was a pending signal, zero if not.
+ */
+int block_signals(void); /* Returns non zero if signal pending */
+
+#endif /* LINUX_USER_SIGHANDLING_H */
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index ee72a1c20f0..459efdf2ec2 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 #include "qemu/guest-random.h"
 #include "semihosting/common-semi.h"
 #include "target/arm/syndrome.h"
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 662bcd1c4e5..75073dd3ec6 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 struct target_sigcontext {
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 7ce2461a028..2939ef5c845 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 
 void cpu_loop(CPUAlphaState *env)
 {
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 1129ffeea1d..7f5dd3eef2f 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 struct target_sigcontext {
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 69632d15be1..7a66079fd9c 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 #include "semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 32b68ee302b..bd0f29b3016 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 struct target_sigcontext {
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 334edddd1e2..00c652b9a56 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 
 void cpu_loop(CPUCRISState *env)
 {
diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
index 1e02194377b..093a9758423 100644
--- a/linux-user/cris/signal.c
+++ b/linux-user/cris/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 struct target_sigcontext {
diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 86b6f484d30..8cdb97b81d1 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -28,6 +28,7 @@
 #endif
 #include "qemu.h"
 #include "fd-trans.h"
+#include "sighandling.h"
 
 enum {
     QEMU_IFLA_BR_UNSPEC,
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index bc34f5d7c30..aeddb91526d 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 #include "internal.h"
 
 void cpu_loop(CPUHexagonState *env)
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index 85eab5e9438..58ff2caa7e3 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 struct target_sigcontext {
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 3aaaf3337cb..3ddaa4155c4 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 
 static abi_ulong hppa_lws(CPUHPPAState *env)
 {
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index 0e266f472d5..4e08a3d74bb 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 struct target_sigcontext {
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index f813e87294a..db6dbf40cdc 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 
 /***********************************************************/
 /* CPUX86 core interface */
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 8701774e379..79a81f4e7c7 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 /* from the Linux kernel - /arch/x86/include/uapi/asm/sigcontext.h */
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index c7a500b58c4..cbbcce729da 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 
 void cpu_loop(CPUM68KState *env)
 {
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index d06230655e9..c3a1c99d6d5 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 struct target_sigcontext {
diff --git a/linux-user/main.c b/linux-user/main.c
index 37ed50d98e2..c10e3ccf135 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -49,6 +49,7 @@
 #include "cpu_loop-common.h"
 #include "crypto/init.h"
 #include "fd-trans.h"
+#include "sighandling.h"
 
 #ifndef AT_FLAGS_PRESERVE_ARGV0
 #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index c3396a6e09b..3549ebe08bc 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 
 void cpu_loop(CPUMBState *env)
 {
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index 4c483bd8c60..ba04c3cc588 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 struct target_sigcontext {
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 9d813ece4e7..929e29f60f1 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 #include "elf.h"
 #include "internal.h"
 #include "fpu_helper.h"
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index e6be807a81a..fa242536315 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 # if defined(TARGET_ABI_MIPSO32)
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 9869083fa19..d3c042b8d0a 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 
 void cpu_loop(CPUNios2State *env)
 {
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index cc3872f11da..fb8ae7b4f92 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 #define MCONTEXT_VERSION 2
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index b33fa777187..7d24d3891d8 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 
 void cpu_loop(CPUOpenRISCState *env)
 {
diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
index 5c5640a2848..62f85d18e4d 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 typedef struct target_sigcontext {
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index fa91ea0eed9..61367d53b74 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 
 static inline uint64_t cpu_ppc_get_tb(CPUPPCState *env)
 {
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index edfad28a375..d9a41723a0f 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 /* Size of dummy stack frame allocated when calling signal handler.
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 74a9628dc9b..d6a5d2d8975 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu/error-report.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 #include "elf.h"
 #include "semihosting/common-semi.h"
 
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 9405c7fd9af..29a93d28932 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 /* Signal handler invocation must be transparent for the code being
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index f2d1215fb1b..f3d345986d8 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 
 /* s390x masks the fault address it reports in si_addr for SIGSEGV and SIGBUS */
 #define S390X_FAIL_ADDR_MASK -4096LL
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index bf8a8fbfe9f..4f900fee422 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 #define __NUM_GPRS 16
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 222ed1c670c..059c7420eea 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 
 void cpu_loop(CPUSH4State *env)
 {
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index 0451e65806a..df78a2032fe 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 /*
diff --git a/linux-user/signal.c b/linux-user/signal.c
index ee1934947ac..bbfe250baa3 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -23,6 +23,7 @@
 
 #include "qemu.h"
 #include "strace.h"
+#include "sighandling.h"
 #include "trace.h"
 #include "signal-common.h"
 
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 02532f198df..9b633029a92 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 
 #define SPARC64_STACK_BIAS 2047
 
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 0cc3db5570e..c2b6ba88ad2 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 /* A Sparc register window */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4932eebd5e5..e2dd799134e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -128,6 +128,7 @@
 
 #include "qemu.h"
 #include "strace.h"
+#include "sighandling.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index 64831c91996..a0710ed044a 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "sighandling.h"
 
 static void xtensa_rfw(CPUXtensaState *env)
 {
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 72771e1294b..32d666f2523 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "sighandling.h"
 #include "linux-user/trace.h"
 
 struct target_sigcontext {
-- 
2.20.1


