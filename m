Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4055F9F93
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:42:59 +0200 (CEST)
Received: from localhost ([::1]:37250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oht3a-0004X3-KB
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvG-0000zo-93
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:23 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvB-0005Jx-0Z
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:19 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E423219C2;
 Mon, 10 Oct 2022 13:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1665408854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0C6zIHlvsOwNHoKLjVfG9Y4tnfVGgpb6vsEK+n6Ucb0=;
 b=pi0W9p4bga3LkR5Luh/Nc7b3X+HswvzxyhqLDq8Amxj3guSLyrZAMbAcxYOGBFMjNFCIK7
 tx01YaHkluSuPwQLYlyn32D0hCUVhJ8lImUM4KHVy3+sH6O3RVjkl+DCOXXG8myfxm0Cve
 r6/ZWnmE/jh4tcDNhzkvU7gRPGS6I0U=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 140F213479;
 Mon, 10 Oct 2022 13:34:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KKdhAVYfRGNsAwAAMHmgww
 (envelope-from <nborisov@suse.com>); Mon, 10 Oct 2022 13:34:14 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v2 02/11] migration: Add support for 'file:' uri for incoming
 migration
Date: Mon, 10 Oct 2022 16:33:59 +0300
Message-Id: <20221010133408.3214433-3-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010133408.3214433-1-nborisov@suse.com>
References: <20221010133408.3214433-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=nborisov@suse.com;
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


