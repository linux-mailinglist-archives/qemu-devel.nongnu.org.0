Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FD328491
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 19:11:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTrFP-0006aV-Fz
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 13:11:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hTrBK-0003js-9K
	for qemu-devel@nongnu.org; Thu, 23 May 2019 13:07:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hTrBG-0001iC-S9
	for qemu-devel@nongnu.org; Thu, 23 May 2019 13:07:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54824)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1hTrB7-0001Zu-Qa; Thu, 23 May 2019 13:06:54 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7815330260;
	Thu, 23 May 2019 17:06:50 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D800B1001DEF;
	Thu, 23 May 2019 17:06:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu, 23 May 2019 13:06:40 -0400
Message-Id: <20190523170643.20794-3-jsnow@redhat.com>
In-Reply-To: <20190523170643.20794-1-jsnow@redhat.com>
References: <20190523170643.20794-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 23 May 2019 17:06:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 2/5] iotests.py: do not use infinite waits
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cap waits to 60 seconds so that iotests can fail gracefully if something
goes wrong.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index 6bcddd8870..6e17c040dc 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -521,7 +521,7 @@ class VM(qtest.QEMUQtestMachine):
             output_list +=3D [key + '=3D' + obj[key]]
         return ','.join(output_list)
=20
-    def get_qmp_events_filtered(self, wait=3DTrue):
+    def get_qmp_events_filtered(self, wait=3D60.0):
         result =3D []
         for ev in self.get_qmp_events(wait=3Dwait):
             result.append(filter_qmp_event(ev))
@@ -539,10 +539,10 @@ class VM(qtest.QEMUQtestMachine):
=20
     # Returns None on success, and an error string on failure
     def run_job(self, job, auto_finalize=3DTrue, auto_dismiss=3DFalse,
-                pre_finalize=3DNone):
+                pre_finalize=3DNone, wait=3D60.0):
         error =3D None
         while True:
-            for ev in self.get_qmp_events_filtered(wait=3DTrue):
+            for ev in self.get_qmp_events_filtered(wait=3Dwait):
                 if ev['event'] =3D=3D 'JOB_STATUS_CHANGE':
                     status =3D ev['data']['status']
                     if status =3D=3D 'aborting':
@@ -647,7 +647,7 @@ class QMPTestCase(unittest.TestCase):
         self.assertEqual(self.vm.flatten_qmp_object(json.loads(json_file=
name[5:])),
                          self.vm.flatten_qmp_object(reference))
=20
-    def cancel_and_wait(self, drive=3D'drive0', force=3DFalse, resume=3D=
False):
+    def cancel_and_wait(self, drive=3D'drive0', force=3DFalse, resume=3D=
False, wait=3D60.0):
         '''Cancel a block job and wait for it to finish, returning the e=
vent'''
         result =3D self.vm.qmp('block-job-cancel', device=3Ddrive, force=
=3Dforce)
         self.assert_qmp(result, 'return', {})
@@ -658,7 +658,7 @@ class QMPTestCase(unittest.TestCase):
         cancelled =3D False
         result =3D None
         while not cancelled:
-            for event in self.vm.get_qmp_events(wait=3DTrue):
+            for event in self.vm.get_qmp_events(wait=3Dwait):
                 if event['event'] =3D=3D 'BLOCK_JOB_COMPLETED' or \
                    event['event'] =3D=3D 'BLOCK_JOB_CANCELLED':
                     self.assert_qmp(event, 'data/device', drive)
@@ -671,10 +671,10 @@ class QMPTestCase(unittest.TestCase):
         self.assert_no_active_block_jobs()
         return result
=20
-    def wait_until_completed(self, drive=3D'drive0', check_offset=3DTrue=
):
+    def wait_until_completed(self, drive=3D'drive0', check_offset=3DTrue=
, wait=3D60.0):
         '''Wait for a block job to finish, returning the event'''
         while True:
-            for event in self.vm.get_qmp_events(wait=3DTrue):
+            for event in self.vm.get_qmp_events(wait=3Dwait):
                 if event['event'] =3D=3D 'BLOCK_JOB_COMPLETED':
                     self.assert_qmp(event, 'data/device', drive)
                     self.assert_qmp_absent(event, 'data/error')
--=20
2.20.1


