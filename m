Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F071832EECC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:28:47 +0100 (CET)
Received: from localhost ([::1]:41128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICNi-0006Xp-TM
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lICEu-0001Np-Ur
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:19:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lICEr-0003rR-BW
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614957576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LhMQZaqZVqOri3ge1/W4AbN/h5rdQ1gYPD2tuVbPkQ=;
 b=a+5/gJRiMVgl7GDQwYIqWiwFI6dNMVZlC3O0bZe8f0XaiIIi7j4GflfERI9iAcyb0ccEfy
 /d2+CecSgFd/hq0WXo1XzrLithJs4QUcS3i/tzA3ddCyqoHj09dmJ2UERTimgYMd/icJ9b
 ChUXQ4/zyj1LRoAyIQDElrYKBRluK+c=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-g43Qj__ANPWFQfQ6g1aesQ-1; Fri, 05 Mar 2021 10:19:34 -0500
X-MC-Unique: g43Qj__ANPWFQfQ6g1aesQ-1
Received: by mail-oo1-f72.google.com with SMTP id h10so1327041ooj.11
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6LhMQZaqZVqOri3ge1/W4AbN/h5rdQ1gYPD2tuVbPkQ=;
 b=QsY4s4ZHng2SF2cXXB7fMkWxHZBfH3Fu9EiM3OZV8a+DNwwOHWSjoOZysenpD1zftG
 y6DZIAklHGCBESXtTl7jVEyw+PmZH6mfQBvuNSWRDWp1DV4kpqmB361oTQ2G8PhTKbcH
 6PREZTPnT4+tdvGvfPKNWOly21+vOcABFEJUKWj9GtLW5huGg9AeXBJ2gK9BQfGnqnWl
 AO9x5wEDuLayLnNIeOo9aVCMCOaT4kosIuh3aUWWP/IcXWzTFEN7qa24K84KUyIKxNSP
 Fh8y8jULnZ1LOKz6//LODzFHUMclaUNhpX/THDJcDTVfhFn8+OLLk3+pp2sVviEYyxSE
 VCpw==
X-Gm-Message-State: AOAM531y4964Qxj4poopxUqzf6FFuSWNs/nS50Nnq9aMV2p2rEWtGbnI
 Cs6VtlgbEJykpezmXqC79KX/e6l5hJw+pzh7EcrDCiXlS0RJJNkKb5wYiqbtvfdtSCaQcuhJZYM
 xGf2Jld+3mwXTfuc=
X-Received: by 2002:a9d:344a:: with SMTP id v68mr8271139otb.214.1614957573219; 
 Fri, 05 Mar 2021 07:19:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtR0Wc2oW/KOCrGkB3oue8bc1rrG6vIWXm9J0UI7jFKFTLhh44HYTx6KY6MAv76EoKCVmlHA==
X-Received: by 2002:a9d:344a:: with SMTP id v68mr8271121otb.214.1614957572928; 
 Fri, 05 Mar 2021 07:19:32 -0800 (PST)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id y34sm651085ota.12.2021.03.05.07.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:19:32 -0800 (PST)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/2] block: Clarify error messages pertaining to 'node-name'
Date: Fri,  5 Mar 2021 09:19:28 -0600
Message-Id: <20210305151929.1947331-2-ckuehl@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210305151929.1947331-1-ckuehl@redhat.com>
References: <20210305151929.1947331-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some error messages contain ambiguous representations of the 'node-name'
parameter. This can be particularly confusing when exchanging QMP
messages (C = client, S = server):

C: {"execute": "block_resize", "arguments": { "device": "my_file", "size": 26843545600 }}
S: {"error": {"class": "GenericError", "desc": "Cannot find device=my_file nor node_name="}}
                                                                               ^^^^^^^^^

This error message suggests one could send a message with a key called
'node_name':

C: {"execute": "block_resize", "arguments": { "node_name": "my_file", "size": 26843545600 }}
                                               ^^^^^^^^^

but using the underscore is actually incorrect, the parameter should be
'node-name':

S: {"error": {"class": "GenericError", "desc": "Parameter 'node_name' is unexpected"}}

This behavior was uncovered in bz1651437, but I ended up going down a
rabbit hole looking for other areas where this miscommunication might
occur and changing those accordingly as well.

Fixes: https://bugzilla.redhat.com/1651437
Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
 block.c                       | 8 ++++----
 tests/qemu-iotests/030        | 4 ++--
 tests/qemu-iotests/040        | 4 ++--
 tests/qemu-iotests/051.pc.out | 6 +++---
 tests/qemu-iotests/081.out    | 2 +-
 tests/qemu-iotests/085.out    | 6 +++---
 tests/qemu-iotests/087.out    | 2 +-
 tests/qemu-iotests/206.out    | 2 +-
 tests/qemu-iotests/210.out    | 2 +-
 tests/qemu-iotests/211.out    | 2 +-
 tests/qemu-iotests/212.out    | 2 +-
 tests/qemu-iotests/213.out    | 2 +-
 tests/qemu-iotests/223.out    | 4 ++--
 tests/qemu-iotests/237.out    | 2 +-
 tests/qemu-iotests/245        | 4 ++--
 tests/qemu-iotests/249.out    | 2 +-
 tests/qemu-iotests/300        | 4 ++--
 17 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/block.c b/block.c
index a1f3cecd75..2daff6d29a 100644
--- a/block.c
+++ b/block.c
@@ -1440,7 +1440,7 @@ static void bdrv_assign_node_name(BlockDriverState *bs,
          * Check for empty string or invalid characters, but not if it is
          * generated (generated names use characters not available to the user)
          */
-        error_setg(errp, "Invalid node name");
+        error_setg(errp, "Invalid node-name: '%s'", node_name);
         return;
     }
 
@@ -1453,7 +1453,7 @@ static void bdrv_assign_node_name(BlockDriverState *bs,
 
     /* takes care of avoiding duplicates node names */
     if (bdrv_find_node(node_name)) {
-        error_setg(errp, "Duplicate node name");
+        error_setg(errp, "Duplicate nodes with node-name='%s'", node_name);
         goto out;
     }
 
@@ -5432,7 +5432,7 @@ BlockDriverState *bdrv_lookup_bs(const char *device,
         }
     }
 
-    error_setg(errp, "Cannot find device=%s nor node_name=%s",
+    error_setg(errp, "Cannot find device=\'%s\' nor node-name=\'%s\'",
                      device ? device : "",
                      node_name ? node_name : "");
     return NULL;
@@ -6752,7 +6752,7 @@ BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
     AioContext *aio_context;
 
     if (!to_replace_bs) {
-        error_setg(errp, "Node name '%s' not found", node_name);
+        error_setg(errp, "Failed to find node with node-name='%s'", node_name);
         return NULL;
     }
 
diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 12aa9ed37e..5fb65b4bef 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -153,7 +153,7 @@ class TestSingleDrive(iotests.QMPTestCase):
     def test_device_not_found(self):
         result = self.vm.qmp('block-stream', device='nonexistent')
         self.assert_qmp(result, 'error/desc',
-            'Cannot find device=nonexistent nor node_name=nonexistent')
+            'Cannot find device=\'nonexistent\' nor node-name=\'nonexistent\'')
 
     def test_job_id_missing(self):
         result = self.vm.qmp('block-stream', device='mid')
@@ -507,7 +507,7 @@ class TestParallelOps(iotests.QMPTestCase):
         # Error: the base node does not exist
         result = self.vm.qmp('block-stream', device='node4', base_node='none', job_id='stream')
         self.assert_qmp(result, 'error/desc',
-            'Cannot find device= nor node_name=none')
+            'Cannot find device=\'\' nor node-name=\'none\'')
 
         # Error: the base node is not a backing file of the top node
         result = self.vm.qmp('block-stream', device='node4', base_node='node6', job_id='stream')
diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 7ebc9ed825..336ff7c4f2 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -175,13 +175,13 @@ class TestSingleDrive(ImageCommitTestCase):
         self.assert_no_active_block_jobs()
         result = self.vm.qmp('block-commit', device='drive0', top_node='badfile', base_node='base')
         self.assert_qmp(result, 'error/class', 'GenericError')
-        self.assert_qmp(result, 'error/desc', "Cannot find device= nor node_name=badfile")
+        self.assert_qmp(result, 'error/desc', "Cannot find device='' nor node-name='badfile'")
 
     def test_base_node_invalid(self):
         self.assert_no_active_block_jobs()
         result = self.vm.qmp('block-commit', device='drive0', top_node='mid', base_node='badfile')
         self.assert_qmp(result, 'error/class', 'GenericError')
-        self.assert_qmp(result, 'error/desc', "Cannot find device= nor node_name=badfile")
+        self.assert_qmp(result, 'error/desc', "Cannot find device='' nor node-name='badfile'")
 
     def test_top_path_and_node(self):
         self.assert_no_active_block_jobs()
diff --git a/tests/qemu-iotests/051.pc.out b/tests/qemu-iotests/051.pc.out
index f707471fb0..f570610f64 100644
--- a/tests/qemu-iotests/051.pc.out
+++ b/tests/qemu-iotests/051.pc.out
@@ -61,13 +61,13 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) quit
 
 Testing: -drive file=TEST_DIR/t.qcow2,node-name=123foo
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid node name
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid node-name: '123foo'
 
 Testing: -drive file=TEST_DIR/t.qcow2,node-name=_foo
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid node name
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid node-name: '_foo'
 
 Testing: -drive file=TEST_DIR/t.qcow2,node-name=foo#12
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node name
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node-name: 'foo#12'
 
 
 === Device without drive ===
diff --git a/tests/qemu-iotests/081.out b/tests/qemu-iotests/081.out
index 1974262fac..615c083549 100644
--- a/tests/qemu-iotests/081.out
+++ b/tests/qemu-iotests/081.out
@@ -140,7 +140,7 @@ Testing:
 QMP_VERSION
 {"return": {}}
 {"error": {"class": "GenericError", "desc": "blkverify=on can only be set if there are exactly two files and vote-threshold is 2"}}
-{"error": {"class": "GenericError", "desc": "Cannot find device=drive0-quorum nor node_name=drive0-quorum"}}
+{"error": {"class": "GenericError", "desc": "Cannot find device='drive0-quorum' nor node-name='drive0-quorum'"}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 
diff --git a/tests/qemu-iotests/085.out b/tests/qemu-iotests/085.out
index 32a193f2c2..1d4c565b6d 100644
--- a/tests/qemu-iotests/085.out
+++ b/tests/qemu-iotests/085.out
@@ -24,7 +24,7 @@ Formatting 'TEST_DIR/1-snapshot-v0.qcow2', fmt=qcow2 cluster_size=65536 extended
 { 'execute': 'blockdev-snapshot-sync',
                          'arguments': { 'snapshot-file':'TEST_DIR/1-snapshot-v0.IMGFMT',
                                      'format': 'IMGFMT' } }
-{"error": {"class": "GenericError", "desc": "Cannot find device= nor node_name="}}
+{"error": {"class": "GenericError", "desc": "Cannot find device='' nor node-name=''"}}
 
 === Invalid command - missing snapshot-file ===
 
@@ -222,10 +222,10 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/
 { 'execute': 'blockdev-snapshot',
                       'arguments': { 'node': 'virtio0',
                                      'overlay':'snap_14' } }
-{"error": {"class": "GenericError", "desc": "Cannot find device=snap_14 nor node_name=snap_14"}}
+{"error": {"class": "GenericError", "desc": "Cannot find device='snap_14' nor node-name='snap_14'"}}
 { 'execute': 'blockdev-snapshot',
                      'arguments': { 'node':'nodevice',
                                     'overlay':'snap_13' }
                    }
-{"error": {"class": "GenericError", "desc": "Cannot find device=nodevice nor node_name=nodevice"}}
+{"error": {"class": "GenericError", "desc": "Cannot find device='nodevice' nor node-name='nodevice'"}}
 *** done
diff --git a/tests/qemu-iotests/087.out b/tests/qemu-iotests/087.out
index b61ba638af..e1c23a6983 100644
--- a/tests/qemu-iotests/087.out
+++ b/tests/qemu-iotests/087.out
@@ -17,7 +17,7 @@ Testing: -drive driver=IMGFMT,id=disk,node-name=test-node,file=TEST_DIR/t.IMGFMT
 QMP_VERSION
 {"return": {}}
 {"error": {"class": "GenericError", "desc": "node-name=disk is conflicting with a device id"}}
-{"error": {"class": "GenericError", "desc": "Duplicate node name"}}
+{"error": {"class": "GenericError", "desc": "Duplicate nodes with node-name='test-node'"}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 
diff --git a/tests/qemu-iotests/206.out b/tests/qemu-iotests/206.out
index 5dd589d14e..b68c443867 100644
--- a/tests/qemu-iotests/206.out
+++ b/tests/qemu-iotests/206.out
@@ -155,7 +155,7 @@ Format specific information:
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "qcow2", "file": "this doesn't exist", "size": 33554432}}}
 {"return": {}}
-Job failed: Cannot find device=this doesn't exist nor node_name=this doesn't exist
+Job failed: Cannot find device='this doesn't exist' nor node-name='this doesn't exist'
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
 
diff --git a/tests/qemu-iotests/210.out b/tests/qemu-iotests/210.out
index 2e9fc596eb..55c0844370 100644
--- a/tests/qemu-iotests/210.out
+++ b/tests/qemu-iotests/210.out
@@ -108,7 +108,7 @@ Format specific information:
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "luks", "file": "this doesn't exist", "size": 67108864}}}
 {"return": {}}
-Job failed: Cannot find device=this doesn't exist nor node_name=this doesn't exist
+Job failed: Cannot find device='this doesn't exist' nor node-name='this doesn't exist'
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
 
diff --git a/tests/qemu-iotests/211.out b/tests/qemu-iotests/211.out
index b83384deea..3bc092a8a8 100644
--- a/tests/qemu-iotests/211.out
+++ b/tests/qemu-iotests/211.out
@@ -62,7 +62,7 @@ cluster_size: 1048576
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "vdi", "file": "this doesn't exist", "size": 33554432}}}
 {"return": {}}
-Job failed: Cannot find device=this doesn't exist nor node_name=this doesn't exist
+Job failed: Cannot find device='this doesn't exist' nor node-name='this doesn't exist'
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
 
diff --git a/tests/qemu-iotests/212.out b/tests/qemu-iotests/212.out
index 1538d679be..8102033488 100644
--- a/tests/qemu-iotests/212.out
+++ b/tests/qemu-iotests/212.out
@@ -52,7 +52,7 @@ virtual size: 32 MiB (33554432 bytes)
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "parallels", "file": "this doesn't exist", "size": 33554432}}}
 {"return": {}}
-Job failed: Cannot find device=this doesn't exist nor node_name=this doesn't exist
+Job failed: Cannot find device='this doesn't exist' nor node-name='this doesn't exist'
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
 
diff --git a/tests/qemu-iotests/213.out b/tests/qemu-iotests/213.out
index be4ae85180..3cdce4d790 100644
--- a/tests/qemu-iotests/213.out
+++ b/tests/qemu-iotests/213.out
@@ -55,7 +55,7 @@ cluster_size: 268435456
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "vhdx", "file": "this doesn't exist", "size": 33554432}}}
 {"return": {}}
-Job failed: Cannot find device=this doesn't exist nor node_name=this doesn't exist
+Job failed: Cannot find device='this doesn't exist' nor node-name='this doesn't exist'
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
 
diff --git a/tests/qemu-iotests/223.out b/tests/qemu-iotests/223.out
index bbc85289e3..083b62d053 100644
--- a/tests/qemu-iotests/223.out
+++ b/tests/qemu-iotests/223.out
@@ -53,7 +53,7 @@ exports available: 0
 {"return": {}}
 {"execute":"nbd-server-add",
   "arguments":{"device":"nosuch"}}
-{"error": {"class": "GenericError", "desc": "Cannot find device=nosuch nor node_name=nosuch"}}
+{"error": {"class": "GenericError", "desc": "Cannot find device='nosuch' nor node-name='nosuch'"}}
 {"execute":"nbd-server-add",
   "arguments":{"device":"n"}}
 {"error": {"class": "GenericError", "desc": "Block export id 'n' is already in use"}}
@@ -154,7 +154,7 @@ exports available: 0
 {"return": {}}
 {"execute":"nbd-server-add",
   "arguments":{"device":"nosuch"}}
-{"error": {"class": "GenericError", "desc": "Cannot find device=nosuch nor node_name=nosuch"}}
+{"error": {"class": "GenericError", "desc": "Cannot find device='nosuch' nor node-name='nosuch'"}}
 {"execute":"nbd-server-add",
   "arguments":{"device":"n"}}
 {"error": {"class": "GenericError", "desc": "Block export id 'n' is already in use"}}
diff --git a/tests/qemu-iotests/237.out b/tests/qemu-iotests/237.out
index a8c800bfad..aa94986803 100644
--- a/tests/qemu-iotests/237.out
+++ b/tests/qemu-iotests/237.out
@@ -85,7 +85,7 @@ Format specific information:
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "vmdk", "file": "this doesn't exist", "size": 33554432}}}
 {"return": {}}
-Job failed: Cannot find device=this doesn't exist nor node_name=this doesn't exist
+Job failed: Cannot find device='this doesn't exist' nor node-name='this doesn't exist'
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
 
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index cfdeb902be..f8eba7719a 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -187,8 +187,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'backing': backing_node_name})
 
         # We can't use a non-existing or empty (non-NULL) node as the backing image
-        self.reopen(opts, {'backing': 'not-found'}, "Cannot find device= nor node_name=not-found")
-        self.reopen(opts, {'backing': ''}, "Cannot find device= nor node_name=")
+        self.reopen(opts, {'backing': 'not-found'}, "Cannot find device=\'\' nor node-name=\'not-found\'")
+        self.reopen(opts, {'backing': ''}, "Cannot find device=\'\' nor node-name=\'\'")
 
         # We can reopen the image just fine if we specify the backing options
         opts['backing'] = {'driver': iotests.imgfmt,
diff --git a/tests/qemu-iotests/249.out b/tests/qemu-iotests/249.out
index 92ec81db03..d2bf9be85e 100644
--- a/tests/qemu-iotests/249.out
+++ b/tests/qemu-iotests/249.out
@@ -18,7 +18,7 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.
                      'filter-node-name': '1234'}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
-{"error": {"class": "GenericError", "desc": "Invalid node name"}}
+{"error": {"class": "GenericError", "desc": "Invalid node-name: '1234'"}}
 
 === Send a write command to a drive opened in read-only mode (2)
 
diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index 63036f6a6e..0f278731ce 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -189,8 +189,8 @@ class TestAliasMigration(TestDirtyBitmapMigration):
         # Check for error message on the destination
         if self.src_node_name != self.dst_node_name:
             self.verify_dest_error(f"Cannot find "
-                                   f"device={self.src_node_name} nor "
-                                   f"node_name={self.src_node_name}")
+                                   f"device='{self.src_node_name}' nor "
+                                   f"node-name='{self.src_node_name}'")
         else:
             self.verify_dest_error(None)
 
-- 
2.29.2


