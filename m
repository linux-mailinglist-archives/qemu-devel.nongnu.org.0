Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D5230D46A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:56:58 +0100 (CET)
Received: from localhost ([::1]:34874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7D21-0001kZ-4d
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpn-0003FL-6P
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:19 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpk-0008N7-7a
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:18 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DVtv108PJzjJgW;
 Wed,  3 Feb 2021 15:42:37 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Feb 2021
 15:43:45 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v4 16/18] migration/rdma: add rdma_channel into Migrationstate
 field
Date: Wed, 3 Feb 2021 16:01:49 +0800
Message-ID: <1612339311-114805-17-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Multifd RDMA is need to poll when we send data, record it.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/migration.c |  1 +
 migration/migration.h |  1 +
 migration/rdma.c      | 14 ++++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index b8f4844..47bd11d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1926,6 +1926,7 @@ void migrate_init(MigrationState *s)
     s->migration_thread_running = false;
     s->enabled_rdma_migration = false;
     s->host_port = NULL;
+    s->rdma_channel = 0;
     error_free(s->error);
     s->error = NULL;
     s->hostname = NULL;
diff --git a/migration/migration.h b/migration/migration.h
index 537ee09..5ff46e6 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -288,6 +288,7 @@ struct MigrationState {
 
     /* Need by Multi-RDMA */
     char *host_port;
+    int rdma_channel;
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
diff --git a/migration/rdma.c b/migration/rdma.c
index f5eb563..2097839 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -183,6 +183,20 @@ typedef struct {
 } RDMAWorkRequestData;
 
 /*
+ * Get the multifd RDMA channel used to send data.
+ */
+static int get_multifd_RDMA_channel(void)
+{
+    int thread_count = migrate_multifd_channels();
+    MigrationState *s = migrate_get_current();
+
+    s->rdma_channel++;
+    s->rdma_channel %= thread_count;
+
+    return s->rdma_channel;
+}
+
+/*
  * Negotiate RDMA capabilities during connection-setup time.
  */
 typedef struct {
-- 
1.8.3.1


