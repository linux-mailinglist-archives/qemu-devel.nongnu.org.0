Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6E92F376B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:44:13 +0100 (CET)
Received: from localhost ([::1]:35940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNiG-0003Zx-2u
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kzN7h-0001Ct-Hv; Tue, 12 Jan 2021 12:06:26 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:42030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kzN7c-0001BH-Je; Tue, 12 Jan 2021 12:06:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=yiA3qtphvoIAezpn5/htIwuf9PdVO2omXZL721Z1hEg=; 
 b=f0s+H5ZXjWGTLsuhSuwwIQxf51oN+B/p7N0YuFclbL6ndmMfOU/YvsUEKF7vwRUh+zQkGPBX5qkTdF+/bQMIxwZGdVZ0/M3wkVq4e5QK+NFfvbKOwFsIgz4OV3Qykfw9qhzBHj8GGcGv9hJHVA6UoNgyOQz825CprorKKLBXZ+KEblqEEexxM/OU5Q6xkB7/K2sNHv6qVn1zCnjoqV8lLEMNyfwdjnQ2rO4XW3J77elVMQ0MfUB8v2vyGCI4L9YP3rGRWi5fvvL9sWCu9XeQ+VGy24SLMzR9fqUtKyFZozAlFKt1jk35Fpm9NiK93jqnApnMBbUg4gQE3Xca7BiTAA==;
Received: from [213.94.31.64] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1kzN7F-0003p7-3K; Tue, 12 Jan 2021 18:05:57 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1kzN72-0000ln-4b; Tue, 12 Jan 2021 18:05:44 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] iotests: Add test for the regression fixed in c8bf9a9169
Date: Tue, 12 Jan 2021 18:05:40 +0100
Message-Id: <20210112170540.2912-1-berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alberto Garcia <berto@igalia.com>
Suggested-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
v2: Rebase on top of the latest master

 tests/qemu-iotests/313     | 103 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/313.out |  29 +++++++++++
 tests/qemu-iotests/group   |   1 +
 3 files changed, 133 insertions(+)
 create mode 100755 tests/qemu-iotests/313
 create mode 100644 tests/qemu-iotests/313.out

diff --git a/tests/qemu-iotests/313 b/tests/qemu-iotests/313
new file mode 100755
index 0000000000..0a5202ad49
--- /dev/null
+++ b/tests/qemu-iotests/313
@@ -0,0 +1,103 @@
+#!/usr/bin/env bash
+#
+# Test for the regression fixed in commit c8bf9a9169
+#
+# Copyright (C) 2020 Igalia, S.L.
+# Author: Alberto Garcia <berto@igalia.com>
+# Based on a test case by Maxim Levitsky <mlevitsk@redhat.com>
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
+_unsupported_imgopts cluster_size refcount_bits extended_l2 compat=0.10 data_file
+
+# The cluster size must be at least the granularity of the mirror job (4KB)
+# Note that larger cluster sizes will produce very large images (several GBs)
+cluster_size=4096
+refcount_bits=64 # Make it equal to the L2 entry size for convenience
+options="cluster_size=${cluster_size},refcount_bits=${refcount_bits}"
+
+# Number of refcount entries per refcount blocks
+ref_entries=$(( ${cluster_size} * 8 / ${refcount_bits} ))
+
+# Number of data clusters needed to fill a refcount block
+# Equals ${ref_entries} minus two (one L2 table and one refcount block)
+data_clusters_per_refblock=$(( ${ref_entries} - 2 ))
+
+# Number of entries in the refcount cache
+ref_blocks=4
+
+# Write enough data clusters to fill the refcount cache and allocate
+# one more refcount block.
+# Subtract 3 clusters from the total: qcow2 header, refcount table, L1 table
+total_data_clusters=$(( ${data_clusters_per_refblock} * ${ref_blocks} + 1 - 3 ))
+
+# Total size to write in bytes
+total_size=$(( ${total_data_clusters} * ${cluster_size} ))
+
+echo
+echo '### Create the image'
+echo
+TEST_IMG_FILE=$TEST_IMG.base _make_test_img -o $options $total_size | _filter_img_create_size
+
+echo
+echo '### Write data to allocate more refcount blocks than the cache can hold'
+echo
+$QEMU_IO -c "write -P 1 0 $total_size" $TEST_IMG.base | _filter_qemu_io
+
+echo
+echo '### Create an overlay'
+echo
+_make_test_img -F $IMGFMT -b $TEST_IMG.base -o $options | _filter_img_create_size
+
+echo
+echo '### Fill the overlay with zeroes'
+echo
+$QEMU_IO -c "write -z 0 $total_size" $TEST_IMG | _filter_qemu_io
+
+echo
+echo '### Commit changes to the base image'
+echo
+$QEMU_IMG commit $TEST_IMG
+
+echo
+echo '### Check the base image'
+echo
+$QEMU_IMG check $TEST_IMG.base
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/313.out b/tests/qemu-iotests/313.out
new file mode 100644
index 0000000000..adb9f7bd95
--- /dev/null
+++ b/tests/qemu-iotests/313.out
@@ -0,0 +1,29 @@
+QA output created by 313
+
+### Create the image
+
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=SIZE
+
+### Write data to allocate more refcount blocks than the cache can hold
+
+wrote 8347648/8347648 bytes at offset 0
+7.961 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+### Create an overlay
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=SIZE backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
+
+### Fill the overlay with zeroes
+
+wrote 8347648/8347648 bytes at offset 0
+7.961 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+### Commit changes to the base image
+
+Image committed.
+
+### Check the base image
+
+No errors were found on the image.
+Image end offset: 8396800
+*** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index bc5bc324fe..26c9c67c45 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -319,3 +319,4 @@
 308 rw
 309 rw auto quick
 312 rw quick
+313 rw auto quick
-- 
2.20.1


