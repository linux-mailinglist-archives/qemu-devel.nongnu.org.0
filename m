Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3903B86F3
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:19:48 +0200 (CEST)
Received: from localhost ([::1]:52542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycwF-0006nz-3l
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfp-0002xR-MT
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfX-00073z-3U
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0P6yq/5asofQLDn40wPsgOLIVdHH5Zff0LBsNzY9hWM=;
 b=aGJbDrtbbHHxpZtYbVz8tsOmSkLuIMp9Cm2dTOgzIa7mzvqgd3IazeOBpMcMddXVWJh/w5
 48o/CEwTJ3dZWe0T6EZfMqiFFjF7Gk1Tc8sySoA+YPiHUKkGoCpv0iQeXZJNP5zcWupNeC
 ne7to/FxmetrGAtLOyXrEj93I4oMc1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-6VjRpcAKMBqO4zzmXTxtKg-1; Wed, 30 Jun 2021 12:02:17 -0400
X-MC-Unique: 6VjRpcAKMBqO4zzmXTxtKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 791EDA40C5;
 Wed, 30 Jun 2021 16:02:16 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C4A8604CD;
 Wed, 30 Jun 2021 16:02:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/24] block: rename bdrv_replace_child to
 bdrv_replace_child_tran
Date: Wed, 30 Jun 2021 18:01:46 +0200
Message-Id: <20210630160206.276439-5-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We have bdrv_replace_child() wrapper on bdrv_replace_child_noperm().
But bdrv_replace_child() doesn't update permissions. It's rather
strange, as normally it's expected that foo() should call foo_noperm()
and update permissions.

Let's rename and add comment.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210610112618.127378-2-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index a2a4a0dd80..e49ff8c078 100644
--- a/block.c
+++ b/block.c
@@ -2249,12 +2249,14 @@ static TransactionActionDrv bdrv_replace_child_drv = {
 };
 
 /*
- * bdrv_replace_child
+ * bdrv_replace_child_tran
  *
  * Note: real unref of old_bs is done only on commit.
+ *
+ * The function doesn't update permissions, caller is responsible for this.
  */
-static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
-                               Transaction *tran)
+static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
+                                    Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
@@ -4766,7 +4768,7 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
     }
 
     /*
-     * We don't have to restore child->bs here to undo bdrv_replace_child()
+     * We don't have to restore child->bs here to undo bdrv_replace_child_tran()
      * because that function is transactionable and it registered own completion
      * entries in @tran, so .abort() for bdrv_replace_child_safe() will be
      * called automatically.
@@ -4802,7 +4804,7 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        bdrv_replace_child(child, NULL, tran);
+        bdrv_replace_child_tran(child, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
@@ -4842,7 +4844,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-        bdrv_replace_child(c, to, tran);
+        bdrv_replace_child_tran(c, to, tran);
     }
 
     return 0;
-- 
2.31.1


