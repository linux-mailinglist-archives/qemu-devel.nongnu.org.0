Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D6130DA8F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:05:02 +0100 (CET)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Hq9-0007IF-Te
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l7HlZ-00048V-D3
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:00:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l7HlX-0003rW-Gt
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612357214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHoIWqq9sWuJLvovuiB+9ciBQTK0nsKndjBS7Ld7rOg=;
 b=ZvkN1MEKrz7ov5KxKRRW9Uf+cTe0vaH4INzUvBe0pV9mLszhNyb373vNF7etjiY8xaoC6P
 8sbv2iJeoWWhxRrra00kgIMO3yl6IMYb+2nk7elSUa+rte5aF4fSnY1FGzdbQBSlDBY5ck
 QlIZQsBfuF6yyheaF/a6hkAtHxntSls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-GhESpVNGMWeZjzD112RhKQ-1; Wed, 03 Feb 2021 08:00:13 -0500
X-MC-Unique: GhESpVNGMWeZjzD112RhKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1F8E1800D41;
 Wed,  3 Feb 2021 13:00:11 +0000 (UTC)
Received: from speedmetal.lan (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70FDE3828;
 Wed,  3 Feb 2021 13:00:06 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] migration: dirty-bitmap: Allow control of bitmap
 persistence on destination
Date: Wed,  3 Feb 2021 14:00:00 +0100
Message-Id: <3afd4b353cf75c01c9260ca65e073d897e8c42d2.1612356810.git.pkrempa@redhat.com>
In-Reply-To: <cover.1612356810.git.pkrempa@redhat.com>
References: <cover.1612356810.git.pkrempa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bitmap's source persistence is transported over the migration stream and
the destination mirrors it. In some cases the destination might want to
persist bitmaps which are not persistent on the source (e.g. the result
of merge of bitmaps from a number of layers on the source when migrating
into a squashed image) but currently it would need to create another set
of persistent bitmaps and merge them.

This adds 'dest-persistent' optional property to
'BitmapMigrationBitmapAlias' which when present overrides the bitmap
presence state from the source.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
---
 migration/block-dirty-bitmap.c | 30 +++++++++++++++++++++++++++++-
 qapi/migration.json            |  7 ++++++-
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index b0403dd00c..1876c94c45 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -149,6 +149,9 @@ typedef struct DBMLoadState {

     bool before_vm_start_handled; /* set in dirty_bitmap_mig_before_vm_start */

+    bool has_dest_persistent;
+    bool dest_persistent;
+
     /*
      * cancelled
      * Incoming migration is cancelled for some reason. That means that we
@@ -171,6 +174,10 @@ static DBMState dbm_state;

 typedef struct AliasMapInnerBitmap {
     char *string;
+
+    /* for destination's properties setting bitmap state */
+    bool has_dest_persistent;
+    bool dest_persistent;
 } AliasMapInnerBitmap;

 static void free_alias_map_inner_bitmap(void *amin_ptr)
@@ -289,6 +296,8 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
         for (bmbal = bmna->bitmaps; bmbal; bmbal = bmbal->next) {
             const BitmapMigrationBitmapAlias *bmba = bmbal->value;
             const char *bmap_map_from, *bmap_map_to;
+            bool bmap_has_dest_persistent = false;
+            bool bmap_dest_persistent = false;
             AliasMapInnerBitmap *bmap_inner;

             if (strlen(bmba->alias) > UINT8_MAX) {
@@ -317,6 +326,9 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
                 bmap_map_from = bmba->alias;
                 bmap_map_to = bmba->name;

+                bmap_has_dest_persistent = bmba->has_dest_persistent;
+                bmap_dest_persistent = bmba->dest_persistent;
+
                 if (g_hash_table_contains(bitmaps_map, bmba->alias)) {
                     error_setg(errp, "The bitmap alias '%s'/'%s' is used twice",
                                bmna->alias, bmba->alias);
@@ -326,6 +338,8 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,

             bmap_inner = g_new0(AliasMapInnerBitmap, 1);
             bmap_inner->string = g_strdup(bmap_map_to);
+            bmap_inner->has_dest_persistent = bmap_has_dest_persistent;
+            bmap_inner->dest_persistent = bmap_dest_persistent;

             g_hash_table_insert(bitmaps_map,
                                 g_strdup(bmap_map_from), bmap_inner);
@@ -798,6 +812,7 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
     uint32_t granularity = qemu_get_be32(f);
     uint8_t flags = qemu_get_byte(f);
     LoadBitmapState *b;
+    bool persistent;

     if (s->cancelled) {
         return 0;
@@ -822,7 +837,13 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
         return -EINVAL;
     }

-    if (flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT) {
+    if (s->has_dest_persistent) {
+        persistent = s->dest_persistent;
+    } else {
+        persistent = flags & DIRTY_BITMAP_MIG_START_FLAG_PERSISTENT;
+    }
+
+    if (persistent) {
         bdrv_dirty_bitmap_set_persistence(s->bitmap, true);
     }

@@ -1087,6 +1108,8 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,

     if (s->flags & DIRTY_BITMAP_MIG_FLAG_BITMAP_NAME) {
         const char *bitmap_name;
+        bool bitmap_has_dest_persistent = false;
+        bool bitmap_dest_persistent = false;

         if (!qemu_get_counted_string(f, s->bitmap_alias)) {
             error_report("Unable to read bitmap alias string");
@@ -1107,12 +1130,17 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
             }

             bitmap_name = bmap_inner->string;
+            bitmap_has_dest_persistent = bmap_inner->has_dest_persistent;
+            bitmap_dest_persistent = bmap_inner->dest_persistent;
         }

         if (!s->cancelled) {
             g_strlcpy(s->bitmap_name, bitmap_name, sizeof(s->bitmap_name));
             s->bitmap = bdrv_find_dirty_bitmap(s->bs, s->bitmap_name);

+            s->has_dest_persistent = bitmap_has_dest_persistent;
+            s->dest_persistent = bitmap_dest_persistent;
+
             /*
              * bitmap may be NULL here, it wouldn't be an error if it is the
              * first occurrence of the bitmap
diff --git a/qapi/migration.json b/qapi/migration.json
index d1d9632c2a..32e64dbce6 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -533,12 +533,17 @@
 # @alias: An alias name for migration (for example the bitmap name on
 #         the opposite site).
 #
+# @dest-persistent: If populated set the bitmap will be turned persistent
+#                   or transient depending on this parameter.
+#                   (since 6.0)
+#
 # Since: 5.2
 ##
 { 'struct': 'BitmapMigrationBitmapAlias',
   'data': {
       'name': 'str',
-      'alias': 'str'
+      'alias': 'str',
+      '*dest-persistent': 'bool'
   } }

 ##
-- 
2.29.2


