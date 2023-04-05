Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715666D8354
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:14:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5lf-0007ga-HX; Wed, 05 Apr 2023 12:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pk5la-0007gF-Dd; Wed, 05 Apr 2023 12:13:46 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pk5lW-0006VG-RG; Wed, 05 Apr 2023 12:13:44 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E5577746369;
 Wed,  5 Apr 2023 18:12:34 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6EF0A74633D; Wed,  5 Apr 2023 18:12:34 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Wed, 5 Apr 2023 17:57:19 +0200
Subject: [PATCH] hw/display/sm501: Remove unneeded increment from loop
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20230405161234.6EF0A74633D@zero.eik.bme.hu>
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

As Coverity points out (CID 1508621) the calculation to increment i in
the fill fallback loop is ineffective as it is overwritten in next
statement. This was left there by mistake from a previous version but
is not needed in the current approach so remove the superfluous
increment statement.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index dbabbc4339..0eecd00701 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -901,7 +901,7 @@ static void sm501_2d_operation(SM501State *s)
             /* fallback when pixman failed or we don't want to call it */
             uint8_t *d = s->local_mem + dst_base;
             unsigned int x, y, i;
-            for (y = 0; y < height; y++, i += dst_pitch * bypp) {
+            for (y = 0; y < height; y++) {
                 i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
                 for (x = 0; x < width; x++, i += bypp) {
                     stn_he_p(&d[i], bypp, color);
-- 
2.30.8


