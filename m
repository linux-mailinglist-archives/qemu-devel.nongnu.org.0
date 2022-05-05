Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6C751BAD4
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:43:56 +0200 (CEST)
Received: from localhost ([::1]:39612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmX5X-0001JZ-9n
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWee-00072Z-Qq
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:16:08 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:54947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWec-0007vJ-VO
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651738566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6oZBQ9WYB7rOReK2m+uLVNbgBKZ2RFI8zPGCTc5TzQQ=;
 b=CDbyHpDfAwbO6nWK0hjvCDKmwl0mBcNtyweD1QsUj3tMeA1mMAAgLjFzJMlGxUuNGwfezn
 7D79VPcPQquBOraZcEgLD4boWDZWsGz3W5UZEmYum8muPpRWKu4+zrhQ/oHv80dJK4vVZ/
 /g0MZG+Dm3wgUNwXuq89bmBz8VIKegs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-Uc0LZxKwOO2-w8kszp2I1Q-1; Thu, 05 May 2022 04:16:00 -0400
X-MC-Unique: Uc0LZxKwOO2-w8kszp2I1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA6B4803FF3;
 Thu,  5 May 2022 08:15:59 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64D3E40CF900;
 Thu,  5 May 2022 08:15:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 08/15] qga: throw an Error in ga_channel_open()
Date: Thu,  5 May 2022 12:14:24 +0400
Message-Id: <20220505081431.934739-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220505081431.934739-1-marcandre.lureau@redhat.com>
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.74;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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
 qga/channel-posix.c | 42 +++++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/qga/channel-posix.c b/qga/channel-posix.c
index a996858e2492..0ce594bc36c2 100644
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
+            if (*errp) {
                 return false;
             }
 
-            fd = socket_listen(addr, 1, &local_err);
+            fd = socket_listen(addr, 1, errp);
             qapi_free_SocketAddress(addr);
-            if (local_err != NULL) {
-                g_critical("%s", error_get_pretty(local_err));
-                error_free(local_err);
+            if (*errp) {
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
 
@@ -272,12 +263,13 @@ GIOStatus ga_channel_read(GAChannel *c, gchar *buf, gsize size, gsize *count)
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
+        error_report_err(err);
         ga_channel_free(c);
         return NULL;
     }
-- 
2.36.0.44.g0f828332d5ac


