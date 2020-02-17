Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA0C16159D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 16:10:34 +0100 (CET)
Received: from localhost ([::1]:46856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3i2b-000175-M7
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 10:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39308)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j3hvo-00058H-AL
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 10:03:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j3hvj-0007Zy-1X
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 10:03:32 -0500
Received: from relay.sw.ru ([185.231.240.75]:47552)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1j3hvi-0007RX-Ow; Mon, 17 Feb 2020 10:03:26 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1j3hvE-0007Zt-8n; Mon, 17 Feb 2020 18:02:56 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/22] migration/block-dirty-bitmap: keep bitmap state for
 all bitmaps
Date: Mon, 17 Feb 2020 18:02:32 +0300
Message-Id: <20200217150246.29180-9-vsementsov@virtuozzo.com>
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
Cc: Fam Zheng <fam@euphon.net>, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 quintela@redhat.com, dgilbert@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, andrey.shinkevich@virtuozzo.com,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep bitmap state for disabled bitmaps too. Keep the state until the
end of the process. It's needed for the following commit to implement
bitmap postcopy canceling.

To clean-up the new list the following logic is used:
We need two events to consider bitmap migration finished:
1. chunk with DIRTY_BITMAP_MIG_FLAG_COMPLETE flag should be received
2. dirty_bitmap_mig_before_vm_start should be called
These two events may come in any order, so we understand which one is
last, and on the last of them we remove bitmap migration state from the
list.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 migration/block-dirty-bitmap.c | 64 +++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 9cc750d93b..1329db8d7d 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -132,6 +132,7 @@ typedef struct LoadBitmapState {
     BlockDriverState *bs;
     BdrvDirtyBitmap *bitmap;
     bool migrated;
+    bool enabled;
 } LoadBitmapState;
 
 /* State of the dirty bitmap migration (DBM) during load process */
@@ -142,8 +143,10 @@ typedef struct DBMLoadState {
     BlockDriverState *bs;
     BdrvDirtyBitmap *bitmap;
 
-    GSList *enabled_bitmaps;
-    QemuMutex lock; /* protect enabled_bitmaps */
+    bool before_vm_start_handled; /* set in dirty_bitmap_mig_before_vm_start */
+
+    GSList *bitmaps;
+    QemuMutex lock; /* protect bitmaps */
 } DBMLoadState;
 
 typedef struct DBMState {
@@ -458,6 +461,7 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
     Error *local_err = NULL;
     uint32_t granularity = qemu_get_be32(f);
     uint8_t flags = qemu_get_byte(f);
+    LoadBitmapState *b;
 
     if (s->bitmap) {
         error_report("Bitmap with the same name ('%s') already exists on "
@@ -484,45 +488,59 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
 
     bdrv_disable_dirty_bitmap(s->bitmap);
     if (flags & DIRTY_BITMAP_MIG_START_FLAG_ENABLED) {
-        LoadBitmapState *b;
-
         bdrv_dirty_bitmap_create_successor(s->bitmap, &local_err);
         if (local_err) {
             error_report_err(local_err);
             return -EINVAL;
         }
-
-        b = g_new(LoadBitmapState, 1);
-        b->bs = s->bs;
-        b->bitmap = s->bitmap;
-        b->migrated = false;
-        s->enabled_bitmaps = g_slist_prepend(s->enabled_bitmaps, b);
     }
 
+    b = g_new(LoadBitmapState, 1);
+    b->bs = s->bs;
+    b->bitmap = s->bitmap;
+    b->migrated = false;
+    b->enabled = flags & DIRTY_BITMAP_MIG_START_FLAG_ENABLED,
+
+    s->bitmaps = g_slist_prepend(s->bitmaps, b);
+
     return 0;
 }
 
-void dirty_bitmap_mig_before_vm_start(void)
+/*
+ * before_vm_start_handle_item
+ *
+ * g_slist_foreach helper
+ *
+ * item is LoadBitmapState*
+ * opaque is DBMLoadState*
+ */
+static void before_vm_start_handle_item(void *item, void *opaque)
 {
-    DBMLoadState *s = &dbm_state.load;
-    GSList *item;
-
-    qemu_mutex_lock(&s->lock);
-
-    for (item = s->enabled_bitmaps; item; item = g_slist_next(item)) {
-        LoadBitmapState *b = item->data;
+    DBMLoadState *s = opaque;
+    LoadBitmapState *b = item;
 
+    if (b->enabled) {
         if (b->migrated) {
             bdrv_enable_dirty_bitmap(b->bitmap);
         } else {
             bdrv_dirty_bitmap_enable_successor(b->bitmap);
         }
+    }
 
+    if (b->migrated) {
+        s->bitmaps = g_slist_remove(s->bitmaps, b);
         g_free(b);
     }
+}
 
-    g_slist_free(s->enabled_bitmaps);
-    s->enabled_bitmaps = NULL;
+void dirty_bitmap_mig_before_vm_start(void)
+{
+    DBMLoadState *s = &dbm_state.load;
+    qemu_mutex_lock(&s->lock);
+
+    assert(!s->before_vm_start_handled);
+    g_slist_foreach(s->bitmaps, before_vm_start_handle_item, s);
+    s->before_vm_start_handled = true;
 
     qemu_mutex_unlock(&s->lock);
 }
@@ -539,11 +557,15 @@ static void dirty_bitmap_load_complete(QEMUFile *f, DBMLoadState *s)
         bdrv_reclaim_dirty_bitmap(s->bitmap, &error_abort);
     }
 
-    for (item = s->enabled_bitmaps; item; item = g_slist_next(item)) {
+    for (item = s->bitmaps; item; item = g_slist_next(item)) {
         LoadBitmapState *b = item->data;
 
         if (b->bitmap == s->bitmap) {
             b->migrated = true;
+            if (s->before_vm_start_handled) {
+                s->bitmaps = g_slist_remove(s->bitmaps, b);
+                g_free(b);
+            }
             break;
         }
     }
-- 
2.21.0


