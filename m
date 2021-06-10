Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED803A0EE7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 10:49:23 +0200 (CEST)
Received: from localhost ([::1]:41616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqttq-0006CI-2V
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 04:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1lqtt3-0005WC-P0
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 04:48:33 -0400
Received: from mga18.intel.com ([134.134.136.126]:23821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1lqtt1-0006at-MB
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 04:48:33 -0400
IronPort-SDR: xE+F7NQjbAP3UXO49ySWVqYbarwddCbIEVAuBXSg6zRyZjrSiThA2v4gAsC8rK0PRsPPPdNij6
 Mu7exlN7b7UA==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="192349666"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="192349666"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 01:48:19 -0700
IronPort-SDR: 9rfGS66y8OXsfJPSujo4UWtec/xsoQkgeZV72zpd2TzlP2+hDufIZyLOeXncIyCnWkEz0nBJMt
 q6vtO55QafEA==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="482302712"
Received: from duan-client-optiplex-7080.bj.intel.com ([10.238.156.114])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 01:48:17 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vl: Fix an assert failure in error path
Date: Thu, 10 Jun 2021 16:47:41 +0800
Message-Id: <20210610084741.456260-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=zhenzhong.duan@intel.com; helo=mga18.intel.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_12_24=3.199,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, Zhenzhong Duan <zhenzhong.duan@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based on the description of error_setg(), the local variable err in
qemu_maybe_daemonize() should be initialized to NULL.

Without fix, the uninitialized *errp triggers assert failure which
doesn't show much valuable information.

Before the fix:
qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.

After fix:
qemu-system-x86_64: cannot create PID file: Cannot open pid file: Permission denied

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 326c1e9080..feb4d201f3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2522,7 +2522,7 @@ static void qemu_process_help_options(void)
 
 static void qemu_maybe_daemonize(const char *pid_file)
 {
-    Error *err;
+    Error *err = NULL;
 
     os_daemonize();
     rcu_disable_atfork();
-- 
2.25.1


