Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C6466A448
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 21:44:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGQsw-0008VC-GV; Fri, 13 Jan 2023 15:42:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQst-0008TO-DM
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQsr-0006AG-6s
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673642560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HYxX9vuqv+vqkdB3PRRnsyeTCGX5MJZCiHSTQfjvhvk=;
 b=HRkjWxAqwrBSJGmLaJmf05PL0jz03trZEsLFt+/jaabehN5KIQW8ngIz+hk9h6+NEqi+fW
 6tTAgtW/OfYUqd/XI5gAvc4jJ+B5/g1W3tUw458T0ZbEXNY0T88qSUoROicjzLvu3mAHo0
 4mbteMhD+oxpvSFGLv/HHvhnubA02jI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-ggCHNurAPWaZgZfvULnhbA-1; Fri, 13 Jan 2023 15:42:37 -0500
X-MC-Unique: ggCHNurAPWaZgZfvULnhbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB1523C01DFE;
 Fri, 13 Jan 2023 20:42:36 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB1FF2026D68;
 Fri, 13 Jan 2023 20:42:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH v2 04/14] block: Convert bdrv_is_inserted() to co_wrapper
Date: Fri, 13 Jan 2023 21:42:02 +0100
Message-Id: <20230113204212.359076-5-kwolf@redhat.com>
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

bdrv_is_inserted() is categorized as an I/O function, and it currently
doesn't run in a coroutine. We should let it take a graph rdlock since
it traverses the block nodes graph, which however is only possible in a
coroutine.

Therefore turn it into a co_wrapper to move the actual function into a
coroutine where the lock can be taken.

At the same time, add also blk_is_inserted as co_wrapper_mixed, since it
is called in both coroutine and non-coroutine contexts.

Because now this function creates a new coroutine and polls, we need to
take the AioContext lock where it is missing, for the only reason that
internally c_w_mixed_bdrv_rdlock calls AIO_WAIT_WHILE and it expects to
release the AioContext lock. Once the rwlock is ultimated and placed in
every place it needs to be, we will poll using AIO_WAIT_WHILE_UNLOCKED
and remove the AioContext lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h          |  5 ++++-
 include/block/block_int-common.h  |  2 +-
 include/sysemu/block-backend-io.h |  5 ++++-
 block.c                           |  8 ++++----
 block/block-backend.c             |  4 ++--
 block/file-posix.c                |  8 ++++----
 block/io.c                        | 12 ++++++------
 blockdev.c                        |  8 +++++++-
 8 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 3bf201f7f4..fe031360c4 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -133,7 +133,10 @@ bool bdrv_is_read_only(BlockDriverState *bs);
 bool bdrv_is_writable(BlockDriverState *bs);
 bool bdrv_is_sg(BlockDriverState *bs);
 int bdrv_get_flags(BlockDriverState *bs);
-bool bdrv_is_inserted(BlockDriverState *bs);
+
+bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs);
+bool co_wrapper bdrv_is_inserted(BlockDriverState *bs);
+
 void bdrv_lock_medium(BlockDriverState *bs, bool locked);
 void bdrv_eject(BlockDriverState *bs, bool eject_flag);
 const char *bdrv_get_format_name(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 253df92509..e6229c64e6 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -708,7 +708,7 @@ struct BlockDriver {
         BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
     /* removable device specific */
-    bool (*bdrv_is_inserted)(BlockDriverState *bs);
+    bool coroutine_fn (*bdrv_co_is_inserted)(BlockDriverState *bs);
     void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
     void (*bdrv_lock_medium)(BlockDriverState *bs, bool locked);
 
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index d8cc8d74f5..4358fc6476 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -53,7 +53,10 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
 
 void blk_inc_in_flight(BlockBackend *blk);
 void blk_dec_in_flight(BlockBackend *blk);
-bool blk_is_inserted(BlockBackend *blk);
+
+bool coroutine_fn blk_co_is_inserted(BlockBackend *blk);
+bool co_wrapper_mixed blk_is_inserted(BlockBackend *blk);
+
 bool blk_is_available(BlockBackend *blk);
 void blk_lock_medium(BlockBackend *blk, bool locked);
 void blk_eject(BlockBackend *blk, bool eject_flag);
diff --git a/block.c b/block.c
index 9c2ac757e4..e89844557b 100644
--- a/block.c
+++ b/block.c
@@ -6781,7 +6781,7 @@ out:
 /**
  * Return TRUE if the media is present
  */
-bool bdrv_is_inserted(BlockDriverState *bs)
+bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *child;
@@ -6790,11 +6790,11 @@ bool bdrv_is_inserted(BlockDriverState *bs)
     if (!drv) {
         return false;
     }
-    if (drv->bdrv_is_inserted) {
-        return drv->bdrv_is_inserted(bs);
+    if (drv->bdrv_co_is_inserted) {
+        return drv->bdrv_co_is_inserted(bs);
     }
     QLIST_FOREACH(child, &bs->children, next) {
-        if (!bdrv_is_inserted(child->bs)) {
+        if (!bdrv_co_is_inserted(child->bs)) {
             return false;
         }
     }
diff --git a/block/block-backend.c b/block/block-backend.c
index 71c7ef4004..6e3b3b9fe8 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1983,12 +1983,12 @@ void blk_activate(BlockBackend *blk, Error **errp)
     bdrv_activate(bs, errp);
 }
 
-bool blk_is_inserted(BlockBackend *blk)
+bool coroutine_fn blk_co_is_inserted(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
     IO_CODE();
 
-    return bs && bdrv_is_inserted(bs);
+    return bs && bdrv_co_is_inserted(bs);
 }
 
 bool blk_is_available(BlockBackend *blk)
diff --git a/block/file-posix.c b/block/file-posix.c
index dd1b8ec52a..b29cd02b30 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3761,7 +3761,7 @@ out:
     return prio;
 }
 
-static bool cdrom_is_inserted(BlockDriverState *bs)
+static bool coroutine_fn cdrom_co_is_inserted(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
     int ret;
@@ -3828,7 +3828,7 @@ static BlockDriver bdrv_host_cdrom = {
                         = raw_get_allocated_file_size,
 
     /* removable device support */
-    .bdrv_is_inserted   = cdrom_is_inserted,
+    .bdrv_co_is_inserted    = cdrom_co_is_inserted,
     .bdrv_eject         = cdrom_eject,
     .bdrv_lock_medium   = cdrom_lock_medium,
 
@@ -3887,7 +3887,7 @@ static int cdrom_reopen(BlockDriverState *bs)
     return 0;
 }
 
-static bool cdrom_is_inserted(BlockDriverState *bs)
+static bool coroutine_fn cdrom_co_is_inserted(BlockDriverState *bs)
 {
     return raw_getlength(bs) > 0;
 }
@@ -3958,7 +3958,7 @@ static BlockDriver bdrv_host_cdrom = {
                         = raw_get_allocated_file_size,
 
     /* removable device support */
-    .bdrv_is_inserted   = cdrom_is_inserted,
+    .bdrv_co_is_inserted     = cdrom_co_is_inserted,
     .bdrv_eject         = cdrom_eject,
     .bdrv_lock_medium   = cdrom_lock_medium,
 };
diff --git a/block/io.c b/block/io.c
index 32c744d546..03becd32d2 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1621,7 +1621,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
 
     trace_bdrv_co_preadv_part(bs, offset, bytes, flags);
 
-    if (!bdrv_is_inserted(bs)) {
+    if (!bdrv_co_is_inserted(bs)) {
         return -ENOMEDIUM;
     }
 
@@ -2066,7 +2066,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
 
     trace_bdrv_co_pwritev_part(child->bs, offset, bytes, flags);
 
-    if (!bdrv_is_inserted(bs)) {
+    if (!bdrv_co_is_inserted(bs)) {
         return -ENOMEDIUM;
     }
 
@@ -2834,7 +2834,7 @@ int coroutine_fn bdrv_co_flush(BlockDriverState *bs)
 
     bdrv_inc_in_flight(bs);
 
-    if (!bdrv_is_inserted(bs) || bdrv_is_read_only(bs) ||
+    if (!bdrv_co_is_inserted(bs) || bdrv_is_read_only(bs) ||
         bdrv_is_sg(bs)) {
         goto early_exit;
     }
@@ -2958,7 +2958,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
     BlockDriverState *bs = child->bs;
     IO_CODE();
 
-    if (!bs || !bs->drv || !bdrv_is_inserted(bs)) {
+    if (!bs || !bs->drv || !bdrv_co_is_inserted(bs)) {
         return -ENOMEDIUM;
     }
 
@@ -3240,7 +3240,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     assert(!(read_flags & BDRV_REQ_NO_WAIT));
     assert(!(write_flags & BDRV_REQ_NO_WAIT));
 
-    if (!dst || !dst->bs || !bdrv_is_inserted(dst->bs)) {
+    if (!dst || !dst->bs || !bdrv_co_is_inserted(dst->bs)) {
         return -ENOMEDIUM;
     }
     ret = bdrv_check_request32(dst_offset, bytes, NULL, 0);
@@ -3251,7 +3251,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
         return bdrv_co_pwrite_zeroes(dst, dst_offset, bytes, write_flags);
     }
 
-    if (!src || !src->bs || !bdrv_is_inserted(src->bs)) {
+    if (!src || !src->bs || !bdrv_co_is_inserted(src->bs)) {
         return -ENOMEDIUM;
     }
     ret = bdrv_check_request32(src_offset, bytes, NULL, 0);
diff --git a/blockdev.c b/blockdev.c
index ebf952cd21..ec9271ce49 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1023,6 +1023,7 @@ fail:
 static BlockDriverState *qmp_get_root_bs(const char *name, Error **errp)
 {
     BlockDriverState *bs;
+    AioContext *aio_context;
 
     bs = bdrv_lookup_bs(name, name, errp);
     if (bs == NULL) {
@@ -1034,11 +1035,16 @@ static BlockDriverState *qmp_get_root_bs(const char *name, Error **errp)
         return NULL;
     }
 
+    aio_context = bdrv_get_aio_context(bs);
+    aio_context_acquire(aio_context);
+
     if (!bdrv_is_inserted(bs)) {
         error_setg(errp, "Device has no medium");
-        return NULL;
+        bs = NULL;
     }
 
+    aio_context_release(aio_context);
+
     return bs;
 }
 
-- 
2.38.1


