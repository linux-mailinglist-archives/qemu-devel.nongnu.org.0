Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CD55A958E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 13:17:53 +0200 (CEST)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTiCm-0003jn-Qe
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 07:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oTiB3-0002FL-L9
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 07:16:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oTiB0-0003Nf-6l
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 07:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662030960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KS4AGeEmcmtiUMPW3h0hwVizk8lQ2xRcgrvCLhe1u30=;
 b=JzjURLcSSpmACtmuT1S4OYfufd7m63BZBOj9cSmyl+9Bb831UAx/dkYHvH1hdIiF1TNbDL
 sf7KzOXOmFnN73z8loWEsBy2UdtV97r6Xqk+/u46hdOFIUHHg34a6/7rDjSvFTsT1tG7sy
 +uNX2jslKc1FHTJVLB9VTjOcqb1U5t0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-pdKJyIKPO3CQhvGN_VPefA-1; Thu, 01 Sep 2022 07:15:57 -0400
X-MC-Unique: pdKJyIKPO3CQhvGN_VPefA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DE06811E80;
 Thu,  1 Sep 2022 11:15:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5587C492C3B;
 Thu,  1 Sep 2022 11:15:56 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, bin.meng@windriver.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] io/command: implement portable spawn
Date: Thu,  1 Sep 2022 15:15:53 +0400
Message-Id: <20220901111553.2901487-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Using GLib spawn API is both simpler and portable.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 io/channel-command.c | 115 ++++++++-----------------------------------
 1 file changed, 21 insertions(+), 94 deletions(-)

diff --git a/io/channel-command.c b/io/channel-command.c
index 9f2f4a1793..c069732105 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -26,7 +26,6 @@
 #include "qemu/sockets.h"
 #include "trace.h"
 
-#ifndef WIN32
 /**
  * qio_channel_command_new_pid:
  * @writefd: the FD connected to the command's stdin
@@ -69,107 +68,35 @@ qio_channel_command_new_spawn(const char *const argv[],
                               int flags,
                               Error **errp)
 {
-    pid_t pid = -1;
-    int stdinfd[2] = { -1, -1 };
-    int stdoutfd[2] = { -1, -1 };
-    int devnull = -1;
-    bool stdinnull = false, stdoutnull = false;
+    g_autoptr(GError) err = NULL;
+    GPid pid = 0;
     QIOChannelCommand *ioc;
+    GSpawnFlags gflags = G_SPAWN_CLOEXEC_PIPES;
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
 
-    ioc = qio_channel_command_new_pid(stdinnull ? devnull : stdinfd[1],
-                                      stdoutnull ? devnull : stdoutfd[0],
-                                      pid);
-    trace_qio_channel_command_new_spawn(ioc, argv[0], flags);
+    ioc = qio_channel_command_new_pid(stdinfd,
+                                      stdoutfd,
+#ifdef _WIN32
+                                      GetProcessId(pid)
+#else
+                                      pid
+#endif
+        );
     return ioc;
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
-}
-
-#else /* WIN32 */
-QIOChannelCommand *
-qio_channel_command_new_spawn(const char *const argv[],
-                              int flags,
-                              Error **errp)
-{
-    error_setg_errno(errp, ENOSYS,
-                     "Command spawn not supported on this platform");
-    return NULL;
 }
-#endif /* WIN32 */
 
 #ifndef WIN32
 static int qio_channel_command_abort(QIOChannelCommand *ioc,
-- 
2.37.2


