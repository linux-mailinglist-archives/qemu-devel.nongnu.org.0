Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B467739EA44
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 01:43:11 +0200 (CEST)
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqOti-00082W-HB
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 19:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lqOoy-0001ab-6z
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 19:38:16 -0400
Received: from mga06.intel.com ([134.134.136.31]:2292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lqOow-00075e-Bn
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 19:38:15 -0400
IronPort-SDR: V4OVUNgfnE0sL6pwcv0oNYJYCAb6y2sCwOsdDmSaRhTGzQ21re41cMlbofo3oqDHjhWAwE/2uA
 sL6fgh5uiGuA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="265889549"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="265889549"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 16:38:03 -0700
IronPort-SDR: rZmKqcmORWucPaYKyMe0yxkV78qcjGZTgGB/rYcYSQCWmAbAXNHk4r6xyIvTZ8J/KfApezK0oR
 QTxHoYYozgfw==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="551403355"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 16:38:02 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/5] ui/egl: Add egl helpers to help with synchronization
Date: Mon,  7 Jun 2021 16:25:28 -0700
Message-Id: <20210607232530.454435-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607232530.454435-1-vivek.kasireddy@intel.com>
References: <20210607232530.454435-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=vivek.kasireddy@intel.com; helo=mga06.intel.com
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

These egl helpers would be used for creating and waiting on
a sync object.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/console.h     |  2 ++
 include/ui/egl-helpers.h |  3 +++
 ui/egl-helpers.c         | 44 ++++++++++++++++++++++++++++++++++++++++
 ui/gtk.c                 | 15 ++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index c3dca61c31..a89f739f10 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -168,6 +168,8 @@ typedef struct QemuDmaBuf {
     uint64_t  modifier;
     uint32_t  texture;
     bool      y0_top;
+    void      *sync;
+    int       fence_fd;
 } QemuDmaBuf;
 
 typedef struct DisplayState DisplayState;
diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
index f1bf8f97fc..5a7575dc13 100644
--- a/include/ui/egl-helpers.h
+++ b/include/ui/egl-helpers.h
@@ -45,6 +45,9 @@ int egl_get_fd_for_texture(uint32_t tex_id, EGLint *stride, EGLint *fourcc,
 
 void egl_dmabuf_import_texture(QemuDmaBuf *dmabuf);
 void egl_dmabuf_release_texture(QemuDmaBuf *dmabuf);
+void egl_dmabuf_create_sync(QemuDmaBuf *dmabuf);
+void egl_dmabuf_create_fence(QemuDmaBuf *dmabuf);
+void egl_dmabuf_wait_sync(QemuDmaBuf *dmabuf);
 
 #endif
 
diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 6d0cb2b5cb..47220b66e0 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -76,6 +76,50 @@ void egl_fb_setup_for_tex(egl_fb *fb, int width, int height,
                               GL_TEXTURE_2D, fb->texture, 0);
 }
 
+void egl_dmabuf_create_sync(QemuDmaBuf *dmabuf)
+{
+    EGLSyncKHR sync;
+
+    if (epoxy_has_egl_extension(qemu_egl_display,
+                                "EGL_KHR_fence_sync") &&
+        epoxy_has_egl_extension(qemu_egl_display,
+                                "EGL_ANDROID_native_fence_sync")) {
+        sync = eglCreateSyncKHR(qemu_egl_display,
+				EGL_SYNC_NATIVE_FENCE_ANDROID, NULL);
+        if (sync != EGL_NO_SYNC_KHR) {
+            dmabuf->sync = sync;
+        }
+    }
+}
+
+void egl_dmabuf_create_fence(QemuDmaBuf *dmabuf)
+{
+    if (dmabuf->sync) {
+        dmabuf->fence_fd = eglDupNativeFenceFDANDROID(qemu_egl_display,
+                                                      dmabuf->sync);
+        eglDestroySyncKHR(qemu_egl_display, dmabuf->sync);
+        dmabuf->sync = NULL;
+    }
+}
+
+void egl_dmabuf_wait_sync(QemuDmaBuf *dmabuf)
+{
+    EGLSyncKHR sync;
+    EGLint attrib_list[] = {
+        EGL_SYNC_NATIVE_FENCE_FD_ANDROID, dmabuf->fence_fd,
+        EGL_NONE,
+    };
+
+    sync = eglCreateSyncKHR(qemu_egl_display,
+                            EGL_SYNC_NATIVE_FENCE_ANDROID, attrib_list);
+    if (sync != EGL_NO_SYNC_KHR) {
+        eglClientWaitSyncKHR(qemu_egl_display, sync,
+                             0, EGL_FOREVER_KHR);
+        eglDestroySyncKHR(qemu_egl_display, sync);
+        dmabuf->fence_fd = -1;
+    }
+}
+
 void egl_fb_setup_new_tex(egl_fb *fb, int width, int height)
 {
     GLuint texture;
diff --git a/ui/gtk.c b/ui/gtk.c
index 6132bab52f..cd884ca26c 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -583,6 +583,19 @@ static void gd_gl_release_dmabuf(DisplayChangeListener *dcl,
 #endif
 }
 
+static void gd_gl_wait_dmabuf(DisplayChangeListener *dcl,
+                              QemuDmaBuf *dmabuf)
+{
+#ifdef CONFIG_GBM
+    egl_dmabuf_create_fence(dmabuf);
+    if (dmabuf->fence_fd <= 0) {
+        return;
+    }
+
+    egl_dmabuf_wait_sync(dmabuf);
+#endif
+}
+
 /** DisplayState Callbacks (opengl version) **/
 
 static const DisplayChangeListenerOps dcl_gl_area_ops = {
@@ -602,6 +615,7 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_gl_update           = gd_gl_area_scanout_flush,
     .dpy_gl_scanout_dmabuf   = gd_gl_area_scanout_dmabuf,
     .dpy_gl_release_dmabuf   = gd_gl_release_dmabuf,
+    .dpy_gl_wait_dmabuf      = gd_gl_wait_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
@@ -626,6 +640,7 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_cursor_position  = gd_egl_cursor_position,
     .dpy_gl_update           = gd_egl_scanout_flush,
     .dpy_gl_release_dmabuf   = gd_gl_release_dmabuf,
+    .dpy_gl_wait_dmabuf      = gd_gl_wait_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
-- 
2.30.2


