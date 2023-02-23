Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BCF6A0FCD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:53:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhe-00071K-RI; Thu, 23 Feb 2023 13:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhY-0006xd-BJ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhW-0003Dv-8T
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aL+hvOHiNFmfkdkOkc67vQaQWPprJfiLmS/AQXCBTb0=;
 b=Ba2dviUi8jzh0YINMnzrjeTQWbdfwFpkPbUGu2xWRWpTKsHugdF+y1Ca6E+xNvHydQtwdx
 +FWIsANfzgon4PGiCxlMdeJmHfKjToTq5an6wjTJb0Jv6qWjmODTMDGYMhSF/90n1SwyPs
 1em3MJzN7d5blSevx1ayAdBjtIZx8eg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-q54sQZhwNj6sF9PbepdA3g-1; Thu, 23 Feb 2023 13:52:12 -0500
X-MC-Unique: q54sQZhwNj6sF9PbepdA3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DCE1280048A;
 Thu, 23 Feb 2023 18:52:07 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB0261121314;
 Thu, 23 Feb 2023 18:52:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 17/29] block: Mark bdrv_co_io_(un)plug() and callers
 GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:34 +0100
Message-Id: <20230223185146.306454-18-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_co_io_plug() and bdrv_co_io_unplug() need to hold a reader lock for
the graph.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-18-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         | 4 ++--
 include/block/block_int-common.h | 5 +++--
 block/block-backend.c            | 2 ++
 block/io.c                       | 2 ++
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index c551742a86..b8f99741a3 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -233,8 +233,8 @@ void coroutine_fn bdrv_co_leave(BlockDriverState *bs, AioContext *old_ctx);
 
 AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 
-void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs);
-void coroutine_fn bdrv_co_io_unplug(BlockDriverState *bs);
+void coroutine_fn GRAPH_RDLOCK bdrv_co_io_plug(BlockDriverState *bs);
+void coroutine_fn GRAPH_RDLOCK bdrv_co_io_unplug(BlockDriverState *bs);
 
 bool coroutine_fn bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
                                                      const char *name,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 6b8fd22c71..61f894bcf6 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -735,8 +735,9 @@ struct BlockDriver {
                                              BlkdebugEvent event);
 
     /* io queue for linux-aio */
-    void coroutine_fn (*bdrv_co_io_plug)(BlockDriverState *bs);
-    void coroutine_fn (*bdrv_co_io_unplug)(BlockDriverState *bs);
+    void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_io_plug)(BlockDriverState *bs);
+    void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_io_unplug)(
+        BlockDriverState *bs);
 
     /**
      * bdrv_drain_begin is called if implemented in the beginning of a
diff --git a/block/block-backend.c b/block/block-backend.c
index fdb1e1d5f7..3661a066b3 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2328,6 +2328,7 @@ void coroutine_fn blk_co_io_plug(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
 
     if (bs) {
         bdrv_co_io_plug(bs);
@@ -2338,6 +2339,7 @@ void coroutine_fn blk_co_io_unplug(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
 
     if (bs) {
         bdrv_co_io_unplug(bs);
diff --git a/block/io.c b/block/io.c
index d9c1594960..b5459c2f41 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3153,6 +3153,7 @@ void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs)
 {
     BdrvChild *child;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     QLIST_FOREACH(child, &bs->children, next) {
         bdrv_co_io_plug(child->bs);
@@ -3170,6 +3171,7 @@ void coroutine_fn bdrv_co_io_unplug(BlockDriverState *bs)
 {
     BdrvChild *child;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     assert(bs->io_plugged);
     if (qatomic_fetch_dec(&bs->io_plugged) == 1) {
-- 
2.39.2


