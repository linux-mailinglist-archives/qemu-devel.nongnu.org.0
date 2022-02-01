Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D6F4A5764
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 07:56:03 +0100 (CET)
Received: from localhost ([::1]:36468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEn57-0006cI-Gz
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 01:56:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEmg1-0003D6-Bi
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:30:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEmfu-0006ZZ-Rt
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643696998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dn99Mnb5I9sYceQ+hc1e1JkyjO/jqGS1k9CFTPCCIMk=;
 b=iHdayhv2outnTFWo37i8cgpW/jQ6jfAkrMZNkn6ZlTOfkXrS3Q7eqASrH4t9TLaBD+G261
 Kz77KNEqoBcEwjP2oVCxbX+KbhgFWfvkch5qUX76XpkjQGtqDGwIw2D9Sr/BEWf54mC4ah
 WXvGTvRTSatejacJSfRWFYSG4e+hkLs=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-HkE_hmFXP8iDzn5JjNTV3A-1; Tue, 01 Feb 2022 01:29:57 -0500
X-MC-Unique: HkE_hmFXP8iDzn5JjNTV3A-1
Received: by mail-oo1-f70.google.com with SMTP id
 e6-20020a4ab146000000b002df82c0ed9aso6158212ooo.21
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 22:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dn99Mnb5I9sYceQ+hc1e1JkyjO/jqGS1k9CFTPCCIMk=;
 b=YGJLqKczGPDHbd0ZIk227t3EdMDPZDa+zhroXNUhP+5eCnwDNMnUFoUE2fGG6h1vAp
 DuGv2Pxm/bwBh9g0ZT9SBE3HLoYDpivPp8HVqqPut4l1XRvequxTsqRjCB+xQ1i+OKeC
 McKP7pn4SAyQ4GPYIq7r7QbYHGDNBKqVudSw8/UljSo+CtVh+RtFhpGf0F2QCq356ORu
 VFk18Tnyc9cKazVLvKv+00smpU/fob2cd4i1W8gaq2BYfbdoKDxJCSB1O/Nf30sZTx5w
 DSFSptkurw18QwQzPjJxofr+nmuzm59+Au2v2aMc5h5VJHsTm0wYq1lXlpHsq8EJZ9aQ
 3M0A==
X-Gm-Message-State: AOAM532OBmlL8x0+uLXz2U9zbCSRlDf+9jkcCnjrBGcJkC57lCSDWH+T
 53kS5KISW3Q5fbnY4vqX4pXKq9vkXBbEO39/RfRPe7dVq3j82PxABqb5knXujNiajbeIcUj0EUf
 XuUawbfGGDMlBIiA=
X-Received: by 2002:a54:4803:: with SMTP id j3mr318018oij.279.1643696996231;
 Mon, 31 Jan 2022 22:29:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIMCt5ngDc6bg9+mUG5nscj4lcgWiiG1m3jXORfjyicn8neZIkM+KnpLsHOPUYZrXv33p6Lw==
X-Received: by 2002:a54:4803:: with SMTP id j3mr318007oij.279.1643696996050;
 Mon, 31 Jan 2022 22:29:56 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f1:95e9:6da1:67bd:fdc3:e12e])
 by smtp.gmail.com with ESMTPSA id l14sm14424720ooq.12.2022.01.31.22.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 22:29:55 -0800 (PST)
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
Subject: [PATCH v8 2/5] QIOChannelSocket: Implement io_writev zero copy flag &
 io_flush for CONFIG_LINUX
Date: Tue,  1 Feb 2022 03:29:00 -0300
Message-Id: <20220201062901.428838-3-leobras@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201062901.428838-1-leobras@redhat.com>
References: <20220201062901.428838-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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
index b2d254ef8d..155a0a2ada 100644
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
 
@@ -534,6 +550,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
     char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];
     size_t fdsize = sizeof(int) * nfds;
     struct cmsghdr *cmsg;
+    int sflags = 0;
 
     memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
 
@@ -558,15 +575,27 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
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
@@ -660,6 +689,74 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
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
@@ -790,6 +887,9 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
     ioc_klass->io_set_delay = qio_channel_socket_set_delay;
     ioc_klass->io_create_watch = qio_channel_socket_create_watch;
     ioc_klass->io_set_aio_fd_handler = qio_channel_socket_set_aio_fd_handler;
+#ifdef CONFIG_LINUX
+    ioc_klass->io_flush = qio_channel_socket_flush;
+#endif
 }
 
 static const TypeInfo qio_channel_socket_info = {
-- 
2.34.1


