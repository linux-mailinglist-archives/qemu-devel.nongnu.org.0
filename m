Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF938256427
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 04:43:20 +0200 (CEST)
Received: from localhost ([::1]:33276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBqpX-00050k-VG
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 22:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kBqoW-0003Tn-Gd
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 22:41:56 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4666 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kBqoT-0001wn-V6
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 22:41:56 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7158C81213B584FA4A6D;
 Sat, 29 Aug 2020 10:41:43 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Sat, 29 Aug 2020
 10:41:35 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>, <dme@dme.org>
Subject: [PATCH v6 01/12] migration/dirtyrate: setup up query-dirtyrate
 framwork
Date: Sat, 29 Aug 2020 10:52:46 +0800
Message-ID: <1598669577-76914-2-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598669577-76914-1-git-send-email-zhengchuan@huawei.com>
References: <1598669577-76914-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 22:41:44
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
Cc: alex.chen@huawei.com, ann.zhuangyanying@huawei.com,
 zhang.zhanghailiang@huawei.com, xiexiangyou@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add get_dirtyrate_thread() functions to setup query-dirtyrate
framework.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/dirtyrate.c | 38 ++++++++++++++++++++++++++++++++++++++
 migration/dirtyrate.h | 29 +++++++++++++++++++++++++++++
 migration/meson.build |  2 +-
 3 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 migration/dirtyrate.c
 create mode 100644 migration/dirtyrate.h

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
new file mode 100644
index 0000000..44d673a
--- /dev/null
+++ b/migration/dirtyrate.c
@@ -0,0 +1,38 @@
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
+#include "cpu.h"
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
index 0000000..5be9714
--- /dev/null
+++ b/migration/dirtyrate.h
@@ -0,0 +1,29 @@
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
+struct DirtyRateConfig {
+    uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
+    int64_t sample_period_seconds; /* time duration between two sampling */
+};
+
+void *get_dirtyrate_thread(void *arg);
+#endif
+
diff --git a/migration/meson.build b/migration/meson.build
index ac8ff14..b5b71c8 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -37,4 +37,4 @@ softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
 softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
 softmmu_ss.add(when: 'CONFIG_ZSTD', if_true: [files('multifd-zstd.c'), zstd])
 
-specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('ram.c'))
+specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('dirtyrate.c', 'ram.c'))
-- 
1.8.3.1


