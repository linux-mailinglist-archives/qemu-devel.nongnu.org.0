Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1485EAEB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 19:53:43 +0200 (CEST)
Received: from localhost ([::1]:38148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hijRv-0002eT-29
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 13:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49055)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hij3x-0007ns-Il
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 13:28:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hij3v-0008Up-NI
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 13:28:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49840)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hij3r-00081w-G8; Wed, 03 Jul 2019 13:28:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 536D785A03;
 Wed,  3 Jul 2019 17:28:34 +0000 (UTC)
Received: from localhost (ovpn-204-65.brq.redhat.com [10.40.204.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFC6291F40;
 Wed,  3 Jul 2019 17:28:33 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed,  3 Jul 2019 19:28:09 +0200
Message-Id: <20190703172813.6868-9-mreitz@redhat.com>
In-Reply-To: <20190703172813.6868-1-mreitz@redhat.com>
References: <20190703172813.6868-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 03 Jul 2019 17:28:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 08/12] iotests: Compare error messages in 030
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

Currently, 030 just compares the error class, which does not say
anything.

Before HEAD^ added throttling to test_overlapping_4, that test actually
usually failed because node2 was already gone, not because it was the
commit and stream job were not allowed to overlap.

Prevent such problems in the future by comparing the error description
instead.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Tested-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 tests/qemu-iotests/030 | 66 +++++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 2cf8d54dc5..10fe1de89d 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -144,11 +144,12 @@ class TestSingleDrive(iotests.QMPTestCase):
=20
     def test_device_not_found(self):
         result =3D self.vm.qmp('block-stream', device=3D'nonexistent')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            'Cannot find device=3Dnonexistent nor node_name=3Dnonexisten=
t')
=20
     def test_job_id_missing(self):
         result =3D self.vm.qmp('block-stream', device=3D'mid')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc', "Invalid job ID ''")
=20
=20
 class TestParallelOps(iotests.QMPTestCase):
@@ -245,24 +246,30 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_qmp(result, 'return', {})
=20
         result =3D self.vm.qmp('block-stream', device=3D'node5', job_id=3D=
'stream-node5', base=3Dself.imgs[2])
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'node4' is busy: block device is in use by block job: =
stream")
=20
         result =3D self.vm.qmp('block-stream', device=3D'node3', job_id=3D=
'stream-node3', base=3Dself.imgs[2])
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'node3' is busy: block device is in use by block job: =
stream")
=20
         result =3D self.vm.qmp('block-stream', device=3D'node4', job_id=3D=
'stream-node4-v2')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'node4' is busy: block device is in use by block job: =
stream")
=20
         # block-commit should also fail if it touches nodes used by the =
stream job
         result =3D self.vm.qmp('block-commit', device=3D'drive0', base=3D=
self.imgs[4], job_id=3D'commit-node4')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'node4' is busy: block device is in use by block job: =
stream")
=20
         result =3D self.vm.qmp('block-commit', device=3D'drive0', base=3D=
self.imgs[1], top=3Dself.imgs[3], job_id=3D'commit-node1')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'node3' is busy: block device is in use by block job: =
stream")
=20
         # This fails because it needs to modify the backing string in no=
de2, which is blocked
         result =3D self.vm.qmp('block-commit', device=3D'drive0', base=3D=
self.imgs[0], top=3Dself.imgs[1], job_id=3D'commit-node0')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'node2' is busy: block device is in use by block job: =
stream")
=20
         result =3D self.vm.qmp('block-job-set-speed', device=3D'stream-n=
ode4', speed=3D0)
         self.assert_qmp(result, 'return', {})
@@ -281,20 +288,25 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_qmp(result, 'return', {})
=20
         result =3D self.vm.qmp('block-stream', device=3D'node3', job_id=3D=
'stream-node3')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'node3' is busy: block device is in use by block job: =
commit")
=20
         result =3D self.vm.qmp('block-stream', device=3D'node6', base=3D=
self.imgs[2], job_id=3D'stream-node6')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'node5' is busy: block device is in use by block job: =
commit")
=20
         result =3D self.vm.qmp('block-stream', device=3D'node4', base=3D=
self.imgs[2], job_id=3D'stream-node4')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'node4' is busy: block device is in use by block job: =
commit")
=20
         result =3D self.vm.qmp('block-stream', device=3D'node6', base=3D=
self.imgs[4], job_id=3D'stream-node6-v2')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'node5' is busy: block device is in use by block job: =
commit")
=20
         # This fails because block-commit currently blocks the active la=
yer even if it's not used
         result =3D self.vm.qmp('block-stream', device=3D'drive0', base=3D=
self.imgs[5], job_id=3D'stream-drive0')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'drive0' is busy: block device is in use by block job:=
 commit")
=20
         result =3D self.vm.qmp('block-job-set-speed', device=3D'commit-n=
ode3', speed=3D0)
         self.assert_qmp(result, 'return', {})
@@ -312,7 +324,8 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_qmp(result, 'return', {})
=20
         result =3D self.vm.qmp('block-stream', device=3D'node5', base=3D=
self.imgs[3], job_id=3D'stream-node6')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'node5' is busy: block device is in use by block job: =
commit")
=20
         event =3D self.vm.event_wait(name=3D'BLOCK_JOB_READY')
         self.assert_qmp(event, 'data/device', 'commit-drive0')
@@ -328,20 +341,21 @@ class TestParallelOps(iotests.QMPTestCase):
         self.wait_until_completed(drive=3D'commit-drive0')
=20
     # In this case the base node of the stream job is the same as the
-    # top node of commit job. Since block-commit removes the top node
-    # when it finishes, this is not allowed.
+    # top node of commit job. Since this results in the commit filter
+    # node being part of the stream chain, this is not allowed.
     def test_overlapping_4(self):
         self.assert_no_active_block_jobs()
=20
         # Commit from node2 into node0
         result =3D self.vm.qmp('block-commit', device=3D'drive0',
                              top=3Dself.imgs[2], base=3Dself.imgs[0],
-                             speed=3D1024*1024)
+                             filter_node_name=3D'commit-filter', speed=3D=
1024*1024)
         self.assert_qmp(result, 'return', {})
=20
         # Stream from node2 into node4
         result =3D self.vm.qmp('block-stream', device=3D'node4', base_no=
de=3D'node2', job_id=3D'node4')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Cannot freeze 'backing' link to 'commit-filter'")
=20
         result =3D self.vm.qmp('block-job-set-speed', device=3D'drive0',=
 speed=3D0)
         self.assert_qmp(result, 'return', {})
@@ -428,19 +442,23 @@ class TestParallelOps(iotests.QMPTestCase):
=20
         # Error: the base node does not exist
         result =3D self.vm.qmp('block-stream', device=3D'node4', base_no=
de=3D'none', job_id=3D'stream')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            'Cannot find device=3D nor node_name=3Dnone')
=20
         # Error: the base node is not a backing file of the top node
         result =3D self.vm.qmp('block-stream', device=3D'node4', base_no=
de=3D'node6', job_id=3D'stream')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'node6' is not a backing image of 'node4'")
=20
         # Error: the base node is the same as the top node
         result =3D self.vm.qmp('block-stream', device=3D'node4', base_no=
de=3D'node4', job_id=3D'stream')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "Node 'node4' is not a backing image of 'node4'")
=20
         # Error: cannot specify 'base' and 'base-node' at the same time
         result =3D self.vm.qmp('block-stream', device=3D'node4', base=3D=
self.imgs[2], base_node=3D'node2', job_id=3D'stream')
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc',
+            "'base' and 'base-node' cannot be specified at the same time=
")
=20
         # Success: the base node is a backing file of the top node
         result =3D self.vm.qmp('block-stream', device=3D'node4', base_no=
de=3D'node2', job_id=3D'stream')
@@ -873,7 +891,7 @@ class TestSetSpeed(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
=20
         result =3D self.vm.qmp('block-stream', device=3D'drive0', speed=3D=
-1)
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc', "Invalid parameter 'speed'=
")
=20
         self.assert_no_active_block_jobs()
=20
@@ -882,7 +900,7 @@ class TestSetSpeed(iotests.QMPTestCase):
         self.assert_qmp(result, 'return', {})
=20
         result =3D self.vm.qmp('block-job-set-speed', device=3D'drive0',=
 speed=3D-1)
-        self.assert_qmp(result, 'error/class', 'GenericError')
+        self.assert_qmp(result, 'error/desc', "Invalid parameter 'speed'=
")
=20
         self.cancel_and_wait(resume=3DTrue)
=20
--=20
2.21.0


