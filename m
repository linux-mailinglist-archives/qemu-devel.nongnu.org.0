Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D9C310561
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:02:53 +0100 (CET)
Received: from localhost ([::1]:55530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7v8m-0001Pi-Ak
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v3C-0001aq-8H
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v3A-0001GX-G0
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M5SiARYe+zPlDMCfmpU/QNa2lVQou6q45g7z7XGtaJU=;
 b=F3zF7oQiEe7GwXQvgq2/2vJ/YJQg2/tHCANQ91BJKWUl9CQhBPUodkuqOCVkJasb1gTl8q
 CzrWdpfWlTp5Ih0hvpNaOW5nUVwLlFE1RguSMgvWXxABVMNbz01GHdMCpVitTCnZXDyBoy
 +0zFDuzHzfncZ+MxjlqJp3g4oDa2Ehs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-2a109_36Prm7ZpjRpmZkzw-1; Fri, 05 Feb 2021 01:57:02 -0500
X-MC-Unique: 2a109_36Prm7ZpjRpmZkzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C579192CC42
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:57:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D66D163F3;
 Fri,  5 Feb 2021 06:56:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7A3071800600; Fri,  5 Feb 2021 07:56:21 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/24] ui: add egl dmabuf import to gtkglarea
Date: Fri,  5 Feb 2021 07:56:16 +0100
Message-Id: <20210205065620.1726554-21-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

GtkGLArea is used on wayland, where EGL is usually available.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-17-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/gtk.h |  2 ++
 ui/gtk-gl-area.c | 18 ++++++++++++++++++
 ui/gtk.c         | 22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index aaef884b95b4..3c1cd98db8b1 100644
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
index 96fbe75387ce..72bcd949180f 100644
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
index f41c396cb98a..79dc2401203a 100644
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
2.29.2


