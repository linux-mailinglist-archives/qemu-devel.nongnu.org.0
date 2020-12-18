Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C232DE685
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:28:07 +0100 (CET)
Received: from localhost ([::1]:53308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHfq-0003DT-1l
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHSA-0002tr-Br
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHS6-0005a8-Um
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNDKJfS0v1GZqQkI8LDVSyWXYQEb7GcuSlqNCJzmHrs=;
 b=MTU1EmbkdjLOBbN391/8JI87XN56me+m3YAj7G/Al64Z6M2HBd+vJhDcAgfLXiTTPJFcz8
 uYk9SLZgnpGQpUaWyctpEvRQQu6NBY52Z/PQ2jlWXY1+xnTvon+5GqTggQphmmm4NtE6yM
 pdfUtt2eIGUl+L69StGT5WtdMI+vcFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-9JmXfpuePOSwjnIDrao9-Q-1; Fri, 18 Dec 2020 10:13:51 -0500
X-MC-Unique: 9JmXfpuePOSwjnIDrao9-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CC3259;
 Fri, 18 Dec 2020 15:13:50 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 027682C161;
 Fri, 18 Dec 2020 15:13:49 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 26/30] quorum: Implement bdrv_co_block_status()
Date: Fri, 18 Dec 2020 16:12:45 +0100
Message-Id: <20201218151249.715731-27-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

The quorum driver does not implement bdrv_co_block_status() and
because of that it always reports to contain data even if all its
children are known to be empty.

One consequence of this is that if we for example create a quorum with
a size of 10GB and we mirror it to a new image the operation will
write 10GB of actual zeroes to the destination image wasting a lot of
time and disk space.

Since a quorum has an arbitrary number of children of potentially
different formats there is no way to report all possible allocation
status flags in a way that makes sense, so this implementation only
reports when a given region is known to contain zeroes
(BDRV_BLOCK_ZERO) or not (BDRV_BLOCK_DATA).

If all children agree that a region contains zeroes then we can return
BDRV_BLOCK_ZERO using the smallest size reported by the children
(because all agree that a region of at least that size contains
zeroes).

If at least one child disagrees we have to return BDRV_BLOCK_DATA.
In this case we use the largest of the sizes reported by the children
that didn't return BDRV_BLOCK_ZERO (because we know that there won't
be an agreement for at least that size).

Signed-off-by: Alberto Garcia <berto@igalia.com>
Tested-by: Tao Xu <tao3.xu@intel.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <db83149afcf0f793effc8878089d29af4c46ffe1.1605286097.git.berto@igalia.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/quorum.c             |  52 +++++++++++++
 tests/qemu-iotests/312     | 148 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/312.out |  67 +++++++++++++++++
 tests/qemu-iotests/group   |   1 +
 4 files changed, 268 insertions(+)
 create mode 100755 tests/qemu-iotests/312
 create mode 100644 tests/qemu-iotests/312.out

diff --git a/block/quorum.c b/block/quorum.c
index 4b08a199b7..ae62b206c9 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -18,6 +18,7 @@
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "block/block_int.h"
+#include "block/coroutines.h"
 #include "block/qdict.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-block.h"
@@ -1179,6 +1180,56 @@ static void quorum_child_perm(BlockDriverState *bs, BdrvChild *c,
              | DEFAULT_PERM_UNCHANGED;
 }
 
+/*
+ * Each one of the children can report different status flags even
+ * when they contain the same data, so what this function does is
+ * return BDRV_BLOCK_ZERO if *all* children agree that a certain
+ * region contains zeroes, and BDRV_BLOCK_DATA otherwise.
+ */
+static int coroutine_fn quorum_co_block_status(BlockDriverState *bs,
+                                               bool want_zero,
+                                               int64_t offset, int64_t count,
+                                               int64_t *pnum, int64_t *map,
+                                               BlockDriverState **file)
+{
+    BDRVQuorumState *s = bs->opaque;
+    int i, ret;
+    int64_t pnum_zero = count;
+    int64_t pnum_data = 0;
+
+    for (i = 0; i < s->num_children; i++) {
+        int64_t bytes;
+        ret = bdrv_co_common_block_status_above(s->children[i]->bs, NULL, false,
+                                                want_zero, offset, count,
+                                                &bytes, NULL, NULL, NULL);
+        if (ret < 0) {
+            quorum_report_bad(QUORUM_OP_TYPE_READ, offset, count,
+                              s->children[i]->bs->node_name, ret);
+            pnum_data = count;
+            break;
+        }
+        /*
+         * Even if all children agree about whether there are zeroes
+         * or not at @offset they might disagree on the size, so use
+         * the smallest when reporting BDRV_BLOCK_ZERO and the largest
+         * when reporting BDRV_BLOCK_DATA.
+         */
+        if (ret & BDRV_BLOCK_ZERO) {
+            pnum_zero = MIN(pnum_zero, bytes);
+        } else {
+            pnum_data = MAX(pnum_data, bytes);
+        }
+    }
+
+    if (pnum_data) {
+        *pnum = pnum_data;
+        return BDRV_BLOCK_DATA;
+    } else {
+        *pnum = pnum_zero;
+        return BDRV_BLOCK_ZERO;
+    }
+}
+
 static const char *const quorum_strong_runtime_opts[] = {
     QUORUM_OPT_VOTE_THRESHOLD,
     QUORUM_OPT_BLKVERIFY,
@@ -1197,6 +1248,7 @@ static BlockDriver bdrv_quorum = {
     .bdrv_close                         = quorum_close,
     .bdrv_gather_child_options          = quorum_gather_child_options,
     .bdrv_dirname                       = quorum_dirname,
+    .bdrv_co_block_status               = quorum_co_block_status,
 
     .bdrv_co_flush_to_disk              = quorum_co_flush,
 
diff --git a/tests/qemu-iotests/312 b/tests/qemu-iotests/312
new file mode 100755
index 0000000000..1b08f1552f
--- /dev/null
+++ b/tests/qemu-iotests/312
@@ -0,0 +1,148 @@
+#!/usr/bin/env bash
+#
+# Test drive-mirror with quorum
+#
+# The goal of this test is to check how the quorum driver reports
+# regions that are known to read as zeroes (BDRV_BLOCK_ZERO). The idea
+# is that drive-mirror will try the efficient representation of zeroes
+# in the destination image instead of writing actual zeroes.
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
+status=1	# failure is the default!
+
+_cleanup()
+{
+    _rm_test_img "$TEST_IMG.0"
+    _rm_test_img "$TEST_IMG.1"
+    _rm_test_img "$TEST_IMG.2"
+    _rm_test_img "$TEST_IMG.3"
+    _cleanup_qemu
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+. ./common.qemu
+
+_supported_fmt qcow2
+_supported_proto file
+_supported_os Linux
+_unsupported_imgopts cluster_size data_file
+
+echo
+echo '### Create all images' # three source (quorum), one destination
+echo
+TEST_IMG="$TEST_IMG.0" _make_test_img -o cluster_size=64k 10M
+TEST_IMG="$TEST_IMG.1" _make_test_img -o cluster_size=64k 10M
+TEST_IMG="$TEST_IMG.2" _make_test_img -o cluster_size=64k 10M
+TEST_IMG="$TEST_IMG.3" _make_test_img -o cluster_size=64k 10M
+
+quorum="driver=raw,file.driver=quorum,file.vote-threshold=2"
+quorum="$quorum,file.children.0.file.filename=$TEST_IMG.0"
+quorum="$quorum,file.children.1.file.filename=$TEST_IMG.1"
+quorum="$quorum,file.children.2.file.filename=$TEST_IMG.2"
+quorum="$quorum,file.children.0.driver=$IMGFMT"
+quorum="$quorum,file.children.1.driver=$IMGFMT"
+quorum="$quorum,file.children.2.driver=$IMGFMT"
+
+echo
+echo '### Output of qemu-img map (empty quorum)'
+echo
+$QEMU_IMG map --image-opts $quorum | _filter_qemu_img_map
+
+# Now we write data to the quorum. All three images will read as
+# zeroes in all cases, but with different ways to represent them
+# (unallocated clusters, zero clusters, data clusters with zeroes)
+# that will have an effect on how the data will be mirrored and the
+# output of qemu-img map on the resulting image.
+echo
+echo '### Write data to the quorum'
+echo
+# Test 1: data regions surrounded by unallocated clusters.
+# Three data regions, the largest one (0x30000) will be picked, end result:
+# offset 0x10000, length 0x30000 -> data
+$QEMU_IO -c "write -P 0 $((0x10000)) $((0x10000))" "$TEST_IMG.0" | _filter_qemu_io
+$QEMU_IO -c "write -P 0 $((0x10000)) $((0x30000))" "$TEST_IMG.1" | _filter_qemu_io
+$QEMU_IO -c "write -P 0 $((0x10000)) $((0x20000))" "$TEST_IMG.2" | _filter_qemu_io
+
+# Test 2: zero regions surrounded by data clusters.
+# First we allocate the data clusters.
+$QEMU_IO -c "open -o $quorum" -c "write -P 0 $((0x100000)) $((0x40000))" | _filter_qemu_io
+
+# Three zero regions, the smallest one (0x10000) will be picked, end result:
+# offset 0x100000, length 0x10000 -> data
+# offset 0x110000, length 0x10000 -> zeroes
+# offset 0x120000, length 0x20000 -> data
+$QEMU_IO -c "write -z $((0x110000)) $((0x10000))" "$TEST_IMG.0" | _filter_qemu_io
+$QEMU_IO -c "write -z $((0x110000)) $((0x30000))" "$TEST_IMG.1" | _filter_qemu_io
+$QEMU_IO -c "write -z $((0x110000)) $((0x20000))" "$TEST_IMG.2" | _filter_qemu_io
+
+# Test 3: zero clusters surrounded by unallocated clusters.
+# Everything reads as zeroes, no effect on the end result.
+$QEMU_IO -c "write -z $((0x150000)) $((0x10000))" "$TEST_IMG.0" | _filter_qemu_io
+$QEMU_IO -c "write -z $((0x150000)) $((0x30000))" "$TEST_IMG.1" | _filter_qemu_io
+$QEMU_IO -c "write -z $((0x150000)) $((0x20000))" "$TEST_IMG.2" | _filter_qemu_io
+
+# Test 4: mix of data and zero clusters.
+# The zero region will be ignored in favor of the largest data region
+# (0x20000), end result:
+# offset 0x200000, length 0x20000 -> data
+$QEMU_IO -c "write -P 0 $((0x200000)) $((0x10000))" "$TEST_IMG.0" | _filter_qemu_io
+$QEMU_IO -c "write -z   $((0x200000)) $((0x30000))" "$TEST_IMG.1" | _filter_qemu_io
+$QEMU_IO -c "write -P 0 $((0x200000)) $((0x20000))" "$TEST_IMG.2" | _filter_qemu_io
+
+echo
+echo '### Launch the drive-mirror job'
+echo
+qemu_comm_method="qmp" _launch_qemu -drive if=virtio,"$quorum"
+h=$QEMU_HANDLE
+_send_qemu_cmd $h "{ 'execute': 'qmp_capabilities' }" 'return'
+
+_send_qemu_cmd $h \
+    "{'execute': 'drive-mirror',
+                 'arguments': {'device': 'virtio0',
+                               'format': '$IMGFMT',
+                               'target': '$TEST_IMG.3',
+                               'sync':   'full',
+                               'mode':   'existing' }}"    \
+     "BLOCK_JOB_READY.*virtio0"
+
+_send_qemu_cmd $h \
+    "{ 'execute': 'block-job-complete',
+       'arguments': { 'device': 'virtio0' } }" \
+    'BLOCK_JOB_COMPLETED'
+
+_send_qemu_cmd $h "{ 'execute': 'quit' }" ''
+
+echo
+echo '### Output of qemu-img map (destination image)'
+echo
+$QEMU_IMG map "$TEST_IMG.3" | _filter_qemu_img_map
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/312.out b/tests/qemu-iotests/312.out
new file mode 100644
index 0000000000..4ae749175b
--- /dev/null
+++ b/tests/qemu-iotests/312.out
@@ -0,0 +1,67 @@
+QA output created by 312
+
+### Create all images
+
+Formatting 'TEST_DIR/t.IMGFMT.0', fmt=IMGFMT size=10485760
+Formatting 'TEST_DIR/t.IMGFMT.1', fmt=IMGFMT size=10485760
+Formatting 'TEST_DIR/t.IMGFMT.2', fmt=IMGFMT size=10485760
+Formatting 'TEST_DIR/t.IMGFMT.3', fmt=IMGFMT size=10485760
+
+### Output of qemu-img map (empty quorum)
+
+Offset          Length          File
+
+### Write data to the quorum
+
+wrote 65536/65536 bytes at offset 65536
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 196608/196608 bytes at offset 65536
+192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 131072/131072 bytes at offset 65536
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 262144/262144 bytes at offset 1048576
+256 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 1114112
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 196608/196608 bytes at offset 1114112
+192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 131072/131072 bytes at offset 1114112
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 1376256
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 196608/196608 bytes at offset 1376256
+192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 131072/131072 bytes at offset 1376256
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 2097152
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 196608/196608 bytes at offset 2097152
+192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 131072/131072 bytes at offset 2097152
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+### Launch the drive-mirror job
+
+{ 'execute': 'qmp_capabilities' }
+{"return": {}}
+{'execute': 'drive-mirror', 'arguments': {'device': 'virtio0', 'format': 'IMGFMT', 'target': 'TEST_DIR/t.IMGFMT.3', 'sync': 'full', 'mode': 'existing' }}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "virtio0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "virtio0"}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "virtio0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_READY", "data": {"device": "virtio0", "len": 10485760, "offset": 10485760, "speed": 0, "type": "mirror"}}
+{ 'execute': 'block-job-complete', 'arguments': { 'device': 'virtio0' } }
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "virtio0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "virtio0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "virtio0", "len": 10485760, "offset": 10485760, "speed": 0, "type": "mirror"}}
+{ 'execute': 'quit' }
+
+### Output of qemu-img map (destination image)
+
+Offset          Length          File
+0x10000         0x30000         TEST_DIR/t.IMGFMT.3
+0x100000        0x10000         TEST_DIR/t.IMGFMT.3
+0x120000        0x20000         TEST_DIR/t.IMGFMT.3
+0x200000        0x20000         TEST_DIR/t.IMGFMT.3
+*** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 614d58369e..e4fb6327ae 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -318,3 +318,4 @@
 307 rw quick export
 308 rw
 309 rw auto quick
+312 rw auto quick
-- 
2.29.2


