Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4772F59F829
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:49:51 +0200 (CEST)
Received: from localhost ([::1]:32866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnxG-0004xN-EN
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuZ-0004Jf-3d
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:00 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuW-0001br-VF
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:58 -0400
Received: by mail-pg1-x534.google.com with SMTP id s206so14562498pgs.3
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=CPsT8yKW9uSm1LoqvEpj4UnWFz4dPJ5OToB007xj8tE=;
 b=CqPR1+QBNs+cQpCW93zLh+SOdajgwCxnaqA9hceFY+/lJmFoP7+tPsOHgyKirwNDwY
 WZK1ys112Q0XVK0HsBf5xLwSJECbQSKiqLLEVyCytsDrer3fIGWsVFURNnp7Tl1OOpy5
 ZA0Vo7zU/QOhWeaXKMDLKFUkMFY5yFXFepXVQ0LmlijMXIW9TpMUXk+Y6pcF5z6JcfBC
 YPyhJrRTipe0e9SB/ixPSHwpq1wITpcwP7yIMeXyRNTHpKhfltsbB3xbdBw7St2t1vf8
 SX1lv09fABlssEXHKnMTitdt8ATpkmYtJGbjipHTGHDDmbKCC+WImoAPBQiwDVJdPnG5
 QjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=CPsT8yKW9uSm1LoqvEpj4UnWFz4dPJ5OToB007xj8tE=;
 b=iDFj7rVEJxzQOPEUbbS9U7KMBo9jAPeq/tDdhfa4fHwyM4YfQSHUHa9DUxbAxg+XCi
 Fli2CmyojUaOP/cVUgWv5BeUO2qfeCf27UjwEXelLmPLRd8GLe0w1E05zP77NIYZ8zr7
 f92D1JJKcFtiDwzxrdzu0+jk+SN8UR6e5TH8c+B31N+EXGc/A9t/ow+JoLmunpCQcgnG
 puYJ7AHpgJoa93zLTrREu/ZuPVPqB61hE30HzdwmFt1acPShgCUfQ1kUeNYmUw4Kqlof
 K6n3sR9vBcC2XwbWfuM8KgfHhUHWEz8P8VwxPTbNjoWXQgcMhgCZxPakgGvlNTc8Q09F
 WKGg==
X-Gm-Message-State: ACgBeo36bmZN9LMQy9OvbUHfAbrX7yrrCHHiVOlQSXWiZJb/Y5O129D1
 ACIQn3YUsiKX9QlPXpHOvg1OJup+oek=
X-Google-Smtp-Source: AA6agR4rjqEu1PIXZWh6c8j5VqyAUg3JTCPKQVlTXI8dlRxYGUpr5/CA81YbyDX1N21B/CSGxAbsQg==
X-Received: by 2002:a63:d16:0:b0:41d:fe52:1d2f with SMTP id
 c22-20020a630d16000000b0041dfe521d2fmr24011424pgl.416.1661334175932; 
 Wed, 24 Aug 2022 02:42:55 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:55 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 31/51] tests/qtest: Support libqtest to build and run on
 Windows
Date: Wed, 24 Aug 2022 17:40:09 +0800
Message-Id: <20220824094029.1634519-32-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

At present the libqtest codes were written to depend on several
POSIX APIs, including fork(), kill() and waitpid(). Unfortunately
these APIs are not available on Windows.

This commit implements the corresponding functionalities using
win32 native APIs. With this change, all qtest cases can build
successfully on a Windows host, and we can start qtest testing
on Windows now.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/libqtest.c  | 101 +++++++++++++++++++++++++++++++++++++++-
 tests/qtest/meson.build |   5 +-
 2 files changed, 101 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 70d7578740..99e52ff571 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -16,9 +16,11 @@
 
 #include "qemu/osdep.h"
 
+#ifndef _WIN32
 #include <sys/socket.h>
 #include <sys/wait.h>
 #include <sys/un.h>
+#endif /* _WIN32 */
 #ifdef __linux__
 #include <sys/prctl.h>
 #endif /* __linux__ */
@@ -27,6 +29,7 @@
 #include "libqmp.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
+#include "qemu/sockets.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
 #include "qapi/qmp/qlist.h"
@@ -35,6 +38,16 @@
 #define MAX_IRQ 256
 #define SOCKET_TIMEOUT 50
 
+#ifndef _WIN32
+# define CMD_EXEC   "exec "
+# define DEV_STDERR "/dev/fd/2"
+# define DEV_NULL   "/dev/null"
+#else
+# define CMD_EXEC   ""
+# define DEV_STDERR "2"
+# define DEV_NULL   "nul"
+#endif
+
 typedef void (*QTestSendFn)(QTestState *s, const char *buf);
 typedef void (*ExternalSendFn)(void *s, const char *buf);
 typedef GString* (*QTestRecvFn)(QTestState *);
@@ -68,6 +81,9 @@ struct QTestState
 QTestState *global_qtest;
 
 static GHookList abrt_hooks;
+#ifdef _WIN32
+typedef void (*sighandler_t)(int);
+#endif
 static sighandler_t sighandler_old;
 
 static int qtest_query_target_endianness(QTestState *s);
@@ -120,10 +136,18 @@ bool qtest_probe_child(QTestState *s)
     pid_t pid = s->qemu_pid;
 
     if (pid != -1) {
+#ifndef _WIN32
         pid = waitpid(pid, &s->wstatus, WNOHANG);
         if (pid == 0) {
             return true;
         }
+#else
+        DWORD exit_code;
+        GetExitCodeProcess((HANDLE)pid, &exit_code);
+        if (exit_code == STILL_ACTIVE) {
+            return true;
+        }
+#endif
         s->qemu_pid = -1;
     }
     return false;
@@ -137,13 +161,23 @@ void qtest_set_expected_status(QTestState *s, int status)
 void qtest_kill_qemu(QTestState *s)
 {
     pid_t pid = s->qemu_pid;
+#ifndef _WIN32
     int wstatus;
+#else
+    DWORD ret, exit_code;
+#endif
 
     /* Skip wait if qtest_probe_child already reaped.  */
     if (pid != -1) {
+#ifndef _WIN32
         kill(pid, SIGTERM);
         TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
         assert(pid == s->qemu_pid);
+#else
+        TerminateProcess((HANDLE)pid, s->expected_status);
+        ret = WaitForSingleObject((HANDLE)pid, INFINITE);
+        assert(ret == WAIT_OBJECT_0);
+#endif
         s->qemu_pid = -1;
     }
 
@@ -151,6 +185,7 @@ void qtest_kill_qemu(QTestState *s)
      * Check whether qemu exited with expected exit status; anything else is
      * fishy and should be logged with as much detail as possible.
      */
+#ifndef _WIN32
     wstatus = s->wstatus;
     if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) != s->expected_status) {
         fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
@@ -167,6 +202,16 @@ void qtest_kill_qemu(QTestState *s)
                 __FILE__, __LINE__, sig, signame, dump);
         abort();
     }
+#else
+    GetExitCodeProcess((HANDLE)pid, &exit_code);
+    CloseHandle((HANDLE)pid);
+    if (exit_code != s->expected_status) {
+        fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
+                "process but encountered exit status %ld (expected %d)\n",
+                __FILE__, __LINE__, exit_code, s->expected_status);
+        abort();
+    }
+#endif
 }
 
 static void kill_qemu_hook_func(void *s)
@@ -245,6 +290,38 @@ static const char *qtest_qemu_binary(void)
     return qemu_bin;
 }
 
+#ifdef _WIN32
+static pid_t qtest_create_process(char *cmd)
+{
+    STARTUPINFO si;
+    PROCESS_INFORMATION pi;
+    BOOL ret;
+
+    ZeroMemory(&si, sizeof(si));
+    si.cb = sizeof(si);
+    ZeroMemory(&pi, sizeof(pi));
+
+    ret = CreateProcess(NULL,   /* module name */
+                        cmd,    /* command line */
+                        NULL,   /* process handle not inheritable */
+                        NULL,   /* thread handle not inheritable */
+                        FALSE,  /* set handle inheritance to FALSE */
+                        0,      /* No creation flags */
+                        NULL,   /* use parent's environment block */
+                        NULL,   /* use parent's starting directory */
+                        &si,    /* pointer to STARTUPINFO structure */
+                        &pi     /* pointer to PROCESS_INFORMATION structure */
+                        );
+    if (ret == 0) {
+        fprintf(stderr, "%s:%d: unable to create a new process (%s)\n",
+                __FILE__, __LINE__, strerror(GetLastError()));
+        abort();
+    }
+
+    return (pid_t)pi.hProcess;
+}
+#endif /* _WIN32 */
+
 QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 {
     QTestState *s;
@@ -272,6 +349,9 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     unlink(socket_path);
     unlink(qmp_socket_path);
 
+#ifdef _WIN32
+    socket_init();
+#endif
     sock = init_socket(socket_path);
     qmpsock = init_socket(qmp_socket_path);
 
@@ -280,7 +360,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 
     qtest_add_abrt_handler(kill_qemu_hook_func, s);
 
-    command = g_strdup_printf("exec %s %s"
+    command = g_strdup_printf(CMD_EXEC "%s %s"
                               "-qtest unix:%s "
                               "-qtest-log %s "
                               "-chardev socket,path=%s,id=char0 "
@@ -289,7 +369,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
                               "%s"
                               " -accel qtest",
                               qemu_binary, tracearg, socket_path,
-                              getenv("QTEST_LOG") ? "/dev/fd/2" : "/dev/null",
+                              getenv("QTEST_LOG") ? DEV_STDERR : DEV_NULL,
                               qmp_socket_path,
                               extra_args ?: "");
 
@@ -298,6 +378,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     s->pending_events = NULL;
     s->wstatus = 0;
     s->expected_status = 0;
+#ifndef _WIN32
     s->qemu_pid = fork();
     if (s->qemu_pid == 0) {
 #ifdef __linux__
@@ -320,6 +401,9 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
         execlp("/bin/sh", "sh", "-c", command, NULL);
         exit(1);
     }
+#else
+    s->qemu_pid = qtest_create_process(command);
+#endif /* _WIN32 */
 
     g_free(command);
     s->fd = socket_accept(sock);
@@ -338,9 +422,19 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
         s->irq_level[i] = false;
     }
 
+    /*
+     * Stopping QEMU for debugging is not supported on Windows.
+     *
+     * Using DebugActiveProcess() API can suspend the QEMU process,
+     * but gdb cannot attach to the process. Using the undocumented
+     * NtSuspendProcess() can suspend the QEMU process and gdb can
+     * attach to the process, but gdb cannot resume it.
+     */
+#ifndef _WIN32
     if (getenv("QTEST_STOP")) {
         kill(s->qemu_pid, SIGSTOP);
     }
+#endif
 
     /* ask endianness of the target */
 
@@ -393,6 +487,9 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
     g_assert_true(g_mkdtemp(sock_dir) != NULL);
     sock_path = g_strdup_printf("%s/sock", sock_dir);
 
+#ifdef _WIN32
+    socket_init();
+#endif
     sock_fd_init = init_socket(sock_path);
 
     qts = qtest_initf("-chardev socket,id=s0,path=%s -serial chardev:s0 %s",
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0291b3966c..6d469a1822 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,6 +1,5 @@
-# All QTests for now are POSIX-only, but the dependencies are
-# really in libqtest, not in the testcases themselves.
-if not config_host.has_key('CONFIG_POSIX')
+# Build all QTests for POSIX and Windows
+if not config_host.has_key('CONFIG_POSIX') and not config_host.has_key('CONFIG_WIN32')
   subdir_done()
 endif
 
-- 
2.34.1


