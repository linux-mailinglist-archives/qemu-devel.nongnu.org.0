Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8FE675474
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUH-0003Ej-5V; Fri, 20 Jan 2023 07:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUE-0003Cc-OX
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUC-0000SB-UU
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTxhWJbC+kEn8/+6zYt5LC7Zm/Z7PfJhfSuvZ09yEiE=;
 b=cZdeDewxJJD6YKNxQYDNJLgUm8VS5mlK03vRwXxnR3J04Oy9ygXyp90S+iVjYw0lJ9CKcO
 O8879T1Z0JQt0FamNvjqZUv/ZLihBGE73jO2yCJm4PXwxezMubgWFpObv7Cr3p7+d+w9rj
 fnGipIg9mAz75ftIXGPTqTOSnJg2wI0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-1Y146rHeMbq33y9xNDvVXg-1; Fri, 20 Jan 2023 07:27:08 -0500
X-MC-Unique: 1Y146rHeMbq33y9xNDvVXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 509B8857A81;
 Fri, 20 Jan 2023 12:27:08 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8592440C6EC4;
 Fri, 20 Jan 2023 12:27:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 29/38] block/vmdk: Change extent info type
Date: Fri, 20 Jan 2023 13:26:24 +0100
Message-Id: <20230120122633.84983-30-kwolf@redhat.com>
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

VMDK's implementation of .bdrv_get_specific_info() returns information
about its extent files, ostensibly in the form of ImageInfo objects.
However, it does not get this information through
bdrv_query_image_info(), but fills only a select few fields with custom
information that does not always match the fields' purposes.

For example, @format, which is supposed to be a block driver name, is
filled with the extent type, e.g. SPARSE or FLAT.

In ImageInfo, @compressed shows whether the data that can be seen in the
image is stored in compressed form or not.  For example, a compressed
qcow2 image will store compressed data in its data file, but when
accessing the qcow2 node, you will see normal data.  This is not how
VMDK uses the @compressed field for its extent files: Instead, it
signifies whether accessing the extent file will yield compressed data
(which the VMDK driver then (de-)compresses).

Create a new structure to represent the extent information.  This allows
us to clarify the fields' meanings, and it clearly shows that these are
not complete ImageInfo objects.  (That is, if a user wants an extent
file's ImageInfo object, they will need to query it separately, and will
not get it from ImageInfoSpecificVmdk.extents.)

Note that this removes the last use of ['ImageInfo'] (i.e. an array of
ImageInfo objects), so the QAPI generator will no longer generate
ImageInfoList by default.  However, we use it in qemu-img.c, so we need
to create a dummy object to force the generate to create that type,
similarly to DummyForceArrays in machine.json (introduced in commit
9f08c8ec73878122ad4b061ed334f0437afaaa32 ("qapi: Lazy creation of array
types")).

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220620162704.80987-4-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json | 38 +++++++++++++++++++++++++++++++++++++-
 block/vmdk.c         |  8 ++++----
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index f5d822cbd6..4b9365167f 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -124,7 +124,33 @@
       'create-type': 'str',
       'cid': 'int',
       'parent-cid': 'int',
-      'extents': ['ImageInfo']
+      'extents': ['VmdkExtentInfo']
+  } }
+
+##
+# @VmdkExtentInfo:
+#
+# Information about a VMDK extent file
+#
+# @filename: Name of the extent file
+#
+# @format: Extent type (e.g. FLAT or SPARSE)
+#
+# @virtual-size: Number of bytes covered by this extent
+#
+# @cluster-size: Cluster size in bytes (for non-flat extents)
+#
+# @compressed: Whether this extent contains compressed data
+#
+# Since: 8.0
+##
+{ 'struct': 'VmdkExtentInfo',
+  'data': {
+      'filename': 'str',
+      'format': 'str',
+      'virtual-size': 'int',
+      '*cluster-size': 'int',
+      '*compressed': 'bool'
   } }
 
 ##
@@ -5754,3 +5780,13 @@
   'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
   'returns': 'SnapshotInfo',
   'allow-preconfig': true }
+
+##
+# @DummyBlockCoreForceArrays:
+#
+# Not used by QMP; hack to let us use ImageInfoList internally
+#
+# Since: 8.0
+##
+{ 'struct': 'DummyBlockCoreForceArrays',
+  'data': { 'unused-image-info': ['ImageInfo'] } }
diff --git a/block/vmdk.c b/block/vmdk.c
index 1bba61ad7d..5b0eae877e 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2898,12 +2898,12 @@ static int vmdk_has_zero_init(BlockDriverState *bs)
     return 1;
 }
 
-static ImageInfo *vmdk_get_extent_info(VmdkExtent *extent)
+static VmdkExtentInfo *vmdk_get_extent_info(VmdkExtent *extent)
 {
-    ImageInfo *info = g_new0(ImageInfo, 1);
+    VmdkExtentInfo *info = g_new0(VmdkExtentInfo, 1);
 
     bdrv_refresh_filename(extent->file->bs);
-    *info = (ImageInfo){
+    *info = (VmdkExtentInfo){
         .filename         = g_strdup(extent->file->bs->filename),
         .format           = g_strdup(extent->type),
         .virtual_size     = extent->sectors * BDRV_SECTOR_SIZE,
@@ -2982,7 +2982,7 @@ static ImageInfoSpecific *vmdk_get_specific_info(BlockDriverState *bs,
     int i;
     BDRVVmdkState *s = bs->opaque;
     ImageInfoSpecific *spec_info = g_new0(ImageInfoSpecific, 1);
-    ImageInfoList **tail;
+    VmdkExtentInfoList **tail;
 
     *spec_info = (ImageInfoSpecific){
         .type = IMAGE_INFO_SPECIFIC_KIND_VMDK,
-- 
2.38.1


