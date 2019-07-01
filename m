Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F50544928
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 19:15:11 +0200 (CEST)
Received: from localhost ([::1]:42124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbTJe-00024O-ED
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 13:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35646)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hbRy7-0002o6-OL
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 11:48:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hbRy6-0006VR-4n
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 11:48:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41822)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hbRy3-0006RM-4q; Thu, 13 Jun 2019 11:48:47 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A55627E42F;
 Thu, 13 Jun 2019 15:48:43 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-85.phx2.redhat.com [10.3.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 057025C6D6;
 Thu, 13 Jun 2019 15:48:41 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 10:48:30 -0500
Message-Id: <20190613154837.21734-3-eblake@redhat.com>
In-Reply-To: <20190613154837.21734-1-eblake@redhat.com>
References: <20190613154837.21734-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 13 Jun 2019 15:48:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 2/9] iotests.py: Add qemu_nbd_early_pipe()
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
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

qemu_nbd_pipe() currently unconditionally reads qemu-nbd's output.  That
is not ideal because qemu-nbd may keep stderr open after the parent
process has exited.

Currently, the only user of qemu_nbd_pipe() is 147, which discards the
whole output if the parent process returned success and only evaluates
it on error.  Therefore, we can replace qemu_nbd_pipe() by
qemu_nbd_early_pipe() that does the same: Discard the output on success,
and return it on error.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190508211820.17851-3-mreitz@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/147        | 4 ++--
 tests/qemu-iotests/iotests.py | 9 ++++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index 82513279b028..2d84fddb0107 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -24,7 +24,7 @@ import socket
 import stat
 import time
 import iotests
-from iotests import cachemode, imgfmt, qemu_img, qemu_nbd, qemu_nbd_pipe
+from iotests import cachemode, imgfmt, qemu_img, qemu_nbd, qemu_nbd_earl=
y_pipe

 NBD_PORT_START      =3D 32768
 NBD_PORT_END        =3D NBD_PORT_START + 1024
@@ -93,7 +93,7 @@ class QemuNBD(NBDBlockdevAddBase):
             pass

     def _try_server_up(self, *args):
-        status, msg =3D qemu_nbd_pipe('-f', imgfmt, test_img, *args)
+        status, msg =3D qemu_nbd_early_pipe('-f', imgfmt, test_img, *arg=
s)
         if status =3D=3D 0:
             return True
         if 'Address already in use' in msg:
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.p=
y
index 6bcddd887048..f11482f3dc9b 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -209,9 +209,9 @@ def qemu_nbd(*args):
     '''Run qemu-nbd in daemon mode and return the parent's exit code'''
     return subprocess.call(qemu_nbd_args + ['--fork'] + list(args))

-def qemu_nbd_pipe(*args):
+def qemu_nbd_early_pipe(*args):
     '''Run qemu-nbd in daemon mode and return both the parent's exit cod=
e
-       and its output'''
+       and its output in case of an error'''
     subp =3D subprocess.Popen(qemu_nbd_args + ['--fork'] + list(args),
                             stdout=3Dsubprocess.PIPE,
                             stderr=3Dsubprocess.STDOUT,
@@ -221,7 +221,10 @@ def qemu_nbd_pipe(*args):
         sys.stderr.write('qemu-nbd received signal %i: %s\n' %
                          (-exitcode,
                           ' '.join(qemu_nbd_args + ['--fork'] + list(arg=
s))))
-    return exitcode, subp.communicate()[0]
+    if exitcode =3D=3D 0:
+        return exitcode, ''
+    else:
+        return exitcode, subp.communicate()[0]

 def compare_images(img1, img2, fmt1=3Dimgfmt, fmt2=3Dimgfmt):
     '''Return True if two image files are identical'''
--=20
2.20.1


