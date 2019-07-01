Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9082FE0D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 16:41:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWMFG-0007mW-Vy
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 10:41:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hWMDe-000758-SE
	for qemu-devel@nongnu.org; Thu, 30 May 2019 10:39:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hWMDb-0005Rr-Jr
	for qemu-devel@nongnu.org; Thu, 30 May 2019 10:39:49 -0400
Received: from relay.sw.ru ([185.231.240.75]:33154)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hWMDZ-0005Q3-Qr; Thu, 30 May 2019 10:39:46 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hWMDW-0007WS-14; Thu, 30 May 2019 17:39:42 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu, 30 May 2019 17:39:41 +0300
Message-Id: <20190530143941.241963-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] qapi: add dirty-bitmaps to
 query-named-block-nodes result
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
	mreitz@redhat.com, nshirokovskiy@virtuozzo.com, den@openvz.org,
	jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's add a possibility to query dirty-bitmaps not only on root nodes.
It is useful when dealing both with snapshots and incremental backups.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json | 5 ++++-
 block/qapi.c         | 5 +++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 1defcde048..64ae1ab812 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -360,6 +360,9 @@
 # @write_threshold: configured write threshold for the device.
 #                   0 if disabled. (Since 2.3)
 #
+# @dirty-bitmaps: dirty bitmaps information (only present if node
+#                 has one or more dirty bitmaps) (Since 4.1)
+#
 # Since: 0.14.0
 #
 ##
@@ -378,7 +381,7 @@
             '*bps_wr_max_length': 'int', '*iops_max_length': 'int',
             '*iops_rd_max_length': 'int', '*iops_wr_max_length': 'int',
             '*iops_size': 'int', '*group': 'str', 'cache': 'BlockdevCacheInfo',
-            'write_threshold': 'int' } }
+            'write_threshold': 'int', '*dirty-bitmaps': ['BlockDirtyInfo'] } }
 
 ##
 # @BlockDeviceIoStatus:
diff --git a/block/qapi.c b/block/qapi.c
index 0c13c86f4e..7eefdecb29 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -78,6 +78,11 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
         info->backing_file = g_strdup(bs->backing_file);
     }
 
+    if (!QLIST_EMPTY(&bs->dirty_bitmaps)) {
+        info->has_dirty_bitmaps = true;
+        info->dirty_bitmaps = bdrv_query_dirty_bitmaps(bs);
+    }
+
     info->detect_zeroes = bs->detect_zeroes;
 
     if (blk && blk_get_public(blk)->throttle_group_member.throttle_state) {
-- 
2.18.0


