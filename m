Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A693B348734
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 03:55:03 +0100 (CET)
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPG9G-0000Tu-Lv
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 22:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPG2k-00010z-Lw
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:48:18 -0400
Received: from mga07.intel.com ([134.134.136.100]:40251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPG2e-0001ZZ-Fu
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:48:18 -0400
IronPort-SDR: Gs2YxKAfmM5f5S41skjiRrG2hvLxSXJiCvql890Qy8UDBFRfhqbKCyxlGrjbpDxPOFlw0O/hps
 2uZXC6BCTATA==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="254823119"
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="254823119"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 19:48:11 -0700
IronPort-SDR: T+ZZUJ6bXG8PEOVDdVM2k8w2rA2gnVlawzgJ6KufPcCvUGTiroeftagCbThPclCjY6XLQKltkS
 NNeMcwZD9WoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="374881402"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2021 19:48:09 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v4 04/10] Remove migrate_set_block_enabled in checkpoint
Date: Thu, 25 Mar 2021 10:24:45 +0800
Message-Id: <1616639091-28279-5-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616639091-28279-1-git-send-email-lei.rao@intel.com>
References: <1616639091-28279-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.100; envelope-from=lei.rao@intel.com;
 helo=mga07.intel.com
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
index ca8b97b..4578f22 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2219,6 +2219,10 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
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


