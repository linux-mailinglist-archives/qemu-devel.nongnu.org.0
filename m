Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B806112B7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:28:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPLT-0002Fz-M9; Fri, 28 Oct 2022 09:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKk-0001Jp-LG
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKh-0005KI-N3
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cz3XnCLgYW83ui44pgGE0wawE7P/i71Fday1SEkbXoc=;
 b=Q30SmdKCI1jV03gLTq6MJVgXBWXvj63Bs2bUVLfBEYig4+ntivgXLJly2cEEX8XYZ6dhUh
 cjbL05Ixt7WhRME+Mj+T0XvTrHc/PU9zfL7iBW5xlOPi6bN4gRa3TzdkLHqMse3ZEWRbk9
 aNFmWd9JQSFB7CtvIPhCPiDhq1UiRgo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-lrFJJ1T-NDyRaWOx9g7oVA-1; Fri, 28 Oct 2022 09:23:31 -0400
X-MC-Unique: lrFJJ1T-NDyRaWOx9g7oVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91CA53C0F251;
 Fri, 28 Oct 2022 13:23:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 587CF112131B;
 Fri, 28 Oct 2022 13:23:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 15/21] tests/qtest: Support libqtest to build and run on Windows
Date: Fri, 28 Oct 2022 15:22:58 +0200
Message-Id: <20221028132304.829103-16-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
Message-Id: <20221028045736.679903-4-bin.meng@windriver.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.c | 96 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index b01846fd98..d12a604d78 100644
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
@@ -36,6 +38,16 @@
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
@@ -58,6 +70,9 @@ struct QTestState
     int qmp_fd;
     pid_t qemu_pid;  /* our child QEMU process */
     int wstatus;
+#ifdef _WIN32
+    DWORD exit_code;
+#endif
     int expected_status;
     bool big_endian;
     bool irq_level[MAX_IRQ];
@@ -119,10 +134,18 @@ bool qtest_probe_child(QTestState *s)
     pid_t pid = s->qemu_pid;
 
     if (pid != -1) {
+#ifndef _WIN32
         pid = waitpid(pid, &s->wstatus, WNOHANG);
         if (pid == 0) {
             return true;
         }
+#else
+        GetExitCodeProcess((HANDLE)pid, &s->exit_code);
+        if (s->exit_code == STILL_ACTIVE) {
+            return true;
+        }
+        CloseHandle((HANDLE)pid);
+#endif
         s->qemu_pid = -1;
     }
     return false;
@@ -136,13 +159,25 @@ void qtest_set_expected_status(QTestState *s, int status)
 void qtest_kill_qemu(QTestState *s)
 {
     pid_t pid = s->qemu_pid;
+#ifndef _WIN32
     int wstatus;
+#else
+    DWORD ret;
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
+        GetExitCodeProcess((HANDLE)pid, &s->exit_code);
+        CloseHandle((HANDLE)pid);
+#endif
         s->qemu_pid = -1;
     }
 
@@ -150,6 +185,7 @@ void qtest_kill_qemu(QTestState *s)
      * Check whether qemu exited with expected exit status; anything else is
      * fishy and should be logged with as much detail as possible.
      */
+#ifndef _WIN32
     wstatus = s->wstatus;
     if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) != s->expected_status) {
         fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
@@ -166,6 +202,14 @@ void qtest_kill_qemu(QTestState *s)
                 __FILE__, __LINE__, sig, signame, dump);
         abort();
     }
+#else
+    if (s->exit_code != s->expected_status) {
+        fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
+                "process but encountered exit status %ld (expected %d)\n",
+                __FILE__, __LINE__, s->exit_code, s->expected_status);
+        abort();
+    }
+#endif
 }
 
 static void kill_qemu_hook_func(void *s)
@@ -244,6 +288,38 @@ static const char *qtest_qemu_binary(void)
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
@@ -271,6 +347,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     unlink(socket_path);
     unlink(qmp_socket_path);
 
+    socket_init();
     sock = init_socket(socket_path);
     qmpsock = init_socket(qmp_socket_path);
 
@@ -279,7 +356,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 
     qtest_add_abrt_handler(kill_qemu_hook_func, s);
 
-    command = g_strdup_printf("exec %s %s"
+    command = g_strdup_printf(CMD_EXEC "%s %s"
                               "-qtest unix:%s "
                               "-qtest-log %s "
                               "-chardev socket,path=%s,id=char0 "
@@ -288,7 +365,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
                               "%s"
                               " -accel qtest",
                               qemu_binary, tracearg, socket_path,
-                              getenv("QTEST_LOG") ? "/dev/fd/2" : "/dev/null",
+                              getenv("QTEST_LOG") ? DEV_STDERR : DEV_NULL,
                               qmp_socket_path,
                               extra_args ?: "");
 
@@ -297,6 +374,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     s->pending_events = NULL;
     s->wstatus = 0;
     s->expected_status = 0;
+#ifndef _WIN32
     s->qemu_pid = fork();
     if (s->qemu_pid == 0) {
 #ifdef __linux__
@@ -319,6 +397,9 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
         execlp("/bin/sh", "sh", "-c", command, NULL);
         exit(1);
     }
+#else
+    s->qemu_pid = qtest_create_process(command);
+#endif /* _WIN32 */
 
     g_free(command);
     s->fd = socket_accept(sock);
@@ -337,9 +418,19 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
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
 
@@ -393,6 +484,7 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
     g_assert_true(sock_dir != NULL);
     sock_path = g_strdup_printf("%s/sock", sock_dir);
 
+    socket_init();
     sock_fd_init = init_socket(sock_path);
 
     qts = qtest_initf("-chardev socket,id=s0,path=%s -serial chardev:s0 %s",
-- 
2.31.1


