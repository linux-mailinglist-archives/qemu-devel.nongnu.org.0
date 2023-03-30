Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2D96D0D58
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:06:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwdR-0003IC-Lb; Thu, 30 Mar 2023 14:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdI-0003HE-7u
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:20 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdG-00024U-C7
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:19 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DA36221A2E;
 Thu, 30 Mar 2023 18:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kVyI+EulfkwfpRcLylzEL5w/yl20jYRSdQzOG7bfwY4=;
 b=yXuMhPQZ4Z1Eu6ODsgB4D+ffQhYaYenXy8ke8pX7QkqQI5T57kXHlH8nttwV6tJM7AU+Ho
 L3wkWauCpn8cfILPRk5TjLQJxNwPvHIybe/TJkT9Mawvog3Hq1qBO3iZIICN3tiAyLLFKt
 0KUALOBtMYr8Fq9oJKjkUI0b2YPC1AQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199454;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kVyI+EulfkwfpRcLylzEL5w/yl20jYRSdQzOG7bfwY4=;
 b=2Zf7kF94laUc6FReMIdKxuYUnlJ/K2qZSKJXScwpJmy1XYqIgzp26+t6e+Hf19BwK000eR
 2waTCCnyzyXfjXCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 922811348E;
 Thu, 30 Mar 2023 18:04:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GOImFhzPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:12 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Nikolay Borisov <nborisov@suse.com>
Subject: [RFC PATCH v1 11/26] migration: Refactor precopy ram loading code
Date: Thu, 30 Mar 2023 15:03:21 -0300
Message-Id: <20230330180336.2791-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
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

To facilitate the implementation of the 'fixed-ram' migration restore,
factor out the code responsible for parsing the ramblocks
headers. This also makes ram_load_precopy easier to comprehend.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 migration/ram.c | 142 +++++++++++++++++++++++++++---------------------
 1 file changed, 80 insertions(+), 62 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 56f0f782c8..5c085d6154 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4319,6 +4319,83 @@ void colo_flush_ram_cache(void)
     trace_colo_flush_ram_cache_end();
 }
 
+static int parse_ramblock(QEMUFile *f, RAMBlock *block, ram_addr_t length)
+{
+    int ret = 0;
+    /* ADVISE is earlier, it shows the source has the postcopy capability on */
+    bool postcopy_advised = migration_incoming_postcopy_advised();
+
+    assert(block);
+
+    if (!qemu_ram_is_migratable(block)) {
+        error_report("block %s should not be migrated !", block->idstr);
+        ret = -EINVAL;
+    }
+
+    if (length != block->used_length) {
+        Error *local_err = NULL;
+
+        ret = qemu_ram_resize(block, length, &local_err);
+        if (local_err) {
+            error_report_err(local_err);
+        }
+    }
+    /* For postcopy we need to check hugepage sizes match */
+    if (postcopy_advised && migrate_postcopy_ram() &&
+        block->page_size != qemu_host_page_size) {
+        uint64_t remote_page_size = qemu_get_be64(f);
+        if (remote_page_size != block->page_size) {
+            error_report("Mismatched RAM page size %s "
+                         "(local) %zd != %" PRId64, block->idstr,
+                         block->page_size, remote_page_size);
+            ret = -EINVAL;
+        }
+    }
+    if (migrate_ignore_shared()) {
+        hwaddr addr = qemu_get_be64(f);
+        if (ramblock_is_ignored(block) &&
+            block->mr->addr != addr) {
+            error_report("Mismatched GPAs for block %s "
+                         "%" PRId64 "!= %" PRId64, block->idstr,
+                         (uint64_t)addr,
+                         (uint64_t)block->mr->addr);
+            ret = -EINVAL;
+        }
+    }
+    ram_control_load_hook(f, RAM_CONTROL_BLOCK_REG, block->idstr);
+
+    return ret;
+}
+
+static int parse_ramblocks(QEMUFile *f, ram_addr_t total_ram_bytes)
+{
+    int ret = 0;
+
+    /* Synchronize RAM block list */
+    while (!ret && total_ram_bytes) {
+        char id[256];
+        RAMBlock *block;
+        ram_addr_t length;
+        int len = qemu_get_byte(f);
+
+        qemu_get_buffer(f, (uint8_t *)id, len);
+        id[len] = 0;
+        length = qemu_get_be64(f);
+
+        block = qemu_ram_block_by_name(id);
+        if (block) {
+            ret = parse_ramblock(f, block, length);
+        } else {
+            error_report("Unknown ramblock \"%s\", cannot accept "
+                         "migration", id);
+            ret = -EINVAL;
+        }
+        total_ram_bytes -= length;
+    }
+
+    return ret;
+}
+
 /**
  * ram_load_precopy: load pages in precopy case
  *
@@ -4333,14 +4410,13 @@ static int ram_load_precopy(QEMUFile *f)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
-    /* ADVISE is earlier, it shows the source has the postcopy capability on */
-    bool postcopy_advised = migration_incoming_postcopy_advised();
+
     if (!migrate_use_compression()) {
         invalid_flags |= RAM_SAVE_FLAG_COMPRESS_PAGE;
     }
 
     while (!ret && !(flags & RAM_SAVE_FLAG_EOS)) {
-        ram_addr_t addr, total_ram_bytes;
+        ram_addr_t addr;
         void *host = NULL, *host_bak = NULL;
         uint8_t ch;
 
@@ -4411,65 +4487,7 @@ static int ram_load_precopy(QEMUFile *f)
 
         switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
         case RAM_SAVE_FLAG_MEM_SIZE:
-            /* Synchronize RAM block list */
-            total_ram_bytes = addr;
-            while (!ret && total_ram_bytes) {
-                RAMBlock *block;
-                char id[256];
-                ram_addr_t length;
-
-                len = qemu_get_byte(f);
-                qemu_get_buffer(f, (uint8_t *)id, len);
-                id[len] = 0;
-                length = qemu_get_be64(f);
-
-                block = qemu_ram_block_by_name(id);
-                if (block && !qemu_ram_is_migratable(block)) {
-                    error_report("block %s should not be migrated !", id);
-                    ret = -EINVAL;
-                } else if (block) {
-                    if (length != block->used_length) {
-                        Error *local_err = NULL;
-
-                        ret = qemu_ram_resize(block, length,
-                                              &local_err);
-                        if (local_err) {
-                            error_report_err(local_err);
-                        }
-                    }
-                    /* For postcopy we need to check hugepage sizes match */
-                    if (postcopy_advised && migrate_postcopy_ram() &&
-                        block->page_size != qemu_host_page_size) {
-                        uint64_t remote_page_size = qemu_get_be64(f);
-                        if (remote_page_size != block->page_size) {
-                            error_report("Mismatched RAM page size %s "
-                                         "(local) %zd != %" PRId64,
-                                         id, block->page_size,
-                                         remote_page_size);
-                            ret = -EINVAL;
-                        }
-                    }
-                    if (migrate_ignore_shared()) {
-                        hwaddr addr = qemu_get_be64(f);
-                        if (ramblock_is_ignored(block) &&
-                            block->mr->addr != addr) {
-                            error_report("Mismatched GPAs for block %s "
-                                         "%" PRId64 "!= %" PRId64,
-                                         id, (uint64_t)addr,
-                                         (uint64_t)block->mr->addr);
-                            ret = -EINVAL;
-                        }
-                    }
-                    ram_control_load_hook(f, RAM_CONTROL_BLOCK_REG,
-                                          block->idstr);
-                } else {
-                    error_report("Unknown ramblock \"%s\", cannot "
-                                 "accept migration", id);
-                    ret = -EINVAL;
-                }
-
-                total_ram_bytes -= length;
-            }
+            ret = parse_ramblocks(f, addr);
             break;
 
         case RAM_SAVE_FLAG_ZERO:
-- 
2.35.3


