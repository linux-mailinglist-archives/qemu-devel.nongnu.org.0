Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEF340BA50
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 23:34:13 +0200 (CEST)
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQG4C-0005dZ-W9
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 17:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mQG1y-0002ft-Qv
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 17:31:54 -0400
Received: from mga09.intel.com ([134.134.136.24]:34224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mQG1w-0007T3-Tm
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 17:31:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="222179021"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="222179021"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 14:31:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="609843285"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 14:31:43 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/5] ui/gtk: Create a common release_dmabuf helper
Date: Tue, 14 Sep 2021 14:18:33 -0700
Message-Id: <20210914211837.3229977-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914211837.3229977-1-vivek.kasireddy@intel.com>
References: <20210914211837.3229977-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=vivek.kasireddy@intel.com; helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since the texture release mechanism is same for both gtk-egl
and gtk-glarea, move the helper from gtk-egl to common gtk
code so that it can be shared by both gtk backends.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/gtk.h |  2 --
 ui/gtk-egl.c     |  8 --------
 ui/gtk.c         | 11 ++++++++++-
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 7835ef1a71..8e98a79ac8 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -181,8 +181,6 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,
                           uint32_t hot_x, uint32_t hot_y);
 void gd_egl_cursor_position(DisplayChangeListener *dcl,
                             uint32_t pos_x, uint32_t pos_y);
-void gd_egl_release_dmabuf(DisplayChangeListener *dcl,
-                           QemuDmaBuf *dmabuf);
 void gd_egl_scanout_flush(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gtk_egl_init(DisplayGLMode mode);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 2a2e6d3a17..b671181272 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -249,14 +249,6 @@ void gd_egl_cursor_position(DisplayChangeListener *dcl,
     vc->gfx.cursor_y = pos_y * vc->gfx.scale_y;
 }
 
-void gd_egl_release_dmabuf(DisplayChangeListener *dcl,
-                           QemuDmaBuf *dmabuf)
-{
-#ifdef CONFIG_GBM
-    egl_dmabuf_release_texture(dmabuf);
-#endif
-}
-
 void gd_egl_scanout_flush(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h)
 {
diff --git a/ui/gtk.c b/ui/gtk.c
index cfb0728d1f..784a2f6c74 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -575,6 +575,14 @@ static bool gd_has_dmabuf(DisplayChangeListener *dcl)
     return vc->gfx.has_dmabuf;
 }
 
+static void gd_gl_release_dmabuf(DisplayChangeListener *dcl,
+                                 QemuDmaBuf *dmabuf)
+{
+#ifdef CONFIG_GBM
+    egl_dmabuf_release_texture(dmabuf);
+#endif
+}
+
 /** DisplayState Callbacks (opengl version) **/
 
 static const DisplayChangeListenerOps dcl_gl_area_ops = {
@@ -593,6 +601,7 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_gl_scanout_disable  = gd_gl_area_scanout_disable,
     .dpy_gl_update           = gd_gl_area_scanout_flush,
     .dpy_gl_scanout_dmabuf   = gd_gl_area_scanout_dmabuf,
+    .dpy_gl_release_dmabuf   = gd_gl_release_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
@@ -615,8 +624,8 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_scanout_dmabuf   = gd_egl_scanout_dmabuf,
     .dpy_gl_cursor_dmabuf    = gd_egl_cursor_dmabuf,
     .dpy_gl_cursor_position  = gd_egl_cursor_position,
-    .dpy_gl_release_dmabuf   = gd_egl_release_dmabuf,
     .dpy_gl_update           = gd_egl_scanout_flush,
+    .dpy_gl_release_dmabuf   = gd_gl_release_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
-- 
2.30.2


