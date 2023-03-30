Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3126D0D57
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:06:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwdm-0003gl-6C; Thu, 30 Mar 2023 14:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdg-0003cR-Af
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:44 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwde-0002AT-NP
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:44 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8EB9B1FD65;
 Thu, 30 Mar 2023 18:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bAPOD6ButsyUsf/nrocgicIUg/3F17VOW9SNc1mL0Vs=;
 b=dvGYwh66lPe6fnAQ4BHODVQL0HKsv1xbZysgCDNby5VdwE5Rb2rpTbsC6hR467q7Ao8u8M
 oPLK9BVK3+SECWSp+bcamjgHFaIzlz9rY4ZlgXeNaeh9veD2wWIiwomUaR/LUQH8TbdzR4
 9KrInDdasEUSAxe8x9R5lgnQrZL4Oes=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199481;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bAPOD6ButsyUsf/nrocgicIUg/3F17VOW9SNc1mL0Vs=;
 b=92ONn2bZiBhhXZAfzIhmW1dLNnTqFyEAcshcuvmP9OH2owvittVFO9dbF9Ce/8e0R5EaPw
 L5265ob+ctVS5GBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B48C1348E;
 Thu, 30 Mar 2023 18:04:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ECGbEDfPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:39 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC PATCH v1 21/26] migration/ram: Add a wrapper for fixed-ram
 shadow bitmap
Date: Thu, 30 Mar 2023 15:03:31 -0300
Message-Id: <20230330180336.2791-22-farosas@suse.de>
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

We'll need to set the shadow_bmap bits from outside ram.c soon and
TARGET_PAGE_BITS is poisoned, so add a wrapper to it.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 migration/ram.c | 9 +++++++++
 migration/ram.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 1666ce6d5f..e9b28c16da 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3359,6 +3359,15 @@ static void ram_save_shadow_bmap(QEMUFile *f)
     }
 }
 
+void ramblock_set_shadow_bmap(RAMBlock *block, ram_addr_t offset, bool set)
+{
+    if (set) {
+        set_bit(offset >> TARGET_PAGE_BITS, block->shadow_bmap);
+    } else {
+        clear_bit(offset >> TARGET_PAGE_BITS, block->shadow_bmap);
+    }
+}
+
 /**
  * ram_save_iterate: iterative stage for migration
  *
diff --git a/migration/ram.h b/migration/ram.h
index 81cbb0947c..8d8258fee1 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -98,6 +98,7 @@ int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *rb);
 bool ramblock_page_is_discarded(RAMBlock *rb, ram_addr_t start);
 void postcopy_preempt_shutdown_file(MigrationState *s);
 void *postcopy_preempt_thread(void *opaque);
+void ramblock_set_shadow_bmap(RAMBlock *block, ram_addr_t offset, bool set);
 
 /* ram cache */
 int colo_init_ram_cache(void);
-- 
2.35.3


