Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EDA332EFE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:28:59 +0100 (CET)
Received: from localhost ([::1]:42784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJi2M-0004XZ-FP
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:28:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJfrU-0001Hr-Cc; Tue, 09 Mar 2021 12:09:40 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:40111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJfrC-0001DR-Bl; Tue, 09 Mar 2021 12:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=NfDS7dXyOCeNC9LgC3zZa3Ktb8Tp7wUyzuQoLd+U8U4=; 
 b=ld+t+o+rXgJH+w7z9xiUbZEdU6rzhqoGo38PwQ8G1ApXS/vmGCG5aIWs1gRw3uDC7xTWwicYX37iazoXH2R+Kl0l3W47axL+vV9heoqLX4AAzLHhdWsMSEDO/qWt3PpjqOhB2vuskWE6BJ/3kpkzg2Xm2p3MqfSmiQeSawzqHm8BXdUN+LO0dJ9BHjr8jF/avDmcSq1X4PokyFqmEVrMVJVFn4AElvXwB0W2U4SIDXIBeSikXYIFlhMd23tSNxcGLn/p0MnC22jyB3gd8WKrW56x6WyaHiMIg8ghHJjFYQ2IMn/6lNTi7vwk+dgPyv7HbcYCGolM4WrckxVo+ik+zw==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lJfqn-0003Ls-Kg; Tue, 09 Mar 2021 18:08:53 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1lJfqa-0005IZ-NK; Tue, 09 Mar 2021 18:08:40 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] block: Support multiple reopening with
 x-blockdev-reopen
Date: Tue,  9 Mar 2021 18:08:30 +0100
Message-Id: <7e29a61c90f84bf2bdc62b76b8b65697e854660a.1615309297.git.berto@igalia.com>
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

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 qapi/block-core.json       | 18 ++++----
 blockdev.c                 | 85 +++++++++++++++++++++-----------------
 tests/qemu-iotests/155     |  9 ++--
 tests/qemu-iotests/165     |  4 +-
 tests/qemu-iotests/245     | 27 +++++++-----
 tests/qemu-iotests/248     |  2 +-
 tests/qemu-iotests/248.out |  2 +-
 tests/qemu-iotests/296     |  9 ++--
 tests/qemu-iotests/298     |  4 +-
 9 files changed, 91 insertions(+), 69 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index c0e7c23331..0363c901b7 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4140,13 +4140,15 @@
 ##
 # @x-blockdev-reopen:
 #
-# Reopens a block device using the given set of options. Any option
-# not specified will be reset to its default value regardless of its
-# previous status. If an option cannot be changed or a particular
+# Reopens one or more block devices using the given set of options.
+# Any option not specified will be reset to its default value regardless
+# of its previous status. If an option cannot be changed or a particular
 # driver does not support reopening then the command will return an
-# error.
+# error. All devices in the list are reopened in one transaction, so
+# if one of them fails then the whole transaction is cancelled.
 #
-# The top-level @node-name option (from BlockdevOptions) must be
+# The command receives a list of block devices to reopen. For each one
+# of them, the top-level @node-name option (from BlockdevOptions) must be
 # specified and is used to select the block device to be reopened.
 # Other @node-name options must be either omitted or set to the
 # current name of the appropriate node. This command won't change any
@@ -4166,8 +4168,8 @@
 #
 #  4) NULL: the current child (if any) is detached.
 #
-# Options (1) and (2) are supported in all cases, but at the moment
-# only @backing allows replacing or detaching an existing child.
+# Options (1) and (2) are supported in all cases. Option (3) is
+# supported for @file and @backing, and option (4) for @backing only.
 #
 # Unlike with blockdev-add, the @backing option must always be present
 # unless the node being reopened does not have a backing file and its
@@ -4177,7 +4179,7 @@
 # Since: 4.0
 ##
 { 'command': 'x-blockdev-reopen',
-  'data': 'BlockdevOptions', 'boxed': true }
+  'data': { 'options': ['BlockdevOptions'] } }
 
 ##
 # @blockdev-del:
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
index 1549a42e2b..53281228bc 100755
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
diff --git a/tests/qemu-iotests/296 b/tests/qemu-iotests/296
index fb7dec88aa..cfa5122d6b 100755
--- a/tests/qemu-iotests/296
+++ b/tests/qemu-iotests/296
@@ -119,8 +119,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
 
         command = 'x-blockdev-reopen' if reOpen else 'blockdev-add'
 
-        result = vm.qmp(command, **
-            {
+        opts = {
                 'driver': iotests.imgfmt,
                 'node-name': id,
                 'read-only': readOnly,
@@ -130,7 +129,11 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
                     'filename': test_img,
                 }
             }
-        )
+
+        if reOpen:
+            result = vm.qmp(command, options = [ opts ])
+        else:
+            result = vm.qmp(command, **opts)
         self.assert_qmp(result, 'return', {})
 
 
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


