Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43B63E68
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 01:38:29 +0200 (CEST)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkzgq-0005P7-KY
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 19:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49028)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hkzVL-0007MX-D7
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 19:26:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hkzVH-0003A9-Uh
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 19:26:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13378)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hkzV9-0002ug-Mj; Tue, 09 Jul 2019 19:26:25 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B697E3D95A;
 Tue,  9 Jul 2019 23:26:22 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-215.bos.redhat.com [10.18.17.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D6755B80B;
 Tue,  9 Jul 2019 23:26:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 19:25:46 -0400
Message-Id: <20190709232550.10724-15-jsnow@redhat.com>
In-Reply-To: <20190709232550.10724-1-jsnow@redhat.com>
References: <20190709232550.10724-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 09 Jul 2019 23:26:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 14/18] iotests: teach run_job to cancel
 pending jobs
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

run_job can cancel pending jobs to simulate failure. This lets us use
the pending callback to issue test commands while the job is open, but
then still have the job fail in the end.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index fcad957d63..c544659ecb 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -541,7 +541,22 @@ class VM(qtest.QEMUQtestMachine):
=20
     # Returns None on success, and an error string on failure
     def run_job(self, job, auto_finalize=3DTrue, auto_dismiss=3DFalse,
-                pre_finalize=3DNone, wait=3D60.0):
+                pre_finalize=3DNone, cancel=3DFalse, wait=3D60.0):
+        """
+        run_job moves a job from creation through to dismissal.
+
+        :param job: String. ID of recently-launched job
+        :param auto_finalize: Bool. True if the job was launched with
+                              auto_finalize. Defaults to True.
+        :param auto_dismiss: Bool. True if the job was launched with
+                             auto_dismiss=3DTrue. Defaults to False.
+        :param pre_finalize: Callback. A callable that takes no argument=
s to be
+                             invoked prior to issuing job-finalize, if a=
ny.
+        :param cancel: Bool. When true, cancels the job after the pre_fi=
nalize
+                       callback.
+        :param wait: Float. Timeout value specifying how long to wait fo=
r any
+                     event, in seconds. Defaults to 60.0.
+        """
         match_device =3D {'data': {'device': job}}
         match_id =3D {'data': {'id': job}}
         events =3D [
@@ -568,7 +583,10 @@ class VM(qtest.QEMUQtestMachine):
             elif status =3D=3D 'pending' and not auto_finalize:
                 if pre_finalize:
                     pre_finalize()
-                self.qmp_log('job-finalize', id=3Djob)
+                if cancel:
+                    self.qmp_log('job-cancel', id=3Djob)
+                else:
+                    self.qmp_log('job-finalize', id=3Djob)
             elif status =3D=3D 'concluded' and not auto_dismiss:
                 self.qmp_log('job-dismiss', id=3Djob)
             elif status =3D=3D 'null':
--=20
2.21.0


