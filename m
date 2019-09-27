Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011DDC02B9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 11:54:33 +0200 (CEST)
Received: from localhost ([::1]:49060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDmxL-00061s-1o
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 05:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33513)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iDmmW-0003cA-P3
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:43:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iDmmV-0007vk-Cg
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:43:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49294)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iDmmT-0007pZ-6D; Fri, 27 Sep 2019 05:43:17 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 72A633082A8D;
 Fri, 27 Sep 2019 09:43:16 +0000 (UTC)
Received: from localhost (ovpn-204-76.brq.redhat.com [10.40.204.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C3AB60BE2;
 Fri, 27 Sep 2019 09:43:15 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 13/18] iotests: Make 091 work with data_file
Date: Fri, 27 Sep 2019 11:42:37 +0200
Message-Id: <20190927094242.11152-14-mreitz@redhat.com>
In-Reply-To: <20190927094242.11152-1-mreitz@redhat.com>
References: <20190927094242.11152-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 27 Sep 2019 09:43:16 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The image end offset as reported by qemu-img check is different when
using an external data file; we do not care about its value here, so we
can just filter it.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/091     | 3 ++-
 tests/qemu-iotests/091.out | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/091 b/tests/qemu-iotests/091
index f4b44659ae..7536ca4607 100755
--- a/tests/qemu-iotests/091
+++ b/tests/qemu-iotests/091
@@ -101,7 +101,8 @@ echo "Check image pattern"
 ${QEMU_IO} -c "read -P 0x22 0 4M" "${TEST_IMG}" | _filter_testdir | _fil=
ter_qemu_io
=20
 echo "Running 'qemu-img check -r all \$TEST_IMG'"
-"${QEMU_IMG}" check -r all "${TEST_IMG}" 2>&1 | _filter_testdir | _filte=
r_qemu
+"${QEMU_IMG}" check -r all "${TEST_IMG}" 2>&1 | _filter_testdir | _filte=
r_qemu \
+    | sed '/Image end offset/d'
=20
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/091.out b/tests/qemu-iotests/091.out
index 5017f8c2d9..343fac69e0 100644
--- a/tests/qemu-iotests/091.out
+++ b/tests/qemu-iotests/091.out
@@ -24,5 +24,4 @@ read 4194304/4194304 bytes at offset 0
 Running 'qemu-img check -r all $TEST_IMG'
 No errors were found on the image.
 80/16384 =3D 0.49% allocated, 0.00% fragmented, 0.00% compressed cluster=
s
-Image end offset: 5570560
 *** done
--=20
2.21.0


