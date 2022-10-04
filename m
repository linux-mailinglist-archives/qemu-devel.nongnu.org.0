Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439675F4378
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 14:49:31 +0200 (CEST)
Received: from localhost ([::1]:56330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhMX-0003SW-7L
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 08:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ofhBD-0006mJ-2M
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 08:37:49 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:49898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ofhB9-0005rE-Th
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 08:37:46 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3BC611F8D9;
 Tue,  4 Oct 2022 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1664887060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQIQjZe3/s5Z7h2Qk9gj7o9NRBQIR6PIhbUVeetfc3Q=;
 b=fWDEKSou/ayPfjtVJct0NFmqyC0qUEvtrD/lRbw8hCl7ajkvSdu6xgynEWXy4P37sivwJr
 wlbBvRWBerF6VQhU/1aKCl35RSFkkxTfOPp9rPMTjpTCjcCWR4mtC5iYDL7RxX5WakOBbJ
 flk1R2SFfYDYHNEb0GYvq4x9L00P/bo=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C3A4D139EF;
 Tue,  4 Oct 2022 12:37:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kHECKRMpPGNlRQAAMHmgww
 (envelope-from <nborisov@suse.com>); Tue, 04 Oct 2022 12:37:39 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH 04/11] io: add pwritev support to QIOChannelFile
Date: Tue,  4 Oct 2022 15:37:26 +0300
Message-Id: <20221004123733.2745519-5-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004123733.2745519-1-nborisov@suse.com>
References: <20221004123733.2745519-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=nborisov@suse.com; helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The upcoming 'fixed-ram' feature would require qemu to write data at
specific offsets of the file. This is currently missing so this patch
adds it. I've chosen to implement it as a type-specific function rather
than plumb it through the generic channel interface as it relies on
being able to do seeks.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 include/io/channel-file.h |  5 +++++
 io/channel-file.c         | 24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/io/channel-file.h b/include/io/channel-file.h
index 50e8eb113868..0a5d54f5e58e 100644
--- a/include/io/channel-file.h
+++ b/include/io/channel-file.h
@@ -89,4 +89,9 @@ qio_channel_file_new_path(const char *path,
                           mode_t mode,
                           Error **errp);
 
+ssize_t qio_channel_file_pwritev(QIOChannel *ioc,
+				 const struct iovec *iov,
+				 size_t niov,
+				 off_t offset,
+				 Error **errp);
 #endif /* QIO_CHANNEL_FILE_H */
diff --git a/io/channel-file.c b/io/channel-file.c
index b67687c2aa64..da17d0a11ba7 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -136,6 +136,30 @@ static ssize_t qio_channel_file_writev(QIOChannel *ioc,
     return ret;
 }
 
+ssize_t qio_channel_file_pwritev(QIOChannel *ioc,
+				 const struct iovec *iov,
+				 size_t niov,
+				 off_t offset,
+				 Error **errp)
+{
+    QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
+    ssize_t ret;
+
+ retry:
+    ret = pwritev(fioc->fd, iov, niov, offset);
+    if (ret <= 0) {
+        if (errno == EAGAIN) {
+            return QIO_CHANNEL_ERR_BLOCK;
+        }
+        if (errno == EINTR) {
+            goto retry;
+        }
+        error_setg_errno(errp, errno, "Unable to write to file");
+        return -1;
+    }
+    return ret;
+}
+
 static int qio_channel_file_set_blocking(QIOChannel *ioc,
                                          bool enabled,
                                          Error **errp)
-- 
2.34.1


