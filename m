Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1594431F73D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:20:59 +0100 (CET)
Received: from localhost ([::1]:40150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2u9-0003pZ-11
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD2qp-0001oc-4A
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:17:31 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:35840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD2qn-0005P7-0b
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:17:30 -0500
Received: by mail-pj1-x1042.google.com with SMTP id s23so594235pji.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 02:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2D60lYEZ5mfQBO9IU9JQ6lUlEl5nVniMmUXqjYLFubc=;
 b=nKONgOfWH9NRS++yUmbZ5xxqzJA8bnEzAjC/Y3MUl23mNmkG9CNuWdYuE9MMEx3NBW
 kyW0z2PAFv2mJokBNrclQDuiPzfVWaq0EXZP1zqqbakl5x3kcvy4Vts1t1LyCNyumwKS
 UQftF5Vsnp4UH00GUXfjlxHM4WTi+hs5t70CX2KTU+MHspO9peaMSUQR1Ty18+TC4xN1
 xwbpFmZqa9rST2jFWi6aTGNIS7haqZLInn0IvFNIsHgePtVf0TTNQouPl2y2hrvJp/sV
 OYS4odDvokxX9wzKpqpmmO/Bl1qT0skB/SFPe5isqS21SU5Q29F7XrcM74a3lIgrGpqK
 BzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2D60lYEZ5mfQBO9IU9JQ6lUlEl5nVniMmUXqjYLFubc=;
 b=h0SWG92CHfto11em38pBiUScp7D/bDl40QRbJA7lncuSvi8nlKzIRTgwWhFqyjFr4O
 +Nmr8PIY3kgnBKNvbam9RmqcFHdLuoxoqSMRFhXlDtWFA6bF4vCuGxYV5YmgdP29BCNZ
 9SEmn4IxxgpLgQ2DZSKCZ/ewcXosprOIvN4auFulk+52v4B1lBn0Zx32rSEAupwippb1
 1SWxLcw75x2/qAqMf6nQhGweVQlAWCOMhHlr/UT66PTLPqjmU/GmBfSLBOIEJVKSTlY9
 07IjhxDLycSaK9tetlELGWRWZGEcQwUpLIUjUWTfGgqzMATD7rnvQR70Yp15yQaOcfd5
 7JNA==
X-Gm-Message-State: AOAM533Fp837AAcZaZyefdlyFgUWEApxua2bEHa9QRkl1gD+TzaAKOwX
 dgpVC2rFT6T+Md9CgGqHX/XPO6k58Zn3dw==
X-Google-Smtp-Source: ABdhPJwD+cZa/kxXqTyxgyfXiHI3wDW2r60kN7r0iOzllNMxqOWlP3wLXrlImzrMmmRNa4M3/Hlmmg==
X-Received: by 2002:a17:90a:1a16:: with SMTP id
 22mr8788688pjk.34.1613729847223; 
 Fri, 19 Feb 2021 02:17:27 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id u10sm8365080pjr.27.2021.02.19.02.17.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 02:17:26 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/console: Assert graphic console surface is not NULL
Date: Fri, 19 Feb 2021 19:17:02 +0900
Message-Id: <20210219101702.91002-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1042.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ui/console used to accept NULL as graphic console surface, but its
semantics was inconsistent among displays:
- cocoa and gtk-egl perform NULL dereference.
- egl-headless, spice and spice-egl do nothing.
- gtk releases underlying resources.
- sdl2-2d and sdl2-gl destroys the window.
- vnc shows a message, "Display output is not active."

Fortunately, there are only three cases where NULL is assigned as
graphic console surface, and we can study them to figure out the
desired behavior:
- virtio-gpu-base assigns NULL when the device is realized.
  We have nothing to do in the case because graphic consoles
  already have a surface with a message saying the content is
  not initializd yet.
- virtio-gpu-3d assigns NULL when the device is reset. The initial
  graphic console surfaces shows a message, so it would be
  appropriate to do similar.
- virtio-gpu-3d assigns NULL when scanout is disabled. That
  affects its operations later but itself do not mean any effects
  on displays. Removing the operation should be fine.

This change eliminates NULL as graphic console surface by
implementing those behaviors.

An assertion is added and NULL checks are removed in ui/console
to prevent NULL from being set again. However, this do not change
any references except those in ui/console because there are too
many of them to fix for a mere motal.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/display/virtio-gpu-3d.c   | 11 ++++++-----
 hw/display/virtio-gpu-base.c |  3 ---
 ui/console.c                 | 31 +++++++++----------------------
 3 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
index 0b0c11474dd..4cf1901b47f 100644
--- a/hw/display/virtio-gpu-3d.c
+++ b/hw/display/virtio-gpu-3d.c
@@ -179,10 +179,6 @@ static void virgl_cmd_set_scanout(VirtIOGPU *g,
             info.width, info.height,
             ss.r.x, ss.r.y, ss.r.width, ss.r.height);
     } else {
-        if (ss.scanout_id != 0) {
-            dpy_gfx_replace_surface(
-                g->parent_obj.scanout[ss.scanout_id].con, NULL);
-        }
         dpy_gl_scanout_disable(g->parent_obj.scanout[ss.scanout_id].con);
     }
     g->parent_obj.scanout[ss.scanout_id].resource_id = ss.resource_id;
@@ -596,7 +592,12 @@ void virtio_gpu_virgl_reset(VirtIOGPU *g)
     virgl_renderer_reset();
     for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
         if (i != 0) {
-            dpy_gfx_replace_surface(g->parent_obj.scanout[i].con, NULL);
+            DisplaySurface *surface =
+                qemu_create_message_surface(g->parent_obj.conf.xres,
+                                            g->parent_obj.conf.yres,
+                                            "Guest reset display.");
+
+            dpy_gfx_replace_surface(g->parent_obj.scanout[i].con, surface);
         }
         dpy_gl_scanout_disable(g->parent_obj.scanout[i].con);
     }
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 40ccd00f942..abc5fc89b9b 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -168,9 +168,6 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
     for (i = 0; i < g->conf.max_outputs; i++) {
         g->scanout[i].con =
             graphic_console_init(DEVICE(g), i, &virtio_gpu_ops, g);
-        if (i > 0) {
-            dpy_gfx_replace_surface(g->scanout[i].con, NULL);
-        }
     }
 
     return true;
diff --git a/ui/console.c b/ui/console.c
index d80ce7037c3..bc300182c84 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1099,10 +1099,8 @@ void console_select(unsigned int index)
                     dcl->ops->dpy_gfx_switch(dcl, s->surface);
                 }
             }
-            if (s->surface) {
-                dpy_gfx_update(s, 0, 0, surface_width(s->surface),
-                               surface_height(s->surface));
-            }
+            dpy_gfx_update(s, 0, 0, surface_width(s->surface),
+                           surface_height(s->surface));
         }
         if (ds->have_text) {
             dpy_text_resize(s, s->width, s->height);
@@ -1587,13 +1585,9 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
-    int width = w;
-    int height = h;
+    int width = surface_width(con->surface);
+    int height = surface_height(con->surface);
 
-    if (con->surface) {
-        width = surface_width(con->surface);
-        height = surface_height(con->surface);
-    }
     x = MAX(x, 0);
     y = MAX(y, 0);
     x = MIN(x, width);
@@ -1616,9 +1610,6 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
 
 void dpy_gfx_update_full(QemuConsole *con)
 {
-    if (!con->surface) {
-        return;
-    }
     dpy_gfx_update(con, 0, 0,
                    surface_width(con->surface),
                    surface_height(con->surface));
@@ -1631,7 +1622,8 @@ void dpy_gfx_replace_surface(QemuConsole *con,
     DisplaySurface *old_surface = con->surface;
     DisplayChangeListener *dcl;
 
-    assert(old_surface != surface || surface == NULL);
+    assert(surface);
+    assert(old_surface != surface);
 
     con->surface = surface;
     QLIST_FOREACH(dcl, &s->listeners, next) {
@@ -1976,13 +1968,8 @@ void graphic_console_close(QemuConsole *con)
     static const char unplugged[] =
         "Guest display has been unplugged";
     DisplaySurface *surface;
-    int width = 640;
-    int height = 480;
-
-    if (con->surface) {
-        width = surface_width(con->surface);
-        height = surface_height(con->surface);
-    }
+    int width = surface_width(con->surface);
+    int height = surface_height(con->surface);
 
     trace_console_gfx_close(con->index);
     object_property_set_link(OBJECT(con), "device", NULL, &error_abort);
@@ -2293,7 +2280,7 @@ void qemu_console_resize(QemuConsole *s, int width, int height)
 
     assert(s->console_type == GRAPHIC_CONSOLE);
 
-    if (s->surface && (s->surface->flags & QEMU_ALLOCATED_FLAG) &&
+    if ((s->surface->flags & QEMU_ALLOCATED_FLAG) &&
         pixman_image_get_width(s->surface->image) == width &&
         pixman_image_get_height(s->surface->image) == height) {
         return;
-- 
2.24.3 (Apple Git-128)


