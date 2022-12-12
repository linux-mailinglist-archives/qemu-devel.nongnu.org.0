Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE78864A3BA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:50:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4k7q-0007p2-Qs; Mon, 12 Dec 2022 09:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lilydjwg@gmail.com>)
 id 1p4eQp-0006Sb-Te; Mon, 12 Dec 2022 03:45:03 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lilydjwg@gmail.com>)
 id 1p4eQo-0007aM-7E; Mon, 12 Dec 2022 03:45:03 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 k88-20020a17090a4ce100b00219d0b857bcso11458549pjh.1; 
 Mon, 12 Dec 2022 00:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UmXPjAUajQdk1U2qMMfcyJGlLHMeT9O8lEpVL9CZ6nE=;
 b=RwG5DFtSz45JyPeI5Jn9LerZp46JXznB02rxZEisZNG37PeYpclbw5UAEfcYjEmyyZ
 Flir1Z8Kr4qF7T+i9qF4EXTo7qohX/xYvimyhRXS0dVQq8pmPQPv/pSH7IB1I5/O25z1
 wW//nip3De8mZwTrNskOugnE2123Mb49RICvwSea0KqVaVltX2NH3kclbewk9opH8LFK
 xFiQqgqsPVhpuSrZAl5+TunmUEVVnDqcO+78rct+UobZRVudTuVrj8Gc2Ftt4IDP5rLP
 jdDsdxzwYxk5wKFzSXQ8G498NFj4pcVYY7prYt8fLooRFF1HA5D9l6gPc7f2l651YFAe
 hJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UmXPjAUajQdk1U2qMMfcyJGlLHMeT9O8lEpVL9CZ6nE=;
 b=Vd0x/tEp416aGd7rgDvEw5IZTumuPwlNdCLLA/o/qBBZcP8zX1NlrjGLkUsyB+5L9P
 FYK211zz477PrUejPE8pXcgFjfw38rG/D4zuu7bZy17msn8KAHZ34KSrJPlK5cthRxEr
 FHXMVVztOh1w3bx6lS1zvHbZSTV0RfS01ZNTaQ5fBrYQa+7bqMt7A6HpQG4glKy/kdg4
 YPkX2/7hQrIueTxsWnYBl4E74FNL2MT/v981PoRWKaBbIHckEYiN3TMYfG6/3xgYT78c
 j3jC+a9+dIhOhz1f8sizcjNbpXvZSJrYZ8sAKJkIx/709xanOET7tFsxceS67lo6Vj4I
 i+xw==
X-Gm-Message-State: ANoB5plLbTuCrZY0NCgQpknI6Xxld8uRyl2ujvwVv1yCyTdONqAvX0f8
 Es74FNa30f0l10CvC15pRVOrvMBiqZqBvITm
X-Google-Smtp-Source: AA0mqf7Ed899neyFH7orxQIWpnXUfoof5fPI3h7jGUhUdggBek4sDmg2HEuRMWeXom/SKkcEDxSqPA==
X-Received: by 2002:a17:90b:38f:b0:219:9331:2781 with SMTP id
 ga15-20020a17090b038f00b0021993312781mr15958480pjb.17.1670834699089; 
 Mon, 12 Dec 2022 00:44:59 -0800 (PST)
Received: from localhost ([2a0c:b641:69c:e9b8:1::1])
 by smtp.gmail.com with ESMTPSA id
 71-20020a17090a09cd00b002191ffeac8esm4922471pjo.20.2022.12.12.00.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 00:44:58 -0800 (PST)
From: lilydjwg@gmail.com
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 lilydjwg <lilydjwg@gmail.com>
Subject: [PATCH] ui/gtk: use correct scale for cursors
Date: Mon, 12 Dec 2022 16:44:43 +0800
Message-Id: <20221212084443.1064207-1-lilydjwg@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=lilydjwg@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 12 Dec 2022 09:49:46 -0500
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

From: lilydjwg <lilydjwg@gmail.com>

gdk_cursor_new_from_pixbuf always uses scale=1 and causes blurry large
cursors on HiDPI screens (scale=2). Create a cairo surface ourselves to
pass the desired scale.

Signed-off-by: lilydjwg <lilydjwg@gmail.com>
---
 ui/gtk.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 4817623c8f..984a5a4c67 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -469,7 +469,10 @@ static void gd_cursor_define(DisplayChangeListener *dcl,
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
     GdkPixbuf *pixbuf;
+    GdkWindow *window;
     GdkCursor *cursor;
+    cairo_surface_t *surface;
+    int scale;
 
     if (!gtk_widget_get_realized(vc->gfx.drawing_area)) {
         return;
@@ -479,10 +482,14 @@ static void gd_cursor_define(DisplayChangeListener *dcl,
                                       GDK_COLORSPACE_RGB, true, 8,
                                       c->width, c->height, c->width * 4,
                                       NULL, NULL);
-    cursor = gdk_cursor_new_from_pixbuf
+    window = gtk_widget_get_window(vc->gfx.drawing_area);
+    scale = gdk_window_get_scale_factor(window);
+    surface = gdk_cairo_surface_create_from_pixbuf(pixbuf, scale, window);
+    cursor = gdk_cursor_new_from_surface
         (gtk_widget_get_display(vc->gfx.drawing_area),
-         pixbuf, c->hot_x, c->hot_y);
-    gdk_window_set_cursor(gtk_widget_get_window(vc->gfx.drawing_area), cursor);
+         surface, c->hot_x / scale, c->hot_y / scale);
+    cairo_surface_destroy(surface);
+    gdk_window_set_cursor(window, cursor);
     g_object_unref(pixbuf);
     g_object_unref(cursor);
 }
-- 
2.38.1


