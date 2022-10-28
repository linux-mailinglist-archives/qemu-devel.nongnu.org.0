Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF735610EBA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:39:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMlo-0002B9-0M; Fri, 28 Oct 2022 06:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMll-0002Ah-P6
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:21 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMlk-000205-37
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:21 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A313A219DD;
 Fri, 28 Oct 2022 10:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666953557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mdOQNpWIlx2kBMOLoxmwwEZavWGpfaqIsHexGxEafQk=;
 b=Utma2M0qscCDeOYPSYKlJCYogKlnK9Z0uqWUHzo1n+j1M/GhHYWhbaaYv13h3RBR7GrvaS
 aBE0A+xHaPKuRuVzNMFALsWBsYmNZfWiu2uziu6ynZQwqAySA6oCo+DmAH7Ah0kSupCOnS
 l/HdKL5DMz39r1wd89UKXF5oTDU2Nwo=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 394BC13A6E;
 Fri, 28 Oct 2022 10:39:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qFRSC1WxW2PVPwAAMHmgww
 (envelope-from <nborisov@suse.com>); Fri, 28 Oct 2022 10:39:17 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v3 02/14] migration: Add support for 'file:' uri for incoming
 migration
Date: Fri, 28 Oct 2022 13:39:02 +0300
Message-Id: <20221028103914.908728-3-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028103914.908728-1-nborisov@suse.com>
References: <20221028103914.908728-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index b5373db38535..eafd887254dd 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -506,6 +506,8 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
         exec_start_incoming_migration(p, errp);
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_incoming_migration(p, errp);
+    } else if (strstart(uri, "file:", &p)) {
+        file_start_incoming_migration(p, errp);
     } else {
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
-- 
2.34.1


