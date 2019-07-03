Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB65D5EF11
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 00:15:38 +0200 (CEST)
Received: from localhost ([::1]:41356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hinXN-0003IG-WE
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 18:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46536)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hinFn-0006nh-Gw
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:57:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hinFm-0004s0-EN
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:57:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48396)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hinFj-0004np-63; Wed, 03 Jul 2019 17:57:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B6F39308213A;
 Wed,  3 Jul 2019 21:57:21 +0000 (UTC)
Received: from probe.redhat.com (ovpn-123-117.rdu2.redhat.com [10.10.123.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6037750F55;
 Wed,  3 Jul 2019 21:56:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 17:55:40 -0400
Message-Id: <20190703215542.16123-17-jsnow@redhat.com>
In-Reply-To: <20190703215542.16123-1-jsnow@redhat.com>
References: <20190703215542.16123-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 03 Jul 2019 21:57:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 16/18] iotests: Add virtio-scsi device helper
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 vsementsov@virtuozzo.com, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Seems that it comes up enough.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/040        | 6 +-----
 tests/qemu-iotests/093        | 6 ++----
 tests/qemu-iotests/139        | 7 ++-----
 tests/qemu-iotests/238        | 5 +----
 tests/qemu-iotests/iotests.py | 4 ++++
 5 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index b81133a474..657b37103c 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -85,11 +85,7 @@ class TestSingleDrive(ImageCommitTestCase):
         qemu_io('-f', 'raw', '-c', 'write -P 0xab 0 524288', backing_img=
)
         qemu_io('-f', iotests.imgfmt, '-c', 'write -P 0xef 524288 524288=
', mid_img)
         self.vm =3D iotests.VM().add_drive(test_img, "node-name=3Dtop,ba=
cking.node-name=3Dmid,backing.backing.node-name=3Dbase", interface=3D"non=
e")
-        if iotests.qemu_default_machine =3D=3D 's390-ccw-virtio':
-            self.vm.add_device("virtio-scsi-ccw")
-        else:
-            self.vm.add_device("virtio-scsi-pci")
-
+        self.vm.add_device(iotests.get_virtio_scsi_device())
         self.vm.add_device("scsi-hd,id=3Dscsi0,drive=3Ddrive0")
         self.vm.launch()
=20
diff --git a/tests/qemu-iotests/093 b/tests/qemu-iotests/093
index d88fbc182e..46153220f8 100755
--- a/tests/qemu-iotests/093
+++ b/tests/qemu-iotests/093
@@ -366,10 +366,8 @@ class ThrottleTestGroupNames(iotests.QMPTestCase):
 class ThrottleTestRemovableMedia(iotests.QMPTestCase):
     def setUp(self):
         self.vm =3D iotests.VM()
-        if iotests.qemu_default_machine =3D=3D 's390-ccw-virtio':
-            self.vm.add_device("virtio-scsi-ccw,id=3Dvirtio-scsi")
-        else:
-            self.vm.add_device("virtio-scsi-pci,id=3Dvirtio-scsi")
+        self.vm.add_device("{},id=3Dvirtio-scsi".format(
+            iotests.get_virtio_scsi_device()))
         self.vm.launch()
=20
     def tearDown(self):
diff --git a/tests/qemu-iotests/139 b/tests/qemu-iotests/139
index 933b45121a..2176ea51ba 100755
--- a/tests/qemu-iotests/139
+++ b/tests/qemu-iotests/139
@@ -35,11 +35,8 @@ class TestBlockdevDel(iotests.QMPTestCase):
     def setUp(self):
         iotests.qemu_img('create', '-f', iotests.imgfmt, base_img, '1M')
         self.vm =3D iotests.VM()
-        if iotests.qemu_default_machine =3D=3D 's390-ccw-virtio':
-            self.vm.add_device("virtio-scsi-ccw,id=3Dvirtio-scsi")
-        else:
-            self.vm.add_device("virtio-scsi-pci,id=3Dvirtio-scsi")
-
+        self.vm.add_device("{},id=3Dvirtio-scsi".format(
+            iotests.get_virtio_scsi_device()))
         self.vm.launch()
=20
     def tearDown(self):
diff --git a/tests/qemu-iotests/238 b/tests/qemu-iotests/238
index 1c0a46fa90..387a77b2cd 100755
--- a/tests/qemu-iotests/238
+++ b/tests/qemu-iotests/238
@@ -23,10 +23,7 @@ import os
 import iotests
 from iotests import log
=20
-if iotests.qemu_default_machine =3D=3D 's390-ccw-virtio':
-    virtio_scsi_device =3D 'virtio-scsi-ccw'
-else:
-    virtio_scsi_device =3D 'virtio-scsi-pci'
+virtio_scsi_device =3D iotests.get_virtio_scsi_device()
=20
 vm =3D iotests.VM()
 vm.launch()
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index db00fd2adf..0b5278c5b4 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -164,6 +164,10 @@ def qemu_io_silent(*args):
                          (-exitcode, ' '.join(args)))
     return exitcode
=20
+def get_virtio_scsi_device():
+    if qemu_default_machine =3D=3D 's390-ccw-virtio':
+        return 'virtio-scsi-ccw'
+    return 'virtio-scsi-pci'
=20
 class QemuIoInteractive:
     def __init__(self, *args):
--=20
2.21.0


