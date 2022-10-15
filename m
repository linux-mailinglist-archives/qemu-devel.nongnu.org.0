Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605DF5FF891
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 07:15:58 +0200 (CEST)
Received: from localhost ([::1]:36560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojZWf-0000QC-4y
	for lists+qemu-devel@lfdr.de; Sat, 15 Oct 2022 01:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1ojZPh-0006Bm-TJ
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 01:08:45 -0400
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com
 ([40.107.236.41]:53164 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1ojZPe-0007VM-57
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 01:08:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvBHOM1Hpg9Nwm4DOTOn4Cl8GOiNRNzlr+kiJVFn44okbA6Rre/DmoF3MUIN5XHa23aGXfreW5KEHkWtWD/9Wxui43n6tqmFpDKgMlRSL8PRJxI3IzCs4XN42wfuEoTEkXn6AdPg8jgKqnLMD26AOJgekHz5KlQhgfVNA79kXAdv0b1FepLB+5wSAge8LQtclMxASDn2gjiNJQXZb0cmZIj7RnZMRmLem9yDDn4O9d7RTnvv8re6bTDmHgtf1byzX6GpD+E2BvbageAthz/5Ny6XLVnAGCN7fDct0kTqhj46FyQ4fxjw0DKUz5AhPHj7NswAYJVKRjZBJ7s7jzPslg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhw1D9fisV1HIckd/2LLnvLHG5KTlFvgBHEiq7MpJv0=;
 b=OYLDfwhjLswkQQCAt4pS8ZtynCdOL/HqbsPgYC8ArmQDQgoFxZLTomHg+VeWGSLaMX9pym/04/Pi8BH+l1KRmGoNxYyAAT/djf7yjnL0+hrz290Jqu6whRjR/CnO7weE7f6+AM6n0+y3B5QNkN1XaULprc31985jNHty0ojYHpHNA1vHF9dpclzOzOWGbYD1fQfkpfMwKl4kr11XDUm2ZvNLzn2f+CchgD1ETSqhk99P8ABeuWn/OEuhes2l/lUZeqIMoLgGA8RfQsf42kEIoU6gErit+xyGtNqJApyp3ZcViQzw5gNXAGIXXpWATBsqk+tvQ4PCGkuCghJPcfTZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhw1D9fisV1HIckd/2LLnvLHG5KTlFvgBHEiq7MpJv0=;
 b=dnhLWQXQzsgHZFxAMZ8PAgB9NKRGc87eHTXUkGM7aJxIIhMmx+7/LqklZWlZ4XEvIEQDAQE/YFUsUq72i0Ti1WxHXtxgRIcnnfS8wDLMmGrw4KmHsyisVtpPAtOWwdd5GtVpJh6hTug/KDPpEmi0pMJVhewdoW0hRxzexobp5ak=
Received: from DS7PR07CA0024.namprd07.prod.outlook.com (2603:10b6:5:3af::6) by
 IA0PR12MB7532.namprd12.prod.outlook.com (2603:10b6:208:43e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Sat, 15 Oct 2022 05:08:39 +0000
Received: from CY4PEPF0000B8EB.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::35) by DS7PR07CA0024.outlook.office365.com
 (2603:10b6:5:3af::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Sat, 15 Oct 2022 05:08:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EB.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.13 via Frontend Transport; Sat, 15 Oct 2022 05:08:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:36 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 15 Oct 2022 00:08:36 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <vikram.garhwal@amd.com>, <stefano.stabellini@amd.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, "open list:X86 Xen CPUs"
 <xen-devel@lists.xenproject.org>
Subject: [PATCH v1 09/12] accel/xen/xen-all: export xenstore_record_dm_state
Date: Fri, 14 Oct 2022 22:07:47 -0700
Message-ID: <20221015050750.4185-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221015050750.4185-1-vikram.garhwal@amd.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EB:EE_|IA0PR12MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 03fd6ca3-7f9f-4040-b8f7-08daae6b5267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p7HnUH894kyYgOxvDCAEeDMoEwQradaoF6HaQmVcEaIM36zSAc66850n0R/+obhERSQT15bX0N3FrY5iGEVUNADSYhNDEI8fvu916U+YAodDJt5BWgS40NQbSYasPZ0KwqrzPb3PE6Kj8u8BaLtAyJUFdBue/jGk2fLn7h6GJuVh8SW7oI/BE0r3URpr8lrSYeBbKH1ZF7ejO9UJmAyPh6NlhW3yOYKzh30+AVXHmLWrWbDLPSJjE7zPO3y2j5yUYHN3cXIu/KiDGu42LFxB4+CUaTW8B9Xg8LmVsvOS7bDjWsgLMh524OU0ba7XJ4PsXGBYRoQyRoiYFS6s/VjNgLfrMJ8uYX7/GfYDLE60Gson+FMFxZqAQceOp5VXEHxfMucMW7R0y94QjN9rNUHhiNtSvD21sE+MeMbLfXka2kp7VlKsFpt5f3PGY7pNADQ2A1w/pnHrI8FgmD3lAXE/IIXKNZkx+JG53Cvs0mwsX/kjArSfr+lUIJ9tMYnxvoeldxpizPP2dNzV0s2NEcz+36r75CcadDr/+PUz13n1OU/mvqWulbGNqAtDxo+v294fugtMEz/A+lt4sm1zC5mhy92hn6+wQgseJUXC3uaLJIs4Q6MuZgK4gGgS39g07112QWeDjr+A0nzP2IWt3htN0ztxiRmLVrlfsDMFRvYVV9LxEuSn5rhytbDhgxQKRX1rt/avny38i8kGQ88TPKZ3FYrWIrdbQPJ/8tiOoYO25CKKAdn70DGAMpa5zH5D18N8eA6umhGELQXP8tsNH5VB8wLGC/29zCuOD2t17AgpbY3UuKZm5rqWlkyd3dRylbEv
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(478600001)(54906003)(316002)(6916009)(4326008)(40480700001)(70206006)(8676002)(6666004)(41300700001)(70586007)(26005)(82310400005)(36756003)(8936002)(5660300002)(44832011)(86362001)(83380400001)(1076003)(81166007)(186003)(336012)(82740400003)(426003)(47076005)(2906002)(40460700003)(356005)(2616005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 05:08:39.1890 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fd6ca3-7f9f-4040-b8f7-08daae6b5267
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7532
Received-SPF: softfail client-ip=40.107.236.41;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

xenstore_record_dm_state() will also be used in aarch64 xenpv machine.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 accel/xen/xen-all.c  | 2 +-
 include/hw/xen/xen.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b..276625b78b 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -100,7 +100,7 @@ void xenstore_store_pv_console_info(int i, Chardev *chr)
 }
 
 
-static void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
+void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
 {
     char path[50];
 
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index afdf9c436a..31e9538a5c 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -9,6 +9,7 @@
  */
 
 #include "exec/cpu-common.h"
+#include <xenstore.h>
 
 /* xen-machine.c */
 enum xen_mode {
@@ -31,5 +32,6 @@ qemu_irq *xen_interrupt_controller_init(void);
 void xenstore_store_pv_console_info(int i, Chardev *chr);
 
 void xen_register_framebuffer(struct MemoryRegion *mr);
+void xenstore_record_dm_state(struct xs_handle *xs, const char *state);
 
 #endif /* QEMU_HW_XEN_H */
-- 
2.17.0


