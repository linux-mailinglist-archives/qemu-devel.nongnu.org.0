Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCF05AADC6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 13:36:14 +0200 (CEST)
Received: from localhost ([::1]:40122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU4xl-0006wS-UY
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 07:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU4hh-0001HY-RM
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 07:19:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU4hg-0006aM-3v
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 07:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662117555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=52NAMJZDToe0/qwaXgHbNBBIJFLzcLd3cbJxkM16roo=;
 b=Ty29CST7qSDu4WKA2IYthaXPxaNShXrgjfQO4laE6fwGoR2I64EeB57M6E5xPZF75jvBHg
 ng9jXCnGS8OMkdIJ16a+xCsOXjNKa+kC/X0ZPytb+HdKz8IfqLH1HZp0aJEVs0v+Jrf8Jp
 OYaUqLHKfkbFKg+ws22IJM5ViO7r2Ng=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-_StsSeSOOUWtiwXuSJxBgw-1; Fri, 02 Sep 2022 07:19:14 -0400
X-MC-Unique: _StsSeSOOUWtiwXuSJxBgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 842EC1818212
 for <qemu-devel@nongnu.org>; Fri,  2 Sep 2022 11:19:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 619361415125;
 Fri,  2 Sep 2022 11:19:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 2/3] io/command: implement support for win32
Date: Fri,  2 Sep 2022 15:18:59 +0400
Message-Id: <20220902111900.3029260-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220902111900.3029260-1-marcandre.lureau@redhat.com>
References: <20220902111900.3029260-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This is a fairly straightforward implementation of the equivalent UNIX
version.

GLib uses _mkpipe() to setup the FDs. We take that for granted, and set
the underlying named-pipes to nonblocking. This is done by other
projects as well (found on github), but I am not confident this works
reliably (msdn SetNamedPipeHandleState documentation discourage this
usage).

Alternatively, we could setup the FDs ourself, and use UNIX sockets on
Windows, which can be used in blocking/non-blocking mode. I haven't
tried it, as I am not sure it is necessary.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 io/channel-command.c | 58 ++++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 21 deletions(-)

diff --git a/io/channel-command.c b/io/channel-command.c
index 35ba14c6a2..9bc292f3fd 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -26,7 +26,6 @@
 #include "qemu/sockets.h"
 #include "trace.h"
 
-#ifndef WIN32
 /**
  * qio_channel_command_new_pid:
  * @writefd: the FD connected to the command's stdin
@@ -60,7 +59,13 @@ qio_channel_command_new_pid(int writefd,
     ioc->writefd = writefd;
     ioc->pid = pid;
 
-    trace_qio_channel_command_new_pid(ioc, writefd, readfd, pid);
+    trace_qio_channel_command_new_pid(ioc, writefd, readfd,
+#ifdef WIN32
+                                      GetProcessId(pid)
+#else
+                                      pid
+#endif
+        );
     return ioc;
 }
 
@@ -89,18 +94,6 @@ qio_channel_command_new_spawn(const char *const argv[],
     return qio_channel_command_new_pid(stdinfd, stdoutfd, pid);
 }
 
-#else /* WIN32 */
-QIOChannelCommand *
-qio_channel_command_new_spawn(const char *const argv[],
-                              int flags,
-                              Error **errp)
-{
-    error_setg_errno(errp, ENOSYS,
-                     "Command spawn not supported on this platform");
-    return NULL;
-}
-#endif /* WIN32 */
-
 #ifndef WIN32
 static int qio_channel_command_abort(QIOChannelCommand *ioc,
                                      Error **errp)
@@ -143,6 +136,23 @@ static int qio_channel_command_abort(QIOChannelCommand *ioc,
 
     return 0;
 }
+#else
+static int qio_channel_command_abort(QIOChannelCommand *ioc,
+                                     Error **errp)
+{
+    DWORD ret;
+
+    TerminateProcess(ioc->pid, 0);
+    ret = WaitForSingleObject(ioc->pid, 1000);
+    if (ret != WAIT_OBJECT_0) {
+        error_setg(errp,
+                   "Process %llu refused to die",
+                   (unsigned long long)GetProcessId(ioc->pid));
+        return -1;
+    }
+
+    return 0;
+}
 #endif /* ! WIN32 */
 
 
@@ -166,9 +176,7 @@ static void qio_channel_command_finalize(Object *obj)
     }
     ioc->writefd = ioc->readfd = -1;
     if (ioc->pid > 0) {
-#ifndef WIN32
         qio_channel_command_abort(ioc, NULL);
-#endif
         g_spawn_close_pid(ioc->pid);
     }
 }
@@ -233,14 +241,20 @@ static int qio_channel_command_set_blocking(QIOChannel *ioc,
                                             bool enabled,
                                             Error **errp)
 {
+    QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
+
 #ifdef WIN32
-    /* command spawn is not supported on win32 */
-    g_assert_not_reached();
+    DWORD dwMode = PIPE_READMODE_BYTE | enabled ? PIPE_WAIT : PIPE_NOWAIT;
+
+    if ((cioc->writefd >= 0 && !SetNamedPipeHandleState((HANDLE)_get_osfhandle(cioc->writefd), &dwMode, NULL, NULL)) ||
+        (cioc->readfd >= 0 &&!SetNamedPipeHandleState((HANDLE)_get_osfhandle(cioc->readfd), &dwMode, NULL, NULL))) {
+        error_setg_win32(errp, GetLastError(), "Failed to set nonblocking");
+        return -1;
+    }
 #else
-    QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
 
-    if (!g_unix_set_fd_nonblocking(cioc->writefd, !enabled, NULL) ||
-        !g_unix_set_fd_nonblocking(cioc->readfd, !enabled, NULL)) {
+    if ((cioc->writefd >= 0 && !g_unix_set_fd_nonblocking(cioc->writefd, !enabled, NULL)) ||
+        (cioc->readfd >= 0 && !g_unix_set_fd_nonblocking(cioc->readfd, !enabled, NULL))) {
         error_setg_errno(errp, errno, "Failed to set FD nonblocking");
         return -1;
     }
@@ -281,6 +295,8 @@ static int qio_channel_command_close(QIOChannel *ioc,
                          (unsigned long long)cioc->pid);
         return -1;
     }
+#else
+    WaitForSingleObject(cioc->pid, INFINITE);
 #endif
 
     if (rv < 0) {
-- 
2.37.2


