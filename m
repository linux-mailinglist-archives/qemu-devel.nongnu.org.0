Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C3572293
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:27:28 +0200 (CEST)
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKbX-0000vh-Fk
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKI3-0003nY-FY
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKI0-0006jA-3S
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMKhSIywT3yX07BzBb+QZ71bZv+P8XTHDwoB00fSABc=;
 b=EBh0TSDRTDSsp+8YerSy7UtpAiZv+IXggWuon4mmOuTulLeDgAqfJBHks6lMqyzVYUzUC/
 uwQLP2LoPa/lmzvHB73PBIl8xAtuArpd9xYQzjgRoeRhanCr86zPSaTPkM90tUnjSTHy23
 MThwiqUhEPVK8IffNmnZzna1VYLHheE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-XgCJLpT0Pi-HXfwdny61KQ-1; Tue, 12 Jul 2022 14:07:01 -0400
X-MC-Unique: XgCJLpT0Pi-HXfwdny61KQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DE12811E81;
 Tue, 12 Jul 2022 18:06:59 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A26B2026D64;
 Tue, 12 Jul 2022 18:06:59 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 23/35] block: Add blk_co_pwrite_compressed()
Date: Tue, 12 Jul 2022 20:06:05 +0200
Message-Id: <20220712180617.1362407-24-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Also convert blk_pwrite_compressed() into a generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705161527.1054072-12-afaria@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/sysemu/block-backend-io.h |  7 +++++--
 block/block-backend.c             |  8 ++++----
 tests/unit/test-block-iothread.c  | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 695b793a72..8500a63102 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -167,8 +167,11 @@ int blk_flush(BlockBackend *blk);
 
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
-                          const void *buf);
+int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
+                                               int64_t offset, int64_t bytes,
+                                               const void *buf);
+int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes, const void *buf);
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                       int64_t bytes, BdrvRequestFlags flags);
diff --git a/block/block-backend.c b/block/block-backend.c
index 60fb7eb3f2..f07a76aa5a 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2314,13 +2314,13 @@ int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                           flags | BDRV_REQ_ZERO_WRITE);
 }
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
-                          const void *buf)
+int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes, const void *buf)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_OR_GS_CODE();
-    return blk_pwritev_part(blk, offset, bytes, &qiov, 0,
-                            BDRV_REQ_WRITE_COMPRESSED);
+    return blk_co_pwritev_part(blk, offset, bytes, &qiov, 0,
+                               BDRV_REQ_WRITE_COMPRESSED);
 }
 
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 274e9e3653..3a46886784 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -198,6 +198,20 @@ static void test_sync_op_blk_pwritev_part(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_pwrite_compressed(BlockBackend *blk)
+{
+    uint8_t buf[512] = { 0 };
+    int ret;
+
+    /* Late error: Not supported */
+    ret = blk_pwrite_compressed(blk, 0, sizeof(buf), buf);
+    g_assert_cmpint(ret, ==, -ENOTSUP);
+
+    /* Early error: Negative offset */
+    ret = blk_pwrite_compressed(blk, -2, sizeof(buf), buf);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -377,6 +391,10 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/pwritev_part",
         .fn     = NULL,
         .blkfn  = test_sync_op_blk_pwritev_part,
+    }, {
+        .name   = "/sync-op/pwrite_compressed",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_pwrite_compressed,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
-- 
2.35.3


