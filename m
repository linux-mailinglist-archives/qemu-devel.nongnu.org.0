Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F02360F9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 18:16:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYYaK-0001vn-CO
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 12:16:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hYYVx-0007aq-8O
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 12:11:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hYYVw-00037S-6M
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 12:11:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40164)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hYYVt-0002u3-DH; Wed, 05 Jun 2019 12:11:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EBA1C0586C4;
	Wed,  5 Jun 2019 16:11:41 +0000 (UTC)
Received: from localhost (unknown [10.40.205.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BABA32C8C3;
	Wed,  5 Jun 2019 16:11:37 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed,  5 Jun 2019 18:11:18 +0200
Message-Id: <20190605161118.14544-5-mreitz@redhat.com>
In-Reply-To: <20190605161118.14544-1-mreitz@redhat.com>
References: <20190605161118.14544-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 05 Jun 2019 16:11:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/4] iotests: Test commit with a filter on the
 chain
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
	Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before the previous patches, the first case resulted in a failed
assertion (which is noted as qemu receiving a SIGABRT in the test
output), and the second usually triggered a segmentation fault.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/040     | 40 +++++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/040.out |  4 ++--
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index b81133a474..aa0b1847e3 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -92,9 +92,10 @@ class TestSingleDrive(ImageCommitTestCase):
=20
         self.vm.add_device("scsi-hd,id=3Dscsi0,drive=3Ddrive0")
         self.vm.launch()
+        self.has_quit =3D False
=20
     def tearDown(self):
-        self.vm.shutdown()
+        self.vm.shutdown(has_quit=3Dself.has_quit)
         os.remove(test_img)
         os.remove(mid_img)
         os.remove(backing_img)
@@ -109,6 +110,43 @@ class TestSingleDrive(ImageCommitTestCase):
         self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 =
524288', backing_img).find("verification failed"))
         self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xef 52=
4288 524288', backing_img).find("verification failed"))
=20
+    def test_commit_with_filter_and_quit(self):
+        result =3D self.vm.qmp('object-add', qom_type=3D'throttle-group'=
, id=3D'tg')
+        self.assert_qmp(result, 'return', {})
+
+        # Add a filter outside of the backing chain
+        result =3D self.vm.qmp('blockdev-add', driver=3D'throttle', node=
_name=3D'filter', throttle_group=3D'tg', file=3D'mid')
+        self.assert_qmp(result, 'return', {})
+
+        result =3D self.vm.qmp('block-commit', device=3D'drive0')
+        self.assert_qmp(result, 'return', {})
+
+        # Quit immediately, thus forcing a simultaneous cancel of the
+        # block job and a bdrv_drain_all()
+        result =3D self.vm.qmp('quit')
+        self.assert_qmp(result, 'return', {})
+
+        self.has_quit =3D True
+
+    # Same as above, but this time we add the filter after starting the =
job
+    def test_commit_plus_filter_and_quit(self):
+        result =3D self.vm.qmp('object-add', qom_type=3D'throttle-group'=
, id=3D'tg')
+        self.assert_qmp(result, 'return', {})
+
+        result =3D self.vm.qmp('block-commit', device=3D'drive0')
+        self.assert_qmp(result, 'return', {})
+
+        # Add a filter outside of the backing chain
+        result =3D self.vm.qmp('blockdev-add', driver=3D'throttle', node=
_name=3D'filter', throttle_group=3D'tg', file=3D'mid')
+        self.assert_qmp(result, 'return', {})
+
+        # Quit immediately, thus forcing a simultaneous cancel of the
+        # block job and a bdrv_drain_all()
+        result =3D self.vm.qmp('quit')
+        self.assert_qmp(result, 'return', {})
+
+        self.has_quit =3D True
+
     def test_device_not_found(self):
         result =3D self.vm.qmp('block-commit', device=3D'nonexistent', t=
op=3D'%s' % mid_img)
         self.assert_qmp(result, 'error/class', 'DeviceNotFound')
diff --git a/tests/qemu-iotests/040.out b/tests/qemu-iotests/040.out
index 802ffaa0c0..220a5fa82c 100644
--- a/tests/qemu-iotests/040.out
+++ b/tests/qemu-iotests/040.out
@@ -1,5 +1,5 @@
-...........................................
+...............................................
 ----------------------------------------------------------------------
-Ran 43 tests
+Ran 47 tests
=20
 OK
--=20
2.21.0


