Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B7B6F6AAF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:00:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXbY-0003VI-Vv; Thu, 04 May 2023 07:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXbK-0003Eg-Jo
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXb7-0004C8-LC
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683201488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b5jLUirhNoYzN1twE71CbT//aP1PZdge+4Tqoso7lE8=;
 b=L6Y0qJ81auUtbWQwyAjDqBZ/lqeRu0nLC5uF1ui3AidJBjY6JPgnTIZ1wB9kkhRd3EXuey
 +Wpj9O6cXv4RlcSojjwK9nV1afEZgg4YmKTGD//owObwqpgNeDBhv8EY07CHqvcySRzp0m
 RBnIUIC6sapcJR8TcKlgswpqFPcTiyk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-kLKPG78UMm-uY-rIsN5Hhg-1; Thu, 04 May 2023 07:58:05 -0400
X-MC-Unique: kLKPG78UMm-uY-rIsN5Hhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49A2B38221C7;
 Thu,  4 May 2023 11:58:05 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 370F8C15BAD;
 Thu,  4 May 2023 11:58:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, eblake@redhat.com,
 eesposit@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 05/20] test-bdrv-drain: Don't modify the graph in coroutines
Date: Thu,  4 May 2023 13:57:35 +0200
Message-Id: <20230504115750.54437-6-kwolf@redhat.com>
In-Reply-To: <20230504115750.54437-1-kwolf@redhat.com>
References: <20230504115750.54437-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

test-bdrv-drain contains a few test cases that are run both in coroutine
and non-coroutine context. Running the entire code including the setup
and shutdown in coroutines is incorrect because graph modifications can
generally not happen in coroutines.

Change the test so that creating and destroying the test nodes and
BlockBackends always happens outside of coroutine context.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 112 +++++++++++++++++++++++------------
 1 file changed, 75 insertions(+), 37 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index d9d3807062..9a4c5e59d6 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -188,6 +188,25 @@ static void do_drain_begin_unlocked(enum drain_type drain_type, BlockDriverState
     }
 }
 
+static BlockBackend * no_coroutine_fn test_setup(void)
+{
+    BlockBackend *blk;
+    BlockDriverState *bs, *backing;
+
+    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
+    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
+                              &error_abort);
+    blk_insert_bs(blk, bs, &error_abort);
+
+    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
+    bdrv_set_backing_hd(bs, backing, &error_abort);
+
+    bdrv_unref(backing);
+    bdrv_unref(bs);
+
+    return blk;
+}
+
 static void do_drain_end_unlocked(enum drain_type drain_type, BlockDriverState *bs)
 {
     if (drain_type != BDRV_DRAIN_ALL) {
@@ -199,25 +218,19 @@ static void do_drain_end_unlocked(enum drain_type drain_type, BlockDriverState *
     }
 }
 
-static void test_drv_cb_common(enum drain_type drain_type, bool recursive)
+static void test_drv_cb_common(BlockBackend *blk, enum drain_type drain_type,
+                               bool recursive)
 {
-    BlockBackend *blk;
-    BlockDriverState *bs, *backing;
+    BlockDriverState *bs = blk_bs(blk);
+    BlockDriverState *backing = bs->backing->bs;
     BDRVTestState *s, *backing_s;
     BlockAIOCB *acb;
     int aio_ret;
 
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, NULL, 0);
 
-    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
-    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
-                              &error_abort);
     s = bs->opaque;
-    blk_insert_bs(blk, bs, &error_abort);
-
-    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
     backing_s = backing->opaque;
-    bdrv_set_backing_hd(bs, backing, &error_abort);
 
     /* Simple bdrv_drain_all_begin/end pair, check that CBs are called */
     g_assert_cmpint(s->drain_count, ==, 0);
@@ -252,44 +265,53 @@ static void test_drv_cb_common(enum drain_type drain_type, bool recursive)
 
     g_assert_cmpint(s->drain_count, ==, 0);
     g_assert_cmpint(backing_s->drain_count, ==, 0);
-
-    bdrv_unref(backing);
-    bdrv_unref(bs);
-    blk_unref(blk);
 }
 
 static void test_drv_cb_drain_all(void)
 {
-    test_drv_cb_common(BDRV_DRAIN_ALL, true);
+    BlockBackend *blk = test_setup();
+    test_drv_cb_common(blk, BDRV_DRAIN_ALL, true);
+    blk_unref(blk);
 }
 
 static void test_drv_cb_drain(void)
 {
-    test_drv_cb_common(BDRV_DRAIN, false);
+    BlockBackend *blk = test_setup();
+    test_drv_cb_common(blk, BDRV_DRAIN, false);
+    blk_unref(blk);
+}
+
+static void coroutine_fn test_drv_cb_co_drain_all_entry(void)
+{
+    BlockBackend *blk = blk_all_next(NULL);
+    test_drv_cb_common(blk, BDRV_DRAIN_ALL, true);
 }
 
 static void test_drv_cb_co_drain_all(void)
 {
-    call_in_coroutine(test_drv_cb_drain_all);
+    BlockBackend *blk = test_setup();
+    call_in_coroutine(test_drv_cb_co_drain_all_entry);
+    blk_unref(blk);
 }
 
-static void test_drv_cb_co_drain(void)
+static void coroutine_fn test_drv_cb_co_drain_entry(void)
 {
-    call_in_coroutine(test_drv_cb_drain);
+    BlockBackend *blk = blk_all_next(NULL);
+    test_drv_cb_common(blk, BDRV_DRAIN, false);
 }
 
-static void test_quiesce_common(enum drain_type drain_type, bool recursive)
+static void test_drv_cb_co_drain(void)
 {
-    BlockBackend *blk;
-    BlockDriverState *bs, *backing;
-
-    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
-    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
-                              &error_abort);
-    blk_insert_bs(blk, bs, &error_abort);
+    BlockBackend *blk = test_setup();
+    call_in_coroutine(test_drv_cb_co_drain_entry);
+    blk_unref(blk);
+}
 
-    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
-    bdrv_set_backing_hd(bs, backing, &error_abort);
+static void test_quiesce_common(BlockBackend *blk, enum drain_type drain_type,
+                                bool recursive)
+{
+    BlockDriverState *bs = blk_bs(blk);
+    BlockDriverState *backing = bs->backing->bs;
 
     g_assert_cmpint(bs->quiesce_counter, ==, 0);
     g_assert_cmpint(backing->quiesce_counter, ==, 0);
@@ -307,30 +329,46 @@ static void test_quiesce_common(enum drain_type drain_type, bool recursive)
 
     g_assert_cmpint(bs->quiesce_counter, ==, 0);
     g_assert_cmpint(backing->quiesce_counter, ==, 0);
-
-    bdrv_unref(backing);
-    bdrv_unref(bs);
-    blk_unref(blk);
 }
 
 static void test_quiesce_drain_all(void)
 {
-    test_quiesce_common(BDRV_DRAIN_ALL, true);
+    BlockBackend *blk = test_setup();
+    test_quiesce_common(blk, BDRV_DRAIN_ALL, true);
+    blk_unref(blk);
 }
 
 static void test_quiesce_drain(void)
 {
-    test_quiesce_common(BDRV_DRAIN, false);
+    BlockBackend *blk = test_setup();
+    test_quiesce_common(blk, BDRV_DRAIN, false);
+    blk_unref(blk);
+}
+
+static void coroutine_fn test_quiesce_co_drain_all_entry(void)
+{
+    BlockBackend *blk = blk_all_next(NULL);
+    test_quiesce_common(blk, BDRV_DRAIN_ALL, true);
 }
 
 static void test_quiesce_co_drain_all(void)
 {
-    call_in_coroutine(test_quiesce_drain_all);
+    BlockBackend *blk = test_setup();
+    call_in_coroutine(test_quiesce_co_drain_all_entry);
+    blk_unref(blk);
+}
+
+static void coroutine_fn test_quiesce_co_drain_entry(void)
+{
+    BlockBackend *blk = blk_all_next(NULL);
+    test_quiesce_common(blk, BDRV_DRAIN, false);
 }
 
 static void test_quiesce_co_drain(void)
 {
-    call_in_coroutine(test_quiesce_drain);
+    BlockBackend *blk = test_setup();
+    call_in_coroutine(test_quiesce_co_drain_entry);
+    blk_unref(blk);
 }
 
 static void test_nested(void)
-- 
2.40.1


