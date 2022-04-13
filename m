Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120D34FF6D1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 14:29:33 +0200 (CEST)
Received: from localhost ([::1]:54256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nec7n-0004nW-T3
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 08:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.pour@hetzner.com>)
 id 1nec5h-0003PN-Ug; Wed, 13 Apr 2022 08:27:22 -0400
Received: from mail.hetzner.company ([2a01:4f8:d0a:203a::1]:38440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.pour@hetzner.com>)
 id 1nec5e-0005QZ-8N; Wed, 13 Apr 2022 08:27:20 -0400
Received: from [2a01:4f8:0:a53b:9775:b751:8e88:cd9d] (helo=hetzner.com)
 by mail.hetzner.company with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <raphael.pour@hetzner.com>)
 id 1nec5R-0007OA-Fb; Wed, 13 Apr 2022 14:27:06 +0200
From: Raphael Pour <raphael.pour@hetzner.com>
To: Raphael Pour <raphael.pour@hetzner.com>
Subject: [PATCH] block/rbd: support driver-specific reopen
Date: Wed, 13 Apr 2022 14:26:56 +0200
Message-Id: <20220413122656.3070251-1-raphael.pour@hetzner.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: raphael.pour@hetzner.com
Received-SPF: pass client-ip=2a01:4f8:d0a:203a::1;
 envelope-from=raphael.pour@hetzner.com; helo=mail.hetzner.company
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:RBD" <qemu-block@nongnu.org>,
 Peter Lieven <pl@kamp.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch completes the reopen functionality for an attached RBD where altered
driver options can be passed to. This is necessary to move RBDs between ceph
clusters without interrupting QEMU, where some ceph settings need to be adjusted.

The reopen_prepare method early returns if no rbd-specific driver options are
given to maintain compatible with the previous behavior by dropping all
generic block layer options. Otherwise the reopen acts similar to qemu_rbd_open.

The reopen_commit tears down the old state and replaces it with the new
one.

The reopen_abort drops an ongoing reopen.

Signed-off-by: Raphael Pour <raphael.pour@hetzner.com>
---
 block/rbd.c | 206 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 201 insertions(+), 5 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 6caf35cbba..e7b45d1c50 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1029,19 +1029,213 @@ out:
 static int qemu_rbd_reopen_prepare(BDRVReopenState *state,
                                    BlockReopenQueue *queue, Error **errp)
 {
-    BDRVRBDState *s = state->bs->opaque;
-    int ret = 0;
+    BDRVRBDState *new_s = state->bs->opaque;
+    BlockdevOptionsRbd *opts = NULL;
+    const QDictEntry *e;
+    Error *local_err = NULL;
+    char *keypairs, *secretid;
+    rbd_image_info_t info;
+    int r = 0;
 
-    if (s->snap && state->flags & BDRV_O_RDWR) {
+    if (new_s->snap && state->flags & BDRV_O_RDWR) {
         error_setg(errp,
                    "Cannot change node '%s' to r/w when using RBD snapshot",
                    bdrv_get_device_or_node_name(state->bs));
-        ret = -EINVAL;
+        r = -EINVAL;
     }
 
-    return ret;
+    /*
+     * Remove all keys from the generic layer which
+     * can't be converted by rbd
+     */
+    qdict_del(state->options, "driver");
+    qdict_del(state->options, "node-name");
+    qdict_del(state->options, "auto-read-only");
+    qdict_del(state->options, "discard");
+    qdict_del(state->options, "cache");
+
+    /*
+     * To maintain the compatibility prior the rbd-reopen,
+     * where the generic layer can be altered without any
+     * rbd argument given, we must early return if there
+     * aren't any rbd-specific options left.
+     */
+    if (qdict_size(state->options) == 0) {
+        return r;
+    }
+
+    new_s = state->opaque = g_new0(BDRVReopenState, 1);
+
+    keypairs = g_strdup(qdict_get_try_str(state->options, "=keyvalue-pairs"));
+    if (keypairs) {
+        qdict_del(state->options, "=keyvalue-pairs");
+    }
+
+    secretid = g_strdup(qdict_get_try_str(state->options, "password-secret"));
+    if (secretid) {
+        qdict_del(state->options, "password-secret");
+    }
+
+    r = qemu_rbd_convert_options(state->options, &opts, &local_err);
+    if (local_err) {
+        /*
+         * If keypairs are present, that means some options are present in
+         * the modern option format.  Don't attempt to parse legacy option
+         * formats, as we won't support mixed usage.
+         */
+        if (keypairs) {
+            error_propagate(errp, local_err);
+            goto out;
+        }
+
+        /*
+         * If the initial attempt to convert and process the options failed,
+         * we may be attempting to open an image file that has the rbd options
+         * specified in the older format consisting of all key/value pairs
+         * encoded in the filename.  Go ahead and attempt to parse the
+         * filename, and see if we can pull out the required options.
+         */
+        r = qemu_rbd_attempt_legacy_options(state->options, &opts, &keypairs);
+        if (r < 0) {
+            /*
+             * Propagate the original error, not the legacy parsing fallback
+             * error, as the latter was just a best-effort attempt.
+             */
+            error_propagate(errp, local_err);
+            goto out;
+        }
+        /*
+         * Take care whenever deciding to actually deprecate; once this ability
+         * is removed, we will not be able to open any images with legacy-styled
+         * backing image strings.
+         */
+        warn_report("RBD options encoded in the filename as keyvalue pairs "
+                    "is deprecated");
+    }
+
+    /*
+     * Remove the processed options from the QDict (the visitor processes
+     * _all_ options in the QDict)
+     */
+    while ((e = qdict_first(state->options))) {
+        qdict_del(state->options, e->key);
+    }
+
+    r = qemu_rbd_connect(&new_s->cluster, &new_s->io_ctx, opts,
+                         !(state->flags & BDRV_O_NOCACHE), keypairs,
+                         secretid, errp);
+    if (r < 0) {
+        goto out;
+    }
+
+    new_s->snap = g_strdup(opts->snapshot);
+    new_s->image_name = g_strdup(opts->image);
+
+    /* rbd_open is always r/w */
+    r = rbd_open(new_s->io_ctx, new_s->image_name, &new_s->image, new_s->snap);
+    if (r < 0) {
+        error_setg_errno(errp, -r, "error reading header from %s",
+                         new_s->image_name);
+        goto failed_open;
+    }
+
+    if (opts->has_encrypt) {
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION
+        r = qemu_rbd_encryption_load(new_s->image, opts->encrypt, errp);
+        if (r < 0) {
+            goto failed_post_open;
+        }
+#else
+        r = -ENOTSUP;
+        error_setg(errp, "RBD library does not support image encryption");
+        goto failed_post_open;
+#endif
+    }
+
+    r = rbd_stat(new_s->image, &info, sizeof(info));
+    if (r < 0) {
+        error_setg_errno(errp, -r, "error getting image info from %s",
+                         new_s->image_name);
+        goto failed_post_open;
+    }
+    new_s->image_size = info.size;
+    new_s->object_size = info.obj_size;
+
+    /*
+     * If we are using an rbd snapshot, we must be r/o, otherwise
+     * leave as-is
+     */
+    if (new_s->snap != NULL) {
+        r = bdrv_apply_auto_read_only(state->bs, "rbd snapshots are read-only",
+                                      errp);
+        if (r < 0) {
+            goto failed_post_open;
+        }
+    }
+
+#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
+    state->bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK;
+#endif
+
+    /* When extending regular files, we get zeros from the OS */
+    state->bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
+
+    r = 0;
+    goto out;
+
+failed_post_open:
+    rbd_close(new_s->image);
+failed_open:
+    rados_ioctx_destroy(new_s->io_ctx);
+    g_free(new_s->snap);
+    g_free(new_s->image_name);
+    rados_shutdown(new_s->cluster);
+out:
+    qapi_free_BlockdevOptionsRbd(opts);
+    g_free(keypairs);
+    g_free(secretid);
+    return r;
 }
 
+static void qemu_rbd_reopen_abort(BDRVReopenState *reopen_state)
+{
+    BDRVRBDState *s = reopen_state->bs->opaque;
+
+    if (s->io_ctx) {
+        rados_ioctx_destroy(s->io_ctx);
+    }
+
+   if (s->cluster) {
+        rados_shutdown(s->cluster);
+    }
+
+    g_free(s->snap);
+    g_free(reopen_state->opaque);
+    reopen_state->opaque = NULL;
+}
+
+static void qemu_rbd_reopen_commit(BDRVReopenState *reopen_state)
+{
+    BDRVRBDState *s = reopen_state->bs->opaque;
+    BDRVRBDState *new_s = reopen_state->opaque;
+
+    rados_aio_flush(s->io_ctx);
+
+    rbd_close(s->image);
+    rados_ioctx_destroy(s->io_ctx);
+    g_free(s->snap);
+    rados_shutdown(s->cluster);
+
+    s->io_ctx = new_s->io_ctx;
+    s->cluster = new_s->cluster;
+    s->image = new_s->image;
+    s->snap = new_s->snap;
+
+    g_free(reopen_state->opaque);
+    reopen_state->opaque = NULL;
+}
+
+
 static void qemu_rbd_close(BlockDriverState *bs)
 {
     BDRVRBDState *s = bs->opaque;
@@ -1628,6 +1822,8 @@ static BlockDriver bdrv_rbd = {
     .bdrv_file_open         = qemu_rbd_open,
     .bdrv_close             = qemu_rbd_close,
     .bdrv_reopen_prepare    = qemu_rbd_reopen_prepare,
+    .bdrv_reopen_commit     = qemu_rbd_reopen_commit,
+    .bdrv_reopen_abort     = qemu_rbd_reopen_abort,
     .bdrv_co_create         = qemu_rbd_co_create,
     .bdrv_co_create_opts    = qemu_rbd_co_create_opts,
     .bdrv_has_zero_init     = bdrv_has_zero_init_1,
-- 
2.35.1


