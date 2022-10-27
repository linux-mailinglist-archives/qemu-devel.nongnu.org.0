Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A131661016F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:19:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7lb-000238-DY; Thu, 27 Oct 2022 14:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7h7-0002Fr-O8
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gk-0002fR-A0
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=At92z1k/u+P03pw3BuE8Vm0H76QHtuh4BAprBZCQEhk=;
 b=Tz/mvyb8l6KT7QHlnSVZKfw5CNM7MDFuvfW3bgvsF3F9VGv6idh0qg6mKpdM7xE8lefdbn
 2Wei7I4fKojJYznbpMLu4a6v8Iew+JRblli6BMac8+bBp+GwLL416V7e0NdOiAPldRisp+
 1iOrAFzwZeOQDwKg7t0kLT6hWzTR884=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-FZGqkyf7PjKDEFUBzB6FLg-1; Thu, 27 Oct 2022 14:33:06 -0400
X-MC-Unique: FZGqkyf7PjKDEFUBzB6FLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2815D800186;
 Thu, 27 Oct 2022 18:33:06 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67AF61121320;
 Thu, 27 Oct 2022 18:33:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 56/58] vmdk: switch to *_co_* functions
Date: Thu, 27 Oct 2022 20:31:44 +0200
Message-Id: <20221027183146.463129-57-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-24-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vmdk.c | 54 ++++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index e5004945b0..26376352b9 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1440,16 +1440,16 @@ static int coroutine_fn get_whole_cluster(BlockDriverState *bs,
         if (copy_from_backing) {
             /* qcow2 emits this on bs->file instead of bs->backing */
             BLKDBG_EVENT(extent->file, BLKDBG_COW_READ);
-            ret = bdrv_pread(bs->backing, offset, skip_start_bytes,
-                             whole_grain, 0);
+            ret = bdrv_co_pread(bs->backing, offset, skip_start_bytes,
+                                whole_grain, 0);
             if (ret < 0) {
                 ret = VMDK_ERROR;
                 goto exit;
             }
         }
         BLKDBG_EVENT(extent->file, BLKDBG_COW_WRITE);
-        ret = bdrv_pwrite(extent->file, cluster_offset, skip_start_bytes,
-                          whole_grain, 0);
+        ret = bdrv_co_pwrite(extent->file, cluster_offset, skip_start_bytes,
+                             whole_grain, 0);
         if (ret < 0) {
             ret = VMDK_ERROR;
             goto exit;
@@ -1460,18 +1460,18 @@ static int coroutine_fn get_whole_cluster(BlockDriverState *bs,
         if (copy_from_backing) {
             /* qcow2 emits this on bs->file instead of bs->backing */
             BLKDBG_EVENT(extent->file, BLKDBG_COW_READ);
-            ret = bdrv_pread(bs->backing, offset + skip_end_bytes,
-                             cluster_bytes - skip_end_bytes,
-                             whole_grain + skip_end_bytes, 0);
+            ret = bdrv_co_pread(bs->backing, offset + skip_end_bytes,
+                                cluster_bytes - skip_end_bytes,
+                                whole_grain + skip_end_bytes, 0);
             if (ret < 0) {
                 ret = VMDK_ERROR;
                 goto exit;
             }
         }
         BLKDBG_EVENT(extent->file, BLKDBG_COW_WRITE);
-        ret = bdrv_pwrite(extent->file, cluster_offset + skip_end_bytes,
-                          cluster_bytes - skip_end_bytes,
-                          whole_grain + skip_end_bytes, 0);
+        ret = bdrv_co_pwrite(extent->file, cluster_offset + skip_end_bytes,
+                             cluster_bytes - skip_end_bytes,
+                             whole_grain + skip_end_bytes, 0);
         if (ret < 0) {
             ret = VMDK_ERROR;
             goto exit;
@@ -1490,23 +1490,23 @@ static int coroutine_fn vmdk_L2update(VmdkExtent *extent, VmdkMetaData *m_data,
     offset = cpu_to_le32(offset);
     /* update L2 table */
     BLKDBG_EVENT(extent->file, BLKDBG_L2_UPDATE);
-    if (bdrv_pwrite(extent->file,
-                ((int64_t)m_data->l2_offset * 512)
-                    + (m_data->l2_index * sizeof(offset)),
-                sizeof(offset), &offset, 0) < 0) {
+    if (bdrv_co_pwrite(extent->file,
+                       ((int64_t)m_data->l2_offset * 512)
+                           + (m_data->l2_index * sizeof(offset)),
+                       sizeof(offset), &offset, 0) < 0) {
         return VMDK_ERROR;
     }
     /* update backup L2 table */
     if (extent->l1_backup_table_offset != 0) {
         m_data->l2_offset = extent->l1_backup_table[m_data->l1_index];
-        if (bdrv_pwrite(extent->file,
-                    ((int64_t)m_data->l2_offset * 512)
-                        + (m_data->l2_index * sizeof(offset)),
-                    sizeof(offset), &offset, 0) < 0) {
+        if (bdrv_co_pwrite(extent->file,
+                           ((int64_t)m_data->l2_offset * 512)
+                               + (m_data->l2_index * sizeof(offset)),
+                           sizeof(offset), &offset, 0) < 0) {
             return VMDK_ERROR;
         }
     }
-    if (bdrv_flush(extent->file->bs) < 0) {
+    if (bdrv_co_flush(extent->file->bs) < 0) {
         return VMDK_ERROR;
     }
     if (m_data->l2_cache_entry) {
@@ -1623,11 +1623,10 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
     }
     l2_table = (char *)extent->l2_cache + (min_index * l2_size_bytes);
     BLKDBG_EVENT(extent->file, BLKDBG_L2_LOAD);
-    if (bdrv_pread(extent->file,
+    if (bdrv_co_pread(extent->file,
                 (int64_t)l2_offset * 512,
                 l2_size_bytes,
-                l2_table,
-                0
+                l2_table, 0
             ) < 0) {
         return VMDK_ERROR;
     }
@@ -1898,7 +1897,8 @@ vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
     cluster_buf = g_malloc(buf_bytes);
     uncomp_buf = g_malloc(cluster_bytes);
     BLKDBG_EVENT(extent->file, BLKDBG_READ_COMPRESSED);
-    ret = bdrv_pread(extent->file, cluster_offset, buf_bytes, cluster_buf, 0);
+    ret = bdrv_co_pread(extent->file, cluster_offset, buf_bytes, cluster_buf,
+                        0);
     if (ret < 0) {
         goto out;
     }
@@ -2143,8 +2143,8 @@ vmdk_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
                 return length;
             }
             length = QEMU_ALIGN_UP(length, BDRV_SECTOR_SIZE);
-            ret = bdrv_truncate(s->extents[i].file, length, false,
-                                PREALLOC_MODE_OFF, 0, NULL);
+            ret = bdrv_co_truncate(s->extents[i].file, length, false,
+                                   PREALLOC_MODE_OFF, 0, NULL);
             if (ret < 0) {
                 return ret;
             }
@@ -2585,7 +2585,7 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
         desc_offset = 0x200;
     }
 
-    ret = blk_pwrite(blk, desc_offset, desc_len, desc, 0);
+    ret = blk_co_pwrite(blk, desc_offset, desc_len, desc, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not write description");
         goto exit;
@@ -2593,7 +2593,7 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
     /* bdrv_pwrite write padding zeros to align to sector, we don't need that
      * for description file */
     if (desc_offset == 0) {
-        ret = blk_truncate(blk, desc_len, false, PREALLOC_MODE_OFF, 0, errp);
+        ret = blk_co_truncate(blk, desc_len, false, PREALLOC_MODE_OFF, 0, errp);
         if (ret < 0) {
             goto exit;
         }
-- 
2.37.3


