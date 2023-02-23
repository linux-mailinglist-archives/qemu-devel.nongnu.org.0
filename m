Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B235A6A0FE6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:56:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhW-0006us-To; Thu, 23 Feb 2023 13:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhP-0006qi-Gm
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhN-00039z-Vo
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vIsHGYadWGIXLYI8Vzux3OCNbRSAt/zxSTFxmrR0sXo=;
 b=iqxg1S0dpz2IgC1CqHJpeS/BXq/341o7j/tMEvlC1nxGHT96G4+xzBTG1fpPEFHpCro/VI
 UBH6tfQttsLDTjdH67JpYzLrUvTv9ywJRYDe59oecpWjai07myWSwhlLL0rATGfVQIj/+z
 FU/3DOFQM3SgYSAsmDEMfgrgNrJG6gg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343--S7QF1LEOZaUnPQLfUkq4w-1; Thu, 23 Feb 2023 13:52:06 -0500
X-MC-Unique: -S7QF1LEOZaUnPQLfUkq4w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D24D3C0D840;
 Thu, 23 Feb 2023 18:52:05 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D798A1121314;
 Thu, 23 Feb 2023 18:52:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 15/29] block: Mark preadv_snapshot/snapshot_block_status
 GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:32 +0100
Message-Id: <20230223185146.306454-16-kwolf@redhat.com>
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

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-16-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-common.h | 12 +++++++-----
 include/block/block_int-io.h     |  8 ++++----
 block/copy-before-write.c        |  6 ++----
 block/io.c                       |  2 ++
 block/snapshot-access.c          |  4 ++--
 5 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 29b230cc0b..7d8309ba5a 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -624,11 +624,13 @@ struct BlockDriver {
      * - receive the snapshot's actual length (which may differ from bs's
      *   length)
      */
-    int coroutine_fn (*bdrv_co_preadv_snapshot)(BlockDriverState *bs,
-        int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);
-    int coroutine_fn (*bdrv_co_snapshot_block_status)(BlockDriverState *bs,
-        bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
-        int64_t *map, BlockDriverState **file);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_preadv_snapshot)(
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset);
+
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_snapshot_block_status)(
+        BlockDriverState *bs, bool want_zero, int64_t offset, int64_t bytes,
+        int64_t *pnum, int64_t *map, BlockDriverState **file);
 
     int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_pdiscard_snapshot)(
         BlockDriverState *bs, int64_t offset, int64_t bytes);
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 5788bd66ba..612e5ddf99 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -35,11 +35,11 @@
  * the I/O API.
  */
 
-int coroutine_fn bdrv_co_preadv_snapshot(BdrvChild *child,
+int coroutine_fn GRAPH_RDLOCK bdrv_co_preadv_snapshot(BdrvChild *child,
     int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);
-int coroutine_fn bdrv_co_snapshot_block_status(BlockDriverState *bs,
-    bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
-    int64_t *map, BlockDriverState **file);
+int coroutine_fn GRAPH_RDLOCK bdrv_co_snapshot_block_status(
+    BlockDriverState *bs, bool want_zero, int64_t offset, int64_t bytes,
+    int64_t *pnum, int64_t *map, BlockDriverState **file);
 int coroutine_fn GRAPH_RDLOCK bdrv_co_pdiscard_snapshot(BlockDriverState *bs,
     int64_t offset, int64_t bytes);
 
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index e223e37300..646d8227a4 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -256,7 +256,7 @@ cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
     g_free(req);
 }
 
-static coroutine_fn int
+static int coroutine_fn GRAPH_RDLOCK
 cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
                        QEMUIOVector *qiov, size_t qiov_offset)
 {
@@ -264,8 +264,6 @@ cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
     BdrvChild *file;
     int ret;
 
-    assume_graph_lock(); /* FIXME */
-
     /* TODO: upgrade to async loop using AioTask */
     while (bytes) {
         int64_t cur_bytes;
@@ -290,7 +288,7 @@ cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return 0;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 cbw_co_snapshot_block_status(BlockDriverState *bs,
                              bool want_zero, int64_t offset, int64_t bytes,
                              int64_t *pnum, int64_t *map,
diff --git a/block/io.c b/block/io.c
index 86e5ea362d..d9c1594960 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3532,6 +3532,7 @@ bdrv_co_preadv_snapshot(BdrvChild *child, int64_t offset, int64_t bytes,
     BlockDriver *drv = bs->drv;
     int ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!drv) {
         return -ENOMEDIUM;
@@ -3557,6 +3558,7 @@ bdrv_co_snapshot_block_status(BlockDriverState *bs,
     BlockDriver *drv = bs->drv;
     int ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!drv) {
         return -ENOMEDIUM;
diff --git a/block/snapshot-access.c b/block/snapshot-access.c
index 009cc4aea0..67ea339da9 100644
--- a/block/snapshot-access.c
+++ b/block/snapshot-access.c
@@ -26,7 +26,7 @@
 #include "qemu/cutils.h"
 #include "block/block_int.h"
 
-static coroutine_fn int
+static int coroutine_fn GRAPH_RDLOCK
 snapshot_access_co_preadv_part(BlockDriverState *bs,
                                int64_t offset, int64_t bytes,
                                QEMUIOVector *qiov, size_t qiov_offset,
@@ -39,7 +39,7 @@ snapshot_access_co_preadv_part(BlockDriverState *bs,
     return bdrv_co_preadv_snapshot(bs->file, offset, bytes, qiov, qiov_offset);
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 snapshot_access_co_block_status(BlockDriverState *bs,
                                 bool want_zero, int64_t offset,
                                 int64_t bytes, int64_t *pnum,
-- 
2.39.2


