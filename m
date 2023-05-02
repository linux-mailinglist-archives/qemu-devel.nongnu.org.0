Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7546F49DC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 20:43:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptuwv-0000Ht-CW; Tue, 02 May 2023 14:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptuws-0000Gs-RH
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptuwq-0006YA-TB
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683052920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCB5geFjokxuVJ1NRiOmPxwOvViDN+Zq0evyFgxcIWc=;
 b=K6dlrP89Ga+HXpF6xWj02ywfc1eiRS75a5lE0U3ZcUbwlJHOoWMC4zcUpyYGYScovw2o9i
 K5BKZp8Wv+ulat+CVeOfna0sSs3F2LKgg0/tzrGk1xt17UEXCwxhpyb1gAVT4PRnvuW4b6
 LTkHppoNWGKvyKyVB3w1pYntd4o0BMA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-3JkK_PPPOfKUtg2xuCnDGA-1; Tue, 02 May 2023 14:41:58 -0400
X-MC-Unique: 3JkK_PPPOfKUtg2xuCnDGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6595B87B2A8;
 Tue,  2 May 2023 18:41:57 +0000 (UTC)
Received: from localhost (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 976562166B26;
 Tue,  2 May 2023 18:41:41 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH 2/2] tested: add test for nested aio_poll() in poll handlers
Date: Tue,  2 May 2023 14:41:34 -0400
Message-Id: <20230502184134.534703-3-stefanha@redhat.com>
In-Reply-To: <20230502184134.534703-1-stefanha@redhat.com>
References: <20230502184134.534703-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/unit/test-nested-aio-poll.c | 130 ++++++++++++++++++++++++++++++
 tests/unit/meson.build            |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 tests/unit/test-nested-aio-poll.c

diff --git a/tests/unit/test-nested-aio-poll.c b/tests/unit/test-nested-aio-poll.c
new file mode 100644
index 0000000000..9bbe18b839
--- /dev/null
+++ b/tests/unit/test-nested-aio-poll.c
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Test that poll handlers are not re-entrant in nested aio_poll()
+ *
+ * Copyright Red Hat
+ *
+ * Poll handlers are usually level-triggered. That means they continue firing
+ * until the condition is reset (e.g. a virtqueue becomes empty). If a poll
+ * handler calls nested aio_poll() before the condition is reset, then infinite
+ * recursion occurs.
+ *
+ * aio_poll() is supposed to prevent this by disabling poll handlers in nested
+ * aio_poll() calls. This test case checks that this is indeed what happens.
+ */
+#include "qemu/osdep.h"
+#include "block/aio.h"
+#include "qapi/error.h"
+
+typedef struct {
+    AioContext *ctx;
+
+    /* This is the EventNotifier that drives the test */
+    EventNotifier poll_notifier;
+
+    /* This EventNotifier is only used to wake aio_poll() */
+    EventNotifier dummy_notifier;
+
+    bool nested;
+} TestData;
+
+static void io_read(EventNotifier *notifier)
+{
+    fprintf(stderr, "%s %p\n", __func__, notifier);
+    event_notifier_test_and_clear(notifier);
+}
+
+static bool io_poll_true(void *opaque)
+{
+    fprintf(stderr, "%s %p\n", __func__, opaque);
+    return true;
+}
+
+static bool io_poll_false(void *opaque)
+{
+    fprintf(stderr, "%s %p\n", __func__, opaque);
+    return false;
+}
+
+static void io_poll_ready(EventNotifier *notifier)
+{
+    TestData *td = container_of(notifier, TestData, poll_notifier);
+
+    fprintf(stderr, "> %s\n", __func__);
+
+    g_assert(!td->nested);
+    td->nested = true;
+
+    /* Wake the following nested aio_poll() call */
+    event_notifier_set(&td->dummy_notifier);
+
+    /* This nested event loop must not call io_poll()/io_poll_ready() */
+    g_assert(aio_poll(td->ctx, true));
+
+    td->nested = false;
+
+    fprintf(stderr, "< %s\n", __func__);
+}
+
+/* dummy_notifier never triggers */
+static void io_poll_never_ready(EventNotifier *notifier)
+{
+    g_assert_not_reached();
+}
+
+static void test(void)
+{
+    TestData td = {
+        .ctx = aio_context_new(&error_abort),
+    };
+
+    qemu_set_current_aio_context(td.ctx);
+
+    /* Enable polling */
+    aio_context_set_poll_params(td.ctx, 1000000, 2, 2, &error_abort);
+
+    /*
+     * The GSource is unused but this has the side-effect of changing the fdmon
+     * that AioContext uses.
+     */
+    aio_get_g_source(td.ctx);
+
+    /* Make the event notifier active (set) right away */
+    event_notifier_init(&td.poll_notifier, 1);
+    aio_set_event_notifier(td.ctx, &td.poll_notifier, false,
+                           io_read, io_poll_true, io_poll_ready);
+
+    /* This event notifier will be used later */
+    event_notifier_init(&td.dummy_notifier, 0);
+    aio_set_event_notifier(td.ctx, &td.dummy_notifier, false,
+                           io_read, io_poll_false, io_poll_never_ready);
+
+    /* Consume aio_notify() */
+    g_assert(!aio_poll(td.ctx, false));
+
+    /*
+     * Run the io_read() handler. This has the side-effect of activating
+     * polling in future aio_poll() calls.
+     */
+    g_assert(aio_poll(td.ctx, true));
+
+    /* The second time around the io_poll()/io_poll_ready() handler runs */
+    g_assert(aio_poll(td.ctx, true));
+
+    /* Run io_poll()/io_poll_ready() one more time to show it keeps working */
+    g_assert(aio_poll(td.ctx, true));
+
+    aio_set_event_notifier(td.ctx, &td.dummy_notifier, false,
+                           NULL, NULL, NULL);
+    aio_set_event_notifier(td.ctx, &td.poll_notifier, false, NULL, NULL, NULL);
+    event_notifier_cleanup(&td.dummy_notifier);
+    event_notifier_cleanup(&td.poll_notifier);
+    aio_context_unref(td.ctx);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    g_test_add_func("/nested-aio-poll", test);
+    return g_test_run();
+}
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 3bc78d8660..a314f82baa 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -67,6 +67,7 @@ if have_block
     'test-coroutine': [testblock],
     'test-aio': [testblock],
     'test-aio-multithread': [testblock],
+    'test-nested-aio-poll': [testblock],
     'test-throttle': [testblock],
     'test-thread-pool': [testblock],
     'test-hbitmap': [testblock],
-- 
2.40.1


