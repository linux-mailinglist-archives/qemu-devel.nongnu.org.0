Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D251675475
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:29:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUG-0003EA-Ko; Fri, 20 Jan 2023 07:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUB-0002xM-KO
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqU9-0000Qd-Gh
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lObBtq7lKBStttFNR0ASEQuY/SD0lVqwUzvDZfEmLGY=;
 b=LtEeAQKbzwbm5xlQuCs/u3aLBdAffqR+KoI+l+OYtOYqkl6UTNUf1kTI0ZG2Iv4wttC3yo
 +KxoBzzt4r0Zr8Z1+qS8O5PVcCZXXC8ZTHtyj0yeFtqf0iphNaq+ylaEw0p2sbKTUp91EE
 pAUByEPA1NnAv4KdP1ShEav3Hc4Q9hY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-BQNDik2NPcq39ih_AE7ZNQ-1; Fri, 20 Jan 2023 07:27:07 -0500
X-MC-Unique: BQNDik2NPcq39ih_AE7ZNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45F831C189AB;
 Fri, 20 Jan 2023 12:27:07 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CA7B40C6EC4;
 Fri, 20 Jan 2023 12:27:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 28/38] block/file: Add file-specific image info
Date: Fri, 20 Jan 2023 13:26:23 +0100
Message-Id: <20230120122633.84983-29-kwolf@redhat.com>
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

Add some (optional) information that the file driver can provide for
image files, namely the extent size hint.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220620162704.80987-3-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json | 26 ++++++++++++++++++++++++--
 block/file-posix.c   | 30 ++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 95ac4fa634..f5d822cbd6 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -139,16 +139,29 @@
       '*encryption-format': 'RbdImageEncryptionFormat'
   } }
 
+##
+# @ImageInfoSpecificFile:
+#
+# @extent-size-hint: Extent size hint (if available)
+#
+# Since: 8.0
+##
+{ 'struct': 'ImageInfoSpecificFile',
+  'data': {
+      '*extent-size-hint': 'size'
+  } }
+
 ##
 # @ImageInfoSpecificKind:
 #
 # @luks: Since 2.7
 # @rbd: Since 6.1
+# @file: Since 8.0
 #
 # Since: 1.7
 ##
 { 'enum': 'ImageInfoSpecificKind',
-  'data': [ 'qcow2', 'vmdk', 'luks', 'rbd' ] }
+  'data': [ 'qcow2', 'vmdk', 'luks', 'rbd', 'file' ] }
 
 ##
 # @ImageInfoSpecificQCow2Wrapper:
@@ -185,6 +198,14 @@
 { 'struct': 'ImageInfoSpecificRbdWrapper',
   'data': { 'data': 'ImageInfoSpecificRbd' } }
 
+##
+# @ImageInfoSpecificFileWrapper:
+#
+# Since: 8.0
+##
+{ 'struct': 'ImageInfoSpecificFileWrapper',
+  'data': { 'data': 'ImageInfoSpecificFile' } }
+
 ##
 # @ImageInfoSpecific:
 #
@@ -199,7 +220,8 @@
       'qcow2': 'ImageInfoSpecificQCow2Wrapper',
       'vmdk': 'ImageInfoSpecificVmdkWrapper',
       'luks': 'ImageInfoSpecificLUKSWrapper',
-      'rbd': 'ImageInfoSpecificRbdWrapper'
+      'rbd': 'ImageInfoSpecificRbdWrapper',
+      'file': 'ImageInfoSpecificFileWrapper'
   } }
 
 ##
diff --git a/block/file-posix.c b/block/file-posix.c
index 0370b550aa..98a743e519 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3091,6 +3091,34 @@ raw_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
     return 0;
 }
 
+static ImageInfoSpecific *raw_get_specific_info(BlockDriverState *bs,
+                                                Error **errp)
+{
+    BDRVRawState *s = bs->opaque;
+    ImageInfoSpecificFile *file_info = g_new0(ImageInfoSpecificFile, 1);
+    ImageInfoSpecific *spec_info = g_new(ImageInfoSpecific, 1);
+
+    *spec_info = (ImageInfoSpecific){
+        .type = IMAGE_INFO_SPECIFIC_KIND_FILE,
+        .u.file.data = file_info,
+    };
+
+#ifdef FS_IOC_FSGETXATTR
+    {
+        struct fsxattr attr;
+        int ret;
+
+        ret = ioctl(s->fd, FS_IOC_FSGETXATTR, &attr);
+        if (!ret && attr.fsx_extsize != 0) {
+            file_info->has_extent_size_hint = true;
+            file_info->extent_size_hint = attr.fsx_extsize;
+        }
+    }
+#endif
+
+    return spec_info;
+}
+
 static BlockStatsSpecificFile get_blockstats_specific_file(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
@@ -3324,6 +3352,7 @@ BlockDriver bdrv_file = {
     .bdrv_co_truncate                   = raw_co_truncate,
     .bdrv_co_getlength                  = raw_co_getlength,
     .bdrv_co_get_info                   = raw_co_get_info,
+    .bdrv_get_specific_info             = raw_get_specific_info,
     .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
     .bdrv_get_specific_stats = raw_get_specific_stats,
     .bdrv_check_perm = raw_check_perm,
@@ -3695,6 +3724,7 @@ static BlockDriver bdrv_host_device = {
     .bdrv_co_truncate                   = raw_co_truncate,
     .bdrv_co_getlength                  = raw_co_getlength,
     .bdrv_co_get_info                   = raw_co_get_info,
+    .bdrv_get_specific_info             = raw_get_specific_info,
     .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
     .bdrv_get_specific_stats = hdev_get_specific_stats,
     .bdrv_check_perm = raw_check_perm,
-- 
2.38.1


