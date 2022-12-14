Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F2B64CB89
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 14:46:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S50-0004Jj-HP; Wed, 14 Dec 2022 08:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4T-00044L-B9
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4Q-0003M8-W4
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ognindGekmAk0goZjZBHepHNZF69gnv9qVvqRbas7qU=;
 b=Du5PfnPbmfpzm3eQ63KAR9gDWjl/u8aA8k47uJ+Ub0CvAnjrz9HgnJIkPUGe4dMepPANq5
 LWm86rDKt3VY9CutHHI4fADmmw0w7SyczKDLja+WZ7HBbZ8ZqjUoMoqNIbX5q9mCfoi03V
 bITs2kLMC4zCBtjwXgJ+/b8NGlDOTx8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-S18plNCwMha2vpQzgpwvSA-1; Wed, 14 Dec 2022 08:45:11 -0500
X-MC-Unique: S18plNCwMha2vpQzgpwvSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BC1B1C09B70;
 Wed, 14 Dec 2022 13:45:10 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB84F14171BE;
 Wed, 14 Dec 2022 13:45:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 02/51] block: drop bdrv_remove_filter_or_cow_child
Date: Wed, 14 Dec 2022 14:44:04 +0100
Message-Id: <20221214134453.31665-3-kwolf@redhat.com>
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

From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>

Drop this simple wrapper used only in one place. We have too many graph
modifying functions even without it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20221107163558.618889-3-vsementsov@yandex-team.ru>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/block.c b/block.c
index c0c1b3df91..dc761209ac 100644
--- a/block.c
+++ b/block.c
@@ -93,8 +93,6 @@ static bool bdrv_recurse_has_child(BlockDriverState *bs,
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
 static void bdrv_remove_child(BdrvChild *child, Transaction *tran);
-static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
-                                            Transaction *tran);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
@@ -5065,17 +5063,6 @@ static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
     tran_add(tran, &bdrv_remove_child_drv, child);
 }
 
-/*
- * A function to remove backing-chain child of @bs if exists: cow child for
- * format nodes (always .backing) and filter child for filters (may be .file or
- * .backing)
- */
-static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
-                                            Transaction *tran)
-{
-    bdrv_remove_child(bdrv_filter_or_cow_child(bs), tran);
-}
-
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, Transaction *tran,
@@ -5160,7 +5147,7 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     }
 
     if (detach_subchain) {
-        bdrv_remove_filter_or_cow_child(to_cow_parent, tran);
+        bdrv_remove_child(bdrv_filter_or_cow_child(to_cow_parent), tran);
     }
 
     found = g_hash_table_new(NULL, NULL);
-- 
2.38.1


