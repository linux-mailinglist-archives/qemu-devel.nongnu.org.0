Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15011BB344
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 14:03:53 +0200 (CEST)
Received: from localhost ([::1]:55298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCN4I-00071D-SB
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 08:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iCMyW-0003VN-Hm
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 07:57:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iCMyU-0006zv-VC
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 07:57:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45420)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iCMyS-0006ws-67; Mon, 23 Sep 2019 07:57:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 608DB2BF02;
 Mon, 23 Sep 2019 11:57:47 +0000 (UTC)
Received: from localhost (unknown [10.40.205.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CE97608C2;
 Mon, 23 Sep 2019 11:57:44 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 3/4] iotests: Add @error to wait_until_completed
Date: Mon, 23 Sep 2019 13:57:27 +0200
Message-Id: <20190923115728.28250-4-mreitz@redhat.com>
In-Reply-To: <20190923115728.28250-1-mreitz@redhat.com>
References: <20190923115728.28250-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 23 Sep 2019 11:57:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Callers can use this new parameter to expect failure during the
completion process.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index 3a8f378f90..5d44183f8f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -770,15 +770,20 @@ class QMPTestCase(unittest.TestCase):
         self.assert_no_active_block_jobs()
         return result
=20
-    def wait_until_completed(self, drive=3D'drive0', check_offset=3DTrue=
, wait=3D60.0):
+    def wait_until_completed(self, drive=3D'drive0', check_offset=3DTrue=
, wait=3D60.0,
+                             error=3DNone):
         '''Wait for a block job to finish, returning the event'''
         while True:
             for event in self.vm.get_qmp_events(wait=3Dwait):
                 if event['event'] =3D=3D 'BLOCK_JOB_COMPLETED':
                     self.assert_qmp(event, 'data/device', drive)
-                    self.assert_qmp_absent(event, 'data/error')
-                    if check_offset:
-                        self.assert_qmp(event, 'data/offset', event['dat=
a']['len'])
+                    if error is None:
+                        self.assert_qmp_absent(event, 'data/error')
+                        if check_offset:
+                            self.assert_qmp(event, 'data/offset',
+                                            event['data']['len'])
+                    else:
+                        self.assert_qmp(event, 'data/error', error)
                     self.assert_no_active_block_jobs()
                     return event
                 elif event['event'] =3D=3D 'JOB_STATUS_CHANGE':
@@ -796,7 +801,8 @@ class QMPTestCase(unittest.TestCase):
         self.assert_qmp(event, 'data/type', 'mirror')
         self.assert_qmp(event, 'data/offset', event['data']['len'])
=20
-    def complete_and_wait(self, drive=3D'drive0', wait_ready=3DTrue):
+    def complete_and_wait(self, drive=3D'drive0', wait_ready=3DTrue,
+                          completion_error=3DNone):
         '''Complete a block job and wait for it to finish'''
         if wait_ready:
             self.wait_ready(drive=3Ddrive)
@@ -804,7 +810,7 @@ class QMPTestCase(unittest.TestCase):
         result =3D self.vm.qmp('block-job-complete', device=3Ddrive)
         self.assert_qmp(result, 'return', {})
=20
-        event =3D self.wait_until_completed(drive=3Ddrive)
+        event =3D self.wait_until_completed(drive=3Ddrive, error=3Dcompl=
etion_error)
         self.assert_qmp(event, 'data/type', 'mirror')
=20
     def pause_wait(self, job_id=3D'job0'):
--=20
2.21.0


