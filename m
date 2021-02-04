Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD530F17B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:04:38 +0100 (CET)
Received: from localhost ([::1]:56218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cRB-0003z9-Fh
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cIf-0000yF-RX
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:55:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cIe-0000N8-0J
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tHU9eQ8/lwEMfkMk5/jGnEOGPo9ByyH5DGiXx/j9cZ0=;
 b=J5jJoOiEsijzHkamsylxcJsUycOxqXLE8ajDzmSq/Vs+nmyKHwsbz2u3HtONP0Aop2eURo
 uE4e4RbSXil6XiYgepw8iojBTKq+O95eMlK1qTMyN7Pacomk3i5rZsX5sEOxcIzIlswJ2s
 d8oiCKuQ24BThsdasqfxJt8P9uEvgH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-HGJZMuZ_O7-zlixZh0ty1Q-1; Thu, 04 Feb 2021 05:55:44 -0500
X-MC-Unique: HGJZMuZ_O7-zlixZh0ty1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAA80801977
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 10:55:43 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DE685B695;
 Thu,  4 Feb 2021 10:55:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/20] ui: add egl dmabuf import to gtkglarea
Date: Thu,  4 Feb 2021 14:52:28 +0400
Message-Id: <20210204105232.834642-17-marcandre.lureau@redhat.com>
In-Reply-To: <20210204105232.834642-1-marcandre.lureau@redhat.com>
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

GtkGLArea is used on wayland, where EGL is usually available.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/gtk.h |  2 ++
 ui/gtk-gl-area.c | 18 ++++++++++++++++++
 ui/gtk.c         | 22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index aaef884b95..3c1cd98db8 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -134,6 +134,8 @@ QEMUGLContext gd_gl_area_create_context(DisplayChangeListener *dcl,
                                         QEMUGLParams *params);
 void gd_gl_area_destroy_context(DisplayChangeListener *dcl,
                                 QEMUGLContext ctx);
+void gd_gl_area_scanout_dmabuf(DisplayChangeListener *dcl,
+                               QemuDmaBuf *dmabuf);
 void gd_gl_area_scanout_texture(DisplayChangeListener *dcl,
                                 uint32_t backing_id,
                                 bool backing_y_0_top,
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 96fbe75387..72bcd94918 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -213,6 +213,24 @@ void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
     gtk_gl_area_queue_render(GTK_GL_AREA(vc->gfx.drawing_area));
 }
 
+void gd_gl_area_scanout_dmabuf(DisplayChangeListener *dcl,
+                               QemuDmaBuf *dmabuf)
+{
+#ifdef CONFIG_OPENGL_DMABUF
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+
+    gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
+    egl_dmabuf_import_texture(dmabuf);
+    if (!dmabuf->texture) {
+        return;
+    }
+
+    gd_gl_area_scanout_texture(dcl, dmabuf->texture,
+                               false, dmabuf->width, dmabuf->height,
+                               0, 0, dmabuf->width, dmabuf->height);
+#endif
+}
+
 void gtk_gl_area_init(void)
 {
     display_opengl = 1;
diff --git a/ui/gtk.c b/ui/gtk.c
index f41c396cb9..79dc240120 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -627,6 +627,12 @@ static bool gd_has_dmabuf(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    if (gtk_use_gl_area && !gtk_widget_get_realized(vc->gfx.drawing_area)) {
+        /* FIXME: Assume it will work, actual check done after realize */
+        /* fixing this would require delaying listener registration */
+        return true;
+    }
+
     return vc->gfx.has_dmabuf;
 }
 
@@ -647,6 +653,8 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_gl_scanout_texture  = gd_gl_area_scanout_texture,
     .dpy_gl_scanout_disable  = gd_gl_area_scanout_disable,
     .dpy_gl_update           = gd_gl_area_scanout_flush,
+    .dpy_gl_scanout_dmabuf   = gd_gl_area_scanout_dmabuf,
+    .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
 static const DisplayChangeListenerOps dcl_egl_ops = {
@@ -1983,6 +1991,18 @@ static GtkWidget *gd_create_menu_machine(GtkDisplayState *s)
     return machine_menu;
 }
 
+#if defined(CONFIG_OPENGL)
+static void gl_area_realize(GtkGLArea *area, VirtualConsole *vc)
+{
+    gtk_gl_area_make_current(area);
+    qemu_egl_display = eglGetCurrentDisplay();
+    vc->gfx.has_dmabuf = qemu_egl_has_dmabuf();
+    if (!vc->gfx.has_dmabuf) {
+        error_report("GtkGLArea console lacks DMABUF support.");
+    }
+}
+#endif
+
 static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
                               QemuConsole *con, int idx,
                               GSList *group, GtkWidget *view_menu)
@@ -1998,6 +2018,8 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
     if (display_opengl) {
         if (gtk_use_gl_area) {
             vc->gfx.drawing_area = gtk_gl_area_new();
+            g_signal_connect(vc->gfx.drawing_area, "realize",
+                             G_CALLBACK(gl_area_realize), vc);
             vc->gfx.dcl.ops = &dcl_gl_area_ops;
         } else {
             vc->gfx.drawing_area = gtk_drawing_area_new();
-- 
2.29.0


