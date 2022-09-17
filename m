Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913625BB503
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 02:29:30 +0200 (CEST)
Received: from localhost ([::1]:49184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZLi5-0008Rg-Dd
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 20:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1oZLgC-0005l6-NM
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 20:27:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:23527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1oZLgB-0000iY-4u
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 20:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663374451; x=1694910451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tyQ9swSZYvERopPc45XEuZ3lVkPVWxE8P613hgl7eIA=;
 b=fhnf/GlNWkTk9nPem6ehWLlrS53S9a4rHeAw7VH9MrJedUzfTVXXTDNU
 644H9w/sTTD0qSHb6NoQ3ABW/gwvbSsWYuUptywS0BI6qv1+UJWOMamoA
 dSo0JCXGAwwfvfL/BTGF6OEO5tkAV6sj3dZesWYPB+ZqWJ+lV7V9r9s74
 gTWzmDIt9R5XMka5BoHEtZeGzQsqdLlEBmMRqz9FDFJZPQ/hxF0fMSBUu
 jbWpF/touPSnqRBBrM8+DoQy8neOLECEpKy+3H0XWvbcGpnd3dG6kQ1Z9
 oOeN9TARzvW3wVIHltIZiHSdvWDqij6OFCTi3tuuj1+fSe3JhJoxzLUa+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="279489394"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; d="scan'208";a="279489394"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 17:27:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; d="scan'208";a="760235121"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 17:27:20 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v1 1/3] ui/gtk: Disable the scanout when a detached tab is
 closed
Date: Fri, 16 Sep 2022 17:07:29 -0700
Message-Id: <20220917000731.465003-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220917000731.465003-1-vivek.kasireddy@intel.com>
References: <20220917000731.465003-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a detached tab window is closed, the underlying (EGL) context
is destroyed; therefore, disable the scanout which also destroys the
underlying framebuffer (id) and other objects. Also add calls to
make the context current in disable scanout and other missing places.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 ui/gtk-egl.c     | 2 ++
 ui/gtk-gl-area.c | 2 ++
 ui/gtk.c         | 1 +
 3 files changed, 5 insertions(+)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index b5bffbab25..0f9ef11f4c 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -211,6 +211,8 @@ void gd_egl_scanout_disable(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
+                   vc->gfx.esurface, vc->gfx.ectx);
     vc->gfx.w = 0;
     vc->gfx.h = 0;
     gtk_egl_set_scanout_mode(vc, false);
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 682638a197..0b9fd4713a 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -270,6 +270,7 @@ void gd_gl_area_scanout_disable(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
     gtk_gl_area_set_scanout_mode(vc, false);
 }
 
@@ -278,6 +279,7 @@ void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
     if (vc->gfx.guest_fb.dmabuf) {
         graphic_hw_gl_block(vc->gfx.dcl.con, true);
         vc->gfx.guest_fb.dmabuf->draw_submitted = true;
diff --git a/ui/gtk.c b/ui/gtk.c
index 1467b8c7d7..0ff31cb852 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1302,6 +1302,7 @@ static gboolean gd_tab_window_close(GtkWidget *widget, GdkEvent *event,
     VirtualConsole *vc = opaque;
     GtkDisplayState *s = vc->s;
 
+    dpy_gl_scanout_disable(vc->gfx.dcl.con);
     gtk_widget_set_sensitive(vc->menu_item, true);
     gd_widget_reparent(vc->window, s->notebook, vc->tab_item);
     gtk_notebook_set_tab_label_text(GTK_NOTEBOOK(s->notebook),
-- 
2.37.2


