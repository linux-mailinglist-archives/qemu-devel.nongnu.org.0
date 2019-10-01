Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9BCC42E0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 23:42:58 +0200 (CEST)
Received: from localhost ([::1]:48484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFPv6-0005sb-5J
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 17:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55472)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO9N-0006Oc-32
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO9K-0000JH-QN
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60218)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO9I-0000Ho-8p; Tue, 01 Oct 2019 15:49:28 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 88B3E18C427F;
 Tue,  1 Oct 2019 19:49:27 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E16D1001B05;
 Tue,  1 Oct 2019 19:49:26 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 56/67] iotests/242: Honor $IMGOPTS
Date: Tue,  1 Oct 2019 21:47:04 +0200
Message-Id: <20191001194715.2796-57-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 01 Oct 2019 19:49:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/242 | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
index 333fb8b56c..bccd8a9fdf 100755
--- a/tests/qemu-iotests/242
+++ b/tests/qemu-iotests/242
@@ -21,14 +21,14 @@
 import iotests
 import json
 import struct
-from iotests import qemu_img_create, qemu_io, qemu_img_pipe, \
-    file_path, img_info_log, log, filter_qemu_io
+from iotests import create_test_image, remove_test_image, qemu_io, \
+    qemu_img_pipe, image_path, img_info_log, log, filter_qemu_io
=20
 iotests.script_initialize(supported_fmts=3D['qcow2'],
                           # compat=3D1.1 is needed for dirty bitmaps
                           unsupported_imgopts=3D['compat=3D0.10'])
=20
-disk =3D file_path('disk')
+disk =3D image_path('disk')
 chunk =3D 256 * 1024
 bitmap_flag_unknown =3D 1 << 2
 # flag_offset =3D 5*cluster_size + flag_offset_in_bitmap_directory_entry
@@ -74,7 +74,7 @@ def toggle_flag(offset):
         f.write(struct.pack("B", toggled))
=20
=20
-qemu_img_create('-f', iotests.imgfmt, disk, '1M')
+create_test_image(disk, '1M')
=20
 for num in range(1, 4):
     disabled =3D False
@@ -95,7 +95,8 @@ vm.shutdown()
=20
 num +=3D 1
 log('\nTest {}'.format(num))
-qemu_img_create('-f', iotests.imgfmt, disk, '1M')
+remove_test_image(disk)
+create_test_image(disk, '1M')
 add_bitmap(1, True, False)
 log('Write an unknown bitmap flag \'{}\' into a new QCOW2 image at offse=
t {}'
     .format(hex(bitmap_flag_unknown), flag_offset))
--=20
2.21.0


