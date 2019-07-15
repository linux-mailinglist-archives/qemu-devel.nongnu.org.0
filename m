Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D2691D3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 16:32:18 +0200 (CEST)
Received: from localhost ([::1]:39516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn21Z-0006jN-3l
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 10:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34558)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hn1z3-0005wk-QP
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hn1z2-00068A-NL
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:29:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40034)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hn1z0-00066F-1D; Mon, 15 Jul 2019 10:29:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4F30786679;
 Mon, 15 Jul 2019 14:29:37 +0000 (UTC)
Received: from localhost (unknown [10.40.205.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 758495D968;
 Mon, 15 Jul 2019 14:29:36 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 15 Jul 2019 16:29:03 +0200
Message-Id: <20190715142905.9078-10-mreitz@redhat.com>
In-Reply-To: <20190715142905.9078-1-mreitz@redhat.com>
References: <20190715142905.9078-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 15 Jul 2019 14:29:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 09/11] iotests: Add new case to 030
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

We recently removed the dependency of the stream job on its base node.
That makes it OK to use a commit filter node there.  Test that.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Tested-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-id: 20190703172813.6868-11-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/030     | 25 +++++++++++++++++++++++++
 tests/qemu-iotests/030.out |  4 ++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 10fe1de89d..a0397072bc 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -363,6 +363,31 @@ class TestParallelOps(iotests.QMPTestCase):
         self.wait_until_completed()
         self.assert_no_active_block_jobs()
=20
+    # In this case the base node of the stream job is the commit job's
+    # filter node.  stream does not have a real dependency on its base
+    # node, so even though commit removes it when it is done, there is
+    # no conflict.
+    def test_overlapping_5(self):
+        self.assert_no_active_block_jobs()
+
+        # Commit from node2 into node0
+        result =3D self.vm.qmp('block-commit', device=3D'drive0',
+                             top_node=3D'node2', base_node=3D'node0',
+                             filter_node_name=3D'commit-filter', speed=3D=
1024*1024)
+        self.assert_qmp(result, 'return', {})
+
+        # Stream from node2 into node4
+        result =3D self.vm.qmp('block-stream', device=3D'node4',
+                             base_node=3D'commit-filter', job_id=3D'node=
4')
+        self.assert_qmp(result, 'return', {})
+
+        result =3D self.vm.qmp('block-job-set-speed', device=3D'drive0',=
 speed=3D0)
+        self.assert_qmp(result, 'return', {})
+
+        self.vm.run_job(job=3D'drive0', auto_dismiss=3DTrue, use_log=3DF=
alse)
+        self.vm.run_job(job=3D'node4', auto_dismiss=3DTrue, use_log=3DFa=
lse)
+        self.assert_no_active_block_jobs()
+
     # Test a block-stream and a block-commit job in parallel
     # Here the stream job is supposed to finish quickly in order to repr=
oduce
     # the scenario that triggers the bug fixed in 3d5d319e1221 and 1a63a=
907507
diff --git a/tests/qemu-iotests/030.out b/tests/qemu-iotests/030.out
index 4fd1c2dcd2..5eb508de07 100644
--- a/tests/qemu-iotests/030.out
+++ b/tests/qemu-iotests/030.out
@@ -1,5 +1,5 @@
-.........................
+..........................
 ----------------------------------------------------------------------
-Ran 25 tests
+Ran 26 tests
=20
 OK
--=20
2.21.0


