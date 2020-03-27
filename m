Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FB0195B84
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 17:50:39 +0100 (CET)
Received: from localhost ([::1]:44442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHsBq-0000fZ-LV
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 12:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jHsAh-0008L1-4V
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:49:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jHsAe-0005FD-NW
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:49:26 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:37759)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jHsAc-000569-AU; Fri, 27 Mar 2020 12:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=3aoTxOHu/mU6pssXK8bm4afNoog0/dWgaF9uiEgl6NQ=; 
 b=quD3TNU9hNiwrgTjb0YUiOpTX/MRaNUGe0hF3RljOlw23LFsq9QIDdOtedTxwM5wEm0PINY4tmBTMpna2DCvx+BuVh53dVwH0JB6ZfyInCEeApGoEtBSaQTK3ohp22iXYAOfsW5vcUYQ/ZdreJNP6giZZjUfjdXAlW2zgEN0K+j+C58Zb6sPbgcykhsf1j1bTIKbeFmPtMYvNUh4Ga3YFYJvTDZqi9w0aKXmikyMt4TVabdxrEj3VmT34VpfuJw8+zXW+gikpxSxypZJ96XmISVb78fXpjBHDEOE6Sg8ztHzLMie7gwzDEBDeWLhW+SFciVQSufHXSAJj87oE5S+Jg==;
Received: from [81.0.35.113] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jHsAZ-000127-Fy; Fri, 27 Mar 2020 17:49:19 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jHsAG-0008CM-1P; Fri, 27 Mar 2020 17:49:00 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] qcow2: Forbid discard in qcow2 v2 images with backing files
Date: Fri, 27 Mar 2020 17:48:57 +0100
Message-Id: <20200327164857.31415-1-berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A discard request deallocates the selected clusters so they read back
as zeroes. This is done by clearing the cluster offset field and
setting QCOW_OFLAG_ZERO in the L2 entry.

This flag is however only supported when qcow_version >= 3. In older
images the cluster is simply deallocated, exposing any possible stale
data from the backing file.

Since discard is an advisory operation it's safer to simply forbid it
in this scenario.

Note that we are adding this check to qcow2_co_pdiscard() and not to
qcow2_cluster_discard() or discard_in_l2_slice() because the last
two are also used by qcow2_snapshot_create() to discard the clusters
used by the VM state. In this case there's no risk of exposing stale
data to the guest and we really want that the clusters are always
discarded.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
v3:
- Rebase and change iotest number
- Show output of qemu-img map in iotest 290 [Kevin]
- Use the l2_offset and rb_offset variables in iotest 060

v2:

- Don't create the image with compat=0.10 in iotest 060 [Max]
- Use $TEST_IMG.base for the backing image name in iotest 289 [Max]
- Add list of unsupported options to iotest 289 [Max]

 block/qcow2.c              |  6 +++
 tests/qemu-iotests/060     | 12 ++---
 tests/qemu-iotests/060.out |  2 -
 tests/qemu-iotests/290     | 94 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/290.out | 57 +++++++++++++++++++++++
 tests/qemu-iotests/group   |  1 +
 6 files changed, 163 insertions(+), 9 deletions(-)
 create mode 100755 tests/qemu-iotests/290
 create mode 100644 tests/qemu-iotests/290.out

diff --git a/block/qcow2.c b/block/qcow2.c
index 2bb536b014..e8cbcc1ec1 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3784,6 +3784,12 @@ static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
     int ret;
     BDRVQcow2State *s = bs->opaque;
 
+    /* If the image does not support QCOW_OFLAG_ZERO then discarding
+     * clusters could expose stale data from the backing file. */
+    if (s->qcow_version < 3 && bs->backing) {
+        return -ENOTSUP;
+    }
+
     if (!QEMU_IS_ALIGNED(offset | bytes, s->cluster_size)) {
         assert(bytes < s->cluster_size);
         /* Ignore partial clusters, except for the special case of the
diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index 043f12904a..32c0ecce9e 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -160,18 +160,16 @@ TEST_IMG=$BACKING_IMG _make_test_img 1G
 
 $QEMU_IO -c 'write 0k 64k' "$BACKING_IMG" | _filter_qemu_io
 
-# compat=0.10 is required in order to make the following discard actually
-# unallocate the sector rather than make it a zero sector - we want COW, after
-# all.
-_make_test_img -o 'compat=0.10' -b "$BACKING_IMG" 1G
+_make_test_img -b "$BACKING_IMG" 1G
 # Write two clusters, the second one enforces creation of an L2 table after
 # the first data cluster.
 $QEMU_IO -c 'write 0k 64k' -c 'write 512M 64k' "$TEST_IMG" | _filter_qemu_io
-# Discard the first cluster. This cluster will soon enough be reallocated and
+# Free the first cluster. This cluster will soon enough be reallocated and
 # used for COW.
-$QEMU_IO -c 'discard 0k 64k' "$TEST_IMG" | _filter_qemu_io
+poke_file "$TEST_IMG" "$l2_offset" "\x00\x00\x00\x00\x00\x00\x00\x00"
+poke_file "$TEST_IMG" "$(($rb_offset+10))" "\x00\x00"
 # Now, corrupt the image by marking the second L2 table cluster as free.
-poke_file "$TEST_IMG" '131084' "\x00\x00" # 0x2000c
+poke_file "$TEST_IMG" "$(($rb_offset+12))" "\x00\x00"
 # Start a write operation requiring COW on the image stopping it right before
 # doing the read; then, trigger the corruption prevention by writing anything to
 # any unallocated cluster, leading to an attempt to overwrite the second L2
diff --git a/tests/qemu-iotests/060.out b/tests/qemu-iotests/060.out
index d27692a33c..09caaea865 100644
--- a/tests/qemu-iotests/060.out
+++ b/tests/qemu-iotests/060.out
@@ -105,8 +105,6 @@ wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 536870912
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-discard 65536/65536 bytes at offset 0
-64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 qcow2: Marking image as corrupt: Preventing invalid write on metadata (overlaps with active L2 table); further corruption events will be suppressed
 blkdebug: Suspended request '0'
 write failed: Input/output error
diff --git a/tests/qemu-iotests/290 b/tests/qemu-iotests/290
new file mode 100755
index 0000000000..e41d642c7f
--- /dev/null
+++ b/tests/qemu-iotests/290
@@ -0,0 +1,94 @@
+#!/usr/bin/env bash
+#
+# Test how 'qemu-io -c discard' behaves on v2 and v3 qcow2 images
+#
+# Copyright (C) 2020 Igalia, S.L.
+# Author: Alberto Garcia <berto@igalia.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+# creator
+owner=berto@igalia.com
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1    # failure is the default!
+
+_cleanup()
+{
+    _cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+
+_supported_fmt qcow2
+_supported_proto file
+_supported_os Linux
+_unsupported_imgopts 'compat=0.10' refcount_bits data_file
+
+echo
+echo "### Test 'qemu-io -c discard' on a QCOW2 image without a backing file"
+echo
+for qcow2_compat in 0.10 1.1; do
+    echo "# Create an image with compat=$qcow2_compat without a backing file"
+    _make_test_img -o "compat=$qcow2_compat" 128k
+
+    echo "# Fill all clusters with data and then discard them"
+    $QEMU_IO -c 'write -P 0x01 0 128k' "$TEST_IMG" | _filter_qemu_io
+    $QEMU_IO -c 'discard 0 128k' "$TEST_IMG" | _filter_qemu_io
+
+    echo "# Read the data from the discarded clusters"
+    $QEMU_IO -c 'read -P 0x00 0 128k' "$TEST_IMG" | _filter_qemu_io
+done
+
+echo
+echo "### Test 'qemu-io -c discard' on a QCOW2 image with a backing file"
+echo
+
+echo "# Create a backing image and fill it with data"
+BACKING_IMG="$TEST_IMG.base"
+TEST_IMG="$BACKING_IMG" _make_test_img 128k
+$QEMU_IO -c 'write -P 0xff 0 128k' "$BACKING_IMG" | _filter_qemu_io
+
+for qcow2_compat in 0.10 1.1; do
+    echo "# Create an image with compat=$qcow2_compat and a backing file"
+    _make_test_img -o "compat=$qcow2_compat" -b "$BACKING_IMG"
+
+    echo "# Fill all clusters with data and then discard them"
+    $QEMU_IO -c 'write -P 0x01 0 128k' "$TEST_IMG" | _filter_qemu_io
+    $QEMU_IO -c 'discard 0 128k' "$TEST_IMG" | _filter_qemu_io
+
+    echo "# Read the data from the discarded clusters"
+    if [ "$qcow2_compat" = "1.1" ]; then
+        # In qcow2 v3 clusters are zeroed (with QCOW_OFLAG_ZERO)
+        $QEMU_IO -c 'read -P 0x00 0 128k' "$TEST_IMG" | _filter_qemu_io
+    else
+        # In qcow2 v2 if there's a backing image we cannot zero the clusters
+        # without exposing the backing file data so discard does nothing
+        $QEMU_IO -c 'read -P 0x01 0 128k' "$TEST_IMG" | _filter_qemu_io
+    fi
+
+    echo "# Output of qemu-img map"
+    $QEMU_IMG map "$TEST_IMG" | _filter_testdir
+done
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/290.out b/tests/qemu-iotests/290.out
new file mode 100644
index 0000000000..8d46e8382f
--- /dev/null
+++ b/tests/qemu-iotests/290.out
@@ -0,0 +1,57 @@
+QA output created by 290
+
+### Test 'qemu-io -c discard' on a QCOW2 image without a backing file
+
+# Create an image with compat=0.10 without a backing file
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=131072
+# Fill all clusters with data and then discard them
+wrote 131072/131072 bytes at offset 0
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+discard 131072/131072 bytes at offset 0
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+# Read the data from the discarded clusters
+read 131072/131072 bytes at offset 0
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+# Create an image with compat=1.1 without a backing file
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=131072
+# Fill all clusters with data and then discard them
+wrote 131072/131072 bytes at offset 0
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+discard 131072/131072 bytes at offset 0
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+# Read the data from the discarded clusters
+read 131072/131072 bytes at offset 0
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+### Test 'qemu-io -c discard' on a QCOW2 image with a backing file
+
+# Create a backing image and fill it with data
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=131072
+wrote 131072/131072 bytes at offset 0
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+# Create an image with compat=0.10 and a backing file
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=131072 backing_file=TEST_DIR/t.IMGFMT.base
+# Fill all clusters with data and then discard them
+wrote 131072/131072 bytes at offset 0
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+discard 131072/131072 bytes at offset 0
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+# Read the data from the discarded clusters
+read 131072/131072 bytes at offset 0
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+# Output of qemu-img map
+Offset          Length          Mapped to       File
+0               0x20000         0x50000         TEST_DIR/t.qcow2
+# Create an image with compat=1.1 and a backing file
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=131072 backing_file=TEST_DIR/t.IMGFMT.base
+# Fill all clusters with data and then discard them
+wrote 131072/131072 bytes at offset 0
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+discard 131072/131072 bytes at offset 0
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+# Read the data from the discarded clusters
+read 131072/131072 bytes at offset 0
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+# Output of qemu-img map
+Offset          Length          Mapped to       File
+*** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 79c6dfc85d..435dccd5af 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -296,3 +296,4 @@
 286 rw quick
 288 quick
 289 rw quick
+290 rw auto quick
-- 
2.20.1


