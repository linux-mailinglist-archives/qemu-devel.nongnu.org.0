Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7286A26EC
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 04:23:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVl9O-00042B-I7; Fri, 24 Feb 2023 22:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVl9M-00041x-77; Fri, 24 Feb 2023 22:23:04 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVl9K-0000JQ-0k; Fri, 24 Feb 2023 22:23:03 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3DC2374632B;
 Sat, 25 Feb 2023 04:22:57 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E50BA745720; Sat, 25 Feb 2023 04:22:56 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2] hw/display/sm501: Add fallbacks to pixman routines
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sebastian Bauer <mail@sebastianbauer.info>
Message-Id: <20230225032256.E50BA745720@zero.eik.bme.hu>
Date: Sat, 25 Feb 2023 04:22:56 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Add fallbacks to handle such cases. Also add a property to allow
disabling pixman and always use the fallbacks which is useful for
testing different drawing methods or debugging pixman related issues.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
v2: Fix logic for pixman_blt to do what the commit message says, it
    was inverted in v1. Reword commit message to clarify the property
    is a debug option.

 hw/display/sm501.c | 82 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 58 insertions(+), 24 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 58bc9701ee..8c72f3a5b4 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -464,6 +464,7 @@ typedef struct SM501State {
     uint32_t last_width;
     uint32_t last_height;
     bool do_full_update; /* perform a full update next time */
+    bool use_pixman;
     I2CBus *i2c_bus;
 
     /* mmio registers */
@@ -691,7 +692,7 @@ static void sm501_2d_operation(SM501State *s)
     unsigned int dst_pitch = (s->twoD_pitch >> 16) & 0x1FFF;
     int crt = (s->dc_crt_control & SM501_DC_CRT_CONTROL_SEL) ? 1 : 0;
     int fb_len = get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt);
-    bool overlap = false;
+    bool overlap = false, fallback = false;
 
     if ((s->twoD_stretch >> 16) & 0xF) {
         qemu_log_mask(LOG_UNIMP, "sm501: only XY addressing is supported.\n");
@@ -826,7 +827,9 @@ static void sm501_2d_operation(SM501State *s)
                 de = db + (width + (height - 1) * dst_pitch) * bypp;
                 overlap = (db < se && sb < de);
             }
-            if (overlap) {
+            if (!s->use_pixman) {
+                fallback = true;
+            } else if (overlap) {
                 /* pixman can't do reverse blit: copy via temporary */
                 int tmp_stride = DIV_ROUND_UP(width * bypp, sizeof(uint32_t));
                 uint32_t *tmp = tmp_buf;
@@ -834,25 +837,48 @@ static void sm501_2d_operation(SM501State *s)
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
@@ -867,13 +893,19 @@ static void sm501_2d_operation(SM501State *s)
             color = cpu_to_le16(color);
         }
 
-        if (width == 1 && height == 1) {
-            unsigned int i = (dst_x + dst_y * dst_pitch) * bypp;
-            stn_he_p(&s->local_mem[dst_base + i], bypp, color);
-        } else {
-            pixman_fill((uint32_t *)&s->local_mem[dst_base],
-                        dst_pitch * bypp / sizeof(uint32_t),
-                        8 * bypp, dst_x, dst_y, width, height, color);
+        if (!s->use_pixman || (width == 1 && height == 1) ||
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
@@ -2010,6 +2042,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
 static Property sm501_sysbus_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
     DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
+    DEFINE_PROP_BOOL("x-pixman", SM501SysBusState, state.use_pixman, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -2093,6 +2126,7 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
 
 static Property sm501_pci_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),
+    DEFINE_PROP_BOOL("x-pixman", SM501PCIState, state.use_pixman, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.30.7


