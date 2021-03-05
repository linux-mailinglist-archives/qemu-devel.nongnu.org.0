Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D8132F0B6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:08:24 +0100 (CET)
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDw7-0004VA-QH
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkC-0006rr-1Q
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDjx-00079Y-DL
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8yqYXZpSfPDjwjzkzYok73HMHctHeR31FYw9hDW0sk=;
 b=JZG0bqrwrxkzwOLGNWdNFDFTS5cVYZeg7Q9C5AUb506405SnOdnQgGbVxt1vyJihsTiRRG
 dVM1j1KbNg/oMeSz8MxGE664svBEwhs6JdynjmTyByxL/ysF1vXcSe4MrkQNRjLAwIGEqm
 5wGPL3byHM8d2oPJLB4iQSjjU4MhNPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-ZTCQox4IO6aXSIjFRYvbWQ-1; Fri, 05 Mar 2021 11:55:46 -0500
X-MC-Unique: ZTCQox4IO6aXSIjFRYvbWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0482D80197D;
 Fri,  5 Mar 2021 16:55:28 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9E9260BF3;
 Fri,  5 Mar 2021 16:55:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/31] libqtest: add qtest_remove_abrt_handler()
Date: Fri,  5 Mar 2021 17:54:38 +0100
Message-Id: <20210305165454.356840-16-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Add a function to remove previously-added abrt handler functions.

Now that a symmetric pair of add/remove functions exists we can also
balance the SIGABRT handler installation. The signal handler was
installed each time qtest_add_abrt_handler() was called. Now it is
installed when the abrt handler list becomes non-empty and removed again
when the list becomes empty.

The qtest_remove_abrt_handler() function will be used by
vhost-user-blk-test.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210223144653.811468-5-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qtest/libqos/libqtest.h | 18 ++++++++++++++++++
 tests/qtest/libqtest.c        | 35 +++++++++++++++++++++++++++++------
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index 51287b9276..a68dcd79d4 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -649,8 +649,26 @@ void qtest_add_data_func_full(const char *str, void *data,
         g_free(path); \
     } while (0)
 
+/**
+ * qtest_add_abrt_handler:
+ * @fn: Handler function
+ * @data: Argument that is passed to the handler
+ *
+ * Add a handler function that is invoked on SIGABRT. This can be used to
+ * terminate processes and perform other cleanup. The handler can be removed
+ * with qtest_remove_abrt_handler().
+ */
 void qtest_add_abrt_handler(GHookFunc fn, const void *data);
 
+/**
+ * qtest_remove_abrt_handler:
+ * @data: Argument previously passed to qtest_add_abrt_handler()
+ *
+ * Remove an abrt handler that was previously added with
+ * qtest_add_abrt_handler().
+ */
+void qtest_remove_abrt_handler(void *data);
+
 /**
  * qtest_qmp_assert_success:
  * @qts: QTestState instance to operate on
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 2a98de2907..71e359efcd 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -196,15 +196,30 @@ static void cleanup_sigabrt_handler(void)
     sigaction(SIGABRT, &sigact_old, NULL);
 }
 
+static bool hook_list_is_empty(GHookList *hook_list)
+{
+    GHook *hook = g_hook_first_valid(hook_list, TRUE);
+
+    if (!hook) {
+        return false;
+    }
+
+    g_hook_unref(hook_list, hook);
+    return true;
+}
+
 void qtest_add_abrt_handler(GHookFunc fn, const void *data)
 {
     GHook *hook;
 
-    /* Only install SIGABRT handler once */
     if (!abrt_hooks.is_setup) {
         g_hook_list_init(&abrt_hooks, sizeof(GHook));
     }
-    setup_sigabrt_handler();
+
+    /* Only install SIGABRT handler once */
+    if (hook_list_is_empty(&abrt_hooks)) {
+        setup_sigabrt_handler();
+    }
 
     hook = g_hook_alloc(&abrt_hooks);
     hook->func = fn;
@@ -213,6 +228,17 @@ void qtest_add_abrt_handler(GHookFunc fn, const void *data)
     g_hook_prepend(&abrt_hooks, hook);
 }
 
+void qtest_remove_abrt_handler(void *data)
+{
+    GHook *hook = g_hook_find_data(&abrt_hooks, TRUE, data);
+    g_hook_destroy_link(&abrt_hooks, hook);
+
+    /* Uninstall SIGABRT handler on last instance */
+    if (hook_list_is_empty(&abrt_hooks)) {
+        cleanup_sigabrt_handler();
+    }
+}
+
 static const char *qtest_qemu_binary(void)
 {
     const char *qemu_bin;
@@ -369,10 +395,7 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
 
 void qtest_quit(QTestState *s)
 {
-    g_hook_destroy_link(&abrt_hooks, g_hook_find_data(&abrt_hooks, TRUE, s));
-
-    /* Uninstall SIGABRT handler on last instance */
-    cleanup_sigabrt_handler();
+    qtest_remove_abrt_handler(s);
 
     qtest_kill_qemu(s);
     close(s->fd);
-- 
2.29.2


