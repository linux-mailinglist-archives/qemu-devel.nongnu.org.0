Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4544D290EAC
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 06:12:27 +0200 (CEST)
Received: from localhost ([::1]:58666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTdZy-0007aB-7e
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 00:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kTdXd-0005rN-I6
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 00:10:01 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5234 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kTdXa-0007BP-ES
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 00:10:01 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 89CCADA78D38A7C10B9E;
 Sat, 17 Oct 2020 12:09:46 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Sat, 17 Oct 2020
 12:09:40 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v3 01/18] migration/rdma: add the 'migrate_use_rdma_pin_all'
 function
Date: Sat, 17 Oct 2020 12:25:31 +0800
Message-ID: <1602908748-43335-2-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
References: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/17 00:09:47
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, fengzhimin1@huawei.com,
 qemu-devel@nongnu.org, xiexiangyou@huawei.com, alex.chen@huawei.com,
 wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/migration.c | 9 +++++++++
 migration/migration.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 0575ecb..64ae417 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2329,6 +2329,15 @@ bool migrate_use_events(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_EVENTS];
 }
 
+bool migrate_use_rdma_pin_all(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL];
+}
+
 bool migrate_use_multifd(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index deb411a..74fd790 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -300,6 +300,7 @@ bool migrate_ignore_shared(void);
 bool migrate_validate_uuid(void);
 
 bool migrate_auto_converge(void);
+bool migrate_use_rdma_pin_all(void);
 bool migrate_use_multifd(void);
 bool migrate_pause_before_switchover(void);
 int migrate_multifd_channels(void);
-- 
1.8.3.1


