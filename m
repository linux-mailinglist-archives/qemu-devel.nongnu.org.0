Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0182D8EE9
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 17:59:04 +0100 (CET)
Received: from localhost ([::1]:53904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koUi7-0007TS-Sw
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 11:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koUgl-0005fx-Fo
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 11:57:39 -0500
Received: from mailout09.t-online.de ([194.25.134.84]:33800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koUgd-0003TA-GY
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 11:57:39 -0500
Received: from fwd07.aul.t-online.de (fwd07.aul.t-online.de [172.20.27.150])
 by mailout09.t-online.de (Postfix) with SMTP id D0D69423C5AA;
 Sun, 13 Dec 2020 17:57:29 +0100 (CET)
Received: from linpower.localnet
 (GcvRMUZcZhKrTBzUsBJVk-jgmmWhKrpXd-SM-FuBBTClfTb3J2y5pqnKLVCzw9qwfl@[79.208.17.59])
 by fwd07.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1koUgb-1XzRVA0; Sun, 13 Dec 2020 17:57:29 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 13134200617; Sun, 13 Dec 2020 17:57:24 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/3] ui/gtk: limit virtual console max update interval
Date: Sun, 13 Dec 2020 17:57:24 +0100
Message-Id: <20201213165724.13418-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <d5f2e3c5-b6d0-db4e-70c2-9de47fd8fefd@t-online.de>
References: <d5f2e3c5-b6d0-db4e-70c2-9de47fd8fefd@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: GcvRMUZcZhKrTBzUsBJVk-jgmmWhKrpXd-SM-FuBBTClfTb3J2y5pqnKLVCzw9qwfl
X-TOI-EXPURGATEID: 150726::1607878649-0000DD00-C02B820D/0/0 CLEAN NORMAL
X-TOI-MSGID: e908385c-a7db-4a49-aa7a-57971574208f
Received-SPF: none client-ip=194.25.134.84;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout09.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Nikola Pavlica <pavlica.nikola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Limit the virtual console maximum update interval to
GUI_REFRESH_INTERVAL_DEFAULT. This papers over a integer
overflow bug in gtk3 on Windows where the reported monitor
refresh frequency can be much smaller than the real refresh
frequency.

The gtk bug report can be found here:
https://gitlab.gnome.org/GNOME/gtk/-/issues/3394

On my Windows 10 system gtk reports a monitor refresh rate of
1.511Hz instead of 60.031Hz and slows down the screen update
rate in qemu to a crawl. Provided you are affected by the gtk
bug on Windows, these are the steps to reproduce the issue:

Start qemu with -display gtk and activate all qemu virtual
consoles and notice the reduced qemu refresh rate. Activating
all virtual consoles is necessary, because gui_update() in
ui/console.c uses the minimum of all display change listeners
update interval and not yet activated virtual consoles report
the default update interval (30ms).

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/gtk.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 7ff9327b9d..78da5902f4 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -749,10 +749,10 @@ static void gd_resize_event(GtkGLArea *area,
 #endif
 
 /*
- * If available, return the refresh rate of the display in milli-Hertz,
- * else return 0.
+ * If available, return the update interval of the monitor in ms,
+ * else return 0 (the default update interval).
  */
-static int gd_refresh_rate_millihz(GtkWidget *widget)
+static int gd_monitor_update_interval(GtkWidget *widget)
 {
 #ifdef GDK_VERSION_3_22
     GdkWindow *win = gtk_widget_get_window(widget);
@@ -760,8 +760,13 @@ static int gd_refresh_rate_millihz(GtkWidget *widget)
     if (win) {
         GdkDisplay *dpy = gtk_widget_get_display(widget);
         GdkMonitor *monitor = gdk_display_get_monitor_at_window(dpy, win);
+        int refresh_rate = gdk_monitor_get_refresh_rate(monitor); /* [mHz] */
 
-        return gdk_monitor_get_refresh_rate(monitor);
+        if (refresh_rate) {
+            /* T = 1 / f = 1 [s*Hz] / f = 1000*1000 [ms*mHz] / f */
+            return MIN(1000 * 1000 / refresh_rate,
+                       GUI_REFRESH_INTERVAL_DEFAULT);
+        }
     }
 #endif
     return 0;
@@ -774,7 +779,6 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
     int mx, my;
     int ww, wh;
     int fbw, fbh;
-    int refresh_rate_millihz;
 
 #if defined(CONFIG_OPENGL)
     if (vc->gfx.gls) {
@@ -795,12 +799,8 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
         return FALSE;
     }
 
-    refresh_rate_millihz = gd_refresh_rate_millihz(vc->window ?
-                                                   vc->window : s->window);
-    if (refresh_rate_millihz) {
-        /* T = 1 / f = 1 [s*Hz] / f = 1000*1000 [ms*mHz] / f */
-        vc->gfx.dcl.update_interval = 1000 * 1000 / refresh_rate_millihz;
-    }
+    vc->gfx.dcl.update_interval =
+        gd_monitor_update_interval(vc->window ? vc->window : s->window);
 
     fbw = surface_width(vc->gfx.ds);
     fbh = surface_height(vc->gfx.ds);
-- 
2.26.2


