Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D834E6AF773
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:23:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZekz-0001u5-OX; Tue, 07 Mar 2023 16:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekp-0001iT-Iu
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:51 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekk-000832-Ql
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:51 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r18so13524279wrx.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A584Lv2do2xGNdqFvJ2raR2ZuHi5bx+lhvjawXi4QHM=;
 b=LCMwMVepf0b7HCYa2b8Fkl1gjJhyuarpdxpGIhrNGFej3kG4py3cBiTbw6K7tStUb+
 wNEENWxTGVGT+p4gUL9JI3TO7ZYkIJift+UJlp/lIeAVWnok2X1Tyah2Q09QHi0Y8lwe
 uwt1WLGF3hj1rIGZYdHM1K2U+7I4TEY1T8kTGCJwR3NdfIo9+ByOob1ahSbP5ZR/bDGg
 xzB2UeyXCd32WDQGuk3sabX3MjF4jkVIQMZ5vekDiRgLi4FeOq93Ar/LcRZBfK1k+Nkf
 YBsYjzSaCc+MyGZPhseEmLuVsNVQHHGkgkMlndg7woB0tI+5xTOhlnFUGpJuuhXs6ezP
 vlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A584Lv2do2xGNdqFvJ2raR2ZuHi5bx+lhvjawXi4QHM=;
 b=7Rq0TC4RgUY9EXCJL0dq10Wk9gTz8YSNKk4he3ogzyjpmleXZmFK3DfW7Tq2fjghGx
 gTh+5dyQYOO7A2/o3jYDZWohqddDMsvEcsYiQi5JyKOurmqGL7P0jOONyPyTbioABb4r
 RF/aUI3AGlX+3Nh/0LXnU89uae8UP3wE/Py57+ZPDScBSbIOtT4abtWtplD7nu7Roa9K
 jDh5xbkYGOgXvF5YK9QmXBtFsdhqxliV6biKzjghkHLiSkZC+AiGsRW1jV8XgyY/YwjO
 +QHSqaCbO2HIsG8YZUB49rR8yVSFpI9mHLuFVOb7vjqmEJmkJfVtfir87mBZibMSR4+M
 Efcw==
X-Gm-Message-State: AO0yUKW1vFqtWDlA8X3xE1IME6rj81/uH+P3pGdbJS/8Zv0PBSh/AVV+
 kG2OP1x5iRmc1wbYh9AI3ZCKqAuVZZzVQPf8o4w=
X-Google-Smtp-Source: AK7set8T+K3x2gDjIl3y0ViaQB1S7zlhyndqgXKj+biVuwaaGkzxTxhaxNDpzoBjzBXSkWZSbTApsg==
X-Received: by 2002:adf:eed1:0:b0:2c5:4c9f:cf3b with SMTP id
 a17-20020adfeed1000000b002c54c9fcf3bmr12831109wrp.7.1678224105196; 
 Tue, 07 Mar 2023 13:21:45 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a7bcd0d000000b003db01178b62sm17620977wmj.40.2023.03.07.13.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:21:44 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC0791FFBA;
 Tue,  7 Mar 2023 21:21:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 11/30] gdbstub: move chunks of user code into own files
Date: Tue,  7 Mar 2023 21:21:20 +0000
Message-Id: <20230307212139.883112-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

The process was pretty similar to the softmmu move except we take the
time to split stuff between user.c and user-target.c to avoid as much
target specific compilation as possible. We also start to make use of
our shiny new header scheme so the user-only helpers can be included
without the rest of the exec/gsbstub.h cruft.

As before we split some functions into user and softmmu versions

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-12-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-12-richard.henderson@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 118efa5e29..42841ac015 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2743,6 +2743,7 @@ S: Maintained
 F: docs/system/gdb.rst
 F: gdbstub/*
 F: include/exec/gdbstub.h
+F: include/gdbstub/*
 F: gdb-xml/
 F: tests/tcg/multiarch/gdbstub/
 F: scripts/feature_to_c.sh
diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 83989af859..6bd6a05657 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -117,6 +117,22 @@ int gdb_get_cpu_index(CPUState *cpu);
 
 void gdb_create_default_process(GDBState *s);
 
+/* signal mapping, common for softmmu, specialised for user-mode */
+int gdb_signal_to_target(int sig);
+int gdb_target_signal_to_gdb(int sig);
+
+int gdb_get_char(void); /* user only */
+
+/**
+ * gdb_continue() - handle continue in mode specific way.
+ */
+void gdb_continue(void);
+
+/**
+ * gdb_continue_partial() - handle partial continue in mode specific way.
+ */
+int gdb_continue_partial(char *newstates);
+
 /*
  * Helpers with separate softmmu and user implementations
  */
@@ -149,6 +165,8 @@ typedef union GdbCmdVariant {
 #define get_param(p, i)    (&g_array_index(p, GdbCmdVariant, i))
 
 void gdb_handle_query_rcmd(GArray *params, void *user_ctx); /* softmmu */
+void gdb_handle_query_offsets(GArray *params, void *user_ctx); /* user */
+void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx); /*user */
 
 /*
  * Break/Watch point support - there is an implementation for softmmu
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 1636fb3841..8fff5450ed 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -103,27 +103,6 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
 void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
 int use_gdb_syscalls(void);
 
-#ifdef CONFIG_USER_ONLY
-/**
- * gdb_handlesig: yield control to gdb
- * @cpu: CPU
- * @sig: if non-zero, the signal number which caused us to stop
- *
- * This function yields control to gdb, when a user-mode-only target
- * needs to stop execution. If @sig is non-zero, then we will send a
- * stop packet to tell gdb that we have stopped because of this signal.
- *
- * This function will block (handling protocol requests from gdb)
- * until gdb tells us to continue target execution. When it does
- * return, the return value is a signal to deliver to the target,
- * or 0 if no signal should be delivered, ie the signal that caused
- * us to stop should be ignored.
- */
-int gdb_handlesig(CPUState *, int);
-void gdb_signalled(CPUArchState *, int);
-void gdbserver_fork(CPUState *);
-#endif
-
 /* Get or set a register.  Returns the size of the register.  */
 typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
 typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
diff --git a/include/gdbstub/user.h b/include/gdbstub/user.h
new file mode 100644
index 0000000000..d392e510c5
--- /dev/null
+++ b/include/gdbstub/user.h
@@ -0,0 +1,43 @@
+/*
+ * gdbstub user-mode only APIs
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef GDBSTUB_USER_H
+#define GDBSTUB_USER_H
+
+/**
+ * gdb_handlesig() - yield control to gdb
+ * @cpu: CPU
+ * @sig: if non-zero, the signal number which caused us to stop
+ *
+ * This function yields control to gdb, when a user-mode-only target
+ * needs to stop execution. If @sig is non-zero, then we will send a
+ * stop packet to tell gdb that we have stopped because of this signal.
+ *
+ * This function will block (handling protocol requests from gdb)
+ * until gdb tells us to continue target execution. When it does
+ * return, the return value is a signal to deliver to the target,
+ * or 0 if no signal should be delivered, ie the signal that caused
+ * us to stop should be ignored.
+ */
+int gdb_handlesig(CPUState *, int);
+
+/**
+ * gdb_signalled() - inform remote gdb of sig exit
+ * @as: current CPUArchState
+ * @sig: signal number
+ */
+void gdb_signalled(CPUArchState *as, int sig);
+
+/**
+ * gdbserver_fork() - disable gdb stub for child processes.
+ * @cs: CPU
+ */
+void gdbserver_fork(CPUState *cs);
+
+
+#endif /* GDBSTUB_USER_H */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 41290e16f9..89f225dead 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -44,6 +44,7 @@
 #include "trace/control.h"
 #include "crypto/init.h"
 #include "qemu/guest-random.h"
+#include "gdbstub/user.h"
 
 #include "host-os.h"
 #include "target_arch_cpu.h"
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 58a5386395..f4e078ee1d 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu.h"
+#include "gdbstub/user.h"
 #include "signal-common.h"
 #include "trace.h"
 #include "hw/core/tcg-cpu-ops.h"
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 4b939c689c..6907bdc99c 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -30,13 +30,12 @@
 #include "trace.h"
 #include "exec/gdbstub.h"
 #ifdef CONFIG_USER_ONLY
-#include "qemu.h"
+#include "gdbstub/user.h"
 #else
 #include "hw/cpu/cluster.h"
 #include "hw/boards.h"
 #endif
 
-#include "qemu/sockets.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
 #include "semihosting/semihost.h"
@@ -80,223 +79,6 @@ static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
     return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
 }
 
-/*
- * Return the GDB index for a given vCPU state.
- *
- * For user mode this is simply the thread id.
- */
-#if defined(CONFIG_USER_ONLY)
-int gdb_get_cpu_index(CPUState *cpu)
-{
-    TaskState *ts = (TaskState *) cpu->opaque;
-    return ts ? ts->ts_tid : -1;
-}
-#endif
-
-#ifdef CONFIG_USER_ONLY
-
-/* Map target signal numbers to GDB protocol signal numbers and vice
- * versa.  For user emulation's currently supported systems, we can
- * assume most signals are defined.
- */
-
-static int gdb_signal_table[] = {
-    0,
-    TARGET_SIGHUP,
-    TARGET_SIGINT,
-    TARGET_SIGQUIT,
-    TARGET_SIGILL,
-    TARGET_SIGTRAP,
-    TARGET_SIGABRT,
-    -1, /* SIGEMT */
-    TARGET_SIGFPE,
-    TARGET_SIGKILL,
-    TARGET_SIGBUS,
-    TARGET_SIGSEGV,
-    TARGET_SIGSYS,
-    TARGET_SIGPIPE,
-    TARGET_SIGALRM,
-    TARGET_SIGTERM,
-    TARGET_SIGURG,
-    TARGET_SIGSTOP,
-    TARGET_SIGTSTP,
-    TARGET_SIGCONT,
-    TARGET_SIGCHLD,
-    TARGET_SIGTTIN,
-    TARGET_SIGTTOU,
-    TARGET_SIGIO,
-    TARGET_SIGXCPU,
-    TARGET_SIGXFSZ,
-    TARGET_SIGVTALRM,
-    TARGET_SIGPROF,
-    TARGET_SIGWINCH,
-    -1, /* SIGLOST */
-    TARGET_SIGUSR1,
-    TARGET_SIGUSR2,
-#ifdef TARGET_SIGPWR
-    TARGET_SIGPWR,
-#else
-    -1,
-#endif
-    -1, /* SIGPOLL */
-    -1,
-    -1,
-    -1,
-    -1,
-    -1,
-    -1,
-    -1,
-    -1,
-    -1,
-    -1,
-    -1,
-#ifdef __SIGRTMIN
-    __SIGRTMIN + 1,
-    __SIGRTMIN + 2,
-    __SIGRTMIN + 3,
-    __SIGRTMIN + 4,
-    __SIGRTMIN + 5,
-    __SIGRTMIN + 6,
-    __SIGRTMIN + 7,
-    __SIGRTMIN + 8,
-    __SIGRTMIN + 9,
-    __SIGRTMIN + 10,
-    __SIGRTMIN + 11,
-    __SIGRTMIN + 12,
-    __SIGRTMIN + 13,
-    __SIGRTMIN + 14,
-    __SIGRTMIN + 15,
-    __SIGRTMIN + 16,
-    __SIGRTMIN + 17,
-    __SIGRTMIN + 18,
-    __SIGRTMIN + 19,
-    __SIGRTMIN + 20,
-    __SIGRTMIN + 21,
-    __SIGRTMIN + 22,
-    __SIGRTMIN + 23,
-    __SIGRTMIN + 24,
-    __SIGRTMIN + 25,
-    __SIGRTMIN + 26,
-    __SIGRTMIN + 27,
-    __SIGRTMIN + 28,
-    __SIGRTMIN + 29,
-    __SIGRTMIN + 30,
-    __SIGRTMIN + 31,
-    -1, /* SIGCANCEL */
-    __SIGRTMIN,
-    __SIGRTMIN + 32,
-    __SIGRTMIN + 33,
-    __SIGRTMIN + 34,
-    __SIGRTMIN + 35,
-    __SIGRTMIN + 36,
-    __SIGRTMIN + 37,
-    __SIGRTMIN + 38,
-    __SIGRTMIN + 39,
-    __SIGRTMIN + 40,
-    __SIGRTMIN + 41,
-    __SIGRTMIN + 42,
-    __SIGRTMIN + 43,
-    __SIGRTMIN + 44,
-    __SIGRTMIN + 45,
-    __SIGRTMIN + 46,
-    __SIGRTMIN + 47,
-    __SIGRTMIN + 48,
-    __SIGRTMIN + 49,
-    __SIGRTMIN + 50,
-    __SIGRTMIN + 51,
-    __SIGRTMIN + 52,
-    __SIGRTMIN + 53,
-    __SIGRTMIN + 54,
-    __SIGRTMIN + 55,
-    __SIGRTMIN + 56,
-    __SIGRTMIN + 57,
-    __SIGRTMIN + 58,
-    __SIGRTMIN + 59,
-    __SIGRTMIN + 60,
-    __SIGRTMIN + 61,
-    __SIGRTMIN + 62,
-    __SIGRTMIN + 63,
-    __SIGRTMIN + 64,
-    __SIGRTMIN + 65,
-    __SIGRTMIN + 66,
-    __SIGRTMIN + 67,
-    __SIGRTMIN + 68,
-    __SIGRTMIN + 69,
-    __SIGRTMIN + 70,
-    __SIGRTMIN + 71,
-    __SIGRTMIN + 72,
-    __SIGRTMIN + 73,
-    __SIGRTMIN + 74,
-    __SIGRTMIN + 75,
-    __SIGRTMIN + 76,
-    __SIGRTMIN + 77,
-    __SIGRTMIN + 78,
-    __SIGRTMIN + 79,
-    __SIGRTMIN + 80,
-    __SIGRTMIN + 81,
-    __SIGRTMIN + 82,
-    __SIGRTMIN + 83,
-    __SIGRTMIN + 84,
-    __SIGRTMIN + 85,
-    __SIGRTMIN + 86,
-    __SIGRTMIN + 87,
-    __SIGRTMIN + 88,
-    __SIGRTMIN + 89,
-    __SIGRTMIN + 90,
-    __SIGRTMIN + 91,
-    __SIGRTMIN + 92,
-    __SIGRTMIN + 93,
-    __SIGRTMIN + 94,
-    __SIGRTMIN + 95,
-    -1, /* SIGINFO */
-    -1, /* UNKNOWN */
-    -1, /* DEFAULT */
-    -1,
-    -1,
-    -1,
-    -1,
-    -1,
-    -1
-#endif
-};
-#else
-/* In system mode we only need SIGINT and SIGTRAP; other signals
-   are not yet supported.  */
-
-enum {
-    TARGET_SIGINT = 2,
-    TARGET_SIGTRAP = 5
-};
-
-static int gdb_signal_table[] = {
-    -1,
-    -1,
-    TARGET_SIGINT,
-    -1,
-    -1,
-    TARGET_SIGTRAP
-};
-#endif
-
-#ifdef CONFIG_USER_ONLY
-static int target_signal_to_gdb (int sig)
-{
-    int i;
-    for (i = 0; i < ARRAY_SIZE (gdb_signal_table); i++)
-        if (gdb_signal_table[i] == sig)
-            return i;
-    return GDB_SIGNAL_UNKNOWN;
-}
-#endif
-
-static int gdb_signal_to_target (int sig)
-{
-    if (sig < ARRAY_SIZE (gdb_signal_table))
-        return gdb_signal_table[sig];
-    else
-        return -1;
-}
-
 typedef struct GDBRegisterState {
     int base_reg;
     int num_regs;
@@ -306,15 +88,6 @@ typedef struct GDBRegisterState {
     struct GDBRegisterState *next;
 } GDBRegisterState;
 
-#ifdef CONFIG_USER_ONLY
-typedef struct {
-    int fd;
-    char *socket_path;
-    int running_state;
-} GDBUserState;
-static GDBUserState gdbserver_user_state;
-#endif
-
 GDBState gdbserver_state;
 
 void gdb_init_gdbserver_state(void)
@@ -338,34 +111,6 @@ void gdb_init_gdbserver_state(void)
 
 bool gdb_has_xml;
 
-#ifdef CONFIG_USER_ONLY
-
-static int get_char(void)
-{
-    uint8_t ch;
-    int ret;
-
-    for(;;) {
-        ret = recv(gdbserver_user_state.fd, &ch, 1, 0);
-        if (ret < 0) {
-            if (errno == ECONNRESET) {
-                gdbserver_user_state.fd = -1;
-            }
-            if (errno != EINTR) {
-                return -1;
-            }
-        } else if (ret == 0) {
-            close(gdbserver_user_state.fd);
-            gdbserver_user_state.fd = -1;
-            return -1;
-        } else {
-            break;
-        }
-    }
-    return ch;
-}
-#endif
-
 /*
  * Return true if there is a GDB currently connected to the stub
  * and attached to a CPU
@@ -410,104 +155,6 @@ static bool stub_can_reverse(void)
 #endif
 }
 
-/* Resume execution.  */
-static void gdb_continue(void)
-{
-
-#ifdef CONFIG_USER_ONLY
-    gdbserver_user_state.running_state = 1;
-    trace_gdbstub_op_continue();
-#else
-    if (!runstate_needs_reset()) {
-        trace_gdbstub_op_continue();
-        vm_start();
-    }
-#endif
-}
-
-/*
- * Resume execution, per CPU actions. For user-mode emulation it's
- * equivalent to gdb_continue.
- */
-static int gdb_continue_partial(char *newstates)
-{
-    CPUState *cpu;
-    int res = 0;
-#ifdef CONFIG_USER_ONLY
-    /*
-     * This is not exactly accurate, but it's an improvement compared to the
-     * previous situation, where only one CPU would be single-stepped.
-     */
-    CPU_FOREACH(cpu) {
-        if (newstates[cpu->cpu_index] == 's') {
-            trace_gdbstub_op_stepping(cpu->cpu_index);
-            cpu_single_step(cpu, gdbserver_state.sstep_flags);
-        }
-    }
-    gdbserver_user_state.running_state = 1;
-#else
-    int flag = 0;
-
-    if (!runstate_needs_reset()) {
-        bool step_requested = false;
-        CPU_FOREACH(cpu) {
-            if (newstates[cpu->cpu_index] == 's') {
-                step_requested = true;
-                break;
-            }
-        }
-
-        if (vm_prepare_start(step_requested)) {
-            return 0;
-        }
-
-        CPU_FOREACH(cpu) {
-            switch (newstates[cpu->cpu_index]) {
-            case 0:
-            case 1:
-                break; /* nothing to do here */
-            case 's':
-                trace_gdbstub_op_stepping(cpu->cpu_index);
-                cpu_single_step(cpu, gdbserver_state.sstep_flags);
-                cpu_resume(cpu);
-                flag = 1;
-                break;
-            case 'c':
-                trace_gdbstub_op_continue_cpu(cpu->cpu_index);
-                cpu_resume(cpu);
-                flag = 1;
-                break;
-            default:
-                res = -1;
-                break;
-            }
-        }
-    }
-    if (flag) {
-        qemu_clock_enable(QEMU_CLOCK_VIRTUAL, true);
-    }
-#endif
-    return res;
-}
-
-#ifdef CONFIG_USER_ONLY
-void gdb_put_buffer(const uint8_t *buf, int len)
-{
-    int ret;
-
-    while (len > 0) {
-        ret = send(gdbserver_user_state.fd, buf, len, 0);
-        if (ret < 0) {
-            if (errno != EINTR)
-                return;
-        } else {
-            buf += ret;
-            len -= ret;
-        }
-    }
-}
-#endif
-
 /* writes 2*len+1 bytes in buf */
 void gdb_memtohex(GString *buf, const uint8_t *mem, int len)
 {
@@ -593,7 +240,7 @@ int gdb_put_packet_binary(const char *buf, int len, bool dump)
                    gdbserver_state.last_packet->len);
 
 #ifdef CONFIG_USER_ONLY
-        i = get_char();
+        i = gdb_get_char();
         if (i < 0)
             return -1;
         if (i == '+')
@@ -1950,23 +1597,6 @@ static void handle_query_thread_extra(GArray *params, void *user_ctx)
     gdb_put_strbuf();
 }
 
-#ifdef CONFIG_USER_ONLY
-static void handle_query_offsets(GArray *params, void *user_ctx)
-{
-    TaskState *ts;
-
-    ts = gdbserver_state.c_cpu->opaque;
-    g_string_printf(gdbserver_state.str_buf,
-                    "Text=" TARGET_ABI_FMT_lx
-                    ";Data=" TARGET_ABI_FMT_lx
-                    ";Bss=" TARGET_ABI_FMT_lx,
-                    ts->info->code_offset,
-                    ts->info->data_offset,
-                    ts->info->data_offset);
-    gdb_put_strbuf();
-}
-#endif
-
 static void handle_query_supported(GArray *params, void *user_ctx)
 {
     CPUClass *cc;
@@ -2049,53 +1679,6 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
                       gdbserver_state.str_buf->len, true);
 }
 
-#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
-static void handle_query_xfer_auxv(GArray *params, void *user_ctx)
-{
-    TaskState *ts;
-    unsigned long offset, len, saved_auxv, auxv_len;
-
-    if (params->len < 2) {
-        gdb_put_packet("E22");
-        return;
-    }
-
-    offset = get_param(params, 0)->val_ul;
-    len = get_param(params, 1)->val_ul;
-    ts = gdbserver_state.c_cpu->opaque;
-    saved_auxv = ts->info->saved_auxv;
-    auxv_len = ts->info->auxv_len;
-
-    if (offset >= auxv_len) {
-        gdb_put_packet("E00");
-        return;
-    }
-
-    if (len > (MAX_PACKET_LENGTH - 5) / 2) {
-        len = (MAX_PACKET_LENGTH - 5) / 2;
-    }
-
-    if (len < auxv_len - offset) {
-        g_string_assign(gdbserver_state.str_buf, "m");
-    } else {
-        g_string_assign(gdbserver_state.str_buf, "l");
-        len = auxv_len - offset;
-    }
-
-    g_byte_array_set_size(gdbserver_state.mem_buf, len);
-    if (target_memory_rw_debug(gdbserver_state.g_cpu, saved_auxv + offset,
-                               gdbserver_state.mem_buf->data, len, false)) {
-        gdb_put_packet("E14");
-        return;
-    }
-
-    gdb_memtox(gdbserver_state.str_buf,
-               (const char *)gdbserver_state.mem_buf->data, len);
-    gdb_put_packet_binary(gdbserver_state.str_buf->str,
-                          gdbserver_state.str_buf->len, true);
-}
-#endif
-
 static void handle_query_attached(GArray *params, void *user_ctx)
 {
     gdb_put_packet(GDB_ATTACHED);
@@ -2173,7 +1756,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
     },
 #ifdef CONFIG_USER_ONLY
     {
-        .handler = handle_query_offsets,
+        .handler = gdb_handle_query_offsets,
         .cmd = "Offsets",
     },
 #else
@@ -2203,7 +1786,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
     },
 #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
     {
-        .handler = handle_query_xfer_auxv,
+        .handler = gdb_handle_query_xfer_auxv,
         .cmd = "Xfer:auxv:read::",
         .cmd_startswith = 1,
         .schema = "l,l0"
@@ -2791,29 +2374,6 @@ void gdb_read_byte(uint8_t ch)
     }
 }
 
-#ifdef CONFIG_USER_ONLY
-/* Tell the remote gdb that the process has exited.  */
-void gdb_exit(int code)
-{
-    char buf[4];
-
-    if (!gdbserver_state.init) {
-        return;
-    }
-    if (gdbserver_user_state.socket_path) {
-        unlink(gdbserver_user_state.socket_path);
-    }
-    if (gdbserver_user_state.fd < 0) {
-        return;
-    }
-
-    trace_gdbstub_op_exiting((uint8_t)code);
-
-    snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
-    gdb_put_packet(buf);
-}
-#endif
-
 /*
  * Create the process that will contain all the "orphan" CPUs (that are not
  * part of a CPU cluster). Note that if this process contains no CPUs, it won't
@@ -2839,233 +2399,3 @@ void gdb_create_default_process(GDBState *s)
     process->target_xml[0] = '\0';
 }
 
-#ifdef CONFIG_USER_ONLY
-int
-gdb_handlesig(CPUState *cpu, int sig)
-{
-    char buf[256];
-    int n;
-
-    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
-        return sig;
-    }
-
-    /* disable single step if it was enabled */
-    cpu_single_step(cpu, 0);
-    tb_flush(cpu);
-
-    if (sig != 0) {
-        gdb_set_stop_cpu(cpu);
-        g_string_printf(gdbserver_state.str_buf,
-                        "T%02xthread:", target_signal_to_gdb(sig));
-        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
-        g_string_append_c(gdbserver_state.str_buf, ';');
-        gdb_put_strbuf();
-    }
-    /*
-     * gdb_put_packet() might have detected that the peer terminated the
-     * connection.
-     */
-    if (gdbserver_user_state.fd < 0) {
-        return sig;
-    }
-
-    sig = 0;
-    gdbserver_state.state = RS_IDLE;
-    gdbserver_user_state.running_state = 0;
-    while (gdbserver_user_state.running_state == 0) {
-        n = read(gdbserver_user_state.fd, buf, 256);
-        if (n > 0) {
-            int i;
-
-            for (i = 0; i < n; i++) {
-                gdb_read_byte(buf[i]);
-            }
-        } else {
-            /* XXX: Connection closed.  Should probably wait for another
-               connection before continuing.  */
-            if (n == 0) {
-                close(gdbserver_user_state.fd);
-            }
-            gdbserver_user_state.fd = -1;
-            return sig;
-        }
-    }
-    sig = gdbserver_state.signal;
-    gdbserver_state.signal = 0;
-    return sig;
-}
-
-/* Tell the remote gdb that the process has exited due to SIG.  */
-void gdb_signalled(CPUArchState *env, int sig)
-{
-    char buf[4];
-
-    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
-        return;
-    }
-
-    snprintf(buf, sizeof(buf), "X%02x", target_signal_to_gdb(sig));
-    gdb_put_packet(buf);
-}
-
-static void gdb_accept_init(int fd)
-{
-    gdb_init_gdbserver_state();
-    gdb_create_default_process(&gdbserver_state);
-    gdbserver_state.processes[0].attached = true;
-    gdbserver_state.c_cpu = gdb_first_attached_cpu();
-    gdbserver_state.g_cpu = gdbserver_state.c_cpu;
-    gdbserver_user_state.fd = fd;
-    gdb_has_xml = false;
-}
-
-static bool gdb_accept_socket(int gdb_fd)
-{
-    int fd;
-
-    for(;;) {
-        fd = accept(gdb_fd, NULL, NULL);
-        if (fd < 0 && errno != EINTR) {
-            perror("accept socket");
-            return false;
-        } else if (fd >= 0) {
-            qemu_set_cloexec(fd);
-            break;
-        }
-    }
-
-    gdb_accept_init(fd);
-    return true;
-}
-
-static int gdbserver_open_socket(const char *path)
-{
-    struct sockaddr_un sockaddr = {};
-    int fd, ret;
-
-    fd = socket(AF_UNIX, SOCK_STREAM, 0);
-    if (fd < 0) {
-        perror("create socket");
-        return -1;
-    }
-
-    sockaddr.sun_family = AF_UNIX;
-    pstrcpy(sockaddr.sun_path, sizeof(sockaddr.sun_path) - 1, path);
-    ret = bind(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr));
-    if (ret < 0) {
-        perror("bind socket");
-        close(fd);
-        return -1;
-    }
-    ret = listen(fd, 1);
-    if (ret < 0) {
-        perror("listen socket");
-        close(fd);
-        return -1;
-    }
-
-    return fd;
-}
-
-static bool gdb_accept_tcp(int gdb_fd)
-{
-    struct sockaddr_in sockaddr = {};
-    socklen_t len;
-    int fd;
-
-    for(;;) {
-        len = sizeof(sockaddr);
-        fd = accept(gdb_fd, (struct sockaddr *)&sockaddr, &len);
-        if (fd < 0 && errno != EINTR) {
-            perror("accept");
-            return false;
-        } else if (fd >= 0) {
-            qemu_set_cloexec(fd);
-            break;
-        }
-    }
-
-    /* set short latency */
-    if (socket_set_nodelay(fd)) {
-        perror("setsockopt");
-        close(fd);
-        return false;
-    }
-
-    gdb_accept_init(fd);
-    return true;
-}
-
-static int gdbserver_open_port(int port)
-{
-    struct sockaddr_in sockaddr;
-    int fd, ret;
-
-    fd = socket(PF_INET, SOCK_STREAM, 0);
-    if (fd < 0) {
-        perror("socket");
-        return -1;
-    }
-    qemu_set_cloexec(fd);
-
-    socket_set_fast_reuse(fd);
-
-    sockaddr.sin_family = AF_INET;
-    sockaddr.sin_port = htons(port);
-    sockaddr.sin_addr.s_addr = 0;
-    ret = bind(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr));
-    if (ret < 0) {
-        perror("bind");
-        close(fd);
-        return -1;
-    }
-    ret = listen(fd, 1);
-    if (ret < 0) {
-        perror("listen");
-        close(fd);
-        return -1;
-    }
-
-    return fd;
-}
-
-int gdbserver_start(const char *port_or_path)
-{
-    int port = g_ascii_strtoull(port_or_path, NULL, 10);
-    int gdb_fd;
-
-    if (port > 0) {
-        gdb_fd = gdbserver_open_port(port);
-    } else {
-        gdb_fd = gdbserver_open_socket(port_or_path);
-    }
-
-    if (gdb_fd < 0) {
-        return -1;
-    }
-
-    if (port > 0 && gdb_accept_tcp(gdb_fd)) {
-        return 0;
-    } else if (gdb_accept_socket(gdb_fd)) {
-        gdbserver_user_state.socket_path = g_strdup(port_or_path);
-        return 0;
-    }
-
-    /* gone wrong */
-    close(gdb_fd);
-    return -1;
-}
-
-/* Disable gdb stub for child processes.  */
-void gdbserver_fork(CPUState *cpu)
-{
-    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
-        return;
-    }
-    close(gdbserver_user_state.fd);
-    gdbserver_user_state.fd = -1;
-    cpu_breakpoint_remove_all(cpu, BP_GDB);
-    cpu_watchpoint_remove_all(cpu, BP_GDB);
-}
-#endif
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 86a94f1519..a6c196ade6 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -434,6 +434,96 @@ void gdb_handle_query_rcmd(GArray *params, void *user_ctx)
     gdb_put_packet("OK");
 }
 
+/*
+ * Execution state helpers
+ */
+
+void gdb_continue(void)
+{
+    if (!runstate_needs_reset()) {
+        trace_gdbstub_op_continue();
+        vm_start();
+    }
+}
+
+/*
+ * Resume execution, per CPU actions.
+ */
+int gdb_continue_partial(char *newstates)
+{
+    CPUState *cpu;
+    int res = 0;
+    int flag = 0;
+
+    if (!runstate_needs_reset()) {
+        bool step_requested = false;
+        CPU_FOREACH(cpu) {
+            if (newstates[cpu->cpu_index] == 's') {
+                step_requested = true;
+                break;
+            }
+        }
+
+        if (vm_prepare_start(step_requested)) {
+            return 0;
+        }
+
+        CPU_FOREACH(cpu) {
+            switch (newstates[cpu->cpu_index]) {
+            case 0:
+            case 1:
+                break; /* nothing to do here */
+            case 's':
+                trace_gdbstub_op_stepping(cpu->cpu_index);
+                cpu_single_step(cpu, gdbserver_state.sstep_flags);
+                cpu_resume(cpu);
+                flag = 1;
+                break;
+            case 'c':
+                trace_gdbstub_op_continue_cpu(cpu->cpu_index);
+                cpu_resume(cpu);
+                flag = 1;
+                break;
+            default:
+                res = -1;
+                break;
+            }
+        }
+    }
+    if (flag) {
+        qemu_clock_enable(QEMU_CLOCK_VIRTUAL, true);
+    }
+    return res;
+}
+
+/*
+ * Signal Handling - in system mode we only need SIGINT and SIGTRAP; other
+ * signals are not yet supported.
+ */
+
+enum {
+    TARGET_SIGINT = 2,
+    TARGET_SIGTRAP = 5
+};
+
+static int gdb_signal_table[] = {
+    -1,
+    -1,
+    TARGET_SIGINT,
+    -1,
+    -1,
+    TARGET_SIGTRAP
+};
+
+int gdb_signal_to_target(int sig)
+{
+    if (sig < ARRAY_SIZE(gdb_signal_table)) {
+        return gdb_signal_table[sig];
+    } else {
+        return -1;
+    }
+}
+
 /*
  * Break/Watch point helpers
  */
diff --git a/gdbstub/user-target.c b/gdbstub/user-target.c
new file mode 100644
index 0000000000..fa0e59ec9a
--- /dev/null
+++ b/gdbstub/user-target.c
@@ -0,0 +1,283 @@
+/*
+ * Target specific user-mode handling
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#include "qemu/osdep.h"
+#include "exec/gdbstub.h"
+#include "qemu.h"
+#include "internals.h"
+
+/*
+ * Map target signal numbers to GDB protocol signal numbers and vice
+ * versa.  For user emulation's currently supported systems, we can
+ * assume most signals are defined.
+ */
+
+static int gdb_signal_table[] = {
+    0,
+    TARGET_SIGHUP,
+    TARGET_SIGINT,
+    TARGET_SIGQUIT,
+    TARGET_SIGILL,
+    TARGET_SIGTRAP,
+    TARGET_SIGABRT,
+    -1, /* SIGEMT */
+    TARGET_SIGFPE,
+    TARGET_SIGKILL,
+    TARGET_SIGBUS,
+    TARGET_SIGSEGV,
+    TARGET_SIGSYS,
+    TARGET_SIGPIPE,
+    TARGET_SIGALRM,
+    TARGET_SIGTERM,
+    TARGET_SIGURG,
+    TARGET_SIGSTOP,
+    TARGET_SIGTSTP,
+    TARGET_SIGCONT,
+    TARGET_SIGCHLD,
+    TARGET_SIGTTIN,
+    TARGET_SIGTTOU,
+    TARGET_SIGIO,
+    TARGET_SIGXCPU,
+    TARGET_SIGXFSZ,
+    TARGET_SIGVTALRM,
+    TARGET_SIGPROF,
+    TARGET_SIGWINCH,
+    -1, /* SIGLOST */
+    TARGET_SIGUSR1,
+    TARGET_SIGUSR2,
+#ifdef TARGET_SIGPWR
+    TARGET_SIGPWR,
+#else
+    -1,
+#endif
+    -1, /* SIGPOLL */
+    -1,
+    -1,
+    -1,
+    -1,
+    -1,
+    -1,
+    -1,
+    -1,
+    -1,
+    -1,
+    -1,
+#ifdef __SIGRTMIN
+    __SIGRTMIN + 1,
+    __SIGRTMIN + 2,
+    __SIGRTMIN + 3,
+    __SIGRTMIN + 4,
+    __SIGRTMIN + 5,
+    __SIGRTMIN + 6,
+    __SIGRTMIN + 7,
+    __SIGRTMIN + 8,
+    __SIGRTMIN + 9,
+    __SIGRTMIN + 10,
+    __SIGRTMIN + 11,
+    __SIGRTMIN + 12,
+    __SIGRTMIN + 13,
+    __SIGRTMIN + 14,
+    __SIGRTMIN + 15,
+    __SIGRTMIN + 16,
+    __SIGRTMIN + 17,
+    __SIGRTMIN + 18,
+    __SIGRTMIN + 19,
+    __SIGRTMIN + 20,
+    __SIGRTMIN + 21,
+    __SIGRTMIN + 22,
+    __SIGRTMIN + 23,
+    __SIGRTMIN + 24,
+    __SIGRTMIN + 25,
+    __SIGRTMIN + 26,
+    __SIGRTMIN + 27,
+    __SIGRTMIN + 28,
+    __SIGRTMIN + 29,
+    __SIGRTMIN + 30,
+    __SIGRTMIN + 31,
+    -1, /* SIGCANCEL */
+    __SIGRTMIN,
+    __SIGRTMIN + 32,
+    __SIGRTMIN + 33,
+    __SIGRTMIN + 34,
+    __SIGRTMIN + 35,
+    __SIGRTMIN + 36,
+    __SIGRTMIN + 37,
+    __SIGRTMIN + 38,
+    __SIGRTMIN + 39,
+    __SIGRTMIN + 40,
+    __SIGRTMIN + 41,
+    __SIGRTMIN + 42,
+    __SIGRTMIN + 43,
+    __SIGRTMIN + 44,
+    __SIGRTMIN + 45,
+    __SIGRTMIN + 46,
+    __SIGRTMIN + 47,
+    __SIGRTMIN + 48,
+    __SIGRTMIN + 49,
+    __SIGRTMIN + 50,
+    __SIGRTMIN + 51,
+    __SIGRTMIN + 52,
+    __SIGRTMIN + 53,
+    __SIGRTMIN + 54,
+    __SIGRTMIN + 55,
+    __SIGRTMIN + 56,
+    __SIGRTMIN + 57,
+    __SIGRTMIN + 58,
+    __SIGRTMIN + 59,
+    __SIGRTMIN + 60,
+    __SIGRTMIN + 61,
+    __SIGRTMIN + 62,
+    __SIGRTMIN + 63,
+    __SIGRTMIN + 64,
+    __SIGRTMIN + 65,
+    __SIGRTMIN + 66,
+    __SIGRTMIN + 67,
+    __SIGRTMIN + 68,
+    __SIGRTMIN + 69,
+    __SIGRTMIN + 70,
+    __SIGRTMIN + 71,
+    __SIGRTMIN + 72,
+    __SIGRTMIN + 73,
+    __SIGRTMIN + 74,
+    __SIGRTMIN + 75,
+    __SIGRTMIN + 76,
+    __SIGRTMIN + 77,
+    __SIGRTMIN + 78,
+    __SIGRTMIN + 79,
+    __SIGRTMIN + 80,
+    __SIGRTMIN + 81,
+    __SIGRTMIN + 82,
+    __SIGRTMIN + 83,
+    __SIGRTMIN + 84,
+    __SIGRTMIN + 85,
+    __SIGRTMIN + 86,
+    __SIGRTMIN + 87,
+    __SIGRTMIN + 88,
+    __SIGRTMIN + 89,
+    __SIGRTMIN + 90,
+    __SIGRTMIN + 91,
+    __SIGRTMIN + 92,
+    __SIGRTMIN + 93,
+    __SIGRTMIN + 94,
+    __SIGRTMIN + 95,
+    -1, /* SIGINFO */
+    -1, /* UNKNOWN */
+    -1, /* DEFAULT */
+    -1,
+    -1,
+    -1,
+    -1,
+    -1,
+    -1
+#endif
+};
+
+int gdb_signal_to_target(int sig)
+{
+    if (sig < ARRAY_SIZE(gdb_signal_table)) {
+        return gdb_signal_table[sig];
+    } else {
+        return -1;
+    }
+}
+
+int gdb_target_signal_to_gdb(int sig)
+{
+    int i;
+    for (i = 0; i < ARRAY_SIZE(gdb_signal_table); i++) {
+        if (gdb_signal_table[i] == sig) {
+            return i;
+        }
+    }
+    return GDB_SIGNAL_UNKNOWN;
+}
+
+int gdb_get_cpu_index(CPUState *cpu)
+{
+    TaskState *ts = (TaskState *) cpu->opaque;
+    return ts ? ts->ts_tid : -1;
+}
+
+/*
+ * User-mode specific command helpers
+ */
+
+void gdb_handle_query_offsets(GArray *params, void *user_ctx)
+{
+    TaskState *ts;
+
+    ts = gdbserver_state.c_cpu->opaque;
+    g_string_printf(gdbserver_state.str_buf,
+                    "Text=" TARGET_ABI_FMT_lx
+                    ";Data=" TARGET_ABI_FMT_lx
+                    ";Bss=" TARGET_ABI_FMT_lx,
+                    ts->info->code_offset,
+                    ts->info->data_offset,
+                    ts->info->data_offset);
+    gdb_put_strbuf();
+}
+
+#if defined(CONFIG_LINUX)
+/* Partial user only duplicate of helper in gdbstub.c */
+static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
+                                         uint8_t *buf, int len, bool is_write)
+{
+    CPUClass *cc;
+    cc = CPU_GET_CLASS(cpu);
+    if (cc->memory_rw_debug) {
+        return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
+    }
+    return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
+}
+
+void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx)
+{
+    TaskState *ts;
+    unsigned long offset, len, saved_auxv, auxv_len;
+
+    if (params->len < 2) {
+        gdb_put_packet("E22");
+        return;
+    }
+
+    offset = get_param(params, 0)->val_ul;
+    len = get_param(params, 1)->val_ul;
+    ts = gdbserver_state.c_cpu->opaque;
+    saved_auxv = ts->info->saved_auxv;
+    auxv_len = ts->info->auxv_len;
+
+    if (offset >= auxv_len) {
+        gdb_put_packet("E00");
+        return;
+    }
+
+    if (len > (MAX_PACKET_LENGTH - 5) / 2) {
+        len = (MAX_PACKET_LENGTH - 5) / 2;
+    }
+
+    if (len < auxv_len - offset) {
+        g_string_assign(gdbserver_state.str_buf, "m");
+    } else {
+        g_string_assign(gdbserver_state.str_buf, "l");
+        len = auxv_len - offset;
+    }
+
+    g_byte_array_set_size(gdbserver_state.mem_buf, len);
+    if (target_memory_rw_debug(gdbserver_state.g_cpu, saved_auxv + offset,
+                               gdbserver_state.mem_buf->data, len, false)) {
+        gdb_put_packet("E14");
+        return;
+    }
+
+    gdb_memtox(gdbserver_state.str_buf,
+           (const char *)gdbserver_state.mem_buf->data, len);
+    gdb_put_packet_binary(gdbserver_state.str_buf->str,
+                      gdbserver_state.str_buf->len, true);
+}
+#endif
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 09a18fb23b..23b2e726f6 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -10,10 +10,354 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qemu/sockets.h"
+#include "exec/hwaddr.h"
+#include "exec/tb-flush.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/user.h"
 #include "hw/core/cpu.h"
+#include "trace.h"
 #include "internals.h"
 
+/* User-mode specific state */
+typedef struct {
+    int fd;
+    char *socket_path;
+    int running_state;
+} GDBUserState;
+
+static GDBUserState gdbserver_user_state;
+
+int gdb_get_char(void)
+{
+    uint8_t ch;
+    int ret;
+
+    for (;;) {
+        ret = recv(gdbserver_user_state.fd, &ch, 1, 0);
+        if (ret < 0) {
+            if (errno == ECONNRESET) {
+                gdbserver_user_state.fd = -1;
+            }
+            if (errno != EINTR) {
+                return -1;
+            }
+        } else if (ret == 0) {
+            close(gdbserver_user_state.fd);
+            gdbserver_user_state.fd = -1;
+            return -1;
+        } else {
+            break;
+        }
+    }
+    return ch;
+}
+
+void gdb_put_buffer(const uint8_t *buf, int len)
+{
+    int ret;
+
+    while (len > 0) {
+        ret = send(gdbserver_user_state.fd, buf, len, 0);
+        if (ret < 0) {
+            if (errno != EINTR) {
+                return;
+            }
+        } else {
+            buf += ret;
+            len -= ret;
+        }
+    }
+}
+
+/* Tell the remote gdb that the process has exited.  */
+void gdb_exit(int code)
+{
+    char buf[4];
+
+    if (!gdbserver_state.init) {
+        return;
+    }
+    if (gdbserver_user_state.socket_path) {
+        unlink(gdbserver_user_state.socket_path);
+    }
+    if (gdbserver_user_state.fd < 0) {
+        return;
+    }
+
+    trace_gdbstub_op_exiting((uint8_t)code);
+
+    snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
+    gdb_put_packet(buf);
+}
+
+int gdb_handlesig(CPUState *cpu, int sig)
+{
+    char buf[256];
+    int n;
+
+    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
+        return sig;
+    }
+
+    /* disable single step if it was enabled */
+    cpu_single_step(cpu, 0);
+    tb_flush(cpu);
+
+    if (sig != 0) {
+        gdb_set_stop_cpu(cpu);
+        g_string_printf(gdbserver_state.str_buf,
+                        "T%02xthread:", gdb_target_signal_to_gdb(sig));
+        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
+        g_string_append_c(gdbserver_state.str_buf, ';');
+        gdb_put_strbuf();
+    }
+    /*
+     * gdb_put_packet() might have detected that the peer terminated the
+     * connection.
+     */
+    if (gdbserver_user_state.fd < 0) {
+        return sig;
+    }
+
+    sig = 0;
+    gdbserver_state.state = RS_IDLE;
+    gdbserver_user_state.running_state = 0;
+    while (gdbserver_user_state.running_state == 0) {
+        n = read(gdbserver_user_state.fd, buf, 256);
+        if (n > 0) {
+            int i;
+
+            for (i = 0; i < n; i++) {
+                gdb_read_byte(buf[i]);
+            }
+        } else {
+            /*
+             * XXX: Connection closed.  Should probably wait for another
+             * connection before continuing.
+             */
+            if (n == 0) {
+                close(gdbserver_user_state.fd);
+            }
+            gdbserver_user_state.fd = -1;
+            return sig;
+        }
+    }
+    sig = gdbserver_state.signal;
+    gdbserver_state.signal = 0;
+    return sig;
+}
+
+/* Tell the remote gdb that the process has exited due to SIG.  */
+void gdb_signalled(CPUArchState *env, int sig)
+{
+    char buf[4];
+
+    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
+        return;
+    }
+
+    snprintf(buf, sizeof(buf), "X%02x", gdb_target_signal_to_gdb(sig));
+    gdb_put_packet(buf);
+}
+
+static void gdb_accept_init(int fd)
+{
+    gdb_init_gdbserver_state();
+    gdb_create_default_process(&gdbserver_state);
+    gdbserver_state.processes[0].attached = true;
+    gdbserver_state.c_cpu = gdb_first_attached_cpu();
+    gdbserver_state.g_cpu = gdbserver_state.c_cpu;
+    gdbserver_user_state.fd = fd;
+    gdb_has_xml = false;
+}
+
+static bool gdb_accept_socket(int gdb_fd)
+{
+    int fd;
+
+    for (;;) {
+        fd = accept(gdb_fd, NULL, NULL);
+        if (fd < 0 && errno != EINTR) {
+            perror("accept socket");
+            return false;
+        } else if (fd >= 0) {
+            qemu_set_cloexec(fd);
+            break;
+        }
+    }
+
+    gdb_accept_init(fd);
+    return true;
+}
+
+static int gdbserver_open_socket(const char *path)
+{
+    struct sockaddr_un sockaddr = {};
+    int fd, ret;
+
+    fd = socket(AF_UNIX, SOCK_STREAM, 0);
+    if (fd < 0) {
+        perror("create socket");
+        return -1;
+    }
+
+    sockaddr.sun_family = AF_UNIX;
+    pstrcpy(sockaddr.sun_path, sizeof(sockaddr.sun_path) - 1, path);
+    ret = bind(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr));
+    if (ret < 0) {
+        perror("bind socket");
+        close(fd);
+        return -1;
+    }
+    ret = listen(fd, 1);
+    if (ret < 0) {
+        perror("listen socket");
+        close(fd);
+        return -1;
+    }
+
+    return fd;
+}
+
+static bool gdb_accept_tcp(int gdb_fd)
+{
+    struct sockaddr_in sockaddr = {};
+    socklen_t len;
+    int fd;
+
+    for (;;) {
+        len = sizeof(sockaddr);
+        fd = accept(gdb_fd, (struct sockaddr *)&sockaddr, &len);
+        if (fd < 0 && errno != EINTR) {
+            perror("accept");
+            return false;
+        } else if (fd >= 0) {
+            qemu_set_cloexec(fd);
+            break;
+        }
+    }
+
+    /* set short latency */
+    if (socket_set_nodelay(fd)) {
+        perror("setsockopt");
+        close(fd);
+        return false;
+    }
+
+    gdb_accept_init(fd);
+    return true;
+}
+
+static int gdbserver_open_port(int port)
+{
+    struct sockaddr_in sockaddr;
+    int fd, ret;
+
+    fd = socket(PF_INET, SOCK_STREAM, 0);
+    if (fd < 0) {
+        perror("socket");
+        return -1;
+    }
+    qemu_set_cloexec(fd);
+
+    socket_set_fast_reuse(fd);
+
+    sockaddr.sin_family = AF_INET;
+    sockaddr.sin_port = htons(port);
+    sockaddr.sin_addr.s_addr = 0;
+    ret = bind(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr));
+    if (ret < 0) {
+        perror("bind");
+        close(fd);
+        return -1;
+    }
+    ret = listen(fd, 1);
+    if (ret < 0) {
+        perror("listen");
+        close(fd);
+        return -1;
+    }
+
+    return fd;
+}
+
+int gdbserver_start(const char *port_or_path)
+{
+    int port = g_ascii_strtoull(port_or_path, NULL, 10);
+    int gdb_fd;
+
+    if (port > 0) {
+        gdb_fd = gdbserver_open_port(port);
+    } else {
+        gdb_fd = gdbserver_open_socket(port_or_path);
+    }
+
+    if (gdb_fd < 0) {
+        return -1;
+    }
+
+    if (port > 0 && gdb_accept_tcp(gdb_fd)) {
+        return 0;
+    } else if (gdb_accept_socket(gdb_fd)) {
+        gdbserver_user_state.socket_path = g_strdup(port_or_path);
+        return 0;
+    }
+
+    /* gone wrong */
+    close(gdb_fd);
+    return -1;
+}
+
+/* Disable gdb stub for child processes.  */
+void gdbserver_fork(CPUState *cpu)
+{
+    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
+        return;
+    }
+    close(gdbserver_user_state.fd);
+    gdbserver_user_state.fd = -1;
+    cpu_breakpoint_remove_all(cpu, BP_GDB);
+    /* no cpu_watchpoint_remove_all for user-mode */
+}
+
+/*
+ * Execution state helpers
+ */
+
+void gdb_continue(void)
+{
+    gdbserver_user_state.running_state = 1;
+    trace_gdbstub_op_continue();
+}
+
+/*
+ * Resume execution, for user-mode emulation it's equivalent to
+ * gdb_continue.
+ */
+int gdb_continue_partial(char *newstates)
+{
+    CPUState *cpu;
+    int res = 0;
+    /*
+     * This is not exactly accurate, but it's an improvement compared to the
+     * previous situation, where only one CPU would be single-stepped.
+     */
+    CPU_FOREACH(cpu) {
+        if (newstates[cpu->cpu_index] == 's') {
+            trace_gdbstub_op_stepping(cpu->cpu_index);
+            cpu_single_step(cpu, gdbserver_state.sstep_flags);
+        }
+    }
+    gdbserver_user_state.running_state = 1;
+    return res;
+}
+
+/*
+ * Break/Watch point helpers
+ */
+
 bool gdb_supports_guest_debug(void)
 {
     /* user-mode == TCG == supported */
diff --git a/linux-user/main.c b/linux-user/main.c
index 4ff30ff980..75dbb52788 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -40,6 +40,7 @@
 #include "qemu/plugin.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/user.h"
 #include "tcg/tcg.h"
 #include "qemu/timer.h"
 #include "qemu/envlist.h"
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 098f3a787d..748a98f3e5 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -18,7 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/user.h"
 #include "hw/core/tcg-cpu-ops.h"
 
 #include <sys/ucontext.h>
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
index fc895a2c39..773bd4b9c9 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -7,3 +7,6 @@
 specific_ss.add(files('gdbstub.c'))
 softmmu_ss.add(files('softmmu.c'))
 user_ss.add(files('user.c'))
+
+# The user-target is specialised by the guest
+specific_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-target.c'))
-- 
2.39.2


