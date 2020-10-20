Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29462290EE9
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 06:27:48 +0200 (CEST)
Received: from localhost ([::1]:53138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTdoo-0003U2-UF
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 00:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kTdXy-0006JE-1G
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 00:10:23 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5247 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kTdXs-0007Iz-66
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 00:10:21 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8C29B7C90A39DFCFFA82;
 Sat, 17 Oct 2020 12:09:56 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Sat, 17 Oct 2020
 12:09:50 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v3 16/18] migration/rdma: add rdma_channel into Migrationstate
 field
Date: Sat, 17 Oct 2020 12:25:46 +0800
Message-ID: <1602908748-43335-17-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
References: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/17 00:09:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, fengzhimin1@huawei.com,
 qemu-devel@nongnu.org, xiexiangyou@huawei.com, alex.chen@huawei.com,
 wanghao232@huawei.com
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
index 7061410..1ec1dc9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1892,6 +1892,7 @@ void migrate_init(MigrationState *s)
     s->migration_thread_running = false;
     s->enabled_rdma_migration = false;
     s->host_port = NULL;
+    s->rdma_channel = 0;
     error_free(s->error);
     s->error = NULL;
     s->hostname = NULL;
diff --git a/migration/migration.h b/migration/migration.h
index fea63de..5676b23 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -272,6 +272,7 @@ struct MigrationState
 
     /* Need by Multi-RDMA */
     char *host_port;
+    int rdma_channel;
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
diff --git a/migration/rdma.c b/migration/rdma.c
index d5d6364..327f80f 100644
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


