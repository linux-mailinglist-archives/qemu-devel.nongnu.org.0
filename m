Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBB8610054
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:35:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7j6-0007qj-59; Thu, 27 Oct 2022 14:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7h7-0002Fk-KH
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gj-0002ex-Iz
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NK0mXCwru997d/MLT8V/ifaz+nXR/6Vns9ftFTOLGVg=;
 b=O9C39fgMCGuogfWGBLkWNfzbNtP84oVWA0SLM3b1lnehdAMweL4bhvFiIl55xLql/yOF2z
 mxB4pO8MpfS+5WTbJIeY+O4a14xXsosGPr6rejjeRpSqcCkyQh0SlntUuQoCjF19btrN0o
 5edA3uyt2gpl2+AJAA49JhUHmbhfuDo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-nrkOqmaOOlmiK7D7sij-VA-1; Thu, 27 Oct 2022 14:33:04 -0400
X-MC-Unique: nrkOqmaOOlmiK7D7sij-VA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37D293C0F66F;
 Thu, 27 Oct 2022 18:33:04 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78ADA1121320;
 Thu, 27 Oct 2022 18:33:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 54/58] vdi: switch to *_co_* functions
Date: Thu, 27 Oct 2022 20:31:42 +0200
Message-Id: <20221027183146.463129-55-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
Message-Id: <20221013123711.620631-22-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vdi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/block/vdi.c b/block/vdi.c
index a9bafb5a9e..c0c111c4b9 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -663,7 +663,8 @@ vdi_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
              * so this full-cluster write does not overlap a partial write
              * of the same cluster, issued from the "else" branch.
              */
-            ret = bdrv_pwrite(bs->file, data_offset, s->block_size, block, 0);
+            ret = bdrv_co_pwrite(bs->file, data_offset, s->block_size, block,
+                                 0);
             qemu_co_rwlock_unlock(&s->bmap_lock);
         } else {
 nonallocating_write:
@@ -708,7 +709,7 @@ nonallocating_write:
         assert(VDI_IS_ALLOCATED(bmap_first));
         *header = s->header;
         vdi_header_to_le(header);
-        ret = bdrv_pwrite(bs->file, 0, sizeof(*header), header, 0);
+        ret = bdrv_co_pwrite(bs->file, 0, sizeof(*header), header, 0);
         g_free(header);
 
         if (ret < 0) {
@@ -725,8 +726,8 @@ nonallocating_write:
         base = ((uint8_t *)&s->bmap[0]) + bmap_first * SECTOR_SIZE;
         logout("will write %u block map sectors starting from entry %u\n",
                n_sectors, bmap_first);
-        ret = bdrv_pwrite(bs->file, offset * SECTOR_SIZE,
-                          n_sectors * SECTOR_SIZE, base, 0);
+        ret = bdrv_co_pwrite(bs->file, offset * SECTOR_SIZE,
+                             n_sectors * SECTOR_SIZE, base, 0);
     }
 
     return ret;
@@ -844,7 +845,7 @@ static int coroutine_fn vdi_co_do_create(BlockdevCreateOptions *create_options,
         vdi_header_print(&header);
     }
     vdi_header_to_le(&header);
-    ret = blk_pwrite(blk, offset, sizeof(header), &header, 0);
+    ret = blk_co_pwrite(blk, offset, sizeof(header), &header, 0);
     if (ret < 0) {
         error_setg(errp, "Error writing header");
         goto exit;
@@ -865,7 +866,7 @@ static int coroutine_fn vdi_co_do_create(BlockdevCreateOptions *create_options,
                 bmap[i] = VDI_UNALLOCATED;
             }
         }
-        ret = blk_pwrite(blk, offset, bmap_size, bmap, 0);
+        ret = blk_co_pwrite(blk, offset, bmap_size, bmap, 0);
         if (ret < 0) {
             error_setg(errp, "Error writing bmap");
             goto exit;
@@ -874,8 +875,8 @@ static int coroutine_fn vdi_co_do_create(BlockdevCreateOptions *create_options,
     }
 
     if (image_type == VDI_TYPE_STATIC) {
-        ret = blk_truncate(blk, offset + blocks * block_size, false,
-                           PREALLOC_MODE_OFF, 0, errp);
+        ret = blk_co_truncate(blk, offset + blocks * block_size, false,
+                              PREALLOC_MODE_OFF, 0, errp);
         if (ret < 0) {
             error_prepend(errp, "Failed to statically allocate file");
             goto exit;
-- 
2.37.3


