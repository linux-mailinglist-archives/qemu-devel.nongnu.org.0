Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787D0443396
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:45:40 +0100 (CET)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwuo-0004fy-QK
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwcV-0005ep-HR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwcQ-0002Zw-MX
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635870398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSsGgs5Jo4tIUzNzGDQe9LzsGenMwsKHMGXR5WSVwbo=;
 b=OoHPBDT4leBFpeYc3RWRbWaOQ+x/cG+LYveZSQ+Wwa6LdtOkaac/ykF3QNb8OK18l/Wf2w
 3etNqV1g6zAIPxVEzt4vvJFa1osa7qOHDA8W37XaS5IW4D1l6lpYsVorGvYYokRXKN01+7
 Gv/XQbt9bn7XVSV8fwV4u3rAJn/yIUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-_rKmQzfgPoyinFgrAb20hA-1; Tue, 02 Nov 2021 12:26:35 -0400
X-MC-Unique: _rKmQzfgPoyinFgrAb20hA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 216981B2C984;
 Tue,  2 Nov 2021 16:26:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10D051B5C2;
 Tue,  2 Nov 2021 16:26:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CF4F91801AB8; Tue,  2 Nov 2021 17:26:19 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] ui/gtk: skip any extra draw of same guest scanout blob
 res
Date: Tue,  2 Nov 2021 17:26:14 +0100
Message-Id: <20211102162619.2760593-6-kraxel@redhat.com>
In-Reply-To: <20211102162619.2760593-1-kraxel@redhat.com>
References: <20211102162619.2760593-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dongwon Kim <dongwon.kim@intel.com>

Any extra draw call for the same blob resource representing guest scanout
before the previous drawing is not finished can break synchronous draw
sequence. To prevent this, drawing is now done only once for each draw
submission (when draw_submitted == true).

v2:
 - removed mutex
 - updated commit msg

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Message-Id: <20210924225105.24930-1-dongwon.kim@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h            |  1 +
 hw/display/virtio-gpu-udmabuf.c |  2 +-
 ui/gtk-egl.c                    | 40 ++++++++++++++++++---------
 ui/gtk-gl-area.c                | 49 ++++++++++++++++++++-------------
 4 files changed, 59 insertions(+), 33 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 244664d727a4..b6bedc5f4152 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -171,6 +171,7 @@ typedef struct QemuDmaBuf {
     void      *sync;
     int       fence_fd;
     bool      allow_fences;
+    bool      draw_submitted;
 } QemuDmaBuf;
 
 typedef struct DisplayState DisplayState;
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index c6f7f587847f..60ea7f8f4972 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -186,7 +186,7 @@ static VGPUDMABuf
     dmabuf->buf.fourcc = qemu_pixman_to_drm_format(fb->format);
     dmabuf->buf.fd = res->dmabuf_fd;
     dmabuf->buf.allow_fences = true;
-
+    dmabuf->buf.draw_submitted = false;
     dmabuf->scanout_id = scanout_id;
     QTAILQ_INSERT_HEAD(&g->dmabuf.bufs, dmabuf, next);
 
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 72ce5e1f8f41..e912b200755a 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -63,6 +63,9 @@ void gd_egl_init(VirtualConsole *vc)
 void gd_egl_draw(VirtualConsole *vc)
 {
     GdkWindow *window;
+#ifdef CONFIG_GBM
+    QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
+#endif
     int ww, wh;
 
     if (!vc->gfx.gls) {
@@ -74,10 +77,31 @@ void gd_egl_draw(VirtualConsole *vc)
     wh = gdk_window_get_height(window);
 
     if (vc->gfx.scanout_mode) {
+#ifdef CONFIG_GBM
+        if (dmabuf) {
+            if (!dmabuf->draw_submitted) {
+                return;
+            } else {
+                dmabuf->draw_submitted = false;
+            }
+        }
+#endif
         gd_egl_scanout_flush(&vc->gfx.dcl, 0, 0, vc->gfx.w, vc->gfx.h);
 
         vc->gfx.scale_x = (double)ww / vc->gfx.w;
         vc->gfx.scale_y = (double)wh / vc->gfx.h;
+
+        glFlush();
+#ifdef CONFIG_GBM
+        if (dmabuf) {
+            egl_dmabuf_create_fence(dmabuf);
+            if (dmabuf->fence_fd > 0) {
+                qemu_set_fd_handler(dmabuf->fence_fd, gd_hw_gl_flushed, NULL, vc);
+                return;
+            }
+            graphic_hw_gl_block(vc->gfx.dcl.con, false);
+        }
+#endif
     } else {
         if (!vc->gfx.ds) {
             return;
@@ -92,21 +116,10 @@ void gd_egl_draw(VirtualConsole *vc)
 
         vc->gfx.scale_x = (double)ww / surface_width(vc->gfx.ds);
         vc->gfx.scale_y = (double)wh / surface_height(vc->gfx.ds);
-    }
-
-    glFlush();
-#ifdef CONFIG_GBM
-    if (vc->gfx.guest_fb.dmabuf) {
-        QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
 
-        egl_dmabuf_create_fence(dmabuf);
-        if (dmabuf->fence_fd > 0) {
-            qemu_set_fd_handler(dmabuf->fence_fd, gd_hw_gl_flushed, NULL, vc);
-            return;
-        }
-        graphic_hw_gl_block(vc->gfx.dcl.con, false);
+        glFlush();
     }
-#endif
+
     graphic_hw_gl_flushed(vc->gfx.dcl.con);
 }
 
@@ -317,6 +330,7 @@ void gd_egl_flush(DisplayChangeListener *dcl,
 
     if (vc->gfx.guest_fb.dmabuf) {
         graphic_hw_gl_block(vc->gfx.dcl.con, true);
+        vc->gfx.guest_fb.dmabuf->draw_submitted = true;
         gtk_widget_queue_draw_area(area, x, y, w, h);
         return;
     }
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index afcb29f65823..461da7712f4f 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -38,6 +38,9 @@ static void gtk_gl_area_set_scanout_mode(VirtualConsole *vc, bool scanout)
 
 void gd_gl_area_draw(VirtualConsole *vc)
 {
+#ifdef CONFIG_GBM
+    QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
+#endif
     int ww, wh, y1, y2;
 
     if (!vc->gfx.gls) {
@@ -53,6 +56,16 @@ void gd_gl_area_draw(VirtualConsole *vc)
             return;
         }
 
+#ifdef CONFIG_GBM
+        if (dmabuf) {
+            if (!dmabuf->draw_submitted) {
+                return;
+            } else {
+                dmabuf->draw_submitted = false;
+            }
+        }
+#endif
+
         glBindFramebuffer(GL_READ_FRAMEBUFFER, vc->gfx.guest_fb.framebuffer);
         /* GtkGLArea sets GL_DRAW_FRAMEBUFFER for us */
 
@@ -62,6 +75,22 @@ void gd_gl_area_draw(VirtualConsole *vc)
         glBlitFramebuffer(0, y1, vc->gfx.w, y2,
                           0, 0, ww, wh,
                           GL_COLOR_BUFFER_BIT, GL_NEAREST);
+#ifdef CONFIG_GBM
+        if (dmabuf) {
+            egl_dmabuf_create_sync(dmabuf);
+        }
+#endif
+        glFlush();
+#ifdef CONFIG_GBM
+        if (dmabuf) {
+            egl_dmabuf_create_fence(dmabuf);
+            if (dmabuf->fence_fd > 0) {
+                qemu_set_fd_handler(dmabuf->fence_fd, gd_hw_gl_flushed, NULL, vc);
+                return;
+            }
+            graphic_hw_gl_block(vc->gfx.dcl.con, false);
+        }
+#endif
     } else {
         if (!vc->gfx.ds) {
             return;
@@ -72,25 +101,6 @@ void gd_gl_area_draw(VirtualConsole *vc)
         surface_gl_render_texture(vc->gfx.gls, vc->gfx.ds);
     }
 
-#ifdef CONFIG_GBM
-    if (vc->gfx.guest_fb.dmabuf) {
-        egl_dmabuf_create_sync(vc->gfx.guest_fb.dmabuf);
-    }
-#endif
-
-    glFlush();
-#ifdef CONFIG_GBM
-    if (vc->gfx.guest_fb.dmabuf) {
-        QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
-
-        egl_dmabuf_create_fence(dmabuf);
-        if (dmabuf->fence_fd > 0) {
-            qemu_set_fd_handler(dmabuf->fence_fd, gd_hw_gl_flushed, NULL, vc);
-            return;
-        }
-        graphic_hw_gl_block(vc->gfx.dcl.con, false);
-    }
-#endif
     graphic_hw_gl_flushed(vc->gfx.dcl.con);
 }
 
@@ -237,6 +247,7 @@ void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
 
     if (vc->gfx.guest_fb.dmabuf) {
         graphic_hw_gl_block(vc->gfx.dcl.con, true);
+        vc->gfx.guest_fb.dmabuf->draw_submitted = true;
     }
     gtk_gl_area_queue_render(GTK_GL_AREA(vc->gfx.drawing_area));
 }
-- 
2.31.1


