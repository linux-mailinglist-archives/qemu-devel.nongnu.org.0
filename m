Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056636ADE26
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:59:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVwx-00043S-V2; Tue, 07 Mar 2023 06:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVwv-0003tY-JU
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVwu-00037q-5j
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678190263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tGh20aFBMd/ysU+6R1OS2Y6iV2bWlbvY0yYLpsHUyYU=;
 b=iAhoi3vJ0CR590cXy6XwyAW6zTvXErM1HRXaNpffI2KZOdSBmwNxkudyT//xw13IWHv/NO
 /o5Rrb8WG2WNgk/pLqTGN1ZAAqVruL1rIO8+Ye5oKAVC1WGA1OS5b1VXJ9NO1D/u1f0pwe
 gX3GKbTh+m31YQ5+QbFldidz4p8thrs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-uz0S8PTQNW-X9zRGS3GigQ-1; Tue, 07 Mar 2023 06:57:40 -0500
X-MC-Unique: uz0S8PTQNW-X9zRGS3GigQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 251EC280A323;
 Tue,  7 Mar 2023 11:57:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49FC52166B26;
 Tue,  7 Mar 2023 11:57:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 13/18] ui/egl: print EGL error, helping debugging
Date: Tue,  7 Mar 2023 15:56:32 +0400
Message-Id: <20230307115637.2464377-14-marcandre.lureau@redhat.com>
In-Reply-To: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/egl-helpers.c | 54 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 3a88245b67..10772b6471 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -26,6 +26,48 @@ DisplayGLMode qemu_egl_mode;
 
 /* ------------------------------------------------------------------ */
 
+#if defined(CONFIG_X11) || defined(CONFIG_GBM)
+static const char *egl_get_error_string(void)
+{
+    EGLint error = eglGetError();
+
+    switch (error) {
+        case EGL_SUCCESS:
+            return "EGL_SUCCESS";
+        case EGL_NOT_INITIALIZED:
+            return "EGL_NOT_INITIALIZED";
+        case EGL_BAD_ACCESS:
+            return "EGL_BAD_ACCESS";
+        case EGL_BAD_ALLOC:
+            return "EGL_BAD_ALLOC";
+        case EGL_BAD_ATTRIBUTE:
+            return "EGL_BAD_ATTRIBUTE";
+        case EGL_BAD_CONTEXT:
+            return "EGL_BAD_CONTEXT";
+        case EGL_BAD_CONFIG:
+            return "EGL_BAD_CONFIG";
+        case EGL_BAD_CURRENT_SURFACE:
+            return "EGL_BAD_CURRENT_SURFACE";
+        case EGL_BAD_DISPLAY:
+            return "EGL_BAD_DISPLAY";
+        case EGL_BAD_SURFACE:
+            return "EGL_BAD_SURFACE";
+        case EGL_BAD_MATCH:
+            return "EGL_BAD_MATCH";
+        case EGL_BAD_PARAMETER:
+            return "EGL_BAD_PARAMETER";
+        case EGL_BAD_NATIVE_PIXMAP:
+            return "EGL_BAD_NATIVE_PIXMAP";
+        case EGL_BAD_NATIVE_WINDOW:
+            return "EGL_BAD_NATIVE_WINDOW";
+        case EGL_CONTEXT_LOST:
+            return "EGL_CONTEXT_LOST";
+        default:
+            return "Unknown EGL error";
+    }
+}
+#endif
+
 static void egl_fb_delete_texture(egl_fb *fb)
 {
     if (!fb->delete_texture) {
@@ -438,20 +480,20 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,
 
     qemu_egl_display = qemu_egl_get_display(dpy, platform);
     if (qemu_egl_display == EGL_NO_DISPLAY) {
-        error_report("egl: eglGetDisplay failed");
+        error_report("egl: eglGetDisplay failed: %s", egl_get_error_string());
         return -1;
     }
 
     b = eglInitialize(qemu_egl_display, &major, &minor);
     if (b == EGL_FALSE) {
-        error_report("egl: eglInitialize failed");
+        error_report("egl: eglInitialize failed: %s", egl_get_error_string());
         return -1;
     }
 
     b = eglBindAPI(gles ?  EGL_OPENGL_ES_API : EGL_OPENGL_API);
     if (b == EGL_FALSE) {
-        error_report("egl: eglBindAPI failed (%s mode)",
-                     gles ? "gles" : "core");
+        error_report("egl: eglBindAPI failed (%s mode): %s",
+                     gles ? "gles" : "core", egl_get_error_string());
         return -1;
     }
 
@@ -459,8 +501,8 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,
                         gles ? conf_att_gles : conf_att_core,
                         &qemu_egl_config, 1, &n);
     if (b == EGL_FALSE || n != 1) {
-        error_report("egl: eglChooseConfig failed (%s mode)",
-                     gles ? "gles" : "core");
+        error_report("egl: eglChooseConfig failed (%s mode): %s",
+                     gles ? "gles" : "core", egl_get_error_string());
         return -1;
     }
 
-- 
2.39.2


