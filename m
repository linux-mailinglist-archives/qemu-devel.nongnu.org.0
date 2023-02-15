Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0BF6A3483
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:15:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPHw-0003Hr-QX; Sun, 26 Feb 2023 17:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPHu-0003GO-2A; Sun, 26 Feb 2023 17:14:34 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPHr-0004zz-PE; Sun, 26 Feb 2023 17:14:33 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3313074638A;
 Sun, 26 Feb 2023 23:14:29 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 02057746377; Sun, 26 Feb 2023 23:14:29 +0100 (CET)
Message-Id: <17ef3c59dc7868f75034e9ebe21e2999c8f718d4.1677445307.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1677445307.git.balaton@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Wed, 15 Feb 2023 16:35:42 +0100
Subject: [PATCH v3 1/8] hw/display/sm501: Implement more 2D raster operations
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
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
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

Add simple implementation for two raster operations that are used by
AmigaOS which fixes graphics problems in some programs using these.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reported-by: Rene Engel <ReneEngel80@emailn.de>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
These are documented for example at:
https://learn.microsoft.com/en-us/windows/win32/gdi/ternary-raster-operations

 hw/display/sm501.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index e1d0591d36..58bc9701ee 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -753,7 +753,7 @@ static void sm501_2d_operation(SM501State *s)
         }
 
         if ((rop_mode && rop == 0x5) || (!rop_mode && rop == 0x55)) {
-            /* Invert dest, is there a way to do this with pixman? */
+            /* DSTINVERT, is there a way to do this with pixman? */
             unsigned int x, y, i;
             uint8_t *d = s->local_mem + dst_base;
 
@@ -763,6 +763,34 @@ static void sm501_2d_operation(SM501State *s)
                     stn_he_p(&d[i], bypp, ~ldn_he_p(&d[i], bypp));
                 }
             }
+        } else if (!rop_mode && rop == 0x99) {
+            /* DSxn, is there a way to do this with pixman? */
+            unsigned int x, y, i, j;
+            uint8_t *sp = s->local_mem + src_base;
+            uint8_t *d = s->local_mem + dst_base;
+
+            for (y = 0; y < height; y++) {
+                i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
+                j = (src_x + (src_y + y) * src_pitch) * bypp;
+                for (x = 0; x < width; x++, i += bypp, j += bypp) {
+                    stn_he_p(&d[i], bypp,
+                             ~(ldn_he_p(&sp[j], bypp) ^ ldn_he_p(&d[i], bypp)));
+                }
+            }
+        } else if (!rop_mode && rop == 0xee) {
+            /* SRCPAINT, is there a way to do this with pixman? */
+            unsigned int x, y, i, j;
+            uint8_t *sp = s->local_mem + src_base;
+            uint8_t *d = s->local_mem + dst_base;
+
+            for (y = 0; y < height; y++) {
+                i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
+                j = (src_x + (src_y + y) * src_pitch) * bypp;
+                for (x = 0; x < width; x++, i += bypp, j += bypp) {
+                    stn_he_p(&d[i], bypp,
+                             ldn_he_p(&sp[j], bypp) | ldn_he_p(&d[i], bypp));
+                }
+            }
         } else {
             /* Do copy src for unimplemented ops, better than unpainted area */
             if ((rop_mode && (rop != 0xc || rop2_source_is_pattern)) ||
-- 
2.30.7


