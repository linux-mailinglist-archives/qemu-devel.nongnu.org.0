Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6E83D692D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 00:03:01 +0200 (CEST)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88gd-0001YW-RS
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 18:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m88fN-00009S-8w
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 18:01:41 -0400
Received: from mga03.intel.com ([134.134.136.65]:54562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m88fL-0006oU-IY
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 18:01:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="212361124"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="212361124"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 15:01:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="416674394"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.215])
 by orsmga006.jf.intel.com with ESMTP; 26 Jul 2021 15:01:34 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] ui/gtk-egl: blitting partial guest fb to the proper
 scanout surface
Date: Mon, 26 Jul 2021 14:59:50 -0700
Message-Id: <20210726215950.26705-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210726215950.26705-1-dongwon.kim@intel.com>
References: <20210706235255.7575-1-dongwon.kim@intel.com>
 <20210726215950.26705-1-dongwon.kim@intel.com>
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=dongwon.kim@intel.com; helo=mga03.intel.com
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, vivek.kasireddy@intel.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

eb_fb_blit should be able to blit partial image that represent a specific
guest display in case there are multiple displays connected to the guest
(One guest scanout FB contains all display outputs in a single dmabuf (blob-
resource).).

v2: egl_fb includes dmabuf info then make egl_fb_blit position and size
    parameters programmed in dmabuf structure (previously position/size
    parameters were given to egl_fb_blit separately)
    (Vivek Kasireddy)

    changed the commit message as there is no interface change to egl_fb_blit

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 include/ui/egl-helpers.h |  1 +
 ui/egl-helpers.c         | 25 +++++++++++++++++++++----
 ui/gtk-egl.c             |  4 ++++
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
index f1bf8f97fc..b6fced7062 100644
--- a/include/ui/egl-helpers.h
+++ b/include/ui/egl-helpers.h
@@ -19,6 +19,7 @@ typedef struct egl_fb {
     GLuint texture;
     GLuint framebuffer;
     bool delete_texture;
+    QemuDmaBuf *dmabuf;
 } egl_fb;
 
 void egl_fb_destroy(egl_fb *fb);
diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 6d0cb2b5cb..80bc61fb70 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -90,14 +90,31 @@ void egl_fb_setup_new_tex(egl_fb *fb, int width, int height)
 
 void egl_fb_blit(egl_fb *dst, egl_fb *src, bool flip)
 {
-    GLuint y1, y2;
+    GLuint x1 = 0;
+    GLuint y1 = 0;
+    GLuint x2, y2;
+    GLuint w = src->width;
+    GLuint h = src->height;
 
     glBindFramebuffer(GL_READ_FRAMEBUFFER, src->framebuffer);
     glBindFramebuffer(GL_DRAW_FRAMEBUFFER, dst->framebuffer);
     glViewport(0, 0, dst->width, dst->height);
-    y1 = flip ? src->height : 0;
-    y2 = flip ? 0 : src->height;
-    glBlitFramebuffer(0, y1, src->width, y2,
+
+    if (src->dmabuf) {
+        x1 = src->dmabuf->x;
+        y1 = src->dmabuf->y;
+        w = src->dmabuf->scanout_width;
+        h = src->dmabuf->scanout_height;
+    }
+
+    w = (x1 + w) > src->width ? src->width - x1 : w;
+    h = (y1 + h) > src->height ? src->height - y1 : h;
+
+    y2 = flip ? y1 : h + y1;
+    y1 = flip ? h + y1 : y1;
+    x2 = x1 + w;
+
+    glBlitFramebuffer(x1, y1, x2, y2,
                       0, 0, dst->width, dst->height,
                       GL_COLOR_BUFFER_BIT, GL_LINEAR);
 }
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 2a2e6d3a17..636b2aa02c 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -209,6 +209,8 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl,
                            QemuDmaBuf *dmabuf)
 {
 #ifdef CONFIG_GBM
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+
     egl_dmabuf_import_texture(dmabuf);
     if (!dmabuf->texture) {
         return;
@@ -217,6 +219,8 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl,
     gd_egl_scanout_texture(dcl, dmabuf->texture,
                            false, dmabuf->width, dmabuf->height,
                            0, 0, dmabuf->width, dmabuf->height);
+
+    vc->gfx.guest_fb.dmabuf = dmabuf;
 #endif
 }
 
-- 
2.17.1


