Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFC4427D9D
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:22:59 +0200 (CEST)
Received: from localhost ([::1]:44122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJo2-0003of-Jk
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJeE-000392-25
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:12:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJeC-0000Hc-Hj
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0SxvZ7jR1mJPsjgZM9ZR/VTmW4G4ebInFaaukMmKsQU=;
 b=AdTnkFFuDaotPVfJDaEbEJ537bLWWztZfQ5LnwpHOtGjyt8GWANNf93HoI5KDDeimaZJK0
 s11ee+S2LjHkdyy3TbQc26yzKPNOKySQFtvlQnDP/oKRKC06x2Cs8y8MlffAl6nTrSr2Vg
 0j7xP9mYNmVSwaFXSzZTg4IGlft5tsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-V4f6iVAFOdScGsw-ZMF6dA-1; Sat, 09 Oct 2021 17:12:36 -0400
X-MC-Unique: V4f6iVAFOdScGsw-ZMF6dA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36E3B10A8E01
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:12:36 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6C5F6091B;
 Sat,  9 Oct 2021 21:12:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/37] ui: dispatch GL events to all listeners
Date: Sun, 10 Oct 2021 01:08:17 +0400
Message-Id: <20211009210838.2219430-17-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

For now, only one listener can receive GL events. Let's dispatch to all
listeners. (preliminary check ensure there is a single listener now
during regitration, and in next patches, compatible listeners only)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c | 58 +++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 16 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 016ace5029..75e432106b 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1882,8 +1882,12 @@ int dpy_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx)
 
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
@@ -1894,58 +1898,80 @@ void dpy_gl_scanout_texture(QemuConsole *con,
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
2.33.0.721.g106298f7f9


