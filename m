Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70E762FBE0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 18:44:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow5Mp-00060s-G2; Fri, 18 Nov 2022 12:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5Mm-0005w0-6l
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5Mk-0002S4-K5
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668793285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qE+Pkpp/UganRMiSi+xneIMLzymZ0aUl0bpikXOjao=;
 b=a/c3nROt+n21vIuiRzBqlppf2ro4DDR95oqsDmNIihK0f5SBMUDD84f8zdJiu/HyYKOPBL
 d2Jc1Y9TkEZV+EsDsUMVwyydbvYNAeznc6F3vx013RMM7LFQTBW+2NwWBSdrq2UsExJ8r+
 TFBbSiOH82dto4ppHGcTmi835TCSDPs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-6rxRBnDlOqCmTv7HZkXHGg-1; Fri, 18 Nov 2022 12:41:24 -0500
X-MC-Unique: 6rxRBnDlOqCmTv7HZkXHGg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3EC3101A56C;
 Fri, 18 Nov 2022 17:41:23 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8CDB492B04;
 Fri, 18 Nov 2022 17:41:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, vsementsov@yandex-team.ru,
 qemu-devel@nongnu.org
Subject: [PATCH v2 02/15] test-bdrv-drain: Don't yield in
 .bdrv_co_drained_begin/end()
Date: Fri, 18 Nov 2022 18:40:57 +0100
Message-Id: <20221118174110.55183-3-kwolf@redhat.com>
In-Reply-To: <20221118174110.55183-1-kwolf@redhat.com>
References: <20221118174110.55183-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

We want to change .bdrv_co_drained_begin/end() back to be non-coroutine
callbacks, so in preparation, avoid yielding in their implementation.

This does almost the same as the existing logic in bdrv_drain_invoke(),
by creating and entering coroutines internally. However, since the test
case is by far the heaviest user of coroutine code in drain callbacks,
it is preferable to have the complexity in the test case rather than the
drain core, which is already complicated enough without this.

The behaviour for bdrv_drain_begin() is unchanged because we increase
bs->in_flight and this is still polled. However, bdrv_drain_end()
doesn't wait for the spawned coroutine to complete any more. This is
fine, we don't rely on bdrv_drain_end() restarting all operations
immediately before the next aio_poll().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 64 ++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 18 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 09dc4a4891..24f34e24ad 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -38,12 +38,22 @@ typedef struct BDRVTestState {
     bool sleep_in_drain_begin;
 } BDRVTestState;
 
+static void coroutine_fn sleep_in_drain_begin(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 100000);
+    bdrv_dec_in_flight(bs);
+}
+
 static void coroutine_fn bdrv_test_co_drain_begin(BlockDriverState *bs)
 {
     BDRVTestState *s = bs->opaque;
     s->drain_count++;
     if (s->sleep_in_drain_begin) {
-        qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 100000);
+        Coroutine *co = qemu_coroutine_create(sleep_in_drain_begin, bs);
+        bdrv_inc_in_flight(bs);
+        aio_co_enter(bdrv_get_aio_context(bs), co);
     }
 }
 
@@ -1916,6 +1926,21 @@ static int coroutine_fn bdrv_replace_test_co_preadv(BlockDriverState *bs,
     return 0;
 }
 
+static void coroutine_fn bdrv_replace_test_drain_co(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+    BDRVReplaceTestState *s = bs->opaque;
+
+    /* Keep waking io_co up until it is done */
+    while (s->io_co) {
+        aio_co_wake(s->io_co);
+        s->io_co = NULL;
+        qemu_coroutine_yield();
+    }
+    s->drain_co = NULL;
+    bdrv_dec_in_flight(bs);
+}
+
 /**
  * If .drain_count is 0, wake up .io_co if there is one; and set
  * .was_drained.
@@ -1926,20 +1951,27 @@ static void coroutine_fn bdrv_replace_test_co_drain_begin(BlockDriverState *bs)
     BDRVReplaceTestState *s = bs->opaque;
 
     if (!s->drain_count) {
-        /* Keep waking io_co up until it is done */
-        s->drain_co = qemu_coroutine_self();
-        while (s->io_co) {
-            aio_co_wake(s->io_co);
-            s->io_co = NULL;
-            qemu_coroutine_yield();
-        }
-        s->drain_co = NULL;
-
+        s->drain_co = qemu_coroutine_create(bdrv_replace_test_drain_co, bs);
+        bdrv_inc_in_flight(bs);
+        aio_co_enter(bdrv_get_aio_context(bs), s->drain_co);
         s->was_drained = true;
     }
     s->drain_count++;
 }
 
+static void coroutine_fn bdrv_replace_test_read_entry(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+    char data;
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, &data, 1);
+    int ret;
+
+    /* Queue a read request post-drain */
+    ret = bdrv_replace_test_co_preadv(bs, 0, 1, &qiov, 0);
+    g_assert(ret >= 0);
+    bdrv_dec_in_flight(bs);
+}
+
 /**
  * Reduce .drain_count, set .was_undrained once it reaches 0.
  * If .drain_count reaches 0 and the node has a backing file, issue a
@@ -1951,17 +1983,13 @@ static void coroutine_fn bdrv_replace_test_co_drain_end(BlockDriverState *bs)
 
     g_assert(s->drain_count > 0);
     if (!--s->drain_count) {
-        int ret;
-
         s->was_undrained = true;
 
         if (bs->backing) {
-            char data;
-            QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, &data, 1);
-
-            /* Queue a read request post-drain */
-            ret = bdrv_replace_test_co_preadv(bs, 0, 1, &qiov, 0);
-            g_assert(ret >= 0);
+            Coroutine *co = qemu_coroutine_create(bdrv_replace_test_read_entry,
+                                                  bs);
+            bdrv_inc_in_flight(bs);
+            aio_co_enter(bdrv_get_aio_context(bs), co);
         }
     }
 }
-- 
2.38.1


