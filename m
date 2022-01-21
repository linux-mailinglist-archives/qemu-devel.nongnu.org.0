Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99F749647B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 18:52:34 +0100 (CET)
Received: from localhost ([::1]:32982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAy5R-0001uI-S6
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 12:52:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxMv-0007gw-HP
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxMr-0000Cv-Ls
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NngxLTCGiduhKUOIDCvtWmvNBZKGKml+3Vp3rzO9sCc=;
 b=XI+342RTSty4JbZKBabrhXsvyFJ5Fo4nMnq4QuAb6O9ZYGqeKtksmq9r10uY/ypKmK8cG0
 eMy86C3t9rLQy/9VBtfmRJ62/tz2yu2RD0HtiOklS7aRAP2c5FG/XilA6heG7rmV5t8bsE
 KHWlG8oqApWa442TyEafKviuFhXo7vw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-rMNH_q-TP8eBK0o1OwC9Mg-1; Fri, 21 Jan 2022 12:06:22 -0500
X-MC-Unique: rMNH_q-TP8eBK0o1OwC9Mg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C8D4801B2D;
 Fri, 21 Jan 2022 17:06:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2CFA7EBE0;
 Fri, 21 Jan 2022 17:06:18 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 12/33] block.c: add assertions to static functions
Date: Fri, 21 Jan 2022 12:05:23 -0500
Message-Id: <20220121170544.2049944-13-eesposit@redhat.com>
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

Following the assertion derived from the API split,
propagate the assertion also in the static functions.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c               | 47 ++++++++++++++++++++++++++++++++++++++++++-
 block/block-backend.c |  3 +++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 5ac0bf024a..0e119a0860 100644
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
@@ -1015,6 +1022,8 @@ static int find_image_format(BlockBackend *file, const char *filename,
     uint8_t buf[BLOCK_PROBE_BUF_SIZE];
     int ret = 0;
 
+    assert(qemu_in_main_thread());
+
     /* Return the raw BlockDriver * to scsi-generic devices or empty drives */
     if (blk_is_sg(file) || !blk_is_inserted(file) || blk_getlength(file) == 0) {
         *pdrv = &bdrv_raw;
@@ -1096,6 +1105,7 @@ static BlockdevDetectZeroesOptions bdrv_parse_detect_zeroes(QemuOpts *opts,
     BlockdevDetectZeroesOptions detect_zeroes =
         qapi_enum_parse(&BlockdevDetectZeroesOptions_lookup, value,
                         BLOCKDEV_DETECT_ZEROES_OPTIONS_OFF, &local_err);
+    assert(qemu_in_main_thread());
     g_free(value);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -1213,6 +1223,7 @@ static void bdrv_child_cb_drained_end(BdrvChild *child,
 static int bdrv_child_cb_inactivate(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
+    assert(qemu_in_main_thread());
     assert(bs->open_flags & BDRV_O_INACTIVE);
     return 0;
 }
@@ -1239,6 +1250,7 @@ static void bdrv_child_cb_set_aio_ctx(BdrvChild *child, AioContext *ctx,
 static void bdrv_temp_snapshot_options(int *child_flags, QDict *child_options,
                                        int parent_flags, QDict *parent_options)
 {
+    assert(qemu_in_main_thread());
     *child_flags = (parent_flags & ~BDRV_O_SNAPSHOT) | BDRV_O_TEMPORARY;
 
     /* For temporary files, unconditional cache=unsafe is fine */
@@ -1259,6 +1271,7 @@ static void bdrv_backing_attach(BdrvChild *c)
     BlockDriverState *parent = c->opaque;
     BlockDriverState *backing_hd = c->bs;
 
+    assert(qemu_in_main_thread());
     assert(!parent->backing_blocker);
     error_setg(&parent->backing_blocker,
                "node is used as backing hd of '%s'",
@@ -1297,6 +1310,7 @@ static void bdrv_backing_detach(BdrvChild *c)
 {
     BlockDriverState *parent = c->opaque;
 
+    assert(qemu_in_main_thread());
     assert(parent->backing_blocker);
     bdrv_op_unblock_all(c->bs, parent->backing_blocker);
     error_free(parent->backing_blocker);
@@ -1309,6 +1323,7 @@ static int bdrv_backing_update_filename(BdrvChild *c, BlockDriverState *base,
     BlockDriverState *parent = c->opaque;
     bool read_only = bdrv_is_read_only(parent);
     int ret;
+    assert(qemu_in_main_thread());
 
     if (read_only) {
         ret = bdrv_reopen_set_read_only(parent, false, errp);
@@ -1340,6 +1355,7 @@ static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
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
@@ -2869,6 +2897,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
 static void bdrv_child_free(BdrvChild *child)
 {
     assert(!child->bs);
+    assert(qemu_in_main_thread());
     assert(!child->next.le_prev); /* not in children list */
 
     g_free(child->name);
@@ -2949,6 +2978,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     assert(child);
     assert(*child == NULL);
     assert(child_class->get_parent_desc);
+    assert(qemu_in_main_thread());
 
     new_child = g_new(BdrvChild, 1);
     *new_child = (BdrvChild) {
@@ -3029,6 +3059,7 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
     uint64_t perm, shared_perm;
 
     assert(parent_bs->drv);
+    assert(qemu_in_main_thread());
 
     if (bdrv_recurse_has_child(child_bs, parent_bs)) {
         error_setg(errp, "Making '%s' a %s child of '%s' would create a cycle",
@@ -3054,6 +3085,7 @@ static void bdrv_detach_child(BdrvChild **childp)
 {
     BlockDriverState *old_bs = (*childp)->bs;
 
+    assert(qemu_in_main_thread());
     bdrv_replace_child_noperm(childp, NULL, true);
 
     if (old_bs) {
@@ -3302,6 +3334,8 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
     BdrvChild *child = is_backing ? parent_bs->backing : parent_bs->file;
     BdrvChildRole role;
 
+    assert(qemu_in_main_thread());
+
     if (!parent_bs->drv) {
         /*
          * Node without drv is an object without a class :/. TODO: finally fix
@@ -3381,6 +3415,7 @@ static int bdrv_set_backing_noperm(BlockDriverState *bs,
                                    BlockDriverState *backing_hd,
                                    Transaction *tran, Error **errp)
 {
+    assert(qemu_in_main_thread());
     return bdrv_set_file_or_backing_noperm(bs, backing_hd, true, tran, errp);
 }
 
@@ -3656,6 +3691,8 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     BlockDriverState *bs_snapshot = NULL;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     /* if snapshot, we create a temporary backing file and open it
        instead of opening 'filename' directly */
 
@@ -4482,6 +4519,8 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
     QObject *value;
     const char *str;
 
+    assert(qemu_in_main_thread());
+
     value = qdict_get(reopen_state->options, child_name);
     if (value == NULL) {
         return 0;
@@ -5021,7 +5060,7 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
 static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
 {
     BdrvRemoveFilterOrCowChild *s = opaque;
-
+    assert(qemu_in_main_thread());
     bdrv_child_free(s->child);
 }
 
@@ -5104,6 +5143,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
     BdrvChild *c, *next;
 
     assert(to != NULL);
+    assert(qemu_in_main_thread());
 
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
         assert(c->bs == from);
@@ -5154,6 +5194,7 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     BlockDriverState *to_cow_parent = NULL;
     int ret;
 
+    assert(qemu_in_main_thread());
     assert(to != NULL);
 
     if (detach_subchain) {
@@ -5312,6 +5353,7 @@ static void bdrv_delete(BlockDriverState *bs)
 {
     assert(bdrv_op_blocker_is_empty(bs));
     assert(!bs->refcnt);
+    assert(qemu_in_main_thread());
 
     /* remove from list, if necessary */
     if (bs->node_name[0] != '\0') {
@@ -6313,6 +6355,7 @@ void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 
 static BlockDriverState *bdrv_find_debug_node(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     while (bs && bs->drv && !bs->drv->bdrv_debug_breakpoint) {
         bs = bdrv_primary_bs(bs);
     }
@@ -6605,6 +6648,7 @@ void bdrv_invalidate_cache_all(Error **errp)
 static bool bdrv_has_bds_parent(BlockDriverState *bs, bool only_active)
 {
     BdrvChild *parent;
+    assert(qemu_in_main_thread());
 
     QLIST_FOREACH(parent, &bs->parents, next_parent) {
         if (parent->klass->parent_is_bds) {
@@ -7122,6 +7166,7 @@ void bdrv_coroutine_enter(BlockDriverState *bs, Coroutine *co)
 
 static void bdrv_do_remove_aio_context_notifier(BdrvAioNotifier *ban)
 {
+    assert(qemu_in_main_thread());
     QLIST_REMOVE(ban, list);
     g_free(ban);
 }
diff --git a/block/block-backend.c b/block/block-backend.c
index be99b431e2..fe56cc1cf4 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -754,6 +754,9 @@ BlockDriverState *blk_bs(BlockBackend *blk)
 static BlockBackend *bdrv_first_blk(BlockDriverState *bs)
 {
     BdrvChild *child;
+
+    assert(qemu_in_main_thread());
+
     QLIST_FOREACH(child, &bs->parents, next_parent) {
         if (child->klass == &child_root) {
             return child->opaque;
-- 
2.31.1


