Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687835B44B3
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 08:39:53 +0200 (CEST)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWu9g-0000kH-17
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 02:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuhaiwei9699@126.com>)
 id 1oWu6Q-0006d4-4o; Sat, 10 Sep 2022 02:36:32 -0400
Received: from m15113.mail.126.com ([220.181.15.113]:9737)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuhaiwei9699@126.com>)
 id 1oWu6L-0006K8-B9; Sat, 10 Sep 2022 02:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=n4ZCX
 flsCrFFLrenzFNCWKcSHgEYTJxNxKtkAF9brrY=; b=PbXDxbp5z6jfxs0dINzH5
 v5edofRVyyTaj8TAV+LTBlVDHFCLxi6Q+AV3fHSgqZU0e/3rK3B90RV4jVwsC7Kb
 +LmjJeq9ig0tmzBrOTmAdZJ5IUEmoycSuG9zC3z9ubO5RryWntx4/6DzoO2Mpdia
 kV4XG0dOCc46SWWDp+bbqs=
Received: from localhost.localdomain (unknown [58.56.96.29])
 by smtp3 (Coremail) with SMTP id DcmowAC33sJWMBxjWgsoBQ--.35469S2;
 Sat, 10 Sep 2022 14:36:07 +0800 (CST)
From: liuhaiwei <liuhaiwei9699@126.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Cc: stefanha@redhat.com, fam@euphon.net, eblake@redhat.com,
 vsementsov@yandex-team.ru, jsnow@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, liuhaiwei <liuhaiwei@inspur.com>,
 liuhaiwei <liuhaiwei9699@126.com>
Subject: [PATCH] bugfix:migrate with block-dirty-bitmap (disk size is big
 enough) can't be finished
Date: Sat, 10 Sep 2022 02:35:42 -0400
Message-Id: <20220910063542.3036319-1-liuhaiwei9699@126.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowAC33sJWMBxjWgsoBQ--.35469S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4kAr1ruw1UZFWDZF1UZFb_yoW8JFW5pr
 s7GwsrCrsxAF1qqF43JrWUXF1YqFs5KFsrCrZ5Z345GrZxJFnFvw4xK3Wjg3y0yF9ayF43
 ZF4vgw1xtr1jvr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bYg4hUUUUU=
X-Originating-IP: [58.56.96.29]
X-CM-SenderInfo: xolxxt5lzhxmqwzzqiyswou0bp/1tbi3A531lpEEOz3mgABs9
Received-SPF: pass client-ip=220.181.15.113;
 envelope-from=liuhaiwei9699@126.com; helo=m15113.mail.126.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: liuhaiwei <liuhaiwei@inspur.com>

bug description as  https://gitlab.com/qemu-project/qemu/-/issues/1203
Usually,we use the precopy or postcopy mode to migrate block dirty bitmap.
but if block-dirty-bitmap size more than threshold size,we cannot entry the migration_completion in migration_iteration_run function
To solve this problem, we can setting  the pending size to a fake value(threshold-1 or 0) to tell  migration_iteration_run function to entry the migration_completion,if pending size > threshold size

Signed-off-by: liuhaiwei <liuhaiwei9699@126.com>
Signed-off-by: liuhaiwei <liuhaiwei@inspur.com>
---
 migration/block-dirty-bitmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 9aba7d9c22..5cbf365f46 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -782,6 +782,10 @@ static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
     }
 
     qemu_mutex_unlock_iothread();
+     /*we set the fake pending size  when the dirty bitmap size more than max_size */
+    if(pending >= max_size && max_size != 0){
+        pending = max_size - 1;
+    }
 
     trace_dirty_bitmap_save_pending(pending, max_size);
 
-- 
2.27.0


