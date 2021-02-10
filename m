Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E3F316C3F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:14:20 +0100 (CET)
Received: from localhost ([::1]:58842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9t4F-0000Km-Sd
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l9sk8-0003Rv-PY
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:53:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l9sk5-00035Q-4m
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612976008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Gi8T+Qi5HIh2n6tIGEzELbmRSeFkugTlBDt1y9IxNY=;
 b=Vj0X1WYvrPxs/5Nw1/2xe8mT+zHQAsGQ7IvPWnCOiS2qKQc04btNoA8YZNcZo2PX8tVe7S
 D9wc6nQ437I7OVvUnikG20/YkEHYoS1pLEGqa6dqQQz1jgR3gR5hY2E/6B46+Rlq4p7AM0
 qQVfLVa6h816xdahn0C250br7x4z5cE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-szt0m5f-MImQJDmUAwjYqg-1; Wed, 10 Feb 2021 11:53:25 -0500
X-MC-Unique: szt0m5f-MImQJDmUAwjYqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61AFF192CC46;
 Wed, 10 Feb 2021 16:53:24 +0000 (UTC)
Received: from speedmetal.lan (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D693770477;
 Wed, 10 Feb 2021 16:53:22 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] migration: dirty-bitmap: Allow control of bitmap
 persistance
Date: Wed, 10 Feb 2021 17:53:17 +0100
Message-Id: <e7bdfa1463cbcfc5a9458d98625f8b3dbe55a3b1.1612953419.git.pkrempa@redhat.com>
In-Reply-To: <cover.1612953419.git.pkrempa@redhat.com>
References: <cover.1612953419.git.pkrempa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bitmap's source persistance is transported over the migration stream and
the destination mirrors it. In some cases the destination might want to
persist bitmaps which are not persistent on the source (e.g. the result
of merge of bitmaps from a number of layers on the source when migrating
into a squashed image) but currently it would need to create another set
of persistent bitmaps and merge them.

This patch adds a 'transform' property to the alias map which allows to
override the persistance of migrated bitmaps both on the source and
destination sides.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
---

v2:
 - grammar fixes (Eric)
 - added 'transform' object to group other possible transformations (Vladimir)
 - transformation can also be used on source (Vladimir)
 - put bmap_inner directly into DBMLoadState for deduplication  (Vladimir)

 migration/block-dirty-bitmap.c | 38 +++++++++++++++++++++++++++-------
 qapi/migration.json            | 20 +++++++++++++++++-
 2 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 0169f672df..a05bf74073 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -138,6 +138,13 @@ typedef struct LoadBitmapState {
     bool enabled;
 } LoadBitmapState;

+typedef struct AliasMapInnerBitmap {
+    char *string;
+
+    /* 'transform' properties borrowed from QAPI */
+    BitmapMigrationBitmapAliasTransform *transform;
+} AliasMapInnerBitmap;
+
 /* State of the dirty bitmap migration (DBM) during load process */
 typedef struct DBMLoadState {
     uint32_t flags;
@@ -148,6 +155,7 @@ typedef struct DBMLoadState {
     BdrvDirtyBitmap *bitmap;

     bool before_vm_start_handled; /* set in dirty_bitmap_mig_before_vm_start */
+    AliasMapInnerBitmap *bmap_inner;

     /*
      * cancelled
@@ -169,10 +177,6 @@ typedef struct DBMState {

 static DBMState dbm_state;

-typedef struct AliasMapInnerBitmap {
-    char *string;
-} AliasMapInnerBitmap;
-
 static void free_alias_map_inner_bitmap(void *amin_ptr)
 {
     AliasMapInnerBitmap *amin = amin_ptr;
@@ -330,6 +334,7 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,

             bmap_inner = g_new0(AliasMapInnerBitmap, 1);
             bmap_inner->string = g_strdup(bmap_map_to);
+            bmap_inner->transform = bmba->transform;

             g_hash_table_insert(bitmaps_map,
                                 g_strdup(bmap_map_from), bmap_inner);
@@ -547,6 +552,7 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
     }

     FOR_EACH_DIRTY_BITMAP(bs, bitmap) {
+        BitmapMigrationBitmapAliasTransform *bitmap_transform = NULL;
         bitmap_name = bdrv_dirty_bitmap_name(bitmap);
         if (!bitmap_name) {
             continue;
@@ -567,6 +573,7 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
             }

             bitmap_alias = bmap_inner->string;
+            bitmap_transform = bmap_inner->transform;
         } else {
             if (strlen(bitmap_name) > UINT8_MAX) {
                 error_report("Cannot migrate bitmap '%s' on node '%s': "
@@ -592,8 +599,15 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
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
@@ -801,6 +815,7 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
     uint32_t granularity = qemu_get_be32(f);
     uint8_t flags = qemu_get_byte(f);
     LoadBitmapState *b;
+    bool persistent;

     if (s->cancelled) {
         return 0;
@@ -825,7 +840,15 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
         return -EINVAL;
     }

-    if (flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT) {
+    if (s->bmap_inner &&
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

@@ -1109,6 +1132,7 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
             }

             bitmap_name = bmap_inner->string;
+            s->bmap_inner = bmap_inner;
         }

         if (!s->cancelled) {
diff --git a/qapi/migration.json b/qapi/migration.json
index ce14d78071..338135320a 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -536,6 +536,20 @@
   'data': [ 'none', 'zlib',
             { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }

+##
+# @BitmapMigrationBitmapAliasTransform:
+#
+# @persistent: If present, the bitmap will be turned persistent
+#              or transient depending on this parameter.
+#              (since 6.0)
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
@@ -544,12 +558,16 @@
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


