Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A9B6D0D4F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:05:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwd9-0003FV-6w; Thu, 30 Mar 2023 14:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwd5-0003DQ-R4
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:07 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwd4-00022h-0b
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:07 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6FA2321A31;
 Thu, 30 Mar 2023 18:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KeuGyQB6RtYTAbbkJrvUO7WzLSrtPBHu7V3PK6VPtuk=;
 b=ed/qonEzEpOS6Bd95rDSLvfGLYh84zO8WyK2CcBTC4xi/eXdx3S+XFsqAWipGqroA0GMNE
 6oZU7ll0Cnjxnj2E60UOxl1YgMulF8G0gAX7s5breKy7J3Wsc0DjHmYc2OvsFbBcR56R1w
 v+ghmoAIu22XomV7+g+CHbD1XezcGMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199442;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KeuGyQB6RtYTAbbkJrvUO7WzLSrtPBHu7V3PK6VPtuk=;
 b=bVTcQijmFnZCEVfXEH3/5rGUqRaswfXK6CZeR/eth+mDwo8segrderUxBm0kitu2uXipxa
 eCJt3/hGJvxH3uBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1AEB21348E;
 Thu, 30 Mar 2023 18:03:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wDuYNA/PJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:03:59 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Nikolay Borisov <nborisov@suse.com>
Subject: [RFC PATCH v1 07/26] io: Add generic pwritev/preadv interface
Date: Thu, 30 Mar 2023 15:03:17 -0300
Message-Id: <20230330180336.2791-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

From: Nikolay Borisov <nborisov@suse.com>

Introduce basic pwritev/preadv support in the generic channel layer.
Specific implementation will follow for the file channel as this is
required in order to support migration streams with fixed location of
each ram page.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 include/io/channel.h | 82 ++++++++++++++++++++++++++++++++++++++++++++
 io/channel.c         | 58 +++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)

diff --git a/include/io/channel.h b/include/io/channel.h
index 29461dda41..28bce7ef17 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -129,6 +129,16 @@ struct QIOChannelClass {
                            Error **errp);
 
     /* Optional callbacks */
+    ssize_t (*io_pwritev)(QIOChannel *ioc,
+                          const struct iovec *iov,
+                          size_t niov,
+                          off_t offset,
+                          Error **errp);
+    ssize_t (*io_preadv)(QIOChannel *ioc,
+                         const struct iovec *iov,
+                         size_t niov,
+                         off_t offset,
+                         Error **errp);
     int (*io_shutdown)(QIOChannel *ioc,
                        QIOChannelShutdown how,
                        Error **errp);
@@ -511,6 +521,78 @@ int qio_channel_set_blocking(QIOChannel *ioc,
 int qio_channel_close(QIOChannel *ioc,
                       Error **errp);
 
+/**
+ * qio_channel_pwritev_full
+ * @ioc: the channel object
+ * @iov: the array of memory regions to write data from
+ * @niov: the length of the @iov array
+ * @offset: offset in the channel where writes should begin
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Not all implementations will support this facility, so may report
+ * an error. To avoid errors, the caller may check for the feature
+ * flag QIO_CHANNEL_FEATURE_SEEKABLE prior to calling this method.
+ *
+ * Behaves as qio_channel_writev_full, apart from not supporting
+ * sending of file handles as well as beginning the write at the
+ * passed @offset
+ *
+ */
+ssize_t qio_channel_pwritev_full(QIOChannel *ioc, const struct iovec *iov,
+                                 size_t niov, off_t offset, Error **errp);
+
+/**
+ * qio_channel_pwritev
+ * @ioc: the channel object
+ * @buf: the memory region to write data into
+ * @buflen: the number of bytes to @buf
+ * @offset: offset in the channel where writes should begin
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Not all implementations will support this facility, so may report
+ * an error. To avoid errors, the caller may check for the feature
+ * flag QIO_CHANNEL_FEATURE_SEEKABLE prior to calling this method.
+ *
+ */
+ssize_t qio_channel_pwritev(QIOChannel *ioc, char *buf, size_t buflen,
+                            off_t offset, Error **errp);
+
+/**
+ * qio_channel_preadv_full
+ * @ioc: the channel object
+ * @iov: the array of memory regions to read data into
+ * @niov: the length of the @iov array
+ * @offset: offset in the channel where writes should begin
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Not all implementations will support this facility, so may report
+ * an error.  To avoid errors, the caller may check for the feature
+ * flag QIO_CHANNEL_FEATURE_SEEKABLE prior to calling this method.
+ *
+ * Behaves as qio_channel_readv_full, apart from not supporting
+ * receiving of file handles as well as beginning the read at the
+ * passed @offset
+ *
+ */
+ssize_t qio_channel_preadv_full(QIOChannel *ioc, const struct iovec *iov,
+                                size_t niov, off_t offset, Error **errp);
+
+/**
+ * qio_channel_preadv
+ * @ioc: the channel object
+ * @buf: the memory region to write data into
+ * @buflen: the number of bytes to @buf
+ * @offset: offset in the channel where writes should begin
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Not all implementations will support this facility, so may report
+ * an error.  To avoid errors, the caller may check for the feature
+ * flag QIO_CHANNEL_FEATURE_SEEKABLE prior to calling this method.
+ *
+ */
+ssize_t qio_channel_preadv(QIOChannel *ioc, char *buf, size_t buflen,
+                           off_t offset, Error **errp);
+
 /**
  * qio_channel_shutdown:
  * @ioc: the channel object
diff --git a/io/channel.c b/io/channel.c
index a8c7f11649..312445b3aa 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -445,6 +445,64 @@ GSource *qio_channel_add_watch_source(QIOChannel *ioc,
 }
 
 
+ssize_t qio_channel_pwritev_full(QIOChannel *ioc, const struct iovec *iov,
+                                 size_t niov, off_t offset, Error **errp)
+{
+    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (!klass->io_pwritev) {
+        error_setg(errp, "Channel does not support pwritev");
+        return -1;
+    }
+
+    if (!qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_SEEKABLE)) {
+        error_setg_errno(errp, EINVAL, "Requested channel is not seekable");
+        return -1;
+    }
+
+    return klass->io_pwritev(ioc, iov, niov, offset, errp);
+}
+
+ssize_t qio_channel_pwritev(QIOChannel *ioc, char *buf, size_t buflen,
+                            off_t offset, Error **errp)
+{
+    struct iovec iov = {
+        .iov_base = buf,
+        .iov_len = buflen
+    };
+
+    return qio_channel_pwritev_full(ioc, &iov, 1, offset, errp);
+}
+
+ssize_t qio_channel_preadv_full(QIOChannel *ioc, const struct iovec *iov,
+                                size_t niov, off_t offset, Error **errp)
+{
+    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (!klass->io_preadv) {
+        error_setg(errp, "Channel does not support preadv");
+        return -1;
+    }
+
+    if (!qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_SEEKABLE)) {
+        error_setg_errno(errp, EINVAL, "Requested channel is not seekable");
+        return -1;
+    }
+
+    return klass->io_preadv(ioc, iov, niov, offset, errp);
+}
+
+ssize_t qio_channel_preadv(QIOChannel *ioc, char *buf, size_t buflen,
+                           off_t offset, Error **errp)
+{
+    struct iovec iov = {
+        .iov_base = buf,
+        .iov_len = buflen
+    };
+
+    return qio_channel_preadv_full(ioc, &iov, 1, offset, errp);
+}
+
 int qio_channel_shutdown(QIOChannel *ioc,
                          QIOChannelShutdown how,
                          Error **errp)
-- 
2.35.3


