Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E189D559F2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 23:29:46 +0200 (CEST)
Received: from localhost ([::1]:35370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hft0b-0004dW-Ru
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 17:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41974)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hfsrn-00007h-S8
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 17:20:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hfsrm-0004jp-AV
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 17:20:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57368)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hfsrf-0004Bm-Ue; Tue, 25 Jun 2019 17:20:32 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7A052882FF;
 Tue, 25 Jun 2019 21:20:16 +0000 (UTC)
Received: from localhost (ovpn-204-63.brq.redhat.com [10.40.204.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 128381972D;
 Tue, 25 Jun 2019 21:20:15 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 25 Jun 2019 23:19:54 +0200
Message-Id: <20190625211955.15664-5-mreitz@redhat.com>
In-Reply-To: <20190625211955.15664-1-mreitz@redhat.com>
References: <20190625211955.15664-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 25 Jun 2019 21:20:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 4/5] iotests: Test driver whitelisting in 093
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

null-aio may not be whitelisted.  Skip all test cases that require it.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/093 | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/093 b/tests/qemu-iotests/093
index bd56c94708..806bdcaa24 100755
--- a/tests/qemu-iotests/093
+++ b/tests/qemu-iotests/093
@@ -22,9 +22,11 @@
 import iotests
=20
 nsec_per_sec =3D 1000000000
+supported_null_drivers =3D [ f for f in iotests.supported_formats()
+                           if f.startswith('null-') ]
=20
 class ThrottleTestCase(iotests.QMPTestCase):
-    test_img =3D "null-aio://"
+    test_driver =3D "null-aio"
     max_drives =3D 3
=20
     def blockstats(self, device):
@@ -36,9 +38,13 @@ class ThrottleTestCase(iotests.QMPTestCase):
         raise Exception("Device not found for blockstats: %s" % device)
=20
     def setUp(self):
+        global supported_null_drivers
+        if self.test_driver not in supported_null_drivers:
+            self.case_skip('%s support missing' % self.test_driver)
+
         self.vm =3D iotests.VM()
         for i in range(0, self.max_drives):
-            self.vm.add_drive(self.test_img)
+            self.vm.add_drive(self.test_driver + "://")
         self.vm.launch()
=20
     def tearDown(self):
@@ -264,7 +270,7 @@ class ThrottleTestCase(iotests.QMPTestCase):
         self.assertEqual(self.blockstats('drive1')[0], 4096)
=20
 class ThrottleTestCoroutine(ThrottleTestCase):
-    test_img =3D "null-co://"
+    test_driver =3D "null-co"
=20
 class ThrottleTestGroupNames(iotests.QMPTestCase):
     max_drives =3D 3
@@ -426,4 +432,6 @@ class ThrottleTestRemovableMedia(iotests.QMPTestCase)=
:
=20
=20
 if __name__ =3D=3D '__main__':
+    if 'null-co' not in supported_null_drivers:
+        iotests.notrun('null-co driver support missing')
     iotests.main(supported_fmts=3D["raw"])
--=20
2.21.0


