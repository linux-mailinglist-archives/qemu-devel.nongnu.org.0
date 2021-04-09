Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A91D359337
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 05:44:21 +0200 (CEST)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUi4C-0004a0-5C
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 23:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lUi2Z-00034L-Jv
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 23:42:39 -0400
Received: from mga05.intel.com ([192.55.52.43]:12409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lUi2X-0007NR-SX
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 23:42:39 -0400
IronPort-SDR: 9KMicSLLzLfteZsclOXu5J89HhcUKc+eTE9divWgCczw0TzQ/jmi2g0KHjIFKb3Uf7g69uId/Y
 iv6YkBJGJQRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="278957326"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="278957326"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 20:42:37 -0700
IronPort-SDR: zb8u+B0G5QYE0VKirgTusnXQpn5Ra+ZUEfoxGt+6gkxX5FgQcfcvYakYpSxPxivqbj4MM+LKIK
 xxixhNG+2KyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="416081062"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga008.fm.intel.com with ESMTP; 08 Apr 2021 20:42:34 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v6 04/10] Remove migrate_set_block_enabled in checkpoint
Date: Thu,  8 Apr 2021 23:20:50 -0400
Message-Id: <1617938456-315058-5-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
References: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=lei.rao@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

We can detect disk migration in migrate_prepare, if disk migration
is enabled in COLO mode, we can directly report an error.and there
is no need to disable block migration at every checkpoint.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/colo.c      | 6 ------
 migration/migration.c | 4 ++++
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index de27662..1aaf316 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -435,12 +435,6 @@ static int colo_do_checkpoint_transaction(MigrationState *s,
     if (failover_get_state() != FAILOVER_STATUS_NONE) {
         goto out;
     }
-
-    /* Disable block migration */
-    migrate_set_block_enabled(false, &local_err);
-    if (local_err) {
-        goto out;
-    }
     qemu_mutex_lock_iothread();
 
 #ifdef CONFIG_REPLICATION
diff --git a/migration/migration.c b/migration/migration.c
index 8ca0341..c85b926 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2227,6 +2227,10 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
     }
 
     if (blk || blk_inc) {
+        if (migrate_colo_enabled()) {
+            error_setg(errp, "No disk migration is required in COLO mode");
+            return false;
+        }
         if (migrate_use_block() || migrate_use_block_incremental()) {
             error_setg(errp, "Command options are incompatible with "
                        "current migration capabilities");
-- 
1.8.3.1


