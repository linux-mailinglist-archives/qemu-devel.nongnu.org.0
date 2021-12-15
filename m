Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1445E474F0B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:23:18 +0100 (CET)
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI4j-0005zD-5z
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:23:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHvP-0006vT-82; Tue, 14 Dec 2021 19:13:39 -0500
Received: from mail-bn7nam10on2051.outbound.protection.outlook.com
 ([40.107.92.51]:42272 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHvL-0005p0-GC; Tue, 14 Dec 2021 19:13:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnoTviIgGi4W04VeywBqlvBGT7ag5JURP9T4UGhq3SGnIl1oOmfxXk6a5ia6BXtwGT9tVEbH1hf2ztOd7P37u9Oy674cP9kn57QMxWXyRON0NUbIZoHlrAuibvAFKMzb1Cdrfy3XY9LiyYygE5EVHLZhpxFpUoMtzSWbaKtg0bOnrKmT6SOcY3eSUx1XFmJx8+qoXuaaLEDEoEoL/7IK+tcq+QihqIt2Wj820UG8pc7K8ntRIk5uy4pcdAwAj7nWuYA32KA/tkrgLMxQiKG3Wyhhw7N0yFf1UnvaUq3KlwsMEIvmrYwOHFwOLZBrd4Z07LDDYOy2TvPejatbIjkUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alZ/gXq5UFzojMHyvYcTFTm06U2HspNU3QrjMGhP61c=;
 b=HcpXN76YMr74awTqIWvvYxtxQNnQ551ifM40SOcLoCH9Jir16Mjhj4ebtD6pblcjrBviYHtEieDSyNPyNUdsv6M92S7O/ai39IrD2xSZLChIbrqE3/bSFDe9i2lrS7v0wuKKT3I/6uP1VmelvrPJ+RbwbYskudsMvDATK8P+UltCQ0/7FoyEdazcQLf64pIMm+3WP7Iv4VOjJR51xYEbwJuPrxacQYNHNKa+fSxDAzTIsVLouRkGgiPsVi40ITpbQhtfpeKXcmgPxFQ4EWVagDPQKNixrcBnh9tCvkuz2BEdSRxsUP1cAuBjRSNeGK5iivT+KkrZIILdAInxXdzTxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alZ/gXq5UFzojMHyvYcTFTm06U2HspNU3QrjMGhP61c=;
 b=pH9otzvR4DcWX8MRzWTMIrbREioVIecDI/JA4hMzM867M94B1AXkJ8lAYMYOAGbHDxww35O7yUHiD1ctO1qmVxDW5RRR+snHZsUmdxIHNzNDawMIbE4TTa7efOdFHqj7GGwYNvk/9K67e/OecttJD7hjl1y5X/6RXaoKj5DRNrE=
Received: from DM5PR18CA0081.namprd18.prod.outlook.com (2603:10b6:3:3::19) by
 BN9PR12MB5383.namprd12.prod.outlook.com (2603:10b6:408:104::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Wed, 15 Dec 2021 00:13:31 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::f6) by DM5PR18CA0081.outlook.office365.com
 (2603:10b6:3:3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Wed, 15 Dec 2021 00:13:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:13:31 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:13:30 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Igor Mammedov <imammedo@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH 35/47] pcie: rename 'native-hotplug' to 'x-native-hotplug'
Date: Tue, 14 Dec 2021 18:01:13 -0600
Message-ID: <20211215000125.378126-36-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6eaade8b-fd7c-47a3-1956-08d9bf5fb9e5
X-MS-TrafficTypeDiagnostic: BN9PR12MB5383:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB538353BB54B365721E7BFC9B95769@BN9PR12MB5383.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o+PV+/gripWbAhRjJ/tR9LxYxJ3MEjOjKE8VtxvBOtt4c1kCRhMDBtLpDcQQZImw3sc/5GIAMA7AjErqUUddHOR59tLOHWYrBBM4uKRtuO2pR1m4wiwY6+kDOYgjV3jY/L/ERQKvaw/QD48FrDhv5M+woLc8hnb/rEKfkY1TPUB8EZnjMpdmXEhxoKt0dMbHEjDeJWPTVaPCzBcZLoegwpNAi2/W6gb9u/C2kMMisbWh4hi7/1d25OJb/ydShtJOU/bjMh0+Fqq+AP93O19uVRzhutNMHSFXCvk6dBfDzg00tsvL10OkKDiBZVRe7cPoAZqy1xkaWrvqeqZpYf7KwqRsq36eHKjcluLuK94jiR+5l2/oFykj/NFan8ONiVdoWrdmGgI6ccNMjoBXzpTSAz7bPqE6tOK715EzVZsyxfo/vHG7GDk2QbThV8qcJNNUnbuTgAe9+NafswIa5UMDnBzJx/huItDfUJqYkxv2fsh8rzdMt8xvzTOnJ4wu+Go2YxccalXEO+dT0IDEZlAbvKkZEfxQQr2u12cUshZkPcXF5ptw2L8flzsRXWLFTvYg2kgD5+m4E9ve6+hnBqtzAU2nQ0BwHFyt/XW6epcRbTR8EOKYxVe2D1fq0dtYXEy9hJbtiGwuw2DyGPxynqPja8vLCraSbbld/n5VfCSiSI2rDwdlkfHVMOyDy/32uW2UxyJReHCijWvN9kCAn9n89eOs24l5DUGCLwdtSpzCzMn2vRWt/WkoAjkTRlVoGXQsQBHa3yYnM734y9UOOWKnCT6QFLrHjXknP5i7iQn7FoQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(70206006)(356005)(40460700001)(36860700001)(81166007)(83380400001)(26005)(44832011)(70586007)(82310400004)(4326008)(86362001)(5660300002)(426003)(336012)(186003)(508600001)(2616005)(47076005)(6916009)(6666004)(2906002)(36756003)(1076003)(316002)(8676002)(8936002)(16526019)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:13:31.0295 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eaade8b-fd7c-47a3-1956-08d9bf5fb9e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5383
Received-SPF: softfail client-ip=40.107.92.51;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

From: Igor Mammedov <imammedo@redhat.com>

Mark property as experimental/internal adding 'x-' prefix.

Property was introduced in 6.1 and it should have provided
ability to turn on native PCIE hotplug on port even when
ACPI PCI hotplug is in use is user explicitly sets property
on CLI. However that never worked since slot is wired to
ACPI hotplug controller.
Another non-intended usecase: disable native hotplug on slot
when APCI based hotplug is disabled, which works but slot has
'hotplug' property for this taks.

It should be relatively safe to rename it to experimental
as no users should exist for it and given that the property
is broken we don't really want to leave it around for much
longer lest users start using it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20211112110857.3116853-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 2aa1842d6d79dcd1b84c58eeb44591a99a9e56df)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/i386/pc_q35.c   | 2 +-
 hw/pci/pcie_port.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 04b4a4788d..9070544a90 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -243,7 +243,7 @@ static void pc_q35_init(MachineState *machine)
                                           NULL);
 
     if (acpi_pcihp) {
-        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
+        object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
                                    "false", true);
     }
 
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index da850e8dde..e95c1e5519 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -148,7 +148,7 @@ static Property pcie_slot_props[] = {
     DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
     DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
     DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
-    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
+    DEFINE_PROP_BOOL("x-native-hotplug", PCIESlot, native_hotplug, true),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.25.1


