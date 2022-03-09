Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66A74D264A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 04:56:35 +0100 (CET)
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRnRC-0005YA-RN
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 22:56:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPD-0002O3-0Z
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPB-0002tq-3j
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646798068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/Ibqg4xB0LjxJzd0BLSKhI/BhKRajkO1237wCDupRE=;
 b=NKT1yZ9FXZBG5DzWOjNNM5aNz0sc5GRSrPI6/4WIl/ALoUQ02hrKiHiD6vtstcoEYxfHve
 Jketdeq2CMsUVffoo1jD3k3iVr/gtyGVQrC0RCBbVye5lPO9ijmRut2snm57Wle4Hc/XWD
 phtXH4Ov3yGjyZWT7UkR6LnhM2KSJNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-xDH1lObvOEm0u1Rs9XD9uw-1; Tue, 08 Mar 2022 22:54:26 -0500
X-MC-Unique: xDH1lObvOEm0u1Rs9XD9uw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 990881091DA5;
 Wed,  9 Mar 2022 03:54:25 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E28056C180;
 Wed,  9 Mar 2022 03:54:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/14] iotests: add qemu_img_map() function
Date: Tue,  8 Mar 2022 22:53:58 -0500
Message-Id: <20220309035407.1848654-6-jsnow@redhat.com>
In-Reply-To: <20220309035407.1848654-1-jsnow@redhat.com>
References: <20220309035407.1848654-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a qemu_img_map() function by analogy with qemu_img_measure(),
qemu_img_check(), and qemu_img_info() that all return JSON information.

Replace calls to qemu_img_pipe('map', '--output=json', ...) with this
new function, which provides better diagnostic information on failure.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/041                         |  5 ++---
 tests/qemu-iotests/211                         |  6 +++---
 tests/qemu-iotests/iotests.py                  |  3 +++
 tests/qemu-iotests/tests/block-status-cache    | 11 ++++-------
 tests/qemu-iotests/tests/parallels-read-bitmap |  6 ++----
 5 files changed, 14 insertions(+), 17 deletions(-)

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
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 62f82281a9..3896440238 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -323,6 +323,9 @@ def qemu_img_check(*args: str) -> Any:
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


