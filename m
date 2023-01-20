Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DA6675459
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:27:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqU5-0002pT-Ha; Fri, 20 Jan 2023 07:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqU2-0002mN-St
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTz-0000LF-BI
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cUDUh/XUF3DRFA1hmv+DbqrZq23hMvPAfToUK53A4M0=;
 b=QqhmBFbqlvcFaMDG+Dc8fewoUItPHwNDqSPstkEt/BRIol0zJmuCzPiFqf1MORqYSim9ko
 WGaOL+QMiX8rBasOGhsbnf1TFOuMT5CQbRTCiAD2dfzYOzBpEbltzRz2v701tdKxp0hjW0
 hpkXK6p6x0lpsWjGdk8/46Cflssbaf8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-kS7SAD95NBql63aLlTbNqw-1; Fri, 20 Jan 2023 07:26:51 -0500
X-MC-Unique: kS7SAD95NBql63aLlTbNqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7803B101A52E;
 Fri, 20 Jan 2023 12:26:51 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC6EB40C6EC4;
 Fri, 20 Jan 2023 12:26:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 13/38] block: Convert bdrv_io_plug() to co_wrapper
Date: Fri, 20 Jan 2023 13:26:08 +0100
Message-Id: <20230120122633.84983-14-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Message-Id: <20230113204212.359076-3-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h          |  3 ++-
 include/block/block_int-common.h  |  2 +-
 include/sysemu/block-backend-io.h |  4 +++-
 block/block-backend.c             |  4 ++--
 block/file-posix.c                | 10 +++++-----
 block/io.c                        |  8 ++++----
 block/nvme.c                      |  4 ++--
 7 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 1fa717a545..adfc792586 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -212,7 +212,8 @@ void coroutine_fn bdrv_co_leave(BlockDriverState *bs, AioContext *old_ctx);
 
 AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 
-void bdrv_io_plug(BlockDriverState *bs);
+void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs);
+
 void bdrv_io_unplug(BlockDriverState *bs);
 
 bool coroutine_fn bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index c34c525fa6..a76bb76290 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -729,7 +729,7 @@ struct BlockDriver {
     void (*bdrv_debug_event)(BlockDriverState *bs, BlkdebugEvent event);
 
     /* io queue for linux-aio */
-    void (*bdrv_io_plug)(BlockDriverState *bs);
+    void coroutine_fn (*bdrv_co_io_plug)(BlockDriverState *bs);
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
index 8fbb787f41..d10998fe19 100644
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
 
diff --git a/block/file-posix.c b/block/file-posix.c
index b9955db205..a8abcdd46f 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2131,7 +2131,7 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, int64_t offset,
     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_WRITE);
 }
 
-static void raw_aio_plug(BlockDriverState *bs)
+static void coroutine_fn raw_co_io_plug(BlockDriverState *bs)
 {
     BDRVRawState __attribute__((unused)) *s = bs->opaque;
 #ifdef CONFIG_LINUX_AIO
@@ -3316,7 +3316,7 @@ BlockDriver bdrv_file = {
     .bdrv_co_copy_range_from = raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
     .bdrv_refresh_limits = raw_refresh_limits,
-    .bdrv_io_plug = raw_aio_plug,
+    .bdrv_co_io_plug        = raw_co_io_plug,
     .bdrv_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
@@ -3688,7 +3688,7 @@ static BlockDriver bdrv_host_device = {
     .bdrv_co_copy_range_from = raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
     .bdrv_refresh_limits = raw_refresh_limits,
-    .bdrv_io_plug = raw_aio_plug,
+    .bdrv_co_io_plug        = raw_co_io_plug,
     .bdrv_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
@@ -3812,7 +3812,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_pwritev        = raw_co_pwritev,
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
     .bdrv_refresh_limits = raw_refresh_limits,
-    .bdrv_io_plug = raw_aio_plug,
+    .bdrv_co_io_plug        = raw_co_io_plug,
     .bdrv_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
@@ -3942,7 +3942,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_pwritev        = raw_co_pwritev,
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
     .bdrv_refresh_limits = raw_refresh_limits,
-    .bdrv_io_plug = raw_aio_plug,
+    .bdrv_co_io_plug        = raw_co_io_plug,
     .bdrv_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
diff --git a/block/io.c b/block/io.c
index a09b1b34ab..c05fb89267 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3136,19 +3136,19 @@ void *qemu_try_blockalign0(BlockDriverState *bs, size_t size)
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
         BlockDriver *drv = bs->drv;
-        if (drv && drv->bdrv_io_plug) {
-            drv->bdrv_io_plug(bs);
+        if (drv && drv->bdrv_co_io_plug) {
+            drv->bdrv_co_io_plug(bs);
         }
     }
 }
diff --git a/block/nvme.c b/block/nvme.c
index 656624c585..1af911e396 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1566,7 +1566,7 @@ static void nvme_attach_aio_context(BlockDriverState *bs,
     }
 }
 
-static void nvme_aio_plug(BlockDriverState *bs)
+static void coroutine_fn nvme_co_io_plug(BlockDriverState *bs)
 {
     BDRVNVMeState *s = bs->opaque;
     assert(!s->plugged);
@@ -1663,7 +1663,7 @@ static BlockDriver bdrv_nvme = {
     .bdrv_detach_aio_context  = nvme_detach_aio_context,
     .bdrv_attach_aio_context  = nvme_attach_aio_context,
 
-    .bdrv_io_plug             = nvme_aio_plug,
+    .bdrv_co_io_plug          = nvme_co_io_plug,
     .bdrv_io_unplug           = nvme_aio_unplug,
 
     .bdrv_register_buf        = nvme_register_buf,
-- 
2.38.1


