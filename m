Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7944402C6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:03:04 +0200 (CEST)
Received: from localhost ([::1]:54212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgX9b-0005gS-Gs
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWrX-00067L-EN
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:44:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWrV-000325-HW
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635533061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ZojVu0fk8FjansgHvqLHFb4eAzNUMTeqdPgEQIsaxM=;
 b=KUXdHsmYefZCmRPt+hBkO09TlTFobnmPf8wcrzEKeHJakE+LtMNcDbPBJlvJ8yiDiRQrKW
 LzrmwY34fBHdnFY51x5TOyeuSlnF7qDYLZoluOAKB6GxH2EM3uE4a/rOVM/WJFlzeEibNo
 WPjCVYBzwhf0gBDVyz/A9RNGa/eGP58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-d0qilp7iNnmGgGfMV0cP0w-1; Fri, 29 Oct 2021 14:44:17 -0400
X-MC-Unique: d0qilp7iNnmGgGfMV0cP0w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 510A310A8E04;
 Fri, 29 Oct 2021 18:44:16 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30EC65D6CF;
 Fri, 29 Oct 2021 18:44:12 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 23/26] util: Add iova_tree_alloc
Date: Fri, 29 Oct 2021 20:35:22 +0200
Message-Id: <20211029183525.1776416-24-eperezma@redhat.com>
In-Reply-To: <20211029183525.1776416-1-eperezma@redhat.com>
References: <20211029183525.1776416-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>
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
 include/qemu/iova-tree.h |  17 +++++
 util/iova-tree.c         | 139 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+)

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
index 23ea35b7a4..27c921c4e2 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -16,6 +16,36 @@ struct IOVATree {
     GTree *tree;
 };
 
+/* Args to pass to iova_tree_alloc foreach function. */
+struct IOVATreeAllocArgs {
+    /* Size of the desired allocation */
+    size_t new_size;
+
+    /* The minimum address allowed in the allocation */
+    hwaddr iova_begin;
+
+    /* The last addressable allowed in the allocation */
+    hwaddr iova_last;
+
+    /* Previously-to-last iterated map, can be NULL in the first node */
+    const DMAMap *hole_left;
+
+    /* Last iterated map */
+    const DMAMap *hole_right;
+};
+
+/**
+ * Iterate args to tne next hole
+ *
+ * @args  The alloc arguments
+ * @next  The next mapping in the tree. Can be NULL to signal the last one
+ */
+static void iova_tree_alloc_args_iterate(struct IOVATreeAllocArgs *args,
+                                         const DMAMap *next) {
+    args->hole_left = args->hole_right;
+    args->hole_right = next;
+}
+
 static int iova_tree_compare(gconstpointer a, gconstpointer b, gpointer data)
 {
     const DMAMap *m1 = a, *m2 = b;
@@ -107,6 +137,115 @@ int iova_tree_remove(IOVATree *tree, const DMAMap *map)
     return IOVA_OK;
 }
 
+/**
+ * Try to accomodate a map of size ret->size in a hole between
+ * max(end(hole_left), iova_start).
+ *
+ * @args Arguments to allocation
+ */
+static bool iova_tree_alloc_map_in_hole(const struct IOVATreeAllocArgs *args)
+{
+    const DMAMap *left = args->hole_left, *right = args->hole_right;
+    uint64_t hole_start, hole_last;
+
+    if (right && right->iova + right->size < args->iova_begin) {
+        return false;
+    }
+
+    if (left && left->iova > args->iova_last) {
+        return false;
+    }
+
+    hole_start = MAX(left ? left->iova + left->size + 1 : 0, args->iova_begin);
+    hole_last = MIN(right ? right->iova : HWADDR_MAX, args->iova_last);
+
+    if (hole_last - hole_start > args->new_size) {
+        /* We found a valid hole. */
+        return true;
+    }
+
+    /* Keep iterating */
+    return false;
+}
+
+/**
+ * Foreach dma node in the tree, compare if there is a hole wit its previous
+ * node (or minimum iova address allowed) and the node.
+ *
+ * @key   Node iterating
+ * @value Node iterating
+ * @pargs Struct to communicate with the outside world
+ *
+ * Return: false to keep iterating, true if needs break.
+ */
+static gboolean iova_tree_alloc_traverse(gpointer key, gpointer value,
+                                         gpointer pargs)
+{
+    struct IOVATreeAllocArgs *args = pargs;
+    DMAMap *node = value;
+
+    assert(key == value);
+
+    iova_tree_alloc_args_iterate(args, node);
+    if (args->hole_left && args->hole_left->iova > args->iova_last) {
+        return true;
+    }
+
+    if (iova_tree_alloc_map_in_hole(args)) {
+        return true;
+    }
+
+    return false;
+}
+
+int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
+                    hwaddr iova_last)
+{
+    struct IOVATreeAllocArgs args = {
+        .new_size = map->size,
+        .iova_begin = iova_begin,
+        .iova_last = iova_last,
+    };
+
+    if (iova_begin == 0) {
+        /* Some devices does not like addr 0 */
+        iova_begin += qemu_real_host_page_size;
+    }
+
+    assert(iova_begin < iova_last);
+
+    /*
+     * Find a valid hole for the mapping
+     *
+     * Assuming low iova_begin, so no need to do a binary search to
+     * locate the first node.
+     *
+     * TODO: We can improve the search speed if we save the beginning and the
+     * end of holes, so we don't iterate over the previous saved ones.
+     *
+     * TODO: Replace all this with g_tree_node_first/next/last when available
+     * (from glib since 2.68). To do it with g_tree_foreach complicates the
+     * code a lot.
+     *
+     */
+    g_tree_foreach(tree->tree, iova_tree_alloc_traverse, &args);
+    if (!iova_tree_alloc_map_in_hole(&args)) {
+        /*
+         * 2nd try: Last iteration left args->right as the last DMAMap. But
+         * (right, end) hole needs to be checked too
+         */
+        iova_tree_alloc_args_iterate(&args, NULL);
+        if (!iova_tree_alloc_map_in_hole(&args)) {
+            return IOVA_ERR_NOMEM;
+        }
+    }
+
+    map->iova = MAX(iova_begin,
+                    args.hole_left ?
+                    args.hole_left->iova + args.hole_left->size + 1 : 0);
+    return iova_tree_insert(tree, map);
+}
+
 void iova_tree_destroy(IOVATree *tree)
 {
     g_tree_destroy(tree->tree);
-- 
2.27.0


