Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A445722E0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:41:44 +0200 (CEST)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKpL-0002XK-7X
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKI3-0003nT-Cj
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHx-0006ir-RB
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=367mNO307+X7rUiC8q7j642ZuikL/1grMF4XTjlh3Fg=;
 b=LTdFlDTkuaA03VR8Sj3rox25vnWX3dpXOBe3AmWSRgKh1kiU6J+YHhoD9gaf+XpsmZm2fe
 0W6/mF3zDUa8fb41cwASJ/4JWjP9wr3QH9S8yYjJXy/FYGt42wg9KPHxcWqcdbcCGDOM9N
 9Db/okveLw+j8ITpketLwNm4lyXNH1g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-pj8T8GwjMgmWMpyIc60I4g-1; Tue, 12 Jul 2022 14:07:08 -0400
X-MC-Unique: pj8T8GwjMgmWMpyIc60I4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB2803801156;
 Tue, 12 Jul 2022 18:07:07 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67D9A1121314;
 Tue, 12 Jul 2022 18:07:07 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 28/35] block: Add blk_co_truncate()
Date: Tue, 12 Jul 2022 20:06:10 +0200
Message-Id: <20220712180617.1362407-29-hreitz@redhat.com>
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

Also convert blk_truncate() into a generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705161527.1054072-17-afaria@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/sysemu/block-backend-io.h |  8 ++++++--
 block/block-backend.c             |  7 ++++---
 tests/unit/test-block-iothread.c  | 14 ++++++++++++++
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 21f3a1b4f2..a79b7d9d9c 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -182,7 +182,11 @@ int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                            BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                       int64_t bytes, BdrvRequestFlags flags);
-int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
-                 PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
+int generated_co_wrapper blk_truncate(BlockBackend *blk, int64_t offset,
+                                      bool exact, PreallocMode prealloc,
+                                      BdrvRequestFlags flags, Error **errp);
+int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
+                                 PreallocMode prealloc, BdrvRequestFlags flags,
+                                 Error **errp);
 
 #endif /* BLOCK_BACKEND_IO_H */
diff --git a/block/block-backend.c b/block/block-backend.c
index a31b9f1205..d0450ffd22 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2293,8 +2293,9 @@ int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
                                BDRV_REQ_WRITE_COMPRESSED);
 }
 
-int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
-                 PreallocMode prealloc, BdrvRequestFlags flags, Error **errp)
+int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
+                                 PreallocMode prealloc, BdrvRequestFlags flags,
+                                 Error **errp)
 {
     IO_OR_GS_CODE();
     if (!blk_is_available(blk)) {
@@ -2302,7 +2303,7 @@ int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
         return -ENOMEDIUM;
     }
 
-    return bdrv_truncate(blk->root, offset, exact, prealloc, flags, errp);
+    return bdrv_co_truncate(blk->root, offset, exact, prealloc, flags, errp);
 }
 
 int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index bb9230a4b4..8b55eccc89 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -298,6 +298,19 @@ static void test_sync_op_truncate(BdrvChild *c)
     c->bs->open_flags |= BDRV_O_RDWR;
 }
 
+static void test_sync_op_blk_truncate(BlockBackend *blk)
+{
+    int ret;
+
+    /* Normal success path */
+    ret = blk_truncate(blk, 65536, false, PREALLOC_MODE_OFF, 0, NULL);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_truncate(blk, -2, false, PREALLOC_MODE_OFF, 0, NULL);
+    g_assert_cmpint(ret, ==, -EINVAL);
+}
+
 static void test_sync_op_block_status(BdrvChild *c)
 {
     int ret;
@@ -425,6 +438,7 @@ const SyncOpTest sync_op_tests[] = {
     }, {
         .name   = "/sync-op/truncate",
         .fn     = test_sync_op_truncate,
+        .blkfn  = test_sync_op_blk_truncate,
     }, {
         .name   = "/sync-op/block_status",
         .fn     = test_sync_op_block_status,
-- 
2.35.3


