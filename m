Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45DC41D0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 22:32:42 +0200 (CEST)
Received: from localhost ([::1]:47858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFOp5-0007tG-7p
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 16:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54517)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO8D-0004wY-Q8
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:48:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO89-00085w-Nb
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:48:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37874)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO83-00080s-KW; Tue, 01 Oct 2019 15:48:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6217B10CC1E6;
 Tue,  1 Oct 2019 19:48:09 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE6C95C1D4;
 Tue,  1 Oct 2019 19:48:08 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 22/67] iotests/057: Honor $IMGOPTS
Date: Tue,  1 Oct 2019 21:46:30 +0200
Message-Id: <20191001194715.2796-23-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 01 Oct 2019 19:48:09 +0000 (UTC)
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
 tests/qemu-iotests/057 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/057 b/tests/qemu-iotests/057
index f5aa5929dc..c83f969b09 100755
--- a/tests/qemu-iotests/057
+++ b/tests/qemu-iotests/057
@@ -23,7 +23,7 @@
 import time
 import os
 import iotests
-from iotests import qemu_img, qemu_io
+from iotests import create_test_image, remove_test_image, qemu_io
=20
 test_drv_base_name =3D 'drive'
=20
@@ -40,7 +40,7 @@ class ImageSnapshotTestCase(iotests.QMPTestCase):
             filename =3D '%s%d' % (test_img_base_name, i)
             img =3D os.path.join(iotests.test_dir, filename)
             device =3D '%s%d' % (test_drv_base_name, i)
-            qemu_img('create', '-f', iotests.imgfmt, img, str(self.image=
_len))
+            create_test_image(img, self.image_len)
             self.vm.add_drive(img)
             self.expect.append({'image': img, 'device': device,
                                 'snapshots': [],
@@ -50,7 +50,7 @@ class ImageSnapshotTestCase(iotests.QMPTestCase):
     def tearDown(self):
         self.vm.shutdown()
         for dev_expect in self.expect:
-            os.remove(dev_expect['image'])
+            remove_test_image(dev_expect['image'])
=20
     def createSnapshotInTransaction(self, snapshot_num, abort =3D False)=
:
         actions =3D []
--=20
2.21.0


