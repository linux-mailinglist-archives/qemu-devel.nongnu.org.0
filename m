Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBEF187883
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 05:40:06 +0100 (CET)
Received: from localhost ([::1]:52550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE41N-0002ax-JT
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 00:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51972)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jE405-0000Vn-P9
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 00:38:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jE403-00086W-Qw
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 00:38:45 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:45159)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jE403-00085T-Nd
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 00:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584419923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VaAFoqm52YsUqliURiVgvfFDyJQgBEAq3P+1a98RGJ4=;
 b=bsrPONCe7CUykluzSCgyJsY04zdfqrQgCePeurnyikG3R4sckc6gHVTKehFJw3Lz7BlsG8
 EQCegojQILWr7cFcKMT2voQE+UO79zxEyYOw5FLZ/ZgT0kMs5/sRbFU5Lb/TvY9kJltXg1
 4PzfepiLPaYc/osLwFShmQi+sTVdPbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-0myS0FiaP7WZThdqz3lsHQ-1; Tue, 17 Mar 2020 00:38:39 -0400
X-MC-Unique: 0myS0FiaP7WZThdqz3lsHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D96D6102CE1A;
 Tue, 17 Mar 2020 04:38:37 +0000 (UTC)
Received: from probe.redhat.com (ovpn-112-191.rdu2.redhat.com [10.10.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FC1010027A1;
 Tue, 17 Mar 2020 04:38:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 jsnow@redhat.com
Subject: [PULL 05/10] block/dirty-bitmap: switch _next_dirty_area and
 _next_zero to int64_t
Date: Tue, 17 Mar 2020 00:38:14 -0400
Message-Id: <20200317043819.20197-6-jsnow@redhat.com>
In-Reply-To: <20200317043819.20197-1-jsnow@redhat.com>
References: <20200317043819.20197-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to introduce bdrv_dirty_bitmap_next_dirty so that same
variable may be used to store its return value and to be its parameter,
so it would int64_t.

Similarly, we are going to refactor hbitmap_next_dirty_area to use
hbitmap_next_dirty together with hbitmap_next_zero, therefore we want
hbitmap_next_zero parameter type to be int64_t too.

So, for convenience update all parameters of *_next_zero and
*_next_dirty_area to be int64_t.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20200205112041.6003-6-vsementsov@virtuozzo.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 include/block/dirty-bitmap.h |  6 +++---
 include/qemu/hbitmap.h       |  7 +++----
 block/dirty-bitmap.c         |  6 +++---
 nbd/server.c                 |  2 +-
 tests/test-hbitmap.c         | 36 ++++++++++++++++++------------------
 util/hbitmap.c               | 13 ++++++++-----
 6 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index e2b20ecab9..27c72cc56a 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -105,10 +105,10 @@ for (bitmap =3D bdrv_dirty_bitmap_first(bs); bitmap; =
\
      bitmap =3D bdrv_dirty_bitmap_next(bitmap))
=20
 char *bdrv_dirty_bitmap_sha256(const BdrvDirtyBitmap *bitmap, Error **errp=
);
-int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, uint64_t offs=
et,
-                                    uint64_t bytes);
+int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, int64_t offse=
t,
+                                    int64_t bytes);
 bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
-                                       uint64_t *offset, uint64_t *bytes);
+                                       int64_t *offset, int64_t *bytes);
 BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap,
                                                   Error **errp);
=20
diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index df922d8517..b6e85f3d5d 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -304,10 +304,10 @@ void hbitmap_iter_init(HBitmapIter *hbi, const HBitma=
p *hb, uint64_t first);
  * @hb: The HBitmap to operate on
  * @start: The bit to start from.
  * @count: Number of bits to proceed. If @start+@count > bitmap size, the =
whole
- * bitmap is looked through. You can use UINT64_MAX as @count to search up=
 to
+ * bitmap is looked through. You can use INT64_MAX as @count to search up =
to
  * the bitmap end.
  */
-int64_t hbitmap_next_zero(const HBitmap *hb, uint64_t start, uint64_t coun=
t);
+int64_t hbitmap_next_zero(const HBitmap *hb, int64_t start, int64_t count)=
;
=20
 /* hbitmap_next_dirty_area:
  * @hb: The HBitmap to operate on
@@ -322,8 +322,7 @@ int64_t hbitmap_next_zero(const HBitmap *hb, uint64_t s=
tart, uint64_t count);
  * @offset and @bytes appropriately. Otherwise returns false and leaves @o=
ffset
  * and @bytes unchanged.
  */
-bool hbitmap_next_dirty_area(const HBitmap *hb, uint64_t *start,
-                             uint64_t *count);
+bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t *start, int64_t *c=
ount);
=20
 /**
  * hbitmap_iter_next:
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 7039e82520..af9f5411a6 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -860,14 +860,14 @@ char *bdrv_dirty_bitmap_sha256(const BdrvDirtyBitmap =
*bitmap, Error **errp)
     return hbitmap_sha256(bitmap->bitmap, errp);
 }
=20
-int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, uint64_t offs=
et,
-                                    uint64_t bytes)
+int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, int64_t offse=
t,
+                                    int64_t bytes)
 {
     return hbitmap_next_zero(bitmap->bitmap, offset, bytes);
 }
=20
 bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
-                                       uint64_t *offset, uint64_t *bytes)
+                                       int64_t *offset, int64_t *bytes)
 {
     return hbitmap_next_dirty_area(bitmap->bitmap, offset, bytes);
 }
diff --git a/nbd/server.c b/nbd/server.c
index 11a31094ff..3106aaf3b4 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2055,7 +2055,7 @@ static unsigned int bitmap_to_extents(BdrvDirtyBitmap=
 *bitmap, uint64_t offset,
         bool next_dirty =3D !dirty;
=20
         if (dirty) {
-            end =3D bdrv_dirty_bitmap_next_zero(bitmap, begin, UINT64_MAX)=
;
+            end =3D bdrv_dirty_bitmap_next_zero(bitmap, begin, INT64_MAX);
         } else {
             bdrv_set_dirty_iter(it, begin);
             end =3D bdrv_dirty_iter_next(it);
diff --git a/tests/test-hbitmap.c b/tests/test-hbitmap.c
index aeaa0b3f22..9d210dc18c 100644
--- a/tests/test-hbitmap.c
+++ b/tests/test-hbitmap.c
@@ -817,8 +817,8 @@ static void test_hbitmap_iter_and_reset(TestHBitmapData=
 *data,
 }
=20
 static void test_hbitmap_next_zero_check_range(TestHBitmapData *data,
-                                               uint64_t start,
-                                               uint64_t count)
+                                               int64_t start,
+                                               int64_t count)
 {
     int64_t ret1 =3D hbitmap_next_zero(data->hb, start, count);
     int64_t ret2 =3D start;
@@ -837,7 +837,7 @@ static void test_hbitmap_next_zero_check_range(TestHBit=
mapData *data,
=20
 static void test_hbitmap_next_zero_check(TestHBitmapData *data, int64_t st=
art)
 {
-    test_hbitmap_next_zero_check_range(data, start, UINT64_MAX);
+    test_hbitmap_next_zero_check_range(data, start, INT64_MAX);
 }
=20
 static void test_hbitmap_next_zero_do(TestHBitmapData *data, int granulari=
ty)
@@ -905,11 +905,11 @@ static void test_hbitmap_next_zero_after_truncate(Tes=
tHBitmapData *data,
 }
=20
 static void test_hbitmap_next_dirty_area_check(TestHBitmapData *data,
-                                               uint64_t offset,
-                                               uint64_t count)
+                                               int64_t offset,
+                                               int64_t count)
 {
-    uint64_t off1, off2;
-    uint64_t len1 =3D 0, len2;
+    int64_t off1, off2;
+    int64_t len1 =3D 0, len2;
     bool ret1, ret2;
     int64_t end;
=20
@@ -945,24 +945,24 @@ static void test_hbitmap_next_dirty_area_do(TestHBitm=
apData *data,
                                             int granularity)
 {
     hbitmap_test_init(data, L3, granularity);
-    test_hbitmap_next_dirty_area_check(data, 0, UINT64_MAX);
+    test_hbitmap_next_dirty_area_check(data, 0, INT64_MAX);
     test_hbitmap_next_dirty_area_check(data, 0, 1);
     test_hbitmap_next_dirty_area_check(data, L3 - 1, 1);
=20
     hbitmap_set(data->hb, L2, 1);
     test_hbitmap_next_dirty_area_check(data, 0, 1);
     test_hbitmap_next_dirty_area_check(data, 0, L2);
-    test_hbitmap_next_dirty_area_check(data, 0, UINT64_MAX);
-    test_hbitmap_next_dirty_area_check(data, L2 - 1, UINT64_MAX);
+    test_hbitmap_next_dirty_area_check(data, 0, INT64_MAX);
+    test_hbitmap_next_dirty_area_check(data, L2 - 1, INT64_MAX);
     test_hbitmap_next_dirty_area_check(data, L2 - 1, 1);
     test_hbitmap_next_dirty_area_check(data, L2 - 1, 2);
     test_hbitmap_next_dirty_area_check(data, L2 - 1, 3);
-    test_hbitmap_next_dirty_area_check(data, L2, UINT64_MAX);
+    test_hbitmap_next_dirty_area_check(data, L2, INT64_MAX);
     test_hbitmap_next_dirty_area_check(data, L2, 1);
     test_hbitmap_next_dirty_area_check(data, L2 + 1, 1);
=20
     hbitmap_set(data->hb, L2 + 5, L1);
-    test_hbitmap_next_dirty_area_check(data, 0, UINT64_MAX);
+    test_hbitmap_next_dirty_area_check(data, 0, INT64_MAX);
     test_hbitmap_next_dirty_area_check(data, L2 - 2, 8);
     test_hbitmap_next_dirty_area_check(data, L2 + 1, 5);
     test_hbitmap_next_dirty_area_check(data, L2 + 1, 3);
@@ -974,16 +974,16 @@ static void test_hbitmap_next_dirty_area_do(TestHBitm=
apData *data,
     test_hbitmap_next_dirty_area_check(data, L2 + 1, 0);
=20
     hbitmap_set(data->hb, L2 * 2, L3 - L2 * 2);
-    test_hbitmap_next_dirty_area_check(data, 0, UINT64_MAX);
-    test_hbitmap_next_dirty_area_check(data, L2, UINT64_MAX);
-    test_hbitmap_next_dirty_area_check(data, L2 + 1, UINT64_MAX);
-    test_hbitmap_next_dirty_area_check(data, L2 + 5 + L1 - 1, UINT64_MAX);
+    test_hbitmap_next_dirty_area_check(data, 0, INT64_MAX);
+    test_hbitmap_next_dirty_area_check(data, L2, INT64_MAX);
+    test_hbitmap_next_dirty_area_check(data, L2 + 1, INT64_MAX);
+    test_hbitmap_next_dirty_area_check(data, L2 + 5 + L1 - 1, INT64_MAX);
     test_hbitmap_next_dirty_area_check(data, L2 + 5 + L1, 5);
     test_hbitmap_next_dirty_area_check(data, L2 * 2 - L1, L1 + 1);
     test_hbitmap_next_dirty_area_check(data, L2 * 2, L2);
=20
     hbitmap_set(data->hb, 0, L3);
-    test_hbitmap_next_dirty_area_check(data, 0, UINT64_MAX);
+    test_hbitmap_next_dirty_area_check(data, 0, INT64_MAX);
 }
=20
 static void test_hbitmap_next_dirty_area_0(TestHBitmapData *data,
@@ -1010,7 +1010,7 @@ static void test_hbitmap_next_dirty_area_after_trunca=
te(TestHBitmapData *data,
     hbitmap_test_init(data, L1, 0);
     hbitmap_test_truncate_impl(data, L1 * 2);
     hbitmap_set(data->hb, L1 + 1, 1);
-    test_hbitmap_next_dirty_area_check(data, 0, UINT64_MAX);
+    test_hbitmap_next_dirty_area_check(data, 0, INT64_MAX);
 }
=20
 int main(int argc, char **argv)
diff --git a/util/hbitmap.c b/util/hbitmap.c
index b6d4b99a06..df22f06be6 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -193,7 +193,7 @@ void hbitmap_iter_init(HBitmapIter *hbi, const HBitmap =
*hb, uint64_t first)
     }
 }
=20
-int64_t hbitmap_next_zero(const HBitmap *hb, uint64_t start, uint64_t coun=
t)
+int64_t hbitmap_next_zero(const HBitmap *hb, int64_t start, int64_t count)
 {
     size_t pos =3D (start >> hb->granularity) >> BITS_PER_LEVEL;
     unsigned long *last_lev =3D hb->levels[HBITMAP_LEVELS - 1];
@@ -202,6 +202,8 @@ int64_t hbitmap_next_zero(const HBitmap *hb, uint64_t s=
tart, uint64_t count)
     uint64_t end_bit, sz;
     int64_t res;
=20
+    assert(start >=3D 0 && count >=3D 0);
+
     if (start >=3D hb->orig_size || count =3D=3D 0) {
         return -1;
     }
@@ -244,14 +246,15 @@ int64_t hbitmap_next_zero(const HBitmap *hb, uint64_t=
 start, uint64_t count)
     return res;
 }
=20
-bool hbitmap_next_dirty_area(const HBitmap *hb, uint64_t *start,
-                             uint64_t *count)
+bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t *start, int64_t *c=
ount)
 {
     HBitmapIter hbi;
     int64_t firt_dirty_off, area_end;
     uint32_t granularity =3D 1UL << hb->granularity;
     uint64_t end;
=20
+    assert(*start >=3D 0 && *count >=3D 0);
+
     if (*start >=3D hb->orig_size || *count =3D=3D 0) {
         return false;
     }
@@ -834,8 +837,8 @@ bool hbitmap_can_merge(const HBitmap *a, const HBitmap =
*b)
  */
 static void hbitmap_sparse_merge(HBitmap *dst, const HBitmap *src)
 {
-    uint64_t offset =3D 0;
-    uint64_t count =3D src->orig_size;
+    int64_t offset =3D 0;
+    int64_t count =3D src->orig_size;
=20
     while (hbitmap_next_dirty_area(src, &offset, &count)) {
         hbitmap_set(dst, offset, count);
--=20
2.21.1


