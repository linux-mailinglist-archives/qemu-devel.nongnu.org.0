Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C986346E5B8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:41:39 +0100 (CET)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvFvm-0002g7-HU
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:41:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFuN-0000Ry-MB
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFuF-0008F7-IL
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639042802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5uLRbBkiDpEe+yiA6KOcwWWhtKLg/uvMiC1IBwEoqE=;
 b=MqAReemo6iZXKIzPlVG3mYSLTuH9IjEFf2NjZFw+y6KZEkclY7Q60QWC6ef12bymHiVjT+
 IRlkQx1ZI/Sz+7aLmvNiCIYvkMv36AO/9BLZYSZjp0cg0CfoXtm2YgnpcM+znP9O2V9qJa
 LtrTadwarDolYLWi4gfSrIaYdD5jr7I=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-GUm8iVjHOjqqK60UvBuvag-1; Thu, 09 Dec 2021 04:40:01 -0500
X-MC-Unique: GUm8iVjHOjqqK60UvBuvag-1
Received: by mail-ua1-f71.google.com with SMTP id
 y21-20020ab025d5000000b002d3ca52eab5so3305041uan.22
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 01:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5uLRbBkiDpEe+yiA6KOcwWWhtKLg/uvMiC1IBwEoqE=;
 b=5xbW142X/KCY9CKxjXeTFabB8s2wp7D3ijDtWmj9qvuGo9bgkn5n4I0KU3dSL6HPe5
 sOfelbSX7EdGSpvAbpQTcqzTYS4ZyouZ7QkCVckm5iXmHyVDkRZRZ36EUXyhJHWi3FPh
 DP9Uep+iPuNtBtLKm8jBjfYq+9wVeaj0rC9Lq1baNbw3UGtdDpv9MoMA9P0sSpU+glOm
 GQMwmMMPu+vvX60zGvh0QHKFdC19H4N96K/y1cm/T9HSaZa1RGfFPHGkLEEKd4QXjyiG
 gmXOWxg3mkKAHCwKtOCPI5G76sFfjXY4ncMpe+2vZezUBcDAP7J5QoxHskxxsjBLowrG
 vWfw==
X-Gm-Message-State: AOAM533RShLVQRnlVNNWQ6WFM9VEkapuB6tmJ+GTRqZuUk4k18fMg7Qm
 FBEzjMF/omC8w7Q1SRA+EIPUS/mlKgNH3PmsZbz5OEizeM+udXOVpwDbXoBLG2ifCtF5pxY5QtV
 l9+4EVXFulRlAaSI=
X-Received: by 2002:ab0:6f0a:: with SMTP id r10mr18024966uah.106.1639042800567; 
 Thu, 09 Dec 2021 01:40:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOwehyTGYxxKzjKN279c5byQG31/Eij+jLr/kdN1/jrxmL+gNwC6Z0y87AS/UGjcMoeg8SGQ==
X-Received: by 2002:ab0:6f0a:: with SMTP id r10mr18024917uah.106.1639042800244; 
 Thu, 09 Dec 2021 01:40:00 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:dadb:5bd9:f52:7a4a:a8af])
 by smtp.gmail.com with ESMTPSA id s22sm3460215vkm.28.2021.12.09.01.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 01:39:59 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 1/6] QIOChannel: Add io_writev_zero_copy &
 io_flush_zero_copy callbacks
Date: Thu,  9 Dec 2021 06:39:19 -0300
Message-Id: <20211209093923.1293701-2-leobras@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
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

Adds io_writev_zero_copy and io_flush_zero_copy as optional callback to QIOChannelClass,
allowing the implementation of zero copy writes by subclasses.

How to use them:
- Write data using qio_channel_writev_zero_copy(),
- Wait write completion with qio_channel_flush_zero_copy().

Notes:
As some zero copy implementations work asynchronously, it's
recommended to keep the write buffer untouched until the return of
qio_channel_flush_zero_copy(), to avoid the risk of sending an updated
buffer instead of the one at the write.

As the new callbacks are optional, if a subclass does not implement them, then:
- io_writev_zero_copy will return -1,
- io_flush_zero_copy will return 0 without changing anything.

Also, some functions like qio_channel_writev_full_all() were adapted to
receive a flag parameter. That allows shared code between zero copy and
non-zero copy writev, and also an easier implementation on new flags.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/io/channel.h | 98 +++++++++++++++++++++++++++++++++++++++-----
 io/channel.c         | 66 +++++++++++++++++++++++------
 2 files changed, 142 insertions(+), 22 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 88988979f8..83fa970a19 100644
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
 
 
@@ -136,6 +139,12 @@ struct QIOChannelClass {
                                   IOHandler *io_read,
                                   IOHandler *io_write,
                                   void *opaque);
+    ssize_t (*io_writev_zero_copy)(QIOChannel *ioc,
+                                   const struct iovec *iov,
+                                   size_t niov,
+                                   Error **errp);
+    int (*io_flush_zero_copy)(QIOChannel *ioc,
+                              Error **errp);
 };
 
 /* General I/O handling functions */
@@ -321,10 +330,11 @@ int qio_channel_readv_all(QIOChannel *ioc,
 
 
 /**
- * qio_channel_writev_all:
+ * qio_channel_writev_all_flags:
  * @ioc: the channel object
  * @iov: the array of memory regions to write data from
  * @niov: the length of the @iov array
+ * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  * Write data to the IO channel, reading it from the
@@ -337,12 +347,23 @@ int qio_channel_readv_all(QIOChannel *ioc,
  * to be written, yielding from the current coroutine
  * if required.
  *
+ * If QIO_CHANNEL_WRITE_FLAG_ZERO_COPY is passed in flags,
+ * instead of waiting for all requested data to be written,
+ * this function will wait until it's all queued for writing.
+ * In this case, if the buffer gets changed between queueing and
+ * sending, the updated buffer will be sent. If this is not a
+ * desired behavior, it's suggested to call qio_channel_flush_zero_copy()
+ * before reusing the buffer.
+ *
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
+#define qio_channel_writev_all(ioc, iov, niov, errp) \
+    qio_channel_writev_all_flags(ioc, iov, niov, 0, errp)
 
 /**
  * qio_channel_readv:
@@ -831,12 +852,13 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
                                Error **errp);
 
 /**
- * qio_channel_writev_full_all:
+ * qio_channel_writev_full_all_flags:
  * @ioc: the channel object
  * @iov: the array of memory regions to write data from
  * @niov: the length of the @iov array
  * @fds: an array of file handles to send
  * @nfds: number of file handles in @fds
+ * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  *
@@ -846,13 +868,69 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
  * to be written, yielding from the current coroutine
  * if required.
  *
+ * If QIO_CHANNEL_WRITE_FLAG_ZERO_COPY is passed in flags,
+ * instead of waiting for all requested data to be written,
+ * this function will wait until it's all queued for writing.
+ * In this case, if the buffer gets changed between queueing and
+ * sending, the updated buffer will be sent. If this is not a
+ * desired behavior, it's suggested to call qio_channel_flush_zero_copy()
+ * before reusing the buffer.
+ *
  * Returns: 0 if all bytes were written, or -1 on error
  */
 
-int qio_channel_writev_full_all(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds, size_t nfds,
+int qio_channel_writev_full_all_flags(QIOChannel *ioc,
+                                      const struct iovec *iov,
+                                      size_t niov,
+                                      int *fds, size_t nfds,
+                                      int flags, Error **errp);
+#define qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, errp) \
+    qio_channel_writev_full_all_flags(ioc, iov, niov, fds, nfds, 0, errp)
+
+/**
+ * qio_channel_writev_zero_copy:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to write data from
+ * @niov: the length of the @iov array
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Behaves like qio_channel_writev, but may write
+ * data asynchronously while avoiding unnecessary data copy.
+ * This function may return before any data is actually written,
+ * but will queue every buffer for writing.
+ *
+ * Some implementations require the buffer region to be locked,
+ * so if there is not enough locked memory available to the process
+ * this function will fail.
+ *
+ * If at some point it's necessary to wait for all data to be
+ * written, use qio_channel_flush_zero_copy().
+ *
+ * If zero copy is not available, returns -1 and set errp.
+ */
+
+ssize_t qio_channel_writev_zero_copy(QIOChannel *ioc,
+                                     const struct iovec *iov,
+                                     size_t niov,
+                                     Error **errp);
+
+/**
+ * qio_channel_flush_zero_copy:
+ * @ioc: the channel object
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Will block until every packet queued with
+ * qio_channel_writev_zero_copy() is sent, or return
+ * in case of any error.
+ *
+ * If not implemented, acts as a no-op, and returns 0.
+ *
+ * Returns -1 if any error is found,
+ *          1 if every send failed to use zero copy.
+ *          0 otherwise.
+ */
+
+int qio_channel_flush_zero_copy(QIOChannel *ioc,
                                 Error **errp);
 
 #endif /* QIO_CHANNEL_H */
diff --git a/io/channel.c b/io/channel.c
index e8b019dc36..d04a6772c8 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -212,19 +212,21 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
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
+    return qio_channel_writev_full_all_flags(ioc, iov, niov, NULL, 0, flags,
+                                             errp);
 }
 
-int qio_channel_writev_full_all(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds, size_t nfds,
-                                Error **errp)
+int qio_channel_writev_full_all_flags(QIOChannel *ioc,
+                                      const struct iovec *iov,
+                                      size_t niov,
+                                      int *fds, size_t nfds,
+                                      int flags, Error **errp)
 {
     int ret = -1;
     struct iovec *local_iov = g_new(struct iovec, niov);
@@ -237,8 +239,16 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
 
     while (nlocal_iov > 0) {
         ssize_t len;
-        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
-                                      errp);
+
+        if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
+            assert(fds == NULL && nfds == 0);
+            len = qio_channel_writev_zero_copy(ioc, local_iov, nlocal_iov,
+                                               errp);
+        } else {
+            len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
+                                          errp);
+        }
+
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_OUT);
@@ -474,6 +484,38 @@ off_t qio_channel_io_seek(QIOChannel *ioc,
 }
 
 
+ssize_t qio_channel_writev_zero_copy(QIOChannel *ioc,
+                                     const struct iovec *iov,
+                                     size_t niov,
+                                     Error **errp)
+{
+    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (!klass->io_writev_zero_copy ||
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
+        error_setg_errno(errp, EINVAL,
+                         "Channel does not support zero copy writev");
+        return -1;
+    }
+
+    return klass->io_writev_zero_copy(ioc, iov, niov, errp);
+}
+
+
+int qio_channel_flush_zero_copy(QIOChannel *ioc,
+                                Error **errp)
+{
+    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (!klass->io_flush_zero_copy ||
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
+        return 0;
+    }
+
+    return klass->io_flush_zero_copy(ioc, errp);
+}
+
+
 static void qio_channel_restart_read(void *opaque)
 {
     QIOChannel *ioc = opaque;
-- 
2.33.1


