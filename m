Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB803B3682
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 21:02:25 +0200 (CEST)
Received: from localhost ([::1]:42408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwUcK-0008W7-9I
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 15:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lwUVz-0000o5-A0
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:55:51 -0400
Received: from mga11.intel.com ([192.55.52.93]:11038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lwUVw-0006N8-Qw
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:55:51 -0400
IronPort-SDR: Qf0AkeqJK7YsDcM1QzB/UxjyrwXZ1e0uq1ZSRetwHH92U/6Ek400i/+C6tyS5oo/tG3GKZlCIM
 SH4LZGL2R+IA==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="204531441"
X-IronPort-AV: E=Sophos;i="5.83,297,1616482800"; d="scan'208";a="204531441"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 11:55:37 -0700
IronPort-SDR: NvjE4NP65gk9iFzgxOus4h81c2S51cNW2P6C04MCX8doy2qbZokgsg+smk+lY4pyp3oCl64hAE
 IXmGelWIQwsw==
X-IronPort-AV: E=Sophos;i="5.83,297,1616482800"; d="scan'208";a="455176692"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 11:55:35 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] ui/gtk-egl: Wait for the draw signal for dmabuf blobs
Date: Thu, 24 Jun 2021 11:43:11 -0700
Message-Id: <20210624184312.1275843-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624184312.1275843-1-vivek.kasireddy@intel.com>
References: <20210624184312.1275843-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=vivek.kasireddy@intel.com; helo=mga11.intel.com
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of immediately drawing and submitting, queue and wait
for the draw signal if the dmabuf submitted is a blob.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/gtk.h |  2 ++
 ui/gtk-egl.c     | 15 +++++++++++++++
 ui/gtk.c         |  2 +-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 3e6a48b978..a25f5bfecc 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -179,6 +179,8 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,
                           uint32_t hot_x, uint32_t hot_y);
 void gd_egl_cursor_position(DisplayChangeListener *dcl,
                             uint32_t pos_x, uint32_t pos_y);
+void gd_egl_flush(DisplayChangeListener *dcl,
+                  uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gd_egl_scanout_flush(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gtk_egl_init(DisplayGLMode mode);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 2c68696d9f..737e7b90d4 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -304,6 +304,21 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
     eglSwapBuffers(qemu_egl_display, vc->gfx.esurface);
 }
 
+void gd_egl_flush(DisplayChangeListener *dcl,
+                  uint32_t x, uint32_t y, uint32_t w, uint32_t h)
+{
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+    GtkWidget *area = vc->gfx.drawing_area;
+
+    if (vc->gfx.guest_fb.dmabuf) {
+        graphic_hw_gl_block(vc->gfx.dcl.con, true);
+        gtk_widget_queue_draw_area(area, x, y, w, h);
+        return;
+    }
+
+    gd_egl_scanout_flush(&vc->gfx.dcl, x, y, w, h);
+}
+
 void gtk_egl_init(DisplayGLMode mode)
 {
     GdkDisplay *gdk_display = gdk_display_get_default();
diff --git a/ui/gtk.c b/ui/gtk.c
index ee3a084c21..ce885d2ca3 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -637,7 +637,7 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_scanout_dmabuf   = gd_egl_scanout_dmabuf,
     .dpy_gl_cursor_dmabuf    = gd_egl_cursor_dmabuf,
     .dpy_gl_cursor_position  = gd_egl_cursor_position,
-    .dpy_gl_update           = gd_egl_scanout_flush,
+    .dpy_gl_update           = gd_egl_flush,
     .dpy_gl_release_dmabuf   = gd_gl_release_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
-- 
2.30.2


