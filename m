Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57253268F0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 19:14:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTUoS-0001eu-IY
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 13:14:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hTUfN-0003jT-69
	for qemu-devel@nongnu.org; Wed, 22 May 2019 13:04:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hTUfI-0007xg-NM
	for qemu-devel@nongnu.org; Wed, 22 May 2019 13:04:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43520)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hTUfF-0007ov-M2; Wed, 22 May 2019 13:04:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A70B3086258;
	Wed, 22 May 2019 17:04:23 +0000 (UTC)
Received: from localhost (ovpn-204-123.brq.redhat.com [10.40.204.123])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C827419C4F;
	Wed, 22 May 2019 17:04:22 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed, 22 May 2019 19:03:52 +0200
Message-Id: <20190522170352.12020-9-mreitz@redhat.com>
In-Reply-To: <20190522170352.12020-1-mreitz@redhat.com>
References: <20190522170352.12020-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 22 May 2019 17:04:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 8/8] iotests: Test failure to loosen
 restrictions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/182     | 21 +++++++++++++++++++++
 tests/qemu-iotests/182.out |  6 ++++++
 2 files changed, 27 insertions(+)

diff --git a/tests/qemu-iotests/182 b/tests/qemu-iotests/182
index 3a90ebfbfd..7f494eb9bb 100755
--- a/tests/qemu-iotests/182
+++ b/tests/qemu-iotests/182
@@ -152,6 +152,27 @@ success_or_failure=3Dy _send_qemu_cmd $QEMU_HANDLE \
=20
 _cleanup_qemu
=20
+echo
+echo '=3D=3D=3D Testing failure to loosen restrictions =3D=3D=3D'
+echo
+
+_launch_qemu -drive file=3D$TEST_IMG,if=3Dnone,file.locking=3Don
+
+_send_qemu_cmd $QEMU_HANDLE \
+    "{'execute': 'qmp_capabilities'}" \
+    'return'
+
+_cleanup_test_img
+
+# When quitting qemu, it will try to drop its locks on the test image.
+# Because that file no longer exists, it will be unable to do so.
+# However, that is not fatal, so it should just move on.
+_send_qemu_cmd $QEMU_HANDLE \
+    "{'execute': 'quit'}" \
+    'return'
+
+wait=3D1 _cleanup_qemu
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/182.out b/tests/qemu-iotests/182.out
index 33d41eea91..ffef23e32b 100644
--- a/tests/qemu-iotests/182.out
+++ b/tests/qemu-iotests/182.out
@@ -15,4 +15,10 @@ Formatting 'TEST_DIR/t.qcow2.overlay', fmt=3Dqcow2 siz=
e=3D197120 backing_file=3DTEST_D
 {"return": {}}
 {"return": {}}
 {"return": {}}
+
+=3D=3D=3D Testing failure to loosen restrictions =3D=3D=3D
+
+{"return": {}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "even=
t": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 *** done
--=20
2.21.0


