Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2DBDB022
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 16:33:55 +0200 (CEST)
Received: from localhost ([::1]:49396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL6qf-0008S0-7E
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 10:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iL5tS-0002gr-OQ
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iL5tR-0003aF-As
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:32:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48292)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iL5tJ-0003Wd-TR; Thu, 17 Oct 2019 09:32:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 297EF4E925;
 Thu, 17 Oct 2019 13:32:33 +0000 (UTC)
Received: from localhost (ovpn-117-3.ams2.redhat.com [10.36.117.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C08795D6C8;
 Thu, 17 Oct 2019 13:32:32 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 13/23] iotests/192: Create socket in $SOCK_DIR
Date: Thu, 17 Oct 2019 15:31:45 +0200
Message-Id: <20191017133155.5327-14-mreitz@redhat.com>
In-Reply-To: <20191017133155.5327-1-mreitz@redhat.com>
References: <20191017133155.5327-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 17 Oct 2019 13:32:33 +0000 (UTC)
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
 tests/qemu-iotests/192     | 4 ++--
 tests/qemu-iotests/192.out | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/192 b/tests/qemu-iotests/192
index 034432272f..d2ba55dd90 100755
--- a/tests/qemu-iotests/192
+++ b/tests/qemu-iotests/192
@@ -31,7 +31,7 @@ _cleanup()
 {
     _cleanup_qemu
     _cleanup_test_img
-    rm -f "$TEST_DIR/nbd"
+    rm -f "$SOCK_DIR/nbd"
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15
=20
@@ -66,7 +66,7 @@ else
     QEMU_COMM_TIMEOUT=3D1
 fi
=20
-_send_qemu_cmd $h "nbd_server_start unix:$TEST_DIR/nbd" "(qemu)"
+_send_qemu_cmd $h "nbd_server_start unix:$SOCK_DIR/nbd" "(qemu)"
 _send_qemu_cmd $h "nbd_server_add -w drive0" "(qemu)"
 _send_qemu_cmd $h "q" "(qemu)"
=20
diff --git a/tests/qemu-iotests/192.out b/tests/qemu-iotests/192.out
index 1e0be4c4d7..b9429dbe36 100644
--- a/tests/qemu-iotests/192.out
+++ b/tests/qemu-iotests/192.out
@@ -1,7 +1,7 @@
 QA output created by 192
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
 QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) nbd_server_start unix:TEST_DIR/nbd
+(qemu) nbd_server_start unix:SOCK_DIR/nbd
 (qemu) nbd_server_add -w drive0
 (qemu) q
 *** done
--=20
2.21.0


