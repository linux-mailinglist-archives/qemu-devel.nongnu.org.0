Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45863A8A7C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:56:49 +0200 (CEST)
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltG76-0007wV-SG
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyj-0001Zv-F9
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyh-0000vc-5x
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7sss+8frESIKewJODcAPUvGBz8v06flQRyCv97eMUxQ=;
 b=iKBQl4wlAoC+mZCIJiNFMdG/FRBT4pqfFj5WqHuAYq+EHVggpD89+JHgKBLsK8OsJZu2+E
 x6mP+ipy+3LmOCw61XPKZqFCWLKDhYUZCmNH4yS+bDGAkdh494LgZpPIObTB6Yc3Eo6Lh/
 2RuvYfiUuDJ5Gy/ADYBvzwaXEAFJ1uU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-WmvvPunhMDSM90SJ6NEguw-1; Tue, 15 Jun 2021 16:48:04 -0400
X-MC-Unique: WmvvPunhMDSM90SJ6NEguw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 843B1800D55;
 Tue, 15 Jun 2021 20:48:03 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35FAC5D9CA;
 Tue, 15 Jun 2021 20:48:03 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/34] tests: cover aio_co_enter from a worker thread without
 BQL taken
Date: Tue, 15 Jun 2021 15:47:24 -0500
Message-Id: <20210615204756.281505-3-eblake@redhat.com>
In-Reply-To: <20210615204756.281505-1-eblake@redhat.com>
References: <20210615204756.281505-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Add a testcase for the test fixed by commit 'async: the main AioContext
is only "current" if under the BQL.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210614110214.726722-1-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-aio.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/unit/test-aio.c b/tests/unit/test-aio.c
index 8a4607846340..6feeb9a4a9fd 100644
--- a/tests/unit/test-aio.c
+++ b/tests/unit/test-aio.c
@@ -877,6 +877,42 @@ static void test_queue_chaining(void)
     g_assert_cmpint(data_b.i, ==, data_b.max);
 }

+static void co_check_current_thread(void *opaque)
+{
+    QemuThread *main_thread = opaque;
+    assert(qemu_thread_is_self(main_thread));
+}
+
+static void *test_aio_co_enter(void *co)
+{
+    /*
+     * qemu_get_current_aio_context() should not to be the main thread
+     * AioContext, because this is a worker thread that has not taken
+     * the BQL.  So aio_co_enter will schedule the coroutine in the
+     * main thread AioContext.
+     */
+    aio_co_enter(qemu_get_aio_context(), co);
+    return NULL;
+}
+
+static void test_worker_thread_co_enter(void)
+{
+    QemuThread this_thread, worker_thread;
+    Coroutine *co;
+
+    qemu_thread_get_self(&this_thread);
+    co = qemu_coroutine_create(co_check_current_thread, &this_thread);
+
+    qemu_thread_create(&worker_thread, "test_acquire_thread",
+                       test_aio_co_enter,
+                       co, QEMU_THREAD_JOINABLE);
+
+    /* Test aio_co_enter from a worker thread.  */
+    qemu_thread_join(&worker_thread);
+    g_assert(aio_poll(ctx, true));
+    g_assert(!aio_poll(ctx, false));
+}
+
 /* End of tests.  */

 int main(int argc, char **argv)
@@ -903,6 +939,7 @@ int main(int argc, char **argv)
     g_test_add_func("/aio/timer/schedule",          test_timer_schedule);

     g_test_add_func("/aio/coroutine/queue-chaining", test_queue_chaining);
+    g_test_add_func("/aio/coroutine/worker-thread-co-enter", test_worker_thread_co_enter);

     g_test_add_func("/aio-gsource/flush",                   test_source_flush);
     g_test_add_func("/aio-gsource/bh/schedule",             test_source_bh_schedule);
-- 
2.31.1


