Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E4941410E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 07:06:50 +0200 (CEST)
Received: from localhost ([::1]:38430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuT3-0004q2-T6
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 01:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mSuPp-00029j-PJ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 01:03:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mSuPm-0004zC-GF
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 01:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632287005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16WhxM27Vp+AOK4RZI3CRx0RVMkUtxjA6+oJSodsHLc=;
 b=TtsfVp7IVH17zA+i9uh7nw4B0WCNgpJAWL3rTsdgQXCjxpX51Yh36TuJr5CFXddkkJLLjJ
 5c8PnpUnWbujjJzBzRdsF8JsYuyMdIrHJ+OQ4TvaNfVB990qPwzaL45mTTztzJveR6Pqbr
 94wYVanj4J96VVQ/yGer6ZnKnfXGdzg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-FyL0TkEEPiytq8YJ5tkOAQ-1; Wed, 22 Sep 2021 01:03:22 -0400
X-MC-Unique: FyL0TkEEPiytq8YJ5tkOAQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 p23-20020a05620a22f700b003d5ac11ac5cso7208873qki.15
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 22:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=16WhxM27Vp+AOK4RZI3CRx0RVMkUtxjA6+oJSodsHLc=;
 b=McFfmGcne3iJpFdDR8Kl2F0C/fMvWK5s5BcNhT2ro+1DqPeki+APF2biRgonbzJILG
 b3wDx47MT9ToFntPoL6rfdZ+mBFjCKCKagstow6nKbX4Kr97ZPHVDtjN3ThdcPrbsPRv
 DTMBBEpL3+cpC49tVgqhN2a+AvFKobzYAG8Kt2rimp1jIfdlHSexXkA44Xu1BrwPQ9WO
 fZyJdDMg1IFurYgcw+7VSN2OWAdzukcFwAWfjzccPu2kmM6M1HqNiUAgrWDf9RK0COaW
 BFOWaj+1USTQKfxA0gwrXn7VjnTsRERpZxn6Ba26wtoYesxB+5nIoiDZc1/h7LbOOovl
 qphQ==
X-Gm-Message-State: AOAM5325nhGM6HbFqWJGpMAxX1pmQyDhUOjdyd6kOaIH+7QZqGhZxcok
 e/KIHwboS5N3iugeslJ7HzX3dWXIxiMOtJm7KWbZUAEez4M+40BqLdK2V2UxPtPVLj4zD6y0qdb
 PbDRY8uP4QwaY/BA=
X-Received: by 2002:a0c:b391:: with SMTP id t17mr11115115qve.35.1632287001577; 
 Tue, 21 Sep 2021 22:03:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy8UpjVnfaucidZX8PYpO/qHwB/t2MK7E7tGJk5kE1jDdXTiKUKaEGpDYw7DxFQAzA0sioFg==
X-Received: by 2002:a0c:b391:: with SMTP id t17mr11115097qve.35.1632287001368; 
 Tue, 21 Sep 2021 22:03:21 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:e5d7:bbae:108a:d2ca:1c18])
 by smtp.gmail.com with ESMTPSA id q192sm926675qka.93.2021.09.21.22.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 22:03:21 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 1/3] QIOCHannel: Add io_async_writev & io_async_flush
 callbacks
Date: Wed, 22 Sep 2021 02:03:38 -0300
Message-Id: <20210922050340.614781-2-leobras@redhat.com>
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

Adds io_async_writev and io_async_flush as optional callback to QIOChannelClass,
allowing the implementation of asynchronous writes by subclasses.

How to use them:
- Write data using qio_channel_async_writev(),
- Wait write completion with qio_channel_async_flush().

Notes:
Some asynchronous implementations may benefit from zerocopy mechanisms, so it's
recommended to keep the write buffer untouched until the return of
qio_channel_async_flush().

As the new callbacks are optional, if a subclass does not implement them
there will be a fallback to the mandatory synchronous implementation:
- io_async_writev will fallback to io_writev,
- io_async_flush will return without changing anything.
This makes simpler for the user to make use of the asynchronous implementation.

Also, some functions like qio_channel_writev_full_all() were adapted to
offer an async version, and make better use of the new callbacks.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/io/channel.h | 93 +++++++++++++++++++++++++++++++++++++-------
 io/channel.c         | 66 ++++++++++++++++++++++++-------
 2 files changed, 129 insertions(+), 30 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 88988979f8..74f2e3ae8a 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -136,6 +136,14 @@ struct QIOChannelClass {
                                   IOHandler *io_read,
                                   IOHandler *io_write,
                                   void *opaque);
+    ssize_t (*io_async_writev)(QIOChannel *ioc,
+                               const struct iovec *iov,
+                               size_t niov,
+                               int *fds,
+                               size_t nfds,
+                               Error **errp);
+   void (*io_async_flush)(QIOChannel *ioc,
+                          Error **errp);
 };
 
 /* General I/O handling functions */
@@ -255,12 +263,17 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
  * or QIO_CHANNEL_ERR_BLOCK if no data is can be sent
  * and the channel is non-blocking
  */
-ssize_t qio_channel_writev_full(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds,
-                                size_t nfds,
-                                Error **errp);
+ssize_t __qio_channel_writev_full(QIOChannel *ioc,
+                                  const struct iovec *iov,
+                                  size_t niov,
+                                  int *fds,
+                                  size_t nfds,
+                                  bool async,
+                                  Error **errp);
+#define qio_channel_writev_full(ioc, iov, niov, fds, nfds, errp) \
+    __qio_channel_writev_full(ioc, iov, niov, fds, nfds, false, errp)
+#define qio_channel_async_writev_full(ioc, iov, niov, fds, nfds, errp) \
+    __qio_channel_writev_full(ioc, iov, niov, fds, nfds, true, errp)
 
 /**
  * qio_channel_readv_all_eof:
@@ -339,10 +352,15 @@ int qio_channel_readv_all(QIOChannel *ioc,
  *
  * Returns: 0 if all bytes were written, or -1 on error
  */
-int qio_channel_writev_all(QIOChannel *ioc,
-                           const struct iovec *iov,
-                           size_t niov,
-                           Error **erp);
+int __qio_channel_writev_all(QIOChannel *ioc,
+                             const struct iovec *iov,
+                             size_t niov,
+                             bool async,
+                             Error **erp);
+#define qio_channel_writev_all(ioc, iov, niov, erp) \
+    __qio_channel_writev_all(ioc, iov, niov, false, erp)
+#define qio_channel_async_writev_all(ioc, iov, niov, erp) \
+    __qio_channel_writev_all(ioc, iov, niov, true, erp)
 
 /**
  * qio_channel_readv:
@@ -849,10 +867,55 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
  * Returns: 0 if all bytes were written, or -1 on error
  */
 
-int qio_channel_writev_full_all(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds, size_t nfds,
-                                Error **errp);
+int __qio_channel_writev_full_all(QIOChannel *ioc,
+                                  const struct iovec *iov,
+                                  size_t niov,
+                                  int *fds, size_t nfds,
+                                  bool async, Error **errp);
+#define qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, errp) \
+    __qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, false, errp)
+#define qio_channel_async_writev_full_all(ioc, iov, niov, fds, nfds, errp) \
+    __qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, true, errp)
+
+/**
+ * qio_channel_async_writev:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to write data from
+ * @niov: the length of the @iov array
+ * @fds: an array of file handles to send
+ * @nfds: number of file handles in @fds
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Behaves like qio_channel_writev_full, but will send
+ * data asynchronously, this meaning this function
+ * may return before the data is actually sent.
+ *
+ * If at some point it's necessary wait for all data to be
+ * sent, use qio_channel_async_flush().
+ *
+ * If not implemented, falls back to the default writev
+ */
+
+ssize_t qio_channel_async_writev(QIOChannel *ioc,
+                                 const struct iovec *iov,
+                                 size_t niov,
+                                 int *fds,
+                                 size_t nfds,
+                                 Error **errp);
+
+/**
+ * qio_channel_async_flush:
+ * @ioc: the channel object
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Will lock until every packet queued with qio_channel_async_writev()
+ * is sent.
+ *
+ * If not implemented, returns without changing anything.
+ */
+
+void qio_channel_async_flush(QIOChannel *ioc,
+                             Error **errp);
+
 
 #endif /* QIO_CHANNEL_H */
diff --git a/io/channel.c b/io/channel.c
index e8b019dc36..a35109a006 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -67,12 +67,13 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
 }
 
 
-ssize_t qio_channel_writev_full(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds,
-                                size_t nfds,
-                                Error **errp)
+ssize_t __qio_channel_writev_full(QIOChannel *ioc,
+                                  const struct iovec *iov,
+                                  size_t niov,
+                                  int *fds,
+                                  size_t nfds,
+                                  bool async,
+                                  Error **errp)
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
 
@@ -83,6 +84,10 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
         return -1;
     }
 
+    if (async) {
+        return klass->io_async_writev(ioc, iov, niov, fds, nfds, errp);
+    }
+
     return klass->io_writev(ioc, iov, niov, fds, nfds, errp);
 }
 
@@ -212,19 +217,20 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
     return ret;
 }
 
-int qio_channel_writev_all(QIOChannel *ioc,
-                           const struct iovec *iov,
-                           size_t niov,
-                           Error **errp)
+int __qio_channel_writev_all(QIOChannel *ioc,
+                             const struct iovec *iov,
+                             size_t niov,
+                             bool async,
+                             Error **errp)
 {
-    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, errp);
+    return __qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, async, errp);
 }
 
-int qio_channel_writev_full_all(QIOChannel *ioc,
+int __qio_channel_writev_full_all(QIOChannel *ioc,
                                 const struct iovec *iov,
                                 size_t niov,
                                 int *fds, size_t nfds,
-                                Error **errp)
+                                bool async, Error **errp)
 {
     int ret = -1;
     struct iovec *local_iov = g_new(struct iovec, niov);
@@ -237,8 +243,8 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
 
     while (nlocal_iov > 0) {
         ssize_t len;
-        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
-                                      errp);
+        len = __qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
+                                        async, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_OUT);
@@ -474,6 +480,36 @@ off_t qio_channel_io_seek(QIOChannel *ioc,
 }
 
 
+ssize_t qio_channel_async_writev(QIOChannel *ioc,
+                                 const struct iovec *iov,
+                                 size_t niov,
+                                 int *fds,
+                                 size_t nfds,
+                                 Error **errp)
+{
+     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (!klass->io_async_writev) {
+        return klass->io_writev(ioc, iov, niov, fds, nfds, errp);
+    }
+
+     return klass->io_async_writev(ioc, iov, niov, fds, nfds, errp);
+}
+
+
+void qio_channel_async_flush(QIOChannel *ioc,
+                             Error **errp)
+{
+     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (!klass->io_async_flush) {
+        return;
+    }
+
+     klass->io_async_flush(ioc, errp);
+}
+
+
 static void qio_channel_restart_read(void *opaque)
 {
     QIOChannel *ioc = opaque;
-- 
2.33.0


