Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E43562EBA3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 03:06:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovqkq-0007sF-6b; Thu, 17 Nov 2022 21:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqkn-0007rF-4U
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:17 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqkk-0008SK-H1
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668737114; x=1700273114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bNBtkT8BrPXRhVh5qBorPneLzYO3BEyvd/5ZN2v2bOw=;
 b=Q3F8p414kKGJSZPf7rDZPcyFLCgMXWlNiAvtKG0ws4fU6PTN/hcmJBds
 1z9kXnH78qgOqR1LikgjbQcskHF/Ghww4b+SdT8s57M+lTq9b0aP49J6i
 PvKiiGWyzSUZ3fGml9ygRGBaQFOQrjCoK064f8p6+Yr3gBwGQVmMiRn2I
 iuJZYSo76ZK7UCjk5w11ThkWOhVkmS06BQj7U14E++NtciWiye8HPEPKf
 69w3T2maTSNQlWg2pjX3zcURNXmouwvf/j3loj9iUZaQzcHWN1yuB7a99
 YWNsPi2pY/eSqNkeBhoX8NGDPFNIMxdxG2VIvshX5BjJX8CyNcM21Kqdw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="296393528"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="296393528"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="634270861"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="634270861"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:05 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v2 3/6] ui/gtk: Handle relative mode events correctly with
 Wayland compositors
Date: Thu, 17 Nov 2022 17:44:23 -0800
Message-Id: <20221118014426.182599-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118014426.182599-1-vivek.kasireddy@intel.com>
References: <20221118014426.182599-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

gdk_device_warp() is a no-op when running in a Host environment that is
Wayland based as the Wayland protocol does not allow clients to move
the cursor to a specific location. This presents a problem when Qemu is
running with GTK UI + relative mouse mode, as we would no longer be able
to warp the cursor to the Guest's location like it is done when running
in Xorg-based environments. To solve this problem, we just store the
Guest's cursor location and add/subtract the difference compared to the
Host's cursor location when injecting the next motion event.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/gtk.h |  2 ++
 ui/gtk.c         | 71 ++++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index ae0f53740d..f8df042f95 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -130,6 +130,8 @@ struct GtkDisplayState {
     gboolean last_set;
     int last_x;
     int last_y;
+    int guest_x;
+    int guest_y;
     int grab_x_root;
     int grab_y_root;
     VirtualConsole *kbd_owner;
diff --git a/ui/gtk.c b/ui/gtk.c
index 9d0c27c9e7..8ccc948813 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -447,22 +447,44 @@ static void gd_mouse_set(DisplayChangeListener *dcl,
                          int x, int y, int visible)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
-    GdkDisplay *dpy;
+    GtkDisplayState *s = vc->s;
+    GdkDisplay *dpy = gtk_widget_get_display(vc->gfx.drawing_area);
     gint x_root, y_root;
 
     if (qemu_input_is_absolute()) {
         return;
     }
+    /*
+     * When the mouse cursor moves from one vc (or connector in guest
+     * terminology) to another, some guest compositors (e.g. Weston)
+     * set x and y to 0 on the old vc. We check for this condition
+     * and return right away as we do not want to move the cursor
+     * back to the old vc (at 0, 0).
+     */
+    if (GDK_IS_WAYLAND_DISPLAY(dpy)) {
+        if (s->ptr_owner != vc || (x == 0 && y == 0)) {
+            return;
+        }
+    }
+    /*
+     * Since Wayland compositors do not support clients warping/moving
+     * the cursor, we just store the Guest's cursor location here and
+     * add or subtract the difference when injecting the next motion event.
+     */
+    if (GDK_IS_WAYLAND_DISPLAY(dpy)) {
+        s->guest_x = x;
+        s->guest_y = y;
+        return;
+    }
 
-    dpy = gtk_widget_get_display(vc->gfx.drawing_area);
     gdk_window_get_root_coords(gtk_widget_get_window(vc->gfx.drawing_area),
                                x * vc->gfx.scale_x, y * vc->gfx.scale_y,
                                &x_root, &y_root);
     gdk_device_warp(gd_get_pointer(dpy),
                     gtk_widget_get_screen(vc->gfx.drawing_area),
                     x_root, y_root);
-    vc->s->last_x = x;
-    vc->s->last_y = y;
+    s->last_x = x;
+    s->last_y = y;
 }
 
 static void gd_cursor_define(DisplayChangeListener *dcl,
@@ -869,6 +891,7 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
 {
     VirtualConsole *vc = opaque;
     GtkDisplayState *s = vc->s;
+    GdkDisplay *dpy = gtk_widget_get_display(vc->gfx.drawing_area);
     GdkWindow *window;
     int x, y;
     int mx, my;
@@ -915,14 +938,41 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
                              0, surface_height(vc->gfx.ds));
         qemu_input_event_sync();
     } else if (s->last_set && s->ptr_owner == vc) {
-        qemu_input_queue_rel(vc->gfx.dcl.con, INPUT_AXIS_X, x - s->last_x);
-        qemu_input_queue_rel(vc->gfx.dcl.con, INPUT_AXIS_Y, y - s->last_y);
+        int dx = x - s->last_x;
+        int dy = y - s->last_y;
+
+        /*
+         * To converge/sync the Guest's and Host's cursor locations more
+         * accurately, we can avoid doing the / 2 below but it appears
+         * some Guest compositors (e.g. Weston) do not like large jumps;
+         * so we just do / 2 which seems to work reasonably well.
+         */
+        if (GDK_IS_WAYLAND_DISPLAY(dpy)) {
+            dx += s->guest_x ? (x - s->guest_x) / 2 : 0;
+            dy += s->guest_y ? (y - s->guest_y) / 2 : 0;
+            s->guest_x = 0;
+            s->guest_y = 0;
+        }
+        qemu_input_queue_rel(vc->gfx.dcl.con, INPUT_AXIS_X, dx);
+        qemu_input_queue_rel(vc->gfx.dcl.con, INPUT_AXIS_Y, dy);
         qemu_input_event_sync();
     }
     s->last_x = x;
     s->last_y = y;
     s->last_set = TRUE;
 
+    /*
+     * When running in Wayland environment, we don't grab the cursor; so,
+     * we want to return right away as it would not make sense to warp it
+     * (below).
+     */
+    if (GDK_IS_WAYLAND_DISPLAY(dpy)) {
+        if (s->ptr_owner != vc) {
+            s->ptr_owner = vc;
+        }
+        return TRUE;
+    }
+
     if (!qemu_input_is_absolute() && s->ptr_owner == vc) {
         GdkScreen *screen = gtk_widget_get_screen(vc->gfx.drawing_area);
         GdkDisplay *dpy = gtk_widget_get_display(widget);
@@ -961,11 +1011,16 @@ static gboolean gd_button_event(GtkWidget *widget, GdkEventButton *button,
 {
     VirtualConsole *vc = opaque;
     GtkDisplayState *s = vc->s;
+    GdkDisplay *dpy = gtk_widget_get_display(vc->gfx.drawing_area);
     InputButton btn;
 
-    /* implicitly grab the input at the first click in the relative mode */
+    /* Implicitly grab the input at the first click in the relative mode.
+     * However, when running in Wayland environment, some limited testing
+     * indicates that grabs are not very reliable.
+     */
     if (button->button == 1 && button->type == GDK_BUTTON_PRESS &&
-        !qemu_input_is_absolute() && s->ptr_owner != vc) {
+        !qemu_input_is_absolute() && s->ptr_owner != vc &&
+        !GDK_IS_WAYLAND_DISPLAY(dpy)) {
         if (!vc->window) {
             gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(s->grab_item),
                                            TRUE);
-- 
2.37.2


