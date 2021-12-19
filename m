Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CB0479EDA
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 03:33:16 +0100 (CET)
Received: from localhost ([::1]:36784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mym0i-0004Ep-2G
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 21:33:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mylyu-0001UC-AL; Sat, 18 Dec 2021 21:31:24 -0500
Received: from [2607:f8b0:4864:20::f2d] (port=42917
 helo=mail-qv1-xf2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mylyr-0003ef-QA; Sat, 18 Dec 2021 21:31:24 -0500
Received: by mail-qv1-xf2d.google.com with SMTP id p3so6102013qvj.9;
 Sat, 18 Dec 2021 18:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GQ++DfcDzAjdfJdKyj0x+1JvHGLZ0hECGNGimajPzTo=;
 b=kZ1Dto5icIoVlhL6CJH1r/VsGG+MpwXamQGmt0ve+qkB6gVe70vF+b+D5xqOfrKwWw
 lRwwmbDQsCQorm69ScN+y9Mi9hvHeMzSmcjo0P0StPZidZdmdFi4T3pVww8GhD/9EQ9N
 q4Ij1ARfYC7fHApfaymovizqJTWPZGGVQEoT9wtgrOEHy3TgHoahlJg7mW/Fhp631iy5
 8KAJZJK7n89/6Ss7xXXJ6laYgBzrZ3QfomqyyPZkcleW/LeEqi/mLvK9z7/CR40DikVC
 ZzzEnUMk1vIKhnynd32UvyOpP0z9vtOl1MPVENAaiM7Jg2CV0rPl0fzDN/gVlebl6RAq
 eVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GQ++DfcDzAjdfJdKyj0x+1JvHGLZ0hECGNGimajPzTo=;
 b=DTZfnCQt6wOH1JtuTadTby1GVxBT0ga8D0ObMEgVw91AM9mfXXrx+AqYlwULe7gnZU
 o6XZmtqAH0trutBao8uTPwR6llm+kI/VSAaBiDxuRTUI7S0X6x4w7UUvLRSXnGT0fw2V
 owc84ZczVspZlHPWviP5Lln2W5lUD94O9UYKWvzpnAqKJMhg2O+T2k331/MZ0CYl3t23
 ZzbrfYGWiVWgUmKzKZEdQa7s44MR4iITTn4aQGOesWNIBoYuFPUozX40cGd0ajFr7W7I
 154mz4Wsca2k+dmK2xTVKP8VlM7mUiEO224ouMjmKtnCXrsKwuv/3bNeauwJW2zj5p/R
 NAbw==
X-Gm-Message-State: AOAM532Umx2ZEdelWb9hRvWRbKsVdaR57ZFCIbYNLtzC7hSHiru5aYl/
 r/1HCWDHV2gTcIWcfAoBhegOOjTorhUzp2e/VUA=
X-Google-Smtp-Source: ABdhPJxF59kzgeSetf0Hf3Ubbx8ohozfQw41Z5Cme3C9Iuqb0oQSWxjeC+GHQOyRW+Ja3Aw803Wo6g==
X-Received: by 2002:a05:6214:5193:: with SMTP id
 kl19mr8069646qvb.77.1639881080315; 
 Sat, 18 Dec 2021 18:31:20 -0800 (PST)
Received: from alexdesktop.localdomain
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id m4sm10174293qtu.87.2021.12.18.18.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 18:31:20 -0800 (PST)
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] ui: Fix gtk/gl when the scaled virtual console does not
 fit the window
Date: Sat, 18 Dec 2021 21:30:06 -0500
Message-Id: <20211219023006.124530-5-orzechowski.alexander@gmail.com>
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

gtk/gl was incorrectly always rendering as if the 'Zoom to Fit' was
always checked even if it wasn't. This is now using logic closer
to what is being used for the existing cairo code paths.

Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
---
 ui/gtk-gl-area.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 01e4e74ee3..ea72f1817b 100644
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
+                          mx, my, fbw, fbh,
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


