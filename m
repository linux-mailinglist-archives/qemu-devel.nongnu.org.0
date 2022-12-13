Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776F664B1A0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 09:58:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p512z-0006RH-Ea; Tue, 13 Dec 2022 03:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512h-0006Dg-NR
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512g-0002v2-47
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670921617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PuU7ALAXzy2Iv7yyti4yAs7CK1ag2zCUfY3+aruO78E=;
 b=OHGnZ4TAgB1lSOPDQQMze+cOza7YevyaJjAZs2PMzCAGUeXoa0jnn8cO4/nc+7BHlCCXBx
 0M3JGO/45YbOsreHvTHLoLW0ASMBzVS6I5sIMwupdXFLUqi0IdslVbcY3+ID3Ua9lVAMMH
 /9dPqWl6RAZ84RkQC76478GD9V6WeqI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-kMRjOFI7NIqJYE--Y50ZYA-1; Tue, 13 Dec 2022 03:53:34 -0500
X-MC-Unique: kMRjOFI7NIqJYE--Y50ZYA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C253D382C96E;
 Tue, 13 Dec 2022 08:53:33 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A80D6492C14;
 Tue, 13 Dec 2022 08:53:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 02/14] block: Convert bdrv_io_plug() to co_wrapper
Date: Tue, 13 Dec 2022 09:53:08 +0100
Message-Id: <20221213085320.95673-3-kwolf@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

BlockDriver->bdrv_io_plug is categorized as IO callback, and it
currently doesn't run in a coroutine. We should let it take a graph
rdlock since the callback traverses the block nodes graph, which however
is only possible in a coroutine.

The only caller of this function is blk_io_plug(), therefore make
blk_io_plug() a co_wrapper, so that we're always running in a coroutine
where the lock can be taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h          | 3 ++-
 include/block/block_int-common.h  | 2 +-
 include/sysemu/block-backend-io.h | 4 +++-
 block/block-backend.c             | 4 ++--
 block/io.c                        | 4 ++--
 5 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 2ed6214909..d96168375e 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -217,7 +217,8 @@ void bdrv_coroutine_enter(BlockDriverState *bs, Coroutine *co);
 
 AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 
-void bdrv_io_plug(BlockDriverState *bs);
+void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs);
+
 void bdrv_io_unplug(BlockDriverState *bs);
 
 bool coroutine_fn bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index c34c525fa6..4a1c1e348a 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -729,7 +729,7 @@ struct BlockDriver {
     void (*bdrv_debug_event)(BlockDriverState *bs, BlkdebugEvent event);
 
     /* io queue for linux-aio */
-    void (*bdrv_io_plug)(BlockDriverState *bs);
+    void coroutine_fn (*bdrv_io_plug)(BlockDriverState *bs);
     void (*bdrv_io_unplug)(BlockDriverState *bs);
 
     /**
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 7ec6d978d4..70b73f7d11 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -73,7 +73,9 @@ void blk_iostatus_set_err(BlockBackend *blk, int error);
 int blk_get_max_iov(BlockBackend *blk);
 int blk_get_max_hw_iov(BlockBackend *blk);
 
-void blk_io_plug(BlockBackend *blk);
+void coroutine_fn blk_co_io_plug(BlockBackend *blk);
+void co_wrapper blk_io_plug(BlockBackend *blk);
+
 void blk_io_unplug(BlockBackend *blk);
 AioContext *blk_get_aio_context(BlockBackend *blk);
 BlockAcctStats *blk_get_stats(BlockBackend *blk);
diff --git a/block/block-backend.c b/block/block-backend.c
index 2852a892de..f862fd1950 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2315,13 +2315,13 @@ void blk_add_insert_bs_notifier(BlockBackend *blk, Notifier *notify)
     notifier_list_add(&blk->insert_bs_notifiers, notify);
 }
 
-void blk_io_plug(BlockBackend *blk)
+void coroutine_fn blk_co_io_plug(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
     IO_CODE();
 
     if (bs) {
-        bdrv_io_plug(bs);
+        bdrv_co_io_plug(bs);
     }
 }
 
diff --git a/block/io.c b/block/io.c
index d87788dfbb..3d27836420 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3127,13 +3127,13 @@ void *qemu_try_blockalign0(BlockDriverState *bs, size_t size)
     return mem;
 }
 
-void bdrv_io_plug(BlockDriverState *bs)
+void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs)
 {
     BdrvChild *child;
     IO_CODE();
 
     QLIST_FOREACH(child, &bs->children, next) {
-        bdrv_io_plug(child->bs);
+        bdrv_co_io_plug(child->bs);
     }
 
     if (qatomic_fetch_inc(&bs->io_plugged) == 0) {
-- 
2.38.1


