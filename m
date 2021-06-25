Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065523B3AC2
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 04:14:32 +0200 (CEST)
Received: from localhost ([::1]:58836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwbMV-0000MM-3N
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 22:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojinhua1@huawei.com>)
 id 1lwbLE-0007dY-Tu
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 22:13:12 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojinhua1@huawei.com>)
 id 1lwbLC-0007Bk-AU
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 22:13:12 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GB0nh2WlHzZmCT;
 Fri, 25 Jun 2021 10:10:00 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 25 Jun 2021 10:13:02 +0800
Received: from localhost.localdomain (10.246.240.24) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 25 Jun 2021 10:13:02 +0800
From: Jinhua Cao <caojinhua1@huawei.com>
To: <minyard@acm.org>
Subject: [PATCH] ipmi/sim: fix watchdog_expired data type error in IPMIBmcSim
 struct
Date: Fri, 25 Jun 2021 10:12:32 +0800
Message-ID: <20210625021232.73614-1-caojinhua1@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.246.240.24]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=caojinhua1@huawei.com; helo=szxga02-in.huawei.com
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
Cc: qemu-devel@nongnu.org, eric.fangyi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1) watchdog_expired is set bool which value could only be 0 or 1,
but watchdog_expired every bit mean different Timer Use.

2) Use the command  -ipmitool mc get watchdog-  to query
ipmi-watchdog status in guest.
...
[root@localhost ~]# ipmitool mc watchdog get
Watchdog Timer Use:     SMS/OS (0x44)
Watchdog Timer Is:      Started/Running
Watchdog Timer Actions: Hard Reset (0x01)
Pre-timeout interval:   0 seconds
Timer Expiration Flags: 0x00
Initial Countdown:      60 sec
Present Countdown:      57 sec
...
bool for watchdog_expired results -Timer Expiration Flags- always
be 0x00 or 0x01, but the -Timer Expiration Flags- indicts the Timer Use
after timeout. So change watchdog_expired data type from bool to uint8_t
to fix this problem.

Signed-off-by: Jinhua Cao <caojinhua1@huawei.com>
---
 hw/ipmi/ipmi_bmc_sim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ipmi/ipmi_bmc_sim.c b/hw/ipmi/ipmi_bmc_sim.c
index 55fb81fa5a..905e091094 100644
--- a/hw/ipmi/ipmi_bmc_sim.c
+++ b/hw/ipmi/ipmi_bmc_sim.c
@@ -189,7 +189,7 @@ struct IPMIBmcSim {
     uint8_t  watchdog_use;
     uint8_t  watchdog_action;
     uint8_t  watchdog_pretimeout; /* In seconds */
-    bool     watchdog_expired;
+    uint8_t  watchdog_expired;
     uint16_t watchdog_timeout; /* in 100's of milliseconds */
 
     bool     watchdog_running;
@@ -2110,7 +2110,7 @@ static const VMStateDescription vmstate_ipmi_sim = {
         VMSTATE_UINT8(watchdog_use, IPMIBmcSim),
         VMSTATE_UINT8(watchdog_action, IPMIBmcSim),
         VMSTATE_UINT8(watchdog_pretimeout, IPMIBmcSim),
-        VMSTATE_BOOL(watchdog_expired, IPMIBmcSim),
+        VMSTATE_UINT8(watchdog_expired, IPMIBmcSim),
         VMSTATE_UINT16(watchdog_timeout, IPMIBmcSim),
         VMSTATE_BOOL(watchdog_running, IPMIBmcSim),
         VMSTATE_BOOL(watchdog_preaction_ran, IPMIBmcSim),
-- 
2.27.0


