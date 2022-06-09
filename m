Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFB3545509
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 21:34:37 +0200 (CEST)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNvN-00056R-Vw
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 15:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLro-0007st-Qe
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLrd-0003fS-T3
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654795338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DE5UCP5pNfGXGkh5ZThekVOIeguC4S8UclRTHWHGJYs=;
 b=K6AzXhrrBXrghi3Tk9UQrM/jiHHx3829VoT/eP+1eTsQd1IVSbP39hnDto9ILsimOju+xx
 JdbHnxM660K4AxEXkj2ZYbGAMWHc9FOfjKJK78jCmPd1043tAtSy3Jy8yG5U1abje9a1WR
 w8PbuSErNvyozPBRuQEP3yYRKHLKFg4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-2e1m6ZdIMdaULcJcwt10yw-1; Thu, 09 Jun 2022 13:22:17 -0400
X-MC-Unique: 2e1m6ZdIMdaULcJcwt10yw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 062601E7DCCA;
 Thu,  9 Jun 2022 17:22:17 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 628E4404E4B2;
 Thu,  9 Jun 2022 17:22:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 05/18] block: simplify handling of try to merge different sized
 bitmaps
Date: Thu,  9 Jun 2022 19:21:36 +0200
Message-Id: <20220609172149.293877-6-kwolf@redhat.com>
In-Reply-To: <20220609172149.293877-1-kwolf@redhat.com>
References: <20220609172149.293877-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

We have too much logic to simply check that bitmaps are of the same
size. Let's just define that hbitmap_merge() and
bdrv_dirty_bitmap_merge_internal() require their argument bitmaps be of
same size, this simplifies things.

Let's look through the callers:

For backup_init_bcs_bitmap() we already assert that merge can't fail.

In bdrv_reclaim_dirty_bitmap_locked() we gracefully handle the error
that can't happen: successor always has same size as its parent, drop
this logic.

In bdrv_merge_dirty_bitmap() we already has assertion and separate
check. Make the check explicit and improve error message.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220517111206.23585-4-v.sementsov-og@mail.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-io.h |  2 +-
 include/qemu/hbitmap.h       | 15 ++-------------
 block/backup.c               |  6 ++----
 block/dirty-bitmap.c         | 26 +++++++++++---------------
 util/hbitmap.c               | 25 +++++++------------------
 5 files changed, 23 insertions(+), 51 deletions(-)

diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index bb454200e5..ded29e7494 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -102,7 +102,7 @@ bool blk_dev_is_tray_open(BlockBackend *blk);
 void bdrv_set_dirty(BlockDriverState *bs, int64_t offset, int64_t bytes);
 
 void bdrv_clear_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap **out);
-bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
+void bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
                                       const BdrvDirtyBitmap *src,
                                       HBitmap **backup, bool lock);
 
diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 5bd986aa44..af4e4ab746 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -76,20 +76,9 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size);
  *
  * Store result of merging @a and @b into @result.
  * @result is allowed to be equal to @a or @b.
- *
- * Return true if the merge was successful,
- *        false if it was not attempted.
- */
-bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result);
-
-/**
- * hbitmap_can_merge:
- *
- * hbitmap_can_merge(a, b) && hbitmap_can_merge(a, result) is sufficient and
- * necessary for hbitmap_merge will not fail.
- *
+ * All bitmaps must have same size.
  */
-bool hbitmap_can_merge(const HBitmap *a, const HBitmap *b);
+void hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result);
 
 /**
  * hbitmap_empty:
diff --git a/block/backup.c b/block/backup.c
index 5cfd0b999c..b2b649e305 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -228,15 +228,13 @@ out:
 
 static void backup_init_bcs_bitmap(BackupBlockJob *job)
 {
-    bool ret;
     uint64_t estimate;
     BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(job->bcs);
 
     if (job->sync_mode == MIRROR_SYNC_MODE_BITMAP) {
         bdrv_clear_dirty_bitmap(bcs_bitmap, NULL);
-        ret = bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap,
-                                               NULL, true);
-        assert(ret);
+        bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap, NULL,
+                                         true);
     } else if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
         /*
          * We can't hog the coroutine to initialize this thoroughly.
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index da1b91166f..bf3dc0512a 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -309,10 +309,7 @@ BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *parent,
         return NULL;
     }
 
-    if (!hbitmap_merge(parent->bitmap, successor->bitmap, parent->bitmap)) {
-        error_setg(errp, "Merging of parent and successor bitmap failed");
-        return NULL;
-    }
+    hbitmap_merge(parent->bitmap, successor->bitmap, parent->bitmap);
 
     parent->disabled = successor->disabled;
     parent->busy = false;
@@ -912,13 +909,15 @@ bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
         goto out;
     }
 
-    if (!hbitmap_can_merge(dest->bitmap, src->bitmap)) {
-        error_setg(errp, "Bitmaps are incompatible and can't be merged");
+    if (bdrv_dirty_bitmap_size(src) != bdrv_dirty_bitmap_size(dest)) {
+        error_setg(errp, "Bitmaps are of different sizes (destination size is %"
+                   PRId64 ", source size is %" PRId64 ") and can't be merged",
+                   bdrv_dirty_bitmap_size(dest), bdrv_dirty_bitmap_size(src));
         goto out;
     }
 
-    ret = bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
-    assert(ret);
+    bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
+    ret = true;
 
 out:
     bdrv_dirty_bitmaps_unlock(dest->bs);
@@ -932,17 +931,16 @@ out:
 /**
  * bdrv_dirty_bitmap_merge_internal: merge src into dest.
  * Does NOT check bitmap permissions; not suitable for use as public API.
+ * @dest, @src and @backup (if not NULL) must have same size.
  *
  * @backup: If provided, make a copy of dest here prior to merge.
  * @lock: If true, lock and unlock bitmaps on the way in/out.
- * returns true if the merge succeeded; false if unattempted.
  */
-bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
+void bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
                                       const BdrvDirtyBitmap *src,
                                       HBitmap **backup,
                                       bool lock)
 {
-    bool ret;
     IO_CODE();
 
     assert(!bdrv_dirty_bitmap_readonly(dest));
@@ -959,9 +957,9 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
     if (backup) {
         *backup = dest->bitmap;
         dest->bitmap = hbitmap_alloc(dest->size, hbitmap_granularity(*backup));
-        ret = hbitmap_merge(*backup, src->bitmap, dest->bitmap);
+        hbitmap_merge(*backup, src->bitmap, dest->bitmap);
     } else {
-        ret = hbitmap_merge(dest->bitmap, src->bitmap, dest->bitmap);
+        hbitmap_merge(dest->bitmap, src->bitmap, dest->bitmap);
     }
 
     if (lock) {
@@ -970,6 +968,4 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
             bdrv_dirty_bitmaps_unlock(src->bs);
         }
     }
-
-    return ret;
 }
diff --git a/util/hbitmap.c b/util/hbitmap.c
index ea989e1f0e..297db35fb1 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -873,11 +873,6 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size)
     }
 }
 
-bool hbitmap_can_merge(const HBitmap *a, const HBitmap *b)
-{
-    return (a->orig_size == b->orig_size);
-}
-
 /**
  * hbitmap_sparse_merge: performs dst = dst | src
  * works with differing granularities.
@@ -901,28 +896,24 @@ static void hbitmap_sparse_merge(HBitmap *dst, const HBitmap *src)
  * Given HBitmaps A and B, let R := A (BITOR) B.
  * Bitmaps A and B will not be modified,
  *     except when bitmap R is an alias of A or B.
- *
- * @return true if the merge was successful,
- *         false if it was not attempted.
+ * Bitmaps must have same size.
  */
-bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
+void hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
 {
     int i;
     uint64_t j;
 
-    if (!hbitmap_can_merge(a, b) || !hbitmap_can_merge(a, result)) {
-        return false;
-    }
-    assert(hbitmap_can_merge(b, result));
+    assert(a->orig_size == result->orig_size);
+    assert(b->orig_size == result->orig_size);
 
     if ((!hbitmap_count(a) && result == b) ||
         (!hbitmap_count(b) && result == a)) {
-        return true;
+        return;
     }
 
     if (!hbitmap_count(a) && !hbitmap_count(b)) {
         hbitmap_reset_all(result);
-        return true;
+        return;
     }
 
     if (a->granularity != b->granularity) {
@@ -935,7 +926,7 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
         if (b != result) {
             hbitmap_sparse_merge(result, b);
         }
-        return true;
+        return;
     }
 
     /* This merge is O(size), as BITS_PER_LONG and HBITMAP_LEVELS are constant.
@@ -951,8 +942,6 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
 
     /* Recompute the dirty count */
     result->count = hb_count_between(result, 0, result->size - 1);
-
-    return true;
 }
 
 char *hbitmap_sha256(const HBitmap *bitmap, Error **errp)
-- 
2.35.3


