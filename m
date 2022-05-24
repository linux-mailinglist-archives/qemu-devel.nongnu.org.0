Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2A75327F0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 12:40:23 +0200 (CEST)
Received: from localhost ([::1]:34174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntRxc-00024z-SU
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 06:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntRsV-0007dW-Qa
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:35:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntRsS-0007Mu-0Q
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653388499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VkUbbhdlkvtd34jRRQFGI3jj9KdISnfT4ypt5vgcTVQ=;
 b=LqRZktBy26hiqvNV6QqXBf1Dade6zFW+4wtve7rc59goJOU3B3wY0CAGsELxikLqdsWbKG
 jJ3rsDi9c4IQbVhk1sQkPRF3gUMlEUkPQrj0drE2IqsGPa7y2zyfx7OBswAt73R1ZxfGgP
 LjRozQ7RG1nm18RYgSSguU/M2r4EuzM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-nZiijgv0M66r8ZfdT7S1NQ-1; Tue, 24 May 2022 06:34:58 -0400
X-MC-Unique: nZiijgv0M66r8ZfdT7S1NQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D25713831C43;
 Tue, 24 May 2022 10:34:57 +0000 (UTC)
Received: from localhost (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DC22112131B;
 Tue, 24 May 2022 10:34:57 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v4 03/15] tests: make libqmp buildable for win32
Date: Tue, 24 May 2022 12:34:41 +0200
Message-Id: <20220524103453.162665-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220524103453.162665-1-marcandre.lureau@redhat.com>
References: <20220524103453.162665-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqmp.c | 34 +++++++++++++++++++++++++++++-----
 tests/qtest/libqmp.h |  2 ++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
index 0358b8313d..ade26c15f0 100644
--- a/tests/qtest/libqmp.c
+++ b/tests/qtest/libqmp.c
@@ -18,6 +18,11 @@
 
 #include "libqmp.h"
 
+#ifndef _WIN32
+#include <sys/socket.h>
+#endif
+
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qapi/qmp/json-parser.h"
 #include "qapi/qmp/qjson.h"
@@ -87,6 +92,7 @@ QDict *qmp_fd_receive(int fd)
     return qmp.response;
 }
 
+#ifndef _WIN32
 /* Sends a message and file descriptors to the socket.
  * It's needed for qmp-commands like getfd/add-fd */
 static void socket_send_fds(int socket_fd, int *fds, size_t fds_num,
@@ -120,17 +126,23 @@ static void socket_send_fds(int socket_fd, int *fds, size_t fds_num,
     } while (ret < 0 && errno == EINTR);
     g_assert_cmpint(ret, >, 0);
 }
+#endif
 
 /**
  * Allow users to send a message without waiting for the reply,
  * in the case that they choose to discard all replies up until
  * a particular EVENT is received.
  */
-void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
-                      const char *fmt, va_list ap)
+static void
+_qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
+                  const char *fmt, va_list ap)
 {
     QObject *qobj;
 
+#ifdef _WIN32
+    assert(fds_num == 0);
+#endif
+
     /* Going through qobject ensures we escape strings properly */
     qobj = qobject_from_vjsonf_nofail(fmt, ap);
 
@@ -148,10 +160,14 @@ void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
         if (log) {
             fprintf(stderr, "%s", str->str);
         }
+
+#ifndef _WIN32
         /* Send QMP request */
         if (fds && fds_num > 0) {
             socket_send_fds(fd, fds, fds_num, str->str, str->len);
-        } else {
+        } else
+#endif
+        {
             socket_send(fd, str->str, str->len);
         }
 
@@ -160,15 +176,23 @@ void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
     }
 }
 
+#ifndef _WIN32
+void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
+                      const char *fmt, va_list ap)
+{
+    _qmp_fd_vsend_fds(fd, fds, fds_num, fmt, ap);
+}
+#endif
+
 void qmp_fd_vsend(int fd, const char *fmt, va_list ap)
 {
-    qmp_fd_vsend_fds(fd, NULL, 0, fmt, ap);
+    _qmp_fd_vsend_fds(fd, NULL, 0, fmt, ap);
 }
 
 
 QDict *qmp_fdv(int fd, const char *fmt, va_list ap)
 {
-    qmp_fd_vsend_fds(fd, NULL, 0, fmt, ap);
+    _qmp_fd_vsend_fds(fd, NULL, 0, fmt, ap);
 
     return qmp_fd_receive(fd);
 }
diff --git a/tests/qtest/libqmp.h b/tests/qtest/libqmp.h
index 5cb7eeaa18..3445b753ff 100644
--- a/tests/qtest/libqmp.h
+++ b/tests/qtest/libqmp.h
@@ -21,8 +21,10 @@
 #include "qapi/qmp/qdict.h"
 
 QDict *qmp_fd_receive(int fd);
+#ifndef _WIN32
 void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
                       const char *fmt, va_list ap) G_GNUC_PRINTF(4, 0);
+#endif
 void qmp_fd_vsend(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
 void qmp_fd_send(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 void qmp_fd_send_raw(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
-- 
2.36.1


