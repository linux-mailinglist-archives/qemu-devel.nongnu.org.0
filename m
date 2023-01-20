Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20419674FEE
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:56:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pInBX-0002M0-3O; Fri, 20 Jan 2023 03:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pInB1-0002GY-83
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:55:11 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pInAx-0002g3-Ux
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:55:09 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NytYj06ptzRqtl;
 Fri, 20 Jan 2023 16:52:57 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 20 Jan 2023 16:54:51 +0800
To: <qemu-devel@nongnu.org>
CC: <berrange@redhat.com>, <quintela@redhat.com>, <dgilbert@redhat.com>,
 <yubihong@huawei.com>, <xiexiangyou@huawei.com>, <zhengchuan@huawei.com>,
 <linyilu@huawei.com>, <jiangjiacheng@huawei.com>
Subject: [PATCH 3/3] migration: save/delete migration thread info
Date: Fri, 20 Jan 2023 16:47:35 +0800
Message-ID: <20230120084735.825054-4-jiangjiacheng@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230120084735.825054-1-jiangjiacheng@huawei.com>
References: <20230120084735.825054-1-jiangjiacheng@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangjiacheng@huawei.com; helo=szxga02-in.huawei.com
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
thread information at thread creation and end.

Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>
---
 migration/migration.c | 4 ++++
 migration/multifd.c   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index b4ce458bb9..957205e693 100644
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
@@ -3951,10 +3952,12 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
 static void *migration_thread(void *opaque)
 {
     MigrationState *s = opaque;
+    MigrationThread *thread = NULL;
     int64_t setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
     MigThrError thr_error;
     bool urgent = false;
 
+    thread = MigrationThreadAdd("live_migration", qemu_get_thread_id());
     /* report migration thread name to libvirt */
     qapi_event_send_migration_name("live_migration");
 
@@ -4034,6 +4037,7 @@ static void *migration_thread(void *opaque)
     migration_iteration_finish(s);
     object_unref(OBJECT(s));
     rcu_unregister_thread();
+    MigrationThreadDel(thread);
     return NULL;
 }
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 6e834c7111..fca06284de 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -25,6 +25,7 @@
 #include "qemu-file.h"
 #include "trace.h"
 #include "multifd.h"
+#include "threadinfo.h"
 #include "qemu/yank.h"
 #include "io/channel-socket.h"
 #include "yank_functions.h"
@@ -646,10 +647,12 @@ int multifd_send_sync_main(QEMUFile *f)
 static void *multifd_send_thread(void *opaque)
 {
     MultiFDSendParams *p = opaque;
+    MigrationThread *thread = NULL;
     Error *local_err = NULL;
     int ret = 0;
     bool use_zero_copy_send = migrate_use_zero_copy_send();
 
+    thread = MigrationThreadAdd(p->name, qemu_get_thread_id());
     /* report multifd thread name to libvirt */
     qapi_event_send_migration_name(p->name);
 
@@ -762,6 +765,7 @@ out:
     qemu_mutex_unlock(&p->mutex);
 
     rcu_unregister_thread();
+    MigrationThreadDel(thread);
     trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal_pages);
 
     return NULL;
-- 
2.33.0


