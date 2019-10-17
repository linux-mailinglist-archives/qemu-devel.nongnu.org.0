Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0768EDB02C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 16:36:45 +0200 (CEST)
Received: from localhost ([::1]:49438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL6tP-0003sk-Di
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 10:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37177)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iL5tg-0002xn-DJ
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iL5tf-0003kr-1O
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43780)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iL5tY-0003eT-NK; Thu, 17 Oct 2019 09:32:48 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 023B9300CB2C;
 Thu, 17 Oct 2019 13:32:48 +0000 (UTC)
Received: from localhost (ovpn-117-3.ams2.redhat.com [10.36.117.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98432600C4;
 Thu, 17 Oct 2019 13:32:47 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 20/23] iotests/223: Create socket in $SOCK_DIR
Date: Thu, 17 Oct 2019 15:31:52 +0200
Message-Id: <20191017133155.5327-21-mreitz@redhat.com>
In-Reply-To: <20191017133155.5327-1-mreitz@redhat.com>
References: <20191017133155.5327-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 17 Oct 2019 13:32:48 +0000 (UTC)
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
---
 tests/qemu-iotests/223 | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/223 b/tests/qemu-iotests/223
index 2ba3d8124b..b5a80e50bb 100755
--- a/tests/qemu-iotests/223
+++ b/tests/qemu-iotests/223
@@ -28,7 +28,7 @@ _cleanup()
     nbd_server_stop
     _cleanup_test_img
     _cleanup_qemu
-    rm -f "$TEST_DIR/nbd"
+    rm -f "$SOCK_DIR/nbd"
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15
=20
@@ -125,11 +125,11 @@ _send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server=
-add",
   "arguments":{"device":"n"}}' "error" # Attempt add without server
 _send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
   "arguments":{"addr":{"type":"unix",
-    "data":{"path":"'"$TEST_DIR/nbd"'"}}}}' "return"
+    "data":{"path":"'"$SOCK_DIR/nbd"'"}}}}' "return"
 _send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
   "arguments":{"addr":{"type":"unix",
-    "data":{"path":"'"$TEST_DIR/nbd"1'"}}}}' "error" # Attempt second se=
rver
-$QEMU_NBD_PROG -L -k "$TEST_DIR/nbd"
+    "data":{"path":"'"$SOCK_DIR/nbd"1'"}}}}' "error" # Attempt second se=
rver
+$QEMU_NBD_PROG -L -k "$SOCK_DIR/nbd"
 _send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-add",
   "arguments":{"device":"n", "bitmap":"b"}}' "return"
 _send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-add",
@@ -145,14 +145,14 @@ _send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server=
-add",
 _send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-add",
   "arguments":{"device":"n", "name":"n2", "writable":true,
   "bitmap":"b2"}}' "return"
-$QEMU_NBD_PROG -L -k "$TEST_DIR/nbd"
+$QEMU_NBD_PROG -L -k "$SOCK_DIR/nbd"
=20
 echo
 echo "=3D=3D=3D Contrast normal status to large granularity dirty-bitmap=
 =3D=3D=3D"
 echo
=20
 QEMU_IO_OPTIONS=3D$QEMU_IO_OPTIONS_NO_FMT
-IMG=3D"driver=3Dnbd,export=3Dn,server.type=3Dunix,server.path=3D$TEST_DI=
R/nbd"
+IMG=3D"driver=3Dnbd,export=3Dn,server.type=3Dunix,server.path=3D$SOCK_DI=
R/nbd"
 $QEMU_IO -r -c 'r -P 0x22 512 512' -c 'r -P 0 512k 512k' -c 'r -P 0x11 1=
m 1m' \
   -c 'r -P 0x33 2m 2m' --image-opts "$IMG" | _filter_qemu_io
 $QEMU_IMG map --output=3Djson --image-opts \
@@ -164,7 +164,7 @@ echo
 echo "=3D=3D=3D Contrast to small granularity dirty-bitmap =3D=3D=3D"
 echo
=20
-IMG=3D"driver=3Dnbd,export=3Dn2,server.type=3Dunix,server.path=3D$TEST_D=
IR/nbd"
+IMG=3D"driver=3Dnbd,export=3Dn2,server.type=3Dunix,server.path=3D$SOCK_D=
IR/nbd"
 $QEMU_IMG map --output=3Djson --image-opts \
   "$IMG,x-dirty-bitmap=3Dqemu:dirty-bitmap:b2" | _filter_qemu_img_map
=20
--=20
2.21.0


