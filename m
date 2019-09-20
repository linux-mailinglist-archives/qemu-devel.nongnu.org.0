Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA09B9354
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 16:44:03 +0200 (CEST)
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBK8f-0007V4-Bk
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 10:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33007)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iBJmr-0004x1-KO
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 10:21:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iBJmp-00012m-BI
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 10:21:29 -0400
Received: from relay.sw.ru ([185.231.240.75]:43812)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iBJmk-0000gF-Ed; Fri, 20 Sep 2019 10:21:22 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iBJmN-0006b5-U2; Fri, 20 Sep 2019 17:21:00 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v13 11/15] iotests: 257: drop device_add
Date: Fri, 20 Sep 2019 17:20:52 +0300
Message-Id: <20190920142056.12778-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190920142056.12778-1-vsementsov@virtuozzo.com>
References: <20190920142056.12778-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
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
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SCSI devices are unused in test, drop them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/257     |  8 -------
 tests/qemu-iotests/257.out | 44 --------------------------------------
 2 files changed, 52 deletions(-)

diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
index 5d77202157..de8b45f094 100755
--- a/tests/qemu-iotests/257
+++ b/tests/qemu-iotests/257
@@ -325,12 +325,6 @@ def test_bitmap_sync(bsync_mode, msync_mode='bitmap', failure=None):
                    node_name=drive0.node,
                    driver=drive0.fmt,
                    file=file_config)
-        # Use share-rw to allow writes directly to the node;
-        # The anonymous block-backend for this configuration prevents us
-        # from using HMP's qemu-io commands to address the device.
-        vm.qmp_log("device_add", id='device0',
-                   drive=drive0.node, driver="scsi-hd",
-                   share_rw=True)
         log('')
 
         # 0 - Writes and Reference Backup
@@ -467,8 +461,6 @@ def test_backup_api():
                    node_name=drive0.node,
                    driver=drive0.fmt,
                    file=file_config)
-        vm.qmp_log("device_add", id='device0',
-                   drive=drive0.node, driver="scsi-hd")
         log('')
 
         target0 = Drive(backup_path, vm=vm)
diff --git a/tests/qemu-iotests/257.out b/tests/qemu-iotests/257.out
index c9b4b68232..ec7e25877b 100644
--- a/tests/qemu-iotests/257.out
+++ b/tests/qemu-iotests/257.out
@@ -5,8 +5,6 @@
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -267,8 +265,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "blkdebug", "image": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "inject-error": [{"errno": 5, "event": "read_aio", "immediately": false, "once": true, "state": 3}], "set-state": [{"event": "flush_to_disk", "new-state": 2, "state": 1}, {"event": "read_aio", "new-state": 3, "state": 2}]}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -480,8 +476,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -742,8 +736,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -1004,8 +996,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "blkdebug", "image": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "inject-error": [{"errno": 5, "event": "read_aio", "immediately": false, "once": true, "state": 3}], "set-state": [{"event": "flush_to_disk", "new-state": 2, "state": 1}, {"event": "read_aio", "new-state": 3, "state": 2}]}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -1217,8 +1207,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -1479,8 +1467,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -1741,8 +1727,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "blkdebug", "image": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "inject-error": [{"errno": 5, "event": "read_aio", "immediately": false, "once": true, "state": 3}], "set-state": [{"event": "flush_to_disk", "new-state": 2, "state": 1}, {"event": "read_aio", "new-state": 3, "state": 2}]}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -1954,8 +1938,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -2216,8 +2198,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -2478,8 +2458,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "blkdebug", "image": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "inject-error": [{"errno": 5, "event": "read_aio", "immediately": false, "once": true, "state": 3}], "set-state": [{"event": "flush_to_disk", "new-state": 2, "state": 1}, {"event": "read_aio", "new-state": 3, "state": 2}]}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -2691,8 +2669,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -2953,8 +2929,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -3215,8 +3189,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "blkdebug", "image": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "inject-error": [{"errno": 5, "event": "read_aio", "immediately": false, "once": true, "state": 3}], "set-state": [{"event": "flush_to_disk", "new-state": 2, "state": 1}, {"event": "read_aio", "new-state": 3, "state": 2}]}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -3428,8 +3400,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -3690,8 +3660,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -3952,8 +3920,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "blkdebug", "image": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "inject-error": [{"errno": 5, "event": "read_aio", "immediately": false, "once": true, "state": 3}], "set-state": [{"event": "flush_to_disk", "new-state": 2, "state": 1}, {"event": "read_aio", "new-state": 3, "state": 2}]}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -4165,8 +4131,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -4427,8 +4391,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -4689,8 +4651,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "blkdebug", "image": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "inject-error": [{"errno": 5, "event": "read_aio", "immediately": false, "once": true, "state": 3}], "set-state": [{"event": "flush_to_disk", "new-state": 2, "state": 1}, {"event": "read_aio", "new-state": 3, "state": 2}]}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -4902,8 +4862,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0", "share-rw": true}}
-{"return": {}}
 
 --- Write #0 ---
 
@@ -5164,8 +5122,6 @@ qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" ==> Identical, OK!
 
 {"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"driver": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
 {"return": {}}
-{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "scsi-hd", "id": "device0"}}
-{"return": {}}
 
 {}
 {"execute": "job-dismiss", "arguments": {"id": "bdc-file-job"}}
-- 
2.21.0


