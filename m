Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCEF4CC116
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:21:29 +0100 (CET)
Received: from localhost ([::1]:60184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnGi-0001Z2-Ha
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:21:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnDY-0006Wf-Sf
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:18:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnDG-0004dr-En
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:17:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646320673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4caFWdchHb/+0MUxQxKADgONv3PhPFY94jXJpK/Pw4A=;
 b=CVtVngTSv6QjKsT90+ttPxkt6bsKYWD6kIzeJ2QpFwB4BMO7j7rVszsJZ9KDVc70SwFrNR
 zmiuCIutnnt9zsD8iU6P2DZUA/P58Ko4EJ50gJmZQLunepASmLhp3xwv/0NMRx56MnsfpF
 ZYxTUvFHbq1vh0EqZl3aLt6JYDfPkz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-YKjIyxwWNh6LJOZwp4P31w-1; Thu, 03 Mar 2022 10:17:53 -0500
X-MC-Unique: YKjIyxwWNh6LJOZwp4P31w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8BAC1854E27;
 Thu,  3 Mar 2022 15:17:51 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F1D87C029;
 Thu,  3 Mar 2022 15:17:50 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 04/31] assertions for block global state API
Date: Thu,  3 Mar 2022 10:15:49 -0500
Message-Id: <20220303151616.325444-5-eesposit@redhat.com>
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

All the global state (GS) API functions will check that
qemu_in_main_thread() returns true. If not, it means
that the safety of BQL cannot be guaranteed, and
they need to be moved to I/O.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c        | 124 ++++++++++++++++++++++++++++++++++++++++++++++++-
 block/commit.c |   2 +
 block/io.c     |  11 +++++
 blockdev.c     |   1 +
 4 files changed, 136 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 7483dfaddc..f59f290653 100644
--- a/block.c
+++ b/block.c
@@ -387,12 +387,14 @@ static char *bdrv_make_absolute_filename(BlockDriverState *relative_to,
 
 char *bdrv_get_full_backing_filename(BlockDriverState *bs, Error **errp)
 {
+    GLOBAL_STATE_CODE();
     return bdrv_make_absolute_filename(bs, bs->backing_file, errp);
 }
 
 void bdrv_register(BlockDriver *bdrv)
 {
     assert(bdrv->format_name);
+    GLOBAL_STATE_CODE();
     QLIST_INSERT_HEAD(&bdrv_drivers, bdrv, list);
 }
 
@@ -401,6 +403,8 @@ BlockDriverState *bdrv_new(void)
     BlockDriverState *bs;
     int i;
 
+    GLOBAL_STATE_CODE();
+
     bs = g_new0(BlockDriverState, 1);
     QLIST_INIT(&bs->dirty_bitmaps);
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
@@ -443,6 +447,8 @@ BlockDriver *bdrv_find_format(const char *format_name)
     BlockDriver *drv1;
     int i;
 
+    GLOBAL_STATE_CODE();
+
     drv1 = bdrv_do_find_format(format_name);
     if (drv1) {
         return drv1;
@@ -492,6 +498,7 @@ static int bdrv_format_is_whitelisted(const char *format_name, bool read_only)
 
 int bdrv_is_whitelisted(BlockDriver *drv, bool read_only)
 {
+    GLOBAL_STATE_CODE();
     return bdrv_format_is_whitelisted(drv->format_name, read_only);
 }
 
@@ -527,6 +534,8 @@ int bdrv_create(BlockDriver *drv, const char* filename,
 {
     int ret;
 
+    GLOBAL_STATE_CODE();
+
     Coroutine *co;
     CreateCo cco = {
         .drv = drv,
@@ -702,6 +711,8 @@ int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
     QDict *qdict;
     int ret;
 
+    GLOBAL_STATE_CODE();
+
     drv = bdrv_find_protocol(filename, true, errp);
     if (drv == NULL) {
         return -ENOENT;
@@ -799,6 +810,7 @@ int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *filtered = bdrv_filter_bs(bs);
+    GLOBAL_STATE_CODE();
 
     if (drv && drv->bdrv_probe_blocksizes) {
         return drv->bdrv_probe_blocksizes(bs, bsz);
@@ -819,6 +831,7 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *filtered = bdrv_filter_bs(bs);
+    GLOBAL_STATE_CODE();
 
     if (drv && drv->bdrv_probe_geometry) {
         return drv->bdrv_probe_geometry(bs, geo);
@@ -910,6 +923,7 @@ BlockDriver *bdrv_find_protocol(const char *filename,
     const char *p;
     int i;
 
+    GLOBAL_STATE_CODE();
     /* TODO Drivers without bdrv_file_open must be specified explicitly */
 
     /*
@@ -1634,6 +1648,8 @@ BlockDriverState *bdrv_new_open_driver_opts(BlockDriver *drv,
     BlockDriverState *bs;
     int ret;
 
+    GLOBAL_STATE_CODE();
+
     bs = bdrv_new();
     bs->open_flags = flags;
     bs->options = options ?: qdict_new();
@@ -1659,6 +1675,7 @@ BlockDriverState *bdrv_new_open_driver_opts(BlockDriver *drv,
 BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
                                        int flags, Error **errp)
 {
+    GLOBAL_STATE_CODE();
     return bdrv_new_open_driver_opts(drv, node_name, NULL, flags, errp);
 }
 
@@ -3094,6 +3111,8 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
     BdrvChild *child = NULL;
     Transaction *tran = tran_new();
 
+    GLOBAL_STATE_CODE();
+
     ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name, child_class,
                                    child_role, &child, tran, errp);
     if (ret < 0) {
@@ -3120,6 +3139,8 @@ void bdrv_root_unref_child(BdrvChild *child)
 {
     BlockDriverState *child_bs;
 
+    GLOBAL_STATE_CODE();
+
     child_bs = child->bs;
     bdrv_detach_child(&child);
     bdrv_unref(child_bs);
@@ -3194,6 +3215,7 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
 /* Callers must ensure that child->frozen is false. */
 void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
 {
+    GLOBAL_STATE_CODE();
     if (child == NULL) {
         return;
     }
@@ -3344,6 +3366,7 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
     int ret;
     Transaction *tran = tran_new();
 
+    GLOBAL_STATE_CODE();
     bdrv_drained_begin(bs);
 
     ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
@@ -3383,6 +3406,8 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
     QDict *tmp_parent_options = NULL;
     Error *local_err = NULL;
 
+    GLOBAL_STATE_CODE();
+
     if (bs->backing != NULL) {
         goto free_exit;
     }
@@ -3542,6 +3567,8 @@ BdrvChild *bdrv_open_child(const char *filename,
 {
     BlockDriverState *bs;
 
+    GLOBAL_STATE_CODE();
+
     bs = bdrv_open_child_bs(filename, options, bdref_key, parent, child_class,
                             child_role, allow_none, errp);
     if (bs == NULL) {
@@ -3564,6 +3591,8 @@ BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp)
     const char *reference = NULL;
     Visitor *v = NULL;
 
+    GLOBAL_STATE_CODE();
+
     if (ref->type == QTYPE_QSTRING) {
         reference = ref->u.reference;
     } else {
@@ -3961,6 +3990,8 @@ close_and_fail:
 BlockDriverState *bdrv_open(const char *filename, const char *reference,
                             QDict *options, int flags, Error **errp)
 {
+    GLOBAL_STATE_CODE();
+
     return bdrv_open_inherit(filename, reference, options, flags, NULL,
                              NULL, 0, errp);
 }
@@ -4215,12 +4246,15 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                     BlockDriverState *bs,
                                     QDict *options, bool keep_old_opts)
 {
+    GLOBAL_STATE_CODE();
+
     return bdrv_reopen_queue_child(bs_queue, bs, options, NULL, 0, false,
                                    NULL, 0, keep_old_opts);
 }
 
 void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue)
 {
+    GLOBAL_STATE_CODE();
     if (bs_queue) {
         BlockReopenQueueEntry *bs_entry, *next;
         QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
@@ -4368,6 +4402,8 @@ int bdrv_reopen(BlockDriverState *bs, QDict *opts, bool keep_old_opts,
     BlockReopenQueue *queue;
     int ret;
 
+    GLOBAL_STATE_CODE();
+
     bdrv_subtree_drained_begin(bs);
     if (ctx != qemu_get_aio_context()) {
         aio_context_release(ctx);
@@ -4389,6 +4425,8 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
 {
     QDict *opts = qdict_new();
 
+    GLOBAL_STATE_CODE();
+
     qdict_put_bool(opts, BDRV_OPT_READ_ONLY, read_only);
 
     return bdrv_reopen(bs, opts, true, errp);
@@ -4784,6 +4822,7 @@ static void bdrv_close(BlockDriverState *bs)
     BdrvAioNotifier *ban, *ban_next;
     BdrvChild *child, *next;
 
+    GLOBAL_STATE_CODE();
     assert(!bs->refcnt);
 
     bdrv_drained_begin(bs); /* complete I/O */
@@ -4843,6 +4882,7 @@ static void bdrv_close(BlockDriverState *bs)
 void bdrv_close_all(void)
 {
     assert(job_next(NULL) == NULL);
+    GLOBAL_STATE_CODE();
 
     /* Drop references from requests still in flight, such as canceled block
      * jobs whose AIO context has not been polled yet */
@@ -5157,11 +5197,15 @@ out:
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp)
 {
+    GLOBAL_STATE_CODE();
+
     return bdrv_replace_node_common(from, to, true, false, errp);
 }
 
 int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
 {
+    GLOBAL_STATE_CODE();
+
     return bdrv_replace_node_common(bs, bdrv_filter_or_cow_bs(bs), true, true,
                                     errp);
 }
@@ -5184,6 +5228,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
     int ret;
     Transaction *tran = tran_new();
 
+    GLOBAL_STATE_CODE();
+
     assert(!bs_new->backing);
 
     ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
@@ -5217,6 +5263,8 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     g_autoptr(GSList) refresh_list = NULL;
     BlockDriverState *old_bs = child->bs;
 
+    GLOBAL_STATE_CODE();
+
     bdrv_ref(old_bs);
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
@@ -5244,6 +5292,7 @@ static void bdrv_delete(BlockDriverState *bs)
 {
     assert(bdrv_op_blocker_is_empty(bs));
     assert(!bs->refcnt);
+    GLOBAL_STATE_CODE();
 
     /* remove from list, if necessary */
     if (bs->node_name[0] != '\0') {
@@ -5288,6 +5337,8 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
 
     node_name = qdict_get_try_str(options, "node-name");
 
+    GLOBAL_STATE_CODE();
+
     new_node_bs = bdrv_new_open_driver_opts(drv, node_name, options, flags,
                                             errp);
     options = NULL; /* bdrv_new_open_driver() eats options */
@@ -5348,6 +5399,8 @@ int bdrv_change_backing_file(BlockDriverState *bs, const char *backing_file,
     BlockDriver *drv = bs->drv;
     int ret;
 
+    GLOBAL_STATE_CODE();
+
     if (!drv) {
         return -ENOMEDIUM;
     }
@@ -5389,6 +5442,9 @@ int bdrv_change_backing_file(BlockDriverState *bs, const char *backing_file,
 BlockDriverState *bdrv_find_overlay(BlockDriverState *active,
                                     BlockDriverState *bs)
 {
+
+    GLOBAL_STATE_CODE();
+
     bs = bdrv_skip_filters(bs);
     active = bdrv_skip_filters(active);
 
@@ -5406,6 +5462,8 @@ BlockDriverState *bdrv_find_overlay(BlockDriverState *active,
 /* Given a BDS, searches for the base layer. */
 BlockDriverState *bdrv_find_base(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
+
     return bdrv_find_overlay(bs, NULL);
 }
 
@@ -5420,6 +5478,8 @@ bool bdrv_is_backing_chain_frozen(BlockDriverState *bs, BlockDriverState *base,
     BlockDriverState *i;
     BdrvChild *child;
 
+    GLOBAL_STATE_CODE();
+
     for (i = bs; i != base; i = child_bs(child)) {
         child = bdrv_filter_or_cow_child(i);
 
@@ -5446,6 +5506,8 @@ int bdrv_freeze_backing_chain(BlockDriverState *bs, BlockDriverState *base,
     BlockDriverState *i;
     BdrvChild *child;
 
+    GLOBAL_STATE_CODE();
+
     if (bdrv_is_backing_chain_frozen(bs, base, errp)) {
         return -EPERM;
     }
@@ -5480,6 +5542,8 @@ void bdrv_unfreeze_backing_chain(BlockDriverState *bs, BlockDriverState *base)
     BlockDriverState *i;
     BdrvChild *child;
 
+    GLOBAL_STATE_CODE();
+
     for (i = bs; i != base; i = child_bs(child)) {
         child = bdrv_filter_or_cow_child(i);
         if (child) {
@@ -5529,6 +5593,8 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
     g_autoptr(GSList) updated_children = NULL;
     GSList *p;
 
+    GLOBAL_STATE_CODE();
+
     bdrv_ref(top);
     bdrv_subtree_drained_begin(top);
 
@@ -5788,6 +5854,8 @@ void bdrv_iterate_format(void (*it)(void *opaque, const char *name),
     int i;
     const char **formats = NULL;
 
+    GLOBAL_STATE_CODE();
+
     QLIST_FOREACH(drv, &bdrv_drivers, list) {
         if (drv->format_name) {
             bool found = false;
@@ -5846,6 +5914,7 @@ BlockDriverState *bdrv_find_node(const char *node_name)
     BlockDriverState *bs;
 
     assert(node_name);
+    GLOBAL_STATE_CODE();
 
     QTAILQ_FOREACH(bs, &graph_bdrv_states, node_list) {
         if (!strcmp(node_name, bs->node_name)) {
@@ -5862,6 +5931,8 @@ BlockDeviceInfoList *bdrv_named_nodes_list(bool flat,
     BlockDeviceInfoList *list;
     BlockDriverState *bs;
 
+    GLOBAL_STATE_CODE();
+
     list = NULL;
     QTAILQ_FOREACH(bs, &graph_bdrv_states, node_list) {
         BlockDeviceInfo *info = bdrv_block_device_info(NULL, bs, flat, errp);
@@ -5967,6 +6038,8 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
     BdrvChild *child;
     XDbgBlockGraphConstructor *gr = xdbg_graph_new();
 
+    GLOBAL_STATE_CODE();
+
     for (blk = blk_all_next(NULL); blk; blk = blk_all_next(blk)) {
         char *allocated_name = NULL;
         const char *name = blk_name(blk);
@@ -6010,6 +6083,8 @@ BlockDriverState *bdrv_lookup_bs(const char *device,
     BlockBackend *blk;
     BlockDriverState *bs;
 
+    GLOBAL_STATE_CODE();
+
     if (device) {
         blk = blk_by_name(device);
 
@@ -6041,6 +6116,9 @@ BlockDriverState *bdrv_lookup_bs(const char *device,
  * return false.  If either argument is NULL, return false. */
 bool bdrv_chain_contains(BlockDriverState *top, BlockDriverState *base)
 {
+
+    GLOBAL_STATE_CODE();
+
     while (top && top != base) {
         top = bdrv_filter_or_cow_bs(top);
     }
@@ -6050,6 +6128,7 @@ bool bdrv_chain_contains(BlockDriverState *top, BlockDriverState *base)
 
 BlockDriverState *bdrv_next_node(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     if (!bs) {
         return QTAILQ_FIRST(&graph_bdrv_states);
     }
@@ -6058,6 +6137,7 @@ BlockDriverState *bdrv_next_node(BlockDriverState *bs)
 
 BlockDriverState *bdrv_next_all_states(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     if (!bs) {
         return QTAILQ_FIRST(&all_bdrv_states);
     }
@@ -6104,17 +6184,20 @@ const char *bdrv_get_device_or_node_name(const BlockDriverState *bs)
 
 int bdrv_get_flags(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     return bs->open_flags;
 }
 
 int bdrv_has_zero_init_1(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     return 1;
 }
 
 int bdrv_has_zero_init(BlockDriverState *bs)
 {
     BlockDriverState *filtered;
+    GLOBAL_STATE_CODE();
 
     if (!bs->drv) {
         return 0;
@@ -6226,6 +6309,7 @@ static BlockDriverState *bdrv_find_debug_node(BlockDriverState *bs)
 int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
                           const char *tag)
 {
+    GLOBAL_STATE_CODE();
     bs = bdrv_find_debug_node(bs);
     if (bs) {
         return bs->drv->bdrv_debug_breakpoint(bs, event, tag);
@@ -6236,6 +6320,7 @@ int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
 
 int bdrv_debug_remove_breakpoint(BlockDriverState *bs, const char *tag)
 {
+    GLOBAL_STATE_CODE();
     bs = bdrv_find_debug_node(bs);
     if (bs) {
         return bs->drv->bdrv_debug_remove_breakpoint(bs, tag);
@@ -6246,6 +6331,7 @@ int bdrv_debug_remove_breakpoint(BlockDriverState *bs, const char *tag)
 
 int bdrv_debug_resume(BlockDriverState *bs, const char *tag)
 {
+    GLOBAL_STATE_CODE();
     while (bs && (!bs->drv || !bs->drv->bdrv_debug_resume)) {
         bs = bdrv_primary_bs(bs);
     }
@@ -6259,6 +6345,7 @@ int bdrv_debug_resume(BlockDriverState *bs, const char *tag)
 
 bool bdrv_debug_is_suspended(BlockDriverState *bs, const char *tag)
 {
+    GLOBAL_STATE_CODE();
     while (bs && bs->drv && !bs->drv->bdrv_debug_is_suspended) {
         bs = bdrv_primary_bs(bs);
     }
@@ -6286,6 +6373,8 @@ BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
     BlockDriverState *retval = NULL;
     BlockDriverState *bs_below;
 
+    GLOBAL_STATE_CODE();
+
     if (!bs || !bs->drv || !backing_file) {
         return NULL;
     }
@@ -6403,6 +6492,8 @@ int bdrv_activate(BlockDriverState *bs, Error **errp)
     int ret;
     BdrvDirtyBitmap *bm;
 
+    GLOBAL_STATE_CODE();
+
     if (!bs->drv)  {
         return -ENOMEDIUM;
     }
@@ -6490,6 +6581,8 @@ void bdrv_activate_all(Error **errp)
     BlockDriverState *bs;
     BdrvNextIterator it;
 
+    GLOBAL_STATE_CODE();
+
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
         AioContext *aio_context = bdrv_get_aio_context(bs);
         int ret;
@@ -6589,6 +6682,8 @@ int bdrv_inactivate_all(void)
     int ret = 0;
     GSList *aio_ctxs = NULL, *ctx;
 
+    GLOBAL_STATE_CODE();
+
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
@@ -6677,6 +6772,7 @@ void bdrv_lock_medium(BlockDriverState *bs, bool locked)
 /* Get a reference to bs */
 void bdrv_ref(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     bs->refcnt++;
 }
 
@@ -6685,6 +6781,7 @@ void bdrv_ref(BlockDriverState *bs)
  * deleted. */
 void bdrv_unref(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     if (!bs) {
         return;
     }
@@ -6702,6 +6799,7 @@ struct BdrvOpBlocker {
 bool bdrv_op_is_blocked(BlockDriverState *bs, BlockOpType op, Error **errp)
 {
     BdrvOpBlocker *blocker;
+    GLOBAL_STATE_CODE();
     assert((int) op >= 0 && op < BLOCK_OP_TYPE_MAX);
     if (!QLIST_EMPTY(&bs->op_blockers[op])) {
         blocker = QLIST_FIRST(&bs->op_blockers[op]);
@@ -6716,6 +6814,7 @@ bool bdrv_op_is_blocked(BlockDriverState *bs, BlockOpType op, Error **errp)
 void bdrv_op_block(BlockDriverState *bs, BlockOpType op, Error *reason)
 {
     BdrvOpBlocker *blocker;
+    GLOBAL_STATE_CODE();
     assert((int) op >= 0 && op < BLOCK_OP_TYPE_MAX);
 
     blocker = g_new0(BdrvOpBlocker, 1);
@@ -6726,6 +6825,7 @@ void bdrv_op_block(BlockDriverState *bs, BlockOpType op, Error *reason)
 void bdrv_op_unblock(BlockDriverState *bs, BlockOpType op, Error *reason)
 {
     BdrvOpBlocker *blocker, *next;
+    GLOBAL_STATE_CODE();
     assert((int) op >= 0 && op < BLOCK_OP_TYPE_MAX);
     QLIST_FOREACH_SAFE(blocker, &bs->op_blockers[op], list, next) {
         if (blocker->reason == reason) {
@@ -6738,6 +6838,7 @@ void bdrv_op_unblock(BlockDriverState *bs, BlockOpType op, Error *reason)
 void bdrv_op_block_all(BlockDriverState *bs, Error *reason)
 {
     int i;
+    GLOBAL_STATE_CODE();
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         bdrv_op_block(bs, i, reason);
     }
@@ -6746,6 +6847,7 @@ void bdrv_op_block_all(BlockDriverState *bs, Error *reason)
 void bdrv_op_unblock_all(BlockDriverState *bs, Error *reason)
 {
     int i;
+    GLOBAL_STATE_CODE();
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         bdrv_op_unblock(bs, i, reason);
     }
@@ -6754,7 +6856,6 @@ void bdrv_op_unblock_all(BlockDriverState *bs, Error *reason)
 bool bdrv_op_blocker_is_empty(BlockDriverState *bs)
 {
     int i;
-
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         if (!QLIST_EMPTY(&bs->op_blockers[i])) {
             return false;
@@ -6776,6 +6877,8 @@ void bdrv_img_create(const char *filename, const char *fmt,
     Error *local_err = NULL;
     int ret = 0;
 
+    GLOBAL_STATE_CODE();
+
     /* Find driver and parse its options */
     drv = bdrv_find_format(fmt);
     if (!drv) {
@@ -7192,6 +7295,7 @@ static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
 bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
                                     GSList **ignore, Error **errp)
 {
+    GLOBAL_STATE_CODE();
     if (g_slist_find(*ignore, c)) {
         return true;
     }
@@ -7210,6 +7314,8 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
         return true;
     }
 
+    GLOBAL_STATE_CODE();
+
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         if (!bdrv_parent_can_set_aio_context(c, ctx, ignore, errp)) {
             return false;
@@ -7230,6 +7336,8 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
     GSList *ignore;
     bool ret;
 
+    GLOBAL_STATE_CODE();
+
     ignore = ignore_child ? g_slist_prepend(NULL, ignore_child) : NULL;
     ret = bdrv_can_set_aio_context(bs, ctx, &ignore, errp);
     g_slist_free(ignore);
@@ -7248,6 +7356,7 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
 int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                              Error **errp)
 {
+    GLOBAL_STATE_CODE();
     return bdrv_child_try_set_aio_context(bs, ctx, NULL, errp);
 }
 
@@ -7261,6 +7370,7 @@ void bdrv_add_aio_context_notifier(BlockDriverState *bs,
         .detach_aio_context   = detach_aio_context,
         .opaque               = opaque
     };
+    GLOBAL_STATE_CODE();
 
     QLIST_INSERT_HEAD(&bs->aio_notifiers, ban, list);
 }
@@ -7272,6 +7382,7 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
                                       void *opaque)
 {
     BdrvAioNotifier *ban, *ban_next;
+    GLOBAL_STATE_CODE();
 
     QLIST_FOREACH_SAFE(ban, &bs->aio_notifiers, list, ban_next) {
         if (ban->attached_aio_context == attached_aio_context &&
@@ -7296,6 +7407,7 @@ int bdrv_amend_options(BlockDriverState *bs, QemuOpts *opts,
                        bool force,
                        Error **errp)
 {
+    GLOBAL_STATE_CODE();
     if (!bs->drv) {
         error_setg(errp, "Node is ejected");
         return -ENOMEDIUM;
@@ -7366,6 +7478,8 @@ BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
     BlockDriverState *to_replace_bs = bdrv_find_node(node_name);
     AioContext *aio_context;
 
+    GLOBAL_STATE_CODE();
+
     if (!to_replace_bs) {
         error_setg(errp, "Failed to find node with node-name='%s'", node_name);
         return NULL;
@@ -7527,6 +7641,8 @@ void bdrv_refresh_filename(BlockDriverState *bs)
     bool generate_json_filename; /* Whether our default implementation should
                                     fill exact_filename (false) or not (true) */
 
+    GLOBAL_STATE_CODE();
+
     if (!drv) {
         return;
     }
@@ -7649,6 +7765,8 @@ char *bdrv_dirname(BlockDriverState *bs, Error **errp)
     BlockDriver *drv = bs->drv;
     BlockDriverState *child_bs;
 
+    GLOBAL_STATE_CODE();
+
     if (!drv) {
         error_setg(errp, "Node '%s' is ejected", bs->node_name);
         return NULL;
@@ -7680,7 +7798,7 @@ char *bdrv_dirname(BlockDriverState *bs, Error **errp)
 void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
                     Error **errp)
 {
-
+    GLOBAL_STATE_CODE();
     if (!parent_bs->drv || !parent_bs->drv->bdrv_add_child) {
         error_setg(errp, "The node %s does not support adding a child",
                    bdrv_get_device_or_node_name(parent_bs));
@@ -7700,6 +7818,7 @@ void bdrv_del_child(BlockDriverState *parent_bs, BdrvChild *child, Error **errp)
 {
     BdrvChild *tmp;
 
+    GLOBAL_STATE_CODE();
     if (!parent_bs->drv || !parent_bs->drv->bdrv_del_child) {
         error_setg(errp, "The node %s does not support removing a child",
                    bdrv_get_device_or_node_name(parent_bs));
@@ -7727,6 +7846,7 @@ int bdrv_make_empty(BdrvChild *c, Error **errp)
     BlockDriver *drv = c->bs->drv;
     int ret;
 
+    GLOBAL_STATE_CODE();
     assert(c->perm & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED));
 
     if (!drv->bdrv_make_empty) {
diff --git a/block/commit.c b/block/commit.c
index b1fc7b908b..2ce6637ca6 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -432,6 +432,8 @@ int bdrv_commit(BlockDriverState *bs)
     QEMU_AUTO_VFREE uint8_t *buf = NULL;
     Error *local_err = NULL;
 
+    GLOBAL_STATE_CODE();
+
     if (!drv)
         return -ENOMEDIUM;
 
diff --git a/block/io.c b/block/io.c
index 4e4cb556c5..769b7ebdbc 100644
--- a/block/io.c
+++ b/block/io.c
@@ -164,6 +164,8 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
     BdrvChild *c;
     bool have_limits;
 
+    GLOBAL_STATE_CODE();
+
     if (tran) {
         BdrvRefreshLimitsState *s = g_new(BdrvRefreshLimitsState, 1);
         *s = (BdrvRefreshLimitsState) {
@@ -612,6 +614,7 @@ static bool bdrv_drain_all_poll(void)
 {
     BlockDriverState *bs = NULL;
     bool result = false;
+    GLOBAL_STATE_CODE();
 
     /* bdrv_drain_poll() can't make changes to the graph and we are holding the
      * main AioContext lock, so iterating bdrv_next_all_states() is safe. */
@@ -640,6 +643,7 @@ static bool bdrv_drain_all_poll(void)
 void bdrv_drain_all_begin(void)
 {
     BlockDriverState *bs = NULL;
+    GLOBAL_STATE_CODE();
 
     if (qemu_in_coroutine()) {
         bdrv_co_yield_to_drain(NULL, true, false, NULL, true, true, NULL);
@@ -696,6 +700,7 @@ void bdrv_drain_all_end(void)
 {
     BlockDriverState *bs = NULL;
     int drained_end_counter = 0;
+    GLOBAL_STATE_CODE();
 
     /*
      * bdrv queue is managed by record/replay,
@@ -723,6 +728,7 @@ void bdrv_drain_all_end(void)
 
 void bdrv_drain_all(void)
 {
+    GLOBAL_STATE_CODE();
     bdrv_drain_all_begin();
     bdrv_drain_all_end();
 }
@@ -2345,6 +2351,8 @@ int bdrv_flush_all(void)
     BlockDriverState *bs = NULL;
     int result = 0;
 
+    GLOBAL_STATE_CODE();
+
     /*
      * bdrv queue is managed by record/replay,
      * creating new flush request for stopping
@@ -3296,6 +3304,7 @@ void bdrv_register_buf(BlockDriverState *bs, void *host, size_t size)
 {
     BdrvChild *child;
 
+    GLOBAL_STATE_CODE();
     if (bs->drv && bs->drv->bdrv_register_buf) {
         bs->drv->bdrv_register_buf(bs, host, size);
     }
@@ -3308,6 +3317,7 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host)
 {
     BdrvChild *child;
 
+    GLOBAL_STATE_CODE();
     if (bs->drv && bs->drv->bdrv_unregister_buf) {
         bs->drv->bdrv_unregister_buf(bs, host);
     }
@@ -3579,6 +3589,7 @@ out:
 
 void bdrv_cancel_in_flight(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     if (!bs || !bs->drv) {
         return;
     }
diff --git a/blockdev.c b/blockdev.c
index 42e098b458..d601ae522e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -658,6 +658,7 @@ void blockdev_close_all_bdrv_states(void)
 /* Iterates over the list of monitor-owned BlockDriverStates */
 BlockDriverState *bdrv_next_monitor_owned(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     return bs ? QTAILQ_NEXT(bs, monitor_list)
               : QTAILQ_FIRST(&monitor_bdrv_states);
 }
-- 
2.31.1


