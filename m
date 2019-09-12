Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B28B10FA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 16:20:09 +0200 (CEST)
Received: from localhost ([::1]:35008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8PxA-00056F-7X
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 10:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i8Pas-0006tN-FS
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:57:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i8Paq-0006X2-RB
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:57:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52898)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i8Pan-0006VH-S7; Thu, 12 Sep 2019 09:57:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 316B510F23E1;
 Thu, 12 Sep 2019 13:57:01 +0000 (UTC)
Received: from localhost (unknown [10.40.205.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31CFC608AB;
 Thu, 12 Sep 2019 13:56:57 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 12 Sep 2019 15:56:32 +0200
Message-Id: <20190912135632.13925-5-mreitz@redhat.com>
In-Reply-To: <20190912135632.13925-1-mreitz@redhat.com>
References: <20190912135632.13925-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 12 Sep 2019 13:57:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/4] iotests: Add test for failing mirror
 complete
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/041     | 44 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/041.out |  4 ++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 8568426311..84bc6d6581 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -1121,6 +1121,50 @@ class TestOrphanedSource(iotests.QMPTestCase):
                              target=3D'dest-ro')
         self.assert_qmp(result, 'error/class', 'GenericError')
=20
+    def test_failing_permission_in_complete(self):
+        self.assert_no_active_block_jobs()
+
+        # Unshare consistent-read on the target
+        # (The mirror job does not care)
+        result =3D self.vm.qmp('blockdev-add',
+                             driver=3D'blkdebug',
+                             node_name=3D'dest-perm',
+                             image=3D'dest',
+                             unshare_child_perms=3D['consistent-read'])
+        self.assert_qmp(result, 'return', {})
+
+        result =3D self.vm.qmp('blockdev-mirror', job_id=3D'job', device=
=3D'src',
+                             sync=3D'full', target=3D'dest',
+                             filter_node_name=3D'mirror-filter')
+        self.assert_qmp(result, 'return', {})
+
+        # Require consistent-read on the source
+        # (We can only add this node once the job has started, or it
+        # will complain that it does not want to run on non-root nodes)
+        result =3D self.vm.qmp('blockdev-add',
+                             driver=3D'blkdebug',
+                             node_name=3D'src-perm',
+                             image=3D'src',
+                             take_child_perms=3D['consistent-read'])
+        self.assert_qmp(result, 'return', {})
+
+        # While completing, mirror will attempt to replace src by
+        # dest, which must fail because src-perm requires
+        # consistent-read but dest-perm does not share it; thus
+        # aborting the job when it is supposed to complete
+        self.complete_and_wait('job',
+                               completion_error=3D'Operation not permitt=
ed')
+
+        # Assert that all of our nodes are still there (except for the
+        # mirror filter, which should be gone despite the failure)
+        nodes =3D self.vm.qmp('query-named-block-nodes')['return']
+        nodes =3D list(map(lambda image: image['node-name'], nodes))
+
+        for expect in ['src', 'src-perm', 'dest', 'dest-perm']:
+            self.assertTrue(expect in nodes, '%s disappeared' % expect)
+        self.assertFalse('mirror-filter' in nodes,
+                         'Mirror filter node did not disappear')
+
 if __name__ =3D=3D '__main__':
     iotests.main(supported_fmts=3D['qcow2', 'qed'],
                  supported_protocols=3D['file'])
diff --git a/tests/qemu-iotests/041.out b/tests/qemu-iotests/041.out
index 2c448b4239..f496be9197 100644
--- a/tests/qemu-iotests/041.out
+++ b/tests/qemu-iotests/041.out
@@ -1,5 +1,5 @@
-........................................................................=
..................
+........................................................................=
...................
 ----------------------------------------------------------------------
-Ran 90 tests
+Ran 91 tests
=20
 OK
--=20
2.21.0


