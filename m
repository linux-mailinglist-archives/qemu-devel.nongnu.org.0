Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF65A6D64EC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:12:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhNc-0002Xk-Ql; Tue, 04 Apr 2023 10:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangfeng@kylinos.cn>)
 id 1pjbMN-0000r7-1J; Tue, 04 Apr 2023 03:45:44 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangfeng@kylinos.cn>)
 id 1pjbMI-0007VI-Jg; Tue, 04 Apr 2023 03:45:42 -0400
X-UUID: 7109e155d15f4e1d9b90988a8f9b9732-20230404
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:c230e7ff-7383-4e37-9e3d-befd4212d63f, IP:15,
 URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:35
X-CID-INFO: VERSION:1.1.22, REQID:c230e7ff-7383-4e37-9e3d-befd4212d63f, IP:15,
 UR
 L:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:35
X-CID-META: VersionHash:120426c, CLOUDID:fcfcc3f7-ddba-41c3-91d9-10eeade8eac7,
 B
 ulkID:2304041545233UXU9CEP,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|102,
 TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 7109e155d15f4e1d9b90988a8f9b9732-20230404
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <jiangfeng@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 631463944; Tue, 04 Apr 2023 15:45:21 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: i.mitsyanko@gmail.com,
	peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Feng Jiang <jiangfeng@kylinos.cn>
Subject: [PATCH] exynos: Fix out-of-bounds access in exynos4210_gcomp_find
Date: Tue,  4 Apr 2023 15:45:06 +0800
Message-Id: <20230404074506.112615-1-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=124.126.103.232;
 envelope-from=jiangfeng@kylinos.cn; helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 04 Apr 2023 10:11:21 -0400
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

When 'res' equals -1, the array 's->g_timer.reg.comp[]' is accessed
out of bounds.

Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 hw/timer/exynos4210_mct.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index c17b247da3..446bbd2b96 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -480,11 +480,14 @@ static int32_t exynos4210_gcomp_find(Exynos4210MCTState *s)
         res = min_comp_i;
     }
 
-    DPRINTF("found comparator %d: comp 0x%llx distance 0x%llx, gfrc 0x%llx\n",
-            res,
-            s->g_timer.reg.comp[res],
-            distance_min,
-            gfrc);
+    if (res >= 0) {
+        DPRINTF("found comparator %d: "
+                "comp 0x%llx distance 0x%llx, gfrc 0x%llx\n",
+                res,
+                s->g_timer.reg.comp[res],
+                distance_min,
+                gfrc);
+    }
 
     return res;
 }
-- 
2.39.2


