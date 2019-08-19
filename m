Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C8494F0B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 22:32:35 +0200 (CEST)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzoKQ-0001JJ-KI
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 16:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hzo7S-0001F4-1I
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:19:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hzo7R-0004Oi-05
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:19:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44036)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hzo7O-0004L1-PW; Mon, 19 Aug 2019 16:19:06 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 12FDD1FAA66;
 Mon, 19 Aug 2019 20:19:06 +0000 (UTC)
Received: from localhost (ovpn-204-64.brq.redhat.com [10.40.204.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A6E5452B;
 Mon, 19 Aug 2019 20:19:02 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 19 Aug 2019 22:18:45 +0200
Message-Id: <20190819201851.24418-3-mreitz@redhat.com>
In-Reply-To: <20190819201851.24418-1-mreitz@redhat.com>
References: <20190819201851.24418-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Mon, 19 Aug 2019 20:19:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 2/8] iotests: Prefer null-co over null-aio
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We use null-co basically everywhere in the iotests.  Unless we want to
test null-aio specifically, we should use it instead (for consistency).

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/093 | 7 +++----
 tests/qemu-iotests/245 | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/093 b/tests/qemu-iotests/093
index 3c4f5173ce..50c1e7f2ec 100755
--- a/tests/qemu-iotests/093
+++ b/tests/qemu-iotests/093
@@ -267,13 +267,12 @@ class ThrottleTestCoroutine(ThrottleTestCase):
     test_img =3D "null-co://"
=20
 class ThrottleTestGroupNames(iotests.QMPTestCase):
-    test_img =3D "null-aio://"
     max_drives =3D 3
=20
     def setUp(self):
         self.vm =3D iotests.VM()
         for i in range(0, self.max_drives):
-            self.vm.add_drive(self.test_img,
+            self.vm.add_drive("null-co://",
                               "throttling.iops-total=3D100,file.read-zer=
oes=3Don")
         self.vm.launch()
=20
@@ -376,10 +375,10 @@ class ThrottleTestRemovableMedia(iotests.QMPTestCas=
e):
=20
     def test_removable_media(self):
         # Add a couple of dummy nodes named cd0 and cd1
-        result =3D self.vm.qmp("blockdev-add", driver=3D"null-aio",
+        result =3D self.vm.qmp("blockdev-add", driver=3D"null-co",
                              read_zeroes=3DTrue, node_name=3D"cd0")
         self.assert_qmp(result, 'return', {})
-        result =3D self.vm.qmp("blockdev-add", driver=3D"null-aio",
+        result =3D self.vm.qmp("blockdev-add", driver=3D"null-co",
                              read_zeroes=3DTrue, node_name=3D"cd1")
         self.assert_qmp(result, 'return', {})
=20
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index bc1ceb9792..ae169778b0 100644
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -598,7 +598,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         ##################
         ###### null ######
         ##################
-        opts =3D {'driver': 'null-aio', 'node-name': 'root', 'size': 102=
4}
+        opts =3D {'driver': 'null-co', 'node-name': 'root', 'size': 1024=
}
=20
         result =3D self.vm.qmp('blockdev-add', conv_keys =3D False, **op=
ts)
         self.assert_qmp(result, 'return', {})
--=20
2.21.0


