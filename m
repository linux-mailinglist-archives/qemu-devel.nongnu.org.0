Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59DD50E30C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:25:57 +0200 (CEST)
Received: from localhost ([::1]:55316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizf2-00018L-PU
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizON-0005Mi-EK
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizOK-0001zB-S8
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nBKA05sX0Lm8K8faf7iGDKEmABAdxhIjFNF37cFY7cE=;
 b=SfPvrzvF7cuBS8YyvsJO6WGKOlNPUPLeg7CLSOcqFPvh+dU9zIHKmSiMVXZoYzqK9MiuCt
 XhvFHppw/ed0B6IQ9Ssc15UybNVnB/DxQugD2D/O1w5iAp5f2BSzoDXpToklcuj3Fkv9ds
 OReH4BVsjQYpvbh2oCOTO61ogs1ghXg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-zMvidVe5PleCwVSuoRgGLg-1; Mon, 25 Apr 2022 10:08:36 -0400
X-MC-Unique: zMvidVe5PleCwVSuoRgGLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82CC7811E76;
 Mon, 25 Apr 2022 14:08:36 +0000 (UTC)
Received: from localhost (unknown [10.39.194.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01335404729C;
 Mon, 25 Apr 2022 14:08:35 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/14] iotests: rebase qemu_io() on top of qemu_tool()
Date: Mon, 25 Apr 2022 16:08:15 +0200
Message-Id: <20220425140821.957511-9-hreitz@redhat.com>
In-Reply-To: <20220425140821.957511-1-hreitz@redhat.com>
References: <20220425140821.957511-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Rework qemu_io() to be analogous to qemu_img(); a function that requires
a return code of zero by default unless disabled explicitly.

Tests that use qemu_io():
030 040 041 044 055 056 093 124 129 132 136 148 149 151 152 163 165 205
209 219 236 245 248 254 255 257 260 264 280 298 300 302 304
image-fleecing migrate-bitmaps-postcopy-test migrate-bitmaps-test
migrate-during-backup migration-permissions

Test that use qemu_io_log():
242 245 255 274 303 307 nbd-reconnect-on-open

Copy-pastables for testing/verification:

./check -qcow2 030 040 041 044 055 056 124 129 132 151 152 163 165 209 \
               219 236 242 245 248 254 255 257 260 264 274 \
               280 298 300 302 303 304 307 image-fleecing \
               migrate-bitmaps-postcopy-test migrate-bitmaps-test \
               migrate-during-backup nbd-reconnect-on-open
./check -raw 093 136 148 migration-permissions
./check -nbd 205

# ./configure configure --disable-gnutls --enable-gcrypt
# this ALSO requires passwordless sudo.
./check -luks 149

# Just the tests that were edited in this commit:
./check -qcow2 030 040 242 245
./check -raw migration-permissions
./check -nbd 205
./check -luks 149

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20220418211504.943969-8-jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/030                        | 85 +++++++++++--------
 tests/qemu-iotests/149                        |  6 +-
 tests/qemu-iotests/205                        |  4 +-
 tests/qemu-iotests/245                        | 17 ++--
 tests/qemu-iotests/iotests.py                 | 19 +++--
 .../qemu-iotests/tests/migration-permissions  |  4 +-
 6 files changed, 81 insertions(+), 54 deletions(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 18eddcc734..98595d47fe 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -64,16 +64,18 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', 'raw', '-c', 'map', backing_img),
-                         qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img),
-                         'image file map does not match backing file after streaming')
+        self.assertEqual(
+            qemu_io('-f', 'raw', '-c', 'map', backing_img).stdout,
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img).stdout,
+            'image file map does not match backing file after streaming')
 
     def test_stream_intermediate(self):
         self.assert_no_active_block_jobs()
 
-        self.assertNotEqual(qemu_io('-f', 'raw', '-rU', '-c', 'map', backing_img),
-                            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', mid_img),
-                            'image file map matches backing file before streaming')
+        self.assertNotEqual(
+            qemu_io('-f', 'raw', '-rU', '-c', 'map', backing_img).stdout,
+            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', mid_img).stdout,
+            'image file map matches backing file before streaming')
 
         result = self.vm.qmp('block-stream', device='mid', job_id='stream-mid')
         self.assert_qmp(result, 'return', {})
@@ -83,9 +85,10 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', 'raw', '-c', 'map', backing_img),
-                         qemu_io('-f', iotests.imgfmt, '-c', 'map', mid_img),
-                         'image file map does not match backing file after streaming')
+        self.assertEqual(
+            qemu_io('-f', 'raw', '-c', 'map', backing_img).stdout,
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', mid_img).stdout,
+            'image file map does not match backing file after streaming')
 
     def test_stream_pause(self):
         self.assert_no_active_block_jobs()
@@ -113,15 +116,17 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', 'raw', '-c', 'map', backing_img),
-                         qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img),
-                         'image file map does not match backing file after streaming')
+        self.assertEqual(
+            qemu_io('-f', 'raw', '-c', 'map', backing_img).stdout,
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img).stdout,
+            'image file map does not match backing file after streaming')
 
     def test_stream_no_op(self):
         self.assert_no_active_block_jobs()
 
         # The image map is empty before the operation
-        empty_map = qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', test_img)
+        empty_map = qemu_io(
+            '-f', iotests.imgfmt, '-rU', '-c', 'map', test_img).stdout
 
         # This is a no-op: no data should ever be copied from the base image
         result = self.vm.qmp('block-stream', device='drive0', base=mid_img)
@@ -132,8 +137,9 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img),
-                         empty_map, 'image file map changed after a no-op')
+        self.assertEqual(
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img).stdout,
+            empty_map, 'image file map changed after a no-op')
 
     def test_stream_partial(self):
         self.assert_no_active_block_jobs()
@@ -146,9 +152,10 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', iotests.imgfmt, '-c', 'map', mid_img),
-                         qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img),
-                         'image file map does not match backing file after streaming')
+        self.assertEqual(
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', mid_img).stdout,
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img).stdout,
+            'image file map does not match backing file after streaming')
 
     def test_device_not_found(self):
         result = self.vm.qmp('block-stream', device='nonexistent')
@@ -236,9 +243,10 @@ class TestParallelOps(iotests.QMPTestCase):
 
         # Check that the maps don't match before the streaming operations
         for i in range(2, self.num_imgs, 2):
-            self.assertNotEqual(qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[i]),
-                                qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[i-1]),
-                                'image file map matches backing file before streaming')
+            self.assertNotEqual(
+                qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[i]).stdout,
+                qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[i-1]).stdout,
+                'image file map matches backing file before streaming')
 
         # Create all streaming jobs
         pending_jobs = []
@@ -278,9 +286,10 @@ class TestParallelOps(iotests.QMPTestCase):
 
         # Check that all maps match now
         for i in range(2, self.num_imgs, 2):
-            self.assertEqual(qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[i]),
-                             qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[i-1]),
-                             'image file map does not match backing file after streaming')
+            self.assertEqual(
+                qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[i]).stdout,
+                qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[i-1]).stdout,
+                'image file map does not match backing file after streaming')
 
     # Test that it's not possible to perform two block-stream
     # operations if there are nodes involved in both.
@@ -514,9 +523,10 @@ class TestParallelOps(iotests.QMPTestCase):
     def test_stream_base_node_name(self):
         self.assert_no_active_block_jobs()
 
-        self.assertNotEqual(qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[4]),
-                            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[3]),
-                            'image file map matches backing file before streaming')
+        self.assertNotEqual(
+            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[4]).stdout,
+            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[3]).stdout,
+            'image file map matches backing file before streaming')
 
         # Error: the base node does not exist
         result = self.vm.qmp('block-stream', device='node4', base_node='none', job_id='stream')
@@ -547,9 +557,10 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[4]),
-                         qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[3]),
-                         'image file map matches backing file after streaming')
+        self.assertEqual(
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[4]).stdout,
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[3]).stdout,
+            'image file map matches backing file after streaming')
 
 class TestQuorum(iotests.QMPTestCase):
     num_children = 3
@@ -588,9 +599,10 @@ class TestQuorum(iotests.QMPTestCase):
             os.remove(img)
 
     def test_stream_quorum(self):
-        self.assertNotEqual(qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.children[0]),
-                            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.backing[0]),
-                            'image file map matches backing file before streaming')
+        self.assertNotEqual(
+            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.children[0]).stdout,
+            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.backing[0]).stdout,
+            'image file map matches backing file before streaming')
 
         self.assert_no_active_block_jobs()
 
@@ -602,9 +614,10 @@ class TestQuorum(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', iotests.imgfmt, '-c', 'map', self.children[0]),
-                         qemu_io('-f', iotests.imgfmt, '-c', 'map', self.backing[0]),
-                         'image file map does not match backing file after streaming')
+        self.assertEqual(
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', self.children[0]).stdout,
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', self.backing[0]).stdout,
+            'image file map does not match backing file after streaming')
 
 class TestSmallerBackingFile(iotests.QMPTestCase):
     backing_len = 1 * 1024 * 1024 # MB
diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
index 9bb96d6a1d..2ae318f16f 100755
--- a/tests/qemu-iotests/149
+++ b/tests/qemu-iotests/149
@@ -295,7 +295,8 @@ def qemu_io_write_pattern(config, pattern, offset_mb, size_mb, dev=False):
     args = ["-c", "write -P 0x%x %dM %dM" % (pattern, offset_mb, size_mb)]
     args.extend(qemu_io_image_args(config, dev))
     iotests.log("qemu-io " + " ".join(args), filters=[iotests.filter_test_dir])
-    iotests.log(check_cipher_support(config, iotests.qemu_io(*args)),
+    output = iotests.qemu_io(*args, check=False).stdout
+    iotests.log(check_cipher_support(config, output),
                 filters=[iotests.filter_test_dir, iotests.filter_qemu_io])
 
 
@@ -307,7 +308,8 @@ def qemu_io_read_pattern(config, pattern, offset_mb, size_mb, dev=False):
     args = ["-c", "read -P 0x%x %dM %dM" % (pattern, offset_mb, size_mb)]
     args.extend(qemu_io_image_args(config, dev))
     iotests.log("qemu-io " + " ".join(args), filters=[iotests.filter_test_dir])
-    iotests.log(check_cipher_support(config, iotests.qemu_io(*args)),
+    output = iotests.qemu_io(*args, check=False).stdout
+    iotests.log(check_cipher_support(config, output),
                 filters=[iotests.filter_test_dir, iotests.filter_qemu_io])
 
 
diff --git a/tests/qemu-iotests/205 b/tests/qemu-iotests/205
index c0e107328f..15f798288a 100755
--- a/tests/qemu-iotests/205
+++ b/tests/qemu-iotests/205
@@ -85,13 +85,13 @@ class TestNbdServerRemove(iotests.QMPTestCase):
 
     def do_test_connect_after_remove(self, mode=None):
         args = ('-r', '-f', 'raw', '-c', 'read 0 512', nbd_uri)
-        self.assertReadOk(qemu_io(*args))
+        self.assertReadOk(qemu_io(*args).stdout)
 
         result = self.remove_export('exp', mode)
         self.assert_qmp(result, 'return', {})
 
         self.assertExportNotFound('exp')
-        self.assertConnectFailed(qemu_io(*args))
+        self.assertConnectFailed(qemu_io(*args, check=False).stdout)
 
     def test_connect_after_remove_default(self):
         self.do_test_connect_after_remove()
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 8cbed7821b..edaf29094b 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -20,11 +20,13 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+import copy
+import json
 import os
 import re
+from subprocess import CalledProcessError
+
 import iotests
-import copy
-import json
 from iotests import qemu_img, qemu_io
 
 hd_path = [
@@ -216,11 +218,14 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
     # Reopen an image several times changing some of its options
     def test_reopen(self):
-        # Check whether the filesystem supports O_DIRECT
-        if 'O_DIRECT' in qemu_io('-f', 'raw', '-t', 'none', '-c', 'quit', hd_path[0]):
-            supports_direct = False
-        else:
+        try:
+            qemu_io('-f', 'raw', '-t', 'none', '-c', 'quit', hd_path[0])
             supports_direct = True
+        except CalledProcessError as exc:
+            if 'O_DIRECT' in exc.stdout:
+                supports_direct = False
+            else:
+                raise
 
         # Open the hd1 image passing all backing options
         opts = hd_opts(1)
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6800c67bea..06d35af21a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -353,16 +353,23 @@ def qemu_io_wrap_args(args: Sequence[str]) -> List[str]:
 def qemu_io_popen(*args):
     return qemu_tool_popen(qemu_io_wrap_args(args))
 
-def qemu_io(*args):
-    '''Run qemu-io and return the stdout data'''
-    return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
+def qemu_io(*args: str, check: bool = True, combine_stdio: bool = True
+            ) -> 'subprocess.CompletedProcess[str]':
+    """
+    Run QEMU_IO_PROG and return the status code and console output.
+
+    This function always prepends either QEMU_IO_OPTIONS or
+    QEMU_IO_OPTIONS_NO_FMT.
+    """
+    return qemu_tool(*qemu_io_wrap_args(args),
+                     check=check, combine_stdio=combine_stdio)
 
 def qemu_io_pipe_and_status(*args):
     return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))
 
-def qemu_io_log(*args):
-    result = qemu_io(*args)
-    log(result, filters=[filter_testfiles, filter_qemu_io])
+def qemu_io_log(*args: str) -> 'subprocess.CompletedProcess[str]':
+    result = qemu_io(*args, check=False)
+    log(result.stdout, filters=[filter_testfiles, filter_qemu_io])
     return result
 
 def qemu_io_silent(*args):
diff --git a/tests/qemu-iotests/tests/migration-permissions b/tests/qemu-iotests/tests/migration-permissions
index 6be02581c7..c7afb1bd2c 100755
--- a/tests/qemu-iotests/tests/migration-permissions
+++ b/tests/qemu-iotests/tests/migration-permissions
@@ -69,7 +69,7 @@ class TestMigrationPermissions(iotests.QMPTestCase):
     def test_post_migration_permissions(self):
         # Try to access the image R/W, which should fail because virtio-blk
         # has not been configured with share-rw=on
-        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img)
+        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img, check=False).stdout
         if not log.strip():
             print('ERROR (pre-migration): qemu-io should not be able to '
                   'access this image, but it reported no error')
@@ -84,7 +84,7 @@ class TestMigrationPermissions(iotests.QMPTestCase):
 
         # Try the same qemu-io access again, verifying that the WRITE
         # permission remains unshared
-        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img)
+        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img, check=False).stdout
         if not log.strip():
             print('ERROR (post-migration): qemu-io should not be able to '
                   'access this image, but it reported no error')
-- 
2.35.1


