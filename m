Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD8B56743D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 18:29:18 +0200 (CEST)
Received: from localhost ([::1]:35946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8lQL-0007J5-GK
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 12:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lE8-0004Zu-QY
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:16:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lE5-0005tv-Ra
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYvEjZul3RyiNRvAmO60vNnoEiYCSata8mw61guChYw=;
 b=g2Qx40DYQ/vl0FxU1NdpKG5C2hRjRoMfGKg3cT+BnkU8+/iweL7Oj7Nux1Xipld66orE9C
 wkfFyRdwqgjErfsR0EbXPhMbKS9etDhVqEoKuz5kvDZynBlTKdzHiN/+db7CVBpOig+a5H
 9qhWxUPyn6YIbiRRhHgQ1vUWVG/J2VI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-KvcXnT1XPFS3NbRyJ6-vcA-1; Tue, 05 Jul 2022 12:16:26 -0400
X-MC-Unique: KvcXnT1XPFS3NbRyJ6-vcA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B18BC81D9CA;
 Tue,  5 Jul 2022 16:16:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B948140EBE4;
 Tue,  5 Jul 2022 16:16:18 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bin Meng <bin.meng@windriver.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-riscv@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 qemu-arm@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 07/18] block: Add blk_{preadv,pwritev}()
Date: Tue,  5 Jul 2022 17:15:15 +0100
Message-Id: <20220705161527.1054072-8-afaria@redhat.com>
In-Reply-To: <20220705161527.1054072-1-afaria@redhat.com>
References: <20220705161527.1054072-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
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

Implement them using generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/sysemu/block-backend-io.h |  6 +++++
 tests/unit/test-block-iothread.c  | 42 ++++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 0804ce1c1d..3b548a8ae1 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -108,6 +108,9 @@ int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
 int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
                                     int64_t bytes, const void *buf,
                                     BdrvRequestFlags flags);
+int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, QEMUIOVector *qiov,
+                                    BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
@@ -115,6 +118,9 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
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
2.36.1


