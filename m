Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC15FC8E7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:10:27 +0200 (CEST)
Received: from localhost ([::1]:44042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oieJO-0000oR-Px
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oieEU-0003Kw-9x
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:05:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oieEK-0005gm-2v
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665590711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lC+6k1rr3ChLnulkoyG6ohhttdBLlO/Wxm1mxh5HZYg=;
 b=b+SlHLYzufB98sw32iN6BX6nYgw7+UaG0A69+mVAZzGLmb1sWXb+yAKYqyQhkSAyLY4y45
 hHlVxHKxE8oDCxcHx/skgc5h/0ERbfaRsyT+NOnlypHX6uSG+08LFpr+JCFNnWhL0l+iO+
 ++E1yiDP4Z+SO2lpc3/vhdHhTvztIBc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-hcVomkQiNluU0JJ3NuOBIw-1; Wed, 12 Oct 2022 12:05:09 -0400
X-MC-Unique: hcVomkQiNluU0JJ3NuOBIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 357EB85A59D;
 Wed, 12 Oct 2022 16:05:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EECBF140EBF5;
 Wed, 12 Oct 2022 16:05:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 5/7] io/command: use glib GSpawn,
 instead of open-coding fork/exec
Date: Wed, 12 Oct 2022 20:04:42 +0400
Message-Id: <20221012160444.3762795-6-marcandre.lureau@redhat.com>
In-Reply-To: <20221012160444.3762795-1-marcandre.lureau@redhat.com>
References: <20221012160444.3762795-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
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
Message-Id: <20221006113657.2656108-5-marcandre.lureau@redhat.com>
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


