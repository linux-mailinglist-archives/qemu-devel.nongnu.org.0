Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492C3162823
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 15:28:30 +0100 (CET)
Received: from localhost ([::1]:36188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j43rR-00068v-Bp
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 09:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j43YL-00008T-Ma
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j43YJ-0001ol-Ay
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:45 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57823
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j43YJ-0001oC-7v
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582034922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bgn5GrIFHeqlAJfVrmvLgBgYJog1KOmzIRWR6dWsupU=;
 b=KN5MmIUy+9MQIDETUksQQizJ4Y7KqsGWwXzHq/1EaYeKXqv9dEyoEx3+8ZXroKU05e91hu
 bbi7OfUprfhFdsHgNGSt2FR7IpeUdi04w9RJqRh1C3j1kdg68dNLP4EApSQ1sdmDFlQ4So
 kKKZsIv4iiNChvszRX9c813/tGpaZY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-kJWTOM1zOZi27H-VYBifEA-1; Tue, 18 Feb 2020 09:08:39 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 982AFDB61;
 Tue, 18 Feb 2020 14:08:38 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-181.ams2.redhat.com
 [10.36.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AA9219E9C;
 Tue, 18 Feb 2020 14:08:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 35/36] iotests: Add tests for invalid Quorum @replaces
Date: Tue, 18 Feb 2020 15:07:21 +0100
Message-Id: <20200218140722.23876-36-kwolf@redhat.com>
In-Reply-To: <20200218140722.23876-1-kwolf@redhat.com>
References: <20200218140722.23876-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: kJWTOM1zOZi27H-VYBifEA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Add two tests to see that you cannot replace a Quorum child with the
mirror job while the child is in use by a different parent.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20200218103454.296704-19-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/041     | 70 +++++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/041.out |  4 +--
 2 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 1d9e64ff6d..7af6de9124 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -20,6 +20,7 @@
=20
 import time
 import os
+import re
 import iotests
 from iotests import qemu_img, qemu_io
=20
@@ -34,6 +35,8 @@ quorum_img3 =3D os.path.join(iotests.test_dir, 'quorum3.i=
mg')
 quorum_repair_img =3D os.path.join(iotests.test_dir, 'quorum_repair.img')
 quorum_snapshot_file =3D os.path.join(iotests.test_dir, 'quorum_snapshot.i=
mg')
=20
+nbd_sock_path =3D os.path.join(iotests.test_dir, 'nbd.sock')
+
 class TestSingleDrive(iotests.QMPTestCase):
     image_len =3D 1 * 1024 * 1024 # MB
     qmp_cmd =3D 'drive-mirror'
@@ -892,7 +895,8 @@ class TestRepairQuorum(iotests.QMPTestCase):
=20
     def tearDown(self):
         self.vm.shutdown()
-        for i in self.IMAGES + [ quorum_repair_img, quorum_snapshot_file ]=
:
+        for i in self.IMAGES + [ quorum_repair_img, quorum_snapshot_file,
+                                 nbd_sock_path ]:
             # Do a try/except because the test may have deleted some image=
s
             try:
                 os.remove(i)
@@ -1032,6 +1036,70 @@ class TestRepairQuorum(iotests.QMPTestCase):
         self.assert_has_block_node("repair0", quorum_repair_img)
         self.vm.assert_block_path('quorum0', '/children.1', 'repair0')
=20
+    def test_with_other_parent(self):
+        """
+        Check that we cannot replace a Quorum child when it has other
+        parents.
+        """
+        result =3D self.vm.qmp('nbd-server-start',
+                             addr=3D{
+                                 'type': 'unix',
+                                 'data': {'path': nbd_sock_path}
+                             })
+        self.assert_qmp(result, 'return', {})
+
+        result =3D self.vm.qmp('nbd-server-add', device=3D'img1')
+        self.assert_qmp(result, 'return', {})
+
+        result =3D self.vm.qmp('drive-mirror', job_id=3D'mirror', device=
=3D'quorum0',
+                             sync=3D'full', node_name=3D'repair0', replace=
s=3D'img1',
+                             target=3Dquorum_repair_img, format=3Diotests.=
imgfmt)
+        self.assert_qmp(result, 'error/desc',
+                        "Cannot replace 'img1' by a node mirrored from "
+                        "'quorum0', because it cannot be guaranteed that d=
oing "
+                        "so would not lead to an abrupt change of visible =
data")
+
+    def test_with_other_parents_after_mirror_start(self):
+        """
+        The same as test_with_other_parent(), but add the NBD server
+        only when the mirror job is already running.
+        """
+        result =3D self.vm.qmp('nbd-server-start',
+                             addr=3D{
+                                 'type': 'unix',
+                                 'data': {'path': nbd_sock_path}
+                             })
+        self.assert_qmp(result, 'return', {})
+
+        result =3D self.vm.qmp('drive-mirror', job_id=3D'mirror', device=
=3D'quorum0',
+                             sync=3D'full', node_name=3D'repair0', replace=
s=3D'img1',
+                             target=3Dquorum_repair_img, format=3Diotests.=
imgfmt)
+        self.assert_qmp(result, 'return', {})
+
+        result =3D self.vm.qmp('nbd-server-add', device=3D'img1')
+        self.assert_qmp(result, 'return', {})
+
+        # The full error message goes to stderr, we will check it later
+        self.complete_and_wait('mirror',
+                               completion_error=3D'Operation not permitted=
')
+
+        # Should not have been replaced
+        self.vm.assert_block_path('quorum0', '/children.1', 'img1')
+
+        # Check the full error message now
+        self.vm.shutdown()
+        log =3D self.vm.get_log()
+        log =3D re.sub(r'^\[I \d+\.\d+\] OPENED\n', '', log)
+        log =3D re.sub(r'^Formatting.*\n', '', log)
+        log =3D re.sub(r'\n\[I \+\d+\.\d+\] CLOSED\n?$', '', log)
+        log =3D re.sub(r'^%s: ' % os.path.basename(iotests.qemu_prog), '',=
 log)
+
+        self.assertEqual(log,
+                         "Can no longer replace 'img1' by 'repair0', becau=
se " +
+                         "it can no longer be guaranteed that doing so wou=
ld " +
+                         "not lead to an abrupt change of visible data")
+
+
 # Test mirroring with a source that does not have any parents (not even a
 # BlockBackend)
 class TestOrphanedSource(iotests.QMPTestCase):
diff --git a/tests/qemu-iotests/041.out b/tests/qemu-iotests/041.out
index f496be9197..ffc779b4d1 100644
--- a/tests/qemu-iotests/041.out
+++ b/tests/qemu-iotests/041.out
@@ -1,5 +1,5 @@
-..........................................................................=
.................
+..........................................................................=
...................
 ----------------------------------------------------------------------
-Ran 91 tests
+Ran 93 tests
=20
 OK
--=20
2.20.1


