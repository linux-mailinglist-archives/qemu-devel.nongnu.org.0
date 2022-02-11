Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336564B28C3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 16:10:11 +0100 (CET)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIXYn-00020B-Ah
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 10:10:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHu-0003aD-JQ
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHl-0001l9-7J
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644591144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I/a7+Q85IIogAmBo5VUa5Jjau0MabWj6gmoTW/ptne0=;
 b=VoPr2Pe2WobiTjuuK5rNvVtrPsAd0PlntyZtUjeqJDnNY5CCM4YMcr8An8jAD8W9+8+7WC
 cbcOasLh1x6Lodw7zUi+2QZAtxb3lKq19EOSXmNv8jQa9E/EGYn1kVLBH5ox9xxOfFsenn
 tMPBdozhIP5wGNWAtJoCCbxxrQmWiWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-oUbC15thPRO-xRkQEuiq3w-1; Fri, 11 Feb 2022 09:52:21 -0500
X-MC-Unique: oUbC15thPRO-xRkQEuiq3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 359BC18C8C02;
 Fri, 11 Feb 2022 14:52:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B6B77C0E8;
 Fri, 11 Feb 2022 14:52:18 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 17/31] block.c: add assertions to static functions
Date: Fri, 11 Feb 2022 09:51:39 -0500
Message-Id: <20220211145153.2861415-18-eesposit@redhat.com>
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

Following the assertion derived from the API split,
propagate the assertion also in the static functions.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c               | 47 ++++++++++++++++++++++++++++++++++++++++++-
 block/block-backend.c |  3 +++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 8546612488..29c88e8727 100644
--- a/block.c
+++ b/block.c
@@ -438,6 +438,7 @@ BlockDriverState *bdrv_new(void)
 static BlockDriver *bdrv_do_find_format(const char *format_name)
 {
     BlockDriver *drv1;
+    GLOBAL_STATE_CODE();
 
     QLIST_FOREACH(drv1, &bdrv_drivers, list) {
         if (!strcmp(drv1->format_name, format_name)) {
@@ -596,6 +597,8 @@ static int64_t create_file_fallback_truncate(BlockBackend *blk,
     int64_t size;
     int ret;
 
+    GLOBAL_STATE_CODE();
+
     ret = blk_truncate(blk, minimum_size, false, PREALLOC_MODE_OFF, 0,
                        &local_err);
     if (ret < 0 && ret != -ENOTSUP) {
@@ -634,6 +637,8 @@ static int create_file_fallback_zero_first_sector(BlockBackend *blk,
     int64_t bytes_to_clear;
     int ret;
 
+    GLOBAL_STATE_CODE();
+
     bytes_to_clear = MIN(current_size, BDRV_SECTOR_SIZE);
     if (bytes_to_clear) {
         ret = blk_pwrite_zeroes(blk, 0, bytes_to_clear, BDRV_REQ_MAY_UNMAP);
@@ -896,6 +901,7 @@ static BlockDriver *find_hdev_driver(const char *filename)
 {
     int score_max = 0, score;
     BlockDriver *drv = NULL, *d;
+    GLOBAL_STATE_CODE();
 
     QLIST_FOREACH(d, &bdrv_drivers, list) {
         if (d->bdrv_probe_device) {
@@ -913,6 +919,7 @@ static BlockDriver *find_hdev_driver(const char *filename)
 static BlockDriver *bdrv_do_find_protocol(const char *protocol)
 {
     BlockDriver *drv1;
+    GLOBAL_STATE_CODE();
 
     QLIST_FOREACH(drv1, &bdrv_drivers, list) {
         if (drv1->protocol_name && !strcmp(drv1->protocol_name, protocol)) {
@@ -1021,6 +1028,8 @@ static int find_image_format(BlockBackend *file, const char *filename,
     uint8_t buf[BLOCK_PROBE_BUF_SIZE];
     int ret = 0;
 
+    GLOBAL_STATE_CODE();
+
     /* Return the raw BlockDriver * to scsi-generic devices or empty drives */
     if (blk_is_sg(file) || !blk_is_inserted(file) || blk_getlength(file) == 0) {
         *pdrv = &bdrv_raw;
@@ -1103,6 +1112,7 @@ static BlockdevDetectZeroesOptions bdrv_parse_detect_zeroes(QemuOpts *opts,
     BlockdevDetectZeroesOptions detect_zeroes =
         qapi_enum_parse(&BlockdevDetectZeroesOptions_lookup, value,
                         BLOCKDEV_DETECT_ZEROES_OPTIONS_OFF, &local_err);
+    GLOBAL_STATE_CODE();
     g_free(value);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -1218,6 +1228,7 @@ static void bdrv_child_cb_drained_end(BdrvChild *child,
 static int bdrv_child_cb_inactivate(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
+    GLOBAL_STATE_CODE();
     assert(bs->open_flags & BDRV_O_INACTIVE);
     return 0;
 }
@@ -1244,6 +1255,7 @@ static void bdrv_child_cb_set_aio_ctx(BdrvChild *child, AioContext *ctx,
 static void bdrv_temp_snapshot_options(int *child_flags, QDict *child_options,
                                        int parent_flags, QDict *parent_options)
 {
+    GLOBAL_STATE_CODE();
     *child_flags = (parent_flags & ~BDRV_O_SNAPSHOT) | BDRV_O_TEMPORARY;
 
     /* For temporary files, unconditional cache=unsafe is fine */
@@ -1264,6 +1276,7 @@ static void bdrv_backing_attach(BdrvChild *c)
     BlockDriverState *parent = c->opaque;
     BlockDriverState *backing_hd = c->bs;
 
+    GLOBAL_STATE_CODE();
     assert(!parent->backing_blocker);
     error_setg(&parent->backing_blocker,
                "node is used as backing hd of '%s'",
@@ -1302,6 +1315,7 @@ static void bdrv_backing_detach(BdrvChild *c)
 {
     BlockDriverState *parent = c->opaque;
 
+    GLOBAL_STATE_CODE();
     assert(parent->backing_blocker);
     bdrv_op_unblock_all(c->bs, parent->backing_blocker);
     error_free(parent->backing_blocker);
@@ -1314,6 +1328,7 @@ static int bdrv_backing_update_filename(BdrvChild *c, BlockDriverState *base,
     BlockDriverState *parent = c->opaque;
     bool read_only = bdrv_is_read_only(parent);
     int ret;
+    GLOBAL_STATE_CODE();
 
     if (read_only) {
         ret = bdrv_reopen_set_read_only(parent, false, errp);
@@ -1345,6 +1360,7 @@ static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
                                    int parent_flags, QDict *parent_options)
 {
     int flags = parent_flags;
+    GLOBAL_STATE_CODE();
 
     /*
      * First, decide whether to set, clear, or leave BDRV_O_PROTOCOL.
@@ -1486,6 +1502,7 @@ AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c)
 static int bdrv_open_flags(BlockDriverState *bs, int flags)
 {
     int open_flags = flags;
+    GLOBAL_STATE_CODE();
 
     /*
      * Clear flags that are internal to the block layer before opening the
@@ -1498,6 +1515,8 @@ static int bdrv_open_flags(BlockDriverState *bs, int flags)
 
 static void update_flags_from_options(int *flags, QemuOpts *opts)
 {
+    GLOBAL_STATE_CODE();
+
     *flags &= ~(BDRV_O_CACHE_MASK | BDRV_O_RDWR | BDRV_O_AUTO_RDONLY);
 
     if (qemu_opt_get_bool_del(opts, BDRV_OPT_CACHE_NO_FLUSH, false)) {
@@ -1519,6 +1538,7 @@ static void update_flags_from_options(int *flags, QemuOpts *opts)
 
 static void update_options_from_flags(QDict *options, int flags)
 {
+    GLOBAL_STATE_CODE();
     if (!qdict_haskey(options, BDRV_OPT_CACHE_DIRECT)) {
         qdict_put_bool(options, BDRV_OPT_CACHE_DIRECT, flags & BDRV_O_NOCACHE);
     }
@@ -1540,6 +1560,7 @@ static void bdrv_assign_node_name(BlockDriverState *bs,
                                   Error **errp)
 {
     char *gen_node_name = NULL;
+    GLOBAL_STATE_CODE();
 
     if (!node_name) {
         node_name = gen_node_name = id_generate(ID_BLOCK);
@@ -1786,6 +1807,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
 
     assert(bs->file == NULL);
     assert(options != NULL && bs->options != options);
+    GLOBAL_STATE_CODE();
 
     opts = qemu_opts_create(&bdrv_runtime_opts, NULL, 0, &error_abort);
     if (!qemu_opts_absorb_qdict(opts, options, errp)) {
@@ -1911,6 +1933,7 @@ static QDict *parse_json_filename(const char *filename, Error **errp)
     QObject *options_obj;
     QDict *options;
     int ret;
+    GLOBAL_STATE_CODE();
 
     ret = strstart(filename, "json:", &filename);
     assert(ret);
@@ -1938,6 +1961,7 @@ static void parse_json_protocol(QDict *options, const char **pfilename,
 {
     QDict *json_options;
     Error *local_err = NULL;
+    GLOBAL_STATE_CODE();
 
     /* Parse json: pseudo-protocol */
     if (!*pfilename || !g_str_has_prefix(*pfilename, "json:")) {
@@ -2194,6 +2218,8 @@ static GSList *bdrv_topological_dfs(GSList *list, GHashTable *found,
     BdrvChild *child;
     g_autoptr(GHashTable) local_found = NULL;
 
+    GLOBAL_STATE_CODE();
+
     if (!found) {
         assert(!list);
         found = local_found = g_hash_table_new(NULL, NULL);
@@ -2308,6 +2334,7 @@ typedef struct BdrvReplaceChildState {
 static void bdrv_replace_child_commit(void *opaque)
 {
     BdrvReplaceChildState *s = opaque;
+    GLOBAL_STATE_CODE();
 
     if (s->free_empty_child && !s->child->bs) {
         bdrv_child_free(s->child);
@@ -2320,6 +2347,7 @@ static void bdrv_replace_child_abort(void *opaque)
     BdrvReplaceChildState *s = opaque;
     BlockDriverState *new_bs = s->child->bs;
 
+    GLOBAL_STATE_CODE();
     /*
      * old_bs reference is transparently moved from @s to s->child.
      *
@@ -2884,6 +2912,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
 static void bdrv_child_free(BdrvChild *child)
 {
     assert(!child->bs);
+    GLOBAL_STATE_CODE();
     assert(!child->next.le_prev); /* not in children list */
 
     g_free(child->name);
@@ -2964,6 +2993,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     assert(child);
     assert(*child == NULL);
     assert(child_class->get_parent_desc);
+    GLOBAL_STATE_CODE();
 
     new_child = g_new(BdrvChild, 1);
     *new_child = (BdrvChild) {
@@ -3044,6 +3074,7 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
     uint64_t perm, shared_perm;
 
     assert(parent_bs->drv);
+    GLOBAL_STATE_CODE();
 
     if (bdrv_recurse_has_child(child_bs, parent_bs)) {
         error_setg(errp, "Making '%s' a %s child of '%s' would create a cycle",
@@ -3069,6 +3100,7 @@ static void bdrv_detach_child(BdrvChild **childp)
 {
     BlockDriverState *old_bs = (*childp)->bs;
 
+    GLOBAL_STATE_CODE();
     bdrv_replace_child_noperm(childp, NULL, true);
 
     if (old_bs) {
@@ -3317,6 +3349,8 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
     BdrvChild *child = is_backing ? parent_bs->backing : parent_bs->file;
     BdrvChildRole role;
 
+    GLOBAL_STATE_CODE();
+
     if (!parent_bs->drv) {
         /*
          * Node without drv is an object without a class :/. TODO: finally fix
@@ -3396,6 +3430,7 @@ static int bdrv_set_backing_noperm(BlockDriverState *bs,
                                    BlockDriverState *backing_hd,
                                    Transaction *tran, Error **errp)
 {
+    GLOBAL_STATE_CODE();
     return bdrv_set_file_or_backing_noperm(bs, backing_hd, true, tran, errp);
 }
 
@@ -3674,6 +3709,8 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     BlockDriverState *bs_snapshot = NULL;
     int ret;
 
+    GLOBAL_STATE_CODE();
+
     /* if snapshot, we create a temporary backing file and open it
        instead of opening 'filename' directly */
 
@@ -4500,6 +4537,8 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
     QObject *value;
     const char *str;
 
+    GLOBAL_STATE_CODE();
+
     value = qdict_get(reopen_state->options, child_name);
     if (value == NULL) {
         return 0;
@@ -5039,7 +5078,7 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
 static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
 {
     BdrvRemoveFilterOrCowChild *s = opaque;
-
+    GLOBAL_STATE_CODE();
     bdrv_child_free(s->child);
 }
 
@@ -5122,6 +5161,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
     BdrvChild *c, *next;
 
     assert(to != NULL);
+    GLOBAL_STATE_CODE();
 
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
         assert(c->bs == from);
@@ -5172,6 +5212,7 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     BlockDriverState *to_cow_parent = NULL;
     int ret;
 
+    GLOBAL_STATE_CODE();
     assert(to != NULL);
 
     if (detach_subchain) {
@@ -5330,6 +5371,7 @@ static void bdrv_delete(BlockDriverState *bs)
 {
     assert(bdrv_op_blocker_is_empty(bs));
     assert(!bs->refcnt);
+    GLOBAL_STATE_CODE();
 
     /* remove from list, if necessary */
     if (bs->node_name[0] != '\0') {
@@ -6351,6 +6393,7 @@ void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 
 static BlockDriverState *bdrv_find_debug_node(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     while (bs && bs->drv && !bs->drv->bdrv_debug_breakpoint) {
         bs = bdrv_primary_bs(bs);
     }
@@ -6657,6 +6700,7 @@ void bdrv_activate_all(Error **errp)
 static bool bdrv_has_bds_parent(BlockDriverState *bs, bool only_active)
 {
     BdrvChild *parent;
+    GLOBAL_STATE_CODE();
 
     QLIST_FOREACH(parent, &bs->parents, next_parent) {
         if (parent->klass->parent_is_bds) {
@@ -7180,6 +7224,7 @@ void bdrv_coroutine_enter(BlockDriverState *bs, Coroutine *co)
 
 static void bdrv_do_remove_aio_context_notifier(BdrvAioNotifier *ban)
 {
+    GLOBAL_STATE_CODE();
     QLIST_REMOVE(ban, list);
     g_free(ban);
 }
diff --git a/block/block-backend.c b/block/block-backend.c
index d3dc13809f..e5708702db 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -767,6 +767,9 @@ BlockDriverState *blk_bs(BlockBackend *blk)
 static BlockBackend *bdrv_first_blk(BlockDriverState *bs)
 {
     BdrvChild *child;
+
+    GLOBAL_STATE_CODE();
+
     QLIST_FOREACH(child, &bs->parents, next_parent) {
         if (child->klass == &child_root) {
             return child->opaque;
-- 
2.31.1


