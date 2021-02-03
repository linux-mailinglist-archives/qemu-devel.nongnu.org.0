Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD6330D45B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:54:02 +0100 (CET)
Received: from localhost ([::1]:55672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7CzB-0006wF-Cz
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpj-00033r-0m
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:15 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpc-0008Lu-SW
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:14 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DVttr4jk3z163x2;
 Wed,  3 Feb 2021 15:42:28 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Feb 2021
 15:43:37 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v4 02/18] migration/rdma: judge whether or not the RDMA is
 used for migration
Date: Wed, 3 Feb 2021 16:01:35 +0800
Message-ID: <1612339311-114805-3-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=szxga04-in.huawei.com
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add enabled_rdma_migration into MigrationState to judge
whether or not the RDMA is used for migration.

Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/migration.c | 13 +++++++++++++
 migration/migration.h |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 447dfb9..129c81a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -418,11 +418,13 @@ void migrate_add_address(SocketAddress *address)
 static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
+    MigrationState *s = migrate_get_current();
 
     if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
         return;
     }
 
+    s->enabled_rdma_migration = false;
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
@@ -430,6 +432,7 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
         socket_start_incoming_migration(p ? p : uri, errp);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
+        s->enabled_rdma_migration = true;
         rdma_start_incoming_migration(p, errp);
 #endif
     } else if (strstart(uri, "exec:", &p)) {
@@ -1921,6 +1924,7 @@ void migrate_init(MigrationState *s)
     s->start_postcopy = false;
     s->postcopy_after_devices = false;
     s->migration_thread_running = false;
+    s->enabled_rdma_migration = false;
     error_free(s->error);
     s->error = NULL;
     s->hostname = NULL;
@@ -2162,6 +2166,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         socket_start_outgoing_migration(s, p ? p : uri, &local_err);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
+        s->enabled_rdma_migration = true;
         rdma_start_outgoing_migration(s, p, &local_err);
 #endif
     } else if (strstart(uri, "exec:", &p)) {
@@ -2391,6 +2396,14 @@ bool migrate_rdma_pin_all(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL];
 }
 
+bool migrate_use_rdma(void)
+{
+    MigrationState *s;
+    s = migrate_get_current();
+
+    return s->enabled_rdma_migration;
+}
+
 bool migrate_use_multifd(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index 22b36f3..da5681b 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -280,6 +280,11 @@ struct MigrationState {
      * This save hostname when out-going migration starts
      */
     char *hostname;
+
+    /*
+     * Enable RDMA migration
+     */
+    bool enabled_rdma_migration;
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
@@ -317,6 +322,7 @@ bool migrate_validate_uuid(void);
 
 bool migrate_auto_converge(void);
 bool migrate_rdma_pin_all(void);
+bool migrate_use_rdma(void);
 bool migrate_use_multifd(void);
 bool migrate_pause_before_switchover(void);
 int migrate_multifd_channels(void);
-- 
1.8.3.1


