Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3764364B1BB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 10:02:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p512u-0006N2-Hu; Tue, 13 Dec 2022 03:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512j-0006FK-FV
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512h-0002w8-LV
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670921619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wlaRanZghZfZD4QMfY00NJi1XM7KOnldjOOzm9vzI+0=;
 b=BQOiCjsmw0Cg1xXGrtNqEB0qMS7MOBkumweHc2D91XoI9rl509zp/9oOymoMJCZwELbYBh
 IN6YeJysWKcb0szVMC54dGpnBg44arO7GjToeiCX82u6R2SMLzkCpWrh1M+uyM4THRdiY6
 gzkIMgILss1E8Z20tvxzZRL8p2PslHA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-xuwyTFBBN9un6HTsVIgNdA-1; Tue, 13 Dec 2022 03:53:35 -0500
X-MC-Unique: xuwyTFBBN9un6HTsVIgNdA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2057B805AC5;
 Tue, 13 Dec 2022 08:53:35 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07C20492C1B;
 Tue, 13 Dec 2022 08:53:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 03/14] block: Convert bdrv_io_unplug() to co_wrapper
Date: Tue, 13 Dec 2022 09:53:09 +0100
Message-Id: <20221213085320.95673-4-kwolf@redhat.com>
In-Reply-To: <20221213085320.95673-1-kwolf@redhat.com>
References: <20221213085320.95673-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

BlockDriver->bdrv_io_unplug is categorized as IO callback, and it
currently doesn't run in a coroutine. We should let it take a graph
rdlock since the callback traverses the block nodes graph, which however
is only possible in a coroutine.

The only caller of this function is blk_io_unplug(), therefore make
blk_io_unplug() a co_wrapper, so that we're always running in a
coroutine where the lock can be taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h          | 3 +--
 include/block/block_int-common.h  | 2 +-
 include/sysemu/block-backend-io.h | 4 +++-
 block/block-backend.c             | 4 ++--
 block/io.c                        | 4 ++--
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index d96168375e..3bf201f7f4 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -218,8 +218,7 @@ void bdrv_coroutine_enter(BlockDriverState *bs, Coroutine *co);
 AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 
 void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs);
-
-void bdrv_io_unplug(BlockDriverState *bs);
+void coroutine_fn bdrv_co_io_unplug(BlockDriverState *bs);
 
 bool coroutine_fn bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
                                                      const char *name,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 4a1c1e348a..adccb4e540 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -730,7 +730,7 @@ struct BlockDriver {
 
     /* io queue for linux-aio */
     void coroutine_fn (*bdrv_io_plug)(BlockDriverState *bs);
-    void (*bdrv_io_unplug)(BlockDriverState *bs);
+    void coroutine_fn (*bdrv_io_unplug)(BlockDriverState *bs);
 
     /**
      * bdrv_drain_begin is called if implemented in the beginning of a
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 70b73f7d11..d8cc8d74f5 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -76,7 +76,9 @@ int blk_get_max_hw_iov(BlockBackend *blk);
 void coroutine_fn blk_co_io_plug(BlockBackend *blk);
 void co_wrapper blk_io_plug(BlockBackend *blk);
 
-void blk_io_unplug(BlockBackend *blk);
+void coroutine_fn blk_co_io_unplug(BlockBackend *blk);
+void co_wrapper blk_io_unplug(BlockBackend *blk);
+
 AioContext *blk_get_aio_context(BlockBackend *blk);
 BlockAcctStats *blk_get_stats(BlockBackend *blk);
 void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
diff --git a/block/block-backend.c b/block/block-backend.c
index f862fd1950..5a357f504a 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2325,13 +2325,13 @@ void coroutine_fn blk_co_io_plug(BlockBackend *blk)
     }
 }
 
-void blk_io_unplug(BlockBackend *blk)
+void coroutine_fn blk_co_io_unplug(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
     IO_CODE();
 
     if (bs) {
-        bdrv_io_unplug(bs);
+        bdrv_co_io_unplug(bs);
     }
 }
 
diff --git a/block/io.c b/block/io.c
index 3d27836420..c33672e90a 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3144,7 +3144,7 @@ void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs)
     }
 }
 
-void bdrv_io_unplug(BlockDriverState *bs)
+void coroutine_fn bdrv_co_io_unplug(BlockDriverState *bs)
 {
     BdrvChild *child;
     IO_CODE();
@@ -3158,7 +3158,7 @@ void bdrv_io_unplug(BlockDriverState *bs)
     }
 
     QLIST_FOREACH(child, &bs->children, next) {
-        bdrv_io_unplug(child->bs);
+        bdrv_co_io_unplug(child->bs);
     }
 }
 
-- 
2.38.1


