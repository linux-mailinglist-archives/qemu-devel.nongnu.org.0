Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9165F6599
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 14:04:01 +0200 (CEST)
Received: from localhost ([::1]:46740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogPbb-0005ey-EM
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 08:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogPBu-0003LX-IP
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogPBs-0000v6-Rl
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665056243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLqhHL4cpwzEGvxfKzrSSe0f8VkuzsALVDCbhdVT4oY=;
 b=cOKed53znMgfMOhOHKjns9rS319RowHeWcHHziewtVxdQIuHe0D9H9/m3FcvlKYqmvz3+s
 epj295aITbaoqExc9XFQIBukvETu4qAgnviiOizwmse9CGimjfMt3q98fwD6QhwfVQQ3nq
 752/b6Gib+zto3KKgMpgljdK8HdbFkY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-GndrOvCLMM-X48OKB3x23A-1; Thu, 06 Oct 2022 07:37:22 -0400
X-MC-Unique: GndrOvCLMM-X48OKB3x23A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83E293C14850
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 11:37:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9ABE535934;
 Thu,  6 Oct 2022 11:37:21 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v4 5/6] io/command: implement support for win32
Date: Thu,  6 Oct 2022 15:36:56 +0400
Message-Id: <20221006113657.2656108-6-marcandre.lureau@redhat.com>
In-Reply-To: <20221006113657.2656108-1-marcandre.lureau@redhat.com>
References: <20221006113657.2656108-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The initial implementation was changing the pipe state created by GLib
to PIPE_NOWAIT, but it turns out it doesn't work (read/write returns an
error). Since reading may return less than the requested amount, it
seems to be non-blocking already. However, the IO operation may block
until the FD is ready, I can't find good sources of information, to be
safe we can just poll for readiness before.

Alternatively, we could setup the FDs ourself, and use UNIX sockets on
Windows, which can be used in blocking/non-blocking mode. I haven't
tried it, as I am not sure it is necessary.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/io/channel-command.h |  3 ++
 io/channel-command.c         | 80 ++++++++++++++++++++++++++----------
 2 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/include/io/channel-command.h b/include/io/channel-command.h
index 8dc58273c0..98934e6d9e 100644
--- a/include/io/channel-command.h
+++ b/include/io/channel-command.h
@@ -42,6 +42,9 @@ struct QIOChannelCommand {
     int writefd;
     int readfd;
     GPid pid;
+#ifdef WIN32
+    bool blocking;
+#endif
 };
 
 
diff --git a/io/channel-command.c b/io/channel-command.c
index f84d1f03a0..74516252ba 100644
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
 
 
@@ -166,13 +176,27 @@ static void qio_channel_command_finalize(Object *obj)
     }
     ioc->writefd = ioc->readfd = -1;
     if (ioc->pid > 0) {
-#ifndef WIN32
         qio_channel_command_abort(ioc, NULL);
-#endif
         g_spawn_close_pid(ioc->pid);
     }
 }
 
+#ifdef WIN32
+static bool win32_fd_poll(int fd, gushort events)
+{
+    GPollFD pfd = { .fd = _get_osfhandle(fd), .events = events };
+    int res;
+
+    do {
+        res = g_poll(&pfd, 1, 0);
+    } while (res < 0 && errno == EINTR);
+    if (res == 0) {
+        return false;
+    }
+
+    return true;
+}
+#endif
 
 static ssize_t qio_channel_command_readv(QIOChannel *ioc,
                                          const struct iovec *iov,
@@ -184,6 +208,12 @@ static ssize_t qio_channel_command_readv(QIOChannel *ioc,
     QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
     ssize_t ret;
 
+#ifdef WIN32
+    if (!cioc->blocking && !win32_fd_poll(cioc->readfd, G_IO_IN)) {
+        return QIO_CHANNEL_ERR_BLOCK;
+    }
+#endif
+
  retry:
     ret = readv(cioc->readfd, iov, niov);
     if (ret < 0) {
@@ -213,6 +243,12 @@ static ssize_t qio_channel_command_writev(QIOChannel *ioc,
     QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
     ssize_t ret;
 
+#ifdef WIN32
+    if (!cioc->blocking && !win32_fd_poll(cioc->writefd, G_IO_OUT)) {
+        return QIO_CHANNEL_ERR_BLOCK;
+    }
+#endif
+
  retry:
     ret = writev(cioc->writefd, iov, niov);
     if (ret <= 0) {
@@ -233,14 +269,14 @@ static int qio_channel_command_set_blocking(QIOChannel *ioc,
                                             bool enabled,
                                             Error **errp)
 {
+    QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
+
 #ifdef WIN32
-    /* command spawn is not supported on win32 */
-    g_assert_not_reached();
+    cioc->blocking = enabled;
 #else
-    QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
 
-    if (!g_unix_set_fd_nonblocking(cioc->writefd, !enabled, NULL) ||
-        !g_unix_set_fd_nonblocking(cioc->readfd, !enabled, NULL)) {
+    if ((cioc->writefd >= 0 && !g_unix_set_fd_nonblocking(cioc->writefd, !enabled, NULL)) ||
+        (cioc->readfd >= 0 && !g_unix_set_fd_nonblocking(cioc->readfd, !enabled, NULL))) {
         error_setg_errno(errp, errno, "Failed to set FD nonblocking");
         return -1;
     }
@@ -281,6 +317,8 @@ static int qio_channel_command_close(QIOChannel *ioc,
                          (unsigned long long)cioc->pid);
         return -1;
     }
+#else
+    WaitForSingleObject(cioc->pid, INFINITE);
 #endif
 
     if (rv < 0) {
-- 
2.37.3


