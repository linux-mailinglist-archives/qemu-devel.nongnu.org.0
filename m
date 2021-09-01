Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531193FDF20
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:56:23 +0200 (CEST)
Received: from localhost ([::1]:37212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSb7-0005YS-0i
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLS0K-0007TQ-Fy
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLS0I-0004ao-IC
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jf1370es0DwsH0KjOGR5fulQcHrtKm7HwKVYC8v4B0U=;
 b=QB8DjfRfYuAnf7o1+epezjFJxFgjo2F4dAA0e7w0Q8J4L2bcwBYY0mROsqbc6uL80HHyU0
 x1uXn2ptR5osOB35tVDohPL9tdqs2X4+8iJsRAR08X5U2635hyvT80nU00gcSVwnRNyYbD
 rqoZMBpYDlqMYL6n66JwX7Kcw2gJa/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-PSnU6LBqPL6EGiPmFCOhaA-1; Wed, 01 Sep 2021 11:18:16 -0400
X-MC-Unique: PSnU6LBqPL6EGiPmFCOhaA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88D08107ACE3;
 Wed,  1 Sep 2021 15:18:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E156660C9F;
 Wed,  1 Sep 2021 15:18:14 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 53/56] iotests/image-fleecing: add test-case for
 copy-before-write filter
Date: Wed,  1 Sep 2021 17:16:16 +0200
Message-Id: <20210901151619.689075-54-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

New fleecing method becomes available: copy-before-write filter.

Actually we don't need backup job to setup image fleecing. Add test
for new recommended way of image fleecing.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210824083856.17408-34-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 50 +++++++++-----
 tests/qemu-iotests/tests/image-fleecing.out | 72 +++++++++++++++++++++
 2 files changed, 107 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index e210c00d28..f6318492c6 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -48,7 +48,7 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
+def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Setting up images ---')
     log('')
 
@@ -67,6 +67,7 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
 
     src_node = 'source'
     tmp_node = 'temp'
+    qom_path = '/machine/peripheral/sda'
     vm.add_blockdev(f'driver={iotests.imgfmt},file.driver=file,'
                     f'file.filename={base_img_path},node-name={src_node}')
     vm.add_device('virtio-scsi')
@@ -90,12 +91,22 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
         'backing': src_node,
     }))
 
-    # Establish COW from source to fleecing node
-    log(vm.qmp('blockdev-backup',
-               job_id='fleecing',
-               device=src_node,
-               target=tmp_node,
-               sync='none'))
+    # Establish CBW from source to fleecing node
+    if use_cbw:
+        log(vm.qmp('blockdev-add', {
+            'driver': 'copy-before-write',
+            'node-name': 'fl-cbw',
+            'file': src_node,
+            'target': tmp_node
+        }))
+
+        log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
+    else:
+        log(vm.qmp('blockdev-backup',
+                   job_id='fleecing',
+                   device=src_node,
+                   target=tmp_node,
+                   sync='none'))
 
     log('')
     log('--- Setting up NBD Export ---')
@@ -124,7 +135,7 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
     for p in overwrite:
         cmd = 'write -P%s %s %s' % p
         log(cmd)
-        log(vm.hmp_qemu_io('/machine/peripheral/sda', cmd, qdev=True))
+        log(vm.hmp_qemu_io(qom_path, cmd, qdev=True))
 
     log('')
     log('--- Verifying Data ---')
@@ -139,10 +150,15 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Cleanup ---')
     log('')
 
-    log(vm.qmp('block-job-cancel', device='fleecing'))
-    e = vm.event_wait('BLOCK_JOB_CANCELLED')
-    assert e is not None
-    log(e, filters=[iotests.filter_qmp_event])
+    if use_cbw:
+        log(vm.qmp('qom-set', path=qom_path, property='drive', value=src_node))
+        log(vm.qmp('blockdev-del', node_name='fl-cbw'))
+    else:
+        log(vm.qmp('block-job-cancel', device='fleecing'))
+        e = vm.event_wait('BLOCK_JOB_CANCELLED')
+        assert e is not None
+        log(e, filters=[iotests.filter_qmp_event])
+
     log(vm.qmp('nbd-server-stop'))
     log(vm.qmp('blockdev-del', node_name=tmp_node))
     vm.shutdown()
@@ -160,13 +176,17 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('Done')
 
 
-def test():
+def test(use_cbw):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
          iotests.FilePath('nbd.sock',
                           base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
-        do_test(base_img_path, fleece_img_path, nbd_sock_path, vm)
+        do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm)
+
 
+log('=== Test backup(sync=none) based fleecing ===\n')
+test(False)
 
-test()
+log('=== Test filter based fleecing ===\n')
+test(True)
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index 314a1b54e9..e96d122a8b 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -1,3 +1,5 @@
+=== Test backup(sync=none) based fleecing ===
+
 --- Setting up images ---
 
 Done
@@ -65,3 +67,73 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
+=== Test filter based fleecing ===
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
+
+--- Setting up NBD Export ---
+
+{"return": {}}
+{"return": {}}
+
+--- Sanity Check ---
+
+read -P0x5d 0 64k
+read -P0xd5 1M 64k
+read -P0xdc 32M 64k
+read -P0xcd 0x3ff0000 64k
+read -P0 0x00f8000 32k
+read -P0 0x2010000 32k
+read -P0 0x3fe0000 64k
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
2.31.1


