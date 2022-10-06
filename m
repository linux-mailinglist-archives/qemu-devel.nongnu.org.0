Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD6C5F6A95
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:28:22 +0200 (CEST)
Received: from localhost ([::1]:55310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSnN-0004AU-EL
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXr-0003dZ-6i
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:21 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXp-0004bN-65
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:18 -0400
Received: by mail-pf1-x433.google.com with SMTP id 204so2293379pfx.10
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AKumlSHvcb7ZyxfM85hH84PZtR+gkhdH2/Ps48kqWsY=;
 b=PMymZLyi7rFXVIvYjTMhGD+jOPJFUmkTWWW+umT8ITVNdiJ20JTQXrGE8sriLJOtI0
 OyS4aRtVyqrMTnZQ1S7kNv+o0eO7Mqa4Ew1hlGXqqy1Rx6FVmRv8kPofkIF/YBjaNY7t
 1cP6WSgVyEq4ncS2uxabtGOkEI2E7FNb3KR15VssQd8gTXFQ2aACWA3AqAYXh/BIKDVX
 pygP5n7yluCPvsWTJrikgh/waXuA6yQnEgy0eCOF5T3X22wr4EUWXtm/nK1WJpWCwncF
 4sEMEyADxtvFPfWwoUgxnSqapNs9L7gLTnj+D5cuTLZcTLZAFLACcBfvdJODxnKqIqgu
 nGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AKumlSHvcb7ZyxfM85hH84PZtR+gkhdH2/Ps48kqWsY=;
 b=uDHtyEM0izXzdj2KSiAfUeebHy1YDBDI6Zsu2b4esrK46hgqeorz6MqVjgnl1evkkW
 faECHOAfz0GDDI9ngzt66DDPX1r2LKZiv72JIyjvIGuvODb/VEgTWffE24BzXWqVVulm
 QzoV8++7iZ+ejs9ETP8BPbUGuIuyzinlbN+b8Jq12qbt5krMQeLq8TvhytzOgqfB4PJe
 LbfDjhSgCKGLxHjRt7Uy0xaA2jH4VHZqvpEjHcbT82PxJ0nIgHkp6JY93LkysgOSaOdq
 cW8hgLqHGcJ9lBldgefozd4TfVyefuw+NgJKl/vlUbMxojEN8lPGJ930kvnb/Sa7aGqU
 j6HA==
X-Gm-Message-State: ACrzQf3brXXom8XAVEYvyVQTYeu46vinUJHQNI6li2uGLaS19rf8kTjR
 xEp/G1WrKlKvDIV/V7QtYUS/qmlqC70=
X-Google-Smtp-Source: AMsMyM5WsY3+TYxfy1BpUVq5I/i6ddGhHWN3QfkFJwPqCnxz/KmJzsFmQwHWhalaYwdXFBB2VndeAg==
X-Received: by 2002:a63:1308:0:b0:440:5517:c99d with SMTP id
 i8-20020a631308000000b004405517c99dmr322760pgl.550.1665069135373; 
 Thu, 06 Oct 2022 08:12:15 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:12:14 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 11/18] tests/qtest: Support libqtest to build and run on
 Windows
Date: Thu,  6 Oct 2022 23:11:28 +0800
Message-Id: <20221006151135.2078908-12-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

Changes in v2:
- Move the enabling of building qtests on Windows to a separate
  patch to keep bisectablity
- Call socket_init() unconditionally
- Add a missing CloseHandle() call

 tests/qtest/libqtest.c | 95 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 54e5f64f20..ecd22cdb11 100644
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
@@ -118,10 +131,19 @@ bool qtest_probe_child(QTestState *s)
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
@@ -135,13 +157,23 @@ void qtest_set_expected_status(QTestState *s, int status)
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
 
@@ -149,6 +181,7 @@ void qtest_kill_qemu(QTestState *s)
      * Check whether qemu exited with expected exit status; anything else is
      * fishy and should be logged with as much detail as possible.
      */
+#ifndef _WIN32
     wstatus = s->wstatus;
     if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) != s->expected_status) {
         fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
@@ -165,6 +198,16 @@ void qtest_kill_qemu(QTestState *s)
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
@@ -243,6 +286,38 @@ static const char *qtest_qemu_binary(void)
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
@@ -270,6 +345,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     unlink(socket_path);
     unlink(qmp_socket_path);
 
+    socket_init();
     sock = init_socket(socket_path);
     qmpsock = init_socket(qmp_socket_path);
 
@@ -278,7 +354,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 
     qtest_add_abrt_handler(kill_qemu_hook_func, s);
 
-    command = g_strdup_printf("exec %s %s"
+    command = g_strdup_printf(CMD_EXEC "%s %s"
                               "-qtest unix:%s "
                               "-qtest-log %s "
                               "-chardev socket,path=%s,id=char0 "
@@ -287,7 +363,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
                               "%s"
                               " -accel qtest",
                               qemu_binary, tracearg, socket_path,
-                              getenv("QTEST_LOG") ? "/dev/fd/2" : "/dev/null",
+                              getenv("QTEST_LOG") ? DEV_STDERR : DEV_NULL,
                               qmp_socket_path,
                               extra_args ?: "");
 
@@ -296,6 +372,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     s->pending_events = NULL;
     s->wstatus = 0;
     s->expected_status = 0;
+#ifndef _WIN32
     s->qemu_pid = fork();
     if (s->qemu_pid == 0) {
 #ifdef __linux__
@@ -318,6 +395,9 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
         execlp("/bin/sh", "sh", "-c", command, NULL);
         exit(1);
     }
+#else
+    s->qemu_pid = qtest_create_process(command);
+#endif /* _WIN32 */
 
     g_free(command);
     s->fd = socket_accept(sock);
@@ -336,9 +416,19 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
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
 
@@ -392,6 +482,7 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
     g_assert_true(sock_dir != NULL);
     sock_path = g_strdup_printf("%s/sock", sock_dir);
 
+    socket_init();
     sock_fd_init = init_socket(sock_path);
 
     qts = qtest_initf("-chardev socket,id=s0,path=%s -serial chardev:s0 %s",
-- 
2.34.1


