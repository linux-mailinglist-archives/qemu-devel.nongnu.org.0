Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC87213141C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 15:53:46 +0100 (CET)
Received: from localhost ([::1]:52932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioTlJ-0001wD-6t
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 09:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ioTab-0005td-Uv
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ioTaa-0008QP-O6
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34670
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ioTaa-0008Pv-Ko
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578321760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QSBQdOnL72EHKVqrlm6ZtVcGCAI/LeO2wRMWAF3DQec=;
 b=WDsU6oZoYH1DeN2301/fbrBT362XvPKnv3dMQcmHCcGtXVDvkaf8x+fq5rLejL1k/EET93
 de/lvkna/KXQyS8ke4bRuQtCKAXuex3TF4/Nj4oSccB6fDXUah/eWr9XbHFVWW8Kn87dSG
 YKlPNYGIHA+mVB2X1cNDZas3U6zWIMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-ydecRgtTPmirzHBA_0eAGw-1; Mon, 06 Jan 2020 09:42:36 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90BEF107AD3E;
 Mon,  6 Jan 2020 14:42:35 +0000 (UTC)
Received: from localhost (ovpn-117-91.ams2.redhat.com [10.36.117.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 179B510840F1;
 Mon,  6 Jan 2020 14:42:32 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/34] iotests: Add test for failing mirror complete
Date: Mon,  6 Jan 2020 15:41:37 +0100
Message-Id: <20200106144206.698920-6-mreitz@redhat.com>
In-Reply-To: <20200106144206.698920-1-mreitz@redhat.com>
References: <20200106144206.698920-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: ydecRgtTPmirzHBA_0eAGw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20191108123455.39445-6-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/041     | 44 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/041.out |  4 ++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 8568426311..d7be30b62b 100755
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
+                               completion_error=3D'Operation not permitted=
')
+
+        # Assert that all of our nodes are still there (except for the
+        # mirror filter, which should be gone despite the failure)
+        nodes =3D self.vm.qmp('query-named-block-nodes')['return']
+        nodes =3D [node['node-name'] for node in nodes]
+
+        for expect in ('src', 'src-perm', 'dest', 'dest-perm'):
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
-..........................................................................=
................
+..........................................................................=
.................
 ----------------------------------------------------------------------
-Ran 90 tests
+Ran 91 tests
=20
 OK
--=20
2.24.1


