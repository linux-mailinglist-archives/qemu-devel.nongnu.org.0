Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F5B6D0D68
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:07:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwde-0003NY-Bu; Thu, 30 Mar 2023 14:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdY-0003Ls-Ak
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:36 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdU-00027V-MI
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:34 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6077D1F86C;
 Thu, 30 Mar 2023 18:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGH+5ko9m4lHRTeAUdNka2KpY3vjmqBzojbedAqahic=;
 b=pMrGB0hj3AoDXSm1CT2NEgBiX984RFZ8mA5ZERa6wR2iGuKka1TbX6dH4ChuIRx7ohldAv
 nuLocOVdu6oqO2jCmlSgzCjQul+HyU/K4z+EPUpEFxAes+l3VigASY3NNeE3lLZwGlw+la
 8d5JcanU+KMWkme0fIiiRMjvLwGKxVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199471;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGH+5ko9m4lHRTeAUdNka2KpY3vjmqBzojbedAqahic=;
 b=5zcc3WXsJDAwHmC2fK/vl6+H3yzAFimi6tN13N2b7+xGi7EikniyC+NVfiN9yzFUQRRB2b
 mn8ecDN/2W8UEYBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 51D521348E;
 Thu, 30 Mar 2023 18:04:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eCx4Bi3PJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:29 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC PATCH v1 17/26] migration/multifd: Add outgoing QIOChannelFile
 support
Date: Thu, 30 Mar 2023 15:03:27 -0300
Message-Id: <20230330180336.2791-18-farosas@suse.de>
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

Allow multifd to open file-backed channels. This will be used when
enabling the fixed-ram migration stream format which expects a
seekable transport.

The QIOChannel read and write methods will use the preadv/pwritev
versions which don't update the file offset at each call so we can
reuse the fd without re-opening for every channel.

Note that this is just setup code and multifd cannot yet make use of
the file channels.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 include/io/channel-file.h |  1 +
 migration/file.c          | 63 +++++++++++++++++++++++++++++++++++++--
 migration/file.h          |  6 +++-
 migration/migration.c     | 11 ++++++-
 migration/migration.h     |  1 +
 migration/multifd.c       | 14 +++++++--
 6 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/include/io/channel-file.h b/include/io/channel-file.h
index 50e8eb1138..85b6c34a72 100644
--- a/include/io/channel-file.h
+++ b/include/io/channel-file.h
@@ -22,6 +22,7 @@
 #define QIO_CHANNEL_FILE_H
 
 #include "io/channel.h"
+#include "io/task.h"
 #include "qom/object.h"
 
 #define TYPE_QIO_CHANNEL_FILE "qio-channel-file"
diff --git a/migration/file.c b/migration/file.c
index ab4e12926c..f674cd1bdb 100644
--- a/migration/file.c
+++ b/migration/file.c
@@ -1,20 +1,77 @@
 #include "qemu/osdep.h"
-#include "channel.h"
 #include "io/channel-file.h"
 #include "file.h"
 #include "qemu/error-report.h"
 
+static struct FileOutgoingArgs {
+    char *fname;
+    int flags;
+    int mode;
+} outgoing_args;
+
+static void qio_channel_file_connect_worker(QIOTask *task, gpointer opaque)
+{
+    /* noop */
+}
+
+static void file_migration_cancel(Error *errp)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
+                      MIGRATION_STATUS_FAILED);
+    migration_cancel(errp);
+}
+
+int file_send_channel_destroy(QIOChannel *ioc)
+{
+    if (ioc) {
+        qio_channel_close(ioc, NULL);
+        object_unref(OBJECT(ioc));
+    }
+    g_free(outgoing_args.fname);
+    outgoing_args.fname = NULL;
+
+    return 0;
+}
+
+void file_send_channel_create(QIOTaskFunc f, void *data)
+{
+    QIOChannelFile *ioc;
+    QIOTask *task;
+    Error *errp = NULL;
+
+    ioc = qio_channel_file_new_path(outgoing_args.fname,
+                                    outgoing_args.flags,
+                                    outgoing_args.mode, &errp);
+    if (!ioc) {
+        file_migration_cancel(errp);
+        return;
+    }
+
+    task = qio_task_new(OBJECT(ioc), f, (gpointer)data, NULL);
+    qio_task_run_in_thread(task, qio_channel_file_connect_worker,
+                           (gpointer)data, NULL, NULL);
+}
 
 void file_start_outgoing_migration(MigrationState *s, const char *fname, Error **errp)
 {
     QIOChannelFile *ioc;
+    int flags = O_CREAT | O_TRUNC | O_WRONLY;
+    mode_t mode = 0660;
 
-    ioc = qio_channel_file_new_path(fname, O_CREAT | O_TRUNC | O_WRONLY, 0660, errp);
+    ioc = qio_channel_file_new_path(fname, flags, mode, errp);
     if (!ioc) {
-        error_report("Error creating a channel");
+        error_report("Error creating migration outgoing channel");
         return;
     }
 
+    outgoing_args.fname = g_strdup(fname);
+    outgoing_args.flags = flags;
+    outgoing_args.mode = mode;
+
     qio_channel_set_name(QIO_CHANNEL(ioc), "migration-file-outgoing");
     migration_channel_connect(s, QIO_CHANNEL(ioc), NULL, NULL);
     object_unref(OBJECT(ioc));
diff --git a/migration/file.h b/migration/file.h
index cdbd291322..5e27ca6afd 100644
--- a/migration/file.h
+++ b/migration/file.h
@@ -1,10 +1,14 @@
 #ifndef QEMU_MIGRATION_FILE_H
 #define QEMU_MIGRATION_FILE_H
 
+#include "io/task.h"
+#include "channel.h"
+
 void file_start_outgoing_migration(MigrationState *s,
                                    const char *filename,
                                    Error **errp);
 
 void file_start_incoming_migration(const char *fname, Error **errp);
+void file_send_channel_create(QIOTaskFunc f, void *data);
+int file_send_channel_destroy(QIOChannel *ioc);
 #endif
-
diff --git a/migration/migration.c b/migration/migration.c
index c647fbffa6..6594c2f404 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -194,7 +194,7 @@ static bool migration_needs_multiple_sockets(void)
 static bool uri_supports_multi_channels(const char *uri)
 {
     return strstart(uri, "tcp:", NULL) || strstart(uri, "unix:", NULL) ||
-           strstart(uri, "vsock:", NULL);
+           strstart(uri, "vsock:", NULL) || strstart(uri, "file:", NULL);
 }
 
 static bool
@@ -2740,6 +2740,15 @@ bool migrate_pause_before_switchover(void)
         MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER];
 }
 
+bool migrate_to_file(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return qemu_file_is_seekable(s->to_dst_file);
+}
+
 int migrate_multifd_channels(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index d7a014ce57..8459201958 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -425,6 +425,7 @@ bool migrate_multifd_use_packets(void);
 bool migrate_auto_converge(void);
 bool migrate_use_multifd(void);
 bool migrate_pause_before_switchover(void);
+bool migrate_to_file(void);
 int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
diff --git a/migration/multifd.c b/migration/multifd.c
index 9f6b2787ed..50bd9b32eb 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -17,6 +17,7 @@
 #include "exec/ramblock.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "file.h"
 #include "ram.h"
 #include "migration.h"
 #include "socket.h"
@@ -27,6 +28,7 @@
 #include "threadinfo.h"
 
 #include "qemu/yank.h"
+#include "io/channel-file.h"
 #include "io/channel-socket.h"
 #include "yank_functions.h"
 
@@ -514,7 +516,11 @@ static void multifd_send_terminate_threads(Error *err)
 
 static int multifd_send_channel_destroy(QIOChannel *send)
 {
-    return socket_send_channel_destroy(send);
+    if (migrate_to_file()) {
+        return file_send_channel_destroy(send);
+    } else {
+        return socket_send_channel_destroy(send);
+    }
 }
 
 void multifd_save_cleanup(void)
@@ -919,7 +925,11 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
 
 static void multifd_new_send_channel_create(gpointer opaque)
 {
-    socket_send_channel_create(multifd_new_send_channel_async, opaque);
+    if (migrate_to_file()) {
+        file_send_channel_create(multifd_new_send_channel_async, opaque);
+    } else {
+        socket_send_channel_create(multifd_new_send_channel_async, opaque);
+    }
 }
 
 int multifd_save_setup(Error **errp)
-- 
2.35.3


