Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A676DDED1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:04:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFWU-0003Nu-Fu; Tue, 11 Apr 2023 11:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFWD-0003AL-09
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFW5-00027C-Sy
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681225333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGOm2S/ZpAvk2QZj4atrxWDysPuTvn5zP6R7LzqFEjo=;
 b=gBOlIk8D6Dd/D5ciFNfChEiaqFPUweyjytHzNyFMbtY6Fqis2F2RdjM7L6kvtwIzVA5XHy
 klboA+vWv4vxO1N3pl4iXXuDwmYOpqVSOzIeZGID2k2t8R+yCrrL/Jj4u2lOptVW38q/aa
 mUzD0K8gTATO0XeOMV6/CRIsx76Atpo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-3kPHhb7uM2-3HYPnPd7pBg-1; Tue, 11 Apr 2023 11:02:11 -0400
X-MC-Unique: 3kPHhb7uM2-3HYPnPd7pBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B2AF1C189B4;
 Tue, 11 Apr 2023 15:02:11 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5E4B40BC797;
 Tue, 11 Apr 2023 15:02:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 08/10] block-backend: inline bdrv_co_get_geometry
Date: Tue, 11 Apr 2023 17:01:45 +0200
Message-Id: <20230411150147.318637-9-kwolf@redhat.com>
In-Reply-To: <20230411150147.318637-1-kwolf@redhat.com>
References: <20230411150147.318637-1-kwolf@redhat.com>
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

From: Paolo Bonzini <pbonzini@redhat.com>

bdrv_co_get_geometry is only used in blk_co_get_geometry.  Inline it in
there, to reduce the number of wrappers for bs->total_sectors.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230407153303.391121-7-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h |  3 ---
 block.c                  | 10 ----------
 block/block-backend.c    |  8 ++++++--
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index dbc034b728..9e2248a295 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -90,9 +90,6 @@ int64_t co_wrapper bdrv_get_allocated_file_size(BlockDriverState *bs);
 BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
                                BlockDriverState *in_bs, Error **errp);
 
-void coroutine_fn GRAPH_RDLOCK
-bdrv_co_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr);
-
 int coroutine_fn GRAPH_RDLOCK
 bdrv_co_delete_file(BlockDriverState *bs, Error **errp);
 
diff --git a/block.c b/block.c
index be7dc5d3e9..e8e08ad668 100644
--- a/block.c
+++ b/block.c
@@ -5879,16 +5879,6 @@ int64_t coroutine_fn bdrv_co_getlength(BlockDriverState *bs)
     return ret * BDRV_SECTOR_SIZE;
 }
 
-/* return 0 as number of sectors if no device present or error */
-void coroutine_fn bdrv_co_get_geometry(BlockDriverState *bs,
-                                       uint64_t *nb_sectors_ptr)
-{
-    int64_t nb_sectors = bdrv_co_nb_sectors(bs);
-    IO_CODE();
-
-    *nb_sectors_ptr = nb_sectors < 0 ? 0 : nb_sectors;
-}
-
 bool bdrv_is_sg(BlockDriverState *bs)
 {
     IO_CODE();
diff --git a/block/block-backend.c b/block/block-backend.c
index 2ee39229e4..36e3a67dff 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1615,16 +1615,20 @@ int64_t coroutine_fn blk_co_getlength(BlockBackend *blk)
     return bdrv_co_getlength(blk_bs(blk));
 }
 
+/* return 0 as number of sectors if no device present or error */
 void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
                                       uint64_t *nb_sectors_ptr)
 {
+    BlockDriverState *bs = blk_bs(blk);
+
     IO_CODE();
     GRAPH_RDLOCK_GUARD();
 
-    if (!blk_bs(blk)) {
+    if (!bs) {
         *nb_sectors_ptr = 0;
     } else {
-        bdrv_co_get_geometry(blk_bs(blk), nb_sectors_ptr);
+        int64_t nb_sectors = bdrv_co_nb_sectors(bs);
+        *nb_sectors_ptr = nb_sectors < 0 ? 0 : nb_sectors;
     }
 }
 
-- 
2.39.2


