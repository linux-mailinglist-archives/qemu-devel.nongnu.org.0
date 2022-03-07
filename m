Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57CF4CFCAC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:24:20 +0100 (CET)
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBTP-0001tM-QP
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:24:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAjh-0005PY-CG
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:37:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAjf-0008NG-Eb
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xs/PYmICPRMA7Dp86C7N+HIjkOT7IzitTOHbJhQWMKE=;
 b=gvm8NFJfJzjZONJxy2JFaB9nQpJ2Je18rO13M0xEu8glUQaZzdpNYbH8PMpOjYwE5L7Sww
 B1mvYsC9JRlQIVbxaZVQGrP0TIvMXMhNIS19Zr4GbxuZrm4hVAZwYm0bE7tObQZBJ7EfYI
 e0FabjjqV7wI+2gIPDg1uIJ9SbS0C9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-Z1hUwDGFP3-TyHHFp7ZlKg-1; Mon, 07 Mar 2022 05:36:59 -0500
X-MC-Unique: Z1hUwDGFP3-TyHHFp7ZlKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 638821091DA5;
 Mon,  7 Mar 2022 10:36:58 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5388783067;
 Mon,  7 Mar 2022 10:36:54 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 22/23] iotests/image-fleecing: add test case with bitmap
Date: Mon,  7 Mar 2022 11:35:48 +0100
Message-Id: <20220307103549.808809-23-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Note that reads zero areas (not dirty in the bitmap) fails, that's
correct.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20220303194349.2304213-16-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 38 +++++++---
 tests/qemu-iotests/tests/image-fleecing.out | 84 +++++++++++++++++++++
 2 files changed, 113 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 909fc0a7ad..c9ffa6647e 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -23,12 +23,14 @@
 # Creator/Owner: John Snow <jsnow@redhat.com>
 
 import iotests
-from iotests import log, qemu_img, qemu_io, qemu_io_silent
+from iotests import log, qemu_img, qemu_io, qemu_io_silent, \
+    qemu_io_pipe_and_status
 
 iotests.script_initialize(
-    supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk', 'vhdx', 'raw'],
+    supported_fmts=['qcow2'],
     supported_platforms=['linux'],
     required_fmts=['copy-before-write'],
+    unsupported_imgopts=['compat']
 )
 
 patterns = [('0x5d', '0',         '64k'),
@@ -50,11 +52,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
 def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
-            fleece_img_path, nbd_sock_path, vm):
+            fleece_img_path, nbd_sock_path, vm,
+            bitmap=False):
     log('--- Setting up images ---')
     log('')
 
     assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
+    if bitmap:
+        assert qemu_img('bitmap', '--add', base_img_path, 'bitmap0') == 0
+
     if use_snapshot_access_filter:
         assert use_cbw
         assert qemu_img('create', '-f', 'raw', fleece_img_path, '64M') == 0
@@ -106,12 +112,17 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
 
     # Establish CBW from source to fleecing node
     if use_cbw:
-        log(vm.qmp('blockdev-add', {
+        fl_cbw = {
             'driver': 'copy-before-write',
             'node-name': 'fl-cbw',
             'file': src_node,
             'target': tmp_node
-        }))
+        }
+
+        if bitmap:
+            fl_cbw['bitmap'] = {'node': src_node, 'name': 'bitmap0'}
+
+        log(vm.qmp('blockdev-add', fl_cbw))
 
         log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
 
@@ -148,7 +159,10 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd,
+                                           nbd_uri)
+        if ret != 0:
+            print(out)
 
     log('')
     log('--- Testing COW ---')
@@ -166,7 +180,10 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd,
+                                           nbd_uri)
+        if ret != 0:
+            print(out)
 
     log('')
     log('--- Cleanup ---')
@@ -201,14 +218,14 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     log('Done')
 
 
-def test(use_cbw, use_snapshot_access_filter):
+def test(use_cbw, use_snapshot_access_filter, bitmap=False):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
          iotests.FilePath('nbd.sock',
                           base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
         do_test(use_cbw, use_snapshot_access_filter, base_img_path,
-                fleece_img_path, nbd_sock_path, vm)
+                fleece_img_path, nbd_sock_path, vm, bitmap=bitmap)
 
 
 log('=== Test backup(sync=none) based fleecing ===\n')
@@ -219,3 +236,6 @@ test(True, False)
 
 log('=== Test fleecing-format based fleecing ===\n')
 test(True, True)
+
+log('=== Test fleecing-format based fleecing with bitmap ===\n')
+test(True, True, bitmap=True)
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index da0af93388..62e1c1fe42 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -190,6 +190,90 @@ read -P0 0x00f8000 32k
 read -P0 0x2010000 32k
 read -P0 0x3fe0000 64k
 
+--- Cleanup ---
+
+{"return": {}}
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
+=== Test fleecing-format based fleecing with bitmap ===
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
+read failed: Invalid argument
+
+read -P0 0x2010000 32k
+read failed: Invalid argument
+
+read -P0 0x3fe0000 64k
+read failed: Invalid argument
+
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
+read failed: Invalid argument
+
+read -P0 0x2010000 32k
+read failed: Invalid argument
+
+read -P0 0x3fe0000 64k
+read failed: Invalid argument
+
+
 --- Cleanup ---
 
 {"return": {}}
-- 
2.34.1


