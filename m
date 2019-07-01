Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2198C3604F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 17:28:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYXpe-0005HI-Vv
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 11:28:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYXoY-0004y6-4p
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 11:26:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYXoV-0007rp-As
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 11:26:57 -0400
Received: from relay.sw.ru ([185.231.240.75]:59490)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYXoV-0007nZ-1p; Wed, 05 Jun 2019 11:26:55 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYXoR-0003Ic-8b; Wed, 05 Jun 2019 18:26:51 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed,  5 Jun 2019 18:26:50 +0300
Message-Id: <20190605152650.103483-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] iotests: fix 254 for qcow (1)
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qcow default cluster size is 4k, but default format of created overlay
image on snapshot operation is qcow2 with it's default cluster of 64k.

This leads to block-dirty-bitmap-merge fail when test run for qcow
format, as it can't merge bitmaps with different granularities.
Let's fix it by specifying strict granularity.

Reported-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/254     | 5 +++--
 tests/qemu-iotests/254.out | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/254 b/tests/qemu-iotests/254
index 33cb80a512..a8ea5818ff 100755
--- a/tests/qemu-iotests/254
+++ b/tests/qemu-iotests/254
@@ -29,7 +29,8 @@ qemu_img_create('-f', iotests.imgfmt, disk, str(size))
 vm = iotests.VM().add_drive(disk, opts='node-name=base')
 vm.launch()
 
-vm.qmp_log('block-dirty-bitmap-add', node='drive0', name='bitmap0')
+vm.qmp_log('block-dirty-bitmap-add', node='drive0', name='bitmap0',
+           granularity=65536)
 
 vm.hmp_qemu_io('drive0', 'write 0 512K')
 
@@ -38,7 +39,7 @@ vm.qmp_log('transaction', indent=2, actions=[
      'data': {'device': 'drive0', 'snapshot-file': top,
               'snapshot-node-name': 'snap'}},
     {'type': 'block-dirty-bitmap-add',
-     'data': {'node': 'snap', 'name': 'bitmap0'}},
+     'data': {'node': 'snap', 'name': 'bitmap0', 'granularity': 65536}},
     {'type': 'block-dirty-bitmap-merge',
      'data': {'node': 'snap', 'target': 'bitmap0',
               'bitmaps': [{'node': 'base', 'name': 'bitmap0'}]}}
diff --git a/tests/qemu-iotests/254.out b/tests/qemu-iotests/254.out
index d7394cf002..dc899016da 100644
--- a/tests/qemu-iotests/254.out
+++ b/tests/qemu-iotests/254.out
@@ -1,4 +1,4 @@
-{"execute": "block-dirty-bitmap-add", "arguments": {"name": "bitmap0", "node": "drive0"}}
+{"execute": "block-dirty-bitmap-add", "arguments": {"granularity": 65536, "name": "bitmap0", "node": "drive0"}}
 {"return": {}}
 {
   "execute": "transaction",
@@ -14,6 +14,7 @@
       },
       {
         "data": {
+          "granularity": 65536,
           "name": "bitmap0",
           "node": "snap"
         },
-- 
2.18.0


