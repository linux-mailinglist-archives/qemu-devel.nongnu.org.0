Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3A0257430
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 09:18:47 +0200 (CEST)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCe5W-0004HI-44
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 03:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kCe48-0002cA-U9
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 03:17:20 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:40250 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kCe45-0005tE-Hc
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 03:17:20 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 91F719EBF7DE780F5464;
 Mon, 31 Aug 2020 15:17:10 +0800 (CST)
Received: from opensource.huawei.com (10.175.100.152) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 31 Aug 2020 15:17:04 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 07/10] migration/colo: Plug memleaks in
 colo_process_incoming_thread
Date: Mon, 31 Aug 2020 09:43:12 -0400
Message-ID: <20200831134315.1221-8-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200831134315.1221-1-pannengyuan@huawei.com>
References: <20200831134315.1221-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.152]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:17:11
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhang.zhanghailiang@huawei.com, Juan
 Quintela <quintela@redhat.com>, Pan Nengyuan <pannengyuan@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, euler.robot@huawei.com,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'local_err' forgot to free in colo_process_incoming_thread error path.
Fix that.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
---
- V2: Arrange all 'error_report_err' in 'out' label(suggested by Li Qiang).
---
 migration/colo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/migration/colo.c b/migration/colo.c
index ea7d1e9d4e..2288188fe2 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -888,7 +888,6 @@ void *colo_process_incoming_thread(void *opaque)
     while (mis->state == MIGRATION_STATUS_COLO) {
         colo_wait_handle_message(mis, fb, bioc, &local_err);
         if (local_err) {
-            error_report_err(local_err);
             break;
         }
 
@@ -924,6 +923,10 @@ out:
         qemu_fclose(fb);
     }
 
+    if (local_err) {
+        error_report_err(local_err);
+    }
+
     /* Hope this not to be too long to loop here */
     qemu_sem_wait(&mis->colo_incoming_sem);
     qemu_sem_destroy(&mis->colo_incoming_sem);
-- 
2.18.2


