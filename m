Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7E62C08C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:09:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ59-0001My-Oj; Wed, 16 Nov 2022 09:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ50-0000wm-Au
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4t-0006Br-PE
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndBxEipnIcXw6yOeHrUZcMyNT520NaR+GbAsbSQvqBg=;
 b=L4VG2N2lv03WR87hgHfW8PPppbfrvSHEtmIt3BUmDuDqrC05UG7wW5HypTewp2XrZhY72a
 rDgWs9WZnVoy3LoGDpm8kXHPrqaxJOlc/UydHHGVEjhdovLYoRtnp+KQO6DgGO8vgUJq74
 2gqU/vK9P+K+AFm3hBgD5ECmSYodLxE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-LEH2WPoiMxOgXUznwvuY3A-1; Wed, 16 Nov 2022 09:07:44 -0500
X-MC-Unique: LEH2WPoiMxOgXUznwvuY3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F0E63C1014C;
 Wed, 16 Nov 2022 14:07:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7200CC2C8CC;
 Wed, 16 Nov 2022 14:07:41 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alberto Garcia <berto@igalia.com>, Ilya Dryomov <idryomov@gmail.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 integration@gluster.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 12/15] block: convert bdrv_debug_event in generated_co_wrapper
Date: Wed, 16 Nov 2022 09:07:27 -0500
Message-Id: <20221116140730.3056048-13-eesposit@redhat.com>
In-Reply-To: <20221116140730.3056048-1-eesposit@redhat.com>
References: <20221116140730.3056048-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

BlockDriver->bdrv_debug_event is categorized as IO callback, and
it currently doesn't run in a coroutine.
This makes very difficult to add the graph rdlock, since the
callback traverses the block nodes graph.

Therefore use generated_co_wrapper to automatically
create a wrapper with the same name.
Unfortunately we cannot use a generated_co_wrapper_simple,
because the function is called by mixed functions that run both
in coroutine and non-coroutine context (for example blkdebug_open).

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                          |  4 +++-
 block/io.c                       | 22 +++++++++++-----------
 include/block/block-io.h         |  7 +++++--
 include/block/block_int-common.h |  4 +++-
 4 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/block.c b/block.c
index afc5735b82..a2e3550d5c 100644
--- a/block.c
+++ b/block.c
@@ -6331,9 +6331,11 @@ BlockStatsSpecific *bdrv_get_specific_stats(BlockDriverState *bs)
     return drv->bdrv_get_specific_stats(bs);
 }
 
-void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
+void coroutine_fn bdrv_co_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 {
     IO_CODE();
+    assert_bdrv_graph_readable();
+
     if (!bs || !bs->drv || !bs->drv->bdrv_debug_event) {
         return;
     }
diff --git a/block/io.c b/block/io.c
index 88da9470c3..11d2c5dcde 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1227,7 +1227,7 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
                 goto err;
             }
 
-            bdrv_debug_event(bs, BLKDBG_COR_WRITE);
+            bdrv_co_debug_event(bs, BLKDBG_COR_WRITE);
             if (drv->bdrv_co_pwrite_zeroes &&
                 buffer_is_zero(bounce_buffer, pnum)) {
                 /* FIXME: Should we (perhaps conditionally) be setting
@@ -1472,10 +1472,10 @@ static coroutine_fn int bdrv_padding_rmw_read(BdrvChild *child,
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
@@ -1483,10 +1483,10 @@ static coroutine_fn int bdrv_padding_rmw_read(BdrvChild *child,
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
@@ -1497,7 +1497,7 @@ static coroutine_fn int bdrv_padding_rmw_read(BdrvChild *child,
     if (pad->tail) {
         qemu_iovec_init_buf(&local_qiov, pad->tail_buf, align);
 
-        bdrv_debug_event(bs, BLKDBG_PWRITEV_RMW_TAIL);
+        bdrv_co_debug_event(bs, BLKDBG_PWRITEV_RMW_TAIL);
         ret = bdrv_aligned_preadv(
                 child, req,
                 req->overlap_offset + req->overlap_bytes - align,
@@ -1505,7 +1505,7 @@ static coroutine_fn int bdrv_padding_rmw_read(BdrvChild *child,
         if (ret < 0) {
             return ret;
         }
-        bdrv_debug_event(bs, BLKDBG_PWRITEV_RMW_AFTER_TAIL);
+        bdrv_co_debug_event(bs, BLKDBG_PWRITEV_RMW_AFTER_TAIL);
     }
 
 zero_mem:
@@ -1908,16 +1908,16 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
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
@@ -1940,7 +1940,7 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
             bytes_remaining -= num;
         }
     }
-    bdrv_debug_event(bs, BLKDBG_PWRITEV_DONE);
+    bdrv_co_debug_event(bs, BLKDBG_PWRITEV_DONE);
 
     if (ret >= 0) {
         ret = 0;
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 497580fc28..176e3cc734 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -170,12 +170,15 @@ void *qemu_try_blockalign0(BlockDriverState *bs, size_t size);
 void bdrv_enable_copy_on_read(BlockDriverState *bs);
 void bdrv_disable_copy_on_read(BlockDriverState *bs);
 
-void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event);
+void coroutine_fn bdrv_co_debug_event(BlockDriverState *bs,
+                                      BlkdebugEvent event);
+void generated_co_wrapper bdrv_debug_event(BlockDriverState *bs,
+                                                  BlkdebugEvent event);
 
 #define BLKDBG_EVENT(child, evt) \
     do { \
         if (child) { \
-            bdrv_debug_event(child->bs, evt); \
+            bdrv_co_debug_event(child->bs, evt); \
         } \
     } while (0)
 
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 3e1eba518c..b509855c19 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -781,7 +781,9 @@ struct BlockDriver {
                                       BdrvCheckResult *result,
                                       BdrvCheckMode fix);
 
-    void (*bdrv_debug_event)(BlockDriverState *bs, BlkdebugEvent event);
+    /* Called with graph rdlock taken. */
+    void coroutine_fn (*bdrv_debug_event)(BlockDriverState *bs,
+                                          BlkdebugEvent event);
 
     /* io queue for linux-aio */
     void (*bdrv_io_plug)(BlockDriverState *bs);
-- 
2.31.1


