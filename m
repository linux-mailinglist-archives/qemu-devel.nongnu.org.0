Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47DEE5700
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Oct 2019 01:22:59 +0200 (CEST)
Received: from localhost ([::1]:36668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO8v4-00038G-NA
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 19:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iO8se-0008E3-Mn
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 19:20:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iO8sc-0000AF-LD
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 19:20:28 -0400
Received: from mga11.intel.com ([192.55.52.93]:32857)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iO8sa-00008L-NY
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 19:20:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 16:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="373689603"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga005.jf.intel.com with ESMTP; 25 Oct 2019 16:20:18 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 2/2] migration/multifd: not use multifd during postcopy
Date: Sat, 26 Oct 2019 07:20:00 +0800
Message-Id: <20191025232000.25857-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191025232000.25857-1-richardw.yang@linux.intel.com>
References: <20191025232000.25857-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
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

We don't support multifd during postcopy, but user still could enable
both multifd and postcopy. This leads to migration failure.

Skip multifd during postcopy.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7087bb73ed..5876054195 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2547,10 +2547,13 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
     }
 
     /*
-     * do not use multifd for compression as the first page in the new
-     * block should be posted out before sending the compressed page
+     * Do not use multifd for:
+     * 1. Compression as the first page in the new block should be posted out
+     *    before sending the compressed page
+     * 2. In postcopy as one whole host page should be placed
      */
-    if (!save_page_use_compression(rs) && migrate_use_multifd()) {
+    if (!save_page_use_compression(rs) && migrate_use_multifd()
+        && !migration_in_postcopy()) {
         return ram_save_multifd_page(rs, block, offset);
     }
 
-- 
2.17.1


