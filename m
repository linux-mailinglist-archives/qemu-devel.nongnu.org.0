Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022F8723BC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 03:32:58 +0200 (CEST)
Received: from localhost ([::1]:48156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hq69I-0000KG-V3
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 21:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39807)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hq693-0008ND-4d
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 21:32:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hq692-0003s0-6B
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 21:32:41 -0400
Received: from mga03.intel.com ([134.134.136.65]:37673)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hq691-0003qA-UT
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 21:32:40 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 18:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; d="scan'208";a="163689033"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga008.jf.intel.com with ESMTP; 23 Jul 2019 18:32:35 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Wed, 24 Jul 2019 09:32:08 +0800
Message-Id: <20190724013208.5893-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-devel] [PATCH] migration/postcopy: cleanup multifd after
 postcopy finish
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

In case we enable multifd, not forget to cleanup it.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/savevm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index 0105068579..27eef72c9d 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1738,6 +1738,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     QEMUFile *f = mis->from_src_file;
+    Error *local_err = NULL;
     int load_res;
 
     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
@@ -1800,6 +1801,9 @@ static void *postcopy_ram_listen_thread(void *opaque)
      */
     migration_incoming_state_destroy();
     qemu_loadvm_state_cleanup();
+    if (multifd_load_cleanup(&local_err) != 0) {
+        error_report_err(local_err);
+    }
 
     rcu_unregister_thread();
     postcopy_state_set(POSTCOPY_INCOMING_END, NULL);
-- 
2.17.1


