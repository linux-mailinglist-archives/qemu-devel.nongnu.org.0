Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5804B38FC
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 03:45:35 +0100 (CET)
Received: from localhost ([::1]:59790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ4tK-00078s-Sl
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 21:45:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4ql-0004Pu-US
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:56 -0500
Received: from [2607:f8b0:4864:20::42f] (port=36447
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4qf-0000Pu-RH
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:55 -0500
Received: by mail-pf1-x42f.google.com with SMTP id z16so1274340pfh.3
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 18:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6J3OkXWdj9Qz8OpmIJ3N1XUEHHUnyt00cCsFaBmK0g=;
 b=U5zSK6F1ytH/cklDoGCMXut5B5UpfVa+jnTXFAWxGg1EJ+cNgZLBd5N8cK08JwX3dP
 /3VMEtHeH6QasxZFCjovwCfiHOGNF8BMbmA0rn6kQUOc5Nmo3jaTooXjsWRJtUPvMlnu
 66RLIIB/tKjy4ZnS+1OE0XVT9sEcIKnx674EwF2eOBhcIMNl1bQ9g0QQQkWQnQohvrW2
 Teid5f/VsciPV0PBq4KkK5UKFo56AWfpXci2bRnbSC11WjEqG8j0sopaLb50gAf5X9VL
 elllfOjoiNLLuk/y5GLAMjHJMW7FuizKiybsxV+loYEwZXm2HJig6Ii3E1nkpvGTJh9a
 yy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6J3OkXWdj9Qz8OpmIJ3N1XUEHHUnyt00cCsFaBmK0g=;
 b=Z73GwZQZZZ/duPPolbOhY5d9PaIC8o6j5jirtzsH1e/Go4NYdrEcKurmdChYuPHiVz
 Yj7sJ82bvm2ylKdfAZGLSyC94l84J32xZfEVwf0JaMa/vV5j/SyJGNkWPF4/in3k+fpl
 xdS3tRiaTXlODHNbvNQtGYIUbmGstSpkUQqEWx6UUy9C3pcpCAT6MdL9VCIQ1iVk8j9t
 jNjsuYLW98NupNPHR7siIEmKF2jY+XaJ8yam286EOS2OZipuI5OWMn3FJaWyZZpG3gTD
 +iRdOk9tsfaSuM17tTC+AZBXLu4oTdHx4MQgkSXODl2FukPIxnHaHEGNCaRgG99Rpftx
 cWBw==
X-Gm-Message-State: AOAM532cueILWRzceQZfgzEIpsKFXhC917EzBmQVdyNKkml9m2Sfd8QW
 bbLkgdUlZy20x55u2O9pTfnoS/MPVPg=
X-Google-Smtp-Source: ABdhPJyTDt08S0zdltD6oVUbeumPLnHSHuJzCMKbavSi1P4AdLbbnc7aC7jT1MobgNSI/MwmDSAspw==
X-Received: by 2002:aa7:999b:: with SMTP id k27mr8542791pfh.38.1644720168591; 
 Sat, 12 Feb 2022 18:42:48 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d85b:35dd:dae2:b7a9])
 by smtp.gmail.com with ESMTPSA id l11sm9128954pjm.23.2022.02.12.18.42.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Feb 2022 18:42:48 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 5/6] Revert "ui: associate GL context outside of display
 listener registration"
Date: Sun, 13 Feb 2022 11:42:21 +0900
Message-Id: <20220213024222.3548-6-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220213024222.3548-1-akihiko.odaki@gmail.com>
References: <20220213024222.3548-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit ac32b2fff127843355b4f7e7ac9f93dd4a395adf.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/console.c       | 7 ++-----
 ui/egl-headless.c  | 1 -
 ui/gtk.c           | 3 ---
 ui/sdl2.c          | 3 ---
 ui/spice-display.c | 3 ---
 5 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 6f21007737e..f3d72655bb6 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1480,11 +1480,8 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
 
     assert(!dcl->ds);
 
-    if (dcl->con && dcl->con->gl &&
-        dcl->con->gl != dcl) {
-        error_report("Display %s is incompatible with the GL context",
-                     dcl->ops->dpy_name);
-        exit(1);
+    if (dcl->ops->dpy_gl_ctx_create) {
+        qemu_console_set_display_gl_ctx(dcl->con, dcl);
     }
 
     if (dcl->con) {
diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index 08327c40c6e..a26a2520c49 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -197,7 +197,6 @@ static void egl_headless_init(DisplayState *ds, DisplayOptions *opts)
         edpy->dcl.con = con;
         edpy->dcl.ops = &egl_ops;
         edpy->gls = qemu_gl_init_shader();
-        qemu_console_set_display_gl_ctx(con, &edpy->dcl);
         register_displaychangelistener(&edpy->dcl);
     }
 }
diff --git a/ui/gtk.c b/ui/gtk.c
index ca29dde6cbd..b31e900ebda 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2112,9 +2112,6 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
     vc->gfx.kbd = qkbd_state_init(con);
     vc->gfx.dcl.con = con;
 
-    if (display_opengl) {
-        qemu_console_set_display_gl_ctx(con, &vc->gfx.dcl);
-    }
     register_displaychangelistener(&vc->gfx.dcl);
 
     gd_connect_vc_gfx_signals(vc);
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 628ae33245f..4117b4ac6e7 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -871,9 +871,6 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
 #endif
         sdl2_console[i].dcl.con = con;
         sdl2_console[i].kbd = qkbd_state_init(con);
-        if (display_opengl) {
-            qemu_console_set_display_gl_ctx(con, &sdl2_console[i].dcl);
-        }
         register_displaychangelistener(&sdl2_console[i].dcl);
 
 #if defined(SDL_VIDEO_DRIVER_WINDOWS) || defined(SDL_VIDEO_DRIVER_X11)
diff --git a/ui/spice-display.c b/ui/spice-display.c
index bf057bc95f5..07234d49594 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -1158,9 +1158,6 @@ static void qemu_spice_display_init_one(QemuConsole *con)
 
     qemu_spice_create_host_memslot(ssd);
 
-    if (spice_opengl) {
-        qemu_console_set_display_gl_ctx(con, &ssd->dcl);
-    }
     register_displaychangelistener(&ssd->dcl);
 }
 
-- 
2.32.0 (Apple Git-132)


