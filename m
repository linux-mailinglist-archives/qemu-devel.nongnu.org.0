Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3EC12B44A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Dec 2019 12:46:49 +0100 (CET)
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iko4v-0001ZY-1K
	for lists+qemu-devel@lfdr.de; Fri, 27 Dec 2019 06:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iko2X-0007cF-Gq
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 06:44:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iko2V-0007Us-5Z
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 06:44:21 -0500
Received: from relay.sw.ru ([185.231.240.75]:58022)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iko2P-0007JC-56; Fri, 27 Dec 2019 06:44:13 -0500
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iko2C-0001wk-KH; Fri, 27 Dec 2019 14:44:00 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] qcow2: dump QCOW2 metadata
Date: Fri, 27 Dec 2019 14:43:59 +0300
Message-Id: <1577447039-400109-3-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1577447039-400109-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1577447039-400109-1-git-send-email-andrey.shinkevich@virtuozzo.com>
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
 block/qcow2-bitmap.c   | 53 ++++++++++++++++++++++++++++---
 block/qcow2-refcount.c | 84 +++++++++++++++++++++++++++++++++++++++++---------
 block/qcow2.c          | 30 ++++++++++++++++++
 block/qcow2.h          |  6 ++--
 include/block/block.h  |  3 +-
 qemu-img.c             | 29 ++++++++++++++++-
 qemu-img.texi          |  2 +-
 7 files changed, 183 insertions(+), 24 deletions(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index c6c8ebb..4f7b375 100644
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
+        Qcow2BitmapTblEntryList **pp_table;
         int i;
 
+        Qcow2BitmapDirectoryEntry *bmde = NULL;
+        if (bitmaps) {
+            bmde = g_new0(Qcow2BitmapDirectoryEntry, 1);
+            bmde->bitmap_name = g_strdup(bm->name);
+            bmde->bitmap_table = g_new0(Qcow2BitmapTbl, 1);
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
@@ -711,13 +738,31 @@ int qcow2_check_bitmaps_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                 continue;
             }
 
+            Qcow2BitmapTblEntry *bmte = NULL;
+            if (bmde) {
+                bmte = g_new0(Qcow2BitmapTblEntry, 1);
+                bmte->type = offset ? QCOW2_BITMAP_TBL_ENTRY_TYPE_SERIALIZED :
+                    entry & BME_TABLE_ENTRY_FLAG_ALL_ONES;
+                if (offset) {
+                    bmte->cluster = g_new0(Qcow2Allocation, 1);
+                }
+                bmte->has_cluster = !!(bmte->cluster);
+                Qcow2BitmapTblEntryList *elem =
+                    g_new0(Qcow2BitmapTblEntryList, 1);
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
index f67ac6b..ac1ae42 100644
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
+    bool has_snapshots = res->viscera && res->viscera->snapshot_table;
+    Qcow2L1TableList **plist = has_snapshots ?
+        &res->viscera->snapshot_table->l1_list : NULL;
     int ret;
 
     if (!*refcount_table) {
@@ -2106,16 +2128,25 @@ static int calculate_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
     }
 
     /* header */
+    if (res->viscera) {
+        res->viscera->qcow2_header->version = s->qcow_version;
+    }
     ret = qcow2_inc_refcounts_imrt(bs, res, refcount_table, nb_clusters,
-                                   0, s->cluster_size);
+                                   0, s->cluster_size,
+                                   res->viscera ?
+                                   res->viscera->qcow2_header->location : NULL);
     if (ret < 0) {
         return ret;
     }
 
     /* current L1 table */
+    if (res->viscera) {
+        res->viscera->active_l1->name = g_strdup("L1 active table");
+    }
     ret = check_refcounts_l1(bs, res, refcount_table, nb_clusters,
                              s->l1_table_offset, s->l1_size, CHECK_FRAG_INFO,
-                             fix, true);
+                             fix, true,
+                             res->viscera ? res->viscera->active_l1 : NULL);
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
+                                   res->viscera->snapshot_table->location
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
+                                   res->viscera ?
+                                   res->viscera->refcount_table->location
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
+                                       res->viscera ?
+                                       res->viscera->crypt_header->location
+                                       : NULL);
         if (ret < 0) {
             return ret;
         }
     }
 
     /* bitmaps */
-    ret = qcow2_check_bitmaps_refcounts(bs, res, refcount_table, nb_clusters);
+    ret = qcow2_check_bitmaps_refcounts(bs, res, refcount_table, nb_clusters,
+                                        res->viscera ? res->viscera->bitmaps
+                                        : NULL);
     if (ret < 0) {
         return ret;
     }
diff --git a/block/qcow2.c b/block/qcow2.c
index 7c18721..39cf918 100644
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
+        result->viscera = g_new0(Qcow2Metadata, 1);
+        result->viscera->qcow2_header = g_new0(Qcow2Header, 1);
+        result->viscera->qcow2_header->location = g_new0(Qcow2Allocation, 1);
+        result->viscera->active_l1 = g_new0(Qcow2L1Table, 1);
+        result->viscera->active_l1->location = g_new0(Qcow2Allocation, 1);
+        result->viscera->refcount_table = g_new0(Qcow2RefcountTable, 1);
+        result->viscera->refcount_table->location = g_new0(Qcow2Allocation, 1);
+
+        refcount_res.viscera = result->viscera;
+
+        if (s->crypto_header.length) {
+            result->viscera->crypt_header = g_new0(Qcow2EncryptionHeader, 1);
+            result->viscera->crypt_header->location =
+                g_new0(Qcow2Allocation, 1);
+        }
+        if (s->nb_bitmaps) {
+            result->viscera->bitmaps = g_new0(Qcow2Bitmaps, 1);
+            result->viscera->bitmaps->bitmap_dir = g_new0(Qcow2BitmapDir, 1);
+            result->viscera->bitmaps->bitmap_dir->location =
+                g_new0(Qcow2Allocation, 1);
+        }
+        if (s->nb_snapshots) {
+            result->viscera->snapshot_table = g_new0(Qcow2SnapshotsTable, 1);
+            result->viscera->snapshot_table->location =
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
index 1df9848..b1fc275 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -373,7 +373,6 @@ int bdrv_freeze_backing_chain(BlockDriverState *bs, BlockDriverState *base,
                               Error **errp);
 void bdrv_unfreeze_backing_chain(BlockDriverState *bs, BlockDriverState *base);
 
-
 typedef struct BdrvCheckResult {
     int corruptions;
     int leaks;
@@ -382,11 +381,13 @@ typedef struct BdrvCheckResult {
     int leaks_fixed;
     int64_t image_end_offset;
     BlockFragInfo bfi;
+    Qcow2Metadata *viscera;
 } BdrvCheckResult;
 
 typedef enum {
     BDRV_FIX_LEAKS    = 1,
     BDRV_FIX_ERRORS   = 2,
+    BDRV_DUMP_META    = 4,
 } BdrvCheckMode;
 
 int bdrv_check(BlockDriverState *bs, BdrvCheckResult *res, BdrvCheckMode fix);
diff --git a/qemu-img.c b/qemu-img.c
index 95a24b9..840eee2 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -173,6 +173,7 @@ static void QEMU_NORETURN help(void)
            "       '-r leaks' repairs only cluster leaks, whereas '-r all' fixes all\n"
            "       kinds of errors, with a higher risk of choosing the wrong fix or\n"
            "       hiding corruption that has already occurred.\n"
+           "  '-M' Dump QCOW2 metadata to stdout in JSON format.\n"
            "\n"
            "Parameters to convert subcommand:\n"
            "  '-m' specifies how many coroutines work in parallel during the convert\n"
@@ -659,6 +660,14 @@ static int collect_image_check(BlockDriverState *bs,
     check->has_fragmented_clusters  = result.bfi.fragmented_clusters != 0;
     check->compressed_clusters      = result.bfi.compressed_clusters;
     check->has_compressed_clusters  = result.bfi.compressed_clusters != 0;
+    check->viscera                  = result.viscera;
+    check->has_viscera              = !!(result.viscera);
+
+    if (check->has_viscera) {
+        check->viscera->has_crypt_header = !!(check->viscera->crypt_header);
+        check->viscera->has_bitmaps = !!(check->viscera->bitmaps);
+        check->viscera->has_snapshot_table = !!(check->viscera->snapshot_table);
+    }
 
     return 0;
 }
@@ -701,9 +710,10 @@ static int img_check(int argc, char **argv)
             {"object", required_argument, 0, OPTION_OBJECT},
             {"image-opts", no_argument, 0, OPTION_IMAGE_OPTS},
             {"force-share", no_argument, 0, 'U'},
+            {"dump-meta", no_argument, 0, 'M'},
             {0, 0, 0, 0}
         };
-        c = getopt_long(argc, argv, ":hf:r:T:qU",
+        c = getopt_long(argc, argv, ":hf:r:T:qU:M",
                         long_options, &option_index);
         if (c == -1) {
             break;
@@ -745,6 +755,9 @@ static int img_check(int argc, char **argv)
         case 'U':
             force_share = true;
             break;
+        case 'M':
+            fix |= BDRV_DUMP_META;
+            break;
         case OPTION_OBJECT: {
             QemuOpts *opts;
             opts = qemu_opts_parse_noisily(&qemu_object_opts,
@@ -772,6 +785,11 @@ static int img_check(int argc, char **argv)
         return 1;
     }
 
+    if ((fix & BDRV_DUMP_META) && output_format != OFORMAT_JSON) {
+        error_report("Metadata output in JSON format only");
+        return 1;
+    }
+
     if (qemu_opts_foreach(&qemu_object_opts,
                           user_creatable_add_opts_foreach,
                           qemu_img_object_print_help, &error_fatal)) {
@@ -792,6 +810,15 @@ static int img_check(int argc, char **argv)
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
index b5156d6..873e80a 100644
--- a/qemu-img.texi
+++ b/qemu-img.texi
@@ -230,7 +230,7 @@ specified as well.
 For write tests, by default a buffer filled with zeros is written. This can be
 overridden with a pattern byte specified by @var{pattern}.
 
-@item check [--object @var{objectdef}] [--image-opts] [-q] [-f @var{fmt}] [--output=@var{ofmt}] [-r [leaks | all]] [-T @var{src_cache}] [-U] @var{filename}
+@item check [--object @var{objectdef}] [--image-opts] [-M] [-q] [-f @var{fmt}] [--output=@var{ofmt}] [-r [leaks | all]] [-T @var{src_cache}] [-U] @var{filename}
 
 Perform a consistency check on the disk image @var{filename}. The command can
 output in the format @var{ofmt} which is either @code{human} or @code{json}.
-- 
1.8.3.1


