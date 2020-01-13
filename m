Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DA813955A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 16:57:39 +0100 (CET)
Received: from localhost ([::1]:52146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir25y-0001GD-CA
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 10:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38861)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ir24C-00086s-Bl
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 10:55:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ir249-0004Bq-Qi
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 10:55:48 -0500
Received: from relay.sw.ru ([185.231.240.75]:36158)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ir244-000437-9O; Mon, 13 Jan 2020 10:55:40 -0500
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ir23y-0002bW-BJ; Mon, 13 Jan 2020 18:55:34 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/2] qcow2: dump QCOW2 metadata
Date: Mon, 13 Jan 2020 18:55:33 +0300
Message-Id: <1578930933-69721-3-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578930933-69721-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1578930933-69721-1-git-send-email-andrey.shinkevich@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let QEMU-IMG CHECK command show QCOW2 structure to inform a user about
metadata allocations on disk. Introduce '-M'('--dump-meta') key option.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/qcow2-bitmap.c   | 54 +++++++++++++++++++++++++++++---
 block/qcow2-refcount.c | 84 +++++++++++++++++++++++++++++++++++++++++---------
 block/qcow2.c          | 30 ++++++++++++++++++
 block/qcow2.h          |  6 ++--
 include/block/block.h  |  3 +-
 qemu-img.c             | 30 +++++++++++++++++-
 qemu-img.texi          |  6 +++-
 7 files changed, 189 insertions(+), 24 deletions(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index d41f5d0..15e035a 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -659,20 +659,29 @@ fail:
 
 int qcow2_check_bitmaps_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                                   void **refcount_table,
-                                  int64_t *refcount_table_size)
+                                  int64_t *refcount_table_size,
+                                  Qcow2Bitmaps *bitmaps)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
     Qcow2BitmapList *bm_list;
     Qcow2Bitmap *bm;
+    Qcow2BitmapDirectoryEntryList **pp_dir =
+        bitmaps ? &bitmaps->bitmap_dir->dir_entries : NULL;
 
     if (s->nb_bitmaps == 0) {
         return 0;
     }
 
+    if (bitmaps) {
+        bitmaps->nb_bitmaps = s->nb_bitmaps;
+    }
+
     ret = qcow2_inc_refcounts_imrt(bs, res, refcount_table, refcount_table_size,
                                    s->bitmap_directory_offset,
-                                   s->bitmap_directory_size);
+                                   s->bitmap_directory_size,
+                                   bitmaps ? bitmaps->bitmap_dir->location
+                                   : NULL);
     if (ret < 0) {
         return ret;
     }
@@ -686,12 +695,28 @@ int qcow2_check_bitmaps_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
 
     QSIMPLEQ_FOREACH(bm, bm_list, entry) {
         uint64_t *bitmap_table = NULL;
+        Qcow2BitmapTableInfoEntryList **pp_table;
         int i;
 
+        Qcow2BitmapDirectoryEntry *bmde = NULL;
+        if (bitmaps) {
+            bmde = g_new0(Qcow2BitmapDirectoryEntry, 1);
+            bmde->bitmap_name = g_strdup(bm->name);
+            bmde->bitmap_table = g_new0(Qcow2BitmapTableInfo, 1);
+            bmde->bitmap_table->location = g_new0(Qcow2Allocation, 1);
+            Qcow2BitmapDirectoryEntryList *obj =
+                g_new0(Qcow2BitmapDirectoryEntryList, 1);
+            obj->value = bmde;
+            *pp_dir = obj;
+            pp_dir = &obj->next;
+        }
+
         ret = qcow2_inc_refcounts_imrt(bs, res,
                                        refcount_table, refcount_table_size,
                                        bm->table.offset,
-                                       bm->table.size * sizeof(uint64_t));
+                                       bm->table.size * sizeof(uint64_t),
+                                       bmde ? bmde->bitmap_table->location
+                                       : NULL);
         if (ret < 0) {
             goto out;
         }
@@ -702,6 +727,8 @@ int qcow2_check_bitmaps_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
             goto out;
         }
 
+        pp_table = bmde ? &bmde->bitmap_table->table_entries : NULL;
+
         for (i = 0; i < bm->table.size; ++i) {
             uint64_t entry = bitmap_table[i];
             uint64_t offset = entry & BME_TABLE_ENTRY_OFFSET_MASK;
@@ -711,13 +738,32 @@ int qcow2_check_bitmaps_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                 continue;
             }
 
+            Qcow2BitmapTableInfoEntry *bmte = NULL;
+            if (bmde) {
+                bmte = g_new0(Qcow2BitmapTableInfoEntry, 1);
+                bmte->type = offset ?
+                    QCOW2_BITMAP_TABLE_INFO_ENTRY_TYPE_SERIALIZED :
+                    entry & BME_TABLE_ENTRY_FLAG_ALL_ONES;
+                if (offset) {
+                    bmte->cluster = g_new0(Qcow2Allocation, 1);
+                }
+                bmte->has_cluster = !!(bmte->cluster);
+                Qcow2BitmapTableInfoEntryList *elem =
+                    g_new0(Qcow2BitmapTableInfoEntryList, 1);
+                elem->value = bmte;
+                *pp_table = elem;
+                pp_table = &elem->next;
+            }
+
             if (offset == 0) {
                 continue;
             }
 
             ret = qcow2_inc_refcounts_imrt(bs, res,
                                            refcount_table, refcount_table_size,
-                                           offset, s->cluster_size);
+                                           offset, s->cluster_size,
+                                           bmte && bmte->cluster ? bmte->cluster
+                                           : NULL);
             if (ret < 0) {
                 g_free(bitmap_table);
                 goto out;
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index f67ac6b..f5444fc 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1521,7 +1521,8 @@ static int realloc_refcount_array(BDRVQcow2State *s, void **array,
 int qcow2_inc_refcounts_imrt(BlockDriverState *bs, BdrvCheckResult *res,
                              void **refcount_table,
                              int64_t *refcount_table_size,
-                             int64_t offset, int64_t size)
+                             int64_t offset, int64_t size,
+                             Qcow2Allocation *qcow2_alloc)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t start, last, cluster_offset, k, refcount;
@@ -1550,6 +1551,11 @@ int qcow2_inc_refcounts_imrt(BlockDriverState *bs, BdrvCheckResult *res,
         return 0;
     }
 
+    if (qcow2_alloc) {
+        qcow2_alloc->offset = offset;
+        qcow2_alloc->size = size;
+    }
+
     start = start_of_cluster(s, offset);
     last = start_of_cluster(s, offset + size - 1);
     for(cluster_offset = start; cluster_offset <= last;
@@ -1643,7 +1649,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
             ret = qcow2_inc_refcounts_imrt(
                 bs, res, refcount_table, refcount_table_size,
                 l2_entry & QCOW2_COMPRESSED_SECTOR_MASK,
-                nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE);
+                nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE, NULL);
             if (ret < 0) {
                 goto fail;
             }
@@ -1731,7 +1737,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
             if (!has_data_file(bs)) {
                 ret = qcow2_inc_refcounts_imrt(bs, res, refcount_table,
                                                refcount_table_size,
-                                               offset, s->cluster_size);
+                                               offset, s->cluster_size, NULL);
                 if (ret < 0) {
                     goto fail;
                 }
@@ -1769,17 +1775,20 @@ static int check_refcounts_l1(BlockDriverState *bs,
                               void **refcount_table,
                               int64_t *refcount_table_size,
                               int64_t l1_table_offset, int l1_size,
-                              int flags, BdrvCheckMode fix, bool active)
+                              int flags, BdrvCheckMode fix, bool active,
+                              Qcow2L1Table *l1t)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t *l1_table = NULL, l2_offset, l1_size2;
+    Qcow2AllocationList **plist = l1t ? &l1t->l2_list : NULL;
     int i, ret;
 
     l1_size2 = l1_size * sizeof(uint64_t);
 
     /* Mark L1 table as used */
     ret = qcow2_inc_refcounts_imrt(bs, res, refcount_table, refcount_table_size,
-                                   l1_table_offset, l1_size2);
+                                   l1_table_offset, l1_size2,
+                                   l1t ? l1t->location : NULL);
     if (ret < 0) {
         goto fail;
     }
@@ -1808,9 +1817,19 @@ static int check_refcounts_l1(BlockDriverState *bs,
         if (l2_offset) {
             /* Mark L2 table as used */
             l2_offset &= L1E_OFFSET_MASK;
+
+            Qcow2Allocation *l2t = NULL;
+            if (l1t) {
+                l2t = g_new0(Qcow2Allocation, 1);
+                Qcow2AllocationList *obj = g_new0(Qcow2AllocationList, 1);
+                obj->value = l2t;
+                *plist = obj;
+                plist = &obj->next;
+            }
+
             ret = qcow2_inc_refcounts_imrt(bs, res,
                                            refcount_table, refcount_table_size,
-                                           l2_offset, s->cluster_size);
+                                           l2_offset, s->cluster_size, l2t);
             if (ret < 0) {
                 goto fail;
             }
@@ -2047,7 +2066,7 @@ static int check_refblocks(BlockDriverState *bs, BdrvCheckResult *res,
                 res->corruptions_fixed++;
                 ret = qcow2_inc_refcounts_imrt(bs, res,
                                                refcount_table, nb_clusters,
-                                               offset, s->cluster_size);
+                                               offset, s->cluster_size, NULL);
                 if (ret < 0) {
                     return ret;
                 }
@@ -2066,7 +2085,7 @@ resize_fail:
 
         if (offset != 0) {
             ret = qcow2_inc_refcounts_imrt(bs, res, refcount_table, nb_clusters,
-                                           offset, s->cluster_size);
+                                           offset, s->cluster_size, NULL);
             if (ret < 0) {
                 return ret;
             }
@@ -2093,6 +2112,9 @@ static int calculate_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
     BDRVQcow2State *s = bs->opaque;
     int64_t i;
     QCowSnapshot *sn;
+    bool has_snapshots = res->metadata && res->metadata->snapshot_table;
+    Qcow2L1TableList **plist = has_snapshots ?
+        &res->metadata->snapshot_table->l1_list : NULL;
     int ret;
 
     if (!*refcount_table) {
@@ -2106,16 +2128,25 @@ static int calculate_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
     }
 
     /* header */
+    if (res->metadata) {
+        res->metadata->qcow2_header->version = s->qcow_version;
+    }
     ret = qcow2_inc_refcounts_imrt(bs, res, refcount_table, nb_clusters,
-                                   0, s->cluster_size);
+                                   0, s->cluster_size,
+                                   res->metadata ?
+                                   res->metadata->qcow2_header->location : NULL);
     if (ret < 0) {
         return ret;
     }
 
     /* current L1 table */
+    if (res->metadata) {
+        res->metadata->active_l1->name = g_strdup("L1 active table");
+    }
     ret = check_refcounts_l1(bs, res, refcount_table, nb_clusters,
                              s->l1_table_offset, s->l1_size, CHECK_FRAG_INFO,
-                             fix, true);
+                             fix, true,
+                             res->metadata ? res->metadata->active_l1 : NULL);
     if (ret < 0) {
         return ret;
     }
@@ -2143,15 +2174,30 @@ static int calculate_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
             res->corruptions++;
             continue;
         }
+
+        Qcow2L1Table *l1t = NULL;
+        if (has_snapshots) {
+            l1t = g_new0(Qcow2L1Table, 1);
+            l1t->location = g_new0(Qcow2Allocation, 1);
+            l1t->name = g_strdup(sn->name);
+            Qcow2L1TableList *obj = g_new0(Qcow2L1TableList, 1);
+            obj->value = l1t;
+            *plist = obj;
+            plist = &obj->next;
+        }
+
         ret = check_refcounts_l1(bs, res, refcount_table, nb_clusters,
                                  sn->l1_table_offset, sn->l1_size, 0, fix,
-                                 false);
+                                 false, l1t);
         if (ret < 0) {
             return ret;
         }
     }
     ret = qcow2_inc_refcounts_imrt(bs, res, refcount_table, nb_clusters,
-                                   s->snapshots_offset, s->snapshots_size);
+                                   s->snapshots_offset, s->snapshots_size,
+                                   has_snapshots ?
+                                   res->metadata->snapshot_table->location
+                                   : NULL);
     if (ret < 0) {
         return ret;
     }
@@ -2159,7 +2205,10 @@ static int calculate_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
     /* refcount data */
     ret = qcow2_inc_refcounts_imrt(bs, res, refcount_table, nb_clusters,
                                    s->refcount_table_offset,
-                                   s->refcount_table_size * sizeof(uint64_t));
+                                   s->refcount_table_size * sizeof(uint64_t),
+                                   res->metadata ?
+                                   res->metadata->refcount_table->location
+                                   : NULL);
     if (ret < 0) {
         return ret;
     }
@@ -2168,14 +2217,19 @@ static int calculate_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
     if (s->crypto_header.length) {
         ret = qcow2_inc_refcounts_imrt(bs, res, refcount_table, nb_clusters,
                                        s->crypto_header.offset,
-                                       s->crypto_header.length);
+                                       s->crypto_header.length,
+                                       res->metadata ?
+                                       res->metadata->crypt_header->location
+                                       : NULL);
         if (ret < 0) {
             return ret;
         }
     }
 
     /* bitmaps */
-    ret = qcow2_check_bitmaps_refcounts(bs, res, refcount_table, nb_clusters);
+    ret = qcow2_check_bitmaps_refcounts(bs, res, refcount_table, nb_clusters,
+                                        res->metadata ? res->metadata->bitmaps
+                                        : NULL);
     if (ret < 0) {
         return ret;
     }
diff --git a/block/qcow2.c b/block/qcow2.c
index cef9d72..634b642 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -590,6 +590,7 @@ static int coroutine_fn qcow2_co_check_locked(BlockDriverState *bs,
                                               BdrvCheckResult *result,
                                               BdrvCheckMode fix)
 {
+    BDRVQcow2State *s = bs->opaque;
     BdrvCheckResult snapshot_res = {};
     BdrvCheckResult refcount_res = {};
     int ret;
@@ -602,6 +603,35 @@ static int coroutine_fn qcow2_co_check_locked(BlockDriverState *bs,
         return ret;
     }
 
+    if (fix & BDRV_DUMP_META) {
+        result->metadata = g_new0(Qcow2Metadata, 1);
+        result->metadata->qcow2_header = g_new0(Qcow2Header, 1);
+        result->metadata->qcow2_header->location = g_new0(Qcow2Allocation, 1);
+        result->metadata->active_l1 = g_new0(Qcow2L1Table, 1);
+        result->metadata->active_l1->location = g_new0(Qcow2Allocation, 1);
+        result->metadata->refcount_table = g_new0(Qcow2RefcountTable, 1);
+        result->metadata->refcount_table->location = g_new0(Qcow2Allocation, 1);
+
+        refcount_res.metadata = result->metadata;
+
+        if (s->crypto_header.length) {
+            result->metadata->crypt_header = g_new0(Qcow2EncryptionHeader, 1);
+            result->metadata->crypt_header->location =
+                g_new0(Qcow2Allocation, 1);
+        }
+        if (s->nb_bitmaps) {
+            result->metadata->bitmaps = g_new0(Qcow2Bitmaps, 1);
+            result->metadata->bitmaps->bitmap_dir = g_new0(Qcow2BitmapDir, 1);
+            result->metadata->bitmaps->bitmap_dir->location =
+                g_new0(Qcow2Allocation, 1);
+        }
+        if (s->nb_snapshots) {
+            result->metadata->snapshot_table = g_new0(Qcow2SnapshotsTable, 1);
+            result->metadata->snapshot_table->location =
+                g_new0(Qcow2Allocation, 1);
+        }
+    }
+
     ret = qcow2_check_refcounts(bs, &refcount_res, fix);
     qcow2_add_check_result(result, &refcount_res, true);
     if (ret < 0) {
diff --git a/block/qcow2.h b/block/qcow2.h
index 0942126..8d615e2 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -662,7 +662,8 @@ int qcow2_pre_write_overlap_check(BlockDriverState *bs, int ign, int64_t offset,
 int qcow2_inc_refcounts_imrt(BlockDriverState *bs, BdrvCheckResult *res,
                              void **refcount_table,
                              int64_t *refcount_table_size,
-                             int64_t offset, int64_t size);
+                             int64_t offset, int64_t size,
+                             Qcow2Allocation *qcow2_alloc);
 
 int qcow2_change_refcount_order(BlockDriverState *bs, int refcount_order,
                                 BlockDriverAmendStatusCB *status_cb,
@@ -751,7 +752,8 @@ void qcow2_cache_discard(Qcow2Cache *c, void *table);
 /* qcow2-bitmap.c functions */
 int qcow2_check_bitmaps_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                                   void **refcount_table,
-                                  int64_t *refcount_table_size);
+                                  int64_t *refcount_table_size,
+                                  Qcow2Bitmaps *bitmaps);
 bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp);
 Qcow2BitmapInfoList *qcow2_get_bitmap_info_list(BlockDriverState *bs,
                                                 Error **errp);
diff --git a/include/block/block.h b/include/block/block.h
index e9dcfef..cfc9d68 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -374,7 +374,6 @@ int bdrv_freeze_backing_chain(BlockDriverState *bs, BlockDriverState *base,
                               Error **errp);
 void bdrv_unfreeze_backing_chain(BlockDriverState *bs, BlockDriverState *base);
 
-
 typedef struct BdrvCheckResult {
     int corruptions;
     int leaks;
@@ -383,11 +382,13 @@ typedef struct BdrvCheckResult {
     int leaks_fixed;
     int64_t image_end_offset;
     BlockFragInfo bfi;
+    Qcow2Metadata *metadata;
 } BdrvCheckResult;
 
 typedef enum {
     BDRV_FIX_LEAKS    = 1,
     BDRV_FIX_ERRORS   = 2,
+    BDRV_DUMP_META    = 4,
 } BdrvCheckMode;
 
 int bdrv_check(BlockDriverState *bs, BdrvCheckResult *res, BdrvCheckMode fix);
diff --git a/qemu-img.c b/qemu-img.c
index 6233b8c..84e9f56 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -173,6 +173,7 @@ static void QEMU_NORETURN help(void)
            "       '-r leaks' repairs only cluster leaks, whereas '-r all' fixes all\n"
            "       kinds of errors, with a higher risk of choosing the wrong fix or\n"
            "       hiding corruption that has already occurred.\n"
+           "  '-M' Dump qcow2 metadata to stdout in JSON format.\n"
            "\n"
            "Parameters to convert subcommand:\n"
            "  '-m' specifies how many coroutines work in parallel during the convert\n"
@@ -659,6 +660,15 @@ static int collect_image_check(BlockDriverState *bs,
     check->has_fragmented_clusters  = result.bfi.fragmented_clusters != 0;
     check->compressed_clusters      = result.bfi.compressed_clusters;
     check->has_compressed_clusters  = result.bfi.compressed_clusters != 0;
+    check->metadata                  = result.metadata;
+    check->has_metadata              = !!(result.metadata);
+
+    if (check->has_metadata) {
+        check->metadata->has_crypt_header = !!(check->metadata->crypt_header);
+        check->metadata->has_bitmaps = !!(check->metadata->bitmaps);
+        check->metadata->has_snapshot_table =
+            !!(check->metadata->snapshot_table);
+    }
 
     return 0;
 }
@@ -701,9 +711,10 @@ static int img_check(int argc, char **argv)
             {"object", required_argument, 0, OPTION_OBJECT},
             {"image-opts", no_argument, 0, OPTION_IMAGE_OPTS},
             {"force-share", no_argument, 0, 'U'},
+            {"dump-meta", no_argument, 0, 'M'},
             {0, 0, 0, 0}
         };
-        c = getopt_long(argc, argv, ":hf:r:T:qU",
+        c = getopt_long(argc, argv, ":hf:Mr:T:qU",
                         long_options, &option_index);
         if (c == -1) {
             break;
@@ -721,6 +732,9 @@ static int img_check(int argc, char **argv)
         case 'f':
             fmt = optarg;
             break;
+        case 'M':
+            fix |= BDRV_DUMP_META;
+            break;
         case 'r':
             flags |= BDRV_O_RDWR;
 
@@ -772,6 +786,11 @@ static int img_check(int argc, char **argv)
         return 1;
     }
 
+    if ((fix & BDRV_DUMP_META) && output_format != OFORMAT_JSON) {
+        error_report("Metadata output is in JSON format only");
+        return 1;
+    }
+
     if (qemu_opts_foreach(&qemu_object_opts,
                           user_creatable_add_opts_foreach,
                           qemu_img_object_print_help, &error_fatal)) {
@@ -792,6 +811,15 @@ static int img_check(int argc, char **argv)
     bs = blk_bs(blk);
 
     check = g_new0(ImageCheck, 1);
+
+    if (fix & BDRV_DUMP_META) {
+        if (strcmp(bs->drv->format_name, "qcow2")) {
+            error_report("Metadata output supported for QCOW2 format only");
+            ret = -ENOTSUP;
+            goto fail;
+        }
+    }
+
     ret = collect_image_check(bs, check, filename, fmt, fix);
 
     if (ret == -ENOTSUP) {
diff --git a/qemu-img.texi b/qemu-img.texi
index b5156d6..080e46a 100644
--- a/qemu-img.texi
+++ b/qemu-img.texi
@@ -230,7 +230,7 @@ specified as well.
 For write tests, by default a buffer filled with zeros is written. This can be
 overridden with a pattern byte specified by @var{pattern}.
 
-@item check [--object @var{objectdef}] [--image-opts] [-q] [-f @var{fmt}] [--output=@var{ofmt}] [-r [leaks | all]] [-T @var{src_cache}] [-U] @var{filename}
+@item check [--object @var{objectdef}] [--image-opts] [-M] [-q] [-f @var{fmt}] [--output=@var{ofmt}] [-r [leaks | all]] [-T @var{src_cache}] [-U] @var{filename}
 
 Perform a consistency check on the disk image @var{filename}. The command can
 output in the format @var{ofmt} which is either @code{human} or @code{json}.
@@ -241,6 +241,10 @@ during the check. @code{-r leaks} repairs only cluster leaks, whereas
 @code{-r all} fixes all kinds of errors, with a higher risk of choosing the
 wrong fix or hiding corruption that has already occurred.
 
+If @code{-M} is specified, qemu-img dumps metadata allocations in the image.
+This option works with @code{json} format output and is effective for the
+@code{qcow2} format only.
+
 Only the formats @code{qcow2}, @code{qed} and @code{vdi} support
 consistency checks.
 
-- 
1.8.3.1


