Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C293E1FA538
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 02:40:09 +0200 (CEST)
Received: from localhost ([::1]:44320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkze4-0002If-Qc
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 20:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkzZu-0004fB-Fv
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 20:35:51 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:46225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkzZr-0003z1-J5
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 20:35:50 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 051CA748DDF;
 Tue, 16 Jun 2020 02:35:41 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7600C748DCF; Tue, 16 Jun 2020 02:35:40 +0200 (CEST)
Message-Id: <59fd9656e72cd56e6dcd3c9ffc04ff91f8b3d907.1592266950.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1592266950.git.balaton@eik.bme.hu>
References: <cover.1592266950.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 6/8] sm501: Use stn_he_p/ldn_he_p instead of switch/case
Date: Tue, 16 Jun 2020 02:22:30 +0200
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

Instead of open coding op with different sizes using a switch and type
casting it can be written more compactly using stn_he_p/ldn_he_p.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index b6356ea1ee..6e914d3162 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -766,17 +766,7 @@ static void sm501_2d_operation(SM501State *s)
             for (y = 0; y < height; y++) {
                 i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
                 for (x = 0; x < width; x++, i += bypp) {
-                    switch (format) {
-                    case 0:
-                        d[i] = ~d[i];
-                        break;
-                    case 1:
-                        *(uint16_t *)&d[i] = ~*(uint16_t *)&d[i];
-                        break;
-                    case 2:
-                        *(uint32_t *)&d[i] = ~*(uint32_t *)&d[i];
-                        break;
-                    }
+                    stn_he_p(&d[i], bypp, ~ldn_he_p(&d[i], bypp));
                 }
             }
         } else {
-- 
2.21.3


