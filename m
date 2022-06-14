Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B454B16C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 14:53:59 +0200 (CEST)
Received: from localhost ([::1]:38652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o163S-0004YX-VA
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 08:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o15TE-0006Xo-7e
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:16:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o15T0-0007kV-KE
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655208978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wx3J1U/WRMVytLzUKnVNwgCHbbzsbHu+DjsV7mqclmI=;
 b=OirqH9wYqTGhJQiCjAbwtwaUkjAo8xKxw8kPD1mzrqlfNMAydjysS+HWU3jO+efIAvFfEz
 /DySSivZ6/TK8G0n9sftWtfUp+MH3mBrm+9czpuwyt4nda0M/aUVizH3Lq5ckVtD6j8fW2
 YVGtXTZWmtG5n63SXsNVI1T5MhejAzk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-wv2AtMAeNLyZQMhe_ogqMQ-1; Tue, 14 Jun 2022 08:16:14 -0400
X-MC-Unique: wv2AtMAeNLyZQMhe_ogqMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C4E4101E9B9;
 Tue, 14 Jun 2022 12:16:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0FD140CF8E5;
 Tue, 14 Jun 2022 12:16:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 08BE21800394; Tue, 14 Jun 2022 14:16:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Canokeys.org" <contact@canokeys.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 02/15] ui/gtk-gl-area: create the requested GL context version
Date: Tue, 14 Jun 2022 14:15:57 +0200
Message-Id: <20220614121610.508356-3-kraxel@redhat.com>
In-Reply-To: <20220614121610.508356-1-kraxel@redhat.com>
References: <20220614121610.508356-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Volker Rümelin <vr_qemu@t-online.de>

Since about 2018 virglrenderer (commit fa835b0f88 "vrend: don't
hardcode context version") tries to open the highest available GL
context version. This is done by creating the known GL context
versions from the highest to the lowest until (*create_gl_context)
returns a context != NULL.

This does not work properly with
the current QEMU gd_gl_area_create_context() function, because
gdk_gl_context_realize() on Wayland creates a version 3.0 legacy
context if the requested GL context version can't be created.

In order for virglrenderer to find the highest available GL
context version, return NULL if the created context version is
lower than the requested version.

This fixes the following error:
QEMU started with -device virtio-vga-gl -display gtk,gl=on.
Under Wayland, the guest window remains black and the following
information can be seen on the host.

gl_version 30 - compat profile
(qemu:5978): Gdk-WARNING **: 16:19:01.533:
  gdk_gl_context_set_required_version
  - GL context versions less than 3.2 are not supported.

(qemu:5978): Gdk-WARNING **: 16:19:01.537:
  gdk_gl_context_set_required_version -
  GL context versions less than 3.2 are not supported.

(qemu:5978): Gdk-WARNING **: 16:19:01.554:
  gdk_gl_context_set_required_version -
  GL context versions less than 3.2 are not supported.
vrend_renderer_fill_caps: Entering with stale GL error: 1282

To reproduce this error, an OpenGL driver is required on the host
that doesn't have the latest OpenGL extensions fully implemented.
An example for this is the Intel i965 driver on a Haswell processor.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220605085131.7711-2-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk-gl-area.c | 31 ++++++++++++++++++++++++++++++-
 ui/trace-events  |  1 +
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 0e20ea031d34..2e0129c28cd4 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -170,6 +170,23 @@ void gd_gl_area_switch(DisplayChangeListener *dcl,
     }
 }
 
+static int gd_cmp_gl_context_version(int major, int minor, QEMUGLParams *params)
+{
+    if (major > params->major_ver) {
+        return 1;
+    }
+    if (major < params->major_ver) {
+        return -1;
+    }
+    if (minor > params->minor_ver) {
+        return 1;
+    }
+    if (minor < params->minor_ver) {
+        return -1;
+    }
+    return 0;
+}
+
 QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
                                         QEMUGLParams *params)
 {
@@ -177,8 +194,8 @@ QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
     GdkWindow *window;
     GdkGLContext *ctx;
     GError *err = NULL;
+    int major, minor;
 
-    gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
     window = gtk_widget_get_window(vc->gfx.drawing_area);
     ctx = gdk_window_create_gl_context(window, &err);
     if (err) {
@@ -196,6 +213,18 @@ QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
         g_clear_object(&ctx);
         return NULL;
     }
+
+    gdk_gl_context_make_current(ctx);
+    gdk_gl_context_get_version(ctx, &major, &minor);
+    gdk_gl_context_clear_current();
+    gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
+
+    if (gd_cmp_gl_context_version(major, minor, params) == -1) {
+        /* created ctx version < requested version */
+        g_clear_object(&ctx);
+    }
+
+    trace_gd_gl_area_create_context(ctx, params->major_ver, params->minor_ver);
     return ctx;
 }
 
diff --git a/ui/trace-events b/ui/trace-events
index 1040ba0f88c7..a922f00e10b4 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -26,6 +26,7 @@ gd_key_event(const char *tab, int gdk_keycode, int qkeycode, const char *action)
 gd_grab(const char *tab, const char *device, const char *reason) "tab=%s, dev=%s, reason=%s"
 gd_ungrab(const char *tab, const char *device) "tab=%s, dev=%s"
 gd_keymap_windowing(const char *name) "backend=%s"
+gd_gl_area_create_context(void *ctx, int major, int minor) "ctx=%p, major=%d, minor=%d"
 gd_gl_area_destroy_context(void *ctx, void *current_ctx) "ctx=%p, current_ctx=%p"
 
 # vnc-auth-sasl.c
-- 
2.36.1


