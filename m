Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC7E64EA38
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:23:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68nF-00026p-J1; Fri, 16 Dec 2022 06:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68nD-00025t-F8
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:19 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n8-000699-F9
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso1230542wmb.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9aKOu7kTGaWQQxuXEdSD36/hlY5mYKHfrE/OifwOH2Q=;
 b=yuoXVbXZD1mE1JVl1uU54M1DmWZBK6OcXY1Sl3sn8KE+ZXNGBF4Opk2zbUMejiZtTm
 IAQghPtYodE+UyOV62eOEslZHJ8WxYRFLObJ7ALO+KRCyA7V1ziFcVV/AeYwlRnaoDmu
 Xp/VOPpXyTNCWxhkkVVqa3C+EHgnFlerdMTSFgX/0gYbVEPaPFhzHi6UKj1zLnyIB4bv
 KOoZra76Ze7ljr9cbtTa8unOZz4NwkC+k33DzgbUHRLQTrxkufnqSKmOcUjvQaAJoRuL
 wu37mv5UQzONtxuRSeRVgvs3rXDiLOVlXWNWNSCYZoagwHHA/oLAF/m1DNfZ9J6cvuPo
 Bh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9aKOu7kTGaWQQxuXEdSD36/hlY5mYKHfrE/OifwOH2Q=;
 b=zvwCe1kJkGVC34sCVuZ+U8Kirnan83keSg0qj8bBOMkxAJpnw8eg5crAIKTaR12Rlm
 dsqLZRQnEEqaANuw//byS0YZFqh2irGraTuCqOYnLpzZO4CbDovC57Sb36qe82NkhogV
 dw2s51P4eQj5ZR6hkK555471JOHlNOVrbbNJjSIoh7HsNmlmRlt058l8Zxmf5qQ4G4X5
 0evaPv6tYbKrleX3I4N/qJUAn/ilwZ4HglhtbL5WiD0DIs45JDCM9tsroLoh1UKdS5Qa
 7sSmW7geCH9dodfVz6kxR3AuAzWwJ4H33sOMG88+PlgdddNAheFkOt3UWT8fH0sVPE6O
 eutQ==
X-Gm-Message-State: ANoB5pkJ0UPAoWF7JoOOaEd+E2TMjnL1hF6aW1mHYMRAsh1Jc+p2/0k9
 wrwVMEBcxuaY1o4T2evO4udSvA==
X-Google-Smtp-Source: AA0mqf5p/s1lUdfpgeV4MoA2/3drtzbJaYPQm8ZJf+taqktoUeUamQYdwnX0k6lpD62Wm8y2TjUJIA==
X-Received: by 2002:a05:600c:3b8f:b0:3d2:2830:b8bb with SMTP id
 n15-20020a05600c3b8f00b003d22830b8bbmr14236813wms.34.1671189732362; 
 Fri, 16 Dec 2022 03:22:12 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a1c7710000000b003c21ba7d7d6sm2194948wmi.44.2022.12.16.03.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:22:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 261491FFB8;
 Fri, 16 Dec 2022 11:22:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH  v1 09/10] gdbstub: move chunks of user code into own files
Date: Fri, 16 Dec 2022 11:22:05 +0000
Message-Id: <20221216112206.3171578-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216112206.3171578-1-alex.bennee@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

As before we:

  - convert some helpers to public gdb_ functions (via internals.h)
  - splitting some functions into user and softmmu versions

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h    |  22 +-
 include/exec/gdbstub.h |  18 --
 include/gdbstub/user.h |  29 ++
 gdbstub/gdbstub.c      | 720 ++---------------------------------------
 gdbstub/softmmu.c      |  89 +++++
 gdbstub/user-target.c  | 283 ++++++++++++++++
 gdbstub/user.c         | 343 ++++++++++++++++++++
 linux-user/main.c      |   1 +
 linux-user/signal.c    |   2 +-
 gdbstub/meson.build    |   2 +
 10 files changed, 793 insertions(+), 716 deletions(-)
 create mode 100644 gdbstub/user-target.c

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 50eac269c8..4c3b0d7b64 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -77,9 +77,12 @@ typedef struct GDBState {
  * Connection helpers for both softmmu and user backends
  */
 void gdb_put_buffer(const uint8_t *buf, int len);
+void gdb_put_strbuf(void);
 int gdb_put_packet(const char *buf);
+int gdb_put_packet_binary(const char *buf, int len, bool dump);
 void gdb_hextomem(GByteArray *mem, const char *buf, int len);
 void gdb_memtohex(GString *buf, const uint8_t *mem, int len);
+void gdb_memtox(GString *buf, const char *mem, int len);
 void gdb_read_byte(uint8_t ch);
 
 /* utility helpers */
@@ -89,6 +92,22 @@ int gdb_get_cpu_index(CPUState *cpu);
 
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
  * Command handlers - either softmmu or user only
  */
@@ -116,7 +135,8 @@ typedef union GdbCmdVariant {
 #define get_param(p, i)    (&g_array_index(p, GdbCmdVariant, i))
 
 void gdb_handle_query_rcmd(GArray *params, void *user_ctx); /* softmmu */
-
+void gdb_handle_query_offsets(GArray *params, void *user_ctx); /* user */
+void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx); /*user */
 
 /*
  * Break/Watch point support - there is an implementation for softmmu
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 1636fb3841..d1eb96f807 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -104,24 +104,6 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
 int use_gdb_syscalls(void);
 
 #ifdef CONFIG_USER_ONLY
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
 #endif
 
 /* Get or set a register.  Returns the size of the register.  */
diff --git a/include/gdbstub/user.h b/include/gdbstub/user.h
index 53baba65ff..d392e510c5 100644
--- a/include/gdbstub/user.h
+++ b/include/gdbstub/user.h
@@ -9,6 +9,35 @@
 #ifndef GDBSTUB_USER_H
 #define GDBSTUB_USER_H
 
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
 
 
 #endif /* GDBSTUB_USER_H */
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index ec4b6ac4e4..fa68a77066 100644
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
@@ -306,14 +88,6 @@ typedef struct GDBRegisterState {
     struct GDBRegisterState *next;
 } GDBRegisterState;
 
-#ifdef CONFIG_USER_ONLY
-typedef struct GDBConnection {
-    int fd;
-    char *socket_path;
-    int running_state;
-} GDBConnection;
-#endif
-
 GDBState gdbserver_state;
 
 void gdb_init_gdbserver_state(void)
@@ -338,43 +112,11 @@ void gdb_init_gdbserver_state(void)
      * The following is differs depending on USER/SOFTMMU, we just
      * hid it in the typedef.
      */
-#ifdef CONFIG_USER_ONLY
-    gdbserver_state.connection = g_new(GDBConnection, 1);
-#else
     gdbserver_state.connection = gdb_init_connection_data();
-#endif
 }
 
 bool gdb_has_xml;
 
-#ifdef CONFIG_USER_ONLY
-
-static int get_char(void)
-{
-    uint8_t ch;
-    int ret;
-
-    for(;;) {
-        ret = recv(gdbserver_state.connection->fd, &ch, 1, 0);
-        if (ret < 0) {
-            if (errno == ECONNRESET) {
-                gdbserver_state.connection->fd = -1;
-            }
-            if (errno != EINTR) {
-                return -1;
-            }
-        } else if (ret == 0) {
-            close(gdbserver_state.connection->fd);
-            gdbserver_state.connection->fd = -1;
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
@@ -419,104 +161,6 @@ static bool stub_can_reverse(void)
 #endif
 }
 
-/* Resume execution.  */
-static inline void gdb_continue(void)
-{
-
-#ifdef CONFIG_USER_ONLY
-    gdbserver_state.connection->running_state = 1;
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
-    gdbserver_state.connection->running_state = 1;
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
-        ret = send(gdbserver_state.connection->fd, buf, len, 0);
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
 static inline int fromhex(int v)
 {
     if (v >= '0' && v <= '9')
@@ -594,7 +238,7 @@ static void hexdump(const char *buf, int len,
 }
 
 /* return -1 if error, 0 if OK */
-static int put_packet_binary(const char *buf, int len, bool dump)
+int gdb_put_packet_binary(const char *buf, int len, bool dump)
 {
     int csum, i;
     uint8_t footer[3];
@@ -622,7 +266,7 @@ static int put_packet_binary(const char *buf, int len, bool dump)
                    gdbserver_state.last_packet->len);
 
 #ifdef CONFIG_USER_ONLY
-        i = get_char();
+        i = gdb_get_char();
         if (i < 0)
             return -1;
         if (i == '+')
@@ -639,16 +283,16 @@ int gdb_put_packet(const char *buf)
 {
     trace_gdbstub_io_reply(buf);
 
-    return put_packet_binary(buf, strlen(buf), false);
+    return gdb_put_packet_binary(buf, strlen(buf), false);
 }
 
-static void put_strbuf(void)
+void gdb_put_strbuf(void)
 {
     gdb_put_packet(gdbserver_state.str_buf->str);
 }
 
 /* Encode data using the encoding for 'x' packets.  */
-static void memtox(GString *buf, const char *mem, int len)
+void gdb_memtox(GString *buf, const char *mem, int len)
 {
     char c;
 
@@ -1570,7 +1214,7 @@ static void handle_get_reg(GArray *params, void *user_ctx)
     }
 
     gdb_memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data, reg_size);
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_write_mem(GArray *params, void *user_ctx)
@@ -1626,7 +1270,7 @@ static void handle_read_mem(GArray *params, void *user_ctx)
 
     gdb_memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data,
              gdbserver_state.mem_buf->len);
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_write_all_regs(GArray *params, void *user_ctx)
@@ -1667,7 +1311,7 @@ static void handle_read_all_regs(GArray *params, void *user_ctx)
     g_assert(len == gdbserver_state.mem_buf->len);
 
     gdb_memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data, len);
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_file_io(GArray *params, void *user_ctx)
@@ -1812,7 +1456,7 @@ static void handle_v_attach(GArray *params, void *user_ctx)
     gdb_append_thread_id(cpu, gdbserver_state.str_buf);
     g_string_append_c(gdbserver_state.str_buf, ';');
 cleanup:
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_v_kill(GArray *params, void *user_ctx)
@@ -1877,7 +1521,7 @@ static void handle_query_qemu_sstepbits(GArray *params, void *user_ctx)
                                SSTEP_NOTIMER);
     }
 
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_set_qemu_sstep(GArray *params, void *user_ctx)
@@ -1903,7 +1547,7 @@ static void handle_query_qemu_sstep(GArray *params, void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "0x%x",
                     gdbserver_state.sstep_flags);
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_query_curr_tid(GArray *params, void *user_ctx)
@@ -1920,7 +1564,7 @@ static void handle_query_curr_tid(GArray *params, void *user_ctx)
     cpu = get_first_cpu_in_process(process);
     g_string_assign(gdbserver_state.str_buf, "QC");
     gdb_append_thread_id(cpu, gdbserver_state.str_buf);
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_query_threads(GArray *params, void *user_ctx)
@@ -1932,7 +1576,7 @@ static void handle_query_threads(GArray *params, void *user_ctx)
 
     g_string_assign(gdbserver_state.str_buf, "m");
     gdb_append_thread_id(gdbserver_state.query_cpu, gdbserver_state.str_buf);
-    put_strbuf();
+    gdb_put_strbuf();
     gdbserver_state.query_cpu = gdb_next_attached_cpu(gdbserver_state.query_cpu);
 }
 
@@ -1975,25 +1619,8 @@ static void handle_query_thread_extra(GArray *params, void *user_ctx)
     }
     trace_gdbstub_op_extra_info(rs->str);
     gdb_memtohex(gdbserver_state.str_buf, (uint8_t *)rs->str, rs->len);
-    put_strbuf();
-}
-
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
-    put_strbuf();
+    gdb_put_strbuf();
 }
-#endif
 
 static void handle_query_supported(GArray *params, void *user_ctx)
 {
@@ -2022,7 +1649,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
     }
 
     g_string_append(gdbserver_state.str_buf, ";vContSupported+;multiprocess+");
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_query_xfer_features(GArray *params, void *user_ctx)
@@ -2067,63 +1694,16 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
 
     if (len < total_len - addr) {
         g_string_assign(gdbserver_state.str_buf, "m");
-        memtox(gdbserver_state.str_buf, xml + addr, len);
+        gdb_memtox(gdbserver_state.str_buf, xml + addr, len);
     } else {
         g_string_assign(gdbserver_state.str_buf, "l");
-        memtox(gdbserver_state.str_buf, xml + addr, total_len - addr);
+        gdb_memtox(gdbserver_state.str_buf, xml + addr, total_len - addr);
     }
 
-    put_packet_binary(gdbserver_state.str_buf->str,
+    gdb_put_packet_binary(gdbserver_state.str_buf->str,
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
-    memtox(gdbserver_state.str_buf,
-           (const char *)gdbserver_state.mem_buf->data, len);
-    put_packet_binary(gdbserver_state.str_buf->str,
-                      gdbserver_state.str_buf->len, true);
-}
-#endif
-
 static void handle_query_attached(GArray *params, void *user_ctx)
 {
     gdb_put_packet(GDB_ATTACHED);
@@ -2135,7 +1715,7 @@ static void handle_query_qemu_supported(GArray *params, void *user_ctx)
 #ifndef CONFIG_USER_ONLY
     g_string_append(gdbserver_state.str_buf, ";PhyMemMode");
 #endif
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -2143,7 +1723,7 @@ static void handle_query_qemu_phy_mem_mode(GArray *params,
                                            void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "%d", phy_memory_mode);
-    put_strbuf();
+    gdb_put_strbuf();
 }
 
 static void handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx)
@@ -2201,7 +1781,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
     },
 #ifdef CONFIG_USER_ONLY
     {
-        .handler = handle_query_offsets,
+        .handler = gdb_handle_query_offsets,
         .cmd = "Offsets",
     },
 #else
@@ -2231,7 +1811,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
     },
 #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
     {
-        .handler = handle_query_xfer_auxv,
+        .handler = gdb_handle_query_xfer_auxv,
         .cmd = "Xfer:auxv:read::",
         .cmd_startswith = 1,
         .schema = "l,l0"
@@ -2319,7 +1899,7 @@ static void handle_target_halt(GArray *params, void *user_ctx)
     g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIGNAL_TRAP);
     gdb_append_thread_id(gdbserver_state.c_cpu, gdbserver_state.str_buf);
     g_string_append_c(gdbserver_state.str_buf, ';');
-    put_strbuf();
+    gdb_put_strbuf();
     /*
      * Remove all the breakpoints when this query is issued,
      * because gdb is doing an initial connect and the state
@@ -2819,29 +2399,6 @@ void gdb_read_byte(uint8_t ch)
     }
 }
 
-#ifdef CONFIG_USER_ONLY
-/* Tell the remote gdb that the process has exited.  */
-void gdb_exit(int code)
-{
-  char buf[4];
-
-  if (!gdbserver_state.init) {
-      return;
-  }
-  if (gdbserver_state.connection->socket_path) {
-      unlink(gdbserver_state.connection->socket_path);
-  }
-  if (gdbserver_state.connection->fd < 0) {
-      return;
-  }
-
-  trace_gdbstub_op_exiting((uint8_t)code);
-
-  snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
-  gdb_put_packet(buf);
-}
-#endif
-
 /*
  * Create the process that will contain all the "orphan" CPUs (that are not
  * part of a CPU cluster). Note that if this process contains no CPUs, it won't
@@ -2867,232 +2424,3 @@ void gdb_create_default_process(GDBState *s)
     process->target_xml[0] = '\0';
 }
 
-#ifdef CONFIG_USER_ONLY
-int
-gdb_handlesig(CPUState *cpu, int sig)
-{
-    char buf[256];
-    int n;
-
-    if (!gdbserver_state.init || gdbserver_state.connection->fd < 0) {
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
-        put_strbuf();
-    }
-    /* gdb_put_packet() might have detected that the peer terminated the
-       connection.  */
-    if (gdbserver_state.connection->fd < 0) {
-        return sig;
-    }
-
-    sig = 0;
-    gdbserver_state.state = RS_IDLE;
-    gdbserver_state.connection->running_state = 0;
-    while (gdbserver_state.connection->running_state == 0) {
-        n = read(gdbserver_state.connection->fd, buf, 256);
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
-                close(gdbserver_state.connection->fd);
-            }
-            gdbserver_state.connection->fd = -1;
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
-    if (!gdbserver_state.init || gdbserver_state.connection->fd < 0) {
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
-    gdbserver_state.connection->fd = fd;
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
-        gdbserver_state.connection->socket_path = g_strdup(port_or_path);
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
-    if (!gdbserver_state.init || gdbserver_state.connection->fd < 0) {
-        return;
-    }
-    close(gdbserver_state.connection->fd);
-    gdbserver_state.connection->fd = -1;
-    cpu_breakpoint_remove_all(cpu, BP_GDB);
-    cpu_watchpoint_remove_all(cpu, BP_GDB);
-}
-#else
-#endif
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index b7a335b183..1154a313cb 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -432,6 +432,95 @@ void gdb_handle_query_rcmd(GArray *params, void *user_ctx)
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
+int gdb_signal_to_target (int sig)
+{
+    if (sig < ARRAY_SIZE (gdb_signal_table))
+        return gdb_signal_table[sig];
+    else
+        return -1;
+}
+
 /*
  * Break/Watch point helpers
  */
diff --git a/gdbstub/user-target.c b/gdbstub/user-target.c
new file mode 100644
index 0000000000..83e04e1c23
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
+extern GDBState gdbserver_state;
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
+int gdb_signal_to_target (int sig)
+{
+    if (sig < ARRAY_SIZE (gdb_signal_table))
+        return gdb_signal_table[sig];
+    else
+        return -1;
+}
+
+int gdb_target_signal_to_gdb(int sig)
+{
+    int i;
+    for (i = 0; i < ARRAY_SIZE (gdb_signal_table); i++)
+        if (gdb_signal_table[i] == sig)
+            return i;
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
+
+#if defined(CONFIG_LINUX_USER)
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
index a5f370bcf9..3492d9b68a 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -10,11 +10,354 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qemu/sockets.h"
 #include "exec/hwaddr.h"
+#include "exec/tb-flush.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/user.h"
 #include "hw/core/cpu.h"
+#include "trace.h"
 #include "internals.h"
 
+/* user-mode emulation connection details */
+typedef struct GDBConnection {
+    int fd;
+    char *socket_path;
+    int running_state;
+} GDBConnection;
+
+extern GDBState gdbserver_state;
+
+GDBConnection *gdb_init_connection_data(void)
+{
+    return g_new(GDBConnection, 1);
+}
+
+int gdb_get_char(void)
+{
+    uint8_t ch;
+    int ret;
+
+    for(;;) {
+        ret = recv(gdbserver_state.connection->fd, &ch, 1, 0);
+        if (ret < 0) {
+            if (errno == ECONNRESET) {
+                gdbserver_state.connection->fd = -1;
+            }
+            if (errno != EINTR) {
+                return -1;
+            }
+        } else if (ret == 0) {
+            close(gdbserver_state.connection->fd);
+            gdbserver_state.connection->fd = -1;
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
+        ret = send(gdbserver_state.connection->fd, buf, len, 0);
+        if (ret < 0) {
+            if (errno != EINTR)
+                return;
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
+  char buf[4];
+
+  if (!gdbserver_state.init) {
+      return;
+  }
+  if (gdbserver_state.connection->socket_path) {
+      unlink(gdbserver_state.connection->socket_path);
+  }
+  if (gdbserver_state.connection->fd < 0) {
+      return;
+  }
+
+  trace_gdbstub_op_exiting((uint8_t)code);
+
+  snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
+  gdb_put_packet(buf);
+}
+
+int gdb_handlesig(CPUState *cpu, int sig)
+{
+    char buf[256];
+    int n;
+
+    if (!gdbserver_state.init || gdbserver_state.connection->fd < 0) {
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
+    /* gdb_put_packet() might have detected that the peer terminated the
+       connection.  */
+    if (gdbserver_state.connection->fd < 0) {
+        return sig;
+    }
+
+    sig = 0;
+    gdbserver_state.state = RS_IDLE;
+    gdbserver_state.connection->running_state = 0;
+    while (gdbserver_state.connection->running_state == 0) {
+        n = read(gdbserver_state.connection->fd, buf, 256);
+        if (n > 0) {
+            int i;
+
+            for (i = 0; i < n; i++) {
+                gdb_read_byte(buf[i]);
+            }
+        } else {
+            /* XXX: Connection closed.  Should probably wait for another
+               connection before continuing.  */
+            if (n == 0) {
+                close(gdbserver_state.connection->fd);
+            }
+            gdbserver_state.connection->fd = -1;
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
+    if (!gdbserver_state.init || gdbserver_state.connection->fd < 0) {
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
+    gdbserver_state.connection->fd = fd;
+    gdb_has_xml = false;
+}
+
+static bool gdb_accept_socket(int gdb_fd)
+{
+    int fd;
+
+    for(;;) {
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
+    for(;;) {
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
+        gdbserver_state.connection->socket_path = g_strdup(port_or_path);
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
+    if (!gdbserver_state.init || gdbserver_state.connection->fd < 0) {
+        return;
+    }
+    close(gdbserver_state.connection->fd);
+    gdbserver_state.connection->fd = -1;
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
+    gdbserver_state.connection->running_state = 1;
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
+    gdbserver_state.connection->running_state = 1;
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
index a17fed045b..68aaf4bd58 100644
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
index 61c6fa3fcf..84f06043d8 100644
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
index fc895a2c39..a763cf235d 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -7,3 +7,5 @@
 specific_ss.add(files('gdbstub.c'))
 softmmu_ss.add(files('softmmu.c'))
 user_ss.add(files('user.c'))
+# and BSD?
+specific_ss.add(when: 'CONFIG_LINUX_USER', if_true: files('user-target.c'))
-- 
2.34.1


