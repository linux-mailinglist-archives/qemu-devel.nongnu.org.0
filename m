Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3873D6986
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 00:29:03 +0200 (CEST)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m895q-0003UQ-Bq
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 18:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m894a-0001d3-QB
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 18:27:44 -0400
Received: from mga11.intel.com ([192.55.52.93]:11570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m894X-00072n-LG
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 18:27:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="209216061"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="209216061"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 15:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="474148865"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.215])
 by fmsmga008.fm.intel.com with ESMTP; 26 Jul 2021 15:27:37 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] ui/gtk: adds status bar for expressing ups and fps
Date: Mon, 26 Jul 2021 15:25:49 -0700
Message-Id: <20210726222551.28795-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.93; envelope-from=dongwon.kim@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With a display option, "show-fps=on", qemu adds a status bar and print
following performance numbers on the bar,

ups = update per seconds - the rate the guest scanout is updated.
fps = frame per seconds - the frame rate of VC's GL drawing area

One function, gd_gl_count_frame is added to count # frames
and calculate ups and fps every 100 frames or guest scanout updates.

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 include/ui/console.h |  4 +++-
 include/ui/gtk.h     |  2 ++
 qapi/ui.json         |  6 +++++-
 ui/console.c         |  6 ++++++
 ui/gtk.c             | 51 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index b30b63976a..3ca8d07220 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -243,7 +243,8 @@ typedef struct DisplayChangeListenerOps {
     /* required if GL */
     void (*dpy_gl_update)(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h);
-
+    /* optional */
+    void (*dpy_gl_count_frame)(DisplayChangeListener *dcl, bool ups);
 } DisplayChangeListenerOps;
 
 struct DisplayChangeListener {
@@ -314,6 +315,7 @@ void dpy_gl_release_dmabuf(QemuConsole *con,
                            QemuDmaBuf *dmabuf);
 void dpy_gl_update(QemuConsole *con,
                    uint32_t x, uint32_t y, uint32_t w, uint32_t h);
+void dpy_gl_count_frame(QemuConsole *con, bool ups);
 
 QEMUGLContext dpy_gl_ctx_create(QemuConsole *con,
                                 QEMUGLParams *params);
diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 9516670ebc..8d1a6c2cef 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -118,6 +118,7 @@ struct GtkDisplayState {
     GtkWidget *show_tabs_item;
     GtkWidget *untabify_item;
     GtkWidget *show_menubar_item;
+    GtkWidget *status_bar;
 
     GtkWidget *vbox;
     GtkWidget *notebook;
@@ -152,6 +153,7 @@ extern bool gtk_use_gl_area;
 /* ui/gtk.c */
 void gd_update_windowsize(VirtualConsole *vc);
 int gd_monitor_update_interval(GtkWidget *widget);
+void gd_gl_count_frame(DisplayChangeListener *dcl, bool ups);
 
 /* ui/gtk-egl.c */
 void gd_egl_init(VirtualConsole *vc);
diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c38..a0882d6428 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1035,13 +1035,17 @@
 #               assuming the guest will resize the display to match
 #               the window size then.  Otherwise it defaults to "off".
 #               Since 3.1
+# @show-fps:    Enable showing Guest Scanout's update rate (UPS) and
+#               Surface render swap rate (FPS) on a status bar (default: off).
+#               Since 6.0
 #
 # Since: 2.12
 #
 ##
 { 'struct'  : 'DisplayGTK',
   'data'    : { '*grab-on-hover' : 'bool',
-                '*zoom-to-fit'   : 'bool'  } }
+                '*zoom-to-fit'   : 'bool',
+                '*show-fps'      : 'bool'  } }
 
 ##
 # @DisplayEGLHeadless:
diff --git a/ui/console.c b/ui/console.c
index 2de5f4105b..31efdb0512 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1924,6 +1924,12 @@ void dpy_gl_update(QemuConsole *con,
     con->gl->ops->dpy_gl_update(con->gl, x, y, w, h);
 }
 
+void dpy_gl_count_frame(QemuConsole *con, bool ups)
+{
+    assert(con->gl);
+    con->gl->ops->dpy_gl_count_frame(con->gl, ups);
+}
+
 /***********************************************************/
 /* register display */
 
diff --git a/ui/gtk.c b/ui/gtk.c
index 98046f577b..091da08028 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -549,6 +549,47 @@ static void gd_switch(DisplayChangeListener *dcl,
     }
 }
 
+void gd_gl_count_frame(DisplayChangeListener *dcl, bool ups)
+{
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+    gchar ups_fps_str[100];
+    static guint prev, curr;
+    static guint ups_cnt, fps_cnt, status_bar_id;
+    struct timeval tv;
+
+    if (!vc->s->opts->show_fps) {
+        return;
+    }
+
+    if (prev == 0) {
+        gettimeofday(&tv, NULL);
+        prev = tv.tv_sec * 1000000 + tv.tv_usec;
+    }
+
+    if (ups) {
+        ups_cnt++;
+    } else {
+        fps_cnt++;
+    }
+
+    /* update rate is calculated for every 200 frames */
+    if (ups_cnt == 200 || fps_cnt == 200) {
+        gettimeofday(&tv, NULL);
+        curr = tv.tv_sec * 1000000 + tv.tv_usec;
+        prev = curr - prev;
+        sprintf(ups_fps_str, "UPS : %0.2f u/s  FPS : %0.2f f/s",
+                ups_cnt * 1000000/(gfloat)prev, fps_cnt * 1000000/(gfloat)prev);
+
+        status_bar_id = gtk_statusbar_get_context_id(GTK_STATUSBAR(vc->s->status_bar),
+                                                     "ups_fps_info");
+        gtk_statusbar_pop(GTK_STATUSBAR(vc->s->status_bar), status_bar_id);
+        gtk_statusbar_push(GTK_STATUSBAR(vc->s->status_bar), status_bar_id, ups_fps_str);
+        prev = curr;
+        fps_cnt = 0;
+        ups_cnt = 0;
+     }
+}
+
 static const DisplayChangeListenerOps dcl_ops = {
     .dpy_name             = "gtk",
     .dpy_gfx_update       = gd_update,
@@ -594,6 +635,7 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_gl_update           = gd_gl_area_scanout_flush,
     .dpy_gl_scanout_dmabuf   = gd_gl_area_scanout_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
+    .dpy_gl_count_frame      = gd_gl_count_frame,
 };
 
 #ifdef CONFIG_X11
@@ -618,6 +660,7 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_release_dmabuf   = gd_egl_release_dmabuf,
     .dpy_gl_update           = gd_egl_scanout_flush,
     .dpy_has_dmabuf          = gd_has_dmabuf,
+    .dpy_gl_count_frame      = gd_gl_count_frame,
 };
 
 #endif
@@ -2208,6 +2251,10 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     s->notebook = gtk_notebook_new();
     s->menu_bar = gtk_menu_bar_new();
 
+    if (opts->show_fps) {
+        s->status_bar = gtk_statusbar_new();
+    }
+
     s->free_scale = FALSE;
 
     /* Mostly LC_MESSAGES only. See early_gtk_display_init() for details. For
@@ -2248,6 +2295,10 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     gtk_box_pack_start(GTK_BOX(s->vbox), s->menu_bar, FALSE, TRUE, 0);
     gtk_box_pack_start(GTK_BOX(s->vbox), s->notebook, TRUE, TRUE, 0);
 
+    if (opts->show_fps) {
+        gtk_box_pack_start(GTK_BOX(s->vbox), s->status_bar, FALSE, TRUE, 0);
+    }
+
     gtk_container_add(GTK_CONTAINER(s->window), s->vbox);
 
     gtk_widget_show_all(s->window);
-- 
2.17.1


