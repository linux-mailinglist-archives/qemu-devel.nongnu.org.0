Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5D645F0D7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 16:38:14 +0100 (CET)
Received: from localhost ([::1]:52894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqdIj-0002wV-8F
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 10:38:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mqdCz-0006pN-2V
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 10:32:17 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:60668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mqdCn-0003yU-Gs
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 10:32:16 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 96CF71FD38;
 Fri, 26 Nov 2021 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637940722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzUZzopLj5rsQL0kZO3hA1i41h6/JPWWfqATDlFHUlY=;
 b=NYp4LbVwAtiCmWL7UaOq5o4PB1K/xDazs/EXcmYGUvNmYptTfx/E6fTTX/mg9CXXLLM+VX
 9RH3DrJ0IO2e1jus9cwji7R4IMWGeeVDVZJw9fQiPz+ld4dEkKmK8u2aqMHN4dSQa9uVzK
 jjFzEmEe2WbjBK8HlbV2qt3J3NJQXvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637940722;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzUZzopLj5rsQL0kZO3hA1i41h6/JPWWfqATDlFHUlY=;
 b=88piAHG/c0tdvFXvpFPDyhOHz1s6drEzxJetweVsEIIrXm4QwOXIOvn0OgEtcJ27qpZXhF
 +oaH9oblE3qURNCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 66A8613C65;
 Fri, 26 Nov 2021 15:32:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qIioF/L9oGG8bgAAMHmgww
 (envelope-from <lizhang@suse.de>); Fri, 26 Nov 2021 15:32:02 +0000
From: Li Zhang <lizhang@suse.de>
To: quintela@redhat.com, dgilbert@redhat.com, cfontana@suse.de,
 qemu-devel@nongnu.org
Subject: [PATCH 2/2] migration: Set the socket backlog number to reduce the
 chance of live migration failure
Date: Fri, 26 Nov 2021 16:31:54 +0100
Message-Id: <20211126153154.25424-3-lizhang@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126153154.25424-1-lizhang@suse.de>
References: <20211126153154.25424-1-lizhang@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
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
Cc: Li Zhang <lizhang@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When creating the guest on destination with -incoming ip:port in QEMU command line,
the source code that sets the backlog number as the same as multifd channels doesn't
get called. So the number of backlog is always 1. It's very easy to cause live migration
failure, so a bigger number is preferred to reduce the chance of the failure.

Signed-off-by: Li Zhang <lizhang@suse.de>
---
 migration/socket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/socket.c b/migration/socket.c
index 05705a32d8..398d4c10fa 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -152,7 +152,7 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
     QIONetListener *listener = qio_net_listener_new();
     MigrationIncomingState *mis = migration_incoming_get_current();
     size_t i;
-    int num = 1;
+    int num = 16;
 
     qio_net_listener_set_name(listener, "migration-socket-listener");
 
-- 
2.31.1


