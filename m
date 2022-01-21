Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D64496721
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 22:09:48 +0100 (CET)
Received: from localhost ([::1]:35274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB1AJ-0000kC-Kt
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 16:09:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0cJ-0000Hz-AU
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0cG-00055c-HH
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UXY13WrHKMeplYTVHN85eP6jeQoSwtEprvNFJ53nnMc=;
 b=BZDqleeV6MRPObVmikoOeAA+Ux7309nhLJc0pcsDz/N8giSLYIqKrP20h4wrgu3qVb8gkz
 iHaPNhlu2QVjhXM72RoqB0TCiYfgWLtTiiPWYnVl3fwayucgHNLMZ0JVTD80XYgJe9VAJ/
 5GM+Zd34Dpch/sEC0RcPJRY1l+RmvW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-Swp8W-6ZMpKdbnnsEdbOeg-1; Fri, 21 Jan 2022 15:34:31 -0500
X-MC-Unique: Swp8W-6ZMpKdbnnsEdbOeg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A2E446860;
 Fri, 21 Jan 2022 20:34:29 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 970B2167A8;
 Fri, 21 Jan 2022 20:34:24 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/31] util: Store DMA entries in a list
Date: Fri, 21 Jan 2022 21:27:22 +0100
Message-Id: <20220121202733.404989-21-eperezma@redhat.com>
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

SVQ need to allocate iova entries, traversing the list looking for
holes.

GLib offers methods to both transverse the list and look for entries
upper than a key since version 2.68. However qemu may need to compile
with earlier versions, so we replicate both methods here.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 util/iova-tree.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/util/iova-tree.c b/util/iova-tree.c
index ac089101c4..5063a256dd 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -11,15 +11,44 @@
 
 #include "qemu/osdep.h"
 #include "qemu/iova-tree.h"
+#include "qemu/queue.h"
 
 typedef struct DMAMapInternal {
     DMAMap map;
+    QTAILQ_ENTRY(DMAMapInternal) entry;
 } DMAMapInternal;
 
 struct IOVATree {
     GTree *tree;
+    QTAILQ_HEAD(, DMAMapInternal) list;
 };
 
+/**
+ * Search function for the upper bound of a given needle.
+ *
+ * The upper bound is the first node that has its key strictly greater than the
+ * searched key.
+ *
+ * TODO: A specialized function is available in GTree since Glib 2.68. Replace
+ * when Glib minimal version is raised.
+ */
+static int iova_tree_compare_upper_bound(gconstpointer a, gconstpointer b)
+{
+    const DMAMapInternal *haystack = a, *needle = b, *prev;
+
+    if (needle->map.iova >= haystack->map.iova) {
+        return 1;
+    }
+
+    prev = QTAILQ_PREV(haystack, entry);
+    if (!prev || prev->map.iova < needle->map.iova) {
+        return 0;
+    }
+
+    /* More data to the left or end of data */
+    return -1;
+}
+
 static int iova_tree_compare(gconstpointer a, gconstpointer b, gpointer data)
 {
     const DMAMapInternal *i1 = a, *i2 = b;
@@ -43,6 +72,7 @@ IOVATree *iova_tree_new(void)
 
     /* We don't have values actually, no need to free */
     iova_tree->tree = g_tree_new_full(iova_tree_compare, NULL, g_free, NULL);
+    QTAILQ_INIT(&iova_tree->list);
 
     return iova_tree;
 }
@@ -77,7 +107,7 @@ static inline void iova_tree_insert_internal(GTree *gtree,
 
 int iova_tree_insert(IOVATree *tree, const DMAMap *map)
 {
-    DMAMapInternal *new;
+    DMAMapInternal *new, *right;
 
     if (map->iova + map->size < map->iova || map->perm == IOMMU_NONE) {
         return IOVA_ERR_INVALID;
@@ -92,6 +122,15 @@ int iova_tree_insert(IOVATree *tree, const DMAMap *map)
     memcpy(&new->map, map, sizeof(new->map));
     iova_tree_insert_internal(tree->tree, new);
 
+    /* Ordered insertion */
+    right = g_tree_search(tree->tree, iova_tree_compare_upper_bound, new);
+    if (!right) {
+        /* Empty or bigger than any other entry */
+        QTAILQ_INSERT_TAIL(&tree->list, new, entry);
+    } else {
+        QTAILQ_INSERT_BEFORE(right, new, entry);
+    }
+
     return IOVA_OK;
 }
 
@@ -116,6 +155,7 @@ int iova_tree_remove(IOVATree *tree, const DMAMap *map)
     DMAMapInternal *overlap_internal;
 
     while ((overlap_internal = iova_tree_find_internal(tree, map))) {
+        QTAILQ_REMOVE(&tree->list, overlap_internal, entry);
         g_tree_remove(tree->tree, overlap_internal);
     }
 
-- 
2.27.0


