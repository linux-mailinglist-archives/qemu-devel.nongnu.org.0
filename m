Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39152F421D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 03:55:44 +0100 (CET)
Received: from localhost ([::1]:45904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzWJz-0007Wf-TR
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 21:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kzWI6-0005xL-9q
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:53:47 -0500
Received: from mga09.intel.com ([134.134.136.24]:58694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kzWI1-0003yA-8J
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:53:44 -0500
IronPort-SDR: jcOE+p1Z6CkYMPhxIgvXw0X5mDyqUj4AoujC+Da0Xo+PKhbE7YwUFSn9gUIcWKLbcrlPpN7KRo
 6JUi7o5Uhv6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="178289693"
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="178289693"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 18:53:40 -0800
IronPort-SDR: aowKipDRUanESmbPVdK1rcSyLCsB9yDLGB3+7n3DWZhD99tP+svrIlMZTrkhzHMMeGuNJcOrF2
 HUAOgpYcwDnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="464750350"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2021 18:53:38 -0800
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com
Subject: [PATCH 07/10] Disable auto-coverge before entering COLO mode.
Date: Wed, 13 Jan 2021 10:46:32 +0800
Message-Id: <1610505995-144129-8-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.24; envelope-from=lei.rao@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

If we don't disable the feature of auto-converge for live migration
before entering COLO mode, it will continue to run with COLO running,
and eventually the system will hang due to the CPU throttle reaching
DEFAULT_MIGRATE_MAX_CPU_THROTTLE.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/migration.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 31417ce..6ab37e5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1673,6 +1673,20 @@ void migrate_set_block_enabled(bool value, Error **errp)
     qapi_free_MigrationCapabilityStatusList(cap);
 }
 
+static void colo_auto_converge_enabled(bool value, Error **errp)
+{
+    MigrationCapabilityStatusList *cap = NULL;
+
+    if (migrate_colo_enabled() && migrate_auto_converge()) {
+        QAPI_LIST_PREPEND(cap,
+                          migrate_cap_add(MIGRATION_CAPABILITY_AUTO_CONVERGE,
+                                          value));
+        qmp_migrate_set_capabilities(cap, errp);
+        qapi_free_MigrationCapabilityStatusList(cap);
+    }
+    cpu_throttle_stop();
+}
+
 static void migrate_set_block_incremental(MigrationState *s, bool value)
 {
     s->parameters.block_incremental = value;
@@ -3401,7 +3415,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
 static void migration_iteration_finish(MigrationState *s)
 {
     /* If we enabled cpu throttling for auto-converge, turn it off. */
-    cpu_throttle_stop();
+    colo_auto_converge_enabled(false, &error_abort);
 
     qemu_mutex_lock_iothread();
     switch (s->state) {
-- 
1.8.3.1


