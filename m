Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D790F25642D
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 04:44:45 +0200 (CEST)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBqr5-0008UK-7n
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 22:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kBqoY-0003VB-Qt
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 22:41:58 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4667 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kBqoV-0001wm-SG
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 22:41:58 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 76C2BD9F84FDFCC74CAE;
 Sat, 29 Aug 2020 10:41:43 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Sat, 29 Aug 2020
 10:41:35 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>, <dme@dme.org>
Subject: [PATCH v6 02/12] migration/dirtyrate: add DirtyRateStatus to denote
 calculation status
Date: Sat, 29 Aug 2020 10:52:47 +0800
Message-ID: <1598669577-76914-3-git-send-email-zhengchuan@huawei.com>
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

add DirtyRateStatus to denote calculating status.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/dirtyrate.c | 22 ++++++++++++++++++++++
 qapi/migration.json   | 17 +++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 44d673a..035ccd1 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -22,6 +22,19 @@
 #include "migration.h"
 #include "dirtyrate.h"
 
+static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
+
+static int dirtyrate_set_state(int *state, int old_state, int new_state)
+{
+    assert(new_state < DIRTY_RATE_STATUS__MAX);
+    if (atomic_cmpxchg(state, old_state, new_state) == old_state) {
+        return 0;
+    } else {
+        return -1;
+    }
+}
+
+
 static void calculate_dirtyrate(struct DirtyRateConfig config)
 {
     /* todo */
@@ -31,8 +44,17 @@ static void calculate_dirtyrate(struct DirtyRateConfig config)
 void *get_dirtyrate_thread(void *arg)
 {
     struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
+    int ret;
+
+    ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
+                              DIRTY_RATE_STATUS_MEASURING);
+    if (ret == -1) {
+        return NULL;
+    }
 
     calculate_dirtyrate(config);
 
+    ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_MEASURING,
+                              DIRTY_RATE_STATUS_MEASURED);
     return NULL;
 }
diff --git a/qapi/migration.json b/qapi/migration.json
index 5f6b061..061ff25 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1720,3 +1720,20 @@
 ##
 { 'event': 'UNPLUG_PRIMARY',
   'data': { 'device-id': 'str' } }
+
+##
+# @DirtyRateStatus:
+#
+# An enumeration of dirtyrate status.
+#
+# @unstarted: the dirtyrate thread has not been started.
+#
+# @measuring: the dirtyrate thread is measuring.
+#
+# @measured: the dirtyrate thread has measured and results are available.
+#
+# Since: 5.2
+#
+##
+{ 'enum': 'DirtyRateStatus',
+  'data': [ 'unstarted', 'measuring', 'measured'] }
-- 
1.8.3.1


