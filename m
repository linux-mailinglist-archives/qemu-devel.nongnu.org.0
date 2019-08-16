Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD29690B62
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 01:23:50 +0200 (CEST)
Received: from localhost ([::1]:33188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hylZV-0001kG-BW
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 19:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1hylPh-0006RZ-Sg
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hylPf-0005tb-Kg
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53698)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hylPb-0005m7-Dw; Fri, 16 Aug 2019 19:13:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7AF7F800DE3;
 Fri, 16 Aug 2019 23:13:34 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C747E19C6A;
 Fri, 16 Aug 2019 23:13:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 19:12:56 -0400
Message-Id: <20190816231318.8650-15-jsnow@redhat.com>
In-Reply-To: <20190816231318.8650-1-jsnow@redhat.com>
References: <20190816231318.8650-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 16 Aug 2019 23:13:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 14/36] iotests: teach run_job to cancel pending
 jobs
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
Cc: peter.maydell@linaro.org, jsnow@redhat.com, qemu-stable@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

run_job can cancel pending jobs to simulate failure. This lets us use
the pending callback to issue test commands while the job is open, but
then still have the job fail in the end.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190709232550.10724-15-jsnow@redhat.com
[Maintainer edit: Merge conflict resolution in run_job]
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index 7fc062cdcf4..81ae7b911ac 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -541,7 +541,23 @@ class VM(qtest.QEMUQtestMachine):
=20
     # Returns None on success, and an error string on failure
     def run_job(self, job, auto_finalize=3DTrue, auto_dismiss=3DFalse,
-                pre_finalize=3DNone, use_log=3DTrue, wait=3D60.0):
+                pre_finalize=3DNone, cancel=3DFalse, use_log=3DTrue, wai=
t=3D60.0):
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
+        :param use_log: Bool. When false, does not log QMP messages.
+        :param wait: Float. Timeout value specifying how long to wait fo=
r any
+                     event, in seconds. Defaults to 60.0.
+        """
         match_device =3D {'data': {'device': job}}
         match_id =3D {'data': {'id': job}}
         events =3D [
@@ -570,7 +586,11 @@ class VM(qtest.QEMUQtestMachine):
             elif status =3D=3D 'pending' and not auto_finalize:
                 if pre_finalize:
                     pre_finalize()
-                if use_log:
+                if cancel and use_log:
+                    self.qmp_log('job-cancel', id=3Djob)
+                elif cancel:
+                    self.qmp('job-cancel', id=3Djob)
+                elif use_log:
                     self.qmp_log('job-finalize', id=3Djob)
                 else:
                     self.qmp('job-finalize', id=3Djob)
--=20
2.21.0


