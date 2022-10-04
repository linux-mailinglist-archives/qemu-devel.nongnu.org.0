Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C55F4377
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 14:49:24 +0200 (CEST)
Received: from localhost ([::1]:36068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhMR-0003Df-ID
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 08:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ofhBE-0006me-Ft
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 08:37:49 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:36500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ofhB9-0005rN-Tw
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 08:37:48 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 242272188D;
 Tue,  4 Oct 2022 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1664887059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0C6zIHlvsOwNHoKLjVfG9Y4tnfVGgpb6vsEK+n6Ucb0=;
 b=hW3ZbXSxmCb6kdv5sEzHbWhEI/GHnIN9cAuhjHixVo8VlaKXJImNxNJdZbwFCGAggkyJUb
 RLhQk0eXKFTjMBI1HS5h5AkVQd6UtukoL1xQRKQ7FntFdyyDDaLz1iByZouVJTsxMQNpWE
 kgkI9dSYLg2eDE3cSptixx0hMJwFxNk=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE0C0139EF;
 Tue,  4 Oct 2022 12:37:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kE/kJxIpPGNlRQAAMHmgww
 (envelope-from <nborisov@suse.com>); Tue, 04 Oct 2022 12:37:38 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH 02/11] migration: Add support for 'file:' uri for incoming
 migration
Date: Tue,  4 Oct 2022 15:37:24 +0300
Message-Id: <20221004123733.2745519-3-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004123733.2745519-1-nborisov@suse.com>
References: <20221004123733.2745519-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=nborisov@suse.com; helo=smtp-out1.suse.de
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

This is a counterpart to the 'file:' uri support for source migration,
now a file can also serve as the source of an incoming migration.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 migration/file.c      | 15 +++++++++++++++
 migration/file.h      |  1 +
 migration/migration.c |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/migration/file.c b/migration/file.c
index 02896a7cab99..93eb718aa0f4 100644
--- a/migration/file.c
+++ b/migration/file.c
@@ -21,3 +21,18 @@ void file_start_outgoing_migration(MigrationState *s, const char *fname, Error *
 }
 
 
+void file_start_incoming_migration(const char *fname, Error **errp)
+{
+	QIOChannelFile *ioc;
+
+	ioc = qio_channel_file_new_path(fname, O_RDONLY, 0, errp);
+	if (!ioc) {
+		error_report("Error creating a channel");
+		return;
+	}
+
+	qio_channel_set_name(QIO_CHANNEL(ioc), "migration-file-incoming");
+	migration_channel_process_incoming(QIO_CHANNEL(ioc));
+	object_unref(OBJECT(ioc));
+}
+
diff --git a/migration/file.h b/migration/file.h
index d476eb1157f9..cdbd291322d4 100644
--- a/migration/file.h
+++ b/migration/file.h
@@ -5,5 +5,6 @@ void file_start_outgoing_migration(MigrationState *s,
                                    const char *filename,
                                    Error **errp);
 
+void file_start_incoming_migration(const char *fname, Error **errp);
 #endif
 
diff --git a/migration/migration.c b/migration/migration.c
index 8813b78b9a6b..140b0f1a54bd 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -506,6 +506,8 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
         exec_start_incoming_migration(p, errp);
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_incoming_migration(p, errp);
+    } else if (strstart(uri, "file:", &p)) {
+	file_start_incoming_migration(p, errp);
     } else {
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
-- 
2.34.1


