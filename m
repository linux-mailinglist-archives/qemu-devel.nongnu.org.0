Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87A662EB9E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 03:05:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovqkn-0007rB-0Z; Thu, 17 Nov 2022 21:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqkk-0007qR-9f
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:14 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqki-0008UF-Kt
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668737112; x=1700273112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hxKMkVLMF/xiKJRXg+0U8EDrk2c9wtBqfqOnXNGnP1A=;
 b=JPWIiXkamVigLoB4VE8cR8JOKqxJyC89PoSeY51FeGFXk4zPrWMAR/76
 CuFv/dQTyGFDdj/RGUtLDQ2gjpnI7UnvDu4CoOvF3QdCb2ybKG8GgWruY
 wqRhYZZakchYuEztL8aU1kJHC5A6JFLbM1VfuXLVG3SxxRY4xhUpmXLIQ
 woShY59FQ4GvUQjCRGbdpoxuP5zRICmBPmRLU+lgM26BhAH7Q18/kOx4D
 EafVPJQEirt3Gsmu2i11W75tv0bsnN4Ctb+auW2ax1TOaIGnpNGC2QYMJ
 lIAoRcmhgCsRe9U1/jKo/wpcrR4wFO71qTImLXhM1iEvhaQq6SettBfRX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="296393527"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="296393527"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="634270858"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="634270858"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:05 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v2 2/6] ui/gtk-gl-area: Don't forget to calculate the scaling
 factors in draw
Date: Thu, 17 Nov 2022 17:44:22 -0800
Message-Id: <20221118014426.182599-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118014426.182599-1-vivek.kasireddy@intel.com>
References: <20221118014426.182599-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

Just like it is done in gtk-egl.c, we need to ensure that the scaling
factors are correctly calculated in draw callback. Otherwise, they
would just be set to 1.0. And, use gtk_widget_get_allocated_width/height
variants to determine width and height in the Wayland case similar to
how it is done in draw.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 ui/gtk-gl-area.c | 5 +++++
 ui/gtk.c         | 9 +++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 682638a197..6799805f8e 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -81,6 +81,9 @@ void gd_gl_area_draw(VirtualConsole *vc)
             egl_dmabuf_create_sync(dmabuf);
         }
 #endif
+        vc->gfx.scale_x = (double)ww / vc->gfx.w;
+        vc->gfx.scale_y = (double)wh / vc->gfx.h;
+
         glFlush();
 #ifdef CONFIG_GBM
         if (dmabuf) {
@@ -100,6 +103,8 @@ void gd_gl_area_draw(VirtualConsole *vc)
 
         surface_gl_setup_viewport(vc->gfx.gls, vc->gfx.ds, ww, wh);
         surface_gl_render_texture(vc->gfx.gls, vc->gfx.ds);
+        vc->gfx.scale_x = (double)ww / vc->gfx.w;
+        vc->gfx.scale_y = (double)wh / vc->gfx.h;
     }
 }
 
diff --git a/ui/gtk.c b/ui/gtk.c
index 6c23903173..9d0c27c9e7 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -883,9 +883,14 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     fbh = surface_height(vc->gfx.ds) * vc->gfx.scale_y;
 
     window = gtk_widget_get_window(vc->gfx.drawing_area);
-    ww = gdk_window_get_width(window);
-    wh = gdk_window_get_height(window);
     ws = gdk_window_get_scale_factor(window);
+    if (GDK_IS_WAYLAND_DISPLAY(dpy)) {
+        ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area);
+        wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area);
+    } else {
+        ww = gdk_window_get_width(window);
+        wh = gdk_window_get_height(window);
+    }
 
     mx = my = 0;
     if (ww > fbw) {
-- 
2.37.2


