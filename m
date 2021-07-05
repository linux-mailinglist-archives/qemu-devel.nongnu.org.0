Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1012A3BBCF0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:40:51 +0200 (CEST)
Received: from localhost ([::1]:55864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Nu6-0004Qg-1R
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1m0Nr2-0001mc-RD
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:37:43 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1m0Nr1-0007Th-3w
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:37:40 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GJQ872qWlz76CR;
 Mon,  5 Jul 2021 20:33:11 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 20:37:30 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 5 Jul 2021 20:37:30 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:All
 patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH 1/2] qapi/run-state: Add a new shutdown cause
 'migration-completed'
Date: Mon, 5 Jul 2021 20:36:52 +0800
Message-ID: <20210705123653.1315-2-jiangkunkun@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=jiangkunkun@huawei.com; helo=szxga03-in.huawei.com
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

In the current version, the source QEMU process does not automatic
exit after a successful migration. Additional action is required,
such as sending { "execute": "quit" } or ctrl+c. For simplify, add
a new shutdown cause 'migration-completed' to exit the source QEMU
process after a successful migration.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 migration/migration.c | 1 +
 qapi/run-state.json   | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4228635d18..16782c93c2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3539,6 +3539,7 @@ static void migration_iteration_finish(MigrationState *s)
     case MIGRATION_STATUS_COMPLETED:
         migration_calculate_complete(s);
         runstate_set(RUN_STATE_POSTMIGRATE);
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_MIGRATION_COMPLETED);
         break;
 
     case MIGRATION_STATUS_ACTIVE:
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 43d66d700f..66aaef4e2b 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -86,12 +86,14 @@
 #                   ignores --no-reboot. This is useful for sanitizing
 #                   hypercalls on s390 that are used during kexec/kdump/boot
 #
+# @migration-completed: Reaction to the successful migration
+#
 ##
 { 'enum': 'ShutdownCause',
   # Beware, shutdown_caused_by_guest() depends on enumeration order
   'data': [ 'none', 'host-error', 'host-qmp-quit', 'host-qmp-system-reset',
             'host-signal', 'host-ui', 'guest-shutdown', 'guest-reset',
-            'guest-panic', 'subsystem-reset'] }
+            'guest-panic', 'subsystem-reset', 'migration-completed'] }
 
 ##
 # @StatusInfo:
-- 
2.23.0


