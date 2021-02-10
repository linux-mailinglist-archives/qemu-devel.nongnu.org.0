Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45F7316C59
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:16:48 +0100 (CET)
Received: from localhost ([::1]:36274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9t6d-0002mE-Uq
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:16:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l9sk9-0003SX-Rt
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:53:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l9sk4-00035I-A4
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612976007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1xQGlRxXrCPO9HMaifmi3/8w+FSEXik1tDJBShY4Ws=;
 b=W9Hy5/20y8W43LpmB5uAM6uPOH3r0hism79+1o/AdVkZxuN3xOnV63rMC0lRiqDJ1k7vLf
 cAxrQCXUYWxoADWHxz5eg0LqWeHHE27akEqR7tEbMGuNLEmhWyV/1dd2Uf/oYtgFa6OQRZ
 61lM9+3UxYU0CRqK3E7wwwLCFGhgPfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-7OgvJMr4NtKWLOgbW150Zw-1; Wed, 10 Feb 2021 11:53:23 -0500
X-MC-Unique: 7OgvJMr4NtKWLOgbW150Zw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A37910983C6;
 Wed, 10 Feb 2021 16:53:22 +0000 (UTC)
Received: from speedmetal.lan (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D84A212D7E;
 Wed, 10 Feb 2021 16:53:20 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] migration: dirty-bitmap: Convert alias map inner
 members to a struct
Date: Wed, 10 Feb 2021 17:53:16 +0100
Message-Id: <394ba566353d8b9fa30a4543c702325af555cbdc.1612953419.git.pkrempa@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Currently the alias mapping hash stores just strings of the target
objects internally. In further patches we'll be adding another member
which will need to be stored in the map so convert the members to a
struct.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

v2:
 - NULL-check in freeing function (Eric)
 - style problems (Vladimir)

 migration/block-dirty-bitmap.c | 43 +++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index c61d382be8..0169f672df 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -169,6 +169,22 @@ typedef struct DBMState {

 static DBMState dbm_state;

+typedef struct AliasMapInnerBitmap {
+    char *string;
+} AliasMapInnerBitmap;
+
+static void free_alias_map_inner_bitmap(void *amin_ptr)
+{
+    AliasMapInnerBitmap *amin = amin_ptr;
+
+    if (!amin_ptr) {
+        return;
+    }
+
+    g_free(amin->string);
+    g_free(amin);
+}
+
 /* For hash tables that map node/bitmap names to aliases */
 typedef struct AliasMapInnerNode {
     char *string;
@@ -263,8 +279,8 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
             node_map_to = bmna->node_name;
         }

-        bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal,
-                                            g_free, g_free);
+        bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
+                                            free_alias_map_inner_bitmap);

         amin = g_new(AliasMapInnerNode, 1);
         *amin = (AliasMapInnerNode){
@@ -277,6 +293,7 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
         for (bmbal = bmna->bitmaps; bmbal; bmbal = bmbal->next) {
             const BitmapMigrationBitmapAlias *bmba = bmbal->value;
             const char *bmap_map_from, *bmap_map_to;
+            AliasMapInnerBitmap *bmap_inner;

             if (strlen(bmba->alias) > UINT8_MAX) {
                 error_setg(errp,
@@ -311,8 +328,11 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
                 }
             }

+            bmap_inner = g_new0(AliasMapInnerBitmap, 1);
+            bmap_inner->string = g_strdup(bmap_map_to);
+
             g_hash_table_insert(bitmaps_map,
-                                g_strdup(bmap_map_from), g_strdup(bmap_map_to));
+                                g_strdup(bmap_map_from), bmap_inner);
         }
     }

@@ -538,11 +558,15 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
         }

         if (bitmap_aliases) {
-            bitmap_alias = g_hash_table_lookup(bitmap_aliases, bitmap_name);
-            if (!bitmap_alias) {
+            AliasMapInnerBitmap *bmap_inner;
+
+            bmap_inner = g_hash_table_lookup(bitmap_aliases, bitmap_name);
+            if (!bmap_inner) {
                 /* Skip bitmaps with no alias */
                 continue;
             }
+
+            bitmap_alias = bmap_inner->string;
         } else {
             if (strlen(bitmap_name) > UINT8_MAX) {
                 error_report("Cannot migrate bitmap '%s' on node '%s': "
@@ -1074,14 +1098,17 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,

         bitmap_name = s->bitmap_alias;
         if (!s->cancelled && bitmap_alias_map) {
-            bitmap_name = g_hash_table_lookup(bitmap_alias_map,
-                                              s->bitmap_alias);
-            if (!bitmap_name) {
+            AliasMapInnerBitmap *bmap_inner;
+
+            bmap_inner = g_hash_table_lookup(bitmap_alias_map, s->bitmap_alias);
+            if (!bmap_inner) {
                 error_report("Error: Unknown bitmap alias '%s' on node "
                              "'%s' (alias '%s')", s->bitmap_alias,
                              s->bs->node_name, s->node_alias);
                 cancel_incoming_locked(s);
             }
+
+            bitmap_name = bmap_inner->string;
         }

         if (!s->cancelled) {
-- 
2.29.2


