Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2C590B67
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 01:27:33 +0200 (CEST)
Received: from localhost ([::1]:33236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyld6-0007fg-LK
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 19:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46449)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1hylPi-0006Su-Rq
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hylPh-0005ux-40
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54366)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hylPc-0005ne-6a; Fri, 16 Aug 2019 19:13:36 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 51C5B300CB6C;
 Fri, 16 Aug 2019 23:13:35 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E57519C6A;
 Fri, 16 Aug 2019 23:13:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 19:12:57 -0400
Message-Id: <20190816231318.8650-16-jsnow@redhat.com>
In-Reply-To: <20190816231318.8650-1-jsnow@redhat.com>
References: <20190816231318.8650-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 16 Aug 2019 23:13:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 15/36] iotests: teach FilePath to produce
 multiple paths
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

Use "FilePaths" instead of "FilePath" to request multiple files be
cleaned up after we leave that object's scope.

This is not crucial; but it saves a little typing.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190709232550.10724-16-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index 81ae7b911ac..385dbad16ac 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -358,31 +358,45 @@ class Timeout:
     def timeout(self, signum, frame):
         raise Exception(self.errmsg)
=20
+def file_pattern(name):
+    return "{0}-{1}".format(os.getpid(), name)
=20
-class FilePath(object):
-    '''An auto-generated filename that cleans itself up.
+class FilePaths(object):
+    """
+    FilePaths is an auto-generated filename that cleans itself up.
=20
     Use this context manager to generate filenames and ensure that the f=
ile
     gets deleted::
=20
-        with TestFilePath('test.img') as img_path:
+        with FilePaths(['test.img']) as img_path:
             qemu_img('create', img_path, '1G')
         # migration_sock_path is automatically deleted
-    '''
-    def __init__(self, name):
-        filename =3D '{0}-{1}'.format(os.getpid(), name)
-        self.path =3D os.path.join(test_dir, filename)
+    """
+    def __init__(self, names):
+        self.paths =3D []
+        for name in names:
+            self.paths.append(os.path.join(test_dir, file_pattern(name))=
)
=20
     def __enter__(self):
-        return self.path
+        return self.paths
=20
     def __exit__(self, exc_type, exc_val, exc_tb):
         try:
-            os.remove(self.path)
+            for path in self.paths:
+                os.remove(path)
         except OSError:
             pass
         return False
=20
+class FilePath(FilePaths):
+    """
+    FilePath is a specialization of FilePaths that takes a single filena=
me.
+    """
+    def __init__(self, name):
+        super(FilePath, self).__init__([name])
+
+    def __enter__(self):
+        return self.paths[0]
=20
 def file_path_remover():
     for path in reversed(file_path_remover.paths):
@@ -407,7 +421,7 @@ def file_path(*names):
=20
     paths =3D []
     for name in names:
-        filename =3D '{0}-{1}'.format(os.getpid(), name)
+        filename =3D file_pattern(name)
         path =3D os.path.join(test_dir, filename)
         file_path_remover.paths.append(path)
         paths.append(path)
--=20
2.21.0


