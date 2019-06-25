Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D2D55A12
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 23:38:09 +0200 (CEST)
Received: from localhost ([::1]:35426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hft8i-0000TB-Ct
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 17:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41981)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hfsro-00008J-2o
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 17:20:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hfsrm-0004ju-9x
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 17:20:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34406)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hfsrZ-0004Bn-Sh; Tue, 25 Jun 2019 17:20:29 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2FD0D369AC;
 Tue, 25 Jun 2019 21:20:14 +0000 (UTC)
Received: from localhost (ovpn-204-63.brq.redhat.com [10.40.204.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDE181972B;
 Tue, 25 Jun 2019 21:20:12 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 25 Jun 2019 23:19:53 +0200
Message-Id: <20190625211955.15664-4-mreitz@redhat.com>
In-Reply-To: <20190625211955.15664-1-mreitz@redhat.com>
References: <20190625211955.15664-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 25 Jun 2019 21:20:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 3/5] iotests: Allow skipping test cases
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

case_notrun() does not actually skip the current test case.  It just
adds a "notrun" note and then returns to the caller, who manually has to
skip the test.  Generally, skipping a test case is as simple as
returning from the current function, but not always: For example, this
model does not allow skipping tests already in the setUp() function.

Thus, add a QMPTestCase.case_skip() function that invokes case_notrun()
and then self.skipTest().  To make this work, we need to filter the
information on how many test cases were skipped from the unittest
output.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index 3ecef5bc90..1b0ac50153 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -741,6 +741,11 @@ class QMPTestCase(unittest.TestCase):
             return self.pause_wait(job_id)
         return result
=20
+    def case_skip(self, reason):
+        '''Skip this test case'''
+        case_notrun(reason)
+        self.skipTest(reason)
+
=20
 def notrun(reason):
     '''Skip this test suite'''
@@ -752,7 +757,10 @@ def notrun(reason):
     sys.exit(0)
=20
 def case_notrun(reason):
-    '''Skip this test case'''
+    '''Mark this test case as not having been run, but do not actually
+    skip it; that is left to the caller.  See QMPTestCase.case_skip()
+    for a variant that actually skips the current test case.'''
+
     # Each test in qemu-iotests has a number ("seq")
     seq =3D os.path.basename(sys.argv[0])
=20
@@ -879,4 +887,12 @@ def main(supported_fmts=3D[], supported_oses=3D['lin=
ux'], supported_cache_modes=3D[],
         unittest.main(testRunner=3DMyTestRunner)
     finally:
         if not debug:
-            sys.stderr.write(re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ra=
n \1 tests', output.getvalue()))
+            out =3D output.getvalue()
+            out =3D re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ran \1 test=
s', out)
+
+            # Hide skipped tests from the reference output
+            out =3D re.sub(r'OK \(skipped=3D\d+\)', 'OK', out)
+            out_first_line, out_rest =3D out.split('\n', 1)
+            out =3D out_first_line.replace('s', '.') + '\n' + out_rest
+
+            sys.stderr.write(out)
--=20
2.21.0


