Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC2922FAEC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 23:02:41 +0200 (CEST)
Received: from localhost ([::1]:33262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0AGe-0005zQ-7R
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 17:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k0AAZ-0005Lp-SR
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 16:56:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29944
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k0AAS-0004xe-2H
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 16:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595883375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=etZ4YFR5z2HMLe84KKA4NnmGz8eOF+r3IjzereHUr6Q=;
 b=LLp8/YongIP4D0r3h2ZX38XIWwXOrI7XDvEGG9Yc58ngEPQazEY7BvlgDUEwQwLgHl8/f+
 G1fTHmoIxepPMpCuLBFZzWo+uInwgc/9wkp5khS963vdqiGqhJwhyJH56B77ZDR5PgPMn7
 pPoBAkwHNKslXFiOCJ2H2G9IAZN7648=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-XASRwDDXPy6J5eF-m4_UVQ-1; Mon, 27 Jul 2020 16:56:12 -0400
X-MC-Unique: XASRwDDXPy6J5eF-m4_UVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A222A59;
 Mon, 27 Jul 2020 20:56:11 +0000 (UTC)
Received: from blue.redhat.com (ovpn-118-248.rdu2.redhat.com [10.10.118.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B2F519724;
 Mon, 27 Jul 2020 20:56:10 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/24] migration/block-dirty-bitmap: refactor state global
 variables
Date: Mon, 27 Jul 2020 15:55:31 -0500
Message-Id: <20200727205543.206624-13-eblake@redhat.com>
In-Reply-To: <20200727205543.206624-1-eblake@redhat.com>
References: <20200727205543.206624-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 15:02:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Move all state variables into one global struct. Reduce global
variable usage, utilizing opaque pointer where possible.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Message-Id: <20200727194236.19551-12-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 migration/block-dirty-bitmap.c | 179 ++++++++++++++++++---------------
 1 file changed, 99 insertions(+), 80 deletions(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 4b67e4f4fbcd..9b39e7aa2b4f 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -128,6 +128,12 @@ typedef struct DBMSaveState {
     BdrvDirtyBitmap *prev_bitmap;
 } DBMSaveState;

+typedef struct LoadBitmapState {
+    BlockDriverState *bs;
+    BdrvDirtyBitmap *bitmap;
+    bool migrated;
+} LoadBitmapState;
+
 /* State of the dirty bitmap migration (DBM) during load process */
 typedef struct DBMLoadState {
     uint32_t flags;
@@ -135,18 +141,17 @@ typedef struct DBMLoadState {
     char bitmap_name[256];
     BlockDriverState *bs;
     BdrvDirtyBitmap *bitmap;
+
+    GSList *enabled_bitmaps;
+    QemuMutex finish_lock;
 } DBMLoadState;

-static DBMSaveState dirty_bitmap_mig_state;
+typedef struct DBMState {
+    DBMSaveState save;
+    DBMLoadState load;
+} DBMState;

-/* State of one bitmap during load process */
-typedef struct LoadBitmapState {
-    BlockDriverState *bs;
-    BdrvDirtyBitmap *bitmap;
-    bool migrated;
-} LoadBitmapState;
-static GSList *enabled_bitmaps;
-QemuMutex finish_lock;
+static DBMState dbm_state;

 static uint32_t qemu_get_bitmap_flags(QEMUFile *f)
 {
@@ -169,21 +174,21 @@ static void qemu_put_bitmap_flags(QEMUFile *f, uint32_t flags)
     qemu_put_byte(f, flags);
 }

-static void send_bitmap_header(QEMUFile *f, SaveBitmapState *dbms,
-                               uint32_t additional_flags)
+static void send_bitmap_header(QEMUFile *f, DBMSaveState *s,
+                               SaveBitmapState *dbms, uint32_t additional_flags)
 {
     BlockDriverState *bs = dbms->bs;
     BdrvDirtyBitmap *bitmap = dbms->bitmap;
     uint32_t flags = additional_flags;
     trace_send_bitmap_header_enter();

-    if (bs != dirty_bitmap_mig_state.prev_bs) {
-        dirty_bitmap_mig_state.prev_bs = bs;
+    if (bs != s->prev_bs) {
+        s->prev_bs = bs;
         flags |= DIRTY_BITMAP_MIG_FLAG_DEVICE_NAME;
     }

-    if (bitmap != dirty_bitmap_mig_state.prev_bitmap) {
-        dirty_bitmap_mig_state.prev_bitmap = bitmap;
+    if (bitmap != s->prev_bitmap) {
+        s->prev_bitmap = bitmap;
         flags |= DIRTY_BITMAP_MIG_FLAG_BITMAP_NAME;
     }

@@ -198,19 +203,22 @@ static void send_bitmap_header(QEMUFile *f, SaveBitmapState *dbms,
     }
 }

-static void send_bitmap_start(QEMUFile *f, SaveBitmapState *dbms)
+static void send_bitmap_start(QEMUFile *f, DBMSaveState *s,
+                              SaveBitmapState *dbms)
 {
-    send_bitmap_header(f, dbms, DIRTY_BITMAP_MIG_FLAG_START);
+    send_bitmap_header(f, s, dbms, DIRTY_BITMAP_MIG_FLAG_START);
     qemu_put_be32(f, bdrv_dirty_bitmap_granularity(dbms->bitmap));
     qemu_put_byte(f, dbms->flags);
 }

-static void send_bitmap_complete(QEMUFile *f, SaveBitmapState *dbms)
+static void send_bitmap_complete(QEMUFile *f, DBMSaveState *s,
+                                 SaveBitmapState *dbms)
 {
-    send_bitmap_header(f, dbms, DIRTY_BITMAP_MIG_FLAG_COMPLETE);
+    send_bitmap_header(f, s, dbms, DIRTY_BITMAP_MIG_FLAG_COMPLETE);
 }

-static void send_bitmap_bits(QEMUFile *f, SaveBitmapState *dbms,
+static void send_bitmap_bits(QEMUFile *f, DBMSaveState *s,
+                             SaveBitmapState *dbms,
                              uint64_t start_sector, uint32_t nr_sectors)
 {
     /* align for buffer_is_zero() */
@@ -235,7 +243,7 @@ static void send_bitmap_bits(QEMUFile *f, SaveBitmapState *dbms,

     trace_send_bitmap_bits(flags, start_sector, nr_sectors, buf_size);

-    send_bitmap_header(f, dbms, flags);
+    send_bitmap_header(f, s, dbms, flags);

     qemu_put_be64(f, start_sector);
     qemu_put_be32(f, nr_sectors);
@@ -254,12 +262,12 @@ static void send_bitmap_bits(QEMUFile *f, SaveBitmapState *dbms,
 }

 /* Called with iothread lock taken.  */
-static void dirty_bitmap_do_save_cleanup(void)
+static void dirty_bitmap_do_save_cleanup(DBMSaveState *s)
 {
     SaveBitmapState *dbms;

-    while ((dbms = QSIMPLEQ_FIRST(&dirty_bitmap_mig_state.dbms_list)) != NULL) {
-        QSIMPLEQ_REMOVE_HEAD(&dirty_bitmap_mig_state.dbms_list, entry);
+    while ((dbms = QSIMPLEQ_FIRST(&s->dbms_list)) != NULL) {
+        QSIMPLEQ_REMOVE_HEAD(&s->dbms_list, entry);
         bdrv_dirty_bitmap_set_busy(dbms->bitmap, false);
         bdrv_unref(dbms->bs);
         g_free(dbms);
@@ -267,7 +275,8 @@ static void dirty_bitmap_do_save_cleanup(void)
 }

 /* Called with iothread lock taken. */
-static int add_bitmaps_to_list(BlockDriverState *bs, const char *bs_name)
+static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
+                               const char *bs_name)
 {
     BdrvDirtyBitmap *bitmap;
     SaveBitmapState *dbms;
@@ -322,25 +331,24 @@ static int add_bitmaps_to_list(BlockDriverState *bs, const char *bs_name)
             dbms->flags |= DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
         }

-        QSIMPLEQ_INSERT_TAIL(&dirty_bitmap_mig_state.dbms_list,
-                             dbms, entry);
+        QSIMPLEQ_INSERT_TAIL(&s->dbms_list, dbms, entry);
     }

     return 0;
 }

 /* Called with iothread lock taken. */
-static int init_dirty_bitmap_migration(void)
+static int init_dirty_bitmap_migration(DBMSaveState *s)
 {
     BlockDriverState *bs;
     SaveBitmapState *dbms;
     GHashTable *handled_by_blk = g_hash_table_new(NULL, NULL);
     BlockBackend *blk;

-    dirty_bitmap_mig_state.bulk_completed = false;
-    dirty_bitmap_mig_state.prev_bs = NULL;
-    dirty_bitmap_mig_state.prev_bitmap = NULL;
-    dirty_bitmap_mig_state.no_bitmaps = false;
+    s->bulk_completed = false;
+    s->prev_bs = NULL;
+    s->prev_bitmap = NULL;
+    s->no_bitmaps = false;

     /*
      * Use blockdevice name for direct (or filtered) children of named block
@@ -369,7 +377,7 @@ static int init_dirty_bitmap_migration(void)
         }

         if (bs && bs->drv && !bs->drv->is_filter) {
-            if (add_bitmaps_to_list(bs, name)) {
+            if (add_bitmaps_to_list(s, bs, name)) {
                 goto fail;
             }
             g_hash_table_add(handled_by_blk, bs);
@@ -381,18 +389,18 @@ static int init_dirty_bitmap_migration(void)
             continue;
         }

-        if (add_bitmaps_to_list(bs, bdrv_get_node_name(bs))) {
+        if (add_bitmaps_to_list(s, bs, bdrv_get_node_name(bs))) {
             goto fail;
         }
     }

     /* unset migration flags here, to not roll back it */
-    QSIMPLEQ_FOREACH(dbms, &dirty_bitmap_mig_state.dbms_list, entry) {
+    QSIMPLEQ_FOREACH(dbms, &s->dbms_list, entry) {
         bdrv_dirty_bitmap_skip_store(dbms->bitmap, true);
     }

-    if (QSIMPLEQ_EMPTY(&dirty_bitmap_mig_state.dbms_list)) {
-        dirty_bitmap_mig_state.no_bitmaps = true;
+    if (QSIMPLEQ_EMPTY(&s->dbms_list)) {
+        s->no_bitmaps = true;
     }

     g_hash_table_destroy(handled_by_blk);
@@ -401,18 +409,19 @@ static int init_dirty_bitmap_migration(void)

 fail:
     g_hash_table_destroy(handled_by_blk);
-    dirty_bitmap_do_save_cleanup();
+    dirty_bitmap_do_save_cleanup(s);

     return -1;
 }

 /* Called with no lock taken.  */
-static void bulk_phase_send_chunk(QEMUFile *f, SaveBitmapState *dbms)
+static void bulk_phase_send_chunk(QEMUFile *f, DBMSaveState *s,
+                                  SaveBitmapState *dbms)
 {
     uint32_t nr_sectors = MIN(dbms->total_sectors - dbms->cur_sector,
                              dbms->sectors_per_chunk);

-    send_bitmap_bits(f, dbms, dbms->cur_sector, nr_sectors);
+    send_bitmap_bits(f, s, dbms, dbms->cur_sector, nr_sectors);

     dbms->cur_sector += nr_sectors;
     if (dbms->cur_sector >= dbms->total_sectors) {
@@ -421,61 +430,66 @@ static void bulk_phase_send_chunk(QEMUFile *f, SaveBitmapState *dbms)
 }

 /* Called with no lock taken.  */
-static void bulk_phase(QEMUFile *f, bool limit)
+static void bulk_phase(QEMUFile *f, DBMSaveState *s, bool limit)
 {
     SaveBitmapState *dbms;

-    QSIMPLEQ_FOREACH(dbms, &dirty_bitmap_mig_state.dbms_list, entry) {
+    QSIMPLEQ_FOREACH(dbms, &s->dbms_list, entry) {
         while (!dbms->bulk_completed) {
-            bulk_phase_send_chunk(f, dbms);
+            bulk_phase_send_chunk(f, s, dbms);
             if (limit && qemu_file_rate_limit(f)) {
                 return;
             }
         }
     }

-    dirty_bitmap_mig_state.bulk_completed = true;
+    s->bulk_completed = true;
 }

 /* for SaveVMHandlers */
 static void dirty_bitmap_save_cleanup(void *opaque)
 {
-    dirty_bitmap_do_save_cleanup();
+    DBMSaveState *s = &((DBMState *)opaque)->save;
+
+    dirty_bitmap_do_save_cleanup(s);
 }

 static int dirty_bitmap_save_iterate(QEMUFile *f, void *opaque)
 {
+    DBMSaveState *s = &((DBMState *)opaque)->save;
+
     trace_dirty_bitmap_save_iterate(migration_in_postcopy());

-    if (migration_in_postcopy() && !dirty_bitmap_mig_state.bulk_completed) {
-        bulk_phase(f, true);
+    if (migration_in_postcopy() && !s->bulk_completed) {
+        bulk_phase(f, s, true);
     }

     qemu_put_bitmap_flags(f, DIRTY_BITMAP_MIG_FLAG_EOS);

-    return dirty_bitmap_mig_state.bulk_completed;
+    return s->bulk_completed;
 }

 /* Called with iothread lock taken.  */

 static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
 {
+    DBMSaveState *s = &((DBMState *)opaque)->save;
     SaveBitmapState *dbms;
     trace_dirty_bitmap_save_complete_enter();

-    if (!dirty_bitmap_mig_state.bulk_completed) {
-        bulk_phase(f, false);
+    if (!s->bulk_completed) {
+        bulk_phase(f, s, false);
     }

-    QSIMPLEQ_FOREACH(dbms, &dirty_bitmap_mig_state.dbms_list, entry) {
-        send_bitmap_complete(f, dbms);
+    QSIMPLEQ_FOREACH(dbms, &s->dbms_list, entry) {
+        send_bitmap_complete(f, s, dbms);
     }

     qemu_put_bitmap_flags(f, DIRTY_BITMAP_MIG_FLAG_EOS);

     trace_dirty_bitmap_save_complete_finish();

-    dirty_bitmap_do_save_cleanup();
+    dirty_bitmap_save_cleanup(opaque);
     return 0;
 }

@@ -485,12 +499,13 @@ static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
                                       uint64_t *res_compatible,
                                       uint64_t *res_postcopy_only)
 {
+    DBMSaveState *s = &((DBMState *)opaque)->save;
     SaveBitmapState *dbms;
     uint64_t pending = 0;

     qemu_mutex_lock_iothread();

-    QSIMPLEQ_FOREACH(dbms, &dirty_bitmap_mig_state.dbms_list, entry) {
+    QSIMPLEQ_FOREACH(dbms, &s->dbms_list, entry) {
         uint64_t gran = bdrv_dirty_bitmap_granularity(dbms->bitmap);
         uint64_t sectors = dbms->bulk_completed ? 0 :
                            dbms->total_sectors - dbms->cur_sector;
@@ -549,7 +564,7 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
         b->bs = s->bs;
         b->bitmap = s->bitmap;
         b->migrated = false;
-        enabled_bitmaps = g_slist_prepend(enabled_bitmaps, b);
+        s->enabled_bitmaps = g_slist_prepend(s->enabled_bitmaps, b);
     }

     return 0;
@@ -557,11 +572,12 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)

 void dirty_bitmap_mig_before_vm_start(void)
 {
+    DBMLoadState *s = &dbm_state.load;
     GSList *item;

-    qemu_mutex_lock(&finish_lock);
+    qemu_mutex_lock(&s->finish_lock);

-    for (item = enabled_bitmaps; item; item = g_slist_next(item)) {
+    for (item = s->enabled_bitmaps; item; item = g_slist_next(item)) {
         LoadBitmapState *b = item->data;

         if (b->migrated) {
@@ -573,10 +589,10 @@ void dirty_bitmap_mig_before_vm_start(void)
         g_free(b);
     }

-    g_slist_free(enabled_bitmaps);
-    enabled_bitmaps = NULL;
+    g_slist_free(s->enabled_bitmaps);
+    s->enabled_bitmaps = NULL;

-    qemu_mutex_unlock(&finish_lock);
+    qemu_mutex_unlock(&s->finish_lock);
 }

 static void dirty_bitmap_load_complete(QEMUFile *f, DBMLoadState *s)
@@ -585,9 +601,9 @@ static void dirty_bitmap_load_complete(QEMUFile *f, DBMLoadState *s)
     trace_dirty_bitmap_load_complete();
     bdrv_dirty_bitmap_deserialize_finish(s->bitmap);

-    qemu_mutex_lock(&finish_lock);
+    qemu_mutex_lock(&s->finish_lock);

-    for (item = enabled_bitmaps; item; item = g_slist_next(item)) {
+    for (item = s->enabled_bitmaps; item; item = g_slist_next(item)) {
         LoadBitmapState *b = item->data;

         if (b->bitmap == s->bitmap) {
@@ -598,7 +614,7 @@ static void dirty_bitmap_load_complete(QEMUFile *f, DBMLoadState *s)

     if (bdrv_dirty_bitmap_has_successor(s->bitmap)) {
         bdrv_dirty_bitmap_lock(s->bitmap);
-        if (enabled_bitmaps == NULL) {
+        if (s->enabled_bitmaps == NULL) {
             /* in postcopy */
             bdrv_reclaim_dirty_bitmap_locked(s->bitmap, &error_abort);
             bdrv_enable_dirty_bitmap_locked(s->bitmap);
@@ -617,7 +633,7 @@ static void dirty_bitmap_load_complete(QEMUFile *f, DBMLoadState *s)
         bdrv_dirty_bitmap_unlock(s->bitmap);
     }

-    qemu_mutex_unlock(&finish_lock);
+    qemu_mutex_unlock(&s->finish_lock);
 }

 static int dirty_bitmap_load_bits(QEMUFile *f, DBMLoadState *s)
@@ -714,7 +730,7 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s)

 static int dirty_bitmap_load(QEMUFile *f, void *opaque, int version_id)
 {
-    static DBMLoadState s;
+    DBMLoadState *s = &((DBMState *)opaque)->load;
     int ret = 0;

     trace_dirty_bitmap_load_enter();
@@ -724,17 +740,17 @@ static int dirty_bitmap_load(QEMUFile *f, void *opaque, int version_id)
     }

     do {
-        ret = dirty_bitmap_load_header(f, &s);
+        ret = dirty_bitmap_load_header(f, s);
         if (ret < 0) {
             return ret;
         }

-        if (s.flags & DIRTY_BITMAP_MIG_FLAG_START) {
-            ret = dirty_bitmap_load_start(f, &s);
-        } else if (s.flags & DIRTY_BITMAP_MIG_FLAG_COMPLETE) {
-            dirty_bitmap_load_complete(f, &s);
-        } else if (s.flags & DIRTY_BITMAP_MIG_FLAG_BITS) {
-            ret = dirty_bitmap_load_bits(f, &s);
+        if (s->flags & DIRTY_BITMAP_MIG_FLAG_START) {
+            ret = dirty_bitmap_load_start(f, s);
+        } else if (s->flags & DIRTY_BITMAP_MIG_FLAG_COMPLETE) {
+            dirty_bitmap_load_complete(f, s);
+        } else if (s->flags & DIRTY_BITMAP_MIG_FLAG_BITS) {
+            ret = dirty_bitmap_load_bits(f, s);
         }

         if (!ret) {
@@ -744,7 +760,7 @@ static int dirty_bitmap_load(QEMUFile *f, void *opaque, int version_id)
         if (ret) {
             return ret;
         }
-    } while (!(s.flags & DIRTY_BITMAP_MIG_FLAG_EOS));
+    } while (!(s->flags & DIRTY_BITMAP_MIG_FLAG_EOS));

     trace_dirty_bitmap_load_success();
     return 0;
@@ -752,13 +768,14 @@ static int dirty_bitmap_load(QEMUFile *f, void *opaque, int version_id)

 static int dirty_bitmap_save_setup(QEMUFile *f, void *opaque)
 {
+    DBMSaveState *s = &((DBMState *)opaque)->save;
     SaveBitmapState *dbms = NULL;
-    if (init_dirty_bitmap_migration() < 0) {
+    if (init_dirty_bitmap_migration(s) < 0) {
         return -1;
     }

-    QSIMPLEQ_FOREACH(dbms, &dirty_bitmap_mig_state.dbms_list, entry) {
-        send_bitmap_start(f, dbms);
+    QSIMPLEQ_FOREACH(dbms, &s->dbms_list, entry) {
+        send_bitmap_start(f, s, dbms);
     }
     qemu_put_bitmap_flags(f, DIRTY_BITMAP_MIG_FLAG_EOS);

@@ -767,7 +784,9 @@ static int dirty_bitmap_save_setup(QEMUFile *f, void *opaque)

 static bool dirty_bitmap_is_active(void *opaque)
 {
-    return migrate_dirty_bitmaps() && !dirty_bitmap_mig_state.no_bitmaps;
+    DBMSaveState *s = &((DBMState *)opaque)->save;
+
+    return migrate_dirty_bitmaps() && !s->no_bitmaps;
 }

 static bool dirty_bitmap_is_active_iterate(void *opaque)
@@ -795,10 +814,10 @@ static SaveVMHandlers savevm_dirty_bitmap_handlers = {

 void dirty_bitmap_mig_init(void)
 {
-    QSIMPLEQ_INIT(&dirty_bitmap_mig_state.dbms_list);
-    qemu_mutex_init(&finish_lock);
+    QSIMPLEQ_INIT(&dbm_state.save.dbms_list);
+    qemu_mutex_init(&dbm_state.load.finish_lock);

     register_savevm_live("dirty-bitmap", 0, 1,
                          &savevm_dirty_bitmap_handlers,
-                         &dirty_bitmap_mig_state);
+                         &dbm_state);
 }
-- 
2.27.0


