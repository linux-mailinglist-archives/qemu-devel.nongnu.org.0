Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EF45ED781
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 10:19:40 +0200 (CEST)
Received: from localhost ([::1]:38112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odSI7-0001vs-Jj
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 04:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLv-00014q-7n
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLt-0008Vd-7i
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+QLQjP6pIJ6eaMa4W1rUwBiMUhKhefteCR6Kw9OXt+w=;
 b=Ljf7DfrXPd0aS+T9CvLjq5rcyu3IpJm1alVpki1RsKfEJ/ZdDt9YLexoBXssCPlzycKydK
 8wdGJ2OBFl2F1rQfe4wrzVO/K4YmE3ehmZ+gppNiQDQWh58RCKIWbKUlHvMUAz8tsiAnGG
 MeDKp/k9cs/r8kEheCVoJBhhDZntA3c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-hy00STpMP3CfeXs0qu-zIQ-1; Wed, 28 Sep 2022 03:19:25 -0400
X-MC-Unique: hy00STpMP3CfeXs0qu-zIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF50029AB402;
 Wed, 28 Sep 2022 07:19:24 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F2D740C83C5;
 Wed, 28 Sep 2022 07:19:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 21/37] tests/qtest: libqtest: Exclude the *_fds APIs for win32
Date: Wed, 28 Sep 2022 09:18:27 +0200
Message-Id: <20220928071843.1468323-22-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

libqmp.c::qmp_fd_vsend_fds() is not available on Windows, hence any
APIs in libqtest that call libqmp.c::qmp_fd_vsend_fds() should be
excluded for win32 too. This includes the following:

  * qtest_qmp_vsend_fds()
  * qtest_vqmp_fds()
  * qtest_qmp_fds()
  * qtest_qmp_add_client()

Note qtest_qmp_vsend() was wrongly written to call qmp_fd_vsend_fds()
previously, but it should call the non fds version API qmp_fd_vsend().

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220925113032.1949844-35-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.h |  8 ++++++++
 tests/qtest/libqtest.c | 10 +++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index 94b187837d..3abc75964d 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -94,6 +94,7 @@ void qtest_kill_qemu(QTestState *s);
  */
 void qtest_quit(QTestState *s);
 
+#ifndef _WIN32
 /**
  * qtest_qmp_fds:
  * @s: #QTestState instance to operate on.
@@ -108,6 +109,7 @@ void qtest_quit(QTestState *s);
 QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
                      const char *fmt, ...)
     G_GNUC_PRINTF(4, 5);
+#endif /* _WIN32 */
 
 /**
  * qtest_qmp:
@@ -152,6 +154,7 @@ void qtest_qmp_send_raw(QTestState *s, const char *fmt, ...)
  */
 int qtest_socket_server(const char *socket_path);
 
+#ifndef _WIN32
 /**
  * qtest_vqmp_fds:
  * @s: #QTestState instance to operate on.
@@ -167,6 +170,7 @@ int qtest_socket_server(const char *socket_path);
 QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
                       const char *fmt, va_list ap)
     G_GNUC_PRINTF(4, 0);
+#endif /* _WIN32 */
 
 /**
  * qtest_vqmp:
@@ -181,6 +185,7 @@ QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
 QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
     G_GNUC_PRINTF(2, 0);
 
+#ifndef _WIN32
 /**
  * qtest_qmp_vsend_fds:
  * @s: #QTestState instance to operate on.
@@ -196,6 +201,7 @@ QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
 void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,
                          const char *fmt, va_list ap)
     G_GNUC_PRINTF(4, 0);
+#endif /* _WIN32 */
 
 /**
  * qtest_qmp_vsend:
@@ -743,6 +749,7 @@ void qtest_qmp_device_add_qdict(QTestState *qts, const char *drv,
 void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
                           const char *fmt, ...) G_GNUC_PRINTF(4, 5);
 
+#ifndef _WIN32
 /**
  * qtest_qmp_add_client:
  * @qts: QTestState instance to operate on
@@ -752,6 +759,7 @@ void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
  * Call QMP ``getfd`` followed by ``add_client`` with the given @fd.
  */
 void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd);
+#endif /* _WIN32 */
 
 /**
  * qtest_qmp_device_del:
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index d8ffa0e7b1..5c4a509c58 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -592,17 +592,20 @@ int qtest_socket_server(const char *socket_path)
     return sock;
 }
 
+#ifndef _WIN32
 void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,
                          const char *fmt, va_list ap)
 {
     qmp_fd_vsend_fds(s->qmp_fd, fds, fds_num, fmt, ap);
 }
+#endif
 
 void qtest_qmp_vsend(QTestState *s, const char *fmt, va_list ap)
 {
-    qmp_fd_vsend_fds(s->qmp_fd, NULL, 0, fmt, ap);
+    qmp_fd_vsend(s->qmp_fd, fmt, ap);
 }
 
+#ifndef _WIN32
 QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
                       const char *fmt, va_list ap)
 {
@@ -611,6 +614,7 @@ QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
     /* Receive reply */
     return qtest_qmp_receive(s);
 }
+#endif
 
 QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
 {
@@ -620,6 +624,7 @@ QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
     return qtest_qmp_receive(s);
 }
 
+#ifndef _WIN32
 QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
                      const char *fmt, ...)
 {
@@ -631,6 +636,7 @@ QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
     va_end(ap);
     return response;
 }
+#endif
 
 QDict *qtest_qmp(QTestState *s, const char *fmt, ...)
 {
@@ -1327,6 +1333,7 @@ void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
     qobject_unref(args);
 }
 
+#ifndef _WIN32
 void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
 {
     QDict *resp;
@@ -1346,6 +1353,7 @@ void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
     g_assert(!qdict_haskey(resp, "error"));
     qobject_unref(resp);
 }
+#endif
 
 /*
  * Generic hot-unplugging test via the device_del QMP command.
-- 
2.31.1


