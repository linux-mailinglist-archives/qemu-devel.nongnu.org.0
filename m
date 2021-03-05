Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50FC32F18F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:42:26 +0100 (CET)
Received: from localhost ([::1]:56182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIET3-0004Jv-Ud
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkb-0007YT-H6
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkB-0007Fn-CH
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8e52D/2ZXjDcdIEsKV/OpK62L1bLWsj4zhMYxcpUUt8=;
 b=R3Nxww0rxLbsNThP2jVCb5WIaGK2neffCaIuUQjg/a1aC0xShhzpCZDaiUEbM1stHpY6Xu
 eVR2lXT7Qk9d43cYMaEkJBLxhaQ7z3XYe900FkDmQtBk3IdiFlJmQmDmeYjRFf+5hSaONJ
 v0QYgD9gbZPnSbpZbbmpfIoPZ98YGrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-jYpO6Qz-NcShNLX8veXqCA-1; Fri, 05 Mar 2021 11:55:56 -0500
X-MC-Unique: jYpO6Qz-NcShNLX8veXqCA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98BD085EE8B;
 Fri,  5 Mar 2021 16:55:26 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B4EF60BF3;
 Fri,  5 Mar 2021 16:55:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/31] libqtest: add qtest_kill_qemu()
Date: Fri,  5 Mar 2021 17:54:37 +0100
Message-Id: <20210305165454.356840-15-kwolf@redhat.com>
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Tests that manage multiple processes may wish to kill QEMU before
destroying the QTestState. Expose a function to do that.

The vhost-user-blk-test testcase will need this.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210223144653.811468-4-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qtest/libqos/libqtest.h | 11 +++++++++++
 tests/qtest/libqtest.c        |  7 ++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index e5f1ec590c..51287b9276 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -74,6 +74,17 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args);
  */
 QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd);
 
+/**
+ * qtest_kill_qemu:
+ * @s: #QTestState instance to operate on.
+ *
+ * Kill the QEMU process and wait for it to terminate. It is safe to call this
+ * function multiple times. Normally qtest_quit() is used instead because it
+ * also frees QTestState. Use qtest_kill_qemu() when you just want to kill QEMU
+ * and qtest_quit() will be called later.
+ */
+void qtest_kill_qemu(QTestState *s);
+
 /**
  * qtest_quit:
  * @s: #QTestState instance to operate on.
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index b19d2ebda0..2a98de2907 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -133,7 +133,7 @@ void qtest_set_expected_status(QTestState *s, int status)
     s->expected_status = status;
 }
 
-static void kill_qemu(QTestState *s)
+void qtest_kill_qemu(QTestState *s)
 {
     pid_t pid = s->qemu_pid;
     int wstatus;
@@ -143,6 +143,7 @@ static void kill_qemu(QTestState *s)
         kill(pid, SIGTERM);
         TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
         assert(pid == s->qemu_pid);
+        s->qemu_pid = -1;
     }
 
     /*
@@ -169,7 +170,7 @@ static void kill_qemu(QTestState *s)
 
 static void kill_qemu_hook_func(void *s)
 {
-    kill_qemu(s);
+    qtest_kill_qemu(s);
 }
 
 static void sigabrt_handler(int signo)
@@ -373,7 +374,7 @@ void qtest_quit(QTestState *s)
     /* Uninstall SIGABRT handler on last instance */
     cleanup_sigabrt_handler();
 
-    kill_qemu(s);
+    qtest_kill_qemu(s);
     close(s->fd);
     close(s->qmp_fd);
     g_string_free(s->rx, true);
-- 
2.29.2


