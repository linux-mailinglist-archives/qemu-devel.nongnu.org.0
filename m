Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7C264CB94
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 14:50:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S59-0004na-Lt; Wed, 14 Dec 2022 08:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4e-0004BB-Df
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4Z-0003RW-5Z
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WkIFrctSmwOi2z/F9hW5SeAvCSs2LBzB9I/utCjtub8=;
 b=TiTdB1TiYA4YDGoknfw9n4vbv3n4uq9rVP48MpHzsUSnPWy616gLOQyC1Od9zK8MlTEs9h
 2ppiYBKrpJ2rdxL5x/SQ+dR5Q8Gvzlk04/GBUkTuPSczI7Fcx8zSRo2XOUp09F1B2vCDoH
 s1AMmOPvg24Zz/fZTTevlTfkpUhvnvU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-WCEF8pfiP9ero332JKoepg-1; Wed, 14 Dec 2022 08:45:18 -0500
X-MC-Unique: WCEF8pfiP9ero332JKoepg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABBB085C06A;
 Wed, 14 Dec 2022 13:45:17 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA63314171BE;
 Wed, 14 Dec 2022 13:45:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 09/51] block: Inline bdrv_drain_invoke()
Date: Wed, 14 Dec 2022 14:44:11 +0100
Message-Id: <20221214134453.31665-10-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

bdrv_drain_invoke() has now two entirely separate cases that share no
code any more and are selected depending on a bool parameter. Each case
has only one caller. Just inline the function.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20221118174110.55183-6-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/block/io.c b/block/io.c
index f4ca62b034..a25103be6f 100644
--- a/block/io.c
+++ b/block/io.c
@@ -242,21 +242,6 @@ typedef struct {
     bool ignore_bds_parents;
 } BdrvCoDrainData;
 
-/* Recursively call BlockDriver.bdrv_drain_begin/end callbacks */
-static void bdrv_drain_invoke(BlockDriverState *bs, bool begin)
-{
-    if (!bs->drv || (begin && !bs->drv->bdrv_drain_begin) ||
-            (!begin && !bs->drv->bdrv_drain_end)) {
-        return;
-    }
-
-    if (begin) {
-        bs->drv->bdrv_drain_begin(bs);
-    } else {
-        bs->drv->bdrv_drain_end(bs);
-    }
-}
-
 /* Returns true if BDRV_POLL_WHILE() should go into a blocking aio_poll() */
 bool bdrv_drain_poll(BlockDriverState *bs, bool recursive,
                      BdrvChild *ignore_parent, bool ignore_bds_parents)
@@ -390,7 +375,9 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
     }
 
     bdrv_parent_drained_begin(bs, parent, ignore_bds_parents);
-    bdrv_drain_invoke(bs, true);
+    if (bs->drv && bs->drv->bdrv_drain_begin) {
+        bs->drv->bdrv_drain_begin(bs);
+    }
 }
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
@@ -461,7 +448,9 @@ static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
     assert(bs->quiesce_counter > 0);
 
     /* Re-enable things in child-to-parent order */
-    bdrv_drain_invoke(bs, false);
+    if (bs->drv && bs->drv->bdrv_drain_end) {
+        bs->drv->bdrv_drain_end(bs);
+    }
     bdrv_parent_drained_end(bs, parent, ignore_bds_parents);
 
     old_quiesce_counter = qatomic_fetch_dec(&bs->quiesce_counter);
-- 
2.38.1


