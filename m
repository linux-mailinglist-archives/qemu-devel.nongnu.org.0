Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5E244E1AE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 06:45:28 +0100 (CET)
Received: from localhost ([::1]:55258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlPNQ-0005GF-2H
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 00:45:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHf-0006F5-2p
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHc-0005Ov-P3
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636695568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEZ7KWVhVlN9ynTuHmuv37z/vXH4vHDkNj5XVpkctIQ=;
 b=PxJKFPdEBxW5eauukQfUDpaCtf+QP+0d3f09QRYTsXrkfFPU8G7zNwb0SbVs8NzBNU63VM
 q7FFz8gwsRVSoT8rX1wvc02I9S0SEuQL3+GIvtqLBY+QrjtaHV1AJeal0bmbYebHEg2NhO
 oy0F49IjgKP20RgXw0gb4LhQtQupEfw=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-zzlE4e1zPH-NL_I05Kg1og-1; Fri, 12 Nov 2021 00:39:24 -0500
X-MC-Unique: zzlE4e1zPH-NL_I05Kg1og-1
Received: by mail-vk1-f200.google.com with SMTP id
 q3-20020a056122116300b002faa0b9026fso3820260vko.18
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 21:39:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEZ7KWVhVlN9ynTuHmuv37z/vXH4vHDkNj5XVpkctIQ=;
 b=Xuh5giifqNT6AL2Ugysh0jj3W5nfymnljqtKhsjoF0WGWBvv8cx4gpvFi/tmqz/iWM
 ru0yKKeLZhmI6HRGo3XPPLVzTa3HWKWQgxrCd/p2MlbKbXCQVgmRn30uwNbFok7D5JZc
 nxj/yS3FVTx+b2YH+d+7lbzy02nHo28pRDNZWT5OLN1XHvbsGkIxLiyTom596Hp+8PNJ
 kuFOIAQXSJWld3Um624bfMpzgKu32BTx11P46BjpBzU4AFINpaIuyMnz+UD4xwT4bvse
 O5CIBDtq05Q7icrwYFSPK7rUGf49fxdYDftBegxUf6ybS0ZmkQQPGL+v8wBacl7yVGUX
 4KaQ==
X-Gm-Message-State: AOAM533XT+M3v92PkQ3XPZCeT9VTihdJxE3U/m0/NtexBVQ95Bjvxfdt
 /Ss2b6jQKg9X01DWYiTm3k/rmmKjZ+7Gxu02+ra7rGLp3P493MUh/9ZG0COD+2EQ/LqEHVxC9gK
 lNK7WuAn3oZPQzFM=
X-Received: by 2002:a05:6102:953:: with SMTP id
 a19mr6750973vsi.28.1636695563380; 
 Thu, 11 Nov 2021 21:39:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl1OkVaWtxGwMAD27GoGXlg2bZfIOG7C3pufeQtJKb2GBPlTIjrzus4EQ2zoQ1oA9WCRVygg==
X-Received: by 2002:a05:6102:953:: with SMTP id
 a19mr6750946vsi.28.1636695563153; 
 Thu, 11 Nov 2021 21:39:23 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:7e14:3b94:fb27:f0ad:a824])
 by smtp.gmail.com with ESMTPSA id r2sm1465280vsk.28.2021.11.11.21.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 21:39:22 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v5 3/6] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
Date: Fri, 12 Nov 2021 02:10:38 -0300
Message-Id: <20211112051040.923746-4-leobras@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112051040.923746-1-leobras@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For CONFIG_LINUX, implement the new optional callbacks io_write_zerocopy and
io_flush_zerocopy on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
feature is available in the host kernel, which is checked on
qio_channel_socket_connect_sync()

qio_channel_socket_flush_zerocopy() was implemented by counting how many times
sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
socket's error queue, in order to find how many of them finished sending.
Flush will loop until those counters are the same, or until some error occurs.

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
requires a mechanism to disable it, so it can still be accessible to less
privileged users.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/io/channel-socket.h |   2 +
 include/io/channel.h        |   1 +
 io/channel-socket.c         | 150 +++++++++++++++++++++++++++++++++++-
 3 files changed, 150 insertions(+), 3 deletions(-)

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
index a19c09bb84..051fff4197 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
 
 
 #define QIO_CHANNEL_ERR_BLOCK -2
+#define QIO_CHANNEL_ERR_NOBUFS -3
 
 #define QIO_CHANNEL_WRITE_FLAG_ZEROCOPY 0x1
 
diff --git a/io/channel-socket.c b/io/channel-socket.c
index b57a27bf91..c724b849ad 100644
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
@@ -154,6 +161,15 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
         return -1;
     }
 
+#ifdef CONFIG_LINUX
+    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
+    if (ret == 0) {
+        /* Zerocopy available on host */
+        qio_channel_set_feature(QIO_CHANNEL(ioc),
+                                QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY);
+    }
+#endif
+
     return 0;
 }
 
@@ -561,12 +577,15 @@ static ssize_t qio_channel_socket_writev_flags(QIOChannel *ioc,
  retry:
     ret = sendmsg(sioc->fd, &msg, flags);
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
@@ -670,6 +689,127 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
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
+        error_setg_errno(errp, errno,
+                         "Process can't lock enough memory for using MSG_ZEROCOPY");
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
+                /* Nothing on errqueue, wait until something is available */
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
+        /* No errors, count successfully finished sendmsg()*/
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
@@ -799,6 +939,10 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
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
2.33.1


