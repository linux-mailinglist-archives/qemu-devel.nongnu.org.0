Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C622330DA78
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:02:56 +0100 (CET)
Received: from localhost ([::1]:53060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ho7-0005NC-Sz
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l7HlU-00040V-7z
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:00:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l7HlR-0003ng-Ov
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612357208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DmIAzyRnhWry6wAxQk/s329dcyRgVitrm2Gl7GwqFsE=;
 b=VX1MRmNRXsj2ve8QTDbStdT2zYd8daV0xqho87v3feiX+wgUIQ4PRdsj+MaD+1VVQMOgVn
 rQLWibf+A4Sw5ju137czANufov6acyucCAqM2q3eXuJSZjaCG35jcVHWGYF8cIF1BvcxN6
 8HyKQIKoDVzLCDx7CaL6nwscVhtB/QE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-4CMFSSlfOW6xQhsqRIroEQ-1; Wed, 03 Feb 2021 08:00:07 -0500
X-MC-Unique: 4CMFSSlfOW6xQhsqRIroEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AACD79EC4;
 Wed,  3 Feb 2021 13:00:06 +0000 (UTC)
Received: from speedmetal.lan (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E63A6F979;
 Wed,  3 Feb 2021 13:00:04 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] migration: dirty-bitmap: Convert alias map inner members
 to a struct
Date: Wed,  3 Feb 2021 13:59:59 +0100
Message-Id: <8e40a7337e3b9a0a4f11ee3b0e2f3ae4c76f2dbd.1612356810.git.pkrempa@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the alias mapping hash stores just strings of the target
objects internally. In further patches we'll be adding another member
which will need to be stored in the map so convert the members to a
struct.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
---
 migration/block-dirty-bitmap.c | 37 ++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index c61d382be8..b0403dd00c 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -169,6 +169,18 @@ typedef struct DBMState {

 static DBMState dbm_state;

+typedef struct AliasMapInnerBitmap {
+    char *string;
+} AliasMapInnerBitmap;
+
+static void free_alias_map_inner_bitmap(void *amin_ptr)
+{
+    AliasMapInnerBitmap *amin = amin_ptr;
+
+    g_free(amin->string);
+    g_free(amin);
+}
+
 /* For hash tables that map node/bitmap names to aliases */
 typedef struct AliasMapInnerNode {
     char *string;
@@ -264,7 +276,7 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
         }

         bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal,
-                                            g_free, g_free);
+                                            g_free, free_alias_map_inner_bitmap);

         amin = g_new(AliasMapInnerNode, 1);
         *amin = (AliasMapInnerNode){
@@ -277,6 +289,7 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
         for (bmbal = bmna->bitmaps; bmbal; bmbal = bmbal->next) {
             const BitmapMigrationBitmapAlias *bmba = bmbal->value;
             const char *bmap_map_from, *bmap_map_to;
+            AliasMapInnerBitmap *bmap_inner;

             if (strlen(bmba->alias) > UINT8_MAX) {
                 error_setg(errp,
@@ -311,8 +324,11 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
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

@@ -538,11 +554,16 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
         }

         if (bitmap_aliases) {
-            bitmap_alias = g_hash_table_lookup(bitmap_aliases, bitmap_name);
-            if (!bitmap_alias) {
+            AliasMapInnerBitmap *bmap_inner;
+
+            bmap_inner = g_hash_table_lookup(bitmap_aliases, bitmap_name);
+
+            if (!bmap_inner) {
                 /* Skip bitmaps with no alias */
                 continue;
             }
+
+            bitmap_alias = bmap_inner->string;
         } else {
             if (strlen(bitmap_name) > UINT8_MAX) {
                 error_report("Cannot migrate bitmap '%s' on node '%s': "
@@ -1074,14 +1095,18 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,

         bitmap_name = s->bitmap_alias;
         if (!s->cancelled && bitmap_alias_map) {
-            bitmap_name = g_hash_table_lookup(bitmap_alias_map,
+            AliasMapInnerBitmap *bmap_inner;
+
+            bmap_inner = g_hash_table_lookup(bitmap_alias_map,
                                               s->bitmap_alias);
-            if (!bitmap_name) {
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


