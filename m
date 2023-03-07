Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA366ADE28
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:59:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVwP-0002IL-8T; Tue, 07 Mar 2023 06:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVwN-0002HG-4L
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVwL-00034B-HG
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678190229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4oW5umH4ZkRKjbUVDdAZ1ycDk5Po+5JIgilT0AKAMLg=;
 b=GgvKmQDT/9TggLerh/jQx/haMwVl7WysUuqAcwlHGdiaWkM7Gz6vc9Uj5X148TaYbBquj7
 lZ4y+/qKeaYpVcdVeoVAXBqEgmJnfGpq+D87KiBVxbLHoCiBVwM18seJ7cVupEUp7berbq
 qf3cTY7cYDhHIt8UnapGhAXEzcuR7ho=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-MgyFcWbKNBiIUvPAOk9K0Q-1; Tue, 07 Mar 2023 06:57:07 -0500
X-MC-Unique: MgyFcWbKNBiIUvPAOk9K0Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55852280AA23;
 Tue,  7 Mar 2023 11:57:07 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED0FF492C14;
 Tue,  7 Mar 2023 11:57:05 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 06/18] ui: rename cursor_{put->unref}
Date: Tue,  7 Mar 2023 15:56:25 +0400
Message-Id: <20230307115637.2464377-7-marcandre.lureau@redhat.com>
In-Reply-To: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

The naming is more conventional in QEMU.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h    | 2 +-
 hw/display/qxl-render.c | 4 ++--
 hw/display/qxl.c        | 2 +-
 hw/display/vmware_vga.c | 4 ++--
 ui/cursor.c             | 2 +-
 ui/dbus-listener.c      | 2 +-
 ui/spice-display.c      | 4 ++--
 ui/vnc.c                | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 1cb53acc33..3efd1f6b82 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -152,7 +152,7 @@ typedef struct QEMUCursor {
 
 QEMUCursor *cursor_alloc(int width, int height);
 void cursor_get(QEMUCursor *c);
-void cursor_put(QEMUCursor *c);
+void cursor_unref(QEMUCursor *c);
 QEMUCursor *cursor_builtin_hidden(void);
 QEMUCursor *cursor_builtin_left_ptr(void);
 void cursor_print_ascii_art(QEMUCursor *c, const char *prefix);
diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index fcfd40c3ac..ec99ec887a 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -290,7 +290,7 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl, QXLCursor *cursor,
     return c;
 
 fail:
-    cursor_put(c);
+    cursor_unref(c);
     return NULL;
 }
 
@@ -336,7 +336,7 @@ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
         }
         qemu_mutex_lock(&qxl->ssd.lock);
         if (qxl->ssd.cursor) {
-            cursor_put(qxl->ssd.cursor);
+            cursor_unref(qxl->ssd.cursor);
         }
         qxl->ssd.cursor = c;
         qxl->ssd.mouse_x = cmd->u.set.position.x;
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index ec712d3ca2..80ce1e9a93 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -299,7 +299,7 @@ void qxl_spice_reset_cursor(PCIQXLDevice *qxl)
     qxl->guest_cursor = 0;
     qemu_mutex_unlock(&qxl->track_lock);
     if (qxl->ssd.cursor) {
-        cursor_put(qxl->ssd.cursor);
+        cursor_unref(qxl->ssd.cursor);
     }
     qxl->ssd.cursor = cursor_builtin_hidden();
 }
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 59ae7f74b8..09591fbd39 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -550,12 +550,12 @@ static inline void vmsvga_cursor_define(struct vmsvga_state_s *s,
     default:
         fprintf(stderr, "%s: unhandled bpp %d, using fallback cursor\n",
                 __func__, c->bpp);
-        cursor_put(qc);
+        cursor_unref(qc);
         qc = cursor_builtin_left_ptr();
     }
 
     dpy_cursor_define(s->vga.con, qc);
-    cursor_put(qc);
+    cursor_unref(qc);
 }
 #endif
 
diff --git a/ui/cursor.c b/ui/cursor.c
index 835f0802f9..31b09bf058 100644
--- a/ui/cursor.c
+++ b/ui/cursor.c
@@ -111,7 +111,7 @@ void cursor_get(QEMUCursor *c)
     c->refcount++;
 }
 
-void cursor_put(QEMUCursor *c)
+void cursor_unref(QEMUCursor *c)
 {
     if (c == NULL)
         return;
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index 2dafd6569c..906ab296ca 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -345,7 +345,7 @@ static void dbus_cursor_define(DisplayChangeListener *dcl,
         c->data,
         c->width * c->height * 4,
         TRUE,
-        (GDestroyNotify)cursor_put,
+        (GDestroyNotify)cursor_unref,
         c);
 
     qemu_dbus_display1_listener_call_cursor_define(
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 16802f99cb..243a794638 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -464,7 +464,7 @@ void qemu_spice_cursor_refresh_bh(void *opaque)
         qemu_mutex_unlock(&ssd->lock);
         dpy_cursor_define(ssd->dcl.con, c);
         qemu_mutex_lock(&ssd->lock);
-        cursor_put(c);
+        cursor_unref(c);
     }
 
     if (ssd->mouse_x != -1 && ssd->mouse_y != -1) {
@@ -766,7 +766,7 @@ static void display_mouse_define(DisplayChangeListener *dcl,
 
     qemu_mutex_lock(&ssd->lock);
     cursor_get(c);
-    cursor_put(ssd->cursor);
+    cursor_unref(ssd->cursor);
     ssd->cursor = c;
     ssd->hot_x = c->hot_x;
     ssd->hot_y = c->hot_y;
diff --git a/ui/vnc.c b/ui/vnc.c
index d9eacad759..0bdcc3dfce 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1029,7 +1029,7 @@ static void vnc_dpy_cursor_define(DisplayChangeListener *dcl,
     VncDisplay *vd = container_of(dcl, VncDisplay, dcl);
     VncState *vs;
 
-    cursor_put(vd->cursor);
+    cursor_unref(vd->cursor);
     g_free(vd->cursor_mask);
 
     vd->cursor = c;
-- 
2.39.2


