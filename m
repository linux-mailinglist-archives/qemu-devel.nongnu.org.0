Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CD12950CE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 18:33:56 +0200 (CEST)
Received: from localhost ([::1]:41756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVH3i-0007SU-SE
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 12:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kVGxU-00025J-P3
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 12:27:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kVGxS-0004sN-Ux
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 12:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603297646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oO/Tdfe1cH8tpz9PBor6zbjoq6WOwhe+J0YqSmlJbQ0=;
 b=HDyN0D+9lDa5Y5CvFnowhqhU2rrH3M5GCXohfaFtjbxn5RJ+R1xG/lomaQBqkMWVRxZAbm
 fQ0sETpAf+7phcbhr7XCqj3PDQPTNfdnOFq0gCpw1SpkwpyQJFkBpKaAcLeWkOgfpc6gc2
 nH+dfrcWMzcXyGm2H3xVrwP70z5+elg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-jJHaGxqMO5mCO0r2KkEvYQ-1; Wed, 21 Oct 2020 12:27:24 -0400
X-MC-Unique: jJHaGxqMO5mCO0r2KkEvYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AF361074659;
 Wed, 21 Oct 2020 16:27:23 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01A8810013C1;
 Wed, 21 Oct 2020 16:27:18 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/11] migration: stop returning errno from load_snapshot()
Date: Wed, 21 Oct 2020 17:26:56 +0100
Message-Id: <20201021162704.3652555-4-berrange@redhat.com>
In-Reply-To: <20201021162704.3652555-1-berrange@redhat.com>
References: <20201021162704.3652555-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

None of the callers care about the errno value since there is a full
Error object populated. This gives consistency with save_snapshot()
which already just returns a boolean value.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
[PMD: Return false/true instead of -1/0, document function]
Acked-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/migration/snapshot.h | 10 +++++++++-
 migration/savevm.c           | 19 +++++++++----------
 monitor/hmp-cmds.c           |  2 +-
 replay/replay-snapshot.c     |  2 +-
 softmmu/vl.c                 |  2 +-
 5 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/include/migration/snapshot.h b/include/migration/snapshot.h
index 0eaf1ba0b1..d7d210820c 100644
--- a/include/migration/snapshot.h
+++ b/include/migration/snapshot.h
@@ -23,6 +23,14 @@
  * On failure, store an error through @errp and return %false.
  */
 bool save_snapshot(const char *name, Error **errp);
-int load_snapshot(const char *name, Error **errp);
+
+/**
+ * load_snapshot: Load an internal snapshot.
+ * @name: name of internal snapshot
+ * @errp: pointer to error object
+ * On success, return %true.
+ * On failure, store an error through @errp and return %false.
+ */
+bool load_snapshot(const char *name, Error **errp);
 
 #endif
diff --git a/migration/savevm.c b/migration/savevm.c
index fd2e5e8b66..531bb2eca1 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2864,7 +2864,7 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
     migration_incoming_state_destroy();
 }
 
-int load_snapshot(const char *name, Error **errp)
+bool load_snapshot(const char *name, Error **errp)
 {
     BlockDriverState *bs_vm_state;
     QEMUSnapshotInfo sn;
@@ -2874,16 +2874,16 @@ int load_snapshot(const char *name, Error **errp)
     MigrationIncomingState *mis = migration_incoming_get_current();
 
     if (!bdrv_all_can_snapshot(errp)) {
-        return -ENOTSUP;
+        return false;
     }
     ret = bdrv_all_find_snapshot(name, errp);
     if (ret < 0) {
-        return ret;
+        return false;
     }
 
     bs_vm_state = bdrv_all_find_vmstate_bs(errp);
     if (!bs_vm_state) {
-        return -ENOTSUP;
+        return false;
     }
     aio_context = bdrv_get_aio_context(bs_vm_state);
 
@@ -2892,11 +2892,11 @@ int load_snapshot(const char *name, Error **errp)
     ret = bdrv_snapshot_find(bs_vm_state, &sn, name);
     aio_context_release(aio_context);
     if (ret < 0) {
-        return ret;
+        return false;
     } else if (sn.vm_state_size == 0) {
         error_setg(errp, "This is a disk-only snapshot. Revert to it "
                    " offline using qemu-img");
-        return -EINVAL;
+        return false;
     }
 
     /*
@@ -2917,7 +2917,6 @@ int load_snapshot(const char *name, Error **errp)
     f = qemu_fopen_bdrv(bs_vm_state, 0);
     if (!f) {
         error_setg(errp, "Could not open VM state file");
-        ret = -EINVAL;
         goto err_drain;
     }
 
@@ -2933,14 +2932,14 @@ int load_snapshot(const char *name, Error **errp)
 
     if (ret < 0) {
         error_setg(errp, "Error %d while loading VM state", ret);
-        return ret;
+        return false;
     }
 
-    return 0;
+    return true;
 
 err_drain:
     bdrv_drain_all_end();
-    return ret;
+    return false;
 }
 
 void vmstate_register_ram(MemoryRegion *mr, DeviceState *dev)
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index f48173820f..521fcf96eb 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1123,7 +1123,7 @@ void hmp_loadvm(Monitor *mon, const QDict *qdict)
 
     vm_stop(RUN_STATE_RESTORE_VM);
 
-    if (load_snapshot(name, &err) == 0 && saved_vm_running) {
+    if (!load_snapshot(name, &err) && saved_vm_running) {
         vm_start();
     }
     hmp_handle_error(mon, err);
diff --git a/replay/replay-snapshot.c b/replay/replay-snapshot.c
index 4f2560d156..b289365937 100644
--- a/replay/replay-snapshot.c
+++ b/replay/replay-snapshot.c
@@ -83,7 +83,7 @@ void replay_vmstate_init(void)
                 exit(1);
             }
         } else if (replay_mode == REPLAY_MODE_PLAY) {
-            if (load_snapshot(replay_snapshot, &err) != 0) {
+            if (!load_snapshot(replay_snapshot, &err)) {
                 error_report_err(err);
                 error_report("Could not load snapshot for icount replay");
                 exit(1);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index cb476aa70b..495a980db0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4484,7 +4484,7 @@ void qemu_init(int argc, char **argv, char **envp)
     register_global_state();
     if (loadvm) {
         Error *local_err = NULL;
-        if (load_snapshot(loadvm, &local_err) < 0) {
+        if (!load_snapshot(loadvm, &local_err)) {
             error_report_err(local_err);
             autostart = 0;
             exit(1);
-- 
2.26.2


