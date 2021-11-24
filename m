Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28EE45B4F7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:09:48 +0100 (CET)
Received: from localhost ([::1]:42984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmPb-0005RX-On
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:09:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm2H-0004gh-Vl
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:45:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm2C-0004zg-OL
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zChl1eyNLmXtvoPDaJpGhDm+voybatOcv055ZEUURq8=;
 b=X50I+2Wl783OnjZYp4ewkez/K1wxQeATZTgFrslkAcDkWU2FtB6lRogniNyv6GsmgG/oFQ
 4VCpPbTVN5nXFuyCjazxg1kkDDdM6lk5lmeXnSKuyWTST5hpFIEBSBdn6K39pgTT1WbaED
 tRqf1Bfnb+hwNjPnnB7TiQCoAFzbmSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-K100SVJnONCwZOiI14_lEw-1; Wed, 24 Nov 2021 01:45:35 -0500
X-MC-Unique: K100SVJnONCwZOiI14_lEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE2A018460E5;
 Wed, 24 Nov 2021 06:45:33 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95B9160843;
 Wed, 24 Nov 2021 06:45:32 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 13/31] block.c: add assertions to static functions
Date: Wed, 24 Nov 2021 01:44:00 -0500
Message-Id: <20211124064418.3120601-14-eesposit@redhat.com>
In-Reply-To: <20211124064418.3120601-1-eesposit@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Following the assertion derived from the API split,
propagate the assertion also in the static functions.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 5516c84ec4..b77ab0a104 100644
--- a/block.c
+++ b/block.c
@@ -434,6 +434,7 @@ BlockDriverState *bdrv_new(void)
 static BlockDriver *bdrv_do_find_format(const char *format_name)
 {
     BlockDriver *drv1;
+    assert(qemu_in_main_thread());
 
     QLIST_FOREACH(drv1, &bdrv_drivers, list) {
         if (!strcmp(drv1->format_name, format_name)) {
@@ -593,6 +594,8 @@ static int64_t create_file_fallback_truncate(BlockBackend *blk,
     int64_t size;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     ret = blk_truncate(blk, minimum_size, false, PREALLOC_MODE_OFF, 0,
                        &local_err);
     if (ret < 0 && ret != -ENOTSUP) {
@@ -631,6 +634,8 @@ static int create_file_fallback_zero_first_sector(BlockBackend *blk,
     int64_t bytes_to_clear;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     bytes_to_clear = MIN(current_size, BDRV_SECTOR_SIZE);
     if (bytes_to_clear) {
         ret = blk_pwrite_zeroes(blk, 0, bytes_to_clear, BDRV_REQ_MAY_UNMAP);
@@ -891,6 +896,7 @@ static BlockDriver *find_hdev_driver(const char *filename)
 {
     int score_max = 0, score;
     BlockDriver *drv = NULL, *d;
+    assert(qemu_in_main_thread());
 
     QLIST_FOREACH(d, &bdrv_drivers, list) {
         if (d->bdrv_probe_device) {
@@ -908,6 +914,7 @@ static BlockDriver *find_hdev_driver(const char *filename)
 static BlockDriver *bdrv_do_find_protocol(const char *protocol)
 {
     BlockDriver *drv1;
+    assert(qemu_in_main_thread());
 
     QLIST_FOREACH(drv1, &bdrv_drivers, list) {
         if (drv1->protocol_name && !strcmp(drv1->protocol_name, protocol)) {
@@ -1016,6 +1023,8 @@ static int find_image_format(BlockBackend *file, const char *filename,
     uint8_t buf[BLOCK_PROBE_BUF_SIZE];
     int ret = 0;
 
+    assert(qemu_in_main_thread());
+
     /* Return the raw BlockDriver * to scsi-generic devices or empty drives */
     if (blk_is_sg(file) || !blk_is_inserted(file) || blk_getlength(file) == 0) {
         *pdrv = &bdrv_raw;
@@ -1097,6 +1106,7 @@ static BlockdevDetectZeroesOptions bdrv_parse_detect_zeroes(QemuOpts *opts,
     BlockdevDetectZeroesOptions detect_zeroes =
         qapi_enum_parse(&BlockdevDetectZeroesOptions_lookup, value,
                         BLOCKDEV_DETECT_ZEROES_OPTIONS_OFF, &local_err);
+    assert(qemu_in_main_thread());
     g_free(value);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -1214,6 +1224,7 @@ static void bdrv_child_cb_drained_end(BdrvChild *child,
 static int bdrv_child_cb_inactivate(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
+    assert(qemu_in_main_thread());
     assert(bs->open_flags & BDRV_O_INACTIVE);
     return 0;
 }
@@ -1241,6 +1252,7 @@ static void bdrv_temp_snapshot_options(int *child_flags, QDict *child_options,
                                        int parent_flags, QDict *parent_options)
 {
     *child_flags = (parent_flags & ~BDRV_O_SNAPSHOT) | BDRV_O_TEMPORARY;
+    assert(qemu_in_main_thread());
 
     /* For temporary files, unconditional cache=unsafe is fine */
     qdict_set_default_str(child_options, BDRV_OPT_CACHE_DIRECT, "off");
@@ -1260,6 +1272,7 @@ static void bdrv_backing_attach(BdrvChild *c)
     BlockDriverState *parent = c->opaque;
     BlockDriverState *backing_hd = c->bs;
 
+    assert(qemu_in_main_thread());
     assert(!parent->backing_blocker);
     error_setg(&parent->backing_blocker,
                "node is used as backing hd of '%s'",
@@ -1298,6 +1311,7 @@ static void bdrv_backing_detach(BdrvChild *c)
 {
     BlockDriverState *parent = c->opaque;
 
+    assert(qemu_in_main_thread());
     assert(parent->backing_blocker);
     bdrv_op_unblock_all(c->bs, parent->backing_blocker);
     error_free(parent->backing_blocker);
@@ -1310,6 +1324,7 @@ static int bdrv_backing_update_filename(BdrvChild *c, BlockDriverState *base,
     BlockDriverState *parent = c->opaque;
     bool read_only = bdrv_is_read_only(parent);
     int ret;
+    assert(qemu_in_main_thread());
 
     if (read_only) {
         ret = bdrv_reopen_set_read_only(parent, false, errp);
@@ -1341,6 +1356,7 @@ static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
                                    int parent_flags, QDict *parent_options)
 {
     int flags = parent_flags;
+    assert(qemu_in_main_thread());
 
     /*
      * First, decide whether to set, clear, or leave BDRV_O_PROTOCOL.
@@ -1479,6 +1495,7 @@ AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c)
 static int bdrv_open_flags(BlockDriverState *bs, int flags)
 {
     int open_flags = flags;
+    assert(qemu_in_main_thread());
 
     /*
      * Clear flags that are internal to the block layer before opening the
@@ -1491,6 +1508,8 @@ static int bdrv_open_flags(BlockDriverState *bs, int flags)
 
 static void update_flags_from_options(int *flags, QemuOpts *opts)
 {
+    assert(qemu_in_main_thread());
+
     *flags &= ~(BDRV_O_CACHE_MASK | BDRV_O_RDWR | BDRV_O_AUTO_RDONLY);
 
     if (qemu_opt_get_bool_del(opts, BDRV_OPT_CACHE_NO_FLUSH, false)) {
@@ -1512,6 +1531,7 @@ static void update_flags_from_options(int *flags, QemuOpts *opts)
 
 static void update_options_from_flags(QDict *options, int flags)
 {
+    assert(qemu_in_main_thread());
     if (!qdict_haskey(options, BDRV_OPT_CACHE_DIRECT)) {
         qdict_put_bool(options, BDRV_OPT_CACHE_DIRECT, flags & BDRV_O_NOCACHE);
     }
@@ -1533,6 +1553,7 @@ static void bdrv_assign_node_name(BlockDriverState *bs,
                                   Error **errp)
 {
     char *gen_node_name = NULL;
+    assert(qemu_in_main_thread());
 
     if (!node_name) {
         node_name = gen_node_name = id_generate(ID_BLOCK);
@@ -1779,6 +1800,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
 
     assert(bs->file == NULL);
     assert(options != NULL && bs->options != options);
+    assert(qemu_in_main_thread());
 
     opts = qemu_opts_create(&bdrv_runtime_opts, NULL, 0, &error_abort);
     if (!qemu_opts_absorb_qdict(opts, options, errp)) {
@@ -1904,6 +1926,7 @@ static QDict *parse_json_filename(const char *filename, Error **errp)
     QObject *options_obj;
     QDict *options;
     int ret;
+    assert(qemu_in_main_thread());
 
     ret = strstart(filename, "json:", &filename);
     assert(ret);
@@ -1931,6 +1954,7 @@ static void parse_json_protocol(QDict *options, const char **pfilename,
 {
     QDict *json_options;
     Error *local_err = NULL;
+    assert(qemu_in_main_thread());
 
     /* Parse json: pseudo-protocol */
     if (!*pfilename || !g_str_has_prefix(*pfilename, "json:")) {
@@ -2184,6 +2208,8 @@ static GSList *bdrv_topological_dfs(GSList *list, GHashTable *found,
     BdrvChild *child;
     g_autoptr(GHashTable) local_found = NULL;
 
+    assert(qemu_in_main_thread());
+
     if (!found) {
         assert(!list);
         found = local_found = g_hash_table_new(NULL, NULL);
@@ -2295,6 +2321,7 @@ typedef struct BdrvReplaceChildState {
 static void bdrv_replace_child_commit(void *opaque)
 {
     BdrvReplaceChildState *s = opaque;
+    assert(qemu_in_main_thread());
 
     if (s->free_empty_child && !s->child->bs) {
         bdrv_child_free(s->child);
@@ -2307,6 +2334,7 @@ static void bdrv_replace_child_abort(void *opaque)
     BdrvReplaceChildState *s = opaque;
     BlockDriverState *new_bs = s->child->bs;
 
+    assert(qemu_in_main_thread());
     /*
      * old_bs reference is transparently moved from @s to s->child.
      *
@@ -2872,6 +2900,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
 static void bdrv_child_free(BdrvChild *child)
 {
     assert(!child->bs);
+    assert(qemu_in_main_thread());
     assert(!child->next.le_prev); /* not in children list */
 
     g_free(child->name);
@@ -2952,6 +2981,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     assert(child);
     assert(*child == NULL);
     assert(child_class->get_parent_desc);
+    assert(qemu_in_main_thread());
 
     new_child = g_new(BdrvChild, 1);
     *new_child = (BdrvChild) {
@@ -3032,6 +3062,7 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
     uint64_t perm, shared_perm;
 
     assert(parent_bs->drv);
+    assert(qemu_in_main_thread());
 
     if (bdrv_recurse_has_child(child_bs, parent_bs)) {
         error_setg(errp, "Making '%s' a %s child of '%s' would create a cycle",
@@ -3057,6 +3088,7 @@ static void bdrv_detach_child(BdrvChild **childp)
 {
     BlockDriverState *old_bs = (*childp)->bs;
 
+    assert(qemu_in_main_thread());
     bdrv_replace_child_noperm(childp, NULL, true);
 
     if (old_bs) {
@@ -3305,6 +3337,8 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
     BdrvChild *child = is_backing ? parent_bs->backing : parent_bs->file;
     BdrvChildRole role;
 
+    assert(qemu_in_main_thread());
+
     if (!parent_bs->drv) {
         /*
          * Node without drv is an object without a class :/. TODO: finally fix
@@ -3384,6 +3418,7 @@ static int bdrv_set_backing_noperm(BlockDriverState *bs,
                                    BlockDriverState *backing_hd,
                                    Transaction *tran, Error **errp)
 {
+    assert(qemu_in_main_thread());
     return bdrv_set_file_or_backing_noperm(bs, backing_hd, true, tran, errp);
 }
 
@@ -3659,6 +3694,8 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     BlockDriverState *bs_snapshot = NULL;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     /* if snapshot, we create a temporary backing file and open it
        instead of opening 'filename' directly */
 
@@ -4485,6 +4522,8 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
     QObject *value;
     const char *str;
 
+    assert(qemu_in_main_thread());
+
     value = qdict_get(reopen_state->options, child_name);
     if (value == NULL) {
         return 0;
@@ -5024,7 +5063,7 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
 static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
 {
     BdrvRemoveFilterOrCowChild *s = opaque;
-
+    assert(qemu_in_main_thread());
     bdrv_child_free(s->child);
 }
 
@@ -5157,6 +5196,7 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     BlockDriverState *to_cow_parent = NULL;
     int ret;
 
+    assert(qemu_in_main_thread());
     assert(to != NULL);
 
     if (detach_subchain) {
@@ -5315,6 +5355,7 @@ static void bdrv_delete(BlockDriverState *bs)
 {
     assert(bdrv_op_blocker_is_empty(bs));
     assert(!bs->refcnt);
+    assert(qemu_in_main_thread());
 
     /* remove from list, if necessary */
     if (bs->node_name[0] != '\0') {
@@ -6318,6 +6359,7 @@ void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 
 static BlockDriverState *bdrv_find_debug_node(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     while (bs && bs->drv && !bs->drv->bdrv_debug_breakpoint) {
         bs = bdrv_primary_bs(bs);
     }
@@ -7128,6 +7170,7 @@ void bdrv_coroutine_enter(BlockDriverState *bs, Coroutine *co)
 
 static void bdrv_do_remove_aio_context_notifier(BdrvAioNotifier *ban)
 {
+    assert(qemu_in_main_thread());
     QLIST_REMOVE(ban, list);
     g_free(ban);
 }
-- 
2.27.0


