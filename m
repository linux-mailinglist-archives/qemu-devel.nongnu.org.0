Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9210314437
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:45:03 +0100 (CET)
Received: from localhost ([::1]:39168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GDG-0002ub-Pg
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l9BXY-0008LL-OU; Mon, 08 Feb 2021 13:45:40 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:46564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l9BXN-0006o5-KC; Mon, 08 Feb 2021 13:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=7nFfZtvBeovHn4Wwh0jyWvZcZK3kI4SIwbW+mBSArbA=; 
 b=U4ANeCsJqdI3sT5utwgzqr/YHw/p2jru65ghQUHViuGaq/WanmdoHCpP3TUvtTgSGDod/ayvSy6Lkso9kZWB+d6CDLK6Vy0SQbuvOhznohzsQ0w1FAh62FwWvKxoSNP8LggMZAcUQPgMJOd4uWoAaKVBIQ7FC4DU0XFnjAxyc+WTT9AhMWODzrWeAeLpKmazcfboDwMcFUlfWKL5sDeczIjQ4EAEeeJZqQ2if5Sr8GdeGSS1mHZwZsw+OusY9Ix0qJBbfRWo6TN/ReVU++BrQOdt4rjjNPzABymRqcSsJIAw+G9itDAhmnovSa3gPMmq4VUTntYA0sYCZPYRagpAbQ==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1l9BWw-000569-Ll; Mon, 08 Feb 2021 19:45:02 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1l9BWj-000085-MV; Mon, 08 Feb 2021 19:44:49 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 3/4] block: Support multiple reopening with
 x-blockdev-reopen
Date: Mon,  8 Feb 2021 19:44:43 +0100
Message-Id: <145882bca942bb629bce2b1f5546fe0946ccdfcd.1612809837.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1612809837.git.berto@igalia.com>
References: <cover.1612809837.git.berto@igalia.com>
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

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 qapi/block-core.json       |  2 +-
 include/block/block.h      |  1 +
 block.c                    | 16 +++++--
 blockdev.c                 | 85 +++++++++++++++++++++-----------------
 tests/qemu-iotests/155     |  9 ++--
 tests/qemu-iotests/165     |  4 +-
 tests/qemu-iotests/245     | 27 +++++++-----
 tests/qemu-iotests/248     |  2 +-
 tests/qemu-iotests/248.out |  2 +-
 tests/qemu-iotests/298     |  4 +-
 10 files changed, 89 insertions(+), 63 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index c0e7c23331..b9fcf20a81 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4177,7 +4177,7 @@
 # Since: 4.0
 ##
 { 'command': 'x-blockdev-reopen',
-  'data': 'BlockdevOptions', 'boxed': true }
+  'data': { 'options': ['BlockdevOptions'] } }
 
 ##
 # @blockdev-del:
diff --git a/include/block/block.h b/include/block/block.h
index 6dd687a69e..fe4a220da9 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -372,6 +372,7 @@ BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
 BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                     BlockDriverState *bs, QDict *options,
                                     bool keep_old_opts);
+void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue);
 int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp);
 int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
                               Error **errp);
diff --git a/block.c b/block.c
index 19b62da4af..b4fef2308f 100644
--- a/block.c
+++ b/block.c
@@ -3933,6 +3933,17 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                    NULL, 0, keep_old_opts);
 }
 
+void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue)
+{
+    if (bs_queue) {
+        BlockReopenQueueEntry *bs_entry, *next;
+        QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
+            g_free(bs_entry);
+        }
+        g_free(bs_queue);
+    }
+}
+
 /*
  * Reopen multiple BlockDriverStates atomically & transactionally.
  *
@@ -4024,10 +4035,7 @@ abort:
     }
 
 cleanup:
-    QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
-        g_free(bs_entry);
-    }
-    g_free(bs_queue);
+    bdrv_reopen_queue_free(bs_queue);
 
     return ret;
 }
diff --git a/blockdev.c b/blockdev.c
index 098a05709d..6b688c0f73 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3528,38 +3528,16 @@ fail:
     visit_free(v);
 }
 
-void qmp_x_blockdev_reopen(BlockdevOptions *options, Error **errp)
+void qmp_x_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
 {
-    BlockDriverState *bs;
-    QObject *obj;
-    Visitor *v = qobject_output_visitor_new(&obj);
-    BlockReopenQueue *queue;
-    QDict *qdict;
-
-    /* Check for the selected node name */
-    if (!options->has_node_name) {
-        error_setg(errp, "Node name not specified");
-        goto fail;
-    }
-
-    bs = bdrv_find_node(options->node_name);
-    if (!bs) {
-        error_setg(errp, "Cannot find node named '%s'", options->node_name);
-        goto fail;
-    }
-
-    /* Put all options in a QDict and flatten it */
-    visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
-    visit_complete(v, &obj);
-    qdict = qobject_to(QDict, obj);
-
-    qdict_flatten(qdict);
-
-    /* Perform the reopen operation */
+    BlockReopenQueue *queue = NULL;
+    GSList *aio_ctxs = NULL;
+    GSList *visitors = NULL;
+    GSList *drained = NULL;
     BdrvNextIterator it;
-    GSList *aio_ctxs = NULL, *ctx;
     BlockDriverState *it_bs;
 
+    /* Acquire all AIO contexts */
     for (it_bs = bdrv_first(&it); it_bs; it_bs = bdrv_next(&it)) {
         AioContext *aio_context = bdrv_get_aio_context(it_bs);
 
@@ -3569,19 +3547,50 @@ void qmp_x_blockdev_reopen(BlockdevOptions *options, Error **errp)
         }
     }
 
-    bdrv_subtree_drained_begin(bs);
-    queue = bdrv_reopen_queue(NULL, bs, qdict, false);
+    /* Add each one of the BDS that we want to reopen to the queue */
+    for (; reopen_list != NULL; reopen_list = reopen_list->next) {
+        BlockdevOptions *options = reopen_list->value;
+        QDict *qdict;
+        Visitor *v;
+        BlockDriverState *bs;
+        QObject *obj;
+
+        /* Check for the selected node name */
+        if (!options->has_node_name) {
+            error_setg(errp, "Node name not specified");
+            goto fail;
+        }
+
+        bs = bdrv_find_node(options->node_name);
+        if (!bs) {
+            error_setg(errp, "Cannot find node named '%s'", options->node_name);
+            goto fail;
+        }
+
+        v = qobject_output_visitor_new(&obj);
+        visitors = g_slist_prepend(visitors, v);
+
+        /* Put all options in a QDict and flatten it */
+        visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
+        visit_complete(v, &obj);
+        qdict = qobject_to(QDict, obj);
+
+        qdict_flatten(qdict);
+
+        bdrv_subtree_drained_begin(bs);
+        queue = bdrv_reopen_queue(queue, bs, qdict, false);
+        drained = g_slist_prepend(drained, bs);
+    }
+
+    /* Perform the reopen operation */
     bdrv_reopen_multiple(queue, errp);
-    bdrv_subtree_drained_end(bs);
-
-    for (ctx = aio_ctxs; ctx != NULL; ctx = ctx->next) {
-        AioContext *aio_context = ctx->data;
-        aio_context_release(aio_context);
-    }
-    g_slist_free(aio_ctxs);
+    queue = NULL;
 
 fail:
-    visit_free(v);
+    bdrv_reopen_queue_free(queue);
+    g_slist_free_full(drained, (GDestroyNotify) bdrv_subtree_drained_end);
+    g_slist_free_full(aio_ctxs, (GDestroyNotify) aio_context_release);
+    g_slist_free_full(visitors, (GDestroyNotify) visit_free);
 }
 
 void qmp_blockdev_del(const char *node_name, Error **errp)
diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index 988f986144..5271f9541f 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -260,9 +260,12 @@ class TestBlockdevMirrorReopen(MirrorBaseClass):
             result = self.vm.qmp('blockdev-add', node_name="backing",
                                  driver="null-co")
             self.assert_qmp(result, 'return', {})
-            result = self.vm.qmp('x-blockdev-reopen', node_name="target",
-                                 driver=iotests.imgfmt, file="target-file",
-                                 backing="backing")
+            result = self.vm.qmp('x-blockdev-reopen', options = [{
+                                     'node-name': "target",
+                                     'driver': iotests.imgfmt,
+                                     'file': "target-file",
+                                     'backing': "backing"
+                                 }])
             self.assert_qmp(result, 'return', {})
 
 class TestBlockdevMirrorReopenIothread(TestBlockdevMirrorReopen):
diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
index fb56a769b4..32db5086e1 100755
--- a/tests/qemu-iotests/165
+++ b/tests/qemu-iotests/165
@@ -136,7 +136,7 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
         assert sha256_1 == self.getSha256()
 
         # Reopen to RW
-        result = self.vm.qmp('x-blockdev-reopen', **{
+        result = self.vm.qmp('x-blockdev-reopen', options = [{
             'node-name': 'node0',
             'driver': iotests.imgfmt,
             'file': {
@@ -144,7 +144,7 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
                 'filename': disk
             },
             'read-only': False
-        })
+        }])
         self.assert_qmp(result, 'return', {})
 
         # Check that bitmap is reopened to RW and we can write to it.
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index bad6911f0c..850c9f070b 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -84,8 +84,18 @@ class TestBlockdevReopen(iotests.QMPTestCase):
                          "Expected output of %d qemu-io commands, found %d" %
                          (found, self.total_io_cmds))
 
-    # Run x-blockdev-reopen with 'opts' but applying 'newopts'
-    # on top of it. The original 'opts' dict is unmodified
+    # Run x-blockdev-reopen on a list of block devices
+    def reopenMultiple(self, opts, errmsg = None):
+        result = self.vm.qmp('x-blockdev-reopen', conv_keys = False, options = opts)
+        if errmsg:
+            self.assert_qmp(result, 'error/class', 'GenericError')
+            self.assert_qmp(result, 'error/desc', errmsg)
+        else:
+            self.assert_qmp(result, 'return', {})
+
+    # Run x-blockdev-reopen on a single block device (specified by
+    # 'opts') but applying 'newopts' on top of it. The original 'opts'
+    # dict is unmodified
     def reopen(self, opts, newopts = {}, errmsg = None):
         opts = copy.deepcopy(opts)
 
@@ -100,12 +110,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
                 subdict = opts[prefix]
             subdict[key] = value
 
-        result = self.vm.qmp('x-blockdev-reopen', conv_keys = False, **opts)
-        if errmsg:
-            self.assert_qmp(result, 'error/class', 'GenericError')
-            self.assert_qmp(result, 'error/desc', errmsg)
-        else:
-            self.assert_qmp(result, 'return', {})
+        self.reopenMultiple([ opts ], errmsg)
 
 
     # Run query-named-block-nodes and return the specified entry
@@ -141,10 +146,10 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # We cannot change any of these
         self.reopen(opts, {'node-name': 'not-found'}, "Cannot find node named 'not-found'")
         self.reopen(opts, {'node-name': ''}, "Cannot find node named ''")
-        self.reopen(opts, {'node-name': None}, "Invalid parameter type for 'node-name', expected: string")
+        self.reopen(opts, {'node-name': None}, "Invalid parameter type for 'options[0].node-name', expected: string")
         self.reopen(opts, {'driver': 'raw'}, "Cannot change the option 'driver'")
         self.reopen(opts, {'driver': ''}, "Invalid parameter ''")
-        self.reopen(opts, {'driver': None}, "Invalid parameter type for 'driver', expected: string")
+        self.reopen(opts, {'driver': None}, "Invalid parameter type for 'options[0].driver', expected: string")
         self.reopen(opts, {'file': 'not-found'}, "Cannot find device= nor node_name=not-found")
         self.reopen(opts, {'file': ''}, "Cannot find device= nor node_name=")
         self.reopen(opts, {'file': None}, "Invalid parameter type for 'file', expected: BlockdevRef")
@@ -153,7 +158,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'file.filename': hd_path[1]}, "Cannot change the option 'filename'")
         self.reopen(opts, {'file.aio': 'native'}, "Cannot change the option 'aio'")
         self.reopen(opts, {'file.locking': 'off'}, "Cannot change the option 'locking'")
-        self.reopen(opts, {'file.filename': None}, "Invalid parameter type for 'file.filename', expected: string")
+        self.reopen(opts, {'file.filename': None}, "Invalid parameter type for 'options[0].file.filename', expected: string")
 
         # node-name is optional in BlockdevOptions, but x-blockdev-reopen needs it
         del opts['node-name']
diff --git a/tests/qemu-iotests/248 b/tests/qemu-iotests/248
index 18ba03467e..2b43853183 100755
--- a/tests/qemu-iotests/248
+++ b/tests/qemu-iotests/248
@@ -62,7 +62,7 @@ vm.get_qmp_events()
 
 del blockdev_opts['file']['size']
 vm.qmp_log('x-blockdev-reopen', filters=[filter_qmp_testfiles],
-           **blockdev_opts)
+           options = [ blockdev_opts ])
 
 vm.qmp_log('block-job-resume', device='drive0')
 vm.event_wait('JOB_STATUS_CHANGE', timeout=1.0,
diff --git a/tests/qemu-iotests/248.out b/tests/qemu-iotests/248.out
index 369b25bf26..893f625347 100644
--- a/tests/qemu-iotests/248.out
+++ b/tests/qemu-iotests/248.out
@@ -2,7 +2,7 @@
 {"return": {}}
 {"execute": "blockdev-mirror", "arguments": {"device": "drive0", "on-target-error": "enospc", "sync": "full", "target": "target"}}
 {"return": {}}
-{"execute": "x-blockdev-reopen", "arguments": {"driver": "qcow2", "file": {"driver": "raw", "file": {"driver": "file", "filename": "TEST_DIR/PID-target"}}, "node-name": "target"}}
+{"execute": "x-blockdev-reopen", "arguments": {"options": [{"driver": "qcow2", "file": {"driver": "raw", "file": {"driver": "file", "filename": "TEST_DIR/PID-target"}}, "node-name": "target"}]}}
 {"return": {}}
 {"execute": "block-job-resume", "arguments": {"device": "drive0"}}
 {"return": {}}
diff --git a/tests/qemu-iotests/298 b/tests/qemu-iotests/298
index d535946b5f..4efdb35b91 100644
--- a/tests/qemu-iotests/298
+++ b/tests/qemu-iotests/298
@@ -98,7 +98,7 @@ class TestPreallocateFilter(TestPreallocateBase):
         self.check_big()
 
     def test_reopen_opts(self):
-        result = self.vm.qmp('x-blockdev-reopen', **{
+        result = self.vm.qmp('x-blockdev-reopen', options = [{
             'node-name': 'disk',
             'driver': iotests.imgfmt,
             'file': {
@@ -112,7 +112,7 @@ class TestPreallocateFilter(TestPreallocateBase):
                     'filename': disk
                 }
             }
-        })
+        }])
         self.assert_qmp(result, 'return', {})
 
         self.vm.hmp_qemu_io('drive0', 'write 0 1M')
-- 
2.20.1


