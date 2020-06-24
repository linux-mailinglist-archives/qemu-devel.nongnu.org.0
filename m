Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E987D2079F3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 19:11:05 +0200 (CEST)
Received: from localhost ([::1]:60034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo8vQ-00082V-V4
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 13:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jo8Yx-0001vL-Gb
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:47:51 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:44118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jo8Yt-00074E-IV
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:47:50 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CCAB274633E;
 Wed, 24 Jun 2020 18:47:37 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A941374633D; Wed, 24 Jun 2020 18:47:37 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
In-Reply-To: <f0b64bf047e343f8b2e91baeccb4753bc26b17cc.1592686588.git.balaton@eik.bme.hu>
References: <f0b64bf047e343f8b2e91baeccb4753bc26b17cc.1592686588.git.balaton@eik.bme.hu>
Subject: [PATCH v4] sm501: Fix and optimize overlap check
Date: Wed, 24 Jun 2020 18:42:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Message-Id: <20200624164737.A941374633D@zero.eik.bme.hu>
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 12:47:38
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

When doing reverse blit we need to check if source and dest overlap
but it is not trivial due to possible different base and pitch of
source and dest. Do rectangle overlap if base and pitch match,
otherwise just check if memory area containing the rects overlaps so
rects could possibly overlap.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
This version fixes overlap check according to Peter's suggestion, only
resending this patch as v4, others still valid from v3. Let me know if
you want the whole series resent instead.

 hw/display/sm501.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 2db347dcbc..9cccc68c35 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -690,6 +690,7 @@ static void sm501_2d_operation(SM501State *s)
     unsigned int dst_pitch = (s->twoD_pitch >> 16) & 0x1FFF;
     int crt = (s->dc_crt_control & SM501_DC_CRT_CONTROL_SEL) ? 1 : 0;
     int fb_len = get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt);
+    bool overlap = false;
 
     if ((s->twoD_stretch >> 16) & 0xF) {
         qemu_log_mask(LOG_UNIMP, "sm501: only XY addressing is supported.\n");
@@ -784,16 +785,21 @@ static void sm501_2d_operation(SM501State *s)
                          ldn_he_p(&s->local_mem[src_base + si], bypp));
                 break;
             }
-            /* Check for overlaps, this could be made more exact */
-            uint32_t sb, se, db, de;
-            sb = src_base + src_x + src_y * (width + src_pitch);
-            se = sb + width + height * (width + src_pitch);
-            db = dst_base + dst_x + dst_y * (width + dst_pitch);
-            de = db + width + height * (width + dst_pitch);
-            if (rtl && ((db >= sb && db <= se) || (de >= sb && de <= se))) {
-                /* regions may overlap: copy via temporary */
-                int llb = width * bypp;
-                int tmp_stride = DIV_ROUND_UP(llb, sizeof(uint32_t));
+            /* If reverse blit do simple check for overlaps */
+            if (rtl && src_base == dst_base && src_pitch == dst_pitch) {
+                overlap = (src_x < dst_x + width && src_x + width > dst_x &&
+                           src_y < dst_y + height && src_y + height > dst_y);
+            } else if (rtl) {
+                unsigned int sb, se, db, de;
+                sb = src_base + (src_x + src_y * src_pitch) * bypp;
+                se = sb + (width + (height - 1) * src_pitch) * bypp;
+                db = dst_base + (dst_x + dst_y * dst_pitch) * bypp;
+                de = db + (width + (height - 1) * dst_pitch) * bypp;
+                overlap = (db < se && sb < de);
+            }
+            if (overlap) {
+                /* pixman can't do reverse blit: copy via temporary */
+                int tmp_stride = DIV_ROUND_UP(width * bypp, sizeof(uint32_t));
                 uint32_t *tmp = tmp_buf;
 
                 if (tmp_stride * sizeof(uint32_t) * height > sizeof(tmp_buf)) {
-- 
2.21.3


