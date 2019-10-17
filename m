Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC7CDAF2C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 16:08:14 +0200 (CEST)
Received: from localhost ([::1]:48772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL6Ro-0001SS-NU
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 10:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iL5t8-0002Sn-Ow
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iL5t7-0003Ny-Je
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37482)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iL5t5-0003M9-4b; Thu, 17 Oct 2019 09:32:19 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4C341307B189;
 Thu, 17 Oct 2019 13:32:18 +0000 (UTC)
Received: from localhost (ovpn-117-3.ams2.redhat.com [10.36.117.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B993460852;
 Thu, 17 Oct 2019 13:32:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 07/23] iotests/140: Create socket in $SOCK_DIR
Date: Thu, 17 Oct 2019 15:31:39 +0200
Message-Id: <20191017133155.5327-8-mreitz@redhat.com>
In-Reply-To: <20191017133155.5327-1-mreitz@redhat.com>
References: <20191017133155.5327-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 17 Oct 2019 13:32:18 +0000 (UTC)
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

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/140     | 8 ++++----
 tests/qemu-iotests/140.out | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/140 b/tests/qemu-iotests/140
index b965b1dd5d..8d2ce5d9e3 100755
--- a/tests/qemu-iotests/140
+++ b/tests/qemu-iotests/140
@@ -34,7 +34,7 @@ _cleanup()
 {
     _cleanup_qemu
     _cleanup_test_img
-    rm -f "$TEST_DIR/nbd"
+    rm -f "$SOCK_DIR/nbd"
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15
=20
@@ -69,7 +69,7 @@ _send_qemu_cmd $QEMU_HANDLE \
 _send_qemu_cmd $QEMU_HANDLE \
     "{ 'execute': 'nbd-server-start',
        'arguments': { 'addr': { 'type': 'unix',
-                                'data': { 'path': '$TEST_DIR/nbd' }}}}" =
\
+                                'data': { 'path': '$SOCK_DIR/nbd' }}}}" =
\
     'return'
=20
 _send_qemu_cmd $QEMU_HANDLE \
@@ -78,7 +78,7 @@ _send_qemu_cmd $QEMU_HANDLE \
     'return'
=20
 $QEMU_IO_PROG -f raw -r -c 'read -P 42 0 64k' \
-    "nbd+unix:///drv?socket=3D$TEST_DIR/nbd" 2>&1 \
+    "nbd+unix:///drv?socket=3D$SOCK_DIR/nbd" 2>&1 \
     | _filter_qemu_io | _filter_nbd
=20
 _send_qemu_cmd $QEMU_HANDLE \
@@ -87,7 +87,7 @@ _send_qemu_cmd $QEMU_HANDLE \
     'return'
=20
 $QEMU_IO_PROG -f raw -r -c close \
-    "nbd+unix:///drv?socket=3D$TEST_DIR/nbd" 2>&1 \
+    "nbd+unix:///drv?socket=3D$SOCK_DIR/nbd" 2>&1 \
     | _filter_qemu_io | _filter_nbd
=20
 _send_qemu_cmd $QEMU_HANDLE \
diff --git a/tests/qemu-iotests/140.out b/tests/qemu-iotests/140.out
index 67fe44a3e3..2511eb7369 100644
--- a/tests/qemu-iotests/140.out
+++ b/tests/qemu-iotests/140.out
@@ -8,7 +8,7 @@ wrote 65536/65536 bytes at offset 0
 read 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 {"return": {}}
-qemu-io: can't open device nbd+unix:///drv?socket=3DTEST_DIR/nbd: Reques=
ted export not available
+qemu-io: can't open device nbd+unix:///drv?socket=3DSOCK_DIR/nbd: Reques=
ted export not available
 server reported: export 'drv' not present
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "even=
t": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
--=20
2.21.0


