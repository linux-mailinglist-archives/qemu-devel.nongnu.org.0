Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09438552246
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:29:36 +0200 (CEST)
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KHO-0008Ty-KC
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KF9-0005el-5P
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KF6-0005IL-Pl
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655742432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6RsjjJd0xWLonB3st7VmcEoP3cHKpd4nP4y316E//KM=;
 b=QvA3+Z4o7CZnOq0fET0ivvC6GhRIw5qzmtLIa0Q5J974lcc1z3qhz0LlN+Hj5ZGC3DPUqm
 VXLNGfnbi5URukDhts7QS1mrnlfkafLNWZmjanOelKZ4/5rx1l2l380SoItKuhK0TrMct8
 zQfAVU+oLYJAYxgoXYhEfZmAtD0AwQQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-gEHCzc_HNiWrGRzRXffiWA-1; Mon, 20 Jun 2022 12:27:10 -0400
X-MC-Unique: gEHCzc_HNiWrGRzRXffiWA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 826A6101E166;
 Mon, 20 Jun 2022 16:27:10 +0000 (UTC)
Received: from localhost (unknown [10.39.193.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D12B1121314;
 Mon, 20 Jun 2022 16:27:10 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 03/12] block/vmdk: Change extent info type
Date: Mon, 20 Jun 2022 18:26:55 +0200
Message-Id: <20220620162704.80987-4-hreitz@redhat.com>
In-Reply-To: <20220620162704.80987-1-hreitz@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
---
I'm not sure whether this is an incompatible change.  I'm also not sure
if it even matters whether it's an incompatible change (i.e. whether
anyone cares).

I believe we can get away without this change.  I find it useful to make
it clear that (A) this extent information is not what you would find in
other ImageInfo objects (i.e., I consider this a fix for
ImageInfoSpecificVmdk's @extents field), and (B) that the upcoming
BlockGraphInfo type will not duplicate the extent nodes' ImageInfo
information, because those are actual ImageInfo objects.

We can probably replace this patch by clarifying all of this in
documentation, but if possible I would prefer a syntactic clarification
(as done here).
---
 qapi/block-core.json | 38 +++++++++++++++++++++++++++++++++++++-
 block/vmdk.c         |  8 ++++----
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 40fb307e2d..e0c8f07932 100644
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
+# Since: 7.1
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
@@ -5638,3 +5664,13 @@
   'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
   'returns': 'SnapshotInfo',
   'allow-preconfig': true }
+
+##
+# @DummyBlockCoreForceArrays:
+#
+# Not used by QMP; hack to let us use ImageInfoList internally
+#
+# Since: 7.1
+##
+{ 'struct': 'DummyBlockCoreForceArrays',
+  'data': { 'unused-image-info': ['ImageInfo'] } }
diff --git a/block/vmdk.c b/block/vmdk.c
index 38e5ab3806..35131a916e 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2908,12 +2908,12 @@ static int vmdk_has_zero_init(BlockDriverState *bs)
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
@@ -2992,7 +2992,7 @@ static ImageInfoSpecific *vmdk_get_specific_info(BlockDriverState *bs,
     int i;
     BDRVVmdkState *s = bs->opaque;
     ImageInfoSpecific *spec_info = g_new0(ImageInfoSpecific, 1);
-    ImageInfoList **tail;
+    VmdkExtentInfoList **tail;
 
     *spec_info = (ImageInfoSpecific){
         .type = IMAGE_INFO_SPECIFIC_KIND_VMDK,
-- 
2.35.3


