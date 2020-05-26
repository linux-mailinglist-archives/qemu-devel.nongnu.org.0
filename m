Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7801DB633
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 16:23:22 +0200 (CEST)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbPcv-0006Ek-MV
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 10:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jbPXm-0004vk-Co
 for qemu-devel@nongnu.org; Wed, 20 May 2020 10:18:02 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:49721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jbPXk-0004Pv-Al
 for qemu-devel@nongnu.org; Wed, 20 May 2020 10:18:01 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 882B2748DD1;
 Wed, 20 May 2020 16:17:49 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 408FD748DD8; Wed, 20 May 2020 16:17:49 +0200 (CEST)
Message-Id: <f9557de4f9d30e5af4b1e7cd66f3e5a044705fba.1589981990.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1589981990.git.balaton@eik.bme.hu>
References: <cover.1589981990.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 4/6] sm501: Clean up local variables in sm501_2d_operation
Date: Wed, 20 May 2020 15:39:50 +0200
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 10:17:49
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sebastian Bauer <mail@sebastianbauer.info>,
 Magnus Damm <magnus.damm@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make variables local to the block they are used in to make it clearer
which operation they are needed for.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 97660090bb..5ed57703d8 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -699,28 +699,19 @@ static inline void hwc_invalidate(SM501State *s, int crt)
 
 static void sm501_2d_operation(SM501State *s)
 {
-    /* obtain operation parameters */
     int cmd = (s->twoD_control >> 16) & 0x1F;
     int rtl = s->twoD_control & BIT(27);
-    int src_x = (s->twoD_source >> 16) & 0x01FFF;
-    int src_y = s->twoD_source & 0xFFFF;
-    int dst_x = (s->twoD_destination >> 16) & 0x01FFF;
-    int dst_y = s->twoD_destination & 0xFFFF;
-    int width = (s->twoD_dimension >> 16) & 0x1FFF;
-    int height = s->twoD_dimension & 0xFFFF;
-    uint32_t color = s->twoD_foreground;
     int format = (s->twoD_stretch >> 20) & 0x3;
     int rop_mode = (s->twoD_control >> 15) & 0x1; /* 1 for rop2, else rop3 */
     /* 1 if rop2 source is the pattern, otherwise the source is the bitmap */
     int rop2_source_is_pattern = (s->twoD_control >> 14) & 0x1;
     int rop = s->twoD_control & 0xFF;
-    uint32_t src_base = s->twoD_source_base & 0x03FFFFFF;
+    int dst_x = (s->twoD_destination >> 16) & 0x01FFF;
+    int dst_y = s->twoD_destination & 0xFFFF;
+    int width = (s->twoD_dimension >> 16) & 0x1FFF;
+    int height = s->twoD_dimension & 0xFFFF;
     uint32_t dst_base = s->twoD_destination_base & 0x03FFFFFF;
-
-    /* get frame buffer info */
-    uint8_t *src = s->local_mem + src_base;
     uint8_t *dst = s->local_mem + dst_base;
-    int src_pitch = s->twoD_pitch & 0x1FFF;
     int dst_pitch = (s->twoD_pitch >> 16) & 0x1FFF;
     int crt = (s->dc_crt_control & SM501_DC_CRT_CONTROL_SEL) ? 1 : 0;
     int fb_len = get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt);
@@ -758,6 +749,13 @@ static void sm501_2d_operation(SM501State *s)
 
     switch (cmd) {
     case 0x00: /* copy area */
+    {
+        int src_x = (s->twoD_source >> 16) & 0x01FFF;
+        int src_y = s->twoD_source & 0xFFFF;
+        uint32_t src_base = s->twoD_source_base & 0x03FFFFFF;
+        uint8_t *src = s->local_mem + src_base;
+        int src_pitch = s->twoD_pitch & 0x1FFF;
+
 #define COPY_AREA(_bpp, _pixel_type, rtl) {                                   \
         int y, x, index_d, index_s;                                           \
         for (y = 0; y < height; y++) {                              \
@@ -793,8 +791,11 @@ static void sm501_2d_operation(SM501State *s)
             break;
         }
         break;
-
+    }
     case 0x01: /* fill rectangle */
+    {
+        uint32_t color = s->twoD_foreground;
+
 #define FILL_RECT(_bpp, _pixel_type) {                                      \
         int y, x;                                                           \
         for (y = 0; y < height; y++) {                            \
@@ -819,7 +820,7 @@ static void sm501_2d_operation(SM501State *s)
             break;
         }
         break;
-
+    }
     default:
         qemu_log_mask(LOG_UNIMP, "sm501: not implemented 2D operation: %d\n",
                       cmd);
-- 
2.21.3


