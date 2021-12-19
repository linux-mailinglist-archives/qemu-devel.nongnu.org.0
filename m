Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550E3479ED8
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 03:33:05 +0100 (CET)
Received: from localhost ([::1]:35986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mym0V-0003hw-Ue
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 21:33:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mylyu-0001UA-9b; Sat, 18 Dec 2021 21:31:24 -0500
Received: from [2607:f8b0:4864:20::82a] (port=46077
 helo=mail-qt1-x82a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mylyr-0003eU-RQ; Sat, 18 Dec 2021 21:31:23 -0500
Received: by mail-qt1-x82a.google.com with SMTP id p19so6540844qtw.12;
 Sat, 18 Dec 2021 18:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GwUOFDoEI+IyYYH4XmhJ8f9bYsbreAJjhvE82GXnRgA=;
 b=YsQ1nrI99LyPMaiVdkyvIykQ7tUvgPtQUzHgTI0AdexCuE2/DT0Wx9MEDKzMMoPEyf
 PsODc4U9vBO2pp5cujUe8c3tcuwLAbdL4JZmPyOwBKwVg1iZg6mHDOS8dVDueeYw8HTD
 I9aRMX6UehKea4VK1uj35brzyjAbeaL8YZdCbq++/Qej2KFBTP8LajJqr7XoZbexxVOj
 wTyVL5kF9Fgku+2fBt5ggXTGkyZ88rbzLlIHDW/xLsBq4S1CIMlvHUEamjhd2GbP6JVA
 Na1cPAMK+I2pChWMv9kfvC0veIJPgXOQrhyPhJs4Qx9xQixvTCwDcFjtU67bucOq3g+q
 FViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GwUOFDoEI+IyYYH4XmhJ8f9bYsbreAJjhvE82GXnRgA=;
 b=FJE0LUd1cCT3N32w14I9+/juOL2Mp6CMRuDqoPG2+99lEN24OqNnKpaq9LOo1rWLco
 gPYpSKqvRmjQAwWfGGVJHjojkcNcUUS+XD/Zxxu8amx9yT70SHmn8m56okBvl8W8tpzP
 PmtTn3CMqOU8iFb7na5kaManngRbj9kZndgz9WYybt+E9HOhwJDYearDdDWGp2ZobCGN
 cYrqGLoJR50Sk60+lX/XW/yqYnf7FMHpa+hntOavf5MKgIPykAE4gONazOtUi3btAgAR
 yiATJVLZWqS3KYxV77UsuLi4lb268AIBzEnD9XYEyPNrLn4T6urTDhjOFK44TyMd8PSq
 KLkQ==
X-Gm-Message-State: AOAM533PHW65T0MRzZTUcouM7lmmLg6szze27EaijbUEpHMOVf2RzuY1
 /EVMHKTv2QMsJrdqhg2CS5XQbLmPrHcuCawnM8o=
X-Google-Smtp-Source: ABdhPJxoZT2qhopDcWWIAP0tTkfrQwg+wb9UITFcx+tySl96b6Vs+UcF00ltHeV9F7yYwfxCjn80pg==
X-Received: by 2002:ac8:590a:: with SMTP id 10mr5189403qty.186.1639881079027; 
 Sat, 18 Dec 2021 18:31:19 -0800 (PST)
Received: from alexdesktop.localdomain
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id m4sm10174293qtu.87.2021.12.18.18.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 18:31:18 -0800 (PST)
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] ui: Remove unnecessary checks
Date: Sat, 18 Dec 2021 21:30:04 -0500
Message-Id: <20211219023006.124530-3-orzechowski.alexander@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211219023006.124530-1-orzechowski.alexander@gmail.com>
References: <20211219023006.124530-1-orzechowski.alexander@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=orzechowski.alexander@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Orzechowski <orzechowski.alexander@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These conditionals should never be false as scale_x and scale_y should
scale the fbw and fbh variables such that the ww and wh variables always
have a greater magnitude.

Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
---
 ui/gtk.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 824334ff3d..f2d74b253d 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -416,13 +416,8 @@ static void gd_update(DisplayChangeListener *dcl,
     ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area);
     wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area);
 
-    mx = my = 0;
-    if (ww > fbw) {
-        mx = (ww - fbw) / 2;
-    }
-    if (wh > fbh) {
-        my = (wh - fbh) / 2;
-    }
+    mx = (ww - fbw) / 2;
+    my = (wh - fbh) / 2;
 
     gtk_widget_queue_draw_area(vc->gfx.drawing_area,
                                mx + x1, my + y1, (x2 - x1), (y2 - y1));
@@ -801,13 +796,8 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
     fbw *= vc->gfx.scale_x;
     fbh *= vc->gfx.scale_y;
 
-    mx = my = 0;
-    if (ww > fbw) {
-        mx = (ww - fbw) / 2;
-    }
-    if (wh > fbh) {
-        my = (wh - fbh) / 2;
-    }
+    mx = (ww - fbw) / 2;
+    my = (wh - fbh) / 2;
 
     cairo_rectangle(cr, 0, 0, ww, wh);
 
@@ -850,13 +840,8 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     ws = gdk_window_get_scale_factor(
             gtk_widget_get_window(vc->gfx.drawing_area));
 
-    mx = my = 0;
-    if (ww > fbw) {
-        mx = (ww - fbw) / 2;
-    }
-    if (wh > fbh) {
-        my = (wh - fbh) / 2;
-    }
+    mx = (ww - fbw) / 2;
+    my = (wh - fbh) / 2;
 
     x = (motion->x - mx) / vc->gfx.scale_x * ws;
     y = (motion->y - my) / vc->gfx.scale_y * ws;
-- 
2.34.1


