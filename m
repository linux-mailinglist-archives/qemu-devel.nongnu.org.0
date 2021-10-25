Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412284393B3
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:29:28 +0200 (CEST)
Received: from localhost ([::1]:54868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexEM-0000hk-PH
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex3r-00052W-2w
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:18:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex3m-0006dA-VF
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:18:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635157110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cz2cd5kwCIs4xkAyyBKyMMefQFuuIvsEpTw6OMBWVDc=;
 b=JJXdA7B7op0nWkfOGRbZn4Ibzc0WPGkx6cekzc5XU3cEEoxazAu8rhXZYKHT1sxcA9LeI2
 ChOAf+K/GNRqC/ydH7tdvVyYVF3ZCa7wM+9tqSdVxDxsyIlHzx8c7nM6ttsoMPrZU0KPFR
 GkjgAh4t1z6fzpj+VKdb7d2HttwJ01Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-vSRkdXN_OaSgiYb-DoH2pA-1; Mon, 25 Oct 2021 06:18:29 -0400
X-MC-Unique: vSRkdXN_OaSgiYb-DoH2pA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D00610A8E00;
 Mon, 25 Oct 2021 10:18:28 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C90955D9D5;
 Mon, 25 Oct 2021 10:18:16 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 05/25] block/block-backend.c: assertions for block-backend
Date: Mon, 25 Oct 2021 06:17:15 -0400
Message-Id: <20211025101735.2060852-6-eesposit@redhat.com>
In-Reply-To: <20211025101735.2060852-1-eesposit@redhat.com>
References: <20211025101735.2060852-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All the global state (GS) API functions will check that
qemu_in_main_thread() returns true. If not, it means
that the safety of BQL cannot be guaranteed, and
they need to be moved to I/O.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/block-backend.c  | 90 +++++++++++++++++++++++++++++++++++++++++-
 softmmu/qdev-monitor.c |  2 +
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 0afc03fd66..ed45576007 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -228,6 +228,7 @@ static void blk_root_activate(BdrvChild *child, Error **errp)
 
 void blk_set_force_allow_inactivate(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     blk->force_allow_inactivate = true;
 }
 
@@ -346,6 +347,8 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
 {
     BlockBackend *blk;
 
+    assert(qemu_in_main_thread());
+
     blk = g_new0(BlockBackend, 1);
     blk->refcnt = 1;
     blk->ctx = ctx;
@@ -383,6 +386,8 @@ BlockBackend *blk_new_with_bs(BlockDriverState *bs, uint64_t perm,
 {
     BlockBackend *blk = blk_new(bdrv_get_aio_context(bs), perm, shared_perm);
 
+    assert(qemu_in_main_thread());
+
     if (blk_insert_bs(blk, bs, errp) < 0) {
         blk_unref(blk);
         return NULL;
@@ -411,6 +416,8 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
     uint64_t perm = 0;
     uint64_t shared = BLK_PERM_ALL;
 
+    assert(qemu_in_main_thread());
+
     /*
      * blk_new_open() is mainly used in .bdrv_create implementations and the
      * tools where sharing isn't a major concern because the BDS stays private
@@ -488,6 +495,7 @@ static void drive_info_del(DriveInfo *dinfo)
 
 int blk_get_refcnt(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk ? blk->refcnt : 0;
 }
 
@@ -498,6 +506,7 @@ int blk_get_refcnt(BlockBackend *blk)
 void blk_ref(BlockBackend *blk)
 {
     assert(blk->refcnt > 0);
+    assert(qemu_in_main_thread());
     blk->refcnt++;
 }
 
@@ -508,6 +517,7 @@ void blk_ref(BlockBackend *blk)
  */
 void blk_unref(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     if (blk) {
         assert(blk->refcnt > 0);
         if (blk->refcnt > 1) {
@@ -528,6 +538,7 @@ void blk_unref(BlockBackend *blk)
  */
 BlockBackend *blk_all_next(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk ? QTAILQ_NEXT(blk, link)
                : QTAILQ_FIRST(&block_backends);
 }
@@ -536,6 +547,8 @@ void blk_remove_all_bs(void)
 {
     BlockBackend *blk = NULL;
 
+    assert(qemu_in_main_thread());
+
     while ((blk = blk_all_next(blk)) != NULL) {
         AioContext *ctx = blk_get_aio_context(blk);
 
@@ -559,6 +572,7 @@ void blk_remove_all_bs(void)
  */
 BlockBackend *blk_next(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk ? QTAILQ_NEXT(blk, monitor_link)
                : QTAILQ_FIRST(&monitor_block_backends);
 }
@@ -625,6 +639,7 @@ static void bdrv_next_reset(BdrvNextIterator *it)
 
 BlockDriverState *bdrv_first(BdrvNextIterator *it)
 {
+    assert(qemu_in_main_thread());
     bdrv_next_reset(it);
     return bdrv_next(it);
 }
@@ -662,6 +677,7 @@ bool monitor_add_blk(BlockBackend *blk, const char *name, Error **errp)
 {
     assert(!blk->name);
     assert(name && name[0]);
+    assert(qemu_in_main_thread());
 
     if (!id_wellformed(name)) {
         error_setg(errp, "Invalid device name");
@@ -689,6 +705,8 @@ bool monitor_add_blk(BlockBackend *blk, const char *name, Error **errp)
  */
 void monitor_remove_blk(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
+
     if (!blk->name) {
         return;
     }
@@ -704,6 +722,7 @@ void monitor_remove_blk(BlockBackend *blk)
  */
 const char *blk_name(const BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk->name ?: "";
 }
 
@@ -715,6 +734,7 @@ BlockBackend *blk_by_name(const char *name)
 {
     BlockBackend *blk = NULL;
 
+    assert(qemu_in_main_thread());
     assert(name);
     while ((blk = blk_next(blk)) != NULL) {
         if (!strcmp(name, blk->name)) {
@@ -749,6 +769,7 @@ static BlockBackend *bdrv_first_blk(BlockDriverState *bs)
  */
 bool bdrv_has_blk(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     return bdrv_first_blk(bs) != NULL;
 }
 
@@ -759,6 +780,7 @@ bool bdrv_is_root_node(BlockDriverState *bs)
 {
     BdrvChild *c;
 
+    assert(qemu_in_main_thread());
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         if (c->klass != &child_root) {
             return false;
@@ -808,6 +830,7 @@ BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo)
  */
 BlockBackendPublic *blk_get_public(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return &blk->public;
 }
 
@@ -816,6 +839,7 @@ BlockBackendPublic *blk_get_public(BlockBackend *blk)
  */
 BlockBackend *blk_by_public(BlockBackendPublic *public)
 {
+    assert(qemu_in_main_thread());
     return container_of(public, BlockBackend, public);
 }
 
@@ -828,6 +852,8 @@ void blk_remove_bs(BlockBackend *blk)
     BlockDriverState *bs;
     BdrvChild *root;
 
+    assert(qemu_in_main_thread());
+
     notifier_list_notify(&blk->remove_bs_notifiers, blk);
     if (tgm->throttle_state) {
         bs = blk_bs(blk);
@@ -855,6 +881,7 @@ void blk_remove_bs(BlockBackend *blk)
 int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
 {
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
+    assert(qemu_in_main_thread());
     bdrv_ref(bs);
     blk->root = bdrv_root_attach_child(bs, "root", &child_root,
                                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -889,6 +916,7 @@ int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
 {
     int ret;
 
+    assert(qemu_in_main_thread());
     if (blk->root && !blk->disable_perm) {
         ret = bdrv_child_try_set_perm(blk->root, perm, shared_perm, errp);
         if (ret < 0) {
@@ -904,6 +932,7 @@ int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
 
 void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
 {
+    assert(qemu_in_main_thread());
     *perm = blk->perm;
     *shared_perm = blk->shared_perm;
 }
@@ -914,6 +943,7 @@ void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
  */
 int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
 {
+    assert(qemu_in_main_thread());
     if (blk->dev) {
         return -EBUSY;
     }
@@ -939,6 +969,7 @@ int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
 void blk_detach_dev(BlockBackend *blk, DeviceState *dev)
 {
     assert(blk->dev == dev);
+    assert(qemu_in_main_thread());
     blk->dev = NULL;
     blk->dev_ops = NULL;
     blk->dev_opaque = NULL;
@@ -952,6 +983,7 @@ void blk_detach_dev(BlockBackend *blk, DeviceState *dev)
  */
 DeviceState *blk_get_attached_dev(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk->dev;
 }
 
@@ -960,6 +992,7 @@ DeviceState *blk_get_attached_dev(BlockBackend *blk)
 char *blk_get_attached_dev_id(BlockBackend *blk)
 {
     DeviceState *dev = blk->dev;
+    assert(qemu_in_main_thread());
 
     if (!dev) {
         return g_strdup("");
@@ -980,6 +1013,8 @@ BlockBackend *blk_by_dev(void *dev)
 {
     BlockBackend *blk = NULL;
 
+    assert(qemu_in_main_thread());
+
     assert(dev != NULL);
     while ((blk = blk_all_next(blk)) != NULL) {
         if (blk->dev == dev) {
@@ -997,6 +1032,7 @@ BlockBackend *blk_by_dev(void *dev)
 void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
                      void *opaque)
 {
+    assert(qemu_in_main_thread());
     blk->dev_ops = ops;
     blk->dev_opaque = opaque;
 
@@ -1018,6 +1054,7 @@ void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
  */
 void blk_dev_change_media_cb(BlockBackend *blk, bool load, Error **errp)
 {
+    assert(qemu_in_main_thread());
     if (blk->dev_ops && blk->dev_ops->change_media_cb) {
         bool tray_was_open, tray_is_open;
         Error *local_err = NULL;
@@ -1109,6 +1146,7 @@ static void blk_root_resize(BdrvChild *child)
 
 void blk_iostatus_enable(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     blk->iostatus_enabled = true;
     blk->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
 }
@@ -1117,6 +1155,7 @@ void blk_iostatus_enable(BlockBackend *blk)
  * enables it _and_ the VM is configured to stop on errors */
 bool blk_iostatus_is_enabled(const BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return (blk->iostatus_enabled &&
            (blk->on_write_error == BLOCKDEV_ON_ERROR_ENOSPC ||
             blk->on_write_error == BLOCKDEV_ON_ERROR_STOP   ||
@@ -1125,16 +1164,19 @@ bool blk_iostatus_is_enabled(const BlockBackend *blk)
 
 BlockDeviceIoStatus blk_iostatus(const BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk->iostatus;
 }
 
 void blk_iostatus_disable(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     blk->iostatus_enabled = false;
 }
 
 void blk_iostatus_reset(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     if (blk_iostatus_is_enabled(blk)) {
         blk->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
     }
@@ -1142,6 +1184,7 @@ void blk_iostatus_reset(BlockBackend *blk)
 
 void blk_iostatus_set_err(BlockBackend *blk, int error)
 {
+    assert(qemu_in_main_thread());
     assert(blk_iostatus_is_enabled(blk));
     if (blk->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
         blk->iostatus = error == ENOSPC ? BLOCK_DEVICE_IO_STATUS_NOSPACE :
@@ -1341,6 +1384,7 @@ int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
 
 int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
 {
+    assert(qemu_in_main_thread());
     return bdrv_make_zero(blk->root, flags);
 }
 
@@ -1369,6 +1413,7 @@ BlockAIOCB *blk_abort_aio_request(BlockBackend *blk,
                                   void *opaque, int ret)
 {
     struct BlockBackendAIOCB *acb;
+    assert(qemu_in_main_thread());
 
     blk_inc_in_flight(blk);
     acb = blk_aio_get(&block_backend_aiocb_info, blk, cb, opaque);
@@ -1523,6 +1568,7 @@ void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr)
 
 int64_t blk_nb_sectors(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
@@ -1550,6 +1596,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
 
 void blk_aio_cancel(BlockAIOCB *acb)
 {
+    assert(qemu_in_main_thread());
     bdrv_aio_cancel(acb);
 }
 
@@ -1707,6 +1754,8 @@ void blk_drain(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
 
+    assert(qemu_in_main_thread());
+
     if (bs) {
         bdrv_drained_begin(bs);
     }
@@ -1724,6 +1773,8 @@ void blk_drain_all(void)
 {
     BlockBackend *blk = NULL;
 
+    assert(qemu_in_main_thread());
+
     bdrv_drain_all_begin();
 
     while ((blk = blk_all_next(blk)) != NULL) {
@@ -1743,6 +1794,7 @@ void blk_drain_all(void)
 void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
                       BlockdevOnError on_write_error)
 {
+    assert(qemu_in_main_thread());
     blk->on_read_error = on_read_error;
     blk->on_write_error = on_write_error;
 }
@@ -1826,6 +1878,7 @@ void blk_error_action(BlockBackend *blk, BlockErrorAction action,
 bool blk_supports_write_perm(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (bs) {
         return !bdrv_is_read_only(bs);
@@ -1846,6 +1899,7 @@ bool blk_is_writable(BlockBackend *blk)
 bool blk_is_sg(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (!bs) {
         return false;
@@ -1856,17 +1910,20 @@ bool blk_is_sg(BlockBackend *blk)
 
 bool blk_enable_write_cache(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk->enable_write_cache;
 }
 
 void blk_set_enable_write_cache(BlockBackend *blk, bool wce)
 {
+    assert(qemu_in_main_thread());
     blk->enable_write_cache = wce;
 }
 
 void blk_invalidate_cache(BlockBackend *blk, Error **errp)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (!bs) {
         error_setg(errp, "Device '%s' has no medium", blk->name);
@@ -1879,7 +1936,6 @@ void blk_invalidate_cache(BlockBackend *blk, Error **errp)
 bool blk_is_inserted(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
-
     return bs && bdrv_is_inserted(bs);
 }
 
@@ -1891,6 +1947,7 @@ bool blk_is_available(BlockBackend *blk)
 void blk_lock_medium(BlockBackend *blk, bool locked)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (bs) {
         bdrv_lock_medium(bs, locked);
@@ -1900,6 +1957,8 @@ void blk_lock_medium(BlockBackend *blk, bool locked)
 void blk_eject(BlockBackend *blk, bool eject_flag)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
+
     char *id;
 
     if (bs) {
@@ -1917,6 +1976,7 @@ void blk_eject(BlockBackend *blk, bool eject_flag)
 int blk_get_flags(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (bs) {
         return bdrv_get_flags(bs);
@@ -1970,6 +2030,7 @@ int blk_get_max_iov(BlockBackend *blk)
 
 void blk_set_guest_block_size(BlockBackend *blk, int align)
 {
+    assert(qemu_in_main_thread());
     blk->guest_block_size = align;
 }
 
@@ -1986,6 +2047,7 @@ void *blk_blockalign(BlockBackend *blk, size_t size)
 bool blk_op_is_blocked(BlockBackend *blk, BlockOpType op, Error **errp)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (!bs) {
         return false;
@@ -1997,6 +2059,7 @@ bool blk_op_is_blocked(BlockBackend *blk, BlockOpType op, Error **errp)
 void blk_op_unblock(BlockBackend *blk, BlockOpType op, Error *reason)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (bs) {
         bdrv_op_unblock(bs, op, reason);
@@ -2006,6 +2069,7 @@ void blk_op_unblock(BlockBackend *blk, BlockOpType op, Error *reason)
 void blk_op_block_all(BlockBackend *blk, Error *reason)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (bs) {
         bdrv_op_block_all(bs, reason);
@@ -2015,6 +2079,7 @@ void blk_op_block_all(BlockBackend *blk, Error *reason)
 void blk_op_unblock_all(BlockBackend *blk, Error *reason)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (bs) {
         bdrv_op_unblock_all(bs, reason);
@@ -2069,6 +2134,7 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
 int blk_set_aio_context(BlockBackend *blk, AioContext *new_context,
                         Error **errp)
 {
+    assert(qemu_in_main_thread());
     return blk_do_set_aio_context(blk, new_context, true, errp);
 }
 
@@ -2105,6 +2171,7 @@ void blk_add_aio_context_notifier(BlockBackend *blk,
 {
     BlockBackendAioNotifier *notifier;
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     notifier = g_new(BlockBackendAioNotifier, 1);
     notifier->attached_aio_context = attached_aio_context;
@@ -2127,6 +2194,8 @@ void blk_remove_aio_context_notifier(BlockBackend *blk,
     BlockBackendAioNotifier *notifier;
     BlockDriverState *bs = blk_bs(blk);
 
+    assert(qemu_in_main_thread());
+
     if (bs) {
         bdrv_remove_aio_context_notifier(bs, attached_aio_context,
                                          detach_aio_context, opaque);
@@ -2147,11 +2216,13 @@ void blk_remove_aio_context_notifier(BlockBackend *blk,
 
 void blk_add_remove_bs_notifier(BlockBackend *blk, Notifier *notify)
 {
+    assert(qemu_in_main_thread());
     notifier_list_add(&blk->remove_bs_notifiers, notify);
 }
 
 void blk_add_insert_bs_notifier(BlockBackend *blk, Notifier *notify)
 {
+    assert(qemu_in_main_thread());
     notifier_list_add(&blk->insert_bs_notifiers, notify);
 }
 
@@ -2214,6 +2285,7 @@ int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
                      int64_t pos, int size)
 {
     int ret;
+    assert(qemu_in_main_thread());
 
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
@@ -2233,6 +2305,7 @@ int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
 
 int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size)
 {
+    assert(qemu_in_main_thread());
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
@@ -2242,6 +2315,7 @@ int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size)
 
 int blk_probe_blocksizes(BlockBackend *blk, BlockSizes *bsz)
 {
+    assert(qemu_in_main_thread());
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
@@ -2251,6 +2325,7 @@ int blk_probe_blocksizes(BlockBackend *blk, BlockSizes *bsz)
 
 int blk_probe_geometry(BlockBackend *blk, HDGeometry *geo)
 {
+    assert(qemu_in_main_thread());
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
@@ -2264,6 +2339,7 @@ int blk_probe_geometry(BlockBackend *blk, HDGeometry *geo)
  */
 void blk_update_root_state(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     assert(blk->root);
 
     blk->root_state.open_flags    = blk->root->bs->open_flags;
@@ -2276,6 +2352,7 @@ void blk_update_root_state(BlockBackend *blk)
  */
 bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk->root_state.detect_zeroes;
 }
 
@@ -2285,17 +2362,20 @@ bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk)
  */
 int blk_get_open_flags_from_root_state(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk->root_state.open_flags;
 }
 
 BlockBackendRootState *blk_get_root_state(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return &blk->root_state;
 }
 
 int blk_commit_all(void)
 {
     BlockBackend *blk = NULL;
+    assert(qemu_in_main_thread());
 
     while ((blk = blk_all_next(blk)) != NULL) {
         AioContext *aio_context = blk_get_aio_context(blk);
@@ -2320,6 +2400,7 @@ int blk_commit_all(void)
 /* throttling disk I/O limits */
 void blk_set_io_limits(BlockBackend *blk, ThrottleConfig *cfg)
 {
+    assert(qemu_in_main_thread());
     throttle_group_config(&blk->public.throttle_group_member, cfg);
 }
 
@@ -2328,6 +2409,7 @@ void blk_io_limits_disable(BlockBackend *blk)
     BlockDriverState *bs = blk_bs(blk);
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
     assert(tgm->throttle_state);
+    assert(qemu_in_main_thread());
     if (bs) {
         bdrv_drained_begin(bs);
     }
@@ -2341,12 +2423,14 @@ void blk_io_limits_disable(BlockBackend *blk)
 void blk_io_limits_enable(BlockBackend *blk, const char *group)
 {
     assert(!blk->public.throttle_group_member.throttle_state);
+    assert(qemu_in_main_thread());
     throttle_group_register_tgm(&blk->public.throttle_group_member,
                                 group, blk_get_aio_context(blk));
 }
 
 void blk_io_limits_update_group(BlockBackend *blk, const char *group)
 {
+    assert(qemu_in_main_thread());
     /* this BB is not part of any group */
     if (!blk->public.throttle_group_member.throttle_state) {
         return;
@@ -2414,11 +2498,13 @@ static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter)
 
 void blk_register_buf(BlockBackend *blk, void *host, size_t size)
 {
+    assert(qemu_in_main_thread());
     bdrv_register_buf(blk_bs(blk), host, size);
 }
 
 void blk_unregister_buf(BlockBackend *blk, void *host)
 {
+    assert(qemu_in_main_thread());
     bdrv_unregister_buf(blk_bs(blk), host);
 }
 
@@ -2443,11 +2529,13 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
 
 const BdrvChild *blk_root(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk->root;
 }
 
 int blk_make_empty(BlockBackend *blk, Error **errp)
 {
+    assert(qemu_in_main_thread());
     if (!blk_is_available(blk)) {
         error_setg(errp, "No medium inserted");
         return -ENOMEDIUM;
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 4851de51a5..71cb6a549b 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -963,6 +963,8 @@ BlockBackend *blk_by_qdev_id(const char *id, Error **errp)
     DeviceState *dev;
     BlockBackend *blk;
 
+    assert(qemu_in_main_thread());
+
     dev = find_device_state(id, errp);
     if (dev == NULL) {
         return NULL;
-- 
2.27.0


