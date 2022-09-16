Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B784F5BA8AE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 10:53:25 +0200 (CEST)
Received: from localhost ([::1]:34740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ76C-0000K2-QV
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 04:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oZ6xz-0003DO-FX
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:44:55 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:51900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oZ6xw-0004Rg-LT
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:44:54 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B25CE1FFF2;
 Fri, 16 Sep 2022 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1663317889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2owvZ+nFV/DhZNs2SdT6FnHPhzQzHipJ6sPf6ueMEcE=;
 b=u/C2J3jqAkTb6NlNEmzg2nMz5djlnZMmQ4bl9gN9OP85UbLM9NmLH7eRXLkz02MP0eZljI
 okNWgXD4Xx+vou9xMBjpQsdgbG108mYuKGGjbgns5hi8aT8ZIA4YYEE/93vVsXU3vyqge1
 UNZYtDDkXIg+CcKCFA96fM/E7F1Qgt0=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69F3F1346B;
 Fri, 16 Sep 2022 08:44:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cUMyF4E3JGP7SAAAMHmgww
 (envelope-from <nborisov@suse.com>); Fri, 16 Sep 2022 08:44:49 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Cc: Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH] migration/ram: Fix memory leak when using x-ignore-shared
Date: Fri, 16 Sep 2022 11:44:42 +0300
Message-Id: <20220916084442.1349996-1-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=nborisov@suse.com; helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

During ram initialization for migration dirty/clear bitmaps are
allocated for all migratable blocks, irrespective of their shared
status. However, during ram migration cleanup those bitmaps are freed
only for those blocks which aren't shared, in case x-ignore-shared
capability is used. This leads to a situation where the bitmaps aren't
freed for such blocks.

Fix this by switching the cleanup code to also free bitmaps for all
migratable blocks.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index dc1de9ddbc68..2e40166d2f9e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2678,7 +2678,7 @@ static void ram_save_cleanup(void *opaque)
         }
     }
 
-    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
+    RAMBLOCK_FOREACH_MIGRATABLE(block) {
         g_free(block->clear_bmap);
         block->clear_bmap = NULL;
         g_free(block->bmap);
-- 
2.34.1


