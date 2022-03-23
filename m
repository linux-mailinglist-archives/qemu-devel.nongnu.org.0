Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E04E564B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:24:39 +0100 (CET)
Received: from localhost ([::1]:42668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3mo-0004Cj-5L
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:24:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Qe-000671-9W
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Qc-0005hw-Fg
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2VF0MnA2bWxVx4BcilexJJEaPYA0K1w/lOJdWLhBsc=;
 b=dr3leEd9KTt4TEwknMQjsJUSRRgeJF+GonvIdstLrBqX6YOlp/m8YscdWXCGznJRffbUaw
 0qGEUaom05mIyg+bgiFp312CFrHAcVc1fdYJxPzbbxIe/DGLyq9VHDG9+v0kTs0f1B62gD
 ApzEjigZ8U3ECYtQWi9AFWHp2bcegok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-NRV9V-5-PW2pmTUjVrBBWQ-1; Wed, 23 Mar 2022 12:01:40 -0400
X-MC-Unique: NRV9V-5-PW2pmTUjVrBBWQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6562C811E81;
 Wed, 23 Mar 2022 16:01:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 756C5469A51;
 Wed, 23 Mar 2022 16:01:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 30/32] qga: remove explicit environ argument from exec/spawn
Date: Wed, 23 Mar 2022 19:57:41 +0400
Message-Id: <20220323155743.1585078-31-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Environment is implicitly inherited from the current process "environ"
variable for execl() or g_spawn_sync(), no need to be explicit about it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build          |  2 --
 qga/commands-posix.c | 24 +++++++-----------------
 2 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/meson.build b/meson.build
index e03a1b50cc11..c06fe5e02737 100644
--- a/meson.build
+++ b/meson.build
@@ -1654,8 +1654,6 @@ config_host_data.set('CONFIG_BYTESWAP_H',
                      cc.has_header_symbol('byteswap.h', 'bswap_32'))
 config_host_data.set('CONFIG_EPOLL_CREATE1',
                      cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))
-config_host_data.set('CONFIG_HAS_ENVIRON',
-                     cc.has_header_symbol('unistd.h', 'environ', prefix: gnu_source_prefix))
 config_host_data.set('CONFIG_FALLOCATE_PUNCH_HOLE',
                      cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_PUNCH_HOLE') and
                      cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_KEEP_SIZE'))
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 75dbaab68ea9..4d7a2392c097 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -32,15 +32,6 @@
 #include <utmpx.h>
 #endif
 
-#ifndef CONFIG_HAS_ENVIRON
-#ifdef __APPLE__
-#include <crt_externs.h>
-#define environ (*_NSGetEnviron())
-#else
-extern char **environ;
-#endif
-#endif
-
 #if defined(__linux__)
 #include <mntent.h>
 #include <linux/fs.h>
@@ -109,8 +100,8 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
         reopen_fd_to_null(1);
         reopen_fd_to_null(2);
 
-        execle("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
-               "hypervisor initiated shutdown", (char *)NULL, environ);
+        execl("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
+               "hypervisor initiated shutdown", (char *)NULL);
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
         error_setg_errno(errp, errno, "failed to create child process");
@@ -207,8 +198,7 @@ void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)
 
         /* Use '/sbin/hwclock -w' to set RTC from the system time,
          * or '/sbin/hwclock -s' to set the system time from RTC. */
-        execle(hwclock_path, "hwclock", has_time ? "-w" : "-s",
-               NULL, environ);
+        execl(hwclock_path, "hwclock", has_time ? "-w" : "-s", NULL);
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
         error_setg_errno(errp, errno, "failed to create child process");
@@ -1574,7 +1564,7 @@ static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)
         reopen_fd_to_null(1);
         reopen_fd_to_null(2);
 
-        execle(hook, hook, arg_str, NULL, environ);
+        execl(hook, hook, arg_str, NULL);
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
         error_setg_errno(errp, errno, "failed to create child process");
@@ -1888,7 +1878,7 @@ static int run_process_child(const char *command[], Error **errp)
     spawn_flag = G_SPAWN_SEARCH_PATH | G_SPAWN_STDOUT_TO_DEV_NULL |
                  G_SPAWN_STDERR_TO_DEV_NULL;
 
-    success =  g_spawn_sync(NULL, (char **)command, environ, spawn_flag,
+    success =  g_spawn_sync(NULL, (char **)command, NULL, spawn_flag,
                             NULL, NULL, NULL, NULL,
                             &exit_status, &g_err);
 
@@ -2569,9 +2559,9 @@ void qmp_guest_set_user_password(const char *username,
         reopen_fd_to_null(2);
 
         if (crypted) {
-            execle(passwd_path, "chpasswd", "-e", NULL, environ);
+            execl(passwd_path, "chpasswd", "-e", NULL);
         } else {
-            execle(passwd_path, "chpasswd", NULL, environ);
+            execl(passwd_path, "chpasswd", NULL);
         }
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
-- 
2.35.1.273.ge6ebfd0e8cbb


