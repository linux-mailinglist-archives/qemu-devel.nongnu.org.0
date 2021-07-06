Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B6C3BD03C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 13:30:26 +0200 (CEST)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0jHV-0006PT-BI
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 07:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0jBY-0003Rh-D1
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 07:24:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0jBP-0000iM-0R
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 07:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625570646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsRtgrJMMwT25pSXyctNDCNZ+oJh564je2oy/bdluHE=;
 b=YKg3DxuoIq7kJwDxiHBMsQDDuWS3AqzmBqeAK8ZQs3OsO+xXZ+GpWZCHOANuOUvtm7KuwJ
 Am9LITdpdPnqJkpZisbgGSWckD6LDNPAd3Lg6LlIDsjuFZZE/gi7F+j/wcWv0P44E7krec
 1jMxoXgxnz6QBivPpcXk0mxnq/XhF/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-1ijALHDpMGCPik4GoNWDzQ-1; Tue, 06 Jul 2021 07:24:05 -0400
X-MC-Unique: 1ijALHDpMGCPik4GoNWDzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FB00193F598;
 Tue,  6 Jul 2021 11:24:00 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-253.ams2.redhat.com [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE56D60CC9;
 Tue,  6 Jul 2021 11:23:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 6/6] block: Make blockdev-reopen stable API
Date: Tue,  6 Jul 2021 13:23:40 +0200
Message-Id: <20210706112340.223334-7-kwolf@redhat.com>
In-Reply-To: <20210706112340.223334-1-kwolf@redhat.com>
References: <20210706112340.223334-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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

This patch drops the 'x-' prefix from x-blockdev-reopen.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json                                |  6 +++---
 blockdev.c                                          |  2 +-
 tests/qemu-iotests/155                              |  2 +-
 tests/qemu-iotests/165                              |  2 +-
 tests/qemu-iotests/245                              | 10 +++++-----
 tests/qemu-iotests/248                              |  2 +-
 tests/qemu-iotests/248.out                          |  2 +-
 tests/qemu-iotests/296                              |  2 +-
 tests/qemu-iotests/298                              |  2 +-
 tests/qemu-iotests/tests/remove-bitmap-from-backing |  4 ++--
 10 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 052520331e..2eb399f0d4 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4219,7 +4219,7 @@
 { 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true }
 
 ##
-# @x-blockdev-reopen:
+# @blockdev-reopen:
 #
 # Reopens one or more block devices using the given set of options.
 # Any option not specified will be reset to its default value regardless
@@ -4257,9 +4257,9 @@
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
index 1e8c946828..7639f2108e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3560,7 +3560,7 @@ fail:
     visit_free(v);
 }
 
-void qmp_x_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
+void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
 {
     BlockReopenQueue *queue = NULL;
     GSList *drained = NULL;
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
index 6eff352099..28a116a6aa 100755
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
diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing b/tests/qemu-iotests/tests/remove-bitmap-from-backing
index 0b07f7e836..8d48fc0f3c 100755
--- a/tests/qemu-iotests/tests/remove-bitmap-from-backing
+++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing
@@ -53,7 +53,7 @@ new_base_opts = {
 }
 
 # Don't want to bother with filtering qmp_log for reopen command
-result = vm.qmp('x-blockdev-reopen', **new_base_opts)
+result = vm.qmp('blockdev-reopen', **new_base_opts)
 if result != {'return': {}}:
     log('Failed to reopen: ' + str(result))
 
@@ -61,7 +61,7 @@ log('Remove persistent bitmap from base node reopened to RW:')
 vm.qmp_log('block-dirty-bitmap-remove', node='base', name='bitmap0')
 
 new_base_opts['options'][0]['read-only'] = True
-result = vm.qmp('x-blockdev-reopen', **new_base_opts)
+result = vm.qmp('blockdev-reopen', **new_base_opts)
 if result != {'return': {}}:
     log('Failed to reopen: ' + str(result))
 
-- 
2.31.1


