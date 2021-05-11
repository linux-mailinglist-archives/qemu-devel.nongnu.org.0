Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DD837A2DC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:01:01 +0200 (CEST)
Received: from localhost ([::1]:60484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOGC-0000mO-O3
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNeL-00011E-BL
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:53 -0400
Received: from mga17.intel.com ([192.55.52.151]:32226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNeJ-0004x4-Bb
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:53 -0400
IronPort-SDR: d4/VEjqE5eYW5lj4geIrHJJkMZRs/k9aDee8SUNh01LnkvxwcLwsO/IccTb6j8DloytfTbfcM5
 SjFnmgOUR/RA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179649400"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179649400"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
IronPort-SDR: isdhtGoK9KzN6uoghXUa2nRJusUwYM6yXqH7jKn5ZI8OHhfRKBo/wNyQL6PJulShJpreM5tgtH
 emHckS5zjTaw==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536892230"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/20] ui/gtk: Create a common release_dmabuf helper
Date: Tue, 11 May 2021 01:08:17 -0700
Message-Id: <20210511080818.366985-20-vivek.kasireddy@intel.com>
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

Since the texture release mechanism is same for both gtk-egl
and gtk-glarea, move the helper from gtk-egl into common gtk
area so that it can be shared by both gtk backends.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/gtk.h |  2 --
 ui/gtk-egl.c     |  8 --------
 ui/gtk.c         | 11 ++++++++++-
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 0929e658f2..95506aa13b 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -114,8 +114,6 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,
                           uint32_t hot_x, uint32_t hot_y);
 void gd_egl_cursor_position(DisplayChangeListener *dcl,
                             uint32_t pos_x, uint32_t pos_y);
-void gd_egl_release_dmabuf(DisplayChangeListener *dcl,
-                           QemuDmaBuf *dmabuf);
 void gd_egl_flush(DisplayChangeListener *dcl,
                   uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gd_egl_scanout_flush(DisplayChangeListener *dcl,
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 799e3cbc78..a5655b6bbc 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -255,14 +255,6 @@ void gd_egl_cursor_position(DisplayChangeListener *dcl,
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
index 4c6066b015..621dcf3f9e 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -630,6 +630,14 @@ static bool gd_has_dmabuf(DisplayChangeListener *dcl)
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
 static void gd_gl_wait_dmabuf(DisplayChangeListener *dcl,
                               QemuDmaBuf *dmabuf)
 {
@@ -661,6 +669,7 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_gl_scanout_disable  = gd_gl_area_scanout_disable,
     .dpy_gl_update           = gd_gl_area_scanout_flush,
     .dpy_gl_scanout_dmabuf   = gd_gl_area_scanout_dmabuf,
+    .dpy_gl_release_dmabuf   = gd_gl_release_dmabuf,
     .dpy_gl_wait_dmabuf      = gd_gl_wait_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
@@ -684,7 +693,7 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_scanout_dmabuf   = gd_egl_scanout_dmabuf,
     .dpy_gl_cursor_dmabuf    = gd_egl_cursor_dmabuf,
     .dpy_gl_cursor_position  = gd_egl_cursor_position,
-    .dpy_gl_release_dmabuf   = gd_egl_release_dmabuf,
+    .dpy_gl_release_dmabuf   = gd_gl_release_dmabuf,
     .dpy_gl_update           = gd_egl_flush,
     .dpy_gl_wait_dmabuf      = gd_gl_wait_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
-- 
2.30.2


