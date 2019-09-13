Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4741B24A1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 19:30:41 +0200 (CEST)
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8pP6-0004ey-Kt
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 13:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43021)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i8pMW-0002Cz-52
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 13:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i8pMU-0004Cg-Hv
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 13:28:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39134)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1i8pMQ-00046F-VJ; Fri, 13 Sep 2019 13:27:55 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4949A308FBFC;
 Fri, 13 Sep 2019 17:27:54 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14CCB5C22C;
 Fri, 13 Sep 2019 17:27:51 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Sep 2019 20:27:41 +0300
Message-Id: <20190913172741.5662-4-mlevitsk@redhat.com>
In-Reply-To: <20190913172741.5662-1-mlevitsk@redhat.com>
References: <20190913172741.5662-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 13 Sep 2019 17:27:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 3/3] qemu-iotests: Add test for bz #1745922
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-stable <qemu-stable@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/263     | 91 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/263.out | 40 +++++++++++++++++
 tests/qemu-iotests/group   |  1 +
 3 files changed, 132 insertions(+)
 create mode 100755 tests/qemu-iotests/263
 create mode 100644 tests/qemu-iotests/263.out

diff --git a/tests/qemu-iotests/263 b/tests/qemu-iotests/263
new file mode 100755
index 0000000000..d2c030fae9
--- /dev/null
+++ b/tests/qemu-iotests/263
@@ -0,0 +1,91 @@
+#!/usr/bin/env bash
+#
+# Test encrypted write that crosses cluster boundary of two unallocated clusters
+# Based on 188
+#
+# Copyright (C) 2019 Red Hat, Inc.
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
+owner=mlevitsk@redhat.com
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
+. ./common.rc
+. ./common.filter
+
+_supported_fmt qcow2
+_supported_proto generic
+_supported_os Linux
+
+
+size=1M
+
+SECRET="secret,id=sec0,data=astrochicken"
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
+
+
+_run_test()
+{
+	echo "== reading the whole image =="
+	$QEMU_IO --object $SECRET -c "read -P 0 0 $size" --image-opts "$1" | _filter_qemu_io | _filter_testdir
+
+	echo
+	echo "== write two 512 byte sectors on a cluster boundary =="
+	$QEMU_IO --object $SECRET -c "write -P 0xAA 0xFE00 0x400" --image-opts "$1" | _filter_qemu_io | _filter_testdir
+
+	echo
+	echo "== verify that the rest of the image is not changed =="
+	$QEMU_IO --object $SECRET -c "read -P 0x00 0x00000 0xFE00" --image-opts "$1" | _filter_qemu_io | _filter_testdir
+	$QEMU_IO --object $SECRET -c "read -P 0xAA 0x0FE00 0x400" --image-opts "$1" | _filter_qemu_io | _filter_testdir
+	$QEMU_IO --object $SECRET -c "read -P 0x00 0x10200 0xEFE00" --image-opts "$1" | _filter_qemu_io | _filter_testdir
+
+}
+
+
+echo
+echo "testing LUKS qcow2 encryption"
+echo
+
+_make_test_img --object $SECRET -o "encrypt.format=luks,encrypt.key-secret=sec0,encrypt.iter-time=10,cluster_size=64K" $size
+_run_test "driver=$IMGFMT,encrypt.key-secret=sec0,file.filename=$TEST_IMG"
+_cleanup_test_img
+
+echo
+echo "testing legacy AES qcow2 encryption"
+echo
+
+
+_make_test_img --object $SECRET -o "encrypt.format=aes,encrypt.key-secret=sec0,cluster_size=64K" $size
+_run_test "driver=$IMGFMT,encrypt.key-secret=sec0,file.filename=$TEST_IMG"
+_cleanup_test_img
+
+
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/263.out b/tests/qemu-iotests/263.out
new file mode 100644
index 0000000000..0c982c55cb
--- /dev/null
+++ b/tests/qemu-iotests/263.out
@@ -0,0 +1,40 @@
+QA output created by 263
+
+testing LUKS qcow2 encryption
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 encrypt.format=luks encrypt.key-secret=sec0 encrypt.iter-time=10
+== reading the whole image ==
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+== write two 512 byte sectors on a cluster boundary ==
+wrote 1024/1024 bytes at offset 65024
+1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+== verify that the rest of the image is not changed ==
+read 65024/65024 bytes at offset 0
+63.500 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1024/1024 bytes at offset 65024
+1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 982528/982528 bytes at offset 66048
+959.500 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+testing legacy AES qcow2 encryption
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 encrypt.format=aes encrypt.key-secret=sec0
+== reading the whole image ==
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+== write two 512 byte sectors on a cluster boundary ==
+wrote 1024/1024 bytes at offset 65024
+1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+== verify that the rest of the image is not changed ==
+read 65024/65024 bytes at offset 0
+63.500 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1024/1024 bytes at offset 65024
+1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 982528/982528 bytes at offset 66048
+959.500 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+*** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 6082c74806..5d3da937e4 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -274,5 +274,6 @@
 257 rw
 258 rw quick
 262 rw quick migration
+263 rw quick
 265 rw auto quick
 266 rw quick
-- 
2.17.2


