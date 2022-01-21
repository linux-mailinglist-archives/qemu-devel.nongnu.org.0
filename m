Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F93496398
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 18:13:02 +0100 (CET)
Received: from localhost ([::1]:36040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAxTB-0004mH-8B
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 12:13:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxMc-0007GZ-6g
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxMW-0007iT-Dk
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LYuKwrzTD9iKS9g69YpAwJ7+e1yjiXDfOwwdf1ji+Sk=;
 b=JFrq8yTYSYgdHoQMvTTKlZKpUMSNTtIEzoeHA74oo5z2InC+uTRlj+69RnfDtVWXyTXu4P
 4A8b2mXr83rvWeVClR6YkGzkLPgKK1xLpE3tme8gdvTuFYcKPa5QxmVpRK5QRy2P3v7Omt
 EQXswQ1W/QPiEXElOFf29PJlGr3hk9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-cAGt-QinOQCgwzrN_54U1A-1; Fri, 21 Jan 2022 12:06:06 -0500
X-MC-Unique: cAGt-QinOQCgwzrN_54U1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5548C760E3;
 Fri, 21 Jan 2022 17:06:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A16767EFC3;
 Fri, 21 Jan 2022 17:06:02 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 03/33] assertions for block global state API
Date: Fri, 21 Jan 2022 12:05:14 -0500
Message-Id: <20220121170544.2049944-4-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 block.c        | 133 ++++++++++++++++++++++++++++++++++++++++++++++++-
 block/commit.c |   2 +
 block/io.c     |  14 ++++++
 blockdev.c     |   1 +
 4 files changed, 148 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 097822b69a..e66ce1400a 100644
--- a/block.c
+++ b/block.c
@@ -278,6 +278,8 @@ bool bdrv_is_read_only(BlockDriverState *bs)
 int bdrv_can_set_read_only(BlockDriverState *bs, bool read_only,
                            bool ignore_allow_rdw, Error **errp)
 {
+    assert(qemu_in_main_thread());
+
     /* Do not set read_only if copy_on_read is enabled */
     if (bs->copy_on_read && read_only) {
         error_setg(errp, "Can't set node '%s' to r/o with copy-on-read enabled",
@@ -311,6 +313,7 @@ int bdrv_apply_auto_read_only(BlockDriverState *bs, const char *errmsg,
                               Error **errp)
 {
     int ret = 0;
+    assert(qemu_in_main_thread());
 
     if (!(bs->open_flags & BDRV_O_RDWR)) {
         return 0;
@@ -393,6 +396,7 @@ char *bdrv_get_full_backing_filename(BlockDriverState *bs, Error **errp)
 void bdrv_register(BlockDriver *bdrv)
 {
     assert(bdrv->format_name);
+    assert(qemu_in_main_thread());
     QLIST_INSERT_HEAD(&bdrv_drivers, bdrv, list);
 }
 
@@ -401,6 +405,8 @@ BlockDriverState *bdrv_new(void)
     BlockDriverState *bs;
     int i;
 
+    assert(qemu_in_main_thread());
+
     bs = g_new0(BlockDriverState, 1);
     QLIST_INIT(&bs->dirty_bitmaps);
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
@@ -443,6 +449,8 @@ BlockDriver *bdrv_find_format(const char *format_name)
     BlockDriver *drv1;
     int i;
 
+    assert(qemu_in_main_thread());
+
     drv1 = bdrv_do_find_format(format_name);
     if (drv1) {
         return drv1;
@@ -492,11 +500,13 @@ static int bdrv_format_is_whitelisted(const char *format_name, bool read_only)
 
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
 
@@ -527,6 +537,8 @@ int bdrv_create(BlockDriver *drv, const char* filename,
 {
     int ret;
 
+    assert(qemu_in_main_thread());
+
     Coroutine *co;
     CreateCo cco = {
         .drv = drv,
@@ -702,6 +714,8 @@ int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
     QDict *qdict;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     drv = bdrv_find_protocol(filename, true, errp);
     if (drv == NULL) {
         return -ENOENT;
@@ -799,6 +813,7 @@ int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *filtered = bdrv_filter_bs(bs);
+    assert(qemu_in_main_thread());
 
     if (drv && drv->bdrv_probe_blocksizes) {
         return drv->bdrv_probe_blocksizes(bs, bsz);
@@ -819,6 +834,7 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *filtered = bdrv_filter_bs(bs);
+    assert(qemu_in_main_thread());
 
     if (drv && drv->bdrv_probe_geometry) {
         return drv->bdrv_probe_geometry(bs, geo);
@@ -910,6 +926,7 @@ BlockDriver *bdrv_find_protocol(const char *filename,
     const char *p;
     int i;
 
+    assert(qemu_in_main_thread());
     /* TODO Drivers without bdrv_file_open must be specified explicitly */
 
     /*
@@ -1122,6 +1139,7 @@ int bdrv_parse_aio(const char *mode, int *flags)
  */
 int bdrv_parse_discard_flags(const char *mode, int *flags)
 {
+    assert(qemu_in_main_thread());
     *flags &= ~BDRV_O_UNMAP;
 
     if (!strcmp(mode, "off") || !strcmp(mode, "ignore")) {
@@ -1142,6 +1160,7 @@ int bdrv_parse_discard_flags(const char *mode, int *flags)
  */
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough)
 {
+    assert(qemu_in_main_thread());
     *flags &= ~BDRV_O_CACHE_MASK;
 
     if (!strcmp(mode, "off") || !strcmp(mode, "none")) {
@@ -1634,6 +1653,8 @@ BlockDriverState *bdrv_new_open_driver_opts(BlockDriver *drv,
     BlockDriverState *bs;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     bs = bdrv_new();
     bs->open_flags = flags;
     bs->options = options ?: qdict_new();
@@ -1659,6 +1680,7 @@ BlockDriverState *bdrv_new_open_driver_opts(BlockDriver *drv,
 BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
                                        int flags, Error **errp)
 {
+    assert(qemu_in_main_thread());
     return bdrv_new_open_driver_opts(drv, node_name, NULL, flags, errp);
 }
 
@@ -2480,6 +2502,8 @@ void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
 
 char *bdrv_perm_names(uint64_t perm)
 {
+    assert(qemu_in_main_thread());
+
     struct perm_name {
         uint64_t perm;
         const char *name;
@@ -2716,6 +2740,8 @@ void bdrv_default_perms(BlockDriverState *bs, BdrvChild *c,
 
 uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
 {
+    assert(qemu_in_main_thread());
+
     static const uint64_t permissions[] = {
         [BLOCK_PERMISSION_CONSISTENT_READ]  = BLK_PERM_CONSISTENT_READ,
         [BLOCK_PERMISSION_WRITE]            = BLK_PERM_WRITE,
@@ -3094,6 +3120,8 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
     BdrvChild *child = NULL;
     Transaction *tran = tran_new();
 
+    assert(qemu_in_main_thread());
+
     ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name, child_class,
                                    child_role, &child, tran, errp);
     if (ret < 0) {
@@ -3120,6 +3148,8 @@ void bdrv_root_unref_child(BdrvChild *child)
 {
     BlockDriverState *child_bs;
 
+    assert(qemu_in_main_thread());
+
     child_bs = child->bs;
     bdrv_detach_child(&child);
     bdrv_unref(child_bs);
@@ -3194,6 +3224,7 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
 /* Callers must ensure that child->frozen is false. */
 void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
 {
+    assert(qemu_in_main_thread());
     if (child == NULL) {
         return;
     }
@@ -3344,6 +3375,8 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
     int ret;
     Transaction *tran = tran_new();
 
+    assert(qemu_in_main_thread());
+
     ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
     if (ret < 0) {
         goto out;
@@ -3379,6 +3412,8 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
     QDict *tmp_parent_options = NULL;
     Error *local_err = NULL;
 
+    assert(qemu_in_main_thread());
+
     if (bs->backing != NULL) {
         goto free_exit;
     }
@@ -3538,6 +3573,8 @@ BdrvChild *bdrv_open_child(const char *filename,
 {
     BlockDriverState *bs;
 
+    assert(qemu_in_main_thread());
+
     bs = bdrv_open_child_bs(filename, options, bdref_key, parent, child_class,
                             child_role, allow_none, errp);
     if (bs == NULL) {
@@ -3560,6 +3597,8 @@ BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp)
     const char *reference = NULL;
     Visitor *v = NULL;
 
+    assert(qemu_in_main_thread());
+
     if (ref->type == QTYPE_QSTRING) {
         reference = ref->u.reference;
     } else {
@@ -3957,6 +3996,8 @@ close_and_fail:
 BlockDriverState *bdrv_open(const char *filename, const char *reference,
                             QDict *options, int flags, Error **errp)
 {
+    assert(qemu_in_main_thread());
+
     return bdrv_open_inherit(filename, reference, options, flags, NULL,
                              NULL, 0, errp);
 }
@@ -4211,12 +4252,15 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
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
@@ -4364,6 +4408,8 @@ int bdrv_reopen(BlockDriverState *bs, QDict *opts, bool keep_old_opts,
     BlockReopenQueue *queue;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     bdrv_subtree_drained_begin(bs);
     if (ctx != qemu_get_aio_context()) {
         aio_context_release(ctx);
@@ -4385,6 +4431,8 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
 {
     QDict *opts = qdict_new();
 
+    assert(qemu_in_main_thread());
+
     qdict_put_bool(opts, BDRV_OPT_READ_ONLY, read_only);
 
     return bdrv_reopen(bs, opts, true, errp);
@@ -4839,6 +4887,7 @@ static void bdrv_close(BlockDriverState *bs)
 void bdrv_close_all(void)
 {
     assert(job_next(NULL) == NULL);
+    assert(qemu_in_main_thread());
 
     /* Drop references from requests still in flight, such as canceled block
      * jobs whose AIO context has not been polled yet */
@@ -5153,11 +5202,15 @@ out:
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
@@ -5180,6 +5233,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
     int ret;
     Transaction *tran = tran_new();
 
+    assert(qemu_in_main_thread());
+
     assert(!bs_new->backing);
 
     ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
@@ -5213,6 +5268,8 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     g_autoptr(GSList) refresh_list = NULL;
     BlockDriverState *old_bs = child->bs;
 
+    assert(qemu_in_main_thread());
+
     bdrv_ref(old_bs);
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
@@ -5284,6 +5341,8 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
 
     node_name = qdict_get_try_str(options, "node-name");
 
+    assert(qemu_in_main_thread());
+
     new_node_bs = bdrv_new_open_driver_opts(drv, node_name, options, flags,
                                             errp);
     options = NULL; /* bdrv_new_open_driver() eats options */
@@ -5344,6 +5403,8 @@ int bdrv_change_backing_file(BlockDriverState *bs, const char *backing_file,
     BlockDriver *drv = bs->drv;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     if (!drv) {
         return -ENOMEDIUM;
     }
@@ -5385,6 +5446,9 @@ int bdrv_change_backing_file(BlockDriverState *bs, const char *backing_file,
 BlockDriverState *bdrv_find_overlay(BlockDriverState *active,
                                     BlockDriverState *bs)
 {
+
+    assert(qemu_in_main_thread());
+
     bs = bdrv_skip_filters(bs);
     active = bdrv_skip_filters(active);
 
@@ -5402,6 +5466,8 @@ BlockDriverState *bdrv_find_overlay(BlockDriverState *active,
 /* Given a BDS, searches for the base layer. */
 BlockDriverState *bdrv_find_base(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
+
     return bdrv_find_overlay(bs, NULL);
 }
 
@@ -5416,6 +5482,8 @@ bool bdrv_is_backing_chain_frozen(BlockDriverState *bs, BlockDriverState *base,
     BlockDriverState *i;
     BdrvChild *child;
 
+    assert(qemu_in_main_thread());
+
     for (i = bs; i != base; i = child_bs(child)) {
         child = bdrv_filter_or_cow_child(i);
 
@@ -5442,6 +5510,8 @@ int bdrv_freeze_backing_chain(BlockDriverState *bs, BlockDriverState *base,
     BlockDriverState *i;
     BdrvChild *child;
 
+    assert(qemu_in_main_thread());
+
     if (bdrv_is_backing_chain_frozen(bs, base, errp)) {
         return -EPERM;
     }
@@ -5476,6 +5546,8 @@ void bdrv_unfreeze_backing_chain(BlockDriverState *bs, BlockDriverState *base)
     BlockDriverState *i;
     BdrvChild *child;
 
+    assert(qemu_in_main_thread());
+
     for (i = bs; i != base; i = child_bs(child)) {
         child = bdrv_filter_or_cow_child(i);
         if (child) {
@@ -5525,6 +5597,8 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
     g_autoptr(GSList) updated_children = NULL;
     GSList *p;
 
+    assert(qemu_in_main_thread());
+
     bdrv_ref(top);
     bdrv_subtree_drained_begin(top);
 
@@ -5784,6 +5858,8 @@ void bdrv_iterate_format(void (*it)(void *opaque, const char *name),
     int i;
     const char **formats = NULL;
 
+    assert(qemu_in_main_thread());
+
     QLIST_FOREACH(drv, &bdrv_drivers, list) {
         if (drv->format_name) {
             bool found = false;
@@ -5842,6 +5918,7 @@ BlockDriverState *bdrv_find_node(const char *node_name)
     BlockDriverState *bs;
 
     assert(node_name);
+    assert(qemu_in_main_thread());
 
     QTAILQ_FOREACH(bs, &graph_bdrv_states, node_list) {
         if (!strcmp(node_name, bs->node_name)) {
@@ -5858,6 +5935,8 @@ BlockDeviceInfoList *bdrv_named_nodes_list(bool flat,
     BlockDeviceInfoList *list;
     BlockDriverState *bs;
 
+    assert(qemu_in_main_thread());
+
     list = NULL;
     QTAILQ_FOREACH(bs, &graph_bdrv_states, node_list) {
         BlockDeviceInfo *info = bdrv_block_device_info(NULL, bs, flat, errp);
@@ -5963,6 +6042,8 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
     BdrvChild *child;
     XDbgBlockGraphConstructor *gr = xdbg_graph_new();
 
+    assert(qemu_in_main_thread());
+
     for (blk = blk_all_next(NULL); blk; blk = blk_all_next(blk)) {
         char *allocated_name = NULL;
         const char *name = blk_name(blk);
@@ -6006,6 +6087,8 @@ BlockDriverState *bdrv_lookup_bs(const char *device,
     BlockBackend *blk;
     BlockDriverState *bs;
 
+    assert(qemu_in_main_thread());
+
     if (device) {
         blk = blk_by_name(device);
 
@@ -6037,6 +6120,9 @@ BlockDriverState *bdrv_lookup_bs(const char *device,
  * return false.  If either argument is NULL, return false. */
 bool bdrv_chain_contains(BlockDriverState *top, BlockDriverState *base)
 {
+
+    assert(qemu_in_main_thread());
+
     while (top && top != base) {
         top = bdrv_filter_or_cow_bs(top);
     }
@@ -6046,6 +6132,7 @@ bool bdrv_chain_contains(BlockDriverState *top, BlockDriverState *base)
 
 BlockDriverState *bdrv_next_node(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     if (!bs) {
         return QTAILQ_FIRST(&graph_bdrv_states);
     }
@@ -6054,6 +6141,7 @@ BlockDriverState *bdrv_next_node(BlockDriverState *bs)
 
 BlockDriverState *bdrv_next_all_states(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     if (!bs) {
         return QTAILQ_FIRST(&all_bdrv_states);
     }
@@ -6100,17 +6188,20 @@ const char *bdrv_get_device_or_node_name(const BlockDriverState *bs)
 
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
@@ -6222,6 +6313,7 @@ static BlockDriverState *bdrv_find_debug_node(BlockDriverState *bs)
 int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
                           const char *tag)
 {
+    assert(qemu_in_main_thread());
     bs = bdrv_find_debug_node(bs);
     if (bs) {
         return bs->drv->bdrv_debug_breakpoint(bs, event, tag);
@@ -6232,6 +6324,7 @@ int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
 
 int bdrv_debug_remove_breakpoint(BlockDriverState *bs, const char *tag)
 {
+    assert(qemu_in_main_thread());
     bs = bdrv_find_debug_node(bs);
     if (bs) {
         return bs->drv->bdrv_debug_remove_breakpoint(bs, tag);
@@ -6242,6 +6335,7 @@ int bdrv_debug_remove_breakpoint(BlockDriverState *bs, const char *tag)
 
 int bdrv_debug_resume(BlockDriverState *bs, const char *tag)
 {
+    assert(qemu_in_main_thread());
     while (bs && (!bs->drv || !bs->drv->bdrv_debug_resume)) {
         bs = bdrv_primary_bs(bs);
     }
@@ -6255,6 +6349,7 @@ int bdrv_debug_resume(BlockDriverState *bs, const char *tag)
 
 bool bdrv_debug_is_suspended(BlockDriverState *bs, const char *tag)
 {
+    assert(qemu_in_main_thread());
     while (bs && bs->drv && !bs->drv->bdrv_debug_is_suspended) {
         bs = bdrv_primary_bs(bs);
     }
@@ -6282,6 +6377,8 @@ BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
     BlockDriverState *retval = NULL;
     BlockDriverState *bs_below;
 
+    assert(qemu_in_main_thread());
+
     if (!bs || !bs->drv || !backing_file) {
         return NULL;
     }
@@ -6380,6 +6477,7 @@ BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
 
 void bdrv_init(void)
 {
+    assert(qemu_in_main_thread());
 #ifdef CONFIG_BDRV_WHITELIST_TOOLS
     use_bdrv_whitelist = 1;
 #endif
@@ -6388,6 +6486,7 @@ void bdrv_init(void)
 
 void bdrv_init_with_whitelist(void)
 {
+    assert(qemu_in_main_thread());
     use_bdrv_whitelist = 1;
     bdrv_init();
 }
@@ -6472,6 +6571,8 @@ void bdrv_invalidate_cache_all(Error **errp)
     BlockDriverState *bs;
     BdrvNextIterator it;
 
+    assert(qemu_in_main_thread());
+
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
         AioContext *aio_context = bdrv_get_aio_context(bs);
         int ret;
@@ -6571,6 +6672,8 @@ int bdrv_inactivate_all(void)
     int ret = 0;
     GSList *aio_ctxs = NULL, *ctx;
 
+    assert(qemu_in_main_thread());
+
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
@@ -6659,6 +6762,7 @@ void bdrv_lock_medium(BlockDriverState *bs, bool locked)
 /* Get a reference to bs */
 void bdrv_ref(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     bs->refcnt++;
 }
 
@@ -6667,6 +6771,7 @@ void bdrv_ref(BlockDriverState *bs)
  * deleted. */
 void bdrv_unref(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     if (!bs) {
         return;
     }
@@ -6684,6 +6789,7 @@ struct BdrvOpBlocker {
 bool bdrv_op_is_blocked(BlockDriverState *bs, BlockOpType op, Error **errp)
 {
     BdrvOpBlocker *blocker;
+    assert(qemu_in_main_thread());
     assert((int) op >= 0 && op < BLOCK_OP_TYPE_MAX);
     if (!QLIST_EMPTY(&bs->op_blockers[op])) {
         blocker = QLIST_FIRST(&bs->op_blockers[op]);
@@ -6698,6 +6804,7 @@ bool bdrv_op_is_blocked(BlockDriverState *bs, BlockOpType op, Error **errp)
 void bdrv_op_block(BlockDriverState *bs, BlockOpType op, Error *reason)
 {
     BdrvOpBlocker *blocker;
+    assert(qemu_in_main_thread());
     assert((int) op >= 0 && op < BLOCK_OP_TYPE_MAX);
 
     blocker = g_new0(BdrvOpBlocker, 1);
@@ -6708,6 +6815,7 @@ void bdrv_op_block(BlockDriverState *bs, BlockOpType op, Error *reason)
 void bdrv_op_unblock(BlockDriverState *bs, BlockOpType op, Error *reason)
 {
     BdrvOpBlocker *blocker, *next;
+    assert(qemu_in_main_thread());
     assert((int) op >= 0 && op < BLOCK_OP_TYPE_MAX);
     QLIST_FOREACH_SAFE(blocker, &bs->op_blockers[op], list, next) {
         if (blocker->reason == reason) {
@@ -6720,6 +6828,7 @@ void bdrv_op_unblock(BlockDriverState *bs, BlockOpType op, Error *reason)
 void bdrv_op_block_all(BlockDriverState *bs, Error *reason)
 {
     int i;
+    assert(qemu_in_main_thread());
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         bdrv_op_block(bs, i, reason);
     }
@@ -6728,6 +6837,7 @@ void bdrv_op_block_all(BlockDriverState *bs, Error *reason)
 void bdrv_op_unblock_all(BlockDriverState *bs, Error *reason)
 {
     int i;
+    assert(qemu_in_main_thread());
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         bdrv_op_unblock(bs, i, reason);
     }
@@ -6736,7 +6846,7 @@ void bdrv_op_unblock_all(BlockDriverState *bs, Error *reason)
 bool bdrv_op_blocker_is_empty(BlockDriverState *bs)
 {
     int i;
-
+    assert(qemu_in_main_thread());
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         if (!QLIST_EMPTY(&bs->op_blockers[i])) {
             return false;
@@ -6758,6 +6868,8 @@ void bdrv_img_create(const char *filename, const char *fmt,
     Error *local_err = NULL;
     int ret = 0;
 
+    assert(qemu_in_main_thread());
+
     /* Find driver and parse its options */
     drv = bdrv_find_format(fmt);
     if (!drv) {
@@ -7174,6 +7286,7 @@ static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
 bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
                                     GSList **ignore, Error **errp)
 {
+    assert(qemu_in_main_thread());
     if (g_slist_find(*ignore, c)) {
         return true;
     }
@@ -7192,6 +7305,8 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
         return true;
     }
 
+    assert(qemu_in_main_thread());
+
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         if (!bdrv_parent_can_set_aio_context(c, ctx, ignore, errp)) {
             return false;
@@ -7212,6 +7327,8 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
     GSList *ignore;
     bool ret;
 
+    assert(qemu_in_main_thread());
+
     ignore = ignore_child ? g_slist_prepend(NULL, ignore_child) : NULL;
     ret = bdrv_can_set_aio_context(bs, ctx, &ignore, errp);
     g_slist_free(ignore);
@@ -7230,6 +7347,7 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
 int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                              Error **errp)
 {
+    assert(qemu_in_main_thread());
     return bdrv_child_try_set_aio_context(bs, ctx, NULL, errp);
 }
 
@@ -7243,6 +7361,7 @@ void bdrv_add_aio_context_notifier(BlockDriverState *bs,
         .detach_aio_context   = detach_aio_context,
         .opaque               = opaque
     };
+    assert(qemu_in_main_thread());
 
     QLIST_INSERT_HEAD(&bs->aio_notifiers, ban, list);
 }
@@ -7254,6 +7373,7 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
                                       void *opaque)
 {
     BdrvAioNotifier *ban, *ban_next;
+    assert(qemu_in_main_thread());
 
     QLIST_FOREACH_SAFE(ban, &bs->aio_notifiers, list, ban_next) {
         if (ban->attached_aio_context == attached_aio_context &&
@@ -7278,6 +7398,7 @@ int bdrv_amend_options(BlockDriverState *bs, QemuOpts *opts,
                        bool force,
                        Error **errp)
 {
+    assert(qemu_in_main_thread());
     if (!bs->drv) {
         error_setg(errp, "Node is ejected");
         return -ENOMEDIUM;
@@ -7348,6 +7469,8 @@ BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
     BlockDriverState *to_replace_bs = bdrv_find_node(node_name);
     AioContext *aio_context;
 
+    assert(qemu_in_main_thread());
+
     if (!to_replace_bs) {
         error_setg(errp, "Failed to find node with node-name='%s'", node_name);
         return NULL;
@@ -7509,6 +7632,8 @@ void bdrv_refresh_filename(BlockDriverState *bs)
     bool generate_json_filename; /* Whether our default implementation should
                                     fill exact_filename (false) or not (true) */
 
+    assert(qemu_in_main_thread());
+
     if (!drv) {
         return;
     }
@@ -7631,6 +7756,8 @@ char *bdrv_dirname(BlockDriverState *bs, Error **errp)
     BlockDriver *drv = bs->drv;
     BlockDriverState *child_bs;
 
+    assert(qemu_in_main_thread());
+
     if (!drv) {
         error_setg(errp, "Node '%s' is ejected", bs->node_name);
         return NULL;
@@ -7662,7 +7789,7 @@ char *bdrv_dirname(BlockDriverState *bs, Error **errp)
 void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
                     Error **errp)
 {
-
+    assert(qemu_in_main_thread());
     if (!parent_bs->drv || !parent_bs->drv->bdrv_add_child) {
         error_setg(errp, "The node %s does not support adding a child",
                    bdrv_get_device_or_node_name(parent_bs));
@@ -7682,6 +7809,7 @@ void bdrv_del_child(BlockDriverState *parent_bs, BdrvChild *child, Error **errp)
 {
     BdrvChild *tmp;
 
+    assert(qemu_in_main_thread());
     if (!parent_bs->drv || !parent_bs->drv->bdrv_del_child) {
         error_setg(errp, "The node %s does not support removing a child",
                    bdrv_get_device_or_node_name(parent_bs));
@@ -7709,6 +7837,7 @@ int bdrv_make_empty(BdrvChild *c, Error **errp)
     BlockDriver *drv = c->bs->drv;
     int ret;
 
+    assert(qemu_in_main_thread());
     assert(c->perm & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED));
 
     if (!drv->bdrv_make_empty) {
diff --git a/block/commit.c b/block/commit.c
index b1fc7b908b..4e1723ab29 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -432,6 +432,8 @@ int bdrv_commit(BlockDriverState *bs)
     QEMU_AUTO_VFREE uint8_t *buf = NULL;
     Error *local_err = NULL;
 
+    assert(qemu_in_main_thread());
+
     if (!drv)
         return -ENOMEDIUM;
 
diff --git a/block/io.c b/block/io.c
index bb0a254def..51497d1b27 100644
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
@@ -612,6 +614,7 @@ static bool bdrv_drain_all_poll(void)
 {
     BlockDriverState *bs = NULL;
     bool result = false;
+    assert(qemu_in_main_thread());
 
     /* bdrv_drain_poll() can't make changes to the graph and we are holding the
      * main AioContext lock, so iterating bdrv_next_all_states() is safe. */
@@ -640,6 +643,7 @@ static bool bdrv_drain_all_poll(void)
 void bdrv_drain_all_begin(void)
 {
     BlockDriverState *bs = NULL;
+    assert(qemu_in_main_thread());
 
     if (qemu_in_coroutine()) {
         bdrv_co_yield_to_drain(NULL, true, false, NULL, true, true, NULL);
@@ -696,6 +700,7 @@ void bdrv_drain_all_end(void)
 {
     BlockDriverState *bs = NULL;
     int drained_end_counter = 0;
+    assert(qemu_in_main_thread());
 
     /*
      * bdrv queue is managed by record/replay,
@@ -723,6 +728,7 @@ void bdrv_drain_all_end(void)
 
 void bdrv_drain_all(void)
 {
+    assert(qemu_in_main_thread());
     bdrv_drain_all_begin();
     bdrv_drain_all_end();
 }
@@ -1059,6 +1065,8 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
     int64_t target_size, bytes, offset = 0;
     BlockDriverState *bs = child->bs;
 
+    assert(qemu_in_main_thread());
+
     target_size = bdrv_getlength(bs);
     if (target_size < 0) {
         return target_size;
@@ -2345,6 +2353,8 @@ int bdrv_flush_all(void)
     BlockDriverState *bs = NULL;
     int result = 0;
 
+    assert(qemu_in_main_thread());
+
     /*
      * bdrv queue is managed by record/replay,
      * creating new flush request for stopping
@@ -2898,6 +2908,7 @@ int bdrv_load_vmstate(BlockDriverState *bs, uint8_t *buf,
 
 void bdrv_aio_cancel(BlockAIOCB *acb)
 {
+    assert(qemu_in_main_thread());
     qemu_aio_ref(acb);
     bdrv_aio_cancel_async(acb);
     while (acb->refcnt > 1) {
@@ -3292,6 +3303,7 @@ void bdrv_register_buf(BlockDriverState *bs, void *host, size_t size)
 {
     BdrvChild *child;
 
+    assert(qemu_in_main_thread());
     if (bs->drv && bs->drv->bdrv_register_buf) {
         bs->drv->bdrv_register_buf(bs, host, size);
     }
@@ -3304,6 +3316,7 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host)
 {
     BdrvChild *child;
 
+    assert(qemu_in_main_thread());
     if (bs->drv && bs->drv->bdrv_unregister_buf) {
         bs->drv->bdrv_unregister_buf(bs, host);
     }
@@ -3575,6 +3588,7 @@ out:
 
 void bdrv_cancel_in_flight(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     if (!bs || !bs->drv) {
         return;
     }
diff --git a/blockdev.c b/blockdev.c
index 8197165bb5..5d5c107ed3 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -658,6 +658,7 @@ void blockdev_close_all_bdrv_states(void)
 /* Iterates over the list of monitor-owned BlockDriverStates */
 BlockDriverState *bdrv_next_monitor_owned(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     return bs ? QTAILQ_NEXT(bs, monitor_list)
               : QTAILQ_FIRST(&monitor_bdrv_states);
 }
-- 
2.31.1


