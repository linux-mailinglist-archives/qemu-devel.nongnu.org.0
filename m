Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329026112A2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:26:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPME-0002eS-4R; Fri, 28 Oct 2022 09:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKp-0001LB-HI
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKn-0005L7-JM
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5HpXQHpI3Rq3zvkYS5XZjRFCC70ojabyKqbuMJ3A6Yo=;
 b=gVngQW+WTVFgJR3ROpnnnDYFEpaGeThsCnRDOErj6Bo+CgAaXGrPoxpEXvItOeDuvgMIfH
 8QEbv/SQwnRFXibRsN24Y7OZYthWBED17RSpZjgWFys4Xk4a78BBj/5hML0JeBOV538SE0
 fzTIs7fr9lsWgpcT4TSn9C5QMMzBkYw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-D20c8j8EPeqnpCaZGuP_zw-1; Fri, 28 Oct 2022 09:23:37 -0400
X-MC-Unique: D20c8j8EPeqnpCaZGuP_zw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E04D8041B5;
 Fri, 28 Oct 2022 13:23:37 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D5FE1121319;
 Fri, 28 Oct 2022 13:23:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 18/21] tests/qtest: libqtest: Introduce qtest_wait_qemu()
Date: Fri, 28 Oct 2022 15:23:01 +0200
Message-Id: <20221028132304.829103-19-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

Introduce an API for qtest to wait for the QEMU process to terminate.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221028045736.679903-7-bin.meng@windriver.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.h |  9 ++++++
 tests/qtest/libqtest.c | 63 +++++++++++++++++++++++++-----------------
 2 files changed, 47 insertions(+), 25 deletions(-)

diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index 65c040e504..91a5f7edd9 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -75,6 +75,15 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args);
  */
 QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd);
 
+/**
+ * qtest_wait_qemu:
+ * @s: #QTestState instance to operate on.
+ *
+ * Wait for the QEMU process to terminate. It is safe to call this function
+ * multiple times.
+ */
+void qtest_wait_qemu(QTestState *s);
+
 /**
  * qtest_kill_qemu:
  * @s: #QTestState instance to operate on.
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index d12a604d78..e1e2d39a6e 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -156,37 +156,14 @@ void qtest_set_expected_status(QTestState *s, int status)
     s->expected_status = status;
 }
 
-void qtest_kill_qemu(QTestState *s)
+static void qtest_check_status(QTestState *s)
 {
-    pid_t pid = s->qemu_pid;
-#ifndef _WIN32
-    int wstatus;
-#else
-    DWORD ret;
-#endif
-
-    /* Skip wait if qtest_probe_child already reaped.  */
-    if (pid != -1) {
-#ifndef _WIN32
-        kill(pid, SIGTERM);
-        TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
-        assert(pid == s->qemu_pid);
-#else
-        TerminateProcess((HANDLE)pid, s->expected_status);
-        ret = WaitForSingleObject((HANDLE)pid, INFINITE);
-        assert(ret == WAIT_OBJECT_0);
-        GetExitCodeProcess((HANDLE)pid, &s->exit_code);
-        CloseHandle((HANDLE)pid);
-#endif
-        s->qemu_pid = -1;
-    }
-
     /*
      * Check whether qemu exited with expected exit status; anything else is
      * fishy and should be logged with as much detail as possible.
      */
 #ifndef _WIN32
-    wstatus = s->wstatus;
+    int wstatus = s->wstatus;
     if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) != s->expected_status) {
         fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
                 "process but encountered exit status %d (expected %d)\n",
@@ -212,6 +189,42 @@ void qtest_kill_qemu(QTestState *s)
 #endif
 }
 
+void qtest_wait_qemu(QTestState *s)
+{
+#ifndef _WIN32
+    pid_t pid;
+
+    TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
+    assert(pid == s->qemu_pid);
+#else
+    DWORD ret;
+
+    ret = WaitForSingleObject((HANDLE)s->qemu_pid, INFINITE);
+    assert(ret == WAIT_OBJECT_0);
+    GetExitCodeProcess((HANDLE)s->qemu_pid, &s->exit_code);
+    CloseHandle((HANDLE)s->qemu_pid);
+#endif
+
+    qtest_check_status(s);
+}
+
+void qtest_kill_qemu(QTestState *s)
+{
+    /* Skip wait if qtest_probe_child() already reaped */
+    if (s->qemu_pid != -1) {
+#ifndef _WIN32
+        kill(s->qemu_pid, SIGTERM);
+#else
+        TerminateProcess((HANDLE)s->qemu_pid, s->expected_status);
+#endif
+        qtest_wait_qemu(s);
+        s->qemu_pid = -1;
+        return;
+    }
+
+    qtest_check_status(s);
+}
+
 static void kill_qemu_hook_func(void *s)
 {
     qtest_kill_qemu(s);
-- 
2.31.1


