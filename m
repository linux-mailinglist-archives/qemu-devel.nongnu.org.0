Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F356D0D4E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:05:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwdJ-0003HN-OB; Thu, 30 Mar 2023 14:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdG-0003Gx-Tv
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:18 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdB-00024D-6D
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:15 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 202BB21A31;
 Thu, 30 Mar 2023 18:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HE58zlgiBSuVmP1Wz3AAzAfLvpRSOuwpAWdDcUm/D4I=;
 b=UiWgXvsV69PQosqyB+Iz/ADomI2tABJStAndzv1EOkaOlCEqtEAgGHpiE1pqQP1wo4woWC
 /rfBhNzPw/tJJmU4ox4CbYi58bOpvRBlYcaZIVYtoAZL5tb4mA+c0gA33bqGAwSan8iGwo
 6+nESElmt/y3K/bTCkmz6N3btdvhgEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199452;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HE58zlgiBSuVmP1Wz3AAzAfLvpRSOuwpAWdDcUm/D4I=;
 b=pljTN5Wc6DrPnT/8aFOFLZKxfPGRhkZtbbeQvZT6779VNHf9tan21uq0dxXo6QswYtaETK
 Tt9krkfIjzVnm7AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6CE871348E;
 Thu, 30 Mar 2023 18:04:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aPASDRjPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:08 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Nikolay Borisov <nborisov@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [RFC PATCH v1 10/26] migration/ram: Introduce 'fixed-ram' migration
 stream capability
Date: Thu, 30 Mar 2023 15:03:20 -0300
Message-Id: <20230330180336.2791-11-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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

Implement 'fixed-ram' feature. The core of the feature is to ensure that
each ram page of the migration stream has a specific offset in the
resulting migration stream. The reason why we'd want such behavior are
two fold:

 - When doing a 'fixed-ram' migration the resulting file will have a
   bounded size, since pages which are dirtied multiple times will
   always go to a fixed location in the file, rather than constantly
   being added to a sequential stream. This eliminates cases where a vm
   with, say, 1G of ram can result in a migration file that's 10s of
   GBs, provided that the workload constantly redirties memory.

 - It paves the way to implement DIO-enabled save/restore of the
   migration stream as the pages are ensured to be written at aligned
   offsets.

The feature requires changing the stream format. First, a bitmap is
introduced which tracks which pages have been written (i.e are
dirtied) during migration and subsequently it's being written in the
resulting file, again at a fixed location for every ramblock. Zero
pages are ignored as they'd be zero in the destination migration as
well. With the changed format data would look like the following:

|name len|name|used_len|pc*|bitmap_size|pages_offset|bitmap|pages|

* pc - refers to the page_size/mr->addr members, so newly added members
begin from "bitmap_size".

This layout is initialized during ram_save_setup so instead of having a
sequential stream of pages that follow the ramblock headers the dirty
pages for a ramblock follow its header. Since all pages have a fixed
location RAM_SAVE_FLAG_EOS is no longer generated on every migration
iteration but there is effectively a single RAM_SAVE_FLAG_EOS right at
the end.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 docs/devel/migration.rst | 36 +++++++++++++++
 include/exec/ramblock.h  |  8 ++++
 migration/migration.c    | 51 +++++++++++++++++++++-
 migration/migration.h    |  1 +
 migration/ram.c          | 94 +++++++++++++++++++++++++++++++++-------
 migration/savevm.c       |  1 +
 qapi/migration.json      |  2 +-
 7 files changed, 176 insertions(+), 17 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index 1080211f8e..84112d7f3f 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -568,6 +568,42 @@ Others (especially either older devices or system devices which for
 some reason don't have a bus concept) make use of the ``instance id``
 for otherwise identically named devices.
 
+Fixed-ram format
+----------------
+
+When the ``fixed-ram`` capability is enabled, a slightly different
+stream format is used for the RAM section. Instead of having a
+sequential stream of pages that follow the RAMBlock headers, the dirty
+pages for a RAMBlock follow its header. This ensures that each RAM
+page has a fixed offset in the resulting migration stream.
+
+  - RAMBlock 1
+
+    - ID string length
+    - ID string
+    - Used size
+    - Shadow bitmap size
+    - Pages offset in migration stream*
+
+  - Shadow bitmap
+  - Sequence of pages for RAMBlock 1 (* offset points here)
+
+  - RAMBlock 2
+
+    - ID string length
+    - ID string
+    - Used size
+    - Shadow bitmap size
+    - Pages offset in migration stream*
+
+  - Shadow bitmap
+  - Sequence of pages for RAMBlock 2 (* offset points here)
+
+The ``fixed-ram`` capaility can be enabled in both source and
+destination with:
+
+    ``migrate_set_capability fixed-ram on``
+
 Return path
 -----------
 
diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index adc03df59c..4360c772c2 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -43,6 +43,14 @@ struct RAMBlock {
     size_t page_size;
     /* dirty bitmap used during migration */
     unsigned long *bmap;
+    /* shadow dirty bitmap used when migrating to a file */
+    unsigned long *shadow_bmap;
+    /*
+     * offset in the file pages belonging to this ramblock are saved,
+     * used only during migration to a file.
+     */
+    off_t bitmap_offset;
+    uint64_t pages_offset;
     /* bitmap of already received pages in postcopy */
     unsigned long *receivedmap;
 
diff --git a/migration/migration.c b/migration/migration.c
index 177fb0de0f..29630523e2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -168,7 +168,8 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
     MIGRATION_CAPABILITY_XBZRLE,
     MIGRATION_CAPABILITY_X_COLO,
     MIGRATION_CAPABILITY_VALIDATE_UUID,
-    MIGRATION_CAPABILITY_ZERO_COPY_SEND);
+    MIGRATION_CAPABILITY_ZERO_COPY_SEND,
+    MIGRATION_CAPABILITY_FIXED_RAM);
 
 /* When we add fault tolerance, we could have several
    migrations at once.  For now we don't need to add
@@ -1341,6 +1342,28 @@ static bool migrate_caps_check(bool *cap_list,
     }
 #endif
 
+    if (cap_list[MIGRATION_CAPABILITY_FIXED_RAM]) {
+        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
+            error_setg(errp, "Directly mapped memory incompatible with multifd");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_XBZRLE]) {
+            error_setg(errp, "Directly mapped memory incompatible with xbzrle");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
+            error_setg(errp, "Directly mapped memory incompatible with compression");
+            return false;
+        }
+
+        if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
+            error_setg(errp, "Directly mapped memory incompatible with postcopy ram");
+            return false;
+        }
+    }
+
     if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
         /* This check is reasonably expensive, so only when it's being
          * set the first time, also it's only the destination that needs
@@ -2736,6 +2759,11 @@ MultiFDCompression migrate_multifd_compression(void)
     return s->parameters.multifd_compression;
 }
 
+int migrate_fixed_ram(void)
+{
+    return migrate_get_current()->enabled_capabilities[MIGRATION_CAPABILITY_FIXED_RAM];
+}
+
 int migrate_multifd_zlib_level(void)
 {
     MigrationState *s;
@@ -4324,6 +4352,20 @@ fail:
     return NULL;
 }
 
+static int migrate_check_fixed_ram(MigrationState *s, Error **errp)
+{
+    if (!s->enabled_capabilities[MIGRATION_CAPABILITY_FIXED_RAM]) {
+        return 0;
+    }
+
+    if (!qemu_file_is_seekable(s->to_dst_file)) {
+        error_setg(errp, "Directly mapped memory requires a seekable transport");
+        return -1;
+    }
+
+    return 0;
+}
+
 void migrate_fd_connect(MigrationState *s, Error *error_in)
 {
     Error *local_err = NULL;
@@ -4390,6 +4432,12 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         }
     }
 
+    if (migrate_check_fixed_ram(s, &local_err) < 0) {
+        migrate_fd_cleanup(s);
+        migrate_fd_error(s, local_err);
+        return;
+    }
+
     if (resume) {
         /* Wakeup the main migration thread to do the recovery */
         migrate_set_state(&s->state, MIGRATION_STATUS_POSTCOPY_PAUSED,
@@ -4519,6 +4567,7 @@ static Property migration_properties[] = {
     DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
 
     /* Migration capabilities */
+    DEFINE_PROP_MIG_CAP("x-fixed-ram", MIGRATION_CAPABILITY_FIXED_RAM),
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
     DEFINE_PROP_MIG_CAP("x-rdma-pin-all", MIGRATION_CAPABILITY_RDMA_PIN_ALL),
     DEFINE_PROP_MIG_CAP("x-auto-converge", MIGRATION_CAPABILITY_AUTO_CONVERGE),
diff --git a/migration/migration.h b/migration/migration.h
index 2da2f8a164..8cf3caecfe 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -416,6 +416,7 @@ bool migrate_zero_blocks(void);
 bool migrate_dirty_bitmaps(void);
 bool migrate_ignore_shared(void);
 bool migrate_validate_uuid(void);
+int migrate_fixed_ram(void);
 
 bool migrate_auto_converge(void);
 bool migrate_use_multifd(void);
diff --git a/migration/ram.c b/migration/ram.c
index 96e8a19a58..56f0f782c8 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1310,9 +1310,14 @@ static int save_zero_page_to_file(PageSearchStatus *pss,
     int len = 0;
 
     if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
-        len += save_page_header(pss, block, offset | RAM_SAVE_FLAG_ZERO);
-        qemu_put_byte(file, 0);
-        len += 1;
+        if (migrate_fixed_ram()) {
+            /* for zero pages we don't need to do anything */
+            len = 1;
+        } else {
+            len += save_page_header(pss, block, offset | RAM_SAVE_FLAG_ZERO);
+            qemu_put_byte(file, 0);
+            len += 1;
+        }
         ram_release_page(block->idstr, offset);
     }
     return len;
@@ -1394,14 +1399,20 @@ static int save_normal_page(PageSearchStatus *pss, RAMBlock *block,
 {
     QEMUFile *file = pss->pss_channel;
 
-    ram_transferred_add(save_page_header(pss, block,
-                                         offset | RAM_SAVE_FLAG_PAGE));
-    if (async) {
-        qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
-                              migrate_release_ram() &&
-                              migration_in_postcopy());
+    if (migrate_fixed_ram()) {
+        qemu_put_buffer_at(file, buf, TARGET_PAGE_SIZE,
+                           block->pages_offset + offset);
+        set_bit(offset >> TARGET_PAGE_BITS, block->shadow_bmap);
     } else {
-        qemu_put_buffer(file, buf, TARGET_PAGE_SIZE);
+        ram_transferred_add(save_page_header(pss, block,
+                                             offset | RAM_SAVE_FLAG_PAGE));
+        if (async) {
+            qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
+                                  migrate_release_ram() &&
+                                  migration_in_postcopy());
+        } else {
+            qemu_put_buffer(file, buf, TARGET_PAGE_SIZE);
+        }
     }
     ram_transferred_add(TARGET_PAGE_SIZE);
     stat64_add(&ram_atomic_counters.normal, 1);
@@ -2731,6 +2742,8 @@ static void ram_save_cleanup(void *opaque)
         block->clear_bmap = NULL;
         g_free(block->bmap);
         block->bmap = NULL;
+        g_free(block->shadow_bmap);
+        block->shadow_bmap = NULL;
     }
 
     xbzrle_cleanup();
@@ -3098,6 +3111,7 @@ static void ram_list_init_bitmaps(void)
              */
             block->bmap = bitmap_new(pages);
             bitmap_set(block->bmap, 0, pages);
+            block->shadow_bmap = bitmap_new(block->used_length >> TARGET_PAGE_BITS);
             block->clear_bmap_shift = shift;
             block->clear_bmap = bitmap_new(clear_bmap_size(pages, shift));
         }
@@ -3287,6 +3301,33 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
             if (migrate_ignore_shared()) {
                 qemu_put_be64(f, block->mr->addr);
             }
+
+            if (migrate_fixed_ram()) {
+                long num_pages = block->used_length >> TARGET_PAGE_BITS;
+                long bitmap_size = BITS_TO_LONGS(num_pages) * sizeof(unsigned long);
+
+                /* Needed for external programs (think analyze-migration.py) */
+                qemu_put_be32(f, bitmap_size);
+
+                /*
+                 * The bitmap starts after pages_offset, so add 8 to
+                 * account for the pages_offset size.
+                 */
+                block->bitmap_offset = qemu_get_offset(f) + 8;
+
+                /*
+                 * Make pages_offset aligned to 1 MiB to account for
+                 * migration file movement between filesystems with
+                 * possibly different alignment restrictions when
+                 * using O_DIRECT.
+                 */
+                block->pages_offset = ROUND_UP(block->bitmap_offset +
+                                               bitmap_size, 0x100000);
+                qemu_put_be64(f, block->pages_offset);
+
+                /* Now prepare offset for next ramblock */
+                qemu_set_offset(f, block->pages_offset + block->used_length, SEEK_SET);
+            }
         }
     }
 
@@ -3306,6 +3347,18 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
+static void ram_save_shadow_bmap(QEMUFile *f)
+{
+    RAMBlock *block;
+
+    RAMBLOCK_FOREACH_MIGRATABLE(block) {
+        long num_pages = block->used_length >> TARGET_PAGE_BITS;
+        long bitmap_size = BITS_TO_LONGS(num_pages) * sizeof(unsigned long);
+        qemu_put_buffer_at(f, (uint8_t *)block->shadow_bmap, bitmap_size,
+                           block->bitmap_offset);
+    }
+}
+
 /**
  * ram_save_iterate: iterative stage for migration
  *
@@ -3413,9 +3466,15 @@ out:
             return ret;
         }
 
-        qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
-        qemu_fflush(f);
-        ram_transferred_add(8);
+        /*
+         * For fixed ram we don't want to pollute the migration stream with
+         * EOS flags.
+         */
+        if (!migrate_fixed_ram()) {
+            qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
+            qemu_fflush(f);
+            ram_transferred_add(8);
+        }
 
         ret = qemu_file_get_error(f);
     }
@@ -3461,6 +3520,9 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
             pages = ram_find_and_save_block(rs);
             /* no more blocks to sent */
             if (pages == 0) {
+                if (migrate_fixed_ram()) {
+                    ram_save_shadow_bmap(f);
+                }
                 break;
             }
             if (pages < 0) {
@@ -3483,8 +3545,10 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
-    qemu_fflush(f);
+    if (!migrate_fixed_ram()) {
+        qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
+        qemu_fflush(f);
+    }
 
     return 0;
 }
diff --git a/migration/savevm.c b/migration/savevm.c
index 92102c1fe5..1f1bc19224 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -241,6 +241,7 @@ static bool should_validate_capability(int capability)
     /* Validate only new capabilities to keep compatibility. */
     switch (capability) {
     case MIGRATION_CAPABILITY_X_IGNORE_SHARED:
+    case MIGRATION_CAPABILITY_FIXED_RAM:
         return true;
     default:
         return false;
diff --git a/qapi/migration.json b/qapi/migration.json
index c84fa10e86..22eea58ce3 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -485,7 +485,7 @@
 ##
 { 'enum': 'MigrationCapability',
   'data': ['xbzrle', 'rdma-pin-all', 'auto-converge', 'zero-blocks',
-           'compress', 'events', 'postcopy-ram',
+           'compress', 'events', 'postcopy-ram', 'fixed-ram',
            { 'name': 'x-colo', 'features': [ 'unstable' ] },
            'release-ram',
            'block', 'return-path', 'pause-before-switchover', 'multifd',
-- 
2.35.3


