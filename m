Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1EF2C47F9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 19:57:40 +0100 (CET)
Received: from localhost ([::1]:51546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khzz1-00067T-Ra
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 13:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1khzxj-00059N-32; Wed, 25 Nov 2020 13:56:19 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:53153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1khzxg-0005MK-0r; Wed, 25 Nov 2020 13:56:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=wuuoCoiCyvTxzTbChFez1Iuvt5RxZWoWeUgR1OXdbbc=; 
 b=IA8EH5yeD4MTzmeZUTwUmrSiQzCqxAI55SJ0tsprhrjO9s6kwaxg8yP6XHb58v/wqBTYrRmXS+pbohF0T486DBbK2FWXYQj/wtpp8PTjXhuHiYl8l9mt6G0O5DtQrT6Bto1FETMkGh8aoRkOOgnjDzJk2MkjWpuHsuvp5MPOPisDXEX35JpDMLq+i4jPEek8vCNDAcT9Sr+iHsNz4AnDW9nYhhnGWripIVWX8jUurHAdDOZyKrzmtIA1FxO1aYzMRixsIpad9zGlnUwC3GDkUcXH+MgUkL03u/SxHTKd+U3rXcq/Ie/Xdq3F0e9KJuTrZeT9tjdKQLZJ+kcQToTh4Q==;
Received: from [213.94.31.64] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1khzxa-0001vs-Lt; Wed, 25 Nov 2020 19:56:10 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1khzxM-0005Kz-SY; Wed, 25 Nov 2020 19:55:56 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] iotests: Add test for the regression fixed in c8bf9a9169
Date: Wed, 25 Nov 2020 19:55:51 +0100
Message-Id: <20201125185551.20475-1-berto@igalia.com>
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
---
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
index 2960dff728..df339f1720 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -316,3 +316,4 @@
 305 rw quick
 307 rw quick export
 309 rw auto quick
+313 rw auto quick
-- 
2.20.1


