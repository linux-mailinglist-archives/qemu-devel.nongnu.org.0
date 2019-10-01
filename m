Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0568DC41BC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 22:22:19 +0200 (CEST)
Received: from localhost ([::1]:47798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFOf3-0007eV-6R
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 16:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54753)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO8S-0005CF-RP
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:48:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO8R-0008F6-P4
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:48:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60242)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO8P-0008DM-3d; Tue, 01 Oct 2019 15:48:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5ACAF10DCC98;
 Tue,  1 Oct 2019 19:48:32 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E923E5C1D4;
 Tue,  1 Oct 2019 19:48:31 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 32/67] iotests/151: Honor $IMGOPTS
Date: Tue,  1 Oct 2019 21:46:40 +0200
Message-Id: <20191001194715.2796-33-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Tue, 01 Oct 2019 19:48:32 +0000 (UTC)
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
 tests/qemu-iotests/151 | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index 76ae265cc1..bfe2bbb200 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -20,7 +20,7 @@
=20
 import os
 import iotests
-from iotests import qemu_img
+from iotests import create_test_image, remove_test_image
=20
 source_img =3D os.path.join(iotests.test_dir, 'source.' + iotests.imgfmt=
)
 target_img =3D os.path.join(iotests.test_dir, 'target.' + iotests.imgfmt=
)
@@ -30,8 +30,8 @@ class TestActiveMirror(iotests.QMPTestCase):
     potential_writes_in_flight =3D True
=20
     def setUp(self):
-        qemu_img('create', '-f', iotests.imgfmt, source_img, '128M')
-        qemu_img('create', '-f', iotests.imgfmt, target_img, '128M')
+        create_test_image(source_img, '128M')
+        create_test_image(target_img, '128M')
=20
         blk_source =3D {'id': 'source',
                       'if': 'none',
@@ -58,8 +58,8 @@ class TestActiveMirror(iotests.QMPTestCase):
             self.assertTrue(iotests.compare_images(source_img, target_im=
g),
                             'mirror target does not match source')
=20
-        os.remove(source_img)
-        os.remove(target_img)
+        remove_test_image(source_img)
+        remove_test_image(target_img)
=20
     def doActiveIO(self, sync_source_and_target):
         # Fill the source image
--=20
2.21.0


