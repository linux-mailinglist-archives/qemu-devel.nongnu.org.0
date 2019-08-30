Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405AFA3F78
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Aug 2019 23:09:36 +0200 (CEST)
Received: from localhost ([::1]:41176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3o9G-00057l-To
	for lists+qemu-devel@lfdr.de; Fri, 30 Aug 2019 17:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i3nxR-0003W1-29
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 16:57:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i3nxH-0001oV-0I
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 16:57:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45776)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1i3nww-0001ek-DI; Fri, 30 Aug 2019 16:56:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B1740308218D;
 Fri, 30 Aug 2019 20:56:49 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 605B55DAAE;
 Fri, 30 Aug 2019 20:56:47 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Aug 2019 23:56:08 +0300
Message-Id: <20190830205608.18192-11-mlevitsk@redhat.com>
In-Reply-To: <20190830205608.18192-1-mlevitsk@redhat.com>
References: <20190830205608.18192-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 30 Aug 2019 20:56:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 10/10] iotests : add tests for encryption key
 management
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that currently I add tests 300-302, which are
placeholders to ease the rebase. In final version
of these patches I will update these.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 tests/qemu-iotests/087.out       |   6 +-
 tests/qemu-iotests/134.out       |   2 +-
 tests/qemu-iotests/158.out       |   4 +-
 tests/qemu-iotests/188.out       |   2 +-
 tests/qemu-iotests/189.out       |   4 +-
 tests/qemu-iotests/198.out       |   4 +-
 tests/qemu-iotests/300           | 202 +++++++++++++++++++++++++
 tests/qemu-iotests/300.out       |  98 ++++++++++++
 tests/qemu-iotests/301           |  90 +++++++++++
 tests/qemu-iotests/301.out       |  30 ++++
 tests/qemu-iotests/302           | 247 +++++++++++++++++++++++++++++++
 tests/qemu-iotests/302.out       |  18 +++
 tests/qemu-iotests/common.filter |   6 +-
 tests/qemu-iotests/group         |   8 +
 14 files changed, 708 insertions(+), 13 deletions(-)
 create mode 100755 tests/qemu-iotests/300
 create mode 100644 tests/qemu-iotests/300.out
 create mode 100755 tests/qemu-iotests/301
 create mode 100644 tests/qemu-iotests/301.out
 create mode 100644 tests/qemu-iotests/302
 create mode 100644 tests/qemu-iotests/302.out

diff --git a/tests/qemu-iotests/087.out b/tests/qemu-iotests/087.out
index 2d92ea847b..b61ba638af 100644
--- a/tests/qemu-iotests/087.out
+++ b/tests/qemu-iotests/087.out
@@ -34,7 +34,7 @@ QMP_VERSION
 
 === Encrypted image QCow ===
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encryption=on encrypt.key-secret=sec0
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encryption=on
 Testing:
 QMP_VERSION
 {"return": {}}
@@ -46,7 +46,7 @@ QMP_VERSION
 
 === Encrypted image LUKS ===
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encrypt.format=luks encrypt.key-secret=sec0
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 Testing:
 QMP_VERSION
 {"return": {}}
@@ -58,7 +58,7 @@ QMP_VERSION
 
 === Missing driver ===
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encryption=on encrypt.key-secret=sec0
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encryption=on
 Testing: -S
 QMP_VERSION
 {"return": {}}
diff --git a/tests/qemu-iotests/134.out b/tests/qemu-iotests/134.out
index 09d46f6b17..4abc5b5f7d 100644
--- a/tests/qemu-iotests/134.out
+++ b/tests/qemu-iotests/134.out
@@ -1,5 +1,5 @@
 QA output created by 134
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encryption=on encrypt.key-secret=sec0
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 encryption=on
 
 == reading whole image ==
 read 134217728/134217728 bytes at offset 0
diff --git a/tests/qemu-iotests/158.out b/tests/qemu-iotests/158.out
index 6def216e55..f28a17626b 100644
--- a/tests/qemu-iotests/158.out
+++ b/tests/qemu-iotests/158.out
@@ -1,6 +1,6 @@
 QA output created by 158
 == create base ==
-Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728 encryption=on encrypt.key-secret=sec0
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728 encryption=on
 
 == writing whole image ==
 wrote 134217728/134217728 bytes at offset 0
@@ -10,7 +10,7 @@ wrote 134217728/134217728 bytes at offset 0
 read 134217728/134217728 bytes at offset 0
 128 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == create overlay ==
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.base encryption=on encrypt.key-secret=sec0
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.base encryption=on
 
 == writing part of a cluster ==
 wrote 1024/1024 bytes at offset 0
diff --git a/tests/qemu-iotests/188.out b/tests/qemu-iotests/188.out
index c568ef3701..5426861b18 100644
--- a/tests/qemu-iotests/188.out
+++ b/tests/qemu-iotests/188.out
@@ -1,5 +1,5 @@
 QA output created by 188
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=16777216 encrypt.format=luks encrypt.key-secret=sec0 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=16777216
 
 == reading whole image ==
 read 16777216/16777216 bytes at offset 0
diff --git a/tests/qemu-iotests/189.out b/tests/qemu-iotests/189.out
index a0b7c9c24c..bc213cbe14 100644
--- a/tests/qemu-iotests/189.out
+++ b/tests/qemu-iotests/189.out
@@ -1,6 +1,6 @@
 QA output created by 189
 == create base ==
-Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=16777216 encrypt.format=luks encrypt.key-secret=sec0 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=16777216
 
 == writing whole image ==
 wrote 16777216/16777216 bytes at offset 0
@@ -10,7 +10,7 @@ wrote 16777216/16777216 bytes at offset 0
 read 16777216/16777216 bytes at offset 0
 16 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == create overlay ==
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=16777216 backing_file=TEST_DIR/t.IMGFMT.base encrypt.format=luks encrypt.key-secret=sec1 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=16777216 backing_file=TEST_DIR/t.IMGFMT.base
 
 == writing part of a cluster ==
 wrote 1024/1024 bytes at offset 0
diff --git a/tests/qemu-iotests/198.out b/tests/qemu-iotests/198.out
index e86b175e39..2eff420795 100644
--- a/tests/qemu-iotests/198.out
+++ b/tests/qemu-iotests/198.out
@@ -1,12 +1,12 @@
 QA output created by 198
 == create base ==
-Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=16777216 encrypt.format=luks encrypt.key-secret=sec0 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=16777216
 
 == writing whole image base ==
 wrote 16777216/16777216 bytes at offset 0
 16 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == create overlay ==
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=16777216 backing_file=TEST_DIR/t.IMGFMT.base encrypt.format=luks encrypt.key-secret=sec1 encrypt.iter-time=10
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=16777216 backing_file=TEST_DIR/t.IMGFMT.base
 
 == writing whole image layer ==
 wrote 16777216/16777216 bytes at offset 0
diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
new file mode 100755
index 0000000000..5b65ef95de
--- /dev/null
+++ b/tests/qemu-iotests/300
@@ -0,0 +1,202 @@
+#!/usr/bin/env bash
+#
+# Test encryption key management with luks
+# Based on 134
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
+_supported_fmt qcow2 luks
+_supported_proto file #TODO
+
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
+
+if [ "$IMGFMT" = "qcow2" ] ; then
+	PR="encrypt."
+	EXTRA_IMG_ARGS="-o encrypt.format=luks"
+fi
+
+
+# secrets: you are supposed to see the password as *******, see :-)
+S0="--object secret,id=sec0,data=hunter0"
+S1="--object secret,id=sec1,data=hunter1"
+S2="--object secret,id=sec2,data=hunter2"
+S3="--object secret,id=sec3,data=hunter3"
+S4="--object secret,id=sec4,data=hunter4"
+SECRETS="$S0 $S1 $S2 $S3 $S4"
+
+# image with given secret
+IMGS0="--image-opts driver=$IMGFMT,file.filename=$TEST_IMG,${PR}key-secret=sec0"
+IMGS1="--image-opts driver=$IMGFMT,file.filename=$TEST_IMG,${PR}key-secret=sec1"
+IMGS2="--image-opts driver=$IMGFMT,file.filename=$TEST_IMG,${PR}key-secret=sec2"
+IMGS3="--image-opts driver=$IMGFMT,file.filename=$TEST_IMG,${PR}key-secret=sec3"
+IMGS4="--image-opts driver=$IMGFMT,file.filename=$TEST_IMG,${PR}key-secret=sec4"
+
+
+echo "== creating a test image =="
+_make_test_img $S4 $EXTRA_IMG_ARGS -o ${PR}key-secret=sec4,${PR}iter-time=10,${PR}slot=4 32M
+
+echo
+echo "== test that key 4 opens the image =="
+$QEMU_IO $S4 -c "read 0 4096" $IMGS4 | _filter_qemu_io | _filter_testdir
+
+echo
+echo "== adding a password to slot 0 =="
+$QEMU_IMG amend $SECRETS $IMGS4 -o ${PR}key-secret=sec0,${PR}iter-time=10
+echo "== adding a password to slot 1 =="
+$QEMU_IMG amend $SECRETS $IMGS0 -o ${PR}key-secret=sec1,${PR}iter-time=10
+echo "== adding a password to slot 3 =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}key-secret=sec3,${PR}iter-time=10,${PR}slot=3
+echo "== adding a password to slot 2 =="
+$QEMU_IMG amend $SECRETS $IMGS3 -o ${PR}key-secret=sec2,${PR}iter-time=10
+
+
+echo "== erase slot 4 =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}active=off,${PR}slot=4 | _filter_img_create
+
+
+echo
+echo "== all secrets should work =="
+for IMG in "$IMGS0" "$IMGS1" "$IMGS2" "$IMGS3"; do
+	$QEMU_IO $SECRETS -c "read 0 4096" $IMG | _filter_qemu_io | _filter_testdir
+done
+
+echo
+echo "== erase slot 0 and try it =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}active=off,${PR}key-secret=sec0 | _filter_img_create
+$QEMU_IO $SECRETS -c "read 0 4096" $IMGS0 | _filter_qemu_io | _filter_testdir
+
+echo
+echo "== erase slot 2 and try it =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}active=off,${PR}slot=2| _filter_img_create
+$QEMU_IO $SECRETS -c "read 0 4096" $IMGS2 | _filter_qemu_io | _filter_testdir
+
+
+# at this point slots 1 and 3 should be active
+
+echo
+echo "== filling  4 slots with secret 2 =="
+for i in $(seq 0 3) ; do
+	$QEMU_IMG amend $SECRETS $IMGS3 -o ${PR}key-secret=sec2,${PR}iter-time=10
+done
+
+echo
+echo "== adding secret 0 =="
+	$QEMU_IMG amend $SECRETS $IMGS3 -o ${PR}key-secret=sec0,${PR}iter-time=10
+
+echo
+echo "== adding secret 3 (last slot) =="
+	$QEMU_IMG amend $SECRETS $IMGS3 -o ${PR}key-secret=sec3,${PR}iter-time=10
+
+echo
+echo "== trying to add another slot (should fail) =="
+$QEMU_IMG amend $SECRETS $IMGS2 -o ${PR}key-secret=sec3,${PR}iter-time=10
+
+echo
+echo "== all secrets should work again =="
+for IMG in "$IMGS0" "$IMGS1" "$IMGS2" "$IMGS3"; do
+	$QEMU_IO $SECRETS -c "read 0 4096" $IMG | _filter_qemu_io | _filter_testdir
+done
+
+echo
+echo "== erase all keys of secret 2=="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}active=off,${PR}key-secret=sec2
+echo "== erase all keys of secret 1=="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}active=off,${PR}key-secret=sec1
+echo "== erase all keys of secret 0=="
+$QEMU_IMG amend $SECRETS $IMGS0 -o ${PR}active=off,${PR}key-secret=sec0
+echo "== erase all keys of secret 3, except a remaining key =="
+$QEMU_IMG amend $SECRETS $IMGS3 -o ${PR}active=off,${PR}key-secret=sec3
+
+
+echo
+echo "== only secret3 should work now  =="
+for IMG in "$IMGS0" "$IMGS1" "$IMGS2" "$IMGS3"; do
+	$QEMU_IO $SECRETS -c "read 0 4096" $IMG | _filter_qemu_io | _filter_testdir
+done
+
+echo
+echo "== add secret0  =="
+$QEMU_IMG amend $SECRETS $IMGS3 -o ${PR}key-secret=sec0,${PR}iter-time=10
+
+echo "== erase secret3 =="
+$QEMU_IMG amend $SECRETS $IMGS0 -o ${PR}active=off,${PR}key-secret=sec3
+
+echo
+echo "== only secret0 should work now  =="
+for IMG in "$IMGS0" "$IMGS1" "$IMGS2" "$IMGS3"; do
+	$QEMU_IO $SECRETS -c "read 0 4096" $IMG | _filter_qemu_io | _filter_testdir
+done
+
+echo
+echo "== replace secret0 with secret1 (should fail)  =="
+$QEMU_IMG amend $SECRETS $IMGS0 -o ${PR}key-secret=sec1,${PR}iter-time=10,${PR}slot=0
+
+echo
+echo "== replace secret0 with secret1 with force (should work)  =="
+$QEMU_IMG amend $SECRETS $IMGS0 -o ${PR}key-secret=sec1,${PR}iter-time=10,${PR}slot=0 --force
+
+echo
+echo "== only secret1 should work now  =="
+for IMG in "$IMGS0" "$IMGS1" "$IMGS2" "$IMGS3"; do
+	$QEMU_IO $SECRETS -c "read 0 4096" $IMG | _filter_qemu_io | _filter_testdir
+done
+
+
+echo
+echo "== erase last secret (should fail)  =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}active=off,${PR}slot=0
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}active=off,${PR}key-secret=sec1
+
+
+echo "== erase non existing secrets (should fail)  =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}active=off,${PR}key-secret=sec5 --force
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}active=off,${PR}key-secret=sec0 --force
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}active=off,${PR}slot=1 --force
+
+echo
+echo "== erase last secret with force by slot (should work)  =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}active=off,${PR}slot=0 --force
+
+echo
+echo "== we have no secrets now, data is lost forever =="
+for IMG in "$IMGS0" "$IMGS1" "$IMGS2" "$IMGS3"; do
+	$QEMU_IO $SECRETS -c "read 0 4096" $IMG | _filter_qemu_io | _filter_testdir
+done
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
+
diff --git a/tests/qemu-iotests/300.out b/tests/qemu-iotests/300.out
new file mode 100644
index 0000000000..d809595381
--- /dev/null
+++ b/tests/qemu-iotests/300.out
@@ -0,0 +1,98 @@
+QA output created by 300
+== creating a test image ==
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=33554432
+
+== test that key 4 opens the image ==
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+== adding a password to slot 0 ==
+== adding a password to slot 1 ==
+== adding a password to slot 3 ==
+== adding a password to slot 2 ==
+== erase slot 4 ==
+
+== all secrets should work ==
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+== erase slot 0 and try it ==
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+
+== erase slot 2 and try it ==
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+
+== filling  4 slots with secret 2 ==
+
+== adding secret 0 ==
+
+== adding secret 3 (last slot) ==
+
+== trying to add another slot (should fail) ==
+qemu-img: Can't add a keyslot - all key slots are in use
+
+== all secrets should work again ==
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+== erase all keys of secret 2==
+== erase all keys of secret 1==
+== erase all keys of secret 0==
+== erase all keys of secret 3, except a remaining key ==
+
+== only secret3 should work now  ==
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+== add secret0  ==
+== erase secret3 ==
+
+== only secret0 should work now  ==
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+
+== replace secret0 with secret1 (should fail)  ==
+qemu-img: Can't update an active key slot 0
+
+== replace secret0 with secret1 with force (should work)  ==
+
+== only secret1 should work now  ==
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+
+== erase last secret (should fail)  ==
+qemu-img: Only one slot active - can't erase
+qemu-img: Only one slot active - can't erase
+== erase non existing secrets (should fail)  ==
+qemu-img: No secret with id 'sec5'
+qemu-img: Didn't erase a keyslot, because no keyslots match the given password
+
+== erase last secret with force by slot (should work)  ==
+
+== we have no secrets now, data is lost forever ==
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+*** done
diff --git a/tests/qemu-iotests/301 b/tests/qemu-iotests/301
new file mode 100755
index 0000000000..ba29bf10a0
--- /dev/null
+++ b/tests/qemu-iotests/301
@@ -0,0 +1,90 @@
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
+_supported_fmt luks
+_supported_proto file #TODO
+
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
+
+# you are supposed to see the password as *******, see :-)
+S0="--object secret,id=sec0,data=hunter0"
+S1="--object secret,id=sec1,data=hunter1"
+SECRETS="$S0 $S1"
+
+
+IMGS0="--image-opts driver=$IMGFMT,file.filename=$TEST_IMG,key-secret=sec0"
+IMGS1="--image-opts driver=$IMGFMT,file.filename=$TEST_IMG,key-secret=sec1"
+
+echo "== creating a test image =="
+_make_test_img $S0 -o "key-secret=sec0,iter-time=10" 32M
+
+echo
+echo "== test that key 0 opens the image =="
+$QEMU_IO $S0 -c "read 0 4096" $IMGS0 | _filter_qemu_io | _filter_testdir
+
+echo
+echo "== adding a password to slot 1 =="
+$QEMU_IMG amend $SECRETS $IMGS0 -o active=on,key-secret=sec1,slot=1,iter-time=10
+
+echo
+echo "== 'backup' the image header =="
+dd if=$TEST_IMG_FILE of=${TEST_IMG_FILE}.bk bs=4K skip=0 count=1
+
+echo
+echo "== erase slot 0 =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o active=off,slot=0 | _filter_img_create
+
+echo
+echo "== test that key 0 doesn't open the image =="
+$QEMU_IO $S0 -c "read 0 4096" $IMGS0 | _filter_qemu_io | _filter_testdir
+
+echo
+echo "== 'restore' the image header =="
+dd if=${TEST_IMG_FILE}.bk of=${TEST_IMG_FILE} bs=4K skip=0 count=1 conv=notrunc
+
+echo
+echo "== test that key 0 still doesn't open the image (key material is erased) =="
+$QEMU_IO $SECRETS -c "read 0 4096" $IMGS0 | _filter_qemu_io | _filter_testdir
+
+echo
+echo "== test that key 1 still works =="
+$QEMU_IO $SECRETS -c "read 0 4096" $IMGS1 | _filter_qemu_io | _filter_testdir
+
+echo "*** done"
+rm -f $seq.full
+status=0
+
+
+exit 0
diff --git a/tests/qemu-iotests/301.out b/tests/qemu-iotests/301.out
new file mode 100644
index 0000000000..e653c30330
--- /dev/null
+++ b/tests/qemu-iotests/301.out
@@ -0,0 +1,30 @@
+QA output created by 301
+== creating a test image ==
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=33554432
+
+== test that key 0 opens the image ==
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+== adding a password to slot 1 ==
+
+== 'backup' the image header ==
+1+0 records in
+1+0 records out
+
+== erase slot 0 ==
+
+== test that key 0 doesn't open the image ==
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+
+== 'restore' the image header ==
+1+0 records in
+1+0 records out
+
+== test that key 0 still doesn't open the image (key material is erased) ==
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+
+== test that key 1 still works ==
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+*** done
diff --git a/tests/qemu-iotests/302 b/tests/qemu-iotests/302
new file mode 100644
index 0000000000..ef33d6fff5
--- /dev/null
+++ b/tests/qemu-iotests/302
@@ -0,0 +1,247 @@
+#!/usr/bin/env python
+#
+# Test case QMP's encrypted key management
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
+import iotests
+import os
+import time
+
+test_img = os.path.join(iotests.test_dir, 'test.img')
+
+class Secret:
+    def __init__(self, index):
+        self._id = "keysec" + str(index)
+        # you are not supposed to see the password...
+        self._secret = "hunter" + str(index)
+
+    def id(self):
+        return self._id
+
+    def secret(self):
+        return self._secret
+
+    def to_cmdline_object(self):
+        return  [ "secret,id=" + self._id + ",data=" + self._secret]
+
+    def to_qmp_object(self):
+        return { "qom_type" : "secret", "id": self.id(),
+                 "props": { "data": self.secret() } }
+
+################################################################################
+
+class EncryptionSetupTestCase(iotests.QMPTestCase):
+
+    # test case startup
+    def setUp(self):
+        # start the VM
+        self.vm = iotests.VM()
+        self.vm.launch()
+
+        # create the secrets and load 'em into the VM
+        self.secrets = [ Secret(i) for i in range(0, 4) ]
+        for secret in self.secrets:
+            result = self.vm.qmp("object-add", **secret.to_qmp_object())
+            self.assert_qmp(result, 'return', {})
+
+        if iotests.imgfmt == "qcow2":
+            self.pfx="encrypt."
+            self.img_opts = [ '-o', "encrypt.format=luks" ]
+        else:
+            self.pfx=""
+            self.img_opts = []
+
+
+    # test case shutdown
+    def tearDown(self):
+        # stop the VM
+        self.vm.shutdown()
+
+    ###########################################################################
+    # create the encrypted block device
+    def createImg(self, file, secret):
+
+        iotests.qemu_img(
+            'create',
+            '--object', *secret.to_cmdline_object(),
+            '-f', iotests.imgfmt,
+            '-o', self.pfx+'key-secret=' + secret.id(),
+            '-o', self.pfx+'iter-time=10',
+            *self.img_opts,
+            file,
+            '1M')
+
+    ###########################################################################
+    # open an encrypted block device
+    def openLUKS(self, id, file, secret):
+        if iotests.imgfmt == "qcow2":
+            encrypt_options = {
+                'encrypt': {
+                    'format':'luks',
+                    'key-secret' : secret.id()}
+                }
+        else:
+            encrypt_options = {
+                'key-secret' : secret.id()
+            }
+
+        result = self.vm.qmp('blockdev-add', **
+            {
+                'driver': iotests.imgfmt,
+                'node-name': id,
+
+                **encrypt_options,
+
+                'file': {
+                    'driver': 'file',
+                    'filename': test_img,
+                }
+            }
+        )
+        self.assert_qmp(result, 'return', {})
+
+    # close the encrypted block device
+    def closeLUKS(self, id):
+        result = self.vm.qmp('blockdev-del', **{ 'node-name': id })
+        self.assert_qmp(result, 'return', {})
+
+    ###########################################################################
+
+    # add a key to an encrypted block device
+    def addKey(self, id, secret, unlock_secret = None, slot = None, force = False):
+
+        crypt_options = {
+            'active': True,
+            'key-secret' : secret.id(),
+            'iter-time' : 10
+        }
+
+        if slot != None:
+            crypt_options['slot'] = slot
+        if unlock_secret != None:
+            crypt_options['unlock-secret'] = unlock_secret.id()
+
+        if iotests.imgfmt == "qcow2":
+            crypt_options['format'] = 'luks'
+            crypt_options = {
+                'encrypt': crypt_options
+            }
+
+        args = {
+            'node-name': id,
+            'job-id' : 'job0',
+            'options' : {
+                    'driver' : iotests.imgfmt,
+                    **crypt_options
+                },
+        }
+
+        if force == True:
+            args['force'] = True
+
+        #TODO: check what jobs return
+        result = self.vm.qmp('x-blockdev-amend', **args)
+        assert result['return'] == {}
+        self.vm.run_job('job0')
+
+    # erase a key from an encrypted block device
+    def eraseKey(self, id, secret = None, slot = None, force = False):
+
+        crypt_options = {
+            'active': False,
+            'iter-time' : 10
+        }
+
+        if slot != None:
+            crypt_options['slot'] = slot
+        if secret != None:
+            crypt_options['key-secret'] = secret.id()
+
+        if iotests.imgfmt == "qcow2":
+            crypt_options['format'] = 'luks'
+            crypt_options = {
+                'encrypt': crypt_options
+            }
+
+        args = {
+            'node-name': id,
+            'job-id' : 'job1',
+            'options' : {
+                    'driver' : iotests.imgfmt,
+                    **crypt_options
+                },
+        }
+
+        if force == True:
+            args['force'] = True
+
+        result = self.vm.qmp('x-blockdev-amend', **args)
+        assert result['return'] == {}
+        self.vm.run_job('job1')
+
+    ###########################################################################
+    # create image, and change its key
+    def testChangeKey(self):
+
+        # create the image with secret0 and open it
+        self.createImg(test_img, self.secrets[0]);
+        self.openLUKS("testdev", test_img, self.secrets[0])
+
+        # add key to slot 1
+        self.addKey("testdev", secret=self.secrets[1])
+
+
+        # erase key from slot 0
+        self.eraseKey("testdev", secret=self.secrets[0])
+
+        #reopen the image with secret1
+        self.closeLUKS("testdev")
+        self.openLUKS("testdev", test_img, self.secrets[1])
+
+        # close and erase the image for good
+        self.closeLUKS("testdev")
+        os.remove(test_img)
+
+    # test that if we erase the old password,
+    # we can still change the encryption keys using 'old-secret'
+    def testOldPassword(self):
+
+        # create the image with secret0 and open it
+        self.createImg(test_img, self.secrets[0]);
+        self.openLUKS("testdev", test_img, self.secrets[0])
+
+        # add key to slot 1
+        self.addKey("testdev", secret=self.secrets[1])
+
+        # erase key from slot 0
+        self.eraseKey("testdev", secret=self.secrets[0])
+
+        # this will fail as the old password is no longer valid
+        self.addKey("testdev", secret=self.secrets[2])
+
+        # this will work
+        self.addKey("testdev", secret=self.secrets[2], unlock_secret=self.secrets[1])
+
+        # close and erase the image for good
+        self.closeLUKS("testdev")
+        os.remove(test_img)
+
+
+if __name__ == '__main__':
+    # Encrypted formats support
+    iotests.main(iotests.main(supported_fmts=['qcow2','luks']))
diff --git a/tests/qemu-iotests/302.out b/tests/qemu-iotests/302.out
new file mode 100644
index 0000000000..78bfc0864c
--- /dev/null
+++ b/tests/qemu-iotests/302.out
@@ -0,0 +1,18 @@
+..
+----------------------------------------------------------------------
+Ran 2 tests
+
+OK
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job1"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job1"}}
+{"return": {}}
+Job failed: Invalid password, cannot unlock any keyslot
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 8e9235d6fe..a93808cac2 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -138,8 +138,10 @@ _filter_img_create()
         -e "s# block_state_zero=\\(on\\|off\\)##g" \
         -e "s# log_size=[0-9]\\+##g" \
         -e "s# refcount_bits=[0-9]\\+##g" \
-        -e "s# key-secret=[a-zA-Z0-9]\\+##g" \
-        -e "s# iter-time=[0-9]\\+##g" \
+        -e "s# \\(encrypt\\.\\)\\?key-secret=[a-zA-Z0-9]\\+##g" \
+        -e "s# \\(encrypt\\.\\)\\?slot=[0-9]\\+##g" \
+        -e "s# \\(encrypt\\.\\)\\?iter-time=[0-9]\\+##g" \
+        -e "s# encrypt\\.format=[a-zA-Z0-9]\\+##g" \
         -e "s# force_size=\\(on\\|off\\)##g"
 }
 
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index d95d556414..cc2c824b7d 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -274,3 +274,11 @@
 257 rw
 258 rw quick
 262 rw quick migration
+
+
+
+
+
+300 rw auto
+301 rw auto quick
+302 rw auto
-- 
2.17.2


