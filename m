Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9CF55225F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:37:33 +0200 (CEST)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KP7-0006yI-0T
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFJ-0005jm-J2
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFF-0005Ko-L8
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655742439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=azDHCkLZKgDRmP2fzg4kWG8pSOIHzq7N9h+EqjJrB+0=;
 b=Zfof5ZpllOv0AeuvDN5aFqY5yC74Du2JCszyDwYrSuzO6bpjVUsqREe9TVrGyWFikmChdN
 hrCKK+s0tQ19Zo0RwbQQQljJssqrGqCNxcbMOjjRGhRWlmX1UlcnyhTGDQA4DFvH6xJE5K
 3VzMctH6Y/3mCHkF2JFpVmBpzxyA9BQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-fb5aJ-ykNcSMrHuHG0v4tw-1; Mon, 20 Jun 2022 12:27:17 -0400
X-MC-Unique: fb5aJ-ykNcSMrHuHG0v4tw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 700B03C30103;
 Mon, 20 Jun 2022 16:27:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BE981121314;
 Mon, 20 Jun 2022 16:27:17 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 07/12] block/qapi: Introduce BlockGraphInfo
Date: Mon, 20 Jun 2022 18:26:59 +0200
Message-Id: <20220620162704.80987-8-hreitz@redhat.com>
In-Reply-To: <20220620162704.80987-1-hreitz@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a new QAPI type BlockGraphInfo and an associated
bdrv_query_block_graph_info() function that recursively gathers
BlockNodeInfo objects through a block graph.

A follow-up patch is going to make "qemu-img info" use this to print
information about all nodes that are (usually implicitly) opened for a
given image file.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 qapi/block-core.json | 35 ++++++++++++++++++++++++++++++++
 include/block/qapi.h |  3 +++
 block/qapi.c         | 48 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index d5d1c8ff15..b7e5708487 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -307,6 +307,41 @@
       '*backing-image': 'ImageInfo'
   } }
 
+##
+# @BlockChildInfo:
+#
+# Information about all nodes in the block graph starting at some node,
+# annotated with information about that node in relation to its parent.
+#
+# @name: Child name of the root node in the BlockGraphInfo struct, in its role
+#        as the child of some undescribed parent node
+#
+# @info: Block graph information starting at this node
+#
+# Since: 7.1
+##
+{ 'struct': 'BlockChildInfo',
+  'data': {
+      'name': 'str',
+      'info': 'BlockGraphInfo'
+  } }
+
+##
+# @BlockGraphInfo:
+#
+# Information about all nodes in a block (sub)graph in the form of BlockNodeInfo
+# data.
+# The base BlockNodeInfo struct contains the information for the (sub)graph's
+# root node.
+#
+# @children: Array of links to this node's child nodes' information
+#
+# Since: 7.1
+##
+{ 'struct': 'BlockGraphInfo',
+  'base': 'BlockNodeInfo',
+  'data': { 'children': ['BlockChildInfo'] } }
+
 ##
 # @ImageCheck:
 #
diff --git a/include/block/qapi.h b/include/block/qapi.h
index 2174bf8fa2..196436020e 100644
--- a/include/block/qapi.h
+++ b/include/block/qapi.h
@@ -43,6 +43,9 @@ void bdrv_query_image_info(BlockDriverState *bs,
                            bool flat,
                            bool skip_implicit_filters,
                            Error **errp);
+void bdrv_query_block_graph_info(BlockDriverState *bs,
+                                 BlockGraphInfo **p_info,
+                                 Error **errp);
 
 void bdrv_snapshot_dump(QEMUSnapshotInfo *sn);
 void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
diff --git a/block/qapi.c b/block/qapi.c
index 5d0a8d2ce3..f208c21ccf 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -411,6 +411,54 @@ fail:
     qapi_free_ImageInfo(info);
 }
 
+/**
+ * bdrv_query_block_graph_info:
+ * @bs: root node to start from
+ * @p_info: location to store image information
+ * @errp: location to store error information
+ *
+ * Store image information about the graph starting from @bs in @p_info.
+ *
+ * @p_info will be set only on success. On error, store error in @errp.
+ */
+void bdrv_query_block_graph_info(BlockDriverState *bs,
+                                 BlockGraphInfo **p_info,
+                                 Error **errp)
+{
+    BlockGraphInfo *info;
+    BlockChildInfoList **children_list_tail;
+    BdrvChild *c;
+    ERRP_GUARD();
+
+    info = g_new0(BlockGraphInfo, 1);
+    bdrv_do_query_node_info(bs, qapi_BlockGraphInfo_base(info), errp);
+    if (*errp) {
+        goto fail;
+    }
+
+    children_list_tail = &info->children;
+
+    QLIST_FOREACH(c, &bs->children, next) {
+        BlockChildInfo *c_info;
+
+        c_info = g_new0(BlockChildInfo, 1);
+        QAPI_LIST_APPEND(children_list_tail, c_info);
+
+        c_info->name = g_strdup(c->name);
+        bdrv_query_block_graph_info(c->bs, &c_info->info, errp);
+        if (*errp) {
+            goto fail;
+        }
+    }
+
+    *p_info = info;
+    return;
+
+fail:
+    assert(*errp != NULL);
+    qapi_free_BlockGraphInfo(info);
+}
+
 /* @p_info will be set only on success. */
 static void bdrv_query_info(BlockBackend *blk, BlockInfo **p_info,
                             Error **errp)
-- 
2.35.3


