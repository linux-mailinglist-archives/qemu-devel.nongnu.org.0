Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B848A55224B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:30:44 +0200 (CEST)
Received: from localhost ([::1]:41370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KIV-0001fQ-Jb
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFH-0005ir-PN
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFD-0005KL-PE
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655742437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QBl8D55J3wkL4vzH5q+CBhlJZXBKayii7nNAPVHdt3o=;
 b=RhouIMERMo8hilLELLuaFo1X9wMrVcHcpTyFQ4l+ibBzDcnQ9nGQbNdQaVHZ+BtyGhr0lk
 FuyQK9M0ORQpp9zNhLqnx1HvDSRJ5xZ6jYFcd1SomO3Mmc5DpVQe8R2xxNlh2XU4vw7fws
 ngP5qwG9t1cJSuHGaxbIp7QS1YcGffs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-meNQnjIlP_SAzpjTFyidqA-1; Mon, 20 Jun 2022 12:27:14 -0400
X-MC-Unique: meNQnjIlP_SAzpjTFyidqA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2422585A580;
 Mon, 20 Jun 2022 16:27:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B40D640466B2;
 Mon, 20 Jun 2022 16:27:13 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 05/12] qemu-img: Use BlockNodeInfo
Date: Mon, 20 Jun 2022 18:26:57 +0200
Message-Id: <20220620162704.80987-6-hreitz@redhat.com>
In-Reply-To: <20220620162704.80987-1-hreitz@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
---
 qapi/block-core.json           |  4 +--
 include/block/qapi.h           |  2 +-
 block/monitor/block-hmp-cmds.c |  2 +-
 block/qapi.c                   |  2 +-
 qemu-img.c                     | 48 +++++++++++++++++-----------------
 5 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 8c06deacdf..d5d1c8ff15 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5680,9 +5680,9 @@
 ##
 # @DummyBlockCoreForceArrays:
 #
-# Not used by QMP; hack to let us use ImageInfoList internally
+# Not used by QMP; hack to let us use BlockNodeInfoList internally
 #
 # Since: 7.1
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
index bfb3c043a0..d286f2d1c5 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -734,7 +734,7 @@ static void print_block_info(Monitor *mon, BlockInfo *info,
         monitor_printf(mon, "\nImages:\n");
         image_info = inserted->image;
         while (1) {
-                bdrv_image_info_dump(image_info);
+            bdrv_node_info_dump(qapi_ImageInfo_base(image_info));
             if (image_info->has_backing_image) {
                 image_info = image_info->backing_image;
             } else {
diff --git a/block/qapi.c b/block/qapi.c
index e5022b4481..ad88bf9b38 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -865,7 +865,7 @@ void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
     visit_free(v);
 }
 
-void bdrv_image_info_dump(ImageInfo *info)
+void bdrv_node_info_dump(BlockNodeInfo *info)
 {
     char *size_buf, *dsize_buf;
     if (!info->has_actual_size) {
diff --git a/qemu-img.c b/qemu-img.c
index 4cf4d2423d..3b1f950c85 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2800,13 +2800,13 @@ static void dump_snapshots(BlockDriverState *bs)
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
@@ -2816,13 +2816,13 @@ static void dump_json_image_info_list(ImageInfoList *list)
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
@@ -2832,9 +2832,9 @@ static void dump_json_image_info(ImageInfo *info)
     g_string_free(str, true);
 }
 
-static void dump_human_image_info_list(ImageInfoList *list)
+static void dump_human_image_info_list(BlockNodeInfoList *list)
 {
-    ImageInfoList *elem;
+    BlockNodeInfoList *elem;
     bool delim = false;
 
     for (elem = list; elem; elem = elem->next) {
@@ -2843,7 +2843,7 @@ static void dump_human_image_info_list(ImageInfoList *list)
         }
         delim = true;
 
-        bdrv_image_info_dump(elem->value);
+        bdrv_node_info_dump(elem->value);
     }
 }
 
@@ -2853,24 +2853,24 @@ static gboolean str_equal_func(gconstpointer a, gconstpointer b)
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
 
@@ -2879,7 +2879,7 @@ static ImageInfoList *collect_image_info_list(bool image_opts,
     while (filename) {
         BlockBackend *blk;
         BlockDriverState *bs;
-        ImageInfo *info;
+        BlockNodeInfo *info;
 
         if (g_hash_table_lookup_extended(filenames, filename, NULL, NULL)) {
             error_report("Backing file '%s' creates an infinite loop.",
@@ -2896,7 +2896,7 @@ static ImageInfoList *collect_image_info_list(bool image_opts,
         }
         bs = blk_bs(blk);
 
-        bdrv_query_image_info(bs, &info, &err);
+        bdrv_query_block_node_info(bs, &info, &err);
         if (err) {
             error_report_err(err);
             blk_unref(blk);
@@ -2929,7 +2929,7 @@ static ImageInfoList *collect_image_info_list(bool image_opts,
     return head;
 
 err:
-    qapi_free_ImageInfoList(head);
+    qapi_free_BlockNodeInfoList(head);
     g_hash_table_destroy(filenames);
     return NULL;
 }
@@ -2940,7 +2940,7 @@ static int img_info(int argc, char **argv)
     OutputFormat output_format = OFORMAT_HUMAN;
     bool chain = false;
     const char *filename, *fmt, *output;
-    ImageInfoList *list;
+    BlockNodeInfoList *list;
     bool image_opts = false;
     bool force_share = false;
 
@@ -3019,14 +3019,14 @@ static int img_info(int argc, char **argv)
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
2.35.3


