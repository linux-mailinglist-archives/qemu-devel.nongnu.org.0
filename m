Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1372026BB
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 23:13:50 +0200 (CEST)
Received: from localhost ([::1]:42854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmko9-0002Ue-Qa
	for lists+qemu-devel@lfdr.de; Sat, 20 Jun 2020 17:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jmkfO-0005I3-WD
 for qemu-devel@nongnu.org; Sat, 20 Jun 2020 17:04:47 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:49507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jmkfL-0001gC-9I
 for qemu-devel@nongnu.org; Sat, 20 Jun 2020 17:04:46 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 61067748DE3;
 Sat, 20 Jun 2020 23:04:33 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D86E5748DDA; Sat, 20 Jun 2020 23:04:32 +0200 (CEST)
Message-Id: <e2f649cb286f0735a10ec87c1b36a7ae081acb61.1592686588.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1592686588.git.balaton@eik.bme.hu>
References: <cover.1592686588.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 6/9] sm501: Use stn_he_p/ldn_he_p instead of switch/case
Date: Sat, 20 Jun 2020 22:56:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/20 17:04:33
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

Instead of open coding op with different sizes using a switch and type
casting it can be written more compactly using stn_he_p/ldn_he_p.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/sm501.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 2098e69810..6349f31e64 100644
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


