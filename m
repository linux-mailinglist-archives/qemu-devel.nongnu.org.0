Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028D6662425
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:23:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqFH-0007sK-6c; Mon, 09 Jan 2023 06:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pEqFE-0007qQ-Ra
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:23:12 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pEqFC-0001eE-Ln
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:23:12 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NrBN52Z2wznVBn
 for <qemu-devel@nongnu.org>; Mon,  9 Jan 2023 19:21:25 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 9 Jan 2023 19:22:57 +0800
To: <qemu-devel@nongnu.org>
CC: <yubihong@huawei.com>, <xiexiangyou@huawei.com>, <zhengchuan@huawei.com>, 
 <linyilu@huawei.com>, <jiangjiacheng@huawei.com>
Subject: [PATCH 1/2] migration: report migration related thread pid to libvirt
Date: Mon, 9 Jan 2023 19:16:30 +0800
Message-ID: <20230109111631.2386894-2-jiangjiacheng@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230109111631.2386894-1-jiangjiacheng@huawei.com>
References: <20230109111631.2386894-1-jiangjiacheng@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangjiacheng@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jiang Jiacheng <jiangjiacheng@huawei.com>
From:  Jiang Jiacheng via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Zheng Chuan <zhengchuan@huawei.com>

Report migration thread pid to libvirt in order to pin
migration thread to different cpu.
---
 migration/migration.c |  3 +++
 qapi/migration.json   | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 52b5d39244..2534e5a1f1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3955,6 +3955,9 @@ static void *migration_thread(void *opaque)
     MigThrError thr_error;
     bool urgent = false;
 
+    /* report migration thread pid to libvirt */
+    qapi_event_send_migration_pid(qemu_get_thread_id());
+
     rcu_register_thread();
 
     object_ref(OBJECT(s));
diff --git a/qapi/migration.json b/qapi/migration.json
index 88ecf86ac8..aafc940617 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1286,6 +1286,18 @@
 { 'event': 'MIGRATION_PASS',
   'data': { 'pass': 'int' } }
 
+##
+# @MIGRATION_PID:
+#
+# Emitted when migration thread appear
+#
+# @pid: pid of migration thread
+#
+# Since: 7.2
+##
+{ 'event': 'MIGRATION_PID',
+  'data': { 'pid': 'int' } }
+
 ##
 # @COLOMessage:
 #
-- 
2.33.0


