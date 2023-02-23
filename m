Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277376A0FE3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:56:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhZ-0006yS-6T; Thu, 23 Feb 2023 13:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhS-0006sP-N3
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhQ-0003BN-VV
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jG946PdQUa/nsU6Qrgid5EDq8LNPqKVXy8p9PH6OlOI=;
 b=ca6+3OKn/NyE4sVM8Y2Z6FupoYe6aiAmlSOTpZNRL2DkaE5i0mRaMb4RvCeqVkz9REzZ3A
 rzM/j0jeGxoYtM21/qtk7Ro5D/IWEMs8+d/v8ZLoigaHwu9OB/gWMz0NY+Iad/YJvzFuKY
 nXpxphh78G4M8T7QqhNvHzWYH5fQOw4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-Cyd5NJazNL6lAg8d_ZB7HQ-1; Thu, 23 Feb 2023 13:52:08 -0500
X-MC-Unique: Cyd5NJazNL6lAg8d_ZB7HQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46AFD86C164;
 Thu, 23 Feb 2023 18:52:08 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 941461121314;
 Thu, 23 Feb 2023 18:52:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 18/29] block: Mark bdrv_co_is_inserted() and callers
 GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:35 +0100
Message-Id: <20230223185146.306454-19-kwolf@redhat.com>
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_co_is_inserted() need to hold a reader lock for the graph.

blk_is_inserted() is done as a co_wrapper_mixed_bdrv_rdlock (unlike most
other blk_* functions) because it is called a lot from other blk_co_*()
functions that already hold the lock. These calls go through
blk_is_available(), which becomes a co_wrapper_mixed_bdrv_rdlock, too,
for the same reason.

Functions that run in a coroutine and can call bdrv_co_is_available()
directly are changed to do so, which results in better TSA coverage.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-19-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h          |  4 ++--
 include/block/block_int-common.h  |  3 ++-
 include/sysemu/block-backend-io.h |  7 ++++---
 block.c                           |  1 +
 block/block-backend.c             | 25 ++++++++++++++-----------
 5 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index b8f99741a3..88db63492a 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -145,8 +145,8 @@ bool bdrv_is_writable(BlockDriverState *bs);
 bool bdrv_is_sg(BlockDriverState *bs);
 int bdrv_get_flags(BlockDriverState *bs);
 
-bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs);
-bool co_wrapper bdrv_is_inserted(BlockDriverState *bs);
+bool coroutine_fn GRAPH_RDLOCK bdrv_co_is_inserted(BlockDriverState *bs);
+bool co_wrapper_bdrv_rdlock bdrv_is_inserted(BlockDriverState *bs);
 
 void coroutine_fn bdrv_co_lock_medium(BlockDriverState *bs, bool locked);
 void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 61f894bcf6..b4a82269e5 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -712,7 +712,8 @@ struct BlockDriver {
         BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
     /* removable device specific */
-    bool coroutine_fn (*bdrv_co_is_inserted)(BlockDriverState *bs);
+    bool coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_is_inserted)(
+        BlockDriverState *bs);
     void coroutine_fn (*bdrv_co_eject)(BlockDriverState *bs, bool eject_flag);
     void coroutine_fn (*bdrv_co_lock_medium)(BlockDriverState *bs, bool locked);
 
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index b1196ab93c..40ab178719 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -55,10 +55,11 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
 void blk_inc_in_flight(BlockBackend *blk);
 void blk_dec_in_flight(BlockBackend *blk);
 
-bool coroutine_fn blk_co_is_inserted(BlockBackend *blk);
-bool co_wrapper_mixed blk_is_inserted(BlockBackend *blk);
+bool coroutine_fn GRAPH_RDLOCK blk_co_is_inserted(BlockBackend *blk);
+bool co_wrapper_mixed_bdrv_rdlock blk_is_inserted(BlockBackend *blk);
 
-bool blk_is_available(BlockBackend *blk);
+bool coroutine_fn GRAPH_RDLOCK blk_co_is_available(BlockBackend *blk);
+bool co_wrapper_mixed_bdrv_rdlock blk_is_available(BlockBackend *blk);
 
 void coroutine_fn blk_co_lock_medium(BlockBackend *blk, bool locked);
 void co_wrapper blk_lock_medium(BlockBackend *blk, bool locked);
diff --git a/block.c b/block.c
index 484f48ae2d..738b42046c 100644
--- a/block.c
+++ b/block.c
@@ -6826,6 +6826,7 @@ bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs)
     BlockDriver *drv = bs->drv;
     BdrvChild *child;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!drv) {
         return false;
diff --git a/block/block-backend.c b/block/block-backend.c
index 3661a066b3..20af699f00 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1235,8 +1235,8 @@ void blk_set_disable_request_queuing(BlockBackend *blk, bool disable)
     blk->disable_request_queuing = disable;
 }
 
-static coroutine_fn int blk_check_byte_request(BlockBackend *blk,
-                                               int64_t offset, int64_t bytes)
+static int coroutine_fn GRAPH_RDLOCK
+blk_check_byte_request(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int64_t len;
 
@@ -1244,7 +1244,7 @@ static coroutine_fn int blk_check_byte_request(BlockBackend *blk,
         return -EIO;
     }
 
-    if (!blk_is_available(blk)) {
+    if (!blk_co_is_available(blk)) {
         return -ENOMEDIUM;
     }
 
@@ -1606,8 +1606,9 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
 int64_t coroutine_fn blk_co_getlength(BlockBackend *blk)
 {
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
 
-    if (!blk_is_available(blk)) {
+    if (!blk_co_is_available(blk)) {
         return -ENOMEDIUM;
     }
 
@@ -1627,8 +1628,9 @@ void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr)
 int64_t coroutine_fn blk_co_nb_sectors(BlockBackend *blk)
 {
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
 
-    if (!blk_is_available(blk)) {
+    if (!blk_co_is_available(blk)) {
         return -ENOMEDIUM;
     }
 
@@ -1676,7 +1678,7 @@ blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
     blk_wait_while_drained(blk);
     GRAPH_RDLOCK_GUARD();
 
-    if (!blk_is_available(blk)) {
+    if (!blk_co_is_available(blk)) {
         return -ENOMEDIUM;
     }
 
@@ -1769,7 +1771,7 @@ static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
     blk_wait_while_drained(blk);
     GRAPH_RDLOCK_GUARD();
 
-    if (!blk_is_available(blk)) {
+    if (!blk_co_is_available(blk)) {
         return -ENOMEDIUM;
     }
 
@@ -1996,14 +1998,15 @@ bool coroutine_fn blk_co_is_inserted(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     return bs && bdrv_co_is_inserted(bs);
 }
 
-bool blk_is_available(BlockBackend *blk)
+bool coroutine_fn blk_co_is_available(BlockBackend *blk)
 {
     IO_CODE();
-    return blk_is_inserted(blk) && !blk_dev_is_tray_open(blk);
+    return blk_co_is_inserted(blk) && !blk_dev_is_tray_open(blk);
 }
 
 void coroutine_fn blk_co_lock_medium(BlockBackend *blk, bool locked)
@@ -2382,7 +2385,7 @@ int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
 {
     IO_OR_GS_CODE();
     GRAPH_RDLOCK_GUARD();
-    if (!blk_is_available(blk)) {
+    if (!blk_co_is_available(blk)) {
         error_setg(errp, "No medium inserted");
         return -ENOMEDIUM;
     }
@@ -2637,6 +2640,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
 {
     int r;
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
 
     r = blk_check_byte_request(blk_in, off_in, bytes);
     if (r) {
@@ -2647,7 +2651,6 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
         return r;
     }
 
-    GRAPH_RDLOCK_GUARD();
     return bdrv_co_copy_range(blk_in->root, off_in,
                               blk_out->root, off_out,
                               bytes, read_flags, write_flags);
-- 
2.39.2


