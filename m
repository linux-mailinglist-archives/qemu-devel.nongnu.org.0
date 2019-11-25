Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE948108E49
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 13:54:14 +0100 (CET)
Received: from localhost ([::1]:43278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZDsb-0007KX-CS
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 07:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iZDr6-00068f-Rz
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 07:52:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iZDr5-0008TU-PZ
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 07:52:40 -0500
Received: from relay.sw.ru ([185.231.240.75]:42312)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iZDr3-0008Ox-3w; Mon, 25 Nov 2019 07:52:37 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iZDqx-0007wx-AU; Mon, 25 Nov 2019 15:52:31 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] block/qcow2-bitmap: fix bitmap migration
Date: Mon, 25 Nov 2019 15:52:28 +0300
Message-Id: <20191125125229.13531-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191125125229.13531-1-vsementsov@virtuozzo.com>
References: <20191125125229.13531-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix bitmap migration with dirty-bitmaps capability enabled and shared
storage. We should ignore IN_USE bitmaps in the image on target, when
migrating bitmaps through migration channel, see new comment below.

Fixes: 74da6b943565c451
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-bitmap.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 809bbc5d20..8abaf632fc 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -988,7 +988,26 @@ bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp)
     }
 
     QSIMPLEQ_FOREACH(bm, bm_list, entry) {
-        BdrvDirtyBitmap *bitmap = load_bitmap(bs, bm, errp);
+        BdrvDirtyBitmap *bitmap;
+
+        if ((bm->flags & BME_FLAG_IN_USE) &&
+            bdrv_find_dirty_bitmap(bs, bm->name))
+        {
+            /*
+             * We already have corresponding BdrvDirtyBitmap, and bitmap in the
+             * image is marked IN_USE. Firstly, this state is valid, no reason
+             * to consider existing BdrvDirtyBitmap to be bad. Secondly it's
+             * absolutely possible, when we do migration with shared storage
+             * with dirty-bitmaps capability enabled: if the bitmap was loaded
+             * from this storage before migration start, the storage will
+             * of-course contain IN_USE outdated version of the bitmap, and we
+             * should not load it on migration target, as we already have this
+             * bitmap, being migrated.
+             */
+            continue;
+        }
+
+        bitmap = load_bitmap(bs, bm, errp);
         if (bitmap == NULL) {
             goto fail;
         }
-- 
2.21.0


