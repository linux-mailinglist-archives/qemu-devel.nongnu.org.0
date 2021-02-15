Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E0031B757
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:40:14 +0100 (CET)
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbIb-0005Ta-S2
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB6-0004LG-Gu
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:28 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbAy-0001gY-5Z
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:28 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v1so8243373wrd.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 02:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=98metf9b+/ml/auWYKtWya5ML6A+NXJr1FzCort0L/8=;
 b=ea4ZvHpoz4gc32lzGgN86OXAWJ7g7wk3p9H4lRboS1G4n3SlFX1RJi8TCWBFxzCNw4
 rih7+HaX/ZR1XYAtXytMLU3yd0FKApPgeD+Wy+paI0VtwKoIQWf68HeuXCcj+lxwRTYc
 Q0Nso0pPfLxhr0052ltbx54rtGoQBJwALsUa76Q/CYaZdag+stijDeaXIADFisFX3qRv
 vGJWVi6k6kR/7iTpKCYtwdYcI7PmcR5GrKA4/W7lvdRxfa422gfc24qGsiWs6ZH9KfVS
 H775EOMMOS1bCvBChtsyEl37+22jdNHu477GsTyyWp1/sDfXW1PsCkvAfyNlunC+aX0Q
 ChXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98metf9b+/ml/auWYKtWya5ML6A+NXJr1FzCort0L/8=;
 b=E9f3hbIZdVtwElbq2wVKKiF61VU21E9VU4FEMRAVZFsthSwPw4VH9y9VS68bjZSSkl
 8lg9v2NZ63YI4Q2RnaX8vGNIqw9gBmADlIIiJJD8tDcOG6w2x4PY0NHFV38EZDnU1oro
 0nDCX93seae7MgUWNf176KiSBlAcS3V5jvnP363/N/DA1jID1UalG6XRx0vTG+X21fne
 VAnIF/OnWaEah8TatbABN+uOLmgzOBobhrLtl94oEH7vX0NbIDys1psIlYY7YAOveeNX
 nyNG6LRPZyqOYtqJh8D5md78drgXKQKAuG2Fg1U1YAGhWr5ZlxMj3Xswlbw8qmCHxxzj
 raAw==
X-Gm-Message-State: AOAM5336W92r1gYR1maQ+6VTXnly+mOu2MKQLhsAp76kN7/qFlfn9DH6
 veE78dHU1ja394bMnoqNPO/0dg==
X-Google-Smtp-Source: ABdhPJxC7M5p6jb3gAaVRjBavNAOV3DOsen77foj3+wuH0+ndDT9CkZ5xuH7fbMZPtUDHULM2xeyMA==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr17997931wrn.231.1613385138620; 
 Mon, 15 Feb 2021 02:32:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/9] hw/arm/musicpal: Remove dead code for non-32-bit-RGB
 surfaces
Date: Mon, 15 Feb 2021 10:32:07 +0000
Message-Id: <20210215103215.4944-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For a long time now the UI layer has guaranteed that the console
surface is always 32 bits per pixel RGB. Remove the legacy dead
code from the milkymist display device which was handling the
possibility that the console surface was some other format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


