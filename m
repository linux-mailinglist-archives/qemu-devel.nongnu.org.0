Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F5883126
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 14:04:41 +0200 (CEST)
Received: from localhost ([::1]:60892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huyCm-0007IV-Ip
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 08:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60689)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1huy99-0002Qz-RR
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 08:01:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1huy94-0002AT-Sp
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 08:00:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40468)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1huy91-00028N-EI; Tue, 06 Aug 2019 08:00:47 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B299A316E52F;
 Tue,  6 Aug 2019 12:00:46 +0000 (UTC)
Received: from localhost (ovpn-204-49.brq.redhat.com [10.40.204.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F24AA6D0A6;
 Tue,  6 Aug 2019 12:00:14 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue,  6 Aug 2019 13:59:51 +0200
Message-Id: <20190806115952.8456-7-mreitz@redhat.com>
In-Reply-To: <20190806115952.8456-1-mreitz@redhat.com>
References: <20190806115952.8456-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 06 Aug 2019 12:00:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 6/7] iotests: Test unaligned blocking mirror
 write
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190805113526.20319-1-mreitz@redhat.com
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/151     | 25 +++++++++++++++++++++++++
 tests/qemu-iotests/151.out |  4 ++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index 1bb74d67c4..ad7359fc8d 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -114,6 +114,31 @@ class TestActiveMirror(iotests.QMPTestCase):
     def testActiveIOFlushed(self):
         self.doActiveIO(True)
=20
+    def testUnalignedActiveIO(self):
+        # Fill the source image
+        result =3D self.vm.hmp_qemu_io('source', 'write -P 1 0 2M')
+
+        # Start the block job (very slowly)
+        result =3D self.vm.qmp('blockdev-mirror',
+                             job_id=3D'mirror',
+                             filter_node_name=3D'mirror-node',
+                             device=3D'source-node',
+                             target=3D'target-node',
+                             sync=3D'full',
+                             copy_mode=3D'write-blocking',
+                             buf_size=3D(1048576 // 4),
+                             speed=3D1)
+        self.assert_qmp(result, 'return', {})
+
+        # Start an unaligned request to a dirty area
+        result =3D self.vm.hmp_qemu_io('source', 'write -P 2 %i 1' % (10=
48576 + 42))
+
+        # Let the job finish
+        result =3D self.vm.qmp('block-job-set-speed', device=3D'mirror',=
 speed=3D0)
+        self.assert_qmp(result, 'return', {})
+        self.complete_and_wait(drive=3D'mirror')
+
+        self.potential_writes_in_flight =3D False
=20
=20
 if __name__ =3D=3D '__main__':
diff --git a/tests/qemu-iotests/151.out b/tests/qemu-iotests/151.out
index fbc63e62f8..8d7e996700 100644
--- a/tests/qemu-iotests/151.out
+++ b/tests/qemu-iotests/151.out
@@ -1,5 +1,5 @@
-..
+...
 ----------------------------------------------------------------------
-Ran 2 tests
+Ran 3 tests
=20
 OK
--=20
2.21.0


