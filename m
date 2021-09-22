Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0836414119
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 07:10:32 +0200 (CEST)
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuWd-0002Em-RT
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 01:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mSuPr-0002EM-EF
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 01:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mSuPp-000515-8J
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 01:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632287008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBBc7NS+1v1rGmaFetuIDC5Y33W5aFRudDBZJSLPg9Q=;
 b=jFY13hvumS5KIS2PQWIfq+ep7yghhFAEOVvc+ztcWLchfVIyze8cxROC60Dw7I4fbP3huh
 DGu3zrN0LpV6XJp5d3UKEY+qoj3QWm0861zMo8vjsz0+azjS9WmvDBngkZNwP046hZxy4t
 iVKzMjgxKTTlOKaG75S8xAb40dBzbM0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-psWQw1dCNBKU4LNxaK94CA-1; Wed, 22 Sep 2021 01:03:24 -0400
X-MC-Unique: psWQw1dCNBKU4LNxaK94CA-1
Received: by mail-qv1-f71.google.com with SMTP id
 h9-20020a05621413a900b0037a2d3eaf8fso9592991qvz.8
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 22:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBBc7NS+1v1rGmaFetuIDC5Y33W5aFRudDBZJSLPg9Q=;
 b=hpZgjmR+hl45e91ixur8avXHczVJv+g8eqgcNbV7/CzLenvJ6ftjmKnQLNpm9jUPhR
 UCnqVV7PA6OWr3pE5mfTEKO7wX/IYZfY+/wsL0XvKjW9F/60HGWSIiKRbpYSYShRTYYT
 6bguA16vrrYK6Ikmy/QTY2P9F5BzEeQP/uJB6JrZ05FawnenhP2bEZaMAC6BXiwrwsI/
 5YAQuDq7Zmdmoy4ajnnnte4zPD7GU2FTD1zwAmKF2njaf4B7Elwx0uKtaELsT6sNAqRs
 Gvnzr/AIICZieBVR1PjDaEv1gbV5OO3XLbfotuzB5ZmJnZxvZE0uPQagK/z9I4jK2YKr
 2jrg==
X-Gm-Message-State: AOAM531kGTQdsh0mZf6SGjQMTeSo7L/8KWdCg8cSrSIg+acDNTV7d4gG
 j8Kq3OViAt+f69WZVYnfdkRvw/+BJ0SaoZU2Jo/CQQHDEA7vaLJr2ir7KvkZOf9aUY+0QLyj3KG
 yZ/J9bfK30RvJklo=
X-Received: by 2002:ae9:d613:: with SMTP id r19mr29438682qkk.180.1632287003786; 
 Tue, 21 Sep 2021 22:03:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/NBIvc3Zm3F0GRgW27xuq8dS7+9S5y4udrBjKOHQA1/+3ziErgJvyS9g0QH/6JAb3P51eTw==
X-Received: by 2002:ae9:d613:: with SMTP id r19mr29438663qkk.180.1632287003550; 
 Tue, 21 Sep 2021 22:03:23 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:e5d7:bbae:108a:d2ca:1c18])
 by smtp.gmail.com with ESMTPSA id q192sm926675qka.93.2021.09.21.22.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 22:03:23 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 2/3] QIOChannelSocket: Implement io_async_write &
 io_async_flush
Date: Wed, 22 Sep 2021 02:03:39 -0300
Message-Id: <20210922050340.614781-3-leobras@redhat.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922050340.614781-1-leobras@redhat.com>
References: <20210922050340.614781-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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

Implement the new optional callbacks io_async_write and io_async_flush on
QIOChannelSocket, but enables it only when MSG_ZEROCOPY feature is
available in the host kernel, and TCP sockets are used.

qio_channel_socket_writev() contents were moved to a helper function
__qio_channel_socket_writev() which accepts an extra 'flag' argument.
This helper function is used to implement qio_channel_socket_writev(), with
flags = 0, keeping it's behavior unchanged, and
qio_channel_socket_async_writev() with flags = MSG_ZEROCOPY.

qio_channel_socket_async_flush() was implemented by reading the socket's error
queue, which will have information on MSG_ZEROCOPY send completion.
There is no need to worry with re-sending packets in case any error happens, as
MSG_ZEROCOPY only works with TCP and it will re-tranmsmit if any error ocurs.

Notes on using async_write():
- As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
some caution is necessary to avoid overwriting any buffer before it's sent.
If something like this happen, a newer version of the buffer may be sent instead.
- If this is a problem, it's recommended to use async_flush() before freeing or
re-using the buffer.
										.
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/io/channel-socket.h |   2 +
 io/channel-socket.c         | 145 ++++++++++++++++++++++++++++++++++--
 2 files changed, 140 insertions(+), 7 deletions(-)

diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index e747e63514..4d1be0637a 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -47,6 +47,8 @@ struct QIOChannelSocket {
     socklen_t localAddrLen;
     struct sockaddr_storage remoteAddr;
     socklen_t remoteAddrLen;
+    ssize_t async_queued;
+    ssize_t async_sent;
 };
 
 
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 606ec97cf7..128fab4cd2 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -26,9 +26,23 @@
 #include "io/channel-watch.h"
 #include "trace.h"
 #include "qapi/clone-visitor.h"
+#ifdef CONFIG_LINUX
+#include <linux/errqueue.h>
+#include <poll.h>
+#endif
 
 #define SOCKET_MAX_FDS 16
 
+static ssize_t qio_channel_socket_async_writev(QIOChannel *ioc,
+                                               const struct iovec *iov,
+                                               size_t niov,
+                                               int *fds,
+                                               size_t nfds,
+                                               Error **errp);
+
+static void qio_channel_socket_async_flush(QIOChannel *ioc,
+                                           Error **errp);
+
 SocketAddress *
 qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
                                      Error **errp)
@@ -55,6 +69,8 @@ qio_channel_socket_new(void)
 
     sioc = QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
     sioc->fd = -1;
+    sioc->async_queued = 0;
+    sioc->async_sent = 0;
 
     ioc = QIO_CHANNEL(sioc);
     qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
@@ -140,6 +156,7 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
                                     Error **errp)
 {
     int fd;
+    int ret, v = 1;
 
     trace_qio_channel_socket_connect_sync(ioc, addr);
     fd = socket_connect(addr, errp);
@@ -154,6 +171,19 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
         return -1;
     }
 
+#ifdef CONFIG_LINUX
+    if (addr->type != SOCKET_ADDRESS_TYPE_INET) {
+        return 0;
+    }
+
+    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
+    if (ret >= 0) {
+        QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+        klass->io_async_writev = qio_channel_socket_async_writev;
+        klass->io_async_flush = qio_channel_socket_async_flush;
+    }
+#endif
+
     return 0;
 }
 
@@ -520,12 +550,13 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
     return ret;
 }
 
-static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
-                                         const struct iovec *iov,
-                                         size_t niov,
-                                         int *fds,
-                                         size_t nfds,
-                                         Error **errp)
+static ssize_t __qio_channel_socket_writev(QIOChannel *ioc,
+                                           const struct iovec *iov,
+                                           size_t niov,
+                                           int *fds,
+                                           size_t nfds,
+                                           int flags,
+                                           Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
     ssize_t ret;
@@ -558,7 +589,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
     }
 
  retry:
-    ret = sendmsg(sioc->fd, &msg, 0);
+    ret = sendmsg(sioc->fd, &msg, flags);
     if (ret <= 0) {
         if (errno == EAGAIN) {
             return QIO_CHANNEL_ERR_BLOCK;
@@ -572,6 +603,106 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
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
+    return __qio_channel_socket_writev(ioc, iov, niov, fds, nfds, 0, errp);
+}
+
+static ssize_t qio_channel_socket_async_writev(QIOChannel *ioc,
+                                               const struct iovec *iov,
+                                               size_t niov,
+                                               int *fds,
+                                               size_t nfds,
+                                               Error **errp)
+{
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
+
+    sioc->async_queued++;
+
+    return __qio_channel_socket_writev(ioc, iov, niov, fds, nfds, MSG_ZEROCOPY,
+                                       errp);
+}
+
+
+static void qio_channel_socket_async_flush(QIOChannel *ioc,
+                                           Error **errp)
+{
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
+    struct msghdr msg = {};
+    struct pollfd pfd;
+    struct sock_extended_err *serr;
+    struct cmsghdr *cm;
+    char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];
+    int ret;
+
+    memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
+    msg.msg_control = control;
+    msg.msg_controllen = sizeof(control);
+
+    while (sioc->async_sent < sioc->async_queued) {
+        ret = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
+        if (ret < 0) {
+            if (errno == EAGAIN) {
+                /* Nothing on errqueue, wait */
+                pfd.fd = sioc->fd;
+                pfd.events = 0;
+                ret = poll(&pfd, 1, 250);
+                if (ret == 0) {
+                    /*
+                     * Timeout : After 250ms without receiving any zerocopy
+                     * notification, consider all data as sent.
+                     */
+                    break;
+                } else if (ret < 0 ||
+                           (pfd.revents & (POLLERR | POLLHUP | POLLNVAL))) {
+                    error_setg_errno(errp, errno,
+                                     "Poll error");
+                    break;
+                } else {
+                    continue;
+                }
+            }
+            if (errno == EINTR) {
+                continue;
+            }
+
+            error_setg_errno(errp, errno,
+                             "Unable to read errqueue");
+            break;
+        }
+
+        cm = CMSG_FIRSTHDR(&msg);
+        if (cm->cmsg_level != SOL_IP &&
+            cm->cmsg_type != IP_RECVERR) {
+            error_setg_errno(errp, EPROTOTYPE,
+                             "Wrong cmsg in errqueue");
+            break;
+        }
+
+        serr = (void *) CMSG_DATA(cm);
+        if (serr->ee_errno != SO_EE_ORIGIN_NONE) {
+            error_setg_errno(errp, serr->ee_errno,
+                             "Error on socket");
+            break;
+        }
+        if (serr->ee_origin != SO_EE_ORIGIN_ZEROCOPY) {
+            error_setg_errno(errp, serr->ee_origin,
+                             "Error not from zerocopy");
+            break;
+        }
+
+        /* No errors, count sent ids*/
+        sioc->async_sent += serr->ee_data - serr->ee_info + 1;
+    }
+}
+
+
 #else /* WIN32 */
 static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         const struct iovec *iov,
-- 
2.33.0


