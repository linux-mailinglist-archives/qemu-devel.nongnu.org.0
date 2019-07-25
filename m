Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783ED75353
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 17:58:44 +0200 (CEST)
Received: from localhost ([::1]:33333 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqg8h-0005LK-6P
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 11:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54737)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hqg7l-0002Ri-Jy
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 11:57:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hqg7k-0006JU-Bs
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 11:57:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39538)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hqg7h-0006IH-JH; Thu, 25 Jul 2019 11:57:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E29BB46672;
 Thu, 25 Jul 2019 15:57:40 +0000 (UTC)
Received: from localhost (ovpn-117-225.ams2.redhat.com [10.36.117.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7534960606;
 Thu, 25 Jul 2019 15:57:40 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 25 Jul 2019 17:57:29 +0200
Message-Id: <20190725155735.11872-2-mreitz@redhat.com>
In-Reply-To: <20190725155735.11872-1-mreitz@redhat.com>
References: <20190725155735.11872-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 25 Jul 2019 15:57:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/7] iotests: Fix _filter_img_create()
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fe646693acc changed qemu-img create's output so that it no longer prints
single quotes around parameter values.  The subformat and adapter_type
filters in _filter_img_create() have never been adapted to that change.

Fixes: fe646693acc13ac48b98435d14149ab04dc597bc
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/059.out       | 16 ++++++++--------
 tests/qemu-iotests/common.filter |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/059.out b/tests/qemu-iotests/059.out
index 4fab42a28c..77d8984428 100644
--- a/tests/qemu-iotests/059.out
+++ b/tests/qemu-iotests/059.out
@@ -13,17 +13,17 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6=
7108864
 qemu-io: can't open device TEST_DIR/t.vmdk: L1 size too big
=20
 =3D=3D=3D Testing monolithicFlat creation and opening =3D=3D=3D
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D2147483648 subformat=
=3DmonolithicFlat
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D2147483648
 image: TEST_DIR/t.IMGFMT
 file format: IMGFMT
 virtual size: 2 GiB (2147483648 bytes)
=20
 =3D=3D=3D Testing monolithicFlat with zeroed_grain =3D=3D=3D
 qemu-img: TEST_DIR/t.IMGFMT: Flat image can't enable zeroed grain
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D2147483648 subformat=
=3DmonolithicFlat
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D2147483648
=20
 =3D=3D=3D Testing big twoGbMaxExtentFlat =3D=3D=3D
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824000 subfor=
mat=3DtwoGbMaxExtentFlat
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824000
 image: TEST_DIR/t.vmdk
 file format: vmdk
 virtual size: 0.977 TiB (1073741824000 bytes)
@@ -2038,7 +2038,7 @@ Format specific information:
 qemu-img: Could not open 'TEST_DIR/t.IMGFMT': Invalid extent line: RW 12=
582912 VMFS "dummy.IMGFMT" 1
=20
 =3D=3D=3D Testing truncated sparse =3D=3D=3D
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D107374182400 subform=
at=3DmonolithicSparse
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D107374182400
 qemu-img: Could not open 'TEST_DIR/t.IMGFMT': File truncated, expecting =
at least 13172736 bytes
=20
 =3D=3D=3D Converting to streamOptimized from image with small cluster si=
ze=3D=3D=3D
@@ -2049,7 +2049,7 @@ wrote 512/512 bytes at offset 10240
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
=20
 =3D=3D=3D Testing monolithicFlat with internally generated JSON file nam=
e =3D=3D=3D
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 subformat=3D=
monolithicFlat
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
 qemu-io: can't open: Cannot use relative extent paths with VMDK descript=
or file 'json:{"image": {"driver": "file", "filename": "TEST_DIR/t.IMGFMT=
"}, "driver": "blkdebug", "inject-error.0.event": "read_aio"}'
=20
 =3D=3D=3D Testing version 3 =3D=3D=3D
@@ -2259,7 +2259,7 @@ read 512/512 bytes at offset 64931328
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
=20
 =3D=3D=3D Testing 4TB monolithicFlat creation and IO =3D=3D=3D
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4398046511104 subfor=
mat=3DmonolithicFlat
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4398046511104
 image: TEST_DIR/t.IMGFMT
 file format: IMGFMT
 virtual size: 4 TiB (4398046511104 bytes)
@@ -2333,7 +2333,7 @@ read 1024/1024 bytes at offset 966367641600
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
=20
 =3D=3D=3D Testing qemu-img map on extents =3D=3D=3D
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D33285996544 subforma=
t=3DmonolithicSparse
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D33285996544
 wrote 1024/1024 bytes at offset 65024
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 1024/1024 bytes at offset 2147483136
@@ -2344,7 +2344,7 @@ Offset          Length          Mapped to       Fil=
e
 0               0x20000         0x3f0000        TEST_DIR/t.vmdk
 0x7fff0000      0x20000         0x410000        TEST_DIR/t.vmdk
 0x140000000     0x10000         0x430000        TEST_DIR/t.vmdk
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D33285996544 subforma=
t=3DtwoGbMaxExtentSparse
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D33285996544
 wrote 1024/1024 bytes at offset 65024
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 1024/1024 bytes at offset 2147483136
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common=
.filter
index 35fddc746f..64dd9200f3 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -130,8 +130,8 @@ _filter_img_create()
         -e "s# compat6=3D\\(on\\|off\\)##g" \
         -e "s# static=3D\\(on\\|off\\)##g" \
         -e "s# zeroed_grain=3D\\(on\\|off\\)##g" \
-        -e "s# subformat=3D'[^']*'##g" \
-        -e "s# adapter_type=3D'[^']*'##g" \
+        -e "s# subformat=3D[^ ]*##g" \
+        -e "s# adapter_type=3D[^ ]*##g" \
         -e "s# hwversion=3D[^ ]*##g" \
         -e "s# lazy_refcounts=3D\\(on\\|off\\)##g" \
         -e "s# block_size=3D[0-9]\\+##g" \
--=20
2.21.0


