Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFBA4CFE72
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:27:24 +0100 (CET)
Received: from localhost ([::1]:50468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCSR-0005wM-BO
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:27:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAjj-0005Vw-HF
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAjh-0008Nb-Cp
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKbBBQ/gi31ELcci6PYbwXxoy5ZOnGDrsbKJrzUgJxQ=;
 b=GwRc+Zno9IoqNfaGZBvXJtFgw0XspR1DPdDlzUYRjaetTyAIYqZt0a7PdRlj8kWv+UWVx0
 54TykzzWV6lX21v744MixGCPkyCWFBK/R1yuY/CHs0kzT23ZmuBQz1zqYxQefaXY2pr2Ih
 /Ji40kkdXk0jYMigki0Z3EH8X54msL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-cGceCG60NDCPqP8LmK05dQ-1; Mon, 07 Mar 2022 05:37:01 -0500
X-MC-Unique: cGceCG60NDCPqP8LmK05dQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6DF71006AAB;
 Mon,  7 Mar 2022 10:37:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40795752D1;
 Mon,  7 Mar 2022 10:37:00 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 23/23] iotests/image-fleecing: test push backup with fleecing
Date: Mon,  7 Mar 2022 11:35:49 +0100
Message-Id: <20220307103549.808809-24-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20220303194349.2304213-17-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 125 +++++++++++++++-----
 tests/qemu-iotests/tests/image-fleecing.out |  63 ++++++++++
 2 files changed, 156 insertions(+), 32 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index c9ffa6647e..c56278639c 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -51,9 +51,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
-            fleece_img_path, nbd_sock_path, vm,
+def do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
+            fleece_img_path, nbd_sock_path=None,
+            target_img_path=None,
             bitmap=False):
+    push_backup = target_img_path is not None
+    assert (nbd_sock_path is not None) != push_backup
+    if push_backup:
+        assert use_cbw
+
     log('--- Setting up images ---')
     log('')
 
@@ -67,6 +73,9 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     else:
         assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
 
+    if push_backup:
+        assert qemu_img('create', '-f', 'qcow2', target_img_path, '64M') == 0
+
     for p in patterns:
         qemu_io('-f', iotests.imgfmt,
                 '-c', 'write -P%s %s %s' % p, base_img_path)
@@ -141,28 +150,45 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
 
     export_node = 'fl-access' if use_snapshot_access_filter else tmp_node
 
-    log('')
-    log('--- Setting up NBD Export ---')
-    log('')
+    if push_backup:
+        log('')
+        log('--- Starting actual backup ---')
+        log('')
 
-    nbd_uri = 'nbd+unix:///%s?socket=%s' % (export_node, nbd_sock_path)
-    log(vm.qmp('nbd-server-start',
-               {'addr': {'type': 'unix',
-                         'data': {'path': nbd_sock_path}}}))
+        log(vm.qmp('blockdev-add', **{
+            'driver': iotests.imgfmt,
+            'node-name': 'target',
+            'file': {
+                'driver': 'file',
+                'filename': target_img_path
+            }
+        }))
+        log(vm.qmp('blockdev-backup', device=export_node,
+                   sync='full', target='target',
+                   job_id='push-backup', speed=1))
+    else:
+        log('')
+        log('--- Setting up NBD Export ---')
+        log('')
 
-    log(vm.qmp('nbd-server-add', device=export_node))
+        nbd_uri = 'nbd+unix:///%s?socket=%s' % (export_node, nbd_sock_path)
+        log(vm.qmp('nbd-server-start',
+                   {'addr': { 'type': 'unix',
+                              'data': { 'path': nbd_sock_path } } }))
 
-    log('')
-    log('--- Sanity Check ---')
-    log('')
+        log(vm.qmp('nbd-server-add', device=export_node))
 
-    for p in patterns + zeroes:
-        cmd = 'read -P%s %s %s' % p
-        log(cmd)
-        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd,
-                                           nbd_uri)
-        if ret != 0:
-            print(out)
+        log('')
+        log('--- Sanity Check ---')
+        log('')
+
+        for p in patterns + zeroes:
+            cmd = 'read -P%s %s %s' % p
+            log(cmd)
+            out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd,
+                                               nbd_uri)
+            if ret != 0:
+                print(out)
 
     log('')
     log('--- Testing COW ---')
@@ -173,6 +199,23 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
         log(cmd)
         log(vm.hmp_qemu_io(qom_path, cmd, qdev=True))
 
+    if push_backup:
+        # Check that previous operations were done during backup, not after
+        # If backup is already finished, it's possible that it was finished
+        # even before hmp qemu_io write, and we didn't actually test
+        # copy-before-write operation. This should not happen, as we use
+        # speed=1. But worth checking.
+        result = vm.qmp('query-block-jobs')
+        assert len(result['return']) == 1
+
+        result = vm.qmp('block-job-set-speed', device='push-backup', speed=0)
+        assert result == {'return': {}}
+
+        log(vm.event_wait(name='BLOCK_JOB_COMPLETED',
+                          match={'data': {'device': 'push-backup'}}),
+            filters=[iotests.filter_qmp_event])
+        log(vm.qmp('blockdev-del', node_name='target'))
+
     log('')
     log('--- Verifying Data ---')
     log('')
@@ -180,8 +223,12 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd,
-                                           nbd_uri)
+        args = ['-r', '-c', cmd]
+        if push_backup:
+            args += [target_img_path]
+        else:
+            args += ['-f', 'raw', nbd_uri]
+        out, ret = qemu_io_pipe_and_status(*args)
         if ret != 0:
             print(out)
 
@@ -189,7 +236,8 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     log('--- Cleanup ---')
     log('')
 
-    log(vm.qmp('nbd-server-stop'))
+    if not push_backup:
+        log(vm.qmp('nbd-server-stop'))
 
     if use_cbw:
         if use_snapshot_access_filter:
@@ -218,24 +266,37 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     log('Done')
 
 
-def test(use_cbw, use_snapshot_access_filter, bitmap=False):
+def test(use_cbw, use_snapshot_access_filter,
+         nbd_sock_path=None, target_img_path=None, bitmap=False):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
-         iotests.FilePath('nbd.sock',
-                          base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
-        do_test(use_cbw, use_snapshot_access_filter, base_img_path,
-                fleece_img_path, nbd_sock_path, vm, bitmap=bitmap)
+        do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
+                fleece_img_path, nbd_sock_path, target_img_path,
+                bitmap=bitmap)
+
+def test_pull(use_cbw, use_snapshot_access_filter, bitmap=False):
+    with iotests.FilePath('nbd.sock',
+                          base_dir=iotests.sock_dir) as nbd_sock_path:
+        test(use_cbw, use_snapshot_access_filter, nbd_sock_path, None,
+             bitmap=bitmap)
+
+def test_push():
+    with iotests.FilePath('target.img') as target_img_path:
+        test(True, True, None, target_img_path)
 
 
 log('=== Test backup(sync=none) based fleecing ===\n')
-test(False, False)
+test_pull(False, False)
 
 log('=== Test cbw-filter based fleecing ===\n')
-test(True, False)
+test_pull(True, False)
 
 log('=== Test fleecing-format based fleecing ===\n')
-test(True, True)
+test_pull(True, True)
 
 log('=== Test fleecing-format based fleecing with bitmap ===\n')
-test(True, True, bitmap=True)
+test_pull(True, True, bitmap=True)
+
+log('=== Test push backup with fleecing ===\n')
+test_push()
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index 62e1c1fe42..acfc89ff0e 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -293,3 +293,66 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
+=== Test push backup with fleecing ===
+
+--- Setting up images ---
+
+Done
+
+--- Launching VM ---
+
+Done
+
+--- Setting up Fleecing Graph ---
+
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+
+--- Starting actual backup ---
+
+{"return": {}}
+{"return": {}}
+
+--- Testing COW ---
+
+write -P0xab 0 64k
+{"return": ""}
+write -P0xad 0x00f8000 64k
+{"return": ""}
+write -P0x1d 0x2008000 64k
+{"return": ""}
+write -P0xea 0x3fe0000 64k
+{"return": ""}
+{"data": {"device": "push-backup", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"return": {}}
+
+--- Verifying Data ---
+
+read -P0x5d 0 64k
+read -P0xd5 1M 64k
+read -P0xdc 32M 64k
+read -P0xcd 0x3ff0000 64k
+read -P0 0x00f8000 32k
+read -P0 0x2010000 32k
+read -P0 0x3fe0000 64k
+
+--- Cleanup ---
+
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+
+--- Confirming writes ---
+
+read -P0xab 0 64k
+read -P0xad 0x00f8000 64k
+read -P0x1d 0x2008000 64k
+read -P0xea 0x3fe0000 64k
+read -P0xd5 0x108000 32k
+read -P0xdc 32M 32k
+read -P0xcd 0x3ff0000 64k
+
+Done
-- 
2.34.1


