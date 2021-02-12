Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E5D31A847
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 00:25:11 +0100 (CET)
Received: from localhost ([::1]:43450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAhoE-0006YI-An
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 18:25:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAhlR-0004ga-SL
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 18:22:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAhlP-000619-UW
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 18:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613172135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VdSEoDOZbbnjSFp5z36yXbF6/ucjVRY7rw2sh+fZSgU=;
 b=OT092+logj2WcqxKs70gnU+deVNLcSx51hJhYXIOY67F8gQVgEI6zoSkGvlWSaLevzn/zx
 bPEoq5X9BNcfzhsS8mOmsEOgXkiLkempb6tB18wmpPTVmSoiVQK8KkMZ4xXt+ynMfRRO+R
 qIa//l9rLVsbHpJAjfGqYJCsKFl9m/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-peRK4CoGMvyEme6zEObIvw-1; Fri, 12 Feb 2021 18:21:43 -0500
X-MC-Unique: peRK4CoGMvyEme6zEObIvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F30D1E563;
 Fri, 12 Feb 2021 23:21:42 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 576A219D6C;
 Fri, 12 Feb 2021 23:21:41 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] migration: dirty-bitmap: Allow control of bitmap
 persistence
Date: Fri, 12 Feb 2021 17:21:31 -0600
Message-Id: <20210212232134.1462756-3-eblake@redhat.com>
In-Reply-To: <20210212232134.1462756-1-eblake@redhat.com>
References: <20210212232134.1462756-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Krempa <pkrempa@redhat.com>,
 "open list:Dirty Bitmaps" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Krempa <pkrempa@redhat.com>

Bitmap's source persistence is transported over the migration stream and
the destination mirrors it. In some cases the destination might want to
persist bitmaps which are not persistent on the source (e.g. the result
of merging bitmaps from a number of layers on the source when migrating
into a squashed image) but currently it would need to create another set
of persistent bitmaps and merge them.

This patch adds a 'transform' property to the alias map which allows
overriding the persistence of migrated bitmaps both on the source and
destination sides.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Message-Id: <b20afb675917b86f6359ac3591166ac6d4233573.1613150869.git.pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: grammar tweaks, drop dead conditional]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qapi/migration.json            | 19 ++++++++++++++++++-
 migration/block-dirty-bitmap.c | 29 ++++++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index ce14d78071a5..6e5943fbb443 100644
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
+# @transform: Allows the modification of the migrated bitmap.
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
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index b39c13ce4ebe..975093610a41 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -150,6 +150,7 @@ typedef struct DBMLoadState {
     BdrvDirtyBitmap *bitmap;

     bool before_vm_start_handled; /* set in dirty_bitmap_mig_before_vm_start */
+    BitmapMigrationBitmapAlias *bmap_inner;

     /*
      * cancelled
@@ -529,6 +530,7 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
     }

     FOR_EACH_DIRTY_BITMAP(bs, bitmap) {
+        BitmapMigrationBitmapAliasTransform *bitmap_transform = NULL;
         bitmap_name = bdrv_dirty_bitmap_name(bitmap);
         if (!bitmap_name) {
             continue;
@@ -549,6 +551,9 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
             }

             bitmap_alias = bmap_inner->alias;
+            if (bmap_inner->has_transform) {
+                bitmap_transform = bmap_inner->transform;
+            }
         } else {
             if (strlen(bitmap_name) > UINT8_MAX) {
                 error_report("Cannot migrate bitmap '%s' on node '%s': "
@@ -574,8 +579,15 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
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
@@ -783,6 +795,7 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
     uint32_t granularity = qemu_get_be32(f);
     uint8_t flags = qemu_get_byte(f);
     LoadBitmapState *b;
+    bool persistent;

     if (s->cancelled) {
         return 0;
@@ -807,7 +820,15 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
         return -EINVAL;
     }

-    if (flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT) {
+    if (s->bmap_inner &&
+        s->bmap_inner->has_transform &&
+        s->bmap_inner->transform->has_persistent) {
+        persistent = s->bmap_inner->transform->persistent;
+    } else {
+        persistent = flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
+    }
+
+    if (persistent) {
         bdrv_dirty_bitmap_set_persistence(s->bitmap, true);
     }

@@ -1091,6 +1112,8 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
             } else {
                 bitmap_name = bmap_inner->name;
             }
+
+            s->bmap_inner = bmap_inner;
         }

         if (!s->cancelled) {
-- 
2.30.1


