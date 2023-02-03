Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416B8689123
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 08:44:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNqjK-0001FO-Bx; Fri, 03 Feb 2023 02:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pNqjH-0001Db-DC
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:43:27 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pNqjD-00030k-Ql
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:43:26 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4P7SJD0dJvz16NM6;
 Fri,  3 Feb 2023 15:41:00 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 3 Feb 2023 15:43:04 +0800
To: <qemu-devel@nongnu.org>
CC: <berrange@redhat.com>, <quintela@redhat.com>, <dgilbert@redhat.com>,
 <yubihong@huawei.com>, <xiexiangyou@huawei.com>, <zhengchuan@huawei.com>,
 <linyilu@huawei.com>, <jiangjiacheng@huawei.com>
Subject: [PATCH V2 2/2] migration: save/delete migration thread info
Date: Fri, 3 Feb 2023 15:35:19 +0800
Message-ID: <20230203073519.2969147-3-jiangjiacheng@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230203073519.2969147-1-jiangjiacheng@huawei.com>
References: <20230203073519.2969147-1-jiangjiacheng@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangjiacheng@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jiang Jiacheng <jiangjiacheng@huawei.com>
From:  Jiang Jiacheng via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To support query migration thread infomation, save and delete
thread(live_migration and multifdsend) information at thread
creation and finish.

Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>
---
 migration/migration.c | 5 +++++
 migration/multifd.c   | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 52b5d39244..cf895b1a3d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -57,6 +57,7 @@
 #include "net/announce.h"
 #include "qemu/queue.h"
 #include "multifd.h"
+#include "threadinfo.h"
 #include "qemu/yank.h"
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
@@ -3951,10 +3952,13 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
 static void *migration_thread(void *opaque)
 {
     MigrationState *s = opaque;
+    MigrationThread *thread = NULL;
     int64_t setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
     MigThrError thr_error;
     bool urgent = false;
 
+    thread = MigrationThreadAdd("live_migration", qemu_get_thread_id());
+
     rcu_register_thread();
 
     object_ref(OBJECT(s));
@@ -4031,6 +4035,7 @@ static void *migration_thread(void *opaque)
     migration_iteration_finish(s);
     object_unref(OBJECT(s));
     rcu_unregister_thread();
+    MigrationThreadDel(thread);
     return NULL;
 }
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 000ca4d4ec..c350547562 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -24,6 +24,7 @@
 #include "qemu-file.h"
 #include "trace.h"
 #include "multifd.h"
+#include "threadinfo.h"
 
 #include "qemu/yank.h"
 #include "io/channel-socket.h"
@@ -646,10 +647,13 @@ int multifd_send_sync_main(QEMUFile *f)
 static void *multifd_send_thread(void *opaque)
 {
     MultiFDSendParams *p = opaque;
+    MigrationThread *thread = NULL;
     Error *local_err = NULL;
     int ret = 0;
     bool use_zero_copy_send = migrate_use_zero_copy_send();
 
+    thread = MigrationThreadAdd(p->name, qemu_get_thread_id());
+
     trace_multifd_send_thread_start(p->id);
     rcu_register_thread();
 
@@ -759,6 +763,7 @@ out:
     qemu_mutex_unlock(&p->mutex);
 
     rcu_unregister_thread();
+    MigrationThreadDel(thread);
     trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal_pages);
 
     return NULL;
-- 
2.33.0


