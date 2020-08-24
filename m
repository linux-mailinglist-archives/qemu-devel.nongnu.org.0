Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A224F6D8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 11:06:20 +0200 (CEST)
Received: from localhost ([::1]:49524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kA8Ql-00044Y-QZ
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 05:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kA8OC-0007My-SG
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 05:03:40 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42060 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kA8OA-0007lR-Rq
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 05:03:40 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8AF0EC7B1B13410A838C;
 Mon, 24 Aug 2020 17:03:26 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Mon, 24 Aug 2020
 17:03:16 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>
Subject: [PATCH v5 01/12] migration/dirtyrate: setup up query-dirtyrate
 framwork
Date: Mon, 24 Aug 2020 17:14:29 +0800
Message-ID: <1598260480-64862-2-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598260480-64862-1-git-send-email-zhengchuan@huawei.com>
References: <1598260480-64862-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhengchuan@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 05:03:27
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, ann.zhuangyanying@huawei.com,
 fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add get_dirtyrate_thread() functions to setup query-dirtyrate
framework.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>
---
 migration/dirtyrate.c | 39 +++++++++++++++++++++++++++++++++++++++
 migration/dirtyrate.h | 32 ++++++++++++++++++++++++++++++++
 migration/meson.build |  1 +
 3 files changed, 72 insertions(+)
 create mode 100644 migration/dirtyrate.c
 create mode 100644 migration/dirtyrate.h

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
new file mode 100644
index 0000000..366f4e9
--- /dev/null
+++ b/migration/dirtyrate.c
@@ -0,0 +1,39 @@
+/*
+ * Dirtyrate implement code
+ *
+ * Copyright (c) 2017-2020 HUAWEI TECHNOLOGIES CO.,LTD.
+ *
+ * Authors:
+ *  Chuan Zheng <zhengchuan@huawei.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "crypto/hash.h"
+#include "crypto/random.h"
+#include "qemu/config-file.h"
+#include "exec/memory.h"
+#include "exec/ramblock.h"
+#include "exec/target_page.h"
+#include "qemu/rcu_queue.h"
+#include "qapi/qapi-commands-migration.h"
+#include "migration.h"
+#include "dirtyrate.h"
+
+static void calculate_dirtyrate(struct DirtyRateConfig config)
+{
+    /* todo */
+    return;
+}
+
+void *get_dirtyrate_thread(void *arg)
+{
+    struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
+
+    calculate_dirtyrate(config);
+
+    return NULL;
+}
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
new file mode 100644
index 0000000..33669b7
--- /dev/null
+++ b/migration/dirtyrate.h
@@ -0,0 +1,32 @@
+/*
+ *  Dirtyrate common functions
+ *
+ *  Copyright (c) 2020 HUAWEI TECHNOLOGIES CO., LTD.
+ *
+ *  Authors:
+ *  Chuan Zheng <zhengchuan@huawei.com>
+ *
+ *  This work is licensed under the terms of the GNU GPL, version 2 or later.
+ *  See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_MIGRATION_DIRTYRATE_H
+#define QEMU_MIGRATION_DIRTYRATE_H
+
+/*
+ * Sample 512 pages per GB as default.
+ * TODO: Make it configurable.
+ */
+#define DIRTYRATE_DEFAULT_SAMPLE_PAGES            512
+
+/* Take 1s as default for calculation duration */
+#define DEFAULT_FETCH_DIRTYRATE_TIME_SEC          1
+
+struct DirtyRateConfig {
+    uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
+    int64_t sample_period_seconds; /* time duration between two sampling */
+};
+
+void *get_dirtyrate_thread(void *arg);
+#endif
+
diff --git a/migration/meson.build b/migration/meson.build
index ac8ff14..30cc6c3 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -21,6 +21,7 @@ softmmu_ss.add(files(
   'channel.c',
   'colo-failover.c',
   'colo.c',
+  'dirtyrate.c',
   'exec.c',
   'fd.c',
   'global_state.c',
-- 
1.8.3.1


