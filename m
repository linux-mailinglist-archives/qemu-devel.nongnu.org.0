Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B9D3AF64A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 21:40:09 +0200 (CEST)
Received: from localhost ([::1]:52804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvPmC-00032H-CS
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 15:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lvPjj-00071t-SA
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:37:35 -0400
Received: from mga02.intel.com ([134.134.136.20]:17375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lvPjh-0008BL-7V
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:37:35 -0400
IronPort-SDR: bQmxANJrbbAou1nLSqqyVLAWhFWHysHq0os7CUPDznI63GS+5CHHuLXX4+sBFF/vleFBu1GwlA
 zQa7rZSJDNbQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="194056713"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="194056713"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:37:16 -0700
IronPort-SDR: 9LP89Vs36riiS67Equhe4CAXx+XmL9XWkbOOq4ZMdc1SSAGtRpBuZ6+j/KN6m5qZfJhM9mFDpe
 enM7Zw2xk/ig==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="473524012"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:37:15 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] ui/egl: Add egl helpers to help with synchronization
Date: Mon, 21 Jun 2021 12:24:22 -0700
Message-Id: <20210621192425.1188442-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210621192425.1188442-1-vivek.kasireddy@intel.com>
References: <20210621192425.1188442-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=vivek.kasireddy@intel.com; helo=mga02.intel.com
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

These egl helpers would be used for creating and waiting on
a sync object.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/console.h     |  2 ++
 include/ui/egl-helpers.h |  2 ++
 ui/egl-helpers.c         | 26 ++++++++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index b30b63976a..49978fdae3 100644
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
index f1bf8f97fc..2c3ba92b53 100644
--- a/include/ui/egl-helpers.h
+++ b/include/ui/egl-helpers.h
@@ -45,6 +45,8 @@ int egl_get_fd_for_texture(uint32_t tex_id, EGLint *stride, EGLint *fourcc,
 
 void egl_dmabuf_import_texture(QemuDmaBuf *dmabuf);
 void egl_dmabuf_release_texture(QemuDmaBuf *dmabuf);
+void egl_dmabuf_create_sync(QemuDmaBuf *dmabuf);
+void egl_dmabuf_create_fence(QemuDmaBuf *dmabuf);
 
 #endif
 
diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 6d0cb2b5cb..6fa3f2ec45 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -76,6 +76,32 @@ void egl_fb_setup_for_tex(egl_fb *fb, int width, int height,
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
 void egl_fb_setup_new_tex(egl_fb *fb, int width, int height)
 {
     GLuint texture;
-- 
2.30.2


