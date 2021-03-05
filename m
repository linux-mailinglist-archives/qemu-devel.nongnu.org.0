Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9AB32F1B8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:51:04 +0100 (CET)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEbP-0006Uc-3r
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3O-0006vL-Dk
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:54 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE30-0007WP-MC
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:54 -0500
Received: by mail-wr1-x42b.google.com with SMTP id j2so2881715wrx.9
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pAmuR7nxH8NHLZiwiiRo5ekrk1B9gySro43FufZvwrs=;
 b=SL/agL0rQBWS3iHyog/1Cm3U1S+HZJrKUG2qhAIXmzcct88Z2ATsND3wS7mM8nDys0
 lfJST+TdPALzKTdgSslsBS739afWoUqsritpUikcrBv1ut2rIIAnLQZD6tuZxTzhtZTU
 DFDfNHiuPuYD3c0e7q/1q6dFmx8cl4xhlIFXfbNNMk7sPdHrLm9bBCLqssEzjynNyH5s
 XYDhtQ/Lw5HOURLho89CsuEJPSckfEewgAAovITCBSW/Mfp2MitR1y8mZD4t69qAcLmw
 4PFh4K2LBqMp7lh6QEGj9b2yKJhbICNP/l9c4CkYTRAp9Lu1jQV3TKEdJr9aUBE7OG7+
 G07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAmuR7nxH8NHLZiwiiRo5ekrk1B9gySro43FufZvwrs=;
 b=oIHX23af19cN/gpdZKnpvHW6x2yasy87Mrf8S/mIiWP52+zg7ykoWsBYPolguKWdXm
 frCv4SB3jwljXtT6pviSIjelyYn5DqkA22+/N/Gb0yL/VceYQ/MnTN/MEhtTpj/7FEM+
 5XMiZQaAazVHRp+gCyJKmvNPQjXFzNnYBuuXzbGKQSrbU4h6rOauBEayceTxinesUVH7
 KvhnRPtU3T08W7stPmYu07F8Aa81T025ToIB8lG8WCKex4vb7McWx82K7yH+uuLORx0J
 4DlJyj+0lH9XXo/g1cWmof3+5u8qXtkz8pac9blEt8e8lI16vpth3HI9mcpB/rr9IwfB
 mO9A==
X-Gm-Message-State: AOAM5305NizSrB1GI0tCeysEcHFEbE+gyg6tsPOpMw0k+w7ht/0lwbyi
 psXp2XnE35wt7K+3RF6+XSQDG+93j3KyRg==
X-Google-Smtp-Source: ABdhPJzeqabvIQ4NkV/DeIl3DNLbMp7mVaPrsoeSSPksprvnQ3BMDdb6gXSuGwOClkMPbkcxEHR65w==
X-Received: by 2002:a05:6000:181b:: with SMTP id
 m27mr10650095wrh.363.1614964529332; 
 Fri, 05 Mar 2021 09:15:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/49] hw/arm/musicpal: Remove dead code for non-32-bit-RGB
 surfaces
Date: Fri,  5 Mar 2021 17:14:42 +0000
Message-Id: <20210305171515.1038-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For a long time now the UI layer has guaranteed that the console
surface is always 32 bits per pixel RGB. Remove the legacy dead
code from the milkymist display device which was handling the
possibility that the console surface was some other format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215103215.4944-2-peter.maydell@linaro.org
---
 hw/arm/musicpal.c | 64 ++++++++++++++++++-----------------------------
 1 file changed, 24 insertions(+), 40 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 6aec84aeed8..9cebece2de0 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -512,53 +512,37 @@ static uint8_t scale_lcd_color(musicpal_lcd_state *s, uint8_t col)
     }
 }
 
-#define SET_LCD_PIXEL(depth, type) \
-static inline void glue(set_lcd_pixel, depth) \
-        (musicpal_lcd_state *s, int x, int y, type col) \
-{ \
-    int dx, dy; \
-    DisplaySurface *surface = qemu_console_surface(s->con); \
-    type *pixel = &((type *) surface_data(surface))[(y * 128 * 3 + x) * 3]; \
-\
-    for (dy = 0; dy < 3; dy++, pixel += 127 * 3) \
-        for (dx = 0; dx < 3; dx++, pixel++) \
-            *pixel = col; \
+static inline void set_lcd_pixel32(musicpal_lcd_state *s,
+                                   int x, int y, uint32_t col)
+{
+    int dx, dy;
+    DisplaySurface *surface = qemu_console_surface(s->con);
+    uint32_t *pixel =
+        &((uint32_t *) surface_data(surface))[(y * 128 * 3 + x) * 3];
+
+    for (dy = 0; dy < 3; dy++, pixel += 127 * 3) {
+        for (dx = 0; dx < 3; dx++, pixel++) {
+            *pixel = col;
+        }
+    }
 }
-SET_LCD_PIXEL(8, uint8_t)
-SET_LCD_PIXEL(16, uint16_t)
-SET_LCD_PIXEL(32, uint32_t)
 
 static void lcd_refresh(void *opaque)
 {
     musicpal_lcd_state *s = opaque;
-    DisplaySurface *surface = qemu_console_surface(s->con);
     int x, y, col;
 
-    switch (surface_bits_per_pixel(surface)) {
-    case 0:
-        return;
-#define LCD_REFRESH(depth, func) \
-    case depth: \
-        col = func(scale_lcd_color(s, (MP_LCD_TEXTCOLOR >> 16) & 0xff), \
-                   scale_lcd_color(s, (MP_LCD_TEXTCOLOR >> 8) & 0xff), \
-                   scale_lcd_color(s, MP_LCD_TEXTCOLOR & 0xff)); \
-        for (x = 0; x < 128; x++) { \
-            for (y = 0; y < 64; y++) { \
-                if (s->video_ram[x + (y/8)*128] & (1 << (y % 8))) { \
-                    glue(set_lcd_pixel, depth)(s, x, y, col); \
-                } else { \
-                    glue(set_lcd_pixel, depth)(s, x, y, 0); \
-                } \
-            } \
-        } \
-        break;
-    LCD_REFRESH(8, rgb_to_pixel8)
-    LCD_REFRESH(16, rgb_to_pixel16)
-    LCD_REFRESH(32, (is_surface_bgr(surface) ?
-                     rgb_to_pixel32bgr : rgb_to_pixel32))
-    default:
-        hw_error("unsupported colour depth %i\n",
-                 surface_bits_per_pixel(surface));
+    col = rgb_to_pixel32(scale_lcd_color(s, (MP_LCD_TEXTCOLOR >> 16) & 0xff),
+                         scale_lcd_color(s, (MP_LCD_TEXTCOLOR >> 8) & 0xff),
+                         scale_lcd_color(s, MP_LCD_TEXTCOLOR & 0xff));
+    for (x = 0; x < 128; x++) {
+        for (y = 0; y < 64; y++) {
+            if (s->video_ram[x + (y / 8) * 128] & (1 << (y % 8))) {
+                set_lcd_pixel32(s, x, y, col);
+            } else {
+                set_lcd_pixel32(s, x, y, 0);
+            }
+        }
     }
 
     dpy_gfx_update(s->con, 0, 0, 128*3, 64*3);
-- 
2.20.1


