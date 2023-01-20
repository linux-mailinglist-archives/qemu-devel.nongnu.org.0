Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBA5675491
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:33:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUN-0003PS-GP; Fri, 20 Jan 2023 07:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUL-0003LQ-42
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUI-0000Us-GD
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPWyZBa5la08Qousc0/ceMsFq5D32N1NJDZ3jwNpSAY=;
 b=TAFZgRNjMBHsS1pR5h2/tIlBlM18kT+KCFXrI3OxTJcJPYgLMkp6UGhyoS8uodVDhQYtyY
 lWrdqNKs2QUI2qMjaCnbDFB58FZbaT7qiN4R75dwXyEvJDpxMDen80yJBtW3ylm1s9kf6t
 nCbHSRbsdjLLQ1RJpv7oHmpJz+HVNeg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-7SB3Ep0ROvKqoHLLCFEiPA-1; Fri, 20 Jan 2023 07:27:12 -0500
X-MC-Unique: 7SB3Ep0ROvKqoHLLCFEiPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76ADB3814943;
 Fri, 20 Jan 2023 12:27:12 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB26340C6EC4;
 Fri, 20 Jan 2023 12:27:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 33/38] block/qapi: Introduce BlockGraphInfo
Date: Fri, 20 Jan 2023 13:26:28 +0100
Message-Id: <20230120122633.84983-34-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hanna Reitz <hreitz@redhat.com>

Introduce a new QAPI type BlockGraphInfo and an associated
bdrv_query_block_graph_info() function that recursively gathers
BlockNodeInfo objects through a block graph.

A follow-up patch is going to make "qemu-img info" use this to print
information about all nodes that are (usually implicitly) opened for a
given image file.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220620162704.80987-8-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json | 35 ++++++++++++++++++++++++++++++++
 include/block/qapi.h |  3 +++
 block/qapi.c         | 48 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 4cf2deeb6c..d703e0fb16 100644
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
+# Since: 8.0
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
+# Since: 8.0
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
index fa8bbc3fc7..7335c9728d 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -402,6 +402,54 @@ fail:
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
2.38.1


