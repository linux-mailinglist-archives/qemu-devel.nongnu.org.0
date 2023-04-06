Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FAE6D9402
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:28:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkMqh-0005vS-Mp; Thu, 06 Apr 2023 06:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMqe-0005uk-IB
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:28:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMqc-00013M-7w
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680776885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jR1//7G8zZnp/oLXpFnyph+CIJPDHdrclB0rs5VJfSk=;
 b=P9YIjB6SG1LIDpxwZBE0xCFyTurvwrs6pydlOY2K6qKjNtoOc75rjFMTBjDQ/xnxBZD/+S
 f5PXvfXcokhAfyuaE8cdcZepHa5h/gc8hbaxpXxOXij3LYJO3xgrWa0UcnKLrd9bWPNMMR
 jyA/3HjlpEBkmd55yMnQvgrm23CwNdA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-QSfyvd35P66EEk_EEr350Q-1; Thu, 06 Apr 2023 06:28:03 -0400
X-MC-Unique: QSfyvd35P66EEk_EEr350Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-4f9ceb7f6d7so816656a12.2
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 03:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680776882; x=1683368882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jR1//7G8zZnp/oLXpFnyph+CIJPDHdrclB0rs5VJfSk=;
 b=RY7EZ1F2LeODaUa7AfyFsvd+vh/moM8rUz0xEE5ZrGxz3gE5Ccq/VCL8JjfWZhqeOk
 eITI39z7P6T7rX82G8yApSsDKuiTlqpG7wyO8rHm7nIQyaY9Xml/NntBUAvZc/VM7hvK
 qK4LqqNe8ks/UerKBp86wB06zM5NnYvqN+2GwJVQ2ZSfaMAehfMWQJXmXWRDMueV5FJI
 l3ZcR+Gr+kkDlCXC9vhqSyV6twlc7uXGwcGc7FDxZrViesku4LOuKSs6sqiWAvkB6Vhe
 CrCRUwMcHg0NTlr5O7vN47xB9oQCp8DOzn8EacYMPUNwgrR6+M3jL+GQ988EFPy9VtJE
 EMSQ==
X-Gm-Message-State: AAQBX9cOjoPk3ENcmgilXuyBBHFZ1cbnhuNV2OvfkbSrOvfD2T8D/6j1
 KzuTIGFnuZ2s0de190AB2i2J3AxCoRze1z2fTR/s1w2QAA83iX0/fBRheD1sZl7SKN3rZPy2IqC
 kyUaE9aFtLG7OnsMcAfJ7laVhuKVkHCqXpwo2mTFjOUVgmsyF59gooKb7hLF2tldJ/Q2U3+23xz
 c=
X-Received: by 2002:a05:6402:748:b0:500:46f2:e7db with SMTP id
 p8-20020a056402074800b0050046f2e7dbmr5140638edy.15.1680776882383; 
 Thu, 06 Apr 2023 03:28:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350ass+JweocgoBJoE+PtYMqj4V1s2Fa5sISunR00M1ksYCER6YpI2989r1YJ5EK65gL4bE+Ojg==
X-Received: by 2002:a05:6402:748:b0:500:46f2:e7db with SMTP id
 p8-20020a056402074800b0050046f2e7dbmr5140625edy.15.1680776882037; 
 Thu, 06 Apr 2023 03:28:02 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a056402444200b00501c2a9e16dsm550838edb.74.2023.04.06.03.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 03:28:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com
Subject: [PATCH] io: mark mixed functions that can suspend
Date: Thu,  6 Apr 2023 12:28:00 +0200
Message-Id: <20230406102800.243353-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
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
2.39.2


