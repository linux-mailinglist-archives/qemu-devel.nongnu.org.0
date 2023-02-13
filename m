Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194B069478A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:57:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZK1-0003Mu-8H; Mon, 13 Feb 2023 08:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyujun@fingera.cn>)
 id 1pRV7g-00059t-PE
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:27:45 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyujun@fingera.cn>)
 id 1pRV7d-0005vy-65
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:27:44 -0500
X-QQ-mid: bizesmtp70t1676280445t9rrdbea
Received: from localhost.localdomain ( [112.95.75.167])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 13 Feb 2023 17:27:25 +0800 (CST)
X-QQ-SSF: 0130000000800020D000B00A0000000
X-QQ-FEAT: C46Rb8GPIEfndPU3ovLr/hVhAsCAeYQDuhl1af29Z+rHeuZ3k63gnRfc6ujAx
 RqqvPKzK7jdDQjQ9C4jhieHUKmxXmIipRxorTzQHaX+vHd6FYuNdzkbyDHbHnrNu/9FmWch
 uMnAfNbk/j2NlvydvliJmuN4rPxpGrprHzfK34jhv3ZpOcUc4oYX2fMoofIpsW3vYPK9hBQ
 3IBGzCm0cMHn/vE+8ZuYg9c6QZeS755Ai82b8naHj3tC158yI2B9w7iFnxhvlME7TqV5XMV
 M+50tg3qTiHvIXEosg3yk3UgP3eElLbnZ5B/9PhME2K2Go1/K50iPUKxCLa94jUbqPe2267
 I7iWRlBjAuG4VuUWQf0uQxfIbrI3NpS9z+oBdKA1rX3BpdaCsA=
X-QQ-GoodBg: 0
From: liuyujun <liuyujun@fingera.cn>
To: qemu-devel@nongnu.org
Cc: liuyujun <liuyujun@fingera.cn>
Subject: [PATCH 2/2] Fix issue #761: Broken scaling with gtk,
 gl=on on a hidpi display
Date: Mon, 13 Feb 2023 17:27:04 +0800
Message-Id: <20230213092704.1222623-1-liuyujun@fingera.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:fingera.cn:qybglogicsvr:qybglogicsvr4
Received-SPF: none client-ip=43.155.65.254; envelope-from=liuyujun@fingera.cn;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Feb 2023 08:56:37 -0500
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

Signed-off-by: Yujun <liuyujun@fingera.cn>
---
 ui/gtk-egl.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index e84431790c..15b3d64233 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -66,13 +66,14 @@ void gd_egl_draw(VirtualConsole *vc)
 #ifdef CONFIG_GBM
     QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
 #endif
-    int ww, wh;
+    int ww, wh, ws;
 
     if (!vc->gfx.gls) {
         return;
     }
 
     window = gtk_widget_get_window(vc->gfx.drawing_area);
+    ws = gdk_window_get_scale_factor(gtk_widget_get_window(vc->gfx.drawing_area));
     ww = gdk_window_get_width(window);
     wh = gdk_window_get_height(window);
 
@@ -109,13 +110,22 @@ void gd_egl_draw(VirtualConsole *vc)
         eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
                        vc->gfx.esurface, vc->gfx.ectx);
 
-        surface_gl_setup_viewport(vc->gfx.gls, vc->gfx.ds, ww, wh);
+        surface_gl_setup_viewport(vc->gfx.gls, vc->gfx.ds, ww * ws, wh * ws);
         surface_gl_render_texture(vc->gfx.gls, vc->gfx.ds);
 
         eglSwapBuffers(qemu_egl_display, vc->gfx.esurface);
 
-        vc->gfx.scale_x = (double)ww / surface_width(vc->gfx.ds);
-        vc->gfx.scale_y = (double)wh / surface_height(vc->gfx.ds);
+        if (vc->s->full_screen) {
+            vc->gfx.scale_x = (double)ww / surface_width(vc->gfx.ds);
+            vc->gfx.scale_y = (double)wh / surface_height(vc->gfx.ds);
+        } else if (vc->s->free_scale) {
+            double sx, sy;
+
+            sx = (double)ww / surface_width(vc->gfx.ds);
+            sy = (double)wh / surface_height(vc->gfx.ds);
+
+            vc->gfx.scale_x = vc->gfx.scale_y = MIN(sx, sy);
+        }
 
         glFlush();
     }
-- 
2.20.1


