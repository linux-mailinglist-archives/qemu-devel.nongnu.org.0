Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040294C5BD8
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 14:58:12 +0100 (CET)
Received: from localhost ([::1]:59816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOK3u-0004ej-QV
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 08:58:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOJua-0001TT-MM
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 08:48:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOJuV-0000SI-RU
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 08:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645969707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbmLdYq/PIx50Nl3XQ3i736qCQbRkrt9Z9LCiFUEGoA=;
 b=PgCxb+6tY9HxL619mcQHFmIG+ER0fgcDKbONRWZh2a5lxdghyKoPAAU7SC5NrWA0McqXdQ
 GWZLqML5hG4q9OXnniIM6MliZVVnfOXIR+MuHhAEw5uQWpkaTofL3Joy/01yCJ7Z2H/4r1
 lDf0aQpitQS+yvKzmXjhe2SdyiD0Y5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-niK1kVcOOJaMo-rpQc2CeQ-1; Sun, 27 Feb 2022 08:48:23 -0500
X-MC-Unique: niK1kVcOOJaMo-rpQc2CeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D008E180FD72;
 Sun, 27 Feb 2022 13:48:21 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7528C84979;
 Sun, 27 Feb 2022 13:47:59 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/14] util: Add iova_tree_alloc
Date: Sun, 27 Feb 2022 14:41:05 +0100
Message-Id: <20220227134111.3254066-9-eperezma@redhat.com>
In-Reply-To: <20220227134111.3254066-1-eperezma@redhat.com>
References: <20220227134111.3254066-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, virtualization@lists.linux-foundation.org,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This iova tree function allows it to look for a hole in allocated
regions and return a totally new translation for a given translated
address.

It's usage is mainly to allow devices to access qemu address space,
remapping guest's one into a new iova space where qemu can add chunks of
addresses.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 include/qemu/iova-tree.h |  18 ++++++
 util/iova-tree.c         | 133 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 151 insertions(+)

diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index 8249edd764..a623136cd8 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -29,6 +29,7 @@
 #define  IOVA_OK           (0)
 #define  IOVA_ERR_INVALID  (-1) /* Invalid parameters */
 #define  IOVA_ERR_OVERLAP  (-2) /* IOVA range overlapped */
+#define  IOVA_ERR_NOMEM    (-3) /* Cannot allocate */
 
 typedef struct IOVATree IOVATree;
 typedef struct DMAMap {
@@ -119,6 +120,23 @@ const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova);
  */
 void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator);
 
+/**
+ * iova_tree_alloc:
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
 /**
  * iova_tree_destroy:
  *
diff --git a/util/iova-tree.c b/util/iova-tree.c
index 23ea35b7a4..302b01f1cc 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -16,6 +16,39 @@ struct IOVATree {
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
+ * @args  The alloc arguments
+ * @next  The next mapping in the tree. Can be NULL to signal the last one
+ */
+static void iova_tree_alloc_args_iterate(struct IOVATreeAllocArgs *args,
+                                         const DMAMap *next) {
+    args->prev = args->this;
+    args->this = next;
+}
+
 static int iova_tree_compare(gconstpointer a, gconstpointer b, gpointer data)
 {
     const DMAMap *m1 = a, *m2 = b;
@@ -107,6 +140,106 @@ int iova_tree_remove(IOVATree *tree, const DMAMap *map)
     return IOVA_OK;
 }
 
+/**
+ * Try to find an unallocated IOVA range between prev and this elements.
+ *
+ * @args Arguments to allocation
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
+    assert(iova_begin < iova_last);
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
+         * g_tree_foreach does not compare (last, iova_end] range, so we check
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
2.27.0


