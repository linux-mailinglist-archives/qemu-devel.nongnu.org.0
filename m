Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F333FC5CB
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 13:05:30 +0200 (CEST)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL1a5-0001Fz-UV
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 07:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mL1Xh-0007ZX-8P
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 07:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mL1Xc-00061H-9D
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 07:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630407775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWZ7tSHN3tM3JJExv7MdF5jLAE1QQpN8X6S9jGR7WDY=;
 b=AKATN7eLRaELxc244cWv3dxDIrnHWPEhLA+86vHAt8T5bu/TUN9JqEAG1HI+4aJORcuMpC
 AlJRIQ9TgsQWaZrzwiA4g10QVeOkqb+55Bm0hEKN2dmXH1SHi8HKhiqf8W7+Jl5IeT/7P2
 T9Q+KqxnZTdjRDIqqd9ddD0SFLgbcvU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-3FIuwDsGOyeSNMVaCF_hwA-1; Tue, 31 Aug 2021 07:02:54 -0400
X-MC-Unique: 3FIuwDsGOyeSNMVaCF_hwA-1
Received: by mail-qv1-f70.google.com with SMTP id
 l12-20020a0cc20c000000b0037766e5daaeso2054242qvh.10
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 04:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aWZ7tSHN3tM3JJExv7MdF5jLAE1QQpN8X6S9jGR7WDY=;
 b=nUhMP1tX+QO/a9II56CNT/HeaPGy1YjrVPoeNahKPJ9f3YVlu8c497mJyyywqMlKHz
 uaeuJ+asQfX1G8g1+eT40cNOl7y9DmimBNNiMoSFkJTozzgFofS15kxfikbBvILKjxif
 E0mr2qYf7HAnjq57bPsh8Afi30ybNKvRbI51FiMb0s5OaB9XV3PM6WCeR/kv/3behBIm
 truRkfcKRTFgQ8cb2n6HZsdHwglMx4CzRvjeR/qkKiBZYE4QKpuFLBRx0NoY/I1UW+6W
 Xt1u+g3M4CyBwmMUmye57+11L+KSR6BtlkLc13sAxDoxfI823GYz+IjWq3cXQ7Eqblga
 0HIA==
X-Gm-Message-State: AOAM532py3/uO8HA5HcjuqO1QgYMU7ufPpek+ezvz6C6pLP4dX86er6L
 Bs+dIe9bpVR0Vb2vbeQy9IetWc2WcqVf9zNI4/s+Wf8O7uZ0ksPZKi2z+ymrYm9zz58RZ5QT0Nj
 YTe/owT7t/ooZz6s=
X-Received: by 2002:a37:6103:: with SMTP id v3mr2385065qkb.12.1630407773621;
 Tue, 31 Aug 2021 04:02:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI2Jo4cnB3hwj9643d9uy3epr71MASUxkqg8O3Yf047GLV0yGnOypW8QqH6vGkhF6Z6KR2xA==
X-Received: by 2002:a37:6103:: with SMTP id v3mr2385039qkb.12.1630407773362;
 Tue, 31 Aug 2021 04:02:53 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f1:e948:8e69:9cd6:5512:12f4])
 by smtp.gmail.com with ESMTPSA id b25sm13315536qka.23.2021.08.31.04.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 04:02:53 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v1 1/3] io: Enable write flags for QIOChannel
Date: Tue, 31 Aug 2021 08:02:37 -0300
Message-Id: <20210831110238.299458-2-leobras@redhat.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210831110238.299458-1-leobras@redhat.com>
References: <20210831110238.299458-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some syscalls used for writting, such as sendmsg(), accept flags that
can modify their behavior, even allowing the usage of features such as
MSG_ZEROCOPY.

Change qio_channel_write*() interface to allow passing down flags,
allowing a more flexible use of IOChannel.

At first, it's use is enabled for QIOChannelSocket, but can be easily
extended to any other QIOChannel implementation.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 chardev/char-io.c                   |  2 +-
 hw/remote/mpqemu-link.c             |  2 +-
 include/io/channel.h                | 56 ++++++++++++++++++++---------
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-socket.c                 |  4 ++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 53 ++++++++++++++-------------
 migration/rdma.c                    |  1 +
 scsi/pr-manager-helper.c            |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 13 files changed, 81 insertions(+), 45 deletions(-)

diff --git a/chardev/char-io.c b/chardev/char-io.c
index 8ced184160..4ea7b1ee2a 100644
--- a/chardev/char-io.c
+++ b/chardev/char-io.c
@@ -122,7 +122,7 @@ int io_channel_send_full(QIOChannel *ioc,
 
         ret = qio_channel_writev_full(
             ioc, &iov, 1,
-            fds, nfds, NULL);
+            fds, 0, nfds, NULL);
         if (ret == QIO_CHANNEL_ERR_BLOCK) {
             if (offset) {
                 return offset;
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 7e841820e5..0d13321ef0 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -69,7 +69,7 @@ bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
     }
 
     if (!qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send),
-                                    fds, nfds, errp)) {
+                                     fds, nfds, 0, errp)) {
         ret = true;
     } else {
         trace_mpqemu_send_io_error(msg->cmd, msg->size, nfds);
diff --git a/include/io/channel.h b/include/io/channel.h
index 88988979f8..dada9ebaaf 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -104,6 +104,7 @@ struct QIOChannelClass {
                          size_t niov,
                          int *fds,
                          size_t nfds,
+                         int flags,
                          Error **errp);
     ssize_t (*io_readv)(QIOChannel *ioc,
                         const struct iovec *iov,
@@ -260,6 +261,7 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
                                 size_t niov,
                                 int *fds,
                                 size_t nfds,
+                                int flags,
                                 Error **errp);
 
 /**
@@ -325,6 +327,7 @@ int qio_channel_readv_all(QIOChannel *ioc,
  * @ioc: the channel object
  * @iov: the array of memory regions to write data from
  * @niov: the length of the @iov array
+ * @flags: optional sending flags
  * @errp: pointer to a NULL-initialized error object
  *
  * Write data to the IO channel, reading it from the
@@ -339,10 +342,14 @@ int qio_channel_readv_all(QIOChannel *ioc,
  *
  * Returns: 0 if all bytes were written, or -1 on error
  */
-int qio_channel_writev_all(QIOChannel *ioc,
-                           const struct iovec *iov,
-                           size_t niov,
-                           Error **erp);
+int qio_channel_writev_all_flags(QIOChannel *ioc,
+                                 const struct iovec *iov,
+                                 size_t niov,
+                                 int flags,
+                                 Error **errp);
+
+#define qio_channel_writev_all(ioc, iov, niov, errp) \
+    qio_channel_writev_all_flags(ioc, iov, niov, 0, errp)
 
 /**
  * qio_channel_readv:
@@ -364,15 +371,21 @@ ssize_t qio_channel_readv(QIOChannel *ioc,
  * @ioc: the channel object
  * @iov: the array of memory regions to write data from
  * @niov: the length of the @iov array
+ * @flags: optional sending flags
  * @errp: pointer to a NULL-initialized error object
  *
  * Behaves as qio_channel_writev_full() but does not support
  * sending of file handles.
  */
-ssize_t qio_channel_writev(QIOChannel *ioc,
-                           const struct iovec *iov,
-                           size_t niov,
-                           Error **errp);
+ssize_t qio_channel_writev_flags(QIOChannel *ioc,
+                                 const struct iovec *iov,
+                                 size_t niov,
+                                 int flags,
+                                 Error **errp);
+
+#define qio_channel_writev(ioc, iov, niov, errp) \
+    qio_channel_writev_flags(ioc, iov, niov, 0, errp)
+
 
 /**
  * qio_channel_read:
@@ -395,16 +408,21 @@ ssize_t qio_channel_read(QIOChannel *ioc,
  * @ioc: the channel object
  * @buf: the memory regions to send data from
  * @buflen: the length of @buf
+ * @flags: optional sending flags
  * @errp: pointer to a NULL-initialized error object
  *
  * Behaves as qio_channel_writev_full() but does not support
  * sending of file handles, and only supports writing from a
  * single memory region.
  */
-ssize_t qio_channel_write(QIOChannel *ioc,
-                          const char *buf,
-                          size_t buflen,
-                          Error **errp);
+ssize_t qio_channel_write_flags(QIOChannel *ioc,
+                                const char *buf,
+                                size_t buflen,
+                                int flags,
+                                Error **errp);
+
+#define qio_channel_write(ioc, buf, buflen, errp) \
+     qio_channel_write_flags(ioc, buf, buflen, 0, errp)
 
 /**
  * qio_channel_read_all_eof:
@@ -453,6 +471,7 @@ int qio_channel_read_all(QIOChannel *ioc,
  * @ioc: the channel object
  * @buf: the memory region to write data into
  * @buflen: the number of bytes to @buf
+ * @flags: optional sending flags
  * @errp: pointer to a NULL-initialized error object
  *
  * Writes @buflen bytes from @buf, possibly blocking or (if the
@@ -462,10 +481,14 @@ int qio_channel_read_all(QIOChannel *ioc,
  *
  * Returns: 0 if all bytes were written, or -1 on error
  */
-int qio_channel_write_all(QIOChannel *ioc,
-                          const char *buf,
-                          size_t buflen,
-                          Error **errp);
+int qio_channel_write_all_flags(QIOChannel *ioc,
+                                const char *buf,
+                                size_t buflen,
+                                int flags,
+                                Error **errp);
+
+#define qio_channel_write_all(ioc, buf, buflen, errp) \
+    qio_channel_write_all_flags(ioc, buf, buflen, 0, errp)
 
 /**
  * qio_channel_set_blocking:
@@ -853,6 +876,7 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
                                 const struct iovec *iov,
                                 size_t niov,
                                 int *fds, size_t nfds,
+                                int flags,
                                 Error **errp);
 
 #endif /* QIO_CHANNEL_H */
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
index b2a9e27138..5ff1691bad 100644
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
index c4bf799a80..348a48545e 100644
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
index 606ec97cf7..e377e7303d 100644
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
@@ -558,7 +559,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
     }
 
  retry:
-    ret = sendmsg(sioc->fd, &msg, 0);
+    ret = sendmsg(sioc->fd, &msg, flags);
     if (ret <= 0) {
         if (errno == EAGAIN) {
             return QIO_CHANNEL_ERR_BLOCK;
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
index e8b019dc36..ee3cb83d4d 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -72,6 +72,7 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
                                 size_t niov,
                                 int *fds,
                                 size_t nfds,
+                                int flags,
                                 Error **errp)
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
@@ -83,7 +84,7 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
         return -1;
     }
 
-    return klass->io_writev(ioc, iov, niov, fds, nfds, errp);
+    return klass->io_writev(ioc, iov, niov, fds, nfds, flags, errp);
 }
 
 
@@ -212,18 +213,20 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
     return ret;
 }
 
-int qio_channel_writev_all(QIOChannel *ioc,
-                           const struct iovec *iov,
-                           size_t niov,
-                           Error **errp)
+int qio_channel_writev_all_flags(QIOChannel *ioc,
+                                 const struct iovec *iov,
+                                 size_t niov,
+                                 int flags,
+                                 Error **errp)
 {
-    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, errp);
+    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, flags, errp);
 }
 
 int qio_channel_writev_full_all(QIOChannel *ioc,
                                 const struct iovec *iov,
                                 size_t niov,
                                 int *fds, size_t nfds,
+                                int flags,
                                 Error **errp)
 {
     int ret = -1;
@@ -238,7 +241,7 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
     while (nlocal_iov > 0) {
         ssize_t len;
         len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
-                                      errp);
+                                      flags, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_OUT);
@@ -272,15 +275,15 @@ ssize_t qio_channel_readv(QIOChannel *ioc,
 }
 
 
-ssize_t qio_channel_writev(QIOChannel *ioc,
-                           const struct iovec *iov,
-                           size_t niov,
-                           Error **errp)
+ssize_t qio_channel_writev_flags(QIOChannel *ioc,
+                                 const struct iovec *iov,
+                                 size_t niov,
+                                 int flags,
+                                 Error **errp)
 {
-    return qio_channel_writev_full(ioc, iov, niov, NULL, 0, errp);
+    return qio_channel_writev_full(ioc, iov, niov, NULL, 0, flags, errp);
 }
 
-
 ssize_t qio_channel_read(QIOChannel *ioc,
                          char *buf,
                          size_t buflen,
@@ -291,16 +294,16 @@ ssize_t qio_channel_read(QIOChannel *ioc,
 }
 
 
-ssize_t qio_channel_write(QIOChannel *ioc,
-                          const char *buf,
-                          size_t buflen,
-                          Error **errp)
+ssize_t qio_channel_write_flags(QIOChannel *ioc,
+                                const char *buf,
+                                size_t buflen,
+                                int flags,
+                                Error **errp)
 {
     struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
-    return qio_channel_writev_full(ioc, &iov, 1, NULL, 0, errp);
+    return qio_channel_writev_full(ioc, &iov, 1, NULL, 0, flags, errp);
 }
 
-
 int qio_channel_read_all_eof(QIOChannel *ioc,
                              char *buf,
                              size_t buflen,
@@ -321,16 +324,16 @@ int qio_channel_read_all(QIOChannel *ioc,
 }
 
 
-int qio_channel_write_all(QIOChannel *ioc,
-                          const char *buf,
-                          size_t buflen,
-                          Error **errp)
+int qio_channel_write_all_flags(QIOChannel *ioc,
+                                const char *buf,
+                                size_t buflen,
+                                int flags,
+                                Error **errp)
 {
     struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
-    return qio_channel_writev_all(ioc, &iov, 1, errp);
+    return qio_channel_writev_all_flags(ioc, &iov, 1, flags, errp);
 }
 
-
 int qio_channel_set_blocking(QIOChannel *ioc,
                               bool enabled,
                               Error **errp)
diff --git a/migration/rdma.c b/migration/rdma.c
index 5c2d113aa9..bc0558b70e 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2713,6 +2713,7 @@ static ssize_t qio_channel_rdma_writev(QIOChannel *ioc,
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
2.33.0


