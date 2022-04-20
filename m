Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2F0508B2B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:51:21 +0200 (CEST)
Received: from localhost ([::1]:38160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBfs-0008HG-Nc
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAPp-0002YZ-Vd
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:30:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAPj-0005KH-Lq
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1EHVZwNj+T/uYd4wfvF2jvwCxcfZDwPcGcRzFLnstI=;
 b=Ql0nQsxraknrQR9npogo4Y1w312fz0OqIW5UfxXmoSacZ4n8d4/o4A89AepIhL1hP03giP
 tBkWSB44uNOzLNmdFMUgEKOEcmJudiGe7lRUYMhUw3aD0SmW8zYfiYbnZEOOprUcGASHCQ
 u9AoPq475VbY+Zh8/5J0oLCUOAfsGZ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-ec3nsOYKPtiT7coNhuMvAw-1; Wed, 20 Apr 2022 09:30:30 -0400
X-MC-Unique: ec3nsOYKPtiT7coNhuMvAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7481129AB3F4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:30:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFF78403D198;
 Wed, 20 Apr 2022 13:30:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 34/41] libqtest: split QMP part in libqmp
Date: Wed, 20 Apr 2022 17:26:17 +0400
Message-Id: <20220420132624.2439741-35-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This will help moving QAPI/QMP in a common subproject.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/qtest/libqos/libqmp.h    |  50 +++++++
 tests/qtest/libqos/libqtest.h  |  29 +----
 tests/qtest/libqos/libqmp.c    | 230 +++++++++++++++++++++++++++++++++
 tests/qtest/libqos/libqtest.c  | 202 +----------------------------
 tests/qtest/libqos/meson.build |   5 +-
 tests/unit/meson.build         |   2 +-
 6 files changed, 287 insertions(+), 231 deletions(-)
 create mode 100644 tests/qtest/libqos/libqmp.h
 create mode 100644 tests/qtest/libqos/libqmp.c

diff --git a/tests/qtest/libqos/libqmp.h b/tests/qtest/libqos/libqmp.h
new file mode 100644
index 000000000000..94aa97328a17
--- /dev/null
+++ b/tests/qtest/libqos/libqmp.h
@@ -0,0 +1,50 @@
+/*
+ * libqmp test unit
+ *
+ * Copyright IBM, Corp. 2012
+ * Copyright Red Hat, Inc. 2012
+ * Copyright SUSE LINUX Products GmbH 2013
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *  Paolo Bonzini     <pbonzini@redhat.com>
+ *  Andreas Färber    <afaerber@suse.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+#ifndef LIBQMP_H_
+#define LIBQMP_H_
+
+#include "qapi/qmp/qdict.h"
+
+QDict *qmp_fd_receive(int fd);
+void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
+                      const char *fmt, va_list ap) G_GNUC_PRINTF(4, 0);
+void qmp_fd_vsend(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
+void qmp_fd_send(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
+void qmp_fd_send_raw(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
+void qmp_fd_vsend_raw(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
+QDict *qmp_fdv(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
+QDict *qmp_fd(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
+
+/**
+ * qmp_rsp_is_err:
+ * @rsp: QMP response to check for error
+ *
+ * Test @rsp for error and discard @rsp.
+ * Returns 'true' if there is error in @rsp and 'false' otherwise.
+ */
+bool qmp_rsp_is_err(QDict *rsp);
+
+/**
+ * qmp_expect_error_and_unref:
+ * @rsp: QMP response to check for error
+ * @class: an error class
+ *
+ * Assert the response has the given error class and discard @rsp.
+ */
+void qmp_expect_error_and_unref(QDict *rsp, const char *class);
+
+#endif /* LIBQMP_H_ */
diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index 552667f17e37..4ab0cad3266d 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -19,6 +19,7 @@
 
 #include "qapi/qmp/qobject.h"
 #include "qapi/qmp/qdict.h"
+#include "libqmp.h"
 
 typedef struct QTestState QTestState;
 
@@ -690,16 +691,6 @@ void qtest_remove_abrt_handler(void *data);
 void qtest_qmp_assert_success(QTestState *qts, const char *fmt, ...)
     G_GNUC_PRINTF(2, 3);
 
-QDict *qmp_fd_receive(int fd);
-void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
-                      const char *fmt, va_list ap) G_GNUC_PRINTF(4, 0);
-void qmp_fd_vsend(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
-void qmp_fd_send(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
-void qmp_fd_send_raw(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
-void qmp_fd_vsend_raw(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
-QDict *qmp_fdv(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
-QDict *qmp_fd(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
-
 /**
  * qtest_cb_for_every_machine:
  * @cb: Pointer to the callback function
@@ -771,24 +762,6 @@ void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd);
  */
 void qtest_qmp_device_del(QTestState *qts, const char *id);
 
-/**
- * qmp_rsp_is_err:
- * @rsp: QMP response to check for error
- *
- * Test @rsp for error and discard @rsp.
- * Returns 'true' if there is error in @rsp and 'false' otherwise.
- */
-bool qmp_rsp_is_err(QDict *rsp);
-
-/**
- * qmp_expect_error_and_unref:
- * @rsp: QMP response to check for error
- * @class: an error class
- *
- * Assert the response has the given error class and discard @rsp.
- */
-void qmp_expect_error_and_unref(QDict *rsp, const char *class);
-
 /**
  * qtest_probe_child:
  * @s: QTestState instance to operate on.
diff --git a/tests/qtest/libqos/libqmp.c b/tests/qtest/libqos/libqmp.c
new file mode 100644
index 000000000000..e6b9df2d7b40
--- /dev/null
+++ b/tests/qtest/libqos/libqmp.c
@@ -0,0 +1,230 @@
+/*
+ * QTest
+ *
+ * Copyright IBM, Corp. 2012
+ * Copyright Red Hat, Inc. 2012
+ * Copyright SUSE LINUX Products GmbH 2013
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *  Paolo Bonzini     <pbonzini@redhat.com>
+ *  Andreas Färber    <afaerber@suse.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqmp.h"
+
+#include "qapi/error.h"
+#include "qapi/qmp/json-parser.h"
+#include "qapi/qmp/qjson.h"
+
+#define SOCKET_MAX_FDS 16
+
+typedef struct {
+    JSONMessageParser parser;
+    QDict *response;
+} QMPResponseParser;
+
+static void socket_send(int fd, const char *buf, size_t size)
+{
+    size_t res = qemu_write_full(fd, buf, size);
+
+    assert(res == size);
+}
+
+static void qmp_response(void *opaque, QObject *obj, Error *err)
+{
+    QMPResponseParser *qmp = opaque;
+
+    assert(!obj != !err);
+
+    if (err) {
+        error_prepend(&err, "QMP JSON response parsing failed: ");
+        error_report_err(err);
+        abort();
+    }
+
+    g_assert(!qmp->response);
+    qmp->response = qobject_to(QDict, obj);
+    g_assert(qmp->response);
+}
+
+QDict *qmp_fd_receive(int fd)
+{
+    QMPResponseParser qmp;
+    bool log = getenv("QTEST_LOG") != NULL;
+
+    qmp.response = NULL;
+    json_message_parser_init(&qmp.parser, qmp_response, &qmp, NULL);
+    while (!qmp.response) {
+        ssize_t len;
+        char c;
+
+        len = read(fd, &c, 1);
+        if (len == -1 && errno == EINTR) {
+            continue;
+        }
+
+        if (len == -1 || len == 0) {
+            fprintf(stderr, "Broken pipe\n");
+            abort();
+        }
+
+        if (log) {
+            len = write(2, &c, 1);
+        }
+        json_message_parser_feed(&qmp.parser, &c, 1);
+    }
+    json_message_parser_destroy(&qmp.parser);
+
+    return qmp.response;
+}
+
+/* Sends a message and file descriptors to the socket.
+ * It's needed for qmp-commands like getfd/add-fd */
+static void socket_send_fds(int socket_fd, int *fds, size_t fds_num,
+                            const char *buf, size_t buf_size)
+{
+    ssize_t ret;
+    struct msghdr msg = { 0 };
+    char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)] = { 0 };
+    size_t fdsize = sizeof(int) * fds_num;
+    struct cmsghdr *cmsg;
+    struct iovec iov = { .iov_base = (char *)buf, .iov_len = buf_size };
+
+    msg.msg_iov = &iov;
+    msg.msg_iovlen = 1;
+
+    if (fds && fds_num > 0) {
+        g_assert_cmpuint(fds_num, <, SOCKET_MAX_FDS);
+
+        msg.msg_control = control;
+        msg.msg_controllen = CMSG_SPACE(fdsize);
+
+        cmsg = CMSG_FIRSTHDR(&msg);
+        cmsg->cmsg_len = CMSG_LEN(fdsize);
+        cmsg->cmsg_level = SOL_SOCKET;
+        cmsg->cmsg_type = SCM_RIGHTS;
+        memcpy(CMSG_DATA(cmsg), fds, fdsize);
+    }
+
+    do {
+        ret = sendmsg(socket_fd, &msg, 0);
+    } while (ret < 0 && errno == EINTR);
+    g_assert_cmpint(ret, >, 0);
+}
+
+/**
+ * Allow users to send a message without waiting for the reply,
+ * in the case that they choose to discard all replies up until
+ * a particular EVENT is received.
+ */
+void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
+                      const char *fmt, va_list ap)
+{
+    QObject *qobj;
+
+    /* Going through qobject ensures we escape strings properly */
+    qobj = qobject_from_vjsonf_nofail(fmt, ap);
+
+    /* No need to send anything for an empty QObject.  */
+    if (qobj) {
+        int log = getenv("QTEST_LOG") != NULL;
+        GString *str = qobject_to_json(qobj);
+
+        /*
+         * BUG: QMP doesn't react to input until it sees a newline, an
+         * object, or an array.  Work-around: give it a newline.
+         */
+        g_string_append_c(str, '\n');
+
+        if (log) {
+            fprintf(stderr, "%s", str->str);
+        }
+        /* Send QMP request */
+        if (fds && fds_num > 0) {
+            socket_send_fds(fd, fds, fds_num, str->str, str->len);
+        } else {
+            socket_send(fd, str->str, str->len);
+        }
+
+        g_string_free(str, true);
+        qobject_unref(qobj);
+    }
+}
+
+void qmp_fd_vsend(int fd, const char *fmt, va_list ap)
+{
+    qmp_fd_vsend_fds(fd, NULL, 0, fmt, ap);
+}
+
+
+QDict *qmp_fdv(int fd, const char *fmt, va_list ap)
+{
+    qmp_fd_vsend_fds(fd, NULL, 0, fmt, ap);
+
+    return qmp_fd_receive(fd);
+}
+
+QDict *qmp_fd(int fd, const char *fmt, ...)
+{
+    va_list ap;
+    QDict *response;
+
+    va_start(ap, fmt);
+    response = qmp_fdv(fd, fmt, ap);
+    va_end(ap);
+    return response;
+}
+
+void qmp_fd_send(int fd, const char *fmt, ...)
+{
+    va_list ap;
+
+    va_start(ap, fmt);
+    qmp_fd_vsend(fd, fmt, ap);
+    va_end(ap);
+}
+
+void qmp_fd_vsend_raw(int fd, const char *fmt, va_list ap)
+{
+    bool log = getenv("QTEST_LOG") != NULL;
+    char *str = g_strdup_vprintf(fmt, ap);
+
+    if (log) {
+        fprintf(stderr, "%s", str);
+    }
+    socket_send(fd, str, strlen(str));
+    g_free(str);
+}
+
+void qmp_fd_send_raw(int fd, const char *fmt, ...)
+{
+    va_list ap;
+
+    va_start(ap, fmt);
+    qmp_fd_vsend_raw(fd, fmt, ap);
+    va_end(ap);
+}
+
+bool qmp_rsp_is_err(QDict *rsp)
+{
+    QDict *error = qdict_get_qdict(rsp, "error");
+    qobject_unref(rsp);
+    return !!error;
+}
+
+void qmp_expect_error_and_unref(QDict *rsp, const char *class)
+{
+    QDict *error = qdict_get_qdict(rsp, "error");
+
+    g_assert_cmpstr(qdict_get_try_str(error, "class"), ==, class);
+    g_assert_nonnull(qdict_get_try_str(error, "desc"));
+    g_assert(!qdict_haskey(rsp, "return"));
+
+    qobject_unref(rsp);
+}
diff --git a/tests/qtest/libqos/libqtest.c b/tests/qtest/libqos/libqtest.c
index 9097329ce435..e7beb136bbc5 100644
--- a/tests/qtest/libqos/libqtest.c
+++ b/tests/qtest/libqos/libqtest.c
@@ -21,10 +21,9 @@
 #include <sys/un.h>
 
 #include "libqtest.h"
+#include "libqmp.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
-#include "qapi/error.h"
-#include "qapi/qmp/json-parser.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
 #include "qapi/qmp/qlist.h"
@@ -32,8 +31,6 @@
 
 #define MAX_IRQ 256
 #define SOCKET_TIMEOUT 50
-#define SOCKET_MAX_FDS 16
-
 
 typedef void (*QTestSendFn)(QTestState *s, const char *buf);
 typedef void (*ExternalSendFn)(void *s, const char *buf);
@@ -436,40 +433,6 @@ static void G_GNUC_PRINTF(2, 3) qtest_sendf(QTestState *s, const char *fmt, ...)
     g_free(str);
 }
 
-/* Sends a message and file descriptors to the socket.
- * It's needed for qmp-commands like getfd/add-fd */
-static void socket_send_fds(int socket_fd, int *fds, size_t fds_num,
-                            const char *buf, size_t buf_size)
-{
-    ssize_t ret;
-    struct msghdr msg = { 0 };
-    char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)] = { 0 };
-    size_t fdsize = sizeof(int) * fds_num;
-    struct cmsghdr *cmsg;
-    struct iovec iov = { .iov_base = (char *)buf, .iov_len = buf_size };
-
-    msg.msg_iov = &iov;
-    msg.msg_iovlen = 1;
-
-    if (fds && fds_num > 0) {
-        g_assert_cmpuint(fds_num, <, SOCKET_MAX_FDS);
-
-        msg.msg_control = control;
-        msg.msg_controllen = CMSG_SPACE(fdsize);
-
-        cmsg = CMSG_FIRSTHDR(&msg);
-        cmsg->cmsg_len = CMSG_LEN(fdsize);
-        cmsg->cmsg_level = SOL_SOCKET;
-        cmsg->cmsg_type = SCM_RIGHTS;
-        memcpy(CMSG_DATA(cmsg), fds, fdsize);
-    }
-
-    do {
-        ret = sendmsg(socket_fd, &msg, 0);
-    } while (ret < 0 && errno == EINTR);
-    g_assert_cmpint(ret, >, 0);
-}
-
 static GString *qtest_client_socket_recv_line(QTestState *s)
 {
     GString *line;
@@ -564,59 +527,6 @@ static int qtest_query_target_endianness(QTestState *s)
     return big_endian;
 }
 
-typedef struct {
-    JSONMessageParser parser;
-    QDict *response;
-} QMPResponseParser;
-
-static void qmp_response(void *opaque, QObject *obj, Error *err)
-{
-    QMPResponseParser *qmp = opaque;
-
-    assert(!obj != !err);
-
-    if (err) {
-        error_prepend(&err, "QMP JSON response parsing failed: ");
-        error_report_err(err);
-        abort();
-    }
-
-    g_assert(!qmp->response);
-    qmp->response = qobject_to(QDict, obj);
-    g_assert(qmp->response);
-}
-
-QDict *qmp_fd_receive(int fd)
-{
-    QMPResponseParser qmp;
-    bool log = getenv("QTEST_LOG") != NULL;
-
-    qmp.response = NULL;
-    json_message_parser_init(&qmp.parser, qmp_response, &qmp, NULL);
-    while (!qmp.response) {
-        ssize_t len;
-        char c;
-
-        len = read(fd, &c, 1);
-        if (len == -1 && errno == EINTR) {
-            continue;
-        }
-
-        if (len == -1 || len == 0) {
-            fprintf(stderr, "Broken pipe\n");
-            abort();
-        }
-
-        if (log) {
-            len = write(2, &c, 1);
-        }
-        json_message_parser_feed(&qmp.parser, &c, 1);
-    }
-    json_message_parser_destroy(&qmp.parser);
-
-    return qmp.response;
-}
-
 QDict *qtest_qmp_receive(QTestState *s)
 {
     while (true) {
@@ -657,50 +567,6 @@ int qtest_socket_server(const char *socket_path)
     return sock;
 }
 
-/**
- * Allow users to send a message without waiting for the reply,
- * in the case that they choose to discard all replies up until
- * a particular EVENT is received.
- */
-void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
-                      const char *fmt, va_list ap)
-{
-    QObject *qobj;
-
-    /* Going through qobject ensures we escape strings properly */
-    qobj = qobject_from_vjsonf_nofail(fmt, ap);
-
-    /* No need to send anything for an empty QObject.  */
-    if (qobj) {
-        int log = getenv("QTEST_LOG") != NULL;
-        GString *str = qobject_to_json(qobj);
-
-        /*
-         * BUG: QMP doesn't react to input until it sees a newline, an
-         * object, or an array.  Work-around: give it a newline.
-         */
-        g_string_append_c(str, '\n');
-
-        if (log) {
-            fprintf(stderr, "%s", str->str);
-        }
-        /* Send QMP request */
-        if (fds && fds_num > 0) {
-            socket_send_fds(fd, fds, fds_num, str->str, str->len);
-        } else {
-            socket_send(fd, str->str, str->len);
-        }
-
-        g_string_free(str, true);
-        qobject_unref(qobj);
-    }
-}
-
-void qmp_fd_vsend(int fd, const char *fmt, va_list ap)
-{
-    qmp_fd_vsend_fds(fd, NULL, 0, fmt, ap);
-}
-
 void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,
                          const char *fmt, va_list ap)
 {
@@ -712,13 +578,6 @@ void qtest_qmp_vsend(QTestState *s, const char *fmt, va_list ap)
     qmp_fd_vsend_fds(s->qmp_fd, NULL, 0, fmt, ap);
 }
 
-QDict *qmp_fdv(int fd, const char *fmt, va_list ap)
-{
-    qmp_fd_vsend_fds(fd, NULL, 0, fmt, ap);
-
-    return qmp_fd_receive(fd);
-}
-
 QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
                       const char *fmt, va_list ap)
 {
@@ -736,26 +595,6 @@ QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
     return qtest_qmp_receive(s);
 }
 
-QDict *qmp_fd(int fd, const char *fmt, ...)
-{
-    va_list ap;
-    QDict *response;
-
-    va_start(ap, fmt);
-    response = qmp_fdv(fd, fmt, ap);
-    va_end(ap);
-    return response;
-}
-
-void qmp_fd_send(int fd, const char *fmt, ...)
-{
-    va_list ap;
-
-    va_start(ap, fmt);
-    qmp_fd_vsend(fd, fmt, ap);
-    va_end(ap);
-}
-
 QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
                      const char *fmt, ...)
 {
@@ -788,27 +627,6 @@ void qtest_qmp_send(QTestState *s, const char *fmt, ...)
     va_end(ap);
 }
 
-void qmp_fd_vsend_raw(int fd, const char *fmt, va_list ap)
-{
-    bool log = getenv("QTEST_LOG") != NULL;
-    char *str = g_strdup_vprintf(fmt, ap);
-
-    if (log) {
-        fprintf(stderr, "%s", str);
-    }
-    socket_send(fd, str, strlen(str));
-    g_free(str);
-}
-
-void qmp_fd_send_raw(int fd, const char *fmt, ...)
-{
-    va_list ap;
-
-    va_start(ap, fmt);
-    qmp_fd_vsend_raw(fd, fmt, ap);
-    va_end(ap);
-}
-
 void qtest_qmp_send_raw(QTestState *s, const char *fmt, ...)
 {
     va_list ap;
@@ -1532,24 +1350,6 @@ void qtest_qmp_device_del(QTestState *qts, const char *id)
     qtest_qmp_eventwait(qts, "DEVICE_DELETED");
 }
 
-bool qmp_rsp_is_err(QDict *rsp)
-{
-    QDict *error = qdict_get_qdict(rsp, "error");
-    qobject_unref(rsp);
-    return !!error;
-}
-
-void qmp_expect_error_and_unref(QDict *rsp, const char *class)
-{
-    QDict *error = qdict_get_qdict(rsp, "error");
-
-    g_assert_cmpstr(qdict_get_try_str(error, "class"), ==, class);
-    g_assert_nonnull(qdict_get_try_str(error, "desc"));
-    g_assert(!qdict_haskey(rsp, "return"));
-
-    qobject_unref(rsp);
-}
-
 static void qtest_client_set_tx_handler(QTestState *s,
                     QTestSendFn send)
 {
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 0c172f27533a..93c9e4b69c84 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -1,4 +1,7 @@
-libqos_srcs = files('libqtest.c',
+libqos_srcs = files(
+        'libqtest.c',
+        'libqmp.c',
+
         'qgraph.c',
         'qos_external.c',
         'pci.c',
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 188b0ea80c37..26a26090fe8d 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -154,7 +154,7 @@ if have_system
 endif
 
 if have_ga and targetos == 'linux'
-  tests += {'test-qga': ['../qtest/libqos/libqtest.c']}
+  tests += {'test-qga': ['../qtest/libqos/libqmp.c']}
   test_deps += {'test-qga': qga}
 endif
 
-- 
2.35.1.693.g805e0a68082a


