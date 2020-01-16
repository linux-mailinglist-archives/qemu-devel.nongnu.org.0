Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077E013DF55
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 16:56:50 +0100 (CET)
Received: from localhost ([::1]:44214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is7Vo-0007C1-Fq
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 10:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36846)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1is7UH-0005no-Ac
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:55:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1is7UF-0001bF-Rr
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:55:13 -0500
Received: from relay.sw.ru ([185.231.240.75]:58016)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1is7UA-0001VK-Vf; Thu, 16 Jan 2020 10:55:07 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1is7Tz-00021t-W2; Thu, 16 Jan 2020 18:54:56 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] block/backup-top: fix failure path
Date: Thu, 16 Jan 2020 18:54:51 +0300
Message-Id: <20200116155452.30972-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200116155452.30972-1-vsementsov@virtuozzo.com>
References: <20200116155452.30972-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, qemu-stable@nongnu.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can't access top after call bdrv_backup_top_drop, as it is already
freed at this time.

Also, no needs to unref target child by hand, it will be unrefed on
bdrv_close() automatically.

So, just do bdrv_backup_top_drop if append succeed and one bdrv_unref
otherwise.

Note, that in !appended case bdrv_unref(top) moved into drained section
on source. It doesn't really matter, but just for code simplicity.

Fixes: 7df7868b96404
Cc: qemu-stable@nongnu.org # v4.2.0
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup-top.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/block/backup-top.c b/block/backup-top.c
index 818d3f26b4..19f18d541b 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -190,6 +190,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
     BlockDriverState *top = bdrv_new_open_driver(&bdrv_backup_top_filter,
                                                  filter_node_name,
                                                  BDRV_O_RDWR, errp);
+    bool appended = false;
 
     if (!top) {
         return NULL;
@@ -212,8 +213,9 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
     bdrv_append(top, source, &local_err);
     if (local_err) {
         error_prepend(&local_err, "Cannot append backup-top filter: ");
-        goto append_failed;
+        goto fail;
     }
+    appended = true;
 
     /*
      * bdrv_append() finished successfully, now we can require permissions
@@ -224,14 +226,14 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
     if (local_err) {
         error_prepend(&local_err,
                       "Cannot set permissions for backup-top filter: ");
-        goto failed_after_append;
+        goto fail;
     }
 
     state->bcs = block_copy_state_new(top->backing, state->target,
                                       cluster_size, write_flags, &local_err);
     if (local_err) {
         error_prepend(&local_err, "Cannot create block-copy-state: ");
-        goto failed_after_append;
+        goto fail;
     }
     *bcs = state->bcs;
 
@@ -239,14 +241,15 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
     return top;
 
-failed_after_append:
-    state->active = false;
-    bdrv_backup_top_drop(top);
+fail:
+    if (appended) {
+        state->active = false;
+        bdrv_backup_top_drop(top);
+    } else {
+        bdrv_unref(top);
+    }
 
-append_failed:
     bdrv_drained_end(source);
-    bdrv_unref_child(top, state->target);
-    bdrv_unref(top);
     error_propagate(errp, local_err);
 
     return NULL;
-- 
2.21.0


