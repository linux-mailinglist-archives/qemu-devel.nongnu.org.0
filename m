Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCFB16157B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 16:04:49 +0100 (CET)
Received: from localhost ([::1]:46722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3hx2-0005wP-IF
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 10:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j3hvL-000442-Md
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 10:03:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j3hvK-0007Nh-9n
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 10:03:03 -0500
Received: from relay.sw.ru ([185.231.240.75]:47420)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1j3hvK-0007LF-0J; Mon, 17 Feb 2020 10:03:02 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1j3hvH-0007Zt-Nt; Mon, 17 Feb 2020 18:02:59 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/22] qemu-iotests/199: check persistent bitmaps
Date: Mon, 17 Feb 2020 18:02:44 +0300
Message-Id: <20200217150246.29180-21-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200217150246.29180-1-vsementsov@virtuozzo.com>
References: <20200217150246.29180-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 Max Reitz <mreitz@redhat.com>, andrey.shinkevich@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check that persistent bitmaps are not stored on source and that bitmaps
are persistent on destination.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/199 | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/199 b/tests/qemu-iotests/199
index 969620b103..8baa078151 100755
--- a/tests/qemu-iotests/199
+++ b/tests/qemu-iotests/199
@@ -117,7 +117,8 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
         for i in range(nb_bitmaps):
             result = self.vm_a.qmp('block-dirty-bitmap-add', node='drive0',
                                    name='bitmap{}'.format(i),
-                                   granularity=granularity)
+                                   granularity=granularity,
+                                   persistent=True)
             self.assert_qmp(result, 'return', {})
 
         result = self.vm_a.qmp('x-debug-block-dirty-bitmap-sha256',
@@ -193,6 +194,19 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
             print('downtime:', downtime)
             print('postcopy_time:', postcopy_time)
 
+        # check that there are no bitmaps stored on source
+        self.vm_a_events += self.vm_a.get_qmp_events()
+        self.vm_a.shutdown()
+        self.vm_a.launch()
+        check_bitmaps(self.vm_a, 0)
+
+        # check that bitmaps are migrated and persistence works
+        check_bitmaps(self.vm_b, nb_bitmaps)
+        self.vm_b.shutdown()
+        # recreate vm_b, so there is no incoming option, which prevents
+        # loading bitmaps from disk
+        self.vm_b = iotests.VM(path_suffix='b').add_drive(disk_b)
+        self.vm_b.launch()
         check_bitmaps(self.vm_b, nb_bitmaps)
 
         # Check content of migrated bitmaps. Still, don't waste time checking
-- 
2.21.0


