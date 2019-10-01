Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E125BC41B3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 22:20:06 +0200 (CEST)
Received: from localhost ([::1]:47773 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFOcu-00051N-6Z
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 16:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO7n-0004aO-JE
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:47:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO7m-0007rq-6d
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:47:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37726)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO7c-0007i6-N4; Tue, 01 Oct 2019 15:47:46 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 40CC610CC208;
 Tue,  1 Oct 2019 19:47:41 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D103D19C6A;
 Tue,  1 Oct 2019 19:47:40 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 10/67] iotests/169: Skip persistent cases for compat=0.10
Date: Tue,  1 Oct 2019 21:46:18 +0200
Message-Id: <20191001194715.2796-11-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 01 Oct 2019 19:47:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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

compat=3D0.10 images cannot store persistent dirty bitmaps; let 169 skip
all such test cases when compat=3D0.10 is in the $IMGOPTS.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/169 | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/169 b/tests/qemu-iotests/169
index 8c204caf20..5e978b7b7d 100755
--- a/tests/qemu-iotests/169
+++ b/tests/qemu-iotests/169
@@ -41,7 +41,10 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         self.vm_b.shutdown()
         os.remove(disk_a)
         os.remove(disk_b)
-        os.remove(mig_file)
+        try:
+            os.remove(mig_file)
+        except OSError:
+            pass
=20
     def setUp(self):
         qemu_img('create', '-f', iotests.imgfmt, disk_a, size)
@@ -79,6 +82,10 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
     def do_test_migration_resume_source(self, persistent, migrate_bitmap=
s):
         granularity =3D 512
=20
+        if persistent and 'compat=3D0.10' in iotests.imgopts:
+            self.case_skip('compat=3D0.10 does not support persistent di=
rty ' +
+                           'bitmaps')
+
         # regions =3D ((start, count), ...)
         regions =3D ((0, 0x10000),
                    (0xf0000, 0x10000),
@@ -137,6 +144,10 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
                           shared_storage):
         granularity =3D 512
=20
+        if persistent and 'compat=3D0.10' in iotests.imgopts:
+            self.case_skip('compat=3D0.10 does not support persistent di=
rty ' +
+                           'bitmaps')
+
         # regions =3D ((start, count), ...)
         regions =3D ((0, 0x10000),
                    (0xf0000, 0x10000),
--=20
2.21.0


