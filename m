Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14DC40FF2C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 20:23:03 +0200 (CEST)
Received: from localhost ([::1]:41948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRIVr-0004qz-1R
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 14:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mRIS5-00034t-Mx
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 14:19:11 -0400
Received: from mga01.intel.com ([192.55.52.88]:20485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mRIS3-0005n3-Mr
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 14:19:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="245248102"
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; d="scan'208";a="245248102"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 11:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; d="scan'208";a="699614338"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.202])
 by fmsmga006.fm.intel.com with ESMTP; 17 Sep 2021 11:18:59 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] ui/gtk-egl: blitting partial guest fb to the proper
 scanout surface
Date: Fri, 17 Sep 2021 11:16:53 -0700
Message-Id: <20210917181653.25487-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210917181653.25487-1-dongwon.kim@intel.com>
References: <20210917181653.25487-1-dongwon.kim@intel.com>
Received-SPF: pass client-ip=192.55.52.88; envelope-from=dongwon.kim@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

eb_fb_blit should be able to blit partial image of guest display (blob res)
in case multiple displays are configured for the guest and they are set as extended-
desktop mode.

v2: egl_fb includes dmabuf info then make egl_fb_blit position and size
    parameters programmed in dmabuf structure (previously position/size
    parameters were given to egl_fb_blit separately)
    (Vivek Kasireddy)

    changed the commit message as there is no interface change to egl_fb_blit

Cc: Gerd Hoffmann <kraxel@redhat.com>                                                                                                                                                         Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/egl-helpers.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 385a3fa752..3a88245b67 100644
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
-- 
2.17.1


