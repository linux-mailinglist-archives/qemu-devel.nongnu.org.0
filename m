Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCF63BBCF1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:40:59 +0200 (CEST)
Received: from localhost ([::1]:56678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0NuE-0004xi-5M
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1m0NrB-00028c-Tm
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:37:49 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1m0Nr9-0007X9-CO
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:37:49 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GJQ9Q0CT6z78D5;
 Mon,  5 Jul 2021 20:34:18 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 20:37:32 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 5 Jul 2021 20:37:31 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:All
 patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH 2/2] qapi/migration: Add a new migration capability 'auto-quit'
Date: Mon, 5 Jul 2021 20:36:53 +0800
Message-ID: <20210705123653.1315-3-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210705123653.1315-1-jiangkunkun@huawei.com>
References: <20210705123653.1315-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: wanghaibin.wang@huawei.com, jiangkunkun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For compatibility, a new migration capability 'auto-quit' is added
to control the exit of source QEMU after a successful migration.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 migration/migration.c | 14 +++++++++++++-
 migration/migration.h |  1 +
 qapi/migration.json   |  6 +++++-
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 16782c93c2..82ad6d35b2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2567,6 +2567,15 @@ bool migrate_background_snapshot(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
 }
 
+bool migrate_auto_quit(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_AUTO_QUIT];
+}
+
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
@@ -3539,7 +3548,10 @@ static void migration_iteration_finish(MigrationState *s)
     case MIGRATION_STATUS_COMPLETED:
         migration_calculate_complete(s);
         runstate_set(RUN_STATE_POSTMIGRATE);
-        qemu_system_shutdown_request(SHUTDOWN_CAUSE_MIGRATION_COMPLETED);
+
+        if (migrate_auto_quit()) {
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_MIGRATION_COMPLETED);
+        }
         break;
 
     case MIGRATION_STATUS_ACTIVE:
diff --git a/migration/migration.h b/migration/migration.h
index 2ebb740dfa..a72b178d35 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -349,6 +349,7 @@ int migrate_decompress_threads(void);
 bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_background_snapshot(void);
+bool migrate_auto_quit(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/qapi/migration.json b/qapi/migration.json
index 1124a2dda8..26c1a52c56 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -452,6 +452,9 @@
 #                       procedure starts. The VM RAM is saved with running VM.
 #                       (since 6.0)
 #
+# @auto-quit: If enabled, QEMU process will exit after a successful migration.
+#             (since 6.1)
+#
 # Since: 1.2
 ##
 { 'enum': 'MigrationCapability',
@@ -459,7 +462,8 @@
            'compress', 'events', 'postcopy-ram', 'x-colo', 'release-ram',
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
-           'x-ignore-shared', 'validate-uuid', 'background-snapshot'] }
+           'x-ignore-shared', 'validate-uuid', 'background-snapshot',
+           'auto-quit'] }
 
 ##
 # @MigrationCapabilityStatus:
-- 
2.23.0


