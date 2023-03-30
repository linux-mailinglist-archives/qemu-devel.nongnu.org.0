Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7792E6D0D50
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:05:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwd4-0003Bi-HK; Thu, 30 Mar 2023 14:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwcn-00038E-9F
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:03:50 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwcl-00020A-Mo
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:03:49 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D63821A2A;
 Thu, 30 Mar 2023 18:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QRj+Ox85NP22NK88Buh78DEflEosiGH3v9OMA2dkbCk=;
 b=QobSR4/64jairexcpHT5uKqud6Rz5S37GVY+MUyDkSyNOgnETiNgWKbCnYdTWINNPu1DYA
 cHM9gkPflbO1tLJYcEcUPqRoYFFg9cPNpkOUkvxddZEr0ePcQQCcccuoY1sEI2AdZliS5l
 adJrNMHMjD+Ek/jGMMAPIc3ISJs6Mo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QRj+Ox85NP22NK88Buh78DEflEosiGH3v9OMA2dkbCk=;
 b=D8QW0ABaqGiD7qyUg6iOcb+dy4iZVGetCyjiVlv68xq/RTLi++VaA/qc7gjt6W4VoMuuEw
 sNc4oRMnOyw+f3CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4EE331348E;
 Thu, 30 Mar 2023 18:03:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SIrDBQDPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:03:44 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Nikolay Borisov <nborisov@suse.com>
Subject: [RFC PATCH v1 02/26] migration: Add support for 'file:' uri for
 incoming migration
Date: Thu, 30 Mar 2023 15:03:12 -0300
Message-Id: <20230330180336.2791-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

This is a counterpart to the 'file:' uri support for source migration,
now a file can also serve as the source of an incoming migration.

Unlike other migration protocol backends, the 'file' protocol cannot
honour non-blocking mode. POSIX file/block storage will always report
ready to read/write, regardless of how slow the underlying storage
will be at servicing the request.

For incoming migration this limitation may result in the main event
loop not being fully responsive while loading the VM state. This
won't impact the VM since it is not running at this phase, however,
it may impact management applications.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Nikolay Borisov <nborisov@suse.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 docs/devel/migration.rst |  2 ++
 migration/file.c         | 15 +++++++++++++++
 migration/file.h         |  1 +
 migration/migration.c    |  2 ++
 4 files changed, 20 insertions(+)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index 6f65c23b47..1080211f8e 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -39,6 +39,8 @@ over any transport.
 - exec migration: do the migration using the stdin/stdout through a process.
 - fd migration: do the migration using a file descriptor that is
   passed to QEMU.  QEMU doesn't care how this file descriptor is opened.
+- file migration: do the migration using a file that is passed by name
+  to QEMU.
 
 In addition, support is included for migration using RDMA, which
 transports the page data using ``RDMA``, where the hardware takes care of
diff --git a/migration/file.c b/migration/file.c
index 36d6178c75..ab4e12926c 100644
--- a/migration/file.c
+++ b/migration/file.c
@@ -19,3 +19,18 @@ void file_start_outgoing_migration(MigrationState *s, const char *fname, Error *
     migration_channel_connect(s, QIO_CHANNEL(ioc), NULL, NULL);
     object_unref(OBJECT(ioc));
 }
+
+void file_start_incoming_migration(const char *fname, Error **errp)
+{
+    QIOChannelFile *ioc;
+
+    ioc = qio_channel_file_new_path(fname, O_RDONLY, 0, errp);
+    if (!ioc) {
+        error_report("Error creating a channel");
+        return;
+    }
+
+    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-file-incoming");
+    migration_channel_process_incoming(QIO_CHANNEL(ioc));
+    object_unref(OBJECT(ioc));
+}
diff --git a/migration/file.h b/migration/file.h
index d476eb1157..cdbd291322 100644
--- a/migration/file.h
+++ b/migration/file.h
@@ -5,5 +5,6 @@ void file_start_outgoing_migration(MigrationState *s,
                                    const char *filename,
                                    Error **errp);
 
+void file_start_incoming_migration(const char *fname, Error **errp);
 #endif
 
diff --git a/migration/migration.c b/migration/migration.c
index 58ff0cb7c7..5408d87453 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -527,6 +527,8 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
         exec_start_incoming_migration(p, errp);
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_incoming_migration(p, errp);
+    } else if (strstart(uri, "file:", &p)) {
+        file_start_incoming_migration(p, errp);
     } else {
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
-- 
2.35.3


