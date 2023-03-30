Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E4E6D0D5C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:06:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwdl-0003dj-2s; Thu, 30 Mar 2023 14:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdZ-0003MU-R3
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:40 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdY-00027t-3Q
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:37 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E5F421F8AA;
 Thu, 30 Mar 2023 18:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rIg2V0ZNpP25ldqpYVh8t7yPV7FWwSjZcjKTJKCqfrM=;
 b=aCspemCoKhukl3hqj1PhnpwnQVHGZ4yGW92MwrbFesPPAXUxbZ9TsxYaM6At+FPHBthsA2
 ugsgKlVENfBJSpUMFWTBaIK6xT3xyu2b+ZcalBt8SYmJkU25lKZ4t18MopTF0aU6MOfKoY
 AJV64uUSsEogVMwlz8dM6V39Db+7CB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rIg2V0ZNpP25ldqpYVh8t7yPV7FWwSjZcjKTJKCqfrM=;
 b=FgNIrXZTAKLUzdtFE7EXS+eahv0h9VxrH15RP6X7m2xJb/hoO25w7hLwVIro/RMHjNAIDd
 XYH2Nbt4lnNI42Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D67ED1348E;
 Thu, 30 Mar 2023 18:04:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6L/HJi/PJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:31 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC PATCH v1 18/26] migration/multifd: Add incoming QIOChannelFile
 support
Date: Thu, 30 Mar 2023 15:03:28 -0300
Message-Id: <20230330180336.2791-19-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
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

On the receiving side we don't need to differentiate between main
channel and threads, so whichever channel is defined first gets to be
the main one. And since there are no packets, use the atomic channel
count to index into the params array.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 migration/file.c      | 38 +++++++++++++++++++++++++++++++++-----
 migration/migration.c |  2 ++
 migration/multifd.c   |  7 ++++++-
 migration/multifd.h   |  1 +
 4 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/migration/file.c b/migration/file.c
index f674cd1bdb..6f40894488 100644
--- a/migration/file.c
+++ b/migration/file.c
@@ -2,6 +2,7 @@
 #include "io/channel-file.h"
 #include "file.h"
 #include "qemu/error-report.h"
+#include "migration.h"
 
 static struct FileOutgoingArgs {
     char *fname;
@@ -77,17 +78,44 @@ void file_start_outgoing_migration(MigrationState *s, const char *fname, Error *
     object_unref(OBJECT(ioc));
 }
 
+static void file_process_migration_incoming(QIOTask *task, gpointer opaque)
+{
+    QIOChannelFile *ioc = opaque;
+
+    migration_channel_process_incoming(QIO_CHANNEL(ioc));
+    object_unref(OBJECT(ioc));
+}
+
 void file_start_incoming_migration(const char *fname, Error **errp)
 {
     QIOChannelFile *ioc;
+    QIOTask *task;
+    int channels = 1;
+    int i = 0, fd;
 
     ioc = qio_channel_file_new_path(fname, O_RDONLY, 0, errp);
     if (!ioc) {
-        error_report("Error creating a channel");
+        goto out;
+    }
+
+    if (migrate_use_multifd()) {
+        channels += migrate_multifd_channels();
+    }
+
+    fd = ioc->fd;
+
+    do {
+        qio_channel_set_name(QIO_CHANNEL(ioc), "migration-file-incoming");
+        task = qio_task_new(OBJECT(ioc), file_process_migration_incoming,
+                            (gpointer)ioc, NULL);
+
+        qio_task_run_in_thread(task, qio_channel_file_connect_worker,
+                               (gpointer)ioc, NULL, NULL);
+    } while (++i < channels && (ioc = qio_channel_file_new_fd(fd)));
+
+out:
+    if (!ioc) {
+        error_report("Error creating migration incoming channel");
         return;
     }
-
-    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-file-incoming");
-    migration_channel_process_incoming(QIO_CHANNEL(ioc));
-    object_unref(OBJECT(ioc));
 }
diff --git a/migration/migration.c b/migration/migration.c
index 6594c2f404..258709aee1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -794,6 +794,8 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
 
         default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
+    } else if (migrate_use_multifd() && migrate_fixed_ram()) {
+        default_channel = multifd_recv_first_channel();
     } else {
         default_channel = !mis->from_src_file;
     }
diff --git a/migration/multifd.c b/migration/multifd.c
index 50bd9b32eb..1332b426ce 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1254,6 +1254,11 @@ int multifd_load_setup(Error **errp)
     return 0;
 }
 
+bool multifd_recv_first_channel(void)
+{
+    return !multifd_recv_state;
+}
+
 bool multifd_recv_all_channels_created(void)
 {
     int thread_count = migrate_multifd_channels();
@@ -1296,7 +1301,7 @@ void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
         /* initial packet */
         num_packets = 1;
     } else {
-        id = 0;
+        id = qatomic_read(&multifd_recv_state->count);
     }
 
     p = &multifd_recv_state->params[id];
diff --git a/migration/multifd.h b/migration/multifd.h
index 7cfc265148..354150ff55 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -18,6 +18,7 @@ void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 void multifd_load_cleanup(void);
 void multifd_load_shutdown(void);
+bool multifd_recv_first_channel(void);
 bool multifd_recv_all_channels_created(void);
 void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
-- 
2.35.3


