Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E0B10E6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 16:16:50 +0200 (CEST)
Received: from localhost ([::1]:34956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Ptw-0000cx-DX
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 10:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39439)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i8PR3-00038o-UF
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i8PR2-0001Zm-Vw
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51500)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i8PR0-0001Yi-Sc; Thu, 12 Sep 2019 09:46:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 385CC18CB8E1;
 Thu, 12 Sep 2019 13:46:54 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-179.ams2.redhat.com
 [10.36.116.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C7E8600C4;
 Thu, 12 Sep 2019 13:46:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 12 Sep 2019 15:46:01 +0200
Message-Id: <20190912134604.22019-20-kwolf@redhat.com>
In-Reply-To: <20190912134604.22019-1-kwolf@redhat.com>
References: <20190912134604.22019-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Thu, 12 Sep 2019 13:46:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 19/22] iotests: extend sleeping time under
 Valgrind
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

To synchronize the time when QEMU is running longer under the Valgrind,
increase the sleeping time in the test 247.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/247 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/247 b/tests/qemu-iotests/247
index 546a794d3d..c853b73819 100755
--- a/tests/qemu-iotests/247
+++ b/tests/qemu-iotests/247
@@ -57,7 +57,11 @@ TEST_IMG=3D"$TEST_IMG.4" _make_test_img $size
 {"execute":"block-commit",
  "arguments":{"device":"format-4", "top-node": "format-2", "base-node":"=
format-0", "job-id":"job0"}}
 EOF
-sleep 1
+if [ "${VALGRIND_QEMU}" =3D=3D "y" ]; then
+    sleep 10
+else
+    sleep 1
+fi
 echo '{"execute":"quit"}'
 ) | $QEMU -qmp stdio -nographic -nodefaults \
     -blockdev file,node-name=3Dfile-0,filename=3D$TEST_IMG.0,auto-read-o=
nly=3Don \
--=20
2.20.1


