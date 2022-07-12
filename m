Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01365722C1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:36:58 +0200 (CEST)
Received: from localhost ([::1]:46004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKkj-00053R-UU
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHt-0003bt-TU
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHp-0006hH-FD
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XO4aUJYOY/FB/pDRjdbINEgGtvNk/zYoNnEXqsDWMlw=;
 b=ezarH1WjNx/zqiyECub2PHSTHyXMozidbsXY6y+W93aAGq+rqOrhnJBdhEekxJ6QwpMzeB
 RLE8XEr+DsnGsVxTdcAT0uPTgG++0WmwMDdhiCp1emLkHMv9mLWWvtsqPTZXbz3nZ5IBg7
 zQ9kH1HYrmKjCLpehpU1S7v5/dBdN3M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-XOcpysmeM9Ogw0LIqNtfKg-1; Tue, 12 Jul 2022 14:07:01 -0400
X-MC-Unique: XOcpysmeM9Ogw0LIqNtfKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 253B63801149;
 Tue, 12 Jul 2022 18:07:01 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D53831121314;
 Tue, 12 Jul 2022 18:07:00 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 24/35] block: Implement blk_pwrite_zeroes() using
 generated_co_wrapper
Date: Tue, 12 Jul 2022 20:06:06 +0200
Message-Id: <20220712180617.1362407-25-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705161527.1054072-13-afaria@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/sysemu/block-backend-io.h |  5 +++--
 block/block-backend.c             |  8 --------
 tests/unit/test-block-iothread.c  | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 8500a63102..346ca47fed 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -173,8 +173,9 @@ int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
 int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
                                           int64_t bytes, const void *buf);
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
-int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int64_t bytes, BdrvRequestFlags flags);
+int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                           int64_t bytes,
+                                           BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                       int64_t bytes, BdrvRequestFlags flags);
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
diff --git a/block/block-backend.c b/block/block-backend.c
index f07a76aa5a..85661d1823 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1411,14 +1411,6 @@ typedef struct BlkRwCo {
     BdrvRequestFlags flags;
 } BlkRwCo;
 
-int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int64_t bytes, BdrvRequestFlags flags)
-{
-    IO_OR_GS_CODE();
-    return blk_pwritev_part(blk, offset, bytes, NULL, 0,
-                            flags | BDRV_REQ_ZERO_WRITE);
-}
-
 int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
 {
     GLOBAL_STATE_CODE();
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 3a46886784..bb9230a4b4 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -212,6 +212,19 @@ static void test_sync_op_blk_pwrite_compressed(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_pwrite_zeroes(BlockBackend *blk)
+{
+    int ret;
+
+    /* Success */
+    ret = blk_pwrite_zeroes(blk, 0, 512, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_pwrite_zeroes(blk, -2, 512, 0);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -395,6 +408,10 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/pwrite_compressed",
         .fn     = NULL,
         .blkfn  = test_sync_op_blk_pwrite_compressed,
+    }, {
+        .name   = "/sync-op/pwrite_zeroes",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_pwrite_zeroes,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
-- 
2.35.3


