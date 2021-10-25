Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27044393AC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:27:56 +0200 (CEST)
Received: from localhost ([::1]:49626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexCt-0005Ud-Pw
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex3d-0004pB-18
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:18:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex3X-0006Qn-VQ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635157095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZWuCeeBdLGbuqVwI3wascfvhOXBqRcL2xDcLWOGlRPA=;
 b=ZbNBlE9N1C5kQn/Mejz/up+7k8KaZBK+Jftu5WNeK175J3wpvIAot/oJ9SxiJMDa+2zJu4
 DlKP1ts3zdAyIHncAbiNFvbwlVBdarmlkx2QNTVscKJOZOETlX2+rlN0gYiieUDlB2Ho/e
 t1N8WhJgFJ1WkP6ikfwXsd8ALDvpKiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-1-PcLsuwOLCMN0WcUg0YTg-1; Mon, 25 Oct 2021 06:18:12 -0400
X-MC-Unique: 1-PcLsuwOLCMN0WcUg0YTg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABDCC8066F5;
 Mon, 25 Oct 2021 10:18:10 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BBC75D9D5;
 Mon, 25 Oct 2021 10:18:09 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 03/25] assertions for block global state API
Date: Mon, 25 Oct 2021 06:17:13 -0400
Message-Id: <20211025101735.2060852-4-eesposit@redhat.com>
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
 block.c        | 136 +++++++++++++++++++++++++++++++++++++++++++++++--
 block/commit.c |   2 +
 block/io.c     |  20 ++++++++
 blockdev.c     |   1 +
 4 files changed, 156 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 6fdb4d7712..672f946065 100644
--- a/block.c
+++ b/block.c
@@ -386,6 +386,7 @@ char *bdrv_get_full_backing_filename(BlockDriverState *bs, Error **errp)
 void bdrv_register(BlockDriver *bdrv)
 {
     assert(bdrv->format_name);
+    assert(qemu_in_main_thread());
     QLIST_INSERT_HEAD(&bdrv_drivers, bdrv, list);
 }
 
@@ -394,6 +395,8 @@ BlockDriverState *bdrv_new(void)
     BlockDriverState *bs;
     int i;
 
+    assert(qemu_in_main_thread());
+
     bs = g_new0(BlockDriverState, 1);
     QLIST_INIT(&bs->dirty_bitmaps);
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
@@ -421,6 +424,7 @@ BlockDriverState *bdrv_new(void)
 static BlockDriver *bdrv_do_find_format(const char *format_name)
 {
     BlockDriver *drv1;
+    assert(qemu_in_main_thread());
 
     QLIST_FOREACH(drv1, &bdrv_drivers, list) {
         if (!strcmp(drv1->format_name, format_name)) {
@@ -436,6 +440,8 @@ BlockDriver *bdrv_find_format(const char *format_name)
     BlockDriver *drv1;
     int i;
 
+    assert(qemu_in_main_thread());
+
     drv1 = bdrv_do_find_format(format_name);
     if (drv1) {
         return drv1;
@@ -485,11 +491,13 @@ static int bdrv_format_is_whitelisted(const char *format_name, bool read_only)
 
 int bdrv_is_whitelisted(BlockDriver *drv, bool read_only)
 {
+    assert(qemu_in_main_thread());
     return bdrv_format_is_whitelisted(drv->format_name, read_only);
 }
 
 bool bdrv_uses_whitelist(void)
 {
+    assert(qemu_in_main_thread());
     return use_bdrv_whitelist;
 }
 
@@ -520,6 +528,8 @@ int bdrv_create(BlockDriver *drv, const char* filename,
 {
     int ret;
 
+    assert(qemu_in_main_thread());
+
     Coroutine *co;
     CreateCo cco = {
         .drv = drv,
@@ -695,6 +705,8 @@ int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
     QDict *qdict;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     drv = bdrv_find_protocol(filename, true, errp);
     if (drv == NULL) {
         return -ENOENT;
@@ -792,6 +804,7 @@ int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *filtered = bdrv_filter_bs(bs);
+    assert(qemu_in_main_thread());
 
     if (drv && drv->bdrv_probe_blocksizes) {
         return drv->bdrv_probe_blocksizes(bs, bsz);
@@ -812,6 +825,7 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *filtered = bdrv_filter_bs(bs);
+    assert(qemu_in_main_thread());
 
     if (drv && drv->bdrv_probe_geometry) {
         return drv->bdrv_probe_geometry(bs, geo);
@@ -866,6 +880,7 @@ static BlockDriver *find_hdev_driver(const char *filename)
 {
     int score_max = 0, score;
     BlockDriver *drv = NULL, *d;
+    assert(qemu_in_main_thread());
 
     QLIST_FOREACH(d, &bdrv_drivers, list) {
         if (d->bdrv_probe_device) {
@@ -883,6 +898,7 @@ static BlockDriver *find_hdev_driver(const char *filename)
 static BlockDriver *bdrv_do_find_protocol(const char *protocol)
 {
     BlockDriver *drv1;
+    assert(qemu_in_main_thread());
 
     QLIST_FOREACH(drv1, &bdrv_drivers, list) {
         if (drv1->protocol_name && !strcmp(drv1->protocol_name, protocol)) {
@@ -903,6 +919,7 @@ BlockDriver *bdrv_find_protocol(const char *filename,
     const char *p;
     int i;
 
+    assert(qemu_in_main_thread());
     /* TODO Drivers without bdrv_file_open must be specified explicitly */
 
     /*
@@ -968,6 +985,7 @@ BlockDriver *bdrv_probe_all(const uint8_t *buf, int buf_size,
 {
     int score_max = 0, score;
     BlockDriver *drv = NULL, *d;
+    assert(qemu_in_main_thread());
 
     QLIST_FOREACH(d, &bdrv_drivers, list) {
         if (d->bdrv_probe) {
@@ -1115,6 +1133,7 @@ int bdrv_parse_aio(const char *mode, int *flags)
  */
 int bdrv_parse_discard_flags(const char *mode, int *flags)
 {
+    assert(qemu_in_main_thread());
     *flags &= ~BDRV_O_UNMAP;
 
     if (!strcmp(mode, "off") || !strcmp(mode, "ignore")) {
@@ -1135,6 +1154,7 @@ int bdrv_parse_discard_flags(const char *mode, int *flags)
  */
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough)
 {
+    assert(qemu_in_main_thread());
     *flags &= ~BDRV_O_CACHE_MASK;
 
     if (!strcmp(mode, "off") || !strcmp(mode, "none")) {
@@ -1499,6 +1519,7 @@ static void bdrv_assign_node_name(BlockDriverState *bs,
                                   Error **errp)
 {
     char *gen_node_name = NULL;
+    assert(qemu_in_main_thread());
 
     if (!node_name) {
         node_name = gen_node_name = id_generate(ID_BLOCK);
@@ -1623,6 +1644,8 @@ BlockDriverState *bdrv_new_open_driver_opts(BlockDriver *drv,
     BlockDriverState *bs;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     bs = bdrv_new();
     bs->open_flags = flags;
     bs->options = options ?: qdict_new();
@@ -1648,6 +1671,7 @@ BlockDriverState *bdrv_new_open_driver_opts(BlockDriver *drv,
 BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
                                        int flags, Error **errp)
 {
+    assert(qemu_in_main_thread());
     return bdrv_new_open_driver_opts(drv, node_name, NULL, flags, errp);
 }
 
@@ -1742,6 +1766,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
 
     assert(bs->file == NULL);
     assert(options != NULL && bs->options != options);
+    assert(qemu_in_main_thread());
 
     opts = qemu_opts_create(&bdrv_runtime_opts, NULL, 0, &error_abort);
     if (!qemu_opts_absorb_qdict(opts, options, errp)) {
@@ -2999,6 +3024,8 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
     BdrvChild *child = NULL;
     Transaction *tran = tran_new();
 
+    assert(qemu_in_main_thread());
+
     ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name, child_class,
                                    child_role, &child, tran, errp);
     if (ret < 0) {
@@ -3025,6 +3052,8 @@ void bdrv_root_unref_child(BdrvChild *child)
 {
     BlockDriverState *child_bs;
 
+    assert(qemu_in_main_thread());
+
     child_bs = child->bs;
     bdrv_detach_child(child);
     bdrv_unref(child_bs);
@@ -3099,6 +3128,7 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
 /* Callers must ensure that child->frozen is false. */
 void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
 {
+    assert(qemu_in_main_thread());
     if (child == NULL) {
         return;
     }
@@ -3249,6 +3279,8 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
     int ret;
     Transaction *tran = tran_new();
 
+    assert(qemu_in_main_thread());
+
     ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
     if (ret < 0) {
         goto out;
@@ -3284,6 +3316,8 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
     QDict *tmp_parent_options = NULL;
     Error *local_err = NULL;
 
+    assert(qemu_in_main_thread());
+
     if (bs->backing != NULL) {
         goto free_exit;
     }
@@ -3443,6 +3477,8 @@ BdrvChild *bdrv_open_child(const char *filename,
 {
     BlockDriverState *bs;
 
+    assert(qemu_in_main_thread());
+
     bs = bdrv_open_child_bs(filename, options, bdref_key, parent, child_class,
                             child_role, allow_none, errp);
     if (bs == NULL) {
@@ -3465,6 +3501,8 @@ BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp)
     const char *reference = NULL;
     Visitor *v = NULL;
 
+    assert(qemu_in_main_thread());
+
     if (ref->type == QTYPE_QSTRING) {
         reference = ref->u.reference;
     } else {
@@ -3862,6 +3900,8 @@ close_and_fail:
 BlockDriverState *bdrv_open(const char *filename, const char *reference,
                             QDict *options, int flags, Error **errp)
 {
+    assert(qemu_in_main_thread());
+
     return bdrv_open_inherit(filename, reference, options, flags, NULL,
                              NULL, 0, errp);
 }
@@ -4116,12 +4156,15 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                     BlockDriverState *bs,
                                     QDict *options, bool keep_old_opts)
 {
+    assert(qemu_in_main_thread());
+
     return bdrv_reopen_queue_child(bs_queue, bs, options, NULL, 0, false,
                                    NULL, 0, keep_old_opts);
 }
 
 void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue)
 {
+    assert(qemu_in_main_thread());
     if (bs_queue) {
         BlockReopenQueueEntry *bs_entry, *next;
         QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
@@ -4269,6 +4312,8 @@ int bdrv_reopen(BlockDriverState *bs, QDict *opts, bool keep_old_opts,
     BlockReopenQueue *queue;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     bdrv_subtree_drained_begin(bs);
     if (ctx != qemu_get_aio_context()) {
         aio_context_release(ctx);
@@ -4290,6 +4335,8 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
 {
     QDict *opts = qdict_new();
 
+    assert(qemu_in_main_thread());
+
     qdict_put_bool(opts, BDRV_OPT_READ_ONLY, read_only);
 
     return bdrv_reopen(bs, opts, true, errp);
@@ -4744,6 +4791,7 @@ static void bdrv_close(BlockDriverState *bs)
 void bdrv_close_all(void)
 {
     assert(job_next(NULL) == NULL);
+    assert(qemu_in_main_thread());
 
     /* Drop references from requests still in flight, such as canceled block
      * jobs whose AIO context has not been polled yet */
@@ -5025,11 +5073,15 @@ out:
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp)
 {
+    assert(qemu_in_main_thread());
+
     return bdrv_replace_node_common(from, to, true, false, errp);
 }
 
 int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
 {
+    assert(qemu_in_main_thread());
+
     return bdrv_replace_node_common(bs, bdrv_filter_or_cow_bs(bs), true, true,
                                     errp);
 }
@@ -5052,6 +5104,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
     int ret;
     Transaction *tran = tran_new();
 
+    assert(qemu_in_main_thread());
+
     assert(!bs_new->backing);
 
     ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
@@ -5110,6 +5164,7 @@ static void bdrv_delete(BlockDriverState *bs)
 {
     assert(bdrv_op_blocker_is_empty(bs));
     assert(!bs->refcnt);
+    assert(qemu_in_main_thread());
 
     /* remove from list, if necessary */
     if (bs->node_name[0] != '\0') {
@@ -5154,6 +5209,8 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
 
     node_name = qdict_get_try_str(options, "node-name");
 
+    assert(qemu_in_main_thread());
+
     new_node_bs = bdrv_new_open_driver_opts(drv, node_name, options, flags,
                                             errp);
     options = NULL; /* bdrv_new_open_driver() eats options */
@@ -5214,6 +5271,8 @@ int bdrv_change_backing_file(BlockDriverState *bs, const char *backing_file,
     BlockDriver *drv = bs->drv;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     if (!drv) {
         return -ENOMEDIUM;
     }
@@ -5255,6 +5314,9 @@ int bdrv_change_backing_file(BlockDriverState *bs, const char *backing_file,
 BlockDriverState *bdrv_find_overlay(BlockDriverState *active,
                                     BlockDriverState *bs)
 {
+
+    assert(qemu_in_main_thread());
+
     bs = bdrv_skip_filters(bs);
     active = bdrv_skip_filters(active);
 
@@ -5272,6 +5334,8 @@ BlockDriverState *bdrv_find_overlay(BlockDriverState *active,
 /* Given a BDS, searches for the base layer. */
 BlockDriverState *bdrv_find_base(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
+
     return bdrv_find_overlay(bs, NULL);
 }
 
@@ -5286,6 +5350,8 @@ bool bdrv_is_backing_chain_frozen(BlockDriverState *bs, BlockDriverState *base,
     BlockDriverState *i;
     BdrvChild *child;
 
+    assert(qemu_in_main_thread());
+
     for (i = bs; i != base; i = child_bs(child)) {
         child = bdrv_filter_or_cow_child(i);
 
@@ -5312,6 +5378,8 @@ int bdrv_freeze_backing_chain(BlockDriverState *bs, BlockDriverState *base,
     BlockDriverState *i;
     BdrvChild *child;
 
+    assert(qemu_in_main_thread());
+
     if (bdrv_is_backing_chain_frozen(bs, base, errp)) {
         return -EPERM;
     }
@@ -5346,6 +5414,8 @@ void bdrv_unfreeze_backing_chain(BlockDriverState *bs, BlockDriverState *base)
     BlockDriverState *i;
     BdrvChild *child;
 
+    assert(qemu_in_main_thread());
+
     for (i = bs; i != base; i = child_bs(child)) {
         child = bdrv_filter_or_cow_child(i);
         if (child) {
@@ -5395,6 +5465,8 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
     g_autoptr(GSList) updated_children = NULL;
     GSList *p;
 
+    assert(qemu_in_main_thread());
+
     bdrv_ref(top);
     bdrv_subtree_drained_begin(top);
 
@@ -5606,7 +5678,6 @@ int64_t bdrv_getlength(BlockDriverState *bs)
 void bdrv_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr)
 {
     int64_t nb_sectors = bdrv_nb_sectors(bs);
-
     *nb_sectors_ptr = nb_sectors < 0 ? 0 : nb_sectors;
 }
 
@@ -5656,6 +5727,8 @@ void bdrv_iterate_format(void (*it)(void *opaque, const char *name),
     int i;
     const char **formats = NULL;
 
+    assert(qemu_in_main_thread());
+
     QLIST_FOREACH(drv, &bdrv_drivers, list) {
         if (drv->format_name) {
             bool found = false;
@@ -5714,6 +5787,7 @@ BlockDriverState *bdrv_find_node(const char *node_name)
     BlockDriverState *bs;
 
     assert(node_name);
+    assert(qemu_in_main_thread());
 
     QTAILQ_FOREACH(bs, &graph_bdrv_states, node_list) {
         if (!strcmp(node_name, bs->node_name)) {
@@ -5730,6 +5804,8 @@ BlockDeviceInfoList *bdrv_named_nodes_list(bool flat,
     BlockDeviceInfoList *list;
     BlockDriverState *bs;
 
+    assert(qemu_in_main_thread());
+
     list = NULL;
     QTAILQ_FOREACH(bs, &graph_bdrv_states, node_list) {
         BlockDeviceInfo *info = bdrv_block_device_info(NULL, bs, flat, errp);
@@ -5835,6 +5911,8 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
     BdrvChild *child;
     XDbgBlockGraphConstructor *gr = xdbg_graph_new();
 
+    assert(qemu_in_main_thread());
+
     for (blk = blk_all_next(NULL); blk; blk = blk_all_next(blk)) {
         char *allocated_name = NULL;
         const char *name = blk_name(blk);
@@ -5878,6 +5956,8 @@ BlockDriverState *bdrv_lookup_bs(const char *device,
     BlockBackend *blk;
     BlockDriverState *bs;
 
+    assert(qemu_in_main_thread());
+
     if (device) {
         blk = blk_by_name(device);
 
@@ -5909,6 +5989,9 @@ BlockDriverState *bdrv_lookup_bs(const char *device,
  * return false.  If either argument is NULL, return false. */
 bool bdrv_chain_contains(BlockDriverState *top, BlockDriverState *base)
 {
+
+    assert(qemu_in_main_thread());
+
     while (top && top != base) {
         top = bdrv_filter_or_cow_bs(top);
     }
@@ -5918,6 +6001,7 @@ bool bdrv_chain_contains(BlockDriverState *top, BlockDriverState *base)
 
 BlockDriverState *bdrv_next_node(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     if (!bs) {
         return QTAILQ_FIRST(&graph_bdrv_states);
     }
@@ -5926,6 +6010,7 @@ BlockDriverState *bdrv_next_node(BlockDriverState *bs)
 
 BlockDriverState *bdrv_next_all_states(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     if (!bs) {
         return QTAILQ_FIRST(&all_bdrv_states);
     }
@@ -5958,6 +6043,7 @@ const char *bdrv_get_parent_name(const BlockDriverState *bs)
 /* TODO check what callers really want: bs->node_name or blk_name() */
 const char *bdrv_get_device_name(const BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     return bdrv_get_parent_name(bs) ?: "";
 }
 
@@ -5967,22 +6053,26 @@ const char *bdrv_get_device_name(const BlockDriverState *bs)
  * absent, then this returns an empty (non-null) string. */
 const char *bdrv_get_device_or_node_name(const BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     return bdrv_get_parent_name(bs) ?: bs->node_name;
 }
 
 int bdrv_get_flags(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     return bs->open_flags;
 }
 
 int bdrv_has_zero_init_1(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     return 1;
 }
 
 int bdrv_has_zero_init(BlockDriverState *bs)
 {
     BlockDriverState *filtered;
+    assert(qemu_in_main_thread());
 
     if (!bs->drv) {
         return 0;
@@ -6079,6 +6169,7 @@ void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 
 static BlockDriverState *bdrv_find_debug_node(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     while (bs && bs->drv && !bs->drv->bdrv_debug_breakpoint) {
         bs = bdrv_primary_bs(bs);
     }
@@ -6094,6 +6185,7 @@ static BlockDriverState *bdrv_find_debug_node(BlockDriverState *bs)
 int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
                           const char *tag)
 {
+    assert(qemu_in_main_thread());
     bs = bdrv_find_debug_node(bs);
     if (bs) {
         return bs->drv->bdrv_debug_breakpoint(bs, event, tag);
@@ -6104,6 +6196,7 @@ int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
 
 int bdrv_debug_remove_breakpoint(BlockDriverState *bs, const char *tag)
 {
+    assert(qemu_in_main_thread());
     bs = bdrv_find_debug_node(bs);
     if (bs) {
         return bs->drv->bdrv_debug_remove_breakpoint(bs, tag);
@@ -6114,6 +6207,7 @@ int bdrv_debug_remove_breakpoint(BlockDriverState *bs, const char *tag)
 
 int bdrv_debug_resume(BlockDriverState *bs, const char *tag)
 {
+    assert(qemu_in_main_thread());
     while (bs && (!bs->drv || !bs->drv->bdrv_debug_resume)) {
         bs = bdrv_primary_bs(bs);
     }
@@ -6127,6 +6221,7 @@ int bdrv_debug_resume(BlockDriverState *bs, const char *tag)
 
 bool bdrv_debug_is_suspended(BlockDriverState *bs, const char *tag)
 {
+    assert(qemu_in_main_thread());
     while (bs && bs->drv && !bs->drv->bdrv_debug_is_suspended) {
         bs = bdrv_primary_bs(bs);
     }
@@ -6154,6 +6249,8 @@ BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
     BlockDriverState *retval = NULL;
     BlockDriverState *bs_below;
 
+    assert(qemu_in_main_thread());
+
     if (!bs || !bs->drv || !backing_file) {
         return NULL;
     }
@@ -6252,6 +6349,7 @@ BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
 
 void bdrv_init(void)
 {
+    assert(qemu_in_main_thread());
 #ifdef CONFIG_BDRV_WHITELIST_TOOLS
     use_bdrv_whitelist = 1;
 #endif
@@ -6260,6 +6358,7 @@ void bdrv_init(void)
 
 void bdrv_init_with_whitelist(void)
 {
+    assert(qemu_in_main_thread());
     use_bdrv_whitelist = 1;
     bdrv_init();
 }
@@ -6344,6 +6443,8 @@ void bdrv_invalidate_cache_all(Error **errp)
     BlockDriverState *bs;
     BdrvNextIterator it;
 
+    assert(qemu_in_main_thread());
+
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
         AioContext *aio_context = bdrv_get_aio_context(bs);
         int ret;
@@ -6443,6 +6544,8 @@ int bdrv_inactivate_all(void)
     int ret = 0;
     GSList *aio_ctxs = NULL, *ctx;
 
+    assert(qemu_in_main_thread());
+
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
@@ -6520,6 +6623,7 @@ void bdrv_eject(BlockDriverState *bs, bool eject_flag)
 void bdrv_lock_medium(BlockDriverState *bs, bool locked)
 {
     BlockDriver *drv = bs->drv;
+    assert(qemu_in_main_thread());
 
     trace_bdrv_lock_medium(bs, locked);
 
@@ -6531,6 +6635,7 @@ void bdrv_lock_medium(BlockDriverState *bs, bool locked)
 /* Get a reference to bs */
 void bdrv_ref(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     bs->refcnt++;
 }
 
@@ -6539,6 +6644,7 @@ void bdrv_ref(BlockDriverState *bs)
  * deleted. */
 void bdrv_unref(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     if (!bs) {
         return;
     }
@@ -6556,6 +6662,7 @@ struct BdrvOpBlocker {
 bool bdrv_op_is_blocked(BlockDriverState *bs, BlockOpType op, Error **errp)
 {
     BdrvOpBlocker *blocker;
+    assert(qemu_in_main_thread());
     assert((int) op >= 0 && op < BLOCK_OP_TYPE_MAX);
     if (!QLIST_EMPTY(&bs->op_blockers[op])) {
         blocker = QLIST_FIRST(&bs->op_blockers[op]);
@@ -6570,6 +6677,7 @@ bool bdrv_op_is_blocked(BlockDriverState *bs, BlockOpType op, Error **errp)
 void bdrv_op_block(BlockDriverState *bs, BlockOpType op, Error *reason)
 {
     BdrvOpBlocker *blocker;
+    assert(qemu_in_main_thread());
     assert((int) op >= 0 && op < BLOCK_OP_TYPE_MAX);
 
     blocker = g_new0(BdrvOpBlocker, 1);
@@ -6580,6 +6688,7 @@ void bdrv_op_block(BlockDriverState *bs, BlockOpType op, Error *reason)
 void bdrv_op_unblock(BlockDriverState *bs, BlockOpType op, Error *reason)
 {
     BdrvOpBlocker *blocker, *next;
+    assert(qemu_in_main_thread());
     assert((int) op >= 0 && op < BLOCK_OP_TYPE_MAX);
     QLIST_FOREACH_SAFE(blocker, &bs->op_blockers[op], list, next) {
         if (blocker->reason == reason) {
@@ -6592,6 +6701,7 @@ void bdrv_op_unblock(BlockDriverState *bs, BlockOpType op, Error *reason)
 void bdrv_op_block_all(BlockDriverState *bs, Error *reason)
 {
     int i;
+    assert(qemu_in_main_thread());
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         bdrv_op_block(bs, i, reason);
     }
@@ -6600,6 +6710,7 @@ void bdrv_op_block_all(BlockDriverState *bs, Error *reason)
 void bdrv_op_unblock_all(BlockDriverState *bs, Error *reason)
 {
     int i;
+    assert(qemu_in_main_thread());
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         bdrv_op_unblock(bs, i, reason);
     }
@@ -6608,7 +6719,7 @@ void bdrv_op_unblock_all(BlockDriverState *bs, Error *reason)
 bool bdrv_op_blocker_is_empty(BlockDriverState *bs)
 {
     int i;
-
+    assert(qemu_in_main_thread());
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         if (!QLIST_EMPTY(&bs->op_blockers[i])) {
             return false;
@@ -6630,6 +6741,8 @@ void bdrv_img_create(const char *filename, const char *fmt,
     Error *local_err = NULL;
     int ret = 0;
 
+    assert(qemu_in_main_thread());
+
     /* Find driver and parse its options */
     drv = bdrv_find_format(fmt);
     if (!drv) {
@@ -7046,6 +7159,7 @@ static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
 bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
                                     GSList **ignore, Error **errp)
 {
+    assert(qemu_in_main_thread());
     if (g_slist_find(*ignore, c)) {
         return true;
     }
@@ -7064,6 +7178,8 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
         return true;
     }
 
+    assert(qemu_in_main_thread());
+
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         if (!bdrv_parent_can_set_aio_context(c, ctx, ignore, errp)) {
             return false;
@@ -7084,6 +7200,8 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
     GSList *ignore;
     bool ret;
 
+    assert(qemu_in_main_thread());
+
     ignore = ignore_child ? g_slist_prepend(NULL, ignore_child) : NULL;
     ret = bdrv_can_set_aio_context(bs, ctx, &ignore, errp);
     g_slist_free(ignore);
@@ -7102,6 +7220,7 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
 int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                              Error **errp)
 {
+    assert(qemu_in_main_thread());
     return bdrv_child_try_set_aio_context(bs, ctx, NULL, errp);
 }
 
@@ -7115,6 +7234,7 @@ void bdrv_add_aio_context_notifier(BlockDriverState *bs,
         .detach_aio_context   = detach_aio_context,
         .opaque               = opaque
     };
+    assert(qemu_in_main_thread());
 
     QLIST_INSERT_HEAD(&bs->aio_notifiers, ban, list);
 }
@@ -7126,6 +7246,7 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
                                       void *opaque)
 {
     BdrvAioNotifier *ban, *ban_next;
+    assert(qemu_in_main_thread());
 
     QLIST_FOREACH_SAFE(ban, &bs->aio_notifiers, list, ban_next) {
         if (ban->attached_aio_context == attached_aio_context &&
@@ -7150,6 +7271,7 @@ int bdrv_amend_options(BlockDriverState *bs, QemuOpts *opts,
                        bool force,
                        Error **errp)
 {
+    assert(qemu_in_main_thread());
     if (!bs->drv) {
         error_setg(errp, "Node is ejected");
         return -ENOMEDIUM;
@@ -7220,6 +7342,8 @@ BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
     BlockDriverState *to_replace_bs = bdrv_find_node(node_name);
     AioContext *aio_context;
 
+    assert(qemu_in_main_thread());
+
     if (!to_replace_bs) {
         error_setg(errp, "Failed to find node with node-name='%s'", node_name);
         return NULL;
@@ -7381,6 +7505,8 @@ void bdrv_refresh_filename(BlockDriverState *bs)
     bool generate_json_filename; /* Whether our default implementation should
                                     fill exact_filename (false) or not (true) */
 
+    assert(qemu_in_main_thread());
+
     if (!drv) {
         return;
     }
@@ -7503,6 +7629,8 @@ char *bdrv_dirname(BlockDriverState *bs, Error **errp)
     BlockDriver *drv = bs->drv;
     BlockDriverState *child_bs;
 
+    assert(qemu_in_main_thread());
+
     if (!drv) {
         error_setg(errp, "Node '%s' is ejected", bs->node_name);
         return NULL;
@@ -7534,7 +7662,7 @@ char *bdrv_dirname(BlockDriverState *bs, Error **errp)
 void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
                     Error **errp)
 {
-
+    assert(qemu_in_main_thread());
     if (!parent_bs->drv || !parent_bs->drv->bdrv_add_child) {
         error_setg(errp, "The node %s does not support adding a child",
                    bdrv_get_device_or_node_name(parent_bs));
@@ -7554,6 +7682,7 @@ void bdrv_del_child(BlockDriverState *parent_bs, BdrvChild *child, Error **errp)
 {
     BdrvChild *tmp;
 
+    assert(qemu_in_main_thread());
     if (!parent_bs->drv || !parent_bs->drv->bdrv_del_child) {
         error_setg(errp, "The node %s does not support removing a child",
                    bdrv_get_device_or_node_name(parent_bs));
@@ -7581,6 +7710,7 @@ int bdrv_make_empty(BdrvChild *c, Error **errp)
     BlockDriver *drv = c->bs->drv;
     int ret;
 
+    assert(qemu_in_main_thread());
     assert(c->perm & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED));
 
     if (!drv->bdrv_make_empty) {
diff --git a/block/commit.c b/block/commit.c
index 10cc5ff451..45a414a19b 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -433,6 +433,8 @@ int bdrv_commit(BlockDriverState *bs)
     QEMU_AUTO_VFREE uint8_t *buf = NULL;
     Error *local_err = NULL;
 
+    assert(qemu_in_main_thread());
+
     if (!drv)
         return -ENOMEDIUM;
 
diff --git a/block/io.c b/block/io.c
index bb0a254def..c5d7f8495e 100644
--- a/block/io.c
+++ b/block/io.c
@@ -164,6 +164,8 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
     BdrvChild *c;
     bool have_limits;
 
+    assert(qemu_in_main_thread());
+
     if (tran) {
         BdrvRefreshLimitsState *s = g_new(BdrvRefreshLimitsState, 1);
         *s = (BdrvRefreshLimitsState) {
@@ -544,6 +546,7 @@ void bdrv_drained_end(BlockDriverState *bs)
 
 void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_counter)
 {
+    assert(qemu_in_main_thread());
     bdrv_do_drained_end(bs, false, NULL, false, drained_end_counter);
 }
 
@@ -586,12 +589,14 @@ void bdrv_unapply_subtree_drain(BdrvChild *child, BlockDriverState *old_parent)
 void coroutine_fn bdrv_co_drain(BlockDriverState *bs)
 {
     assert(qemu_in_coroutine());
+    assert(qemu_in_main_thread());
     bdrv_drained_begin(bs);
     bdrv_drained_end(bs);
 }
 
 void bdrv_drain(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     bdrv_drained_begin(bs);
     bdrv_drained_end(bs);
 }
@@ -612,6 +617,7 @@ static bool bdrv_drain_all_poll(void)
 {
     BlockDriverState *bs = NULL;
     bool result = false;
+    assert(qemu_in_main_thread());
 
     /* bdrv_drain_poll() can't make changes to the graph and we are holding the
      * main AioContext lock, so iterating bdrv_next_all_states() is safe. */
@@ -640,6 +646,7 @@ static bool bdrv_drain_all_poll(void)
 void bdrv_drain_all_begin(void)
 {
     BlockDriverState *bs = NULL;
+    assert(qemu_in_main_thread());
 
     if (qemu_in_coroutine()) {
         bdrv_co_yield_to_drain(NULL, true, false, NULL, true, true, NULL);
@@ -696,6 +703,7 @@ void bdrv_drain_all_end(void)
 {
     BlockDriverState *bs = NULL;
     int drained_end_counter = 0;
+    assert(qemu_in_main_thread());
 
     /*
      * bdrv queue is managed by record/replay,
@@ -723,6 +731,7 @@ void bdrv_drain_all_end(void)
 
 void bdrv_drain_all(void)
 {
+    assert(qemu_in_main_thread());
     bdrv_drain_all_begin();
     bdrv_drain_all_end();
 }
@@ -2345,6 +2354,8 @@ int bdrv_flush_all(void)
     BlockDriverState *bs = NULL;
     int result = 0;
 
+    assert(qemu_in_main_thread());
+
     /*
      * bdrv queue is managed by record/replay,
      * creating new flush request for stopping
@@ -2731,6 +2742,7 @@ int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
 int bdrv_block_status(BlockDriverState *bs, int64_t offset, int64_t bytes,
                       int64_t *pnum, int64_t *map, BlockDriverState **file)
 {
+    assert(qemu_in_main_thread());
     return bdrv_block_status_above(bs, bdrv_filter_or_cow_bs(bs),
                                    offset, bytes, pnum, map, file);
 }
@@ -2800,6 +2812,7 @@ int bdrv_is_allocated_above(BlockDriverState *top,
                             int64_t bytes, int64_t *pnum)
 {
     int depth;
+
     int ret = bdrv_common_block_status_above(top, base, include_base, false,
                                              offset, bytes, pnum, NULL, NULL,
                                              &depth);
@@ -2878,6 +2891,7 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
 int bdrv_save_vmstate(BlockDriverState *bs, const uint8_t *buf,
                       int64_t pos, int size)
 {
+    assert(qemu_in_main_thread());
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, size);
     int ret = bdrv_writev_vmstate(bs, &qiov, pos);
 
@@ -2887,6 +2901,7 @@ int bdrv_save_vmstate(BlockDriverState *bs, const uint8_t *buf,
 int bdrv_load_vmstate(BlockDriverState *bs, uint8_t *buf,
                       int64_t pos, int size)
 {
+    assert(qemu_in_main_thread());
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, size);
     int ret = bdrv_readv_vmstate(bs, &qiov, pos);
 
@@ -2898,6 +2913,7 @@ int bdrv_load_vmstate(BlockDriverState *bs, uint8_t *buf,
 
 void bdrv_aio_cancel(BlockAIOCB *acb)
 {
+    assert(qemu_in_main_thread());
     qemu_aio_ref(acb);
     bdrv_aio_cancel_async(acb);
     while (acb->refcnt > 1) {
@@ -2922,6 +2938,7 @@ void bdrv_aio_cancel(BlockAIOCB *acb)
  * In either case the completion callback must be called. */
 void bdrv_aio_cancel_async(BlockAIOCB *acb)
 {
+    assert(qemu_in_main_thread());
     if (acb->aiocb_info->cancel_async) {
         acb->aiocb_info->cancel_async(acb);
     }
@@ -3292,6 +3309,7 @@ void bdrv_register_buf(BlockDriverState *bs, void *host, size_t size)
 {
     BdrvChild *child;
 
+    assert(qemu_in_main_thread());
     if (bs->drv && bs->drv->bdrv_register_buf) {
         bs->drv->bdrv_register_buf(bs, host, size);
     }
@@ -3304,6 +3322,7 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host)
 {
     BdrvChild *child;
 
+    assert(qemu_in_main_thread());
     if (bs->drv && bs->drv->bdrv_unregister_buf) {
         bs->drv->bdrv_unregister_buf(bs, host);
     }
@@ -3575,6 +3594,7 @@ out:
 
 void bdrv_cancel_in_flight(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     if (!bs || !bs->drv) {
         return;
     }
diff --git a/blockdev.c b/blockdev.c
index b35072644e..ae322ed10e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -690,6 +690,7 @@ void blockdev_close_all_bdrv_states(void)
 /* Iterates over the list of monitor-owned BlockDriverStates */
 BlockDriverState *bdrv_next_monitor_owned(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     return bs ? QTAILQ_NEXT(bs, monitor_list)
               : QTAILQ_FIRST(&monitor_bdrv_states);
 }
-- 
2.27.0


