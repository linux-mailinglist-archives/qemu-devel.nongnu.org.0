Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04843610EBB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:39:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMlp-0002CM-JF; Fri, 28 Oct 2022 06:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMlm-0002Ar-N0
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:22 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMlk-00020B-7K
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:22 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 279AA219CF;
 Fri, 28 Oct 2022 10:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666953557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7YiqykGqMXYvPkgLKlv59B2ChlcQqmrofuwgStJpbrQ=;
 b=FnGUpU9OjYRhvr+R3vmaSOMDktNPC306zWbOIcAkrPuvYYrh/7FynxlxOk72NrNc2433qB
 5sQXzhCzq4bsxVeL3L98HftQJnl5Balhn2PtO77h2bJs2KIRTv9nEhqkFpAldVsYdOQ2c+
 CwISALoQOP2943wR8Ee6SXfyzZriERY=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6A4213A6E;
 Fri, 28 Oct 2022 10:39:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6FqxKVSxW2PVPwAAMHmgww
 (envelope-from <nborisov@suse.com>); Fri, 28 Oct 2022 10:39:16 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v3 01/14] migration: support file: uri for source migration
Date: Fri, 28 Oct 2022 13:39:01 +0300
Message-Id: <20221028103914.908728-2-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028103914.908728-1-nborisov@suse.com>
References: <20221028103914.908728-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Implement support for a "file:" uri so that a migration can be initiated
directly to a file from QEMU.

Unlike other migration protocol backends, the 'file' protocol cannot
honour non-blocking mode. POSIX file/block storage will always report
ready to read/write, regardless of how slow the underlying storage
will be at servicing the request.

For outgoing migration this limitation is not a serious problem as
the migration data transfer always happens in a dedicated thread.
It may, however, result in delays in honouring a request to cancel
the migration operation.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 migration/file.c      | 23 +++++++++++++++++++++++
 migration/file.h      |  9 +++++++++
 migration/meson.build |  1 +
 migration/migration.c |  3 +++
 4 files changed, 36 insertions(+)
 create mode 100644 migration/file.c
 create mode 100644 migration/file.h

diff --git a/migration/file.c b/migration/file.c
new file mode 100644
index 000000000000..02896a7cab99
--- /dev/null
+++ b/migration/file.c
@@ -0,0 +1,23 @@
+#include "qemu/osdep.h"
+#include "channel.h"
+#include "io/channel-file.h"
+#include "file.h"
+#include "qemu/error-report.h"
+
+
+void file_start_outgoing_migration(MigrationState *s, const char *fname, Error **errp)
+{
+	QIOChannelFile *ioc;
+
+	ioc = qio_channel_file_new_path(fname, O_CREAT|O_TRUNC|O_WRONLY, 0660, errp);
+	if (!ioc) {
+		error_report("Error creating a channel");
+		return;
+	}
+
+	qio_channel_set_name(QIO_CHANNEL(ioc), "migration-file-outgoing");
+	migration_channel_connect(s, QIO_CHANNEL(ioc), NULL, NULL);
+	object_unref(OBJECT(ioc));
+}
+
+
diff --git a/migration/file.h b/migration/file.h
new file mode 100644
index 000000000000..d476eb1157f9
--- /dev/null
+++ b/migration/file.h
@@ -0,0 +1,9 @@
+#ifndef QEMU_MIGRATION_FILE_H
+#define QEMU_MIGRATION_FILE_H
+
+void file_start_outgoing_migration(MigrationState *s,
+                                   const char *filename,
+                                   Error **errp);
+
+#endif
+
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
index 739bb683f34f..b5373db38535 100644
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
@@ -2415,6 +2416,8 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         exec_start_outgoing_migration(s, p, &local_err);
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_outgoing_migration(s, p, &local_err);
+    } else if (strstart(uri, "file:", &p)) {
+	file_start_outgoing_migration(s, p, &local_err);
     } else {
         if (!(has_resume && resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
-- 
2.34.1


