Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A1233852F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 06:27:08 +0100 (CET)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKaKJ-0006v4-3u
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 00:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaIg-00055Y-2E
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:25:26 -0500
Received: from mga05.intel.com ([192.55.52.43]:4921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaId-0006dL-79
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:25:25 -0500
IronPort-SDR: 29sNGDTZ34O8l+/9paQCByuHDBQZ4RDmpeZJ4RaiijrYwXWrp2D2cKsZsimnUS+oVu5rrSmZD8
 3S6TYl/SUKcA==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="273826912"
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="273826912"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 21:25:22 -0800
IronPort-SDR: YXiWo7Va/MA5OzypavOpJcjb/zZaEVRxSHaqawoXiRtsCcuidXxZ/M+H4b+fBK3XQaOM8ttdIc
 AHKCWrF+vPWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="600481925"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga006.fm.intel.com with ESMTP; 11 Mar 2021 21:25:19 -0800
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v2 04/10] Remove migrate_set_block_enabled in checkpoint
Date: Fri, 12 Mar 2021 13:02:57 +0800
Message-Id: <1615525383-59071-5-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
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
index a5ddf43..785a331 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2221,6 +2221,10 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
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


