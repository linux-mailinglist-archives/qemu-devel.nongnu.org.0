Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425BE1624E1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 11:47:57 +0100 (CET)
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j40Q0-0008Ro-AY
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 05:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52439)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j40EQ-0002ex-DN
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j40EP-0007hf-AX
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50326
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j40EP-0007hW-6n
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582022156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NOwyEZkXMhtI9AeACtC6cAXN0eIjbatiCTsVadLLWwE=;
 b=PZRP2V4y5DNjdLT4KPVLqebLBpX02YtPyIp3gLicVUYEyobfmkAGNk7uYuNmNapmqW21wn
 VMpYHwmTyc+p0UlzhHQoCyGAD33SXQYvI60Cf9LDO7LPK5Hn2QXylQpho3xT1y+/gIVCkf
 LaU+XPPhorSwmdjTj00xTBMZyK7m7QE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-g5nOf7IUNcWMmg6FSsPhrw-1; Tue, 18 Feb 2020 05:35:54 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9E59801E70;
 Tue, 18 Feb 2020 10:35:53 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 630ED19481;
 Tue, 18 Feb 2020 10:35:53 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 19/19] iotests: Check that @replaces can replace filters
Date: Tue, 18 Feb 2020 11:34:54 +0100
Message-Id: <20200218103454.296704-20-mreitz@redhat.com>
In-Reply-To: <20200218103454.296704-1-mreitz@redhat.com>
References: <20200218103454.296704-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: g5nOf7IUNcWMmg6FSsPhrw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/041     | 46 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/041.out |  4 ++--
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 53c8671969..532a3827e7 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -1190,6 +1190,52 @@ class TestOrphanedSource(iotests.QMPTestCase):
         self.assertFalse('mirror-filter' in nodes,
                          'Mirror filter node did not disappear')
=20
+# Test cases for @replaces that do not necessarily involve Quorum
+class TestReplaces(iotests.QMPTestCase):
+    # Each of these test cases needs their own block graph, so do not
+    # create any nodes here
+    def setUp(self):
+        self.vm =3D iotests.VM()
+        self.vm.launch()
+
+    def tearDown(self):
+        self.vm.shutdown()
+        for img in (test_img, target_img):
+            try:
+                os.remove(img)
+            except OSError:
+                pass
+
+    @iotests.skip_if_unsupported(['copy-on-read'])
+    def test_replace_filter(self):
+        """
+        Check that we can replace filter nodes.
+        """
+        result =3D self.vm.qmp('blockdev-add', **{
+                                 'driver': 'copy-on-read',
+                                 'node-name': 'filter0',
+                                 'file': {
+                                     'driver': 'copy-on-read',
+                                     'node-name': 'filter1',
+                                     'file': {
+                                         'driver': 'null-co'
+                                     }
+                                 }
+                             })
+        self.assert_qmp(result, 'return', {})
+
+        result =3D self.vm.qmp('blockdev-add',
+                             node_name=3D'target', driver=3D'null-co')
+        self.assert_qmp(result, 'return', {})
+
+        result =3D self.vm.qmp('blockdev-mirror', job_id=3D'mirror', devic=
e=3D'filter0',
+                             target=3D'target', sync=3D'full', replaces=3D=
'filter1')
+        self.assert_qmp(result, 'return', {})
+
+        self.complete_and_wait('mirror')
+
+        self.vm.assert_block_path('filter0', '/file', 'target')
+
 if __name__ =3D=3D '__main__':
     iotests.main(supported_fmts=3D['qcow2', 'qed'],
                  supported_protocols=3D['file'],
diff --git a/tests/qemu-iotests/041.out b/tests/qemu-iotests/041.out
index ffc779b4d1..877b76fd31 100644
--- a/tests/qemu-iotests/041.out
+++ b/tests/qemu-iotests/041.out
@@ -1,5 +1,5 @@
-..........................................................................=
...................
+..........................................................................=
....................
 ----------------------------------------------------------------------
-Ran 93 tests
+Ran 94 tests
=20
 OK
--=20
2.24.1


