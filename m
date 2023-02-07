Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809C268CBA1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 02:02:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPCLU-0003Oz-1c; Mon, 06 Feb 2023 20:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCKi-0001sf-Ro
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:59:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCKh-00041z-33
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675731578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w3fY2GTLs2aZFehMLZMK3yX/B0Z2HIIVrnQhAJjxhrs=;
 b=ULuyjnBSZ7IhYAAH80jOV6X6ovv+LRbu3x7ZYz/k5UBTCbndMwbyEEH2pd9eIdboXaVWJa
 WvCpQVr6jQzQ9MIn+xp2RKg4PzKmB17fi+QI0NKPuE/wsOs6M91S8O2PkchLnIWn4vI/D+
 V/qiO+WUjJ1R0nTM+IU+2JbN2EwrCrY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-XoZu7-gEOHe_VM8UtJfNiw-1; Mon, 06 Feb 2023 19:59:34 -0500
X-MC-Unique: XoZu7-gEOHe_VM8UtJfNiw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7A6B1875041;
 Tue,  7 Feb 2023 00:59:33 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8A65492C3C;
 Tue,  7 Feb 2023 00:59:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Jiang Jiacheng <jiangjiacheng@huawei.com>
Subject: [PULL 29/30] migration: Introduce interface query-migrationthreads
Date: Tue,  7 Feb 2023 01:56:49 +0100
Message-Id: <20230207005650.1810-30-quintela@redhat.com>
In-Reply-To: <20230207005650.1810-1-quintela@redhat.com>
References: <20230207005650.1810-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jiang Jiacheng <jiangjiacheng@huawei.com>

Introduce interface query-migrationthreads. The interface is used
to query information about migration threads and returns with
migration thread's name and its id.
Introduce threadinfo.c to manage threads with migration.

Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 qapi/migration.json    | 29 ++++++++++++++++++++++++
 migration/threadinfo.h | 28 +++++++++++++++++++++++
 migration/threadinfo.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 migration/meson.build  |  1 +
 4 files changed, 109 insertions(+)
 create mode 100644 migration/threadinfo.h
 create mode 100644 migration/threadinfo.c

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
diff --git a/migration/threadinfo.h b/migration/threadinfo.h
new file mode 100644
index 0000000000..4d69423c0a
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
+    const char *name; /* the name of migration thread */
+    int thread_id; /* ID of the underlying host thread */
+    QLIST_ENTRY(MigrationThread) node;
+};
+
+MigrationThread *MigrationThreadAdd(const char *name, int thread_id);
+
+void MigrationThreadDel(MigrationThread *info);
diff --git a/migration/threadinfo.c b/migration/threadinfo.c
new file mode 100644
index 0000000000..1de8b31855
--- /dev/null
+++ b/migration/threadinfo.c
@@ -0,0 +1,51 @@
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
+MigrationThread *MigrationThreadAdd(const char *name, int thread_id)
+{
+    MigrationThread *thread =  g_new0(MigrationThread, 1);
+    thread->name = name;
+    thread->thread_id = thread_id;
+
+    QLIST_INSERT_HEAD(&migration_threads, thread, node);
+
+    return thread;
+}
+
+void MigrationThreadDel(MigrationThread *thread)
+{
+    if (thread) {
+        QLIST_REMOVE(thread, node);
+        g_free(thread);
+    }
+}
+
+MigrationThreadInfoList *qmp_query_migrationthreads(Error **errp)
+{
+    MigrationThreadInfoList *head = NULL;
+    MigrationThreadInfoList **tail = &head;
+    MigrationThread *thread = NULL;
+
+    QLIST_FOREACH(thread, &migration_threads, node) {
+        MigrationThreadInfo *info = g_new0(MigrationThreadInfo, 1);
+        info->name = g_strdup(thread->name);
+        info->thread_id = thread->thread_id;
+
+        QAPI_LIST_APPEND(tail, info);
+    }
+
+    return head;
+}
diff --git a/migration/meson.build b/migration/meson.build
index a9e7e18793..0d1bb9f96e 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -26,6 +26,7 @@ softmmu_ss.add(files(
   'savevm.c',
   'socket.c',
   'tls.c',
+  'threadinfo.c',
 ), gnutls)
 
 softmmu_ss.add(when: rdma, if_true: files('rdma.c'))
-- 
2.39.1


