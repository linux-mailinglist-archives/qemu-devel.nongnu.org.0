Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DF1279E1C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Sep 2020 06:46:57 +0200 (CEST)
Received: from localhost ([::1]:38366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMOaM-0007ZV-N1
	for lists+qemu-devel@lfdr.de; Sun, 27 Sep 2020 00:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kMOYu-00072y-LN
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 00:45:24 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5148 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kMOYs-0001St-KR
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 00:45:24 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 44EC45A7CFABD8C1552A;
 Sun, 27 Sep 2020 12:45:05 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Sun, 27 Sep 2020
 12:44:54 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>
Subject: [PATCH] migration/dirtyrate: present dirty rate only when querying
 the rate has completed
Date: Sun, 27 Sep 2020 12:55:20 +0800
Message-ID: <1601182520-130450-1-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/27 00:45:05
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
Cc: alex.chen@huawei.com, wanghao232@huawei.com, zhang.zhanghailiang@huawei.com,
 xiexiangyou@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make dirty_rate field optional, present dirty rate only when querying
the rate has completed.
The qmp results is shown as follow:
@unstarted:
{"return":{"status":"unstarted","start-time":0,"calc-time":0},"id":"libvirt-12"}
@measuring:
{"return":{"status":"measuring","start-time":0,"calc-time":0},"id":"libvirt-14"}
@measured:
{"return":{"status":"measured","dirty-rate":4,"start-time":150146,"calc-time":1},"id":"libvirt-15"}

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/dirtyrate.c | 3 +--
 qapi/migration.json   | 9 ++++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 68577ef..9024b0f 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -69,9 +69,8 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
     struct DirtyRateInfo *info = g_malloc0(sizeof(DirtyRateInfo));
 
     if (qatomic_read(&CalculatingState) == DIRTY_RATE_STATUS_MEASURED) {
+        info->has_dirty_rate = true;
         info->dirty_rate = dirty_rate;
-    } else {
-        info->dirty_rate = -1;
     }
 
     info->status = CalculatingState;
diff --git a/qapi/migration.json b/qapi/migration.json
index ce2216c..6e428f7 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1743,10 +1743,9 @@
 #
 # Information about current dirty page rate of vm.
 #
-# @dirty-rate: @dirtyrate describing the dirty page rate of vm
-#          in units of MB/s.
-#          If this field returns '-1', it means querying has not
-#          yet started or completed.
+# @dirty-rate: dirty-rate describing the dirty page rate of vm
+#              in units of MB/s, present only when querying the
+#              rate has completed.
 #
 # @status: status containing dirtyrate query status includes
 #          'unstarted' or 'measuring' or 'measured'
@@ -1759,7 +1758,7 @@
 #
 ##
 { 'struct': 'DirtyRateInfo',
-  'data': {'dirty-rate': 'int64',
+  'data': {'*dirty-rate': 'int64',
            'status': 'DirtyRateStatus',
            'start-time': 'int64',
            'calc-time': 'int64'} }
-- 
1.8.3.1


