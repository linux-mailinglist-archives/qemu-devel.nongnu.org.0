Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729D04963A8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 18:18:21 +0100 (CET)
Received: from localhost ([::1]:45924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAxYJ-0003Dm-OK
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 12:18:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxMg-0007Tk-CF
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxMc-0008Ao-Vy
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JkJqoaXGHgc3MR0RofdE8h0UYr3/83XK/h979ei4CH0=;
 b=Jw1CLcHGBg7UBiyx7KVUr9CKKEfWs9tMWrFSkeiMtV6dT3B5HAG0HlYBXPFHsvpPdemCed
 BKzYddvloysYdMffhfCzMwTgLieLiUGG1crhYmqZO+yVne/3qUXH0BAzbcroN/I2zMkRrm
 A2wOJ3BFXEI1cOrBHgeCwJrzg786pBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-cvZ0NpH9OoW5DzJidDtJLQ-1; Fri, 21 Jan 2022 12:06:13 -0500
X-MC-Unique: cvZ0NpH9OoW5DzJidDtJLQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA19419057AF;
 Fri, 21 Jan 2022 17:06:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4160B7EBCA;
 Fri, 21 Jan 2022 17:06:08 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 06/33] block/block-backend.c: assertions for block-backend
Date: Fri, 21 Jan 2022 12:05:17 -0500
Message-Id: <20220121170544.2049944-7-eesposit@redhat.com>
In-Reply-To: <20220121170544.2049944-1-eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
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
index 6f91dcc85d..6c80ae54cc 100644
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
@@ -715,6 +733,7 @@ BlockBackend *blk_by_name(const char *name)
 {
     BlockBackend *blk = NULL;
 
+    assert(qemu_in_main_thread());
     assert(name);
     while ((blk = blk_next(blk)) != NULL) {
         if (!strcmp(name, blk->name)) {
@@ -749,6 +768,7 @@ static BlockBackend *bdrv_first_blk(BlockDriverState *bs)
  */
 bool bdrv_has_blk(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     return bdrv_first_blk(bs) != NULL;
 }
 
@@ -759,6 +779,7 @@ bool bdrv_is_root_node(BlockDriverState *bs)
 {
     BdrvChild *c;
 
+    assert(qemu_in_main_thread());
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         if (c->klass != &child_root) {
             return false;
@@ -808,6 +829,7 @@ BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo)
  */
 BlockBackendPublic *blk_get_public(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return &blk->public;
 }
 
@@ -816,6 +838,7 @@ BlockBackendPublic *blk_get_public(BlockBackend *blk)
  */
 BlockBackend *blk_by_public(BlockBackendPublic *public)
 {
+    assert(qemu_in_main_thread());
     return container_of(public, BlockBackend, public);
 }
 
@@ -827,6 +850,8 @@ void blk_remove_bs(BlockBackend *blk)
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
     BdrvChild *root;
 
+    assert(qemu_in_main_thread());
+
     notifier_list_notify(&blk->remove_bs_notifiers, blk);
     if (tgm->throttle_state) {
         BlockDriverState *bs = blk_bs(blk);
@@ -861,6 +886,7 @@ void blk_remove_bs(BlockBackend *blk)
 int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
 {
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
+    assert(qemu_in_main_thread());
     bdrv_ref(bs);
     blk->root = bdrv_root_attach_child(bs, "root", &child_root,
                                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -884,6 +910,7 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
  */
 int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp)
 {
+    assert(qemu_in_main_thread());
     return bdrv_replace_child_bs(blk->root, new_bs, errp);
 }
 
@@ -894,6 +921,7 @@ int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
                  Error **errp)
 {
     int ret;
+    assert(qemu_in_main_thread());
 
     if (blk->root && !blk->disable_perm) {
         ret = bdrv_child_try_set_perm(blk->root, perm, shared_perm, errp);
@@ -910,6 +938,7 @@ int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
 
 void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
 {
+    assert(qemu_in_main_thread());
     *perm = blk->perm;
     *shared_perm = blk->shared_perm;
 }
@@ -920,6 +949,7 @@ void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
  */
 int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
 {
+    assert(qemu_in_main_thread());
     if (blk->dev) {
         return -EBUSY;
     }
@@ -945,6 +975,7 @@ int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
 void blk_detach_dev(BlockBackend *blk, DeviceState *dev)
 {
     assert(blk->dev == dev);
+    assert(qemu_in_main_thread());
     blk->dev = NULL;
     blk->dev_ops = NULL;
     blk->dev_opaque = NULL;
@@ -958,6 +989,7 @@ void blk_detach_dev(BlockBackend *blk, DeviceState *dev)
  */
 DeviceState *blk_get_attached_dev(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk->dev;
 }
 
@@ -986,6 +1018,8 @@ BlockBackend *blk_by_dev(void *dev)
 {
     BlockBackend *blk = NULL;
 
+    assert(qemu_in_main_thread());
+
     assert(dev != NULL);
     while ((blk = blk_all_next(blk)) != NULL) {
         if (blk->dev == dev) {
@@ -1003,6 +1037,7 @@ BlockBackend *blk_by_dev(void *dev)
 void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
                      void *opaque)
 {
+    assert(qemu_in_main_thread());
     blk->dev_ops = ops;
     blk->dev_opaque = opaque;
 
@@ -1024,6 +1059,7 @@ void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
  */
 void blk_dev_change_media_cb(BlockBackend *blk, bool load, Error **errp)
 {
+    assert(qemu_in_main_thread());
     if (blk->dev_ops && blk->dev_ops->change_media_cb) {
         bool tray_was_open, tray_is_open;
         Error *local_err = NULL;
@@ -1115,6 +1151,7 @@ static void blk_root_resize(BdrvChild *child)
 
 void blk_iostatus_enable(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     blk->iostatus_enabled = true;
     blk->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
 }
@@ -1123,6 +1160,7 @@ void blk_iostatus_enable(BlockBackend *blk)
  * enables it _and_ the VM is configured to stop on errors */
 bool blk_iostatus_is_enabled(const BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return (blk->iostatus_enabled &&
            (blk->on_write_error == BLOCKDEV_ON_ERROR_ENOSPC ||
             blk->on_write_error == BLOCKDEV_ON_ERROR_STOP   ||
@@ -1131,16 +1169,19 @@ bool blk_iostatus_is_enabled(const BlockBackend *blk)
 
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
@@ -1148,6 +1189,7 @@ void blk_iostatus_reset(BlockBackend *blk)
 
 void blk_iostatus_set_err(BlockBackend *blk, int error)
 {
+    assert(qemu_in_main_thread());
     assert(blk_iostatus_is_enabled(blk));
     if (blk->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
         blk->iostatus = error == ENOSPC ? BLOCK_DEVICE_IO_STATUS_NOSPACE :
@@ -1347,6 +1389,7 @@ int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
 
 int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
 {
+    assert(qemu_in_main_thread());
     return bdrv_make_zero(blk->root, flags);
 }
 
@@ -1556,6 +1599,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
 
 void blk_aio_cancel(BlockAIOCB *acb)
 {
+    assert(qemu_in_main_thread());
     bdrv_aio_cancel(acb);
 }
 
@@ -1732,6 +1776,8 @@ void blk_drain_all(void)
 {
     BlockBackend *blk = NULL;
 
+    assert(qemu_in_main_thread());
+
     bdrv_drain_all_begin();
 
     while ((blk = blk_all_next(blk)) != NULL) {
@@ -1751,6 +1797,7 @@ void blk_drain_all(void)
 void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
                       BlockdevOnError on_write_error)
 {
+    assert(qemu_in_main_thread());
     blk->on_read_error = on_read_error;
     blk->on_write_error = on_write_error;
 }
@@ -1834,6 +1881,7 @@ void blk_error_action(BlockBackend *blk, BlockErrorAction action,
 bool blk_supports_write_perm(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (bs) {
         return !bdrv_is_read_only(bs);
@@ -1854,6 +1902,7 @@ bool blk_is_writable(BlockBackend *blk)
 bool blk_is_sg(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (!bs) {
         return false;
@@ -1869,6 +1918,7 @@ bool blk_enable_write_cache(BlockBackend *blk)
 
 void blk_set_enable_write_cache(BlockBackend *blk, bool wce)
 {
+    assert(qemu_in_main_thread());
     blk->enable_write_cache = wce;
 }
 
@@ -1908,6 +1958,7 @@ void blk_lock_medium(BlockBackend *blk, bool locked)
 void blk_eject(BlockBackend *blk, bool eject_flag)
 {
     BlockDriverState *bs = blk_bs(blk);
+
     char *id;
 
     if (bs) {
@@ -1925,6 +1976,7 @@ void blk_eject(BlockBackend *blk, bool eject_flag)
 int blk_get_flags(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (bs) {
         return bdrv_get_flags(bs);
@@ -1994,6 +2046,7 @@ void *blk_blockalign(BlockBackend *blk, size_t size)
 bool blk_op_is_blocked(BlockBackend *blk, BlockOpType op, Error **errp)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (!bs) {
         return false;
@@ -2005,6 +2058,7 @@ bool blk_op_is_blocked(BlockBackend *blk, BlockOpType op, Error **errp)
 void blk_op_unblock(BlockBackend *blk, BlockOpType op, Error *reason)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (bs) {
         bdrv_op_unblock(bs, op, reason);
@@ -2014,6 +2068,7 @@ void blk_op_unblock(BlockBackend *blk, BlockOpType op, Error *reason)
 void blk_op_block_all(BlockBackend *blk, Error *reason)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (bs) {
         bdrv_op_block_all(bs, reason);
@@ -2023,6 +2078,7 @@ void blk_op_block_all(BlockBackend *blk, Error *reason)
 void blk_op_unblock_all(BlockBackend *blk, Error *reason)
 {
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     if (bs) {
         bdrv_op_unblock_all(bs, reason);
@@ -2082,6 +2138,7 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
 int blk_set_aio_context(BlockBackend *blk, AioContext *new_context,
                         Error **errp)
 {
+    assert(qemu_in_main_thread());
     return blk_do_set_aio_context(blk, new_context, true, errp);
 }
 
@@ -2118,6 +2175,7 @@ void blk_add_aio_context_notifier(BlockBackend *blk,
 {
     BlockBackendAioNotifier *notifier;
     BlockDriverState *bs = blk_bs(blk);
+    assert(qemu_in_main_thread());
 
     notifier = g_new(BlockBackendAioNotifier, 1);
     notifier->attached_aio_context = attached_aio_context;
@@ -2140,6 +2198,8 @@ void blk_remove_aio_context_notifier(BlockBackend *blk,
     BlockBackendAioNotifier *notifier;
     BlockDriverState *bs = blk_bs(blk);
 
+    assert(qemu_in_main_thread());
+
     if (bs) {
         bdrv_remove_aio_context_notifier(bs, attached_aio_context,
                                          detach_aio_context, opaque);
@@ -2160,11 +2220,13 @@ void blk_remove_aio_context_notifier(BlockBackend *blk,
 
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
 
@@ -2227,6 +2289,7 @@ int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
                      int64_t pos, int size)
 {
     int ret;
+    assert(qemu_in_main_thread());
 
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
@@ -2246,6 +2309,7 @@ int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
 
 int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size)
 {
+    assert(qemu_in_main_thread());
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
@@ -2255,6 +2319,7 @@ int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size)
 
 int blk_probe_blocksizes(BlockBackend *blk, BlockSizes *bsz)
 {
+    assert(qemu_in_main_thread());
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
@@ -2264,6 +2329,7 @@ int blk_probe_blocksizes(BlockBackend *blk, BlockSizes *bsz)
 
 int blk_probe_geometry(BlockBackend *blk, HDGeometry *geo)
 {
+    assert(qemu_in_main_thread());
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
     }
@@ -2277,6 +2343,7 @@ int blk_probe_geometry(BlockBackend *blk, HDGeometry *geo)
  */
 void blk_update_root_state(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     assert(blk->root);
 
     blk->root_state.open_flags    = blk->root->bs->open_flags;
@@ -2289,6 +2356,7 @@ void blk_update_root_state(BlockBackend *blk)
  */
 bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk->root_state.detect_zeroes;
 }
 
@@ -2298,17 +2366,20 @@ bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk)
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
@@ -2333,6 +2404,7 @@ int blk_commit_all(void)
 /* throttling disk I/O limits */
 void blk_set_io_limits(BlockBackend *blk, ThrottleConfig *cfg)
 {
+    assert(qemu_in_main_thread());
     throttle_group_config(&blk->public.throttle_group_member, cfg);
 }
 
@@ -2341,6 +2413,7 @@ void blk_io_limits_disable(BlockBackend *blk)
     BlockDriverState *bs = blk_bs(blk);
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
     assert(tgm->throttle_state);
+    assert(qemu_in_main_thread());
     if (bs) {
         bdrv_ref(bs);
         bdrv_drained_begin(bs);
@@ -2356,12 +2429,14 @@ void blk_io_limits_disable(BlockBackend *blk)
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
@@ -2429,11 +2504,13 @@ static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter)
 
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
 
@@ -2458,11 +2535,13 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
 
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
index 01f3834db5..d161bdb461 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -971,6 +971,8 @@ BlockBackend *blk_by_qdev_id(const char *id, Error **errp)
     DeviceState *dev;
     BlockBackend *blk;
 
+    assert(qemu_in_main_thread());
+
     dev = find_device_state(id, errp);
     if (dev == NULL) {
         return NULL;
-- 
2.31.1


