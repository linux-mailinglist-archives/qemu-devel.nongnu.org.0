Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2E8DC433
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 13:52:42 +0200 (CEST)
Received: from localhost ([::1]:38400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLQoD-00035g-I9
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 07:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36552)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iLQnB-0002a5-Io
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 07:51:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iLQnA-0000CX-Hv
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 07:51:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51603)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iLQn7-0000AK-K3; Fri, 18 Oct 2019 07:51:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4617A302C096;
 Fri, 18 Oct 2019 11:51:32 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-198.ams2.redhat.com
 [10.36.117.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D8225C1B5;
 Fri, 18 Oct 2019 11:51:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests: Skip read-only cases in 118 when run as root
Date: Fri, 18 Oct 2019 13:51:27 +0200
Message-Id: <20191018115127.2671-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 18 Oct 2019 11:51:32 +0000 (UTC)
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some tests in 118 use chmod to remove write permissions from the file
and assume that the image can indeed not be opened read-write
afterwards. This doesn't work when the test is run as root, because root
can still open the file as writable even when the permission bit isn't
set.

Introduce a @skip_if_root decorator and use it in 118 to skip the tests
in question when the script is run as root.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/118        |  3 +++
 tests/qemu-iotests/iotests.py | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/tests/qemu-iotests/118 b/tests/qemu-iotests/118
index ea0b326ae0..9eff46d189 100755
--- a/tests/qemu-iotests/118
+++ b/tests/qemu-iotests/118
@@ -446,6 +446,7 @@ class TestChangeReadOnly(ChangeBaseClass):
         self.assert_qmp(result, 'return[0]/inserted/ro', True)
         self.assert_qmp(result, 'return[0]/inserted/image/filename', new=
_img)
=20
+    @iotests.skip_if_root
     def test_rw_ro_retain(self):
         os.chmod(new_img, 0o444)
         self.vm.add_drive(old_img, 'media=3Ddisk', 'none')
@@ -530,6 +531,7 @@ class TestChangeReadOnly(ChangeBaseClass):
         self.assert_qmp(result, 'return[0]/inserted/ro', True)
         self.assert_qmp(result, 'return[0]/inserted/image/filename', new=
_img)
=20
+    @iotests.skip_if_root
     def test_make_ro_rw(self):
         os.chmod(new_img, 0o444)
         self.vm.add_drive(old_img, 'media=3Ddisk', 'none')
@@ -571,6 +573,7 @@ class TestChangeReadOnly(ChangeBaseClass):
         self.assert_qmp(result, 'return[0]/inserted/ro', True)
         self.assert_qmp(result, 'return[0]/inserted/image/filename', new=
_img)
=20
+    @iotests.skip_if_root
     def test_make_ro_rw_by_retain(self):
         os.chmod(new_img, 0o444)
         self.vm.add_drive(old_img, 'media=3Ddisk', 'none')
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index 3a8f378f90..9c66db613e 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -920,6 +920,16 @@ def skip_if_unsupported(required_formats=3D[], read_=
only=3DFalse):
         return func_wrapper
     return skip_test_decorator
=20
+def skip_if_root(func):
+    '''Skip Test Decorator
+       Runs the test only without root permissions'''
+    def func_wrapper(*args, **kwargs):
+        if os.getuid() =3D=3D 0:
+            case_notrun('{}: cannot be run as root'.format(args[0]))
+        else:
+            return func(*args, **kwargs)
+    return func_wrapper
+
 def execute_unittest(output, verbosity, debug):
     runner =3D unittest.TextTestRunner(stream=3Doutput, descriptions=3DT=
rue,
                                      verbosity=3Dverbosity)
--=20
2.20.1


