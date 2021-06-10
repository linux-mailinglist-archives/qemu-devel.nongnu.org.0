Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34AD3A37AA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 01:08:50 +0200 (CEST)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrTn7-0006W0-Oa
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 19:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lrTg5-0007Zn-Rp
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:01:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:53003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lrTg2-0007CA-Hm
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:01:33 -0400
IronPort-SDR: RfuMJRJIzVGqMgUBpibiflR/NGwVR59M46w6LaE7KQ4WJe0s6wGg4l3qtG2RKafqdMljUATI0R
 Dwnv1+0p3+4Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="185796183"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="185796183"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:01:08 -0700
IronPort-SDR: gu80Dd4Xdrez1FmIaKMVRBGmgPv03yN8g/9ZG2ZfzDumtmCWI/sfPXKbvBMH+m3njhQIUE1aSG
 60pW8N5c+06g==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="419888360"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:01:08 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] ui/gtk: Implement wait_dmabuf function
Date: Thu, 10 Jun 2021 15:48:33 -0700
Message-Id: <20210610224837.670192-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610224837.670192-1-vivek.kasireddy@intel.com>
References: <20210610224837.670192-1-vivek.kasireddy@intel.com>
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

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 ui/gtk.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

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


