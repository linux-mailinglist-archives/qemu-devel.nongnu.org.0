Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F2D24484F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 12:53:40 +0200 (CEST)
Received: from localhost ([::1]:58892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6XL9-00036g-DW
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 06:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1k6W9d-0006hs-0v
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:37:41 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42550 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1k6W9a-000641-V6
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:37:40 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A07A01ABD2FE3A78F995;
 Fri, 14 Aug 2020 17:37:35 +0800 (CST)
Received: from opensource.huawei.com (10.175.100.152) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Fri, 14 Aug 2020 17:37:27 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 08/12] migration/colo: Plug memleaks in
 colo_process_incoming_thread
Date: Fri, 14 Aug 2020 12:02:37 -0400
Message-ID: <20200814160241.7915-9-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200814160241.7915-1-pannengyuan@huawei.com>
References: <20200814160241.7915-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.152]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 05:21:34
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
 migration/colo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/colo.c b/migration/colo.c
index ea7d1e9d4e..17b5afc6b5 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -870,6 +870,7 @@ void *colo_process_incoming_thread(void *opaque)
     replication_start_all(REPLICATION_MODE_SECONDARY, &local_err);
     if (local_err) {
         qemu_mutex_unlock_iothread();
+        error_report_err(local_err);
         goto out;
     }
 #else
@@ -882,6 +883,7 @@ void *colo_process_incoming_thread(void *opaque)
     colo_send_message(mis->to_src_file, COLO_MESSAGE_CHECKPOINT_READY,
                       &local_err);
     if (local_err) {
+        error_report_err(local_err);
         goto out;
     }
 
-- 
2.18.2


