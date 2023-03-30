Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD78E6D0D4D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:05:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwdG-0003Fi-JT; Thu, 30 Mar 2023 14:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwd8-0003FN-LN
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:10 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwd7-00023c-0X
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:10 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E6B191F86C;
 Thu, 30 Mar 2023 18:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2iIpM0EFvr9p+63Rr5g9tPKF2Wyn2N9bky1lumiT4A=;
 b=DmIt0xElaKmXFCoSxwJIB3Yb0z2AjHFWMrN/876ENsGnj6K50IljkYzb77GUGZzbE+H5aA
 PHpoaSYrsWdUafQzX0VXPz0EOyLQujOra1p6W3w9VGiBM84rtcmf8P/z+cwsHx79VYe1lc
 9OAj6zsupPogExeCzaVfb9HgfxfS/j4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2iIpM0EFvr9p+63Rr5g9tPKF2Wyn2N9bky1lumiT4A=;
 b=EdVcAXmzsvJShHrCgq9geeo8Omm2w8XVR34uyNNZIaceOHRK/LjfEjqjH9KdTfOvx4oO8i
 UeXBSVho9cyU63Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A28D81348E;
 Thu, 30 Mar 2023 18:04:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IG1EGhXPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:05 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Nikolay Borisov <nborisov@suse.com>
Subject: [RFC PATCH v1 09/26] migration/qemu-file: add utility methods for
 working with seekable channels
Date: Thu, 30 Mar 2023 15:03:19 -0300
Message-Id: <20230330180336.2791-10-farosas@suse.de>
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

From: Nikolay Borisov <nborisov@suse.com>

Add utility methods that will be needed when implementing 'fixed-ram'
migration capability.

qemu_file_is_seekable
qemu_put_buffer_at
qemu_get_buffer_at
qemu_set_offset
qemu_get_offset

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
fixed total_transferred accounting

restructured to use qio_channel_file_preadv instead of the _full
variant
---
 include/migration/qemu-file-types.h |  2 +
 migration/qemu-file.c               | 80 +++++++++++++++++++++++++++++
 migration/qemu-file.h               |  4 ++
 3 files changed, 86 insertions(+)

diff --git a/include/migration/qemu-file-types.h b/include/migration/qemu-file-types.h
index 2867e3da84..eb0325ee86 100644
--- a/include/migration/qemu-file-types.h
+++ b/include/migration/qemu-file-types.h
@@ -50,6 +50,8 @@ unsigned int qemu_get_be16(QEMUFile *f);
 unsigned int qemu_get_be32(QEMUFile *f);
 uint64_t qemu_get_be64(QEMUFile *f);
 
+bool qemu_file_is_seekable(QEMUFile *f);
+
 static inline void qemu_put_be64s(QEMUFile *f, const uint64_t *pv)
 {
     qemu_put_be64(f, *pv);
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 102ab3b439..a1f7dbb3d9 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -30,6 +30,7 @@
 #include "qemu-file.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "io/channel-file.h"
 
 #define IO_BUF_SIZE 32768
 #define MAX_IOV_SIZE MIN_CONST(IOV_MAX, 64)
@@ -281,6 +282,10 @@ static void qemu_iovec_release_ram(QEMUFile *f)
     memset(f->may_free, 0, sizeof(f->may_free));
 }
 
+bool qemu_file_is_seekable(QEMUFile *f)
+{
+    return qio_channel_has_feature(f->ioc, QIO_CHANNEL_FEATURE_SEEKABLE);
+}
 
 /**
  * Flushes QEMUFile buffer
@@ -559,6 +564,81 @@ void qemu_put_buffer(QEMUFile *f, const uint8_t *buf, size_t size)
     }
 }
 
+void qemu_put_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t pos)
+{
+    Error *err = NULL;
+
+    if (f->last_error) {
+        return;
+    }
+
+    qemu_fflush(f);
+    qio_channel_pwritev(f->ioc, (char *)buf, buflen, pos, &err);
+
+    if (err) {
+        qemu_file_set_error_obj(f, -EIO, err);
+    } else {
+        f->total_transferred += buflen;
+    }
+
+    return;
+}
+
+
+size_t qemu_get_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t pos)
+{
+    Error *err = NULL;
+    ssize_t ret;
+
+    if (f->last_error) {
+        return 0;
+    }
+
+    ret = qio_channel_preadv(f->ioc, (char *)buf, buflen, pos, &err);
+    if (ret == -1 || err) {
+        goto error;
+    }
+
+    return (size_t)ret;
+
+ error:
+    qemu_file_set_error_obj(f, -EIO, err);
+    return 0;
+}
+
+void qemu_set_offset(QEMUFile *f, off_t off, int whence)
+{
+    Error *err = NULL;
+    off_t ret;
+
+    qemu_fflush(f);
+
+    if (!qemu_file_is_writable(f)) {
+        f->buf_index = 0;
+        f->buf_size = 0;
+    }
+
+    ret = qio_channel_io_seek(f->ioc, off, whence, &err);
+    if (ret == (off_t)-1) {
+        qemu_file_set_error_obj(f, -EIO, err);
+    }
+}
+
+off_t qemu_get_offset(QEMUFile *f)
+{
+    Error *err = NULL;
+    off_t ret;
+
+    qemu_fflush(f);
+
+    ret = qio_channel_io_seek(f->ioc, 0, SEEK_CUR, &err);
+    if (ret == (off_t)-1) {
+        qemu_file_set_error_obj(f, -EIO, err);
+    }
+    return ret;
+}
+
+
 void qemu_put_byte(QEMUFile *f, int v)
 {
     if (f->last_error) {
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 9d0155a2a1..350273b441 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -149,6 +149,10 @@ QEMUFile *qemu_file_get_return_path(QEMUFile *f);
 void qemu_fflush(QEMUFile *f);
 void qemu_file_set_blocking(QEMUFile *f, bool block);
 int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size);
+void qemu_set_offset(QEMUFile *f, off_t off, int whence);
+off_t qemu_get_offset(QEMUFile *f);
+void qemu_put_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t pos);
+size_t qemu_get_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t pos);
 
 void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
-- 
2.35.3


