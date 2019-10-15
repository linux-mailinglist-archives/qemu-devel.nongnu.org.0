Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA05D8062
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 21:37:23 +0200 (CEST)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKSdF-00070l-Kc
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 15:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iKSb8-0005PY-JJ
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 15:35:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iKSb7-0006Ub-HT
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 15:35:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43010)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iKSb4-0006TA-Uy; Tue, 15 Oct 2019 15:35:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 215BBC0578F4;
 Tue, 15 Oct 2019 19:35:06 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0D8C19C4F;
 Tue, 15 Oct 2019 19:35:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] iotests: Fix 173
Date: Tue, 15 Oct 2019 14:35:01 -0500
Message-Id: <20191015193503.25591-2-eblake@redhat.com>
In-Reply-To: <20191015193503.25591-1-eblake@redhat.com>
References: <20191015193503.25591-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 15 Oct 2019 19:35:06 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test has been broken since 3.0.  It used TEST_IMG to influence
the name of a file created during _make_test_img, but commit 655ae6bb
changed things so that the wrong file name is being created, which
then caused _launch_qemu to fail.  In the meantime, the set of events
issued for the actions of the test has increased.

Why haven't we noticed the failure? Because the test rarely gets run:
'./check -qcow2 173' is insufficient (that defaults to using file protoco=
l)
'./check -nfs 173' is insufficient (that defaults to using raw format)
so the test is only run with:
./check -qcow2 -nfs 173

Note that we already have a number of other problems with -nfs:
./check -nfs (fails 18/30)
./check -qcow2 -nfs (fails 45/76 after this patch)
and it's not on my priority list to fix those.  Rather, I found this
because of my next patch's work on tests using _send_qemu_cmd.

Fixes: 655ae6b
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/173     | 4 ++--
 tests/qemu-iotests/173.out | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/173 b/tests/qemu-iotests/173
index 9e2fa2e73cb9..29dcaa1960df 100755
--- a/tests/qemu-iotests/173
+++ b/tests/qemu-iotests/173
@@ -47,9 +47,9 @@ size=3D100M
 BASE_IMG=3D"${TEST_DIR}/image.base"
 TOP_IMG=3D"${TEST_DIR}/image.snp1"

-TEST_IMG=3D"${BASE_IMG}" _make_test_img $size
+TEST_IMG_FILE=3D"${BASE_IMG}" _make_test_img $size

-TEST_IMG=3D"${TOP_IMG}" _make_test_img $size
+TEST_IMG_FILE=3D"${TOP_IMG}" _make_test_img $size

 echo
 echo =3D=3D=3D Running QEMU, using block-stream to find backing image =3D=
=3D=3D
diff --git a/tests/qemu-iotests/173.out b/tests/qemu-iotests/173.out
index f477a0099a32..e83d17ec2f64 100644
--- a/tests/qemu-iotests/173.out
+++ b/tests/qemu-iotests/173.out
@@ -7,6 +7,10 @@ Formatting 'TEST_DIR/image.snp1', fmt=3DIMGFMT size=3D10=
4857600
 {"return": {}}
 {"return": {}}
 {"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "even=
t": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "disk2"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "even=
t": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "disk2"}}
 {"return": {}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "even=
t": "BLOCK_JOB_COMPLETED", "data": {"device": "disk2", "len": 104857600, =
"offset": 104857600, "speed": 0, "type": "stream"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "even=
t": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "disk2"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "even=
t": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "disk2"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "even=
t": "BLOCK_JOB_COMPLETED", "data": {"device": "disk2", "len": 0, "offset"=
: 0, "speed": 0, "type": "stream"}}
 *** done
--=20
2.21.0


