Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC57125D06
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 09:54:23 +0100 (CET)
Received: from localhost ([::1]:37404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihrZe-0002QE-D2
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 03:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihrWk-00071t-6K
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 03:51:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihrWi-00051z-PV
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 03:51:22 -0500
Received: from relay.sw.ru ([185.231.240.75]:55364)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihrWf-0004Xn-6A; Thu, 19 Dec 2019 03:51:17 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihrWV-0004DF-La; Thu, 19 Dec 2019 11:51:07 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 5/5] iotests: 194: test also migration of dirty bitmap
Date: Thu, 19 Dec 2019 11:51:06 +0300
Message-Id: <20191219085106.22309-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219085106.22309-1-vsementsov@virtuozzo.com>
References: <20191219085106.22309-1-vsementsov@virtuozzo.com>
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 quintela@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 stefanha@redhat.com, den@openvz.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test that dirty bitmap migration works when we deal with mirror.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/194     | 14 ++++++++++----
 tests/qemu-iotests/194.out |  6 ++++++
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/194 b/tests/qemu-iotests/194
index 72e47e8833..f48ddf6051 100755
--- a/tests/qemu-iotests/194
+++ b/tests/qemu-iotests/194
@@ -42,6 +42,8 @@ with iotests.FilePath('source.img') as source_img_path, \
             .add_incoming('unix:{0}'.format(migration_sock_path))
             .launch())
 
+    source_vm.qmp_log('block-dirty-bitmap-add', node='drive0', name='bitmap0')
+
     iotests.log('Launching NBD server on destination...')
     iotests.log(dest_vm.qmp('nbd-server-start', addr={'type': 'unix', 'data': {'path': nbd_sock_path}}))
     iotests.log(dest_vm.qmp('nbd-server-add', device='drive0', writable=True))
@@ -61,12 +63,14 @@ with iotests.FilePath('source.img') as source_img_path, \
                 filters=[iotests.filter_qmp_event])
 
     iotests.log('Starting migration...')
-    source_vm.qmp('migrate-set-capabilities',
-                  capabilities=[{'capability': 'events', 'state': True}])
-    dest_vm.qmp('migrate-set-capabilities',
-                capabilities=[{'capability': 'events', 'state': True}])
+    capabilities = [{'capability': 'events', 'state': True},
+                    {'capability': 'dirty-bitmaps', 'state': True}]
+    source_vm.qmp('migrate-set-capabilities', capabilities=capabilities)
+    dest_vm.qmp('migrate-set-capabilities', capabilities=capabilities)
     iotests.log(source_vm.qmp('migrate', uri='unix:{0}'.format(migration_sock_path)))
 
+    source_vm.qmp_log('migrate-start-postcopy')
+
     while True:
         event1 = source_vm.event_wait('MIGRATION')
         iotests.log(event1, filters=[iotests.filter_qmp_event])
@@ -82,3 +86,5 @@ with iotests.FilePath('source.img') as source_img_path, \
             iotests.log('Stopping the NBD server on destination...')
             iotests.log(dest_vm.qmp('nbd-server-stop'))
             break
+
+    iotests.log(source_vm.qmp('query-block')['return'][0]['dirty-bitmaps'])
diff --git a/tests/qemu-iotests/194.out b/tests/qemu-iotests/194.out
index 71857853fb..dd60dcc14f 100644
--- a/tests/qemu-iotests/194.out
+++ b/tests/qemu-iotests/194.out
@@ -1,4 +1,6 @@
 Launching VMs...
+{"execute": "block-dirty-bitmap-add", "arguments": {"name": "bitmap0", "node": "drive0"}}
+{"return": {}}
 Launching NBD server on destination...
 {"return": {}}
 {"return": {}}
@@ -8,11 +10,15 @@ Waiting for `drive-mirror` to complete...
 {"data": {"device": "mirror-job0", "len": 1073741824, "offset": 1073741824, "speed": 0, "type": "mirror"}, "event": "BLOCK_JOB_READY", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 Starting migration...
 {"return": {}}
+{"execute": "migrate-start-postcopy", "arguments": {}}
+{"return": {}}
 {"data": {"status": "setup"}, "event": "MIGRATION", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"status": "active"}, "event": "MIGRATION", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"status": "postcopy-active"}, "event": "MIGRATION", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"status": "completed"}, "event": "MIGRATION", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 Gracefully ending the `drive-mirror` job on source...
 {"return": {}}
 {"data": {"device": "mirror-job0", "len": 1073741824, "offset": 1073741824, "speed": 0, "type": "mirror"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 Stopping the NBD server on destination...
 {"return": {}}
+[{"busy": false, "count": 0, "granularity": 65536, "name": "bitmap0", "persistent": false, "recording": true, "status": "active"}]
-- 
2.21.0


