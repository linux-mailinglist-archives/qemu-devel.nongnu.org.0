Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B5A5F9F86
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:39:10 +0200 (CEST)
Received: from localhost ([::1]:39950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohszt-00071N-8n
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvJ-00011R-LE
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:25 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:41698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvF-0005Kn-DL
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:24 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E9D861F8F3;
 Mon, 10 Oct 2022 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1665408858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNbkYhbIU4ghtBPpn9ujfppn4XNmhzrWo/AukZfQa5k=;
 b=B8vcZdrGlSDZrzDFYEUSs67IT1WanQ5CE5205WrxrQnVCyxOzTeohIP9W/1ZKkqXHmaRkC
 peCi7MaQk4ZHdHNWaZeLZQe6OncX4tztjbrCnrZUwznaN/no3s+7X8FkX0d237GKfMO/qA
 ldmx7OXetOWrm85yd19MZ7u2VNQIXTk=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 758D713479;
 Mon, 10 Oct 2022 13:34:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OHgDGlofRGNsAwAAMHmgww
 (envelope-from <nborisov@suse.com>); Mon, 10 Oct 2022 13:34:18 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v2 10/11] migration: Add support for 'fixed-ram' migration
 restore
Date: Mon, 10 Oct 2022 16:34:07 +0300
Message-Id: <20221010133408.3214433-11-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010133408.3214433-1-nborisov@suse.com>
References: <20221010133408.3214433-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=nborisov@suse.com; helo=smtp-out2.suse.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Add the necessary code to parse the format changes for 'fixed-ram'
capability. One of the more notable changes in behavior is that in the
'fixed-ram' case ram pages are restored in one go rather than constantly
looping through the migration stream. Also due to idiosyncrasies of the
format I have added the 'ram_migrated' since it was easier to simply
return directly from ->load_state rather than introducing more
conditionals around the code to prevent ->load_state being called
multiple times (from
qemu_loadvm_section_start_full/qemu_loadvm_section_part_end i.e. from
multiple QEMU_VM_SECTION_(PART|END) flags).

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 migration/migration.h |  2 +
 migration/ram.c       | 95 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 9aab1b16f407..7a832d072415 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -96,6 +96,8 @@ struct MigrationIncomingState {
     bool           have_listen_thread;
     QemuThread     listen_thread;
 
+    bool ram_migrated;
+
     /* For the kernel to send us notifications */
     int       userfault_fd;
     /* To notify the fault_thread to wake, e.g., when need to quit */
diff --git a/migration/ram.c b/migration/ram.c
index 1dd68c221667..15441ed9f745 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4330,6 +4330,90 @@ static int parse_ramblocks(QEMUFile *f, ram_addr_t total_ram_bytes)
     return ret;
 }
 
+
+static int parse_ramblocks_fixed_ram(QEMUFile *f)
+{
+    int ret = 0;
+
+    while (!ret) {
+        char id[256];
+        RAMBlock *block;
+        ram_addr_t length;
+        unsigned long clear_bit_idx;
+        long num_pages, bitmap_size;
+        int len = qemu_get_byte(f);
+        g_autofree unsigned long *dirty_bitmap = NULL;
+
+        qemu_get_buffer(f, (uint8_t *)id, len);
+        id[len] = 0;
+        length = qemu_get_be64(f);
+
+        block = qemu_ram_block_by_name(id);
+        if (block) {
+            ret = parse_ramblock(f, block, length);
+            if (ret < 0) {
+                return ret;
+            }
+        } else {
+            error_report("Unknown ramblock \"%s\", cannot accept "
+                         "migration", id);
+            ret = -EINVAL;
+            continue;
+        }
+
+        /* 1. read the bitmap size */
+        num_pages = length >> TARGET_PAGE_BITS;
+        bitmap_size = qemu_get_be32(f);
+
+        assert(bitmap_size == BITS_TO_LONGS(num_pages)*sizeof(unsigned long));
+
+        block->pages_offset = qemu_get_be64(f);
+
+        /* 2. read the actual bitmap */
+        dirty_bitmap = g_malloc0(bitmap_size);
+        if (qemu_get_buffer(f, (uint8_t *)dirty_bitmap, bitmap_size) != bitmap_size) {
+            error_report("Error parsing dirty bitmap");
+            return -EINVAL;
+        }
+
+#define BUFSIZE (4*1024*1024)
+        for (unsigned long set_bit_idx = find_first_bit(dirty_bitmap, num_pages);
+             set_bit_idx < num_pages;
+             set_bit_idx = find_next_bit(dirty_bitmap, num_pages, clear_bit_idx + 1)) {
+
+            clear_bit_idx = find_next_zero_bit(dirty_bitmap, num_pages, set_bit_idx + 1);
+            unsigned long len = TARGET_PAGE_SIZE * (clear_bit_idx - set_bit_idx);
+            ram_addr_t offset = set_bit_idx << TARGET_PAGE_BITS;
+
+            for (size_t written = 0, completed = 0; completed < len; offset += written) {
+                void *host = host_from_ram_block_offset(block, offset);
+                size_t read_len = MIN(len, BUFSIZE);
+
+                written = qemu_get_buffer_at(f, host, read_len,
+                                             block->pages_offset + offset);
+                completed += written;
+            }
+        }
+
+        /* Skip pages array */
+        qemu_set_offset(f, block->pages_offset + length, SEEK_SET);
+
+        /* Check if this is the last ramblock */
+        if (qemu_get_be64(f) == RAM_SAVE_FLAG_EOS) {
+            ret = 1;
+        } else {
+            /*
+             * If not, adjust the internal file index to account for the
+             * previous 64 bit read
+             */
+            qemu_file_skip(f, -8);
+            ret = 0;
+        }
+    }
+
+    return ret;
+}
+
 /**
  * ram_load_precopy: load pages in precopy case
  *
@@ -4349,7 +4433,7 @@ static int ram_load_precopy(QEMUFile *f)
         invalid_flags |= RAM_SAVE_FLAG_COMPRESS_PAGE;
     }
 
-    while (!ret && !(flags & RAM_SAVE_FLAG_EOS)) {
+    while (!ret && !(flags & RAM_SAVE_FLAG_EOS) && !mis->ram_migrated) {
         ram_addr_t addr;
         void *host = NULL, *host_bak = NULL;
         uint8_t ch;
@@ -4421,7 +4505,14 @@ static int ram_load_precopy(QEMUFile *f)
 
         switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
         case RAM_SAVE_FLAG_MEM_SIZE:
-            ret = parse_ramblocks(f, addr);
+            if (migrate_fixed_ram()) {
+                ret = parse_ramblocks_fixed_ram(f);
+                if (ret == 1) {
+                    mis->ram_migrated = true;
+                }
+            } else {
+                ret = parse_ramblocks(f, addr);
+            }
             break;
 
         case RAM_SAVE_FLAG_ZERO:
-- 
2.34.1


