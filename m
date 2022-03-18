Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7124DE2C3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:46:11 +0100 (CET)
Received: from localhost ([::1]:44774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJUA-0002KQ-Vf
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:46:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLS-0002Zp-8X
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLM-0005a5-R9
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647635824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMNytcSELbcuNsTcao8h13ldHnJ8AWsFdXzOxlUpTdU=;
 b=hNuLx4OWEd7gJMKOgH+WLjdEe4hvvG6V9/4LjJS57bn2we1y74uruDAIGPZICcAwyXwMEF
 58J9E+W4Ep7DwlR9P+7ylxA60NQ56x+guDUg31TwB24CD07F0KF2N2VxWus+a8Nbtf612E
 Y+l5RJrIvDBX11wbXUzvdoPN2xJs1TA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-AVieNFZOP9an1HrbgiUq9w-1; Fri, 18 Mar 2022 16:37:00 -0400
X-MC-Unique: AVieNFZOP9an1HrbgiUq9w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EF21833942;
 Fri, 18 Mar 2022 20:37:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30EC5403373;
 Fri, 18 Mar 2022 20:37:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/15] iotests: remove qemu_io_silent() and
 qemu_io_silent_check().
Date: Fri, 18 Mar 2022 16:36:54 -0400
Message-Id: <20220318203655.676907-15-jsnow@redhat.com>
In-Reply-To: <20220318203655.676907-1-jsnow@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Like qemu-img, qemu-io returning 0 should be the norm and not the
exception. Remove all calls to qemu_io_silent that just assert the
return code is zero (That's every last call, as it turns out), and
replace them with a normal qemu_io() call.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/216                        | 12 +++++-----
 tests/qemu-iotests/218                        |  5 ++---
 tests/qemu-iotests/224                        |  4 ++--
 tests/qemu-iotests/258                        | 12 +++++-----
 tests/qemu-iotests/298                        | 16 ++++++--------
 tests/qemu-iotests/310                        | 22 +++++++++----------
 tests/qemu-iotests/iotests.py                 | 16 --------------
 tests/qemu-iotests/tests/image-fleecing       |  4 ++--
 .../tests/mirror-ready-cancel-error           |  2 +-
 .../qemu-iotests/tests/stream-error-on-reset  |  4 ++--
 10 files changed, 39 insertions(+), 58 deletions(-)

diff --git a/tests/qemu-iotests/216 b/tests/qemu-iotests/216
index 88b385afa3..97de1cda61 100755
--- a/tests/qemu-iotests/216
+++ b/tests/qemu-iotests/216
@@ -21,7 +21,7 @@
 # Creator/Owner: Max Reitz <mreitz@redhat.com>
 
 import iotests
-from iotests import log, qemu_img, qemu_io_silent
+from iotests import log, qemu_img, qemu_io
 
 # Need backing file support
 iotests.script_initialize(supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk'],
@@ -52,10 +52,10 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M')
-    assert qemu_io_silent(base_img_path, '-c', 'write -P 1 0M 1M') == 0
+    qemu_io(base_img_path, '-c', 'write -P 1 0M 1M')
     qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
              '-F', iotests.imgfmt, top_img_path)
-    assert qemu_io_silent(top_img_path,  '-c', 'write -P 2 1M 1M') == 0
+    qemu_io(top_img_path,  '-c', 'write -P 2 1M 1M')
 
     log('Done')
 
@@ -110,8 +110,8 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Checking COR result ---')
     log('')
 
-    assert qemu_io_silent(base_img_path, '-c', 'discard 0 64M') == 0
-    assert qemu_io_silent(top_img_path,  '-c', 'read -P 1 0M 1M') == 0
-    assert qemu_io_silent(top_img_path,  '-c', 'read -P 2 1M 1M') == 0
+    qemu_io(base_img_path, '-c', 'discard 0 64M')
+    qemu_io(top_img_path,  '-c', 'read -P 1 0M 1M')
+    qemu_io(top_img_path,  '-c', 'read -P 2 1M 1M')
 
     log('Done')
diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
index 853ed52b34..0c717c9b7f 100755
--- a/tests/qemu-iotests/218
+++ b/tests/qemu-iotests/218
@@ -28,7 +28,7 @@
 # Creator/Owner: Max Reitz <mreitz@redhat.com>
 
 import iotests
-from iotests import log, qemu_img, qemu_io_silent
+from iotests import log, qemu_img, qemu_io
 
 iotests.script_initialize(supported_fmts=['qcow2', 'raw'])
 
@@ -146,8 +146,7 @@ with iotests.VM() as vm, \
      iotests.FilePath('src.img') as src_img_path:
 
     qemu_img('create', '-f', iotests.imgfmt, src_img_path, '64M')
-    assert qemu_io_silent('-f', iotests.imgfmt, src_img_path,
-                          '-c', 'write -P 42 0M 64M') == 0
+    qemu_io('-f', iotests.imgfmt, src_img_path, '-c', 'write -P 42 0M 64M')
 
     vm.launch()
 
diff --git a/tests/qemu-iotests/224 b/tests/qemu-iotests/224
index c31c55b49d..8eb3ceb8d1 100755
--- a/tests/qemu-iotests/224
+++ b/tests/qemu-iotests/224
@@ -22,7 +22,7 @@
 # Creator/Owner: Max Reitz <mreitz@redhat.com>
 
 import iotests
-from iotests import log, qemu_img, qemu_io_silent, filter_qmp_testfiles, \
+from iotests import log, qemu_img, qemu_io, filter_qmp_testfiles, \
                     filter_qmp_imgfmt
 import json
 
@@ -54,7 +54,7 @@ for filter_node_name in False, True:
                  '-F', iotests.imgfmt, top_img_path)
 
         # Something to commit
-        assert qemu_io_silent(mid_img_path, '-c', 'write -P 1 0 1M') == 0
+        qemu_io(mid_img_path, '-c', 'write -P 1 0 1M')
 
         vm.launch()
 
diff --git a/tests/qemu-iotests/258 b/tests/qemu-iotests/258
index 7798a04d7d..e11a0e09b3 100755
--- a/tests/qemu-iotests/258
+++ b/tests/qemu-iotests/258
@@ -21,7 +21,7 @@
 # Creator/Owner: Max Reitz <mreitz@redhat.com>
 
 import iotests
-from iotests import log, qemu_img, qemu_io_silent, \
+from iotests import log, qemu_img, qemu_io, \
         filter_qmp_testfiles, filter_qmp_imgfmt
 
 # Returns a node for blockdev-add
@@ -86,15 +86,15 @@ def test_concurrent_finish(write_to_stream_node):
         if write_to_stream_node:
             # This is what (most of the time) makes commit finish
             # earlier and then pull in stream
-            assert qemu_io_silent(node2_path,
-                                  '-c', 'write %iK 64K' % (65536 - 192),
-                                  '-c', 'write %iK 64K' % (65536 -  64)) == 0
+            qemu_io(node2_path,
+                    '-c', 'write %iK 64K' % (65536 - 192),
+                    '-c', 'write %iK 64K' % (65536 -  64))
 
             stream_throttle='tg'
         else:
             # And this makes stream finish earlier
-            assert qemu_io_silent(node1_path,
-                                  '-c', 'write %iK 64K' % (65536 - 64)) == 0
+            qemu_io(node1_path,
+                    '-c', 'write %iK 64K' % (65536 - 64))
 
             commit_throttle='tg'
 
diff --git a/tests/qemu-iotests/298 b/tests/qemu-iotests/298
index fae72211b1..9d6d95d953 100755
--- a/tests/qemu-iotests/298
+++ b/tests/qemu-iotests/298
@@ -129,16 +129,14 @@ class TestTruncate(iotests.QMPTestCase):
         os.remove(refdisk)
 
     def do_test(self, prealloc_mode, new_size):
-        ret = iotests.qemu_io_silent('--image-opts', '-c', 'write 0 10M', '-c',
-                                     f'truncate -m {prealloc_mode} {new_size}',
-                                     drive_opts)
-        self.assertEqual(ret, 0)
+        iotests.qemu_io('--image-opts', '-c', 'write 0 10M', '-c',
+                        f'truncate -m {prealloc_mode} {new_size}',
+                        drive_opts)
 
-        ret = iotests.qemu_io_silent('-f', iotests.imgfmt, '-c', 'write 0 10M',
-                                     '-c',
-                                     f'truncate -m {prealloc_mode} {new_size}',
-                                     refdisk)
-        self.assertEqual(ret, 0)
+        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write 0 10M',
+                        '-c',
+                        f'truncate -m {prealloc_mode} {new_size}',
+                        refdisk)
 
         stat = os.stat(disk)
         refstat = os.stat(refdisk)
diff --git a/tests/qemu-iotests/310 b/tests/qemu-iotests/310
index e3bfedc7fd..2496495f50 100755
--- a/tests/qemu-iotests/310
+++ b/tests/qemu-iotests/310
@@ -21,7 +21,7 @@
 #
 
 import iotests
-from iotests import log, qemu_img, qemu_io_silent
+from iotests import log, qemu_img, qemu_io
 
 # Need backing file support
 iotests.script_initialize(supported_fmts=['qcow2'],
@@ -44,15 +44,15 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M')
-    assert qemu_io_silent(base_img_path, '-c', 'write -P 1 0M 1M') == 0
-    assert qemu_io_silent(base_img_path, '-c', 'write -P 1 3M 1M') == 0
+    qemu_io(base_img_path, '-c', 'write -P 1 0M 1M')
+    qemu_io(base_img_path, '-c', 'write -P 1 3M 1M')
     qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
              '-F', iotests.imgfmt, mid_img_path)
-    assert qemu_io_silent(mid_img_path, '-c', 'write -P 3 2M 1M') == 0
-    assert qemu_io_silent(mid_img_path, '-c', 'write -P 3 4M 1M') == 0
+    qemu_io(mid_img_path, '-c', 'write -P 3 2M 1M')
+    qemu_io(mid_img_path, '-c', 'write -P 3 4M 1M')
     qemu_img('create', '-f', iotests.imgfmt, '-b', mid_img_path,
              '-F', iotests.imgfmt, top_img_path)
-    assert qemu_io_silent(top_img_path, '-c', 'write -P 2 1M 1M') == 0
+    qemu_io(top_img_path, '-c', 'write -P 2 1M 1M')
 
 #      0 1 2 3 4
 # top    2
@@ -107,10 +107,10 @@ with iotests.FilePath('base.img') as base_img_path, \
     # Detach backing to check that we can read the data from the top level now
     qemu_img('rebase', '-u', '-b', '', '-f', iotests.imgfmt, top_img_path)
 
-    assert qemu_io_silent(top_img_path, '-c', 'read -P 0 0 1M') == 0
-    assert qemu_io_silent(top_img_path, '-c', 'read -P 2 1M 1M') == 0
-    assert qemu_io_silent(top_img_path, '-c', 'read -P 3 2M 1M') == 0
-    assert qemu_io_silent(top_img_path, '-c', 'read -P 0 3M 1M') == 0
-    assert qemu_io_silent(top_img_path, '-c', 'read -P 3 4M 1M') == 0
+    qemu_io(top_img_path, '-c', 'read -P 0 0 1M')
+    qemu_io(top_img_path, '-c', 'read -P 2 1M 1M')
+    qemu_io(top_img_path, '-c', 'read -P 3 2M 1M')
+    qemu_io(top_img_path, '-c', 'read -P 0 3M 1M')
+    qemu_io(top_img_path, '-c', 'read -P 3 4M 1M')
 
     log('Done')
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index e8f38e7ad3..0b631e1f8c 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -370,22 +370,6 @@ def qemu_io_log(*args: str) -> subprocess.CompletedProcess[str]:
     log(result.stdout, filters=[filter_testfiles, filter_qemu_io])
     return result
 
-def qemu_io_silent(*args):
-    '''Run qemu-io and return the exit code, suppressing stdout'''
-    args = qemu_io_wrap_args(args)
-    result = subprocess.run(args, stdout=subprocess.DEVNULL, check=False)
-    if result.returncode < 0:
-        sys.stderr.write('qemu-io received signal %i: %s\n' %
-                         (-result.returncode, ' '.join(args)))
-    return result.returncode
-
-def qemu_io_silent_check(*args):
-    '''Run qemu-io and return the true if subprocess returned 0'''
-    args = qemu_io_wrap_args(args)
-    result = subprocess.run(args, stdout=subprocess.DEVNULL,
-                            stderr=subprocess.STDOUT, check=False)
-    return result.returncode == 0
-
 class QemuIoInteractive:
     def __init__(self, *args):
         self.args = qemu_io_wrap_args(args)
diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 07a4ea7bc4..8d5b0192c6 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -23,7 +23,7 @@
 # Creator/Owner: John Snow <jsnow@redhat.com>
 
 import iotests
-from iotests import log, qemu_img, qemu_io, qemu_io_silent
+from iotests import log, qemu_img, qemu_io
 
 iotests.script_initialize(
     supported_fmts=['qcow2'],
@@ -254,7 +254,7 @@ def do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
     for p in overwrite + remainder:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent(base_img_path, '-c', cmd) == 0
+        qemu_io(base_img_path, '-c', cmd)
 
     log('')
     log('Done')
diff --git a/tests/qemu-iotests/tests/mirror-ready-cancel-error b/tests/qemu-iotests/tests/mirror-ready-cancel-error
index 1d0e333b5e..01217459b9 100755
--- a/tests/qemu-iotests/tests/mirror-ready-cancel-error
+++ b/tests/qemu-iotests/tests/mirror-ready-cancel-error
@@ -37,7 +37,7 @@ class TestMirrorReadyCancelError(iotests.QMPTestCase):
         # Ensure that mirror will copy something before READY so the
         # target format layer will forward the pre-READY flush to its
         # file child
-        assert iotests.qemu_io_silent('-c', 'write -P 1 0 64k', source) == 0
+        iotests.qemu_io('-c', 'write -P 1 0 64k', source)
 
         self.vm = iotests.VM()
         self.vm.launch()
diff --git a/tests/qemu-iotests/tests/stream-error-on-reset b/tests/qemu-iotests/tests/stream-error-on-reset
index 389ae822b8..5a8c3a9e8d 100755
--- a/tests/qemu-iotests/tests/stream-error-on-reset
+++ b/tests/qemu-iotests/tests/stream-error-on-reset
@@ -21,7 +21,7 @@
 
 import os
 import iotests
-from iotests import imgfmt, qemu_img_create, qemu_io_silent, QMPTestCase
+from iotests import imgfmt, qemu_img_create, qemu_io, QMPTestCase
 
 
 image_size = 1 * 1024 * 1024
@@ -55,7 +55,7 @@ class TestStreamErrorOnReset(QMPTestCase):
         - top image is attached to a virtio-scsi device
         """
         qemu_img_create('-f', imgfmt, base, str(image_size))
-        assert qemu_io_silent('-c', f'write 0 {data_size}', base) == 0
+        qemu_io('-c', f'write 0 {data_size}', base)
         qemu_img_create('-f', imgfmt, top, str(image_size))
 
         self.vm = iotests.VM()
-- 
2.34.1


