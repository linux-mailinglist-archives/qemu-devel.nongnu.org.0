Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764577EC60
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 08:05:04 +0200 (CEST)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htQgZ-0005kQ-NB
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 02:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44499)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1htQg3-0005KM-7U
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 02:04:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1htQfy-0008CV-Tk
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 02:04:29 -0400
Received: from mga09.intel.com ([134.134.136.24]:54871)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1htQfy-0008Br-99
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 02:04:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 23:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,337,1559545200"; d="scan'208";a="201551575"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2019 23:04:23 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Aug 2019 14:03:59 +0800
Message-Id: <20190802060359.16556-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel] [RFC PATCH] migration/postcopy: enable compress with
 postcopy
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch enable compress with postcopy.

This is a RFC and based on some unmerged patch

  "migration: extract ram_load_precopy"
  "migration/postcopy: skip compression when postcopy is active"

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/postcopy-ram.c |  3 +--
 migration/ram.c          | 35 +++++++++++++++++++++--------------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index a7e7ec9c22..70b6beb5a9 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1252,8 +1252,7 @@ int postcopy_place_page_zero(MigrationIncomingState *mis, void *host,
             }
             memset(mis->postcopy_tmp_zero_page, '\0', mis->largest_page_size);
         }
-        return postcopy_place_page(mis, host, mis->postcopy_tmp_zero_page,
-                                   rb);
+        return postcopy_place_page(mis, host, mis->postcopy_tmp_zero_page, rb);
     }
 }
 
diff --git a/migration/ram.c b/migration/ram.c
index a0d3bc60b2..c1d6eadf38 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2384,16 +2384,6 @@ static bool save_page_use_compression(RAMState *rs)
         return false;
     }
 
-    /*
-     * The decompression threads asynchronously write into RAM
-     * rather than use the atomic copies needed to avoid
-     * userfaulting.  It should be possible to fix the decompression
-     * threads for compatibility in future.
-     */
-    if (migration_in_postcopy()) {
-        return false;
-    }
-
     /*
      * If xbzrle is on, stop using the data compression after first
      * round of migration even if compression is enabled. In theory,
@@ -3433,6 +3423,11 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
         }
         i++;
     }
+
+    if (migrate_postcopy_ram()) {
+        flush_compressed_data(rs);
+    }
+
     rcu_read_unlock();
 
     /*
@@ -4019,6 +4014,7 @@ static int ram_load_postcopy(QEMUFile *f)
         void *place_source = NULL;
         RAMBlock *block = NULL;
         uint8_t ch;
+        int len;
 
         addr = qemu_get_be64(f);
 
@@ -4036,7 +4032,8 @@ static int ram_load_postcopy(QEMUFile *f)
 
         trace_ram_load_postcopy_loop((uint64_t)addr, flags);
         place_needed = false;
-        if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE)) {
+        if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
+                     RAM_SAVE_FLAG_COMPRESS_PAGE)) {
             block = ram_block_from_stream(f, flags);
 
             host = host_from_ram_block_offset(block, addr);
@@ -4109,6 +4106,17 @@ static int ram_load_postcopy(QEMUFile *f)
                                          TARGET_PAGE_SIZE);
             }
             break;
+        case RAM_SAVE_FLAG_COMPRESS_PAGE:
+            all_zero = false;
+            len = qemu_get_be32(f);
+            if (len < 0 || len > compressBound(TARGET_PAGE_SIZE)) {
+                error_report("Invalid compressed data length: %d", len);
+                ret = -EINVAL;
+                break;
+            }
+            decompress_data_with_multi_threads(f, page_buffer, len);
+            ret |= wait_for_decompress_done();
+            break;
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
             multifd_recv_sync_main();
@@ -4130,8 +4138,7 @@ static int ram_load_postcopy(QEMUFile *f)
             void *place_dest = host + TARGET_PAGE_SIZE - block->page_size;
 
             if (all_zero) {
-                ret = postcopy_place_page_zero(mis, place_dest,
-                                               block);
+                ret = postcopy_place_page_zero(mis, place_dest, block);
             } else {
                 ret = postcopy_place_page(mis, place_dest,
                                           place_source, block);
@@ -4372,6 +4379,7 @@ static int ram_load_precopy(QEMUFile *f)
         }
     }
 
+    ret |= wait_for_decompress_done();
     return ret;
 }
 
@@ -4405,7 +4413,6 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
         ret = ram_load_precopy(f);
     }
 
-    ret |= wait_for_decompress_done();
     rcu_read_unlock();
     trace_ram_load_complete(ret, seq_iter);
 
-- 
2.17.1


