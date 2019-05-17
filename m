Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847DC216BE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 12:10:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRZoe-0006vy-M9
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 06:10:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hRZmT-0005mF-3Y
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:08:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hRZbl-00066T-JU
	for qemu-devel@nongnu.org; Fri, 17 May 2019 05:57:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60930)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hRZbk-00063j-4s; Fri, 17 May 2019 05:56:56 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A91A93082E21;
	Fri, 17 May 2019 09:56:43 +0000 (UTC)
Received: from localhost (unknown [10.40.205.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42AE3348F4;
	Fri, 17 May 2019 09:56:40 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 17 May 2019 11:56:27 +0200
Message-Id: <20190517095628.10119-4-mreitz@redhat.com>
In-Reply-To: <20190517095628.10119-1-mreitz@redhat.com>
References: <20190517095628.10119-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 17 May 2019 09:56:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/4] iotests: Test driver whitelisting in 093
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

null-aio may not be whitelisted.  If it is not, fall back to null-co.
This may run tests twice in the same configuration, but this is the
simplest way to effectively skip the tests in setUp() (without changing
the output, and while having the respective driver in a class
attribute).

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/093 | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/093 b/tests/qemu-iotests/093
index bd56c94708..d6f285001a 100755
--- a/tests/qemu-iotests/093
+++ b/tests/qemu-iotests/093
@@ -22,9 +22,11 @@
 import iotests
=20
 nsec_per_sec =3D 1000000000
+supported_null_drivers =3D list(filter(lambda f: f.startswith('null-'),
+                                     iotests.supported_formats()))
=20
 class ThrottleTestCase(iotests.QMPTestCase):
-    test_img =3D "null-aio://"
+    test_driver =3D "null-aio"
     max_drives =3D 3
=20
     def blockstats(self, device):
@@ -36,9 +38,14 @@ class ThrottleTestCase(iotests.QMPTestCase):
         raise Exception("Device not found for blockstats: %s" % device)
=20
     def setUp(self):
+        global supported_null_drivers
+        if self.test_driver not in supported_null_drivers:
+            # Silently fall back to supported driver
+            self.test_driver =3D supported_null_drivers[0]
+
         self.vm =3D iotests.VM()
         for i in range(0, self.max_drives):
-            self.vm.add_drive(self.test_img)
+            self.vm.add_drive(self.test_driver + "://")
         self.vm.launch()
=20
     def tearDown(self):
@@ -264,7 +271,7 @@ class ThrottleTestCase(iotests.QMPTestCase):
         self.assertEqual(self.blockstats('drive1')[0], 4096)
=20
 class ThrottleTestCoroutine(ThrottleTestCase):
-    test_img =3D "null-co://"
+    test_driver =3D "null-co"
=20
 class ThrottleTestGroupNames(iotests.QMPTestCase):
     max_drives =3D 3
@@ -426,4 +433,6 @@ class ThrottleTestRemovableMedia(iotests.QMPTestCase)=
:
=20
=20
 if __name__ =3D=3D '__main__':
+    if 'null-co' not in supported_null_drivers:
+        iotests.notrun('null-co driver support missing')
     iotests.main(supported_fmts=3D["raw"])
--=20
2.21.0


