Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CF031B737
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:35:25 +0100 (CET)
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbDw-0006ej-UB
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB6-0004MK-Vo
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:29 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB1-0001iD-La
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:28 -0500
Received: by mail-wr1-x436.google.com with SMTP id l12so8287532wry.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 02:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TCNOlx/VgRYG2pmzepRt+R1HLAN6RNJ7AMXnp5nQA0Y=;
 b=KzejVWJ5nFWECl9y+CN8pOyBHoYIuEmd5Q7Cst5grbyQ6FZTQUkbtCSlszURG8xzSZ
 uJ89CVyvb2XVMfJlraKu10l1ycbYbF9nk+BKZhvGBpd+st4CXjvOJIIYcTNaSwGthP6N
 rEgB/D7o5NIZS2eWiQ5hIBmIYFmo5pr+UFVfxwehqxqxS1qTi0jQB7fP+bhIwLfxKAap
 lLK89hs3+WISPawvfdkW7k+QYeYnM9zNqFGU5ArPQtjmavf7sJVMnkWrwMGn0SHeKkV6
 ssBRRplXosj2gbzUiLshWxkS24YdlkiFqdEMUnWt1AHhShbBaz6ZAwJn1kXmRtmMKpEK
 FDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TCNOlx/VgRYG2pmzepRt+R1HLAN6RNJ7AMXnp5nQA0Y=;
 b=h+aSpvx5qOloMxAMht5Tr1NL2qlaV/dylPm9rrSVWKZjAZnMghDFGoXZYWQLID8oNi
 2pewSTzsvHqCOoYs+OZNqBwFrV7MpzP1sGXfA/qBA1pgwuoAXouDEiojwrEXXOiryq/S
 zziGpHeQguqDLiLohxZ19kP69TJGgM/iUrqQuGNWtLDgiq+FxWV/UFME0xBYQhVcMQQ/
 1u3S8Vtg0y+npxOKCgNp2xx0lbzZ8vAZwsk9hDFziNinzJJmJN8t5o8u6dgnQsTntheD
 nJrMDtczx8CvyoJ16wYmGyb+jsRlgUYrvygDnMdlvz8XnB12U/rfoiiMuTva8ArsZAzt
 Cu2Q==
X-Gm-Message-State: AOAM530qo4xtSa1jlmJIjSblnD9+OPUcuxmKNBF0bpT3ahaSUGflLgEZ
 5mxGAYY6oGI6o+5NBysVC4yVotOn9GEYHA==
X-Google-Smtp-Source: ABdhPJwRRr9/SeGGmTmwlT38tZtyruyZYg3sKLE3kqSQPPCzIBHUUi84yYmJ85I0joqr4y3f5OGwRw==
X-Received: by 2002:adf:8544:: with SMTP id 62mr18592437wrh.336.1613385140789; 
 Mon, 15 Feb 2021 02:32:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/9] hw/display/tc6393xb: Inline tc6393xb_draw_graphic32() at
 its callsite
Date: Mon, 15 Feb 2021 10:32:10 +0000
Message-Id: <20210215103215.4944-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function tc6393xb_draw_graphic32() is called in exactly one place,
so just inline the function body at its callsite. This allows us to
drop the template header entirely.

The code move includes a single added space after 'for' to fix
the coding style.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/tc6393xb_template.h | 45 ----------------------------------
 hw/display/tc6393xb.c          | 23 ++++++++++++++---
 2 files changed, 19 insertions(+), 49 deletions(-)
 delete mode 100644 hw/display/tc6393xb_template.h

diff --git a/hw/display/tc6393xb_template.h b/hw/display/tc6393xb_template.h
deleted file mode 100644
index 7789ffc4399..00000000000
--- a/hw/display/tc6393xb_template.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/*
- * Toshiba TC6393XB I/O Controller.
- * Found in Sharp Zaurus SL-6000 (tosa) or some
- * Toshiba e-Series PDAs.
- *
- * FB support code. Based on G364 fb emulator
- *
- * Copyright (c) 2007 Hervé Poussineau
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-static void tc6393xb_draw_graphic32(TC6393xbState *s)
-{
-    DisplaySurface *surface = qemu_console_surface(s->con);
-    int i;
-    uint16_t *data_buffer;
-    uint8_t *data_display;
-
-    data_buffer = s->vram_ptr;
-    data_display = surface_data(surface);
-    for(i = 0; i < s->scr_height; i++) {
-        int j;
-        for (j = 0; j < s->scr_width; j++, data_display += 4, data_buffer++) {
-            uint16_t color = *data_buffer;
-            uint32_t dest_color = rgb_to_pixel32(
-                           ((color & 0xf800) * 0x108) >> 11,
-                           ((color & 0x7e0) * 0x41) >> 9,
-                           ((color & 0x1f) * 0x21) >> 2
-                           );
-            *(uint32_t *)data_display = dest_color;
-        }
-    }
-}
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 4cddb1a99ad..1f28223c7be 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -410,12 +410,27 @@ static void tc6393xb_nand_writeb(TC6393xbState *s, hwaddr addr, uint32_t value)
                                         (uint32_t) addr, value & 0xff);
 }
 
-#define BITS 32
-#include "tc6393xb_template.h"
-
 static void tc6393xb_draw_graphic(TC6393xbState *s, int full_update)
 {
-    tc6393xb_draw_graphic32(s);
+    DisplaySurface *surface = qemu_console_surface(s->con);
+    int i;
+    uint16_t *data_buffer;
+    uint8_t *data_display;
+
+    data_buffer = s->vram_ptr;
+    data_display = surface_data(surface);
+    for (i = 0; i < s->scr_height; i++) {
+        int j;
+        for (j = 0; j < s->scr_width; j++, data_display += 4, data_buffer++) {
+            uint16_t color = *data_buffer;
+            uint32_t dest_color = rgb_to_pixel32(
+                           ((color & 0xf800) * 0x108) >> 11,
+                           ((color & 0x7e0) * 0x41) >> 9,
+                           ((color & 0x1f) * 0x21) >> 2
+                           );
+            *(uint32_t *)data_display = dest_color;
+        }
+    }
     dpy_gfx_update_full(s->con);
 }
 
-- 
2.20.1


