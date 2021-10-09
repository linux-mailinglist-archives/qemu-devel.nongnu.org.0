Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E7B4277FF
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 09:58:42 +0200 (CEST)
Received: from localhost ([::1]:46206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZ7Fh-00083w-Ts
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 03:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mZ7Dp-0005eA-FJ
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 03:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mZ7Dn-0002YR-J9
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 03:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633766202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VA+pEssq3CA2VJwfUYWEEnuxy9e9r4mkgUVhxttCbnA=;
 b=duEuWMmSKMICoCDewe95pNOGn8jbfZlImwPOQx+SAhB4Jtoct8aj9Wnbma5ltOdBbYNZ32
 hplFMrwksW90tdWU/eARl59024RVLUqnSbsObYAc80NZCYiBE23Q+lbOe8VI7XFEtWulZX
 Z9TyQ5cOXYaZ0ogM1oGKwiKNjCPdf5A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-R7AYRHRIMIurqb6wL5EpxQ-1; Sat, 09 Oct 2021 03:56:41 -0400
X-MC-Unique: R7AYRHRIMIurqb6wL5EpxQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so11228121edj.21
 for <qemu-devel@nongnu.org>; Sat, 09 Oct 2021 00:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VA+pEssq3CA2VJwfUYWEEnuxy9e9r4mkgUVhxttCbnA=;
 b=Mqx28wO7X/pZxiwiK8/griX2QF6Eow3CJMSHFG/bCzP+LoRDQjl1oI4NUHfuZ/2lbM
 VPCUAyPL2cDcWakMOCQKfWmxL4Ut5RPQDXtdtDc/Is1Hknum1t2cTWrPHEWuEYCe2X6r
 8PwZ6e6QuYti4/0gkQ1zk5N2Tf9I5BpY6smWjA5PK+VWu95Er7QegUfIKhJ2kjjcbM5j
 4CIdDb8Ec0Eh3wvC3hk1KITWOE/YXV9MQLlbGN63BAJyLKf5s53n82aadB2Vc5uzMOwd
 W27xlHgm5XF9B+/q3MwptwyHplffX6lPabSa6dTceaVeo29q4gZBeH9ULUOlNqBhgWAV
 BHoQ==
X-Gm-Message-State: AOAM533fW+suxOXFAIJKLKJycbKOCPMDpjlrf8qvikLClA1aXo4vCJ6/
 8YZyC85hXlifq3g9Ed1iPZxIZ5DwiBatSfUWDJAne1q8wiEVoSiAJSQZFQgs4ZVGfQFcatLcRVe
 QN20yGjZmyEJ5z34=
X-Received: by 2002:aa7:c945:: with SMTP id h5mr21939691edt.350.1633766199937; 
 Sat, 09 Oct 2021 00:56:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4dy+EXkF5VWbBXgiu1hySj4TFjnR8jSbkQzWSOMMqkoAjbMvZmb5+qZD0HC1auQEBZa+ekA==
X-Received: by 2002:aa7:c945:: with SMTP id h5mr21939654edt.350.1633766199663; 
 Sat, 09 Oct 2021 00:56:39 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:5307:af36:9661:8efc:9b2c])
 by smtp.gmail.com with ESMTPSA id p23sm782059edw.94.2021.10.09.00.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 00:56:39 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v4 2/3] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
Date: Sat,  9 Oct 2021 04:56:12 -0300
Message-Id: <20211009075612.230283-3-leobras@redhat.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211009075612.230283-1-leobras@redhat.com>
References: <20211009075612.230283-1-leobras@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For CONFIG_LINUX, implement the new optional callbacks io_write_zerocopy and
io_flush_zerocopy on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
feature is available in the host kernel, which is checked on
qio_channel_socket_connect_sync()

qio_channel_socket_writev() contents were moved to a helper function
qio_channel_socket_writev_flags() which accepts an extra argument for flags.
(This argument is passed directly to sendmsg().

The above helper function is used to implement qio_channel_socket_writev(),
with flags = 0, keeping it's behavior unchanged, and
qio_channel_socket_writev_zerocopy() with flags = MSG_ZEROCOPY.

qio_channel_socket_flush_zerocopy() was implemented by counting how many times
sendmsg(...,MSG_ZEROCOPY) was sucessfully called, and then reading the
socket's error queue, in order to find how many of them finished sending.
Flush will loop until those counters are the same, or until some error ocurs.

A new function qio_channel_socket_poll() was also created in order to avoid
busy-looping recvmsg() in qio_channel_socket_flush_zerocopy() while waiting for
updates in socket's error queue.

Notes on using writev_zerocopy():
1: Buffer
- As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
some caution is necessary to avoid overwriting any buffer before it's sent.
If something like this happen, a newer version of the buffer may be sent instead.
- If this is a problem, it's recommended to call flush_zerocopy() before freeing
or re-using the buffer.

2: Locked memory
- When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
unlocked after it's sent.
- Depending on the size of each buffer, and how often it's sent, it may require
a larger amount of locked memory than usually available to non-root user.
- If the required amount of locked memory is not available, writev_zerocopy
will return an error, which can abort an operation like migration,
- Because of this, when an user code wants to add zerocopy as a feature, it
requires a mechanism to disable it, so it can still be acessible to less
privileged users.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/io/channel-socket.h |   2 +
 include/io/channel.h        |   1 +
 io/channel-socket.c         | 180 ++++++++++++++++++++++++++++++++++--
 3 files changed, 173 insertions(+), 10 deletions(-)

diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index e747e63514..81d04baa4c 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -47,6 +47,8 @@ struct QIOChannelSocket {
     socklen_t localAddrLen;
     struct sockaddr_storage remoteAddr;
     socklen_t remoteAddrLen;
+    ssize_t zerocopy_queued;
+    ssize_t zerocopy_sent;
 };
 
 
diff --git a/include/io/channel.h b/include/io/channel.h
index e7d4e1521f..9d74629226 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
 
 
 #define QIO_CHANNEL_ERR_BLOCK -2
+#define QIO_CHANNEL_ERR_NOBUFS -3
 
 #define QIO_CHANNEL_WRITE_FLAG_ZEROCOPY 0x1
 
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 606ec97cf7..6cc42057b2 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -26,6 +26,10 @@
 #include "io/channel-watch.h"
 #include "trace.h"
 #include "qapi/clone-visitor.h"
+#ifdef CONFIG_LINUX
+#include <linux/errqueue.h>
+#include <poll.h>
+#endif
 
 #define SOCKET_MAX_FDS 16
 
@@ -55,6 +59,8 @@ qio_channel_socket_new(void)
 
     sioc = QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
     sioc->fd = -1;
+    sioc->zerocopy_queued = 0;
+    sioc->zerocopy_sent = 0;
 
     ioc = QIO_CHANNEL(sioc);
     qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
@@ -140,6 +146,7 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
                                     Error **errp)
 {
     int fd;
+    int ret, v = 1;
 
     trace_qio_channel_socket_connect_sync(ioc, addr);
     fd = socket_connect(addr, errp);
@@ -154,6 +161,17 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
         return -1;
     }
 
+#ifdef CONFIG_LINUX
+    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
+    if (ret < 0) {
+        /* Zerocopy not available on host */
+        return 0;
+    }
+
+    qio_channel_set_feature(QIO_CHANNEL(ioc),
+                            QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY);
+#endif
+
     return 0;
 }
 
@@ -520,12 +538,13 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
     return ret;
 }
 
-static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
-                                         const struct iovec *iov,
-                                         size_t niov,
-                                         int *fds,
-                                         size_t nfds,
-                                         Error **errp)
+static ssize_t qio_channel_socket_writev_flags(QIOChannel *ioc,
+                                               const struct iovec *iov,
+                                               size_t niov,
+                                               int *fds,
+                                               size_t nfds,
+                                               int flags,
+                                               Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
     ssize_t ret;
@@ -558,20 +577,34 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
     }
 
  retry:
-    ret = sendmsg(sioc->fd, &msg, 0);
+    ret = sendmsg(sioc->fd, &msg, flags);
     if (ret <= 0) {
-        if (errno == EAGAIN) {
+        switch (errno) {
+        case EAGAIN:
             return QIO_CHANNEL_ERR_BLOCK;
-        }
-        if (errno == EINTR) {
+        case EINTR:
             goto retry;
+        case ENOBUFS:
+            return QIO_CHANNEL_ERR_NOBUFS;
         }
+
         error_setg_errno(errp, errno,
                          "Unable to write to socket");
         return -1;
     }
     return ret;
 }
+
+static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
+                                         const struct iovec *iov,
+                                         size_t niov,
+                                         int *fds,
+                                         size_t nfds,
+                                         Error **errp)
+{
+    return qio_channel_socket_writev_flags(ioc, iov, niov, fds, nfds, 0, errp);
+}
+
 #else /* WIN32 */
 static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         const struct iovec *iov,
@@ -658,6 +691,129 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
 }
 #endif /* WIN32 */
 
+
+#ifdef CONFIG_LINUX
+
+static int qio_channel_socket_poll(QIOChannelSocket *sioc, bool zerocopy,
+                                   Error **errp)
+{
+    struct pollfd pfd;
+    int ret;
+
+    pfd.fd = sioc->fd;
+    pfd.events = 0;
+
+ retry:
+    ret = poll(&pfd, 1, -1);
+    if (ret < 0) {
+        switch (errno) {
+        case EAGAIN:
+        case EINTR:
+            goto retry;
+        default:
+            error_setg_errno(errp, errno,
+                             "Poll error");
+            return ret;
+        }
+    }
+
+    if (pfd.revents & (POLLHUP | POLLNVAL)) {
+        error_setg(errp, "Poll error: Invalid or disconnected fd");
+        return -1;
+    }
+
+    if (!zerocopy && (pfd.revents & POLLERR)) {
+        error_setg(errp, "Poll error: Errors present in errqueue");
+        return -1;
+    }
+
+    return ret;
+}
+
+static ssize_t qio_channel_socket_writev_zerocopy(QIOChannel *ioc,
+                                                  const struct iovec *iov,
+                                                  size_t niov,
+                                                  Error **errp)
+{
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
+    ssize_t ret;
+
+    ret = qio_channel_socket_writev_flags(ioc, iov, niov, NULL, 0,
+                                          MSG_ZEROCOPY, errp);
+    if (ret == QIO_CHANNEL_ERR_NOBUFS) {
+        if (errp && *errp) {
+            error_setg_errno(errp, errno,
+                             "Process can't lock enough memory for using MSG_ZEROCOPY");
+        }
+        return -1;
+    }
+
+    sioc->zerocopy_queued++;
+    return ret;
+}
+
+static int qio_channel_socket_flush_zerocopy(QIOChannel *ioc,
+                                             Error **errp)
+{
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
+    struct msghdr msg = {};
+    struct sock_extended_err *serr;
+    struct cmsghdr *cm;
+    char control[CMSG_SPACE(sizeof(*serr))];
+    int ret;
+
+    msg.msg_control = control;
+    msg.msg_controllen = sizeof(control);
+    memset(control, 0, sizeof(control));
+
+    while (sioc->zerocopy_sent < sioc->zerocopy_queued) {
+        ret = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
+        if (ret < 0) {
+            switch (errno) {
+            case EAGAIN:
+                /* Nothing on errqueue, wait until something is available*/
+                ret = qio_channel_socket_poll(sioc, true, errp);
+                if (ret < 0) {
+                    return -1;
+                }
+                continue;
+            case EINTR:
+                continue;
+            default:
+                error_setg_errno(errp, errno,
+                                 "Unable to read errqueue");
+                return -1;
+            }
+        }
+
+        cm = CMSG_FIRSTHDR(&msg);
+        if (cm->cmsg_level != SOL_IP &&
+            cm->cmsg_type != IP_RECVERR) {
+            error_setg_errno(errp, EPROTOTYPE,
+                             "Wrong cmsg in errqueue");
+            return -1;
+        }
+
+        serr = (void *) CMSG_DATA(cm);
+        if (serr->ee_errno != SO_EE_ORIGIN_NONE) {
+            error_setg_errno(errp, serr->ee_errno,
+                             "Error on socket");
+            return -1;
+        }
+        if (serr->ee_origin != SO_EE_ORIGIN_ZEROCOPY) {
+            error_setg_errno(errp, serr->ee_origin,
+                             "Error not from zerocopy");
+            return -1;
+        }
+
+        /* No errors, count sucessfully finished sendmsg()*/
+        sioc->zerocopy_sent += serr->ee_data - serr->ee_info + 1;
+    }
+    return 0;
+}
+
+#endif /* CONFIG_LINUX */
+
 static int
 qio_channel_socket_set_blocking(QIOChannel *ioc,
                                 bool enabled,
@@ -787,6 +943,10 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
     ioc_klass->io_set_delay = qio_channel_socket_set_delay;
     ioc_klass->io_create_watch = qio_channel_socket_create_watch;
     ioc_klass->io_set_aio_fd_handler = qio_channel_socket_set_aio_fd_handler;
+#ifdef CONFIG_LINUX
+    ioc_klass->io_writev_zerocopy = qio_channel_socket_writev_zerocopy;
+    ioc_klass->io_flush_zerocopy = qio_channel_socket_flush_zerocopy;
+#endif
 }
 
 static const TypeInfo qio_channel_socket_info = {
-- 
2.33.0


