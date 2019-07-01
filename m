Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0FF4E92D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 15:31:17 +0200 (CEST)
Received: from localhost ([::1]:34860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heJdM-00046Q-J2
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 09:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50421)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1heJW7-0006I5-KN
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 09:23:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1heJW4-0004TI-Hj
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 09:23:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51758)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1heJVw-0004Mx-4V; Fri, 21 Jun 2019 09:23:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BC8BB821EF;
 Fri, 21 Jun 2019 13:23:34 +0000 (UTC)
Received: from localhost (ovpn-204-30.brq.redhat.com [10.40.204.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51C915B68B;
 Fri, 21 Jun 2019 13:23:34 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 21 Jun 2019 15:23:19 +0200
Message-Id: <20190621132324.2165-4-mreitz@redhat.com>
In-Reply-To: <20190621132324.2165-1-mreitz@redhat.com>
References: <20190621132324.2165-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 21 Jun 2019 13:23:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 3/8] iotest 134: test cluster-misaligned
 encrypted write
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Nefedov <anton.nefedov@virtuozzo.com>

COW (even empty/zero) areas require encryption too

Signed-off-by: Anton Nefedov <anton.nefedov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-id: 20190516143028.81155-1-anton.nefedov@virtuozzo.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/134     |  9 +++++++++
 tests/qemu-iotests/134.out | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/tests/qemu-iotests/134 b/tests/qemu-iotests/134
index 141a2eaa7e..5f0fb86211 100755
--- a/tests/qemu-iotests/134
+++ b/tests/qemu-iotests/134
@@ -56,6 +56,15 @@ echo
 echo "=3D=3D reading whole image =3D=3D"
 $QEMU_IO --object $SECRET -c "read 0 $size" --image-opts $IMGSPEC | _fil=
ter_qemu_io | _filter_testdir
=20
+echo
+echo "=3D=3D rewriting cluster part =3D=3D"
+$QEMU_IO --object $SECRET -c "write -P 0xb 512 512" --image-opts $IMGSPE=
C | _filter_qemu_io | _filter_testdir
+
+echo
+echo "=3D=3D verify pattern =3D=3D"
+$QEMU_IO --object $SECRET -c "read -P 0 0 512"  --image-opts $IMGSPEC | =
_filter_qemu_io | _filter_testdir
+$QEMU_IO --object $SECRET -c "read -P 0xb 512 512"  --image-opts $IMGSPE=
C | _filter_qemu_io | _filter_testdir
+
 echo
 echo "=3D=3D rewriting whole image =3D=3D"
 $QEMU_IO --object $SECRET -c "write -P 0xa 0 $size" --image-opts $IMGSPE=
C | _filter_qemu_io | _filter_testdir
diff --git a/tests/qemu-iotests/134.out b/tests/qemu-iotests/134.out
index 972be49d91..09d46f6b17 100644
--- a/tests/qemu-iotests/134.out
+++ b/tests/qemu-iotests/134.out
@@ -5,6 +5,16 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1342=
17728 encryption=3Don encrypt.
 read 134217728/134217728 bytes at offset 0
 128 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
=20
+=3D=3D rewriting cluster part =3D=3D
+wrote 512/512 bytes at offset 512
+512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+=3D=3D verify pattern =3D=3D
+read 512/512 bytes at offset 0
+512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 512/512 bytes at offset 512
+512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
 =3D=3D rewriting whole image =3D=3D
 wrote 134217728/134217728 bytes at offset 0
 128 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
--=20
2.21.0


