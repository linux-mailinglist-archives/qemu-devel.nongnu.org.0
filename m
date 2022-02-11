Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C83B4B2897
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 16:00:48 +0100 (CET)
Received: from localhost ([::1]:42682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIXPj-0005RA-U1
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 10:00:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHr-0003Xy-CX
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHi-0001jz-9b
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644591138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GxRYbwTPm5GafMq+kBrlnVQDdfxH4Q+SSyQgtY08J9c=;
 b=eOfq1kSmGXVH1ceBE1Vnvhf/xHEp84PNRuaeTS3D1gVg5ofHxAZHAuwKwqG83ZcOmvaHdI
 Ci7qSsPlfPU6LoRftFhAbRPL/Le94F/7ETT1vU026CKxjfBBSxdEovexI3scqY38rruwdB
 JYOc25V4mJnFUF10OWPua+aiKM8U+2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-k8lo7ZkrP0eBBjkTkHpZLA-1; Fri, 11 Feb 2022 09:52:10 -0500
X-MC-Unique: k8lo7ZkrP0eBBjkTkHpZLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24EEF8749B3;
 Fri, 11 Feb 2022 14:52:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA4687C0E8;
 Fri, 11 Feb 2022 14:52:07 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 09/31] IO_CODE and IO_OR_GS_CODE for block-backend I/O API
Date: Fri, 11 Feb 2022 09:51:31 -0500
Message-Id: <20220211145153.2861415-10-eesposit@redhat.com>
In-Reply-To: <20220211145153.2861415-1-eesposit@redhat.com>
References: <20220211145153.2861415-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark all I/O functions with IO_CODE, and all "I/O OR GS" with
IO_OR_GS_CODE.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c             | 57 +++++++++++++++++++++++++++++++
 include/sysemu/block-backend-io.h |  2 ++
 2 files changed, 59 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index ebfc3fe954..03b1e36a3c 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -733,6 +733,7 @@ void monitor_remove_blk(BlockBackend *blk)
  */
 const char *blk_name(const BlockBackend *blk)
 {
+    IO_CODE();
     return blk->name ?: "";
 }
 
@@ -759,6 +760,7 @@ BlockBackend *blk_by_name(const char *name)
  */
 BlockDriverState *blk_bs(BlockBackend *blk)
 {
+    IO_CODE();
     return blk->root ? blk->root->bs : NULL;
 }
 
@@ -1009,6 +1011,7 @@ DeviceState *blk_get_attached_dev(BlockBackend *blk)
 char *blk_get_attached_dev_id(BlockBackend *blk)
 {
     DeviceState *dev = blk->dev;
+    IO_CODE();
 
     if (!dev) {
         return g_strdup("");
@@ -1210,16 +1213,19 @@ void blk_iostatus_set_err(BlockBackend *blk, int error)
 
 void blk_set_allow_write_beyond_eof(BlockBackend *blk, bool allow)
 {
+    IO_CODE();
     blk->allow_write_beyond_eof = allow;
 }
 
 void blk_set_allow_aio_context_change(BlockBackend *blk, bool allow)
 {
+    IO_CODE();
     blk->allow_aio_context_change = allow;
 }
 
 void blk_set_disable_request_queuing(BlockBackend *blk, bool disable)
 {
+    IO_CODE();
     blk->disable_request_queuing = disable;
 }
 
@@ -1303,6 +1309,7 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                BdrvRequestFlags flags)
 {
     int ret;
+    IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
     ret = blk_co_do_preadv(blk, offset, bytes, qiov, flags);
@@ -1354,6 +1361,7 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
                                      BdrvRequestFlags flags)
 {
     int ret;
+    IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
     ret = blk_co_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
@@ -1366,6 +1374,7 @@ int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
                                 int64_t bytes, QEMUIOVector *qiov,
                                 BdrvRequestFlags flags)
 {
+    IO_OR_GS_CODE();
     return blk_co_pwritev_part(blk, offset, bytes, qiov, 0, flags);
 }
 
@@ -1394,6 +1403,7 @@ typedef struct BlkRwCo {
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                       int64_t bytes, BdrvRequestFlags flags)
 {
+    IO_OR_GS_CODE();
     return blk_pwritev_part(blk, offset, bytes, NULL, 0,
                             flags | BDRV_REQ_ZERO_WRITE);
 }
@@ -1406,11 +1416,13 @@ int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
 
 void blk_inc_in_flight(BlockBackend *blk)
 {
+    IO_CODE();
     qatomic_inc(&blk->in_flight);
 }
 
 void blk_dec_in_flight(BlockBackend *blk)
 {
+    IO_CODE();
     qatomic_dec(&blk->in_flight);
     aio_wait_kick();
 }
@@ -1429,6 +1441,7 @@ BlockAIOCB *blk_abort_aio_request(BlockBackend *blk,
                                   void *opaque, int ret)
 {
     struct BlockBackendAIOCB *acb;
+    IO_CODE();
 
     blk_inc_in_flight(blk);
     acb = blk_aio_get(&block_backend_aiocb_info, blk, cb, opaque);
@@ -1536,6 +1549,7 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                   int64_t bytes, BdrvRequestFlags flags,
                                   BlockCompletionFunc *cb, void *opaque)
 {
+    IO_CODE();
     return blk_aio_prwv(blk, offset, bytes, NULL, blk_aio_write_entry,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }
@@ -1544,6 +1558,7 @@ int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes)
 {
     int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
     ret = blk_do_preadv(blk, offset, bytes, &qiov, 0);
@@ -1557,6 +1572,7 @@ int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
 {
     int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    IO_OR_GS_CODE();
 
     ret = blk_pwritev_part(blk, offset, bytes, &qiov, 0, flags);
 
@@ -1565,6 +1581,7 @@ int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
 
 int64_t blk_getlength(BlockBackend *blk)
 {
+    IO_CODE();
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
@@ -1574,6 +1591,7 @@ int64_t blk_getlength(BlockBackend *blk)
 
 void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr)
 {
+    IO_CODE();
     if (!blk_bs(blk)) {
         *nb_sectors_ptr = 0;
     } else {
@@ -1583,6 +1601,7 @@ void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr)
 
 int64_t blk_nb_sectors(BlockBackend *blk)
 {
+    IO_CODE();
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
@@ -1594,6 +1613,7 @@ BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
                            QEMUIOVector *qiov, BdrvRequestFlags flags,
                            BlockCompletionFunc *cb, void *opaque)
 {
+    IO_CODE();
     assert((uint64_t)qiov->size <= INT64_MAX);
     return blk_aio_prwv(blk, offset, qiov->size, qiov,
                         blk_aio_read_entry, flags, cb, opaque);
@@ -1603,6 +1623,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
                             QEMUIOVector *qiov, BdrvRequestFlags flags,
                             BlockCompletionFunc *cb, void *opaque)
 {
+    IO_CODE();
     assert((uint64_t)qiov->size <= INT64_MAX);
     return blk_aio_prwv(blk, offset, qiov->size, qiov,
                         blk_aio_write_entry, flags, cb, opaque);
@@ -1616,6 +1637,7 @@ void blk_aio_cancel(BlockAIOCB *acb)
 
 void blk_aio_cancel_async(BlockAIOCB *acb)
 {
+    IO_CODE();
     bdrv_aio_cancel_async(acb);
 }
 
@@ -1635,6 +1657,7 @@ blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
 {
     int ret;
+    IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
     ret = blk_do_ioctl(blk, req, buf);
@@ -1656,6 +1679,7 @@ static void blk_aio_ioctl_entry(void *opaque)
 BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
                           BlockCompletionFunc *cb, void *opaque)
 {
+    IO_CODE();
     return blk_aio_prwv(blk, req, 0, buf, blk_aio_ioctl_entry, 0, cb, opaque);
 }
 
@@ -1688,6 +1712,7 @@ BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk,
                              int64_t offset, int64_t bytes,
                              BlockCompletionFunc *cb, void *opaque)
 {
+    IO_CODE();
     return blk_aio_prwv(blk, offset, bytes, NULL, blk_aio_pdiscard_entry, 0,
                         cb, opaque);
 }
@@ -1696,6 +1721,7 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
                                  int64_t bytes)
 {
     int ret;
+    IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
     ret = blk_co_do_pdiscard(blk, offset, bytes);
@@ -1707,6 +1733,7 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;
+    IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
     ret = blk_do_pdiscard(blk, offset, bytes);
@@ -1739,12 +1766,14 @@ static void blk_aio_flush_entry(void *opaque)
 BlockAIOCB *blk_aio_flush(BlockBackend *blk,
                           BlockCompletionFunc *cb, void *opaque)
 {
+    IO_CODE();
     return blk_aio_prwv(blk, 0, 0, NULL, blk_aio_flush_entry, 0, cb, opaque);
 }
 
 int coroutine_fn blk_co_flush(BlockBackend *blk)
 {
     int ret;
+    IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
     ret = blk_co_do_flush(blk);
@@ -1767,6 +1796,7 @@ int blk_flush(BlockBackend *blk)
 void blk_drain(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    IO_OR_GS_CODE();
 
     if (bs) {
         bdrv_ref(bs);
@@ -1815,6 +1845,7 @@ void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
 
 BlockdevOnError blk_get_on_error(BlockBackend *blk, bool is_read)
 {
+    IO_CODE();
     return is_read ? blk->on_read_error : blk->on_write_error;
 }
 
@@ -1822,6 +1853,7 @@ BlockErrorAction blk_get_error_action(BlockBackend *blk, bool is_read,
                                       int error)
 {
     BlockdevOnError on_err = blk_get_on_error(blk, is_read);
+    IO_CODE();
 
     switch (on_err) {
     case BLOCKDEV_ON_ERROR_ENOSPC:
@@ -1861,6 +1893,7 @@ void blk_error_action(BlockBackend *blk, BlockErrorAction action,
                       bool is_read, int error)
 {
     assert(error >= 0);
+    IO_CODE();
 
     if (action == BLOCK_ERROR_ACTION_STOP) {
         /* First set the iostatus, so that "info block" returns an iostatus
@@ -1907,6 +1940,7 @@ bool blk_supports_write_perm(BlockBackend *blk)
  */
 bool blk_is_writable(BlockBackend *blk)
 {
+    IO_CODE();
     return blk->perm & BLK_PERM_WRITE;
 }
 
@@ -1924,6 +1958,7 @@ bool blk_is_sg(BlockBackend *blk)
 
 bool blk_enable_write_cache(BlockBackend *blk)
 {
+    IO_CODE();
     return blk->enable_write_cache;
 }
 
@@ -1949,18 +1984,21 @@ void blk_activate(BlockBackend *blk, Error **errp)
 bool blk_is_inserted(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    IO_CODE();
 
     return bs && bdrv_is_inserted(bs);
 }
 
 bool blk_is_available(BlockBackend *blk)
 {
+    IO_CODE();
     return blk_is_inserted(blk) && !blk_dev_is_tray_open(blk);
 }
 
 void blk_lock_medium(BlockBackend *blk, bool locked)
 {
     BlockDriverState *bs = blk_bs(blk);
+    IO_CODE();
 
     if (bs) {
         bdrv_lock_medium(bs, locked);
@@ -1971,6 +2009,7 @@ void blk_eject(BlockBackend *blk, bool eject_flag)
 {
     BlockDriverState *bs = blk_bs(blk);
     char *id;
+    IO_CODE();
 
     if (bs) {
         bdrv_eject(bs, eject_flag);
@@ -2000,6 +2039,7 @@ int blk_get_flags(BlockBackend *blk)
 uint32_t blk_get_request_alignment(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    IO_CODE();
     return bs ? bs->bl.request_alignment : BDRV_SECTOR_SIZE;
 }
 
@@ -2008,6 +2048,7 @@ uint64_t blk_get_max_hw_transfer(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
     uint64_t max = INT_MAX;
+    IO_CODE();
 
     if (bs) {
         max = MIN_NON_ZERO(max, bs->bl.max_hw_transfer);
@@ -2021,6 +2062,7 @@ uint32_t blk_get_max_transfer(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
     uint32_t max = INT_MAX;
+    IO_CODE();
 
     if (bs) {
         max = MIN_NON_ZERO(max, bs->bl.max_transfer);
@@ -2030,27 +2072,32 @@ uint32_t blk_get_max_transfer(BlockBackend *blk)
 
 int blk_get_max_hw_iov(BlockBackend *blk)
 {
+    IO_CODE();
     return MIN_NON_ZERO(blk->root->bs->bl.max_hw_iov,
                         blk->root->bs->bl.max_iov);
 }
 
 int blk_get_max_iov(BlockBackend *blk)
 {
+    IO_CODE();
     return blk->root->bs->bl.max_iov;
 }
 
 void blk_set_guest_block_size(BlockBackend *blk, int align)
 {
+    IO_CODE();
     blk->guest_block_size = align;
 }
 
 void *blk_try_blockalign(BlockBackend *blk, size_t size)
 {
+    IO_CODE();
     return qemu_try_blockalign(blk ? blk_bs(blk) : NULL, size);
 }
 
 void *blk_blockalign(BlockBackend *blk, size_t size)
 {
+    IO_CODE();
     return qemu_blockalign(blk ? blk_bs(blk) : NULL, size);
 }
 
@@ -2099,6 +2146,7 @@ void blk_op_unblock_all(BlockBackend *blk, Error *reason)
 AioContext *blk_get_aio_context(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    IO_CODE();
 
     if (bs) {
         AioContext *ctx = bdrv_get_aio_context(blk_bs(blk));
@@ -2244,6 +2292,7 @@ void blk_add_insert_bs_notifier(BlockBackend *blk, Notifier *notify)
 void blk_io_plug(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    IO_CODE();
 
     if (bs) {
         bdrv_io_plug(bs);
@@ -2253,6 +2302,7 @@ void blk_io_plug(BlockBackend *blk)
 void blk_io_unplug(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    IO_CODE();
 
     if (bs) {
         bdrv_io_unplug(bs);
@@ -2261,18 +2311,21 @@ void blk_io_unplug(BlockBackend *blk)
 
 BlockAcctStats *blk_get_stats(BlockBackend *blk)
 {
+    IO_CODE();
     return &blk->stats;
 }
 
 void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
                   BlockCompletionFunc *cb, void *opaque)
 {
+    IO_CODE();
     return qemu_aio_get(aiocb_info, blk_bs(blk), cb, opaque);
 }
 
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                       int64_t bytes, BdrvRequestFlags flags)
 {
+    IO_OR_GS_CODE();
     return blk_co_pwritev(blk, offset, bytes, NULL,
                           flags | BDRV_REQ_ZERO_WRITE);
 }
@@ -2281,6 +2334,7 @@ int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
                           int64_t bytes)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    IO_OR_GS_CODE();
     return blk_pwritev_part(blk, offset, bytes, &qiov, 0,
                             BDRV_REQ_WRITE_COMPRESSED);
 }
@@ -2288,6 +2342,7 @@ int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
                  PreallocMode prealloc, BdrvRequestFlags flags, Error **errp)
 {
+    IO_OR_GS_CODE();
     if (!blk_is_available(blk)) {
         error_setg(errp, "No medium inserted");
         return -ENOMEDIUM;
@@ -2531,6 +2586,8 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                                    BdrvRequestFlags write_flags)
 {
     int r;
+    IO_CODE();
+
     r = blk_check_byte_request(blk_in, off_in, bytes);
     if (r) {
         return r;
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 5f56e14f6e..1f26b18ce1 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -119,6 +119,7 @@ static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
                                             BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    IO_OR_GS_CODE();
 
     assert(bytes <= SIZE_MAX);
 
@@ -130,6 +131,7 @@ static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
                                              BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    IO_OR_GS_CODE();
 
     assert(bytes <= SIZE_MAX);
 
-- 
2.31.1


