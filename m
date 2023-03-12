Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F826B640A
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 10:26:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbHwI-0007Zh-9J; Sun, 12 Mar 2023 05:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ray.Huang@amd.com>) id 1pbHwH-0007Tt-2b
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:24:25 -0400
Received: from mail-dm6nam10on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::600]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ray.Huang@amd.com>) id 1pbHwE-0004UE-5J
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:24:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpCK4QZR8BUVAKhNjdtiVI1vOvGG/MBRmaQkRo1mhK9+ApxTaPBel2dfSIkFfoWibyS2C7eqzOm9bkufSJlSNnY2CRe5yKm81jhmBSbqg86UtGmWY6ql3elPeMcVQPybQVNaxwrLIwmLcflRK31ZYdNAXp07J7GJiWP9yvooEmct7BoDgZv7ZK8WRUUuEWWG+Ekz8JFxmrPL/o8pd0mPMf7T3rWjiVcGwABsRPQni59ObL2zjy2K3uLAfSEpZfwg/9w4vDaHaYGxhne3vs6iiaso+YfhKtLjLYc/3KDcobiqlnQFiKGV4bo/pBrd6teCYZaUN+XbpcqpHemV+WT8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DM/8IpnD/ZNvlY8RIxBbeNf02AvGOLs2x0AAUDwHNyU=;
 b=lYriz7Dh1DTyk4BDsQDNdzRokt236M3HFVC9OPcevhNKN7cxYPK224CQraBMI0dC43CKozBZavYFsf/3QMikgCDK/GZto0GZNVpO9pYL6QqtBJqbBx9BAPnbINEyt+injQztKkVOIQSArvG2Fxyo72YAA1OnByciloJccoLoEoA2+rf724RYUx1Ch+wBo+2k4AZovCH4dkJBBvcIl0Wro6eMSA88dHTygEIo4LPztlByJNzXabTefBQsnVlTeA41jzI7SL5FDlFRmOBUmv9ELhG0Dze+TRL9OL8pU0c4EyWvI9kVmw/qZZTKZRxgwZfo9/Uz302jJ+rW3aay+XpNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DM/8IpnD/ZNvlY8RIxBbeNf02AvGOLs2x0AAUDwHNyU=;
 b=ZH0nmDDzhoq81BmCmn5ztaQINGVKVMkptnE4Lo+Ez1HaMkbFjNN3mtqeTtxVOTLv3N96fOlaut+vjftcVcFmrenQULK66SWF7BiJm1OZM8xWYd6/7ZLTMxaqB7KonYRkAbyp8YIZmxjbjbwTxdjqEXT5aFpF5ZhFMLMuEu37idU=
Received: from MW4PR03CA0064.namprd03.prod.outlook.com (2603:10b6:303:b6::9)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23; Sun, 12 Mar
 2023 09:24:15 +0000
Received: from CO1NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::ed) by MW4PR03CA0064.outlook.office365.com
 (2603:10b6:303:b6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:24:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT100.mail.protection.outlook.com (10.13.175.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 09:24:14 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:24:10 -0500
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Antonio Caggiano
 <antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
 <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
 <burzalodowa@gmail.com>, Honglei Huang <honglei1.huang@amd.com>, Julia Zhang
 <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
 <ray.huang@amd.com>
Subject: [RFC QEMU PATCH 13/18] hw/i386/xen/xen-hvm: Introduce
 xen_ram_block_check function
Date: Sun, 12 Mar 2023 17:22:39 +0800
Message-ID: <20230312092244.451465-14-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312092244.451465-1-ray.huang@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT100:EE_|MW4PR12MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: b4174633-9b0b-400c-840f-08db22db8c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T/U6F+Jvuw0soAImF7HBXYbLxcsiN/gzf3Vt67kfu626AyTRUGEKvHcC3ioGN5ci3J3hqJA3dDQLFC/nHQxhgYYVvnjuastS7Q5shOAShika35rkhq9KviXquCuYFGJ2iJsQL/rYjUQ+YbYvJqV1HkCVWIMnTHJjPxeHhGQs+ixJt8bZx2PTTwvI8vaRtdhFp1vG7X0tQaL4LOnNI7qBe0zFX1Ir+RNvVoAr9i0VK2L4jtwZZXMuZ8FblUx58Kl68pQcTFcv7A77YYDs9r7utgGo31dKAK8H3TQNOdqMyaw8orD5+HDQSmZwMwrOKcDzcA7RvUJFXqMQ+X5IP7s3CrF13XRQLqmgjyGCQAsCrNTbYodylkhd6CZNlDOVQCo29xZCKtbUxgz0xQ5yUR+55jFDTs1vT6kvu+JwIa8RVmWv2A/ZbFHAh7SOkP+6ewd7FYZ3ae+1SRpL8SLx+p2iq8sxeJn0L+gvRGmx+YjgPQmDttSq2sbk+jJeTqMVEDjbdUeC31b/xkXzi7xcu5IU/pBQ+dpddvjZQppqpxkYvIo1WJVsRYHn2rZPIAo0vq+V2mvmeUk6gGAsBM225alrJgQASvsDUyI7bRNiXIA6IZEIQP7Lz1AlsdproZ9T0yeMEyKRiQr8Y/Ef3vn7XZPl0SHkbmNRRUP9hhXqekuqC77ukGwh4oSstlNO5CziHPo7eFw6UxkozSGCHnRozCQDa1v4fVNW8dIAueSGkH44YllKdO+EdacEWXkAH+EUeLJ3
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199018)(46966006)(36840700001)(40470700004)(86362001)(5660300002)(8936002)(70206006)(4326008)(70586007)(8676002)(2906002)(7416002)(36860700001)(81166007)(921005)(356005)(36756003)(82740400003)(41300700001)(1076003)(26005)(6666004)(7696005)(478600001)(54906003)(316002)(110136005)(40480700001)(82310400005)(83380400001)(426003)(47076005)(40460700003)(336012)(2616005)(16526019)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:24:14.8133 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4174633-9b0b-400c-840f-08db22db8c44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119
Received-SPF: softfail client-ip=2a01:111:f400:7e88::600;
 envelope-from=Ray.Huang@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Introduce xen_ram_block_check function to check whether current ramblock
is xen ram memory.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 hw/i386/xen/xen-hvm.c | 15 +++++++++++++++
 include/hw/xen/xen.h  |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index e4293d6d66..a4f12aefce 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -32,6 +32,7 @@
 #include "sysemu/xen.h"
 #include "sysemu/xen-mapcache.h"
 #include "trace.h"
+#include "include/exec/ramblock.h"
 
 #include <xen/hvm/ioreq.h>
 #include <xen/hvm/e820.h>
@@ -1564,6 +1565,20 @@ void xen_register_framebuffer(MemoryRegion *mr)
     framebuffer = mr;
 }
 
+bool xen_ram_block_check(RAMBlock *rb)
+{
+	bool ret;
+
+	if (!rb)
+		return false;
+
+	ret = (rb == ram_memory.ram_block);
+	if (ret)
+		rb->offset = 0;
+
+	return ret;
+}
+
 void xen_shutdown_fatal_error(const char *fmt, ...)
 {
     va_list ap;
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index afdf9c436a..99a383eb17 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -31,5 +31,6 @@ qemu_irq *xen_interrupt_controller_init(void);
 void xenstore_store_pv_console_info(int i, Chardev *chr);
 
 void xen_register_framebuffer(struct MemoryRegion *mr);
+bool xen_ram_block_check(RAMBlock *rb);
 
 #endif /* QEMU_HW_XEN_H */
-- 
2.25.1


