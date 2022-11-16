Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6514862C06A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:05:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImx-0000kg-3F; Wed, 16 Nov 2022 08:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImq-0000gM-O6
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImk-0007zl-FE
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJp3ZbKA4Z5qVER4UBk8asMbPlsuCplDYEISzsM1/Lc=;
 b=hzfc6+pUzC0BMLIv6VvdvJ/a5eZ0v4qwjOduvgAXFmIdWRUfwmik5tmlvVYXA0W0fEoaKA
 6cssLsYzp6GDavDyHm4Vt1mZkNyYh4khzJeEGYD7jcQOaWhg+QITR3TMAJOe41DC24kW0z
 +ezJ9oAB48VKCicfOqcdemW8A8DCbTM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47--fZCKPObOfiyROs1gerTEA-1; Wed, 16 Nov 2022 08:48:56 -0500
X-MC-Unique: -fZCKPObOfiyROs1gerTEA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D823800B23;
 Wed, 16 Nov 2022 13:48:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 112C04A9266;
 Wed, 16 Nov 2022 13:48:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 12/20] block-gen: assert that bdrv_co_pwrite is always called
 with graph rdlock taken
Date: Wed, 16 Nov 2022 08:48:42 -0500
Message-Id: <20221116134850.3051419-13-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

This function, in addition to be called by a generated_co_wrapper,
is also called elsewhere else.
The strategy is to always take the lock at the function called
when the coroutine is created, to avoid recursive locking.

By protecting brdv_co_pwrite, we also automatically protect
the following other generated_co_wrappers:
blk_co_pwrite
blk_co_pwritev
blk_co_pwritev_part
blk_co_pwrite_compressed
blk_co_pwrite_zeroes

Protecting bdrv_driver_pwritev_compressed() and bdrv_driver_pwritev_compressed()
implies that the following BlockDriver callbacks always called with graph rdlock
taken:
- bdrv_aio_pwritev
- bdrv_co_writev
- bdrv_co_pwritev
- bdrv_co_pwritev_part
- bdrv_co_pwritev_compressed
- bdrv_co_pwritev_compressed_part

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c            | 1 +
 block/block-copy.c               | 8 ++++++--
 block/io.c                       | 2 ++
 include/block/block_int-common.h | 6 ++++++
 include/block/block_int-io.h     | 1 +
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 0686cd6942..d48ec3a2ac 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1363,6 +1363,7 @@ blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
     IO_CODE();
 
     blk_wait_while_drained(blk);
+    GRAPH_RDLOCK_GUARD();
 
     /* Call blk_bs() only after waiting, the graph may have changed */
     bs = blk_bs(blk);
diff --git a/block/block-copy.c b/block/block-copy.c
index f33ab1d0b6..dabf461112 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -464,6 +464,8 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
  * a full-size buffer or disabled if the copy_range attempt fails.  The output
  * value of @method should be used for subsequent tasks.
  * Returns 0 on success.
+ *
+ * Called with graph rdlock taken.
  */
 static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
                                            int64_t offset, int64_t bytes,
@@ -554,8 +556,10 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     BlockCopyMethod method = t->method;
     int ret;
 
-    ret = block_copy_do_copy(s, t->req.offset, t->req.bytes, &method,
-                             &error_is_read);
+    WITH_GRAPH_RDLOCK_GUARD() {
+        ret = block_copy_do_copy(s, t->req.offset, t->req.bytes, &method,
+                                 &error_is_read);
+    }
 
     WITH_QEMU_LOCK_GUARD(&s->lock) {
         if (s->method == t->method) {
diff --git a/block/io.c b/block/io.c
index ac12725fb2..9280fb9f38 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1012,6 +1012,7 @@ static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
     unsigned int nb_sectors;
     QEMUIOVector local_qiov;
     int ret;
+    assert_bdrv_graph_readable();
 
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
 
@@ -1090,6 +1091,7 @@ bdrv_driver_pwritev_compressed(BlockDriverState *bs, int64_t offset,
     BlockDriver *drv = bs->drv;
     QEMUIOVector local_qiov;
     int ret;
+    assert_bdrv_graph_readable();
 
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
 
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index f285a6b8f7..d44f825d95 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -479,6 +479,7 @@ struct BlockDriver {
     BlockAIOCB *(*bdrv_aio_preadv)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
+    /* Called with graph rdlock taken. */
     BlockAIOCB *(*bdrv_aio_pwritev)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
@@ -515,6 +516,7 @@ struct BlockDriver {
         QEMUIOVector *qiov, size_t qiov_offset,
         BdrvRequestFlags flags);
 
+    /* Called with graph rdlock taken. */
     int coroutine_fn (*bdrv_co_writev)(BlockDriverState *bs,
         int64_t sector_num, int nb_sectors, QEMUIOVector *qiov,
         int flags);
@@ -532,10 +534,12 @@ struct BlockDriver {
      * no larger than 'max_transfer'.
      *
      * The buffer in @qiov may point directly to guest memory.
+     * Called with graph rdlock taken.
      */
     int coroutine_fn (*bdrv_co_pwritev)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         BdrvRequestFlags flags);
+    /* Called with graph rdlock taken. */
     int coroutine_fn (*bdrv_co_pwritev_part)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset,
         BdrvRequestFlags flags);
@@ -693,8 +697,10 @@ struct BlockDriver {
     BlockMeasureInfo *(*bdrv_measure)(QemuOpts *opts, BlockDriverState *in_bs,
                                       Error **errp);
 
+    /* Called with graph rdlock held. */
     int coroutine_fn (*bdrv_co_pwritev_compressed)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov);
+    /* Called with graph rdlock held. */
     int coroutine_fn (*bdrv_co_pwritev_compressed_part)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         size_t qiov_offset);
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 8bc061ebb8..ae88507d6a 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -69,6 +69,7 @@ static inline int coroutine_fn bdrv_co_pwrite(BdrvChild *child,
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     return bdrv_co_pwritev(child, offset, bytes, &qiov, flags);
 }
-- 
2.31.1


