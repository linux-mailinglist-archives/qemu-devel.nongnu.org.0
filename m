Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F722458296
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 09:54:12 +0100 (CET)
Received: from localhost ([::1]:46962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moiby-0000Cv-Tk
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 03:54:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1moglU-0005Lk-U3
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 01:55:52 -0500
Received: from [2607:f8b0:4864:20::833] (port=41482
 helo=mail-qt1-x833.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1moglT-00032l-4g
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 01:55:52 -0500
Received: by mail-qt1-x833.google.com with SMTP id v22so13534606qtx.8
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 22:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kWxlpj8mWhkOK0M2vJPQE3IMUvDbT9hEDEfIqiv7KKU=;
 b=oUwZ9xU9UTBWaP83vM+LZHXlv76Zc1QtBGbyMdj4wvXu+5KVAsG+0xshhcYNo8XoQ1
 0eNA0pe0JXT9+VK2wuvSCHIYAc007F4+wmyPQp0tZdgWMydnWND+v0bcx/mSQO9ZI5I+
 NcLpS6MBLM1iD0wJs9day28LqJoml0n8NgbcYX/XJUsg3Kn54oCuxc2EOuY0gjV8mPva
 wVbwlxnGCCVQe3wxQPYyMlaou0WSnIaf5WdzxCpcFnlaILneH+LkiWSsaAQHE48ksRYj
 gSOEFK5bQZAN+mATLn8Ybkee32YF3jut5NuHUtGGF1MAYxCiASwiCijnySvFWgUXYpXe
 OFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kWxlpj8mWhkOK0M2vJPQE3IMUvDbT9hEDEfIqiv7KKU=;
 b=mbNr+sYgjreeGDxjQMwt+C2t0/d1cvRxtV6PrlnslhWBq2x7Ylx0qgx6U0FKLzGIYI
 gZg0eDGC6BFlsAngFgt8vEbYSg2nRMHUhgflzzekVYmnAzp8mdG3U/usnAF4x/yYSNBf
 EbXT6UCiLmWRHWuGP/82svNxodcld0qhebF4QGia+vVK7mj7Y7F4Wlw10qCj2cYNibgX
 cOphChpCEIwDH3Fd3nzkskt8nutZXylMUaps5vhf/wAQ3hET+jYvxeK7He8Xn0YFwmcT
 AqokfQQ7engDOFOSewW23CyKAKMeSAZ1ZC4Yl3lDuUPOqkdVMu/kHQIfNmOnijGb3FHO
 3qRw==
X-Gm-Message-State: AOAM532JKztHiWR6k6jOvxNjn+Wb4iuJkEMmE/S/9mzUghuopdFp1v8t
 8AQqqyx8hSi8VM7pnvjxxmKOmZqhRYrmxeivg+w=
X-Google-Smtp-Source: ABdhPJw2PUbtHqFgYrtCyJehfdfStp9wzNGGfim/iVCnCLkiXptBXeiETjHS0Z+4Xkb6zYvQFHXNVQ==
X-Received: by 2002:a05:622a:1112:: with SMTP id
 e18mr20799459qty.226.1637477750240; 
 Sat, 20 Nov 2021 22:55:50 -0800 (PST)
Received: from alexdesktop.localdomain
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id j24sm2489860qkg.133.2021.11.20.22.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 22:55:50 -0800 (PST)
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] ui: fix incorrect pointer position on highdpi with gtk
Date: Sun, 21 Nov 2021 01:55:04 -0500
Message-Id: <20211121065504.29101-3-orzechowski.alexander@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211121065504.29101-1-orzechowski.alexander@gmail.com>
References: <20211121065504.29101-1-orzechowski.alexander@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::833
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=orzechowski.alexander@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 21 Nov 2021 03:51:46 -0500
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
Cc: Alexander Orzechowski <orzechowski.alexander@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
---
 ui/gtk.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index d2892ea6b4..b2670142b5 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -838,10 +838,11 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
 {
     VirtualConsole *vc = opaque;
     GtkDisplayState *s = vc->s;
+    GdkWindow *window;
     int x, y;
     int mx, my;
     int fbh, fbw;
-    int ww, wh;
+    int ww, wh, ws;
 
     if (!vc->gfx.ds) {
         return TRUE;
@@ -850,8 +851,10 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     fbw = surface_width(vc->gfx.ds) * vc->gfx.scale_x;
     fbh = surface_height(vc->gfx.ds) * vc->gfx.scale_y;
 
-    ww = gdk_window_get_width(gtk_widget_get_window(vc->gfx.drawing_area));
-    wh = gdk_window_get_height(gtk_widget_get_window(vc->gfx.drawing_area));
+    window = gtk_widget_get_window(vc->gfx.drawing_area);
+    ww = gdk_window_get_width(window);
+    wh = gdk_window_get_height(window);
+    ws = gdk_window_get_scale_factor (window);
 
     mx = my = 0;
     if (ww > fbw) {
@@ -861,8 +864,8 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
         my = (wh - fbh) / 2;
     }
 
-    x = (motion->x - mx) / vc->gfx.scale_x;
-    y = (motion->y - my) / vc->gfx.scale_y;
+    x = (motion->x - mx) / vc->gfx.scale_x * ws;
+    y = (motion->y - my) / vc->gfx.scale_y * ws;
 
     if (qemu_input_is_absolute()) {
         if (x < 0 || y < 0 ||
-- 
2.34.0


