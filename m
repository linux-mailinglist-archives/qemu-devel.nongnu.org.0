Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01564365
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 10:12:32 +0200 (CEST)
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl7iJ-0002pJ-Ug
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 04:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49758)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hl7hW-0002I1-VA
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 04:11:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hl7hV-0001fv-Q4
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 04:11:42 -0400
Received: from mga03.intel.com ([134.134.136.65]:53210)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hl7hV-0001dG-GJ
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 04:11:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 01:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,473,1557212400"; d="scan'208";a="249396215"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga001.jf.intel.com with ESMTP; 10 Jul 2019 01:11:38 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 Jul 2019 16:11:11 +0800
Message-Id: <20190710081111.10302-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-devel] [PATCH] migration/postcopy: use static
 PostcopyDiscardState instead of allocating it for each block
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

Even we need to do discard for each RAMBlock, we still can leverage the
same memory space to store the information.

By doing so, we avoid memory allocation and deallocation to the system
and also avoid potential failure of memory allocation which breaks the
migration.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/postcopy-ram.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 9faacacc9e..2e6b076bb7 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1377,8 +1377,7 @@ void postcopy_fault_thread_notify(MigrationIncomingState *mis)
  *   asking to discard individual ranges.
  *
  * @ms: The current migration state.
- * @offset: the bitmap offset of the named RAMBlock in the migration
- *   bitmap.
+ * @offset: the bitmap offset of the named RAMBlock in the migration bitmap.
  * @name: RAMBlock that discards will operate on.
  *
  * returns: a new PDS.
@@ -1386,13 +1385,14 @@ void postcopy_fault_thread_notify(MigrationIncomingState *mis)
 PostcopyDiscardState *postcopy_discard_send_init(MigrationState *ms,
                                                  const char *name)
 {
-    PostcopyDiscardState *res = g_malloc0(sizeof(PostcopyDiscardState));
+    static PostcopyDiscardState res = {0};
 
-    if (res) {
-        res->ramblock_name = name;
-    }
+    res.ramblock_name = name;
+    res.cur_entry = 0;
+    res.nsentwords = 0;
+    res.nsentcmds = 0;
 
-    return res;
+    return &res;
 }
 
 /**
@@ -1449,8 +1449,6 @@ void postcopy_discard_send_finish(MigrationState *ms, PostcopyDiscardState *pds)
 
     trace_postcopy_discard_send_finish(pds->ramblock_name, pds->nsentwords,
                                        pds->nsentcmds);
-
-    g_free(pds);
 }
 
 /*
-- 
2.17.1


