Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D782E62C0A4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:14:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ54-0001C0-OK; Wed, 16 Nov 2022 09:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4z-0000uA-6W
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4s-0006AW-Aj
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIsX+LPvxRYdxR0WN9B7+AR2K5URUVD5+nusU62oPIo=;
 b=NhFaRuMx9N3ETx5nULzl88uONKiML77BaH3J40yBVMBOf+qgL3FKx4SHp71WaChP8gkSD/
 ZQDGHFWupPLa3991qaanBky/xi17CJ8FBATbSre/j+YtE1RcI5W2npKfSU3l5LZL6vQYl2
 WY3u4mqHdmd/j/UT66Y7BmzkFl7QSC0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-jR_agOcFOGG-hWRiMA4KzA-1; Wed, 16 Nov 2022 09:07:40 -0500
X-MC-Unique: jR_agOcFOGG-hWRiMA4KzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CED0101A52A;
 Wed, 16 Nov 2022 14:07:39 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB4DFC1908A;
 Wed, 16 Nov 2022 14:07:38 +0000 (UTC)
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
Subject: [PATCH 08/15] block: convert bdrv_is_inserted in
 generated_co_wrapper_simple
Date: Wed, 16 Nov 2022 09:07:23 -0500
Message-Id: <20221116140730.3056048-9-eesposit@redhat.com>
In-Reply-To: <20221116140730.3056048-1-eesposit@redhat.com>
References: <20221116140730.3056048-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

BlockDriver->bdrv_is_inserted is categorized as IO callback, and
it currently doesn't run in a coroutine.
This makes very difficult to add the graph rdlock, since the
callback traverses the block nodes graph.

Therefore use generated_co_wrapper_simple to automatically
creates a wrapper with the same name that will take care of
always calling the function in a coroutine.
This is a generated_co_wrapper_simple callback, which means
it assumes that bdrv_is_inserted is never caled in a coroutine
context.

At the same time, add also blk_is_inserted as g_c_w, since it
is called in both coroutine and non contexts.

Because now this function creates a new coroutine and polls,
we need to take the AioContext lock where it is missing,
for the only reason that internally g_c_w calls AIO_WAIT_WHILE
and it expects to release the AioContext lock.
Once the rwlock is ultimated and placed in every place it needs
to be, we will poll using AIO_WAIT_WHILE_UNLOCKED and remove
the AioContext lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                           |  5 +++--
 block/block-backend.c             |  5 +++--
 block/io.c                        | 12 ++++++------
 blockdev.c                        |  8 +++++++-
 include/block/block-io.h          |  5 ++++-
 include/block/block_int-common.h  |  4 ++--
 include/sysemu/block-backend-io.h |  5 ++++-
 7 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/block.c b/block.c
index 2cdede9c01..4205735308 100644
--- a/block.c
+++ b/block.c
@@ -6778,11 +6778,12 @@ out:
 /**
  * Return TRUE if the media is present
  */
-bool bdrv_is_inserted(BlockDriverState *bs)
+bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *child;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!drv) {
         return false;
@@ -6791,7 +6792,7 @@ bool bdrv_is_inserted(BlockDriverState *bs)
         return drv->bdrv_is_inserted(bs);
     }
     QLIST_FOREACH(child, &bs->children, next) {
-        if (!bdrv_is_inserted(child->bs)) {
+        if (!bdrv_co_is_inserted(child->bs)) {
             return false;
         }
     }
diff --git a/block/block-backend.c b/block/block-backend.c
index 6a84a2a019..9a500fdde3 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1994,12 +1994,13 @@ void blk_activate(BlockBackend *blk, Error **errp)
     bdrv_activate(bs, errp);
 }
 
-bool blk_is_inserted(BlockBackend *blk)
+bool coroutine_fn blk_co_is_inserted(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
     IO_CODE();
+    assert_bdrv_graph_readable();
 
-    return bs && bdrv_is_inserted(bs);
+    return bs && bdrv_co_is_inserted(bs);
 }
 
 bool blk_is_available(BlockBackend *blk)
diff --git a/block/io.c b/block/io.c
index 99ef9a8cb9..88da9470c3 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1598,7 +1598,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
 
     trace_bdrv_co_preadv_part(bs, offset, bytes, flags);
 
-    if (!bdrv_is_inserted(bs)) {
+    if (!bdrv_co_is_inserted(bs)) {
         return -ENOMEDIUM;
     }
 
@@ -2044,7 +2044,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
 
     trace_bdrv_co_pwritev_part(child->bs, offset, bytes, flags);
 
-    if (!bdrv_is_inserted(bs)) {
+    if (!bdrv_co_is_inserted(bs)) {
         return -ENOMEDIUM;
     }
 
@@ -2764,7 +2764,7 @@ int coroutine_fn bdrv_co_flush(BlockDriverState *bs)
     assert_bdrv_graph_readable();
     bdrv_inc_in_flight(bs);
 
-    if (!bdrv_is_inserted(bs) || bdrv_is_read_only(bs) ||
+    if (!bdrv_co_is_inserted(bs) || bdrv_is_read_only(bs) ||
         bdrv_is_sg(bs)) {
         goto early_exit;
     }
@@ -2889,7 +2889,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
     IO_CODE();
     assert_bdrv_graph_readable();
 
-    if (!bs || !bs->drv || !bdrv_is_inserted(bs)) {
+    if (!bs || !bs->drv || !bdrv_co_is_inserted(bs)) {
         return -ENOMEDIUM;
     }
 
@@ -3173,7 +3173,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     assert(!(read_flags & BDRV_REQ_NO_WAIT));
     assert(!(write_flags & BDRV_REQ_NO_WAIT));
 
-    if (!dst || !dst->bs || !bdrv_is_inserted(dst->bs)) {
+    if (!dst || !dst->bs || !bdrv_co_is_inserted(dst->bs)) {
         return -ENOMEDIUM;
     }
     ret = bdrv_check_request32(dst_offset, bytes, NULL, 0);
@@ -3184,7 +3184,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
         return bdrv_co_pwrite_zeroes(dst, dst_offset, bytes, write_flags);
     }
 
-    if (!src || !src->bs || !bdrv_is_inserted(src->bs)) {
+    if (!src || !src->bs || !bdrv_co_is_inserted(src->bs)) {
         return -ENOMEDIUM;
     }
     ret = bdrv_check_request32(src_offset, bytes, NULL, 0);
diff --git a/blockdev.c b/blockdev.c
index 8ffb3d9537..bbe5207e8f 100644
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
 
diff --git a/include/block/block-io.h b/include/block/block-io.h
index ba60ffa43b..3432e6ad3e 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -120,7 +120,10 @@ bool bdrv_is_read_only(BlockDriverState *bs);
 bool bdrv_is_writable(BlockDriverState *bs);
 bool bdrv_is_sg(BlockDriverState *bs);
 int bdrv_get_flags(BlockDriverState *bs);
-bool bdrv_is_inserted(BlockDriverState *bs);
+
+bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs);
+bool generated_co_wrapper_simple bdrv_is_inserted(BlockDriverState *bs);
+
 void bdrv_lock_medium(BlockDriverState *bs, bool locked);
 void bdrv_eject(BlockDriverState *bs, bool eject_flag);
 const char *bdrv_get_format_name(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 5874531617..4cad48b2ad 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -759,8 +759,8 @@ struct BlockDriver {
                                           QEMUIOVector *qiov,
                                           int64_t pos);
 
-    /* removable device specific */
-    bool (*bdrv_is_inserted)(BlockDriverState *bs);
+    /* removable device specific. Called with graph rdlock held. */
+    bool coroutine_fn (*bdrv_is_inserted)(BlockDriverState *bs);
     void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
     void (*bdrv_lock_medium)(BlockDriverState *bs, bool locked);
 
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 5456822b07..bf88f7699e 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -53,7 +53,10 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
 
 void blk_inc_in_flight(BlockBackend *blk);
 void blk_dec_in_flight(BlockBackend *blk);
-bool blk_is_inserted(BlockBackend *blk);
+
+bool coroutine_fn blk_co_is_inserted(BlockBackend *blk);
+bool generated_co_wrapper blk_is_inserted(BlockBackend *blk);
+
 bool blk_is_available(BlockBackend *blk);
 void blk_lock_medium(BlockBackend *blk, bool locked);
 void blk_eject(BlockBackend *blk, bool eject_flag);
-- 
2.31.1


