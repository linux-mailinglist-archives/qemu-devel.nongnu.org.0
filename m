Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FD947BB37
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:38:33 +0100 (CET)
Received: from localhost ([::1]:43418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZjE-0001Fd-Bz
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:38:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZAq-0005aJ-2O
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:03:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZAo-00025O-Dv
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CTOXlzpGeLk5q64FnEbOBtZCYbNColSGZ3DvHQlAUo=;
 b=IU3L6S9jGsgPCm9aC0bkOxHYj5/j/S2cC0ifaLP3/053hTNlgUCNBHu6rgEjqDFnO8qbko
 gUEeRJqY9vWrxQonA9mH+9Gh6xLRlm8EKfnrnsDkK60zIKHUfvJvJ6l5BTJcK1zTJUf9F3
 1Cz1aXivarRMC+JR6TPCygWwHecZBQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-Bt9Gs-qFMLKvki92VgYbww-1; Tue, 21 Dec 2021 02:02:54 -0500
X-MC-Unique: Bt9Gs-qFMLKvki92VgYbww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E4A71006AA7;
 Tue, 21 Dec 2021 07:02:53 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10E3F7A426;
 Tue, 21 Dec 2021 07:02:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 15/36] ui: dispatch GL events to all listeners
Date: Tue, 21 Dec 2021 10:58:34 +0400
Message-Id: <20211221065855.142578-16-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

For now, only one listener can receive GL events. Let's dispatch to all
listeners. (preliminary check ensure there is a single listener now
during regitration, and in next patches, compatible listeners only)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 58 +++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 16 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 6f21007737e5..13c0d001c096 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1824,8 +1824,12 @@ int dpy_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx)
 
 void dpy_gl_scanout_disable(QemuConsole *con)
 {
-    assert(con->gl);
-    con->gl->ops->dpy_gl_scanout_disable(con->gl);
+    DisplayState *s = con->ds;
+    DisplayChangeListener *dcl;
+
+    QLIST_FOREACH(dcl, &s->listeners, next) {
+        dcl->ops->dpy_gl_scanout_disable(dcl);
+    }
 }
 
 void dpy_gl_scanout_texture(QemuConsole *con,
@@ -1836,58 +1840,80 @@ void dpy_gl_scanout_texture(QemuConsole *con,
                             uint32_t x, uint32_t y,
                             uint32_t width, uint32_t height)
 {
-    assert(con->gl);
-    con->gl->ops->dpy_gl_scanout_texture(con->gl, backing_id,
+    DisplayState *s = con->ds;
+    DisplayChangeListener *dcl;
+
+    QLIST_FOREACH(dcl, &s->listeners, next) {
+        dcl->ops->dpy_gl_scanout_texture(dcl, backing_id,
                                          backing_y_0_top,
                                          backing_width, backing_height,
                                          x, y, width, height);
+    }
 }
 
 void dpy_gl_scanout_dmabuf(QemuConsole *con,
                            QemuDmaBuf *dmabuf)
 {
-    assert(con->gl);
-    con->gl->ops->dpy_gl_scanout_dmabuf(con->gl, dmabuf);
+    DisplayState *s = con->ds;
+    DisplayChangeListener *dcl;
+
+    QLIST_FOREACH(dcl, &s->listeners, next) {
+        dcl->ops->dpy_gl_scanout_dmabuf(dcl, dmabuf);
+    }
 }
 
 void dpy_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBuf *dmabuf,
                           bool have_hot, uint32_t hot_x, uint32_t hot_y)
 {
-    assert(con->gl);
+    DisplayState *s = con->ds;
+    DisplayChangeListener *dcl;
 
-    if (con->gl->ops->dpy_gl_cursor_dmabuf) {
-        con->gl->ops->dpy_gl_cursor_dmabuf(con->gl, dmabuf,
+    QLIST_FOREACH(dcl, &s->listeners, next) {
+        if (dcl->ops->dpy_gl_cursor_dmabuf) {
+            dcl->ops->dpy_gl_cursor_dmabuf(dcl, dmabuf,
                                            have_hot, hot_x, hot_y);
+        }
     }
 }
 
 void dpy_gl_cursor_position(QemuConsole *con,
                             uint32_t pos_x, uint32_t pos_y)
 {
-    assert(con->gl);
+    DisplayState *s = con->ds;
+    DisplayChangeListener *dcl;
 
-    if (con->gl->ops->dpy_gl_cursor_position) {
-        con->gl->ops->dpy_gl_cursor_position(con->gl, pos_x, pos_y);
+    QLIST_FOREACH(dcl, &s->listeners, next) {
+        if (dcl->ops->dpy_gl_cursor_position) {
+            dcl->ops->dpy_gl_cursor_position(dcl, pos_x, pos_y);
+        }
     }
 }
 
 void dpy_gl_release_dmabuf(QemuConsole *con,
                           QemuDmaBuf *dmabuf)
 {
-    assert(con->gl);
+    DisplayState *s = con->ds;
+    DisplayChangeListener *dcl;
 
-    if (con->gl->ops->dpy_gl_release_dmabuf) {
-        con->gl->ops->dpy_gl_release_dmabuf(con->gl, dmabuf);
+    QLIST_FOREACH(dcl, &s->listeners, next) {
+        if (dcl->ops->dpy_gl_release_dmabuf) {
+            dcl->ops->dpy_gl_release_dmabuf(dcl, dmabuf);
+        }
     }
 }
 
 void dpy_gl_update(QemuConsole *con,
                    uint32_t x, uint32_t y, uint32_t w, uint32_t h)
 {
+    DisplayState *s = con->ds;
+    DisplayChangeListener *dcl;
+
     assert(con->gl);
 
     graphic_hw_gl_block(con, true);
-    con->gl->ops->dpy_gl_update(con->gl, x, y, w, h);
+    QLIST_FOREACH(dcl, &s->listeners, next) {
+        dcl->ops->dpy_gl_update(dcl, x, y, w, h);
+    }
     graphic_hw_gl_block(con, false);
 }
 
-- 
2.34.1.8.g35151cf07204


