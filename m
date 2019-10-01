Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E115C4252
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 23:10:06 +0200 (CEST)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFPPI-0007WW-4T
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 17:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO8e-0005PO-4G
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:48:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO8c-0008Kr-Vc
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:48:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59930)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO8a-0008J8-JK; Tue, 01 Oct 2019 15:48:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CF9A018C4266;
 Tue,  1 Oct 2019 19:48:43 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A4263D8F;
 Tue,  1 Oct 2019 19:48:43 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 37/67] iotests/169: Honor $IMGOPTS
Date: Tue,  1 Oct 2019 21:46:45 +0200
Message-Id: <20191001194715.2796-38-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 01 Oct 2019 19:48:43 +0000 (UTC)
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
 tests/qemu-iotests/169 | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/169 b/tests/qemu-iotests/169
index 5e978b7b7d..8d41463567 100755
--- a/tests/qemu-iotests/169
+++ b/tests/qemu-iotests/169
@@ -24,7 +24,7 @@ import time
 import itertools
 import operator
 import re
-from iotests import qemu_img
+from iotests import create_test_image, remove_test_image
=20
=20
 disk_a =3D os.path.join(iotests.test_dir, 'disk_a')
@@ -39,16 +39,16 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
     def tearDown(self):
         self.vm_a.shutdown()
         self.vm_b.shutdown()
-        os.remove(disk_a)
-        os.remove(disk_b)
+        remove_test_image(disk_a)
+        remove_test_image(disk_b)
         try:
             os.remove(mig_file)
         except OSError:
             pass
=20
     def setUp(self):
-        qemu_img('create', '-f', iotests.imgfmt, disk_a, size)
-        qemu_img('create', '-f', iotests.imgfmt, disk_b, size)
+        create_test_image(disk_a, size)
+        create_test_image(disk_b, size)
=20
         self.vm_a =3D iotests.VM(path_suffix=3D'a').add_drive(disk_a)
         self.vm_a.launch()
--=20
2.21.0


