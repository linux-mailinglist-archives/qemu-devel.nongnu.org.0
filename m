Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B752A47BB23
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:33:11 +0100 (CET)
Received: from localhost ([::1]:34782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZe2-0003IL-Qq
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:33:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZAB-0004C5-9O
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:02:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZA9-00022S-Hn
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2gixnKrZkqUGvGNbm+vktxqOAHCbEyotYV6HIRvHvAc=;
 b=ONH9ztYOFi++8rsM3Oqmbb3w317GN8yJbXMT2dugsVg3itqJy/3x0Js1rek8WwJ17keXUI
 LOgugGAsvXc3GjeIyseKk9WSU13CVHEQba5VLk+SHcB3VuV0FqS2tUR/xMoJazYKz5ahUS
 z9tcvtvKmSl4qe7gwh6lhlksGQwy+N0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-WLjTTdToNpS81pa9vnG5Zg-1; Tue, 21 Dec 2021 02:02:11 -0500
X-MC-Unique: WLjTTdToNpS81pa9vnG5Zg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6F181006AA9;
 Tue, 21 Dec 2021 07:02:10 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF6277EA2E;
 Tue, 21 Dec 2021 07:02:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 11/36] ui: associate GL context outside of display listener
 registration
Date: Tue, 21 Dec 2021 10:58:30 +0400
Message-Id: <20211221065855.142578-12-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Consoles can have an associated GL context, without listeners (they may
be added or removed later on).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c       | 7 +++++--
 ui/egl-headless.c  | 1 +
 ui/gtk.c           | 3 +++
 ui/sdl2.c          | 3 +++
 ui/spice-display.c | 3 +++
 5 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 7b83e6cdea77..87f897e46dc4 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1465,8 +1465,11 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
 
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
index a26a2520c496..08327c40c6ee 100644
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
index c0d8a9f061ee..25896023ffe7 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2083,6 +2083,9 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
     vc->gfx.kbd = qkbd_state_init(con);
     vc->gfx.dcl.con = con;
 
+    if (display_opengl) {
+        qemu_console_set_display_gl_ctx(con, &vc->gfx.dcl);
+    }
     register_displaychangelistener(&vc->gfx.dcl);
 
     gd_connect_vc_gfx_signals(vc);
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 9ba3bc49e798..bb186a381acd 100644
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
index 52d9f3260aab..2c204bceee27 100644
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
2.34.1.8.g35151cf07204


