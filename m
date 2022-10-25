Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC64B60C2D3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 06:52:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onBsJ-0005ez-0i; Tue, 25 Oct 2022 00:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onBsG-0005eN-IK
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:49:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onBsE-0002s5-Hk
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666673349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7iPjMq/JvcMVsM+ntRdGNw+Hdegb7Umm62J5du1TI0k=;
 b=XNMHB5kdmZAptXgqxYb4jsWYeKslSylFLva8LADD9DMZ651DDUZjirpcSckCI3EDpNIT57
 VxnYc2SD60/jqgfLQbNQJsUt6BYRLRqaE4JetAgpb/c8EWRW2hcNQ81qyI/yfUttEw91xL
 AbhNhCQwGU8kjaY78/wO4DBGYQMO7aE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-NGh_VbVSPpekpVwBwqy7Gw-1; Tue, 25 Oct 2022 00:47:55 -0400
X-MC-Unique: NGh_VbVSPpekpVwBwqy7Gw-1
Received: by mail-qv1-f69.google.com with SMTP id
 ln3-20020a0562145a8300b004b8c29a7d50so6413517qvb.15
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 21:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7iPjMq/JvcMVsM+ntRdGNw+Hdegb7Umm62J5du1TI0k=;
 b=SKBWt9jD/O/zg1xDyjBUykjFgbxDIeBr2jql20e1kGX4SuXQtWBJJBFq7WQSOnY+DP
 AAa2UxeEeVfEz9R26XULv0gTIa101/P9RFgrcQB1NnFUnJVBaa7QK8+4+5OzKYqXg+rJ
 zdLaIR77Qy9md5ytppcVvZnCivKV6dO7ptJ0P3e9g/U3mewJV/0czYODwDl790Ct+9Zp
 ysinF+w+yCq2RaIlJrXW41dd2Gs/jcZsuN9yq673v+EjniU+XwR/6GifDG5wVpTtq+yY
 cEiklAjLFRqt4kZ/y+ygxN4mdUWuHrNbLw4kpbqLj1Vxng2zWqoC8+mgXJS5IKEBGwso
 mHxw==
X-Gm-Message-State: ACrzQf3RfYGRCNsejSdczvtGFDUG7KaODSHmM83isqnSKRwm2uNyJtoZ
 xWnmi54IsuvkzKtDJDx6LCwRCQJind2ggYbvrok8x5TJGFHBi5qw+oU9AmkyLNZtSAMpBqayWHM
 5LmoUkYSg4PHlxi8=
X-Received: by 2002:ac8:7d8c:0:b0:39c:f4b6:f02f with SMTP id
 c12-20020ac87d8c000000b0039cf4b6f02fmr29582523qtd.252.1666673275081; 
 Mon, 24 Oct 2022 21:47:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7OTW5TYwa9+KPcJWFVJfNUZ31pDFhYVOLaQSYR9l8IM7uEt3+ifp700af46vHpz587vZQIiw==
X-Received: by 2002:ac8:7d8c:0:b0:39c:f4b6:f02f with SMTP id
 c12-20020ac87d8c000000b0039cf4b6f02fmr29582514qtd.252.1666673274879; 
 Mon, 24 Oct 2022 21:47:54 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:1b3:a801:de5e:6447:4a67:eb7c:b690])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a05620a141700b006cbcdc6efedsm1350968qkj.41.2022.10.24.21.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 21:47:54 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 3/4] QIOChannel: Add max_pending parameter to
 qio_channel_flush()
Date: Tue, 25 Oct 2022 01:47:30 -0300
Message-Id: <20221025044730.319941-4-leobras@redhat.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221025044730.319941-1-leobras@redhat.com>
References: <20221025044730.319941-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Zero-copy write in Linux is an asynchronous type of write, meaning the send
process is not finished by the time the function returns. Since it's also
zero-copy, it means that incorrect data may be sent if the write buffer
gets modified after write returns.

To check if a zero-copy write is finished, qio_channel has implemented a
flush operation: qio_channel_flush(). As of today, by the time the flush
returns, user code knows for sure all previous zero-copy write have
finished, and it's safe to modify any write buffer.

While this kind of flush is necessary, it may take a while to flush if
there has been a write recently, as the OS has to wait for everything to be
sent before returning and allowing reuse / free of the write buffers.

An option that can improve performance in some scenarios is to modify flush
so it guarantees less than N zero-copy writes are pending, allowing some of
the write buffers to be reused. This allows flush to return much faster,
since it does not need to wait for the more recent writes to complete.

If (N == 0), then it replicates the previous flushing behavior.

Add max_pending parameter to qio_channel_flush() so caller can decide
what is the maximum number of pending writes remaining before the function
returns. Also, implement this change in qio_channel_socket_flush().

Change current calls of qio_channel_flush() so (max_pending == 0), and the
flush-all behavior is maintained.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/io/channel.h | 7 +++++--
 io/channel-socket.c  | 5 +++--
 io/channel.c         | 5 +++--
 migration/multifd.c  | 2 +-
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee7480..9ec1978a26 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -141,6 +141,7 @@ struct QIOChannelClass {
                                   IOHandler *io_write,
                                   void *opaque);
     int (*io_flush)(QIOChannel *ioc,
+                    int max_pending,
                     Error **errp);
 };
 
@@ -875,11 +876,12 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
 /**
  * qio_channel_flush:
  * @ioc: the channel object
+ * @max_pending: Maximum remaining writes allowed in queue upon returning
  * @errp: pointer to a NULL-initialized error object
  *
- * Will block until every packet queued with
+ * Will block until there are at most max_pending writes called with
  * qio_channel_writev_full() + QIO_CHANNEL_WRITE_FLAG_ZERO_COPY
- * is sent, or return in case of any error.
+ * pending, or return in case of any error.
  *
  * If not implemented, acts as a no-op, and returns 0.
  *
@@ -889,6 +891,7 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
  */
 
 int qio_channel_flush(QIOChannel *ioc,
+                      int max_pending,
                       Error **errp);
 
 #endif /* QIO_CHANNEL_H */
diff --git a/io/channel-socket.c b/io/channel-socket.c
index b76dca9cc1..3d0c2b8a14 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -708,6 +708,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
 
 #ifdef QEMU_MSG_ZEROCOPY
 static int qio_channel_socket_flush(QIOChannel *ioc,
+                                    int max_pending,
                                     Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
@@ -718,7 +719,7 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
     int received;
     int ret;
 
-    if (sioc->zero_copy_queued == sioc->zero_copy_sent) {
+    if (sioc->zero_copy_queued - sioc->zero_copy_sent <= max_pending) {
         return 0;
     }
 
@@ -728,7 +729,7 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
 
     ret = 1;
 
-    while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
+    while (sioc->zero_copy_queued - sioc->zero_copy_sent > max_pending) {
         received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
         if (received < 0) {
             switch (errno) {
diff --git a/io/channel.c b/io/channel.c
index 0640941ac5..9d9f15af50 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -490,7 +490,8 @@ off_t qio_channel_io_seek(QIOChannel *ioc,
 }
 
 int qio_channel_flush(QIOChannel *ioc,
-                                Error **errp)
+                      int max_pending,
+                      Error **errp)
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
 
@@ -499,7 +500,7 @@ int qio_channel_flush(QIOChannel *ioc,
         return 0;
     }
 
-    return klass->io_flush(ioc, errp);
+    return klass->io_flush(ioc, max_pending, errp);
 }
 
 
diff --git a/migration/multifd.c b/migration/multifd.c
index aa18c47141..c5d1f911a4 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -574,7 +574,7 @@ static int multifd_zero_copy_flush(QIOChannel *c)
     int ret;
     Error *err = NULL;
 
-    ret = qio_channel_flush(c, &err);
+    ret = qio_channel_flush(c, 0, &err);
     if (ret < 0) {
         error_report_err(err);
         return -1;
-- 
2.38.0


