Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD135F9FAA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:54:26 +0200 (CEST)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtEf-0007Kd-Ih
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvL-000128-A0
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:27 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:49314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvH-0005LS-J6
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:26 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 661A1219C8;
 Mon, 10 Oct 2022 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1665408858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/URCrYomxDofh61RepDYdpcp3wDN5Mzs6KVh2CPI3d0=;
 b=XsOy9aB7OOnyz67ZUmaoEPWWK/xNisbocXEHebrO2I12JcSAnksOrUnAGDScfyQeMZ3s5X
 G53n8bL9FWkyiuuWzJbvv+KZn10YfYKKFjCXxONjiTXjA7t2QLbhBx2zLLDmfGzvl0LbRm
 fEMBxJg1Ug5h09CnoFebXLFaRgVayKQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E57E813479;
 Mon, 10 Oct 2022 13:34:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IIYGNVkfRGNsAwAAMHmgww
 (envelope-from <nborisov@suse.com>); Mon, 10 Oct 2022 13:34:17 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v2 09/11] migration: Refactor precopy ram loading code
Date: Mon, 10 Oct 2022 16:34:06 +0300
Message-Id: <20221010133408.3214433-10-nborisov@suse.com>
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

To facilitate easier implementaiton of the 'fixed-ram' migration restore
factor out the code responsible for parsing the ramblocks headers. This
also makes ram_load_precopy easier to comprehend.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 migration/ram.c | 142 +++++++++++++++++++++++++++---------------------
 1 file changed, 80 insertions(+), 62 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 4f5ddaff356b..1dd68c221667 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4253,6 +4253,83 @@ void colo_flush_ram_cache(void)
     trace_colo_flush_ram_cache_end();
 }
 
+static int parse_ramblock(QEMUFile *f, RAMBlock *block, ram_addr_t length)
+{
+    int ret = 0;
+    /* ADVISE is earlier, it shows the source has the postcopy capability on */
+    bool postcopy_advised = postcopy_is_advised();
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
@@ -4267,14 +4344,13 @@ static int ram_load_precopy(QEMUFile *f)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
-    /* ADVISE is earlier, it shows the source has the postcopy capability on */
-    bool postcopy_advised = postcopy_is_advised();
+
     if (!migrate_use_compression()) {
         invalid_flags |= RAM_SAVE_FLAG_COMPRESS_PAGE;
     }
 
     while (!ret && !(flags & RAM_SAVE_FLAG_EOS)) {
-        ram_addr_t addr, total_ram_bytes;
+        ram_addr_t addr;
         void *host = NULL, *host_bak = NULL;
         uint8_t ch;
 
@@ -4345,65 +4421,7 @@ static int ram_load_precopy(QEMUFile *f)
 
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
2.34.1


