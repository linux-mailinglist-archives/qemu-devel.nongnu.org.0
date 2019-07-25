Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A367428E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 02:26:34 +0200 (CEST)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqRac-0002Qa-1d
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 20:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41088)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hqRaO-00021y-OF
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 20:26:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hqRaN-00037c-QL
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 20:26:20 -0400
Received: from mga02.intel.com ([134.134.136.20]:45866)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hqRaN-00037J-Gf
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 20:26:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2019 17:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,304,1559545200"; d="scan'208";a="193635792"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga004.fm.intel.com with ESMTP; 24 Jul 2019 17:26:16 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Jul 2019 08:25:51 +0800
Message-Id: <20190725002551.2914-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH v2] migration/postcopy: use mis->bh instead of
 allocating a QEMUBH
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

For migration incoming side, it either quit in precopy or postcopy. It
is safe to use the mis->bh for both instead of allocating a dedicated
QEMUBH for postcopy.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

---
v2: fix a typo in change log
---
 migration/savevm.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 20eb116e7f..f87444ae4e 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1860,16 +1860,10 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
     return 0;
 }
 
-
-typedef struct {
-    QEMUBH *bh;
-} HandleRunBhData;
-
 static void loadvm_postcopy_handle_run_bh(void *opaque)
 {
     Error *local_err = NULL;
-    HandleRunBhData *data = opaque;
-    MigrationIncomingState *mis = migration_incoming_get_current();
+    MigrationIncomingState *mis = opaque;
 
     /* TODO we should move all of this lot into postcopy_ram.c or a shared code
      * in migration.c
@@ -1901,8 +1895,7 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
         runstate_set(RUN_STATE_PAUSED);
     }
 
-    qemu_bh_delete(data->bh);
-    g_free(data);
+    qemu_bh_delete(mis->bh);
 }
 
 /* After all discards we can start running and asking for pages */
@@ -1910,7 +1903,6 @@ static int loadvm_postcopy_handle_run(MigrationIncomingState *mis)
 {
     PostcopyState old_ps = POSTCOPY_INCOMING_LISTENING;
     PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_RUNNING, &old_ps);
-    HandleRunBhData *data;
 
     trace_loadvm_postcopy_handle_run();
     if (ps != old_ps) {
@@ -1918,9 +1910,8 @@ static int loadvm_postcopy_handle_run(MigrationIncomingState *mis)
         return -1;
     }
 
-    data = g_new(HandleRunBhData, 1);
-    data->bh = qemu_bh_new(loadvm_postcopy_handle_run_bh, data);
-    qemu_bh_schedule(data->bh);
+    mis->bh = qemu_bh_new(loadvm_postcopy_handle_run_bh, mis);
+    qemu_bh_schedule(mis->bh);
 
     /* We need to finish reading the stream from the package
      * and also stop reading anything more from the stream that loaded the
-- 
2.17.1


