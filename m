Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F6ECBFDF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 17:58:24 +0200 (CEST)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGPyI-00006J-RP
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 11:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41154)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iGPnj-00038G-GV
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 11:47:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iGPnh-0005gf-U9
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 11:47:27 -0400
Received: from relay.sw.ru ([185.231.240.75]:36348)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iGPnR-0005EY-J5; Fri, 04 Oct 2019 11:47:20 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iGPnL-00019e-G6; Fri, 04 Oct 2019 18:47:03 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/5] migration/block-dirty-bitmap: fix bitmaps migration
 during mirror job
Date: Fri,  4 Oct 2019 18:47:00 +0300
Message-Id: <20191004154701.3202-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004154701.3202-1-vsementsov@virtuozzo.com>
References: <20191004154701.3202-1-vsementsov@virtuozzo.com>
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
 quintela@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Important thing for bitmap migration is to select destination block
node to obtain the migrated bitmap.

Prepatch, on source we use bdrv_get_device_or_node_name() to identify
the node, and on target we do bdrv_lookup_bs.
bdrv_get_device_or_node_name() returns blk name only for direct
children of blk. So, bitmaps of direct children of blks are migrated by
blk name and others - by node name.

Libvirt currently is unprepared to bitmap migration by node-name,
node-names are mostly auto-generated. So actually only migration by blk
name works.

Now, consider classic libvirt migrations assisted by mirror block job:
mirror block job inserts filter, so our source is not a direct child of
blk, and bitmaps are migrated by node-names. And this just don't work.

Let's fix it by allowing use blk-name even if some implicit filters are
inserted.

Note, that we possibly want to allow explicit filters skipping too, but
this is another story.

Note2: we, of course, can't skip filters and use blk name to migrate
bitmaps in filtered node by blk name for this blk if these filters have
named bitmaps which should be migrated.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1652424
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 migration/block-dirty-bitmap.c | 39 +++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 46641b7861..3105479c50 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -321,14 +321,48 @@ static int init_dirty_bitmap_migration(void)
 {
     BlockDriverState *bs;
     DirtyBitmapMigBitmapState *dbms;
+    GHashTable *handled_by_blk = g_hash_table_new(NULL, NULL);
+    BlockBackend *blk;
 
     dirty_bitmap_mig_state.bulk_completed = false;
     dirty_bitmap_mig_state.prev_bs = NULL;
     dirty_bitmap_mig_state.prev_bitmap = NULL;
     dirty_bitmap_mig_state.no_bitmaps = false;
 
+    /*
+     * Use blockdevice name for direct (or filtered) children of named block
+     * backends.
+     */
+    for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
+        const char *name = blk_name(blk);
+
+        if (!name || strcmp(name, "") == 0) {
+            continue;
+        }
+
+        bs = blk_bs(blk);
+
+        /* Skip filters without bitmaos */
+        while (bs && bs->drv && bs->drv->is_filter &&
+               !bdrv_has_named_bitmaps(bs))
+        {
+            bs = bs->backing->bs ?: bs->file->bs;
+        }
+
+        if (bs && bs->drv && !bs->drv->is_filter) {
+            if (add_bitmaps_to_list(bs, name)) {
+                goto fail;
+            }
+            g_hash_table_add(handled_by_blk, bs);
+        }
+    }
+
     for (bs = bdrv_next_all_states(NULL); bs; bs = bdrv_next_all_states(bs)) {
-        if (add_bitmaps_to_list(bs, bdrv_get_device_or_node_name(bs))) {
+        if (g_hash_table_contains(handled_by_blk, bs)) {
+            continue;
+        }
+
+        if (add_bitmaps_to_list(bs, bdrv_get_node_name(bs))) {
             goto fail;
         }
     }
@@ -342,9 +376,12 @@ static int init_dirty_bitmap_migration(void)
         dirty_bitmap_mig_state.no_bitmaps = true;
     }
 
+    g_hash_table_destroy(handled_by_blk);
+
     return 0;
 
 fail:
+    g_hash_table_destroy(handled_by_blk);
     dirty_bitmap_mig_cleanup();
 
     return -1;
-- 
2.21.0


