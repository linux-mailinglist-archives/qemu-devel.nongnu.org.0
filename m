Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EA23FC5CD
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 13:08:43 +0200 (CEST)
Received: from localhost ([::1]:41936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL1dC-0005zW-7p
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 07:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mL1Xl-0007ar-Qm
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 07:03:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mL1Xi-00065y-Mm
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 07:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630407780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qf+JzssxEE9yG13C3qfTX97W4H2Wo3wnCSNu5tgoBAY=;
 b=VD0eCK1WyLGRKACPeLAHQM7xLKNiGiPbkOEkBKCU7/95UI8lyMczrRKvGd+dH9ssnnkjvL
 yXGUVLJYwLbHP/aZfdPVzkYAwhMJD9N5Ee18FJU46lgZLDP3t7XFPKdTyCIeexeN0ak6Bf
 Ujy2rOxYHBYeOP/Q0lpgFLJ3mKpvZJQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-Z6ECsye3ONWp0B-B4mM4BQ-1; Tue, 31 Aug 2021 07:02:57 -0400
X-MC-Unique: Z6ECsye3ONWp0B-B4mM4BQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 p21-20020ac846150000b02902982d999bfbso478274qtn.7
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 04:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qf+JzssxEE9yG13C3qfTX97W4H2Wo3wnCSNu5tgoBAY=;
 b=gZb+4mtK0h0Zw4YkERRurx0YvSAj3M+QCecsz/CC60h5EVdlojCFzpcO13Sf5WX/I6
 eNiDelqk80Yu6bZxKjG8Y2cgw6+lOXmU+ybrdhe7bjZP/mjWN0gWas6x8/0ciC/7bna4
 l8ebv3sH8ZPMK5pu7DyA8gvdH+RW7AECZ2uHTw6qVMQPDTD38apDqOrNOgemp/x+zHRS
 6CLKK6RY7pKMBTQTsMKCyRW/vRr6q0D16BcFVUw8hgUIFvprb1EVWzwomkL7HeDjdAUT
 xptxjeA1deFsfIPNv0tlRukAyiI7QF1LPvtC4sNm4e4W75zeTerhc3D8EOxB+r35V+hs
 3ttw==
X-Gm-Message-State: AOAM532wu2cui2SkFemlRx5xUU0tzBHfnPi2vGN5lottNhS7tNbpD2v7
 WXbqpO1lpeRB5PXRfL8pKsdXyBeQMAMkvGXNNqT0Qlz+K9TDPZ0wMDCFgIhWx2vSke6zA6nUF8U
 8Kyo1JZuJMEitLV8=
X-Received: by 2002:a0c:f88f:: with SMTP id u15mr28127097qvn.38.1630407776853; 
 Tue, 31 Aug 2021 04:02:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg63XcujY0wqjCuJZJ2cXK/+40NM98x9E+L+FBOAIUd1V8+3dsXGpTmSmTfWPxHn8K+4rKvg==
X-Received: by 2002:a0c:f88f:: with SMTP id u15mr28127073qvn.38.1630407776635; 
 Tue, 31 Aug 2021 04:02:56 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f1:e948:8e69:9cd6:5512:12f4])
 by smtp.gmail.com with ESMTPSA id b25sm13315536qka.23.2021.08.31.04.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 04:02:56 -0700 (PDT)
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
Subject: [PATCH v1 2/3] io: Add zerocopy and errqueue
Date: Tue, 31 Aug 2021 08:02:38 -0300
Message-Id: <20210831110238.299458-3-leobras@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

MSG_ZEROCOPY is a feature that enables copy avoidance in TCP/UDP socket
send calls. It does so by avoiding copying user data into kernel buffers.

To make it work, three steps are needed:
1 - A setsockopt() system call, enabling SO_ZEROCOPY
2 - Passing down the MSG_ZEROCOPY flag for each send*() syscall
3 - Process the socket's error queue, dealing with any error

Zerocopy has it's costs, so it will only get improved performance if
the sending buffer is big (10KB, according to Linux docs).

The step 2 makes it possible to use the same socket to send data
using both zerocopy and the default copying approach, so the application
cat choose what is best for each packet.

To implement step 1, an optional set_zerocopy() interface was created
in QIOChannel, allowing each using code to enable or disable it.

Step 2 will be enabled by the using code at each qio_channel_write*()
that would benefit of zerocopy;

Step 3 is done with qio_channel_socket_errq_proc(), that runs after
SOCKET_ERRQ_THRESH (16k) iovs sent, dealing with any error found.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/io/channel-socket.h |  2 +
 include/io/channel.h        | 29 ++++++++++++++
 io/channel-socket.c         | 76 +++++++++++++++++++++++++++++++++++++
 io/channel-tls.c            | 11 ++++++
 io/channel-websock.c        |  9 +++++
 io/channel.c                | 11 ++++++
 6 files changed, 138 insertions(+)

diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index e747e63514..09dffe059f 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -47,6 +47,8 @@ struct QIOChannelSocket {
     socklen_t localAddrLen;
     struct sockaddr_storage remoteAddr;
     socklen_t remoteAddrLen;
+    size_t errq_pending;
+    bool zerocopy_enabled;
 };
 
 
diff --git a/include/io/channel.h b/include/io/channel.h
index dada9ebaaf..de10a78b10 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -137,6 +137,8 @@ struct QIOChannelClass {
                                   IOHandler *io_read,
                                   IOHandler *io_write,
                                   void *opaque);
+    void (*io_set_zerocopy)(QIOChannel *ioc,
+                            bool enabled);
 };
 
 /* General I/O handling functions */
@@ -570,6 +572,33 @@ int qio_channel_shutdown(QIOChannel *ioc,
 void qio_channel_set_delay(QIOChannel *ioc,
                            bool enabled);
 
+/**
+ * qio_channel_set_zerocopy:
+ * @ioc: the channel object
+ * @enabled: the new flag state
+ *
+ * Controls whether the underlying transport is
+ * permitted to use zerocopy to avoid copying the
+ * sending buffer in kernel. If @enabled is true, then the
+ * writes may avoid buffer copy in kernel. If @enabled
+ * is false, writes will cause the kernel to always
+ * copy the buffer contents before sending.
+ *
+ * In order to use make a write with zerocopy feature,
+ * it's also necessary to sent each packet with
+ * MSG_ZEROCOPY flag. With this, it's possible to
+ * to select only writes that would benefit from the
+ * use of zerocopy feature, i.e. the ones with larger
+ * buffers.
+ *
+ * This feature was added in Linux 4.14, so older
+ * versions will fail on enabling. This is not an
+ * issue, since it will fall-back to default copying
+ * approach.
+ */
+void qio_channel_set_zerocopy(QIOChannel *ioc,
+                              bool enabled);
+
 /**
  * qio_channel_set_cork:
  * @ioc: the channel object
diff --git a/io/channel-socket.c b/io/channel-socket.c
index e377e7303d..a69fec7315 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -26,8 +26,10 @@
 #include "io/channel-watch.h"
 #include "trace.h"
 #include "qapi/clone-visitor.h"
+#include <linux/errqueue.h>
 
 #define SOCKET_MAX_FDS 16
+#define SOCKET_ERRQ_THRESH 16384
 
 SocketAddress *
 qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
@@ -55,6 +57,8 @@ qio_channel_socket_new(void)
 
     sioc = QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
     sioc->fd = -1;
+    sioc->zerocopy_enabled = false;
+    sioc->errq_pending = 0;
 
     ioc = QIO_CHANNEL(sioc);
     qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
@@ -520,6 +524,54 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
     return ret;
 }
 
+static void qio_channel_socket_errq_proc(QIOChannelSocket *sioc,
+                                         Error **errp)
+{
+    int fd = sioc->fd;
+    int ret;
+    struct msghdr msg = {};
+    struct sock_extended_err *serr;
+    struct cmsghdr *cm;
+
+    do {
+        ret = recvmsg(fd, &msg, MSG_ERRQUEUE);
+        if (ret <= 0) {
+            if (ret == 0 || errno == EAGAIN) {
+                /* Nothing on errqueue */
+                 sioc->errq_pending = 0;
+                 break;
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
+        if (serr->ee_errno != 0) {
+            error_setg_errno(errp, serr->ee_errno,
+                             "Error on socket");
+            break;
+        }
+        if (serr->ee_origin != SO_EE_ORIGIN_ZEROCOPY) {
+            error_setg_errno(errp, serr->ee_origin,
+                             "Error not from zerocopy");
+            break;
+        }
+    } while (true);
+}
+
 static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
                                          const struct iovec *iov,
                                          size_t niov,
@@ -571,6 +623,14 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
                          "Unable to write to socket");
         return -1;
     }
+
+    if ((flags & MSG_ZEROCOPY) && sioc->zerocopy_enabled) {
+        sioc->errq_pending += niov;
+        if (sioc->errq_pending > SOCKET_ERRQ_THRESH) {
+            qio_channel_socket_errq_proc(sioc, errp);
+        }
+    }
+
     return ret;
 }
 #else /* WIN32 */
@@ -689,6 +749,21 @@ qio_channel_socket_set_delay(QIOChannel *ioc,
 }
 
 
+static void
+qio_channel_socket_set_zerocopy(QIOChannel *ioc,
+                                bool enabled)
+{
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
+    int v = enabled ? 1 : 0;
+    int ret;
+
+    ret = qemu_setsockopt(sioc->fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
+    if (ret >= 0) {
+        sioc->zerocopy_enabled = true;
+    }
+}
+
+
 static void
 qio_channel_socket_set_cork(QIOChannel *ioc,
                             bool enabled)
@@ -789,6 +864,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
     ioc_klass->io_set_delay = qio_channel_socket_set_delay;
     ioc_klass->io_create_watch = qio_channel_socket_create_watch;
     ioc_klass->io_set_aio_fd_handler = qio_channel_socket_set_aio_fd_handler;
+    ioc_klass->io_set_zerocopy = qio_channel_socket_set_zerocopy;
 }
 
 static const TypeInfo qio_channel_socket_info = {
diff --git a/io/channel-tls.c b/io/channel-tls.c
index 4ce890a538..bf44b0f7b0 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -350,6 +350,16 @@ static void qio_channel_tls_set_delay(QIOChannel *ioc,
     qio_channel_set_delay(tioc->master, enabled);
 }
 
+
+static void qio_channel_tls_set_zerocopy(QIOChannel *ioc,
+                                         bool enabled)
+{
+    QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
+
+    qio_channel_set_zerocopy(tioc->master, enabled);
+}
+
+
 static void qio_channel_tls_set_cork(QIOChannel *ioc,
                                      bool enabled)
 {
@@ -416,6 +426,7 @@ static void qio_channel_tls_class_init(ObjectClass *klass,
     ioc_klass->io_shutdown = qio_channel_tls_shutdown;
     ioc_klass->io_create_watch = qio_channel_tls_create_watch;
     ioc_klass->io_set_aio_fd_handler = qio_channel_tls_set_aio_fd_handler;
+    ioc_klass->io_set_zerocopy = qio_channel_tls_set_zerocopy;
 }
 
 static const TypeInfo qio_channel_tls_info = {
diff --git a/io/channel-websock.c b/io/channel-websock.c
index 035dd6075b..4e9491966b 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -1194,6 +1194,14 @@ static void qio_channel_websock_set_delay(QIOChannel *ioc,
     qio_channel_set_delay(tioc->master, enabled);
 }
 
+static void qio_channel_websock_set_zerocopy(QIOChannel *ioc,
+                                             bool enabled)
+{
+    QIOChannelWebsock *tioc = QIO_CHANNEL_WEBSOCK(ioc);
+
+    qio_channel_set_zerocopy(tioc->master, enabled);
+}
+
 static void qio_channel_websock_set_cork(QIOChannel *ioc,
                                          bool enabled)
 {
@@ -1318,6 +1326,7 @@ static void qio_channel_websock_class_init(ObjectClass *klass,
     ioc_klass->io_close = qio_channel_websock_close;
     ioc_klass->io_shutdown = qio_channel_websock_shutdown;
     ioc_klass->io_create_watch = qio_channel_websock_create_watch;
+    ioc_klass->io_set_zerocopy = qio_channel_websock_set_zerocopy;
 }
 
 static const TypeInfo qio_channel_websock_info = {
diff --git a/io/channel.c b/io/channel.c
index ee3cb83d4d..476440e8b2 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -450,6 +450,17 @@ void qio_channel_set_delay(QIOChannel *ioc,
 }
 
 
+void qio_channel_set_zerocopy(QIOChannel *ioc,
+                              bool enabled)
+{
+    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (klass->io_set_zerocopy) {
+        klass->io_set_zerocopy(ioc, enabled);
+    }
+}
+
+
 void qio_channel_set_cork(QIOChannel *ioc,
                           bool enabled)
 {
-- 
2.33.0


