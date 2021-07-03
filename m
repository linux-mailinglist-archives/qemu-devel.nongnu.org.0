Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D03BA671
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 02:32:34 +0200 (CEST)
Received: from localhost ([::1]:33338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzTaD-0000Vl-Pv
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 20:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1lzTXV-0004h3-UH
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 20:29:45 -0400
Received: from mga05.intel.com ([192.55.52.43]:55265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1lzTXQ-000591-MK
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 20:29:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="294440825"
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="294440825"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 17:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="482953732"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.215])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Jul 2021 17:29:37 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] ui/gtk-egl: make sure the right context is set as the
 current
Date: Fri,  2 Jul 2021 17:28:08 -0700
Message-Id: <20210703002809.26753-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210703002809.26753-1-dongwon.kim@intel.com>
References: <20210703002809.26753-1-dongwon.kim@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=dongwon.kim@intel.com;
 helo=mga05.intel.com
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
Cc: Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Making the vc->gfx.ectx current before handling textures
associated with it

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk-egl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 2a2e6d3a17..32516b806c 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -126,6 +126,7 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
         }
         vc->gfx.gls = qemu_gl_init_shader();
         if (vc->gfx.ds) {
+            surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
             surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
         }
     }
@@ -152,6 +153,8 @@ void gd_egl_switch(DisplayChangeListener *dcl,
         surface_height(vc->gfx.ds) == surface_height(surface)) {
         resized = false;
     }
+    eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
+                   vc->gfx.esurface, vc->gfx.ectx);
 
     surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
     vc->gfx.ds = surface;
@@ -209,6 +212,11 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl,
                            QemuDmaBuf *dmabuf)
 {
 #ifdef CONFIG_GBM
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+
+    eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
+                   vc->gfx.esurface, vc->gfx.ectx);
+
     egl_dmabuf_import_texture(dmabuf);
     if (!dmabuf->texture) {
         return;
-- 
2.17.1


