Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44CA44E1A0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 06:43:19 +0100 (CET)
Received: from localhost ([::1]:48286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlPLK-0000Uj-7T
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 00:43:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHa-00067K-Gt
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHW-0005O4-5O
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636695560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3GWBoGQqRAbvohkFfy5xKBuX91uf/+PZBXIeeOsce4=;
 b=EA3+5c5vAIX5M0rz+fekEGMLBlFjkjJ1QrmZ7SbF6Bt1HmICtTkhMvv2EovDCLduPJO0pe
 UqIOL/kHIwt5GtH6gpWki/2JzP47tmAqYfODNQF5ZA/AVJuaVjfjcEZEsOwEEvEb/MESc9
 B4Ra6+wbnoYDkb3a5AkWEXlQ5N93kQI=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-igNFt-O3OW-rNHpTLUdg8w-1; Fri, 12 Nov 2021 00:39:19 -0500
X-MC-Unique: igNFt-O3OW-rNHpTLUdg8w-1
Received: by mail-ua1-f71.google.com with SMTP id
 n10-20020ab013ca000000b002cfd6ab0ba5so4201240uae.1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 21:39:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L3GWBoGQqRAbvohkFfy5xKBuX91uf/+PZBXIeeOsce4=;
 b=bJ3waCnb//866AetI8L0ZeaekqVapY8T7NTse6gDZPtiRQDeEWLew2paBWPu4M1VlS
 yJ5dJFUuxG2C74bhbrcx2A+Xzs7bZgkzNScZRA/kKcBVLlXysz4Fya8okXs9sUMyTZ5L
 MX8uqR+7BjHHklSl+RegnIbo0gEu1+OOApn2WNFw5mfw5GBprjP2am4ubY+noShm1aDM
 TCQesqZ2vtIUTN35U9rNoK7HyvLjmlB2msLwnjBuKSgIS3HmpazCYT2UFXUBpyB0vPSD
 PTzQMadlio131JvwxlIZyxVdUkzDvDS6goc8F94cTtr/w9mOOVQgRtv0uk/eAKESwnfs
 CG0g==
X-Gm-Message-State: AOAM5306dm3Zfp0SBdJQ80BZqB1EXH4FVDOm4hu4k/hDj7m0KrTf+r+8
 dPbjPwXIFiKqPUqqtIxOY7mD/C/7KcyZ+2Z9QXSMMYm8tF3ecX5K4ZYIBmC0JOyqwgBCE+HM0g+
 rgEEXAOlIQDBU24U=
X-Received: by 2002:a67:fd90:: with SMTP id k16mr6246540vsq.39.1636695558462; 
 Thu, 11 Nov 2021 21:39:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpiCzWAYCrV/Lmq+II17XEeHwEBYYEMcfrB1eIWubkjR2mtP656Xg3UBFAUVXmkHKifbNxcA==
X-Received: by 2002:a67:fd90:: with SMTP id k16mr6246517vsq.39.1636695558250; 
 Thu, 11 Nov 2021 21:39:18 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:7e14:3b94:fb27:f0ad:a824])
 by smtp.gmail.com with ESMTPSA id r2sm1465280vsk.28.2021.11.11.21.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 21:39:17 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v5 1/6] QIOChannel: Add io_writev_zerocopy & io_flush_zerocopy
 callbacks
Date: Fri, 12 Nov 2021 02:10:36 -0300
Message-Id: <20211112051040.923746-2-leobras@redhat.com>
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

Adds io_writev_zerocopy and io_flush_zerocopy as optional callback to QIOChannelClass,
allowing the implementation of zerocopy writes by subclasses.

How to use them:
- Write data using qio_channel_writev_zerocopy(),
- Wait write completion with qio_channel_flush_zerocopy().

Notes:
As some zerocopy implementations work asynchronously, it's
recommended to keep the write buffer untouched until the return of
qio_channel_flush_zerocopy(), to avoid the risk of sending an updated
buffer instead of the one at the write.

As the new callbacks are optional, if a subclass does not implement them, then:
- io_writev_zerocopy will return -1,
- io_flush_zerocopy will return 0 without changing anything.

Also, some functions like qio_channel_writev_full_all() were adapted to
receive a flag parameter. That allows shared code between zerocopy and
non-zerocopy writev.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/io/channel.h | 93 ++++++++++++++++++++++++++++++++++++++------
 io/channel.c         | 65 +++++++++++++++++++++++++------
 2 files changed, 135 insertions(+), 23 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 88988979f8..a19c09bb84 100644
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
+                             Error **errp);
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
+ * If QIO_CHANNEL_WRITE_FLAG_ZEROCOPY is passed in flags,
+ * instead of waiting for all requested data to be written,
+ * this function will wait until it's all queued for writing.
+ * In this case, if the buffer gets changed between queueing and
+ * sending, the updated buffer will be sent. If this is not a
+ * desired behavior, it's suggested to call qio_channel_flush_zerocopy()
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
@@ -846,13 +868,62 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
  * to be written, yielding from the current coroutine
  * if required.
  *
+ * If QIO_CHANNEL_WRITE_FLAG_ZEROCOPY is passed in flags,
+ * instead of waiting for all requested data to be written,
+ * this function will wait until it's all queued for writing.
+ * In this case, if the buffer gets changed between queueing and
+ * sending, the updated buffer will be sent. If this is not a
+ * desired behavior, it's suggested to call qio_channel_flush_zerocopy()
+ * before reusing the buffer.
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
+ * Behaves like qio_channel_writev_full_all_flags, but may write
+ * data asynchronously while avoiding unnecessary data copy.
+ * This function may return before any data is actually written,
+ * but should queue every buffer for writing.
+ *
+ * If at some point it's necessary to wait for all data to be
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
+ * Will block until every packet queued with
+ * qio_channel_writev_zerocopy() is sent, or return
+ * in case of any error.
+ *
+ * Returns -1 if any error is found, 0 otherwise.
+ * If not implemented, acts as a no-op, and returns 0.
+ */
+
+int qio_channel_flush_zerocopy(QIOChannel *ioc,
+                               Error **errp);
 
 #endif /* QIO_CHANNEL_H */
diff --git a/io/channel.c b/io/channel.c
index e8b019dc36..009da9b772 100644
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
@@ -237,8 +239,15 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
 
     while (nlocal_iov > 0) {
         ssize_t len;
-        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
-                                      errp);
+
+        if (flags & QIO_CHANNEL_WRITE_FLAG_ZEROCOPY) {
+            assert(fds == NULL && nfds == 0);
+            len = qio_channel_writev_zerocopy(ioc, local_iov, nlocal_iov, errp);
+        } else {
+            len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
+                                          errp);
+        }
+
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_OUT);
@@ -474,6 +483,38 @@ off_t qio_channel_io_seek(QIOChannel *ioc,
 }
 
 
+ssize_t qio_channel_writev_zerocopy(QIOChannel *ioc,
+                                    const struct iovec *iov,
+                                    size_t niov,
+                                    Error **errp)
+{
+    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (!klass->io_writev_zerocopy ||
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY)) {
+        error_setg_errno(errp, EINVAL,
+                         "Channel does not support zerocopy writev");
+        return -1;
+    }
+
+    return klass->io_writev_zerocopy(ioc, iov, niov, errp);
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
2.33.1


