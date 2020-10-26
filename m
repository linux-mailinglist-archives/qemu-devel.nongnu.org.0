Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2588F298E57
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 14:45:11 +0100 (CET)
Received: from localhost ([::1]:45264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX2oA-0005vN-4v
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 09:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kX2mN-00045n-6O
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:43:19 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kX2mH-0000Jl-Lg
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:43:18 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CKbd232rgz15MRD;
 Mon, 26 Oct 2020 21:43:02 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 26 Oct 2020
 21:42:50 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v1 3/4] migration/debug: add checkpoint for migration
 consistency check
Date: Mon, 26 Oct 2020 21:58:44 +0800
Message-ID: <1603720725-81206-4-git-send-email-zhengchuan@huawei.com>
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
 migration/migration.c | 1 +
 migration/savevm.c    | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 0575ecb..f4434c4 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1678,6 +1678,7 @@ static void migrate_fd_cleanup(MigrationState *s)
         tmp = s->to_dst_file;
         s->to_dst_file = NULL;
         qemu_mutex_unlock(&s->qemu_file_lock);
+        MIGRATION_RAM_CONSISTENCY_CHECK();
         /*
          * Close the file handle without the lock to make sure the
          * critical section won't block for long.
diff --git a/migration/savevm.c b/migration/savevm.c
index ff33e21..5f989a8 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2636,6 +2636,13 @@ int qemu_loadvm_state(QEMUFile *f)
     }
 
     qemu_loadvm_state_cleanup();
+    /*
+     * cpu_synchronize_all_post_init->kvm_put_msrs will update the
+     * kvmclock share-mem.
+     * So this's the latest point at which the ram is the same as source
+     */
+    MIGRATION_RAM_CONSISTENCY_CHECK();
+
     cpu_synchronize_all_post_init();
 
     return ret;
-- 
1.8.3.1


