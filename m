Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D80A62C013
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:50:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIn3-0000rJ-Go; Wed, 16 Nov 2022 08:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImw-0000kk-Dx
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImm-00081M-7E
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1AhexmEvH/m4MQIk481Hku2zrtOuEL6VbcS01NVR/0=;
 b=GQtBGfQBaPmNWMrU/5Yzr2jr7jo7LO3cGtEyT22lifBLc9zjsL/skfJRIR3NbHNfy17Zv2
 4DZzbsGKcMu0nMgjXlmcw46u0Hhs9/u7O7oDhj6Eob5KZE+cTafmqIeaf9X+LNaeWWmNUm
 Bg9XhHj23FddYCyKgwNxeEs/DkGAhj4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-zRTKUX7qP56uIM-KyDHoWQ-1; Wed, 16 Nov 2022 08:48:57 -0500
X-MC-Unique: zRTKUX7qP56uIM-KyDHoWQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15A6F101A56C;
 Wed, 16 Nov 2022 13:48:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCB624A9266;
 Wed, 16 Nov 2022 13:48:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 14/20] block-gen: assert that bdrv_co_pread is always called
 with graph rdlock taken
Date: Wed, 16 Nov 2022 08:48:44 -0500
Message-Id: <20221116134850.3051419-15-eesposit@redhat.com>
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

By protecting brdv_co_pread, we also automatically protect
the following other generated_co_wrappers:
blk_co_pread
blk_co_preadv
blk_co_preadv_part

Protecting bdrv_driver_preadv() implies that the following BlockDriver
callbacks always called with graph rdlock taken:
- bdrv_co_preadv_part
- bdrv_co_preadv
- bdrv_aio_preadv
- bdrv_co_readv

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c            | 1 +
 block/io.c                       | 1 +
 block/mirror.c                   | 6 ++++--
 include/block/block_int-common.h | 5 +++++
 include/block/block_int-io.h     | 1 +
 tests/unit/test-bdrv-drain.c     | 2 ++
 6 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index d48ec3a2ac..083ed6009e 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1289,6 +1289,7 @@ blk_co_do_preadv_part(BlockBackend *blk, int64_t offset, int64_t bytes,
     IO_CODE();
 
     blk_wait_while_drained(blk);
+    GRAPH_RDLOCK_GUARD();
 
     /* Call blk_bs() only after waiting, the graph may have changed */
     bs = blk_bs(blk);
diff --git a/block/io.c b/block/io.c
index 92c74648fb..cfc201ef91 100644
--- a/block/io.c
+++ b/block/io.c
@@ -942,6 +942,7 @@ static int coroutine_fn bdrv_driver_preadv(BlockDriverState *bs,
     unsigned int nb_sectors;
     QEMUIOVector local_qiov;
     int ret;
+    assert_bdrv_graph_readable();
 
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
     assert(!(flags & ~bs->supported_read_flags));
diff --git a/block/mirror.c b/block/mirror.c
index 251adc5ae0..f509cc1cb1 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -389,8 +389,10 @@ static void coroutine_fn mirror_co_read(void *opaque)
     op->is_in_flight = true;
     trace_mirror_one_iteration(s, op->offset, op->bytes);
 
-    ret = bdrv_co_preadv(s->mirror_top_bs->backing, op->offset, op->bytes,
-                         &op->qiov, 0);
+    WITH_GRAPH_RDLOCK_GUARD() {
+        ret = bdrv_co_preadv(s->mirror_top_bs->backing, op->offset, op->bytes,
+                             &op->qiov, 0);
+    }
     mirror_read_complete(op, ret);
 }
 
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index e8d2e4b6c7..64c5bb64de 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -476,6 +476,7 @@ struct BlockDriver {
                                       Error **errp);
 
     /* aio */
+    /* Called with graph rdlock held. */
     BlockAIOCB *(*bdrv_aio_preadv)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
@@ -489,6 +490,7 @@ struct BlockDriver {
         int64_t offset, int bytes,
         BlockCompletionFunc *cb, void *opaque);
 
+    /* Called with graph rdlock held. */
     int coroutine_fn (*bdrv_co_readv)(BlockDriverState *bs,
         int64_t sector_num, int nb_sectors, QEMUIOVector *qiov);
 
@@ -506,11 +508,14 @@ struct BlockDriver {
      * no larger than 'max_transfer'.
      *
      * The buffer in @qiov may point directly to guest memory.
+     *
+     * Called with graph rdlock held.
      */
     int coroutine_fn (*bdrv_co_preadv)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         BdrvRequestFlags flags);
 
+    /* Called with graph rdlock held. */
     int coroutine_fn (*bdrv_co_preadv_part)(BlockDriverState *bs,
         int64_t offset, int64_t bytes,
         QEMUIOVector *qiov, size_t qiov_offset,
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index ae88507d6a..ac6ad3b3ff 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -60,6 +60,7 @@ static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     return bdrv_co_preadv(child, offset, bytes, &qiov, flags);
 }
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 2686a8acee..90edc2f5bf 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -967,6 +967,8 @@ static void coroutine_fn test_co_delete_by_drain(void *opaque)
     void *buffer = g_malloc(65536);
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buffer, 65536);
 
+    GRAPH_RDLOCK_GUARD();
+
     /* Pretend some internal write operation from parent to child.
      * Important: We have to read from the child, not from the parent!
      * Draining works by first propagating it all up the tree to the
-- 
2.31.1


