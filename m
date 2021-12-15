Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDD1474F22
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:24:35 +0100 (CET)
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI5y-0000un-Aw
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:24:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHpg-0005W0-V0; Tue, 14 Dec 2021 19:07:46 -0500
Received: from mail-dm3nam07on2053.outbound.protection.outlook.com
 ([40.107.95.53]:47780 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHpc-0005EH-OU; Tue, 14 Dec 2021 19:07:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHkaAItrzVIMp/0fgEqJrkYSf3OLLh/rPxf1KGKdYl/MXnjLGJJzkWk1BsZVpHTX4NVgSVPwgN9OOdtVAGsh6qE2deDXPFKHpa/VHdNVvUx2A/tGJ/1mkiQDGVmJfpwQH25iaDrRYnRFaq0HVREtVjlyx51lPKGwdyeLD2Y/4eEtFChM1zfPQMnHnAtMxALrJ6N9YJ1aTNOaBE0Tp3h9P0AFEmUBMd9A3p0+sbB76mFHnBpvuEB31RRG7mSGt/q3wJtFfdpO2KGXKOetl02wRG7GINBambdMwvKF1pkD1pQPeaiQ3fF6wcOuE1OVAY7jseha7EN3PC7I76BkxzQ7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6tFHKPC2//piIXrCE2mb4M0D9Oj+ZTgEQ/S8nQvqQ8=;
 b=kDSqkzehGNy4GnU8PliQgTxJ0bpJSw+7wHopySfswN10AwvWvPCtefmkBqGfmBGOvmC+co/HbXQObmGzNa0nMAGfovzoE74h9i0nLq+38TiXJTtkvptDpg0A6rdhi/u2SYBTuZEuPFsum2CARFz/AhUIVt2TgBX38sP3rMUlB/ALalmbzGsqCvOexRYrdPYrhxhV0ugCBc1/uWVUOYRqzUt2KWgYQQKjCXZY8hDCJTPO/9WmsW6TkHdY4G1rZ5Dk9+bPZYHwJfRBi0skXKqk1c3M5G53ssVM+1qM3i3MNcCiK2lpTin95TOiSGMCEPj4a8bA1pkQYCflYwBwxQ47fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6tFHKPC2//piIXrCE2mb4M0D9Oj+ZTgEQ/S8nQvqQ8=;
 b=XJnEIhjsWJzGAvLqLcz4ckIRA7NHsqOm1QkGis1msvSdZ6VREQW+GlVRLPdMnYZ2cW7PiAqmi1u3fgbftc98leCRcazyv5whTw+O9YCOZ+ISwjES3XZ1ulRwwCRsq6jyMoZP2REp1HNXFM76W825U5awNILpJCEfUtcMK7IsHKw=
Received: from MWHPR15CA0031.namprd15.prod.outlook.com (2603:10b6:300:ad::17)
 by DM6PR12MB3418.namprd12.prod.outlook.com (2603:10b6:5:116::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:07:36 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::c2) by MWHPR15CA0031.outlook.office365.com
 (2603:10b6:300:ad::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Wed, 15 Dec 2021 00:07:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:07:36 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:07:35 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Ani Sinha <ani@anisinha.ca>, Igor Mammedov
 <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>
Subject: [PATCH 20/47] hw/i386/acpi: fix conflicting IO address range for acpi
 pci hotplug in q35
Date: Tue, 14 Dec 2021 18:00:58 -0600
Message-ID: <20211215000125.378126-21-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 94a2aee5-3d32-4459-4f86-08d9bf5ee65a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3418:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3418688BC9C851D2E65F4D7195769@DM6PR12MB3418.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Za1U/yHO53TBlBh6XGtUC/3dhLtnxeXFxik9c8/DHHOChMyigMao5iqBZ1ClgF9sEP7ky68+y10o25jJwbSVKPlzlrhWrhyUF+qW0d5u60m8TV62Vt5LYTYatPzeFIeS3Lnh4qUPZY3YvJqw2OUjbeka00IoFofymPfdveKDkliiTgeyUFTVzfPcj1c0eip/u8gyIP+sjWYvOhx74SkT+oDfdRFYcpQZI7xuLABO7e006n1/z9R/An5xxUr/W6z64VVSL3+lNH2SUDD3NGqZrVhuCzpcSZnQQXY0kovBY6vNPZcqXJj6KWL4fd7kV7beQHTrhKY6fIpkaQEEC61qbTjZm8pIYVwp203FMLC80L/iCdOMIP/5eb+DMzi+7T45PnZbq/LETS9Dj3JK7scW+jbKcrTu+HUrN0JidxtKPC8rnZ86+h7TZLmoV8wTZQ1L0/y3D6UMv/B/VeL+ZjHj+HA4+Dk4YtX2tbQNVwi+hA2s0Z4Sy3xu553ehVaCN9twrCMLvWgSFLwAjFY+dK1zqEYYeFxNI/NzUwz08aOxr1q8PrOf7aRvY5fEH9rl+2RiY6zwniCizpbS+nQpDjQkP+8Ga35ybPzG5BFyUdnI3rn2ir6hjssRssM5O3CgiLMMvexH08Zw+e1mRdzNetqWlTBl8nPs8mixj2YA2Mqr1aBvgQn+L/vwk28ubfut/rdoQkCdPVhRNARguImgZ1Z7w+V0U2uNvl+o3J1++Uz8HLHbX+4/kJYLmuhDR5zEXzfwzFuLK+yPruTfW5uLI4zawgISm1XL56AWkYep/GePJ1jJ6WEDR9o75lf540XzK26rMAIRumyS0O2TztA84s2fgyuu+w8sYPjhRlV+OAP+TQjCWeUrhD3yKwMKWbeVVzt+
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(356005)(186003)(16526019)(47076005)(6916009)(8676002)(81166007)(4326008)(8936002)(508600001)(36860700001)(6666004)(26005)(70206006)(82310400004)(1076003)(966005)(2906002)(5660300002)(36756003)(316002)(83380400001)(40460700001)(54906003)(426003)(2616005)(336012)(44832011)(70586007)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:07:36.0582 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a2aee5-3d32-4459-4f86-08d9bf5ee65a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3418
Received-SPF: softfail client-ip=40.107.95.53;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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

From: Ani Sinha <ani@anisinha.ca>

Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
starts at address 0x0cc4 and ends at 0x0cdb. At the time when the patch was
written but the final version of the patch was not yet pushed upstream, this
address range was free and did not conflict with any other IO address ranges.
However, with the following change, this address range was no
longer conflict free as in this change, the IO address range
(value of ACPI_PCIHP_SIZE) was incremented by four bytes:

b32bd763a1ca92 ("pci: introduce acpi-index property for PCI device")

This can be seen from the output of QMP command 'info mtree' :

0000000000000600-0000000000000603 (prio 0, i/o): acpi-evt
0000000000000604-0000000000000605 (prio 0, i/o): acpi-cnt
0000000000000608-000000000000060b (prio 0, i/o): acpi-tmr
0000000000000620-000000000000062f (prio 0, i/o): acpi-gpe0
0000000000000630-0000000000000637 (prio 0, i/o): acpi-smi
0000000000000cc4-0000000000000cdb (prio 0, i/o): acpi-pci-hotplug
0000000000000cd8-0000000000000ce3 (prio 0, i/o): acpi-cpu-hotplug

It shows that there is a region of conflict between IO regions of acpi
pci hotplug and acpi cpu hotplug.

Unfortunately, the change caf108bc58790 did not update the IO address range
appropriately before it was pushed upstream to accommodate the increased
length of the IO address space introduced in change b32bd763a1ca92.

Due to this bug, windows guests complain 'This device cannot find
enough free resources it can use' in the device manager panel for extended
IO buses. This issue also breaks the correct functioning of pci hotplug as the
following shows that the IO space for pci hotplug has been truncated:

(qemu) info mtree -f
FlatView #0
 AS "I/O", root: io
 Root memory region: io
  0000000000000cc4-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
  0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug

Therefore, in this fix, we adjust the IO address range for the acpi pci
hotplug so that it does not conflict with cpu hotplug and there is no
truncation of IO spaces. The starting IO address of PCI hotplug region
has been decremented by four bytes in order to accommodate four byte
increment in the IO address space introduced by change
b32bd763a1ca92 ("pci: introduce acpi-index property for PCI device")

After fixing, the following are the corrected IO ranges:

0000000000000600-0000000000000603 (prio 0, i/o): acpi-evt
0000000000000604-0000000000000605 (prio 0, i/o): acpi-cnt
0000000000000608-000000000000060b (prio 0, i/o): acpi-tmr
0000000000000620-000000000000062f (prio 0, i/o): acpi-gpe0
0000000000000630-0000000000000637 (prio 0, i/o): acpi-smi
0000000000000cc0-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
0000000000000cd8-0000000000000ce3 (prio 0, i/o): acpi-cpu-hotplug

This change has been tested using a Windows Server 2019 guest VM. Windows
no longer complains after this change.

Fixes: caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/561

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20210916132838.3469580-3-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 0e780da76a6fe283a20283856718bca3986c104f)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 include/hw/acpi/ich9.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index a329ce43ab..f04f1791bd 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -29,7 +29,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/tco.h"
 
-#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
+#define ACPI_PCIHP_ADDR_ICH9 0x0cc0
 
 typedef struct ICH9LPCPMRegs {
     /*
-- 
2.25.1


