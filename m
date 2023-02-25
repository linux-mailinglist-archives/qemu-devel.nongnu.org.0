Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3D6A3488
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:16:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPHw-0003IE-WC; Sun, 26 Feb 2023 17:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPHu-0003GT-9f; Sun, 26 Feb 2023 17:14:34 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPHr-000502-OK; Sun, 26 Feb 2023 17:14:33 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 36281746D65;
 Sun, 26 Feb 2023 23:14:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0D183746705; Sun, 26 Feb 2023 23:14:30 +0100 (CET)
Message-Id: <20ed9442a0146238254ccc340c0d1efa226c6356.1677445307.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1677445307.git.balaton@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sat, 25 Feb 2023 22:35:28 +0100
Subject: [PATCH v3 2/8] hw/display/sm501: Add fallbacks to pixman routines
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 vr_qemu@t-online.de, ReneEngel80@emailn.de
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Pixman may return false if it does not have a suitable implementation.
Add fallbacks to handle such cases.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reported-by: Rene Engel <ReneEngel80@emailn.de>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
---
 hw/display/sm501.c | 75 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 23 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 58bc9701ee..23c4418e19 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -691,7 +691,7 @@ static void sm501_2d_operation(SM501State *s)
     unsigned int dst_pitch = (s->twoD_pitch >> 16) & 0x1FFF;
     int crt = (s->dc_crt_control & SM501_DC_CRT_CONTROL_SEL) ? 1 : 0;
     int fb_len = get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt);
-    bool overlap = false;
+    bool overlap = false, fallback = false;
 
     if ((s->twoD_stretch >> 16) & 0xF) {
         qemu_log_mask(LOG_UNIMP, "sm501: only XY addressing is supported.\n");
@@ -834,25 +834,48 @@ static void sm501_2d_operation(SM501State *s)
                 if (tmp_stride * sizeof(uint32_t) * height > sizeof(tmp_buf)) {
                     tmp = g_malloc(tmp_stride * sizeof(uint32_t) * height);
                 }
-                pixman_blt((uint32_t *)&s->local_mem[src_base], tmp,
-                           src_pitch * bypp / sizeof(uint32_t),
-                           tmp_stride, 8 * bypp, 8 * bypp,
-                           src_x, src_y, 0, 0, width, height);
-                pixman_blt(tmp, (uint32_t *)&s->local_mem[dst_base],
-                           tmp_stride,
-                           dst_pitch * bypp / sizeof(uint32_t),
-                           8 * bypp, 8 * bypp,
-                           0, 0, dst_x, dst_y, width, height);
+                fallback = !pixman_blt((uint32_t *)&s->local_mem[src_base],
+                                       tmp,
+                                       src_pitch * bypp / sizeof(uint32_t),
+                                       tmp_stride,
+                                       8 * bypp, 8 * bypp,
+                                       src_x, src_y, 0, 0, width, height);
+                if (!fallback) {
+                    fallback = !pixman_blt(tmp,
+                                       (uint32_t *)&s->local_mem[dst_base],
+                                       tmp_stride,
+                                       dst_pitch * bypp / sizeof(uint32_t),
+                                       8 * bypp, 8 * bypp,
+                                       0, 0, dst_x, dst_y, width, height);
+                }
                 if (tmp != tmp_buf) {
                     g_free(tmp);
                 }
             } else {
-                pixman_blt((uint32_t *)&s->local_mem[src_base],
-                           (uint32_t *)&s->local_mem[dst_base],
-                           src_pitch * bypp / sizeof(uint32_t),
-                           dst_pitch * bypp / sizeof(uint32_t),
-                           8 * bypp, 8 * bypp,
-                           src_x, src_y, dst_x, dst_y, width, height);
+                fallback = !pixman_blt((uint32_t *)&s->local_mem[src_base],
+                                       (uint32_t *)&s->local_mem[dst_base],
+                                       src_pitch * bypp / sizeof(uint32_t),
+                                       dst_pitch * bypp / sizeof(uint32_t),
+                                       8 * bypp, 8 * bypp, src_x, src_y,
+                                       dst_x, dst_y, width, height);
+            }
+            if (fallback) {
+                uint8_t *sp = s->local_mem + src_base;
+                uint8_t *d = s->local_mem + dst_base;
+                unsigned int y, i, j;
+                for (y = 0; y < height; y++) {
+                    if (overlap) { /* overlap also means rtl */
+                        i = (dst_y + height - 1 - y) * dst_pitch;
+                        i = (dst_x + i) * bypp;
+                        j = (src_y + height - 1 - y) * src_pitch;
+                        j = (src_x + j) * bypp;
+                        memmove(&d[i], &sp[j], width * bypp);
+                    } else {
+                        i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
+                        j = (src_x + (src_y + y) * src_pitch) * bypp;
+                        memcpy(&d[i], &sp[j], width * bypp);
+                    }
+                }
             }
         }
         break;
@@ -867,13 +890,19 @@ static void sm501_2d_operation(SM501State *s)
             color = cpu_to_le16(color);
         }
 
-        if (width == 1 && height == 1) {
-            unsigned int i = (dst_x + dst_y * dst_pitch) * bypp;
-            stn_he_p(&s->local_mem[dst_base + i], bypp, color);
-        } else {
-            pixman_fill((uint32_t *)&s->local_mem[dst_base],
-                        dst_pitch * bypp / sizeof(uint32_t),
-                        8 * bypp, dst_x, dst_y, width, height, color);
+        if ((width == 1 && height == 1) ||
+            !pixman_fill((uint32_t *)&s->local_mem[dst_base],
+                         dst_pitch * bypp / sizeof(uint32_t), 8 * bypp,
+                         dst_x, dst_y, width, height, color)) {
+            /* fallback when pixman failed or we don't want to call it */
+            uint8_t *d = s->local_mem + dst_base;
+            unsigned int x, y, i;
+            for (y = 0; y < height; y++, i += dst_pitch * bypp) {
+                i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
+                for (x = 0; x < width; x++, i += bypp) {
+                    stn_he_p(&d[i], bypp, color);
+                }
+            }
         }
         break;
     }
-- 
2.30.7


