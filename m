Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3B432F0CD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:10:33 +0100 (CET)
Received: from localhost ([::1]:54388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDyC-00081y-OY
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkF-0006tQ-IO
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDk3-0007Ac-Bn
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t3PaHE5X4bFnk6vpSNRntxY4mxkylSkIY96oFEvivRM=;
 b=LOf4t9fBPdjogHxuP9yeau5UBQKmUUyanFLTVazadakYNK4GINBm+5iXcgMk6gMyi+zIny
 b1kfgOSPxh+j8Ff/ly1buhgZ286oTQ/YaYE2SiXKeW4cJazJYgrxv57CU3aXKSSrzhPRba
 pwzPXlcullTxpJUt5gx5eP/UVKQMn6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-H1y6iNpvO-uN-pwK2t-Bww-1; Fri, 05 Mar 2021 11:55:46 -0500
X-MC-Unique: H1y6iNpvO-uN-pwK2t-Bww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C16B804330;
 Fri,  5 Mar 2021 16:55:25 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FDAD60BF3;
 Fri,  5 Mar 2021 16:55:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/31] libqtest: add qtest_socket_server()
Date: Fri,  5 Mar 2021 17:54:36 +0100
Message-Id: <20210305165454.356840-14-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Add an API that returns a new UNIX domain socket in the listen state.
The code for this was already there but only used internally in
init_socket().

This new API will be used by vhost-user-blk-test.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210223144653.811468-3-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qtest/libqos/libqtest.h |  8 +++++++
 tests/qtest/libqtest.c        | 40 ++++++++++++++++++++---------------
 2 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index 724f65aa94..e5f1ec590c 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -132,6 +132,14 @@ void qtest_qmp_send(QTestState *s, const char *fmt, ...)
 void qtest_qmp_send_raw(QTestState *s, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 
+/**
+ * qtest_socket_server:
+ * @socket_path: the UNIX domain socket path
+ *
+ * Create and return a listen socket file descriptor, or abort on failure.
+ */
+int qtest_socket_server(const char *socket_path);
+
 /**
  * qtest_vqmp_fds:
  * @s: #QTestState instance to operate on.
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index fd043b0570..b19d2ebda0 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -81,24 +81,8 @@ static void qtest_client_set_rx_handler(QTestState *s, QTestRecvFn recv);
 
 static int init_socket(const char *socket_path)
 {
-    struct sockaddr_un addr;
-    int sock;
-    int ret;
-
-    sock = socket(PF_UNIX, SOCK_STREAM, 0);
-    g_assert_cmpint(sock, !=, -1);
-
-    addr.sun_family = AF_UNIX;
-    snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);
+    int sock = qtest_socket_server(socket_path);
     qemu_set_cloexec(sock);
-
-    do {
-        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr));
-    } while (ret == -1 && errno == EINTR);
-    g_assert_cmpint(ret, !=, -1);
-    ret = listen(sock, 1);
-    g_assert_cmpint(ret, !=, -1);
-
     return sock;
 }
 
@@ -638,6 +622,28 @@ QDict *qtest_qmp_receive_dict(QTestState *s)
     return qmp_fd_receive(s->qmp_fd);
 }
 
+int qtest_socket_server(const char *socket_path)
+{
+    struct sockaddr_un addr;
+    int sock;
+    int ret;
+
+    sock = socket(PF_UNIX, SOCK_STREAM, 0);
+    g_assert_cmpint(sock, !=, -1);
+
+    addr.sun_family = AF_UNIX;
+    snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);
+
+    do {
+        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr));
+    } while (ret == -1 && errno == EINTR);
+    g_assert_cmpint(ret, !=, -1);
+    ret = listen(sock, 1);
+    g_assert_cmpint(ret, !=, -1);
+
+    return sock;
+}
+
 /**
  * Allow users to send a message without waiting for the reply,
  * in the case that they choose to discard all replies up until
-- 
2.29.2


