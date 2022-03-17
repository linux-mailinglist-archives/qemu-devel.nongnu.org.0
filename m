Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BA24DD1D5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 01:14:56 +0100 (CET)
Received: from localhost ([::1]:59106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV0Gd-00073m-Ny
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 20:14:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUzsV-0001j7-FU
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 19:50:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUzsP-0005hR-QL
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 19:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647560992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z3u4MEtStYACQP2LA5oAEjNyAanePGh8ZrFc3yIQ4HA=;
 b=g5LIGOnrY5QSRYX5b0UoQXK23KL1rrPGzypDFlTKzgJMbjr/cnqZz53XBdhI54CUNQO8XS
 S3tHT4hHpgjWd3dz6OZEm8w33SSQINU0ziQXL5WbFkpbAALAE4CZTHMl/+AnshBc4my5GR
 p9a/jGXlwgWR4OdktPImROretYAtQ8E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-hdVymPUxNki7VbMifOrVRg-1; Thu, 17 Mar 2022 19:49:49 -0400
X-MC-Unique: hdVymPUxNki7VbMifOrVRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4259280159B;
 Thu, 17 Mar 2022 23:49:49 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E19AE112C256;
 Thu, 17 Mar 2022 23:49:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/18] iotests: replace qemu_img_log('create', ...) calls
Date: Thu, 17 Mar 2022 19:49:35 -0400
Message-Id: <20220317234937.569525-17-jsnow@redhat.com>
In-Reply-To: <20220317234937.569525-1-jsnow@redhat.com>
References: <20220317234937.569525-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_img_log() calls into qemu_img_pipe(), which always removes output
for 'create' commands on success anyway. Replace all of these calls to
the simpler qemu_img_create(...) which doesn't log, but raises a
detailed exception object on failure instead.

Blank lines are removed from output files where appropriate.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/255     |  8 ++++----
 tests/qemu-iotests/255.out |  4 ----
 tests/qemu-iotests/274     | 17 ++++++++---------
 tests/qemu-iotests/274.out | 29 -----------------------------
 tests/qemu-iotests/280     |  2 +-
 tests/qemu-iotests/280.out |  1 -
 6 files changed, 13 insertions(+), 48 deletions(-)

diff --git a/tests/qemu-iotests/255 b/tests/qemu-iotests/255
index 3d6d0e80cb..f86fa851b6 100755
--- a/tests/qemu-iotests/255
+++ b/tests/qemu-iotests/255
@@ -42,8 +42,8 @@ with iotests.FilePath('t.qcow2') as disk_path, \
     size_str = str(size)
 
     iotests.create_image(base_path, size)
-    iotests.qemu_img_log('create', '-f', iotests.imgfmt, mid_path, size_str)
-    iotests.qemu_img_log('create', '-f', iotests.imgfmt, disk_path, size_str)
+    iotests.qemu_img_create('-f', iotests.imgfmt, mid_path, size_str)
+    iotests.qemu_img_create('-f', iotests.imgfmt, disk_path, size_str)
 
     # Create a backing chain like this:
     # base <- [throttled: bps-read=4096] <- mid <- overlay
@@ -92,8 +92,8 @@ with iotests.FilePath('src.qcow2') as src_path, \
     size = 128 * 1024 * 1024
     size_str = str(size)
 
-    iotests.qemu_img_log('create', '-f', iotests.imgfmt, src_path, size_str)
-    iotests.qemu_img_log('create', '-f', iotests.imgfmt, dst_path, size_str)
+    iotests.qemu_img_create('-f', iotests.imgfmt, src_path, size_str)
+    iotests.qemu_img_create('-f', iotests.imgfmt, dst_path, size_str)
 
     iotests.log(iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write 0 1M',
                                 src_path),
diff --git a/tests/qemu-iotests/255.out b/tests/qemu-iotests/255.out
index 11a05a5213..2e837cbb5f 100644
--- a/tests/qemu-iotests/255.out
+++ b/tests/qemu-iotests/255.out
@@ -3,8 +3,6 @@ Finishing a commit job with background reads
 
 === Create backing chain and start VM ===
 
-
-
 === Start background read requests ===
 
 === Run a commit job ===
@@ -21,8 +19,6 @@ Closing the VM while a job is being cancelled
 
 === Create images and start VM ===
 
-
-
 wrote 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
diff --git a/tests/qemu-iotests/274 b/tests/qemu-iotests/274
index 080a90f10f..2495e051a2 100755
--- a/tests/qemu-iotests/274
+++ b/tests/qemu-iotests/274
@@ -31,12 +31,11 @@ size_long = 2 * 1024 * 1024
 size_diff = size_long - size_short
 
 def create_chain() -> None:
-    iotests.qemu_img_log('create', '-f', iotests.imgfmt, base,
-                         str(size_long))
-    iotests.qemu_img_log('create', '-f', iotests.imgfmt, '-b', base,
-                         '-F', iotests.imgfmt, mid, str(size_short))
-    iotests.qemu_img_log('create', '-f', iotests.imgfmt, '-b', mid,
-                         '-F', iotests.imgfmt, top, str(size_long))
+    iotests.qemu_img_create('-f', iotests.imgfmt, base, str(size_long))
+    iotests.qemu_img_create('-f', iotests.imgfmt, '-b', base,
+                            '-F', iotests.imgfmt, mid, str(size_short))
+    iotests.qemu_img_create('-f', iotests.imgfmt, '-b', mid,
+                            '-F', iotests.imgfmt, top, str(size_long))
 
     iotests.qemu_io_log('-c', 'write -P 1 0 %d' % size_long, base)
 
@@ -160,9 +159,9 @@ with iotests.FilePath('base') as base, \
             ('off',      '512k', '256k', '500k', '436k')]:
 
         iotests.log('=== preallocation=%s ===' % prealloc)
-        iotests.qemu_img_log('create', '-f', iotests.imgfmt, base, base_size)
-        iotests.qemu_img_log('create', '-f', iotests.imgfmt, '-b', base,
-                             '-F', iotests.imgfmt, top, top_size_old)
+        iotests.qemu_img_create('-f', iotests.imgfmt, base, base_size)
+        iotests.qemu_img_create('-f', iotests.imgfmt, '-b', base,
+                                '-F', iotests.imgfmt, top, top_size_old)
         iotests.qemu_io_log('-c', 'write -P 1 %s 64k' % off, base)
 
         # After this, top_size_old to base_size should be allocated/zeroed.
diff --git a/tests/qemu-iotests/274.out b/tests/qemu-iotests/274.out
index 1ce40d839a..acd8b166a6 100644
--- a/tests/qemu-iotests/274.out
+++ b/tests/qemu-iotests/274.out
@@ -1,7 +1,4 @@
 == Commit tests ==
-
-
-
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
@@ -63,9 +60,6 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing HMP commit (top -> mid) ===
-
-
-
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
@@ -92,9 +86,6 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing QMP active commit (top -> mid) ===
-
-
-
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
@@ -127,9 +118,6 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing qemu-img commit (top -> base) ===
-
-
-
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
@@ -154,9 +142,6 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing QMP active commit (top -> base) ===
-
-
-
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
@@ -190,8 +175,6 @@ read 1048576/1048576 bytes at offset 1048576
 
 == Resize tests ==
 === preallocation=off ===
-
-
 wrote 65536/65536 bytes at offset 5368709120
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
@@ -207,8 +190,6 @@ read 65536/65536 bytes at offset 5368709120
 { "start": 1073741824, "length": 7516192768, "depth": 0, "present": true, "zero": true, "data": false}]
 
 === preallocation=metadata ===
-
-
 wrote 65536/65536 bytes at offset 33285996544
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
@@ -229,8 +210,6 @@ read 65536/65536 bytes at offset 33285996544
 { "start": 34896609280, "length": 536870912, "depth": 0, "present": true, "zero": true, "data": false, "offset": 2685075456}]
 
 === preallocation=falloc ===
-
-
 wrote 65536/65536 bytes at offset 9437184
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
@@ -246,8 +225,6 @@ read 65536/65536 bytes at offset 9437184
 { "start": 5242880, "length": 10485760, "depth": 0, "present": true, "zero": false, "data": true, "offset": 327680}]
 
 === preallocation=full ===
-
-
 wrote 65536/65536 bytes at offset 11534336
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
@@ -263,8 +240,6 @@ read 65536/65536 bytes at offset 11534336
 { "start": 8388608, "length": 4194304, "depth": 0, "present": true, "zero": false, "data": true, "offset": 327680}]
 
 === preallocation=off ===
-
-
 wrote 65536/65536 bytes at offset 259072
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
@@ -281,8 +256,6 @@ read 65536/65536 bytes at offset 259072
 { "start": 262144, "length": 262144, "depth": 0, "present": true, "zero": true, "data": false}]
 
 === preallocation=off ===
-
-
 wrote 65536/65536 bytes at offset 344064
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
@@ -298,8 +271,6 @@ read 65536/65536 bytes at offset 344064
 { "start": 262144, "length": 262144, "depth": 0, "present": true, "zero": true, "data": false}]
 
 === preallocation=off ===
-
-
 wrote 65536/65536 bytes at offset 446464
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
diff --git a/tests/qemu-iotests/280 b/tests/qemu-iotests/280
index 628f3c33ca..5f50500fdb 100755
--- a/tests/qemu-iotests/280
+++ b/tests/qemu-iotests/280
@@ -33,7 +33,7 @@ with iotests.FilePath('base') as base_path , \
      iotests.FilePath('top') as top_path, \
      iotests.VM() as vm:
 
-    iotests.qemu_img_log('create', '-f', iotests.imgfmt, base_path, '64M')
+    iotests.qemu_img_create('-f', iotests.imgfmt, base_path, '64M')
 
     iotests.log('=== Launch VM ===')
     vm.add_object('iothread,id=iothread0')
diff --git a/tests/qemu-iotests/280.out b/tests/qemu-iotests/280.out
index e39164c579..c75f437c00 100644
--- a/tests/qemu-iotests/280.out
+++ b/tests/qemu-iotests/280.out
@@ -1,4 +1,3 @@
-
 === Launch VM ===
 Enabling migration QMP events on VM...
 {"return": {}}
-- 
2.34.1


