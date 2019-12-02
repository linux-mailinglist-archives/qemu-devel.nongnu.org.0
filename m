Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE110E938
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 11:59:59 +0100 (CET)
Received: from localhost ([::1]:33938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibjQs-0002df-9d
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 05:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ibjOB-0007es-7I
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 05:57:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ibjO9-0001Wj-TV
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 05:57:11 -0500
Received: from relay.sw.ru ([185.231.240.75]:40854)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ibjO9-0001Vo-Lo; Mon, 02 Dec 2019 05:57:09 -0500
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ibjO2-0003e4-Sn; Mon, 02 Dec 2019 13:57:02 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v11 3/3] tests/qemu-iotests: add case to write compressed data
 of multiple clusters
Date: Mon,  2 Dec 2019 13:57:02 +0300
Message-Id: <1575284222-548831-4-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575284222-548831-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1575284222-548831-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the case to the iotest #214 that checks possibility of writing
compressed data of more than one cluster size. The test case involves
the compress filter driver showing a sample usage of that.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/214     | 43 +++++++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/214.out | 14 ++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/tests/qemu-iotests/214 b/tests/qemu-iotests/214
index 21ec8a2..0b6ea0b 100755
--- a/tests/qemu-iotests/214
+++ b/tests/qemu-iotests/214
@@ -89,6 +89,49 @@ _check_test_img -r all
 $QEMU_IO -c "read  -P 0x11  0 4M" "$TEST_IMG" 2>&1 | _filter_qemu_io | _filter_testdir
 $QEMU_IO -c "read  -P 0x22 4M 4M" "$TEST_IMG" 2>&1 | _filter_qemu_io | _filter_testdir
 
+echo
+echo "=== Write compressed data of multiple clusters ==="
+echo
+cluster_size=0x10000
+_make_test_img 2M -o cluster_size=$cluster_size
+
+echo "Write uncompressed data:"
+let data_size="8 * $cluster_size"
+$QEMU_IO -c "write -P 0xaa 0 $data_size" "$TEST_IMG" \
+         2>&1 | _filter_qemu_io | _filter_testdir
+sizeA=$($QEMU_IMG info --output=json "$TEST_IMG" |
+        sed -n '/"actual-size":/ s/[^0-9]//gp')
+
+_make_test_img 2M -o cluster_size=$cluster_size
+echo "Write compressed data:"
+let data_size="3 * $cluster_size + $cluster_size / 2"
+# Set compress on. That will align the written data
+# by the cluster size and will write them compressed.
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT \
+$QEMU_IO -c "write -P 0xbb 0 $data_size" --image-opts \
+         "driver=compress,file.driver=$IMGFMT,file.file.driver=file,file.file.filename=$TEST_IMG" \
+         2>&1 | _filter_qemu_io | _filter_testdir
+
+let offset="4 * $cluster_size + $cluster_size / 4"
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT \
+$QEMU_IO -c "write -P 0xcc $offset $data_size" "json:{\
+    'driver': 'compress',
+    'file': {'driver': '$IMGFMT',
+             'file': {'driver': 'file',
+                      'filename': '$TEST_IMG'}}}" | \
+                          _filter_qemu_io | _filter_testdir
+
+sizeB=$($QEMU_IMG info --output=json "$TEST_IMG" |
+        sed -n '/"actual-size":/ s/[^0-9]//gp')
+
+if [ $sizeA -le $sizeB ]
+then
+    echo "Compression ERROR"
+fi
+
+$QEMU_IMG check --output=json "$TEST_IMG" |
+          sed -n 's/,$//; /"compressed-clusters":/ s/^ *//p'
+
 # success, all done
 echo '*** done'
 rm -f $seq.full
diff --git a/tests/qemu-iotests/214.out b/tests/qemu-iotests/214.out
index 0fcd8dc..9fc6728 100644
--- a/tests/qemu-iotests/214.out
+++ b/tests/qemu-iotests/214.out
@@ -32,4 +32,18 @@ read 4194304/4194304 bytes at offset 0
 4 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 4194304/4194304 bytes at offset 4194304
 4 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+=== Write compressed data of multiple clusters ===
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=2097152
+Write uncompressed data:
+wrote 524288/524288 bytes at offset 0
+512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=2097152
+Write compressed data:
+wrote 229376/229376 bytes at offset 0
+224 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 229376/229376 bytes at offset 278528
+224 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+"compressed-clusters": 8
 *** done
-- 
1.8.3.1


