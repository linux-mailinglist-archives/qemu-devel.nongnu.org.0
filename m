Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140366DDED6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:05:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFWV-0003Qc-8r; Tue, 11 Apr 2023 11:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFWH-0003EE-06
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFW7-00028t-Sk
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681225335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3DiKYu/rfwadYrMp66jxWIw+7QboZ3iGXwOVy15XVMs=;
 b=JyHO1ACTDRV8/LnkGnvgyum1jaZ1UtahpH5I2XCzY2aiax3zZvfK/bJ2W9AETUXyDGPRei
 vQDlFb1xWHUwxCmm+4cQNicOE50GN8d+NGARhS1NHIbftPeRy2oGZbC/bQHTKF0ymlnEys
 R6Tu1W5H4ik4tM5gxr/Q7B4jKEQ2th4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-6qw5lKC5NtOX5XyP-8jt4A-1; Tue, 11 Apr 2023 11:02:13 -0400
X-MC-Unique: 6qw5lKC5NtOX5XyP-8jt4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60D38280049C;
 Tue, 11 Apr 2023 15:02:13 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA23F40BC797;
 Tue, 11 Apr 2023 15:02:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 10/10] block,
 block-backend: write some hot coroutine wrappers by hand
Date: Tue, 11 Apr 2023 17:01:47 +0200
Message-Id: <20230411150147.318637-11-kwolf@redhat.com>
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

The introduction of the graph lock is causing blk_get_geometry, a hot function
used in the I/O path, to create a coroutine.  However, the only part that really
needs to run in coroutine context is the call to bdrv_co_refresh_total_sectors,
which in turn only happens in the rare case of host CD-ROM devices.

So, write by hand the three wrappers on the path from blk_co_get_geometry to
bdrv_co_refresh_total_sectors, so that the coroutine wrapper is only created
if bdrv_nb_sectors actually calls bdrv_refresh_total_sectors.

Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230407153303.391121-9-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h          |  2 +-
 include/sysemu/block-backend-io.h |  5 ++---
 block.c                           | 22 ++++++++++++++++++++++
 block/block-backend.c             | 27 +++++++++++++++++++++++++++
 4 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 9e2248a295..5dab88521d 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -79,7 +79,7 @@ bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
                  PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
 
 int64_t coroutine_fn GRAPH_RDLOCK bdrv_co_nb_sectors(BlockDriverState *bs);
-int64_t co_wrapper_mixed_bdrv_rdlock bdrv_nb_sectors(BlockDriverState *bs);
+int64_t coroutine_mixed_fn bdrv_nb_sectors(BlockDriverState *bs);
 
 int64_t coroutine_fn GRAPH_RDLOCK bdrv_co_getlength(BlockDriverState *bs);
 int64_t co_wrapper_mixed_bdrv_rdlock bdrv_getlength(BlockDriverState *bs);
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index c672b77247..bb25493ba1 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -72,11 +72,10 @@ int64_t co_wrapper_mixed blk_getlength(BlockBackend *blk);
 
 void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
                                       uint64_t *nb_sectors_ptr);
-void co_wrapper_mixed blk_get_geometry(BlockBackend *blk,
-                                       uint64_t *nb_sectors_ptr);
+void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr);
 
 int64_t coroutine_fn blk_co_nb_sectors(BlockBackend *blk);
-int64_t co_wrapper_mixed blk_nb_sectors(BlockBackend *blk);
+int64_t blk_nb_sectors(BlockBackend *blk);
 
 void *blk_try_blockalign(BlockBackend *blk, size_t size);
 void *blk_blockalign(BlockBackend *blk, size_t size);
diff --git a/block.c b/block.c
index e8e08ad668..d79a52ca74 100644
--- a/block.c
+++ b/block.c
@@ -5859,6 +5859,28 @@ int64_t coroutine_fn bdrv_co_nb_sectors(BlockDriverState *bs)
     return bs->total_sectors;
 }
 
+/*
+ * This wrapper is written by hand because this function is in the hot I/O path,
+ * via blk_get_geometry.
+ */
+int64_t coroutine_mixed_fn bdrv_nb_sectors(BlockDriverState *bs)
+{
+    BlockDriver *drv = bs->drv;
+    IO_CODE();
+
+    if (!drv)
+        return -ENOMEDIUM;
+
+    if (bs->bl.has_variable_length) {
+        int ret = bdrv_refresh_total_sectors(bs, bs->total_sectors);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    return bs->total_sectors;
+}
+
 /**
  * Return length in bytes on success, -errno on error.
  * The length is always a multiple of BDRV_SECTOR_SIZE.
diff --git a/block/block-backend.c b/block/block-backend.c
index cf58d4d1b7..55efc735b4 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1629,6 +1629,23 @@ int64_t coroutine_fn blk_co_nb_sectors(BlockBackend *blk)
     }
 }
 
+/*
+ * This wrapper is written by hand because this function is in the hot I/O path,
+ * via blk_get_geometry.
+ */
+int64_t coroutine_mixed_fn blk_nb_sectors(BlockBackend *blk)
+{
+    BlockDriverState *bs = blk_bs(blk);
+
+    IO_CODE();
+
+    if (!bs) {
+        return -ENOMEDIUM;
+    } else {
+        return bdrv_nb_sectors(bs);
+    }
+}
+
 /* return 0 as number of sectors if no device present or error */
 void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
                                       uint64_t *nb_sectors_ptr)
@@ -1637,6 +1654,16 @@ void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
     *nb_sectors_ptr = ret < 0 ? 0 : ret;
 }
 
+/*
+ * This wrapper is written by hand because this function is in the hot I/O path.
+ */
+void coroutine_mixed_fn blk_get_geometry(BlockBackend *blk,
+                                         uint64_t *nb_sectors_ptr)
+{
+    int64_t ret = blk_nb_sectors(blk);
+    *nb_sectors_ptr = ret < 0 ? 0 : ret;
+}
+
 BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
                            QEMUIOVector *qiov, BdrvRequestFlags flags,
                            BlockCompletionFunc *cb, void *opaque)
-- 
2.39.2


