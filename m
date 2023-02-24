Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166C26A1441
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 01:20:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVLnh-0002TS-2f; Thu, 23 Feb 2023 19:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVLne-0002Rt-IM; Thu, 23 Feb 2023 19:18:58 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVLnc-0006PW-37; Thu, 23 Feb 2023 19:18:58 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BD86E746346;
 Fri, 24 Feb 2023 01:18:52 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4B813746324; Fri, 24 Feb 2023 01:18:52 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] hw/display/sm501: Add alternatives to pixman routines
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sebastian Bauer <mail@sebastianbauer.info>
Message-Id: <20230224001852.4B813746324@zero.eik.bme.hu>
Date: Fri, 24 Feb 2023 01:18:52 +0100 (CET)
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

Pixman can sometimes return false so add fallbacks for such cases and
also add a property to disable pixman and always use the fallbacks
which can be useful on platforms where pixman is broken or for testing
different drawing methods.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
Also ping for the other sm501 patch I've sent a week ago:
https://patchew.org/QEMU/20230216144043.D632874634B@zero.eik.bme.hu/
These two patches are needed to fix graphics issues with AmigaOS so
I'd like them to be merged for 8.0

 hw/display/sm501.c | 77 +++++++++++++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 58bc9701ee..2a0a9a37f8 100644
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
@@ -826,7 +827,7 @@ static void sm501_2d_operation(SM501State *s)
                 de = db + (width + (height - 1) * dst_pitch) * bypp;
                 overlap = (db < se && sb < de);
             }
-            if (overlap) {
+            if (s->use_pixman && overlap) {
                 /* pixman can't do reverse blit: copy via temporary */
                 int tmp_stride = DIV_ROUND_UP(width * bypp, sizeof(uint32_t));
                 uint32_t *tmp = tmp_buf;
@@ -834,25 +835,43 @@ static void sm501_2d_operation(SM501State *s)
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
+                fallback = pixman_blt((uint32_t *)&s->local_mem[src_base], tmp,
+                                      src_pitch * bypp / sizeof(uint32_t),
+                                      tmp_stride, 8 * bypp, 8 * bypp,
+                                      src_x, src_y, 0, 0, width, height);
+                fallback |= pixman_blt(tmp, (uint32_t *)&s->local_mem[dst_base],
+                                       tmp_stride,
+                                       dst_pitch * bypp / sizeof(uint32_t),
+                                       8 * bypp, 8 * bypp, 0, 0, dst_x, dst_y,
+                                       width, height);
                 if (tmp != tmp_buf) {
                     g_free(tmp);
                 }
-            } else {
-                pixman_blt((uint32_t *)&s->local_mem[src_base],
-                           (uint32_t *)&s->local_mem[dst_base],
-                           src_pitch * bypp / sizeof(uint32_t),
-                           dst_pitch * bypp / sizeof(uint32_t),
-                           8 * bypp, 8 * bypp,
-                           src_x, src_y, dst_x, dst_y, width, height);
+            } else if (s->use_pixman) {
+                fallback = pixman_blt((uint32_t *)&s->local_mem[src_base],
+                                      (uint32_t *)&s->local_mem[dst_base],
+                                      src_pitch * bypp / sizeof(uint32_t),
+                                      dst_pitch * bypp / sizeof(uint32_t),
+                                      8 * bypp, 8 * bypp, src_x, src_y,
+                                      dst_x, dst_y, width, height);
+            }
+            if (!s->use_pixman || fallback) {
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
@@ -867,13 +886,19 @@ static void sm501_2d_operation(SM501State *s)
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
@@ -2010,6 +2035,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
 static Property sm501_sysbus_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
     DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
+    DEFINE_PROP_BOOL("x-pixman", SM501SysBusState, state.use_pixman, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -2093,6 +2119,7 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
 
 static Property sm501_pci_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),
+    DEFINE_PROP_BOOL("x-pixman", SM501PCIState, state.use_pixman, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.30.7


