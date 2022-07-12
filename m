Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61EF5722AA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:32:34 +0200 (CEST)
Received: from localhost ([::1]:36972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKgT-00073E-Nt
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHp-0003ZA-QJ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHl-0006f8-O2
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2wOBn7MifMjoG4oXfjsLyECP6MtVNaM+BcUVkb6rxc=;
 b=SPKW4IzNdzRBoKYwu8TNDYiFRFK5cbaaSW62deF3DxOOjHIPIc7olxIiyswevV9nJR6/oy
 4Pq/z/lfPztXS1bKFX3Dhxyn7PUspp2NoTDofvLPcZE9viWYoCJwznzEOQjC3nwx6PaR2s
 p6HTDlcinxxQXP/1wC/qJVtZhRumqcs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-wNPN6yolP7aC_OjzCK238w-1; Tue, 12 Jul 2022 14:06:57 -0400
X-MC-Unique: wNPN6yolP7aC_OjzCK238w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40867101A58E;
 Tue, 12 Jul 2022 18:06:56 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC1742026D07;
 Tue, 12 Jul 2022 18:06:55 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 21/35] block: Export blk_pwritev_part() in block-backend-io.h
Date: Tue, 12 Jul 2022 20:06:03 +0200
Message-Id: <20220712180617.1362407-22-hreitz@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Also convert it into a generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705161527.1054072-10-afaria@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/coroutines.h                |  5 -----
 include/sysemu/block-backend-io.h |  4 ++++
 block/block-backend.c             | 14 --------------
 tests/unit/test-block-iothread.c  | 19 +++++++++++++++++++
 4 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 85423f8db6..94fd283f62 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -107,11 +107,6 @@ bdrv_common_block_status_above(BlockDriverState *bs,
 int generated_co_wrapper
 nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 
-int generated_co_wrapper
-blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
-                    QEMUIOVector *qiov, size_t qiov_offset,
-                    BdrvRequestFlags flags);
-
 int generated_co_wrapper
 blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 877274a999..93a15071c4 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -120,6 +120,10 @@ int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
+int generated_co_wrapper blk_pwritev_part(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes, QEMUIOVector *qiov,
+                                          size_t qiov_offset,
+                                          BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
                                      int64_t bytes,
                                      QEMUIOVector *qiov, size_t qiov_offset,
diff --git a/block/block-backend.c b/block/block-backend.c
index 49db3f63fb..c75942b773 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1403,20 +1403,6 @@ int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
     return blk_co_pwritev_part(blk, offset, bytes, qiov, 0, flags);
 }
 
-static int coroutine_fn blk_pwritev_part(BlockBackend *blk, int64_t offset,
-                                         int64_t bytes,
-                                         QEMUIOVector *qiov, size_t qiov_offset,
-                                         BdrvRequestFlags flags)
-{
-    int ret;
-
-    blk_inc_in_flight(blk);
-    ret = blk_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
-    blk_dec_in_flight(blk);
-
-    return ret;
-}
-
 typedef struct BlkRwCo {
     BlockBackend *blk;
     int64_t offset;
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 2fa1248445..274e9e3653 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -183,6 +183,21 @@ static void test_sync_op_blk_preadv_part(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_pwritev_part(BlockBackend *blk)
+{
+    uint8_t buf[512] = { 0 };
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
+    int ret;
+
+    /* Success */
+    ret = blk_pwritev_part(blk, 0, sizeof(buf), &qiov, 0, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_pwritev_part(blk, -2, sizeof(buf), &qiov, 0, 0);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -358,6 +373,10 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/preadv_part",
         .fn     = NULL,
         .blkfn  = test_sync_op_blk_preadv_part,
+    }, {
+        .name   = "/sync-op/pwritev_part",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_pwritev_part,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
-- 
2.35.3


