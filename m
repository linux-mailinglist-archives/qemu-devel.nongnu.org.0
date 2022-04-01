Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F41C4EEB18
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 12:17:00 +0200 (CEST)
Received: from localhost ([::1]:58564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naEKx-0001Vc-91
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 06:16:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naECg-0003ay-Av
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:08:26 -0400
Received: from [2a00:1450:4864:20::12b] (port=36475
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naECd-0006FT-56
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:08:26 -0400
Received: by mail-lf1-x12b.google.com with SMTP id bt26so3999029lfb.3
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 03:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LSED6ek/xHvvOR9/c6W01Ly4bux3Ewnuzt82i0gQSsw=;
 b=CiodGJX2gYAb6SKAYmmjsiExHPrE1NxijeruZZs4bofWF+vO6T5J82RyNffzpyQOAB
 IWPKELy9KS1jjfVb9TpM2ZqDCIZZ0jnluN44gSF2L7AaLhpTepkxDJ6c3fke/RBErxFi
 v2aBFxol7Zuzwts0+9Y7oQ5jafeweYv8XvqG8QhevY09ZFMoIMohTAbG/TP5WgeJ60Pk
 StFgOe/KEFMmq8C4/8ihMwkP3iAchOsL0Tivi728rvuCWbDeTn1sWT8Hz066oH99sMoo
 lBm9qcMhrQ84UkYPgRx9TRIEVDtYmy1g4ByirI0sT7kuRRynoDpHBLZctjzi1+qIO1LE
 ysPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LSED6ek/xHvvOR9/c6W01Ly4bux3Ewnuzt82i0gQSsw=;
 b=OCAln2KQzYYCP3n8L0p5Hy4Ah+nMKVYkuzih/FcWtZ8JKNxc9vjc/gHhl8A3xwgqTP
 jkTLh2Iq19m2zoOjpEeSCSL5c8AXXSJAHrrnS24p3bK0X/1neRQQBYVoBvKPtA03blzu
 FidnmUNGcRqHQ61yiF9ST2X53fbp8wHKOimGtaE6BW5qWHIV8z4nVqoizWoo2Yx1PSJg
 wnkS4XlC2xo425PiZHy8qm5axcn9qAtYld5gkFg4uUN+jtM+ohnpndr4LCTZFZX9Reks
 QcWjwiwXNeQByh+7bSZeZIPoW2rkMARN+ORE7JPv3zNcgFAYtdl7T6lqghVUIatxAgBy
 +MRQ==
X-Gm-Message-State: AOAM530aQQ+RX91nEQkGHP69ADemQ7ZF/E3Hj4Xy8IHbwHFXMsOqz9Kl
 4BaOYrPj6SePGoVVbsjG6msggQVTYApsEw==
X-Google-Smtp-Source: ABdhPJx0RtzQ/oaTnC6/loaYjXh82EqV1h9p1Tq06I0ixy5Z8kZaaS8XaFBNeqMMcHGIVoZ5uYqhfw==
X-Received: by 2002:a05:6512:1115:b0:44a:446a:ee65 with SMTP id
 l21-20020a056512111500b0044a446aee65mr13665680lfg.600.1648807701384; 
 Fri, 01 Apr 2022 03:08:21 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 a3-20020a195f43000000b0044a997dea6bsm197508lfj.288.2022.04.01.03.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 03:08:21 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v3 3/3] block: simplify handling of try to merge different
 sized bitmaps
Date: Fri,  1 Apr 2022 13:08:04 +0300
Message-Id: <20220401100804.315728-4-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401100804.315728-1-vsementsov@openvz.org>
References: <20220401100804.315728-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, nikita.lapshin@virtuozzo.com,
 eblake@redhat.com, qemu-devel@nongnu.org, hreitz@redhat.com,
 vsementsov@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
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


