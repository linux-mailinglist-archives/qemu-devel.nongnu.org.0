Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65421B10A8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 16:06:27 +0200 (CEST)
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Pjt-0005QN-HM
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 10:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i8PQu-0002wU-4q
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i8PQs-0001TR-4O
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56957)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i8PQo-0001RO-Ad; Thu, 12 Sep 2019 09:46:42 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9A69E81DF2;
 Thu, 12 Sep 2019 13:46:41 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-179.ams2.redhat.com
 [10.36.116.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80DA8600C4;
 Thu, 12 Sep 2019 13:46:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 12 Sep 2019 15:45:54 +0200
Message-Id: <20190912134604.22019-13-kwolf@redhat.com>
In-Reply-To: <20190912134604.22019-1-kwolf@redhat.com>
References: <20190912134604.22019-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 12 Sep 2019 13:46:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 12/22] iotests: skip 232 when run tests as root
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

chmod a-w don't help under root, so skip the test in such case.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/232 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qemu-iotests/232 b/tests/qemu-iotests/232
index 2063f78876..65b0e42063 100755
--- a/tests/qemu-iotests/232
+++ b/tests/qemu-iotests/232
@@ -74,6 +74,12 @@ if [ -n "$TEST_IMG_FILE" ]; then
     TEST_IMG=3D$TEST_IMG_FILE
 fi
=20
+chmod a-w $TEST_IMG
+(echo test > $TEST_IMG) 2>/dev/null && \
+    _notrun "Readonly attribute is ignored, probably you run this test a=
s" \
+            "root, which is unsupported."
+chmod a+w $TEST_IMG
+
 echo
 echo "=3D=3D=3D -drive with read-write image: read-only/auto-read-only c=
ombinations =3D=3D=3D"
 echo
--=20
2.20.1


