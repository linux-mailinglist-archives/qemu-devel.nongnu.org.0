Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D79C17A5C6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 13:57:56 +0100 (CET)
Received: from localhost ([::1]:48562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9q4Z-0000CZ-8r
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 07:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43275)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j9py8-0008WA-Mf
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:51:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j9py7-0006Ow-An
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:51:16 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54492
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j9py7-0006OC-62
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583412674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ymmIvFo9y8it5tHvs5HJdQpTHTZ9Djw2gEhP2j+GG8=;
 b=LBwFAJGbCOK3h1sAfc/G36tYO+h5bvFtf9GkSSyjcb7WHZNQfkpe8nGHrE+nFABjtc2Lga
 RIDfXIED77XEgISGALVu5ZjcZdFKfpEIx4tVqowrkOuS4ti3eeaNHLBmzofsNI1NLqFH6Q
 5lVZaDRPk8cbykUXfP0YrPjq8VO3hH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-53eQi5msMailP53Gw0M6QQ-1; Thu, 05 Mar 2020 07:51:13 -0500
X-MC-Unique: 53eQi5msMailP53Gw0M6QQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED0A41005510;
 Thu,  5 Mar 2020 12:51:11 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-210.ams2.redhat.com
 [10.36.117.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE010272A3;
 Thu,  5 Mar 2020 12:51:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/4] iotests: Test mirror with temporarily disabled target
 backing file
Date: Thu,  5 Mar 2020 13:51:00 +0100
Message-Id: <20200305125100.386-5-kwolf@redhat.com>
In-Reply-To: <20200305125100.386-1-kwolf@redhat.com>
References: <20200305125100.386-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The newly tested scenario is a common live storage migration scenario:
The target node is opened without a backing file so that the active
layer is mirrored while its backing chain can be copied in the
background.

The backing chain should be attached to the mirror target node when
finalising the job, just before switching the users of the source node
to the new copy (at which point the mirror job still has a reference to
the node). drive-mirror did this automatically, but with blockdev-mirror
this is the job of the QMP client.

This patch adds test cases for two ways to achieve the desired result,
using either x-blockdev-reopen or blockdev-snapshot.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/155     | 54 ++++++++++++++++++++++++++++++++++----
 tests/qemu-iotests/155.out |  4 +--
 2 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index f237868710..8f293a9885 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -45,10 +45,15 @@ target_img =3D os.path.join(iotests.test_dir, 'target.'=
 + iotests.imgfmt)
 #                      image during runtime, only makes sense if
 #                      target_blockdev_backing is not None
 #                      (None: same as target_backing)
+# target_open_with_backing: If True, the target image is added with its ba=
cking
+#                           chain opened right away. If False, blockdev-ad=
d
+#                           opens it without a backing file and job comple=
tion
+#                           is supposed to open the backing chain.
=20
 class BaseClass(iotests.QMPTestCase):
     target_blockdev_backing =3D None
     target_real_backing =3D None
+    target_open_with_backing =3D True
=20
     def setUp(self):
         qemu_img('create', '-f', iotests.imgfmt, back0_img, '1440K')
@@ -80,9 +85,13 @@ class BaseClass(iotests.QMPTestCase):
                 options =3D { 'node-name': 'target',
                             'driver': iotests.imgfmt,
                             'file': { 'driver': 'file',
+                                      'node-name': 'target-file',
                                       'filename': target_img } }
-                if self.target_blockdev_backing:
-                    options['backing'] =3D self.target_blockdev_backing
+
+                if not self.target_open_with_backing:
+                        options['backing'] =3D None
+                elif self.target_blockdev_backing:
+                        options['backing'] =3D self.target_blockdev_backin=
g
=20
                 result =3D self.vm.qmp('blockdev-add', **options)
                 self.assert_qmp(result, 'return', {})
@@ -147,10 +156,14 @@ class BaseClass(iotests.QMPTestCase):
 # cmd: Mirroring command to execute, either drive-mirror or blockdev-mirro=
r
=20
 class MirrorBaseClass(BaseClass):
+    def openBacking(self):
+        pass
+
     def runMirror(self, sync):
         if self.cmd =3D=3D 'blockdev-mirror':
             result =3D self.vm.qmp(self.cmd, job_id=3D'mirror-job', device=
=3D'source',
-                                 sync=3Dsync, target=3D'target')
+                                 sync=3Dsync, target=3D'target',
+                                 auto_finalize=3DFalse)
         else:
             if self.existing:
                 mode =3D 'existing'
@@ -159,11 +172,12 @@ class MirrorBaseClass(BaseClass):
             result =3D self.vm.qmp(self.cmd, job_id=3D'mirror-job', device=
=3D'source',
                                  sync=3Dsync, target=3Dtarget_img,
                                  format=3Diotests.imgfmt, mode=3Dmode,
-                                 node_name=3D'target')
+                                 node_name=3D'target', auto_finalize=3DFal=
se)
=20
         self.assert_qmp(result, 'return', {})
=20
-        self.complete_and_wait('mirror-job')
+        self.vm.run_job('mirror-job', use_log=3DFalse, auto_finalize=3DFal=
se,
+                        pre_finalize=3Dself.openBacking, auto_dismiss=3DTr=
ue)
=20
     def testFull(self):
         self.runMirror('full')
@@ -221,6 +235,36 @@ class TestBlockdevMirrorForcedBacking(MirrorBaseClass)=
:
     target_blockdev_backing =3D { 'driver': 'null-co' }
     target_real_backing =3D 'null-co://'
=20
+class TestBlockdevMirrorBlockdevReopenBacking(MirrorBaseClass):
+    cmd =3D 'blockdev-mirror'
+    existing =3D True
+    target_backing =3D 'null-co://'
+    target_open_with_backing =3D False
+
+    def openBacking(self):
+        if not self.target_open_with_backing:
+            result =3D self.vm.qmp('blockdev-add', node_name=3D"backing",
+                                 driver=3D"null-co")
+            self.assert_qmp(result, 'return', {})
+            result =3D self.vm.qmp('x-blockdev-reopen', node_name=3D"targe=
t",
+                                 driver=3Diotests.imgfmt, file=3D"target-f=
ile",
+                                 backing=3D"backing")
+            self.assert_qmp(result, 'return', {})
+
+class TestBlockdevMirrorBlockdevSnapshotBacking(MirrorBaseClass):
+    cmd =3D 'blockdev-mirror'
+    existing =3D True
+    target_backing =3D 'null-co://'
+    target_open_with_backing =3D False
+
+    def openBacking(self):
+        if not self.target_open_with_backing:
+            result =3D self.vm.qmp('blockdev-add', node_name=3D"backing",
+                                 driver=3D"null-co")
+            self.assert_qmp(result, 'return', {})
+            result =3D self.vm.qmp('blockdev-snapshot', node=3D"backing",
+                                 overlay=3D"target")
+            self.assert_qmp(result, 'return', {})
=20
 class TestCommit(BaseClass):
     existing =3D False
diff --git a/tests/qemu-iotests/155.out b/tests/qemu-iotests/155.out
index 4176bb9402..4fd1c2dcd2 100644
--- a/tests/qemu-iotests/155.out
+++ b/tests/qemu-iotests/155.out
@@ -1,5 +1,5 @@
-...................
+.........................
 ----------------------------------------------------------------------
-Ran 19 tests
+Ran 25 tests
=20
 OK
--=20
2.20.1


