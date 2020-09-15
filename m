Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E87269BF4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 04:39:36 +0200 (CEST)
Received: from localhost ([::1]:40696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kI0sZ-00023q-QD
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 22:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kI0nQ-0002YJ-RU
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 22:34:16 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:34158 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kI0nO-0005uZ-O5
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 22:34:16 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8A35ECD0F257DD5D63F8;
 Tue, 15 Sep 2020 10:34:12 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 15 Sep 2020
 10:34:01 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>
Subject: [PATCH v9 11/12] migration/dirtyrate: Implement
 qmp_cal_dirty_rate()/qmp_get_dirty_rate() function
Date: Tue, 15 Sep 2020 10:44:46 +0800
Message-ID: <1600137887-58739-12-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1600137887-58739-1-git-send-email-zhengchuan@huawei.com>
References: <1600137887-58739-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhengchuan@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 21:28:41
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
Cc: zhengchuan@huawei.com, zhang.zhanghailiang@huawei.com, yuxiating@huawei.com,
 liq3ea@gmail.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, jinyan12@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement qmp_cal_dirty_rate()/qmp_get_dirty_rate() function which could be called

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/dirtyrate.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/migration.json   | 50 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index af02647..37d4bdf 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -61,6 +61,24 @@ static int dirtyrate_set_state(int *state, int old_state, int new_state)
     }
 }
 
+static struct DirtyRateInfo *query_dirty_rate_info(void)
+{
+    int64_t dirty_rate = DirtyStat.dirty_rate;
+    struct DirtyRateInfo *info = g_malloc0(sizeof(DirtyRateInfo));
+
+    if (atomic_read(&CalculatingState) == DIRTY_RATE_STATUS_MEASURED) {
+        info->dirty_rate = dirty_rate;
+    } else {
+        info->dirty_rate = -1;
+    }
+
+    info->status = CalculatingState;
+    info->start_time = DirtyStat.start_time;
+    info->calc_time = DirtyStat.calc_time;
+
+    return info;
+}
+
 static void reset_dirtyrate_stat(void)
 {
     DirtyStat.total_dirty_samples = 0;
@@ -318,6 +336,8 @@ static void calculate_dirtyrate(struct DirtyRateConfig config)
 
     msec = config.sample_period_seconds * 1000;
     msec = set_sample_page_period(msec, initial_time);
+    DirtyStat.start_time = initial_time / 1000;
+    DirtyStat.calc_time = msec / 1000;
 
     rcu_read_lock();
     if (!compare_page_hash_info(block_dinfo, block_count)) {
@@ -353,3 +373,45 @@ void *get_dirtyrate_thread(void *arg)
     }
     return NULL;
 }
+
+void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
+{
+    static struct DirtyRateConfig config;
+    QemuThread thread;
+    int ret;
+
+    /*
+     * If the dirty rate is already being measured, don't attempt to start.
+     */
+    if (atomic_read(&CalculatingState) == DIRTY_RATE_STATUS_MEASURING) {
+        error_setg(errp, "the dirty rate is already being measured.");
+        return;
+    }
+
+    if (!is_sample_period_valid(calc_time)) {
+        error_setg(errp, "calc-time is out of range[%d, %d].",
+                         MIN_FETCH_DIRTYRATE_TIME_SEC,
+                         MAX_FETCH_DIRTYRATE_TIME_SEC);
+        return;
+    }
+
+    /*
+     * Init calculation state as unstarted.
+     */
+    ret = dirtyrate_set_state(&CalculatingState, CalculatingState,
+                              DIRTY_RATE_STATUS_UNSTARTED);
+    if (ret == -1) {
+        error_setg(errp, "init dirty rate calculation state failed.");
+        return;
+    }
+
+    config.sample_period_seconds = calc_time;
+    config.sample_pages_per_gigabytes = DIRTYRATE_DEFAULT_SAMPLE_PAGES;
+    qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
+                       (void *)&config, QEMU_THREAD_DETACHED);
+}
+
+struct DirtyRateInfo *qmp_query_dirty_rate(Error **errp)
+{
+    return query_dirty_rate_info();
+}
diff --git a/qapi/migration.json b/qapi/migration.json
index 061ff25..4b980a0 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1737,3 +1737,53 @@
 ##
 { 'enum': 'DirtyRateStatus',
   'data': [ 'unstarted', 'measuring', 'measured'] }
+
+##
+# @DirtyRateInfo:
+#
+# Information about current dirty page rate of vm.
+#
+# @dirty-rate: @dirtyrate describing the dirty page rate of vm
+#          in units of MB/s.
+#          If this field return '-1', it means querying is not
+#          start or not complete.
+#
+# @status: status containing dirtyrate query status includes
+#          'unstarted' or 'measuring' or 'measured'
+#
+# @start-time: start time in units of second for calculation
+#
+# @calc-time: time in units of second for sample dirty pages
+#
+# Since: 5.2
+#
+##
+{ 'struct': 'DirtyRateInfo',
+  'data': {'dirty-rate': 'int64',
+           'status': 'DirtyRateStatus',
+           'start-time': 'int64',
+           'calc-time': 'int64'} }
+
+##
+# @calc-dirty-rate:
+#
+# start calculating dirty page rate for vm
+#
+# @calc-time: time in units of second for sample dirty pages
+#
+# Since: 5.2
+#
+# Example:
+#   {"command": "calc-dirty-rate", "data": {"calc-time": 1} }
+#
+##
+{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64'} }
+
+##
+# @query-dirty-rate:
+#
+# query dirty page rate in units of MB/s for vm
+#
+# Since: 5.2
+##
+{ 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
-- 
1.8.3.1


