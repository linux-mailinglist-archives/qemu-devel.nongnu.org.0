Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CD16EA715
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:35:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9L-0008If-ES; Fri, 21 Apr 2023 05:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9C-0008FN-2U
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9A-00033O-2z
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoqHZwp6ZDuBBp7HlO2FvItIj6HYt1hKP7ytMavVzfo=;
 b=a0HmnvSkyyWcU1OBJ1Y/5yB0qDsqsFKADXvWLH8IKBoyDUP3m1RK6lU7ME+G0d14689cim
 3ygUAbHjh9JQg8j8pEKqRs6dtHDAwwiy+wiNc2N32h1GWAjKK9GVJZPnLb9+aOl55gY+bl
 a5xluaT4x7xfdx3uxg+HLAxYcBlbXCg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-tipoV1CWN3-G4y8sEdzysg-1; Fri, 21 Apr 2023 05:33:38 -0400
X-MC-Unique: tipoV1CWN3-G4y8sEdzysg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a348facbbso158077966b.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069616; x=1684661616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uoqHZwp6ZDuBBp7HlO2FvItIj6HYt1hKP7ytMavVzfo=;
 b=HkwWsWEWVIBPz5aNiM0K72wB/8DwO5Zh/C+a+Yne50rgVRDpyVVXtkHjCRzpnmM45k
 jdsAkuW/VK+sK4xAFszkbb01kiUufhZvoKLeINFP84N+fgUyPfSxO1GcstvRJ559ut2S
 foyaPZ/QAZPXmecCtvt1Cb7a3MVkZ/jucofR6Hb/z778ULzP8KzPyfWG40wb7vqSXl07
 CSYHmkCKgK952SDlWQ3ehHHu8OYV3XlcWPCMfjtyjaxB1RbG/r6nSqZbns+6j2cp0WCy
 j8hewHlJPfgk19xhS3SZBtSQ3IoqR28KviZWaYGnaLi+YHsOO4/TCwOWs+Fi5b2S9BZv
 vmGw==
X-Gm-Message-State: AAQBX9eC3WGabfBDr5vlRZdyWjV+vO2OXtIyJopeJxP6u34yFzIYNH29
 LOxCPPY9TedU80cVesokxkYSkAVVRB35LD4OdSyioAo7yPBCJkTlohGfDHd6sfqTEZ7sBkvwR4T
 yuou1H++csDn5XX5QgFFhAtFBZw+mxwhuc0QHTROcCXiOxPkNkutevEQw7/9sHwRnoWyAo3Oqkw
 BYLA==
X-Received: by 2002:a17:906:b197:b0:94c:b183:bb6f with SMTP id
 w23-20020a170906b19700b0094cb183bb6fmr1599082ejy.18.1682069616257; 
 Fri, 21 Apr 2023 02:33:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350bsr5duKBidqpKIxeEvVJQBZ8Uq1Y3PiYfO1raiBch5cBKLyppbBx7EpL+dzK6TqckSp/3mCQ==
X-Received: by 2002:a17:906:b197:b0:94c:b183:bb6f with SMTP id
 w23-20020a170906b19700b0094cb183bb6fmr1599067ejy.18.1682069615874; 
 Fri, 21 Apr 2023 02:33:35 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a1709062e9300b0094f281bd279sm1801428eji.198.2023.04.21.02.33.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/25] io: mark mixed functions that can suspend
Date: Fri, 21 Apr 2023 11:33:04 +0200
Message-Id: <20230421093316.17941-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There should be no paths from a coroutine_fn to aio_poll, however in
practice coroutine_mixed_fn will call aio_poll in the !qemu_in_coroutine()
path.  By marking mixed functions, we can track accurately the call paths
that execute entirely in coroutine context, and find more missing
coroutine_fn markers.  This results in more accurate checks that
coroutine code does not end up blocking.

If the marking were extended transitively to all functions that call
these ones, static analysis could be done much more efficiently.
However, this is a start and makes it possible to use vrc's path-based
searches to find potential bugs where coroutine_fns call blocking functions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/io/channel.h | 78 ++++++++++++++++++++++----------------------
 io/channel.c         | 78 ++++++++++++++++++++++----------------------
 2 files changed, 78 insertions(+), 78 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 153fbd29049f..446a566e5e1b 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -301,10 +301,10 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
  * Returns: 1 if all bytes were read, 0 if end-of-file
  *          occurs without data, or -1 on error
  */
-int qio_channel_readv_all_eof(QIOChannel *ioc,
-                              const struct iovec *iov,
-                              size_t niov,
-                              Error **errp);
+int coroutine_mixed_fn qio_channel_readv_all_eof(QIOChannel *ioc,
+                                                 const struct iovec *iov,
+                                                 size_t niov,
+                                                 Error **errp);
 
 /**
  * qio_channel_readv_all:
@@ -328,10 +328,10 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
  *
  * Returns: 0 if all bytes were read, or -1 on error
  */
-int qio_channel_readv_all(QIOChannel *ioc,
-                          const struct iovec *iov,
-                          size_t niov,
-                          Error **errp);
+int coroutine_mixed_fn qio_channel_readv_all(QIOChannel *ioc,
+                                             const struct iovec *iov,
+                                             size_t niov,
+                                             Error **errp);
 
 
 /**
@@ -353,10 +353,10 @@ int qio_channel_readv_all(QIOChannel *ioc,
  *
  * Returns: 0 if all bytes were written, or -1 on error
  */
-int qio_channel_writev_all(QIOChannel *ioc,
-                           const struct iovec *iov,
-                           size_t niov,
-                           Error **errp);
+int coroutine_mixed_fn qio_channel_writev_all(QIOChannel *ioc,
+                                              const struct iovec *iov,
+                                              size_t niov,
+                                              Error **errp);
 
 /**
  * qio_channel_readv:
@@ -437,10 +437,10 @@ ssize_t qio_channel_write(QIOChannel *ioc,
  * Returns: 1 if all bytes were read, 0 if end-of-file occurs
  *          without data, or -1 on error
  */
-int qio_channel_read_all_eof(QIOChannel *ioc,
-                             char *buf,
-                             size_t buflen,
-                             Error **errp);
+int coroutine_mixed_fn qio_channel_read_all_eof(QIOChannel *ioc,
+                                                char *buf,
+                                                size_t buflen,
+                                                Error **errp);
 
 /**
  * qio_channel_read_all:
@@ -457,10 +457,10 @@ int qio_channel_read_all_eof(QIOChannel *ioc,
  *
  * Returns: 0 if all bytes were read, or -1 on error
  */
-int qio_channel_read_all(QIOChannel *ioc,
-                         char *buf,
-                         size_t buflen,
-                         Error **errp);
+int coroutine_mixed_fn qio_channel_read_all(QIOChannel *ioc,
+                                            char *buf,
+                                            size_t buflen,
+                                            Error **errp);
 
 /**
  * qio_channel_write_all:
@@ -476,10 +476,10 @@ int qio_channel_read_all(QIOChannel *ioc,
  *
  * Returns: 0 if all bytes were written, or -1 on error
  */
-int qio_channel_write_all(QIOChannel *ioc,
-                          const char *buf,
-                          size_t buflen,
-                          Error **errp);
+int coroutine_mixed_fn qio_channel_write_all(QIOChannel *ioc,
+                                             const char *buf,
+                                             size_t buflen,
+                                             Error **errp);
 
 /**
  * qio_channel_set_blocking:
@@ -812,11 +812,11 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
  *          occurs without data, or -1 on error
  */
 
-int qio_channel_readv_full_all_eof(QIOChannel *ioc,
-                                   const struct iovec *iov,
-                                   size_t niov,
-                                   int **fds, size_t *nfds,
-                                   Error **errp);
+int coroutine_mixed_fn qio_channel_readv_full_all_eof(QIOChannel *ioc,
+                                                      const struct iovec *iov,
+                                                      size_t niov,
+                                                      int **fds, size_t *nfds,
+                                                      Error **errp);
 
 /**
  * qio_channel_readv_full_all:
@@ -838,11 +838,11 @@ int qio_channel_readv_full_all_eof(QIOChannel *ioc,
  * Returns: 0 if all bytes were read, or -1 on error
  */
 
-int qio_channel_readv_full_all(QIOChannel *ioc,
-                               const struct iovec *iov,
-                               size_t niov,
-                               int **fds, size_t *nfds,
-                               Error **errp);
+int coroutine_mixed_fn qio_channel_readv_full_all(QIOChannel *ioc,
+                                                  const struct iovec *iov,
+                                                  size_t niov,
+                                                  int **fds, size_t *nfds,
+                                                  Error **errp);
 
 /**
  * qio_channel_writev_full_all:
@@ -872,11 +872,11 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
  * Returns: 0 if all bytes were written, or -1 on error
  */
 
-int qio_channel_writev_full_all(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds, size_t nfds,
-                                int flags, Error **errp);
+int coroutine_mixed_fn qio_channel_writev_full_all(QIOChannel *ioc,
+                                                   const struct iovec *iov,
+                                                   size_t niov,
+                                                   int *fds, size_t nfds,
+                                                   int flags, Error **errp);
 
 /**
  * qio_channel_flush:
diff --git a/io/channel.c b/io/channel.c
index a8c7f1164901..375a130a398d 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -109,27 +109,27 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
 }
 
 
-int qio_channel_readv_all_eof(QIOChannel *ioc,
-                              const struct iovec *iov,
-                              size_t niov,
-                              Error **errp)
+int coroutine_mixed_fn qio_channel_readv_all_eof(QIOChannel *ioc,
+                                                 const struct iovec *iov,
+                                                 size_t niov,
+                                                 Error **errp)
 {
     return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
 }
 
-int qio_channel_readv_all(QIOChannel *ioc,
-                          const struct iovec *iov,
-                          size_t niov,
-                          Error **errp)
+int coroutine_mixed_fn qio_channel_readv_all(QIOChannel *ioc,
+                                             const struct iovec *iov,
+                                             size_t niov,
+                                             Error **errp)
 {
     return qio_channel_readv_full_all(ioc, iov, niov, NULL, NULL, errp);
 }
 
-int qio_channel_readv_full_all_eof(QIOChannel *ioc,
-                                   const struct iovec *iov,
-                                   size_t niov,
-                                   int **fds, size_t *nfds,
-                                   Error **errp)
+int coroutine_mixed_fn qio_channel_readv_full_all_eof(QIOChannel *ioc,
+                                                      const struct iovec *iov,
+                                                      size_t niov,
+                                                      int **fds, size_t *nfds,
+                                                      Error **errp)
 {
     int ret = -1;
     struct iovec *local_iov = g_new(struct iovec, niov);
@@ -215,11 +215,11 @@ next_iter:
     return ret;
 }
 
-int qio_channel_readv_full_all(QIOChannel *ioc,
-                               const struct iovec *iov,
-                               size_t niov,
-                               int **fds, size_t *nfds,
-                               Error **errp)
+int coroutine_mixed_fn qio_channel_readv_full_all(QIOChannel *ioc,
+                                                  const struct iovec *iov,
+                                                  size_t niov,
+                                                  int **fds, size_t *nfds,
+                                                  Error **errp)
 {
     int ret = qio_channel_readv_full_all_eof(ioc, iov, niov, fds, nfds, errp);
 
@@ -234,19 +234,19 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
     return ret;
 }
 
-int qio_channel_writev_all(QIOChannel *ioc,
-                           const struct iovec *iov,
-                           size_t niov,
-                           Error **errp)
+int coroutine_mixed_fn qio_channel_writev_all(QIOChannel *ioc,
+                                              const struct iovec *iov,
+                                              size_t niov,
+                                              Error **errp)
 {
     return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, 0, errp);
 }
 
-int qio_channel_writev_full_all(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds, size_t nfds,
-                                int flags, Error **errp)
+int coroutine_mixed_fn qio_channel_writev_full_all(QIOChannel *ioc,
+                                                   const struct iovec *iov,
+                                                   size_t niov,
+                                                   int *fds, size_t nfds,
+                                                   int flags, Error **errp)
 {
     int ret = -1;
     struct iovec *local_iov = g_new(struct iovec, niov);
@@ -325,30 +325,30 @@ ssize_t qio_channel_write(QIOChannel *ioc,
 }
 
 
-int qio_channel_read_all_eof(QIOChannel *ioc,
-                             char *buf,
-                             size_t buflen,
-                             Error **errp)
+int coroutine_mixed_fn qio_channel_read_all_eof(QIOChannel *ioc,
+                                                char *buf,
+                                                size_t buflen,
+                                                Error **errp)
 {
     struct iovec iov = { .iov_base = buf, .iov_len = buflen };
     return qio_channel_readv_all_eof(ioc, &iov, 1, errp);
 }
 
 
-int qio_channel_read_all(QIOChannel *ioc,
-                         char *buf,
-                         size_t buflen,
-                         Error **errp)
+int coroutine_mixed_fn qio_channel_read_all(QIOChannel *ioc,
+                                            char *buf,
+                                            size_t buflen,
+                                            Error **errp)
 {
     struct iovec iov = { .iov_base = buf, .iov_len = buflen };
     return qio_channel_readv_all(ioc, &iov, 1, errp);
 }
 
 
-int qio_channel_write_all(QIOChannel *ioc,
-                          const char *buf,
-                          size_t buflen,
-                          Error **errp)
+int coroutine_mixed_fn qio_channel_write_all(QIOChannel *ioc,
+                                             const char *buf,
+                                             size_t buflen,
+                                             Error **errp)
 {
     struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
     return qio_channel_writev_all(ioc, &iov, 1, errp);
-- 
2.40.0


