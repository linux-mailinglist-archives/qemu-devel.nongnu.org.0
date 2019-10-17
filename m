Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C62DAEE7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 15:58:30 +0200 (CEST)
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL6IP-0007M9-Di
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 09:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iL5su-00026f-Sr
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iL5st-0003GU-GM
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44308)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iL5sq-0003Fe-F5; Thu, 17 Oct 2019 09:32:04 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ADB1618C428C;
 Thu, 17 Oct 2019 13:32:03 +0000 (UTC)
Received: from localhost (ovpn-117-3.ams2.redhat.com [10.36.117.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25CFE5D9D5;
 Thu, 17 Oct 2019 13:32:02 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 02/23] iotests.py: Store socket files in $SOCK_DIR
Date: Thu, 17 Oct 2019 15:31:34 +0200
Message-Id: <20191017133155.5327-3-mreitz@redhat.com>
In-Reply-To: <20191017133155.5327-1-mreitz@redhat.com>
References: <20191017133155.5327-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Thu, 17 Oct 2019 13:32:03 +0000 (UTC)
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

iotests.py itself does not store socket files, but machine.py and
qtest.py do.  iotests.py needs to pass the respective path to them, and
they need to adhere to it.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 python/qemu/machine.py        | 15 ++++++++++++---
 python/qemu/qtest.py          |  9 ++++++---
 tests/qemu-iotests/iotests.py |  4 +++-
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 128a3d1dc2..2024e8b1b1 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -71,7 +71,7 @@ class QEMUMachine(object):
=20
     def __init__(self, binary, args=3DNone, wrapper=3DNone, name=3DNone,
                  test_dir=3D"/var/tmp", monitor_address=3DNone,
-                 socket_scm_helper=3DNone):
+                 socket_scm_helper=3DNone, sock_dir=3DNone):
         '''
         Initialize a QEMUMachine
=20
@@ -90,6 +90,8 @@ class QEMUMachine(object):
             wrapper =3D []
         if name is None:
             name =3D "qemu-%d" % os.getpid()
+        if sock_dir is None:
+            sock_dir =3D test_dir
         self._name =3D name
         self._monitor_address =3D monitor_address
         self._vm_monitor =3D None
@@ -106,12 +108,14 @@ class QEMUMachine(object):
         self._qemu_full_args =3D None
         self._test_dir =3D test_dir
         self._temp_dir =3D None
+        self._sock_dir =3D sock_dir
         self._launched =3D False
         self._machine =3D None
         self._console_set =3D False
         self._console_device_type =3D None
         self._console_address =3D None
         self._console_socket =3D None
+        self._remove_files =3D []
=20
         # just in case logging wasn't configured by the main script:
         logging.basicConfig()
@@ -236,8 +240,9 @@ class QEMUMachine(object):
         if self._machine is not None:
             args.extend(['-machine', self._machine])
         if self._console_set:
-            self._console_address =3D os.path.join(self._temp_dir,
+            self._console_address =3D os.path.join(self._sock_dir,
                                                  self._name + "-console.=
sock")
+            self._remove_files.append(self._console_address)
             chardev =3D ('socket,id=3Dconsole,path=3D%s,server,nowait' %
                        self._console_address)
             args.extend(['-chardev', chardev])
@@ -253,8 +258,9 @@ class QEMUMachine(object):
         if self._monitor_address is not None:
             self._vm_monitor =3D self._monitor_address
         else:
-            self._vm_monitor =3D os.path.join(self._temp_dir,
+            self._vm_monitor =3D os.path.join(self._sock_dir,
                                             self._name + "-monitor.sock"=
)
+            self._remove_files.append(self._vm_monitor)
         self._qemu_log_path =3D os.path.join(self._temp_dir, self._name =
+ ".log")
         self._qemu_log_file =3D open(self._qemu_log_path, 'wb')
=20
@@ -279,6 +285,9 @@ class QEMUMachine(object):
             shutil.rmtree(self._temp_dir)
             self._temp_dir =3D None
=20
+        while len(self._remove_files) > 0:
+            self._remove_if_exists(self._remove_files.pop())
+
     def launch(self):
         """
         Launch the VM and make sure we cleanup and expose the
diff --git a/python/qemu/qtest.py b/python/qemu/qtest.py
index 3f1d2cb325..d24ad04256 100644
--- a/python/qemu/qtest.py
+++ b/python/qemu/qtest.py
@@ -84,14 +84,17 @@ class QEMUQtestMachine(QEMUMachine):
     '''A QEMU VM'''
=20
     def __init__(self, binary, args=3DNone, name=3DNone, test_dir=3D"/va=
r/tmp",
-                 socket_scm_helper=3DNone):
+                 socket_scm_helper=3DNone, sock_dir=3DNone):
         if name is None:
             name =3D "qemu-%d" % os.getpid()
+        if sock_dir is None:
+            sock_dir =3D test_dir
         super(QEMUQtestMachine,
               self).__init__(binary, args, name=3Dname, test_dir=3Dtest_=
dir,
-                             socket_scm_helper=3Dsocket_scm_helper)
+                             socket_scm_helper=3Dsocket_scm_helper,
+                             sock_dir=3Dsock_dir)
         self._qtest =3D None
-        self._qtest_path =3D os.path.join(test_dir, name + "-qtest.sock"=
)
+        self._qtest_path =3D os.path.join(sock_dir, name + "-qtest.sock"=
)
=20
     def _base_args(self):
         args =3D super(QEMUQtestMachine, self)._base_args()
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index 43759e4e27..0616129342 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -57,6 +57,7 @@ qemu_opts =3D os.environ.get('QEMU_OPTIONS', '').strip(=
).split(' ')
 imgfmt =3D os.environ.get('IMGFMT', 'raw')
 imgproto =3D os.environ.get('IMGPROTO', 'file')
 test_dir =3D os.environ.get('TEST_DIR')
+sock_dir =3D os.environ.get('SOCK_DIR')
 output_dir =3D os.environ.get('OUTPUT_DIR', '.')
 cachemode =3D os.environ.get('CACHEMODE')
 qemu_default_machine =3D os.environ.get('QEMU_DEFAULT_MACHINE')
@@ -445,7 +446,8 @@ class VM(qtest.QEMUQtestMachine):
         name =3D "qemu%s-%d" % (path_suffix, os.getpid())
         super(VM, self).__init__(qemu_prog, qemu_opts, name=3Dname,
                                  test_dir=3Dtest_dir,
-                                 socket_scm_helper=3Dsocket_scm_helper)
+                                 socket_scm_helper=3Dsocket_scm_helper,
+                                 sock_dir=3Dsock_dir)
         self._num_drives =3D 0
=20
     def add_object(self, opts):
--=20
2.21.0


