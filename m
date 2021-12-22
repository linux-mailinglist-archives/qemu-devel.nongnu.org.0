Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ED947CA1F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 01:12:58 +0100 (CET)
Received: from localhost ([::1]:33686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzpFZ-0007iM-SI
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 19:12:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mzpDz-0005dI-Jp; Tue, 21 Dec 2021 19:11:19 -0500
Received: from [2607:f8b0:4864:20::f31] (port=36563
 helo=mail-qv1-xf31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mzpDx-0004Zu-NC; Tue, 21 Dec 2021 19:11:18 -0500
Received: by mail-qv1-xf31.google.com with SMTP id kc16so819644qvb.3;
 Tue, 21 Dec 2021 16:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fZwUUl0Nx3lYJiijHfkMwPLeE2pMycIYokPXRHmPyY=;
 b=TKvXa18VS9ijHC0Bir6buMp6AnNpNHYu+kwR8PcwHGO5yB0nN70M+HZb338PCAaV49
 Z0M2cC0OEEUhPkRQr6LEfb9YPb7MorsFYMIZM4CkUyfLaXkfUqGu7TEAnTdABtY/rTvn
 nmzZBy2iILCBmM0BZxbScjQggAwQSqCzL1F7ImT2w7gYqu2VszVodbWcJocz0bFtnmy+
 NlMz1U5D0jQ1rLSWGVcTGrGeg5BzznVffBXfg1m0oVn763lVqQLZch+GOz+bFGao2I6+
 ABiZ3+GaH1edR7AN0vgTImoI4M852iMO0UdFqSBjby6Oj4v8IJvaGovnVV44I1POYb6c
 WRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2fZwUUl0Nx3lYJiijHfkMwPLeE2pMycIYokPXRHmPyY=;
 b=iao7FRygkYd+jL+A1izyELdZYhwblkX1gV3bYMYChazfxZ7RFI3Q81v1/GGHYZdhuT
 /d0KtOjcFvX2oGGgODo8R6pBccevE35X8QiaTBZefJbIuMFcrgLOAKlG9+LCVDC6cWEV
 Ui6uz/xKf+Tvt0MGXK1EqGZCW0fdDwEkh4JkEuvKrQCO/sKypT8ve65QNqgJ6m7SOahi
 LphvFc9HqpPXDYnzbKpb+saGydLwDev4CuidVJ6NAzajV3Gd4DnuFJkpsMotAVQ3+W2U
 TXondqEAsi8UP83deZtpeyqLtAzC6eaaDLBKblr9CI1IAtPcY7TqCKghyU7eqCe9AUg6
 iA7w==
X-Gm-Message-State: AOAM531cRxodjXDhnYh/tNrb05hra2ih8wLBeSmH/yzGUyZjL7V8Ogvo
 j6pbgMjlPrSErJSTxEiYzwDq+ND9dA5KWQ==
X-Google-Smtp-Source: ABdhPJzHv1uBo7jPkhaI9oTq7s2wh21tDjmU9gOO3xHv2vZPUtJkX6RzIh9h3Sjaa19T0D3yv0CN5w==
X-Received: by 2002:ad4:5aad:: with SMTP id u13mr680374qvg.46.1640131876628;
 Tue, 21 Dec 2021 16:11:16 -0800 (PST)
Received: from alexdesktop.localdomain
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id i6sm503410qkn.26.2021.12.21.16.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 16:11:16 -0800 (PST)
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
To: QEMU <qemu-devel@nongnu.org>
Subject: [PATCH v2 3/3] ui: Fix gtk/gl when the scaled virtual console does
 not fit the window
Date: Tue, 21 Dec 2021 19:10:51 -0500
Message-Id: <20211222001051.2295513-4-orzechowski.alexander@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211222001051.2295513-1-orzechowski.alexander@gmail.com>
References: <20211222001051.2295513-1-orzechowski.alexander@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=orzechowski.alexander@gmail.com; helo=mail-qv1-xf31.google.com
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
 Mark-Andre Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Orzechowski <orzechowski.alexander@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gtk/gl was incorrectly always rendering as if the 'Zoom to Fit' was
always checked even if it wasn't. This is now using logic closer
to what is being used for the existing cairo code paths.

Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
---
 ui/gtk-gl-area.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 01e4e74ee3..f4f2dac882 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -41,16 +41,40 @@ void gd_gl_area_draw(VirtualConsole *vc)
 #ifdef CONFIG_GBM
     QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
 #endif
+    GtkDisplayState *s = vc->s;
     int ww, wh, ws, y1, y2;
+    int mx, my;
+    int fbh, fbw;
 
     if (!vc->gfx.gls) {
         return;
     }
 
     gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
+
+    fbw = surface_width(vc->gfx.ds);
+    fbh = surface_height(vc->gfx.ds);
+
     ws = gdk_window_get_scale_factor(gtk_widget_get_window(vc->gfx.drawing_area));
-    ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area) * ws;
-    wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area) * ws;
+    ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area);
+    wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area);
+
+    if (s->full_screen) {
+        vc->gfx.scale_x = (double)ww / fbw;
+        vc->gfx.scale_y = (double)wh / fbh;
+    } else if (s->free_scale) {
+        double sx, sy;
+
+        sx = (double)ww / fbw;
+        sy = (double)wh / fbh;
+
+        vc->gfx.scale_x = vc->gfx.scale_y = MIN(sx, sy);
+    }
+
+    fbw *= vc->gfx.scale_x * ws;
+    fbh *= vc->gfx.scale_y * ws;
+    mx = (ww * ws - fbw) / 2;
+    my = (wh * ws - fbh) / 2;
 
     if (vc->gfx.scanout_mode) {
         if (!vc->gfx.guest_fb.framebuffer) {
@@ -70,11 +94,11 @@ void gd_gl_area_draw(VirtualConsole *vc)
         glBindFramebuffer(GL_READ_FRAMEBUFFER, vc->gfx.guest_fb.framebuffer);
         /* GtkGLArea sets GL_DRAW_FRAMEBUFFER for us */
 
-        glViewport(0, 0, ww, wh);
+        glViewport(mx, my, fbw, fbh);
         y1 = vc->gfx.y0_top ? 0 : vc->gfx.h;
         y2 = vc->gfx.y0_top ? vc->gfx.h : 0;
         glBlitFramebuffer(0, y1, vc->gfx.w, y2,
-                          0, 0, ww, wh,
+                          mx, my, fbw + mx, fbh + my,
                           GL_COLOR_BUFFER_BIT, GL_NEAREST);
 #ifdef CONFIG_GBM
         if (dmabuf) {
@@ -98,7 +122,7 @@ void gd_gl_area_draw(VirtualConsole *vc)
         }
         gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
 
-        surface_gl_setup_viewport(vc->gfx.gls, vc->gfx.ds, ww, wh);
+        glViewport(mx, my, fbw, fbh);
         surface_gl_render_texture(vc->gfx.gls, vc->gfx.ds);
     }
 
-- 
2.34.1


