Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45498743F9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 05:28:30 +0200 (CEST)
Received: from localhost ([::1]:55568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqUQf-00051r-Cr
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 23:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40933)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hqUQC-0003dY-D5
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 23:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hqUQ8-0002pi-R3
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 23:27:58 -0400
Received: from mga12.intel.com ([192.55.52.136]:10428)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hqUQ8-0002ng-EL
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 23:27:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2019 20:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,305,1559545200"; d="scan'208";a="164050398"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga008.jf.intel.com with ESMTP; 24 Jul 2019 20:27:47 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Jul 2019 11:27:22 +0800
Message-Id: <20190725032722.32271-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
Subject: [Qemu-devel] [RFC PATCH] migration/postcopy: skip compression when
 postcopy is active
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

Now postcopy is not compatible with compression. And we disable setting
these two capability at the same time. While we can still leverage
compress before postcopy is active, for example at the bulk stage.

This patch skips compression when postcopy is active instead of
forbidding setting these capability at the same time.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/migration.c | 11 -----------
 migration/ram.c       | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 5a496addbd..33c373033d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -995,17 +995,6 @@ static bool migrate_caps_check(bool *cap_list,
 #endif
 
     if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
-        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
-            /* The decompression threads asynchronously write into RAM
-             * rather than use the atomic copies needed to avoid
-             * userfaulting.  It should be possible to fix the decompression
-             * threads for compatibility in future.
-             */
-            error_setg(errp, "Postcopy is not currently compatible "
-                       "with compression");
-            return false;
-        }
-
         /* This check is reasonably expensive, so only when it's being
          * set the first time, also it's only the destination that needs
          * special support.
diff --git a/migration/ram.c b/migration/ram.c
index da12774a24..a0d3bc60b2 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2384,6 +2384,16 @@ static bool save_page_use_compression(RAMState *rs)
         return false;
     }
 
+    /*
+     * The decompression threads asynchronously write into RAM
+     * rather than use the atomic copies needed to avoid
+     * userfaulting.  It should be possible to fix the decompression
+     * threads for compatibility in future.
+     */
+    if (migration_in_postcopy()) {
+        return false;
+    }
+
     /*
      * If xbzrle is on, stop using the data compression after first
      * round of migration even if compression is enabled. In theory,
-- 
2.17.1


