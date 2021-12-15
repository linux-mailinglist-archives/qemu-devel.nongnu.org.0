Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ED0474F39
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:28:24 +0100 (CET)
Received: from localhost ([::1]:33564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI9f-000208-QW
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:28:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHr0-0000UN-HG; Tue, 14 Dec 2021 19:09:06 -0500
Received: from mail-bn8nam11on2068.outbound.protection.outlook.com
 ([40.107.236.68]:32481 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHqx-0005Jf-0B; Tue, 14 Dec 2021 19:09:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mb/QFpPe/Zqt2U1btGnQAqOLTCgf54W5TB/Nui3ZhETg5PDp98oJnAsTUqzUhroqbYZu6OdhVu6YPF1xDcCWx7T4mCwap3eGMwNJ+ZItkKnklch6+5CU2jRnAvMXO8TQybIQhVGh6AaquDo2YUnCKekXW28JsVIE0q0TaXxqhoV0qP5y6l+zEPZWY4RJNyuw7gTT2rD6chU1Kr8dbN6Xz4tKMN+4KNTHx2V5yEn75jcEXyiJBfhcbydtI9mEm16wro9V8H27IEo34Lm/XiiCziwlC5YZrFj+e+FvQ/LfY9V/wddFfkr6OQo1hLLzOlwCHMiuAyBYP0Vg+sggf4i/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7o5PoOj9k4Bu4+LVt0hJRob+/pynn9F2kPl20ynBAM=;
 b=KPe0uNTK8ba862pIqf2WzR/ZX6qkdrZEdIXo5Lbr5tuqJFfbXyXwwRvFPKdFxvMeEW7uScO5VG2kTCabggWBMHfkDYz+HkWhJS3745PGO6p0LzvxhaVkidCrKJZCcI20gMcP6CYmk66PZdVwkVgKc7nu1kY72X6DFJx/R5WfyuSl2keb8n1crhQatbq8Ycm33WnkLx45yup9cJnBlmSiB2lbN2o3e5bo43vFSIJ/RW8X1/yv42gKQriU9L+F0kHA9xyS9LObwiVmacJCvyjCDbM/JAAhXLVuPoqVzRFwVDMv3ZFlO+fv1GJq/vZZ28YPHbXnZ4zmhFXFFKM5ashfug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7o5PoOj9k4Bu4+LVt0hJRob+/pynn9F2kPl20ynBAM=;
 b=U9pcnIsJVncDFXhn68dBzJ2rHT5PZgnhsSOUwxR6AaxPsRiRbiJSEyqTFX03ff98gk1OFd/MhsIQHyzAhzUOiqyTRNhO1QOBz1GUU220M3R3+62pE93DVIcJis3iD8d3IRCjLd5SpCtet3RPwaOQ8CSTbyHBo735LARO5uePTIg=
Received: from MW3PR05CA0003.namprd05.prod.outlook.com (2603:10b6:303:2b::8)
 by MN2PR12MB3375.namprd12.prod.outlook.com (2603:10b6:208:cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 00:09:00 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::60) by MW3PR05CA0003.outlook.office365.com
 (2603:10b6:303:2b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.11 via Frontend
 Transport; Wed, 15 Dec 2021 00:09:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:08:59 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:08:58 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <zuban32s@gmail.com>,
 <jing2.liu@linux.intel.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 23/47] pci: fix PCI resource reserve capability on BE
Date: Tue, 14 Dec 2021 18:01:01 -0600
Message-ID: <20211215000125.378126-24-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a18854b8-7bbe-45cc-f464-08d9bf5f182b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3375:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB33759A2072E092F042D16D1C95769@MN2PR12MB3375.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WpJ7MufF/p2Elqzvtw6OKiteYbKnTRmTyCBCM1lCtlQZGYz6NzaCVumTzGPgqwHrZRE3rsch78bPicfz9T860VgikMMeLnC5+0z9DL8eSNiwFKVmBS1iR/EXDuOmL1fIQtDXufYacMHfU7J4J2kjenbJNR1CDp/U5h8RPI7HeSVhSOR640OIGhK6gFmH00tsXy88a9XvZwFX43MwsSFtapNBuH9zkYsRybDjWux5HEgsBbkit3/IH0P76yu+tBCTWonY66FCwWzJf2tFk22SPZPAcftgIDcLf69Z3S7+M/N8XF8YqHecQeVWfb6I+5TQkvkTpxAEgw6iGIkjBUFR+Y9PLdBMxQGRj8Br3RAAvEr0dCZOSiMpbjTIPOHZTKgfjhXkGvhG0R/1DyO6qNw8oqprhXNiNK7uaQMp0insdDZoYmLryCqOjRe5xtbDzTcaXlFEr/59vJ4TG4jN5hVe3fKhqTvCBWAPYNWlhQUG2v60ew9SJutJAGRDrztzbZsrDX6zZXkBCejzKFH/xwXZ9qJrmyxkNrGDbBikiAdU/jcOUD9QIw7EuN8dgb8zDelhEvxRHJB1lDic07b7F8CHU5n1iMTaThzLFPjV4tzzh/3AKR9zk8jRYPz0Xwprizh2rMskWsaBGQ38xrRoLH37kZPdAXBaMS1tzvFbM8JYy+k7O3fz+tfTo9y6ocrjWEjAc665HAy68/ChY8O/1yyDjXtsbgAfqmD6Ar/UUjctxNz6buCD6GCdW2Iyi9AUAB6UGO07Sf1A+9g22LeQrxoeAG2ijedC+lTk9eTcDnbZHec=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(426003)(70586007)(36756003)(81166007)(336012)(5660300002)(44832011)(70206006)(36860700001)(82310400004)(83380400001)(8936002)(508600001)(356005)(47076005)(2616005)(2906002)(1076003)(4326008)(8676002)(26005)(86362001)(16526019)(40460700001)(6666004)(6916009)(54906003)(186003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:08:59.6405 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a18854b8-7bbe-45cc-f464-08d9bf5f182b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3375
Received-SPF: softfail client-ip=40.107.236.68;
 envelope-from=Michael.Roth@amd.com;
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

From: "Michael S. Tsirkin" <mst@redhat.com>

PCI resource reserve capability should use LE format as all other PCI
things. If we don't then seabios won't boot:

=== PCI new allocation pass #1 ===
PCI: check devices
PCI: QEMU resource reserve cap: size 10000000000000 type io
PCI: secondary bus 1 size 10000000000000 type io
PCI: secondary bus 1 size 00200000 type mem
PCI: secondary bus 1 size 00200000 type prefmem
=== PCI new allocation pass #2 ===
PCI: out of I/O address space

This became more important since we started reserving IO by default,
previously no one noticed.

Fixes: e2a6290aab ("hw/pcie-root-port: Fix hotplug for PCI devices requiring IO")
Cc: marcel.apfelbaum@gmail.com
Fixes: 226263fb5c ("hw/pci: add QEMU-specific PCI capability to the Generic PCI Express Root Port")
Cc: zuban32s@gmail.com
Fixes: 6755e618d0 ("hw/pci: add PCI resource reserve capability to legacy PCI bridge")
Cc: jing2.liu@linux.intel.com
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
(cherry picked from commit 0e464f7d993113119f0fd17b890831440734ce15)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/pci/pci_bridge.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 3789c17edc..6a1e8e433c 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -448,11 +448,11 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
     PCIBridgeQemuCap cap = {
             .len = cap_len,
             .type = REDHAT_PCI_CAP_RESOURCE_RESERVE,
-            .bus_res = res_reserve.bus,
-            .io = res_reserve.io,
-            .mem = res_reserve.mem_non_pref,
-            .mem_pref_32 = res_reserve.mem_pref_32,
-            .mem_pref_64 = res_reserve.mem_pref_64
+            .bus_res = cpu_to_le32(res_reserve.bus),
+            .io = cpu_to_le64(res_reserve.io),
+            .mem = cpu_to_le32(res_reserve.mem_non_pref),
+            .mem_pref_32 = cpu_to_le32(res_reserve.mem_pref_32),
+            .mem_pref_64 = cpu_to_le64(res_reserve.mem_pref_64)
     };
 
     int offset = pci_add_capability(dev, PCI_CAP_ID_VNDR,
-- 
2.25.1


