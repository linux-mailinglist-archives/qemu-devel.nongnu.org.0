Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAA06D0D60
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:06:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwdl-0003dx-5i; Thu, 30 Mar 2023 14:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwde-0003UN-PH
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:42 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdc-0002A6-QS
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:42 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 080141F86C;
 Thu, 30 Mar 2023 18:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxYLf4ThcdyP8XrOyqsCtaDbjIGCxRI1LOVpHdLT+OI=;
 b=k/Bmc7SpIbLY2PW2jpPwEb7YNkiHLj3Y1fIls5mg+MHiR7PGkKCww70YkDQRWsD2OBRDS2
 o3jYgk22zh93JIuUyZQ0CHltqvMeIxrELDnd/iEWZXEF8py+XfOBGNmYDR8O6TcWu9otDG
 ykep2nyVt+ezUyGqxUmIl21EbCz8XHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199479;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxYLf4ThcdyP8XrOyqsCtaDbjIGCxRI1LOVpHdLT+OI=;
 b=WV2yG0Cq3mkKOr+PnHzrN8KCWfZaiX1re6D3OiV9nDwVMn++tDeM61vkYcWsxPOignuMY8
 501JdlLz0fHpNxAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E940C1348E;
 Thu, 30 Mar 2023 18:04:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +N1sKzTPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:36 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC PATCH v1 20/26] io: Add a pwritev/preadv version that takes a
 discontiguous iovec
Date: Thu, 30 Mar 2023 15:03:30 -0300
Message-Id: <20230330180336.2791-21-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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

For the upcoming support to fixed-ram migration with multifd, we need
to be able to accept an iovec array with non-contiguous data.

Add a pwritev and preadv version that splits the array into contiguous
segments before writing. With that we can have the ram code continue
to add pages in any order and the multifd code continue to send large
arrays for reading and writing.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Since iovs can be non contiguous, we'd need a separate array on the
side to carry an extra file offset for each of them, so I'm relying on
the fact that iovs are all within a same host page and passing in an
encoded offset that takes the host page into account.
---
 include/io/channel.h | 50 +++++++++++++++++++++++++++
 io/channel.c         | 82 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/include/io/channel.h b/include/io/channel.h
index 28bce7ef17..7c4d2432cf 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -33,8 +33,10 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
 #define QIO_CHANNEL_ERR_BLOCK -2
 
 #define QIO_CHANNEL_WRITE_FLAG_ZERO_COPY 0x1
+#define QIO_CHANNEL_WRITE_FLAG_WITH_OFFSET 0x2
 
 #define QIO_CHANNEL_READ_FLAG_MSG_PEEK 0x1
+#define QIO_CHANNEL_READ_FLAG_WITH_OFFSET 0x2
 
 typedef enum QIOChannelFeature QIOChannelFeature;
 
@@ -541,6 +543,30 @@ int qio_channel_close(QIOChannel *ioc,
 ssize_t qio_channel_pwritev_full(QIOChannel *ioc, const struct iovec *iov,
                                  size_t niov, off_t offset, Error **errp);
 
+/**
+ * qio_channel_write_full_all:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to write data from
+ * @niov: the length of the @iov array
+ * @offset: the iovec offset in the file where to write the data
+ * @fds: an array of file handles to send
+ * @nfds: number of file handles in @fds
+ * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
+ * @errp: pointer to a NULL-initialized error object
+ *
+ *
+ * Selects between a writev or pwritev channel writer function.
+ *
+ * If QIO_CHANNEL_WRITE_FLAG_OFFSET is passed in flags, pwritev is
+ * used and @offset is expected to be a meaningful value, @fds and
+ * @nfds are ignored; otherwise uses writev and @offset is ignored.
+ *
+ * Returns: 0 if all bytes were written, or -1 on error
+ */
+int qio_channel_write_full_all(QIOChannel *ioc, const struct iovec *iov,
+                               size_t niov, off_t offset, int *fds, size_t nfds,
+                               int flags, Error **errp);
+
 /**
  * qio_channel_pwritev
  * @ioc: the channel object
@@ -577,6 +603,30 @@ ssize_t qio_channel_pwritev(QIOChannel *ioc, char *buf, size_t buflen,
 ssize_t qio_channel_preadv_full(QIOChannel *ioc, const struct iovec *iov,
                                 size_t niov, off_t offset, Error **errp);
 
+/**
+ * qio_channel_read_full_all:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to read data to
+ * @niov: the length of the @iov array
+ * @offset: the iovec offset in the file from where to read the data
+ * @fds: an array of file handles to send
+ * @nfds: number of file handles in @fds
+ * @flags: read flags (QIO_CHANNEL_READ_FLAG_*)
+ * @errp: pointer to a NULL-initialized error object
+ *
+ *
+ * Selects between a readv or preadv channel reader function.
+ *
+ * If QIO_CHANNEL_READ_FLAG_OFFSET is passed in flags, preadv is
+ * used and @offset is expected to be a meaningful value, @fds and
+ * @nfds are ignored; otherwise uses readv and @offset is ignored.
+ *
+ * Returns: 0 if all bytes were read, or -1 on error
+ */
+int qio_channel_read_full_all(QIOChannel *ioc, const struct iovec *iov,
+                              size_t niov, off_t offset,
+                              int flags, Error **errp);
+
 /**
  * qio_channel_preadv
  * @ioc: the channel object
diff --git a/io/channel.c b/io/channel.c
index 312445b3aa..64b26040c2 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -463,6 +463,76 @@ ssize_t qio_channel_pwritev_full(QIOChannel *ioc, const struct iovec *iov,
     return klass->io_pwritev(ioc, iov, niov, offset, errp);
 }
 
+static int qio_channel_preadv_pwritev_contiguous(QIOChannel *ioc,
+                                                 const struct iovec *iov,
+                                                 size_t niov, off_t offset,
+                                                 bool is_write, Error **errp)
+{
+    ssize_t ret;
+    int i, slice_idx, slice_num;
+    uint64_t base, next, file_offset;
+    size_t len;
+
+    slice_idx = 0;
+    slice_num = 1;
+
+    /*
+     * If the iov array doesn't have contiguous elements, we need to
+     * split it in slices because we only have one (file) 'offset' for
+     * the whole iov. Do this here so callers don't need to break the
+     * iov array themselves.
+     */
+    for (i = 0; i < niov; i++, slice_num++) {
+        base = (uint64_t) iov[i].iov_base;
+
+        if (i != niov - 1) {
+            len = iov[i].iov_len;
+            next = (uint64_t) iov[i + 1].iov_base;
+
+            if (base + len == next) {
+                continue;
+            }
+        }
+
+        /*
+         * Use the offset of the first element of the segment that
+         * we're sending.
+         */
+        file_offset = offset + (uint64_t) iov[slice_idx].iov_base;
+
+        if (is_write) {
+            ret = qio_channel_pwritev_full(ioc, &iov[slice_idx], slice_num,
+                                           file_offset, errp);
+        } else {
+            ret = qio_channel_preadv_full(ioc, &iov[slice_idx], slice_num,
+                                          file_offset, errp);
+        }
+
+        if (ret < 0) {
+            break;
+        }
+
+        slice_idx += slice_num;
+        slice_num = 0;
+    }
+
+    return (ret < 0) ? -1 : 0;
+}
+
+int qio_channel_write_full_all(QIOChannel *ioc,
+                                const struct iovec *iov,
+                                size_t niov, off_t offset,
+                                int *fds, size_t nfds,
+                                int flags, Error **errp)
+{
+    if (flags & QIO_CHANNEL_WRITE_FLAG_WITH_OFFSET) {
+        return qio_channel_preadv_pwritev_contiguous(ioc, iov, niov,
+                                                     offset, true, errp);
+    }
+
+    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, flags, errp);
+}
+
 ssize_t qio_channel_pwritev(QIOChannel *ioc, char *buf, size_t buflen,
                             off_t offset, Error **errp)
 {
@@ -492,6 +562,18 @@ ssize_t qio_channel_preadv_full(QIOChannel *ioc, const struct iovec *iov,
     return klass->io_preadv(ioc, iov, niov, offset, errp);
 }
 
+int qio_channel_read_full_all(QIOChannel *ioc, const struct iovec *iov,
+                              size_t niov, off_t offset,
+                              int flags, Error **errp)
+{
+    if (flags & QIO_CHANNEL_READ_FLAG_WITH_OFFSET) {
+        return qio_channel_preadv_pwritev_contiguous(ioc, iov, niov,
+                                                     offset, false, errp);
+    }
+
+    return qio_channel_readv_full_all(ioc, iov, niov, NULL, NULL, errp);
+}
+
 ssize_t qio_channel_preadv(QIOChannel *ioc, char *buf, size_t buflen,
                            off_t offset, Error **errp)
 {
-- 
2.35.3


