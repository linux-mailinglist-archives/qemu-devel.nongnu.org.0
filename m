Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217F1124E52
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 17:50:34 +0100 (CET)
Received: from localhost ([::1]:57210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihcWu-0007st-Jx
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 11:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56722)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1ihcHw-0005cB-6k
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:35:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1ihcHt-0003uw-T4
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:35:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49872
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1ihcHt-0003qS-MG
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576686901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Na4X8CTPLAMbyrAhZ4cu4BT5T8uJFdxoo06BRbSKc1w=;
 b=S+BMVNTrSiSCeHvRvhzKTkU5SQlQkH81N4pXrpOUnQytpXdyWeNXoHCAaxJfv1yrvXa3MI
 JUKa93WJiwx9QoY0UQs2ib7KCwnW02Yn4J7SMQxX9ErrNgbiIIxSteUz/gr9E7FoCvz+ts
 eMrh3G/udXPyFvlDlyygKby2ThBMyDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-t5fgBKgzOyCFdJE9PGwTgA-1; Wed, 18 Dec 2019 11:34:57 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 650F48045C7;
 Wed, 18 Dec 2019 16:34:56 +0000 (UTC)
Received: from localhost (unknown [10.36.118.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 588EC5D9E2;
 Wed, 18 Dec 2019 16:34:47 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 15/15] tests/qemu-iotests: use AIOMODE with various tests
Date: Wed, 18 Dec 2019 16:32:28 +0000
Message-Id: <20191218163228.1613099-16-stefanha@redhat.com>
In-Reply-To: <20191218163228.1613099-1-stefanha@redhat.com>
References: <20191218163228.1613099-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: t5fgBKgzOyCFdJE9PGwTgA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, oleksandr@redhat.com,
 Julia Suvorova <jusual@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
v11:
 * Drop line-wrapping changes that accidentally broke qemu-iotests
---
 tests/qemu-iotests/028 |  2 +-
 tests/qemu-iotests/058 |  2 +-
 tests/qemu-iotests/089 |  4 ++--
 tests/qemu-iotests/091 |  4 ++--
 tests/qemu-iotests/109 |  2 +-
 tests/qemu-iotests/147 |  5 +++--
 tests/qemu-iotests/181 |  8 ++++----
 tests/qemu-iotests/183 |  4 ++--
 tests/qemu-iotests/185 | 10 +++++-----
 tests/qemu-iotests/200 |  2 +-
 tests/qemu-iotests/201 |  8 ++++----
 11 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/tests/qemu-iotests/028 b/tests/qemu-iotests/028
index bba1ee59ae..d4d972c884 100755
--- a/tests/qemu-iotests/028
+++ b/tests/qemu-iotests/028
@@ -108,7 +108,7 @@ echo block-backup
 echo
=20
 qemu_comm_method=3D"monitor"
-_launch_qemu -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},id=3Ddisk
+_launch_qemu -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},aio=3D${AIOM=
ODE},id=3Ddisk
 h=3D$QEMU_HANDLE
 if [ "${VALGRIND_QEMU}" =3D=3D "y" ]; then
     QEMU_COMM_TIMEOUT=3D7
diff --git a/tests/qemu-iotests/058 b/tests/qemu-iotests/058
index 8c3212a72f..38d1ed90c0 100755
--- a/tests/qemu-iotests/058
+++ b/tests/qemu-iotests/058
@@ -64,7 +64,7 @@ nbd_snapshot_img=3D"nbd:unix:$nbd_unix_socket"
 converted_image=3D$TEST_IMG.converted
=20
 # Use -f raw instead of -f $IMGFMT for the NBD connection
-QEMU_IO_NBD=3D"$QEMU_IO -f raw --cache=3D$CACHEMODE"
+QEMU_IO_NBD=3D"$QEMU_IO -f raw --cache=3D$CACHEMODE --aio=3D$AIOMODE"
=20
 echo
 echo "=3D=3D preparing image =3D=3D"
diff --git a/tests/qemu-iotests/089 b/tests/qemu-iotests/089
index ad029f1f09..059ad75e28 100755
--- a/tests/qemu-iotests/089
+++ b/tests/qemu-iotests/089
@@ -64,7 +64,7 @@ $QEMU_IO -c 'write -P 42 0 512' -c 'write -P 23 512 512' =
\
=20
 $QEMU_IMG convert -f raw -O $IMGFMT "$TEST_IMG.base" "$TEST_IMG"
=20
-$QEMU_IO_PROG --cache $CACHEMODE \
+$QEMU_IO_PROG --cache $CACHEMODE --aio $AIOMODE \
          -c 'read -P 42 0 512' -c 'read -P 23 512 512' \
          -c 'read -P 66 1024 512' "json:{
     \"driver\": \"$IMGFMT\",
@@ -111,7 +111,7 @@ $QEMU_IO -c 'write -P 42 0x38000 512' "$TEST_IMG" | _fi=
lter_qemu_io
=20
 # The "image.filename" part tests whether "a": { "b": "c" } and "a.b": "c"=
 do
 # the same (which they should).
-$QEMU_IO_PROG --cache $CACHEMODE \
+$QEMU_IO_PROG --cache $CACHEMODE --aio $AIOMODE  \
      -c 'read -P 42 0x38000 512' "json:{
     \"driver\": \"$IMGFMT\",
     \"file\": {
diff --git a/tests/qemu-iotests/091 b/tests/qemu-iotests/091
index f4b44659ae..3a29469324 100755
--- a/tests/qemu-iotests/091
+++ b/tests/qemu-iotests/091
@@ -60,13 +60,13 @@ echo =3D=3D=3D Starting QEMU VM1 =3D=3D=3D
 echo
=20
 qemu_comm_method=3D"monitor"
-_launch_qemu -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},id=3Ddisk
+_launch_qemu -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},aio=3D${AIOM=
ODE},id=3Ddisk
 h1=3D$QEMU_HANDLE
=20
 echo
 echo =3D=3D=3D Starting QEMU VM2 =3D=3D=3D
 echo
-_launch_qemu -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},id=3Ddisk \
+_launch_qemu -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},aio=3D${AIOM=
ODE},id=3Ddisk \
              -incoming "exec: cat '${MIG_FIFO}'"
 h2=3D$QEMU_HANDLE
=20
diff --git a/tests/qemu-iotests/109 b/tests/qemu-iotests/109
index 9897ceb6cd..3a3dcf94eb 100755
--- a/tests/qemu-iotests/109
+++ b/tests/qemu-iotests/109
@@ -52,7 +52,7 @@ run_qemu()
     local qmp_format=3D"$3"
     local qmp_event=3D"$4"
=20
-    _launch_qemu -drive file=3D"${source_img}",format=3Draw,cache=3D${CACH=
EMODE},id=3Dsrc
+    _launch_qemu -drive file=3D"${source_img}",format=3Draw,cache=3D${CACH=
EMODE},aio=3D${AIOMODE},id=3Dsrc
     _send_qemu_cmd $QEMU_HANDLE "{ 'execute': 'qmp_capabilities' }" "retur=
n"
=20
     _send_qemu_cmd $QEMU_HANDLE \
diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index 03fc2fabcf..2b6f859a09 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -24,7 +24,7 @@ import socket
 import stat
 import time
 import iotests
-from iotests import cachemode, imgfmt, qemu_img, qemu_nbd, qemu_nbd_early_=
pipe
+from iotests import cachemode, aiomode, imgfmt, qemu_img, qemu_nbd, qemu_n=
bd_early_pipe
=20
 NBD_PORT_START      =3D 32768
 NBD_PORT_END        =3D NBD_PORT_START + 1024
@@ -134,7 +134,8 @@ class BuiltinNBD(NBDBlockdevAddBase):
         self.server.add_drive_raw('if=3Dnone,id=3Dnbd-export,' +
                                   'file=3D%s,' % test_img +
                                   'format=3D%s,' % imgfmt +
-                                  'cache=3D%s' % cachemode)
+                                  'cache=3D%s' % cachemode +
+                                  'aio=3D%s' % aiomode)
         self.server.launch()
=20
     def tearDown(self):
diff --git a/tests/qemu-iotests/181 b/tests/qemu-iotests/181
index 378c2899d1..438c2dcd80 100755
--- a/tests/qemu-iotests/181
+++ b/tests/qemu-iotests/181
@@ -58,20 +58,20 @@ qemu_comm_method=3D"monitor"
=20
 if [ "$IMGOPTSSYNTAX" =3D "true" ]; then
     _launch_qemu \
-        -drive "${TEST_IMG}",cache=3D${CACHEMODE},id=3Ddisk
+        -drive "${TEST_IMG}",cache=3D${CACHEMODE},aio=3D$AIOMODE,id=3Ddisk
 else
     _launch_qemu \
-        -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},driver=3D$IMGFMT,=
id=3Ddisk
+        -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},aio=3D$AIOMODE,dr=
iver=3D$IMGFMT,id=3Ddisk
 fi
 src=3D$QEMU_HANDLE
=20
 if [ "$IMGOPTSSYNTAX" =3D "true" ]; then
     _launch_qemu \
-        -drive "${TEST_IMG}",cache=3D${CACHEMODE},id=3Ddisk \
+        -drive "${TEST_IMG}",cache=3D${CACHEMODE},aio=3D$AIOMODE,id=3Ddisk=
 \
         -incoming "unix:${MIG_SOCKET}"
 else
     _launch_qemu \
-        -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},driver=3D$IMGFMT,=
id=3Ddisk \
+        -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},aio=3D$AIOMODE,dr=
iver=3D$IMGFMT,id=3Ddisk \
         -incoming "unix:${MIG_SOCKET}"
 fi
 dest=3D$QEMU_HANDLE
diff --git a/tests/qemu-iotests/183 b/tests/qemu-iotests/183
index bced83fae0..94334a793d 100755
--- a/tests/qemu-iotests/183
+++ b/tests/qemu-iotests/183
@@ -56,12 +56,12 @@ echo
 qemu_comm_method=3D"qmp"
=20
 _launch_qemu \
-    -drive file=3D"${TEST_IMG}",cache=3D$CACHEMODE,driver=3D$IMGFMT,id=3Dd=
isk
+    -drive file=3D"${TEST_IMG}",cache=3D$CACHEMODE,aio=3D$AIOMODE,driver=
=3D$IMGFMT,id=3Ddisk
 src=3D$QEMU_HANDLE
 _send_qemu_cmd $src "{ 'execute': 'qmp_capabilities' }" 'return'
=20
 _launch_qemu \
-    -drive file=3D"${TEST_IMG}.dest",cache=3D$CACHEMODE,driver=3D$IMGFMT,i=
d=3Ddisk \
+    -drive file=3D"${TEST_IMG}.dest",cache=3D$CACHEMODE,aio=3D$AIOMODE,dri=
ver=3D$IMGFMT,id=3Ddisk \
     -incoming "unix:${MIG_SOCKET}"
 dest=3D$QEMU_HANDLE
 _send_qemu_cmd $dest "{ 'execute': 'qmp_capabilities' }" 'return'
diff --git a/tests/qemu-iotests/185 b/tests/qemu-iotests/185
index 454ff600cc..53aa4e89ed 100755
--- a/tests/qemu-iotests/185
+++ b/tests/qemu-iotests/185
@@ -54,7 +54,7 @@ echo
 qemu_comm_method=3D"qmp"
=20
 _launch_qemu \
-    -drive file=3D"${TEST_IMG}.base",cache=3D$CACHEMODE,driver=3D$IMGFMT,i=
d=3Ddisk
+    -drive file=3D"${TEST_IMG}.base",cache=3D$CACHEMODE,aio=3D$AIOMODE,dri=
ver=3D$IMGFMT,id=3Ddisk
 h=3D$QEMU_HANDLE
 _send_qemu_cmd $h "{ 'execute': 'qmp_capabilities' }" 'return'
=20
@@ -125,7 +125,7 @@ echo =3D=3D=3D Start active commit job and exit qemu =
=3D=3D=3D
 echo
=20
 _launch_qemu \
-    -drive file=3D"${TEST_IMG}",cache=3D$CACHEMODE,driver=3D$IMGFMT,id=3Dd=
isk
+    -drive file=3D"${TEST_IMG}",cache=3D$CACHEMODE,aio=3D$AIOMODE,driver=
=3D$IMGFMT,id=3Ddisk
 h=3D$QEMU_HANDLE
 _send_qemu_cmd $h "{ 'execute': 'qmp_capabilities' }" 'return'
=20
@@ -147,7 +147,7 @@ echo =3D=3D=3D Start mirror job and exit qemu =3D=3D=3D
 echo
=20
 _launch_qemu \
-    -drive file=3D"${TEST_IMG}",cache=3D$CACHEMODE,driver=3D$IMGFMT,id=3Dd=
isk
+    -drive file=3D"${TEST_IMG}",cache=3D$CACHEMODE,aio=3D$AIOMODE,driver=
=3D$IMGFMT,id=3Ddisk
 h=3D$QEMU_HANDLE
 _send_qemu_cmd $h "{ 'execute': 'qmp_capabilities' }" 'return'
=20
@@ -172,7 +172,7 @@ echo =3D=3D=3D Start backup job and exit qemu =3D=3D=3D
 echo
=20
 _launch_qemu \
-    -drive file=3D"${TEST_IMG}",cache=3D$CACHEMODE,driver=3D$IMGFMT,id=3Dd=
isk
+    -drive file=3D"${TEST_IMG}",cache=3D$CACHEMODE,aio=3D$AIOMODE,driver=
=3D$IMGFMT,id=3Ddisk
 h=3D$QEMU_HANDLE
 _send_qemu_cmd $h "{ 'execute': 'qmp_capabilities' }" 'return'
=20
@@ -196,7 +196,7 @@ echo =3D=3D=3D Start streaming job and exit qemu =3D=3D=
=3D
 echo
=20
 _launch_qemu \
-    -drive file=3D"${TEST_IMG}",cache=3D$CACHEMODE,driver=3D$IMGFMT,id=3Dd=
isk
+    -drive file=3D"${TEST_IMG}",cache=3D$CACHEMODE,aio=3D$AIOMODE,driver=
=3D$IMGFMT,id=3Ddisk
 h=3D$QEMU_HANDLE
 _send_qemu_cmd $h "{ 'execute': 'qmp_capabilities' }" 'return'
=20
diff --git a/tests/qemu-iotests/200 b/tests/qemu-iotests/200
index 72d431f251..49f93c5df2 100755
--- a/tests/qemu-iotests/200
+++ b/tests/qemu-iotests/200
@@ -66,7 +66,7 @@ echo =3D=3D=3D Starting QEMU VM =3D=3D=3D
 echo
 qemu_comm_method=3D"qmp"
 _launch_qemu -object iothread,id=3Diothread0 $virtio_scsi \
-             -drive file=3D"${TEST_IMG}",media=3Ddisk,if=3Dnone,cache=3D$C=
ACHEMODE,id=3Ddrive_sysdisk,format=3D$IMGFMT \
+             -drive file=3D"${TEST_IMG}",media=3Ddisk,if=3Dnone,cache=3D$C=
ACHEMODE,aio=3D$AIOMODE,id=3Ddrive_sysdisk,format=3D$IMGFMT \
              -device scsi-hd,drive=3Ddrive_sysdisk,bus=3Dscsi0.0,id=3Dsysd=
isk,bootindex=3D0
 h1=3D$QEMU_HANDLE
=20
diff --git a/tests/qemu-iotests/201 b/tests/qemu-iotests/201
index 86fa37e714..0ec0b07c36 100755
--- a/tests/qemu-iotests/201
+++ b/tests/qemu-iotests/201
@@ -58,20 +58,20 @@ qemu_comm_method=3D"monitor"
=20
 if [ "$IMGOPTSSYNTAX" =3D "true" ]; then
     _launch_qemu \
-        -drive "${TEST_IMG}",cache=3D${CACHEMODE},id=3Ddisk
+        -drive "${TEST_IMG}",cache=3D${CACHEMODE},aio=3D$AIOMODE,id=3Ddisk
 else
     _launch_qemu \
-        -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},driver=3D$IMGFMT,=
id=3Ddisk
+        -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},aio=3D$AIOMODE,dr=
iver=3D$IMGFMT,id=3Ddisk
 fi
 src=3D$QEMU_HANDLE
=20
 if [ "$IMGOPTSSYNTAX" =3D "true" ]; then
     _launch_qemu \
-        -drive "${TEST_IMG}",cache=3D${CACHEMODE},id=3Ddisk \
+        -drive "${TEST_IMG}",cache=3D${CACHEMODE},aio=3D$AIOMODE,id=3Ddisk=
 \
         -incoming "unix:${MIG_SOCKET}"
 else
     _launch_qemu \
-        -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},driver=3D$IMGFMT,=
id=3Ddisk \
+        -drive file=3D"${TEST_IMG}",cache=3D${CACHEMODE},aio=3D$AIOMODE,dr=
iver=3D$IMGFMT,id=3Ddisk \
         -incoming "unix:${MIG_SOCKET}"
 fi
 dest=3D$QEMU_HANDLE
--=20
2.23.0


