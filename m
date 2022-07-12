Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3995722E1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:41:51 +0200 (CEST)
Received: from localhost ([::1]:55306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKpR-0002oH-ON
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHj-0003SL-Bs
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHh-0006dQ-Cg
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/q8e18xlcsV60GmlFDScChxVStImD5RD7awhBEqWj8=;
 b=Azd6KZe0Niqxkuilp/sx9NCPvwUAPwPLXwyYUtsn5dhepbFDEjv7o51T2uZ08k+xXciFVm
 gvAv1MaycNo7pNzSdLlv2AvwzXqF6D2/fDFyXp5rOUwmcImGNDXAgXxoabUbIyIgnbCZus
 xNCMUA0All9DPHLZdZfBmmCtZtPrUO8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-xGqUrbrJMF6B1QsYmaXfvw-1; Tue, 12 Jul 2022 14:06:53 -0400
X-MC-Unique: xGqUrbrJMF6B1QsYmaXfvw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB85F1C08964;
 Tue, 12 Jul 2022 18:06:52 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96FDE2166B26;
 Tue, 12 Jul 2022 18:06:52 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 19/35] block: Add blk_{preadv,pwritev}()
Date: Tue, 12 Jul 2022 20:06:01 +0200
Message-Id: <20220712180617.1362407-20-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
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

Implement them using generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705161527.1054072-8-afaria@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/sysemu/block-backend-io.h |  6 +++++
 tests/unit/test-block-iothread.c  | 42 ++++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 750089fc9b..cbf4422ea1 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -107,6 +107,9 @@ int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
 int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
                                     int64_t bytes, const void *buf,
                                     BdrvRequestFlags flags);
+int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, QEMUIOVector *qiov,
+                                    BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
@@ -114,6 +117,9 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
                                      int64_t bytes,
                                      QEMUIOVector *qiov, size_t qiov_offset,
                                      BdrvRequestFlags flags);
+int generated_co_wrapper blk_pwritev(BlockBackend *blk, int64_t offset,
+                                     int64_t bytes, QEMUIOVector *qiov,
+                                     BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
                                 int64_t bytes, QEMUIOVector *qiov,
                                 BdrvRequestFlags flags);
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 0ced5333ff..b9c5da3a87 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -138,6 +138,36 @@ static void test_sync_op_blk_pwrite(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_preadv(BlockBackend *blk)
+{
+    uint8_t buf[512];
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
+    int ret;
+
+    /* Success */
+    ret = blk_preadv(blk, 0, sizeof(buf), &qiov, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_preadv(blk, -2, sizeof(buf), &qiov, 0);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
+static void test_sync_op_blk_pwritev(BlockBackend *blk)
+{
+    uint8_t buf[512] = { 0 };
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
+    int ret;
+
+    /* Success */
+    ret = blk_pwritev(blk, 0, sizeof(buf), &qiov, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_pwritev(blk, -2, sizeof(buf), &qiov, 0);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -301,6 +331,14 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/pwrite",
         .fn     = test_sync_op_pwrite,
         .blkfn  = test_sync_op_blk_pwrite,
+    }, {
+        .name   = "/sync-op/preadv",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_preadv,
+    }, {
+        .name   = "/sync-op/pwritev",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_pwritev,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
@@ -349,7 +387,9 @@ static void test_sync_op(const void *opaque)
 
     blk_set_aio_context(blk, ctx, &error_abort);
     aio_context_acquire(ctx);
-    t->fn(c);
+    if (t->fn) {
+        t->fn(c);
+    }
     if (t->blkfn) {
         t->blkfn(blk);
     }
-- 
2.35.3


