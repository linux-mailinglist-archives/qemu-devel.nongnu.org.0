Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49519320A9A
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 14:39:05 +0100 (CET)
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDowy-0006ch-D3
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 08:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDosY-00038L-Tb
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 08:34:30 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDosW-0001X9-Jm
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 08:34:30 -0500
Received: by mail-pf1-x42f.google.com with SMTP id k13so4898491pfh.13
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 05:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gZAKh0kV5+3TZoFtekzuyQxJDLVOXyNYG3XsThFGRQQ=;
 b=bOyT01PkAVMcGws32dlX2ZJpbbsVNvYuuvmQG7V0VuruvU+EE+YxxxXlApjQgXgyRp
 B3UtLnEKSSXtuekbzfSHaf0jA+YfyXvx/xVR7wXujWYp0JJDAJq6owLJF9YsMY2D6S5s
 ZmsT/u35BB42HK5QzUd7G/jWlsJkxtADVjYY5cC8RwsqbBbaKBkrdGK3qiFUiaWj9sQE
 Kyy2c0DqqoBUBzqY3jUedj+0XeFKi1+k6/f75j7mYev85gzx5sk83XEqvI3lPen3iwUc
 sZHxJFGKdO8v6L7zL19XBy3JSO7dLmIXPCak6JXwMdoL9Vo7sCqPDywvkGRbs4It9TpB
 bDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gZAKh0kV5+3TZoFtekzuyQxJDLVOXyNYG3XsThFGRQQ=;
 b=OcLHGiu5/yBe0ZjnK/Hl09nhlRN36a3YoVcFvjs3/D032ce6eHeApLwdCXeaIjrWBW
 2Fbn+ncMIyb1Fysnyi+/xOy4XEVNED1pznxrIKfE30FqShSSemzu+romaHuhHDECUL98
 I6DAJa8LX3auKcyfYlbaXXnTPZRqegx6RjNXHKouRmJMydnKsR5cFYolBsfKix708TEb
 k617nL3wsXJaWSY0+6Z8eaqvVVH2R2jOiSUQMngmTH93itwjALBEv8c7BAwYH0+Q9t7w
 AA0HiTgO3yvpYGDxTc7ew0b62g/HFK4BJQACPvQGiX/POEEL8IAoiJj1957tRBG5QboA
 e8tw==
X-Gm-Message-State: AOAM530phEyIaYld+vnMuzD4ckIfRBehpE8ww/5UdXdFX4eeDF4BvYXh
 FBt/+PeGz1pZk5zjNTsandslgg9QpCyA/A==
X-Google-Smtp-Source: ABdhPJz50uxcbgxnB7g1S2MaX9c71eoHuxrr1egAiaqVjAm93b+9QTP+nhRjiWB5zbBhw5kkMGYGvQ==
X-Received: by 2002:aa7:8742:0:b029:1ed:4d14:7513 with SMTP id
 g2-20020aa787420000b02901ed4d147513mr10165627pfo.66.1613914464692; 
 Sun, 21 Feb 2021 05:34:24 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:b418:f77:22b4:17c9])
 by smtp.gmail.com with ESMTPSA id 134sm16204899pfc.113.2021.02.21.05.34.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Feb 2021 05:34:24 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] virtio-gpu: Respect graphics update interval for EDID
Date: Sun, 21 Feb 2021 22:34:14 +0900
Message-Id: <20210221133414.7262-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42f.google.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change introduces an additional member, refresh_rate to
qemu_edid_info in include/hw/display/edid.h.

This change also isolates the graphics update interval from the
display update interval. The guest will update the frame buffer
in the graphics update interval, but displays can be updated in a
dynamic interval, for example to save update costs aggresively
(vnc) or to respond to user-generated events (sdl).
It stabilizes the graphics update interval and prevents the guest
from being confused.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/display/edid-generate.c     |  7 ++++---
 hw/display/virtio-gpu-base.c   | 11 +++++++++++
 hw/display/virtio-gpu.c        |  1 +
 hw/display/xenfb.c             |  2 +-
 include/hw/display/edid.h      |  1 +
 include/hw/virtio/virtio-gpu.h |  2 ++
 include/ui/console.h           |  3 ++-
 ui/console.c                   | 21 ++++++++++++++++-----
 ui/gtk.c                       |  2 +-
 9 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 1665b7cbb29..7317e68506b 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -203,7 +203,7 @@ static void edid_desc_dummy(uint8_t *desc)
     edid_desc_type(desc, 0x10);
 }
 
-static void edid_desc_timing(uint8_t *desc,
+static void edid_desc_timing(uint8_t *desc, uint32_t refresh_rate,
                              uint32_t xres, uint32_t yres,
                              uint32_t xmm, uint32_t ymm)
 {
@@ -216,7 +216,7 @@ static void edid_desc_timing(uint8_t *desc,
     uint32_t ysync  = yres *  5 / 1000;
     uint32_t yblank = yres * 35 / 1000;
 
-    uint32_t clock  = 75 * (xres + xblank) * (yres + yblank);
+    uint32_t clock  = refresh_rate * (xres + xblank) * (yres + yblank);
 
     stl_le_p(desc, clock / 10000);
 
@@ -303,6 +303,7 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     uint8_t *xtra3 = NULL;
     uint8_t *dta = NULL;
     uint32_t width_mm, height_mm;
+    uint32_t refresh_rate = info->refresh_rate ? info->refresh_rate : 75;
     uint32_t dpi = 100; /* if no width_mm/height_mm */
 
     /* =============== set defaults  =============== */
@@ -400,7 +401,7 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
     /* =============== descriptor blocks =============== */
 
-    edid_desc_timing(edid + desc, info->prefx, info->prefy,
+    edid_desc_timing(edid + desc, refresh_rate, info->prefx, info->prefy,
                      width_mm, height_mm);
     desc += 18;
 
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 4a57350917c..41b08b2e944 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -96,6 +96,16 @@ static int virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
     return 0;
 }
 
+static void virtio_gpu_update_display_interval(void *opaque, uint64_t interval)
+{
+    VirtIOGPUBase *g = opaque;
+
+    g->refresh_rate = 1000 / interval;
+
+    /* send event to guest */
+    virtio_gpu_notify_event(g, VIRTIO_GPU_EVENT_DISPLAY);
+}
+
 static void
 virtio_gpu_gl_flushed(void *opaque)
 {
@@ -142,6 +152,7 @@ static const GraphicHwOps virtio_gpu_ops = {
     .invalidate = virtio_gpu_invalidate_display,
     .gfx_update = virtio_gpu_update_display,
     .text_update = virtio_gpu_text_update,
+    .gfx_update_interval = virtio_gpu_update_display_interval,
     .ui_info = virtio_gpu_ui_info,
     .gl_block = virtio_gpu_gl_block,
     .gl_flushed = virtio_gpu_gl_flushed,
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 2e4a9822b6a..64fdc5a6e89 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -216,6 +216,7 @@ virtio_gpu_generate_edid(VirtIOGPU *g, int scanout,
         .height_mm = b->req_state[scanout].height_mm,
         .prefx = b->req_state[scanout].width,
         .prefy = b->req_state[scanout].height,
+        .refresh_rate = b->refresh_rate,
     };
 
     edid->size = cpu_to_le32(sizeof(edid->edid));
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 838260b6ad1..4229f9a42df 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -983,5 +983,5 @@ struct XenDevOps xen_framebuffer_ops = {
 static const GraphicHwOps xenfb_ops = {
     .invalidate  = xenfb_invalidate,
     .gfx_update  = xenfb_update,
-    .update_interval = xenfb_update_interval,
+    .gfx_update_interval = xenfb_update_interval,
 };
diff --git a/include/hw/display/edid.h b/include/hw/display/edid.h
index 1f8fc9b3750..9617705cc0a 100644
--- a/include/hw/display/edid.h
+++ b/include/hw/display/edid.h
@@ -11,6 +11,7 @@ typedef struct qemu_edid_info {
     uint32_t    prefy;
     uint32_t    maxx;
     uint32_t    maxy;
+    uint32_t    refresh_rate;
 } qemu_edid_info;
 
 void qemu_edid_generate(uint8_t *edid, size_t size,
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index fae149235c5..9d1a547ba10 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -116,6 +116,8 @@ struct VirtIOGPUBase {
 
     int enabled_output_bitmask;
     struct virtio_gpu_requested_state req_state[VIRTIO_GPU_MAX_SCANOUTS];
+
+    uint32_t refresh_rate;
 };
 
 struct VirtIOGPUBaseClass {
diff --git a/include/ui/console.h b/include/ui/console.h
index d30e972d0b5..0bcb610b80a 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -246,6 +246,7 @@ typedef struct DisplayChangeListenerOps {
 } DisplayChangeListenerOps;
 
 struct DisplayChangeListener {
+    uint64_t gfx_update_interval;
     uint64_t update_interval;
     const DisplayChangeListenerOps *ops;
     DisplayState *ds;
@@ -384,7 +385,7 @@ typedef struct GraphicHwOps {
     void (*gfx_update)(void *opaque);
     bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
     void (*text_update)(void *opaque, console_ch_t *text);
-    void (*update_interval)(void *opaque, uint64_t interval);
+    void (*gfx_update_interval)(void *opaque, uint64_t interval);
     int (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
     void (*gl_block)(void *opaque, bool block);
     void (*gl_flushed)(void *opaque);
diff --git a/ui/console.c b/ui/console.c
index c5d11bc7017..928fb009db1 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -176,6 +176,7 @@ struct QemuConsole {
 struct DisplayState {
     QEMUTimer *gui_timer;
     uint64_t last_update;
+    uint64_t gfx_update_interval;
     uint64_t update_interval;
     bool refreshing;
     bool have_gfx;
@@ -200,6 +201,7 @@ static void text_console_update_cursor(void *opaque);
 static void gui_update(void *opaque)
 {
     uint64_t interval = GUI_REFRESH_INTERVAL_IDLE;
+    uint64_t gfx_interval = GUI_REFRESH_INTERVAL_DEFAULT;
     uint64_t dcl_interval;
     DisplayState *ds = opaque;
     DisplayChangeListener *dcl;
@@ -209,20 +211,29 @@ static void gui_update(void *opaque)
     dpy_refresh(ds);
     ds->refreshing = false;
 
+    QLIST_FOREACH(dcl, &ds->listeners, next) {
+        if (dcl->gfx_update_interval &&
+            gfx_interval > dcl->gfx_update_interval) {
+            gfx_interval = dcl->gfx_update_interval;
+        }
+    }
     QLIST_FOREACH(dcl, &ds->listeners, next) {
         dcl_interval = dcl->update_interval ?
-            dcl->update_interval : GUI_REFRESH_INTERVAL_DEFAULT;
+            dcl->update_interval : gfx_interval;
         if (interval > dcl_interval) {
             interval = dcl_interval;
         }
     }
-    if (ds->update_interval != interval) {
-        ds->update_interval = interval;
+    if (ds->gfx_update_interval != gfx_interval) {
+        ds->gfx_update_interval = gfx_interval;
         QTAILQ_FOREACH(con, &consoles, next) {
-            if (con->hw_ops->update_interval) {
-                con->hw_ops->update_interval(con->hw, interval);
+            if (con->hw_ops->gfx_update_interval) {
+                con->hw_ops->gfx_update_interval(con->hw, gfx_interval);
             }
         }
+    }
+    if (ds->update_interval != interval) {
+        ds->update_interval = interval;
         trace_console_refresh(interval);
     }
     ds->last_update = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
diff --git a/ui/gtk.c b/ui/gtk.c
index 79dc2401203..53f68b0bdaf 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -810,7 +810,7 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
         return FALSE;
     }
 
-    vc->gfx.dcl.update_interval =
+    vc->gfx.dcl.gfx_update_interval =
         gd_monitor_update_interval(vc->window ? vc->window : s->window);
 
     fbw = surface_width(vc->gfx.ds);
-- 
2.24.3 (Apple Git-128)


