Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26C31FA530
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 02:37:13 +0200 (CEST)
Received: from localhost ([::1]:33514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkzbE-0006IO-N0
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 20:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkzZr-0004ci-03
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 20:35:47 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:46200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkzZn-0003tn-Mq
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 20:35:46 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E433D748DDD;
 Tue, 16 Jun 2020 02:35:40 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 704CA748DC8; Tue, 16 Jun 2020 02:35:40 +0200 (CEST)
Message-Id: <08998af9ba98092b7df53b8c759010bee6206261.1592266950.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1592266950.git.balaton@eik.bme.hu>
References: <cover.1592266950.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 5/8] sm501: Optimise 1 pixel 2d ops
Date: Tue, 16 Jun 2020 02:22:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 20:35:40
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

Some guests do 1x1 blits which is faster to do directly than calling a
function for it so avoid overhead in this case.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 282574adec..b6356ea1ee 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -794,6 +794,14 @@ static void sm501_2d_operation(SM501State *s)
                 src_x == dst_x && src_y == dst_y) {
                 break;
             }
+            /* Some clients also do 1 pixel blits, avoid overhead for these */
+            if (width == 1 && height == 1) {
+                unsigned int si = (src_x + src_y * src_pitch) * bypp;
+                unsigned int di = (dst_x + dst_y * dst_pitch) * bypp;
+                stn_he_p(&s->local_mem[dst_base + di], bypp,
+                         ldn_he_p(&s->local_mem[src_base + si], bypp));
+                break;
+            }
             /* Check for overlaps, this could be made more exact */
             uint32_t sb, se, db, de;
             sb = src_base + src_x + src_y * (width + src_pitch);
@@ -842,9 +850,14 @@ static void sm501_2d_operation(SM501State *s)
             color = cpu_to_le16(color);
         }
 
-        pixman_fill((uint32_t *)&s->local_mem[dst_base],
-                    dst_pitch * bypp / sizeof(uint32_t),
-                    8 * bypp, dst_x, dst_y, width, height, color);
+        if (width == 1 && height == 1) {
+            unsigned int i = (dst_x + dst_y * dst_pitch) * bypp;
+            stn_he_p(&s->local_mem[dst_base + i], bypp, color);
+        } else {
+            pixman_fill((uint32_t *)&s->local_mem[dst_base],
+                        dst_pitch * bypp / sizeof(uint32_t),
+                        8 * bypp, dst_x, dst_y, width, height, color);
+        }
         break;
     }
     default:
-- 
2.21.3


