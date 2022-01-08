Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89389488443
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 16:42:20 +0100 (CET)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6DrH-0000Na-JL
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 10:42:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6Dov-0006h1-D0
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:39:53 -0500
Received: from [2a00:1450:4864:20::536] (port=33678
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6Dot-0006oY-8O
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:39:53 -0500
Received: by mail-ed1-x536.google.com with SMTP id m21so34620516edc.0
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 07:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5kdp0snb3SFSbv62l+V5oc1HsNnrPydAEd/264gvRo4=;
 b=cF7KydOBopk4Nxjrf+nIvjtmvATI2ch0VW6xLOjBF7UTWzU/SfldqXlcYrpRNEsI0j
 mejDiFhY/cFzEhD9i7ZpA9jm5hkr5hjEhcHNiytkNrdhHpPBghEkSDwAoWWrzuFJ5LFa
 xlf+DCIRq7UpiC0x1268H4jVTVL5A4YnhFtHGHt94bsouAzTQV1SbQLB+BzFuxiSfSAb
 ZX0swjAnxzl5S0KZJWAv7IWHdGxd3eX6sExPnJk75/eSaYE17HdYeLvB9ue1Y5xhhFt7
 KiDPGUbA1Xe2mPuxKhTXj/oJGvgF1fRlhwLdKGxu74u7A5oP0I7Dp0EUoWEUynqJB4tg
 9W/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5kdp0snb3SFSbv62l+V5oc1HsNnrPydAEd/264gvRo4=;
 b=6LatggJhOyoOYn0PMCWnCrp4u2dhEhQgllEw1cMtaUvmE9bfznMYpAupKNph0+T4E5
 B2AaEy4s4FSzm7CQcjzwzTCZ/eZ30nyl1qqMsphdY8vkbOYi+S9sm6ngWcoZAjnXk4Hg
 d6xcyuzSli5Y3001mVDPuffesAkO9O9FxgSVuTj4I9PKkHhyA4Mn4FQgTKfCWS4s2xtd
 sKxGLyIjKb85aa+lSwfI7O5KL5RphshFxF7SOqd1QzfbiSFq7T2Y3YYCEQCiselb0+Tn
 A2k7mxbwWzfto49k00LcJvMmim5NcsFoaFU/GucRPNXx+/Xet8NKlIe6BJQeBIGmeF+5
 rv1A==
X-Gm-Message-State: AOAM532fsnhMSjencv9iN6iKzA/P/6AHkYiTln0Jj4sf4lFLZygwW/HA
 kkXExC5TKHDfl5w63GEgI3kB6nbvbkk=
X-Google-Smtp-Source: ABdhPJzzGbGtzh8hBPim874rV9k+CuFfdZ53UkReTBu6KG07OryTx+j3ELkkiPEL2KHNOfHJ2AQxhg==
X-Received: by 2002:a17:906:d184:: with SMTP id
 c4mr8971030ejz.20.1641656389875; 
 Sat, 08 Jan 2022 07:39:49 -0800 (PST)
Received: from localhost.localdomain ([2a02:a467:f77d:1:78f2:78aa:23a7:b824])
 by smtp.gmail.com with ESMTPSA id
 24sm599840ejg.47.2022.01.08.07.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 07:39:49 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org,
	dpetroff@gmail.com
Subject: [PATCH v4 3/5] ui/gtk: pass horizontal scroll information to the
 device code
Date: Sat,  8 Jan 2022 16:39:45 +0100
Message-Id: <20220108153947.171861-4-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220108153947.171861-1-dpetroff@gmail.com>
References: <20220108153947.171861-1-dpetroff@gmail.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
---
 ui/gtk.c | 54 ++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 6a1f65d518..a8567b9ddc 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -968,33 +968,63 @@ static gboolean gd_scroll_event(GtkWidget *widget, GdkEventScroll *scroll,
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


