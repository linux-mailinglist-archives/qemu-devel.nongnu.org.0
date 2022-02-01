Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D704A578E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 08:15:29 +0100 (CET)
Received: from localhost ([::1]:44062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEnNw-0004dd-Da
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 02:15:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEmg0-0003D4-2Z
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:30:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEmfs-0006ZE-0V
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643696994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbttibxrhEYFMdwUzOJM8hTkFPF7dWKiGF+1KRZ3R/w=;
 b=Kn3Wsp8s+8d44RaOREWeLUCwcckVH45u6k4EiypaJmjohDnFmvFHI9R1U11A4mv77OKpap
 NimTBjicYbG5H/Kh+RR5aeNj5wsZ12XzbIOnOCPhxs+vKJavMTlbibbHKkrb7Vh3p9lBhI
 s88m0Nph2iHUAeks1myu8Zpg9g3KQaQ=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-0WALIf_wNL6gH1TcOvUcRQ-1; Tue, 01 Feb 2022 01:29:53 -0500
X-MC-Unique: 0WALIf_wNL6gH1TcOvUcRQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 ay31-20020a056808301f00b002d06e828c00so1430487oib.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 22:29:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HbttibxrhEYFMdwUzOJM8hTkFPF7dWKiGF+1KRZ3R/w=;
 b=Pjo1spe/unSmgtizhEjMacW0jFDT8X32Zd3jk35EmIS07G/S99CwIpPi+/+mXndUen
 TG+cU9syekMBxnHBaK7HprW215GWlzBf1XPljVoKi32lTwCtnv9kD3PLpKzAb77CEhZz
 zPgl45jajVT4guuVg8hjWB1G9GyKDsOVngRRygYB19WOaZ/indswe0XNzfRLc/mi7F2R
 Z0OA/xl9JJymfemnWIaH+1CFrVJKP34smgwvxB9yBqnKHNKHDjHxh7XltJ8ba8GfwEW1
 WdaNy/D+2e7UkAcLf412INc7Q5YrTx0LnWJYVJqtnfORMhQFkWle65qqxG3NvRkljSet
 lTRg==
X-Gm-Message-State: AOAM5326/9HfHKq51BqUfYdXdwJMfKZkoFuyleEcUJHoXNmSsUz95nLA
 2pvy1ROo8roqVkgxFX6uF1XTeSa6tllkf1IvtyOBxU3lvnGviLYb+5epTo0+KMLB3kwEjsRXMqQ
 CRuR173b6AMeCEwE=
X-Received: by 2002:a9d:5185:: with SMTP id y5mr13409541otg.243.1643696992327; 
 Mon, 31 Jan 2022 22:29:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPmaapYHOCZLgLH/0QTiVP1OeK7jzyjbbTvHux9wpFgs77/mumqy6HLYuzKzsYAjVx0aI96Q==
X-Received: by 2002:a9d:5185:: with SMTP id y5mr13409528otg.243.1643696992044; 
 Mon, 31 Jan 2022 22:29:52 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f1:95e9:6da1:67bd:fdc3:e12e])
 by smtp.gmail.com with ESMTPSA id l14sm14424720ooq.12.2022.01.31.22.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 22:29:51 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v8 1/5] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
Date: Tue,  1 Feb 2022 03:28:59 -0300
Message-Id: <20220201062901.428838-2-leobras@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201062901.428838-1-leobras@redhat.com>
References: <20220201062901.428838-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add flags to io_writev and introduce io_flush as optional callback to
QIOChannelClass, allowing the implementation of zero copy writes by
subclasses.

How to use them:
- Write data using qio_channel_writev*(...,QIO_CHANNEL_WRITE_FLAG_ZERO_COPY),
- Wait write completion with qio_channel_flush().

Notes:
As some zero copy write implementations work asynchronously, it's
recommended to keep the write buffer untouched until the return of
qio_channel_flush(), to avoid the risk of sending an updated buffer
instead of the buffer state during write.

As io_flush callback is optional, if a subclass does not implement it, then:
- io_flush will return 0 without changing anything.

Also, some functions like qio_channel_writev_full_all() were adapted to
receive a flag parameter. That allows shared code between zero copy and
non-zero copy writev, and also an easier implementation on new flags.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/io/channel.h                | 38 ++++++++++++++++++++-
 chardev/char-io.c                   |  2 +-
 hw/remote/mpqemu-link.c             |  2 +-
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-socket.c                 |  2 ++
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 53 +++++++++++++++++++++++------
 migration/rdma.c                    |  1 +
 scsi/pr-manager-helper.c            |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 13 files changed, 92 insertions(+), 14 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 88988979f8..c680ee7480 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -32,12 +32,15 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
 
 #define QIO_CHANNEL_ERR_BLOCK -2
 
+#define QIO_CHANNEL_WRITE_FLAG_ZERO_COPY 0x1
+
 typedef enum QIOChannelFeature QIOChannelFeature;
 
 enum QIOChannelFeature {
     QIO_CHANNEL_FEATURE_FD_PASS,
     QIO_CHANNEL_FEATURE_SHUTDOWN,
     QIO_CHANNEL_FEATURE_LISTEN,
+    QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
 };
 
 
@@ -104,6 +107,7 @@ struct QIOChannelClass {
                          size_t niov,
                          int *fds,
                          size_t nfds,
+                         int flags,
                          Error **errp);
     ssize_t (*io_readv)(QIOChannel *ioc,
                         const struct iovec *iov,
@@ -136,6 +140,8 @@ struct QIOChannelClass {
                                   IOHandler *io_read,
                                   IOHandler *io_write,
                                   void *opaque);
+    int (*io_flush)(QIOChannel *ioc,
+                    Error **errp);
 };
 
 /* General I/O handling functions */
@@ -228,6 +234,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
  * @niov: the length of the @iov array
  * @fds: an array of file handles to send
  * @nfds: number of file handles in @fds
+ * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  * Write data to the IO channel, reading it from the
@@ -260,6 +267,7 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
                                 size_t niov,
                                 int *fds,
                                 size_t nfds,
+                                int flags,
                                 Error **errp);
 
 /**
@@ -837,6 +845,7 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
  * @niov: the length of the @iov array
  * @fds: an array of file handles to send
  * @nfds: number of file handles in @fds
+ * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  *
@@ -846,6 +855,14 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
  * to be written, yielding from the current coroutine
  * if required.
  *
+ * If QIO_CHANNEL_WRITE_FLAG_ZERO_COPY is passed in flags,
+ * instead of waiting for all requested data to be written,
+ * this function will wait until it's all queued for writing.
+ * In this case, if the buffer gets changed between queueing and
+ * sending, the updated buffer will be sent. If this is not a
+ * desired behavior, it's suggested to call qio_channel_flush()
+ * before reusing the buffer.
+ *
  * Returns: 0 if all bytes were written, or -1 on error
  */
 
@@ -853,6 +870,25 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
                                 const struct iovec *iov,
                                 size_t niov,
                                 int *fds, size_t nfds,
-                                Error **errp);
+                                int flags, Error **errp);
+
+/**
+ * qio_channel_flush:
+ * @ioc: the channel object
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Will block until every packet queued with
+ * qio_channel_writev_full() + QIO_CHANNEL_WRITE_FLAG_ZERO_COPY
+ * is sent, or return in case of any error.
+ *
+ * If not implemented, acts as a no-op, and returns 0.
+ *
+ * Returns -1 if any error is found,
+ *          1 if every send failed to use zero copy.
+ *          0 otherwise.
+ */
+
+int qio_channel_flush(QIOChannel *ioc,
+                      Error **errp);
 
 #endif /* QIO_CHANNEL_H */
diff --git a/chardev/char-io.c b/chardev/char-io.c
index 8ced184160..4451128cba 100644
--- a/chardev/char-io.c
+++ b/chardev/char-io.c
@@ -122,7 +122,7 @@ int io_channel_send_full(QIOChannel *ioc,
 
         ret = qio_channel_writev_full(
             ioc, &iov, 1,
-            fds, nfds, NULL);
+            fds, nfds, 0, NULL);
         if (ret == QIO_CHANNEL_ERR_BLOCK) {
             if (offset) {
                 return offset;
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 7e841820e5..e8f556bd27 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -69,7 +69,7 @@ bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
     }
 
     if (!qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send),
-                                    fds, nfds, errp)) {
+                                    fds, nfds, 0, errp)) {
         ret = true;
     } else {
         trace_mpqemu_send_io_error(msg->cmd, msg->size, nfds);
diff --git a/io/channel-buffer.c b/io/channel-buffer.c
index baa4e2b089..bf52011be2 100644
--- a/io/channel-buffer.c
+++ b/io/channel-buffer.c
@@ -81,6 +81,7 @@ static ssize_t qio_channel_buffer_writev(QIOChannel *ioc,
                                          size_t niov,
                                          int *fds,
                                          size_t nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelBuffer *bioc = QIO_CHANNEL_BUFFER(ioc);
diff --git a/io/channel-command.c b/io/channel-command.c
index 338da73ade..54560464ae 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -258,6 +258,7 @@ static ssize_t qio_channel_command_writev(QIOChannel *ioc,
                                           size_t niov,
                                           int *fds,
                                           size_t nfds,
+                                          int flags,
                                           Error **errp)
 {
     QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
diff --git a/io/channel-file.c b/io/channel-file.c
index d7cf6d278f..ef6807a6be 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -114,6 +114,7 @@ static ssize_t qio_channel_file_writev(QIOChannel *ioc,
                                        size_t niov,
                                        int *fds,
                                        size_t nfds,
+                                       int flags,
                                        Error **errp)
 {
     QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 459922c874..b2d254ef8d 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -525,6 +525,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
                                          size_t niov,
                                          int *fds,
                                          size_t nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
@@ -620,6 +621,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
                                          size_t niov,
                                          int *fds,
                                          size_t nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
diff --git a/io/channel-tls.c b/io/channel-tls.c
index 2ae1b92fc0..4ce890a538 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -301,6 +301,7 @@ static ssize_t qio_channel_tls_writev(QIOChannel *ioc,
                                       size_t niov,
                                       int *fds,
                                       size_t nfds,
+                                      int flags,
                                       Error **errp)
 {
     QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
diff --git a/io/channel-websock.c b/io/channel-websock.c
index 70889bb54d..035dd6075b 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -1127,6 +1127,7 @@ static ssize_t qio_channel_websock_writev(QIOChannel *ioc,
                                           size_t niov,
                                           int *fds,
                                           size_t nfds,
+                                          int flags,
                                           Error **errp)
 {
     QIOChannelWebsock *wioc = QIO_CHANNEL_WEBSOCK(ioc);
diff --git a/io/channel.c b/io/channel.c
index e8b019dc36..b8b99fdc4c 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -72,18 +72,32 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
                                 size_t niov,
                                 int *fds,
                                 size_t nfds,
+                                int flags,
                                 Error **errp)
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
 
-    if ((fds || nfds) &&
-        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
+    if (fds || nfds) {
+        if (!qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
+            error_setg_errno(errp, EINVAL,
+                             "Channel does not support file descriptor passing");
+            return -1;
+        }
+        if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
+            error_setg_errno(errp, EINVAL,
+                             "Zero Copy does not support file descriptor passing");
+            return -1;
+        }
+    }
+
+    if ((flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) &&
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
         error_setg_errno(errp, EINVAL,
-                         "Channel does not support file descriptor passing");
+                         "Requested Zero Copy feature is not available");
         return -1;
     }
 
-    return klass->io_writev(ioc, iov, niov, fds, nfds, errp);
+    return klass->io_writev(ioc, iov, niov, fds, nfds, flags, errp);
 }
 
 
@@ -217,14 +231,14 @@ int qio_channel_writev_all(QIOChannel *ioc,
                            size_t niov,
                            Error **errp)
 {
-    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, errp);
+    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, 0, errp);
 }
 
 int qio_channel_writev_full_all(QIOChannel *ioc,
                                 const struct iovec *iov,
                                 size_t niov,
                                 int *fds, size_t nfds,
-                                Error **errp)
+                                int flags, Error **errp)
 {
     int ret = -1;
     struct iovec *local_iov = g_new(struct iovec, niov);
@@ -235,10 +249,16 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
                           iov, niov,
                           0, iov_size(iov, niov));
 
+    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
+        assert(fds == NULL && nfds == 0);
+    }
+
     while (nlocal_iov > 0) {
         ssize_t len;
-        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
-                                      errp);
+
+        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds,
+                                            nfds, flags, errp);
+
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_OUT);
@@ -277,7 +297,7 @@ ssize_t qio_channel_writev(QIOChannel *ioc,
                            size_t niov,
                            Error **errp)
 {
-    return qio_channel_writev_full(ioc, iov, niov, NULL, 0, errp);
+    return qio_channel_writev_full(ioc, iov, niov, NULL, 0, 0, errp);
 }
 
 
@@ -297,7 +317,7 @@ ssize_t qio_channel_write(QIOChannel *ioc,
                           Error **errp)
 {
     struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
-    return qio_channel_writev_full(ioc, &iov, 1, NULL, 0, errp);
+    return qio_channel_writev_full(ioc, &iov, 1, NULL, 0, 0, errp);
 }
 
 
@@ -473,6 +493,19 @@ off_t qio_channel_io_seek(QIOChannel *ioc,
     return klass->io_seek(ioc, offset, whence, errp);
 }
 
+int qio_channel_flush(QIOChannel *ioc,
+                                Error **errp)
+{
+    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (!klass->io_flush ||
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
+        return 0;
+    }
+
+    return klass->io_flush(ioc, errp);
+}
+
 
 static void qio_channel_restart_read(void *opaque)
 {
diff --git a/migration/rdma.c b/migration/rdma.c
index c7c7a38487..ed2a2a013b 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2833,6 +2833,7 @@ static ssize_t qio_channel_rdma_writev(QIOChannel *ioc,
                                        size_t niov,
                                        int *fds,
                                        size_t nfds,
+                                       int flags,
                                        Error **errp)
 {
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
diff --git a/scsi/pr-manager-helper.c b/scsi/pr-manager-helper.c
index 451c7631b7..3be52a98d5 100644
--- a/scsi/pr-manager-helper.c
+++ b/scsi/pr-manager-helper.c
@@ -77,7 +77,7 @@ static int pr_manager_helper_write(PRManagerHelper *pr_mgr,
         iov.iov_base = (void *)buf;
         iov.iov_len = sz;
         n_written = qio_channel_writev_full(QIO_CHANNEL(pr_mgr->ioc), &iov, 1,
-                                            nfds ? &fd : NULL, nfds, errp);
+                                            nfds ? &fd : NULL, nfds, 0, errp);
 
         if (n_written <= 0) {
             assert(n_written != QIO_CHANNEL_ERR_BLOCK);
diff --git a/tests/unit/test-io-channel-socket.c b/tests/unit/test-io-channel-socket.c
index c49eec1f03..6713886d02 100644
--- a/tests/unit/test-io-channel-socket.c
+++ b/tests/unit/test-io-channel-socket.c
@@ -444,6 +444,7 @@ static void test_io_channel_unix_fd_pass(void)
                             G_N_ELEMENTS(iosend),
                             fdsend,
                             G_N_ELEMENTS(fdsend),
+                            0,
                             &error_abort);
 
     qio_channel_readv_full(dst,
-- 
2.34.1


