Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABE54D9488
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 07:21:51 +0100 (CET)
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU0Z4-0000Wp-6l
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 02:21:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nU0SX-000192-D2
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:15:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nU0SV-0004Ox-A0
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647324902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3NRzAbmAR3/5vO5cWrU3Ypym8jYRxeIz62sq+s8QLw=;
 b=IN2aWexF16HdWWiNk5TmX0yyghLNiGV98SeRxB4pEkzFGVBngGO6+yCe4OdEAY/OGinMPP
 +Ut8YK/TZqO4NCIyxrXFCnlLtudu51z9UxjV329UoqCQkR1/Qm0mVWZPpP9KsW4DPVuvho
 Nb7WHYasUf0OxEV7sbvTDDHiXkjn+NE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-60G2XniGNCqz8MRjwCuj4A-1; Tue, 15 Mar 2022 02:15:00 -0400
X-MC-Unique: 60G2XniGNCqz8MRjwCuj4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C58E2101AA4A;
 Tue, 15 Mar 2022 06:14:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-38.pek2.redhat.com [10.72.14.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 335BC40C128B;
 Tue, 15 Mar 2022 06:14:56 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V3 09/15] util: Add iova_tree_alloc_map
Date: Tue, 15 Mar 2022 14:14:14 +0800
Message-Id: <20220315061420.31910-10-jasowang@redhat.com>
In-Reply-To: <20220315061420.31910-1-jasowang@redhat.com>
References: <20220315061420.31910-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

This iova tree function allows it to look for a hole in allocated
regions and return a totally new translation for a given translated
address.

It's usage is mainly to allow devices to access qemu address space,
remapping guest's one into a new iova space where qemu can add chunks of
addresses.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/qemu/iova-tree.h |  18 +++++++
 util/iova-tree.c         | 136 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 154 insertions(+)

diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index 8249edd..d066400 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -29,6 +29,7 @@
 #define  IOVA_OK           (0)
 #define  IOVA_ERR_INVALID  (-1) /* Invalid parameters */
 #define  IOVA_ERR_OVERLAP  (-2) /* IOVA range overlapped */
+#define  IOVA_ERR_NOMEM    (-3) /* Cannot allocate */
 
 typedef struct IOVATree IOVATree;
 typedef struct DMAMap {
@@ -120,6 +121,23 @@ const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova);
 void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator);
 
 /**
+ * iova_tree_alloc_map:
+ *
+ * @tree: the iova tree to allocate from
+ * @map: the new map (as translated addr & size) to allocate in the iova region
+ * @iova_begin: the minimum address of the allocation
+ * @iova_end: the maximum addressable direction of the allocation
+ *
+ * Allocates a new region of a given size, between iova_min and iova_max.
+ *
+ * Return: Same as iova_tree_insert, but cannot overlap and can return error if
+ * iova tree is out of free contiguous range. The caller gets the assigned iova
+ * in map->iova.
+ */
+int iova_tree_alloc_map(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
+                        hwaddr iova_end);
+
+/**
  * iova_tree_destroy:
  *
  * @tree: the iova tree to destroy
diff --git a/util/iova-tree.c b/util/iova-tree.c
index 23ea35b..139626b 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -16,6 +16,40 @@ struct IOVATree {
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
+    /* Map at the left of the hole, can be NULL if "this" is first one */
+    const DMAMap *prev;
+
+    /* Map at the right of the hole, can be NULL if "prev" is the last one */
+    const DMAMap *this;
+
+    /* If found, we fill in the IOVA here */
+    hwaddr iova_result;
+
+    /* Whether have we found a valid IOVA */
+    bool iova_found;
+};
+
+/**
+ * Iterate args to the next hole
+ *
+ * @args: The alloc arguments
+ * @next: The next mapping in the tree. Can be NULL to signal the last one
+ */
+static void iova_tree_alloc_args_iterate(struct IOVATreeAllocArgs *args,
+                                         const DMAMap *next)
+{
+    args->prev = args->this;
+    args->this = next;
+}
+
 static int iova_tree_compare(gconstpointer a, gconstpointer b, gpointer data)
 {
     const DMAMap *m1 = a, *m2 = b;
@@ -107,6 +141,108 @@ int iova_tree_remove(IOVATree *tree, const DMAMap *map)
     return IOVA_OK;
 }
 
+/**
+ * Try to find an unallocated IOVA range between prev and this elements.
+ *
+ * @args: Arguments to allocation
+ *
+ * Cases:
+ *
+ * (1) !prev, !this: No entries allocated, always succeed
+ *
+ * (2) !prev, this: We're iterating at the 1st element.
+ *
+ * (3) prev, !this: We're iterating at the last element.
+ *
+ * (4) prev, this: this is the most common case, we'll try to find a hole
+ * between "prev" and "this" mapping.
+ *
+ * Note that this function assumes the last valid iova is HWADDR_MAX, but it
+ * searches linearly so it's easy to discard the result if it's not the case.
+ */
+static void iova_tree_alloc_map_in_hole(struct IOVATreeAllocArgs *args)
+{
+    const DMAMap *prev = args->prev, *this = args->this;
+    uint64_t hole_start, hole_last;
+
+    if (this && this->iova + this->size < args->iova_begin) {
+        return;
+    }
+
+    hole_start = MAX(prev ? prev->iova + prev->size + 1 : 0, args->iova_begin);
+    hole_last = this ? this->iova : HWADDR_MAX;
+
+    if (hole_last - hole_start > args->new_size) {
+        args->iova_result = hole_start;
+        args->iova_found = true;
+    }
+}
+
+/**
+ * Foreach dma node in the tree, compare if there is a hole with its previous
+ * node (or minimum iova address allowed) and the node.
+ *
+ * @key: Node iterating
+ * @value: Node iterating
+ * @pargs: Struct to communicate with the outside world
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
+    iova_tree_alloc_map_in_hole(args);
+    return args->iova_found;
+}
+
+int iova_tree_alloc_map(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
+                        hwaddr iova_last)
+{
+    struct IOVATreeAllocArgs args = {
+        .new_size = map->size,
+        .iova_begin = iova_begin,
+    };
+
+    if (unlikely(iova_last < iova_begin)) {
+        return IOVA_ERR_INVALID;
+    }
+
+    /*
+     * Find a valid hole for the mapping
+     *
+     * Assuming low iova_begin, so no need to do a binary search to
+     * locate the first node.
+     *
+     * TODO: Replace all this with g_tree_node_first/next/last when available
+     * (from glib since 2.68). To do it with g_tree_foreach complicates the
+     * code a lot.
+     *
+     */
+    g_tree_foreach(tree->tree, iova_tree_alloc_traverse, &args);
+    if (!args.iova_found) {
+        /*
+         * Either tree is empty or the last hole is still not checked.
+         * g_tree_foreach does not compare (last, iova_last] range, so we check
+         * it here.
+         */
+        iova_tree_alloc_args_iterate(&args, NULL);
+        iova_tree_alloc_map_in_hole(&args);
+    }
+
+    if (!args.iova_found || args.iova_result + map->size > iova_last) {
+        return IOVA_ERR_NOMEM;
+    }
+
+    map->iova = args.iova_result;
+    return iova_tree_insert(tree, map);
+}
+
 void iova_tree_destroy(IOVATree *tree)
 {
     g_tree_destroy(tree->tree);
-- 
2.7.4


