Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321E74B38FF
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 03:47:56 +0100 (CET)
Received: from localhost ([::1]:37740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ4vb-0002wc-AX
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 21:47:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4qf-00048K-Nj
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:49 -0500
Received: from [2607:f8b0:4864:20::1033] (port=42564
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4qd-0000Pm-Sb
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:49 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 h7-20020a17090a648700b001b927560c2bso11298923pjj.1
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 18:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rp+h/govsvCwoEBQt5G9e07rjB6ma9uCOn2oeZ8ZouM=;
 b=Al/FXfGmvg9Zqi+oyVTpmMSm9Sb23FRZJWXeZWWF08dXa6VhXGXXzMPsG5I0oasQSD
 HyaQH4hgWlBrhUjRLvExQw7DsbVArRLvd6lzL5aGO1bEME/MZVbIMvwT+oWUCGtUW5b+
 DluzV1k4pC73aHOwFg8CXeoA8xyqYpm3oKX8LYLn5fKO0+3bsKdx2CYdWiHH6+/1wS62
 Zp9wT8Xqq59CsafddkEtnUYifQX01fZ/TKENaT13APO3s/s0PHVDPlpyXo7RNxeIWkWG
 ROrcodtz5Pxqzovw9DjZpFqI7toGys7AS5i2g2CwN/0cT7H77N1lloLSJiC5aRIDsuo7
 f59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rp+h/govsvCwoEBQt5G9e07rjB6ma9uCOn2oeZ8ZouM=;
 b=3vQbi1iY5NZRn9aYe4N/MnhKrHRM5dgSW+RM205xG2j8qkh1RW/RzlgzgsOXf0+BYt
 GqOI0rVqzDHJHYBFz8ytzFz5s8NubunqYaKKcVR7+oQka1+fuTmH3vkJAbYkRkTZRI9A
 tKtwpV478Bkl64XsWn65frMCMTCcfdrtoMIgKG5aZXTCQFuob9NNKJWZyuJ57/euF5Pq
 2uIuk6tMIMoM8uGgCr0o1/djXbYuB0RPekreIxg0d97wMeIA2z1g6xFNKejv4qYmPipb
 SFERYvC1S/Rk2Oi4ke21rdVdb3T7n2v1AdpDwVy2exXB0P20sw1KOVlU64HBpxwccGog
 VPKw==
X-Gm-Message-State: AOAM530rbZ8ylWH5GO1JKuNFodm9koswQGl6ooOd+hTTplhrfPgh8+VW
 mY2Ttl0ugfOLFQpd68NImMdMVA6bTkE=
X-Google-Smtp-Source: ABdhPJw+rosqd2J5fchQazNWv+5fHdWBmz1KPWrrfLb28pq+gj9gbKCNW+EGEA0vfvmTvk1xhencaQ==
X-Received: by 2002:a17:902:cf07:: with SMTP id
 i7mr8343269plg.137.1644720166603; 
 Sat, 12 Feb 2022 18:42:46 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d85b:35dd:dae2:b7a9])
 by smtp.gmail.com with ESMTPSA id l11sm9128954pjm.23.2022.02.12.18.42.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Feb 2022 18:42:46 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 4/6] Revert "ui: dispatch GL events to all listeners"
Date: Sun, 13 Feb 2022 11:42:20 +0900
Message-Id: <20220213024222.3548-5-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220213024222.3548-1-akihiko.odaki@gmail.com>
References: <20220213024222.3548-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1033.google.com
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

This reverts commit 7cc712e9862ffdbe4161dbdf3bbf41bcbe547472.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/console.c | 58 +++++++++++++++-------------------------------------
 1 file changed, 16 insertions(+), 42 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 13c0d001c09..6f21007737e 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1824,12 +1824,8 @@ int dpy_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx)
 
 void dpy_gl_scanout_disable(QemuConsole *con)
 {
-    DisplayState *s = con->ds;
-    DisplayChangeListener *dcl;
-
-    QLIST_FOREACH(dcl, &s->listeners, next) {
-        dcl->ops->dpy_gl_scanout_disable(dcl);
-    }
+    assert(con->gl);
+    con->gl->ops->dpy_gl_scanout_disable(con->gl);
 }
 
 void dpy_gl_scanout_texture(QemuConsole *con,
@@ -1840,80 +1836,58 @@ void dpy_gl_scanout_texture(QemuConsole *con,
                             uint32_t x, uint32_t y,
                             uint32_t width, uint32_t height)
 {
-    DisplayState *s = con->ds;
-    DisplayChangeListener *dcl;
-
-    QLIST_FOREACH(dcl, &s->listeners, next) {
-        dcl->ops->dpy_gl_scanout_texture(dcl, backing_id,
+    assert(con->gl);
+    con->gl->ops->dpy_gl_scanout_texture(con->gl, backing_id,
                                          backing_y_0_top,
                                          backing_width, backing_height,
                                          x, y, width, height);
-    }
 }
 
 void dpy_gl_scanout_dmabuf(QemuConsole *con,
                            QemuDmaBuf *dmabuf)
 {
-    DisplayState *s = con->ds;
-    DisplayChangeListener *dcl;
-
-    QLIST_FOREACH(dcl, &s->listeners, next) {
-        dcl->ops->dpy_gl_scanout_dmabuf(dcl, dmabuf);
-    }
+    assert(con->gl);
+    con->gl->ops->dpy_gl_scanout_dmabuf(con->gl, dmabuf);
 }
 
 void dpy_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBuf *dmabuf,
                           bool have_hot, uint32_t hot_x, uint32_t hot_y)
 {
-    DisplayState *s = con->ds;
-    DisplayChangeListener *dcl;
+    assert(con->gl);
 
-    QLIST_FOREACH(dcl, &s->listeners, next) {
-        if (dcl->ops->dpy_gl_cursor_dmabuf) {
-            dcl->ops->dpy_gl_cursor_dmabuf(dcl, dmabuf,
+    if (con->gl->ops->dpy_gl_cursor_dmabuf) {
+        con->gl->ops->dpy_gl_cursor_dmabuf(con->gl, dmabuf,
                                            have_hot, hot_x, hot_y);
-        }
     }
 }
 
 void dpy_gl_cursor_position(QemuConsole *con,
                             uint32_t pos_x, uint32_t pos_y)
 {
-    DisplayState *s = con->ds;
-    DisplayChangeListener *dcl;
+    assert(con->gl);
 
-    QLIST_FOREACH(dcl, &s->listeners, next) {
-        if (dcl->ops->dpy_gl_cursor_position) {
-            dcl->ops->dpy_gl_cursor_position(dcl, pos_x, pos_y);
-        }
+    if (con->gl->ops->dpy_gl_cursor_position) {
+        con->gl->ops->dpy_gl_cursor_position(con->gl, pos_x, pos_y);
     }
 }
 
 void dpy_gl_release_dmabuf(QemuConsole *con,
                           QemuDmaBuf *dmabuf)
 {
-    DisplayState *s = con->ds;
-    DisplayChangeListener *dcl;
+    assert(con->gl);
 
-    QLIST_FOREACH(dcl, &s->listeners, next) {
-        if (dcl->ops->dpy_gl_release_dmabuf) {
-            dcl->ops->dpy_gl_release_dmabuf(dcl, dmabuf);
-        }
+    if (con->gl->ops->dpy_gl_release_dmabuf) {
+        con->gl->ops->dpy_gl_release_dmabuf(con->gl, dmabuf);
     }
 }
 
 void dpy_gl_update(QemuConsole *con,
                    uint32_t x, uint32_t y, uint32_t w, uint32_t h)
 {
-    DisplayState *s = con->ds;
-    DisplayChangeListener *dcl;
-
     assert(con->gl);
 
     graphic_hw_gl_block(con, true);
-    QLIST_FOREACH(dcl, &s->listeners, next) {
-        dcl->ops->dpy_gl_update(dcl, x, y, w, h);
-    }
+    con->gl->ops->dpy_gl_update(con->gl, x, y, w, h);
     graphic_hw_gl_block(con, false);
 }
 
-- 
2.32.0 (Apple Git-132)


