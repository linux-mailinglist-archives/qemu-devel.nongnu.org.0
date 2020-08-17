Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C2F245AF5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 05:11:29 +0200 (CEST)
Received: from localhost ([::1]:39156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7VYW-0002oP-60
	for lists+qemu-devel@lfdr.de; Sun, 16 Aug 2020 23:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k7VWA-0006C8-BW
 for qemu-devel@nongnu.org; Sun, 16 Aug 2020 23:09:02 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:56670 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k7VW7-0008IW-R8
 for qemu-devel@nongnu.org; Sun, 16 Aug 2020 23:09:02 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B1789AF81AE59B1B1318;
 Mon, 17 Aug 2020 11:08:48 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Mon, 17 Aug 2020
 11:08:42 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v3 01/10] migration/dirtyrate: Add get_dirtyrate_thread()
 function
Date: Mon, 17 Aug 2020 11:20:24 +0800
Message-ID: <1597634433-18809-2-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1597634433-18809-1-git-send-email-zhengchuan@huawei.com>
References: <1597634433-18809-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhengchuan@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/16 23:08:49
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
Cc: zhang.zhanghailiang@huawei.com, linyilu@huawei.com, qemu-devel@nongnu.org,
 alex.chen@huawei.com, ann.zhuangyanying@huawei.com, fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add get_dirtyrate_thread() functions

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>
---
 migration/Makefile.objs |  1 +
 migration/dirtyrate.c   | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
 migration/dirtyrate.h   | 44 ++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 migration/dirtyrate.c
 create mode 100644 migration/dirtyrate.h

diff --git a/migration/Makefile.objs b/migration/Makefile.objs
index 0fc619e..12ae98c 100644
--- a/migration/Makefile.objs
+++ b/migration/Makefile.objs
@@ -6,6 +6,7 @@ common-obj-y += qemu-file.o global_state.o
 common-obj-y += qemu-file-channel.o
 common-obj-y += xbzrle.o postcopy-ram.o
 common-obj-y += qjson.o
+common-obj-y += dirtyrate.o
 common-obj-y += block-dirty-bitmap.o
 common-obj-y += multifd.o
 common-obj-y += multifd-zlib.o
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
new file mode 100644
index 0000000..bb0ebe9
--- /dev/null
+++ b/migration/dirtyrate.c
@@ -0,0 +1,64 @@
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
+CalculatingDirtyRateState CalculatingState = CAL_DIRTY_RATE_INIT;
+
+static int dirty_rate_set_state(int new_state)
+{
+    int old_state = CalculatingState;
+
+    if (new_state == old_state) {
+        return -1;
+    }
+
+    if (atomic_cmpxchg(&CalculatingState, old_state, new_state) != old_state) {
+        return -1;
+    }
+
+    return 0;
+}
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
+    int ret;
+
+    ret = dirty_rate_set_state(CAL_DIRTY_RATE_ACTIVE);
+    if (ret == -1) {
+        return NULL;
+    }
+
+    calculate_dirtyrate(config);
+
+    ret = dirty_rate_set_state(CAL_DIRTY_RATE_END);
+
+    return NULL;
+}
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
new file mode 100644
index 0000000..914c363
--- /dev/null
+++ b/migration/dirtyrate.h
@@ -0,0 +1,44 @@
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
+ * Sample 256 pages per GB as default.
+ * TODO: Make it configurable.
+ */
+#define DIRTYRATE_DEFAULT_SAMPLE_PAGES            256
+
+/* Take 1s as default for calculation duration */
+#define DEFAULT_FETCH_DIRTYRATE_TIME_SEC          1
+
+struct DirtyRateConfig {
+    uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
+    int64_t sample_period_seconds; /* time duration between two sampling */
+};
+
+/*
+ *  To record calculate dirty_rate status:
+ *  0: initial status, calculating thread is not be created here.
+ *  1: calculating thread is created.
+ *  2: calculating thread is end, we can get result.
+ */
+typedef enum {
+    CAL_DIRTY_RATE_INIT = 0,
+    CAL_DIRTY_RATE_ACTIVE,
+    CAL_DIRTY_RATE_END,
+} CalculatingDirtyRateState;
+
+void *get_dirtyrate_thread(void *arg);
+#endif
+
-- 
1.8.3.1


