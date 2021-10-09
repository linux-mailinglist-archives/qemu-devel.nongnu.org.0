Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724194277FE
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 09:58:41 +0200 (CEST)
Received: from localhost ([::1]:46054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZ7Fg-0007xe-Hu
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 03:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mZ7Do-0005a8-Cq
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 03:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mZ7Dk-0002XU-9w
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 03:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633766199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kai4n30+9e6SnfXUPKDkZuessSQxP8r4jGyAoLJZE68=;
 b=Bx97p6SJU3G/rXdR4dJSnPIF2yMM9gakXQDFbdwNXSBjNyrC5vH2sVARVMEocomtuEtO7n
 g+q/ALePWlR+ieimHDEAp9UKm536B4HNkvk6pISdZZIiOkhExNl8pH1nawo79c42VY7aye
 EUkOfJg6xDkDXLErYe/JPdmtUrRQ8bI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-90SZTFQ_PHSinYjdPH_9tQ-1; Sat, 09 Oct 2021 03:56:38 -0400
X-MC-Unique: 90SZTFQ_PHSinYjdPH_9tQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 v2-20020a50f082000000b003db24e28d59so11286991edl.5
 for <qemu-devel@nongnu.org>; Sat, 09 Oct 2021 00:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kai4n30+9e6SnfXUPKDkZuessSQxP8r4jGyAoLJZE68=;
 b=wz+gjfzWF7iBtTpEvM/2XiPmg41pjrF+I32JG7MU4p1FZUCDSzitoDjxS+XmbGlm3o
 yWOivJghxBmY1Lvbk+a5jX5tEkYI9mPBjnxWSshbHJB4sUJiuHHukz5kYiYEJS8wZ2Qz
 f11PXVeVg+Bno6iA8TkSTXgMS8kifEVzEZS0p4Ggol2GgWarq8IfJ6SSXwiDs2eCV/gs
 er0HYryLFq2+4YfAwZ/lk4g13Dv08ipFzNJ0sU78623130MEGE26Gouu0/pmpQsU+Dpy
 ZQU3mn1153FBPuBYTIsOM8Ljq+iLgkEhTm8SKqalHnyONx4JMgA5LSWywdpH3hcBZ/Fy
 jvaw==
X-Gm-Message-State: AOAM530TM4PkuvjqUnigzXYtvSgMc3NbdIavcaUaOC5Ve9A1eS2Pn7HL
 HipsL6bfbW3qa9lEG240GyFxq1wyJVEpIrgtX02SP+I9uYySgbahnweYiBG8plVEhZTWZg/cJUg
 4RzuV7wT+fRX2Ehs=
X-Received: by 2002:a50:e1cf:: with SMTP id m15mr21967079edl.309.1633766196871; 
 Sat, 09 Oct 2021 00:56:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziym0Biipr/hfB5siCqbM11Kz6bdnD/8LKUURCq0u9Hg5hUrzKaAWqG5hzO1iCmmttuRNNQA==
X-Received: by 2002:a50:e1cf:: with SMTP id m15mr21967063edl.309.1633766196689; 
 Sat, 09 Oct 2021 00:56:36 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:5307:af36:9661:8efc:9b2c])
 by smtp.gmail.com with ESMTPSA id p23sm782059edw.94.2021.10.09.00.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 00:56:36 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v4 1/3] QIOChannel: Add io_writev_zerocopy & io_flush_zerocopy
 callbacks
Date: Sat,  9 Oct 2021 04:56:11 -0300
Message-Id: <20211009075612.230283-2-leobras@redhat.com>
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

Adds io_async_writev and io_async_flush as optional callback to QIOChannelClass,
allowing the implementation of asynchronous writes by subclasses.

How to use them:
- Write data using qio_channel_writev_zerocopu(),
- Wait write completion with qio_channel_flush_zerocopy().

Notes:
As some zerocopy implementations work asynchronously, it's
recommended to keep the write buffer untouched until the return of
qio_channel_flush_zerocopy(), by the risk of sending an updated buffer
instead of the one at the write.

As the new callbacks are optional, if a subclass does not implement them, then:
- io_async_writev will return -1,
- io_async_flush will return 0 without changing anything.

Also, some functions like qio_channel_writev_full_all() were adapted to
receive a flag parameter. That allows shared code between zerocopy and
non-zerocopy writev.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/io/channel.h | 103 +++++++++++++++++++++++++++++++++++--------
 io/channel.c         |  74 +++++++++++++++++++++++--------
 2 files changed, 141 insertions(+), 36 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 88988979f8..e7d4e1521f 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -32,12 +32,15 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
 
 #define QIO_CHANNEL_ERR_BLOCK -2
 
+#define QIO_CHANNEL_WRITE_FLAG_ZEROCOPY 0x1
+
 typedef enum QIOChannelFeature QIOChannelFeature;
 
 enum QIOChannelFeature {
     QIO_CHANNEL_FEATURE_FD_PASS,
     QIO_CHANNEL_FEATURE_SHUTDOWN,
     QIO_CHANNEL_FEATURE_LISTEN,
+    QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY,
 };
 
 
@@ -136,6 +139,12 @@ struct QIOChannelClass {
                                   IOHandler *io_read,
                                   IOHandler *io_write,
                                   void *opaque);
+    ssize_t (*io_writev_zerocopy)(QIOChannel *ioc,
+                                  const struct iovec *iov,
+                                  size_t niov,
+                                  Error **errp);
+    int (*io_flush_zerocopy)(QIOChannel *ioc,
+                              Error **errp);
 };
 
 /* General I/O handling functions */
@@ -222,12 +231,13 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
 
 
 /**
- * qio_channel_writev_full:
+ * qio_channel_writev_full_flags:
  * @ioc: the channel object
  * @iov: the array of memory regions to write data from
  * @niov: the length of the @iov array
  * @fds: an array of file handles to send
  * @nfds: number of file handles in @fds
+ * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  * Write data to the IO channel, reading it from the
@@ -242,6 +252,10 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
  * guaranteed. If the channel is non-blocking and no
  * data can be sent, it will return QIO_CHANNEL_ERR_BLOCK
  *
+ * If flag QIO_CHANNEL_WRITE_FLAG_ZEROCOPY is passed,
+ * function will return once each buffer was queued for
+ * sending.
+ *
  * If there are file descriptors to send, the @fds
  * array should be non-NULL and provide the handles.
  * All file descriptors will be sent if at least one
@@ -255,12 +269,15 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
  * or QIO_CHANNEL_ERR_BLOCK if no data is can be sent
  * and the channel is non-blocking
  */
-ssize_t qio_channel_writev_full(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds,
-                                size_t nfds,
-                                Error **errp);
+ssize_t qio_channel_writev_full_flags(QIOChannel *ioc,
+                                      const struct iovec *iov,
+                                      size_t niov,
+                                      int *fds,
+                                      size_t nfds,
+                                      int flags,
+                                      Error **errp);
+#define qio_channel_writev_full(ioc, iov, niov, fds, nfds, errp) \
+    qio_channel_writev_full_flags(ioc, iov, niov, fds, nfds, 0, errp)
 
 /**
  * qio_channel_readv_all_eof:
@@ -321,10 +338,11 @@ int qio_channel_readv_all(QIOChannel *ioc,
 
 
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
@@ -339,10 +357,13 @@ int qio_channel_readv_all(QIOChannel *ioc,
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
@@ -846,13 +868,58 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
  * to be written, yielding from the current coroutine
  * if required.
  *
+ * If QIO_CHANNEL_WRITE_FLAG_ZEROCOPY is passed in flags,
+ * instead of waiting for all requested data to be written,
+ * this function will wait until it's all queued for writing.
+ *
  * Returns: 0 if all bytes were written, or -1 on error
  */
 
-int qio_channel_writev_full_all(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds, size_t nfds,
-                                Error **errp);
+int qio_channel_writev_full_all_flags(QIOChannel *ioc,
+                                      const struct iovec *iov,
+                                      size_t niov,
+                                      int *fds, size_t nfds,
+                                      int flags, Error **errp);
+#define qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, errp) \
+    qio_channel_writev_full_all_flags(ioc, iov, niov, fds, nfds, 0, errp)
+
+/**
+ * qio_channel_writev_zerocopy:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to write data from
+ * @niov: the length of the @iov array
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Behaves like qio_channel_writev_full_all_flags, but will write
+ * data asynchronously while avoiding unnecessary data copy.
+ * This function may return before any data is actually written,
+ * but should queue every buffer for writting.
+ *
+ * If at some point it's necessary wait for all data to be
+ * written, use qio_channel_flush_zerocopy().
+ *
+ * If zerocopy is not available, returns -1 and set errp.
+ */
+
+ssize_t qio_channel_writev_zerocopy(QIOChannel *ioc,
+                                    const struct iovec *iov,
+                                    size_t niov,
+                                    Error **errp);
+
+/**
+ * qio_channel_flush_zerocopy:
+ * @ioc: the channel object
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Will lock until every packet queued with
+ * qio_channel_writev_zerocopy() is sent, or return
+ * in case of any error.
+ *
+ * Returns -1 if any error is found, 0 otherwise.
+ * If not implemented, returns 0 without changing anything.
+ */
+
+int qio_channel_flush_zerocopy(QIOChannel *ioc,
+                               Error **errp);
 
 #endif /* QIO_CHANNEL_H */
diff --git a/io/channel.c b/io/channel.c
index e8b019dc36..811c93ae23 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -67,15 +67,27 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
 }
 
 
-ssize_t qio_channel_writev_full(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds,
-                                size_t nfds,
-                                Error **errp)
+ssize_t qio_channel_writev_full_flags(QIOChannel *ioc,
+                                      const struct iovec *iov,
+                                      size_t niov,
+                                      int *fds,
+                                      size_t nfds,
+                                      int flags,
+                                      Error **errp)
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
 
+    if (flags & QIO_CHANNEL_WRITE_FLAG_ZEROCOPY) {
+        if (!klass->io_writev_zerocopy ||
+            !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY)) {
+            error_setg_errno(errp, EINVAL,
+                             "Channel does not support zerocopy writev");
+            return -1;
+        }
+
+        return klass->io_writev_zerocopy(ioc, iov, niov, errp);
+    }
+
     if ((fds || nfds) &&
         !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
         error_setg_errno(errp, EINVAL,
@@ -212,19 +224,20 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
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
+    return qio_channel_writev_full_all_flags(ioc, iov, niov, NULL, 0, flags, errp);
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
@@ -237,8 +250,8 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
 
     while (nlocal_iov > 0) {
         ssize_t len;
-        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
-                                      errp);
+        len = qio_channel_writev_full_flags(ioc, local_iov, nlocal_iov, fds, nfds,
+                                          flags, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_OUT);
@@ -474,6 +487,31 @@ off_t qio_channel_io_seek(QIOChannel *ioc,
 }
 
 
+ssize_t qio_channel_writev_zerocopy(QIOChannel *ioc,
+                                    const struct iovec *iov,
+                                    size_t niov,
+                                    Error **errp)
+{
+    return qio_channel_writev_full_flags(ioc, iov, niov, NULL, 0,
+                                         QIO_CHANNEL_WRITE_FLAG_ZEROCOPY,
+                                         errp);
+}
+
+
+int qio_channel_flush_zerocopy(QIOChannel *ioc,
+                               Error **errp)
+{
+    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (!klass->io_flush_zerocopy ||
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY)) {
+        return 0;
+    }
+
+    return klass->io_flush_zerocopy(ioc, errp);
+}
+
+
 static void qio_channel_restart_read(void *opaque)
 {
     QIOChannel *ioc = opaque;
-- 
2.33.0


