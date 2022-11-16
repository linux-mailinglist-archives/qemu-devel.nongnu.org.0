Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6271762C009
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:50:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImz-0000no-Nt; Wed, 16 Nov 2022 08:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovIms-0000gZ-Se
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImk-00080J-Ek
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfKtFYSJu+0gJSXduWanK/SQF9KPBXZtHSX/YbC+TaQ=;
 b=VAoxWjpdJv5dilF3GZOUvQ1r7QeIjMu5TsKesAAH3DKCIRsXUShtX69PGapaIX81m1vtkq
 JewyY2KNT+xLnkBLfHdtQ2GO87Kjmr8qMMGJzuUegGJBt3vp+4VVJA24MgiyXF+pw4o6mO
 nrbFDq2KRAd6+n0lqJwCMlY/jzJ9tVI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-TrIP72nHMEu8q_2goRrHWg-1; Wed, 16 Nov 2022 08:48:55 -0500
X-MC-Unique: TrIP72nHMEu8q_2goRrHWg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50CAF803D49;
 Wed, 16 Nov 2022 13:48:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 032AD49BB60;
 Wed, 16 Nov 2022 13:48:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 09/20] block-backend: introduce new generated_co_wrapper_blk
 annotation
Date: Wed, 16 Nov 2022 08:48:39 -0500
Message-Id: <20221116134850.3051419-10-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

This annotation will be used to distinguish the blk_* API from the
bdrv_* API in block-gen.c. The reason for this distinction is that
blk_* API eventually result in always calling bdrv_*, which has
implications when we introduce the read graph lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/block-common.h      |  1 +
 include/sysemu/block-backend-io.h | 69 ++++++++++++++++---------------
 2 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index 683e3d1c51..f70f1560c5 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -42,6 +42,7 @@
  */
 #define generated_co_wrapper
 #define generated_co_wrapper_simple
+#define generated_co_wrapper_blk
 
 #include "block/dirty-bitmap.h"
 #include "block/blockjob.h"
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index a47cb825e5..887a29dc59 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -110,77 +110,78 @@ int coroutine_fn blk_is_allocated_above(BlockBackend *blk,
  * the "I/O or GS" API.
  */
 
-int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
-                                   int64_t bytes, void *buf,
-                                   BdrvRequestFlags flags);
+int generated_co_wrapper_blk blk_pread(BlockBackend *blk, int64_t offset,
+                                       int64_t bytes, void *buf,
+                                       BdrvRequestFlags flags);
 int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset, int64_t bytes,
                               void *buf, BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
-                                    int64_t bytes, QEMUIOVector *qiov,
-                                    BdrvRequestFlags flags);
+int generated_co_wrapper_blk blk_preadv(BlockBackend *blk, int64_t offset,
+                                        int64_t bytes, QEMUIOVector *qiov,
+                                        BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_preadv_part(BlockBackend *blk, int64_t offset,
-                                         int64_t bytes, QEMUIOVector *qiov,
-                                         size_t qiov_offset,
-                                         BdrvRequestFlags flags);
+int generated_co_wrapper_blk blk_preadv_part(BlockBackend *blk, int64_t offset,
+                                             int64_t bytes, QEMUIOVector *qiov,
+                                             size_t qiov_offset,
+                                             BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
                                     int64_t bytes, QEMUIOVector *qiov,
                                     size_t qiov_offset, BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
-                                    int64_t bytes, const void *buf,
-                                    BdrvRequestFlags flags);
+int generated_co_wrapper_blk blk_pwrite(BlockBackend *blk, int64_t offset,
+                                        int64_t bytes, const void *buf,
+                                        BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
                                const void *buf, BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_pwritev(BlockBackend *blk, int64_t offset,
-                                     int64_t bytes, QEMUIOVector *qiov,
-                                     BdrvRequestFlags flags);
+int generated_co_wrapper_blk blk_pwritev(BlockBackend *blk, int64_t offset,
+                                         int64_t bytes, QEMUIOVector *qiov,
+                                         BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
                                 int64_t bytes, QEMUIOVector *qiov,
                                 BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_pwritev_part(BlockBackend *blk, int64_t offset,
-                                          int64_t bytes, QEMUIOVector *qiov,
-                                          size_t qiov_offset,
-                                          BdrvRequestFlags flags);
+int generated_co_wrapper_blk blk_pwritev_part(BlockBackend *blk, int64_t offset,
+                                              int64_t bytes, QEMUIOVector *qiov,
+                                              size_t qiov_offset,
+                                              BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
                                      int64_t bytes,
                                      QEMUIOVector *qiov, size_t qiov_offset,
                                      BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
-                                               int64_t offset, int64_t bytes,
-                                               const void *buf);
+int generated_co_wrapper_blk blk_pwrite_compressed(BlockBackend *blk,
+                                                int64_t offset, int64_t bytes,
+                                                const void *buf);
 int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
                                           int64_t bytes, const void *buf);
 
-int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                           int64_t bytes,
-                                           BdrvRequestFlags flags);
+int generated_co_wrapper_blk blk_pwrite_zeroes(BlockBackend *blk,
+                                               int64_t offset,
+                                               int64_t bytes,
+                                               BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                       int64_t bytes, BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
-                                      int64_t bytes);
+int generated_co_wrapper_blk blk_pdiscard(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes);
 int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
                                  int64_t bytes);
 
-int generated_co_wrapper blk_flush(BlockBackend *blk);
+int generated_co_wrapper_blk blk_flush(BlockBackend *blk);
 int coroutine_fn blk_co_flush(BlockBackend *blk);
 
-int generated_co_wrapper blk_ioctl(BlockBackend *blk, unsigned long int req,
-                                   void *buf);
+int generated_co_wrapper_blk blk_ioctl(BlockBackend *blk, unsigned long int req,
+                                       void *buf);
 int coroutine_fn blk_co_ioctl(BlockBackend *blk, unsigned long int req,
                               void *buf);
 
-int generated_co_wrapper blk_truncate(BlockBackend *blk, int64_t offset,
-                                      bool exact, PreallocMode prealloc,
-                                      BdrvRequestFlags flags, Error **errp);
+int generated_co_wrapper_blk blk_truncate(BlockBackend *blk, int64_t offset,
+                                          bool exact, PreallocMode prealloc,
+                                          BdrvRequestFlags flags, Error **errp);
 int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
                                  PreallocMode prealloc, BdrvRequestFlags flags,
                                  Error **errp);
-- 
2.31.1


