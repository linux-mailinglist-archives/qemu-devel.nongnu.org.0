Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289C9675464
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:28:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUH-0003FF-IH; Fri, 20 Jan 2023 07:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUE-0003D8-WD
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUC-0000SD-Uo
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gx9Ow3wyuFxPhg8aoXtteaQDXrJeHpk9HjZIhsDx+eU=;
 b=SCJc+bbxan/YvMNgFuuN6DWowHO1Cqb7NYlp0fNoFdqGKhc98cOs78rYlskXXie14F/mf2
 QegzphsLZZP2h1FBqrD9Z5OnqrOP9n/uEhrGvYVg+BmWSTOPyHiyMlahZHOAyHxYZuhP87
 h1sm7gozEFTPLAdTP55y3nPIxowiPOs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-Ui_Wn4GaM--6PAIEiBe6cw-1; Fri, 20 Jan 2023 07:27:10 -0500
X-MC-Unique: Ui_Wn4GaM--6PAIEiBe6cw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63761101AA63;
 Fri, 20 Jan 2023 12:27:10 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97A8940C6EC4;
 Fri, 20 Jan 2023 12:27:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 31/38] qemu-img: Use BlockNodeInfo
Date: Fri, 20 Jan 2023 13:26:26 +0100
Message-Id: <20230120122633.84983-32-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

qemu-img info never uses ImageInfo's backing-image field, because it
opens the backing chain one by one with BDRV_O_NO_BACKING, and prints
all backing chain nodes' information consecutively.  Use BlockNodeInfo
to make it clear that we only print information about a single node, and
that we are not using the backing-image field.

Notably, bdrv_image_info_dump() does not evaluate the backing-image
field, so we can easily make it take a BlockNodeInfo pointer (and
consequentially rename it to bdrv_node_info_dump()).  It makes more
sense this way, because again, the interface now makes it syntactically
clear that backing-image is ignored by this function.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220620162704.80987-6-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json           |  4 +--
 include/block/qapi.h           |  2 +-
 block/monitor/block-hmp-cmds.c |  2 +-
 block/qapi.c                   |  2 +-
 qemu-img.c                     | 48 +++++++++++++++++-----------------
 5 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 7720da0498..4cf2deeb6c 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5796,9 +5796,9 @@
 ##
 # @DummyBlockCoreForceArrays:
 #
-# Not used by QMP; hack to let us use ImageInfoList internally
+# Not used by QMP; hack to let us use BlockNodeInfoList internally
 #
 # Since: 8.0
 ##
 { 'struct': 'DummyBlockCoreForceArrays',
-  'data': { 'unused-image-info': ['ImageInfo'] } }
+  'data': { 'unused-block-node-info': ['BlockNodeInfo'] } }
diff --git a/include/block/qapi.h b/include/block/qapi.h
index c7de4e3fa9..22198dcd0c 100644
--- a/include/block/qapi.h
+++ b/include/block/qapi.h
@@ -45,5 +45,5 @@ void bdrv_query_image_info(BlockDriverState *bs,
 void bdrv_snapshot_dump(QEMUSnapshotInfo *sn);
 void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
                                    const char *prefix);
-void bdrv_image_info_dump(ImageInfo *info);
+void bdrv_node_info_dump(BlockNodeInfo *info);
 #endif
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 0ff7c84039..d6eaacdb12 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -725,7 +725,7 @@ static void print_block_info(Monitor *mon, BlockInfo *info,
         monitor_printf(mon, "\nImages:\n");
         image_info = inserted->image;
         while (1) {
-                bdrv_image_info_dump(image_info);
+            bdrv_node_info_dump(qapi_ImageInfo_base(image_info));
             if (image_info->backing_image) {
                 image_info = image_info->backing_image;
             } else {
diff --git a/block/qapi.c b/block/qapi.c
index b3f812a071..21ef684a1c 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -847,7 +847,7 @@ void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
     visit_free(v);
 }
 
-void bdrv_image_info_dump(ImageInfo *info)
+void bdrv_node_info_dump(BlockNodeInfo *info)
 {
     char *size_buf, *dsize_buf;
     if (!info->has_actual_size) {
diff --git a/qemu-img.c b/qemu-img.c
index c3671d4890..0cad524267 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2816,13 +2816,13 @@ static void dump_snapshots(BlockDriverState *bs)
     g_free(sn_tab);
 }
 
-static void dump_json_image_info_list(ImageInfoList *list)
+static void dump_json_block_node_info_list(BlockNodeInfoList *list)
 {
     GString *str;
     QObject *obj;
     Visitor *v = qobject_output_visitor_new(&obj);
 
-    visit_type_ImageInfoList(v, NULL, &list, &error_abort);
+    visit_type_BlockNodeInfoList(v, NULL, &list, &error_abort);
     visit_complete(v, &obj);
     str = qobject_to_json_pretty(obj, true);
     assert(str != NULL);
@@ -2832,13 +2832,13 @@ static void dump_json_image_info_list(ImageInfoList *list)
     g_string_free(str, true);
 }
 
-static void dump_json_image_info(ImageInfo *info)
+static void dump_json_block_node_info(BlockNodeInfo *info)
 {
     GString *str;
     QObject *obj;
     Visitor *v = qobject_output_visitor_new(&obj);
 
-    visit_type_ImageInfo(v, NULL, &info, &error_abort);
+    visit_type_BlockNodeInfo(v, NULL, &info, &error_abort);
     visit_complete(v, &obj);
     str = qobject_to_json_pretty(obj, true);
     assert(str != NULL);
@@ -2848,9 +2848,9 @@ static void dump_json_image_info(ImageInfo *info)
     g_string_free(str, true);
 }
 
-static void dump_human_image_info_list(ImageInfoList *list)
+static void dump_human_image_info_list(BlockNodeInfoList *list)
 {
-    ImageInfoList *elem;
+    BlockNodeInfoList *elem;
     bool delim = false;
 
     for (elem = list; elem; elem = elem->next) {
@@ -2859,7 +2859,7 @@ static void dump_human_image_info_list(ImageInfoList *list)
         }
         delim = true;
 
-        bdrv_image_info_dump(elem->value);
+        bdrv_node_info_dump(elem->value);
     }
 }
 
@@ -2869,24 +2869,24 @@ static gboolean str_equal_func(gconstpointer a, gconstpointer b)
 }
 
 /**
- * Open an image file chain and return an ImageInfoList
+ * Open an image file chain and return an BlockNodeInfoList
  *
  * @filename: topmost image filename
  * @fmt: topmost image format (may be NULL to autodetect)
  * @chain: true  - enumerate entire backing file chain
  *         false - only topmost image file
  *
- * Returns a list of ImageInfo objects or NULL if there was an error opening an
- * image file.  If there was an error a message will have been printed to
- * stderr.
+ * Returns a list of BlockNodeInfo objects or NULL if there was an error
+ * opening an image file.  If there was an error a message will have been
+ * printed to stderr.
  */
-static ImageInfoList *collect_image_info_list(bool image_opts,
-                                              const char *filename,
-                                              const char *fmt,
-                                              bool chain, bool force_share)
+static BlockNodeInfoList *collect_image_info_list(bool image_opts,
+                                                  const char *filename,
+                                                  const char *fmt,
+                                                  bool chain, bool force_share)
 {
-    ImageInfoList *head = NULL;
-    ImageInfoList **tail = &head;
+    BlockNodeInfoList *head = NULL;
+    BlockNodeInfoList **tail = &head;
     GHashTable *filenames;
     Error *err = NULL;
 
@@ -2895,7 +2895,7 @@ static ImageInfoList *collect_image_info_list(bool image_opts,
     while (filename) {
         BlockBackend *blk;
         BlockDriverState *bs;
-        ImageInfo *info;
+        BlockNodeInfo *info;
 
         if (g_hash_table_lookup_extended(filenames, filename, NULL, NULL)) {
             error_report("Backing file '%s' creates an infinite loop.",
@@ -2912,7 +2912,7 @@ static ImageInfoList *collect_image_info_list(bool image_opts,
         }
         bs = blk_bs(blk);
 
-        bdrv_query_image_info(bs, &info, &err);
+        bdrv_query_block_node_info(bs, &info, &err);
         if (err) {
             error_report_err(err);
             blk_unref(blk);
@@ -2945,7 +2945,7 @@ static ImageInfoList *collect_image_info_list(bool image_opts,
     return head;
 
 err:
-    qapi_free_ImageInfoList(head);
+    qapi_free_BlockNodeInfoList(head);
     g_hash_table_destroy(filenames);
     return NULL;
 }
@@ -2956,7 +2956,7 @@ static int img_info(int argc, char **argv)
     OutputFormat output_format = OFORMAT_HUMAN;
     bool chain = false;
     const char *filename, *fmt, *output;
-    ImageInfoList *list;
+    BlockNodeInfoList *list;
     bool image_opts = false;
     bool force_share = false;
 
@@ -3035,14 +3035,14 @@ static int img_info(int argc, char **argv)
         break;
     case OFORMAT_JSON:
         if (chain) {
-            dump_json_image_info_list(list);
+            dump_json_block_node_info_list(list);
         } else {
-            dump_json_image_info(list->value);
+            dump_json_block_node_info(list->value);
         }
         break;
     }
 
-    qapi_free_ImageInfoList(list);
+    qapi_free_BlockNodeInfoList(list);
     return 0;
 }
 
-- 
2.38.1


