Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC223CCA36
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Oct 2019 15:54:49 +0200 (CEST)
Received: from localhost ([::1]:56894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGkWG-00037Z-MD
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 09:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32987)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGkTY-00014Q-4o
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 09:52:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGkTX-0002ld-4f
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 09:52:00 -0400
Received: from mga01.intel.com ([192.55.52.88]:60376)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iGkTW-0002OJ-Tt
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 09:51:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Oct 2019 06:50:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,260,1566889200"; d="scan'208";a="192683740"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga007.fm.intel.com with ESMTP; 05 Oct 2019 06:50:55 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 2/2] migration/postcopy: map large zero page in
 postcopy_ram_incoming_setup()
Date: Sat,  5 Oct 2019 21:50:21 +0800
Message-Id: <20191005135021.21721-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191005135021.21721-1-richardw.yang@linux.intel.com>
References: <20191005135021.21721-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

postcopy_ram_incoming_setup() and postcopy_ram_incoming_cleanup() are
counterpart. It is reasonable to map/unmap large zero page in these two
functions respectively.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/postcopy-ram.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index e554f93eec..813cfa5c42 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1142,6 +1142,22 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
         return -1;
     }
 
+    /*
+     * Map large zero page when kernel can't use UFFDIO_ZEROPAGE for hugepages
+     */
+    mis->postcopy_tmp_zero_page = mmap(NULL, mis->largest_page_size,
+                                       PROT_READ | PROT_WRITE,
+                                       MAP_PRIVATE | MAP_ANONYMOUS,
+                                       -1, 0);
+    if (mis->postcopy_tmp_zero_page == MAP_FAILED) {
+        int e = errno;
+        mis->postcopy_tmp_zero_page = NULL;
+        error_report("%s: Failed to map large zero page %s",
+                     __func__, strerror(e));
+        return -e;
+    }
+    memset(mis->postcopy_tmp_zero_page, '\0', mis->largest_page_size);
+
     /*
      * Ballooning can mark pages as absent while we're postcopying
      * that would cause false userfaults.
@@ -1248,23 +1264,7 @@ int postcopy_place_page_zero(MigrationIncomingState *mis, void *host,
                                            qemu_ram_block_host_offset(rb,
                                                                       host));
     } else {
-        /* The kernel can't use UFFDIO_ZEROPAGE for hugepages */
-        if (!mis->postcopy_tmp_zero_page) {
-            mis->postcopy_tmp_zero_page = mmap(NULL, mis->largest_page_size,
-                                               PROT_READ | PROT_WRITE,
-                                               MAP_PRIVATE | MAP_ANONYMOUS,
-                                               -1, 0);
-            if (mis->postcopy_tmp_zero_page == MAP_FAILED) {
-                int e = errno;
-                mis->postcopy_tmp_zero_page = NULL;
-                error_report("%s: %s mapping large zero page",
-                             __func__, strerror(e));
-                return -e;
-            }
-            memset(mis->postcopy_tmp_zero_page, '\0', mis->largest_page_size);
-        }
-        return postcopy_place_page(mis, host, mis->postcopy_tmp_zero_page,
-                                   rb);
+        return postcopy_place_page(mis, host, mis->postcopy_tmp_zero_page, rb);
     }
 }
 
-- 
2.17.1


