Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527E91D7894
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 14:28:06 +0200 (CEST)
Received: from localhost ([::1]:42786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaesH-00062T-Bb
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 08:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jaell-0004yM-79
 for qemu-devel@nongnu.org; Mon, 18 May 2020 08:21:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41969
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jaelj-0007Kx-Ef
 for qemu-devel@nongnu.org; Mon, 18 May 2020 08:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589804478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xLVGZqphJAljbowglelTVto9IwlOmseBVHTdo1pGWfg=;
 b=PDBSTNY6ycEblDkvymNpSW5hNVI6dWqYk99sxYvYUpkUk59YH2hIJbNHz2d48sXpoKAa+J
 E5Q3hvO9zQHD/bARc1+uW9b8BlvkrMcLKfxwUmzcows2dvH0B4itt0sTPAdO1Spl+u2FBz
 Rjlk7TaiTbxLJigopJWkNQt1Hh8psuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-tMltzr8PMKi85PJUYawJHw-1; Mon, 18 May 2020 08:21:15 -0400
X-MC-Unique: tMltzr8PMKi85PJUYawJHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E318107ACCD;
 Mon, 18 May 2020 12:21:14 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32E6560BF1;
 Mon, 18 May 2020 12:21:12 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/14] iotests: qemu-img tests for luks key management
Date: Mon, 18 May 2020 15:20:37 +0300
Message-Id: <20200518122041.10694-11-mlevitsk@redhat.com>
In-Reply-To: <20200518122041.10694-1-mlevitsk@redhat.com>
References: <20200518122041.10694-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 00:53:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit adds two tests, which test the new amend interface
of both luks raw images and qcow2 luks encrypted images.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/293     | 207 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/293.out |  99 ++++++++++++++++++
 tests/qemu-iotests/294     |  90 ++++++++++++++++
 tests/qemu-iotests/294.out |  30 ++++++
 tests/qemu-iotests/group   |   2 +
 5 files changed, 428 insertions(+)
 create mode 100755 tests/qemu-iotests/293
 create mode 100644 tests/qemu-iotests/293.out
 create mode 100755 tests/qemu-iotests/294
 create mode 100644 tests/qemu-iotests/294.out

diff --git a/tests/qemu-iotests/293 b/tests/qemu-iotests/293
new file mode 100755
index 0000000000..aa1a77690f
--- /dev/null
+++ b/tests/qemu-iotests/293
@@ -0,0 +1,207 @@
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
+_make_test_img $S0 $EXTRA_IMG_ARGS -o ${PR}key-secret=sec0,${PR}iter-time=10 32M
+
+echo
+echo "== test that key 0 opens the image =="
+$QEMU_IO $S0 -c "read 0 4096" $IMGS0 | _filter_qemu_io | _filter_testdir
+
+echo
+echo "== adding a password to slot 4 =="
+$QEMU_IMG amend $SECRETS $IMGS0 -o ${PR}state=active,${PR}new-secret=sec4,${PR}iter-time=10,${PR}keyslot=4
+echo "== adding a password to slot 1 =="
+$QEMU_IMG amend $SECRETS $IMGS0 -o ${PR}state=active,${PR}new-secret=sec1,${PR}iter-time=10
+echo "== adding a password to slot 3 =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}state=active,${PR}new-secret=sec3,${PR}iter-time=10,${PR}keyslot=3
+
+echo "== adding a password to slot 2 =="
+$QEMU_IMG amend $SECRETS $IMGS3 -o ${PR}state=active,${PR}new-secret=sec2,${PR}iter-time=10
+
+
+echo "== erase slot 4 =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}state=inactive,${PR}keyslot=4 | _filter_img_create
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
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}state=inactive,${PR}old-secret=sec0 | _filter_img_create
+$QEMU_IO $SECRETS -c "read 0 4096" $IMGS0 | _filter_qemu_io | _filter_testdir
+
+echo
+echo "== erase slot 2 and try it =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}state=inactive,${PR}keyslot=2 | _filter_img_create
+$QEMU_IO $SECRETS -c "read 0 4096" $IMGS2 | _filter_qemu_io | _filter_testdir
+
+
+# at this point slots 1 and 3 should be active
+
+echo
+echo "== filling  4 slots with secret 2 =="
+for i in $(seq 0 3) ; do
+	$QEMU_IMG amend $SECRETS $IMGS3 -o ${PR}state=active,${PR}new-secret=sec2,${PR}iter-time=10
+done
+
+echo
+echo "== adding secret 0 =="
+	$QEMU_IMG amend $SECRETS $IMGS3 -o ${PR}state=active,${PR}new-secret=sec0,${PR}iter-time=10
+
+echo
+echo "== adding secret 3 (last slot) =="
+	$QEMU_IMG amend $SECRETS $IMGS3 -o ${PR}state=active,${PR}new-secret=sec3,${PR}iter-time=10
+
+echo
+echo "== trying to add another slot (should fail) =="
+$QEMU_IMG amend $SECRETS $IMGS2 -o ${PR}state=active,${PR}new-secret=sec3,${PR}iter-time=10
+
+echo
+echo "== all secrets should work again =="
+for IMG in "$IMGS0" "$IMGS1" "$IMGS2" "$IMGS3"; do
+	$QEMU_IO $SECRETS -c "read 0 4096" $IMG | _filter_qemu_io | _filter_testdir
+done
+
+
+echo
+
+echo "== erase all keys of secret 2=="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}state=inactive,${PR}old-secret=sec2
+
+echo "== erase all keys of secret 1=="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}state=inactive,${PR}old-secret=sec1
+
+echo "== erase all keys of secret 0=="
+$QEMU_IMG amend $SECRETS $IMGS0 -o ${PR}state=inactive,${PR}old-secret=sec0
+
+echo "== erasing secret3 will fail now since it is the only secret (in 3 slots) =="
+$QEMU_IMG amend $SECRETS $IMGS3 -o ${PR}state=inactive,${PR}old-secret=sec3
+
+echo
+echo "== only secret3 should work now  =="
+for IMG in "$IMGS0" "$IMGS1" "$IMGS2" "$IMGS3"; do
+	$QEMU_IO $SECRETS -c "read 0 4096" $IMG | _filter_qemu_io | _filter_testdir
+done
+
+echo
+echo "== add secret0  =="
+$QEMU_IMG amend $SECRETS $IMGS3 -o ${PR}state=active,${PR}new-secret=sec0,${PR}iter-time=10
+
+echo "== erase secret3 =="
+$QEMU_IMG amend $SECRETS $IMGS0 -o ${PR}state=inactive,${PR}old-secret=sec3
+
+echo
+echo "== only secret0 should work now  =="
+for IMG in "$IMGS0" "$IMGS1" "$IMGS2" "$IMGS3"; do
+	$QEMU_IO $SECRETS -c "read 0 4096" $IMG | _filter_qemu_io | _filter_testdir
+done
+
+echo
+echo "== replace secret0 with secret1 (should fail)  =="
+$QEMU_IMG amend $SECRETS $IMGS0 -o ${PR}state=active,${PR}new-secret=sec1,${PR}keyslot=0
+
+echo
+echo "== replace secret0 with secret1 with force (should work)  =="
+$QEMU_IMG amend $SECRETS $IMGS0 -o ${PR}state=active,${PR}new-secret=sec1,${PR}iter-time=10,${PR}keyslot=0 --force
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
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}state=inactive,${PR}keyslot=0
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}state=inactive,${PR}old-secret=sec1
+
+
+echo "== erase non existing secrets (should fail)  =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}state=inactive,${PR}old-secret=sec5 --force
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}state=inactive,${PR}old-secret=sec0 --force
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}state=inactive,${PR}keyslot=1 --force
+
+echo
+echo "== erase last secret with force by slot (should work)  =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o ${PR}state=inactive,${PR}keyslot=0 --force
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
diff --git a/tests/qemu-iotests/293.out b/tests/qemu-iotests/293.out
new file mode 100644
index 0000000000..7260783126
--- /dev/null
+++ b/tests/qemu-iotests/293.out
@@ -0,0 +1,99 @@
+QA output created by 293
+== creating a test image ==
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=33554432
+
+== test that key 0 opens the image ==
+read 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+== adding a password to slot 4 ==
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
+qemu-img: Can't add a keyslot - all keyslots are in use
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
+== erasing secret3 will fail now since it is the only secret (in 3 slots) ==
+qemu-img: All the active keyslots match the (old) password that was given and erasing them will erase all the data in the image irreversibly - refusing operation
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
+qemu-img: Refusing to overwrite active keyslot 0 - please erase it first
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
+qemu-img: Attempt to erase the only active keyslot 0 which will erase all the data in the image irreversibly - refusing operation
+qemu-img: All the active keyslots match the (old) password that was given and erasing them will erase all the data in the image irreversibly - refusing operation
+== erase non existing secrets (should fail)  ==
+qemu-img: No secret with id 'sec5'
+qemu-img: No keyslots match given (old) password for erase operation
+
+== erase last secret with force by slot (should work)  ==
+
+== we have no secrets now, data is lost forever ==
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+qemu-io: can't open: Invalid password, cannot unlock any keyslot
+*** done
diff --git a/tests/qemu-iotests/294 b/tests/qemu-iotests/294
new file mode 100755
index 0000000000..9c95ed8c9a
--- /dev/null
+++ b/tests/qemu-iotests/294
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
+$QEMU_IMG amend $SECRETS $IMGS0 -o state=active,new-secret=sec1,keyslot=1,iter-time=10
+
+echo
+echo "== 'backup' the image header =="
+dd if=$TEST_IMG_FILE of=${TEST_IMG_FILE}.bk bs=4K skip=0 count=1
+
+echo
+echo "== erase slot 0 =="
+$QEMU_IMG amend $SECRETS $IMGS1 -o state=inactive,keyslot=0 | _filter_img_create
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
diff --git a/tests/qemu-iotests/294.out b/tests/qemu-iotests/294.out
new file mode 100644
index 0000000000..994ae87308
--- /dev/null
+++ b/tests/qemu-iotests/294.out
@@ -0,0 +1,30 @@
+QA output created by 294
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
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 34175fd437..73038e22d6 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -300,3 +300,5 @@
 289 rw quick
 290 rw auto quick
 292 rw auto quick
+293 rw auto
+294 rw auto quick
-- 
2.17.2


