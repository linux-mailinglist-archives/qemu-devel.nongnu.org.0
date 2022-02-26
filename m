Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3004C55BF
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 12:58:32 +0100 (CET)
Received: from localhost ([::1]:43560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNviY-00046u-VG
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 06:58:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNvfs-00022M-56
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:55:44 -0500
Received: from [2607:f8b0:4864:20::102f] (port=41832
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNvfp-00043D-Uf
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:55:43 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so7219422pjb.0
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 03:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZiMwz4CLUHVQwB/T9EDfn/YLCqMyd2Smwt78yZWRpeo=;
 b=AQpKxolY+jmvrIAcwuW4Q5j87it2u7GvZ51eYOQWO5OZ0CAwny+tQHokxK/bwHV0qF
 gghMz3iM0K7MGDoy29eFn1Ji/t1qYxsz3HZvZ3ksCSM724gIAyLEz1MFcr1G1RQr9TLl
 V016pJBUCr2G3uh0wmWttf5Rtn1WLdAiNjVYpfeheiWs6M1AZO//qzyg3Fq9zJsi60Z6
 LTfKUtoqt4dV7Xxm3QciSv0uhF/cc3RsyouZZ3holFsa1xliqU5wQ8lufWa5nXRXt4YV
 fVZ/Bko53qzyLLxBoZ5cEceawnBQWXRkT2wVNXx22Sfet+hB2sLu1/GC1ANTZaJGzn25
 nkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZiMwz4CLUHVQwB/T9EDfn/YLCqMyd2Smwt78yZWRpeo=;
 b=T81+iU9kqT0FqCZeEz4wU607ycHzAe4YfIRXEIwssq+xQnXH/Ny3yHOSi3pQKXuZ1i
 hKLwNyht2ZSKhNGyofaxsL/rUP7eP+H0xO73wMt5oZxjXxxtnLC+GPYqpRVV9ZXc5GW7
 XDz43re6GcTQYUTSI6KB0sHJHUlY0EWhTBbGmUUK9HaJ3cNpwVJ1ZQ6HMvI5CLadQTLx
 OiXsGYsHDQpaByAy3Irj82SKX809xDKHKuN3XH5VjWlxVpNxQSmV560p48WZffjgYGef
 SD+i4unV7q5ND5U1CDT1w0pQ199fhezcpdmnsw4WLmTLOmO01BwSJ2FHRare5kck0o4P
 bcHg==
X-Gm-Message-State: AOAM533HeuRHXONH8srUup8xxZQ2HBKLTWNvFnoOoTvETxqcQm2ubOQL
 APXz80OnHHuSXy9QDiB2U3OiZaCKoH8=
X-Google-Smtp-Source: ABdhPJz/YbHQ3xbVnebcpB1Qyc25RMYaC59gB9DTVe0ZA/Fb3d5S0sNzZFhaZSt7b+KC/nesUruCaA==
X-Received: by 2002:a17:902:7e4b:b0:151:57d6:670f with SMTP id
 a11-20020a1709027e4b00b0015157d6670fmr129391pln.144.1645876540447; 
 Sat, 26 Feb 2022 03:55:40 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 pi16-20020a17090b1e5000b001bd1ffaf2basm1323761pjb.0.2022.02.26.03.55.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 03:55:40 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 2/3] ui: Deliver refresh rate via QemuUIInfo
Date: Sat, 26 Feb 2022 20:55:15 +0900
Message-Id: <20220226115516.59830-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220226115516.59830-1-akihiko.odaki@gmail.com>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change adds a new member, refresh_rate to QemuUIInfo in
include/ui/console.h. It represents the refresh rate of the
physical display backend, and it is more appropriate than
GUI update interval as the refresh rate which the emulated device
reports:
- sdl may set GUI update interval shorter than the refresh rate
  of the physical display to respond to user-generated events.
- sdl and vnc aggressively changes GUI update interval, but
  a guests is typically not designed to respond to frequent
  refresh rate changes, or frequent "display mode" changes in
  general. The frequency of refresh rate changes of the physical
  display backend matches better to the guest's expectation.

QemuUIInfo also has other members representing "display mode",
which makes it suitable for refresh rate representation. It has
a throttling of update notifications, and prevents frequent changes
of the display mode.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/display/xenfb.c   | 14 +++++++++++---
 include/ui/console.h |  2 +-
 include/ui/gtk.h     |  2 +-
 ui/console.c         |  6 ------
 ui/gtk-egl.c         |  4 ++--
 ui/gtk-gl-area.c     |  3 +--
 ui/gtk.c             | 45 +++++++++++++++++++++++++-------------------
 7 files changed, 42 insertions(+), 34 deletions(-)

diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 838260b6ad1..a53341ef673 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -777,16 +777,24 @@ static void xenfb_update(void *opaque)
     xenfb->up_fullscreen = 0;
 }
 
-static void xenfb_update_interval(void *opaque, uint64_t interval)
+static void xenfb_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
 {
     struct XenFB *xenfb = opaque;
+    uint32_t refresh_rate;
 
     if (xenfb->feature_update) {
 #ifdef XENFB_TYPE_REFRESH_PERIOD
         if (xenfb_queue_full(xenfb)) {
             return;
         }
-        xenfb_send_refresh_period(xenfb, interval);
+
+        refresh_rate = info->refresh_rate;
+        if (!refresh_rate) {
+            refresh_rate = 75;
+        }
+
+        /* T = 1 / f = 1 [s*Hz] / f = 1000*1000 [ms*mHz] / f */
+        xenfb_send_refresh_period(xenfb, 1000 * 1000 / refresh_rate);
 #endif
     }
 }
@@ -983,5 +991,5 @@ struct XenDevOps xen_framebuffer_ops = {
 static const GraphicHwOps xenfb_ops = {
     .invalidate  = xenfb_invalidate,
     .gfx_update  = xenfb_update,
-    .update_interval = xenfb_update_interval,
+    .ui_info     = xenfb_ui_info,
 };
diff --git a/include/ui/console.h b/include/ui/console.h
index 7f5374380f0..24f1dbec038 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -139,6 +139,7 @@ typedef struct QemuUIInfo {
     int       yoff;
     uint32_t  width;
     uint32_t  height;
+    uint32_t  refresh_rate;
 } QemuUIInfo;
 
 /* cursor data format is 32bit RGBA */
@@ -426,7 +427,6 @@ typedef struct GraphicHwOps {
     void (*gfx_update)(void *opaque);
     bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
     void (*text_update)(void *opaque, console_ch_t *text);
-    void (*update_interval)(void *opaque, uint64_t interval);
     void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
     void (*gl_block)(void *opaque, bool block);
 } GraphicHwOps;
diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 101b147d1b9..ae0f53740d1 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -155,7 +155,7 @@ extern bool gtk_use_gl_area;
 
 /* ui/gtk.c */
 void gd_update_windowsize(VirtualConsole *vc);
-int gd_monitor_update_interval(GtkWidget *widget);
+void gd_update_monitor_refresh_rate(VirtualConsole *vc, GtkWidget *widget);
 void gd_hw_gl_flushed(void *vc);
 
 /* ui/gtk-egl.c */
diff --git a/ui/console.c b/ui/console.c
index 40eebb6d2cc..63c5c207f0c 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -155,7 +155,6 @@ static void gui_update(void *opaque)
     uint64_t dcl_interval;
     DisplayState *ds = opaque;
     DisplayChangeListener *dcl;
-    QemuConsole *con;
 
     ds->refreshing = true;
     dpy_refresh(ds);
@@ -170,11 +169,6 @@ static void gui_update(void *opaque)
     }
     if (ds->update_interval != interval) {
         ds->update_interval = interval;
-        QTAILQ_FOREACH(con, &consoles, next) {
-            if (con->hw_ops->update_interval) {
-                con->hw_ops->update_interval(con->hw, interval);
-            }
-        }
         trace_console_refresh(interval);
     }
     ds->last_update = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index e3bd4bc2743..b5bffbab252 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -140,8 +140,8 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
-    vc->gfx.dcl.update_interval = gd_monitor_update_interval(
-            vc->window ? vc->window : vc->gfx.drawing_area);
+    gd_update_monitor_refresh_rate(
+            vc, vc->window ? vc->window : vc->gfx.drawing_area);
 
     if (!vc->gfx.esurface) {
         gd_egl_init(vc);
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index fc5a082eb84..0113474ef5f 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -121,8 +121,7 @@ void gd_gl_area_refresh(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
-    vc->gfx.dcl.update_interval = gd_monitor_update_interval(
-            vc->window ? vc->window : vc->gfx.drawing_area);
+    gd_update_monitor_refresh_rate(vc, vc->window ? vc->window : vc->gfx.drawing_area);
 
     if (!vc->gfx.gls) {
         if (!gtk_widget_get_realized(vc->gfx.drawing_area)) {
diff --git a/ui/gtk.c b/ui/gtk.c
index a8567b9ddc8..7d904141af0 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -696,11 +696,20 @@ static gboolean gd_window_close(GtkWidget *widget, GdkEvent *event,
     return TRUE;
 }
 
-static void gd_set_ui_info(VirtualConsole *vc, gint width, gint height)
+static void gd_set_ui_refresh_rate(VirtualConsole *vc, int refresh_rate)
 {
     QemuUIInfo info;
 
-    memset(&info, 0, sizeof(info));
+    info = *dpy_get_ui_info(vc->gfx.dcl.con);
+    info.refresh_rate = refresh_rate;
+    dpy_set_ui_info(vc->gfx.dcl.con, &info, true);
+}
+
+static void gd_set_ui_size(VirtualConsole *vc, gint width, gint height)
+{
+    QemuUIInfo info;
+
+    info = *dpy_get_ui_info(vc->gfx.dcl.con);
     info.width = width;
     info.height = height;
     dpy_set_ui_info(vc->gfx.dcl.con, &info, true);
@@ -724,33 +733,32 @@ static void gd_resize_event(GtkGLArea *area,
 {
     VirtualConsole *vc = (void *)opaque;
 
-    gd_set_ui_info(vc, width, height);
+    gd_set_ui_size(vc, width, height);
 }
 
 #endif
 
-/*
- * If available, return the update interval of the monitor in ms,
- * else return 0 (the default update interval).
- */
-int gd_monitor_update_interval(GtkWidget *widget)
+void gd_update_monitor_refresh_rate(VirtualConsole *vc, GtkWidget *widget)
 {
 #ifdef GDK_VERSION_3_22
     GdkWindow *win = gtk_widget_get_window(widget);
+    int refresh_rate;
 
     if (win) {
         GdkDisplay *dpy = gtk_widget_get_display(widget);
         GdkMonitor *monitor = gdk_display_get_monitor_at_window(dpy, win);
-        int refresh_rate = gdk_monitor_get_refresh_rate(monitor); /* [mHz] */
-
-        if (refresh_rate) {
-            /* T = 1 / f = 1 [s*Hz] / f = 1000*1000 [ms*mHz] / f */
-            return MIN(1000 * 1000 / refresh_rate,
-                       GUI_REFRESH_INTERVAL_DEFAULT);
-        }
+        refresh_rate = gdk_monitor_get_refresh_rate(monitor); /* [mHz] */
+    } else {
+        refresh_rate = 0;
     }
+
+    gd_set_ui_refresh_rate(vc, refresh_rate);
+
+    /* T = 1 / f = 1 [s*Hz] / f = 1000*1000 [ms*mHz] / f */
+    vc->gfx.dcl.update_interval = refresh_rate ?
+        MIN(1000 * 1000 / refresh_rate, GUI_REFRESH_INTERVAL_DEFAULT) :
+        GUI_REFRESH_INTERVAL_DEFAULT;
 #endif
-    return 0;
 }
 
 static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
@@ -787,8 +795,7 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
         return FALSE;
     }
 
-    vc->gfx.dcl.update_interval =
-        gd_monitor_update_interval(vc->window ? vc->window : s->window);
+    gd_update_monitor_refresh_rate(vc, vc->window ? vc->window : s->window);
 
     fbw = surface_width(vc->gfx.ds);
     fbh = surface_height(vc->gfx.ds);
@@ -1673,7 +1680,7 @@ static gboolean gd_configure(GtkWidget *widget,
 {
     VirtualConsole *vc = opaque;
 
-    gd_set_ui_info(vc, cfg->width, cfg->height);
+    gd_set_ui_size(vc, cfg->width, cfg->height);
     return FALSE;
 }
 
-- 
2.32.0 (Apple Git-132)


