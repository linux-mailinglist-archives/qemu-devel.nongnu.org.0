Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E204737A2BD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:57:37 +0200 (CEST)
Received: from localhost ([::1]:51764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOCv-0003NP-04
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNeJ-0000vd-Sb
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:51 -0400
Received: from mga17.intel.com ([192.55.52.151]:32223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNeH-0004ul-Tz
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:51 -0400
IronPort-SDR: PYj9cviWEJWu0FW1AA1WALfle8tcUBMEMlfjB/w9juFkPYw1CbHbqhc/2344AtVVsfGVUQM29n
 2sDHt/+BS+XA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179649399"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179649399"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
IronPort-SDR: APgZUB18IXD1DV4zfHn0WGTXWTtT9GkhmXlpMFRMM7u7Ft2t0zwHO1BR2BCL1n6C7gX2/YRyUE
 VxkhGM9DDtZA==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536892226"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/20] ui/gtk-egl: Wait for the draw signal for dmabuf blobs
Date: Tue, 11 May 2021 01:08:16 -0700
Message-Id: <20210511080818.366985-19-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511080818.366985-1-vivek.kasireddy@intel.com>
References: <20210511080818.366985-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/gtk.h |  2 ++
 ui/gtk-egl.c     | 14 ++++++++++++++
 ui/gtk.c         |  2 +-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 5ae0ad60a6..0929e658f2 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -116,6 +116,8 @@ void gd_egl_cursor_position(DisplayChangeListener *dcl,
                             uint32_t pos_x, uint32_t pos_y);
 void gd_egl_release_dmabuf(DisplayChangeListener *dcl,
                            QemuDmaBuf *dmabuf);
+void gd_egl_flush(DisplayChangeListener *dcl,
+                  uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gd_egl_scanout_flush(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gtk_egl_init(DisplayGLMode mode);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index e7117695f0..799e3cbc78 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -302,6 +302,20 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
     eglSwapBuffers(qemu_egl_display, vc->gfx.esurface);
 }
 
+void gd_egl_flush(DisplayChangeListener *dcl,
+                  uint32_t x, uint32_t y, uint32_t w, uint32_t h)
+{
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+    GtkWidget *area = vc->gfx.drawing_area;
+
+    if (vc->gfx.guest_fb.dmabuf) {
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
index 7465aa7552..4c6066b015 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -685,7 +685,7 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_cursor_dmabuf    = gd_egl_cursor_dmabuf,
     .dpy_gl_cursor_position  = gd_egl_cursor_position,
     .dpy_gl_release_dmabuf   = gd_egl_release_dmabuf,
-    .dpy_gl_update           = gd_egl_scanout_flush,
+    .dpy_gl_update           = gd_egl_flush,
     .dpy_gl_wait_dmabuf      = gd_gl_wait_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
-- 
2.30.2


