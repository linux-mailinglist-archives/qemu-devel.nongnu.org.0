Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094B955168C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 13:05:47 +0200 (CEST)
Received: from localhost ([::1]:46112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3FE2-00062w-3W
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 07:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FAk-0002rx-2l
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FAd-0007Tm-B8
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655722934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6bk8cgSN625Hi1SVni50mjB219W/HKMHm3ELp5qgag=;
 b=FM0gfZMh4RYc2GkX0TLvBbFM2UQRkBnDY7TxBwsi0ZBufYL7aYkww5ItUb8QYFZZt+dOo1
 4G+7ue5kfL85ekSo6/NbdDOIG2lkYMQDOKkK/1VDQZf9gfKsGw5ghTxO4kIMKte7Sneblw
 caZydpUeC6rRZ4wpvELcdM3gWECNOQ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-YtY6rt60O7C3xpvX7nHK6g-1; Mon, 20 Jun 2022 07:02:11 -0400
X-MC-Unique: YtY6rt60O7C3xpvX7nHK6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 231B6101AA48;
 Mon, 20 Jun 2022 11:02:11 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92312C08087;
 Mon, 20 Jun 2022 11:02:09 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: [PATCH v2 01/21] io: add a QIOChannelNull equivalent to /dev/null
Date: Mon, 20 Jun 2022 12:01:45 +0100
Message-Id: <20220620110205.1357829-2-berrange@redhat.com>
In-Reply-To: <20220620110205.1357829-1-berrange@redhat.com>
References: <20220620110205.1357829-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

This is for code which needs a portable equivalent to a QIOChannelFile
connected to /dev/null.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/io/channel-null.h         |  55 +++++++
 io/channel-null.c                 | 237 ++++++++++++++++++++++++++++++
 io/meson.build                    |   1 +
 io/trace-events                   |   3 +
 tests/unit/meson.build            |   1 +
 tests/unit/test-io-channel-null.c |  95 ++++++++++++
 6 files changed, 392 insertions(+)
 create mode 100644 include/io/channel-null.h
 create mode 100644 io/channel-null.c
 create mode 100644 tests/unit/test-io-channel-null.c

diff --git a/include/io/channel-null.h b/include/io/channel-null.h
new file mode 100644
index 0000000000..f6d54e63cf
--- /dev/null
+++ b/include/io/channel-null.h
@@ -0,0 +1,55 @@
+/*
+ * QEMU I/O channels null driver
+ *
+ * Copyright (c) 2022 Red Hat, Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#ifndef QIO_CHANNEL_FILE_H
+#define QIO_CHANNEL_FILE_H
+
+#include "io/channel.h"
+#include "qom/object.h"
+
+#define TYPE_QIO_CHANNEL_NULL "qio-channel-null"
+OBJECT_DECLARE_SIMPLE_TYPE(QIOChannelNull, QIO_CHANNEL_NULL)
+
+
+/**
+ * QIOChannelNull:
+ *
+ * The QIOChannelNull object provides a channel implementation
+ * that discards all writes and returns EOF for all reads.
+ */
+
+struct QIOChannelNull {
+    QIOChannel parent;
+    bool closed;
+};
+
+
+/**
+ * qio_channel_null_new:
+ *
+ * Create a new IO channel object that discards all writes
+ * and returns EOF for all reads.
+ *
+ * Returns: the new channel object
+ */
+QIOChannelNull *
+qio_channel_null_new(void);
+
+#endif /* QIO_CHANNEL_NULL_H */
diff --git a/io/channel-null.c b/io/channel-null.c
new file mode 100644
index 0000000000..75e3781507
--- /dev/null
+++ b/io/channel-null.c
@@ -0,0 +1,237 @@
+/*
+ * QEMU I/O channels null driver
+ *
+ * Copyright (c) 2022 Red Hat, Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "io/channel-null.h"
+#include "io/channel-watch.h"
+#include "qapi/error.h"
+#include "trace.h"
+#include "qemu/iov.h"
+
+typedef struct QIOChannelNullSource QIOChannelNullSource;
+struct QIOChannelNullSource {
+    GSource parent;
+    QIOChannel *ioc;
+    GIOCondition condition;
+};
+
+
+QIOChannelNull *
+qio_channel_null_new(void)
+{
+    QIOChannelNull *ioc;
+
+    ioc = QIO_CHANNEL_NULL(object_new(TYPE_QIO_CHANNEL_NULL));
+
+    trace_qio_channel_null_new(ioc);
+
+    return ioc;
+}
+
+
+static void
+qio_channel_null_init(Object *obj)
+{
+    QIOChannelNull *ioc = QIO_CHANNEL_NULL(obj);
+    ioc->closed = false;
+}
+
+
+static ssize_t
+qio_channel_null_readv(QIOChannel *ioc,
+                       const struct iovec *iov,
+                       size_t niov,
+                       int **fds G_GNUC_UNUSED,
+                       size_t *nfds G_GNUC_UNUSED,
+                       Error **errp)
+{
+    QIOChannelNull *nioc = QIO_CHANNEL_NULL(ioc);
+
+    if (nioc->closed) {
+        error_setg_errno(errp, EINVAL,
+                         "Channel is closed");
+        return -1;
+    }
+
+    return 0;
+}
+
+
+static ssize_t
+qio_channel_null_writev(QIOChannel *ioc,
+                        const struct iovec *iov,
+                        size_t niov,
+                        int *fds G_GNUC_UNUSED,
+                        size_t nfds G_GNUC_UNUSED,
+                        int flags G_GNUC_UNUSED,
+                        Error **errp)
+{
+    QIOChannelNull *nioc = QIO_CHANNEL_NULL(ioc);
+
+    if (nioc->closed) {
+        error_setg_errno(errp, EINVAL,
+                         "Channel is closed");
+        return -1;
+    }
+
+    return iov_size(iov, niov);
+}
+
+
+static int
+qio_channel_null_set_blocking(QIOChannel *ioc G_GNUC_UNUSED,
+                              bool enabled G_GNUC_UNUSED,
+                              Error **errp G_GNUC_UNUSED)
+{
+    return 0;
+}
+
+
+static off_t
+qio_channel_null_seek(QIOChannel *ioc G_GNUC_UNUSED,
+                      off_t offset G_GNUC_UNUSED,
+                      int whence G_GNUC_UNUSED,
+                      Error **errp G_GNUC_UNUSED)
+{
+    return 0;
+}
+
+
+static int
+qio_channel_null_close(QIOChannel *ioc,
+                       Error **errp G_GNUC_UNUSED)
+{
+    QIOChannelNull *nioc = QIO_CHANNEL_NULL(ioc);
+
+    nioc->closed = true;
+    return 0;
+}
+
+
+static void
+qio_channel_null_set_aio_fd_handler(QIOChannel *ioc G_GNUC_UNUSED,
+                                    AioContext *ctx G_GNUC_UNUSED,
+                                    IOHandler *io_read G_GNUC_UNUSED,
+                                    IOHandler *io_write G_GNUC_UNUSED,
+                                    void *opaque G_GNUC_UNUSED)
+{
+}
+
+
+static gboolean
+qio_channel_null_source_prepare(GSource *source G_GNUC_UNUSED,
+                                gint *timeout)
+{
+    *timeout = -1;
+
+    return TRUE;
+}
+
+
+static gboolean
+qio_channel_null_source_check(GSource *source G_GNUC_UNUSED)
+{
+    return TRUE;
+}
+
+
+static gboolean
+qio_channel_null_source_dispatch(GSource *source,
+                                 GSourceFunc callback,
+                                 gpointer user_data)
+{
+    QIOChannelFunc func = (QIOChannelFunc)callback;
+    QIOChannelNullSource *ssource = (QIOChannelNullSource *)source;
+
+    return (*func)(ssource->ioc,
+                   ssource->condition,
+                   user_data);
+}
+
+
+static void
+qio_channel_null_source_finalize(GSource *source)
+{
+    QIOChannelNullSource *ssource = (QIOChannelNullSource *)source;
+
+    object_unref(OBJECT(ssource->ioc));
+}
+
+
+GSourceFuncs qio_channel_null_source_funcs = {
+    qio_channel_null_source_prepare,
+    qio_channel_null_source_check,
+    qio_channel_null_source_dispatch,
+    qio_channel_null_source_finalize
+};
+
+
+static GSource *
+qio_channel_null_create_watch(QIOChannel *ioc,
+                              GIOCondition condition)
+{
+    GSource *source;
+    QIOChannelNullSource *ssource;
+
+    source = g_source_new(&qio_channel_null_source_funcs,
+                          sizeof(QIOChannelNullSource));
+    ssource = (QIOChannelNullSource *)source;
+
+    ssource->ioc = ioc;
+    object_ref(OBJECT(ioc));
+
+    ssource->condition = condition;
+
+    return source;
+}
+
+
+static void
+qio_channel_null_class_init(ObjectClass *klass,
+                            void *class_data G_GNUC_UNUSED)
+{
+    QIOChannelClass *ioc_klass = QIO_CHANNEL_CLASS(klass);
+
+    ioc_klass->io_writev = qio_channel_null_writev;
+    ioc_klass->io_readv = qio_channel_null_readv;
+    ioc_klass->io_set_blocking = qio_channel_null_set_blocking;
+    ioc_klass->io_seek = qio_channel_null_seek;
+    ioc_klass->io_close = qio_channel_null_close;
+    ioc_klass->io_create_watch = qio_channel_null_create_watch;
+    ioc_klass->io_set_aio_fd_handler = qio_channel_null_set_aio_fd_handler;
+}
+
+
+static const TypeInfo qio_channel_null_info = {
+    .parent = TYPE_QIO_CHANNEL,
+    .name = TYPE_QIO_CHANNEL_NULL,
+    .instance_size = sizeof(QIOChannelNull),
+    .instance_init = qio_channel_null_init,
+    .class_init = qio_channel_null_class_init,
+};
+
+
+static void
+qio_channel_null_register_types(void)
+{
+    type_register_static(&qio_channel_null_info);
+}
+
+type_init(qio_channel_null_register_types);
diff --git a/io/meson.build b/io/meson.build
index bbcd3c53a4..283b9b2bdb 100644
--- a/io/meson.build
+++ b/io/meson.build
@@ -3,6 +3,7 @@ io_ss.add(files(
   'channel-buffer.c',
   'channel-command.c',
   'channel-file.c',
+  'channel-null.c',
   'channel-socket.c',
   'channel-tls.c',
   'channel-util.c',
diff --git a/io/trace-events b/io/trace-events
index c5e814eb44..3cc5cf1efd 100644
--- a/io/trace-events
+++ b/io/trace-events
@@ -10,6 +10,9 @@ qio_task_thread_result(void *task) "Task thread result task=%p"
 qio_task_thread_source_attach(void *task, void *source) "Task thread source attach task=%p source=%p"
 qio_task_thread_source_cancel(void *task, void *source) "Task thread source cancel task=%p source=%p"
 
+# channel-null.c
+qio_channel_null_new(void *ioc) "Null new ioc=%p"
+
 # channel-socket.c
 qio_channel_socket_new(void *ioc) "Socket new ioc=%p"
 qio_channel_socket_new_fd(void *ioc, int fd) "Socket new ioc=%p fd=%d"
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 287b367ec3..b497a41378 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -88,6 +88,7 @@ if have_block
     'test-io-channel-file': ['io-channel-helpers.c', io],
     'test-io-channel-command': ['io-channel-helpers.c', io],
     'test-io-channel-buffer': ['io-channel-helpers.c', io],
+    'test-io-channel-null': [io],
     'test-crypto-ivgen': [io],
     'test-crypto-afsplit': [io],
     'test-crypto-block': [io],
diff --git a/tests/unit/test-io-channel-null.c b/tests/unit/test-io-channel-null.c
new file mode 100644
index 0000000000..b3aab17ccc
--- /dev/null
+++ b/tests/unit/test-io-channel-null.c
@@ -0,0 +1,95 @@
+/*
+ * QEMU I/O channel null test
+ *
+ * Copyright (c) 2022 Red Hat, Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "io/channel-null.h"
+#include "qapi/error.h"
+
+static gboolean test_io_channel_watch(QIOChannel *ioc,
+                                      GIOCondition condition,
+                                      gpointer opaque)
+{
+    GIOCondition *gotcond = opaque;
+    *gotcond = condition;
+    return G_SOURCE_REMOVE;
+}
+
+static void test_io_channel_null_io(void)
+{
+    g_autoptr(QIOChannelNull) null = qio_channel_null_new();
+    char buf[1024];
+    GIOCondition gotcond = 0;
+    Error *local_err = NULL;
+
+    g_assert(qio_channel_write(QIO_CHANNEL(null),
+                               "Hello World", 11,
+                               &error_abort) == 11);
+
+    g_assert(qio_channel_read(QIO_CHANNEL(null),
+                              buf, sizeof(buf),
+                              &error_abort) == 0);
+
+    qio_channel_add_watch(QIO_CHANNEL(null),
+                          G_IO_IN,
+                          test_io_channel_watch,
+                          &gotcond,
+                          NULL);
+
+    g_main_context_iteration(NULL, false);
+
+    g_assert(gotcond == G_IO_IN);
+
+    qio_channel_add_watch(QIO_CHANNEL(null),
+                          G_IO_IN | G_IO_OUT,
+                          test_io_channel_watch,
+                          &gotcond,
+                          NULL);
+
+    g_main_context_iteration(NULL, false);
+
+    g_assert(gotcond == (G_IO_IN | G_IO_OUT));
+
+    qio_channel_close(QIO_CHANNEL(null), &error_abort);
+
+    g_assert(qio_channel_write(QIO_CHANNEL(null),
+                               "Hello World", 11,
+                               &local_err) == -1);
+    g_assert_nonnull(local_err);
+
+    g_clear_pointer(&local_err, error_free);
+
+    g_assert(qio_channel_read(QIO_CHANNEL(null),
+                              buf, sizeof(buf),
+                              &local_err) == -1);
+    g_assert_nonnull(local_err);
+
+    g_clear_pointer(&local_err, error_free);
+}
+
+int main(int argc, char **argv)
+{
+    module_call_init(MODULE_INIT_QOM);
+
+    g_test_init(&argc, &argv, NULL);
+
+    g_test_add_func("/io/channel/null/io", test_io_channel_null_io);
+
+    return g_test_run();
+}
-- 
2.36.1


