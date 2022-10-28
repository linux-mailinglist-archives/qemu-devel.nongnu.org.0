Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662DB610EC9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:41:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMlq-0002Ci-Cj; Fri, 28 Oct 2022 06:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMlm-0002At-QB
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:22 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMlk-00020D-Ha
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:22 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9A873219B7;
 Fri, 28 Oct 2022 10:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666953558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2f9WwEcMIdwR9UDR42xe8YzlVcRbtdm1BcDgGbCpfs=;
 b=PrZUhkAX0c6AsQY+6Gw7EwfVbKUXEEvony0QYSu3XiTQ9TUr2adQWzKMVHQ0PaeHmsZ0pp
 TmYqeLugAF+Xxp7mxiAf0eOOasHtp8tlymCbLY9VxS2gB9rP2qs2l5/GmXkrdDMjJugEOf
 zOuKrwzCAjbE7BWalBmlyXq1P6TcgKQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3699B13A6E;
 Fri, 28 Oct 2022 10:39:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +AzDClaxW2PVPwAAMHmgww
 (envelope-from <nborisov@suse.com>); Fri, 28 Oct 2022 10:39:18 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v3 04/14] io: Add generic pwritev/preadv interface
Date: Fri, 28 Oct 2022 13:39:04 +0300
Message-Id: <20221028103914.908728-5-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028103914.908728-1-nborisov@suse.com>
References: <20221028103914.908728-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=nborisov@suse.com; helo=smtp-out1.suse.de
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Introduce basic pwriteve/preadv support in the generic channel layer.
SPecific implementation will follow for the file channel as this is
required in order to support migration streams with fixed location of
each ram page.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 include/io/channel.h | 49 ++++++++++++++++++++++++++++++++++++++++++++
 io/channel.c         | 26 +++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee748021..6b10bce8bbdf 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -124,6 +124,16 @@ struct QIOChannelClass {
                            Error **errp);
 
     /* Optional callbacks */
+    ssize_t (*io_pwritev)(QIOChannel *ioc,
+                       const struct iovec *iov,
+                       size_t niov,
+                       off_t offset,
+                       Error **errp);
+    ssize_t (*io_preadv)(QIOChannel *ioc,
+                      const struct iovec *iov,
+                      size_t niov,
+                      off_t offset,
+                      Error **errp);
     int (*io_shutdown)(QIOChannel *ioc,
                        QIOChannelShutdown how,
                        Error **errp);
@@ -504,6 +514,45 @@ int qio_channel_set_blocking(QIOChannel *ioc,
 int qio_channel_close(QIOChannel *ioc,
                       Error **errp);
 
+
+/**
+ * qio_channel_io_pwritev
+ * @ioc: the channel object
+ * @iov: the array of memory regions to write data from
+ * @niov: the length of the @iov array
+ * @offset: offset in the channel where writes should begin
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Not all implementations will support this facility, so may report an error.
+ * To avoid errors, the caller may check for the feature flag
+ * QIO_CHANNEL_FEATURE_SEEKABLE prior to calling this method.
+ *
+ * Behaves as qio_channel_writev_full, apart from not supporting sending of file
+ * handles as well as beginning the write at the passed @offset
+ *
+ */
+ssize_t qio_channel_io_pwritev(QIOChannel *ioc, const struct iovec *iov,
+                               size_t niov, off_t offset, Error **errp);
+
+
+/**
+ * qio_channel_io_preadv
+ * @ioc: the channel object
+ * @iov: the array of memory regions to read data into
+ * @niov: the length of the @iov array
+ * @offset: offset in the channel where writes should begin
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Not all implementations will support this facility, so may report an error.
+ * To avoid errors, the caller may check for the feature flag
+ * QIO_CHANNEL_FEATURE_SEEKABLE prior to calling this method.
+ *
+ * Behaves as qio_channel_readv_full, apart from not supporting receiving of file
+ * handles as well as beginning the read at the passed @offset
+ *
+ */
+ssize_t qio_channel_io_preadv(QIOChannel *ioc, const struct iovec *iov,
+                             size_t niov, off_t offset, Error **errp);
 /**
  * qio_channel_shutdown:
  * @ioc: the channel object
diff --git a/io/channel.c b/io/channel.c
index 0640941ac573..f5ac9499a7ad 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -437,6 +437,32 @@ GSource *qio_channel_add_watch_source(QIOChannel *ioc,
 }
 
 
+ssize_t qio_channel_io_pwritev(QIOChannel *ioc, const struct iovec *iov,
+                               size_t niov, off_t offset, Error **errp)
+{
+    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (!klass->io_pwritev) {
+        error_setg(errp, "Channel does not support pwritev");
+        return -1;
+    }
+
+    return klass->io_pwritev(ioc, iov, niov, offset, errp);
+}
+
+ssize_t qio_channel_io_preadv(QIOChannel *ioc, const struct iovec *iov,
+                               size_t niov, off_t offset, Error **errp)
+{
+    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (!klass->io_preadv) {
+        error_setg(errp, "Channel does not support preadv");
+        return -1;
+    }
+
+    return klass->io_preadv(ioc, iov, niov, offset, errp);
+}
+
 int qio_channel_shutdown(QIOChannel *ioc,
                          QIOChannelShutdown how,
                          Error **errp)
-- 
2.34.1


