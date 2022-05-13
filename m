Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF75452691A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:19:37 +0200 (CEST)
Received: from localhost ([::1]:52696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZt2-0007Xg-SG
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZiW-0000rO-Oh
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZiV-00070k-3K
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652465322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jh8aRrRJckFcHtiQlCat4NAPKRU4Hvu05QLyujh6EXQ=;
 b=ekiFqTaH2lIeOQar0aPRkykVZg/xK5ZNt/6DTK6QjS3UEXa9SwaCexgEXeowVmZxXAOMHd
 Jt4baKXqdHXKKRW09h1wSOLW0rb/cpyQYMPp+arqwVshiak4HViuuwgInni5l0SoSrHBsV
 EALIOXy0EmlsE1liYuLUl/NsdhQFSvI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-KsCE1c-JNgeB3uNEzJomqQ-1; Fri, 13 May 2022 14:08:41 -0400
X-MC-Unique: KsCE1c-JNgeB3uNEzJomqQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DED69801E80;
 Fri, 13 May 2022 18:08:40 +0000 (UTC)
Received: from localhost (unknown [10.39.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84F0C438BF4;
 Fri, 13 May 2022 18:08:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 07/15] qga: throw an Error in ga_channel_open()
Date: Fri, 13 May 2022 20:08:13 +0200
Message-Id: <20220513180821.905149-8-marcandre.lureau@redhat.com>
In-Reply-To: <20220513180821.905149-1-marcandre.lureau@redhat.com>
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Allow for a single point of error reporting, and further refactoring.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/channel-posix.c | 43 ++++++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/qga/channel-posix.c b/qga/channel-posix.c
index a996858e24..039e1ddcb2 100644
--- a/qga/channel-posix.c
+++ b/qga/channel-posix.c
@@ -119,8 +119,9 @@ static int ga_channel_client_add(GAChannel *c, int fd)
 }
 
 static gboolean ga_channel_open(GAChannel *c, const gchar *path,
-                                GAChannelMethod method, int fd)
+                                GAChannelMethod method, int fd, Error **errp)
 {
+    ERRP_GUARD();
     int ret;
     c->method = method;
 
@@ -133,21 +134,20 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
 #endif
                            );
         if (fd == -1) {
-            g_critical("error opening channel: %s", strerror(errno));
+            error_setg_errno(errp, errno, "error opening channel");
             return false;
         }
 #ifdef CONFIG_SOLARIS
         ret = ioctl(fd, I_SETSIG, S_OUTPUT | S_INPUT | S_HIPRI);
         if (ret == -1) {
-            g_critical("error setting event mask for channel: %s",
-                       strerror(errno));
+            error_setg_errno(errp, errno, "error setting event mask for channel");
             close(fd);
             return false;
         }
 #endif
         ret = ga_channel_client_add(c, fd);
         if (ret) {
-            g_critical("error adding channel to main loop");
+            error_setg(errp, "error adding channel to main loop");
             close(fd);
             return false;
         }
@@ -159,7 +159,7 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
         assert(fd < 0);
         fd = qemu_open_old(path, O_RDWR | O_NOCTTY | O_NONBLOCK);
         if (fd == -1) {
-            g_critical("error opening channel: %s", strerror(errno));
+            error_setg_errno(errp, errno, "error opening channel");
             return false;
         }
         tcgetattr(fd, &tio);
@@ -180,7 +180,7 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
         tcsetattr(fd, TCSANOW, &tio);
         ret = ga_channel_client_add(c, fd);
         if (ret) {
-            g_critical("error adding channel to main loop");
+            error_setg(errp, "error adding channel to main loop");
             close(fd);
             return false;
         }
@@ -188,12 +188,8 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
     }
     case GA_CHANNEL_UNIX_LISTEN: {
         if (fd < 0) {
-            Error *local_err = NULL;
-
-            fd = unix_listen(path, &local_err);
-            if (local_err != NULL) {
-                g_critical("%s", error_get_pretty(local_err));
-                error_free(local_err);
+            fd = unix_listen(path, errp);
+            if (fd < 0) {
                 return false;
             }
         }
@@ -202,24 +198,19 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
     }
     case GA_CHANNEL_VSOCK_LISTEN: {
         if (fd < 0) {
-            Error *local_err = NULL;
             SocketAddress *addr;
             char *addr_str;
 
             addr_str = g_strdup_printf("vsock:%s", path);
-            addr = socket_parse(addr_str, &local_err);
+            addr = socket_parse(addr_str, errp);
             g_free(addr_str);
-            if (local_err != NULL) {
-                g_critical("%s", error_get_pretty(local_err));
-                error_free(local_err);
+            if (!addr) {
                 return false;
             }
 
-            fd = socket_listen(addr, 1, &local_err);
+            fd = socket_listen(addr, 1, errp);
             qapi_free_SocketAddress(addr);
-            if (local_err != NULL) {
-                g_critical("%s", error_get_pretty(local_err));
-                error_free(local_err);
+            if (fd < 0) {
                 return false;
             }
         }
@@ -227,7 +218,7 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
         break;
     }
     default:
-        g_critical("error binding/listening to specified socket");
+        error_setg(errp, "error binding/listening to specified socket");
         return false;
     }
 
@@ -272,12 +263,14 @@ GIOStatus ga_channel_read(GAChannel *c, gchar *buf, gsize size, gsize *count)
 GAChannel *ga_channel_new(GAChannelMethod method, const gchar *path,
                           int listen_fd, GAChannelCallback cb, gpointer opaque)
 {
+    Error *err = NULL;
     GAChannel *c = g_new0(GAChannel, 1);
     c->event_cb = cb;
     c->user_data = opaque;
 
-    if (!ga_channel_open(c, path, method, listen_fd)) {
-        g_critical("error opening channel");
+    if (!ga_channel_open(c, path, method, listen_fd, &err)) {
+        g_critical("%s", error_get_pretty(err));
+        error_free(err);
         ga_channel_free(c);
         return NULL;
     }
-- 
2.36.1


