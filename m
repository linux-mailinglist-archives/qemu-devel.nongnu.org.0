Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C15563FC5
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 13:37:19 +0200 (CEST)
Received: from localhost ([::1]:35224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7bR9-0006CI-1B
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 07:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bNu-0003K3-9I
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bNr-0007yT-HG
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656761635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U019ymYOutfn4cZj9FQwzQdfQ9NuRH86JCzWCeQt3Cs=;
 b=fseTmnBdb7DJj8kU/4kWQjxoRTxHv+GqJbO0938H4YzCorPhFnuj4F8ZHdHyGlYeQ+eOlK
 YaPtwjAQ/yrYLf8LsEP3PqBlz+FTANUJ7K/N0ylHiiPKUg2dxJSkmtnOOH6mj6SsVqvcWa
 um6RJEjVaQN8HJHx/QV76fa0xQlOItw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-aSky6CNZOwKvdcOooigZ7Q-1; Sat, 02 Jul 2022 07:33:51 -0400
X-MC-Unique: aSky6CNZOwKvdcOooigZ7Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3432383395C;
 Sat,  2 Jul 2022 11:33:51 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15C7D492C3B;
 Sat,  2 Jul 2022 11:33:47 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alberto Garcia <berto@igalia.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>, Alberto Faria <afaria@redhat.com>
Subject: [RFC 4/8] Fix some direct calls from non-coroutine_fn to coroutine_fn
Date: Sat,  2 Jul 2022 12:33:27 +0100
Message-Id: <20220702113331.2003820-5-afaria@redhat.com>
In-Reply-To: <20220702113331.2003820-1-afaria@redhat.com>
References: <20220702113331.2003820-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These problems were found by static-analyzer.py. Only a few of the
reported cases were fixed.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c     | 13 ++++++++-----
 block/copy-before-write.c |  3 ++-
 block/dirty-bitmap.c      |  6 ++++--
 block/iscsi.c             |  3 ++-
 block/qcow2.h             | 14 +++++++-------
 block/qed.c               |  6 +++---
 include/block/block-io.h  |  7 ++++---
 7 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index f425b00793..5f2a912a59 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1537,8 +1537,9 @@ static void blk_aio_read_entry(void *opaque)
     QEMUIOVector *qiov = rwco->iobuf;
 
     assert(qiov->size == acb->bytes);
-    rwco->ret = blk_co_do_preadv(rwco->blk, rwco->offset, acb->bytes,
-                                 qiov, rwco->flags);
+    rwco->ret = __allow_coroutine_fn_call(
+        blk_co_do_preadv(rwco->blk, rwco->offset, acb->bytes, qiov,
+                         rwco->flags));
     blk_aio_complete(acb);
 }
 
@@ -1682,7 +1683,8 @@ static void blk_aio_ioctl_entry(void *opaque)
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
 
-    rwco->ret = blk_co_do_ioctl(rwco->blk, rwco->offset, rwco->iobuf);
+    rwco->ret = __allow_coroutine_fn_call(
+        blk_co_do_ioctl(rwco->blk, rwco->offset, rwco->iobuf));
 
     blk_aio_complete(acb);
 }
@@ -1716,7 +1718,8 @@ static void blk_aio_pdiscard_entry(void *opaque)
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
 
-    rwco->ret = blk_co_do_pdiscard(rwco->blk, rwco->offset, acb->bytes);
+    rwco->ret = __allow_coroutine_fn_call(
+        blk_co_do_pdiscard(rwco->blk, rwco->offset, acb->bytes));
     blk_aio_complete(acb);
 }
 
@@ -1772,7 +1775,7 @@ static void blk_aio_flush_entry(void *opaque)
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
 
-    rwco->ret = blk_co_do_flush(rwco->blk);
+    rwco->ret = __allow_coroutine_fn_call(blk_co_do_flush(rwco->blk));
     blk_aio_complete(acb);
 }
 
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c24b8dd117..5096abbc08 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -240,7 +240,8 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
     return req;
 }
 
-static void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
+static coroutine_fn void
+cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index bf3dc0512a..ccf46c0b1f 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -419,7 +419,8 @@ int bdrv_remove_persistent_dirty_bitmap(BlockDriverState *bs, const char *name,
                                         Error **errp)
 {
     if (qemu_in_coroutine()) {
-        return bdrv_co_remove_persistent_dirty_bitmap(bs, name, errp);
+        return __allow_coroutine_fn_call(
+            bdrv_co_remove_persistent_dirty_bitmap(bs, name, errp));
     } else {
         Coroutine *co;
         BdrvRemovePersistentDirtyBitmapCo s = {
@@ -495,7 +496,8 @@ bool bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
 {
     IO_CODE();
     if (qemu_in_coroutine()) {
-        return bdrv_co_can_store_new_dirty_bitmap(bs, name, granularity, errp);
+        return __allow_coroutine_fn_call(
+            bdrv_co_can_store_new_dirty_bitmap(bs, name, granularity, errp));
     } else {
         Coroutine *co;
         BdrvCanStoreNewDirtyBitmapCo s = {
diff --git a/block/iscsi.c b/block/iscsi.c
index d707d0b354..967438b4bd 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -290,7 +290,8 @@ iscsi_co_generic_cb(struct iscsi_context *iscsi, int status,
     }
 }
 
-static void iscsi_co_init_iscsitask(IscsiLun *iscsilun, struct IscsiTask *iTask)
+static void coroutine_fn
+iscsi_co_init_iscsitask(IscsiLun *iscsilun, struct IscsiTask *iTask)
 {
     *iTask = (struct IscsiTask) {
         .co         = qemu_coroutine_self(),
diff --git a/block/qcow2.h b/block/qcow2.h
index ba436a8d0d..e68d127d8e 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -990,13 +990,13 @@ int qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp);
 bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                                           bool release_stored, Error **errp);
 int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp);
-bool qcow2_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
-                                         const char *name,
-                                         uint32_t granularity,
-                                         Error **errp);
-int qcow2_co_remove_persistent_dirty_bitmap(BlockDriverState *bs,
-                                            const char *name,
-                                            Error **errp);
+bool coroutine_fn qcow2_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
+                                                      const char *name,
+                                                      uint32_t granularity,
+                                                      Error **errp);
+int coroutine_fn qcow2_co_remove_persistent_dirty_bitmap(BlockDriverState *bs,
+                                                         const char *name,
+                                                         Error **errp);
 bool qcow2_supports_persistent_dirty_bitmap(BlockDriverState *bs);
 uint64_t qcow2_get_persistent_dirty_bitmap_size(BlockDriverState *bs,
                                                 uint32_t cluster_size);
diff --git a/block/qed.c b/block/qed.c
index f34d9a3ac1..96f4cda83f 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -259,7 +259,7 @@ static CachedL2Table *qed_new_l2_table(BDRVQEDState *s)
     return l2_table;
 }
 
-static bool qed_plug_allocating_write_reqs(BDRVQEDState *s)
+static bool coroutine_fn qed_plug_allocating_write_reqs(BDRVQEDState *s)
 {
     qemu_co_mutex_lock(&s->table_lock);
 
@@ -278,7 +278,7 @@ static bool qed_plug_allocating_write_reqs(BDRVQEDState *s)
     return true;
 }
 
-static void qed_unplug_allocating_write_reqs(BDRVQEDState *s)
+static void coroutine_fn qed_unplug_allocating_write_reqs(BDRVQEDState *s)
 {
     qemu_co_mutex_lock(&s->table_lock);
     assert(s->allocating_write_reqs_plugged);
@@ -568,7 +568,7 @@ static int bdrv_qed_open(BlockDriverState *bs, QDict *options, int flags,
 
     bdrv_qed_init_state(bs);
     if (qemu_in_coroutine()) {
-        bdrv_qed_open_entry(&qoc);
+        __allow_coroutine_fn_call(bdrv_qed_open_entry(&qoc));
     } else {
         assert(qemu_get_current_aio_context() == qemu_get_aio_context());
         qemu_coroutine_enter(qemu_coroutine_create(bdrv_qed_open_entry, &qoc));
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 053a27141a..cefe3494fe 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -80,7 +80,8 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
 /* Ensure contents are flushed to disk.  */
 int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
 
-int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
+int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
+                                  int64_t bytes);
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
 int bdrv_block_status(BlockDriverState *bs, int64_t offset,
                       int64_t bytes, int64_t *pnum, int64_t *map,
@@ -88,8 +89,8 @@ int bdrv_block_status(BlockDriverState *bs, int64_t offset,
 int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
                             int64_t offset, int64_t bytes, int64_t *pnum,
                             int64_t *map, BlockDriverState **file);
-int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
-                      int64_t *pnum);
+int coroutine_fn bdrv_is_allocated(BlockDriverState *bs, int64_t offset,
+                                   int64_t bytes, int64_t *pnum);
 int bdrv_is_allocated_above(BlockDriverState *top, BlockDriverState *base,
                             bool include_base, int64_t offset, int64_t bytes,
                             int64_t *pnum);
-- 
2.36.1


