Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB0D1DB662
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 16:24:49 +0200 (CEST)
Received: from localhost ([::1]:46038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbPeK-0000Jm-DZ
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 10:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jbPXn-0004yw-Fz
 for qemu-devel@nongnu.org; Wed, 20 May 2020 10:18:03 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:49755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jbPXm-0004T0-Lf
 for qemu-devel@nongnu.org; Wed, 20 May 2020 10:18:03 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B4936748DDA;
 Wed, 20 May 2020 16:17:49 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3C905748DD0; Wed, 20 May 2020 16:17:49 +0200 (CEST)
Message-Id: <6c63555cc4023d05e550d513112f472a2020a117.1589981990.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1589981990.git.balaton@eik.bme.hu>
References: <cover.1589981990.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 3/6] sm501: Use BIT(x) macro to shorten constant
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

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index f42d05e1e4..97660090bb 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -701,7 +701,7 @@ static void sm501_2d_operation(SM501State *s)
 {
     /* obtain operation parameters */
     int cmd = (s->twoD_control >> 16) & 0x1F;
-    int rtl = s->twoD_control & 0x8000000;
+    int rtl = s->twoD_control & BIT(27);
     int src_x = (s->twoD_source >> 16) & 0x01FFF;
     int src_y = s->twoD_source & 0xFFFF;
     int dst_x = (s->twoD_destination >> 16) & 0x01FFF;
@@ -751,8 +751,7 @@ static void sm501_2d_operation(SM501State *s)
         }
     }
 
-    if ((s->twoD_source_base & 0x08000000) ||
-        (s->twoD_destination_base & 0x08000000)) {
+    if (s->twoD_source_base & BIT(27) || s->twoD_destination_base & BIT(27)) {
         qemu_log_mask(LOG_UNIMP, "sm501: only local memory is supported.\n");
         return;
     }
-- 
2.21.3


