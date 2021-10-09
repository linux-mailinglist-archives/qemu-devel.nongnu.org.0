Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D68B427D9A
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:20:50 +0200 (CEST)
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJlv-0006sW-Of
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJdJ-00029U-H1
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:11:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJdG-00009x-Rb
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYXEWkpz/G5frXzaBQHUrfLk7Vx5eg09b3UXZg1bJ/U=;
 b=FJ8JAa5xthMRjv2s15qNGxaeOccdWZWQ0f0PEodJP3HwZq9iNIRz1Qi4bMRrtz/yeO9gaF
 916oU1mUHRcLzpBhlcgiprmh+Ix9zSoOAdWcwQWiVQh8WvH5IgW3fzSCJSQlyQMBlwRkOa
 /GJtIs2lR4PcWjRDz1n2pWPu/uYIWJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-wS3Ov_xdNbefBlpCUwFQtg-1; Sat, 09 Oct 2021 17:11:49 -0400
X-MC-Unique: wS3Ov_xdNbefBlpCUwFQtg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 645348145E5
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:11:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A67355F707;
 Sat,  9 Oct 2021 21:11:34 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/37] ui: associate GL context outside of display listener
 registration
Date: Sun, 10 Oct 2021 01:08:13 +0400
Message-Id: <20211009210838.2219430-13-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c       | 7 +++++--
 ui/egl-headless.c  | 1 +
 ui/gtk.c           | 3 +++
 ui/sdl2.c          | 3 +++
 ui/spice-display.c | 3 +++
 5 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 64f35e163c..3c4012271c 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1523,8 +1523,11 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
 
     assert(!dcl->ds);
 
-    if (dcl->ops->dpy_gl_ctx_create) {
-        qemu_console_set_display_gl_ctx(dcl->con, dcl);
+    if (dcl->con && dcl->con->gl &&
+        dcl->con->gl != dcl) {
+        error_report("Display %s is incompatible with the GL context",
+                     dcl->ops->dpy_name);
+        exit(1);
     }
 
     if (dcl->con) {
diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index a26a2520c4..08327c40c6 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -197,6 +197,7 @@ static void egl_headless_init(DisplayState *ds, DisplayOptions *opts)
         edpy->dcl.con = con;
         edpy->dcl.ops = &egl_ops;
         edpy->gls = qemu_gl_init_shader();
+        qemu_console_set_display_gl_ctx(con, &edpy->dcl);
         register_displaychangelistener(&edpy->dcl);
     }
 }
diff --git a/ui/gtk.c b/ui/gtk.c
index 163b6bcb6a..f8beddbb91 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2057,6 +2057,9 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
     vc->gfx.kbd = qkbd_state_init(con);
     vc->gfx.dcl.con = con;
 
+    if (display_opengl) {
+        qemu_console_set_display_gl_ctx(con, &vc->gfx.dcl);
+    }
     register_displaychangelistener(&vc->gfx.dcl);
 
     gd_connect_vc_gfx_signals(vc);
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 9ba3bc49e7..bb186a381a 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -866,6 +866,9 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
 #endif
         sdl2_console[i].dcl.con = con;
         sdl2_console[i].kbd = qkbd_state_init(con);
+        if (display_opengl) {
+            qemu_console_set_display_gl_ctx(con, &sdl2_console[i].dcl);
+        }
         register_displaychangelistener(&sdl2_console[i].dcl);
 
 #if defined(SDL_VIDEO_DRIVER_WINDOWS) || defined(SDL_VIDEO_DRIVER_X11)
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 52d9f3260a..2c204bceee 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -1156,6 +1156,9 @@ static void qemu_spice_display_init_one(QemuConsole *con)
 
     qemu_spice_create_host_memslot(ssd);
 
+    if (spice_opengl) {
+        qemu_console_set_display_gl_ctx(con, &ssd->dcl);
+    }
     register_displaychangelistener(&ssd->dcl);
 }
 
-- 
2.33.0.721.g106298f7f9


