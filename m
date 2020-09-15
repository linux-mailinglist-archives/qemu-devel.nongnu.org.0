Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDAD269BED
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 04:37:17 +0200 (CEST)
Received: from localhost ([::1]:33256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kI0qK-0007Sw-B2
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 22:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kI0nL-0002Ll-98
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 22:34:11 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:48968 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kI0nJ-0005tP-FG
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 22:34:11 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 39F1B6B1A8C28649F8E5;
 Tue, 15 Sep 2020 10:34:07 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 15 Sep 2020
 10:34:00 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>
Subject: [PATCH v9 09/12] migration/dirtyrate: Implement
 set_sample_page_period() and is_sample_period_valid()
Date: Tue, 15 Sep 2020 10:44:44 +0800
Message-ID: <1600137887-58739-10-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1600137887-58739-1-git-send-email-zhengchuan@huawei.com>
References: <1600137887-58739-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhengchuan@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 22:34:04
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

Implement is_sample_period_valid() to check if the sample period is vaild and
do set_sample_page_period() to sleep specific time between sample actions.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
---
 migration/dirtyrate.c | 24 ++++++++++++++++++++++++
 migration/dirtyrate.h |  6 ++++++
 2 files changed, 30 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 903f728..bcff10e 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -27,6 +27,30 @@
 static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
 static struct DirtyRateStat DirtyStat;
 
+static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
+{
+    int64_t current_time;
+
+    current_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    if ((current_time - initial_time) >= msec) {
+        msec = current_time - initial_time;
+    } else {
+        g_usleep((msec + initial_time - current_time) * 1000);
+    }
+
+    return msec;
+}
+
+static bool is_sample_period_valid(int64_t sec)
+{
+    if (sec < MIN_FETCH_DIRTYRATE_TIME_SEC ||
+        sec > MAX_FETCH_DIRTYRATE_TIME_SEC) {
+        return false;
+    }
+
+    return true;
+}
+
 static int dirtyrate_set_state(int *state, int old_state, int new_state)
 {
     assert(new_state < DIRTY_RATE_STATUS__MAX);
diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
index faaf9da..8f9bc80 100644
--- a/migration/dirtyrate.h
+++ b/migration/dirtyrate.h
@@ -29,6 +29,12 @@
  */
 #define MIN_RAMBLOCK_SIZE                         128
 
+/*
+ * Take 1s as minimum time for calculation duration
+ */
+#define MIN_FETCH_DIRTYRATE_TIME_SEC              1
+#define MAX_FETCH_DIRTYRATE_TIME_SEC              60
+
 struct DirtyRateConfig {
     uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
     int64_t sample_period_seconds; /* time duration between two sampling */
-- 
1.8.3.1


