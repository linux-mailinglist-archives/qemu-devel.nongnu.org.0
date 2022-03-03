Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9664F4CC157
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:31:59 +0100 (CET)
Received: from localhost ([::1]:36572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnQs-0001Rd-Nq
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:31:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnDe-0006Zu-E9
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:18:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnDZ-0004ef-AT
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646320685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j1OBUeg/8khWJKZU5X4cjyr+Tczp1Dh1yP8wgomE8CI=;
 b=CGQaSOaIYk9kNRcYeu6K0Hxof3xMoOJHUKHVEoKz0BllHey+aDYKvEvPPZtK17Zxoyb805
 isrkq1ditc9b51J2k7OM2jDV4pXz+K9f1Cg89og7T/kOjsGHbH+n2o3UIcx+S4/plI/CEc
 tfzVxzw0xA6xu/rIXFwDm64URi72rPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-z6whR-j9M66233cpUh21gw-1; Thu, 03 Mar 2022 10:18:02 -0500
X-MC-Unique: z6whR-j9M66233cpUh21gw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D170E51E0;
 Thu,  3 Mar 2022 15:18:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3C127C029;
 Thu,  3 Mar 2022 15:17:51 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 05/31] IO_CODE and IO_OR_GS_CODE for block I/O API
Date: Thu,  3 Mar 2022 10:15:50 -0500
Message-Id: <20220303151616.325444-6-eesposit@redhat.com>
In-Reply-To: <20220303151616.325444-1-eesposit@redhat.com>
References: <20220303151616.325444-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 block.c                  | 38 ++++++++++++++++++++++++++++++++++-
 block/dirty-bitmap.c     |  1 +
 block/io.c               | 43 ++++++++++++++++++++++++++++++++++++++--
 include/block/block-io.h |  1 +
 4 files changed, 80 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index f59f290653..2a7df2a013 100644
--- a/block.c
+++ b/block.c
@@ -137,6 +137,7 @@ size_t bdrv_opt_mem_align(BlockDriverState *bs)
         /* page size or 4k (hdd sector size) should be on the safe side */
         return MAX(4096, qemu_real_host_page_size);
     }
+    IO_CODE();
 
     return bs->bl.opt_mem_alignment;
 }
@@ -147,6 +148,7 @@ size_t bdrv_min_mem_align(BlockDriverState *bs)
         /* page size or 4k (hdd sector size) should be on the safe side */
         return MAX(4096, qemu_real_host_page_size);
     }
+    IO_CODE();
 
     return bs->bl.min_mem_alignment;
 }
@@ -272,12 +274,15 @@ void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
  * image is inactivated. */
 bool bdrv_is_read_only(BlockDriverState *bs)
 {
+    IO_CODE();
     return !(bs->open_flags & BDRV_O_RDWR);
 }
 
 int bdrv_can_set_read_only(BlockDriverState *bs, bool read_only,
                            bool ignore_allow_rdw, Error **errp)
 {
+    IO_CODE();
+
     /* Do not set read_only if copy_on_read is enabled */
     if (bs->copy_on_read && read_only) {
         error_setg(errp, "Can't set node '%s' to r/o with copy-on-read enabled",
@@ -311,6 +316,7 @@ int bdrv_apply_auto_read_only(BlockDriverState *bs, const char *errmsg,
                               Error **errp)
 {
     int ret = 0;
+    IO_CODE();
 
     if (!(bs->open_flags & BDRV_O_RDWR)) {
         return 0;
@@ -757,6 +763,7 @@ int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp)
     Error *local_err = NULL;
     int ret;
 
+    IO_CODE();
     assert(bs != NULL);
 
     if (!bs->drv) {
@@ -782,6 +789,7 @@ void coroutine_fn bdrv_co_delete_file_noerr(BlockDriverState *bs)
 {
     Error *local_err = NULL;
     int ret;
+    IO_CODE();
 
     if (!bs) {
         return;
@@ -1442,6 +1450,7 @@ static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
 AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c)
 {
     BlockDriverState *bs = c->opaque;
+    IO_CODE();
 
     return bdrv_get_aio_context(bs);
 }
@@ -1464,6 +1473,7 @@ const BdrvChildClass child_of_bds = {
 
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c)
 {
+    IO_CODE();
     return c->klass->get_parent_aio_context(c);
 }
 
@@ -2077,6 +2087,7 @@ static bool bdrv_is_writable_after_reopen(BlockDriverState *bs,
  */
 bool bdrv_is_writable(BlockDriverState *bs)
 {
+    IO_CODE();
     return bdrv_is_writable_after_reopen(bs, NULL);
 }
 
@@ -5706,6 +5717,8 @@ static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
 int64_t bdrv_get_allocated_file_size(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
+    IO_CODE();
+
     if (!drv) {
         return -ENOMEDIUM;
     }
@@ -5755,6 +5768,7 @@ int64_t bdrv_get_allocated_file_size(BlockDriverState *bs)
 BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
                                BlockDriverState *in_bs, Error **errp)
 {
+    IO_CODE();
     if (!drv->bdrv_measure) {
         error_setg(errp, "Block driver '%s' does not support size measurement",
                    drv->format_name);
@@ -5770,6 +5784,7 @@ BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
 int64_t bdrv_nb_sectors(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
+    IO_CODE();
 
     if (!drv)
         return -ENOMEDIUM;
@@ -5790,6 +5805,7 @@ int64_t bdrv_nb_sectors(BlockDriverState *bs)
 int64_t bdrv_getlength(BlockDriverState *bs)
 {
     int64_t ret = bdrv_nb_sectors(bs);
+    IO_CODE();
 
     if (ret < 0) {
         return ret;
@@ -5804,12 +5820,14 @@ int64_t bdrv_getlength(BlockDriverState *bs)
 void bdrv_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr)
 {
     int64_t nb_sectors = bdrv_nb_sectors(bs);
+    IO_CODE();
 
     *nb_sectors_ptr = nb_sectors < 0 ? 0 : nb_sectors;
 }
 
 bool bdrv_is_sg(BlockDriverState *bs)
 {
+    IO_CODE();
     return bs->sg;
 }
 
@@ -5819,6 +5837,7 @@ bool bdrv_is_sg(BlockDriverState *bs)
 bool bdrv_supports_compressed_writes(BlockDriverState *bs)
 {
     BlockDriverState *filtered;
+    IO_CODE();
 
     if (!bs->drv || !block_driver_can_compress(bs->drv)) {
         return false;
@@ -5838,6 +5857,7 @@ bool bdrv_supports_compressed_writes(BlockDriverState *bs)
 
 const char *bdrv_get_format_name(BlockDriverState *bs)
 {
+    IO_CODE();
     return bs->drv ? bs->drv->format_name : NULL;
 }
 
@@ -6146,6 +6166,7 @@ BlockDriverState *bdrv_next_all_states(BlockDriverState *bs)
 
 const char *bdrv_get_node_name(const BlockDriverState *bs)
 {
+    IO_CODE();
     return bs->node_name;
 }
 
@@ -6170,6 +6191,7 @@ const char *bdrv_get_parent_name(const BlockDriverState *bs)
 /* TODO check what callers really want: bs->node_name or blk_name() */
 const char *bdrv_get_device_name(const BlockDriverState *bs)
 {
+    IO_CODE();
     return bdrv_get_parent_name(bs) ?: "";
 }
 
@@ -6179,6 +6201,7 @@ const char *bdrv_get_device_name(const BlockDriverState *bs)
  * absent, then this returns an empty (non-null) string. */
 const char *bdrv_get_device_or_node_name(const BlockDriverState *bs)
 {
+    IO_CODE();
     return bdrv_get_parent_name(bs) ?: bs->node_name;
 }
 
@@ -6223,6 +6246,7 @@ int bdrv_has_zero_init(BlockDriverState *bs)
 
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs)
 {
+    IO_CODE();
     if (!(bs->open_flags & BDRV_O_UNMAP)) {
         return false;
     }
@@ -6233,6 +6257,7 @@ bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs)
 void bdrv_get_backing_filename(BlockDriverState *bs,
                                char *filename, int filename_size)
 {
+    IO_CODE();
     pstrcpy(filename, filename_size, bs->backing_file);
 }
 
@@ -6240,6 +6265,7 @@ int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     int ret;
     BlockDriver *drv = bs->drv;
+    IO_CODE();
     /* if bs->drv == NULL, bs is closed, so there's nothing to do here */
     if (!drv) {
         return -ENOMEDIUM;
@@ -6268,6 +6294,7 @@ ImageInfoSpecific *bdrv_get_specific_info(BlockDriverState *bs,
                                           Error **errp)
 {
     BlockDriver *drv = bs->drv;
+    IO_CODE();
     if (drv && drv->bdrv_get_specific_info) {
         return drv->bdrv_get_specific_info(bs, errp);
     }
@@ -6277,6 +6304,7 @@ ImageInfoSpecific *bdrv_get_specific_info(BlockDriverState *bs,
 BlockStatsSpecific *bdrv_get_specific_stats(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
+    IO_CODE();
     if (!drv || !drv->bdrv_get_specific_stats) {
         return NULL;
     }
@@ -6285,6 +6313,7 @@ BlockStatsSpecific *bdrv_get_specific_stats(BlockDriverState *bs)
 
 void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 {
+    IO_CODE();
     if (!bs || !bs->drv || !bs->drv->bdrv_debug_event) {
         return;
     }
@@ -6727,6 +6756,7 @@ bool bdrv_is_inserted(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *child;
+    IO_CODE();
 
     if (!drv) {
         return false;
@@ -6748,6 +6778,7 @@ bool bdrv_is_inserted(BlockDriverState *bs)
 void bdrv_eject(BlockDriverState *bs, bool eject_flag)
 {
     BlockDriver *drv = bs->drv;
+    IO_CODE();
 
     if (drv && drv->bdrv_eject) {
         drv->bdrv_eject(bs, eject_flag);
@@ -6761,7 +6792,7 @@ void bdrv_eject(BlockDriverState *bs, bool eject_flag)
 void bdrv_lock_medium(BlockDriverState *bs, bool locked)
 {
     BlockDriver *drv = bs->drv;
-
+    IO_CODE();
     trace_bdrv_lock_medium(bs, locked);
 
     if (drv && drv->bdrv_lock_medium) {
@@ -6856,6 +6887,7 @@ void bdrv_op_unblock_all(BlockDriverState *bs, Error *reason)
 bool bdrv_op_blocker_is_empty(BlockDriverState *bs)
 {
     int i;
+    IO_OR_GS_CODE();
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         if (!QLIST_EMPTY(&bs->op_blockers[i])) {
             return false;
@@ -7056,6 +7088,7 @@ out:
 
 AioContext *bdrv_get_aio_context(BlockDriverState *bs)
 {
+    IO_CODE();
     return bs ? bs->aio_context : qemu_get_aio_context();
 }
 
@@ -7064,6 +7097,7 @@ AioContext *coroutine_fn bdrv_co_enter(BlockDriverState *bs)
     Coroutine *self = qemu_coroutine_self();
     AioContext *old_ctx = qemu_coroutine_get_aio_context(self);
     AioContext *new_ctx;
+    IO_CODE();
 
     /*
      * Increase bs->in_flight to ensure that this operation is completed before
@@ -7078,6 +7112,7 @@ AioContext *coroutine_fn bdrv_co_enter(BlockDriverState *bs)
 
 void coroutine_fn bdrv_co_leave(BlockDriverState *bs, AioContext *old_ctx)
 {
+    IO_CODE();
     aio_co_reschedule_self(old_ctx);
     bdrv_dec_in_flight(bs);
 }
@@ -7111,6 +7146,7 @@ void coroutine_fn bdrv_co_unlock(BlockDriverState *bs)
 
 void bdrv_coroutine_enter(BlockDriverState *bs, Coroutine *co)
 {
+    IO_CODE();
     aio_co_enter(bdrv_get_aio_context(bs), co);
 }
 
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 0ef46163e3..7569a9cd73 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -496,6 +496,7 @@ static void coroutine_fn bdrv_co_can_store_new_dirty_bitmap_entry(void *opaque)
 bool bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
                                      uint32_t granularity, Error **errp)
 {
+    IO_CODE();
     if (qemu_in_coroutine()) {
         return bdrv_co_can_store_new_dirty_bitmap(bs, name, granularity, errp);
     } else {
diff --git a/block/io.c b/block/io.c
index 769b7ebdbc..8697e85f25 100644
--- a/block/io.c
+++ b/block/io.c
@@ -70,6 +70,7 @@ static void bdrv_parent_drained_end_single_no_poll(BdrvChild *c,
 void bdrv_parent_drained_end_single(BdrvChild *c)
 {
     int drained_end_counter = 0;
+    IO_OR_GS_CODE();
     bdrv_parent_drained_end_single_no_poll(c, &drained_end_counter);
     BDRV_POLL_WHILE(c->bs, qatomic_read(&drained_end_counter) > 0);
 }
@@ -114,6 +115,7 @@ static bool bdrv_parent_drained_poll(BlockDriverState *bs, BdrvChild *ignore,
 
 void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
 {
+    IO_OR_GS_CODE();
     c->parent_quiesce_counter++;
     if (c->klass->drained_begin) {
         c->klass->drained_begin(c);
@@ -228,12 +230,14 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
  */
 void bdrv_enable_copy_on_read(BlockDriverState *bs)
 {
+    IO_CODE();
     qatomic_inc(&bs->copy_on_read);
 }
 
 void bdrv_disable_copy_on_read(BlockDriverState *bs)
 {
     int old = qatomic_fetch_dec(&bs->copy_on_read);
+    IO_CODE();
     assert(old >= 1);
 }
 
@@ -305,6 +309,7 @@ bool bdrv_drain_poll(BlockDriverState *bs, bool recursive,
                      BdrvChild *ignore_parent, bool ignore_bds_parents)
 {
     BdrvChild *child, *next;
+    IO_OR_GS_CODE();
 
     if (bdrv_parent_drained_poll(bs, ignore_parent, ignore_bds_parents)) {
         return true;
@@ -428,6 +433,7 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
 void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
                                    BdrvChild *parent, bool ignore_bds_parents)
 {
+    IO_OR_GS_CODE();
     assert(!qemu_in_coroutine());
 
     /* Stop things in parent-to-child order */
@@ -479,11 +485,13 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
 
 void bdrv_drained_begin(BlockDriverState *bs)
 {
+    IO_OR_GS_CODE();
     bdrv_do_drained_begin(bs, false, NULL, false, true);
 }
 
 void bdrv_subtree_drained_begin(BlockDriverState *bs)
 {
+    IO_OR_GS_CODE();
     bdrv_do_drained_begin(bs, true, NULL, false, true);
 }
 
@@ -540,18 +548,21 @@ static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
 void bdrv_drained_end(BlockDriverState *bs)
 {
     int drained_end_counter = 0;
+    IO_OR_GS_CODE();
     bdrv_do_drained_end(bs, false, NULL, false, &drained_end_counter);
     BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
 }
 
 void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_counter)
 {
+    IO_CODE();
     bdrv_do_drained_end(bs, false, NULL, false, drained_end_counter);
 }
 
 void bdrv_subtree_drained_end(BlockDriverState *bs)
 {
     int drained_end_counter = 0;
+    IO_OR_GS_CODE();
     bdrv_do_drained_end(bs, true, NULL, false, &drained_end_counter);
     BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
 }
@@ -587,6 +598,7 @@ void bdrv_unapply_subtree_drain(BdrvChild *child, BlockDriverState *old_parent)
  */
 void coroutine_fn bdrv_co_drain(BlockDriverState *bs)
 {
+    IO_OR_GS_CODE();
     assert(qemu_in_coroutine());
     bdrv_drained_begin(bs);
     bdrv_drained_end(bs);
@@ -594,6 +606,7 @@ void coroutine_fn bdrv_co_drain(BlockDriverState *bs)
 
 void bdrv_drain(BlockDriverState *bs)
 {
+    IO_OR_GS_CODE();
     bdrv_drained_begin(bs);
     bdrv_drained_end(bs);
 }
@@ -892,7 +905,7 @@ void bdrv_round_to_clusters(BlockDriverState *bs,
                             int64_t *cluster_bytes)
 {
     BlockDriverInfo bdi;
-
+    IO_CODE();
     if (bdrv_get_info(bs, &bdi) < 0 || bdi.cluster_size == 0) {
         *cluster_offset = offset;
         *cluster_bytes = bytes;
@@ -1046,6 +1059,7 @@ static int bdrv_check_request32(int64_t offset, int64_t bytes,
 int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
                        int64_t bytes, BdrvRequestFlags flags)
 {
+    IO_CODE();
     return bdrv_pwritev(child, offset, bytes, NULL,
                         BDRV_REQ_ZERO_WRITE | flags);
 }
@@ -1064,6 +1078,7 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
     int ret;
     int64_t target_size, bytes, offset = 0;
     BlockDriverState *bs = child->bs;
+    IO_CODE();
 
     target_size = bdrv_getlength(bs);
     if (target_size < 0) {
@@ -1096,6 +1111,7 @@ int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int64_t bytes)
 {
     int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    IO_CODE();
 
     if (bytes < 0) {
         return -EINVAL;
@@ -1117,6 +1133,7 @@ int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf,
 {
     int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    IO_CODE();
 
     if (bytes < 0) {
         return -EINVAL;
@@ -1137,6 +1154,7 @@ int bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
                      const void *buf, int64_t count)
 {
     int ret;
+    IO_CODE();
 
     ret = bdrv_pwrite(child, offset, buf, count);
     if (ret < 0) {
@@ -2332,6 +2350,7 @@ out:
 int coroutine_fn bdrv_co_pwrite_zeroes(BdrvChild *child, int64_t offset,
                                        int64_t bytes, BdrvRequestFlags flags)
 {
+    IO_CODE();
     trace_bdrv_co_pwrite_zeroes(child->bs, offset, bytes, flags);
 
     if (!(child->bs->open_flags & BDRV_O_UNMAP)) {
@@ -2736,6 +2755,7 @@ int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
                             int64_t offset, int64_t bytes, int64_t *pnum,
                             int64_t *map, BlockDriverState **file)
 {
+    IO_CODE();
     return bdrv_common_block_status_above(bs, base, false, true, offset, bytes,
                                           pnum, map, file, NULL);
 }
@@ -2743,6 +2763,7 @@ int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
 int bdrv_block_status(BlockDriverState *bs, int64_t offset, int64_t bytes,
                       int64_t *pnum, int64_t *map, BlockDriverState **file)
 {
+    IO_CODE();
     return bdrv_block_status_above(bs, bdrv_filter_or_cow_bs(bs),
                                    offset, bytes, pnum, map, file);
 }
@@ -2759,6 +2780,7 @@ int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
 {
     int ret;
     int64_t pnum = bytes;
+    IO_CODE();
 
     if (!bytes) {
         return 1;
@@ -2779,6 +2801,7 @@ int coroutine_fn bdrv_is_allocated(BlockDriverState *bs, int64_t offset,
 {
     int ret;
     int64_t dummy;
+    IO_CODE();
 
     ret = bdrv_common_block_status_above(bs, bs, true, false, offset,
                                          bytes, pnum ? pnum : &dummy, NULL,
@@ -2815,6 +2838,7 @@ int bdrv_is_allocated_above(BlockDriverState *top,
     int ret = bdrv_common_block_status_above(top, base, include_base, false,
                                              offset, bytes, pnum, NULL, NULL,
                                              &depth);
+    IO_CODE();
     if (ret < 0) {
         return ret;
     }
@@ -2892,6 +2916,7 @@ int bdrv_save_vmstate(BlockDriverState *bs, const uint8_t *buf,
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, size);
     int ret = bdrv_writev_vmstate(bs, &qiov, pos);
+    IO_CODE();
 
     return ret < 0 ? ret : size;
 }
@@ -2901,6 +2926,7 @@ int bdrv_load_vmstate(BlockDriverState *bs, uint8_t *buf,
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, size);
     int ret = bdrv_readv_vmstate(bs, &qiov, pos);
+    IO_CODE();
 
     return ret < 0 ? ret : size;
 }
@@ -2910,6 +2936,7 @@ int bdrv_load_vmstate(BlockDriverState *bs, uint8_t *buf,
 
 void bdrv_aio_cancel(BlockAIOCB *acb)
 {
+    IO_CODE();
     qemu_aio_ref(acb);
     bdrv_aio_cancel_async(acb);
     while (acb->refcnt > 1) {
@@ -2934,6 +2961,7 @@ void bdrv_aio_cancel(BlockAIOCB *acb)
  * In either case the completion callback must be called. */
 void bdrv_aio_cancel_async(BlockAIOCB *acb)
 {
+    IO_CODE();
     if (acb->aiocb_info->cancel_async) {
         acb->aiocb_info->cancel_async(acb);
     }
@@ -2948,6 +2976,7 @@ int coroutine_fn bdrv_co_flush(BlockDriverState *bs)
     BdrvChild *child;
     int current_gen;
     int ret = 0;
+    IO_CODE();
 
     bdrv_inc_in_flight(bs);
 
@@ -3073,6 +3102,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
     int64_t max_pdiscard;
     int head, tail, align;
     BlockDriverState *bs = child->bs;
+    IO_CODE();
 
     if (!bs || !bs->drv || !bdrv_is_inserted(bs)) {
         return -ENOMEDIUM;
@@ -3191,6 +3221,7 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf)
         .coroutine = qemu_coroutine_self(),
     };
     BlockAIOCB *acb;
+    IO_CODE();
 
     bdrv_inc_in_flight(bs);
     if (!drv || (!drv->bdrv_aio_ioctl && !drv->bdrv_co_ioctl)) {
@@ -3215,17 +3246,20 @@ out:
 
 void *qemu_blockalign(BlockDriverState *bs, size_t size)
 {
+    IO_CODE();
     return qemu_memalign(bdrv_opt_mem_align(bs), size);
 }
 
 void *qemu_blockalign0(BlockDriverState *bs, size_t size)
 {
+    IO_CODE();
     return memset(qemu_blockalign(bs, size), 0, size);
 }
 
 void *qemu_try_blockalign(BlockDriverState *bs, size_t size)
 {
     size_t align = bdrv_opt_mem_align(bs);
+    IO_CODE();
 
     /* Ensure that NULL is never returned on success */
     assert(align > 0);
@@ -3239,6 +3273,7 @@ void *qemu_try_blockalign(BlockDriverState *bs, size_t size)
 void *qemu_try_blockalign0(BlockDriverState *bs, size_t size)
 {
     void *mem = qemu_try_blockalign(bs, size);
+    IO_CODE();
 
     if (mem) {
         memset(mem, 0, size);
@@ -3254,6 +3289,7 @@ bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
 {
     int i;
     size_t alignment = bdrv_min_mem_align(bs);
+    IO_CODE();
 
     for (i = 0; i < qiov->niov; i++) {
         if ((uintptr_t) qiov->iov[i].iov_base % alignment) {
@@ -3270,6 +3306,7 @@ bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
 void bdrv_io_plug(BlockDriverState *bs)
 {
     BdrvChild *child;
+    IO_CODE();
 
     QLIST_FOREACH(child, &bs->children, next) {
         bdrv_io_plug(child->bs);
@@ -3286,6 +3323,7 @@ void bdrv_io_plug(BlockDriverState *bs)
 void bdrv_io_unplug(BlockDriverState *bs)
 {
     BdrvChild *child;
+    IO_CODE();
 
     assert(bs->io_plugged);
     if (qatomic_fetch_dec(&bs->io_plugged) == 1) {
@@ -3439,6 +3477,7 @@ int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
                                     int64_t bytes, BdrvRequestFlags read_flags,
                                     BdrvRequestFlags write_flags)
 {
+    IO_CODE();
     return bdrv_co_copy_range_from(src, src_offset,
                                    dst, dst_offset,
                                    bytes, read_flags, write_flags);
@@ -3471,7 +3510,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
     BdrvTrackedRequest req;
     int64_t old_size, new_bytes;
     int ret;
-
+    IO_CODE();
 
     /* if bs->drv == NULL, bs is closed, so there's nothing to do here */
     if (!drv) {
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 54369103c8..23da97d68f 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -264,6 +264,7 @@ void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_counter);
 
 #define BDRV_POLL_WHILE(bs, cond) ({                       \
     BlockDriverState *bs_ = (bs);                          \
+    IO_OR_GS_CODE();                                       \
     AIO_WAIT_WHILE(bdrv_get_aio_context(bs_),              \
                    cond); })
 
-- 
2.31.1


