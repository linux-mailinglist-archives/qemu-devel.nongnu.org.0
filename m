Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70843389A6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:07:44 +0100 (CET)
Received: from localhost ([::1]:35940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKehr-0005YU-O6
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKecZ-0007Bu-Bt
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:02:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKecW-0002Vg-Cj
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ZX8ydjlmAN6znczBh8iFPRumuy9vxrO2la01caU/Ek=;
 b=ZhPVsjsWAk/3hOlhUCaBNKzn8B3/ruHB3MVf0sBCUGY+dKpbRjKJBVHCNKU++6z3u5qYWk
 t0yjGC8KsrtFBfBgl4bn++12htrBWVi8/QjNrf6Xd/kuAlNNrDY7yApvnhjpMy/t7RExaA
 6YAG4ORJ2WzpkeSizn788TGzKkUA150=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-6LekOhJpP1-xJgT6iH7TAg-1; Fri, 12 Mar 2021 05:02:08 -0500
X-MC-Unique: 6LekOhJpP1-xJgT6iH7TAg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5582E5761
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:02:07 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C68335D6BA;
 Fri, 12 Mar 2021 10:01:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 06/27] ui: associate GL context outside of display listener
 registration
Date: Fri, 12 Mar 2021 14:00:47 +0400
Message-Id: <20210312100108.2706195-7-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Gerd Hoffmann <kraxel@redhat.com>
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
index 83475bd8c3..53eba2019e 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1524,8 +1524,11 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
 
     assert(!dcl->ds);
 
-    if (dcl->ops->dpy_gl_ctx_create) {
-        qemu_console_set_display_gl_ctx(dcl->con, dcl);
+    if (dcl->con && dcl->con->gl &&
+        dcl->con->gl != dcl) {
+        error_report("Display %s is incompatible with the GL context",
+                     dcl->ops->dpy_name);
+        exit(1);
     }
 
     if (dcl->con && !dpy_compatible_with(dcl->con, dcl, &err)) {
diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index da377a74af..773520bc17 100644
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
index 3edaf041de..d8b3784bf0 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2082,6 +2082,9 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
     vc->gfx.kbd = qkbd_state_init(con);
     vc->gfx.dcl.con = con;
 
+    if (display_opengl) {
+        qemu_console_set_display_gl_ctx(con, &vc->gfx.dcl);
+    }
     register_displaychangelistener(&vc->gfx.dcl);
 
     gd_connect_vc_gfx_signals(vc);
diff --git a/ui/sdl2.c b/ui/sdl2.c
index a203cb0239..0593a333f5 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -863,6 +863,9 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
 #endif
         sdl2_console[i].dcl.con = con;
         sdl2_console[i].kbd = qkbd_state_init(con);
+        if (display_opengl) {
+            qemu_console_set_display_gl_ctx(con, &sdl2_console[i].dcl);
+        }
         register_displaychangelistener(&sdl2_console[i].dcl);
 
 #if defined(SDL_VIDEO_DRIVER_WINDOWS) || defined(SDL_VIDEO_DRIVER_X11)
diff --git a/ui/spice-display.c b/ui/spice-display.c
index d22781a23d..f637fd1bc6 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -1152,6 +1152,9 @@ static void qemu_spice_display_init_one(QemuConsole *con)
 
     qemu_spice_create_host_memslot(ssd);
 
+    if (spice_opengl) {
+        qemu_console_set_display_gl_ctx(con, &ssd->dcl);
+    }
     register_displaychangelistener(&ssd->dcl);
 }
 
-- 
2.29.0


