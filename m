Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1C7332ED5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:14:33 +0100 (CET)
Received: from localhost ([::1]:44568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhoO-0000G6-C2
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJfrM-0001Gm-2W; Tue, 09 Mar 2021 12:09:28 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:40113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJfrC-0001DS-93; Tue, 09 Mar 2021 12:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=J3J6WianT/41eWtmxGl129c6D0Clspsi8IpbEUJ3xys=; 
 b=g95xaUre+R2kXT7UH8lNYrenT8Dw4vJT33GTrgoSSYDg86u5HwCll+f0VkrqLpx92ySZQoe6cuywMM5WsTHLyOD3LdzVuEqpxzrKvNXan0w2sNvePC3fLg9RLsJABgrwzBkN9GkB9Kb2dawgP0TIE52bmT+phBfuWlIpspCAWwYUxu9CIjPlR/m0UGyMnKFRrNoT6F3mE7tGhC6BvZ76KxRoGBRhMWNElR25/uDCuxt85rkIcp+Rq2sluXgJGhZr3tiU6zXrCpl0mq4AaH4sblsNuJ/84JELcAiZlHJjy1F+z+c9EYE/8Ocdi6vSyNFX+E/8y3w6m+Ue7PDTX6FNuA==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lJfqn-0003Lp-Rk; Tue, 09 Mar 2021 18:08:53 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1lJfqa-0005IV-Ko; Tue, 09 Mar 2021 18:08:40 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] block: Allow changing bs->file on reopen
Date: Tue,  9 Mar 2021 18:08:28 +0100
Message-Id: <21ad668da317fa69d0c3fcb8d79bf46e89679851.1615309297.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1615309297.git.berto@igalia.com>
References: <cover.1615309297.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the x-blockdev-reopen was added it allowed reconfiguring the
graph by replacing backing files, but changing the 'file' option was
forbidden. Because of this restriction some operations are not
possible, notably inserting and removing block filters.

This patch adds support for replacing the 'file' option. This is
similar to replacing the backing file and the user is likewise
responsible for the correctness of the resulting graph, otherwise this
can lead to data corruption.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 include/block/block.h  |   1 +
 block.c                | 121 ++++++++++++++++++++++++++---------------
 tests/qemu-iotests/245 |   9 +--
 3 files changed, 82 insertions(+), 49 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index aa3d568fec..fe4a220da9 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -196,6 +196,7 @@ typedef struct BDRVReopenState {
     bool backing_missing;
     bool replace_backing_bs;  /* new_backing_bs is ignored if this is false */
     BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
+    BlockDriverState *old_file_bs;    /* keep pointer for permissions update */
     uint64_t perm, shared_perm;
     QDict *options;
     QDict *explicit_options;
diff --git a/block.c b/block.c
index 03b36cd5df..bce5d8a69c 100644
--- a/block.c
+++ b/block.c
@@ -106,7 +106,7 @@ static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
-                               GSList **set_backings_tran, Error **errp);
+                               GSList **tran, Error **errp);
 static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
 static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 
@@ -3989,6 +3989,10 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
             refresh_list = bdrv_topological_dfs(refresh_list, found,
                                                 state->old_backing_bs);
         }
+        if (state->old_file_bs) {
+            refresh_list = bdrv_topological_dfs(refresh_list, found,
+                                                state->old_file_bs);
+        }
     }
 
     ret = bdrv_list_refresh_perms(refresh_list, bs_queue, &tran, errp);
@@ -4093,65 +4097,77 @@ static bool bdrv_reopen_can_attach(BlockDriverState *parent,
  *
  * Return 0 on success, otherwise return < 0 and set @errp.
  */
-static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
-                                     GSList **set_backings_tran,
-                                     Error **errp)
+static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
+                                             bool parse_file, GSList **tran,
+                                             Error **errp)
 {
     BlockDriverState *bs = reopen_state->bs;
-    BlockDriverState *overlay_bs, *below_bs, *new_backing_bs;
+    BlockDriverState *overlay_bs, *below_bs, *new_child_bs;
+    BdrvChild *child = parse_file ? bs->file : bs->backing;
     QObject *value;
     const char *str;
 
-    value = qdict_get(reopen_state->options, "backing");
+    value = qdict_get(reopen_state->options, parse_file ? "file" : "backing");
     if (value == NULL) {
         return 0;
     }
 
     switch (qobject_type(value)) {
     case QTYPE_QNULL:
-        new_backing_bs = NULL;
+        assert(!parse_file); /* The 'file' option does not allow a null value */
+        new_child_bs = NULL;
         break;
     case QTYPE_QSTRING:
-        str = qobject_get_try_str(value);
-        new_backing_bs = bdrv_lookup_bs(NULL, str, errp);
-        if (new_backing_bs == NULL) {
+        str = qstring_get_str(qobject_to(QString, value));
+        new_child_bs = bdrv_lookup_bs(NULL, str, errp);
+        if (new_child_bs == NULL) {
             return -EINVAL;
-        } else if (bdrv_recurse_has_child(new_backing_bs, bs)) {
-            error_setg(errp, "Making '%s' a backing file of '%s' "
-                       "would create a cycle", str, bs->node_name);
+        } else if (bdrv_recurse_has_child(new_child_bs, bs)) {
+            error_setg(errp, "Making '%s' a %s of '%s' would create a cycle",
+                       str, parse_file ? "file" : "backing file",
+                       bs->node_name);
             return -EINVAL;
         }
         break;
     default:
-        /* 'backing' does not allow any other data type */
+        /* The options QDict has been flattened, so 'backing' and 'file'
+         * do not allow any other data type here. */
         g_assert_not_reached();
     }
 
-    /*
-     * Check AioContext compatibility so that the bdrv_set_backing_hd() call in
-     * bdrv_reopen_commit() won't fail.
-     */
-    if (new_backing_bs) {
-        if (!bdrv_reopen_can_attach(bs, bs->backing, new_backing_bs, errp)) {
+    /* If 'file' points to the current child then there's nothing to do */
+    if (child_bs(child) == new_child_bs) {
+        return 0;
+    }
+
+    /* Check AioContext compatibility */
+    if (new_child_bs) {
+        if (!bdrv_reopen_can_attach(bs, child, new_child_bs, errp)) {
             return -EINVAL;
         }
     }
 
-    /*
-     * Ensure that @bs can really handle backing files, because we are
-     * about to give it one (or swap the existing one)
-     */
-    if (bs->drv->is_filter) {
-        /* Filters always have a file or a backing child */
-        if (!bs->backing) {
-            error_setg(errp, "'%s' is a %s filter node that does not support a "
-                       "backing child", bs->node_name, bs->drv->format_name);
+    if (parse_file) {
+        assert(child && child->bs);
+    } else {
+        /*
+         * Ensure that @bs can really handle backing files, because we are
+         * about to give it one (or swap the existing one)
+         */
+        if (bs->drv->is_filter) {
+            /* Filters always have a file or a backing child */
+            if (!bs->backing) {
+                error_setg(errp, "'%s' is a %s filter node "
+                           "that does not support a backing child",
+                           bs->node_name, bs->drv->format_name);
+                return -EINVAL;
+            }
+        } else if (!bs->drv->supports_backing) {
+            error_setg(errp, "Driver '%s' of node '%s' "
+                       "does not support backing files",
+                       bs->drv->format_name, bs->node_name);
             return -EINVAL;
         }
-    } else if (!bs->drv->supports_backing) {
-        error_setg(errp, "Driver '%s' of node '%s' does not support backing "
-                   "files", bs->drv->format_name, bs->node_name);
-        return -EINVAL;
     }
 
     /*
@@ -4170,13 +4186,13 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
     }
 
     /* If we want to replace the backing file we need some extra checks */
-    if (new_backing_bs != bdrv_filter_or_cow_bs(overlay_bs)) {
+    if (new_child_bs != bdrv_filter_or_cow_bs(overlay_bs)) {
         int ret;
 
         /* Check for implicit nodes between bs and its backing file */
         if (bs != overlay_bs) {
-            error_setg(errp, "Cannot change backing link if '%s' has "
-                       "an implicit backing file", bs->node_name);
+            error_setg(errp, "Cannot change %s link if '%s' has an implicit "
+                       "child", parse_file ? "file" : "backing", bs->node_name);
             return -EPERM;
         }
         /*
@@ -4188,16 +4204,24 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
          * with bs->drv->supports_backing == true.
          */
         if (bdrv_is_backing_chain_frozen(overlay_bs,
-                                         child_bs(overlay_bs->backing), errp))
+                                         bdrv_filter_or_cow_bs(overlay_bs),
+                                         errp))
         {
             return -EPERM;
         }
-        reopen_state->replace_backing_bs = true;
-        reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
-        ret = bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran,
-                                      errp);
-        if (ret < 0) {
-            return ret;
+        if (parse_file) {
+            /* Store the old file bs, we'll need to refresh its permissions */
+            reopen_state->old_file_bs = bs->file->bs;
+
+            /* And finally replace the child */
+            bdrv_replace_child(bs->file, new_child_bs, tran);
+        } else {
+            reopen_state->replace_backing_bs = true;
+            reopen_state->old_backing_bs = child_bs(bs->backing);
+            ret = bdrv_set_backing_noperm(bs, new_child_bs, tran, errp);
+            if (ret < 0) {
+                return ret;
+            }
         }
     }
 
@@ -4223,7 +4247,7 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
  */
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
-                               GSList **set_backings_tran, Error **errp)
+                               GSList **tran, Error **errp)
 {
     int ret = -1;
     int old_flags;
@@ -4349,12 +4373,19 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
      * either a reference to an existing node (using its node name)
      * or NULL to simply detach the current backing file.
      */
-    ret = bdrv_reopen_parse_backing(reopen_state, set_backings_tran, errp);
+    ret = bdrv_reopen_parse_file_or_backing(reopen_state, false, tran, errp);
     if (ret < 0) {
         goto error;
     }
     qdict_del(reopen_state->options, "backing");
 
+    /* Allow changing the 'file' option. In this case NULL is not allowed */
+    ret = bdrv_reopen_parse_file_or_backing(reopen_state, true, tran, errp);
+    if (ret < 0) {
+        goto error;
+    }
+    qdict_del(reopen_state->options, "file");
+
     /* Options that are not handled are only okay if they are unchanged
      * compared to the old state. It is expected that some options are only
      * used for the initial open, but not reopen (e.g. filename) */
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index e60c8326d3..52c2ed7c2d 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -145,8 +145,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'driver': 'raw'}, "Cannot change the option 'driver'")
         self.reopen(opts, {'driver': ''}, "Invalid parameter ''")
         self.reopen(opts, {'driver': None}, "Invalid parameter type for 'driver', expected: string")
-        self.reopen(opts, {'file': 'not-found'}, "Cannot change the option 'file'")
-        self.reopen(opts, {'file': ''}, "Cannot change the option 'file'")
+        self.reopen(opts, {'file': 'not-found'}, "Cannot find device= nor node_name=not-found")
+        self.reopen(opts, {'file': ''}, "Cannot find device= nor node_name=")
         self.reopen(opts, {'file': None}, "Invalid parameter type for 'file', expected: BlockdevRef")
         self.reopen(opts, {'file.node-name': 'newname'}, "Cannot change the option 'node-name'")
         self.reopen(opts, {'file.driver': 'host_device'}, "Cannot change the option 'driver'")
@@ -454,7 +454,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # More illegal operations
         self.reopen(opts[2], {'backing': 'hd1'},
                     "Making 'hd1' a backing file of 'hd2' would create a cycle")
-        self.reopen(opts[2], {'file': 'hd0-file'}, "Cannot change the option 'file'")
+        self.reopen(opts[2], {'file': 'hd0-file'},
+                    "Conflicts with use by hd2 as 'file', which does not allow 'write, resize' on hd0-file")
 
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd2')
         self.assert_qmp(result, 'error/class', 'GenericError')
@@ -964,7 +965,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # We can't remove hd1 while the commit job is ongoing
         opts['backing'] = None
-        self.reopen(opts, {}, "Cannot change backing link if 'hd0' has an implicit backing file")
+        self.reopen(opts, {}, "Cannot change backing link if 'hd0' has an implicit child")
 
         # hd2 <- hd0
         self.vm.run_job('commit0', auto_finalize = False, auto_dismiss = True)
-- 
2.20.1


