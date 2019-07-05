Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8295EF14
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 00:17:50 +0200 (CEST)
Received: from localhost ([::1]:41412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hinZV-0005Mr-VN
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 18:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46274)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hinFF-0005ws-NY
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:56:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hinFD-0004Jv-Nm
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:56:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43304)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hinEw-00047a-6h; Wed, 03 Jul 2019 17:56:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 75C08C01F28C;
 Wed,  3 Jul 2019 21:56:33 +0000 (UTC)
Received: from probe.redhat.com (ovpn-123-117.rdu2.redhat.com [10.10.123.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8C595235E;
 Wed,  3 Jul 2019 21:56:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 17:55:33 -0400
Message-Id: <20190703215542.16123-10-jsnow@redhat.com>
In-Reply-To: <20190703215542.16123-1-jsnow@redhat.com>
References: <20190703215542.16123-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 03 Jul 2019 21:56:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 09/18] block/dirty-bitmap: add
 bdrv_dirty_bitmap_merge_internal
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
 vsementsov@virtuozzo.com, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm surprised it didn't come up sooner, but sometimes we have a +busy
bitmap as a source. This is dangerous from the QMP API, but if we are
the owner that marked the bitmap busy, it's safe to merge it using it as
a read only source.

It is not safe in the general case to allow users to read from in-use
bitmaps, so create an internal variant that foregoes the safety
checking.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 block/dirty-bitmap.c      | 51 +++++++++++++++++++++++++++++++++------
 include/block/block_int.h |  3 +++
 2 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 95a9c2a5d8..b0f76826b3 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -810,11 +810,15 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBit=
map *bitmap,
     return hbitmap_next_dirty_area(bitmap->bitmap, offset, bytes);
 }
=20
+/**
+ * bdrv_merge_dirty_bitmap: merge src into dest.
+ * Ensures permissions on bitmaps are reasonable; use for public API.
+ *
+ * @backup: If provided, make a copy of dest here prior to merge.
+ */
 void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitma=
p *src,
                              HBitmap **backup, Error **errp)
 {
-    bool ret;
-
     qemu_mutex_lock(dest->mutex);
     if (src->mutex !=3D dest->mutex) {
         qemu_mutex_lock(src->mutex);
@@ -833,6 +837,37 @@ void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, =
const BdrvDirtyBitmap *src,
         goto out;
     }
=20
+    assert(bdrv_dirty_bitmap_merge_internal(dest, src, backup, false));
+
+out:
+    qemu_mutex_unlock(dest->mutex);
+    if (src->mutex !=3D dest->mutex) {
+        qemu_mutex_unlock(src->mutex);
+    }
+}
+
+/**
+ * bdrv_dirty_bitmap_merge_internal: merge src into dest.
+ * Does NOT check bitmap permissions; not suitable for use as public API=
.
+ *
+ * @backup: If provided, make a copy of dest here prior to merge.
+ * @lock: If true, lock and unlock bitmaps on the way in/out.
+ * returns true if the merge succeeded; false if unattempted.
+ */
+bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
+                                      const BdrvDirtyBitmap *src,
+                                      HBitmap **backup,
+                                      bool lock)
+{
+    bool ret;
+
+    if (lock) {
+        qemu_mutex_lock(dest->mutex);
+        if (src->mutex !=3D dest->mutex) {
+            qemu_mutex_lock(src->mutex);
+        }
+    }
+
     if (backup) {
         *backup =3D dest->bitmap;
         dest->bitmap =3D hbitmap_alloc(dest->size, hbitmap_granularity(*=
backup));
@@ -840,11 +875,13 @@ void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest,=
 const BdrvDirtyBitmap *src,
     } else {
         ret =3D hbitmap_merge(dest->bitmap, src->bitmap, dest->bitmap);
     }
-    assert(ret);
=20
-out:
-    qemu_mutex_unlock(dest->mutex);
-    if (src->mutex !=3D dest->mutex) {
-        qemu_mutex_unlock(src->mutex);
+    if (lock) {
+        qemu_mutex_unlock(dest->mutex);
+        if (src->mutex !=3D dest->mutex) {
+            qemu_mutex_unlock(src->mutex);
+        }
     }
+
+    return ret;
 }
diff --git a/include/block/block_int.h b/include/block/block_int.h
index e1f2aa627e..83ffdf4950 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1238,6 +1238,9 @@ void bdrv_set_dirty(BlockDriverState *bs, int64_t o=
ffset, int64_t bytes);
=20
 void bdrv_clear_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap **out);
 void bdrv_restore_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap *backup)=
;
+bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
+                                      const BdrvDirtyBitmap *src,
+                                      HBitmap **backup, bool lock);
=20
 void bdrv_inc_in_flight(BlockDriverState *bs);
 void bdrv_dec_in_flight(BlockDriverState *bs);
--=20
2.21.0


