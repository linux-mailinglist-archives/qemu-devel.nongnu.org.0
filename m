Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ACF126956
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 19:37:23 +0100 (CET)
Received: from localhost ([::1]:46534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii0fq-0001Tp-4B
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 13:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52722)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ii0ew-0000yC-R8
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:36:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ii0eu-00030k-6B
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:36:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48052
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ii0et-0002qz-Dd
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576780582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WXGSERlg1yOfWm4hpoI90IHm5kdRe/CrPvr4eiiuwlA=;
 b=eCGFlEncoRfa65bouQDm2FciEp0SNWFvY3Pc0WZxXNxGpTe0t8kTPJDJaHiHSZDSHucTqY
 J6uMZc84tFRH351o+34GlyWnZ6G5ipRs1yh7F9RSeNQXWr0ayZoNqjuYqVmIg5VFsfS/Bq
 uiSRme3A4dICFOo/YhinxlvIutRPU2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-tLEdXmVNObOAcF1IdsjCfQ-1; Thu, 19 Dec 2019 13:36:21 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FFAF8024E8;
 Thu, 19 Dec 2019 18:36:20 +0000 (UTC)
Received: from localhost (ovpn-205-138.brq.redhat.com [10.40.205.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9821626E77;
 Thu, 19 Dec 2019 18:36:19 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2] iotests.py: Let wait_migration wait even more
Date: Thu, 19 Dec 2019 19:36:17 +0100
Message-Id: <20191219183617.213637-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: tLEdXmVNObOAcF1IdsjCfQ-1
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "migration completed" event may be sent (on the source, to be
specific) before the migration is actually completed, so the VM runstate
will still be "finish-migrate" instead of "postmigrate".  So ask the
users of VM.wait_migration() to specify the final runstate they desire
and then poll the VM until it has reached that state.  (This should be
over very quickly, so busy polling is fine.)

Without this patch, I see intermittent failures in the new iotest 280
under high system load.  I have not yet seen such failures with other
iotests that use VM.wait_migration() and query-status afterwards, but
maybe they just occur even more rarely, or it is because they also wait
on the destination VM to be running.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
v2:
- Stop breaking 234 and 262 [Kevin]
---
 tests/qemu-iotests/234        | 8 ++++----
 tests/qemu-iotests/262        | 4 ++--
 tests/qemu-iotests/280        | 2 +-
 tests/qemu-iotests/iotests.py | 6 +++++-
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/234 b/tests/qemu-iotests/234
index 34c818c485..59a7f949ec 100755
--- a/tests/qemu-iotests/234
+++ b/tests/qemu-iotests/234
@@ -69,9 +69,9 @@ with iotests.FilePath('img') as img_path, \
     iotests.log(vm_a.qmp('migrate', uri=3D'exec:cat >%s' % (fifo_a)))
     with iotests.Timeout(3, 'Migration does not complete'):
         # Wait for the source first (which includes setup=3Dsetup)
-        vm_a.wait_migration()
+        vm_a.wait_migration('postmigrate')
         # Wait for the destination second (which does not)
-        vm_b.wait_migration()
+        vm_b.wait_migration('running')
=20
     iotests.log(vm_a.qmp('query-migrate')['return']['status'])
     iotests.log(vm_b.qmp('query-migrate')['return']['status'])
@@ -98,9 +98,9 @@ with iotests.FilePath('img') as img_path, \
     iotests.log(vm_b.qmp('migrate', uri=3D'exec:cat >%s' % (fifo_b)))
     with iotests.Timeout(3, 'Migration does not complete'):
         # Wait for the source first (which includes setup=3Dsetup)
-        vm_b.wait_migration()
+        vm_b.wait_migration('postmigrate')
         # Wait for the destination second (which does not)
-        vm_a.wait_migration()
+        vm_a.wait_migration('running')
=20
     iotests.log(vm_a.qmp('query-migrate')['return']['status'])
     iotests.log(vm_b.qmp('query-migrate')['return']['status'])
diff --git a/tests/qemu-iotests/262 b/tests/qemu-iotests/262
index 0963daa806..bbcb5260a6 100755
--- a/tests/qemu-iotests/262
+++ b/tests/qemu-iotests/262
@@ -71,9 +71,9 @@ with iotests.FilePath('img') as img_path, \
     iotests.log(vm_a.qmp('migrate', uri=3D'exec:cat >%s' % (fifo)))
     with iotests.Timeout(3, 'Migration does not complete'):
         # Wait for the source first (which includes setup=3Dsetup)
-        vm_a.wait_migration()
+        vm_a.wait_migration('postmigrate')
         # Wait for the destination second (which does not)
-        vm_b.wait_migration()
+        vm_b.wait_migration('running')
=20
     iotests.log(vm_a.qmp('query-migrate')['return']['status'])
     iotests.log(vm_b.qmp('query-migrate')['return']['status'])
diff --git a/tests/qemu-iotests/280 b/tests/qemu-iotests/280
index 0b1fa8e1d8..85e9114c5e 100755
--- a/tests/qemu-iotests/280
+++ b/tests/qemu-iotests/280
@@ -45,7 +45,7 @@ with iotests.FilePath('base') as base_path , \
     vm.qmp_log('migrate', uri=3D'exec:cat > /dev/null')
=20
     with iotests.Timeout(3, 'Migration does not complete'):
-        vm.wait_migration()
+        vm.wait_migration('postmigrate')
=20
     iotests.log('\nVM is now stopped:')
     iotests.log(vm.qmp('query-migrate')['return']['status'])
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 13fd8b5cd2..0b62c42851 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -668,12 +668,16 @@ class VM(qtest.QEMUQtestMachine):
             }
         ]))
=20
-    def wait_migration(self):
+    def wait_migration(self, expect_runstate):
         while True:
             event =3D self.event_wait('MIGRATION')
             log(event, filters=3D[filter_qmp_event])
             if event['data']['status'] =3D=3D 'completed':
                 break
+        # The event may occur in finish-migrate, so wait for the expected
+        # post-migration runstate
+        while self.qmp('query-status')['return']['status'] !=3D expect_run=
state:
+            pass
=20
     def node_info(self, node_name):
         nodes =3D self.qmp('query-named-block-nodes')
--=20
2.23.0


