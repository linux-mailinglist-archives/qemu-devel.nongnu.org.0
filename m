Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D2133F765
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:47:01 +0100 (CET)
Received: from localhost ([::1]:59528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMaG5-0003rC-0G
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lMZmk-0003df-KO; Wed, 17 Mar 2021 13:16:42 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:38053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lMZmg-0006rV-Pw; Wed, 17 Mar 2021 13:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=3JUrd5uPT4K09azhBJNt0PcrPn/Tc4vTPIAbZ1Npi3w=; 
 b=W02/EYvQYik50MjmsbN0KjpZo+Paq+vReO8lQkA4r+XfAuXZYWdeyHl2LTf+fM2ewHyuAYccxSKt16UDs1fjMn/f3iaF6V1/bIN2gUkKWin1TgiRw9LC1G5qIeC5Mdbdeg2HBYMuFiMHgDYq6yp/kKoEtY67kVoYIhL1VjsmgsodKLD4cIfldE1w2HE/1Vb2XS5kAt+i5L4nmHRH4w3xwyO4xTG9x+COFn7f5WpLou4ZTTV/LmE7oTx189fgYPWOopy3DNo+fKYimaH9Ganqm6SCqTGoEElXuidWVs8xbJYiG/RXFLjPEbIOnvKfDA1Lq7Z+SGcrX9LAInwAwJk5PQ==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lMZmd-0003v2-OV; Wed, 17 Mar 2021 18:16:35 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1lMZmQ-0007Ri-GM; Wed, 17 Mar 2021 18:16:22 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/6] block: Make blockdev-reopen stable API
Date: Wed, 17 Mar 2021 18:15:57 +0100
Message-Id: <4923fad2da7af38dba3c8ad00eb0be098648b588.1616000692.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616000692.git.berto@igalia.com>
References: <cover.1616000692.git.berto@igalia.com>
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

This patch drops the 'x-' prefix from x-blockdev-reopen.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 qapi/block-core.json       |  6 +++---
 blockdev.c                 |  2 +-
 tests/qemu-iotests/155     |  2 +-
 tests/qemu-iotests/165     |  2 +-
 tests/qemu-iotests/245     | 10 +++++-----
 tests/qemu-iotests/248     |  2 +-
 tests/qemu-iotests/248.out |  2 +-
 tests/qemu-iotests/296     |  2 +-
 tests/qemu-iotests/298     |  2 +-
 9 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9150f765da..93fb0606e9 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4179,7 +4179,7 @@
 { 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true }
 
 ##
-# @x-blockdev-reopen:
+# @blockdev-reopen:
 #
 # Reopens one or more block devices using the given set of options.
 # Any option not specified will be reset to its default value regardless
@@ -4217,9 +4217,9 @@
 # image does not have a default backing file name as part of its
 # metadata.
 #
-# Since: 4.0
+# Since: 6.0
 ##
-{ 'command': 'x-blockdev-reopen',
+{ 'command': 'blockdev-reopen',
   'data': { 'options': ['BlockdevOptions'] } }
 
 ##
diff --git a/blockdev.c b/blockdev.c
index 7019397b05..d697db8417 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3580,7 +3580,7 @@ fail:
     visit_free(v);
 }
 
-void qmp_x_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
+void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
 {
     BlockReopenQueue *queue = NULL;
     GSList *aio_ctxs = NULL;
diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index 3400b0312a..fec43d662d 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -261,7 +261,7 @@ class TestBlockdevMirrorReopen(MirrorBaseClass):
             result = self.vm.qmp('blockdev-add', node_name="backing",
                                  driver="null-co")
             self.assert_qmp(result, 'return', {})
-            result = self.vm.qmp('x-blockdev-reopen', options = [{
+            result = self.vm.qmp('blockdev-reopen', options = [{
                                      'node-name': "target",
                                      'driver': iotests.imgfmt,
                                      'file': "target-file",
diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
index 57aa88ecae..92a431315b 100755
--- a/tests/qemu-iotests/165
+++ b/tests/qemu-iotests/165
@@ -137,7 +137,7 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
         assert sha256_1 == self.getSha256()
 
         # Reopen to RW
-        result = self.vm.qmp('x-blockdev-reopen', options = [{
+        result = self.vm.qmp('blockdev-reopen', options = [{
             'node-name': 'node0',
             'driver': iotests.imgfmt,
             'file': {
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 1a4413e6ab..e7498b5b3e 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
 # group: rw
 #
-# Test cases for the QMP 'x-blockdev-reopen' command
+# Test cases for the QMP 'blockdev-reopen' command
 #
 # Copyright (C) 2018-2019 Igalia, S.L.
 # Author: Alberto Garcia <berto@igalia.com>
@@ -85,16 +85,16 @@ class TestBlockdevReopen(iotests.QMPTestCase):
                          "Expected output of %d qemu-io commands, found %d" %
                          (found, self.total_io_cmds))
 
-    # Run x-blockdev-reopen on a list of block devices
+    # Run blockdev-reopen on a list of block devices
     def reopenMultiple(self, opts, errmsg = None):
-        result = self.vm.qmp('x-blockdev-reopen', conv_keys = False, options = opts)
+        result = self.vm.qmp('blockdev-reopen', conv_keys = False, options = opts)
         if errmsg:
             self.assert_qmp(result, 'error/class', 'GenericError')
             self.assert_qmp(result, 'error/desc', errmsg)
         else:
             self.assert_qmp(result, 'return', {})
 
-    # Run x-blockdev-reopen on a single block device (specified by
+    # Run blockdev-reopen on a single block device (specified by
     # 'opts') but applying 'newopts' on top of it. The original 'opts'
     # dict is unmodified
     def reopen(self, opts, newopts = {}, errmsg = None):
@@ -161,7 +161,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'file.locking': 'off'}, "Cannot change the option 'locking'")
         self.reopen(opts, {'file.filename': None}, "Invalid parameter type for 'options[0].file.filename', expected: string")
 
-        # node-name is optional in BlockdevOptions, but x-blockdev-reopen needs it
+        # node-name is optional in BlockdevOptions, but blockdev-reopen needs it
         del opts['node-name']
         self.reopen(opts, {}, "node-name not specified")
 
diff --git a/tests/qemu-iotests/248 b/tests/qemu-iotests/248
index 03911333c4..2ec2416e8a 100755
--- a/tests/qemu-iotests/248
+++ b/tests/qemu-iotests/248
@@ -62,7 +62,7 @@ vm.event_wait('JOB_STATUS_CHANGE', timeout=3.0,
 vm.get_qmp_events()
 
 del blockdev_opts['file']['size']
-vm.qmp_log('x-blockdev-reopen', filters=[filter_qmp_testfiles],
+vm.qmp_log('blockdev-reopen', filters=[filter_qmp_testfiles],
            options = [ blockdev_opts ])
 
 vm.qmp_log('block-job-resume', device='drive0')
diff --git a/tests/qemu-iotests/248.out b/tests/qemu-iotests/248.out
index 893f625347..66e94ccd7e 100644
--- a/tests/qemu-iotests/248.out
+++ b/tests/qemu-iotests/248.out
@@ -2,7 +2,7 @@
 {"return": {}}
 {"execute": "blockdev-mirror", "arguments": {"device": "drive0", "on-target-error": "enospc", "sync": "full", "target": "target"}}
 {"return": {}}
-{"execute": "x-blockdev-reopen", "arguments": {"options": [{"driver": "qcow2", "file": {"driver": "raw", "file": {"driver": "file", "filename": "TEST_DIR/PID-target"}}, "node-name": "target"}]}}
+{"execute": "blockdev-reopen", "arguments": {"options": [{"driver": "qcow2", "file": {"driver": "raw", "file": {"driver": "file", "filename": "TEST_DIR/PID-target"}}, "node-name": "target"}]}}
 {"return": {}}
 {"execute": "block-job-resume", "arguments": {"device": "drive0"}}
 {"return": {}}
diff --git a/tests/qemu-iotests/296 b/tests/qemu-iotests/296
index 74b74511b6..9206ddb954 100755
--- a/tests/qemu-iotests/296
+++ b/tests/qemu-iotests/296
@@ -118,7 +118,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
     def openImageQmp(self, vm, id, file, secret,
                      readOnly = False, reOpen = False):
 
-        command = 'x-blockdev-reopen' if reOpen else 'blockdev-add'
+        command = 'blockdev-reopen' if reOpen else 'blockdev-add'
 
         opts = {
                 'driver': iotests.imgfmt,
diff --git a/tests/qemu-iotests/298 b/tests/qemu-iotests/298
index 4efdb35b91..b4d8bd9b55 100755
--- a/tests/qemu-iotests/298
+++ b/tests/qemu-iotests/298
@@ -98,7 +98,7 @@ class TestPreallocateFilter(TestPreallocateBase):
         self.check_big()
 
     def test_reopen_opts(self):
-        result = self.vm.qmp('x-blockdev-reopen', options = [{
+        result = self.vm.qmp('blockdev-reopen', options = [{
             'node-name': 'disk',
             'driver': iotests.imgfmt,
             'file': {
-- 
2.20.1


