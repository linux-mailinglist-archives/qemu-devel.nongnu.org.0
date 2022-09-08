Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704085B1A0A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:33:13 +0200 (CEST)
Received: from localhost ([::1]:54388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEqO-000330-KM
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oWEk4-0000kl-R1
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:26:40 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:41804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oWEk1-0002eO-VK
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:26:39 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0B90533E68;
 Thu,  8 Sep 2022 10:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1662632796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVqxBVy7HJIFnY2dFaXcWtWhmyceYsH1kO2et7fgC5Q=;
 b=UJ+fV04muVe9u8lIm+qbMYd7JraNbkzuuxPMW4XIDFu8m9ASO9XdyQUJs4BpLHVMCl/MJA
 4QSJ4iW70x2TbLkSBbhfBm+nJaeIpL+pc9I58l5L6cAjBhQsEW7K8TQflfvpyIGEX8oMmH
 EIxltMbz9URaMVGlu0M83ZA+nYfWb94=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 934071322C;
 Thu,  8 Sep 2022 10:26:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xtAyIVvDGWPvYgAAMHmgww
 (envelope-from <nborisov@suse.com>); Thu, 08 Sep 2022 10:26:35 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, dgilbert@redhat.com, jfehlig@suse.com,
 Claudio.Fontana@suse.com, quintela@redhat.com,
 Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH] migration: support file: uri for source migration
Date: Thu,  8 Sep 2022 13:26:32 +0300
Message-Id: <20220908102633.123536-1-nborisov@suse.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b727f0da-8051-2ce5-b1ab-a57452d2b0c3@suse.com>
References: <b727f0da-8051-2ce5-b1ab-a57452d2b0c3@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=nborisov@suse.com;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is a prototype of supporting a 'file:' based uri protocol for
writing out the migration stream of qemu. Currently the code always
opens the file in DIO mode and adheres to an alignment of 64k to be
generic enough. However this comes with a problem - it requires copying
all data that we are writing (qemu metadata + guest ram pages) to a
bounce buffer so that we adhere to this alignment. With this code I get
the following performance results:

      DIO              exec: cat > file         virsh --bypass-cache
      82		     		77							81
      82		    	    78							80
      80		    	    80							82
      82		    	    82							77
      77		    	    79							77

AVG:  80.6		     		79.2						79.4
stddev: 1.959		     	1.720						2.05

All numbers are in seconds.

Those results are somewhat surprising to me as I'd expected doing the
writeout directly within qemu and avoiding copying between qemu and
virsh's iohelper process would result in a speed up. Clearly that's not
the case, I attribute this to the fact that all memory pages have to be
copied into the bounce buffer. There are more measurements/profiling
work that I'd have to do in order to (dis)prove this hypotheses and will
report back when I have the data.

However I'm sending the code now as I'd like to facilitate a discussion
as to whether this is an approach that would be acceptable to upstream
merging. Any ideas/comments would be much appreciated.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 include/io/channel-file.h |   1 +
 include/io/channel.h      |   1 +
 io/channel-file.c         |  17 +++++++
 migration/meson.build     |   1 +
 migration/migration.c     |   4 ++
 migration/migration.h     |   2 +
 migration/qemu-file.c     | 104 +++++++++++++++++++++++++++++++++++++-
 7 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/include/io/channel-file.h b/include/io/channel-file.h
index 50e8eb113868..6cb0b698c62c 100644
--- a/include/io/channel-file.h
+++ b/include/io/channel-file.h
@@ -89,4 +89,5 @@ qio_channel_file_new_path(const char *path,
                           mode_t mode,
                           Error **errp);

+void qio_channel_file_disable_dio(QIOChannelFile *ioc);
 #endif /* QIO_CHANNEL_FILE_H */
diff --git a/include/io/channel.h b/include/io/channel.h
index c680ee748021..6127ff6c0626 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -41,6 +41,7 @@ enum QIOChannelFeature {
     QIO_CHANNEL_FEATURE_SHUTDOWN,
     QIO_CHANNEL_FEATURE_LISTEN,
     QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
+    QIO_CHANNEL_FEATURE_DIO,
 };


diff --git a/io/channel-file.c b/io/channel-file.c
index b67687c2aa64..5c7211b128f1 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -59,6 +59,10 @@ qio_channel_file_new_path(const char *path,
         return NULL;
     }

+    if (flags & O_DIRECT) {
+	    qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_DIO);
+    }
+
     trace_qio_channel_file_new_path(ioc, path, flags, mode, ioc->fd);

     return ioc;
@@ -109,6 +113,19 @@ static ssize_t qio_channel_file_readv(QIOChannel *ioc,
     return ret;
 }

+
+void qio_channel_file_disable_dio(QIOChannelFile *ioc)
+{
+	int flags = fcntl(ioc->fd, F_GETFL);
+	if (flags == -1) {
+		//handle failure
+	}
+
+	if (fcntl(ioc->fd, F_SETFL, (flags & ~O_DIRECT)) == -1) {
+		error_report("Can't disable O_DIRECT");
+	}
+}
+
 static ssize_t qio_channel_file_writev(QIOChannel *ioc,
                                        const struct iovec *iov,
                                        size_t niov,
diff --git a/migration/meson.build b/migration/meson.build
index 690487cf1a81..30a8392701c3 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -17,6 +17,7 @@ softmmu_ss.add(files(
   'colo.c',
   'exec.c',
   'fd.c',
+  'file.c',
   'global_state.c',
   'migration.c',
   'multifd.c',
diff --git a/migration/migration.c b/migration/migration.c
index bb8bbddfe467..e7e84ae12066 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -20,6 +20,7 @@
 #include "migration/blocker.h"
 #include "exec.h"
 #include "fd.h"
+#include "file.h"
 #include "socket.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
@@ -2414,6 +2415,8 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         exec_start_outgoing_migration(s, p, &local_err);
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_outgoing_migration(s, p, &local_err);
+    } else if (strstart(uri, "file:", &p)) {
+	file_start_outgoing_migration(s, p, &local_err);
     } else {
         if (!(has_resume && resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
@@ -4307,6 +4310,7 @@ void migration_global_dump(Monitor *mon)
 static Property migration_properties[] = {
     DEFINE_PROP_BOOL("store-global-state", MigrationState,
                      store_global_state, true),
+    DEFINE_PROP_BOOL("use-direct", MigrationState, use_dio, false),
     DEFINE_PROP_BOOL("send-configuration", MigrationState,
                      send_configuration, true),
     DEFINE_PROP_BOOL("send-section-footer", MigrationState,
diff --git a/migration/migration.h b/migration/migration.h
index cdad8aceaaab..fa1a996bdd4e 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -336,6 +336,8 @@ struct MigrationState {
      */
     bool store_global_state;

+    bool use_dio;
+
     /* Whether we send QEMU_VM_CONFIGURATION during migration */
     bool send_configuration;
     /* Whether we send section footer during migration */
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 4f400c2e5265..18a2fefccd00 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -30,9 +30,14 @@
 #include "qemu-file.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "qemu/memalign.h"
+#include "qemu/error-report.h"
+#include "migration.h"
+#include "io/channel-file.h"

 #define IO_BUF_SIZE 32768
 #define MAX_IOV_SIZE MIN_CONST(IOV_MAX, 64)
+#define DIO_BUF_SIZE (8*IO_BUF_SIZE)

 struct QEMUFile {
     const QEMUFileHooks *hooks;
@@ -56,6 +61,8 @@ struct QEMUFile {
     int buf_index;
     int buf_size; /* 0 when writing */
     uint8_t buf[IO_BUF_SIZE];
+    uint8_t *dio_buf;
+    int dio_buf_index;

     DECLARE_BITMAP(may_free, MAX_IOV_SIZE);
     struct iovec iov[MAX_IOV_SIZE];
@@ -65,6 +72,7 @@ struct QEMUFile {
     Error *last_error_obj;
     /* has the file has been shutdown */
     bool shutdown;
+    bool closing;
 };

 /*
@@ -115,6 +123,7 @@ static QEMUFile *qemu_file_new_impl(QIOChannel *ioc, bool is_writable)
     object_ref(ioc);
     f->ioc = ioc;
     f->is_writable = is_writable;
+    f->dio_buf = qemu_memalign(64*1024, DIO_BUF_SIZE);

     return f;
 }
@@ -260,6 +269,76 @@ static void qemu_iovec_release_ram(QEMUFile *f)
     memset(f->may_free, 0, sizeof(f->may_free));
 }

+#define in_range(b, first, len) ((uintptr_t)(b) >= (uintptr_t)(first) && (uintptr_t)(b) < (uintptr_t)(first) + (len))
+
+static void qemu_fflush_dio(QEMUFile *f)
+{
+	do  {
+		int i;
+		int new_ioveccnt = 0;
+		for (i = 0; i < f->iovcnt && f->dio_buf_index < DIO_BUF_SIZE; i++) {
+			struct iovec *vec = &f->iov[i];
+			size_t copy_len = MIN(vec->iov_len, DIO_BUF_SIZE - f->dio_buf_index);
+
+			/* if the iovec contains inline buf, adjust buf_index
+			 * accordingly
+			 */
+			if (in_range(vec->iov_base, f->buf, IO_BUF_SIZE)) {
+				f->buf_index -= copy_len;
+			}
+
+			memcpy(f->dio_buf+f->dio_buf_index, vec->iov_base, copy_len);
+			f->dio_buf_index += copy_len;
+			/* In case we couldn't fit the full iovec */
+			if (copy_len < vec->iov_len) {
+				// partial write or no write at all;
+				vec->iov_base += copy_len;
+				vec->iov_len -= copy_len;
+				break;
+			}
+		}
+
+		new_ioveccnt = f->iovcnt - i;
+		/*
+		 * DIO buf has been filled but we still have outstanding iovecs
+		 * so shift them to the beginning of iov array for subsequent
+		 * flushing
+		 */
+		for (int j = 0; i < f->iovcnt; j++, i++) {
+			f->iov[j] = f->iov[i];
+		}
+		f->iovcnt = new_ioveccnt;
+
+
+		/*
+		 * DIO BUFF is either full or this is the final flush, in the
+		 * latter case it's guaranteed that the fd is now in buffered
+		 * mode so we simply write anything which is outstanding
+		 */
+		if (f->dio_buf_index == DIO_BUF_SIZE || f->closing) {
+			Error *local_error = NULL;
+			struct iovec dio_iovec = {.iov_base = f->dio_buf,
+				.iov_len = f->dio_buf_index };
+
+			/*
+			 * This is the last flush so revert back to buffered
+			 * write
+			 */
+			if (f->closing) {
+				qio_channel_file_disable_dio(QIO_CHANNEL_FILE(f->ioc));
+			}
+
+			if (qio_channel_writev_all(f->ioc, &dio_iovec, 1, &local_error) < 0) {
+				qemu_file_set_error_obj(f, -EIO, local_error);
+			} else {
+				f->total_transferred += dio_iovec.iov_len;
+			}
+
+			f->dio_buf_index = 0;
+		}
+	} while (f->iovcnt);
+
+}

 /**
  * Flushes QEMUFile buffer
@@ -276,6 +355,12 @@ void qemu_fflush(QEMUFile *f)
     if (f->shutdown) {
         return;
     }
+
+    if (qio_channel_has_feature(f->ioc, QIO_CHANNEL_FEATURE_DIO)) {
+	    qemu_fflush_dio(f);
+	    return;
+    }
+
     if (f->iovcnt > 0) {
         Error *local_error = NULL;
         if (qio_channel_writev_all(f->ioc,
@@ -434,6 +519,8 @@ void qemu_file_credit_transfer(QEMUFile *f, size_t size)
 int qemu_fclose(QEMUFile *f)
 {
     int ret, ret2;
+
+    f->closing = true;
     qemu_fflush(f);
     ret = qemu_file_get_error(f);

@@ -450,6 +537,7 @@ int qemu_fclose(QEMUFile *f)
         ret = f->last_error;
     }
     error_free(f->last_error_obj);
+    qemu_vfree(f->dio_buf);
     g_free(f);
     trace_qemu_file_fclose();
     return ret;
@@ -706,6 +794,10 @@ int64_t qemu_file_total_transferred_fast(QEMUFile *f)
     int64_t ret = f->total_transferred;
     int i;

+    if (qio_channel_has_feature(f->ioc, QIO_CHANNEL_FEATURE_DIO)) {
+	    ret += f->dio_buf_index;
+    }
+
     for (i = 0; i < f->iovcnt; i++) {
         ret += f->iov[i].iov_len;
     }
@@ -715,8 +807,18 @@ int64_t qemu_file_total_transferred_fast(QEMUFile *f)

 int64_t qemu_file_total_transferred(QEMUFile *f)
 {
+    int64_t total_transferred = 0;
     qemu_fflush(f);
-    return f->total_transferred;
+    total_transferred += f->total_transferred;
+    /*
+     * If we are a DIO channel then adjust total transferred with possible bytes
+     * which might not have been totally written but are in the staging dio
+     * buffer
+     */
+    if (qio_channel_has_feature(f->ioc, QIO_CHANNEL_FEATURE_DIO)) {
+	    total_transferred += f->dio_buf_index;
+    }
+    return total_transferred;
 }

 int qemu_file_rate_limit(QEMUFile *f)
--
2.25.1


