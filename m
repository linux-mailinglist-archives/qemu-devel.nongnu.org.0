Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C5A6F0EF
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Jul 2019 00:41:28 +0200 (CEST)
Received: from localhost ([::1]:53832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoy2h-0001ap-IX
	for lists+qemu-devel@lfdr.de; Sat, 20 Jul 2019 18:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50230)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hoy2U-0001CX-Ll
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 18:41:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hoy2T-000357-Jd
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 18:41:14 -0400
Received: from mga05.intel.com ([192.55.52.43]:27383)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hoy2T-00027w-BR
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 18:41:13 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jul 2019 15:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,288,1559545200"; d="scan'208";a="173838346"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga006.jf.intel.com with ESMTP; 20 Jul 2019 15:40:04 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Sun, 21 Jul 2019 06:39:39 +0800
Message-Id: <20190720223939.11327-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-devel] [PATCH] migration/postcopy: use mis->bh instead of
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
is save to use the mis->bh for both instead of allocating a dedicated
QEMUBH for postcopy.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/savevm.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 25fe7ea05a..0105068579 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1856,16 +1856,10 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
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
@@ -1897,8 +1891,7 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
         runstate_set(RUN_STATE_PAUSED);
     }
 
-    qemu_bh_delete(data->bh);
-    g_free(data);
+    qemu_bh_delete(mis->bh);
 }
 
 /* After all discards we can start running and asking for pages */
@@ -1906,7 +1899,6 @@ static int loadvm_postcopy_handle_run(MigrationIncomingState *mis)
 {
     PostcopyState old_ps = POSTCOPY_INCOMING_LISTENING;
     PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_RUNNING, &old_ps);
-    HandleRunBhData *data;
 
     trace_loadvm_postcopy_handle_run();
     if (ps != old_ps) {
@@ -1914,9 +1906,8 @@ static int loadvm_postcopy_handle_run(MigrationIncomingState *mis)
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


