Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31FE6C2D7B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 10:04:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peXuN-0000M5-U8; Tue, 21 Mar 2023 05:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peXuM-0000Lr-EN
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:03:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peXuK-0001k4-RG
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679389429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaUFJcUgdXiHoS+ska1vXzvK2WreSoHpVr6/1XsK7e4=;
 b=c0FBewEJQJa3mbCBaRUSk36SYUFLqGwalyxtDvkvH3SzykqBr+jlO43DBGEJNrYmki+GR9
 2cqZNaJPTRXykuCSoB1m3aUweAgolwXG+fNTnzqkDqOEQpj7ZnipguenG+lQmyI8RNZBva
 RNJWbIdEr/M62yHiPw38ZUOJ57fQwD4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-FiqHLhcsMYeMW24AYMq9Aw-1; Tue, 21 Mar 2023 05:03:47 -0400
X-MC-Unique: FiqHLhcsMYeMW24AYMq9Aw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A4A3185A78F;
 Tue, 21 Mar 2023 09:03:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B99AB40C6E67;
 Tue, 21 Mar 2023 09:03:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PULL 2/7] ui/spice: fix SOCKET handling regression
Date: Tue, 21 Mar 2023 13:03:29 +0400
Message-Id: <20230321090334.1841607-3-marcandre.lureau@redhat.com>
In-Reply-To: <20230321090334.1841607-1-marcandre.lureau@redhat.com>
References: <20230321090334.1841607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Spice uses SOCKET on win32, but QEMU now uses file-descriptors.

Fixes "8.0.0rc0 Regression: spicy windows doesn't open":
https://gitlab.com/qemu-project/qemu/-/issues/1549

Fixes: commit abe34282b ("win32: avoid mixing SOCKET and file descriptor space")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230320133643.1618437-3-marcandre.lureau@redhat.com>
---
 ui/spice-core.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/ui/spice-core.c b/ui/spice-core.c
index b05c830086..67cfd3ca9c 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -90,13 +90,23 @@ struct SpiceWatch {
 static void watch_read(void *opaque)
 {
     SpiceWatch *watch = opaque;
-    watch->func(watch->fd, SPICE_WATCH_EVENT_READ, watch->opaque);
+    int fd = watch->fd;
+
+#ifdef WIN32
+    fd = _get_osfhandle(fd);
+#endif
+    watch->func(fd, SPICE_WATCH_EVENT_READ, watch->opaque);
 }
 
 static void watch_write(void *opaque)
 {
     SpiceWatch *watch = opaque;
-    watch->func(watch->fd, SPICE_WATCH_EVENT_WRITE, watch->opaque);
+    int fd = watch->fd;
+
+#ifdef WIN32
+    fd = _get_osfhandle(fd);
+#endif
+    watch->func(fd, SPICE_WATCH_EVENT_WRITE, watch->opaque);
 }
 
 static void watch_update_mask(SpiceWatch *watch, int event_mask)
@@ -117,6 +127,14 @@ static SpiceWatch *watch_add(int fd, int event_mask, SpiceWatchFunc func, void *
 {
     SpiceWatch *watch;
 
+#ifdef WIN32
+    fd = _open_osfhandle(fd, _O_BINARY);
+    if (fd < 0) {
+        error_setg_win32(&error_warn, WSAGetLastError(), "Couldn't associate a FD with the SOCKET");
+        return NULL;
+    }
+#endif
+
     watch = g_malloc0(sizeof(*watch));
     watch->fd     = fd;
     watch->func   = func;
@@ -129,6 +147,10 @@ static SpiceWatch *watch_add(int fd, int event_mask, SpiceWatchFunc func, void *
 static void watch_remove(SpiceWatch *watch)
 {
     qemu_set_fd_handler(watch->fd, NULL, NULL, NULL);
+#ifdef WIN32
+    /* SOCKET is owned by spice */
+    qemu_close_to_socket(watch->fd);
+#endif
     g_free(watch);
 }
 
@@ -908,6 +930,9 @@ static int qemu_spice_set_pw_expire(time_t expires)
 
 static int qemu_spice_display_add_client(int csock, int skipauth, int tls)
 {
+#ifdef WIN32
+    csock = qemu_close_socket_osfhandle(csock);
+#endif
     if (tls) {
         return spice_server_add_ssl_client(spice_server, csock, skipauth);
     } else {
-- 
2.39.2


