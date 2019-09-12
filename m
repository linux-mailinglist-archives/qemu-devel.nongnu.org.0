Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FEAB10A3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 16:05:18 +0200 (CEST)
Received: from localhost ([::1]:34852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Pin-0003ut-9n
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 10:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39381)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i8PR0-00033u-3S
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i8PQz-0001Y1-0Y
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:46:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50986)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i8PQw-0001W9-K0; Thu, 12 Sep 2019 09:46:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EA7F430A5A54;
 Thu, 12 Sep 2019 13:46:49 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-179.ams2.redhat.com
 [10.36.116.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFDD76012A;
 Thu, 12 Sep 2019 13:46:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 12 Sep 2019 15:45:59 +0200
Message-Id: <20190912134604.22019-18-kwolf@redhat.com>
In-Reply-To: <20190912134604.22019-1-kwolf@redhat.com>
References: <20190912134604.22019-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 12 Sep 2019 13:46:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 17/22] iotests: Valgrind fails with nonexistent
 directory
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

The Valgrind uses the exported variable TMPDIR and fails if the
directory does not exist. Let us exclude such a test case from
being run under the Valgrind and notify the user of it.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/051 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index ce942a5444..53bcdbc911 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -377,6 +377,10 @@ printf %b "qemu-io $device_id \"write -P 0x33 0 4k\"=
\ncommit $device_id\n" |
 $QEMU_IO -c "read -P 0x33 0 4k" "$TEST_IMG" | _filter_qemu_io
=20
 # Using snapshot=3Don with a non-existent TMPDIR
+if [ "${VALGRIND_QEMU_VM}" =3D=3D "y" ]; then
+    _casenotrun "Valgrind needs a valid TMPDIR for itself"
+fi
+VALGRIND_QEMU_VM=3D \
 TMPDIR=3D/nonexistent run_qemu -drive driver=3Dnull-co,snapshot=3Don
=20
 # Using snapshot=3Don together with read-only=3Don
--=20
2.20.1


