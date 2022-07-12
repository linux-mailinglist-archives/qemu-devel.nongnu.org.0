Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9C5572291
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:27:09 +0200 (CEST)
Received: from localhost ([::1]:55210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKbE-0000FU-OL
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHm-0003Vr-3W
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHh-0006dn-DY
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P056BZmmNOHG+TMosCuQH52pQUmFgn+uwy3KD7uAvfE=;
 b=iUfBDYaa77P6Zmn2AUn/hcRVll4PYrfqLbUX9QNI2lxA7TE4+vXUmISjESi0Vt35yVI9kh
 WqHLmn+3oPbbhIvpYnhxMcyQ1XHp44r8dc8X5d9b68q1TY5trBSqV6x9aW6yeLOPD1bz3U
 mVhmNwhIBhet0LYNBGoUBjQMWK0zKaw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-aBnp996zNl2XRrCsH_rEQw-1; Tue, 12 Jul 2022 14:06:55 -0400
X-MC-Unique: aBnp996zNl2XRrCsH_rEQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9A273C02B66;
 Tue, 12 Jul 2022 18:06:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 651492026D64;
 Tue, 12 Jul 2022 18:06:54 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 20/35] block: Add blk_[co_]preadv_part()
Date: Tue, 12 Jul 2022 20:06:02 +0200
Message-Id: <20220712180617.1362407-21-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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

From: Alberto Faria <afaria@redhat.com>

Implement blk_preadv_part() using generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705161527.1054072-9-afaria@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/coroutines.h                |  5 -----
 include/sysemu/block-backend-io.h |  7 +++++++
 block/block-backend.c             | 30 +++++++++++++++++++++++-------
 tests/unit/test-block-iothread.c  | 19 +++++++++++++++++++
 4 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 443ef2f2e6..85423f8db6 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -63,11 +63,6 @@ nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
                                Error **errp);
 
 
-int coroutine_fn
-blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
-                 QEMUIOVector *qiov, BdrvRequestFlags flags);
-
-
 int coroutine_fn
 blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                        QEMUIOVector *qiov, size_t qiov_offset,
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index cbf4422ea1..877274a999 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -107,6 +107,13 @@ int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
 int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
                                     int64_t bytes, const void *buf,
                                     BdrvRequestFlags flags);
+int generated_co_wrapper blk_preadv_part(BlockBackend *blk, int64_t offset,
+                                         int64_t bytes, QEMUIOVector *qiov,
+                                         size_t qiov_offset,
+                                         BdrvRequestFlags flags);
+int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, QEMUIOVector *qiov,
+                                    size_t qiov_offset, BdrvRequestFlags flags);
 int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
                                     int64_t bytes, QEMUIOVector *qiov,
                                     BdrvRequestFlags flags);
diff --git a/block/block-backend.c b/block/block-backend.c
index 4d6c18bc39..49db3f63fb 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1280,9 +1280,10 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn
-blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
-                 QEMUIOVector *qiov, BdrvRequestFlags flags)
+static int coroutine_fn
+blk_co_do_preadv_part(BlockBackend *blk, int64_t offset, int64_t bytes,
+                      QEMUIOVector *qiov, size_t qiov_offset,
+                      BdrvRequestFlags flags)
 {
     int ret;
     BlockDriverState *bs;
@@ -1307,7 +1308,8 @@ blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
                 bytes, false);
     }
 
-    ret = bdrv_co_preadv(blk->root, offset, bytes, qiov, flags);
+    ret = bdrv_co_preadv_part(blk->root, offset, bytes, qiov, qiov_offset,
+                              flags);
     bdrv_dec_in_flight(bs);
     return ret;
 }
@@ -1320,7 +1322,21 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
-    ret = blk_co_do_preadv(blk, offset, bytes, qiov, flags);
+    ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, 0, flags);
+    blk_dec_in_flight(blk);
+
+    return ret;
+}
+
+int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, QEMUIOVector *qiov,
+                                    size_t qiov_offset, BdrvRequestFlags flags)
+{
+    int ret;
+    IO_OR_GS_CODE();
+
+    blk_inc_in_flight(blk);
+    ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, qiov_offset, flags);
     blk_dec_in_flight(blk);
 
     return ret;
@@ -1537,8 +1553,8 @@ static void blk_aio_read_entry(void *opaque)
     QEMUIOVector *qiov = rwco->iobuf;
 
     assert(qiov->size == acb->bytes);
-    rwco->ret = blk_co_do_preadv(rwco->blk, rwco->offset, acb->bytes,
-                                 qiov, rwco->flags);
+    rwco->ret = blk_co_do_preadv_part(rwco->blk, rwco->offset, acb->bytes, qiov,
+                                      0, rwco->flags);
     blk_aio_complete(acb);
 }
 
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index b9c5da3a87..2fa1248445 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -168,6 +168,21 @@ static void test_sync_op_blk_pwritev(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_preadv_part(BlockBackend *blk)
+{
+    uint8_t buf[512];
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
+    int ret;
+
+    /* Success */
+    ret = blk_preadv_part(blk, 0, sizeof(buf), &qiov, 0, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_preadv_part(blk, -2, sizeof(buf), &qiov, 0, 0);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -339,6 +354,10 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/pwritev",
         .fn     = NULL,
         .blkfn  = test_sync_op_blk_pwritev,
+    }, {
+        .name   = "/sync-op/preadv_part",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_preadv_part,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
-- 
2.35.3


