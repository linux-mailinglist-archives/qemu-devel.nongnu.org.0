Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798714D8654
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:00:23 +0100 (CET)
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlFG-0007ZH-1a
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:00:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbR-0001LU-UH
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbO-0006Yx-SV
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647263950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=609uYovT10MkI//WaiE7MqTlUjD+UHUAYCJdDPsKfng=;
 b=BYIzJLk9Yz3POpK6P5JxIMaIYeutquJdObB4vNgABSR8uZKhijl+g2w+Y1Kw6s2GpiMAzu
 iC1sh+euvG3N+jrly5h/9JD7rYdEi2oEeuMT/jpiLIV15T0HfLoVhf0L0wTAxypbA6hOYI
 RxG07aJes0SH+cO7elyVuZOUCGlmdb0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-7nzq3HbENnKqUrTLJ0aVow-1; Mon, 14 Mar 2022 09:19:07 -0400
X-MC-Unique: 7nzq3HbENnKqUrTLJ0aVow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98E8D2999B24;
 Mon, 14 Mar 2022 13:19:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56BC12EF83;
 Mon, 14 Mar 2022 13:19:06 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 08/10] tests/unit/test-bdrv-drain.c: graph setup functions
 can't run in coroutines
Date: Mon, 14 Mar 2022 09:18:52 -0400
Message-Id: <20220314131854.2202651-9-eesposit@redhat.com>
In-Reply-To: <20220314131854.2202651-1-eesposit@redhat.com>
References: <20220314131854.2202651-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Graph initialization functions like blk_new(), bdrv_new() and so on
should not run in a coroutine. In fact, they might invoke a drain
(for example blk_insert_bs eventually calls bdrv_replace_child_noperm)
that in turn can invoke callbacks like bdrv_do_drained_begin_quiesce(),
that asserts exactly that we are not in a coroutine.

Move the initialization phase of test_drv_cb and test_quiesce_common
outside the coroutine logic.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20211213104014.69858-2-eesposit@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 118 ++++++++++++++++++++++-------------
 1 file changed, 73 insertions(+), 45 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index fa0d86209a..a3bc19965d 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -116,7 +116,8 @@ static void aio_ret_cb(void *opaque, int ret)
 }
 
 typedef struct CallInCoroutineData {
-    void (*entry)(void);
+    void (*entry)(void *);
+    void *arg;
     bool done;
 } CallInCoroutineData;
 
@@ -124,15 +125,16 @@ static coroutine_fn void call_in_coroutine_entry(void *opaque)
 {
     CallInCoroutineData *data = opaque;
 
-    data->entry();
+    data->entry(data->arg);
     data->done = true;
 }
 
-static void call_in_coroutine(void (*entry)(void))
+static void call_in_coroutine(void (*entry)(void *), void *arg)
 {
     Coroutine *co;
     CallInCoroutineData data = {
         .entry  = entry,
+        .arg    = arg,
         .done   = false,
     };
 
@@ -192,26 +194,28 @@ static void do_drain_end_unlocked(enum drain_type drain_type, BlockDriverState *
     }
 }
 
-static void test_drv_cb_common(enum drain_type drain_type, bool recursive)
-{
+typedef struct TestDriverCBData {
+    enum drain_type drain_type;
+    bool recursive;
     BlockBackend *blk;
     BlockDriverState *bs, *backing;
-    BDRVTestState *s, *backing_s;
+} TestDriverCBData;
+
+static void test_drv_cb_common(void *arg)
+{
+    TestDriverCBData *data = arg;
+    BlockBackend *blk = data->blk;
+    BlockDriverState *bs = data->bs;
+    BlockDriverState *backing = data->backing;
+    enum drain_type drain_type = data->drain_type;
+    bool recursive = data->recursive;
+    BDRVTestState *s = bs->opaque;
+    BDRVTestState *backing_s = backing->opaque;
     BlockAIOCB *acb;
     int aio_ret;
 
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, NULL, 0);
 
-    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
-    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
-                              &error_abort);
-    s = bs->opaque;
-    blk_insert_bs(blk, bs, &error_abort);
-
-    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
-    backing_s = backing->opaque;
-    bdrv_set_backing_hd(bs, backing, &error_abort);
-
     /* Simple bdrv_drain_all_begin/end pair, check that CBs are called */
     g_assert_cmpint(s->drain_count, ==, 0);
     g_assert_cmpint(backing_s->drain_count, ==, 0);
@@ -245,54 +249,77 @@ static void test_drv_cb_common(enum drain_type drain_type, bool recursive)
 
     g_assert_cmpint(s->drain_count, ==, 0);
     g_assert_cmpint(backing_s->drain_count, ==, 0);
+}
 
-    bdrv_unref(backing);
-    bdrv_unref(bs);
-    blk_unref(blk);
+static void test_common_cb(enum drain_type drain_type, bool in_coroutine,
+                           void (*cb)(void *))
+{
+    TestDriverCBData data;
+
+    data.drain_type = drain_type;
+    data.recursive = (drain_type != BDRV_DRAIN);
+
+    data.blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
+    data.bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
+                              &error_abort);
+    blk_insert_bs(data.blk, data.bs, &error_abort);
+
+    data.backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
+    bdrv_set_backing_hd(data.bs, data.backing, &error_abort);
+
+    if (in_coroutine) {
+        call_in_coroutine(cb, &data);
+    } else {
+        cb(&data);
+    }
+
+    bdrv_unref(data.backing);
+    bdrv_unref(data.bs);
+    blk_unref(data.blk);
+}
+
+static void test_drv_cb(enum drain_type drain_type, bool in_coroutine)
+{
+    test_common_cb(drain_type, in_coroutine, test_drv_cb_common);
 }
 
 static void test_drv_cb_drain_all(void)
 {
-    test_drv_cb_common(BDRV_DRAIN_ALL, true);
+    test_drv_cb(BDRV_DRAIN_ALL, false);
 }
 
 static void test_drv_cb_drain(void)
 {
-    test_drv_cb_common(BDRV_DRAIN, false);
+    test_drv_cb(BDRV_DRAIN, false);
 }
 
 static void test_drv_cb_drain_subtree(void)
 {
-    test_drv_cb_common(BDRV_SUBTREE_DRAIN, true);
+    test_drv_cb(BDRV_SUBTREE_DRAIN, false);
 }
 
 static void test_drv_cb_co_drain_all(void)
 {
-    call_in_coroutine(test_drv_cb_drain_all);
+    test_drv_cb(BDRV_DRAIN_ALL, true);
 }
 
 static void test_drv_cb_co_drain(void)
 {
-    call_in_coroutine(test_drv_cb_drain);
+    test_drv_cb(BDRV_DRAIN, true);
 }
 
 static void test_drv_cb_co_drain_subtree(void)
 {
-    call_in_coroutine(test_drv_cb_drain_subtree);
+    test_drv_cb(BDRV_SUBTREE_DRAIN, true);
 }
 
-static void test_quiesce_common(enum drain_type drain_type, bool recursive)
+static void test_quiesce_common(void *arg)
 {
-    BlockBackend *blk;
-    BlockDriverState *bs, *backing;
-
-    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
-    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
-                              &error_abort);
-    blk_insert_bs(blk, bs, &error_abort);
-
-    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
-    bdrv_set_backing_hd(bs, backing, &error_abort);
+    TestDriverCBData *data = arg;
+    BlockDriverState *bs = data->bs;
+    BlockDriverState *backing = data->backing;
+    enum drain_type drain_type = data->drain_type;
+    bool recursive = data->recursive;
 
     g_assert_cmpint(bs->quiesce_counter, ==, 0);
     g_assert_cmpint(backing->quiesce_counter, ==, 0);
@@ -306,40 +333,41 @@ static void test_quiesce_common(enum drain_type drain_type, bool recursive)
 
     g_assert_cmpint(bs->quiesce_counter, ==, 0);
     g_assert_cmpint(backing->quiesce_counter, ==, 0);
+}
 
-    bdrv_unref(backing);
-    bdrv_unref(bs);
-    blk_unref(blk);
+static void test_quiesce(enum drain_type drain_type, bool in_coroutine)
+{
+    test_common_cb(drain_type, in_coroutine, test_quiesce_common);
 }
 
 static void test_quiesce_drain_all(void)
 {
-    test_quiesce_common(BDRV_DRAIN_ALL, true);
+    test_quiesce(BDRV_DRAIN_ALL, false);
 }
 
 static void test_quiesce_drain(void)
 {
-    test_quiesce_common(BDRV_DRAIN, false);
+    test_quiesce(BDRV_DRAIN, false);
 }
 
 static void test_quiesce_drain_subtree(void)
 {
-    test_quiesce_common(BDRV_SUBTREE_DRAIN, true);
+    test_quiesce(BDRV_SUBTREE_DRAIN, false);
 }
 
 static void test_quiesce_co_drain_all(void)
 {
-    call_in_coroutine(test_quiesce_drain_all);
+    test_quiesce(BDRV_DRAIN_ALL, true);
 }
 
 static void test_quiesce_co_drain(void)
 {
-    call_in_coroutine(test_quiesce_drain);
+    test_quiesce(BDRV_DRAIN, true);
 }
 
 static void test_quiesce_co_drain_subtree(void)
 {
-    call_in_coroutine(test_quiesce_drain_subtree);
+    test_quiesce(BDRV_SUBTREE_DRAIN, true);
 }
 
 static void test_nested(void)
-- 
2.31.1


