Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF064B216
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 10:15:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5132-0006Uc-Br; Tue, 13 Dec 2022 03:54:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512w-0006Pv-LE
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p512u-000321-UC
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670921632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OZwijoKOXthKmcXtDn1yguT6BOSW/bBIZKtPgek8VXw=;
 b=Wsei60GCZNYP6vd8fZfDMa7nTUMtBom00xcEI4bv9piqZlb06xbKFuOesBQ1oso9bO9jtq
 lNcgBTLF1c5k/1c6+qXImw8N75UkjJvXeEvxJmlhVfrSjX32eRaz7RDmoKn+bSs+zupEil
 eajzlywrmr5oqTdjNyZ9q6riJ3PhIwI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-GLJWywAvMb652gNvDd_0Og-1; Tue, 13 Dec 2022 03:53:48 -0500
X-MC-Unique: GLJWywAvMb652gNvDd_0Og-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C02E801231;
 Tue, 13 Dec 2022 08:53:48 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 733E2492C14;
 Tue, 13 Dec 2022 08:53:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 13/14] block: Convert bdrv_debug_event to co_wrapper_mixed
Date: Tue, 13 Dec 2022 09:53:19 +0100
Message-Id: <20221213085320.95673-14-kwolf@redhat.com>
In-Reply-To: <20221213085320.95673-1-kwolf@redhat.com>
References: <20221213085320.95673-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

bdrv_debug_event() is categorized as an I/O function, and it currently
doesn't run in a coroutine. We should let it take a graph rdlock since
it traverses the block nodes graph, which however is only possible in a
coroutine.

Therefore turn it into a co_wrapper_mixed to move the actual function
into a coroutine where the lock can be taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         |  5 ++++-
 include/block/block_int-common.h |  3 ++-
 block.c                          |  2 +-
 block/io.c                       | 22 +++++++++++-----------
 4 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 7e76bb647a..9737fc63cb 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -188,7 +188,10 @@ void *qemu_try_blockalign0(BlockDriverState *bs, size_t size);
 void bdrv_enable_copy_on_read(BlockDriverState *bs);
 void bdrv_disable_copy_on_read(BlockDriverState *bs);
 
-void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event);
+void coroutine_fn bdrv_co_debug_event(BlockDriverState *bs,
+                                      BlkdebugEvent event);
+void co_wrapper_mixed bdrv_debug_event(BlockDriverState *bs,
+                                       BlkdebugEvent event);
 
 #define BLKDBG_EVENT(child, evt) \
     do { \
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 0de99682e2..90702c6dcf 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -728,7 +728,8 @@ struct BlockDriver {
     int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_check)(
         BlockDriverState *bs, BdrvCheckResult *result, BdrvCheckMode fix);
 
-    void (*bdrv_debug_event)(BlockDriverState *bs, BlkdebugEvent event);
+    void coroutine_fn (*bdrv_debug_event)(BlockDriverState *bs,
+                                          BlkdebugEvent event);
 
     /* io queue for linux-aio */
     void coroutine_fn (*bdrv_io_plug)(BlockDriverState *bs);
diff --git a/block.c b/block.c
index d5e660bc9d..d27105dd3b 100644
--- a/block.c
+++ b/block.c
@@ -6350,7 +6350,7 @@ BlockStatsSpecific *bdrv_get_specific_stats(BlockDriverState *bs)
     return drv->bdrv_get_specific_stats(bs);
 }
 
-void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
+void coroutine_fn bdrv_co_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 {
     IO_CODE();
     if (!bs || !bs->drv || !bs->drv->bdrv_debug_event) {
diff --git a/block/io.c b/block/io.c
index 116d6cf10b..93ba851c8c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1241,7 +1241,7 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
                 goto err;
             }
 
-            bdrv_debug_event(bs, BLKDBG_COR_WRITE);
+            bdrv_co_debug_event(bs, BLKDBG_COR_WRITE);
             if (drv->bdrv_co_pwrite_zeroes &&
                 buffer_is_zero(bounce_buffer, pnum)) {
                 /* FIXME: Should we (perhaps conditionally) be setting
@@ -1486,10 +1486,10 @@ static coroutine_fn int bdrv_padding_rmw_read(BdrvChild *child,
         qemu_iovec_init_buf(&local_qiov, pad->buf, bytes);
 
         if (pad->head) {
-            bdrv_debug_event(bs, BLKDBG_PWRITEV_RMW_HEAD);
+            bdrv_co_debug_event(bs, BLKDBG_PWRITEV_RMW_HEAD);
         }
         if (pad->merge_reads && pad->tail) {
-            bdrv_debug_event(bs, BLKDBG_PWRITEV_RMW_TAIL);
+            bdrv_co_debug_event(bs, BLKDBG_PWRITEV_RMW_TAIL);
         }
         ret = bdrv_aligned_preadv(child, req, req->overlap_offset, bytes,
                                   align, &local_qiov, 0, 0);
@@ -1497,10 +1497,10 @@ static coroutine_fn int bdrv_padding_rmw_read(BdrvChild *child,
             return ret;
         }
         if (pad->head) {
-            bdrv_debug_event(bs, BLKDBG_PWRITEV_RMW_AFTER_HEAD);
+            bdrv_co_debug_event(bs, BLKDBG_PWRITEV_RMW_AFTER_HEAD);
         }
         if (pad->merge_reads && pad->tail) {
-            bdrv_debug_event(bs, BLKDBG_PWRITEV_RMW_AFTER_TAIL);
+            bdrv_co_debug_event(bs, BLKDBG_PWRITEV_RMW_AFTER_TAIL);
         }
 
         if (pad->merge_reads) {
@@ -1511,7 +1511,7 @@ static coroutine_fn int bdrv_padding_rmw_read(BdrvChild *child,
     if (pad->tail) {
         qemu_iovec_init_buf(&local_qiov, pad->tail_buf, align);
 
-        bdrv_debug_event(bs, BLKDBG_PWRITEV_RMW_TAIL);
+        bdrv_co_debug_event(bs, BLKDBG_PWRITEV_RMW_TAIL);
         ret = bdrv_aligned_preadv(
                 child, req,
                 req->overlap_offset + req->overlap_bytes - align,
@@ -1519,7 +1519,7 @@ static coroutine_fn int bdrv_padding_rmw_read(BdrvChild *child,
         if (ret < 0) {
             return ret;
         }
-        bdrv_debug_event(bs, BLKDBG_PWRITEV_RMW_AFTER_TAIL);
+        bdrv_co_debug_event(bs, BLKDBG_PWRITEV_RMW_AFTER_TAIL);
     }
 
 zero_mem:
@@ -1921,16 +1921,16 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
     if (ret < 0) {
         /* Do nothing, write notifier decided to fail this request */
     } else if (flags & BDRV_REQ_ZERO_WRITE) {
-        bdrv_debug_event(bs, BLKDBG_PWRITEV_ZERO);
+        bdrv_co_debug_event(bs, BLKDBG_PWRITEV_ZERO);
         ret = bdrv_co_do_pwrite_zeroes(bs, offset, bytes, flags);
     } else if (flags & BDRV_REQ_WRITE_COMPRESSED) {
         ret = bdrv_driver_pwritev_compressed(bs, offset, bytes,
                                              qiov, qiov_offset);
     } else if (bytes <= max_transfer) {
-        bdrv_debug_event(bs, BLKDBG_PWRITEV);
+        bdrv_co_debug_event(bs, BLKDBG_PWRITEV);
         ret = bdrv_driver_pwritev(bs, offset, bytes, qiov, qiov_offset, flags);
     } else {
-        bdrv_debug_event(bs, BLKDBG_PWRITEV);
+        bdrv_co_debug_event(bs, BLKDBG_PWRITEV);
         while (bytes_remaining) {
             int num = MIN(bytes_remaining, max_transfer);
             int local_flags = flags;
@@ -1953,7 +1953,7 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
             bytes_remaining -= num;
         }
     }
-    bdrv_debug_event(bs, BLKDBG_PWRITEV_DONE);
+    bdrv_co_debug_event(bs, BLKDBG_PWRITEV_DONE);
 
     if (ret >= 0) {
         ret = 0;
-- 
2.38.1


