Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93045191E5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:53:30 +0200 (CEST)
Received: from localhost ([::1]:45130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1Ob-0003JU-Bt
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nlzHs-0001te-QX
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:38:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nlzHq-00014W-Qy
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651610302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=137C4aKJk05HwV6GxzrQgtJle6PJhcFeuFJ5RtIoWLU=;
 b=TTV+D4di2qRlftmlEVzTZAfd97tM+7QLJAqfNfZm+dXuT+C73+zpTzomFHM+pZFxXXEX9j
 z0lo79m2uhLnLM9t0vLCf5uUmQokFtcQALMTBJhLWrD2I29P4KKz+J/UaVhLwTO3aM0FUO
 dr7bSHOVRpN0z7XNsssuBnFBiXsHad4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-FYAm6iioORShwLEqJLIUZg-1; Tue, 03 May 2022 11:03:20 -0400
X-MC-Unique: FYAm6iioORShwLEqJLIUZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89EC8BB8DC2;
 Tue,  3 May 2022 14:55:56 +0000 (UTC)
Received: from localhost (unknown [10.39.193.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 415412166B41;
 Tue,  3 May 2022 14:55:56 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 4/4] block/file: Add file-specific image info
Date: Tue,  3 May 2022 16:55:29 +0200
Message-Id: <20220503145529.37070-5-hreitz@redhat.com>
In-Reply-To: <20220503145529.37070-1-hreitz@redhat.com>
References: <20220503145529.37070-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

Add some (optional) information that the file driver can provide for
image files, namely the extent size.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 qapi/block-core.json | 26 ++++++++++++++++++++++++--
 block/file-posix.c   | 30 ++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index e7d6c2e0cc..728da051ae 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -139,16 +139,29 @@
       '*encryption-format': 'RbdImageEncryptionFormat'
   } }
 
+##
+# @ImageInfoSpecificFile:
+#
+# @extent-size: Extent size (if available)
+#
+# Since: 7.1
+##
+{ 'struct': 'ImageInfoSpecificFile',
+  'data': {
+      '*extent-size': 'size'
+  } }
+
 ##
 # @ImageInfoSpecificKind:
 #
 # @luks: Since 2.7
 # @rbd: Since 6.1
+# @file: Since 7.1
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
+# Since: 7.1
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
index bfd9b21111..4323345c99 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3068,6 +3068,34 @@ static int raw_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
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
+            file_info->has_extent_size = true;
+            file_info->extent_size = attr.fsx_extsize;
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
@@ -3301,6 +3329,7 @@ BlockDriver bdrv_file = {
     .bdrv_co_truncate = raw_co_truncate,
     .bdrv_getlength = raw_getlength,
     .bdrv_get_info = raw_get_info,
+    .bdrv_get_specific_info = raw_get_specific_info,
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,
     .bdrv_get_specific_stats = raw_get_specific_stats,
@@ -3673,6 +3702,7 @@ static BlockDriver bdrv_host_device = {
     .bdrv_co_truncate       = raw_co_truncate,
     .bdrv_getlength	= raw_getlength,
     .bdrv_get_info = raw_get_info,
+    .bdrv_get_specific_info = raw_get_specific_info,
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,
     .bdrv_get_specific_stats = hdev_get_specific_stats,
-- 
2.35.1


