Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9664B28AD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 16:05:03 +0100 (CET)
Received: from localhost ([::1]:49994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIXTq-00023l-NA
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 10:05:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHr-0003Y3-Fu
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHj-0001jj-4H
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644591134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yg30KyYyk2W81OBL7XASfoZ64XITuLFe48+yIUt5SAU=;
 b=EnE/T+4pscznJXlMRefoN/JwJIJWKaUwllqPbc3fEnBfx+XbTIsBKxwYIvgymp5TWKq3vn
 3hYbsGMlIj+noQmgKbIEauhUYOJYsu25dKHUDgw8+McHPoWO8fHjUlJWAEs2+/0WnPToNr
 Qdal19a8tXgWNPw9+vVdZm2mE/BlhwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-vIIp6RG1M7Ot3W0EmdhJAw-1; Fri, 11 Feb 2022 09:52:09 -0500
X-MC-Unique: vIIp6RG1M7Ot3W0EmdhJAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D00721091DAE;
 Fri, 11 Feb 2022 14:52:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F99F8379F;
 Fri, 11 Feb 2022 14:52:06 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 08/31] block/block-backend.c: assertions for block-backend
Date: Fri, 11 Feb 2022 09:51:30 -0500
Message-Id: <20220211145153.2861415-9-eesposit@redhat.com>
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

All the global state (GS) API functions will check that
qemu_in_main_thread() returns true. If not, it means
that the safety of BQL cannot be guaranteed, and
they need to be moved to I/O.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c  | 79 ++++++++++++++++++++++++++++++++++++++++++
 softmmu/qdev-monitor.c |  2 ++
 2 files changed, 81 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index 462e18facf..ebfc3fe954 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -239,6 +239,7 @@ static void blk_root_activate(BdrvChild *child, Error **errp)
 
 void blk_set_force_allow_inactivate(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     blk->force_allow_inactivate = true;
 }
 
@@ -357,6 +358,8 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
 {
     BlockBackend *blk;
 
+    GLOBAL_STATE_CODE();
+
     blk = g_new0(BlockBackend, 1);
     blk->refcnt = 1;
     blk->ctx = ctx;
@@ -394,6 +397,8 @@ BlockBackend *blk_new_with_bs(BlockDriverState *bs, uint64_t perm,
 {
     BlockBackend *blk = blk_new(bdrv_get_aio_context(bs), perm, shared_perm);
 
+    GLOBAL_STATE_CODE();
+
     if (blk_insert_bs(blk, bs, errp) < 0) {
         blk_unref(blk);
         return NULL;
@@ -422,6 +427,8 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
     uint64_t perm = 0;
     uint64_t shared = BLK_PERM_ALL;
 
+    GLOBAL_STATE_CODE();
+
     /*
      * blk_new_open() is mainly used in .bdrv_create implementations and the
      * tools where sharing isn't a major concern because the BDS stays private
@@ -499,6 +506,7 @@ static void drive_info_del(DriveInfo *dinfo)
 
 int blk_get_refcnt(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     return blk ? blk->refcnt : 0;
 }
 
@@ -509,6 +517,7 @@ int blk_get_refcnt(BlockBackend *blk)
 void blk_ref(BlockBackend *blk)
 {
     assert(blk->refcnt > 0);
+    GLOBAL_STATE_CODE();
     blk->refcnt++;
 }
 
@@ -519,6 +528,7 @@ void blk_ref(BlockBackend *blk)
  */
 void blk_unref(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     if (blk) {
         assert(blk->refcnt > 0);
         if (blk->refcnt > 1) {
@@ -539,6 +549,7 @@ void blk_unref(BlockBackend *blk)
  */
 BlockBackend *blk_all_next(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     return blk ? QTAILQ_NEXT(blk, link)
                : QTAILQ_FIRST(&block_backends);
 }
@@ -547,6 +558,8 @@ void blk_remove_all_bs(void)
 {
     BlockBackend *blk = NULL;
 
+    GLOBAL_STATE_CODE();
+
     while ((blk = blk_all_next(blk)) != NULL) {
         AioContext *ctx = blk_get_aio_context(blk);
 
@@ -570,6 +583,7 @@ void blk_remove_all_bs(void)
  */
 BlockBackend *blk_next(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     return blk ? QTAILQ_NEXT(blk, monitor_link)
                : QTAILQ_FIRST(&monitor_block_backends);
 }
@@ -636,6 +650,7 @@ static void bdrv_next_reset(BdrvNextIterator *it)
 
 BlockDriverState *bdrv_first(BdrvNextIterator *it)
 {
+    GLOBAL_STATE_CODE();
     bdrv_next_reset(it);
     return bdrv_next(it);
 }
@@ -673,6 +688,7 @@ bool monitor_add_blk(BlockBackend *blk, const char *name, Error **errp)
 {
     assert(!blk->name);
     assert(name && name[0]);
+    GLOBAL_STATE_CODE();
 
     if (!id_wellformed(name)) {
         error_setg(errp, "Invalid device name");
@@ -700,6 +716,8 @@ bool monitor_add_blk(BlockBackend *blk, const char *name, Error **errp)
  */
 void monitor_remove_blk(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
+
     if (!blk->name) {
         return;
     }
@@ -726,6 +744,7 @@ BlockBackend *blk_by_name(const char *name)
 {
     BlockBackend *blk = NULL;
 
+    GLOBAL_STATE_CODE();
     assert(name);
     while ((blk = blk_next(blk)) != NULL) {
         if (!strcmp(name, blk->name)) {
@@ -760,6 +779,7 @@ static BlockBackend *bdrv_first_blk(BlockDriverState *bs)
  */
 bool bdrv_has_blk(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     return bdrv_first_blk(bs) != NULL;
 }
 
@@ -770,6 +790,7 @@ bool bdrv_is_root_node(BlockDriverState *bs)
 {
     BdrvChild *c;
 
+    GLOBAL_STATE_CODE();
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         if (c->klass != &child_root) {
             return false;
@@ -819,6 +840,7 @@ BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo)
  */
 BlockBackendPublic *blk_get_public(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     return &blk->public;
 }
 
@@ -827,6 +849,7 @@ BlockBackendPublic *blk_get_public(BlockBackend *blk)
  */
 BlockBackend *blk_by_public(BlockBackendPublic *public)
 {
+    GLOBAL_STATE_CODE();
     return container_of(public, BlockBackend, public);
 }
 
@@ -838,6 +861,8 @@ void blk_remove_bs(BlockBackend *blk)
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
     BdrvChild *root;
 
+    GLOBAL_STATE_CODE();
+
     notifier_list_notify(&blk->remove_bs_notifiers, blk);
     if (tgm->throttle_state) {
         BlockDriverState *bs = blk_bs(blk);
@@ -872,6 +897,7 @@ void blk_remove_bs(BlockBackend *blk)
 int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
 {
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
+    GLOBAL_STATE_CODE();
     bdrv_ref(bs);
     blk->root = bdrv_root_attach_child(bs, "root", &child_root,
                                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -895,6 +921,7 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
  */
 int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp)
 {
+    GLOBAL_STATE_CODE();
     return bdrv_replace_child_bs(blk->root, new_bs, errp);
 }
 
@@ -905,6 +932,7 @@ int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
                  Error **errp)
 {
     int ret;
+    GLOBAL_STATE_CODE();
 
     if (blk->root && !blk->disable_perm) {
         ret = bdrv_child_try_set_perm(blk->root, perm, shared_perm, errp);
@@ -921,6 +949,7 @@ int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
 
 void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
 {
+    GLOBAL_STATE_CODE();
     *perm = blk->perm;
     *shared_perm = blk->shared_perm;
 }
@@ -931,6 +960,7 @@ void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
  */
 int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
 {
+    GLOBAL_STATE_CODE();
     if (blk->dev) {
         return -EBUSY;
     }
@@ -956,6 +986,7 @@ int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
 void blk_detach_dev(BlockBackend *blk, DeviceState *dev)
 {
     assert(blk->dev == dev);
+    GLOBAL_STATE_CODE();
     blk->dev = NULL;
     blk->dev_ops = NULL;
     blk->dev_opaque = NULL;
@@ -969,6 +1000,7 @@ void blk_detach_dev(BlockBackend *blk, DeviceState *dev)
  */
 DeviceState *blk_get_attached_dev(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     return blk->dev;
 }
 
@@ -997,6 +1029,8 @@ BlockBackend *blk_by_dev(void *dev)
 {
     BlockBackend *blk = NULL;
 
+    GLOBAL_STATE_CODE();
+
     assert(dev != NULL);
     while ((blk = blk_all_next(blk)) != NULL) {
         if (blk->dev == dev) {
@@ -1014,6 +1048,7 @@ BlockBackend *blk_by_dev(void *dev)
 void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
                      void *opaque)
 {
+    GLOBAL_STATE_CODE();
     blk->dev_ops = ops;
     blk->dev_opaque = opaque;
 
@@ -1035,6 +1070,7 @@ void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
  */
 void blk_dev_change_media_cb(BlockBackend *blk, bool load, Error **errp)
 {
+    GLOBAL_STATE_CODE();
     if (blk->dev_ops && blk->dev_ops->change_media_cb) {
         bool tray_was_open, tray_is_open;
         Error *local_err = NULL;
@@ -1126,6 +1162,7 @@ static void blk_root_resize(BdrvChild *child)
 
 void blk_iostatus_enable(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     blk->iostatus_enabled = true;
     blk->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
 }
@@ -1134,6 +1171,7 @@ void blk_iostatus_enable(BlockBackend *blk)
  * enables it _and_ the VM is configured to stop on errors */
 bool blk_iostatus_is_enabled(const BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     return (blk->iostatus_enabled &&
            (blk->on_write_error == BLOCKDEV_ON_ERROR_ENOSPC ||
             blk->on_write_error == BLOCKDEV_ON_ERROR_STOP   ||
@@ -1142,16 +1180,19 @@ bool blk_iostatus_is_enabled(const BlockBackend *blk)
 
 BlockDeviceIoStatus blk_iostatus(const BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     return blk->iostatus;
 }
 
 void blk_iostatus_disable(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     blk->iostatus_enabled = false;
 }
 
 void blk_iostatus_reset(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     if (blk_iostatus_is_enabled(blk)) {
         blk->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
     }
@@ -1159,6 +1200,7 @@ void blk_iostatus_reset(BlockBackend *blk)
 
 void blk_iostatus_set_err(BlockBackend *blk, int error)
 {
+    GLOBAL_STATE_CODE();
     assert(blk_iostatus_is_enabled(blk));
     if (blk->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
         blk->iostatus = error == ENOSPC ? BLOCK_DEVICE_IO_STATUS_NOSPACE :
@@ -1358,6 +1400,7 @@ int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
 
 int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
 {
+    GLOBAL_STATE_CODE();
     return bdrv_make_zero(blk->root, flags);
 }
 
@@ -1567,6 +1610,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
 
 void blk_aio_cancel(BlockAIOCB *acb)
 {
+    GLOBAL_STATE_CODE();
     bdrv_aio_cancel(acb);
 }
 
@@ -1743,6 +1787,8 @@ void blk_drain_all(void)
 {
     BlockBackend *blk = NULL;
 
+    GLOBAL_STATE_CODE();
+
     bdrv_drain_all_begin();
 
     while ((blk = blk_all_next(blk)) != NULL) {
@@ -1762,6 +1808,7 @@ void blk_drain_all(void)
 void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
                       BlockdevOnError on_write_error)
 {
+    GLOBAL_STATE_CODE();
     blk->on_read_error = on_read_error;
     blk->on_write_error = on_write_error;
 }
@@ -1845,6 +1892,7 @@ void blk_error_action(BlockBackend *blk, BlockErrorAction action,
 bool blk_supports_write_perm(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    GLOBAL_STATE_CODE();
 
     if (bs) {
         return !bdrv_is_read_only(bs);
@@ -1865,6 +1913,7 @@ bool blk_is_writable(BlockBackend *blk)
 bool blk_is_sg(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    GLOBAL_STATE_CODE();
 
     if (!bs) {
         return false;
@@ -1880,12 +1929,14 @@ bool blk_enable_write_cache(BlockBackend *blk)
 
 void blk_set_enable_write_cache(BlockBackend *blk, bool wce)
 {
+    GLOBAL_STATE_CODE();
     blk->enable_write_cache = wce;
 }
 
 void blk_activate(BlockBackend *blk, Error **errp)
 {
     BlockDriverState *bs = blk_bs(blk);
+    GLOBAL_STATE_CODE();
 
     if (!bs) {
         error_setg(errp, "Device '%s' has no medium", blk->name);
@@ -1936,6 +1987,7 @@ void blk_eject(BlockBackend *blk, bool eject_flag)
 int blk_get_flags(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    GLOBAL_STATE_CODE();
 
     if (bs) {
         return bdrv_get_flags(bs);
@@ -2005,6 +2057,7 @@ void *blk_blockalign(BlockBackend *blk, size_t size)
 bool blk_op_is_blocked(BlockBackend *blk, BlockOpType op, Error **errp)
 {
     BlockDriverState *bs = blk_bs(blk);
+    GLOBAL_STATE_CODE();
 
     if (!bs) {
         return false;
@@ -2016,6 +2069,7 @@ bool blk_op_is_blocked(BlockBackend *blk, BlockOpType op, Error **errp)
 void blk_op_unblock(BlockBackend *blk, BlockOpType op, Error *reason)
 {
     BlockDriverState *bs = blk_bs(blk);
+    GLOBAL_STATE_CODE();
 
     if (bs) {
         bdrv_op_unblock(bs, op, reason);
@@ -2025,6 +2079,7 @@ void blk_op_unblock(BlockBackend *blk, BlockOpType op, Error *reason)
 void blk_op_block_all(BlockBackend *blk, Error *reason)
 {
     BlockDriverState *bs = blk_bs(blk);
+    GLOBAL_STATE_CODE();
 
     if (bs) {
         bdrv_op_block_all(bs, reason);
@@ -2034,6 +2089,7 @@ void blk_op_block_all(BlockBackend *blk, Error *reason)
 void blk_op_unblock_all(BlockBackend *blk, Error *reason)
 {
     BlockDriverState *bs = blk_bs(blk);
+    GLOBAL_STATE_CODE();
 
     if (bs) {
         bdrv_op_unblock_all(bs, reason);
@@ -2093,6 +2149,7 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
 int blk_set_aio_context(BlockBackend *blk, AioContext *new_context,
                         Error **errp)
 {
+    GLOBAL_STATE_CODE();
     return blk_do_set_aio_context(blk, new_context, true, errp);
 }
 
@@ -2129,6 +2186,7 @@ void blk_add_aio_context_notifier(BlockBackend *blk,
 {
     BlockBackendAioNotifier *notifier;
     BlockDriverState *bs = blk_bs(blk);
+    GLOBAL_STATE_CODE();
 
     notifier = g_new(BlockBackendAioNotifier, 1);
     notifier->attached_aio_context = attached_aio_context;
@@ -2151,6 +2209,8 @@ void blk_remove_aio_context_notifier(BlockBackend *blk,
     BlockBackendAioNotifier *notifier;
     BlockDriverState *bs = blk_bs(blk);
 
+    GLOBAL_STATE_CODE();
+
     if (bs) {
         bdrv_remove_aio_context_notifier(bs, attached_aio_context,
                                          detach_aio_context, opaque);
@@ -2171,11 +2231,13 @@ void blk_remove_aio_context_notifier(BlockBackend *blk,
 
 void blk_add_remove_bs_notifier(BlockBackend *blk, Notifier *notify)
 {
+    GLOBAL_STATE_CODE();
     notifier_list_add(&blk->remove_bs_notifiers, notify);
 }
 
 void blk_add_insert_bs_notifier(BlockBackend *blk, Notifier *notify)
 {
+    GLOBAL_STATE_CODE();
     notifier_list_add(&blk->insert_bs_notifiers, notify);
 }
 
@@ -2238,6 +2300,7 @@ int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
                      int64_t pos, int size)
 {
     int ret;
+    GLOBAL_STATE_CODE();
 
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
@@ -2257,6 +2320,7 @@ int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
 
 int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size)
 {
+    GLOBAL_STATE_CODE();
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
@@ -2266,6 +2330,7 @@ int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size)
 
 int blk_probe_blocksizes(BlockBackend *blk, BlockSizes *bsz)
 {
+    GLOBAL_STATE_CODE();
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
@@ -2275,6 +2340,7 @@ int blk_probe_blocksizes(BlockBackend *blk, BlockSizes *bsz)
 
 int blk_probe_geometry(BlockBackend *blk, HDGeometry *geo)
 {
+    GLOBAL_STATE_CODE();
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
@@ -2288,6 +2354,7 @@ int blk_probe_geometry(BlockBackend *blk, HDGeometry *geo)
  */
 void blk_update_root_state(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     assert(blk->root);
 
     blk->root_state.open_flags    = blk->root->bs->open_flags;
@@ -2300,6 +2367,7 @@ void blk_update_root_state(BlockBackend *blk)
  */
 bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     return blk->root_state.detect_zeroes;
 }
 
@@ -2309,17 +2377,20 @@ bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk)
  */
 int blk_get_open_flags_from_root_state(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     return blk->root_state.open_flags;
 }
 
 BlockBackendRootState *blk_get_root_state(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     return &blk->root_state;
 }
 
 int blk_commit_all(void)
 {
     BlockBackend *blk = NULL;
+    GLOBAL_STATE_CODE();
 
     while ((blk = blk_all_next(blk)) != NULL) {
         AioContext *aio_context = blk_get_aio_context(blk);
@@ -2344,6 +2415,7 @@ int blk_commit_all(void)
 /* throttling disk I/O limits */
 void blk_set_io_limits(BlockBackend *blk, ThrottleConfig *cfg)
 {
+    GLOBAL_STATE_CODE();
     throttle_group_config(&blk->public.throttle_group_member, cfg);
 }
 
@@ -2352,6 +2424,7 @@ void blk_io_limits_disable(BlockBackend *blk)
     BlockDriverState *bs = blk_bs(blk);
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
     assert(tgm->throttle_state);
+    GLOBAL_STATE_CODE();
     if (bs) {
         bdrv_ref(bs);
         bdrv_drained_begin(bs);
@@ -2367,12 +2440,14 @@ void blk_io_limits_disable(BlockBackend *blk)
 void blk_io_limits_enable(BlockBackend *blk, const char *group)
 {
     assert(!blk->public.throttle_group_member.throttle_state);
+    GLOBAL_STATE_CODE();
     throttle_group_register_tgm(&blk->public.throttle_group_member,
                                 group, blk_get_aio_context(blk));
 }
 
 void blk_io_limits_update_group(BlockBackend *blk, const char *group)
 {
+    GLOBAL_STATE_CODE();
     /* this BB is not part of any group */
     if (!blk->public.throttle_group_member.throttle_state) {
         return;
@@ -2440,11 +2515,13 @@ static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter)
 
 void blk_register_buf(BlockBackend *blk, void *host, size_t size)
 {
+    GLOBAL_STATE_CODE();
     bdrv_register_buf(blk_bs(blk), host, size);
 }
 
 void blk_unregister_buf(BlockBackend *blk, void *host)
 {
+    GLOBAL_STATE_CODE();
     bdrv_unregister_buf(blk_bs(blk), host);
 }
 
@@ -2469,11 +2546,13 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
 
 const BdrvChild *blk_root(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     return blk->root;
 }
 
 int blk_make_empty(BlockBackend *blk, Error **errp)
 {
+    GLOBAL_STATE_CODE();
     if (!blk_is_available(blk)) {
         error_setg(errp, "No medium inserted");
         return -ENOMEDIUM;
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 01f3834db5..ff14af8396 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -971,6 +971,8 @@ BlockBackend *blk_by_qdev_id(const char *id, Error **errp)
     DeviceState *dev;
     BlockBackend *blk;
 
+    GLOBAL_STATE_CODE();
+
     dev = find_device_state(id, errp);
     if (dev == NULL) {
         return NULL;
-- 
2.31.1


