Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB03F2E49
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 13:42:23 +0100 (CET)
Received: from localhost ([::1]:41640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSh7E-0005uq-8a
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 07:42:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58932)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iSh4f-000409-Pn
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 07:39:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iSh4e-0002rX-M0
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 07:39:41 -0500
Received: from mga06.intel.com ([134.134.136.31]:63430)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iSh4e-0002nd-Cz
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 07:39:40 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 04:39:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="377408594"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga005.jf.intel.com with ESMTP; 07 Nov 2019 04:39:38 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [Patch v2 3/6] migration/postcopy: count target page number to decide
 the place_needed
Date: Thu,  7 Nov 2019 20:39:04 +0800
Message-Id: <20191107123907.29791-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107123907.29791-1-richardw.yang@linux.intel.com>
References: <20191107123907.29791-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
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

In postcopy, it requires to place whole host page instead of target
page.

Currently, it relies on the page offset to decide whether this is the
last target page. We also can count the target page number during the
iteration. When the number of target page equals
(host page size / target page size), this means it is the last target
page in the host page.

This is a preparation for non-ordered target page transmission.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index f59e3fe197..5c05376d8d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4017,6 +4017,7 @@ static int ram_load_postcopy(QEMUFile *f)
     void *postcopy_host_page = mis->postcopy_tmp_page;
     void *last_host = NULL;
     bool all_zero = false;
+    int target_pages = 0;
 
     while (!ret && !(flags & RAM_SAVE_FLAG_EOS)) {
         ram_addr_t addr;
@@ -4051,6 +4052,7 @@ static int ram_load_postcopy(QEMUFile *f)
                 ret = -EINVAL;
                 break;
             }
+            target_pages++;
             matches_target_page_size = block->page_size == TARGET_PAGE_SIZE;
             /*
              * Postcopy requires that we place whole host pages atomically;
@@ -4082,8 +4084,10 @@ static int ram_load_postcopy(QEMUFile *f)
              * If it's the last part of a host page then we place the host
              * page
              */
-            place_needed = (((uintptr_t)host + TARGET_PAGE_SIZE) &
-                                     (block->page_size - 1)) == 0;
+            if (target_pages == (block->page_size / TARGET_PAGE_SIZE)) {
+                place_needed = true;
+                target_pages = 0;
+            }
             place_source = postcopy_host_page;
         }
         last_host = host;
-- 
2.17.1


