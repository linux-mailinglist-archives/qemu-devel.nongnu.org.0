Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E42C674FED
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:56:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pInBZ-00036k-3j; Fri, 20 Jan 2023 03:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pInB1-0002GX-8T
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:55:12 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pInAx-0002g1-FP
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:55:09 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NytYr0pV2zZfp1;
 Fri, 20 Jan 2023 16:53:04 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 20 Jan 2023 16:54:50 +0800
To: <qemu-devel@nongnu.org>
CC: <berrange@redhat.com>, <quintela@redhat.com>, <dgilbert@redhat.com>,
 <yubihong@huawei.com>, <xiexiangyou@huawei.com>, <zhengchuan@huawei.com>,
 <linyilu@huawei.com>, <jiangjiacheng@huawei.com>
Subject: [PATCH 1/3] migration: report migration thread name to libvirt
Date: Fri, 20 Jan 2023 16:47:33 +0800
Message-ID: <20230120084735.825054-2-jiangjiacheng@huawei.com>
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

Report migration thread name to libvirt in order to
support query migration thread infomation by its name.

Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>
---
 migration/migration.c |  3 +++
 migration/multifd.c   |  5 ++++-
 qapi/migration.json   | 12 ++++++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 52b5d39244..b4ce458bb9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3955,6 +3955,9 @@ static void *migration_thread(void *opaque)
     MigThrError thr_error;
     bool urgent = false;
 
+    /* report migration thread name to libvirt */
+    qapi_event_send_migration_name("live_migration");
+
     rcu_register_thread();
 
     object_ref(OBJECT(s));
diff --git a/migration/multifd.c b/migration/multifd.c
index 000ca4d4ec..6e834c7111 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -17,6 +17,7 @@
 #include "exec/ramblock.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "qapi/qapi-events-migration.h"
 #include "ram.h"
 #include "migration.h"
 #include "socket.h"
@@ -24,7 +25,6 @@
 #include "qemu-file.h"
 #include "trace.h"
 #include "multifd.h"
-
 #include "qemu/yank.h"
 #include "io/channel-socket.h"
 #include "yank_functions.h"
@@ -650,6 +650,9 @@ static void *multifd_send_thread(void *opaque)
     int ret = 0;
     bool use_zero_copy_send = migrate_use_zero_copy_send();
 
+    /* report multifd thread name to libvirt */
+    qapi_event_send_migration_name(p->name);
+
     trace_multifd_send_thread_start(p->id);
     rcu_register_thread();
 
diff --git a/qapi/migration.json b/qapi/migration.json
index 88ecf86ac8..b0cf366ac0 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1286,6 +1286,18 @@
 { 'event': 'MIGRATION_PASS',
   'data': { 'pass': 'int' } }
 
+##
+# @MIGRATION_NAME:
+#
+# Emitted when migration thread appear
+#
+# @name: name of migration thread
+#
+# Since: 7.2
+##
+{ 'event': 'MIGRATION_NAME',
+  'data': { 'name': 'str' } }
+
 ##
 # @COLOMessage:
 #
-- 
2.33.0


