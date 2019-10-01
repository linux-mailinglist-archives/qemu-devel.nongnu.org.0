Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B0EC41C8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 22:28:14 +0200 (CEST)
Received: from localhost ([::1]:47840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFOkl-00056x-9e
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 16:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO8b-0005MW-J9
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:48:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO8a-0008JP-Gi
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:48:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53146)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO8Y-0008ID-9I; Tue, 01 Oct 2019 15:48:42 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 872683084025;
 Tue,  1 Oct 2019 19:48:41 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24540261AA;
 Tue,  1 Oct 2019 19:48:40 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 36/67] iotests/165: Honor $IMGOPTS
Date: Tue,  1 Oct 2019 21:46:44 +0200
Message-Id: <20191001194715.2796-37-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 01 Oct 2019 19:48:41 +0000 (UTC)
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
 tests/qemu-iotests/165 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
index 97dd7102c3..0c92947f72 100755
--- a/tests/qemu-iotests/165
+++ b/tests/qemu-iotests/165
@@ -22,7 +22,7 @@ from __future__ import print_function
 import os
 import re
 import iotests
-from iotests import qemu_img
+from iotests import create_test_image, remove_test_image
=20
 disk =3D os.path.join(iotests.test_dir, 'disk')
 disk_size =3D 0x40000000 # 1G
@@ -37,10 +37,10 @@ regions2 =3D ((0x10000000, 0x20000),
 class TestPersistentDirtyBitmap(iotests.QMPTestCase):
=20
     def setUp(self):
-        qemu_img('create', '-f', iotests.imgfmt, disk, str(disk_size))
+        create_test_image(disk, disk_size)
=20
     def tearDown(self):
-        os.remove(disk)
+        remove_test_image(disk)
=20
     def mkVm(self):
         return iotests.VM().add_drive(disk)
--=20
2.21.0


