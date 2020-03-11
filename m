Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23621181CCF
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:49:09 +0100 (CET)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3bY-0003o8-1q
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59826)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jC3VK-0002xu-Sq
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jC3VI-00036V-R0
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:42 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33323
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jC3VI-00033W-M3
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9YBF35cxgmsBEnODs2CmusRZCij2P4n9Ow0NgBi7/D0=;
 b=DSAHwjFVhUbU0gpekeDpLAX84LxidzYltFiNP8kleUSudM5m+bR4XeA0wSIFU9MEBjKuTN
 bf0ozHiC7i8R3zujF0LWBoNFQIOhUfF6azk/PBOTSs1KgOxp70Q4MbQxe+YcBcPoSSLfIL
 jMVbYqPpITJhvFRbQ3Brhr2tVwL4ksE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-soxvhbkLP_WrvNyScMAfOw-1; Wed, 11 Mar 2020 11:42:36 -0400
X-MC-Unique: soxvhbkLP_WrvNyScMAfOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0016800D50;
 Wed, 11 Mar 2020 15:42:33 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03BF260BEE;
 Wed, 11 Mar 2020 15:42:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/13] iotests: Add iothread cases to 155
Date: Wed, 11 Mar 2020 16:42:12 +0100
Message-Id: <20200311154218.15532-8-kwolf@redhat.com>
In-Reply-To: <20200311154218.15532-1-kwolf@redhat.com>
References: <20200311154218.15532-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

This patch adds test cases for attaching the backing chain to a mirror
job target right before finalising the job, where the image is in a
non-mainloop AioContext (i.e. the backing chain needs to be moved to the
AioContext of the mirror target).

This requires switching the test case from virtio-blk to virtio-scsi
because virtio-blk only actually starts using the iothreads when the
guest driver initialises the device (which never happens in a test case
without a guest OS). virtio-scsi always keeps its block nodes in the
AioContext of the the requested iothread without guest interaction.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200310113831.27293-7-kwolf@redhat.com>
Reviewed-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/155     | 32 +++++++++++++++++++++++---------
 tests/qemu-iotests/155.out |  4 ++--
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index 74ddefc849..571bce9de4 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -49,11 +49,14 @@ target_img =3D os.path.join(iotests.test_dir, 'target.'=
 + iotests.imgfmt)
 #                           chain opened right away. If False, blockdev-ad=
d
 #                           opens it without a backing file and job comple=
tion
 #                           is supposed to open the backing chain.
+# use_iothread: If True, an iothread is configured for the virtio-blk devi=
ce
+#               that uses the image being mirrored
=20
 class BaseClass(iotests.QMPTestCase):
     target_blockdev_backing =3D None
     target_real_backing =3D None
     target_open_with_backing =3D True
+    use_iothread =3D False
=20
     def setUp(self):
         qemu_img('create', '-f', iotests.imgfmt, back0_img, '1440K')
@@ -69,7 +72,16 @@ class BaseClass(iotests.QMPTestCase):
                     'file': {'driver': 'file',
                              'filename': source_img}}
         self.vm.add_blockdev(self.vm.qmp_to_opts(blockdev))
-        self.vm.add_device('virtio-blk,id=3Dqdev0,drive=3Dsource')
+
+        if self.use_iothread:
+            self.vm.add_object('iothread,id=3Diothread0')
+            iothread =3D ",iothread=3Diothread0"
+        else:
+            iothread =3D ""
+
+        self.vm.add_device('virtio-scsi%s' % iothread)
+        self.vm.add_device('scsi-hd,id=3Dqdev0,drive=3Dsource')
+
         self.vm.launch()
=20
         self.assertIntactSourceBackingChain()
@@ -182,24 +194,21 @@ class MirrorBaseClass(BaseClass):
     def testFull(self):
         self.runMirror('full')
=20
-        node =3D self.findBlockNode('target',
-                                  '/machine/peripheral/qdev0/virtio-backen=
d')
+        node =3D self.findBlockNode('target', 'qdev0')
         self.assertCorrectBackingImage(node, None)
         self.assertIntactSourceBackingChain()
=20
     def testTop(self):
         self.runMirror('top')
=20
-        node =3D self.findBlockNode('target',
-                                  '/machine/peripheral/qdev0/virtio-backen=
d')
+        node =3D self.findBlockNode('target', 'qdev0')
         self.assertCorrectBackingImage(node, back2_img)
         self.assertIntactSourceBackingChain()
=20
     def testNone(self):
         self.runMirror('none')
=20
-        node =3D self.findBlockNode('target',
-                                  '/machine/peripheral/qdev0/virtio-backen=
d')
+        node =3D self.findBlockNode('target', 'qdev0')
         self.assertCorrectBackingImage(node, source_img)
         self.assertIntactSourceBackingChain()
=20
@@ -252,6 +261,9 @@ class TestBlockdevMirrorReopen(MirrorBaseClass):
                                  backing=3D"backing")
             self.assert_qmp(result, 'return', {})
=20
+class TestBlockdevMirrorReopenIothread(TestBlockdevMirrorReopen):
+    use_iothread =3D True
+
 # Attach the backing chain only during completion, with blockdev-snapshot
 class TestBlockdevMirrorSnapshot(MirrorBaseClass):
     cmd =3D 'blockdev-mirror'
@@ -268,6 +280,9 @@ class TestBlockdevMirrorSnapshot(MirrorBaseClass):
                                  overlay=3D"target")
             self.assert_qmp(result, 'return', {})
=20
+class TestBlockdevMirrorSnapshotIothread(TestBlockdevMirrorSnapshot):
+    use_iothread =3D True
+
 class TestCommit(BaseClass):
     existing =3D False
=20
@@ -283,8 +298,7 @@ class TestCommit(BaseClass):
=20
         self.vm.event_wait('BLOCK_JOB_COMPLETED')
=20
-        node =3D self.findBlockNode(None,
-                                  '/machine/peripheral/qdev0/virtio-backen=
d')
+        node =3D self.findBlockNode(None, 'qdev0')
         self.assert_qmp(node, 'image' + '/backing-image' * 0 + '/filename'=
,
                         back1_img)
         self.assert_qmp(node, 'image' + '/backing-image' * 1 + '/filename'=
,
diff --git a/tests/qemu-iotests/155.out b/tests/qemu-iotests/155.out
index 4fd1c2dcd2..ed714d5263 100644
--- a/tests/qemu-iotests/155.out
+++ b/tests/qemu-iotests/155.out
@@ -1,5 +1,5 @@
-.........................
+...............................
 ----------------------------------------------------------------------
-Ran 25 tests
+Ran 31 tests
=20
 OK
--=20
2.20.1


