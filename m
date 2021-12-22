Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB147CA20
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 01:13:22 +0100 (CET)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzpFw-00083h-68
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 19:13:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mzpDz-0005dJ-KH; Tue, 21 Dec 2021 19:11:19 -0500
Received: from [2607:f8b0:4864:20::833] (port=42566
 helo=mail-qt1-x833.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mzpDw-0004Ze-K2; Tue, 21 Dec 2021 19:11:18 -0500
Received: by mail-qt1-x833.google.com with SMTP id z9so433039qtj.9;
 Tue, 21 Dec 2021 16:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PzUgNm2q09z3nrELevky60vyh/vg7hqpGJ+6nDPRxs=;
 b=oTVCHeOkHydgS7XLTI73PUkq3C44sLYLsfSP5+xy26UqQDW+zGS1Zg979N6THTEPTu
 i+hI++fdP2NPd3+d4N/0G33gy6iB9dgqDCZRGyM0AXjNR+2xCEWoWcDskUFbz/eERm7m
 Wlp3tCcb3NagvbpMBvIEWI+UqN69Uls6YcEK6+Cfb98coMISCYqT+/s1CfnBmf6KcUWR
 5l/D4/1iIFysxwQ4LX03jhx6sV7vkX0n7qMkYPmm6psKbacUkWv2IWFiSm2efbT1spzX
 tBOtWV7ozi2GM5d1z30KshLMvvXi/QT151ryQ1WlOUJX3U6HyPhJsgblQWYaM9CErG3I
 3LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5PzUgNm2q09z3nrELevky60vyh/vg7hqpGJ+6nDPRxs=;
 b=YcmRpi7Sj3PAKWkn+xRc7dzxyOc2dZMI1ai8Zt2g0NZD+hVlhucFvQ8BXkCOs5FnLP
 iwcks/U3iGEwTAojOv9cvWEVMN/kagiIiyhDiULVammCphyxVimhixPDm2aYLDoB4MgB
 B7IwH8j5dlzDS7PZ+ZVHXwRmw9on20CWV+HS1Y4MVh42GzCkQ8uqxm1Lyu45QoWuEcZ7
 JVdt8lP4U5HeakyyL3u5uO02qrui3G8Xw++avFlQdaGqwX/w8AjWCF+rdSbvT/pO0DNd
 vmDC++YoIOeWSfskyFnQ15RkCS9MTDNwX8/KJD/tmGnhBVt0pJn+Ay8tYk70gWbq0Bda
 FQTg==
X-Gm-Message-State: AOAM533Tioq1ml7fNgSE1v1RkgvL8SRd7C2ZkcP1J+lPfItILGfxGs1j
 grauuIh12OYRInk6tI05HRLbyf2eH+1dHQ==
X-Google-Smtp-Source: ABdhPJzIgubhaPgAQC8cMmNrn1Yk4ltOt8o0x/NtCuN9WYwW/yQfX+ISRz4otazTbmsqTH07nVizTA==
X-Received: by 2002:a05:622a:1354:: with SMTP id
 w20mr519653qtk.566.1640131875270; 
 Tue, 21 Dec 2021 16:11:15 -0800 (PST)
Received: from alexdesktop.localdomain
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id i6sm503410qkn.26.2021.12.21.16.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 16:11:15 -0800 (PST)
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
To: QEMU <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/3] ui: Use allocated size instead of window size
Date: Tue, 21 Dec 2021 19:10:49 -0500
Message-Id: <20211222001051.2295513-2-orzechowski.alexander@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211222001051.2295513-1-orzechowski.alexander@gmail.com>
References: <20211222001051.2295513-1-orzechowski.alexander@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::833
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=orzechowski.alexander@gmail.com; helo=mail-qt1-x833.google.com
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
Cc: qemu trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark-Andre Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Orzechowski <orzechowski.alexander@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In these cases, we only care about the size of the virtual console
itself. Previously, these calculations were made using the size of
the entire window, which would include the size of the virtual console
plus all the ui elements around it.

Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


