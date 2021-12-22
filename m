Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9198047CAD1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 02:34:37 +0100 (CET)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzqWa-0006I2-Dl
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 20:34:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1mzq5m-0001w9-89
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 20:06:54 -0500
Received: from [2a00:1450:4864:20::536] (port=37525
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1mzq5k-0002by-16
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 20:06:53 -0500
Received: by mail-ed1-x536.google.com with SMTP id o6so2018252edc.4
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 17:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aOJzM18TYmXN2Gc4wBrki55qbnNfkeRy0/+fIGV7xN0=;
 b=KluBwu4KSId15Grp1sD0GrzRHYiJJ+3a3hEufWJsWAPPdg6Zu6sb4Jqaah3Aw96ZUS
 LiyJtK+zwPpFN/adKLixoJUjfH1fvXZPLdfzA5ZGseW4xjIwhEFSLaSAmmi2FQPMqTYH
 x2mlFu/7CF1V1JXL6ViaDPXpUt01It6ikKlSgSpXrc7yOez+32Yd8dc8kSNaNHARQHZ/
 aCk+XlKfdeEmtmw/NXJj69aoISofdIKZu6Ab3D3C7zmQlnNgm/DYNMhKfGi8MhNqybJ8
 YMpubRUzCHK4WnLSIXATyynE5I55KZ4l1WAFvBihxEQJzOFtq2S9Zh9JFopINBH/HSgt
 aWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aOJzM18TYmXN2Gc4wBrki55qbnNfkeRy0/+fIGV7xN0=;
 b=LgRXz6jgn6wll37vH+eOoZTltAj0rV7xoI1aZzXnI31oK+rQf33ynnkjEWbTlFtP66
 UlnpdnAA+bekbDDCmTPN2IGphyno3NHhWLVqM2LuGIJt6n6Rn28GPmQXo053KbN6HaSf
 M7Em7J4LIwMni18ZuDqQklWjmfpvIB2kDd0iJsL1HqcSZBhniulTDXMAd27Li4h+UQp/
 SCt746GMArWywwviMdXPiAgki1lGIwzOb/vm42XqrJc+T7bkNXsPDeMgVyOKwq7AEkMU
 L6LJLOM2SL1kXooUunLqi7x+dFbEE8JTnFL3azlJuY6NRTCiAF2KVy6pIx1ayyuqZd28
 IkNQ==
X-Gm-Message-State: AOAM5320/Mpe1wtWrfy/D65+gBQdKo6YYnUXHiSKS1cKQEi7U8SeX6rl
 J5rGROvd5lrO0iTnx3WKO68MLL8KquQ=
X-Google-Smtp-Source: ABdhPJwWnRrAKcKm5MqyH1j2QiF7JvJllCFtaxTw9k/ZmoX92ZNiFL7CCbqLE1jczodcIfSOZh+0og==
X-Received: by 2002:a17:907:3fa0:: with SMTP id
 hr32mr723776ejc.196.1640135210614; 
 Tue, 21 Dec 2021 17:06:50 -0800 (PST)
Received: from owl.kpn ([2a02:a467:f77d:1:e6fc:be30:e400:3c3])
 by smtp.gmail.com with ESMTPSA id nb20sm125199ejc.25.2021.12.21.17.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 17:06:50 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] ui/gtk: pass horizontal scroll information to the
 device code
Date: Wed, 22 Dec 2021 02:06:45 +0100
Message-Id: <20211222010647.1332479-3-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211222010647.1332479-1-dpetroff@gmail.com>
References: <20211222010647.1332479-1-dpetroff@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Dec 2021 20:24:49 -0500
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
Cc: Dmitry Petrov <dpetroff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
---
 ui/gtk.c | 54 ++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 428f02f2df..b52eec6fe9 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -963,33 +963,63 @@ static gboolean gd_scroll_event(GtkWidget *widget, GdkEventScroll *scroll,
                                 void *opaque)
 {
     VirtualConsole *vc = opaque;
-    InputButton btn;
+    InputButton btn_vertical;
+    InputButton btn_horizontal;
+    bool has_vertical = false;
+    bool has_horizontal = false;
 
     if (scroll->direction == GDK_SCROLL_UP) {
-        btn = INPUT_BUTTON_WHEEL_UP;
+        btn_vertical = INPUT_BUTTON_WHEEL_UP;
+        has_vertical = true;
     } else if (scroll->direction == GDK_SCROLL_DOWN) {
-        btn = INPUT_BUTTON_WHEEL_DOWN;
+        btn_vertical = INPUT_BUTTON_WHEEL_DOWN;
+        has_vertical = true;
+    } else if (scroll->direction == GDK_SCROLL_LEFT) {
+        btn_horizontal = INPUT_BUTTON_WHEEL_LEFT;
+        has_horizontal = true;
+    } else if (scroll->direction == GDK_SCROLL_RIGHT) {
+        btn_horizontal = INPUT_BUTTON_WHEEL_RIGHT;
+        has_horizontal = true;
     } else if (scroll->direction == GDK_SCROLL_SMOOTH) {
         gdouble delta_x, delta_y;
         if (!gdk_event_get_scroll_deltas((GdkEvent *)scroll,
                                          &delta_x, &delta_y)) {
             return TRUE;
         }
-        if (delta_y == 0) {
-            return TRUE;
-        } else if (delta_y > 0) {
-            btn = INPUT_BUTTON_WHEEL_DOWN;
+
+        if (delta_y > 0) {
+            btn_vertical = INPUT_BUTTON_WHEEL_DOWN;
+            has_vertical = true;
+        } else if (delta_y < 0) {
+            btn_vertical = INPUT_BUTTON_WHEEL_UP;
+            has_vertical = true;
+        } else if (delta_x > 0) {
+            btn_horizontal = INPUT_BUTTON_WHEEL_RIGHT;
+            has_horizontal = true;
+        } else if (delta_x < 0) {
+            btn_horizontal = INPUT_BUTTON_WHEEL_LEFT;
+            has_horizontal = true;
         } else {
-            btn = INPUT_BUTTON_WHEEL_UP;
+            return TRUE;
         }
     } else {
         return TRUE;
     }
 
-    qemu_input_queue_btn(vc->gfx.dcl.con, btn, true);
-    qemu_input_event_sync();
-    qemu_input_queue_btn(vc->gfx.dcl.con, btn, false);
-    qemu_input_event_sync();
+    if (has_vertical) {
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_vertical, true);
+        qemu_input_event_sync();
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_vertical, false);
+        qemu_input_event_sync();
+    }
+
+    if (has_horizontal) {
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_horizontal, true);
+        qemu_input_event_sync();
+        qemu_input_queue_btn(vc->gfx.dcl.con, btn_horizontal, false);
+        qemu_input_event_sync();
+    }
+
     return TRUE;
 }
 
-- 
2.32.0


