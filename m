Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5503D6987
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 00:29:05 +0200 (CEST)
Received: from localhost ([::1]:35708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m895s-0003am-7V
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 18:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m894d-0001dX-7R
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 18:27:47 -0400
Received: from mga11.intel.com ([192.55.52.93]:11570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m894b-00072n-6Z
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 18:27:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="209216063"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="209216063"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 15:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="474148870"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.215])
 by fmsmga008.fm.intel.com with ESMTP; 26 Jul 2021 15:27:37 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] ui/gtk: calling gd_gl_frame_counter at every draw/swap
Date: Mon, 26 Jul 2021 15:25:50 -0700
Message-Id: <20210726222551.28795-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210726222551.28795-1-dongwon.kim@intel.com>
References: <20210726222551.28795-1-dongwon.kim@intel.com>
Received-SPF: pass client-ip=192.55.52.93; envelope-from=dongwon.kim@intel.com;
 helo=mga11.intel.com
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
Cc: Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For FPS calculation, gd_gl_frame_counter is called at every
draw(gtk-gl-area) or swap(gtk-egl) activity.

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk-egl.c     | 2 ++
 ui/gtk-gl-area.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 2a2e6d3a17..ac56f5b9f4 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -89,6 +89,7 @@ void gd_egl_draw(VirtualConsole *vc)
 
         eglSwapBuffers(qemu_egl_display, vc->gfx.esurface);
 
+        gd_gl_count_frame(&vc->gfx.dcl, false);
         vc->gfx.scale_x = (double)ww / surface_width(vc->gfx.ds);
         vc->gfx.scale_y = (double)wh / surface_height(vc->gfx.ds);
     }
@@ -290,6 +291,7 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
     }
 
     eglSwapBuffers(qemu_egl_display, vc->gfx.esurface);
+    gd_gl_count_frame(&vc->gfx.dcl, false);
 }
 
 void gtk_egl_init(DisplayGLMode mode)
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index dd5783fec7..a18b6ff425 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -72,6 +72,7 @@ void gd_gl_area_draw(VirtualConsole *vc)
     }
 
     glFlush();
+    gd_gl_count_frame(&vc->gfx.dcl, false);
     graphic_hw_gl_flushed(vc->gfx.dcl.con);
 }
 
-- 
2.17.1


