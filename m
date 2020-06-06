Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A531F085C
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jun 2020 21:33:07 +0200 (CEST)
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jheZ0-0007OQ-5D
	for lists+qemu-devel@lfdr.de; Sat, 06 Jun 2020 15:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jheP8-0007QV-MF
 for qemu-devel@nongnu.org; Sat, 06 Jun 2020 15:22:54 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:30184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jheP7-0006Gz-AV
 for qemu-devel@nongnu.org; Sat, 06 Jun 2020 15:22:54 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 02789748DD1;
 Sat,  6 Jun 2020 21:22:43 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7DBD2746331; Sat,  6 Jun 2020 21:22:42 +0200 (CEST)
Message-Id: <7a818701887a77af17995aa062b37f92ffc3d2eb.1591471056.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1591471056.git.balaton@eik.bme.hu>
References: <cover.1591471056.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/4] sm501: Drop unneded variable
Date: Sat, 06 Jun 2020 21:17:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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

We don't need a separate variable to keep track if we allocated memory
that needs to be freed as we can test the pointer itself.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 5ae320ddc3..85d54b598f 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -796,13 +796,12 @@ static void sm501_2d_operation(SM501State *s)
             de = db + width + height * (width + dst_pitch);
             if (rtl && ((db >= sb && db <= se) || (de >= sb && de <= se))) {
                 /* regions may overlap: copy via temporary */
-                int free_buf = 0, llb = width * (1 << format);
+                int llb = width * (1 << format);
                 int tmp_stride = DIV_ROUND_UP(llb, sizeof(uint32_t));
                 uint32_t *tmp = tmp_buf;
 
                 if (tmp_stride * sizeof(uint32_t) * height > sizeof(tmp_buf)) {
                     tmp = g_malloc(tmp_stride * sizeof(uint32_t) * height);
-                    free_buf = 1;
                 }
                 pixman_blt((uint32_t *)&s->local_mem[src_base], tmp,
                            src_pitch * (1 << format) / sizeof(uint32_t),
@@ -813,7 +812,7 @@ static void sm501_2d_operation(SM501State *s)
                            dst_pitch * (1 << format) / sizeof(uint32_t),
                            8 * (1 << format), 8 * (1 << format),
                            0, 0, dst_x, dst_y, width, height);
-                if (free_buf) {
+                if (tmp != tmp_buf) {
                     g_free(tmp);
                 }
             } else {
-- 
2.21.3


