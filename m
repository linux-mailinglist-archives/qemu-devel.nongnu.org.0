Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274AC64CC38
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:27:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S6I-0006SS-05; Wed, 14 Dec 2022 08:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S5G-00050K-Kt
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:46:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S5D-0003nm-KE
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1gby6cXU/eOYVZwYgwd+TYvdliEqPW6Hgs+/OkCTq6s=;
 b=hZjP8J5W2eTfzBCM41xx3gFxK12OVLFE7Z/xZFzIsm2jWmvFqblxrkMypbrklf/upGCIx8
 L05g2rf3csopA2vR+CeIhIwtSHv+4quEDyWRxRxKqIEIPTq1QbVugJlUQuZCrrv64Zpblk
 DPq1IkfnpZOw/I85nEwEZxjB0ToY3r4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-lehIFWQ-Pr6mazc6GAo90w-1; Wed, 14 Dec 2022 08:45:59 -0500
X-MC-Unique: lehIFWQ-Pr6mazc6GAo90w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D21F877CA3;
 Wed, 14 Dec 2022 13:45:59 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D00314171C0;
 Wed, 14 Dec 2022 13:45:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 51/51] block: GRAPH_RDLOCK for functions only called by
 co_wrappers
Date: Wed, 14 Dec 2022 14:44:53 +0100
Message-Id: <20221214134453.31665-52-kwolf@redhat.com>
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

The generated coroutine wrappers already take care to take the lock in
the non-coroutine path, and assume that the lock is already taken in the
coroutine path.

The only thing we need to do for the wrapped function is adding the
GRAPH_RDLOCK annotation. Doing so also allows us to mark the
corresponding callbacks in BlockDriver as GRAPH_RDLOCK_PTR.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221207131838.239125-19-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/coroutines.h               | 17 ++++++++++-------
 include/block/block_int-common.h | 20 +++++++++-----------
 block.c                          |  2 ++
 block/io.c                       |  2 ++
 4 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 48e9081aa1..2a1e0b3c9d 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -37,9 +37,11 @@
  * the I/O API.
  */
 
-int coroutine_fn bdrv_co_check(BlockDriverState *bs,
-                               BdrvCheckResult *res, BdrvCheckMode fix);
-int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_check(BlockDriverState *bs, BdrvCheckResult *res, BdrvCheckMode fix);
+
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp);
 
 int coroutine_fn
 bdrv_co_common_block_status_above(BlockDriverState *bs,
@@ -53,10 +55,11 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
                                   BlockDriverState **file,
                                   int *depth);
 
-int coroutine_fn bdrv_co_readv_vmstate(BlockDriverState *bs,
-                                       QEMUIOVector *qiov, int64_t pos);
-int coroutine_fn bdrv_co_writev_vmstate(BlockDriverState *bs,
-                                        QEMUIOVector *qiov, int64_t pos);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
+
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
 int coroutine_fn
 nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index b1f0d88307..c34c525fa6 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -641,8 +641,8 @@ struct BlockDriver {
     /*
      * Invalidate any cached meta-data.
      */
-    void coroutine_fn (*bdrv_co_invalidate_cache)(BlockDriverState *bs,
-                                                  Error **errp);
+    void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_invalidate_cache)(
+        BlockDriverState *bs, Error **errp);
 
     /*
      * Flushes all data for all layers by calling bdrv_co_flush for underlying
@@ -701,12 +701,11 @@ struct BlockDriver {
                                                  Error **errp);
     BlockStatsSpecific *(*bdrv_get_specific_stats)(BlockDriverState *bs);
 
-    int coroutine_fn (*bdrv_save_vmstate)(BlockDriverState *bs,
-                                          QEMUIOVector *qiov,
-                                          int64_t pos);
-    int coroutine_fn (*bdrv_load_vmstate)(BlockDriverState *bs,
-                                          QEMUIOVector *qiov,
-                                          int64_t pos);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_save_vmstate)(
+        BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
+
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_load_vmstate)(
+        BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
     /* removable device specific */
     bool (*bdrv_is_inserted)(BlockDriverState *bs);
@@ -724,9 +723,8 @@ struct BlockDriver {
      * Returns 0 for completed check, -errno for internal errors.
      * The check results are stored in result.
      */
-    int coroutine_fn (*bdrv_co_check)(BlockDriverState *bs,
-                                      BdrvCheckResult *result,
-                                      BdrvCheckMode fix);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_check)(
+        BlockDriverState *bs, BdrvCheckResult *result, BdrvCheckMode fix);
 
     void (*bdrv_debug_event)(BlockDriverState *bs, BlkdebugEvent event);
 
diff --git a/block.c b/block.c
index 1a82fd101a..9c2ac757e4 100644
--- a/block.c
+++ b/block.c
@@ -5402,6 +5402,7 @@ int coroutine_fn bdrv_co_check(BlockDriverState *bs,
                                BdrvCheckResult *res, BdrvCheckMode fix)
 {
     IO_CODE();
+    assert_bdrv_graph_readable();
     if (bs->drv == NULL) {
         return -ENOMEDIUM;
     }
@@ -6617,6 +6618,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
     IO_CODE();
 
     assert(!(bs->open_flags & BDRV_O_INACTIVE));
+    assert_bdrv_graph_readable();
 
     if (bs->drv->bdrv_co_invalidate_cache) {
         bs->drv->bdrv_co_invalidate_cache(bs, &local_err);
diff --git a/block/io.c b/block/io.c
index d160d2e273..d87788dfbb 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2697,6 +2697,7 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
     BlockDriverState *child_bs = bdrv_primary_bs(bs);
     int ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     ret = bdrv_check_qiov_request(pos, qiov->size, qiov, 0, NULL);
     if (ret < 0) {
@@ -2729,6 +2730,7 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
     BlockDriverState *child_bs = bdrv_primary_bs(bs);
     int ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     ret = bdrv_check_qiov_request(pos, qiov->size, qiov, 0, NULL);
     if (ret < 0) {
-- 
2.38.1


