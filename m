Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D1C479EDC
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 03:35:16 +0100 (CET)
Received: from localhost ([::1]:42242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mym2d-0007wS-HS
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 21:35:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mylyu-0001UD-Ba; Sat, 18 Dec 2021 21:31:24 -0500
Received: from [2607:f8b0:4864:20::f2d] (port=37465
 helo=mail-qv1-xf2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mylyr-0003eQ-Qg; Sat, 18 Dec 2021 21:31:24 -0500
Received: by mail-qv1-xf2d.google.com with SMTP id fo11so6146972qvb.4;
 Sat, 18 Dec 2021 18:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bnM9Ijsl4/xGd5v5bwrnrhdVO7/6XTQYZpdcZDC50KM=;
 b=E5uZRApA2yxy6fePTlIMOpFAGT3u+sBrDXQMb747Z/bVkN3vJsfsGKKdEcxn5J20D0
 hxtGU3cRXIvdXf3WWi1yZwA2Hzy7JDmQC4XE4mVS3X8Yne60Aoo5FVef+G5Jhun/Jdp5
 jHlapeq62ruVS9pLwLRBsklE4OIDQN0Q0pksjUr5l+vMsPaAQR54bIMT15EP6/fkdgis
 vB8yI9pYD+S9ezh/NEa+mkW3WxelLzhfXfQZ/fggZuPM7qq+uURLvOfEeK5e7YsBQrMD
 UW+CCITsWrhUa51POefYkkYMLI5UF7HmAwwtiCEiAv1/oEugHhzuQx3x27r7Nm+upaQy
 YVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bnM9Ijsl4/xGd5v5bwrnrhdVO7/6XTQYZpdcZDC50KM=;
 b=UAZ5GYJ7L2QT4uo8nAq2nrd/mEQmsfGjQ5ma04R3ORX+SLtRryNY10p4YCgQa7IkZW
 B3A3TttvsF6MEm0i+14PZVFbaIjIpGepANEY4dlYzEY3UlgCBmGiEtl7zX41zbijC7m2
 Y3CZelOarTzwl8Yn8QSP7gULBJp2OlXhcyFaKCWwe7rjiKkunXFb9M0eCVrnbBN6RcDm
 WLON5+QV2QNMOONbBVe2y5gjtOYBZs5MRAhG0RNYPdRZHj9akPQMxDnGGQkM+F4S7wXk
 gtQuaV99vL4C+EUURMZMiuy5vVb3j1k2463J2zY7c5xI1N1OMMJez4b8P3mDJBqzxZOp
 0JeQ==
X-Gm-Message-State: AOAM532Mp5NNiqnM6T3LtDmvHuZQvRoluUq9i4cXL1C0Crj2OaooYyNR
 oMVdygZaNvPM2Zvfi2CQwAXrjMfUaOj2csQwnqU=
X-Google-Smtp-Source: ABdhPJwfimZe4b5k58l+EecS+dzaJhI4Nox2nbOJG9ZnlSH+9DqsPqISjWeVn8H0mq2rqHe9dI5ITA==
X-Received: by 2002:a0c:edca:: with SMTP id i10mr8390733qvr.62.1639881078420; 
 Sat, 18 Dec 2021 18:31:18 -0800 (PST)
Received: from alexdesktop.localdomain
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id m4sm10174293qtu.87.2021.12.18.18.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 18:31:18 -0800 (PST)
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] ui: Use allocated size instead of window size
Date: Sat, 18 Dec 2021 21:30:03 -0500
Message-Id: <20211219023006.124530-2-orzechowski.alexander@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211219023006.124530-1-orzechowski.alexander@gmail.com>
References: <20211219023006.124530-1-orzechowski.alexander@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=orzechowski.alexander@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Orzechowski <orzechowski.alexander@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In these cases, we only care about the size of the virtual console
itself. Previously, these calculations were made using the size of
the entire window, which would include the size of the virtual console
plus all the ui elements around it.

Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
---
 ui/gtk.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 428f02f2df..824334ff3d 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -340,8 +340,8 @@ static void gd_update_full_redraw(VirtualConsole *vc)
 {
     GtkWidget *area = vc->gfx.drawing_area;
     int ww, wh;
-    ww = gdk_window_get_width(gtk_widget_get_window(area));
-    wh = gdk_window_get_height(gtk_widget_get_window(area));
+    ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area);
+    wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area);
 #if defined(CONFIG_OPENGL)
     if (vc->gfx.gls && gtk_use_gl_area) {
         gtk_gl_area_queue_render(GTK_GL_AREA(vc->gfx.drawing_area));
@@ -387,7 +387,6 @@ static void gd_update(DisplayChangeListener *dcl,
                       int x, int y, int w, int h)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
-    GdkWindow *win;
     int x1, x2, y1, y2;
     int mx, my;
     int fbw, fbh;
@@ -414,12 +413,8 @@ static void gd_update(DisplayChangeListener *dcl,
     fbw = surface_width(vc->gfx.ds) * vc->gfx.scale_x;
     fbh = surface_height(vc->gfx.ds) * vc->gfx.scale_y;
 
-    win = gtk_widget_get_window(vc->gfx.drawing_area);
-    if (!win) {
-        return;
-    }
-    ww = gdk_window_get_width(win);
-    wh = gdk_window_get_height(win);
+    ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area);
+    wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area);
 
     mx = my = 0;
     if (ww > fbw) {
@@ -788,8 +783,8 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
     fbw = surface_width(vc->gfx.ds);
     fbh = surface_height(vc->gfx.ds);
 
-    ww = gdk_window_get_width(gtk_widget_get_window(widget));
-    wh = gdk_window_get_height(gtk_widget_get_window(widget));
+    ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area);
+    wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area); 
 
     if (s->full_screen) {
         vc->gfx.scale_x = (double)ww / fbw;
@@ -838,7 +833,6 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
 {
     VirtualConsole *vc = opaque;
     GtkDisplayState *s = vc->s;
-    GdkWindow *window;
     int x, y;
     int mx, my;
     int fbh, fbw;
@@ -851,10 +845,10 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     fbw = surface_width(vc->gfx.ds) * vc->gfx.scale_x;
     fbh = surface_height(vc->gfx.ds) * vc->gfx.scale_y;
 
-    window = gtk_widget_get_window(vc->gfx.drawing_area);
-    ww = gdk_window_get_width(window);
-    wh = gdk_window_get_height(window);
-    ws = gdk_window_get_scale_factor(window);
+    ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area);
+    wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area);
+    ws = gdk_window_get_scale_factor(
+            gtk_widget_get_window(vc->gfx.drawing_area));
 
     mx = my = 0;
     if (ww > fbw) {
-- 
2.34.1


