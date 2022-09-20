Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694AC5BE4E8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:48:27 +0200 (CEST)
Received: from localhost ([::1]:46496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oabjm-0005IL-Cm
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYu-0001F5-0c
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:14 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYs-0004oR-2V
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:07 -0400
Received: by mail-pl1-x635.google.com with SMTP id t3so1931109ply.2
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WYQlajQUVwXtj6f4EUMSJptSU8tvZHrRokVsALeNJ8E=;
 b=JEb52/bFKhQWzytjZZsOpVdlS0LnP/k4bOSWPJefXry/wH3atR030NDpmSbgSlftug
 TVL+WNWrP16bVvu+jgq/1c3yigUhyxonUQlbpZOJC3aiHNftCQZ1J2e4fWvwzyBM41OD
 U92LFHg9PSf6cf5WAPn4vZ32onsjDIdp82gbsMJbp9GcyCviK4mKwkozht6VRjCEDkuZ
 WhFFYhoi1dlt4L+fb00qEhrYz43yOfFjAh8Dq1pgjUpFibaQyQQLoV8WcFlLrYh3Inlb
 VMpNQsBKT4Y3gFYOnTXh7Mu/7kvUrqQOO18wioYFKf10i8JVYQQiB+j7jrEKDPu9ZYPZ
 vfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WYQlajQUVwXtj6f4EUMSJptSU8tvZHrRokVsALeNJ8E=;
 b=pC67oCJy3PlZ6bm2LlxqQa13NrJerIUya4nJDfbpQDYbZO0J0DwV328/liW3oAOF4m
 LS3ncXYIqdGfG40x4TiV/lPW/roxONAEN3//FVWyBwTqAK9ZUiNt1m5WUemEaQBzHJV8
 6qUfsuc4wUKWq5j51t2VHVb4hNikouBoS2tDae6upMuQQGgnpHKyt4rVFSqp30rVUpSk
 mH/iGVddEEeC585qF4fZdYeS9azmVRke5L2HuvwMrAElHW3kU9dyD0pilv1IY0HGiYSY
 PEDpWXYNbX0G7qB0peaWjPvbvL8hDxqtNKn940xQFSk9BCjSDpWIMHhPSXmC2A0JCmD8
 zrgA==
X-Gm-Message-State: ACrzQf1aqnZEn74LQgfVZZauEJMwHuSRtuqiS9S6OQzX2NjRLMQt0p0I
 NBy2s0qI5SkE8yCDXRqn9mGZ/VTbLLs=
X-Google-Smtp-Source: AMsMyM7xt35lkmXBio+D9fZN3QXwkkH8YRo2Fhf05ogJAz2N4YwamOIgrojAbQ3Xm8NRY+Foy8gbgg==
X-Received: by 2002:a17:90b:1b4c:b0:202:c1a3:25ce with SMTP id
 nv12-20020a17090b1b4c00b00202c1a325cemr3258708pjb.232.1663669984960; 
 Tue, 20 Sep 2022 03:33:04 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:04 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 19/39] tests/qtest: Support libqtest to build and run on
 Windows
Date: Tue, 20 Sep 2022 18:31:39 +0800
Message-Id: <20220920103159.1865256-20-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Changes in v2:
- Move the enabling of building qtests on Windows to a separate
  patch to keep bisectablity
- Call socket_init() unconditionally
- Add a missing CloseHandle() call

 tests/qtest/libqtest.c | 98 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index f46a21fa45..5d15e39289 100644
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
@@ -66,6 +79,9 @@ struct QTestState
 };
 
 static GHookList abrt_hooks;
+#ifdef _WIN32
+typedef void (*sighandler_t)(int);
+#endif
 static sighandler_t sighandler_old;
 
 static int qtest_query_target_endianness(QTestState *s);
@@ -118,10 +134,19 @@ bool qtest_probe_child(QTestState *s)
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
+        CloseHandle((HANDLE)pid);
+#endif
         s->qemu_pid = -1;
     }
     return false;
@@ -135,13 +160,23 @@ void qtest_set_expected_status(QTestState *s, int status)
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
 
@@ -149,6 +184,7 @@ void qtest_kill_qemu(QTestState *s)
      * Check whether qemu exited with expected exit status; anything else is
      * fishy and should be logged with as much detail as possible.
      */
+#ifndef _WIN32
     wstatus = s->wstatus;
     if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) != s->expected_status) {
         fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
@@ -165,6 +201,16 @@ void qtest_kill_qemu(QTestState *s)
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
@@ -243,6 +289,38 @@ static const char *qtest_qemu_binary(void)
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
@@ -270,6 +348,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     unlink(socket_path);
     unlink(qmp_socket_path);
 
+    socket_init();
     sock = init_socket(socket_path);
     qmpsock = init_socket(qmp_socket_path);
 
@@ -278,7 +357,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 
     qtest_add_abrt_handler(kill_qemu_hook_func, s);
 
-    command = g_strdup_printf("exec %s %s"
+    command = g_strdup_printf(CMD_EXEC "%s %s"
                               "-qtest unix:%s "
                               "-qtest-log %s "
                               "-chardev socket,path=%s,id=char0 "
@@ -287,7 +366,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
                               "%s"
                               " -accel qtest",
                               qemu_binary, tracearg, socket_path,
-                              getenv("QTEST_LOG") ? "/dev/fd/2" : "/dev/null",
+                              getenv("QTEST_LOG") ? DEV_STDERR : DEV_NULL,
                               qmp_socket_path,
                               extra_args ?: "");
 
@@ -296,6 +375,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     s->pending_events = NULL;
     s->wstatus = 0;
     s->expected_status = 0;
+#ifndef _WIN32
     s->qemu_pid = fork();
     if (s->qemu_pid == 0) {
 #ifdef __linux__
@@ -318,6 +398,9 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
         execlp("/bin/sh", "sh", "-c", command, NULL);
         exit(1);
     }
+#else
+    s->qemu_pid = qtest_create_process(command);
+#endif /* _WIN32 */
 
     g_free(command);
     s->fd = socket_accept(sock);
@@ -336,9 +419,19 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
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
 
@@ -392,6 +485,7 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
     g_assert_true(sock_dir != NULL);
     sock_path = g_strdup_printf("%s/sock", sock_dir);
 
+    socket_init();
     sock_fd_init = init_socket(sock_path);
 
     qts = qtest_initf("-chardev socket,id=s0,path=%s -serial chardev:s0 %s",
-- 
2.34.1


