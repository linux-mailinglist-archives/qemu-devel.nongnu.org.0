Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC16A52A052
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 13:23:37 +0200 (CEST)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqvIe-0005lO-Tw
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 07:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqv7q-0005yA-9j; Tue, 17 May 2022 07:12:27 -0400
Received: from smtp60.i.mail.ru ([217.69.128.40]:47920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqv7m-0006ck-My; Tue, 17 May 2022 07:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=F97noarA6sQtasLZKFD6CpxHuA6P72tlTOEHWTDiJ10=; 
 t=1652785942;x=1653391342; 
 b=o7U3Hx1MlHmC/24qbtYbM3MJCPeKNdz2vQaEl5xzCQiOhljzB8NSTAD8Adn/RvEBfV28Y3KBhWzKn2MbNzaEDtOqVF/iG5r9mmxYMXoJJTJUHEB3CUxqTfQphFLEiA29JgsZcmCsbXYxynoiazJko1uOIAIImIIh0BMYZIBRyslOXfyxVjH2Twu+7QOfrkRR7SUH62GI87XibYAnq9+kllkhyAUxodGUA4iNFwvCs3Ia75NXXZuXEKOfun41FTDaENwr6I0aW8ES6Ai0BP8FbipRVgEilK/6cgZGIlXL5uVvpPqC9POV0an9yvofee2F4ChYlpE4+ecqQT/x5hO18g==;
Received: by smtp60.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nqv7j-0000gZ-Cy; Tue, 17 May 2022 14:12:19 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PATCH v4 3/3] block: simplify handling of try to merge different
 sized bitmaps
Date: Tue, 17 May 2022 14:12:06 +0300
Message-Id: <20220517111206.23585-4-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517111206.23585-1-v.sementsov-og@mail.ru>
References: <20220517111206.23585-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp60.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9F33B3806BF114D159E7BD6746107077164F3C96AD71A0548182A05F5380850404C228DA9ACA6FE279E9E09E4BEACFDAAFBE131CEB22D38A46F8A4170A416843F34983572610A3C9E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE797F4D2EDC29AFAF7EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637BD7DFB1CDE6DDE538638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D84A76FF60AA8E232B9039DF19F01E1DED6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78A0F7C24A37A3D769FA2833FD35BB23D9E625A9149C048EE26055571C92BF10FBDFBBEFFF4125B51D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B05EF1B56D39DD5F7389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F790063734032FEA597FA516D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE70DB7A41A747CC8E1EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C33E10B8FB1984732735872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C4C7A0BC55FA0FE5FCADF0C5300679BDA76F34F224E2F626185823B7F2EE52A235B1881A6453793CE9C32612AADDFBE0614869453249F34FA4C627013B076BABB6939BCEF9C803809F250ECE3C382DB3F9DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3457FA942CB4462B4C6E50531A0D9814619CDA90DB010BD21FF1C81AB120B1098AD5C4AEB1BA9A2FD31D7E09C32AA3244CC1DADF74B566720E45F6DDBD79FEBA0FD08D48398F32B4A627AC49D2B05FCCD8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3fsA429394O6iODQeOHpsg==
X-Mailru-Sender: 6C3E74F07C41AE9425C26D04B7325D44E891999DDF3A5D6108D809B65C5C842D9836823514443C75E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.40;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp60.i.mail.ru
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL=1.31, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
2.35.1


