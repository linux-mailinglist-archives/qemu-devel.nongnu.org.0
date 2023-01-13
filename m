Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7D266A44E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 21:45:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGQsv-0008Ug-OJ; Fri, 13 Jan 2023 15:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQst-0008TK-AR
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQsq-0006A7-VJ
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673642560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KHattQ48tUFa2/tg/FpyjwFPmzYdgOuIArxf0dr2Js=;
 b=SWbMdBIU64qVI/F/dlBuR9WzFMZKvxEC5/qQew3Xyq0ZeNt3031N9t6jcnvqLj7EHoyrNy
 SVLlRFFoPypEM2CYtpM99sxeNkEGlBEOVij7rto1otN9ZPCMO17FRwQJQSNNE5RFEoYuPV
 Z4XAeLHOdOg++AdaVaXFWJCKqNtYi6Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-VwiOPbVxOAuasucmqRvuGg-1; Fri, 13 Jan 2023 15:42:35 -0500
X-MC-Unique: VwiOPbVxOAuasucmqRvuGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BC04380671C;
 Fri, 13 Jan 2023 20:42:35 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 368E12026D68;
 Fri, 13 Jan 2023 20:42:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH v2 03/14] block: Convert bdrv_io_unplug() to co_wrapper
Date: Fri, 13 Jan 2023 21:42:01 +0100
Message-Id: <20230113204212.359076-4-kwolf@redhat.com>
In-Reply-To: <20230113204212.359076-1-kwolf@redhat.com>
References: <20230113204212.359076-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
 include/block/block-io.h          |  3 +--
 include/block/block_int-common.h  |  2 +-
 include/sysemu/block-backend-io.h |  4 +++-
 block/blkio.c                     |  4 ++--
 block/block-backend.c             |  4 ++--
 block/file-posix.c                | 10 +++++-----
 block/io.c                        |  8 ++++----
 block/nvme.c                      |  4 ++--
 8 files changed, 20 insertions(+), 19 deletions(-)

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
index a76bb76290..253df92509 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -730,7 +730,7 @@ struct BlockDriver {
 
     /* io queue for linux-aio */
     void coroutine_fn (*bdrv_co_io_plug)(BlockDriverState *bs);
-    void (*bdrv_io_unplug)(BlockDriverState *bs);
+    void coroutine_fn (*bdrv_co_io_unplug)(BlockDriverState *bs);
 
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
diff --git a/block/blkio.c b/block/blkio.c
index 5eae3adfaf..1ff51ff4f3 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -477,7 +477,7 @@ static int coroutine_fn blkio_co_pwrite_zeroes(BlockDriverState *bs,
     return cod.ret;
 }
 
-static void blkio_io_unplug(BlockDriverState *bs)
+static void coroutine_fn blkio_co_io_unplug(BlockDriverState *bs)
 {
     BDRVBlkioState *s = bs->opaque;
 
@@ -1006,7 +1006,7 @@ static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
         .bdrv_co_pwritev         = blkio_co_pwritev, \
         .bdrv_co_flush_to_disk   = blkio_co_flush, \
         .bdrv_co_pwrite_zeroes   = blkio_co_pwrite_zeroes, \
-        .bdrv_io_unplug          = blkio_io_unplug, \
+        .bdrv_co_io_unplug       = blkio_co_io_unplug, \
         .bdrv_refresh_limits     = blkio_refresh_limits, \
         .bdrv_register_buf       = blkio_register_buf, \
         .bdrv_unregister_buf     = blkio_unregister_buf, \
diff --git a/block/block-backend.c b/block/block-backend.c
index 2bca5729e1..71c7ef4004 100644
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
 
diff --git a/block/file-posix.c b/block/file-posix.c
index c8551c8110..dd1b8ec52a 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2153,7 +2153,7 @@ static void coroutine_fn raw_co_io_plug(BlockDriverState *bs)
 #endif
 }
 
-static void raw_aio_unplug(BlockDriverState *bs)
+static void coroutine_fn raw_co_io_unplug(BlockDriverState *bs)
 {
     BDRVRawState __attribute__((unused)) *s = bs->opaque;
 #ifdef CONFIG_LINUX_AIO
@@ -3322,7 +3322,7 @@ BlockDriver bdrv_file = {
     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
     .bdrv_refresh_limits = raw_refresh_limits,
     .bdrv_co_io_plug        = raw_co_io_plug,
-    .bdrv_io_unplug = raw_aio_unplug,
+    .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate = raw_co_truncate,
@@ -3694,7 +3694,7 @@ static BlockDriver bdrv_host_device = {
     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
     .bdrv_refresh_limits = raw_refresh_limits,
     .bdrv_co_io_plug        = raw_co_io_plug,
-    .bdrv_io_unplug = raw_aio_unplug,
+    .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate       = raw_co_truncate,
@@ -3818,7 +3818,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
     .bdrv_refresh_limits = raw_refresh_limits,
     .bdrv_co_io_plug        = raw_co_io_plug,
-    .bdrv_io_unplug = raw_aio_unplug,
+    .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate    = raw_co_truncate,
@@ -3948,7 +3948,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
     .bdrv_refresh_limits = raw_refresh_limits,
     .bdrv_co_io_plug        = raw_co_io_plug,
-    .bdrv_io_unplug = raw_aio_unplug,
+    .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate    = raw_co_truncate,
diff --git a/block/io.c b/block/io.c
index c05fb89267..32c744d546 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3153,7 +3153,7 @@ void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs)
     }
 }
 
-void bdrv_io_unplug(BlockDriverState *bs)
+void coroutine_fn bdrv_co_io_unplug(BlockDriverState *bs)
 {
     BdrvChild *child;
     IO_CODE();
@@ -3161,13 +3161,13 @@ void bdrv_io_unplug(BlockDriverState *bs)
     assert(bs->io_plugged);
     if (qatomic_fetch_dec(&bs->io_plugged) == 1) {
         BlockDriver *drv = bs->drv;
-        if (drv && drv->bdrv_io_unplug) {
-            drv->bdrv_io_unplug(bs);
+        if (drv && drv->bdrv_co_io_unplug) {
+            drv->bdrv_co_io_unplug(bs);
         }
     }
 
     QLIST_FOREACH(child, &bs->children, next) {
-        bdrv_io_unplug(child->bs);
+        bdrv_co_io_unplug(child->bs);
     }
 }
 
diff --git a/block/nvme.c b/block/nvme.c
index 1af911e396..eb940f2846 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1573,7 +1573,7 @@ static void coroutine_fn nvme_co_io_plug(BlockDriverState *bs)
     s->plugged = true;
 }
 
-static void nvme_aio_unplug(BlockDriverState *bs)
+static void coroutine_fn nvme_co_io_unplug(BlockDriverState *bs)
 {
     BDRVNVMeState *s = bs->opaque;
     assert(s->plugged);
@@ -1664,7 +1664,7 @@ static BlockDriver bdrv_nvme = {
     .bdrv_attach_aio_context  = nvme_attach_aio_context,
 
     .bdrv_co_io_plug          = nvme_co_io_plug,
-    .bdrv_io_unplug           = nvme_aio_unplug,
+    .bdrv_co_io_unplug        = nvme_co_io_unplug,
 
     .bdrv_register_buf        = nvme_register_buf,
     .bdrv_unregister_buf      = nvme_unregister_buf,
-- 
2.38.1


