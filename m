Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E142A7A4D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 10:18:59 +0100 (CET)
Received: from localhost ([::1]:41804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kabQ2-0001FV-9a
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 04:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1kabPA-0000oZ-R8
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 04:18:04 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1kabP8-0003Fv-0W
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 04:18:04 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CRdGJ6fLNzkdBW;
 Thu,  5 Nov 2020 17:17:44 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.151.207) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 5 Nov 2020 17:17:41 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH] migration: handle CANCELLING state in migration_completion()
Date: Thu, 5 Nov 2020 17:17:26 +0800
Message-ID: <20201105091726.148-1-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.151.207]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=longpeng2@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 04:17:52
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: longpeng2@huawei.com, arei.gonglei@huawei.com, huangzhichao@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following sequence may cause the VM abort during migration:

1. RUN_STATE_RUNNING,MIGRATION_STATUS_ACTIVE

2. before call migration_completion(), we send migrate_cancel
   QMP command, the state machine is changed to:
     RUN_STATE_RUNNING,MIGRATION_STATUS_CANCELLING

3. call migration_completion(), and the state machine is
   switch to: RUN_STATE_RUNNING,MIGRATION_STATUS_COMPLETED

4. call migration_iteration_finish(), because the migration
   status is COMPLETED, so it will try to set the runstate
   to POSTMIGRATE, but RUNNING-->POSTMIGRATE is an invalid
   transition, so abort().

The migration_completion() should not change the migration state
to COMPLETED if it is already changed to CANCELLING.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 migration/migration.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 3263aa5..b11a2bd 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3061,6 +3061,8 @@ static void migration_completion(MigrationState *s)
 
         qemu_savevm_state_complete_postcopy(s->to_dst_file);
         trace_migration_completion_postcopy_end_after_complete();
+    } else if (s->state == MIGRATION_STATUS_CANCELLING) {
+        goto fail;
     }
 
     /*
-- 
1.8.3.1


