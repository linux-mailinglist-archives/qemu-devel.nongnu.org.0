Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BC34966AF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 21:56:38 +0100 (CET)
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB0xZ-0008BJ-Kh
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 15:56:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0cB-0000Df-9I
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:34:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0c9-00054f-GV
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z288opq66qlQZL93foWxaq85NFVUQL9AlykAae/k0MU=;
 b=HVZNcombiV/wkVeNU3SI/51oMOcxjvxQ+R/BznzLDa2wYH3KlMDKAkm724F3gj3z2p9TkI
 txvEIk/1jv6UBXIEz8ygWOXPjO6llDOesQf7w3WCArvaI/jLQL4dWG/MrIzGNN1hiAxyzh
 U6t7jRr7gTgKIJtaUymCywmjSO3TB4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-jVEWO3qyMzGRfJOQCuJw-g-1; Fri, 21 Jan 2022 15:34:25 -0500
X-MC-Unique: jVEWO3qyMzGRfJOQCuJw-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DC01420E6;
 Fri, 21 Jan 2022 20:34:24 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15995E2C8;
 Fri, 21 Jan 2022 20:34:18 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/31] utils: Add internal DMAMap to iova-tree
Date: Fri, 21 Jan 2022 21:27:21 +0100
Message-Id: <20220121202733.404989-20-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-1-eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So we can store private data not accessible from outside.

In this case, we will add intrusive linked list members so we can
transverse it for allocation.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 util/iova-tree.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/util/iova-tree.c b/util/iova-tree.c
index 23ea35b7a4..ac089101c4 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -12,13 +12,18 @@
 #include "qemu/osdep.h"
 #include "qemu/iova-tree.h"
 
+typedef struct DMAMapInternal {
+    DMAMap map;
+} DMAMapInternal;
+
 struct IOVATree {
     GTree *tree;
 };
 
 static int iova_tree_compare(gconstpointer a, gconstpointer b, gpointer data)
 {
-    const DMAMap *m1 = a, *m2 = b;
+    const DMAMapInternal *i1 = a, *i2 = b;
+    const DMAMap *m1 = &i1->map, *m2 = &i2->map;
 
     if (m1->iova > m2->iova + m2->size) {
         return 1;
@@ -42,9 +47,18 @@ IOVATree *iova_tree_new(void)
     return iova_tree;
 }
 
+static DMAMapInternal *iova_tree_find_internal(const IOVATree *tree,
+                                               const DMAMap *map)
+{
+    const DMAMapInternal map_internal = { .map = *map };
+
+    return g_tree_lookup(tree->tree, &map_internal);
+}
+
 const DMAMap *iova_tree_find(const IOVATree *tree, const DMAMap *map)
 {
-    return g_tree_lookup(tree->tree, map);
+    const DMAMapInternal *ret = iova_tree_find_internal(tree, map);
+    return &ret->map;
 }
 
 const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova)
@@ -54,7 +68,8 @@ const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova)
     return iova_tree_find(tree, &map);
 }
 
-static inline void iova_tree_insert_internal(GTree *gtree, DMAMap *range)
+static inline void iova_tree_insert_internal(GTree *gtree,
+                                             DMAMapInternal *range)
 {
     /* Key and value are sharing the same range data */
     g_tree_insert(gtree, range, range);
@@ -62,7 +77,7 @@ static inline void iova_tree_insert_internal(GTree *gtree, DMAMap *range)
 
 int iova_tree_insert(IOVATree *tree, const DMAMap *map)
 {
-    DMAMap *new;
+    DMAMapInternal *new;
 
     if (map->iova + map->size < map->iova || map->perm == IOMMU_NONE) {
         return IOVA_ERR_INVALID;
@@ -73,8 +88,8 @@ int iova_tree_insert(IOVATree *tree, const DMAMap *map)
         return IOVA_ERR_OVERLAP;
     }
 
-    new = g_new0(DMAMap, 1);
-    memcpy(new, map, sizeof(*new));
+    new = g_new0(DMAMapInternal, 1);
+    memcpy(&new->map, map, sizeof(new->map));
     iova_tree_insert_internal(tree->tree, new);
 
     return IOVA_OK;
@@ -84,11 +99,11 @@ static gboolean iova_tree_traverse(gpointer key, gpointer value,
                                 gpointer data)
 {
     iova_tree_iterator iterator = data;
-    DMAMap *map = key;
+    DMAMapInternal *map = key;
 
     g_assert(key == value);
 
-    return iterator(map);
+    return iterator(&map->map);
 }
 
 void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
@@ -98,10 +113,10 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
 
 int iova_tree_remove(IOVATree *tree, const DMAMap *map)
 {
-    const DMAMap *overlap;
+    DMAMapInternal *overlap_internal;
 
-    while ((overlap = iova_tree_find(tree, map))) {
-        g_tree_remove(tree->tree, overlap);
+    while ((overlap_internal = iova_tree_find_internal(tree, map))) {
+        g_tree_remove(tree->tree, overlap_internal);
     }
 
     return IOVA_OK;
-- 
2.27.0


