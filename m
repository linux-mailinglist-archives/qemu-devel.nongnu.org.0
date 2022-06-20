Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3358155226B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:40:35 +0200 (CEST)
Received: from localhost ([::1]:40714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KS2-0003yu-0n
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFO-0005ni-07
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFM-0005Na-46
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655742447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QJ8Nuc3zkFJwQM3cTVy/o2w2yLOJqNRxWSNZG+R81Yo=;
 b=OyHcDg37/1mJvxNlEZitJEcgncKggp0lLfsUjxDgYuNhOYFITcntziE7M3UXWJYWMEN0oZ
 bX83+pYGSFSC/Z6Kmek00zsFUrjQ83YgD/tQGa/viXQK6nvX1tn4juESGDXslQAILpDKUm
 +uauXgRscV/dWZw1YN6KdpaZ/YoK5To=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-7C6cLFItPIOs5PhVMZ0zlQ-1; Mon, 20 Jun 2022 12:27:24 -0400
X-MC-Unique: 7C6cLFItPIOs5PhVMZ0zlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27CE4811E75;
 Mon, 20 Jun 2022 16:27:24 +0000 (UTC)
Received: from localhost (unknown [10.39.193.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B678D2166B26;
 Mon, 20 Jun 2022 16:27:23 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 11/12] qemu-img: Let info print block graph
Date: Mon, 20 Jun 2022 18:27:03 +0200
Message-Id: <20220620162704.80987-12-hreitz@redhat.com>
In-Reply-To: <20220620162704.80987-1-hreitz@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

For every node in the backing chain, collect its BlockGraphInfo struct
using bdrv_query_block_graph_info().  Print all nodes' information,
indenting child nodes and labelling them with a path constructed from
the child names leading to the node from the root (e.g. /file/file).

Note that we open each image with BDRV_O_NO_BACKING, so its backing
child is omitted from this graph, and thus presented in the previous
manner: By simply concatenating all images' information, separated with
blank lines.

This affects two iotests:
- 065: Here we try to get the format node's format specific information.
  The pre-patch code does so by taking all lines from "Format specific
  information:" until an empty line.  This format specific information
  is no longer followed by an empty line, though, but by child node
  information, so limit the range by "Child node '/file':".
- 302: Calls qemu_img() for qemu-img info directly, which does not
  filter the output, so the child node information ends up in the
  output.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 qapi/block-core.json       |  4 +--
 qemu-img.c                 | 69 ++++++++++++++++++++++++++------------
 tests/qemu-iotests/065     |  2 +-
 tests/qemu-iotests/302.out |  5 +++
 4 files changed, 56 insertions(+), 24 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index b7e5708487..5597c783e7 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5715,9 +5715,9 @@
 ##
 # @DummyBlockCoreForceArrays:
 #
-# Not used by QMP; hack to let us use BlockNodeInfoList internally
+# Not used by QMP; hack to let us use BlockGraphInfoList internally
 #
 # Since: 7.1
 ##
 { 'struct': 'DummyBlockCoreForceArrays',
-  'data': { 'unused-block-node-info': ['BlockNodeInfo'] } }
+  'data': { 'unused-block-graph-info': ['BlockGraphInfo'] } }
diff --git a/qemu-img.c b/qemu-img.c
index f835ce6feb..6da4064d57 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2800,13 +2800,13 @@ static void dump_snapshots(BlockDriverState *bs)
     g_free(sn_tab);
 }
 
-static void dump_json_block_node_info_list(BlockNodeInfoList *list)
+static void dump_json_block_graph_info_list(BlockGraphInfoList *list)
 {
     GString *str;
     QObject *obj;
     Visitor *v = qobject_output_visitor_new(&obj);
 
-    visit_type_BlockNodeInfoList(v, NULL, &list, &error_abort);
+    visit_type_BlockGraphInfoList(v, NULL, &list, &error_abort);
     visit_complete(v, &obj);
     str = qobject_to_json_pretty(obj, true);
     assert(str != NULL);
@@ -2816,13 +2816,13 @@ static void dump_json_block_node_info_list(BlockNodeInfoList *list)
     g_string_free(str, true);
 }
 
-static void dump_json_block_node_info(BlockNodeInfo *info)
+static void dump_json_block_graph_info(BlockGraphInfo *info)
 {
     GString *str;
     QObject *obj;
     Visitor *v = qobject_output_visitor_new(&obj);
 
-    visit_type_BlockNodeInfo(v, NULL, &info, &error_abort);
+    visit_type_BlockGraphInfo(v, NULL, &info, &error_abort);
     visit_complete(v, &obj);
     str = qobject_to_json_pretty(obj, true);
     assert(str != NULL);
@@ -2832,9 +2832,29 @@ static void dump_json_block_node_info(BlockNodeInfo *info)
     g_string_free(str, true);
 }
 
-static void dump_human_image_info_list(BlockNodeInfoList *list)
+static void dump_human_image_info(BlockGraphInfo *info, int indentation,
+                                  const char *path)
 {
-    BlockNodeInfoList *elem;
+    BlockChildInfoList *children_list;
+
+    bdrv_node_info_dump(qapi_BlockGraphInfo_base(info), indentation);
+
+    for (children_list = info->children; children_list;
+         children_list = children_list->next)
+    {
+        BlockChildInfo *child = children_list->value;
+        g_autofree char *child_path;
+
+        printf("%*sChild node '%s%s':\n",
+               indentation * 4, "", path, child->name);
+        child_path = g_strdup_printf("%s%s/", path, child->name);
+        dump_human_image_info(child->info, indentation + 1, child_path);
+    }
+}
+
+static void dump_human_image_info_list(BlockGraphInfoList *list)
+{
+    BlockGraphInfoList *elem;
     bool delim = false;
 
     for (elem = list; elem; elem = elem->next) {
@@ -2843,7 +2863,7 @@ static void dump_human_image_info_list(BlockNodeInfoList *list)
         }
         delim = true;
 
-        bdrv_node_info_dump(elem->value, 0);
+        dump_human_image_info(elem->value, 0, "/");
     }
 }
 
@@ -2853,7 +2873,7 @@ static gboolean str_equal_func(gconstpointer a, gconstpointer b)
 }
 
 /**
- * Open an image file chain and return an BlockNodeInfoList
+ * Open an image file chain and return an BlockGraphInfoList
  *
  * @filename: topmost image filename
  * @fmt: topmost image format (may be NULL to autodetect)
@@ -2864,13 +2884,13 @@ static gboolean str_equal_func(gconstpointer a, gconstpointer b)
  * opening an image file.  If there was an error a message will have been
  * printed to stderr.
  */
-static BlockNodeInfoList *collect_image_info_list(bool image_opts,
-                                                  const char *filename,
-                                                  const char *fmt,
-                                                  bool chain, bool force_share)
+static BlockGraphInfoList *collect_image_info_list(bool image_opts,
+                                                   const char *filename,
+                                                   const char *fmt,
+                                                   bool chain, bool force_share)
 {
-    BlockNodeInfoList *head = NULL;
-    BlockNodeInfoList **tail = &head;
+    BlockGraphInfoList *head = NULL;
+    BlockGraphInfoList **tail = &head;
     GHashTable *filenames;
     Error *err = NULL;
 
@@ -2879,7 +2899,7 @@ static BlockNodeInfoList *collect_image_info_list(bool image_opts,
     while (filename) {
         BlockBackend *blk;
         BlockDriverState *bs;
-        BlockNodeInfo *info;
+        BlockGraphInfo *info;
 
         if (g_hash_table_lookup_extended(filenames, filename, NULL, NULL)) {
             error_report("Backing file '%s' creates an infinite loop.",
@@ -2896,7 +2916,14 @@ static BlockNodeInfoList *collect_image_info_list(bool image_opts,
         }
         bs = blk_bs(blk);
 
-        bdrv_query_block_node_info(bs, &info, &err);
+        /*
+         * Note that the returned BlockGraphInfo object will not have
+         * information about this image's backing node, because we have opened
+         * it with BDRV_O_NO_BACKING.  Printing this object will therefore not
+         * duplicate the backing chain information that we obtain by walking
+         * the chain manually here.
+         */
+        bdrv_query_block_graph_info(bs, &info, &err);
         if (err) {
             error_report_err(err);
             blk_unref(blk);
@@ -2929,7 +2956,7 @@ static BlockNodeInfoList *collect_image_info_list(bool image_opts,
     return head;
 
 err:
-    qapi_free_BlockNodeInfoList(head);
+    qapi_free_BlockGraphInfoList(head);
     g_hash_table_destroy(filenames);
     return NULL;
 }
@@ -2940,7 +2967,7 @@ static int img_info(int argc, char **argv)
     OutputFormat output_format = OFORMAT_HUMAN;
     bool chain = false;
     const char *filename, *fmt, *output;
-    BlockNodeInfoList *list;
+    BlockGraphInfoList *list;
     bool image_opts = false;
     bool force_share = false;
 
@@ -3019,14 +3046,14 @@ static int img_info(int argc, char **argv)
         break;
     case OFORMAT_JSON:
         if (chain) {
-            dump_json_block_node_info_list(list);
+            dump_json_block_graph_info_list(list);
         } else {
-            dump_json_block_node_info(list->value);
+            dump_json_block_graph_info(list->value);
         }
         break;
     }
 
-    qapi_free_BlockNodeInfoList(list);
+    qapi_free_BlockGraphInfoList(list);
     return 0;
 }
 
diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index b724c89c7c..b76701c71e 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -56,7 +56,7 @@ class TestQemuImgInfo(TestImageInfoSpecific):
     def test_human(self):
         data = qemu_img('info', '--output=human', test_img).stdout.split('\n')
         data = data[(data.index('Format specific information:') + 1)
-                    :data.index('')]
+                    :data.index("Child node '/file':")]
         for field in data:
             self.assertTrue(re.match('^ {4}[^ ]', field) is not None)
         data = [line.strip() for line in data]
diff --git a/tests/qemu-iotests/302.out b/tests/qemu-iotests/302.out
index 3e7c281b91..edfa1c4f05 100644
--- a/tests/qemu-iotests/302.out
+++ b/tests/qemu-iotests/302.out
@@ -4,6 +4,11 @@ image: nbd+unix:///exp?socket=SOCK_DIR/PID-nbd-sock
 file format: raw
 virtual size: 448 KiB (458752 bytes)
 disk size: unavailable
+Child node '/file':
+    image: nbd+unix:///exp?socket=SOCK_DIR/PID-nbd-sock
+    file format: nbd
+    virtual size: 448 KiB (458752 bytes)
+    disk size: unavailable
 
 === Converted image info ===
 image: TEST_IMG
-- 
2.35.3


