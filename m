Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF415F9FA3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:50:49 +0200 (CEST)
Received: from localhost ([::1]:60310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtB9-00049s-R4
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvG-0000zx-Nh
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:23 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:56060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvB-0005KH-JI
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:20 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2B1E81F8EE;
 Mon, 10 Oct 2022 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1665408856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n54rH4YDXB8vXHb7YAUSB9HNvXKeghEj2yhto3fIlko=;
 b=lEJGmMrtoAuFIpyrHfyaS9Zs3T+1k2kU9tXiSJ7ofl0+iLXsIdWgPwnZHlK8/uz34zAJkO
 FJGLGVqydoI89QpCLm9YWdB4k5nJbcZlujpcOpMdQGK0xxwo/Pu/Qy+JYLohfsG8bsKMvi
 d/DNPBcNBXdcTG6bgOBRePzGcOESQm4=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD0D713479;
 Mon, 10 Oct 2022 13:34:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yMNgJ1cfRGNsAwAAMHmgww
 (envelope-from <nborisov@suse.com>); Mon, 10 Oct 2022 13:34:15 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v2 05/11] io: Add support for seekable channels
Date: Mon, 10 Oct 2022 16:34:02 +0300
Message-Id: <20221010133408.3214433-6-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010133408.3214433-1-nborisov@suse.com>
References: <20221010133408.3214433-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=nborisov@suse.com; helo=smtp-out2.suse.de
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

 Add a bunch of auxiliarry methods and a feature flag to work with
 SEEKABLE channels. Currently the only channel considered seekable is
 QIOChannelFile. Also add a bunch of helper functions to QEMUFile that
 can make use of this channel feature. All of this is in prepration for
 supporting 'fixed-ram' migration stream feature.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 include/io/channel.h                |  1 +
 include/migration/qemu-file-types.h |  2 +
 io/channel-file.c                   |  5 +++
 migration/qemu-file.c               | 59 +++++++++++++++++++++++++++++
 migration/qemu-file.h               |  3 ++
 5 files changed, 70 insertions(+)

diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee748021..4fc37c78e68c 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -41,6 +41,7 @@ enum QIOChannelFeature {
     QIO_CHANNEL_FEATURE_SHUTDOWN,
     QIO_CHANNEL_FEATURE_LISTEN,
     QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
+    QIO_CHANNEL_FEATURE_SEEKABLE,
 };
 
 
diff --git a/include/migration/qemu-file-types.h b/include/migration/qemu-file-types.h
index 2867e3da84ab..eb0325ee8687 100644
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
diff --git a/io/channel-file.c b/io/channel-file.c
index da17d0a11ba7..d84a6737f2f7 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -35,6 +35,7 @@ qio_channel_file_new_fd(int fd)
 
     ioc->fd = fd;
 
+    qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);
     trace_qio_channel_file_new_fd(ioc, fd);
 
     return ioc;
@@ -59,6 +60,10 @@ qio_channel_file_new_path(const char *path,
         return NULL;
     }
 
+    if (lseek(ioc->fd, 0, SEEK_CUR) != (off_t)-1) {
+        qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);
+    }
+
     trace_qio_channel_file_new_path(ioc, path, flags, mode, ioc->fd);
 
     return ioc;
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 4f400c2e5265..07ba1125e83f 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -30,6 +30,7 @@
 #include "qemu-file.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "io/channel-file.h"
 
 #define IO_BUF_SIZE 32768
 #define MAX_IOV_SIZE MIN_CONST(IOV_MAX, 64)
@@ -260,6 +261,10 @@ static void qemu_iovec_release_ram(QEMUFile *f)
     memset(f->may_free, 0, sizeof(f->may_free));
 }
 
+bool qemu_file_is_seekable(QEMUFile *f)
+{
+    return qio_channel_has_feature(f->ioc, QIO_CHANNEL_FEATURE_SEEKABLE);
+}
 
 /**
  * Flushes QEMUFile buffer
@@ -538,6 +543,60 @@ void qemu_put_buffer(QEMUFile *f, const uint8_t *buf, size_t size)
     }
 }
 
+void qemu_put_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t pos)
+{
+    Error *err = NULL;
+    struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
+
+    if (f->last_error) {
+        return;
+    }
+
+    qemu_fflush(f);
+
+    if (qio_channel_file_pwritev(f->ioc, &iov, 1, pos, &err) == (off_t)-1)
+        goto error;
+
+    return;
+
+ error:
+    qemu_file_set_error_obj(f, -EIO, err);
+    return;
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
+	    f->buf_index = 0;
+	    f->buf_size = 0;
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
index fa13d04d787c..33cfc07b81d1 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -148,6 +148,9 @@ int qemu_file_shutdown(QEMUFile *f);
 QEMUFile *qemu_file_get_return_path(QEMUFile *f);
 void qemu_fflush(QEMUFile *f);
 void qemu_file_set_blocking(QEMUFile *f, bool block);
+void qemu_set_offset(QEMUFile *f, off_t off, int whence);
+off_t qemu_get_offset(QEMUFile *f);
+void qemu_put_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t pos);
 
 void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
-- 
2.34.1


