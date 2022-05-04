Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AD351AAC2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:32:54 +0200 (CEST)
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIrt-00084q-Qc
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIpt-0004gk-OV
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:30:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIps-00032s-90
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651685447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dJot8tk6kKbfP9FuMVBrWASiBGKrHapwjgWaYms2iA=;
 b=FYnO6hmdwrkxHSZFwrR8oKX5F6LplM6ICjo3W6iEOMxPwzsMJMgkOCvsyNMLeq4EdMv1oy
 hj/0JwHMJ0Mx8udE7wU6ewP2AUgqcLD2LSYIG7M1s4iAeCBlAbnpq6wUblqA4uuEBFpCOK
 4gKDxbkUkzK4RekMI17u1IoTAGpxzMc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-SYe1ckYpMBKCHBJiYobzKQ-1; Wed, 04 May 2022 13:30:42 -0400
X-MC-Unique: SYe1ckYpMBKCHBJiYobzKQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C27329ABA06;
 Wed,  4 May 2022 17:30:42 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 245F54643C5;
 Wed,  4 May 2022 17:30:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bandan Das <bsd@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 03/16] tests: make libqmp buildable for win32
Date: Wed,  4 May 2022 21:30:12 +0400
Message-Id: <20220504173025.650167-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220504173025.650167-1-marcandre.lureau@redhat.com>
References: <20220504173025.650167-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
---
 tests/qtest/libqmp.h |  2 ++
 tests/qtest/libqmp.c | 35 +++++++++++++++++++++++++++++------
 2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/libqmp.h b/tests/qtest/libqmp.h
index 94aa97328a17..772f18b73ba3 100644
--- a/tests/qtest/libqmp.h
+++ b/tests/qtest/libqmp.h
@@ -20,8 +20,10 @@
 #include "qapi/qmp/qdict.h"
 
 QDict *qmp_fd_receive(int fd);
+#ifndef G_OS_WIN32
 void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
                       const char *fmt, va_list ap) G_GNUC_PRINTF(4, 0);
+#endif
 void qmp_fd_vsend(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
 void qmp_fd_send(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 void qmp_fd_send_raw(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
index 0358b8313dc4..93c9b31cd4ca 100644
--- a/tests/qtest/libqmp.c
+++ b/tests/qtest/libqmp.c
@@ -15,9 +15,13 @@
  */
 
 #include "qemu/osdep.h"
-
 #include "libqmp.h"
 
+#ifndef G_OS_WIN32
+#include <sys/socket.h>
+#endif
+
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qapi/qmp/json-parser.h"
 #include "qapi/qmp/qjson.h"
@@ -87,6 +91,7 @@ QDict *qmp_fd_receive(int fd)
     return qmp.response;
 }
 
+#ifndef G_OS_WIN32
 /* Sends a message and file descriptors to the socket.
  * It's needed for qmp-commands like getfd/add-fd */
 static void socket_send_fds(int socket_fd, int *fds, size_t fds_num,
@@ -120,17 +125,23 @@ static void socket_send_fds(int socket_fd, int *fds, size_t fds_num,
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
 
+#ifdef G_OS_WIN32
+    assert(fds_num == 0);
+#endif
+
     /* Going through qobject ensures we escape strings properly */
     qobj = qobject_from_vjsonf_nofail(fmt, ap);
 
@@ -148,10 +159,14 @@ void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
         if (log) {
             fprintf(stderr, "%s", str->str);
         }
+
+#ifndef G_OS_WIN32
         /* Send QMP request */
         if (fds && fds_num > 0) {
             socket_send_fds(fd, fds, fds_num, str->str, str->len);
-        } else {
+        } else
+#endif
+        {
             socket_send(fd, str->str, str->len);
         }
 
@@ -160,15 +175,23 @@ void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
     }
 }
 
+#ifndef G_OS_WIN32
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
-- 
2.36.0.44.g0f828332d5ac


