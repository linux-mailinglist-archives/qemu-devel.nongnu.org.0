Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D87290B6A
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 01:29:07 +0200 (CEST)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyleb-000101-VR
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 19:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1hylPj-0006T4-13
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hylPg-0005ug-UA
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53694)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hylPb-0005mF-H3; Fri, 16 Aug 2019 19:13:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A4AC5800DE1;
 Fri, 16 Aug 2019 23:13:33 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1FB019C6A;
 Fri, 16 Aug 2019 23:13:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 19:12:55 -0400
Message-Id: <20190816231318.8650-14-jsnow@redhat.com>
In-Reply-To: <20190816231318.8650-1-jsnow@redhat.com>
References: <20190816231318.8650-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 16 Aug 2019 23:13:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 13/36] iotests: add testing shim for
 script-style python tests
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

Because the new-style python tests don't use the iotests.main() test
launcher, we don't turn on the debugger logging for these scripts
when invoked via ./check -d.

Refactor the launcher shim into new and old style shims so that they
share environmental configuration.

Two cleanup notes: debug was not actually used as a global, and there
was no reason to create a class in an inner scope just to achieve
default variables; we can simply create an instance of the runner with
the values we want instead.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190709232550.10724-14-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 40 +++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index 91172c39a52..7fc062cdcf4 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -61,7 +61,6 @@ cachemode =3D os.environ.get('CACHEMODE')
 qemu_default_machine =3D os.environ.get('QEMU_DEFAULT_MACHINE')
=20
 socket_scm_helper =3D os.environ.get('SOCKET_SCM_HELPER', 'socket_scm_he=
lper')
-debug =3D False
=20
 luks_default_secret_object =3D 'secret,id=3Dkeysec0,data=3D' + \
                              os.environ.get('IMGKEYSECRET', '')
@@ -858,11 +857,22 @@ def skip_if_unsupported(required_formats=3D[], read=
_only=3DFalse):
         return func_wrapper
     return skip_test_decorator
=20
-def main(supported_fmts=3D[], supported_oses=3D['linux'], supported_cach=
e_modes=3D[],
-         unsupported_fmts=3D[]):
-    '''Run tests'''
+def execute_unittest(output, verbosity, debug):
+    runner =3D unittest.TextTestRunner(stream=3Doutput, descriptions=3DT=
rue,
+                                     verbosity=3Dverbosity)
+    try:
+        # unittest.main() will use sys.exit(); so expect a SystemExit
+        # exception
+        unittest.main(testRunner=3Drunner)
+    finally:
+        if not debug:
+            sys.stderr.write(re.sub(r'Ran (\d+) tests? in [\d.]+s',
+                                    r'Ran \1 tests', output.getvalue()))
=20
-    global debug
+def execute_test(test_function=3DNone,
+                 supported_fmts=3D[], supported_oses=3D['linux'],
+                 supported_cache_modes=3D[], unsupported_fmts=3D[]):
+    """Run either unittest or script-style tests."""
=20
     # We are using TEST_DIR and QEMU_DEFAULT_MACHINE as proxies to
     # indicate that we're not being run via "check". There may be
@@ -894,13 +904,15 @@ def main(supported_fmts=3D[], supported_oses=3D['li=
nux'], supported_cache_modes=3D[],
=20
     logging.basicConfig(level=3D(logging.DEBUG if debug else logging.WAR=
N))
=20
-    class MyTestRunner(unittest.TextTestRunner):
-        def __init__(self, stream=3Doutput, descriptions=3DTrue, verbosi=
ty=3Dverbosity):
-            unittest.TextTestRunner.__init__(self, stream, descriptions,=
 verbosity)
+    if not test_function:
+        execute_unittest(output, verbosity, debug)
+    else:
+        test_function()
=20
-    # unittest.main() will use sys.exit() so expect a SystemExit excepti=
on
-    try:
-        unittest.main(testRunner=3DMyTestRunner)
-    finally:
-        if not debug:
-            sys.stderr.write(re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ra=
n \1 tests', output.getvalue()))
+def script_main(test_function, *args, **kwargs):
+    """Run script-style tests outside of the unittest framework"""
+    execute_test(test_function, *args, **kwargs)
+
+def main(*args, **kwargs):
+    """Run tests using the unittest framework"""
+    execute_test(None, *args, **kwargs)
--=20
2.21.0


