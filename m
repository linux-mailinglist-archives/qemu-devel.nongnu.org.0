Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D533D125E84
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 11:07:54 +0100 (CET)
Received: from localhost ([::1]:38120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihsin-0008Bg-Kx
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 05:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihsf8-0002nn-M7
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:04:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihsf6-00089S-KU
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:04:06 -0500
Received: from relay.sw.ru ([185.231.240.75]:57618)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihsev-0007bX-I0; Thu, 19 Dec 2019 05:03:53 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihset-0004j2-30; Thu, 19 Dec 2019 13:03:51 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 06/10] block/dirty-bitmap: add _next_dirty API
Date: Thu, 19 Dec 2019 13:03:44 +0300
Message-Id: <20191219100348.24827-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219100348.24827-1-vsementsov@virtuozzo.com>
References: <20191219100348.24827-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have bdrv_dirty_bitmap_next_zero, let's add corresponding
bdrv_dirty_bitmap_next_dirty, which is more comfortable to use than
bitmap iterators in some cases.

For test modify test_hbitmap_next_zero_check_range to check both
next_zero and next_dirty and add some new checks.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/dirty-bitmap.h |   2 +
 include/qemu/hbitmap.h       |  13 ++++
 block/dirty-bitmap.c         |   6 ++
 tests/test-hbitmap.c         | 130 ++++++++++++++++++++---------------
 util/hbitmap.c               |  60 ++++++++--------
 5 files changed, 126 insertions(+), 85 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 27c72cc56a..b1f0de12db 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -105,6 +105,8 @@ for (bitmap = bdrv_dirty_bitmap_first(bs); bitmap; \
      bitmap = bdrv_dirty_bitmap_next(bitmap))
 
 char *bdrv_dirty_bitmap_sha256(const BdrvDirtyBitmap *bitmap, Error **errp);
+int64_t bdrv_dirty_bitmap_next_dirty(BdrvDirtyBitmap *bitmap, int64_t offset,
+                                     int64_t bytes);
 int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, int64_t offset,
                                     int64_t bytes);
 bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index b6e85f3d5d..a4b032b270 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -297,6 +297,19 @@ void hbitmap_free(HBitmap *hb);
  */
 void hbitmap_iter_init(HBitmapIter *hbi, const HBitmap *hb, uint64_t first);
 
+/*
+ * hbitmap_next_dirty:
+ *
+ * Find next dirty bit within selected range. If not found, return -1.
+ *
+ * @hb: The HBitmap to operate on
+ * @start: The bit to start from.
+ * @count: Number of bits to proceed. If @start+@count > bitmap size, the whole
+ * bitmap is looked through. You can use UINT64_MAX as @count to search up to
+ * the bitmap end.
+ */
+int64_t hbitmap_next_dirty(const HBitmap *hb, int64_t start, int64_t count);
+
 /* hbitmap_next_zero:
  *
  * Find next not dirty bit within selected range. If not found, return -1.
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index af9f5411a6..1b14c8eb26 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -860,6 +860,12 @@ char *bdrv_dirty_bitmap_sha256(const BdrvDirtyBitmap *bitmap, Error **errp)
     return hbitmap_sha256(bitmap->bitmap, errp);
 }
 
+int64_t bdrv_dirty_bitmap_next_dirty(BdrvDirtyBitmap *bitmap, int64_t offset,
+                                     int64_t bytes)
+{
+    return hbitmap_next_dirty(bitmap->bitmap, offset, bytes);
+}
+
 int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, int64_t offset,
                                     int64_t bytes)
 {
diff --git a/tests/test-hbitmap.c b/tests/test-hbitmap.c
index 0e1e5c64dd..e3f1b3f361 100644
--- a/tests/test-hbitmap.c
+++ b/tests/test-hbitmap.c
@@ -816,92 +816,108 @@ static void test_hbitmap_iter_and_reset(TestHBitmapData *data,
     hbitmap_iter_next(&hbi);
 }
 
-static void test_hbitmap_next_zero_check_range(TestHBitmapData *data,
-                                               uint64_t start,
-                                               uint64_t count)
+static void test_hbitmap_next_x_check_range(TestHBitmapData *data,
+                                            uint64_t start,
+                                            uint64_t count)
 {
-    int64_t ret1 = hbitmap_next_zero(data->hb, start, count);
-    int64_t ret2 = start;
+    int64_t next_zero = hbitmap_next_zero(data->hb, start, count);
+    int64_t next_dirty = hbitmap_next_dirty(data->hb, start, count);
+    int64_t next;
     int64_t end = start >= data->size || data->size - start < count ?
                 data->size : start + count;
+    bool first_bit = hbitmap_get(data->hb, start);
 
-    for ( ; ret2 < end && hbitmap_get(data->hb, ret2); ret2++) {
+    for (next = start;
+         next < end && hbitmap_get(data->hb, next) == first_bit;
+         next++)
+    {
         ;
     }
-    if (ret2 == end) {
-        ret2 = -1;
+
+    if (next == end) {
+        next = -1;
     }
 
-    g_assert_cmpint(ret1, ==, ret2);
+    g_assert_cmpint(next_dirty, ==, first_bit ? start : next);
+    g_assert_cmpint(next_zero, ==, first_bit ? next : start);
 }
 
-static void test_hbitmap_next_zero_check(TestHBitmapData *data, int64_t start)
+static void test_hbitmap_next_x_check(TestHBitmapData *data, int64_t start)
 {
-    test_hbitmap_next_zero_check_range(data, start, INT64_MAX);
+    test_hbitmap_next_x_check_range(data, start, INT64_MAX);
 }
 
-static void test_hbitmap_next_zero_do(TestHBitmapData *data, int granularity)
+static void test_hbitmap_next_x_do(TestHBitmapData *data, int granularity)
 {
     hbitmap_test_init(data, L3, granularity);
-    test_hbitmap_next_zero_check(data, 0);
-    test_hbitmap_next_zero_check(data, L3 - 1);
-    test_hbitmap_next_zero_check_range(data, 0, 1);
-    test_hbitmap_next_zero_check_range(data, L3 - 1, 1);
+    test_hbitmap_next_x_check(data, 0);
+    test_hbitmap_next_x_check(data, L3 - 1);
+    test_hbitmap_next_x_check_range(data, 0, 1);
+    test_hbitmap_next_x_check_range(data, L3 - 1, 1);
 
     hbitmap_set(data->hb, L2, 1);
-    test_hbitmap_next_zero_check(data, 0);
-    test_hbitmap_next_zero_check(data, L2 - 1);
-    test_hbitmap_next_zero_check(data, L2);
-    test_hbitmap_next_zero_check(data, L2 + 1);
-    test_hbitmap_next_zero_check_range(data, 0, 1);
-    test_hbitmap_next_zero_check_range(data, 0, L2);
-    test_hbitmap_next_zero_check_range(data, L2 - 1, 1);
-    test_hbitmap_next_zero_check_range(data, L2 - 1, 2);
-    test_hbitmap_next_zero_check_range(data, L2, 1);
-    test_hbitmap_next_zero_check_range(data, L2 + 1, 1);
+    test_hbitmap_next_x_check(data, 0);
+    test_hbitmap_next_x_check(data, L2 - 1);
+    test_hbitmap_next_x_check(data, L2);
+    test_hbitmap_next_x_check(data, L2 + 1);
+    test_hbitmap_next_x_check_range(data, 0, 1);
+    test_hbitmap_next_x_check_range(data, 0, L2);
+    test_hbitmap_next_x_check_range(data, L2 - 1, 1);
+    test_hbitmap_next_x_check_range(data, L2 - 1, 2);
+    test_hbitmap_next_x_check_range(data, L2, 1);
+    test_hbitmap_next_x_check_range(data, L2 + 1, 1);
 
     hbitmap_set(data->hb, L2 + 5, L1);
-    test_hbitmap_next_zero_check(data, 0);
-    test_hbitmap_next_zero_check(data, L2 + 1);
-    test_hbitmap_next_zero_check(data, L2 + 2);
-    test_hbitmap_next_zero_check(data, L2 + 5);
-    test_hbitmap_next_zero_check(data, L2 + L1 - 1);
-    test_hbitmap_next_zero_check(data, L2 + L1);
-    test_hbitmap_next_zero_check_range(data, L2, 6);
-    test_hbitmap_next_zero_check_range(data, L2 + 1, 3);
-    test_hbitmap_next_zero_check_range(data, L2 + 4, L1);
-    test_hbitmap_next_zero_check_range(data, L2 + 5, L1);
+    test_hbitmap_next_x_check(data, 0);
+    test_hbitmap_next_x_check(data, L2 - L1);
+    test_hbitmap_next_x_check(data, L2 + 1);
+    test_hbitmap_next_x_check(data, L2 + 2);
+    test_hbitmap_next_x_check(data, L2 + 5);
+    test_hbitmap_next_x_check(data, L2 + L1 - 1);
+    test_hbitmap_next_x_check(data, L2 + L1);
+    test_hbitmap_next_x_check(data, L2 + L1 + 1);
+    test_hbitmap_next_x_check_range(data, L2 - 2, L1);
+    test_hbitmap_next_x_check_range(data, L2, 4);
+    test_hbitmap_next_x_check_range(data, L2, 6);
+    test_hbitmap_next_x_check_range(data, L2 + 1, 3);
+    test_hbitmap_next_x_check_range(data, L2 + 4, L1);
+    test_hbitmap_next_x_check_range(data, L2 + 5, L1);
+    test_hbitmap_next_x_check_range(data, L2 + 5 + L1 - 1, 1);
+    test_hbitmap_next_x_check_range(data, L2 + 5 + L1, 1);
+    test_hbitmap_next_x_check_range(data, L2 + 5 + L1 + 1, 1);
 
     hbitmap_set(data->hb, L2 * 2, L3 - L2 * 2);
-    test_hbitmap_next_zero_check(data, L2 * 2 - L1);
-    test_hbitmap_next_zero_check(data, L2 * 2 - 2);
-    test_hbitmap_next_zero_check(data, L2 * 2 - 1);
-    test_hbitmap_next_zero_check(data, L2 * 2);
-    test_hbitmap_next_zero_check(data, L3 - 1);
-    test_hbitmap_next_zero_check_range(data, L2 * 2 - L1, L1 + 1);
-    test_hbitmap_next_zero_check_range(data, L2 * 2, L2);
+    test_hbitmap_next_x_check(data, L2 * 2 - L1);
+    test_hbitmap_next_x_check(data, L2 * 2 - 2);
+    test_hbitmap_next_x_check(data, L2 * 2 - 1);
+    test_hbitmap_next_x_check(data, L2 * 2);
+    test_hbitmap_next_x_check(data, L2 * 2 + 1);
+    test_hbitmap_next_x_check(data, L2 * 2 + L1);
+    test_hbitmap_next_x_check(data, L3 - 1);
+    test_hbitmap_next_x_check_range(data, L2 * 2 - L1, L1 + 1);
+    test_hbitmap_next_x_check_range(data, L2 * 2, L2);
 
     hbitmap_set(data->hb, 0, L3);
-    test_hbitmap_next_zero_check(data, 0);
+    test_hbitmap_next_x_check(data, 0);
 }
 
-static void test_hbitmap_next_zero_0(TestHBitmapData *data, const void *unused)
+static void test_hbitmap_next_x_0(TestHBitmapData *data, const void *unused)
 {
-    test_hbitmap_next_zero_do(data, 0);
+    test_hbitmap_next_x_do(data, 0);
 }
 
-static void test_hbitmap_next_zero_4(TestHBitmapData *data, const void *unused)
+static void test_hbitmap_next_x_4(TestHBitmapData *data, const void *unused)
 {
-    test_hbitmap_next_zero_do(data, 4);
+    test_hbitmap_next_x_do(data, 4);
 }
 
-static void test_hbitmap_next_zero_after_truncate(TestHBitmapData *data,
-                                                  const void *unused)
+static void test_hbitmap_next_x_after_truncate(TestHBitmapData *data,
+                                               const void *unused)
 {
     hbitmap_test_init(data, L1, 0);
     hbitmap_test_truncate_impl(data, L1 * 2);
     hbitmap_set(data->hb, 0, L1);
-    test_hbitmap_next_zero_check(data, 0);
+    test_hbitmap_next_x_check(data, 0);
 }
 
 static void test_hbitmap_next_dirty_area_check(TestHBitmapData *data,
@@ -1068,12 +1084,12 @@ int main(int argc, char **argv)
     hbitmap_test_add("/hbitmap/iter/iter_and_reset",
                      test_hbitmap_iter_and_reset);
 
-    hbitmap_test_add("/hbitmap/next_zero/next_zero_0",
-                     test_hbitmap_next_zero_0);
-    hbitmap_test_add("/hbitmap/next_zero/next_zero_4",
-                     test_hbitmap_next_zero_4);
-    hbitmap_test_add("/hbitmap/next_zero/next_zero_after_truncate",
-                     test_hbitmap_next_zero_after_truncate);
+    hbitmap_test_add("/hbitmap/next_zero/next_x_0",
+                     test_hbitmap_next_x_0);
+    hbitmap_test_add("/hbitmap/next_zero/next_x_4",
+                     test_hbitmap_next_x_4);
+    hbitmap_test_add("/hbitmap/next_zero/next_x_after_truncate",
+                     test_hbitmap_next_x_after_truncate);
 
     hbitmap_test_add("/hbitmap/next_dirty_area/next_dirty_area_0",
                      test_hbitmap_next_dirty_area_0);
diff --git a/util/hbitmap.c b/util/hbitmap.c
index df22f06be6..d23f4b9678 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -193,6 +193,30 @@ void hbitmap_iter_init(HBitmapIter *hbi, const HBitmap *hb, uint64_t first)
     }
 }
 
+int64_t hbitmap_next_dirty(const HBitmap *hb, int64_t start, int64_t count)
+{
+    HBitmapIter hbi;
+    int64_t firt_dirty_off;
+    uint64_t end;
+
+    assert(start >= 0 && count >= 0);
+
+    if (start >= hb->orig_size || count == 0) {
+        return -1;
+    }
+
+    end = count > hb->orig_size - start ? hb->orig_size : start + count;
+
+    hbitmap_iter_init(&hbi, hb, start);
+    firt_dirty_off = hbitmap_iter_next(&hbi);
+
+    if (firt_dirty_off < 0 || firt_dirty_off >= end) {
+        return -1;
+    }
+
+    return MAX(start, firt_dirty_off);
+}
+
 int64_t hbitmap_next_zero(const HBitmap *hb, int64_t start, int64_t count)
 {
     size_t pos = (start >> hb->granularity) >> BITS_PER_LEVEL;
@@ -248,40 +272,20 @@ int64_t hbitmap_next_zero(const HBitmap *hb, int64_t start, int64_t count)
 
 bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t *start, int64_t *count)
 {
-    HBitmapIter hbi;
-    int64_t firt_dirty_off, area_end;
-    uint32_t granularity = 1UL << hb->granularity;
-    uint64_t end;
-
-    assert(*start >= 0 && *count >= 0);
-
-    if (*start >= hb->orig_size || *count == 0) {
-        return false;
-    }
-
-    end = *count > hb->orig_size - *start ? hb->orig_size : *start + *count;
-
-    hbitmap_iter_init(&hbi, hb, *start);
-    firt_dirty_off = hbitmap_iter_next(&hbi);
+    int64_t area_start, area_end;
 
-    if (firt_dirty_off < 0 || firt_dirty_off >= end) {
+    area_start = hbitmap_next_dirty(hb, *start, *count);
+    if (area_start < 0) {
         return false;
     }
 
-    if (firt_dirty_off + granularity >= end) {
-        area_end = end;
-    } else {
-        area_end = hbitmap_next_zero(hb, firt_dirty_off + granularity,
-                                     end - firt_dirty_off - granularity);
-        if (area_end < 0) {
-            area_end = end;
-        }
+    area_end = hbitmap_next_zero(hb, area_start, *start + *count - area_start);
+    if (area_end < 0) {
+        area_end = MIN(hb->orig_size, *start + *count);
     }
 
-    if (firt_dirty_off > *start) {
-        *start = firt_dirty_off;
-    }
-    *count = area_end - *start;
+    *start = area_start;
+    *count = area_end - area_start;
 
     return true;
 }
-- 
2.21.0


