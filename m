Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F132E195
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 17:50:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56878 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW0q2-0005lZ-0Z
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 11:50:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hW0n8-0004V6-W0
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:47:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hW0n7-000537-Qt
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:47:02 -0400
Received: from relay.sw.ru ([185.231.240.75]:43136)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hW0n7-00051s-I0; Wed, 29 May 2019 11:47:01 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hW0n2-0004iP-2z; Wed, 29 May 2019 18:46:56 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed, 29 May 2019 18:46:49 +0300
Message-Id: <20190529154654.95870-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190529154654.95870-1-vsementsov@virtuozzo.com>
References: <20190529154654.95870-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v8 2/7] block: swap operation order in
 bdrv_append
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
	mreitz@redhat.com, stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bs_top parents may conflict with bs_new backing child permissions, so
let's do bdrv_replace_node first, it covers more possible cases.

It is needed for further implementation of backup-top filter, which
don't want to share write permission on its backing child.

Side effect is that we may set backing hd when device name is already
available, so 085 iotest output is changed.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                    | 11 ++++++++---
 tests/qemu-iotests/085.out |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index e6e9770704..57216f4115 100644
--- a/block.c
+++ b/block.c
@@ -4088,22 +4088,27 @@ void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
 {
     Error *local_err = NULL;
 
-    bdrv_set_backing_hd(bs_new, bs_top, &local_err);
+    bdrv_ref(bs_top);
+
+    bdrv_replace_node(bs_top, bs_new, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
+        error_prepend(errp, "Failed to replace node: ");
         goto out;
     }
 
-    bdrv_replace_node(bs_top, bs_new, &local_err);
+    bdrv_set_backing_hd(bs_new, bs_top, &local_err);
     if (local_err) {
+        bdrv_replace_node(bs_new, bs_top, &error_abort);
         error_propagate(errp, local_err);
-        bdrv_set_backing_hd(bs_new, NULL, &error_abort);
+        error_prepend(errp, "Failed to set backing: ");
         goto out;
     }
 
     /* bs_new is now referenced by its new parents, we don't need the
      * additional reference any more. */
 out:
+    bdrv_unref(bs_top);
     bdrv_unref(bs_new);
 }
 
diff --git a/tests/qemu-iotests/085.out b/tests/qemu-iotests/085.out
index 6edf107f55..e5a2645bf5 100644
--- a/tests/qemu-iotests/085.out
+++ b/tests/qemu-iotests/085.out
@@ -74,7 +74,7 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/
 
 === Invalid command - snapshot node used as backing hd ===
 
-{"error": {"class": "GenericError", "desc": "Node 'snap_11' is busy: node is used as backing hd of 'snap_12'"}}
+{"error": {"class": "GenericError", "desc": "Node 'snap_11' is busy: node is used as backing hd of 'virtio0'"}}
 
 === Invalid command - snapshot node has a backing image ===
 
-- 
2.18.0


