Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B5131A3B9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 18:37:55 +0100 (CET)
Received: from localhost ([::1]:59828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcOA-0001Da-Ju
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 12:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lAcL3-0007Uf-J3
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:34:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lAcKy-0005lI-GM
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613151275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPBtbkYzBVGUiNvomTzlUjJ6P/WKBXin0NxArowiHXY=;
 b=Vi0DBoW8atCoothSGm0RTb6ZxcCi/lfej8w4utjwEhrun8GyBmz0s/wq8cQjFoc8hiVToZ
 FH0cwTR5LKTtAjLCISCXgksLl3lLkqS3RAmWllMfyMkidji/eyVwm9EHLqPAt0Ihh0Uh6b
 c9sR/zUc2o2yjfAmw/lGC/VvqcEYt5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-W6-JZt4GP_qiYS9WLQVCnQ-1; Fri, 12 Feb 2021 12:34:33 -0500
X-MC-Unique: W6-JZt4GP_qiYS9WLQVCnQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3461DC282;
 Fri, 12 Feb 2021 17:34:32 +0000 (UTC)
Received: from speedmetal.lan (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E960D5C23D;
 Fri, 12 Feb 2021 17:34:30 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] migration: dirty-bitmap: Allow control of bitmap
 persistence
Date: Fri, 12 Feb 2021 18:34:24 +0100
Message-Id: <b20afb675917b86f6359ac3591166ac6d4233573.1613150869.git.pkrempa@redhat.com>
In-Reply-To: <cover.1613150869.git.pkrempa@redhat.com>
References: <cover.1613150869.git.pkrempa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bitmap's source persistence is transported over the migration stream and
the destination mirrors it. In some cases the destination might want to
persist bitmaps which are not persistent on the source (e.g. the result
of merge of bitmaps from a number of layers on the source when migrating
into a squashed image) but currently it would need to create another set
of persistent bitmaps and merge them.

This patch adds a 'transform' property to the alias map which allows to
override the persistence of migrated bitmaps both on the source and
destination sides.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
---
 migration/block-dirty-bitmap.c | 30 +++++++++++++++++++++++++++---
 qapi/migration.json            | 19 ++++++++++++++++++-
 2 files changed, 45 insertions(+), 4 deletions(-)

v3:
 - adapted to full passtrhough of BitmapMigrationBitmapAlias into the
   map hash table (Vladimir)
 - schema and commit message language fixes (Eric)

v2:
 - grammar fixes (Eric)
 - added 'transform' object to group other possible transformations (Vladimir)
 - transformation can also be used on source (Vladimir)
 - put bmap_inner directly into DBMLoadState for deduplication  (Vladimir)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 0244f9bb1d..80781de5d8 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -150,6 +150,7 @@ typedef struct DBMLoadState {
     BdrvDirtyBitmap *bitmap;

     bool before_vm_start_handled; /* set in dirty_bitmap_mig_before_vm_start */
+    BitmapMigrationBitmapAlias *bmap_inner;

     /*
      * cancelled
@@ -528,6 +529,7 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
     }

     FOR_EACH_DIRTY_BITMAP(bs, bitmap) {
+        BitmapMigrationBitmapAliasTransform *bitmap_transform = NULL;
         bitmap_name = bdrv_dirty_bitmap_name(bitmap);
         if (!bitmap_name) {
             continue;
@@ -548,6 +550,9 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
             }

             bitmap_alias = bmap_inner->alias;
+            if (bmap_inner->has_transform) {
+                bitmap_transform = bmap_inner->transform;
+            }
         } else {
             if (strlen(bitmap_name) > UINT8_MAX) {
                 error_report("Cannot migrate bitmap '%s' on node '%s': "
@@ -573,8 +578,15 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
         if (bdrv_dirty_bitmap_enabled(bitmap)) {
             dbms->flags |= DIRTY_BITMAP_MIG_START_FLAG_ENABLED;
         }
-        if (bdrv_dirty_bitmap_get_persistence(bitmap)) {
-            dbms->flags |= DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
+        if (bitmap_transform &&
+            bitmap_transform->has_persistent) {
+            if (bitmap_transform->persistent) {
+                dbms->flags |= DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
+            }
+        } else {
+            if (bdrv_dirty_bitmap_get_persistence(bitmap)) {
+                dbms->flags |= DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
+            }
         }

         QSIMPLEQ_INSERT_TAIL(&s->dbms_list, dbms, entry);
@@ -782,6 +794,7 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
     uint32_t granularity = qemu_get_be32(f);
     uint8_t flags = qemu_get_byte(f);
     LoadBitmapState *b;
+    bool persistent;

     if (s->cancelled) {
         return 0;
@@ -806,7 +819,16 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
         return -EINVAL;
     }

-    if (flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT) {
+    if (s->bmap_inner &&
+        s->bmap_inner->has_transform &&
+        s->bmap_inner->transform &&
+        s->bmap_inner->transform->has_persistent) {
+        persistent = s->bmap_inner->transform->persistent;
+    } else {
+        persistent = flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
+    }
+
+    if (persistent) {
         bdrv_dirty_bitmap_set_persistence(s->bitmap, true);
     }

@@ -1090,6 +1112,8 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
             } else {
                 bitmap_name = bmap_inner->name;
             }
+
+            s->bmap_inner = bmap_inner;
         }

         if (!s->cancelled) {
diff --git a/qapi/migration.json b/qapi/migration.json
index ce14d78071..8a85a6d041 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -536,6 +536,19 @@
   'data': [ 'none', 'zlib',
             { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }

+##
+# @BitmapMigrationBitmapAliasTransform:
+#
+# @persistent: If present, the bitmap will be made persistent
+#              or transient depending on this parameter.
+#
+# Since: 6.0
+##
+{ 'struct': 'BitmapMigrationBitmapAliasTransform',
+  'data': {
+      '*persistent': 'bool'
+  } }
+
 ##
 # @BitmapMigrationBitmapAlias:
 #
@@ -544,12 +557,16 @@
 # @alias: An alias name for migration (for example the bitmap name on
 #         the opposite site).
 #
+# @transform: Allows to modify properties of the migrated bitmap.
+#             (since 6.0)
+#
 # Since: 5.2
 ##
 { 'struct': 'BitmapMigrationBitmapAlias',
   'data': {
       'name': 'str',
-      'alias': 'str'
+      'alias': 'str',
+      '*transform': 'BitmapMigrationBitmapAliasTransform'
   } }

 ##
-- 
2.29.2


