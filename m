Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE141EE0A3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 11:08:44 +0200 (CEST)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jglrf-0003M0-9Z
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 05:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1jglpW-00080G-Qp
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 05:06:30 -0400
Received: from mga06.intel.com ([134.134.136.31]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1jglpV-0005Cl-UN
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 05:06:30 -0400
IronPort-SDR: J1nMRiRB9BMEaKWspbOx5lWjUyroKOwKggWACEiVpEPVYxcJP00KSJxSmHjPfb396qyCi43PuK
 jyzW+w5noc2w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 02:06:29 -0700
IronPort-SDR: sTkRehHITrl0g2a3elyuho8qVI8b7JFu4xzFe382rT/RsKA20uLHGQ2njyS89DEjBDLHQLOM8U
 UC15iSNvQgWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,471,1583222400"; d="scan'208";a="416847120"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga004.jf.intel.com with ESMTP; 04 Jun 2020 02:06:27 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH V2 2/2] migration/colo: Update checkpoint time lately
Date: Thu,  4 Jun 2020 16:55:33 +0800
Message-Id: <20200604085533.7769-3-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604085533.7769-1-chen.zhang@intel.com>
References: <20200604085533.7769-1-chen.zhang@intel.com>
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 05:06:26
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=2.999,
 FROM_WSP_TRAIL=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Zhang Chen <chen.zhang@intel.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Previous operation(like vm_start and replication_start_all) will consume
extra time for first forced synchronization, so reduce it in this patch.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 migration/colo.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 91c76789fa..2b837e1255 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -532,7 +532,6 @@ static void colo_process_checkpoint(MigrationState *s)
 {
     QIOChannelBuffer *bioc;
     QEMUFile *fb = NULL;
-    int64_t current_time = qemu_clock_get_ms(QEMU_CLOCK_HOST);
     Error *local_err = NULL;
     int ret;
 
@@ -581,8 +580,8 @@ static void colo_process_checkpoint(MigrationState *s)
     qemu_mutex_unlock_iothread();
     trace_colo_vm_state_change("stop", "run");
 
-    timer_mod(s->colo_delay_timer,
-            current_time + s->parameters.x_checkpoint_delay);
+    timer_mod(s->colo_delay_timer, qemu_clock_get_ms(QEMU_CLOCK_HOST) +
+              s->parameters.x_checkpoint_delay);
 
     while (s->state == MIGRATION_STATUS_COLO) {
         if (failover_get_state() != FAILOVER_STATUS_NONE) {
-- 
2.17.1


