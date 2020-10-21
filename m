Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4395294972
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 10:41:46 +0200 (CEST)
Received: from localhost ([::1]:54210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kV9gn-000083-Uk
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 04:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <likejun6@huawei.com>)
 id 1kV8do-0002nB-3p; Wed, 21 Oct 2020 03:34:36 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5711 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <likejun6@huawei.com>)
 id 1kV8dl-0004Je-0p; Wed, 21 Oct 2020 03:34:35 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 04E976EB4376A049350F;
 Wed, 21 Oct 2020 15:34:19 +0800 (CST)
Received: from DESKTOP-IB00AOP.china.huawei.com (10.174.184.163) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Wed, 21 Oct 2020 15:34:12 +0800
From: <likejun6@huawei.com>
To: <qemu-block@nongnu.org>
Subject: [PATCH 2/4] qemu-iotest: add 309 testcase
Date: Wed, 21 Oct 2020 15:33:53 +0800
Message-ID: <20201021073355.2499-3-likejun6@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
In-Reply-To: <20201021073355.2499-1-likejun6@huawei.com>
References: <20201021073355.2499-1-likejun6@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.163]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=likejun6@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 03:34:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 21 Oct 2020 04:40:12 -0400
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
Cc: kwolf@redhat.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, mreitz@redhat.com, likejun <likejun6@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: likejun <likejun6@huawei.com>

Test raw thin provisioned image creation, size and rw

Signed-off-by: likejun <likejun6@huawei.com>
---
 tests/qemu-iotests/309     | 102 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/309.out |  21 ++++++++
 tests/qemu-iotests/group   |   1 +
 3 files changed, 124 insertions(+)
 create mode 100755 tests/qemu-iotests/309
 create mode 100644 tests/qemu-iotests/309.out

diff --git a/tests/qemu-iotests/309 b/tests/qemu-iotests/309
new file mode 100755
index 0000000000..7bbe5a1704
--- /dev/null
+++ b/tests/qemu-iotests/309
@@ -0,0 +1,102 @@
+#!/bin/bash
+#
+# Test raw thin provisioned image creation, size and rw
+#
+# Copyright (C) 2020 Huawei, Inc
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
+owner=zhangshuai13@huawei.com
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1	# failure is the default!
+
+_cleanup()
+{
+	_cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc >/dev/null 2>&1
+. ./common.filter
+
+_supported_fmt qcow2
+_supported_proto file
+_supported_os Linux
+
+_img_info_tmp()
+{
+    if [[ "$1" == "--format-specific" ]]; then
+        local format_specific=1
+        shift
+    else
+        local format_specific=0
+    fi
+
+    discard=0
+    regex_json_spec_start='^ *"format-specific": \{'
+    $QEMU_IMG info "$@" "$TEST_IMG" 2>&1 | \
+        sed -e "s#$IMGPROTO:$TEST_DIR#TEST_DIR#g" \
+            -e "s#$TEST_DIR#TEST_DIR#g" \
+            -e "s#$IMGFMT#IMGFMT#g" \
+            -e "/actual-size/ D" | \
+        while IFS='' read line; do
+            if [[ $format_specific == 1 ]]; then
+                discard=0
+            elif [[ $line == "Format specific information:" ]]; then
+                discard=1
+            elif [[ $line =~ $regex_json_spec_start ]]; then
+                discard=2
+                regex_json_spec_end="^${line%%[^ ]*}\\},? *$"
+            fi
+            if [[ $discard == 0 ]]; then
+                echo "$line"
+            elif [[ $discard == 1 && ! $line ]]; then
+                echo
+                discard=0
+            elif [[ $discard == 2 && $line =~ $regex_json_spec_end ]]; then
+                discard=0
+            fi
+        done
+}
+
+echo "=== Check qemu-img info output ==="
+echo
+size=64M
+
+_make_test_img $size
+_img_info_tmp | _filter_img_info
+
+echo
+echo "== reading whole image =="
+$QEMU_IO -c "read 0 $size" "$TEST_IMG" | _filter_qemu_io
+
+echo
+echo "== rewriting whole image =="
+$QEMU_IO -c "write -P 0xa 0 $size" "$TEST_IMG" | _filter_qemu_io
+
+echo
+echo "== verify pattern =="
+$QEMU_IO -c "read -P 0xa 0 $size" "$TEST_IMG" | _filter_qemu_io
+
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/309.out b/tests/qemu-iotests/309.out
new file mode 100644
index 0000000000..c5e7757a15
--- /dev/null
+++ b/tests/qemu-iotests/309.out
@@ -0,0 +1,21 @@
+QA output created by 309
+=== Check qemu-img info output ===
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
+image: TEST_DIR/t.IMGFMT
+file format: IMGFMT
+virtual size: 64 MiB (67108864 bytes)
+disk size: 196 KiB
+
+== reading whole image ==
+read 67108864/67108864 bytes at offset 0
+64 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+== rewriting whole image ==
+wrote 67108864/67108864 bytes at offset 0
+64 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+== verify pattern ==
+read 67108864/67108864 bytes at offset 0
+64 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+*** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 25a876ef20..632a05b25e 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -316,3 +316,4 @@
 305 rw quick
 307 rw quick export
 308 rw auto quick
+309 rw auto quick
-- 
2.19.1



