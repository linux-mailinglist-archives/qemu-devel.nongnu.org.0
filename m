Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED07D2F76AD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:28:39 +0100 (CET)
Received: from localhost ([::1]:43308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0MLP-0007q1-0L
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:28:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHU-0002tp-9E
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHS-0007sU-54
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610706273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=os4GO3mreatvo85yozQMNvL9545MSXcMAfCGgg+egBw=;
 b=RU2u2gC8Jcezdj/mjNLwr1xqQaSQaqrO61+WG1AQ5r01IpBdG+i0StFmyzzGf1e+K6rR8l
 ZauFkZm5UPYGwFZi+aNL2CIv05ghCPuHFwMZMY5Q223E3cweWlcuVz0nRmzmxMNu3O4SkU
 oNMzNiylpEoHTDmrW5tj07TzeaVVIMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-8yzCrXNXMtC57d5X3UZtvg-1; Fri, 15 Jan 2021 05:24:30 -0500
X-MC-Unique: 8yzCrXNXMtC57d5X3UZtvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76433107ACF9;
 Fri, 15 Jan 2021 10:24:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43C3B19C45;
 Fri, 15 Jan 2021 10:24:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9B0601800612; Fri, 15 Jan 2021 11:24:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/11] ui/gtk: limit virtual console max update interval
Date: Fri, 15 Jan 2021 11:24:16 +0100
Message-Id: <20210115102424.1360437-4-kraxel@redhat.com>
In-Reply-To: <20210115102424.1360437-1-kraxel@redhat.com>
References: <20210115102424.1360437-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

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
Message-Id: <20201213165724.13418-3-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 439c1e949fd9..d2004a4dc162 100644
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
2.29.2


