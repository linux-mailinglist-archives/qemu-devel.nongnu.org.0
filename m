Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D596D0D70
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:08:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwd5-0003By-6g; Thu, 30 Mar 2023 14:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwcl-000387-KL
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:03:50 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwcj-0001ze-WF
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:03:47 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CFFEF1F85D;
 Thu, 30 Mar 2023 18:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGlBEeszxSprvniwR7x90pTvScfxw2Gu+VCaq9pUiME=;
 b=SDmXM5PvsmLZBbQX1bpMbp5RvUOkvjK8j36nISmd/7D4jsKIyXuPKVxnvPk2P7aCZxDRm3
 6UAIqIzzrCbCFLfxdecy8sBZhUHKC5jTn3Ta4JErv491ltYFnlJrat1N/LCojFumV5MGEk
 aTdYrOVZ9IvTO3wlik9A52oKQ8VKTm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199423;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGlBEeszxSprvniwR7x90pTvScfxw2Gu+VCaq9pUiME=;
 b=dm7MtvoG789Ci816XCrqzMgxxvwCiD2Xj2cIFiLrgTfkN0rc+aWSm1V3WqTB0PiecT7rEd
 c0axjXgWf1F0lAAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86B501348E;
 Thu, 30 Mar 2023 18:03:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yMJwE/3OJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:03:41 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Nikolay Borisov <nborisov@suse.com>
Subject: [RFC PATCH v1 01/26] migration: Add support for 'file:' uri for
 source migration
Date: Thu, 30 Mar 2023 15:03:11 -0300
Message-Id: <20230330180336.2791-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 migration/file.c      | 21 +++++++++++++++++++++
 migration/file.h      |  9 +++++++++
 migration/meson.build |  1 +
 migration/migration.c |  3 +++
 4 files changed, 34 insertions(+)
 create mode 100644 migration/file.c
 create mode 100644 migration/file.h

diff --git a/migration/file.c b/migration/file.c
new file mode 100644
index 0000000000..36d6178c75
--- /dev/null
+++ b/migration/file.c
@@ -0,0 +1,21 @@
+#include "qemu/osdep.h"
+#include "channel.h"
+#include "io/channel-file.h"
+#include "file.h"
+#include "qemu/error-report.h"
+
+
+void file_start_outgoing_migration(MigrationState *s, const char *fname, Error **errp)
+{
+    QIOChannelFile *ioc;
+
+    ioc = qio_channel_file_new_path(fname, O_CREAT | O_TRUNC | O_WRONLY, 0660, errp);
+    if (!ioc) {
+        error_report("Error creating a channel");
+        return;
+    }
+
+    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-file-outgoing");
+    migration_channel_connect(s, QIO_CHANNEL(ioc), NULL, NULL);
+    object_unref(OBJECT(ioc));
+}
diff --git a/migration/file.h b/migration/file.h
new file mode 100644
index 0000000000..d476eb1157
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
index 0d1bb9f96e..6c02298c70 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -17,6 +17,7 @@ softmmu_ss.add(files(
   'colo.c',
   'exec.c',
   'fd.c',
+  'file.c',
   'global_state.c',
   'migration-hmp-cmds.c',
   'migration.c',
diff --git a/migration/migration.c b/migration/migration.c
index ae2025d9d8..58ff0cb7c7 100644
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
@@ -2523,6 +2524,8 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         exec_start_outgoing_migration(s, p, &local_err);
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_outgoing_migration(s, p, &local_err);
+    } else if (strstart(uri, "file:", &p)) {
+        file_start_outgoing_migration(s, p, &local_err);
     } else {
         if (!(has_resume && resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
-- 
2.35.3


