Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D293BF964
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 13:55:46 +0200 (CEST)
Received: from localhost ([::1]:39350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Sd7-0000b5-Ez
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 07:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1SV9-0003wB-Ed
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:47:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1SV4-0001Rr-1P
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625744844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8bONWI951KGXc0D+byxSbr5E5ZjAQf6jNca6ePmDF1w=;
 b=GVqYBxTXof5pVmZUCwc0uFrsPXqfECBdorUX3y4G/vR1XMfEoROPmYFiXNORLxYqELr3YQ
 LyHfTGlYAphl/gsma2JTIOaI44aG0nj93TEu+q0vJ+EUg81xjlGrTPAgiA0laHZE+q6uRz
 B55RYtQkauN26BOPGubR6UZ5g0i8v+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-xWN0gNsdMuq4Hu-jmqh17A-1; Thu, 08 Jul 2021 07:47:21 -0400
X-MC-Unique: xWN0gNsdMuq4Hu-jmqh17A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8666B80006E;
 Thu,  8 Jul 2021 11:47:20 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-143.ams2.redhat.com [10.36.114.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2356560843;
 Thu,  8 Jul 2021 11:47:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 4/6] block: Support multiple reopening with
 x-blockdev-reopen
Date: Thu,  8 Jul 2021 13:47:07 +0200
Message-Id: <20210708114709.206487-5-kwolf@redhat.com>
In-Reply-To: <20210708114709.206487-1-kwolf@redhat.com>
References: <20210708114709.206487-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

[ kwolf: Fixed AioContext locking ]

Signed-off-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json                          | 18 +++--
 blockdev.c                                    | 81 ++++++++++---------
 tests/qemu-iotests/155                        |  9 ++-
 tests/qemu-iotests/165                        |  4 +-
 tests/qemu-iotests/245                        | 27 ++++---
 tests/qemu-iotests/248                        |  2 +-
 tests/qemu-iotests/248.out                    |  2 +-
 tests/qemu-iotests/296                        |  9 ++-
 tests/qemu-iotests/298                        |  4 +-
 .../tests/remove-bitmap-from-backing          | 18 +++--
 10 files changed, 99 insertions(+), 75 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 4a46552816..052520331e 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4221,13 +4221,15 @@
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
@@ -4247,8 +4249,8 @@
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
@@ -4258,7 +4260,7 @@
 # Since: 4.0
 ##
 { 'command': 'x-blockdev-reopen',
-  'data': 'BlockdevOptions', 'boxed': true }
+  'data': { 'options': ['BlockdevOptions'] } }
 
 ##
 # @blockdev-del:
diff --git a/blockdev.c b/blockdev.c
index f657d090d3..fddcccbdbd 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3560,51 +3560,60 @@ fail:
     visit_free(v);
 }
 
-void qmp_x_blockdev_reopen(BlockdevOptions *options, Error **errp)
-{
-    BlockDriverState *bs;
-    AioContext *ctx;
-    QObject *obj;
-    Visitor *v = qobject_output_visitor_new(&obj);
-    BlockReopenQueue *queue;
-    QDict *qdict;
+void qmp_x_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
+{
+    BlockReopenQueue *queue = NULL;
+    GSList *drained = NULL;
+
+    /* Add each one of the BDS that we want to reopen to the queue */
+    for (; reopen_list != NULL; reopen_list = reopen_list->next) {
+        BlockdevOptions *options = reopen_list->value;
+        BlockDriverState *bs;
+        AioContext *ctx;
+        QObject *obj;
+        Visitor *v;
+        QDict *qdict;
+
+        /* Check for the selected node name */
+        if (!options->has_node_name) {
+            error_setg(errp, "node-name not specified");
+            goto fail;
+        }
 
-    /* Check for the selected node name */
-    if (!options->has_node_name) {
-        error_setg(errp, "node-name not specified");
-        goto fail;
-    }
+        bs = bdrv_find_node(options->node_name);
+        if (!bs) {
+            error_setg(errp, "Failed to find node with node-name='%s'",
+                       options->node_name);
+            goto fail;
+        }
 
-    bs = bdrv_find_node(options->node_name);
-    if (!bs) {
-        error_setg(errp, "Failed to find node with node-name='%s'",
-                   options->node_name);
-        goto fail;
-    }
+        /* Put all options in a QDict and flatten it */
+        v = qobject_output_visitor_new(&obj);
+        visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
+        visit_complete(v, &obj);
+        visit_free(v);
 
-    /* Put all options in a QDict and flatten it */
-    visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
-    visit_complete(v, &obj);
-    qdict = qobject_to(QDict, obj);
+        qdict = qobject_to(QDict, obj);
 
-    qdict_flatten(qdict);
+        qdict_flatten(qdict);
 
-    /* Perform the reopen operation */
-    ctx = bdrv_get_aio_context(bs);
-    aio_context_acquire(ctx);
-    bdrv_subtree_drained_begin(bs);
-    aio_context_release(ctx);
+        ctx = bdrv_get_aio_context(bs);
+        aio_context_acquire(ctx);
 
-    queue = bdrv_reopen_queue(NULL, bs, qdict, false);
-    bdrv_reopen_multiple(queue, errp);
+        bdrv_subtree_drained_begin(bs);
+        queue = bdrv_reopen_queue(queue, bs, qdict, false);
+        drained = g_slist_prepend(drained, bs);
 
-    ctx = bdrv_get_aio_context(bs);
-    aio_context_acquire(ctx);
-    bdrv_subtree_drained_end(bs);
-    aio_context_release(ctx);
+        aio_context_release(ctx);
+    }
+
+    /* Perform the reopen operation */
+    bdrv_reopen_multiple(queue, errp);
+    queue = NULL;
 
 fail:
-    visit_free(v);
+    bdrv_reopen_queue_free(queue);
+    g_slist_free_full(drained, (GDestroyNotify) bdrv_subtree_drained_end);
 }
 
 void qmp_blockdev_del(const char *node_name, Error **errp)
diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index bafef9dd9a..2947bfb81a 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -261,9 +261,12 @@ class TestBlockdevMirrorReopen(MirrorBaseClass):
             result = self.vm.qmp('blockdev-add', node_name="backing",
                                  driver="null-co")
             self.assert_qmp(result, 'return', {})
-            result = self.vm.qmp('x-blockdev-reopen', node_name="target",
-                                 driver=iotests.imgfmt, file="target-file",
-                                 backing="backing")
+            result = self.vm.qmp('x-blockdev-reopen', options=[{
+                                     'node-name': "target",
+                                     'driver': iotests.imgfmt,
+                                     'file': "target-file",
+                                     'backing': "backing"
+                                 }])
             self.assert_qmp(result, 'return', {})
 
 class TestBlockdevMirrorReopenIothread(TestBlockdevMirrorReopen):
diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
index abc4ffadd5..ef4cf14516 100755
--- a/tests/qemu-iotests/165
+++ b/tests/qemu-iotests/165
@@ -137,7 +137,7 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
         assert sha256_1 == self.getSha256()
 
         # Reopen to RW
-        result = self.vm.qmp('x-blockdev-reopen', **{
+        result = self.vm.qmp('x-blockdev-reopen', options=[{
             'node-name': 'node0',
             'driver': iotests.imgfmt,
             'file': {
@@ -145,7 +145,7 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
                 'filename': disk
             },
             'read-only': False
-        })
+        }])
         self.assert_qmp(result, 'return', {})
 
         # Check that bitmap is reopened to RW and we can write to it.
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 0295129cbb..ca08955207 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -85,8 +85,18 @@ class TestBlockdevReopen(iotests.QMPTestCase):
                          "Expected output of %d qemu-io commands, found %d" %
                          (found, self.total_io_cmds))
 
-    # Run x-blockdev-reopen with 'opts' but applying 'newopts'
-    # on top of it. The original 'opts' dict is unmodified
+    # Run x-blockdev-reopen on a list of block devices
+    def reopenMultiple(self, opts, errmsg = None):
+        result = self.vm.qmp('x-blockdev-reopen', conv_keys=False, options=opts)
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
 
@@ -101,12 +111,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
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
@@ -142,10 +147,10 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # We cannot change any of these
         self.reopen(opts, {'node-name': 'not-found'}, "Failed to find node with node-name='not-found'")
         self.reopen(opts, {'node-name': ''}, "Failed to find node with node-name=''")
-        self.reopen(opts, {'node-name': None}, "Invalid parameter type for 'node-name', expected: string")
+        self.reopen(opts, {'node-name': None}, "Invalid parameter type for 'options[0].node-name', expected: string")
         self.reopen(opts, {'driver': 'raw'}, "Cannot change the option 'driver'")
         self.reopen(opts, {'driver': ''}, "Invalid parameter ''")
-        self.reopen(opts, {'driver': None}, "Invalid parameter type for 'driver', expected: string")
+        self.reopen(opts, {'driver': None}, "Invalid parameter type for 'options[0].driver', expected: string")
         self.reopen(opts, {'file': 'not-found'}, "Cannot find device='' nor node-name='not-found'")
         self.reopen(opts, {'file': ''}, "Cannot find device='' nor node-name=''")
         self.reopen(opts, {'file': None}, "Invalid parameter type for 'file', expected: BlockdevRef")
@@ -154,7 +159,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'file.filename': hd_path[1]}, "Cannot change the option 'filename'")
         self.reopen(opts, {'file.aio': 'native'}, "Cannot change the option 'aio'")
         self.reopen(opts, {'file.locking': 'off'}, "Cannot change the option 'locking'")
-        self.reopen(opts, {'file.filename': None}, "Invalid parameter type for 'file.filename', expected: string")
+        self.reopen(opts, {'file.filename': None}, "Invalid parameter type for 'options[0].file.filename', expected: string")
 
         # node-name is optional in BlockdevOptions, but x-blockdev-reopen needs it
         del opts['node-name']
diff --git a/tests/qemu-iotests/248 b/tests/qemu-iotests/248
index 4daaed1530..03911333c4 100755
--- a/tests/qemu-iotests/248
+++ b/tests/qemu-iotests/248
@@ -63,7 +63,7 @@ vm.get_qmp_events()
 
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
index 7c65e987a1..fa07b98bb4 100755
--- a/tests/qemu-iotests/296
+++ b/tests/qemu-iotests/296
@@ -120,8 +120,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
 
         command = 'x-blockdev-reopen' if reOpen else 'blockdev-add'
 
-        result = vm.qmp(command, **
-            {
+        opts = {
                 'driver': iotests.imgfmt,
                 'node-name': id,
                 'read-only': readOnly,
@@ -131,7 +130,11 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
                     'filename': test_img,
                 }
             }
-        )
+
+        if reOpen:
+            result = vm.qmp(command, options=[opts])
+        else:
+            result = vm.qmp(command, **opts)
         self.assert_qmp(result, 'return', {})
 
 
diff --git a/tests/qemu-iotests/298 b/tests/qemu-iotests/298
index d535946b5f..a5b0d91224 100755
--- a/tests/qemu-iotests/298
+++ b/tests/qemu-iotests/298
@@ -98,7 +98,7 @@ class TestPreallocateFilter(TestPreallocateBase):
         self.check_big()
 
     def test_reopen_opts(self):
-        result = self.vm.qmp('x-blockdev-reopen', **{
+        result = self.vm.qmp('x-blockdev-reopen', options=[{
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
diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing b/tests/qemu-iotests/tests/remove-bitmap-from-backing
index 0ea4c36507..0b07f7e836 100755
--- a/tests/qemu-iotests/tests/remove-bitmap-from-backing
+++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing
@@ -41,13 +41,15 @@ log('Trying to remove persistent bitmap from r-o base node, should fail:')
 vm.qmp_log('block-dirty-bitmap-remove', node='base', name='bitmap0')
 
 new_base_opts = {
-    'node-name': 'base',
-    'driver': 'qcow2',
-    'file': {
-        'driver': 'file',
-        'filename':  base
-    },
-    'read-only': False
+    'options': [{
+        'node-name': 'base',
+        'driver': 'qcow2',
+        'file': {
+            'driver': 'file',
+            'filename':  base
+        },
+        'read-only': False
+    }]
 }
 
 # Don't want to bother with filtering qmp_log for reopen command
@@ -58,7 +60,7 @@ if result != {'return': {}}:
 log('Remove persistent bitmap from base node reopened to RW:')
 vm.qmp_log('block-dirty-bitmap-remove', node='base', name='bitmap0')
 
-new_base_opts['read-only'] = True
+new_base_opts['options'][0]['read-only'] = True
 result = vm.qmp('x-blockdev-reopen', **new_base_opts)
 if result != {'return': {}}:
     log('Failed to reopen: ' + str(result))
-- 
2.31.1


