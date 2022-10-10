Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C695F9F9D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:45:49 +0200 (CEST)
Received: from localhost ([::1]:51790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oht6K-0000tF-Bd
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvG-000107-Lp
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:23 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:58910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvB-0005KM-SD
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:20 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B5F53219C6;
 Mon, 10 Oct 2022 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1665408856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0bgJgCM33zbCqV4mVPXZ/sO1OZ9p9oU0UmvOIN5fLA=;
 b=vSgf/FL5HbUkfAwCEfX8wTa+M+Ji6zn3REQK1hQWZ02fKIRtVLEWTceA4mKX7c713N6LHV
 dvA6tQUsGW4W8wh2SpLCBiotNr9/wlTTUVL1w3WB8Jm8eEq8L5nUticmt6ccZwtrx/ObTr
 srsnLMnlULLly6cGYFhrovNQz9khndI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CD1813479;
 Mon, 10 Oct 2022 13:34:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CNELDFgfRGNsAwAAMHmgww
 (envelope-from <nborisov@suse.com>); Mon, 10 Oct 2022 13:34:16 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v2 06/11] io: Add preadv support to QIOChannelFile
Date: Mon, 10 Oct 2022 16:34:03 +0300
Message-Id: <20221010133408.3214433-7-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010133408.3214433-1-nborisov@suse.com>
References: <20221010133408.3214433-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=nborisov@suse.com; helo=smtp-out1.suse.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

preadv is going to be needed when 'fixed-ram'-enabled stream are to be
restored. Simply add a wrapper around preadv that's specific to
QIOChannelFile.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 include/io/channel-file.h |  5 +++++
 io/channel-file.c         | 26 ++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/io/channel-file.h b/include/io/channel-file.h
index 0a5d54f5e58e..2187f5affd23 100644
--- a/include/io/channel-file.h
+++ b/include/io/channel-file.h
@@ -89,6 +89,11 @@ qio_channel_file_new_path(const char *path,
                           mode_t mode,
                           Error **errp);
 
+ssize_t qio_channel_file_preadv(QIOChannel *ioc,
+			       const struct iovec *iov,
+			       size_t niov,
+			       off_t offset,
+			       Error **errp);
 ssize_t qio_channel_file_pwritev(QIOChannel *ioc,
 				 const struct iovec *iov,
 				 size_t niov,
diff --git a/io/channel-file.c b/io/channel-file.c
index d84a6737f2f7..edca64ad63a7 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -141,6 +141,32 @@ static ssize_t qio_channel_file_writev(QIOChannel *ioc,
     return ret;
 }
 
+ssize_t qio_channel_file_preadv(QIOChannel *ioc,
+			       const struct iovec *iov,
+			       size_t niov,
+			       off_t offset,
+			       Error **errp)
+{
+    QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
+    ssize_t ret;
+
+ retry:
+    ret = preadv(fioc->fd, iov, niov, offset);
+    if (ret < 0) {
+        if (errno == EAGAIN) {
+            return QIO_CHANNEL_ERR_BLOCK;
+        }
+        if (errno == EINTR) {
+            goto retry;
+        }
+
+        error_setg_errno(errp, errno, "Unable to read from file");
+        return -1;
+    }
+
+    return ret;
+}
+
 ssize_t qio_channel_file_pwritev(QIOChannel *ioc,
 				 const struct iovec *iov,
 				 size_t niov,
-- 
2.34.1


