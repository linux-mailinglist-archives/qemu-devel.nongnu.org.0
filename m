Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F4E4E31B6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:27:42 +0100 (CET)
Received: from localhost ([::1]:58512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOcv-00077Q-DY
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:27:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOSA-0006JW-JV
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOS5-0001l6-Gq
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647893788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jpM4sOeDS2lwmb+yULBqEBJAJLscHRzPzCAfOJaTCZQ=;
 b=CGB6pGrHcIJIHvxFx9KU5P0TBFXBBEvwjCZ8s6y/EqIT/cjTfkGbwrb3hSrMEUesugswAC
 /93NBx6pN0LQi6w19denSsKBodYeoec80ZnlOb9IJwavTppiOBzZTQZ9cBLGmMtsnCuoxh
 GrsuJPp8VBe+xhx6FxhPiIfbVgo1sH0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-UCG5UfBYMfi0MtdDUxaxdA-1; Mon, 21 Mar 2022 16:16:24 -0400
X-MC-Unique: UCG5UfBYMfi0MtdDUxaxdA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4769F80005D;
 Mon, 21 Mar 2022 20:16:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BABAA454D60;
 Mon, 21 Mar 2022 20:16:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/18] iotests: add qemu_img_map() function
Date: Mon, 21 Mar 2022 16:16:10 -0400
Message-Id: <20220321201618.903471-11-jsnow@redhat.com>
In-Reply-To: <20220321201618.903471-1-jsnow@redhat.com>
References: <20220321201618.903471-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a qemu_img_map() function by analogy with qemu_img_measure(),
qemu_img_check(), and qemu_img_info() that all return JSON information.

Replace calls to qemu_img_pipe('map', '--output=json', ...) with this
new function, which provides better diagnostic information on failure.

Note: The output for iotest 211 changes, because logging JSON after it
was deserialized by Python behaves a little differently than logging the
raw JSON document string itself.
(iotests.log() sorts the keys for Python 3.6 support.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/041                         |  5 ++---
 tests/qemu-iotests/211                         |  6 +++---
 tests/qemu-iotests/211.out                     | 10 +++-------
 tests/qemu-iotests/iotests.py                  |  3 +++
 tests/qemu-iotests/tests/block-status-cache    | 11 ++++-------
 tests/qemu-iotests/tests/parallels-read-bitmap |  6 ++----
 6 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index db9f5dc540..3e16acee56 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -24,7 +24,7 @@ import os
 import re
 import json
 import iotests
-from iotests import qemu_img, qemu_img_pipe, qemu_io
+from iotests import qemu_img, qemu_img_map, qemu_io
 
 backing_img = os.path.join(iotests.test_dir, 'backing.img')
 target_backing_img = os.path.join(iotests.test_dir, 'target-backing.img')
@@ -1360,8 +1360,7 @@ class TestFilters(iotests.QMPTestCase):
 
         self.vm.qmp('blockdev-del', node_name='target')
 
-        target_map = qemu_img_pipe('map', '--output=json', target_img)
-        target_map = json.loads(target_map)
+        target_map = qemu_img_map(target_img)
 
         assert target_map[0]['start'] == 0
         assert target_map[0]['length'] == 512 * 1024
diff --git a/tests/qemu-iotests/211 b/tests/qemu-iotests/211
index f52cadade1..1a3b4596c8 100755
--- a/tests/qemu-iotests/211
+++ b/tests/qemu-iotests/211
@@ -59,7 +59,7 @@ with iotests.FilePath('t.vdi') as disk_path, \
     vm.shutdown()
 
     iotests.img_info_log(disk_path)
-    iotests.log(iotests.qemu_img_pipe('map', '--output=json', disk_path))
+    iotests.log(iotests.qemu_img_map(disk_path))
 
     #
     # Successful image creation (explicit defaults)
@@ -83,7 +83,7 @@ with iotests.FilePath('t.vdi') as disk_path, \
     vm.shutdown()
 
     iotests.img_info_log(disk_path)
-    iotests.log(iotests.qemu_img_pipe('map', '--output=json', disk_path))
+    iotests.log(iotests.qemu_img_map(disk_path))
 
     #
     # Successful image creation (with non-default options)
@@ -107,7 +107,7 @@ with iotests.FilePath('t.vdi') as disk_path, \
     vm.shutdown()
 
     iotests.img_info_log(disk_path)
-    iotests.log(iotests.qemu_img_pipe('map', '--output=json', disk_path))
+    iotests.log(iotests.qemu_img_map(disk_path))
 
     #
     # Invalid BlockdevRef
diff --git a/tests/qemu-iotests/211.out b/tests/qemu-iotests/211.out
index c4425b5982..f02c75409c 100644
--- a/tests/qemu-iotests/211.out
+++ b/tests/qemu-iotests/211.out
@@ -17,8 +17,7 @@ file format: IMGFMT
 virtual size: 128 MiB (134217728 bytes)
 cluster_size: 1048576
 
-[{ "start": 0, "length": 134217728, "depth": 0, "present": true, "zero": true, "data": false}]
-
+[{"data": false, "depth": 0, "length": 134217728, "present": true, "start": 0, "zero": true}]
 === Successful image creation (explicit defaults) ===
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "file", "filename": "TEST_DIR/PID-t.vdi", "size": 0}}}
@@ -36,8 +35,7 @@ file format: IMGFMT
 virtual size: 64 MiB (67108864 bytes)
 cluster_size: 1048576
 
-[{ "start": 0, "length": 67108864, "depth": 0, "present": true, "zero": true, "data": false}]
-
+[{"data": false, "depth": 0, "length": 67108864, "present": true, "start": 0, "zero": true}]
 === Successful image creation (with non-default options) ===
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "file", "filename": "TEST_DIR/PID-t.vdi", "size": 0}}}
@@ -55,9 +53,7 @@ file format: IMGFMT
 virtual size: 32 MiB (33554432 bytes)
 cluster_size: 1048576
 
-[{ "start": 0, "length": 3072, "depth": 0, "present": true, "zero": false, "data": true, "offset": 1024},
-{ "start": 3072, "length": 33551360, "depth": 0, "present": true, "zero": true, "data": true, "offset": 4096}]
-
+[{"data": true, "depth": 0, "length": 3072, "offset": 1024, "present": true, "start": 0, "zero": false}, {"data": true, "depth": 0, "length": 33551360, "offset": 4096, "present": true, "start": 3072, "zero": true}]
 === Invalid BlockdevRef ===
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "vdi", "file": "this doesn't exist", "size": 33554432}}}
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 2a1c589b76..b3e793f78a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -318,6 +318,9 @@ def qemu_img_check(*args: str) -> Any:
 def qemu_img_info(*args: str) -> Any:
     return qemu_img_json('info', "--output", "json", *args)
 
+def qemu_img_map(*args: str) -> Any:
+    return qemu_img_json('map', "--output", "json", *args)
+
 def qemu_img_pipe(*args: str) -> str:
     '''Run qemu-img and return its output'''
     return qemu_img_pipe_and_status(*args)[0]
diff --git a/tests/qemu-iotests/tests/block-status-cache b/tests/qemu-iotests/tests/block-status-cache
index 40e648e251..5a7bc2c149 100755
--- a/tests/qemu-iotests/tests/block-status-cache
+++ b/tests/qemu-iotests/tests/block-status-cache
@@ -22,7 +22,7 @@
 import os
 import signal
 import iotests
-from iotests import qemu_img_create, qemu_img_pipe, qemu_nbd
+from iotests import qemu_img_create, qemu_img_map, qemu_nbd
 
 
 image_size = 1 * 1024 * 1024
@@ -76,8 +76,7 @@ class TestBscWithNbd(iotests.QMPTestCase):
         # to allocate the first sector to facilitate alignment probing), and
         # then the rest to be zero.  The BSC will thus contain (if anything)
         # one range covering the first sector.
-        map_pre = qemu_img_pipe('map', '--output=json', '--image-opts',
-                                nbd_img_opts)
+        map_pre = qemu_img_map('--image-opts', nbd_img_opts)
 
         # qemu:allocation-depth maps for want_zero=false.
         # want_zero=false should (with the file driver, which the server is
@@ -111,14 +110,12 @@ class TestBscWithNbd(iotests.QMPTestCase):
         # never loop too many times here.
         for _ in range(2):
             # (Ignore the result, this is just to contaminate the cache)
-            qemu_img_pipe('map', '--output=json', '--image-opts',
-                          nbd_img_opts_alloc_depth)
+            qemu_img_map('--image-opts', nbd_img_opts_alloc_depth)
 
         # Now let's see whether the cache reports everything as data, or
         # whether we get correct information (i.e. the same as we got on our
         # first attempt).
-        map_post = qemu_img_pipe('map', '--output=json', '--image-opts',
-                                 nbd_img_opts)
+        map_post = qemu_img_map('--image-opts', nbd_img_opts)
 
         if map_pre != map_post:
             print('ERROR: Map information differs before and after querying ' +
diff --git a/tests/qemu-iotests/tests/parallels-read-bitmap b/tests/qemu-iotests/tests/parallels-read-bitmap
index af6b9c5db3..38ab5fa5b2 100755
--- a/tests/qemu-iotests/tests/parallels-read-bitmap
+++ b/tests/qemu-iotests/tests/parallels-read-bitmap
@@ -18,9 +18,8 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
-import json
 import iotests
-from iotests import qemu_nbd_popen, qemu_img_pipe, log, file_path
+from iotests import qemu_nbd_popen, qemu_img_map, log, file_path
 
 iotests.script_initialize(supported_fmts=['parallels'])
 
@@ -36,8 +35,7 @@ iotests.unarchive_sample_image('parallels-with-bitmap', disk)
 
 with qemu_nbd_popen('--read-only', f'--socket={nbd_sock}',
                     f'--bitmap={bitmap}', '-f', iotests.imgfmt, disk):
-    out = qemu_img_pipe('map', '--output=json', '--image-opts', nbd_opts)
-    chunks = json.loads(out)
+    chunks = qemu_img_map('--image-opts', nbd_opts)
     cluster = 64 * 1024
 
     log('dirty clusters (cluster size is 64K):')
-- 
2.34.1


