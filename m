Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9092A5CD9
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 22:02:34 +0200 (CEST)
Received: from localhost ([::1]:39584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4sE1-0004Em-1v
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 15:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51315)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i4s5B-0004Op-39
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 15:33:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i4s5A-00077Y-0Y
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 15:33:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54052)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i4s57-000741-TO; Mon, 02 Sep 2019 15:33:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 414B230917AC;
 Mon,  2 Sep 2019 19:33:41 +0000 (UTC)
Received: from localhost (ovpn-204-221.brq.redhat.com [10.40.204.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8609F608AB;
 Mon,  2 Sep 2019 19:33:38 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  2 Sep 2019 21:33:19 +0200
Message-Id: <20190902193320.32233-5-mreitz@redhat.com>
In-Reply-To: <20190902193320.32233-1-mreitz@redhat.com>
References: <20190902193320.32233-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 02 Sep 2019 19:33:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 4/5] iotests: Restrict nbd Python tests to
 nbd
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have two Python unittest-style tests that test NBD.  As such, they
should specify supported_protocols=3D['nbd'] so they are skipped when the
user wants to test some other protocol.

Furthermore, we should restrict their choice of formats to 'raw'.  The
idea of a protocol/format combination is to use some format over some
protocol; but we always use the raw format over NBD.  It does not really
matter what the NBD server uses on its end, and it is not a useful test
of the respective format driver anyway.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/147 | 5 ++---
 tests/qemu-iotests/205 | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index 2d84fddb01..ab8480b9a4 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -287,6 +287,5 @@ class BuiltinNBD(NBDBlockdevAddBase):
=20
=20
 if __name__ =3D=3D '__main__':
-    # Need to support image creation
-    iotests.main(supported_fmts=3D['vpc', 'parallels', 'qcow', 'vdi', 'q=
cow2',
-                                 'vmdk', 'raw', 'vhdx', 'qed'])
+    iotests.main(supported_fmts=3D['raw'],
+                 supported_protocols=3D['nbd'])
diff --git a/tests/qemu-iotests/205 b/tests/qemu-iotests/205
index b8a86c446e..76f6c5fa2b 100755
--- a/tests/qemu-iotests/205
+++ b/tests/qemu-iotests/205
@@ -153,4 +153,5 @@ class TestNbdServerRemove(iotests.QMPTestCase):
=20
=20
 if __name__ =3D=3D '__main__':
-    iotests.main(supported_fmts=3D['generic'])
+    iotests.main(supported_fmts=3D['raw'],
+                 supported_protocols=3D['nbd'])
--=20
2.21.0


