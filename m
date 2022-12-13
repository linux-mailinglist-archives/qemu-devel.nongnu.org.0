Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9B364BEB7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:44:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5CzZ-0000FY-0p; Tue, 13 Dec 2022 16:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5CzN-0000Eb-NH
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5CzL-0007eI-Ke
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670967539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SsDJHjbmYgWOI28JIdJ4nkCfxRhomPn/I0rSYWBMco=;
 b=RTefwoXwUuv7GSqvHPye8XA5lMYWvPuuNUrMP9wYoelGIZ4q67R0yvdlMLZaakanJSsVoh
 h0/+5zpVZDsC/DywIDypYxviQA/Q+prYdnqy1Zqtgz/4vbI3ijrxqOwR1x/9wdvca6HFge
 lsIDovdDBcPMdmgGdNd/UOFsAJq26OA=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-P6o-09mOOPGroYav0IHKfg-1; Tue, 13 Dec 2022 16:38:57 -0500
X-MC-Unique: P6o-09mOOPGroYav0IHKfg-1
Received: by mail-ua1-f72.google.com with SMTP id
 z42-20020ab0492d000000b00423b333ff7dso5303728uac.22
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5SsDJHjbmYgWOI28JIdJ4nkCfxRhomPn/I0rSYWBMco=;
 b=w49Kui3WRmWSGCNBghKuOglX/wKh4gLR1Eh3iJfIunKbBOpjBjCUOB3/zLUV0V7VxO
 3ztbCs/uVRXfCr2hHN1mO+NlvqT/+zZpITnmWH/fgI6gVapAmzkTiCOVCwX7VC1AoKC1
 MzbVQOiApHGH6jWlscmVJ3dD5liB1nBc6tQ2viGFH+gZgudhrwfTOjiB1LfArHxacm9f
 lfiCwGPH1ydbNqWKC1RHqHmAKNUEBlg6fUMalEcYeh2VmDKviD4hEvxtWWvGao6dod0b
 5EQrXdsoElNewnaUh4US+f3Wb6z3G2MByjkuvpoQmpFx+IC14xUUELAFfNYYf32KaW3y
 WRYw==
X-Gm-Message-State: ANoB5pn7MtKXslgJUBGLVxOyNTBmQv/X0NlcQiCAYUsaS8W7MeLKZeBz
 QiD63JYUQHJwrv0LgklmyC2m9/UdqHV1PvF8PuAVM3R+oQ55PjfuXzE+2nKQSAXLq12U274omrX
 PZwBPZy3gdkTH5ppz5kuNhGOaqkqibCWxwyshOc8vNiFBweQ586sLJwp3rjPJHfSn
X-Received: by 2002:a05:6102:548f:b0:3b5:1803:80e4 with SMTP id
 bk15-20020a056102548f00b003b5180380e4mr4023538vsb.18.1670967534769; 
 Tue, 13 Dec 2022 13:38:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf741BDBmJqv80o4ZvycveeF9JJb2/sqdMEr9kv5w5GMDKEeJyYP8t1jAVviz+XO1g+oPphvug==
X-Received: by 2002:a05:6102:548f:b0:3b5:1803:80e4 with SMTP id
 bk15-20020a056102548f00b003b5180380e4mr4023505vsb.18.1670967534329; 
 Tue, 13 Dec 2022 13:38:54 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006feb158e5e7sm8607487qkp.70.2022.12.13.13.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:38:53 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH 1/5] io: Add support for MSG_PEEK for socket channel
Date: Tue, 13 Dec 2022 16:38:46 -0500
Message-Id: <20221213213850.1481858-2-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221213213850.1481858-1-peterx@redhat.com>
References: <20221213213850.1481858-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: "manish.mishra" <manish.mishra@nutanix.com>

MSG_PEEK reads from the peek of channel, The data is treated as
unread and the next read shall still return this data. This
support is currently added only for socket class. Extra parameter
'flags' is added to io_readv calls to pass extra read flags like
MSG_PEEK.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.co
Suggested-by: Daniel P. Berrangé <berrange@redhat.com
Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 chardev/char-socket.c               |  4 ++--
 include/io/channel.h                |  6 ++++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 17 ++++++++++++++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 16 ++++++++++++----
 migration/channel-block.c           |  1 +
 migration/rdma.c                    |  1 +
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 16 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 879564aa8a..5afce9a464 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -283,11 +283,11 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
     if (qio_channel_has_feature(s->ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
         ret = qio_channel_readv_full(s->ioc, &iov, 1,
                                      &msgfds, &msgfds_num,
-                                     NULL);
+                                     0, NULL);
     } else {
         ret = qio_channel_readv_full(s->ioc, &iov, 1,
                                      NULL, NULL,
-                                     NULL);
+                                     0, NULL);
     }
 
     if (msgfds_num) {
diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee7480..716235d496 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -34,6 +34,8 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
 
 #define QIO_CHANNEL_WRITE_FLAG_ZERO_COPY 0x1
 
+#define QIO_CHANNEL_READ_FLAG_MSG_PEEK 0x1
+
 typedef enum QIOChannelFeature QIOChannelFeature;
 
 enum QIOChannelFeature {
@@ -41,6 +43,7 @@ enum QIOChannelFeature {
     QIO_CHANNEL_FEATURE_SHUTDOWN,
     QIO_CHANNEL_FEATURE_LISTEN,
     QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
+    QIO_CHANNEL_FEATURE_READ_MSG_PEEK,
 };
 
 
@@ -114,6 +117,7 @@ struct QIOChannelClass {
                         size_t niov,
                         int **fds,
                         size_t *nfds,
+                        int flags,
                         Error **errp);
     int (*io_close)(QIOChannel *ioc,
                     Error **errp);
@@ -188,6 +192,7 @@ void qio_channel_set_name(QIOChannel *ioc,
  * @niov: the length of the @iov array
  * @fds: pointer to an array that will received file handles
  * @nfds: pointer filled with number of elements in @fds on return
+ * @flags: read flags (QIO_CHANNEL_READ_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  * Read data from the IO channel, storing it in the
@@ -224,6 +229,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
                                size_t niov,
                                int **fds,
                                size_t *nfds,
+                               int flags,
                                Error **errp);
 
 
diff --git a/io/channel-buffer.c b/io/channel-buffer.c
index bf52011be2..8096180f85 100644
--- a/io/channel-buffer.c
+++ b/io/channel-buffer.c
@@ -54,6 +54,7 @@ static ssize_t qio_channel_buffer_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelBuffer *bioc = QIO_CHANNEL_BUFFER(ioc);
diff --git a/io/channel-command.c b/io/channel-command.c
index 74516252ba..e7edd091af 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -203,6 +203,7 @@ static ssize_t qio_channel_command_readv(QIOChannel *ioc,
                                          size_t niov,
                                          int **fds,
                                          size_t *nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
diff --git a/io/channel-file.c b/io/channel-file.c
index b67687c2aa..d76663e6ae 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -86,6 +86,7 @@ static ssize_t qio_channel_file_readv(QIOChannel *ioc,
                                       size_t niov,
                                       int **fds,
                                       size_t *nfds,
+                                      int flags,
                                       Error **errp)
 {
     QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
diff --git a/io/channel-null.c b/io/channel-null.c
index 75e3781507..4fafdb770d 100644
--- a/io/channel-null.c
+++ b/io/channel-null.c
@@ -60,6 +60,7 @@ qio_channel_null_readv(QIOChannel *ioc,
                        size_t niov,
                        int **fds G_GNUC_UNUSED,
                        size_t *nfds G_GNUC_UNUSED,
+                       int flags,
                        Error **errp)
 {
     QIOChannelNull *nioc = QIO_CHANNEL_NULL(ioc);
diff --git a/io/channel-socket.c b/io/channel-socket.c
index b76dca9cc1..dfb8cb6c40 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -173,6 +173,8 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
     }
 #endif
 
+    qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
+
     return 0;
 }
 
@@ -406,6 +408,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
     }
 #endif /* WIN32 */
 
+    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
+
     trace_qio_channel_socket_accept_complete(ioc, cioc, cioc->fd);
     return cioc;
 
@@ -496,6 +500,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
@@ -517,6 +522,10 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
 
     }
 
+    if (flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) {
+        sflags |= MSG_PEEK;
+    }
+
  retry:
     ret = recvmsg(sioc->fd, &msg, sflags);
     if (ret < 0) {
@@ -624,11 +633,17 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         size_t niov,
                                         int **fds,
                                         size_t *nfds,
+                                        int flags,
                                         Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
     ssize_t done = 0;
     ssize_t i;
+    int sflags = 0;
+
+    if (flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) {
+        sflags |= MSG_PEEK;
+    }
 
     for (i = 0; i < niov; i++) {
         ssize_t ret;
@@ -636,7 +651,7 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
         ret = recv(sioc->fd,
                    iov[i].iov_base,
                    iov[i].iov_len,
-                   0);
+                   sflags);
         if (ret < 0) {
             if (errno == EAGAIN) {
                 if (done) {
diff --git a/io/channel-tls.c b/io/channel-tls.c
index 4ce890a538..c730cb8ec5 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -260,6 +260,7 @@ static ssize_t qio_channel_tls_readv(QIOChannel *ioc,
                                      size_t niov,
                                      int **fds,
                                      size_t *nfds,
+                                     int flags,
                                      Error **errp)
 {
     QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
diff --git a/io/channel-websock.c b/io/channel-websock.c
index fb4932ade7..a12acc27cf 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -1081,6 +1081,7 @@ static ssize_t qio_channel_websock_readv(QIOChannel *ioc,
                                          size_t niov,
                                          int **fds,
                                          size_t *nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelWebsock *wioc = QIO_CHANNEL_WEBSOCK(ioc);
diff --git a/io/channel.c b/io/channel.c
index 0640941ac5..a8c7f11649 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -52,6 +52,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
                                size_t niov,
                                int **fds,
                                size_t *nfds,
+                               int flags,
                                Error **errp)
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
@@ -63,7 +64,14 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
         return -1;
     }
 
-    return klass->io_readv(ioc, iov, niov, fds, nfds, errp);
+    if ((flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) &&
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
+        error_setg_errno(errp, EINVAL,
+                         "Channel does not support peek read");
+        return -1;
+    }
+
+    return klass->io_readv(ioc, iov, niov, fds, nfds, flags, errp);
 }
 
 
@@ -146,7 +154,7 @@ int qio_channel_readv_full_all_eof(QIOChannel *ioc,
     while ((nlocal_iov > 0) || local_fds) {
         ssize_t len;
         len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
-                                     local_nfds, errp);
+                                     local_nfds, 0, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_IN);
@@ -284,7 +292,7 @@ ssize_t qio_channel_readv(QIOChannel *ioc,
                           size_t niov,
                           Error **errp)
 {
-    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, errp);
+    return qio_channel_readv_full(ioc, iov, niov, NULL, NULL, 0, errp);
 }
 
 
@@ -303,7 +311,7 @@ ssize_t qio_channel_read(QIOChannel *ioc,
                          Error **errp)
 {
     struct iovec iov = { .iov_base = buf, .iov_len = buflen };
-    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, errp);
+    return qio_channel_readv_full(ioc, &iov, 1, NULL, NULL, 0, errp);
 }
 
 
diff --git a/migration/channel-block.c b/migration/channel-block.c
index f4ab53acdb..b7374363c3 100644
--- a/migration/channel-block.c
+++ b/migration/channel-block.c
@@ -53,6 +53,7 @@ qio_channel_block_readv(QIOChannel *ioc,
                         size_t niov,
                         int **fds,
                         size_t *nfds,
+                        int flags,
                         Error **errp)
 {
     QIOChannelBlock *bioc = QIO_CHANNEL_BLOCK(ioc);
diff --git a/migration/rdma.c b/migration/rdma.c
index 94a55dd95b..d8b4632094 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2854,6 +2854,7 @@ static ssize_t qio_channel_rdma_readv(QIOChannel *ioc,
                                       size_t niov,
                                       int **fds,
                                       size_t *nfds,
+                                      int flags,
                                       Error **errp)
 {
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 196b78c00d..199227a556 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -614,7 +614,7 @@ static int coroutine_fn prh_read(PRHelperClient *client, void *buf, int sz,
         iov.iov_base = buf;
         iov.iov_len = sz;
         n_read = qio_channel_readv_full(QIO_CHANNEL(client->ioc), &iov, 1,
-                                        &fds, &nfds, errp);
+                                        &fds, &nfds, 0, errp);
 
         if (n_read == QIO_CHANNEL_ERR_BLOCK) {
             qio_channel_yield(QIO_CHANNEL(client->ioc), G_IO_IN);
diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index 2994d1cf42..3cf1acaf7d 100644
--- a/tests/qtest/tpm-emu.c
+++ b/tests/qtest/tpm-emu.c
@@ -106,7 +106,7 @@ void *tpm_emu_ctrl_thread(void *data)
         int *pfd = NULL;
         size_t nfd = 0;
 
-        qio_channel_readv_full(ioc, &iov, 1, &pfd, &nfd, &error_abort);
+        qio_channel_readv_full(ioc, &iov, 1, &pfd, &nfd, 0, &error_abort);
         cmd = be32_to_cpu(cmd);
         g_assert_cmpint(cmd, ==, CMD_SET_DATAFD);
         g_assert_cmpint(nfd, ==, 1);
diff --git a/tests/unit/test-io-channel-socket.c b/tests/unit/test-io-channel-socket.c
index b36a5d972a..b964bb202d 100644
--- a/tests/unit/test-io-channel-socket.c
+++ b/tests/unit/test-io-channel-socket.c
@@ -460,6 +460,7 @@ static void test_io_channel_unix_fd_pass(void)
                            G_N_ELEMENTS(iorecv),
                            &fdrecv,
                            &nfdrecv,
+                           0,
                            &error_abort);
 
     g_assert(nfdrecv == G_N_ELEMENTS(fdsend));
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 232984ace6..145eb17c08 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -116,7 +116,7 @@ vu_message_read(VuDev *vu_dev, int conn_fd, VhostUserMsg *vmsg)
          * qio_channel_readv_full may have short reads, keeping calling it
          * until getting VHOST_USER_HDR_SIZE or 0 bytes in total
          */
-        rc = qio_channel_readv_full(ioc, &iov, 1, &fds, &nfds, &local_err);
+        rc = qio_channel_readv_full(ioc, &iov, 1, &fds, &nfds, 0, &local_err);
         if (rc < 0) {
             if (rc == QIO_CHANNEL_ERR_BLOCK) {
                 assert(local_err == NULL);
-- 
2.37.3


