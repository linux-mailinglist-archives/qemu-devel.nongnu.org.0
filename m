Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ED3949C0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 18:23:53 +0200 (CEST)
Received: from localhost ([::1]:55260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzkRk-0000Wy-6z
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 12:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hzkM4-0003DB-2S
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:18:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hzkM1-0006RA-Et
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:17:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58856)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hzkLz-0006PT-0r; Mon, 19 Aug 2019 12:17:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4FBDA106E976;
 Mon, 19 Aug 2019 16:17:54 +0000 (UTC)
Received: from localhost (ovpn-204-64.brq.redhat.com [10.40.204.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5C4D90F5B;
 Mon, 19 Aug 2019 16:17:53 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 19 Aug 2019 18:17:16 +0200
Message-Id: <20190819161723.7746-11-mreitz@redhat.com>
In-Reply-To: <20190819161723.7746-1-mreitz@redhat.com>
References: <20190819161723.7746-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Mon, 19 Aug 2019 16:17:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 10/17] iotests: Convert to preallocated
 encrypted qcow2
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

Add a test case for converting an empty image (which only returns zeroes
when read) to a preallocated encrypted qcow2 image.
qcow2_has_zero_init() should return 0 then, thus forcing qemu-img
convert to create zero clusters.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Acked-by: Stefano Garzarella <sgarzare@redhat.com>
Tested-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20190724171239.8764-10-mreitz@redhat.com
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/188     | 20 +++++++++++++++++++-
 tests/qemu-iotests/188.out |  4 ++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/188 b/tests/qemu-iotests/188
index be7278aa65..afca44df54 100755
--- a/tests/qemu-iotests/188
+++ b/tests/qemu-iotests/188
@@ -48,7 +48,7 @@ SECRETALT=3D"secret,id=3Dsec0,data=3Dplatypus"
=20
 _make_test_img --object $SECRET -o "encrypt.format=3Dluks,encrypt.key-se=
cret=3Dsec0,encrypt.iter-time=3D10" $size
=20
-IMGSPEC=3D"driver=3D$IMGFMT,file.filename=3D$TEST_IMG,encrypt.key-secret=
=3Dsec0"
+IMGSPEC=3D"driver=3D$IMGFMT,encrypt.key-secret=3Dsec0,file.filename=3D$T=
EST_IMG"
=20
 QEMU_IO_OPTIONS=3D$QEMU_IO_OPTIONS_NO_FMT
=20
@@ -68,6 +68,24 @@ echo
 echo "=3D=3D verify open failure with wrong password =3D=3D"
 $QEMU_IO --object $SECRETALT -c "read -P 0xa 0 $size" --image-opts $IMGS=
PEC | _filter_qemu_io | _filter_testdir
=20
+_cleanup_test_img
+
+echo
+echo "=3D=3D verify that has_zero_init returns false when preallocating =
=3D=3D"
+
+# Empty source file
+if [ -n "$TEST_IMG_FILE" ]; then
+    TEST_IMG_FILE=3D"${TEST_IMG_FILE}.orig" _make_test_img $size
+else
+    TEST_IMG=3D"${TEST_IMG}.orig" _make_test_img $size
+fi
+
+$QEMU_IMG convert -O "$IMGFMT" --object $SECRET \
+    -o "encrypt.format=3Dluks,encrypt.key-secret=3Dsec0,encrypt.iter-tim=
e=3D10,preallocation=3Dmetadata" \
+    "${TEST_IMG}.orig" "$TEST_IMG"
+
+$QEMU_IMG compare --object $SECRET --image-opts "${IMGSPEC}.orig" "$IMGS=
PEC"
+
=20
 # success, all done
 echo "*** done"
diff --git a/tests/qemu-iotests/188.out b/tests/qemu-iotests/188.out
index 97b1402671..c568ef3701 100644
--- a/tests/qemu-iotests/188.out
+++ b/tests/qemu-iotests/188.out
@@ -15,4 +15,8 @@ read 16777216/16777216 bytes at offset 0
=20
 =3D=3D verify open failure with wrong password =3D=3D
 qemu-io: can't open: Invalid password, cannot unlock any keyslot
+
+=3D=3D verify that has_zero_init returns false when preallocating =3D=3D
+Formatting 'TEST_DIR/t.IMGFMT.orig', fmt=3DIMGFMT size=3D16777216
+Images are identical.
 *** done
--=20
2.21.0


