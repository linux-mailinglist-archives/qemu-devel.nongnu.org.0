Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D537DA3BEA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Aug 2019 18:26:15 +0200 (CEST)
Received: from localhost ([::1]:36066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3jj4-0001Ov-NO
	for lists+qemu-devel@lfdr.de; Fri, 30 Aug 2019 12:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48603)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i3jWB-00006e-6g
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 12:13:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i3jW5-0004U8-45
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 12:12:53 -0400
Received: from relay.sw.ru ([185.231.240.75]:60580)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i3jVs-0004Fa-Q5; Fri, 30 Aug 2019 12:12:38 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i3jVm-0001X0-H2; Fri, 30 Aug 2019 19:12:30 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Fri, 30 Aug 2019 19:12:23 +0300
Message-Id: <20190830161228.54238-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190830161228.54238-1-vsementsov@virtuozzo.com>
References: <20190830161228.54238-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v10 09/14] iotests: 257: drop unused
 Drive.device field
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
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After previous commit Drive.device is actually unused. Drop it together
with .name property.  While being here reuse .node in qmp commands
instead of writing 'drive0' twice.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/257 | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
index 6218ff20cf..8185871285 100755
--- a/tests/qemu-iotests/257
+++ b/tests/qemu-iotests/257
@@ -148,11 +148,6 @@ class Drive:
         self.fmt = None
         self.size = None
         self.node = None
-        self.device = None
-
-    @property
-    def name(self):
-        return self.node or self.device
 
     def img_create(self, fmt, size):
         self.fmt = fmt
@@ -201,7 +196,7 @@ def blockdev_backup(vm, device, target, sync, **kwargs):
 def blockdev_backup_mktarget(drive, target_id, filepath, sync, **kwargs):
     target_drive = Drive(filepath, vm=drive.vm)
     target_drive.create_target(target_id, drive.fmt, drive.size)
-    blockdev_backup(drive.vm, drive.name, target_id, sync, **kwargs)
+    blockdev_backup(drive.vm, drive.node, target_id, sync, **kwargs)
 
 def reference_backup(drive, n, filepath):
     log("--- Reference Backup #{:d} ---\n".format(n))
@@ -229,7 +224,7 @@ def perform_writes(drive, n):
             pattern.offset,
             pattern.size)
         log(cmd)
-        log(drive.vm.hmp_qemu_io(drive.name, cmd))
+        log(drive.vm.hmp_qemu_io(drive.node, cmd))
     bitmaps = drive.vm.query_bitmaps()
     log({'bitmaps': bitmaps}, indent=2)
     log('')
@@ -324,18 +319,17 @@ def test_bitmap_sync(bsync_mode, msync_mode='bitmap', failure=None):
                 }]
             }
 
+        drive0.node = 'drive0'
         vm.qmp_log('blockdev-add',
                    filters=[iotests.filter_qmp_testfiles],
-                   node_name="drive0",
+                   node_name=drive0.node,
                    driver=drive0.fmt,
                    file=file_config)
-        drive0.node = 'drive0'
-        drive0.device = 'device0'
         # Use share-rw to allow writes directly to the node;
         # The anonymous block-backend for this configuration prevents us
         # from using HMP's qemu-io commands to address the device.
-        vm.qmp_log("device_add", id=drive0.device,
-                   drive=drive0.name, driver="scsi-hd",
+        vm.qmp_log("device_add", id='device0',
+                   drive=drive0.node, driver="scsi-hd",
                    share_rw=True)
         log('')
 
@@ -343,7 +337,7 @@ def test_bitmap_sync(bsync_mode, msync_mode='bitmap', failure=None):
         perform_writes(drive0, 0)
         reference_backup(drive0, 0, fbackup0)
         log('--- Add Bitmap ---\n')
-        vm.qmp_log("block-dirty-bitmap-add", node=drive0.name,
+        vm.qmp_log("block-dirty-bitmap-add", node=drive0.node,
                    name="bitmap0", granularity=GRANULARITY)
         log('')
         ebitmap = EmulatedBitmap()
@@ -358,7 +352,7 @@ def test_bitmap_sync(bsync_mode, msync_mode='bitmap', failure=None):
         # 1 - Test Backup (w/ Optional induced failure)
         if failure == 'intermediate':
             # Activate blkdebug induced failure for second-to-next read
-            log(vm.hmp_qemu_io(drive0.name, 'flush'))
+            log(vm.hmp_qemu_io(drive0.node, 'flush'))
             log('')
         job = backup(drive0, 1, bsync1, msync_mode,
                      bitmap="bitmap0", bitmap_mode=bsync_mode)
@@ -426,7 +420,7 @@ def test_bitmap_sync(bsync_mode, msync_mode='bitmap', failure=None):
 
         log('--- Cleanup ---\n')
         vm.qmp_log("block-dirty-bitmap-remove",
-                   node=drive0.name, name="bitmap0")
+                   node=drive0.node, name="bitmap0")
         bitmaps = vm.query_bitmaps()
         log({'bitmaps': bitmaps}, indent=2)
         vm.shutdown()
@@ -467,22 +461,21 @@ def test_backup_api():
             'filename': drive0.path
         }
 
+        drive0.node = 'drive0'
         vm.qmp_log('blockdev-add',
                    filters=[iotests.filter_qmp_testfiles],
-                   node_name="drive0",
+                   node_name=drive0.node,
                    driver=drive0.fmt,
                    file=file_config)
-        drive0.node = 'drive0'
-        drive0.device = 'device0'
-        vm.qmp_log("device_add", id=drive0.device,
-                   drive=drive0.name, driver="scsi-hd")
+        vm.qmp_log("device_add", id='device0',
+                   drive=drive0.node, driver="scsi-hd")
         log('')
 
         target0 = Drive(backup_path, vm=vm)
         target0.create_target("backup_target", drive0.fmt, drive0.size)
         log('')
 
-        vm.qmp_log("block-dirty-bitmap-add", node=drive0.name,
+        vm.qmp_log("block-dirty-bitmap-add", node=drive0.node,
                    name="bitmap0", granularity=GRANULARITY)
         log('')
 
@@ -521,7 +514,7 @@ def test_backup_api():
             log("-- Sync mode {:s} tests --\n".format(sync_mode))
             for bitmap in (None, 'bitmap404', 'bitmap0'):
                 for policy in error_cases[sync_mode][bitmap]:
-                    blockdev_backup(drive0.vm, drive0.name, "backup_target",
+                    blockdev_backup(drive0.vm, drive0.node, "backup_target",
                                     sync_mode, job_id='api_job',
                                     bitmap=bitmap, bitmap_mode=policy)
                     log('')
-- 
2.18.0


