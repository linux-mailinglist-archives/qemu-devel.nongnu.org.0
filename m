Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD5A496738
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 22:18:03 +0100 (CET)
Received: from localhost ([::1]:47734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB1II-0000wt-9G
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 16:18:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0cM-0000Jz-6m
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:34:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0cK-00055m-3S
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VST6ydIDvy47Cx3pY2zc2TwGKNyubrTXRobXtdkSSmI=;
 b=ihkqz0I7SOYe3H46rTp8JFIYGPMPMfqWopsCOnStREu5poU4ofApLicpLsfKIjG1sh1/or
 BrRaQIVtFjlfnjelm1g35RhP2tRHuE5qZaUNIS+clVn6Yjqqv9ZQLmuGowEvh4wT8bMIv0
 mBj2iTTjXWlkKmEyFvgeAm+ggfTutVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-sbXyCH0cNxCJKFcaDvQ9kA-1; Fri, 21 Jan 2022 15:34:36 -0500
X-MC-Unique: sbXyCH0cNxCJKFcaDvQ9kA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4ED946862;
 Fri, 21 Jan 2022 20:34:34 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4FE916A33;
 Fri, 21 Jan 2022 20:34:29 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/31] util: Add iova_tree_alloc
Date: Fri, 21 Jan 2022 21:27:23 +0100
Message-Id: <20220121202733.404989-22-eperezma@redhat.com>
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

This iova tree function allows it to look for a hole in allocated
regions and return a totally new translation for a given translated
address.

It's usage is mainly to allow devices to access qemu address space,
remapping guest's one into a new iova space where qemu can add chunks of
addresses.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/qemu/iova-tree.h | 17 ++++++++
 util/iova-tree.c         | 86 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index 8249edd764..33f9b2e13f 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -29,6 +29,7 @@
 #define  IOVA_OK           (0)
 #define  IOVA_ERR_INVALID  (-1) /* Invalid parameters */
 #define  IOVA_ERR_OVERLAP  (-2) /* IOVA range overlapped */
+#define  IOVA_ERR_NOMEM    (-3) /* Cannot allocate */
 
 typedef struct IOVATree IOVATree;
 typedef struct DMAMap {
@@ -119,6 +120,22 @@ const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova);
  */
 void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator);
 
+/**
+ * iova_tree_alloc:
+ *
+ * @tree: the iova tree to allocate from
+ * @map: the new map (as translated addr & size) to allocate in iova region
+ * @iova_begin: the minimum address of the allocation
+ * @iova_end: the maximum addressable direction of the allocation
+ *
+ * Allocates a new region of a given size, between iova_min and iova_max.
+ *
+ * Return: Same as iova_tree_insert, but cannot overlap and can be out of
+ * free contiguous range. Caller can get the assigned iova in map->iova.
+ */
+int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
+                    hwaddr iova_end);
+
 /**
  * iova_tree_destroy:
  *
diff --git a/util/iova-tree.c b/util/iova-tree.c
index 5063a256dd..1439fc9fe2 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -88,7 +88,7 @@ static DMAMapInternal *iova_tree_find_internal(const IOVATree *tree,
 const DMAMap *iova_tree_find(const IOVATree *tree, const DMAMap *map)
 {
     const DMAMapInternal *ret = iova_tree_find_internal(tree, map);
-    return &ret->map;
+    return ret ? &ret->map : NULL;
 }
 
 const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova)
@@ -162,6 +162,90 @@ int iova_tree_remove(IOVATree *tree, const DMAMap *map)
     return IOVA_OK;
 }
 
+/**
+ * Check if there is at minimum "size" iova space between the end of "left" and
+ * the start of "right". If some of them is NULL, iova_begin and iova_end will
+ * be used.
+ */
+static bool iova_tree_alloc_map_in_hole(const DMAMapInternal *l,
+                                        const DMAMapInternal *r,
+                                        hwaddr iova_begin, hwaddr iova_last,
+                                        size_t size)
+{
+    const DMAMap *left = l ? &l->map : NULL;
+    const DMAMap *right = r ? &r->map : NULL;
+    uint64_t hole_start, hole_last;
+
+    if (right && right->iova + right->size < iova_begin) {
+        return false;
+    }
+
+    if (left && left->iova > iova_last) {
+        return false;
+    }
+
+    hole_start = MAX(left ? left->iova + left->size + 1 : 0, iova_begin);
+    hole_last = MIN(right ? right->iova : HWADDR_MAX, iova_last);
+
+    if (hole_last - hole_start > size) {
+        /* We found a valid hole. */
+        return true;
+    }
+
+    /* Keep iterating */
+    return false;
+}
+
+/**
+ * Allocates a new entry in the tree
+ *
+ * The caller specifies the size of the new entry with map->size. The new iova
+ * address is returned in map->iova if allocation success. The map ownership is
+ * always of the caller as in iova_tree_insert.
+ *
+ * More contrains can be specified with iova_begin and iova_last.
+ *
+ * Returns the same as iova_tree_insert, but it can return IOVA_ERR_NOMEM if
+ * cannot find a hole in iova range big enough.
+ */
+int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
+                    hwaddr iova_last)
+{
+    const DMAMapInternal *last, *i;
+
+    assert(iova_begin < iova_last);
+
+    /*
+     * Find a valid hole for the mapping
+     *
+     * TODO: Replace all this with g_tree_node_first/next/last when available
+     * (from glib since 2.68). Using a sepparated QTAILQ complicates code.
+     *
+     * Try to allocate first at the end of the list.
+     */
+    last = QTAILQ_LAST(&tree->list);
+    if (iova_tree_alloc_map_in_hole(last, NULL, iova_begin, iova_last,
+                                    map->size)) {
+        goto alloc;
+    }
+
+    /* Look for inner hole */
+    last = NULL;
+    for (i = QTAILQ_FIRST(&tree->list); i;
+         last = i, i = QTAILQ_NEXT(i, entry)) {
+        if (iova_tree_alloc_map_in_hole(last, i, iova_begin, iova_last,
+                                        map->size)) {
+            goto alloc;
+        }
+    }
+
+    return IOVA_ERR_NOMEM;
+
+alloc:
+    map->iova = last ? last->map.iova + last->map.size + 1 : iova_begin;
+    return iova_tree_insert(tree, map);
+}
+
 void iova_tree_destroy(IOVATree *tree)
 {
     g_tree_destroy(tree->tree);
-- 
2.27.0


