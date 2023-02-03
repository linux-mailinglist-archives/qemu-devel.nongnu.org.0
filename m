Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D74689126
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 08:44:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNqjK-0001FP-BK; Fri, 03 Feb 2023 02:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pNqjF-0001DR-De
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:43:27 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pNqjC-00030j-A4
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:43:24 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4P7SLN2YdhzfZ57;
 Fri,  3 Feb 2023 15:42:52 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 3 Feb 2023 15:43:03 +0800
To: <qemu-devel@nongnu.org>
CC: <berrange@redhat.com>, <quintela@redhat.com>, <dgilbert@redhat.com>,
 <yubihong@huawei.com>, <xiexiangyou@huawei.com>, <zhengchuan@huawei.com>,
 <linyilu@huawei.com>, <jiangjiacheng@huawei.com>
Subject: [PATCH V2 1/2] migration: Introduce interface query-migrationthreads
Date: Fri, 3 Feb 2023 15:35:18 +0800
Message-ID: <20230203073519.2969147-2-jiangjiacheng@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangjiacheng@huawei.com; helo=szxga01-in.huawei.com
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

Introduce interface query-migrationthreads. The interface is used
to query information about migration threads and returns with
migration thread's name and its id.
Introduce threadinfo.c to manage threads with migration.

Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>
---
 migration/meson.build  |  1 +
 migration/threadinfo.c | 54 ++++++++++++++++++++++++++++++++++++++++++
 migration/threadinfo.h | 28 ++++++++++++++++++++++
 qapi/migration.json    | 29 +++++++++++++++++++++++
 4 files changed, 112 insertions(+)
 create mode 100644 migration/threadinfo.c
 create mode 100644 migration/threadinfo.h

diff --git a/migration/meson.build b/migration/meson.build
index 690487cf1a..ed7d27f11a 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -25,6 +25,7 @@ softmmu_ss.add(files(
   'savevm.c',
   'socket.c',
   'tls.c',
+  'threadinfo.c',
 ), gnutls)
 
 softmmu_ss.add(when: rdma, if_true: files('rdma.c'))
diff --git a/migration/threadinfo.c b/migration/threadinfo.c
new file mode 100644
index 0000000000..cfb27be77b
--- /dev/null
+++ b/migration/threadinfo.c
@@ -0,0 +1,54 @@
+/*
+ *  Migration Threads info
+ *
+ *  Copyright (c) 2022 HUAWEI TECHNOLOGIES CO., LTD.
+ *
+ *  Authors:
+ *  Jiang Jiacheng <jiangjiacheng@huawei.com>
+ *
+ *  This work is licensed under the terms of the GNU GPL, version 2 or later.
+ *  See the COPYING file in the top-level directory.
+ */
+
+#include "threadinfo.h"
+
+static QLIST_HEAD(, MigrationThread) migration_threads;
+
+MigrationThread* MigrationThreadAdd(const char *name, int thread_id)
+{
+    MigrationThread *thread = NULL;
+
+    thread = g_new0(MigrationThread, 1);
+    thread->name = (char*)name;
+    thread->thread_id = thread_id;
+
+    QLIST_INSERT_HEAD(&migration_threads, thread, node);
+
+    return thread;
+}
+
+void MigrationThreadDel(MigrationThread* thread)
+{
+    if (thread) {
+        QLIST_REMOVE(thread, node);
+	    g_free(thread);
+    }
+}
+
+MigrationThreadInfoList* qmp_query_migrationthreads(Error **errp)
+{
+    MigrationThreadInfoList *head = NULL;
+    MigrationThreadInfoList **tail = &head;
+    MigrationThread *thread = NULL;
+    MigrationThreadInfo *info = NULL;
+
+    QLIST_FOREACH(thread, &migration_threads, node) {
+        info = g_new0(MigrationThreadInfo, 1);
+        info->name = g_strdup(thread->name);
+        info->thread_id = thread->thread_id;
+
+        QAPI_LIST_APPEND(tail, info);
+    }
+
+    return head;
+}
diff --git a/migration/threadinfo.h b/migration/threadinfo.h
new file mode 100644
index 0000000000..ebe86a2699
--- /dev/null
+++ b/migration/threadinfo.h
@@ -0,0 +1,28 @@
+/*
+ *  Migration Threads info
+ *
+ *  Copyright (c) 2022 HUAWEI TECHNOLOGIES CO., LTD.
+ *
+ *  Authors:
+ *  Jiang Jiacheng <jiangjiacheng@huawei.com>
+ *
+ *  This work is licensed under the terms of the GNU GPL, version 2 or later.
+ *  See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/queue.h"
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-migration.h"
+
+typedef struct MigrationThread MigrationThread;
+
+struct MigrationThread {
+    char *name; /* the name of migration thread */
+    int thread_id; /* ID of the underlying host thread */
+    QLIST_ENTRY(MigrationThread) node;
+};
+
+MigrationThread *MigrationThreadAdd(const char *name, int thread_id);
+
+void MigrationThreadDel(MigrationThread* info);
diff --git a/qapi/migration.json b/qapi/migration.json
index 88ecf86ac8..c84fa10e86 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1958,6 +1958,35 @@
 { 'command': 'query-vcpu-dirty-limit',
   'returns': [ 'DirtyLimitInfo' ] }
 
+##
+# @MigrationThreadInfo:
+#
+# Information about migrationthreads
+#
+# @name: the name of migration thread
+#
+# @thread-id: ID of the underlying host thread
+#
+# Since: 7.2
+##
+{ 'struct': 'MigrationThreadInfo',
+  'data': {'name': 'str',
+           'thread-id': 'int'} }
+
+##
+# @query-migrationthreads:
+#
+# Returns information of migration threads
+#
+# data: migration thread name
+#
+# returns: information about migration threads
+#
+# Since: 7.2
+##
+{ 'command': 'query-migrationthreads',
+  'returns': ['MigrationThreadInfo'] }
+
 ##
 # @snapshot-save:
 #
-- 
2.33.0


