Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E183AA94F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 05:00:07 +0200 (CEST)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltiGE-0006Co-7B
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 23:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAk-0003Yu-FA
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:26 -0400
Received: from mga02.intel.com ([134.134.136.20]:12080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAc-0000WF-4O
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:26 -0400
IronPort-SDR: snXQSQqCYLZBe/+boKdEPUW3n+AYBHxdjDEOASyhH+CsBcFUW4vAORZ/ctAUc8yT0sz3xk62m3
 PbXKZBkHyJsw==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="193414098"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="193414098"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 19:54:17 -0700
IronPort-SDR: U2XXZSvjLVnOy5UnOL/Nkyrw1MawMgJpgjS79vxS1sY3QKpnTuuYf6a6Y5wJOD6/mXjgHBubtf
 ABYGVhJFrJOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="485122000"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.157.59])
 by orsmga001.jf.intel.com with ESMTP; 16 Jun 2021 19:54:14 -0700
From: Lei Rao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH 6/7] Changed the last-mode to none of first start COLO
Date: Thu, 17 Jun 2021 10:47:14 +0800
Message-Id: <1623898035-18533-7-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623898035-18533-1-git-send-email-lei.rao@intel.com>
References: <1623898035-18533-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.20; envelope-from=lei.rao@intel.com;
 helo=mga02.intel.com
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
Cc: like.xu.linux@gmail.com, "Rao, Lei" <lei.rao@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

When we first stated the COLO, the last-mode is as follows:
{ "execute": "query-colo-status" }
{"return": {"last-mode": "primary", "mode": "primary", "reason": "none"}}

The last-mode is unreasonable. After the patch, will be changed to the
following:
{ "execute": "query-colo-status" }
{"return": {"last-mode": "none", "mode": "primary", "reason": "none"}}

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/colo.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index e2ab349..69a2501 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -206,7 +206,7 @@ void colo_do_failover(void)
         vm_stop_force_state(RUN_STATE_COLO);
     }
 
-    switch (get_colo_mode()) {
+    switch (last_colo_mode = get_colo_mode()) {
     case COLO_MODE_PRIMARY:
         primary_vm_do_failover();
         break;
@@ -531,8 +531,7 @@ static void colo_process_checkpoint(MigrationState *s)
     Error *local_err = NULL;
     int ret;
 
-    last_colo_mode = get_colo_mode();
-    if (last_colo_mode != COLO_MODE_PRIMARY) {
+    if (get_colo_mode() != COLO_MODE_PRIMARY) {
         error_report("COLO mode must be COLO_MODE_PRIMARY");
         return;
     }
@@ -830,8 +829,7 @@ void *colo_process_incoming_thread(void *opaque)
     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
                       MIGRATION_STATUS_COLO);
 
-    last_colo_mode = get_colo_mode();
-    if (last_colo_mode != COLO_MODE_SECONDARY) {
+    if (get_colo_mode() != COLO_MODE_SECONDARY) {
         error_report("COLO mode must be COLO_MODE_SECONDARY");
         return NULL;
     }
-- 
1.8.3.1


