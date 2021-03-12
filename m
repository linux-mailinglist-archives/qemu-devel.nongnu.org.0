Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8463389D5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:17:04 +0100 (CET)
Received: from localhost ([::1]:39738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeqt-0002OR-7a
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKedD-0008AA-6Q
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:02:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKedB-0002sG-6E
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QFp9zu36PTVBseYtJOmpGkX5LMTIvhKMevsrcnFy/sU=;
 b=ggZtgBFlwDoMw3A11weyWHAaA5EeQMakNvLLSm8IjqufDvnOkLr/oGmlekn7Xm2V1bdQ9/
 ijLnFVFCtV2Zp9WXH0BieKcE85fp18otWB7Wtwhd+Stq77ymTIyaste1upGc29qnIeXUpL
 DaXUbA7kKzFLmAAJa78I4CJH+042reE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-iNJwbOu3MPeGb3dBEAecNQ-1; Fri, 12 Mar 2021 05:02:50 -0500
X-MC-Unique: iNJwbOu3MPeGb3dBEAecNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77A1C19200C0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:02:49 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C00A610AE;
 Fri, 12 Mar 2021 10:02:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 10/27] ui: dispatch GL events to all listeners
Date: Fri, 12 Mar 2021 14:00:51 +0400
Message-Id: <20210312100108.2706195-11-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Gerd Hoffmann <kraxel@redhat.com>
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
index 18311707bd..a0910671f7 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1883,8 +1883,12 @@ int dpy_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx)
 
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
@@ -1895,58 +1899,80 @@ void dpy_gl_scanout_texture(QemuConsole *con,
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
2.29.0


