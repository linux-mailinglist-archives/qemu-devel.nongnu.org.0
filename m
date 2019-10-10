Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7DAD2E0B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 17:45:43 +0200 (CEST)
Received: from localhost ([::1]:41356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIadJ-000095-OU
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 11:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIaKS-0006tB-3Y
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:26:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIaKQ-0004lK-UY
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:26:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13594)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIaKO-0004jY-Gv; Thu, 10 Oct 2019 11:26:08 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B763389F38E;
 Thu, 10 Oct 2019 15:26:07 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33D7C194B6;
 Thu, 10 Oct 2019 15:26:07 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 22/23] iotests/267: Create socket in $SOCK_DIR
Date: Thu, 10 Oct 2019 17:24:56 +0200
Message-Id: <20191010152457.17713-23-mreitz@redhat.com>
In-Reply-To: <20191010152457.17713-1-mreitz@redhat.com>
References: <20191010152457.17713-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 10 Oct 2019 15:26:07 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/267     | 4 ++--
 tests/qemu-iotests/267.out | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/267 b/tests/qemu-iotests/267
index d37a67c012..170e173c0a 100755
--- a/tests/qemu-iotests/267
+++ b/tests/qemu-iotests/267
@@ -29,7 +29,7 @@ status=3D1	# failure is the default!
 _cleanup()
 {
     _cleanup_test_img
-    rm -f "$TEST_DIR/nbd"
+    rm -f "$SOCK_DIR/nbd"
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15
=20
@@ -143,7 +143,7 @@ echo
=20
 IMGOPTS=3D"backing_file=3D$TEST_IMG.base" _make_test_img $size
 cat <<EOF |
-nbd_server_start unix:$TEST_DIR/nbd
+nbd_server_start unix:$SOCK_DIR/nbd
 nbd_server_add -w backing-fmt
 savevm snap0
 info snapshots
diff --git a/tests/qemu-iotests/267.out b/tests/qemu-iotests/267.out
index 9d812e3c72..8dddb4baa4 100644
--- a/tests/qemu-iotests/267.out
+++ b/tests/qemu-iotests/267.out
@@ -161,7 +161,7 @@ Internal snapshots on backing file:
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3DTEST_DIR/t.IMGFMT.base
 Testing: -blockdev driver=3Dfile,filename=3DTEST_DIR/t.IMGFMT.base,node-=
name=3Dbacking-file -blockdev driver=3DIMGFMT,file=3Dbacking-file,node-na=
me=3Dbacking-fmt -blockdev driver=3Dfile,filename=3DTEST_DIR/t.IMGFMT,nod=
e-name=3Dfile -blockdev driver=3DIMGFMT,file=3Dfile,backing=3Dbacking-fmt=
,node-name=3Dfmt
 QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) nbd_server_start unix:TEST_DIR/nbd
+(qemu) nbd_server_start unix:SOCK_DIR/nbd
 (qemu) nbd_server_add -w backing-fmt
 (qemu) savevm snap0
 (qemu) info snapshots
--=20
2.21.0


