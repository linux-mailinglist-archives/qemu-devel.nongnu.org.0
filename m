Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA034C41F0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 22:47:34 +0200 (CEST)
Received: from localhost ([::1]:47972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFP3U-0004LJ-Oi
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 16:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54777)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO8U-0005EJ-Rf
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:48:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO8T-0008GI-MQ
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:48:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44268)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO8R-0008EQ-Cj; Tue, 01 Oct 2019 15:48:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A50B93082E03;
 Tue,  1 Oct 2019 19:48:34 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 407FA261B3;
 Tue,  1 Oct 2019 19:48:34 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 33/67] iotests/152: Honor $IMGOPTS
Date: Tue,  1 Oct 2019 21:46:41 +0200
Message-Id: <20191001194715.2796-34-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 01 Oct 2019 19:48:34 +0000 (UTC)
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
 tests/qemu-iotests/152 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/152 b/tests/qemu-iotests/152
index 732bf5f062..123ca0cd5d 100755
--- a/tests/qemu-iotests/152
+++ b/tests/qemu-iotests/152
@@ -20,20 +20,20 @@
=20
 import os
 import iotests
-from iotests import qemu_img
+from iotests import create_test_image, remove_test_image
=20
 test_img =3D os.path.join(iotests.test_dir, 'test.img')
 target_img =3D os.path.join(iotests.test_dir, 'target.img')
=20
 class TestUnaligned(iotests.QMPTestCase):
     def setUp(self):
-        qemu_img('create', '-f', iotests.imgfmt, test_img, '512')
+        create_test_image(test_img, 512)
         self.vm =3D iotests.VM().add_drive(test_img)
         self.vm.launch()
=20
     def tearDown(self):
         self.vm.shutdown()
-        os.remove(test_img)
+        remove_test_image(test_img)
         try:
             os.remove(target_img)
         except OSError:
--=20
2.21.0


