Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F76250E46
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 03:34:44 +0200 (CEST)
Received: from localhost ([::1]:38452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kANrH-0004ML-BB
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 21:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kANnp-0004uB-Fx
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 21:31:09 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4211 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kANnj-0005pf-J7
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 21:31:09 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3B6CED22C2220DACB1FB;
 Tue, 25 Aug 2020 09:30:57 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 25 Aug 2020
 09:30:49 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>
Subject: [PATCH v5 02/12] migration/dirtyrate: add DirtyRateStatus to denote
 calculation status
Date: Tue, 25 Aug 2020 09:40:40 +0800
Message-ID: <1598319650-36762-3-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598319650-36762-1-git-send-email-zhengchuan@huawei.com>
References: <1598319650-36762-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 21:30:58
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
Cc: zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, ann.zhuangyanying@huawei.com,
 fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add DirtyRateStatus to denote calculating status.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/dirtyrate.c | 22 ++++++++++++++++++++++
 qapi/migration.json   | 17 +++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 366f4e9..91987c5 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -23,6 +23,19 @@
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
@@ -32,8 +45,17 @@ static void calculate_dirtyrate(struct DirtyRateConfig config)
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
index 5f6b061..d640165 100644
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
+# @unstarted: query-dirtyrate thread is not initial.
+#
+# @measuring: query-dirtyrate thread is created and start to measure.
+#
+# @measured:  query-dirtyrate thread is end, we can get result.
+#
+# Since: 5.2
+#
+##
+{ 'enum': 'DirtyRateStatus',
+  'data': [ 'unstarted', 'measuring', 'measured'] }
-- 
1.8.3.1


