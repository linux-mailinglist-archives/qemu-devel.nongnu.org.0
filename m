Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DDC31A84B
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 00:27:48 +0100 (CET)
Received: from localhost ([::1]:49196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAhql-0000hu-8d
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 18:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAhky-0003yx-P1
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 18:21:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAhkw-0005oD-Si
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 18:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613172106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+zdWS2o2oVkRJLXmriaeAsHj3paX/QYsPu64ViLgpI=;
 b=Olp4QeJ+mtRsEeJL5UVFm72K4FtvhMduSXJH/T6ExvR6ghBbB9+lpqT2NHDtQRsJxICFqM
 nM1mKDZ/xZjoTP/b6udpIOKsg07dJK+We2a6mtVyFyvKMCZarNBJCRi6ZwvcC+Vv9Tzzcq
 daFYOUjLClSiQFjzlL9LOn/AuHApgbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-xPrarvH7MRSiw7UICoFaFg-1; Fri, 12 Feb 2021 18:21:42 -0500
X-MC-Unique: xPrarvH7MRSiw7UICoFaFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BE90801962;
 Fri, 12 Feb 2021 23:21:41 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53A441F04C;
 Fri, 12 Feb 2021 23:21:37 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] migration: dirty-bitmap: Use struct for alias map inner
 members
Date: Fri, 12 Feb 2021 17:21:30 -0600
Message-Id: <20210212232134.1462756-2-eblake@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Krempa <pkrempa@redhat.com>,
 "open list:Dirty Bitmaps" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Krempa <pkrempa@redhat.com>

Currently the alias mapping hash stores just strings of the target
objects internally. In further patches we'll be adding another member
which will need to be stored in the map so pass a copy of the whole
BitmapMigrationBitmapAlias QAPI struct into the map.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Message-Id: <fc5f27e1fe16cb75e08a248c2d938de3997b9bfb.1613150869.git.pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: adjust long lines]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 migration/block-dirty-bitmap.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index c61d382be87c..b39c13ce4ebe 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -75,6 +75,8 @@
 #include "qemu/id.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-migration.h"
+#include "qapi/qapi-visit-migration.h"
+#include "qapi/clone-visitor.h"
 #include "trace.h"

 #define CHUNK_SIZE     (1 << 10)
@@ -224,6 +226,7 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
         AliasMapInnerNode *amin;
         GHashTable *bitmaps_map;
         const char *node_map_from, *node_map_to;
+        GDestroyNotify gdn;

         if (!id_wellformed(bmna->alias)) {
             error_setg(errp, "The node alias '%s' is not well-formed",
@@ -263,8 +266,9 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
             node_map_to = bmna->node_name;
         }

-        bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal,
-                                            g_free, g_free);
+        gdn = (GDestroyNotify) qapi_free_BitmapMigrationBitmapAlias;
+        bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
+                                            gdn);

         amin = g_new(AliasMapInnerNode, 1);
         *amin = (AliasMapInnerNode){
@@ -276,7 +280,7 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,

         for (bmbal = bmna->bitmaps; bmbal; bmbal = bmbal->next) {
             const BitmapMigrationBitmapAlias *bmba = bmbal->value;
-            const char *bmap_map_from, *bmap_map_to;
+            const char *bmap_map_from;

             if (strlen(bmba->alias) > UINT8_MAX) {
                 error_setg(errp,
@@ -293,7 +297,6 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,

             if (name_to_alias) {
                 bmap_map_from = bmba->name;
-                bmap_map_to = bmba->alias;

                 if (g_hash_table_contains(bitmaps_map, bmba->name)) {
                     error_setg(errp, "The bitmap '%s'/'%s' is mapped twice",
@@ -302,7 +305,6 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
                 }
             } else {
                 bmap_map_from = bmba->alias;
-                bmap_map_to = bmba->name;

                 if (g_hash_table_contains(bitmaps_map, bmba->alias)) {
                     error_setg(errp, "The bitmap alias '%s'/'%s' is used twice",
@@ -311,8 +313,8 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
                 }
             }

-            g_hash_table_insert(bitmaps_map,
-                                g_strdup(bmap_map_from), g_strdup(bmap_map_to));
+            g_hash_table_insert(bitmaps_map, g_strdup(bmap_map_from),
+                                QAPI_CLONE(BitmapMigrationBitmapAlias, bmba));
         }
     }

@@ -538,11 +540,15 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
         }

         if (bitmap_aliases) {
-            bitmap_alias = g_hash_table_lookup(bitmap_aliases, bitmap_name);
-            if (!bitmap_alias) {
+            BitmapMigrationBitmapAlias *bmap_inner;
+
+            bmap_inner = g_hash_table_lookup(bitmap_aliases, bitmap_name);
+            if (!bmap_inner) {
                 /* Skip bitmaps with no alias */
                 continue;
             }
+
+            bitmap_alias = bmap_inner->alias;
         } else {
             if (strlen(bitmap_name) > UINT8_MAX) {
                 error_report("Cannot migrate bitmap '%s' on node '%s': "
@@ -1074,13 +1080,16 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,

         bitmap_name = s->bitmap_alias;
         if (!s->cancelled && bitmap_alias_map) {
-            bitmap_name = g_hash_table_lookup(bitmap_alias_map,
-                                              s->bitmap_alias);
-            if (!bitmap_name) {
+            BitmapMigrationBitmapAlias *bmap_inner;
+
+            bmap_inner = g_hash_table_lookup(bitmap_alias_map, s->bitmap_alias);
+            if (!bmap_inner) {
                 error_report("Error: Unknown bitmap alias '%s' on node "
                              "'%s' (alias '%s')", s->bitmap_alias,
                              s->bs->node_name, s->node_alias);
                 cancel_incoming_locked(s);
+            } else {
+                bitmap_name = bmap_inner->name;
             }
         }

-- 
2.30.1


