Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E939298E5B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 14:45:57 +0100 (CET)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX2ou-0007Hk-GR
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 09:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kX2mM-00043T-9D
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:43:18 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kX2mH-0000Jk-UU
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:43:17 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CKbd22vZhz15MLP;
 Mon, 26 Oct 2020 21:43:02 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 26 Oct 2020
 21:42:50 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v1 4/4] migration/debug: add DEBUG_MIGRATION_CONSISTENCY_CHECK
 macros
Date: Mon, 26 Oct 2020 21:58:45 +0800
Message-ID: <1603720725-81206-5-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603720725-81206-1-git-send-email-zhengchuan@huawei.com>
References: <1603720725-81206-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 07:55:44
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/migration.c | 2 ++
 migration/savevm.c    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index f4434c4..fe2bb3a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1678,7 +1678,9 @@ static void migrate_fd_cleanup(MigrationState *s)
         tmp = s->to_dst_file;
         s->to_dst_file = NULL;
         qemu_mutex_unlock(&s->qemu_file_lock);
+#ifdef DEBUG_MIGRATION_CONSISTENCY_CHECK
         MIGRATION_RAM_CONSISTENCY_CHECK();
+#endif
         /*
          * Close the file handle without the lock to make sure the
          * critical section won't block for long.
diff --git a/migration/savevm.c b/migration/savevm.c
index 5f989a8..102cd0e 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2636,12 +2636,14 @@ int qemu_loadvm_state(QEMUFile *f)
     }
 
     qemu_loadvm_state_cleanup();
+#ifdef DEBUG_MIGRATION_CONSISTENCY_CHECK
     /*
      * cpu_synchronize_all_post_init->kvm_put_msrs will update the
      * kvmclock share-mem.
      * So this's the latest point at which the ram is the same as source
      */
     MIGRATION_RAM_CONSISTENCY_CHECK();
+#endif
 
     cpu_synchronize_all_post_init();
 
-- 
1.8.3.1


