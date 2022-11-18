Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9A162EB9C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 03:05:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovqko-0007rz-HQ; Thu, 17 Nov 2022 21:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqkn-0007rD-23
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:17 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqkk-0008UX-P5
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668737114; x=1700273114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0CDU+QcjUNRnuQu6lFdJk8fyZBNFp/cGaLFC8nvqalI=;
 b=nXHQAeKLfkyyM5iTJhWyN+U9IHggU/jnWqVIa1Bx5fke4wryHEL3UFpB
 m3NhFmjLLfhb4uH9EwKWKFGgngygfBAGe97D+6IW+2d+BgoNBMiUX/fu6
 Ex6dnl3dlYpAairtpVh5/74b0Ml8GLx1+rCcCxfCILcb3JHqS863MZ9eZ
 H+4z4WyhghsaeS6btvHyGwWPjA3f1A0IJ4ZLQdWJ+PCMMNkhDl/MMbcq1
 jJr4vssYSClc7pdDkqWxppyHuqS3vYgodHpz3CYhSoinm1QKvIPHBs8y5
 XaoZZxkMZaj7xC3453GAtSWUk4a0CXH1KD32vAh0AzRKVmHGURMdsUSsg A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="296393529"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="296393529"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="634270865"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="634270865"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:05 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v2 4/6] ui/gtk: Disable the scanout when a detached tab is
 closed
Date: Thu, 17 Nov 2022 17:44:24 -0800
Message-Id: <20221118014426.182599-5-vivek.kasireddy@intel.com>
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
index 35f917ceb1..396cb6590a 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -214,6 +214,8 @@ void gd_egl_scanout_disable(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
+                   vc->gfx.esurface, vc->gfx.ectx);
     vc->gfx.w = 0;
     vc->gfx.h = 0;
     gtk_egl_set_scanout_mode(vc, false);
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 6799805f8e..816f213158 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -275,6 +275,7 @@ void gd_gl_area_scanout_disable(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
     gtk_gl_area_set_scanout_mode(vc, false);
 }
 
@@ -283,6 +284,7 @@ void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
     if (vc->gfx.guest_fb.dmabuf) {
         graphic_hw_gl_block(vc->gfx.dcl.con, true);
         vc->gfx.guest_fb.dmabuf->draw_submitted = true;
diff --git a/ui/gtk.c b/ui/gtk.c
index 8ccc948813..4ac3655694 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1367,6 +1367,7 @@ static gboolean gd_tab_window_close(GtkWidget *widget, GdkEvent *event,
     VirtualConsole *vc = opaque;
     GtkDisplayState *s = vc->s;
 
+    dpy_gl_scanout_disable(vc->gfx.dcl.con);
     gtk_widget_set_sensitive(vc->menu_item, true);
     gd_widget_reparent(vc->window, s->notebook, vc->tab_item);
     gtk_notebook_set_tab_label_text(GTK_NOTEBOOK(s->notebook),
-- 
2.37.2


