Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FEA5F628D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 10:24:55 +0200 (CEST)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogMBZ-0007CH-Vh
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 04:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogLzo-0006O8-Ha
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:12:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogLzm-0002om-Su
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665043960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S0LxJV+KBjtlyQg/pWeX9lsL8wJ+xZKe/k1sVYgNX/Q=;
 b=USc/G43vPRkYfYnPNJrWfstJqBsHqZON+xA0BLCPu2yTkzlO2khg//otCdqWj2bb+r61Nv
 BFDA9NdkoTO8UW+KuTKGVGOdOZuhV0FAllKeYAOcVEpoIk+Te8EgUO6R4dQu13rHmN7M1J
 V0ZjFy3WcugVzgLy3eSo9mUfEcoqd2w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-O1HgomDkM4qpgRGXCJSu-g-1; Thu, 06 Oct 2022 04:12:39 -0400
X-MC-Unique: O1HgomDkM4qpgRGXCJSu-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 085CB887401
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 08:12:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0F011121314;
 Thu,  6 Oct 2022 08:12:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 3/5] io/command: use glib GSpawn,
 instead of open-coding fork/exec
Date: Thu,  6 Oct 2022 12:12:20 +0400
Message-Id: <20221006081222.2606746-4-marcandre.lureau@redhat.com>
In-Reply-To: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
References: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Simplify qio_channel_command_new_spawn() with GSpawn API. This will
allow to build for WIN32 in the following patches.

As pointed out by Daniel Berrangé: there is a change in semantics here
too. The current code only touches stdin/stdout/stderr. Any other FDs
which do NOT have O_CLOEXEC set will be inherited. With the new code,
all FDs except stdin/out/err will be explicitly closed, because we don't
set the flag G_SPAWN_LEAVE_DESCRIPTORS_OPEN. The only place we use
QIOChannelCommand today is the migration exec: protocol, and that is
only declared to use stdin/stdout.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/io/channel-command.h |   2 +-
 io/channel-command.c         | 105 ++++++-----------------------------
 2 files changed, 19 insertions(+), 88 deletions(-)

diff --git a/include/io/channel-command.h b/include/io/channel-command.h
index 305ac1d280..8dc58273c0 100644
--- a/include/io/channel-command.h
+++ b/include/io/channel-command.h
@@ -41,7 +41,7 @@ struct QIOChannelCommand {
     QIOChannel parent;
     int writefd;
     int readfd;
-    pid_t pid;
+    GPid pid;
 };
 
 
diff --git a/io/channel-command.c b/io/channel-command.c
index 9f2f4a1793..f84d1f03a0 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -31,7 +31,7 @@
  * qio_channel_command_new_pid:
  * @writefd: the FD connected to the command's stdin
  * @readfd: the FD connected to the command's stdout
- * @pid: the PID of the running child command
+ * @pid: the PID/HANDLE of the running child command
  * @errp: pointer to a NULL-initialized error object
  *
  * Create a channel for performing I/O with the
@@ -50,7 +50,7 @@
 static QIOChannelCommand *
 qio_channel_command_new_pid(int writefd,
                             int readfd,
-                            pid_t pid)
+                            GPid pid)
 {
     QIOChannelCommand *ioc;
 
@@ -69,94 +69,24 @@ qio_channel_command_new_spawn(const char *const argv[],
                               int flags,
                               Error **errp)
 {
-    pid_t pid = -1;
-    int stdinfd[2] = { -1, -1 };
-    int stdoutfd[2] = { -1, -1 };
-    int devnull = -1;
-    bool stdinnull = false, stdoutnull = false;
-    QIOChannelCommand *ioc;
+    g_autoptr(GError) err = NULL;
+    GPid pid = 0;
+    GSpawnFlags gflags = G_SPAWN_CLOEXEC_PIPES | G_SPAWN_DO_NOT_REAP_CHILD;
+    int stdinfd = -1, stdoutfd = -1;
 
     flags = flags & O_ACCMODE;
-
-    if (flags == O_RDONLY) {
-        stdinnull = true;
-    }
-    if (flags == O_WRONLY) {
-        stdoutnull = true;
-    }
-
-    if (stdinnull || stdoutnull) {
-        devnull = open("/dev/null", O_RDWR);
-        if (devnull < 0) {
-            error_setg_errno(errp, errno,
-                             "Unable to open /dev/null");
-            goto error;
-        }
-    }
-
-    if ((!stdinnull && !g_unix_open_pipe(stdinfd, FD_CLOEXEC, NULL)) ||
-        (!stdoutnull && !g_unix_open_pipe(stdoutfd, FD_CLOEXEC, NULL))) {
-        error_setg_errno(errp, errno,
-                         "Unable to open pipe");
-        goto error;
-    }
-
-    pid = qemu_fork(errp);
-    if (pid < 0) {
-        goto error;
-    }
-
-    if (pid == 0) { /* child */
-        dup2(stdinnull ? devnull : stdinfd[0], STDIN_FILENO);
-        dup2(stdoutnull ? devnull : stdoutfd[1], STDOUT_FILENO);
-        /* Leave stderr connected to qemu's stderr */
-
-        if (!stdinnull) {
-            close(stdinfd[0]);
-            close(stdinfd[1]);
-        }
-        if (!stdoutnull) {
-            close(stdoutfd[0]);
-            close(stdoutfd[1]);
-        }
-        if (devnull != -1) {
-            close(devnull);
-        }
-
-        execv(argv[0], (char * const *)argv);
-        _exit(1);
+    gflags |= flags == O_WRONLY ? G_SPAWN_STDOUT_TO_DEV_NULL : 0;
+
+    if (!g_spawn_async_with_pipes(NULL, (char **)argv, NULL, gflags, NULL, NULL,
+                                  &pid,
+                                  flags == O_RDONLY ? NULL : &stdinfd,
+                                  flags == O_WRONLY ? NULL : &stdoutfd,
+                                  NULL, &err)) {
+        error_setg(errp, "%s", err->message);
+        return NULL;
     }
 
-    if (!stdinnull) {
-        close(stdinfd[0]);
-    }
-    if (!stdoutnull) {
-        close(stdoutfd[1]);
-    }
-
-    ioc = qio_channel_command_new_pid(stdinnull ? devnull : stdinfd[1],
-                                      stdoutnull ? devnull : stdoutfd[0],
-                                      pid);
-    trace_qio_channel_command_new_spawn(ioc, argv[0], flags);
-    return ioc;
-
- error:
-    if (devnull != -1) {
-        close(devnull);
-    }
-    if (stdinfd[0] != -1) {
-        close(stdinfd[0]);
-    }
-    if (stdinfd[1] != -1) {
-        close(stdinfd[1]);
-    }
-    if (stdoutfd[0] != -1) {
-        close(stdoutfd[0]);
-    }
-    if (stdoutfd[1] != -1) {
-        close(stdoutfd[1]);
-    }
-    return NULL;
+    return qio_channel_command_new_pid(stdinfd, stdoutfd, pid);
 }
 
 #else /* WIN32 */
@@ -221,7 +151,7 @@ static void qio_channel_command_init(Object *obj)
     QIOChannelCommand *ioc = QIO_CHANNEL_COMMAND(obj);
     ioc->readfd = -1;
     ioc->writefd = -1;
-    ioc->pid = -1;
+    ioc->pid = 0;
 }
 
 static void qio_channel_command_finalize(Object *obj)
@@ -239,6 +169,7 @@ static void qio_channel_command_finalize(Object *obj)
 #ifndef WIN32
         qio_channel_command_abort(ioc, NULL);
 #endif
+        g_spawn_close_pid(ioc->pid);
     }
 }
 
-- 
2.37.3


