Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983DD31B744
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:37:36 +0100 (CET)
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbG2-0000dv-ES
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbBA-0004To-Gu
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:32 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB3-0001jC-0s
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:32 -0500
Received: by mail-wr1-x431.google.com with SMTP id v1so8243700wrd.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 02:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cx3fiU7zu1QDtVZpKIEUVyibRzjoCZZNp5x6BZT/qW4=;
 b=NIvl9vfy+TFDAsLhU36L74hmZHLJQas2gyRDUvqSyKVu9KDSJWYkLK2khMJovCmRHj
 cmMuzmO3SNIxlMaUVV8B2/Yt/k81vL0D/llLGk7V1NsgQMvQ1XVkJgKXmARCT5R+i5Rh
 lCHOj4xJKFMhHzMmwbuP/3Hi/cwaNISxXb7xIlR5WbmHxaX1F7t/tgVFmNDzWDVOhx2y
 NEac/8RGKMbhpe/eMQLEX2gh3W3phd5jn+VZ/AKJduNldrLR83015sA0h4fEeNQv8DEQ
 hW88La1ll7qnqwdLR08RObROGivkzYSLgd8UpEb4CsfKm7VwsXe5vGvhY87GVbyoi7Zm
 iD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cx3fiU7zu1QDtVZpKIEUVyibRzjoCZZNp5x6BZT/qW4=;
 b=jy+IzzjVjyMOkVYRHFMpc9QYiI5NR5P16EQTZdKlm32Byivz+E64bd9isqNeCJlJOo
 Zf4wC5W5UsGZaoE96YHDqBZHHDFm++ZxV6gDvfynb9lS+6UiZLUntTInVvgPxzWH7qzy
 SAyc8tMJz7D6VxhAbD+05AkZru/6IXfBafeWBja4z/M26+zoFBBbouiKT6O6x4ruDhap
 gtVz4rfjo0yVNZh7HOszYp2wwJ08u2H73yk23WMiOIiraJhY7Z9CEFamRNNXGT9JR5Ir
 O9g+9JTBjvdAlFYpuy1uOrW8Bg7mmLJf6Ss3uuV7jFDKKW2pc2Z8Me4EAYRXP6LtQVGG
 Lbjg==
X-Gm-Message-State: AOAM533CogSeEq3iKhrUfz/FH8yZ3hLribIxIkN8+KNZMy8Z04uNy47O
 mVrpifezcP0RwEJEjA6wY/nWJg==
X-Google-Smtp-Source: ABdhPJzVDRwlY3m+3wzrPvCD92pgcEfiK3cH47CjWzrOjr6GIET6x14VFxekjIVn5JcQ6HVA2FjCLQ==
X-Received: by 2002:adf:d4d0:: with SMTP id w16mr17953789wrk.262.1613385143780; 
 Mon, 15 Feb 2021 02:32:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 8/9] hw/display/omap_lcdc: Inline template header into C file
Date: Mon, 15 Feb 2021 10:32:14 +0000
Message-Id: <20210215103215.4944-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

We only include the template header once, so just inline it into the
source file for the device.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/omap_lcd_template.h | 154 ---------------------------------
 hw/display/omap_lcdc.c         | 127 ++++++++++++++++++++++++++-
 2 files changed, 125 insertions(+), 156 deletions(-)
 delete mode 100644 hw/display/omap_lcd_template.h

diff --git a/hw/display/omap_lcd_template.h b/hw/display/omap_lcd_template.h
deleted file mode 100644
index a2f86eee3c8..00000000000
--- a/hw/display/omap_lcd_template.h
+++ /dev/null
@@ -1,154 +0,0 @@
-/*
- * QEMU OMAP LCD Emulator templates
- *
- * Copyright (c) 2006 Andrzej Zaborowski  <balrog@zabor.org>
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in
- *    the documentation and/or other materials provided with the
- *    distribution.
- *
- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS''
- * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
- * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
- * PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR
- * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
- * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
- * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
- * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
- * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-/*
- * 2-bit colour
- */
-static void draw_line2_32(void *opaque, uint8_t *d, const uint8_t *s,
-                          int width, int deststep)
-{
-    uint16_t *pal = opaque;
-    uint8_t v, r, g, b;
-
-    do {
-        v = ldub_p((void *) s);
-        r = (pal[v & 3] >> 4) & 0xf0;
-        g = pal[v & 3] & 0xf0;
-        b = (pal[v & 3] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        d += 4;
-        v >>= 2;
-        r = (pal[v & 3] >> 4) & 0xf0;
-        g = pal[v & 3] & 0xf0;
-        b = (pal[v & 3] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        d += 4;
-        v >>= 2;
-        r = (pal[v & 3] >> 4) & 0xf0;
-        g = pal[v & 3] & 0xf0;
-        b = (pal[v & 3] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        d += 4;
-        v >>= 2;
-        r = (pal[v & 3] >> 4) & 0xf0;
-        g = pal[v & 3] & 0xf0;
-        b = (pal[v & 3] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        d += 4;
-        s++;
-        width -= 4;
-    } while (width > 0);
-}
-
-/*
- * 4-bit colour
- */
-static void draw_line4_32(void *opaque, uint8_t *d, const uint8_t *s,
-                          int width, int deststep)
-{
-    uint16_t *pal = opaque;
-    uint8_t v, r, g, b;
-
-    do {
-        v = ldub_p((void *) s);
-        r = (pal[v & 0xf] >> 4) & 0xf0;
-        g = pal[v & 0xf] & 0xf0;
-        b = (pal[v & 0xf] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        d += 4;
-        v >>= 4;
-        r = (pal[v & 0xf] >> 4) & 0xf0;
-        g = pal[v & 0xf] & 0xf0;
-        b = (pal[v & 0xf] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        d += 4;
-        s++;
-        width -= 2;
-    } while (width > 0);
-}
-
-/*
- * 8-bit colour
- */
-static void draw_line8_32(void *opaque, uint8_t *d, const uint8_t *s,
-                          int width, int deststep)
-{
-    uint16_t *pal = opaque;
-    uint8_t v, r, g, b;
-
-    do {
-        v = ldub_p((void *) s);
-        r = (pal[v] >> 4) & 0xf0;
-        g = pal[v] & 0xf0;
-        b = (pal[v] << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        s++;
-        d += 4;
-    } while (-- width != 0);
-}
-
-/*
- * 12-bit colour
- */
-static void draw_line12_32(void *opaque, uint8_t *d, const uint8_t *s,
-                           int width, int deststep)
-{
-    uint16_t v;
-    uint8_t r, g, b;
-
-    do {
-        v = lduw_le_p((void *) s);
-        r = (v >> 4) & 0xf0;
-        g = v & 0xf0;
-        b = (v << 4) & 0xf0;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        s += 2;
-        d += 4;
-    } while (-- width != 0);
-}
-
-/*
- * 16-bit colour
- */
-static void draw_line16_32(void *opaque, uint8_t *d, const uint8_t *s,
-                           int width, int deststep)
-{
-    uint16_t v;
-    uint8_t r, g, b;
-
-    do {
-        v = lduw_le_p((void *) s);
-        r = (v >> 8) & 0xf8;
-        g = (v >> 3) & 0xfc;
-        b = (v << 3) & 0xf8;
-        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        s += 2;
-        d += 4;
-    } while (-- width != 0);
-}
diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index 58e659c94ff..2db04fad2fc 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -72,8 +72,131 @@ static void omap_lcd_interrupts(struct omap_lcd_panel_s *s)
 
 #define draw_line_func drawfn
 
-#define DEPTH 32
-#include "omap_lcd_template.h"
+/*
+ * 2-bit colour
+ */
+static void draw_line2_32(void *opaque, uint8_t *d, const uint8_t *s,
+                          int width, int deststep)
+{
+    uint16_t *pal = opaque;
+    uint8_t v, r, g, b;
+
+    do {
+        v = ldub_p((void *) s);
+        r = (pal[v & 3] >> 4) & 0xf0;
+        g = pal[v & 3] & 0xf0;
+        b = (pal[v & 3] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
+        v >>= 2;
+        r = (pal[v & 3] >> 4) & 0xf0;
+        g = pal[v & 3] & 0xf0;
+        b = (pal[v & 3] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
+        v >>= 2;
+        r = (pal[v & 3] >> 4) & 0xf0;
+        g = pal[v & 3] & 0xf0;
+        b = (pal[v & 3] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
+        v >>= 2;
+        r = (pal[v & 3] >> 4) & 0xf0;
+        g = pal[v & 3] & 0xf0;
+        b = (pal[v & 3] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
+        s++;
+        width -= 4;
+    } while (width > 0);
+}
+
+/*
+ * 4-bit colour
+ */
+static void draw_line4_32(void *opaque, uint8_t *d, const uint8_t *s,
+                          int width, int deststep)
+{
+    uint16_t *pal = opaque;
+    uint8_t v, r, g, b;
+
+    do {
+        v = ldub_p((void *) s);
+        r = (pal[v & 0xf] >> 4) & 0xf0;
+        g = pal[v & 0xf] & 0xf0;
+        b = (pal[v & 0xf] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
+        v >>= 4;
+        r = (pal[v & 0xf] >> 4) & 0xf0;
+        g = pal[v & 0xf] & 0xf0;
+        b = (pal[v & 0xf] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        d += 4;
+        s++;
+        width -= 2;
+    } while (width > 0);
+}
+
+/*
+ * 8-bit colour
+ */
+static void draw_line8_32(void *opaque, uint8_t *d, const uint8_t *s,
+                          int width, int deststep)
+{
+    uint16_t *pal = opaque;
+    uint8_t v, r, g, b;
+
+    do {
+        v = ldub_p((void *) s);
+        r = (pal[v] >> 4) & 0xf0;
+        g = pal[v] & 0xf0;
+        b = (pal[v] << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        s++;
+        d += 4;
+    } while (-- width != 0);
+}
+
+/*
+ * 12-bit colour
+ */
+static void draw_line12_32(void *opaque, uint8_t *d, const uint8_t *s,
+                           int width, int deststep)
+{
+    uint16_t v;
+    uint8_t r, g, b;
+
+    do {
+        v = lduw_le_p((void *) s);
+        r = (v >> 4) & 0xf0;
+        g = v & 0xf0;
+        b = (v << 4) & 0xf0;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        s += 2;
+        d += 4;
+    } while (-- width != 0);
+}
+
+/*
+ * 16-bit colour
+ */
+static void draw_line16_32(void *opaque, uint8_t *d, const uint8_t *s,
+                           int width, int deststep)
+{
+    uint16_t v;
+    uint8_t r, g, b;
+
+    do {
+        v = lduw_le_p((void *) s);
+        r = (v >> 8) & 0xf8;
+        g = (v >> 3) & 0xfc;
+        b = (v << 3) & 0xf8;
+        ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
+        s += 2;
+        d += 4;
+    } while (-- width != 0);
+}
 
 static void omap_update_display(void *opaque)
 {
-- 
2.20.1


