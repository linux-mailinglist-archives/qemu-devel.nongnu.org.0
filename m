Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC9363B903
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 05:15:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozs0g-0005ba-FO; Mon, 28 Nov 2022 23:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1ozs0e-0005bR-RP
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 23:14:16 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1ozs0c-0002g3-33
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 23:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669695254; x=1701231254;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6XDDwopnf19yAIItY3BxrGa0NLjXf93OnP7ntlK3Lrk=;
 b=YC+duQU77uUaRxNzW0DtCQPs0KfBZcKP2czes2oQSrUOVlIe0MQ/WNnY
 5t+1nLwqSf4tmo25x/uqCbLBKjT7fa4YRzR9oqxLZxJbhDR0BdgXWhbiC
 FelnCpu2VK3BNUPb4j1n6RPddicGHOB+v0/ezfS4lnF+dErVE9rc40WoE
 vE/bPpRrWFFUUl0J8Eh1t2m7oDtCET/GBptUs8CyDbZR3wINfPW+8gJd1
 f48kk1M4Uh2UdZkHUwbVn4BftRDeQwnJ1yU4c/NyhoHiGgDtWx5Bye7cI
 QYLIf5m6nYFIEVJ943OzwaWm5nnZs3eUfBB60hYIKcNzBc1ji/+lvzeq1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="298367426"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="298367426"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 20:14:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="676290655"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="676290655"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.143])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 20:14:05 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, peterx@redhat.com,
 zhengchuan@huawei.com, huangy81@chinatelecom.cn
Subject: [PATCH] migration/dirtyrate: Show sample pages only in page-sampling
 mode
Date: Tue, 29 Nov 2022 12:04:04 +0800
Message-Id: <20221129040404.4151126-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=zhenzhong.duan@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The value of "Sample Pages" is confusing in mode other than page-sampling.
See below:

(qemu) calc_dirty_rate -b 10 520
(qemu) info dirty_rate
Status: measuring
Start Time: 11646834 (ms)
Sample Pages: 520 (per GB)
Period: 10 (sec)
Mode: dirty-bitmap
Dirty rate: (not ready)

(qemu) info dirty_rate
Status: measured
Start Time: 11646834 (ms)
Sample Pages: 0 (per GB)
Period: 10 (sec)
Mode: dirty-bitmap
Dirty rate: 2 (MB/s)

While it's totally useless in dirty-ring and dirty-bitmap mode, fix to
show it only in page-sampling mode.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 migration/dirtyrate.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index d6f1e01a7001..5041c2558c62 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -720,8 +720,8 @@ void qmp_calc_dirty_rate(int64_t calc_time,
         mode =  DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
     }
 
-    if (has_sample_pages && mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
-        error_setg(errp, "either sample-pages or dirty-ring can be specified.");
+    if (has_sample_pages && mode != DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING) {
+        error_setg(errp, "sample-pages is used only in page-sampling mode");
         return;
     }
 
@@ -791,8 +791,10 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict)
                    DirtyRateStatus_str(info->status));
     monitor_printf(mon, "Start Time: %"PRIi64" (ms)\n",
                    info->start_time);
-    monitor_printf(mon, "Sample Pages: %"PRIu64" (per GB)\n",
-                   info->sample_pages);
+    if (info->mode == DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING) {
+        monitor_printf(mon, "Sample Pages: %"PRIu64" (per GB)\n",
+                       info->sample_pages);
+    }
     monitor_printf(mon, "Period: %"PRIi64" (sec)\n",
                    info->calc_time);
     monitor_printf(mon, "Mode: %s\n",
-- 
2.25.1


