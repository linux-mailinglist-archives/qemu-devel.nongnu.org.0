Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C13181CBE
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:47:44 +0100 (CET)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3a9-00013Z-Bv
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59944)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jC3VT-0003Fs-WF
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jC3VS-0003nJ-E4
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56302
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jC3VS-0003ld-Ad
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=76NlVCw3qHJpEpDwfRi5QoXq+jKPycEfZ+rVrxUVgR4=;
 b=DEdp/B3nO4rk9OgfgvTgbaSqZxaE3a5gc1mpnjvBxHFrZXtV1MCc5dLNVveRs+ROZDydT6
 8UzLofn9uhCbnl+0m8PpO2dSv+TXzuFsv+zoa83z8pC19jVixc38C7+a1cTmo7LEV/LWze
 iGkaopU+ee4Z0a2Oga6bXEojtSOpMwQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-9Yf52PUUPwCyGVu53oTYFQ-1; Wed, 11 Mar 2020 11:42:46 -0400
X-MC-Unique: 9Yf52PUUPwCyGVu53oTYFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ADD718A5516;
 Wed, 11 Mar 2020 15:42:45 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42A0792D2C;
 Wed, 11 Mar 2020 15:42:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/13] qemu-iotests: adding LUKS cleanup for non-UTF8 secret
 error
Date: Wed, 11 Mar 2020 16:42:18 +0100
Message-Id: <20200311154218.15532-14-kwolf@redhat.com>
In-Reply-To: <20200311154218.15532-1-kwolf@redhat.com>
References: <20200311154218.15532-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

This patch adds a new test file to exercise the case where
qemu-img fails to complete for the LUKS format when a non-UTF8
secret is used.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20200130213907.2830642-5-danielhb413@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/282     | 67 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/282.out | 11 +++++++
 tests/qemu-iotests/group   |  1 +
 3 files changed, 79 insertions(+)
 create mode 100755 tests/qemu-iotests/282
 create mode 100644 tests/qemu-iotests/282.out

diff --git a/tests/qemu-iotests/282 b/tests/qemu-iotests/282
new file mode 100755
index 0000000000..081eb12080
--- /dev/null
+++ b/tests/qemu-iotests/282
@@ -0,0 +1,67 @@
+#!/usr/bin/env bash
+#
+# Test qemu-img file cleanup for LUKS when using a non-UTF8 secret
+#
+# Copyright (C) 2020, IBM Corporation.
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
+seq=3D`basename $0`
+echo "QA output created by $seq"
+
+status=3D1=09# failure is the default!
+TEST_IMAGE_FILE=3D'vol.img'
+
+_cleanup()
+{
+  _cleanup_test_img
+  rm non_utf8_secret
+  rm -f $TEST_IMAGE_FILE
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+
+_supported_fmt luks
+_supported_proto generic
+_unsupported_proto vxhs
+
+echo "=3D=3D Create non-UTF8 secret =3D=3D"
+echo -n -e '\x3a\x3c\x3b\xff' > non_utf8_secret
+SECRET=3D"secret,id=3Dsec0,file=3Dnon_utf8_secret"
+
+echo "=3D=3D Throws an error because of invalid UTF-8 secret =3D=3D"
+$QEMU_IMG create -f $IMGFMT --object $SECRET -o "key-secret=3Dsec0" $TEST_=
IMAGE_FILE 4M
+
+echo "=3D=3D Image file should not exist after the error =3D=3D"
+if test -f "$TEST_IMAGE_FILE"; then
+    exit 1
+fi
+
+echo "=3D=3D Create a stub image file and run qemu-img again =3D=3D"
+touch $TEST_IMAGE_FILE
+$QEMU_IMG create -f $IMGFMT --object $SECRET -o "key-secret=3Dsec0" $TEST_=
IMAGE_FILE 4M
+
+echo "=3D=3D Pre-existing image file should also be deleted after the erro=
r =3D=3D"
+if test -f "$TEST_IMAGE_FILE"; then
+    exit 1
+fi
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=3D0
diff --git a/tests/qemu-iotests/282.out b/tests/qemu-iotests/282.out
new file mode 100644
index 0000000000..5d079dabce
--- /dev/null
+++ b/tests/qemu-iotests/282.out
@@ -0,0 +1,11 @@
+QA output created by 282
+=3D=3D Create non-UTF8 secret =3D=3D
+=3D=3D Throws an error because of invalid UTF-8 secret =3D=3D
+qemu-img: vol.img: Data from secret sec0 is not valid UTF-8
+Formatting 'vol.img', fmt=3Dluks size=3D4194304 key-secret=3Dsec0
+=3D=3D Image file should not exist after the error =3D=3D
+=3D=3D Create a stub image file and run qemu-img again =3D=3D
+qemu-img: vol.img: Data from secret sec0 is not valid UTF-8
+Formatting 'vol.img', fmt=3Dluks size=3D4194304 key-secret=3Dsec0
+=3D=3D Pre-existing image file should also be deleted after the error =3D=
=3D
+ *** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 0317667695..3c1329b081 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -290,6 +290,7 @@
 279 rw backing quick
 280 rw migration quick
 281 rw quick
+282 rw img quick
 283 auto quick
 284 rw
 286 rw quick
--=20
2.20.1


