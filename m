Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D898146E5CD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:44:22 +0100 (CET)
Received: from localhost ([::1]:57336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvFyP-0006MN-Uj
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:44:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFua-0000r3-6d
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFuM-0008Gr-Rt
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639042810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iOUPGpjpRkeh0PPRwOCu38b1HQTgEiG41NIQNvFH+wc=;
 b=Kqajhz4G0kdLvgomZOXGgLFauSabLQCW/MyRRuVlnL9xdO/8EltlpjyxJvM/alnn0d0IH/
 NdIapQz08FQkC1jvxOa2FqyUIv5Ny8as4o/pDcMlEZKhIYQ8i6t0v+xeVtszxEO2zPnVsM
 sqnneEGt840XJf9sXQG8VMfukt5eLuE=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-OIbm-HlhP4aEJ0kjzOBEjA-1; Thu, 09 Dec 2021 04:40:07 -0500
X-MC-Unique: OIbm-HlhP4aEJ0kjzOBEjA-1
Received: by mail-ua1-f72.google.com with SMTP id
 w48-20020a9f31f3000000b002cf15fe9655so3316227uad.17
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 01:40:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iOUPGpjpRkeh0PPRwOCu38b1HQTgEiG41NIQNvFH+wc=;
 b=Lnv5n8U4f+YAK8Lp3Kme8LS4dg7aco+y1CExbsqIgiUEG1uWBpqHIT0/ppWab/1AOc
 9w0fQKaoqeQ49EqY7KEpcFAkEhozGiTujHBP72mMVqIltU/sOSWwH92nvKA3qS/tnnuk
 FHPlTV73MWrUmEeOzny+oaNi7q/GTfyiUesEqynhKSWQr0uRgSzdkSnGTw9y0wm92OFy
 z8/LKl9Uy7IkctawMRudmgoazRhFfkfSaBjNexClXi1HVT8YD3SB6UyJ+E5VcNee7WYD
 Ip5Hi8+ZLk/BgYGtfphlXLr34eksS5VXc5oslRqpsdUlbGrIBNl3Lt5ymbNcQucgArZa
 tVbA==
X-Gm-Message-State: AOAM533KKOGwAm0w8bpTJ4DVTg+1UzQaml+d3JGYW7SEF7zHUt5hfcKd
 asPBI5SQkzQtNVS2bF4YGkPgJv4U/ccBBlpklCyApL+pawCKH9E6HHrLtHGRz27VcbRhthCBY13
 phwc+PX1l10qplo0=
X-Received: by 2002:a67:f9c6:: with SMTP id c6mr6263187vsq.20.1639042806571;
 Thu, 09 Dec 2021 01:40:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfzFRtAiG3HOrwKR3yujerRspAO8cCr1F/LuHgvVpLESFZ2sBibUpcLxWWEMWFyVcSQSsK3Q==
X-Received: by 2002:a67:f9c6:: with SMTP id c6mr6263158vsq.20.1639042806343;
 Thu, 09 Dec 2021 01:40:06 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:dadb:5bd9:f52:7a4a:a8af])
 by smtp.gmail.com with ESMTPSA id s22sm3460215vkm.28.2021.12.09.01.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 01:40:05 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 3/6] QIOChannelSocket: Implement io_writev_zero_copy &
 io_flush_zero_copy for CONFIG_LINUX
Date: Thu,  9 Dec 2021 06:39:21 -0300
Message-Id: <20211209093923.1293701-4-leobras@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211209093923.1293701-1-leobras@redhat.com>
References: <20211209093923.1293701-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

For CONFIG_LINUX, implement the new optional callbacks io_write_zero_copy and
io_flush_zero_copy on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
feature is available in the host kernel, which is checked on
qio_channel_socket_connect_sync()

qio_channel_socket_flush_zero_copy() was implemented by counting how many times
sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
socket's error queue, in order to find how many of them finished sending.
Flush will loop until those counters are the same, or until some error occurs.

A new function qio_channel_socket_poll() was also created in order to avoid
busy-looping recvmsg() in qio_channel_socket_flush_zero_copy() while waiting for
updates in socket's error queue.

Notes on using writev_zero_copy():
1: Buffer
- As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
some caution is necessary to avoid overwriting any buffer before it's sent.
If something like this happen, a newer version of the buffer may be sent instead.
- If this is a problem, it's recommended to call flush_zero_copy() before freeing
or re-using the buffer.

2: Locked memory
- When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
unlocked after it's sent.
- Depending on the size of each buffer, and how often it's sent, it may require
a larger amount of locked memory than usually available to non-root user.
- If the required amount of locked memory is not available, writev_zero_copy
will return an error, which can abort an operation like migration,
- Because of this, when an user code wants to add zero copy as a feature, it
requires a mechanism to disable it, so it can still be accessible to less
privileged users.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/io/channel-socket.h |   2 +
 io/channel-socket.c         | 119 +++++++++++++++++++++++++++++++++++-
 2 files changed, 118 insertions(+), 3 deletions(-)

diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index e747e63514..513c428fe4 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -47,6 +47,8 @@ struct QIOChannelSocket {
     socklen_t localAddrLen;
     struct sockaddr_storage remoteAddr;
     socklen_t remoteAddrLen;
+    ssize_t zero_copy_queued;
+    ssize_t zero_copy_sent;
 };
 
 
diff --git a/io/channel-socket.c b/io/channel-socket.c
index b57a27bf91..d0c91662c1 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -26,6 +26,10 @@
 #include "io/channel-watch.h"
 #include "trace.h"
 #include "qapi/clone-visitor.h"
+#ifdef CONFIG_LINUX
+#include <linux/errqueue.h>
+#include <bits/socket.h>
+#endif
 
 #define SOCKET_MAX_FDS 16
 
@@ -55,6 +59,8 @@ qio_channel_socket_new(void)
 
     sioc = QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
     sioc->fd = -1;
+    sioc->zero_copy_queued = 0;
+    sioc->zero_copy_sent = 0;
 
     ioc = QIO_CHANNEL(sioc);
     qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
@@ -154,6 +160,16 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
         return -1;
     }
 
+#ifdef CONFIG_LINUX
+    int ret, v = 1;
+    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
+    if (ret == 0) {
+        /* Zero copy available on host */
+        qio_channel_set_feature(QIO_CHANNEL(ioc),
+                                QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY);
+    }
+#endif
+
     return 0;
 }
 
@@ -561,12 +577,19 @@ static ssize_t qio_channel_socket_writev_flags(QIOChannel *ioc,
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
+            if (flags & MSG_ZEROCOPY) {
+                error_setg_errno(errp, errno,
+                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
+                return -1;
+            }
         }
+
         error_setg_errno(errp, errno,
                          "Unable to write to socket");
         return -1;
@@ -670,6 +693,92 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
 }
 #endif /* WIN32 */
 
+
+#ifdef CONFIG_LINUX
+
+static ssize_t qio_channel_socket_writev_zero_copy(QIOChannel *ioc,
+                                                   const struct iovec *iov,
+                                                   size_t niov,
+                                                   Error **errp)
+{
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
+    ssize_t ret;
+
+    ret = qio_channel_socket_writev_flags(ioc, iov, niov, NULL, 0,
+                                          MSG_ZEROCOPY, errp);
+    if (ret > 0) {
+        sioc->zero_copy_queued++;
+    }
+
+    return ret;
+}
+
+static int qio_channel_socket_flush_zero_copy(QIOChannel *ioc,
+                                              Error **errp)
+{
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
+    struct msghdr msg = {};
+    struct sock_extended_err *serr;
+    struct cmsghdr *cm;
+    char control[CMSG_SPACE(sizeof(*serr))];
+    int received;
+    int ret = 1;
+
+    msg.msg_control = control;
+    msg.msg_controllen = sizeof(control);
+    memset(control, 0, sizeof(control));
+
+    while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
+        received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
+        if (received < 0) {
+            switch (errno) {
+            case EAGAIN:
+                /* Nothing on errqueue, wait until something is available */
+                qio_channel_wait(ioc, G_IO_ERR);
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
+                             "Error not from zero copy");
+            return -1;
+        }
+
+        /* No errors, count successfully finished sendmsg()*/
+        sioc->zero_copy_sent += serr->ee_data - serr->ee_info + 1;
+
+        /* If any sendmsg() succeeded using zero copy, return 0 at the end */
+        if (serr->ee_code != SO_EE_CODE_ZEROCOPY_COPIED) {
+            ret = 0;
+        }
+    }
+
+    return ret;
+}
+
+#endif /* CONFIG_LINUX */
+
 static int
 qio_channel_socket_set_blocking(QIOChannel *ioc,
                                 bool enabled,
@@ -799,6 +908,10 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
     ioc_klass->io_set_delay = qio_channel_socket_set_delay;
     ioc_klass->io_create_watch = qio_channel_socket_create_watch;
     ioc_klass->io_set_aio_fd_handler = qio_channel_socket_set_aio_fd_handler;
+#ifdef CONFIG_LINUX
+    ioc_klass->io_writev_zero_copy = qio_channel_socket_writev_zero_copy;
+    ioc_klass->io_flush_zero_copy = qio_channel_socket_flush_zero_copy;
+#endif
 }
 
 static const TypeInfo qio_channel_socket_info = {
-- 
2.33.1


