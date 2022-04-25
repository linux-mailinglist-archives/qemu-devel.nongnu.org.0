Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E0950EB56
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 23:54:28 +0200 (CEST)
Received: from localhost ([::1]:50954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj6f4-0008TV-UT
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 17:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nj6cU-0005el-Tb
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nj6cQ-00013E-3C
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650923501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uIqEFdqWEF4dCTXgfI+IVJbQ/j6rHuIRMDolbwB0Ie8=;
 b=XOm9yCkY0YSZboZcMNTA21upEbGJ/hjXurXj3J+Oioa3dqeM9HGStY5F9Y3EECqOO+MwxZ
 W/X75NH2jMgiETrVNTwyZ2vXNjPpwf69WOLLMkQ+0PJJ+vUayvFhX9gOSVl35JdjML4Rr2
 vGAbL9/71n4vGcPVMgQzr6n2cYIJrqI=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-qCSyr9lFNhCZyz1Jan-FKA-1; Mon, 25 Apr 2022 17:51:40 -0400
X-MC-Unique: qCSyr9lFNhCZyz1Jan-FKA-1
Received: by mail-ot1-f69.google.com with SMTP id
 h14-20020a9d554e000000b006050ab1f68eso6810152oti.7
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 14:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uIqEFdqWEF4dCTXgfI+IVJbQ/j6rHuIRMDolbwB0Ie8=;
 b=eO85TxGe+M+J/rJNKANvnpSJxGWBvVwE8kJXR0tfVLM4fgy9UotDcsmkYjh4kCZP6/
 qOi/SF/n2sSeBZ3DKXYdyvzS4DHf4AAl8+uldvrt6S+rR+KCzxBW7Une4pGZ6lQ8UAyn
 4Ztw5nyb+nTS4q1+whZtpEgpfPcN+BFYuntR1D7odbDp5+5If3jHXWNjktMDAin2RxHG
 vw/veqaVMfy0kbolwgc01g6sIyclZYQ2Ed50jc4lkGRWiFweHg+rcEft/CsWLQ6xGSOK
 vypV8ttZ1NqIbSQUeQ739iiTCAOZaeHchdDZ22ahWbmYFEaksVwXZ0JfS0hlas7T8jJ6
 rxYw==
X-Gm-Message-State: AOAM532GEy867sbOV8hjAxT3ndfEzJSQqgtP9CVDnQK72TuXjrm5zlDQ
 qi4Bl/WV3PeZ3kPRGiAshmqgWChc7Fo0BwcBLSDudVx3FQjy1YPiBb48uC0BoitUDfNlPdgX939
 u6L3wi77sC5b4NVA=
X-Received: by 2002:a9d:7491:0:b0:605:5000:8f3b with SMTP id
 t17-20020a9d7491000000b0060550008f3bmr7157081otk.66.1650923499221; 
 Mon, 25 Apr 2022 14:51:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzj2595ZCNOJ26QprRtG5BQBqW0Z9xK9n+px/8iBEYenPUCLH7oLLqwmrZ0e+YPaFvsK8Is2Q==
X-Received: by 2002:a9d:7491:0:b0:605:5000:8f3b with SMTP id
 t17-20020a9d7491000000b0060550008f3bmr7157066otk.66.1650923498978; 
 Mon, 25 Apr 2022 14:51:38 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:2ba0:92e8:26c9:ce7e:f03e])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a056870e60700b000e686d13878sm156807oag.18.2022.04.25.14.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 14:51:38 -0700 (PDT)
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
Subject: [PATCH v9 2/7] QIOChannelSocket: Implement io_writev zero copy flag &
 io_flush for CONFIG_LINUX
Date: Mon, 25 Apr 2022 18:50:51 -0300
Message-Id: <20220425215055.611825-3-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220425215055.611825-1-leobras@redhat.com>
References: <20220425215055.611825-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For CONFIG_LINUX, implement the new zero copy flag and the optional callback
io_flush on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
feature is available in the host kernel, which is checked on
qio_channel_socket_connect_sync()

qio_channel_socket_flush() was implemented by counting how many times
sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
socket's error queue, in order to find how many of them finished sending.
Flush will loop until those counters are the same, or until some error occurs.

Notes on using writev() with QIO_CHANNEL_WRITE_FLAG_ZERO_COPY:
1: Buffer
- As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
some caution is necessary to avoid overwriting any buffer before it's sent.
If something like this happen, a newer version of the buffer may be sent instead.
- If this is a problem, it's recommended to call qio_channel_flush() before freeing
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
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 include/io/channel-socket.h |   2 +
 io/channel-socket.c         | 108 ++++++++++++++++++++++++++++++++++--
 2 files changed, 106 insertions(+), 4 deletions(-)

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
index 696a04dc9c..1dd85fc1ef 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -25,6 +25,10 @@
 #include "io/channel-watch.h"
 #include "trace.h"
 #include "qapi/clone-visitor.h"
+#ifdef CONFIG_LINUX
+#include <linux/errqueue.h>
+#include <bits/socket.h>
+#endif
 
 #define SOCKET_MAX_FDS 16
 
@@ -54,6 +58,8 @@ qio_channel_socket_new(void)
 
     sioc = QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
     sioc->fd = -1;
+    sioc->zero_copy_queued = 0;
+    sioc->zero_copy_sent = 0;
 
     ioc = QIO_CHANNEL(sioc);
     qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
@@ -153,6 +159,16 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
         return -1;
     }
 
+#ifdef CONFIG_LINUX
+    int ret, v = 1;
+    ret = setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
+    if (ret == 0) {
+        /* Zero copy available on host */
+        qio_channel_set_feature(QIO_CHANNEL(ioc),
+                                QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY);
+    }
+#endif
+
     return 0;
 }
 
@@ -533,6 +549,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
     char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];
     size_t fdsize = sizeof(int) * nfds;
     struct cmsghdr *cmsg;
+    int sflags = 0;
 
     memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
 
@@ -557,15 +574,27 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
         memcpy(CMSG_DATA(cmsg), fds, fdsize);
     }
 
+    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
+        sflags = MSG_ZEROCOPY;
+    }
+
  retry:
-    ret = sendmsg(sioc->fd, &msg, 0);
+    ret = sendmsg(sioc->fd, &msg, sflags);
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
+            if (sflags & MSG_ZEROCOPY) {
+                error_setg_errno(errp, errno,
+                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
+                return -1;
+            }
+            break;
         }
+
         error_setg_errno(errp, errno,
                          "Unable to write to socket");
         return -1;
@@ -659,6 +688,74 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
 }
 #endif /* WIN32 */
 
+
+#ifdef CONFIG_LINUX
+static int qio_channel_socket_flush(QIOChannel *ioc,
+                                    Error **errp)
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
@@ -789,6 +886,9 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
     ioc_klass->io_set_delay = qio_channel_socket_set_delay;
     ioc_klass->io_create_watch = qio_channel_socket_create_watch;
     ioc_klass->io_set_aio_fd_handler = qio_channel_socket_set_aio_fd_handler;
+#ifdef CONFIG_LINUX
+    ioc_klass->io_flush = qio_channel_socket_flush;
+#endif
 }
 
 static const TypeInfo qio_channel_socket_info = {
-- 
2.36.0


