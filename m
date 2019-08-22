Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B59399938
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 18:32:55 +0200 (CEST)
Received: from localhost ([::1]:45598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0q18-00055u-EI
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 12:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i0pv7-0001FA-Bs
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 12:26:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i0pv4-0001Ck-Ri
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 12:26:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57660)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i0puw-00015K-Fo; Thu, 22 Aug 2019 12:26:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CA1333082D9E;
 Thu, 22 Aug 2019 16:26:25 +0000 (UTC)
Received: from localhost (unknown [10.40.205.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63F595C226;
 Thu, 22 Aug 2019 16:26:25 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 22 Aug 2019 18:26:18 +0200
Message-Id: <20190822162618.27670-3-mreitz@redhat.com>
In-Reply-To: <20190822162618.27670-1-mreitz@redhat.com>
References: <20190822162618.27670-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 22 Aug 2019 16:26:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/2] iotests: Test reverse sub-cluster qcow2
 writes
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
 =?UTF-8?q?Luk=C3=A1=C5=A1=20Doktor?= <ldoktor@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This exercises the regression introduced in commit
50ba5b2d994853b38fed10e0841b119da0f8b8e5.  On my machine, it has close
to a 50 % false-negative rate, but that should still be sufficient to
test the fix.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/265     | 67 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/265.out |  6 ++++
 tests/qemu-iotests/group   |  1 +
 3 files changed, 74 insertions(+)
 create mode 100755 tests/qemu-iotests/265
 create mode 100644 tests/qemu-iotests/265.out

diff --git a/tests/qemu-iotests/265 b/tests/qemu-iotests/265
new file mode 100755
index 0000000000..dce6f77be3
--- /dev/null
+++ b/tests/qemu-iotests/265
@@ -0,0 +1,67 @@
+#!/usr/bin/env bash
+#
+# Test reverse-ordered qcow2 writes on a sub-cluster level
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
+seq=3D$(basename $0)
+echo "QA output created by $seq"
+
+status=3D1	# failure is the default!
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
+# qcow2-specific test
+_supported_fmt qcow2
+_supported_proto file
+_supported_os Linux
+
+echo '--- Writing to the image ---'
+
+# Reduce cluster size so we get more and quicker I/O
+IMGOPTS=3D'cluster_size=3D4096' _make_test_img 1M
+(for ((kb =3D 1024 - 4; kb >=3D 0; kb -=3D 4)); do \
+     echo "aio_write -P 42 $((kb + 1))k 2k"; \
+ done) \
+ | $QEMU_IO "$TEST_IMG" > /dev/null
+
+echo '--- Verifying its content ---'
+
+(for ((kb =3D 0; kb < 1024; kb +=3D 4)); do \
+    echo "read -P 0 ${kb}k 1k"; \
+    echo "read -P 42 $((kb + 1))k 2k"; \
+    echo "read -P 0 $((kb + 3))k 1k"; \
+ done) \
+ | $QEMU_IO "$TEST_IMG" | _filter_qemu_io | grep 'verification'
+
+# Status of qemu-io
+if [ ${PIPESTATUS[1]} =3D 0 ]; then
+    echo 'Content verified.'
+fi
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=3D0
diff --git a/tests/qemu-iotests/265.out b/tests/qemu-iotests/265.out
new file mode 100644
index 0000000000..6eac620f25
--- /dev/null
+++ b/tests/qemu-iotests/265.out
@@ -0,0 +1,6 @@
+QA output created by 265
+--- Writing to the image ---
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1048576
+--- Verifying its content ---
+Content verified.
+*** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index d95d556414..0c129c1644 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -274,3 +274,4 @@
 257 rw
 258 rw quick
 262 rw quick migration
+265 rw auto quick
--=20
2.21.0


