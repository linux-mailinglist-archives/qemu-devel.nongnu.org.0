Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA9474EEF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:14:52 +0100 (CET)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxHwZ-0007DE-De
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:14:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHpK-0004uu-BX; Tue, 14 Dec 2021 19:07:22 -0500
Received: from mail-dm6nam12on2050.outbound.protection.outlook.com
 ([40.107.243.50]:13536 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHpH-0005CP-RC; Tue, 14 Dec 2021 19:07:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTOsq6eojN3Llj21r8BJeOJit0/aCCDcb1bgoqmmV4bW6zH3ZpuPowgdV85vMjlcAaXJ6jBIrBPoRPJKFdghMWT6MbsMWZabhdArlLGo0cw2odzXy5CWw9jZmhWwyEC7XpGbXMy7PIQFRwnHiNGlCkKJK/loUrJSJA9FVqbenZaiEjyjUSOOwCaK+SGUTKyiPMNtBZdz68AltX8NfRKXloUmcwr5Pmc8qrvmX5OZpltLSqMZywmi7s9UcWQHQiC1fZFKpbYI8vzQevzDiSHdpJ8Rh1XgS2pusjJEv8IOS8J2DEadXRyrGrZJtH6uCZ2sZOFkoBdkHv/8Zo4zG1boLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLySVQQSs0ReuB7GSwMIz/nwi/JUA+QR/iztisECgxQ=;
 b=lHTLnwEKicBjFxmi+wj5/1JWQPsZilMhQ42U8DHFpMB+Mf+e2rwvcMVoYBQBFWo5rg3AGHXCfjiTUBnFdbyYR5e2Jzt1QziISulthj9bOhNsgObaqyxQAfR1lH4T71+2uOzpYUoNcovRlT/lQLjLUxlQeFqnc+0ED8bXvKK88wte28o5eNLVeeyKPPeASeiSxDcBBUzPhlOiZvaUTOeb+8F1lWXQAMbXI9XY4IJYtCn2Kk8SspspjGNvQCvxwjdZUNJIDVkLenxvUBxhzPSKPFeqSz40p7O+uelSusbbx1r/nxAuqb6oeGItesOuvyG3oFMlrAjS2prI8qRWcaCf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLySVQQSs0ReuB7GSwMIz/nwi/JUA+QR/iztisECgxQ=;
 b=C7q2ub6pI6WfBNcILbDe35ut4EWvdwZrnsD7u0pdh1HiNDgeSTOQndcxbiRyYJ0ndnBnYxuBcgjn7S40crnBeFpw7ndD+QPXimI+OW6sEdmJdM8OQaJvoUuFOOLp1+SPhQc/Z+Vm7B+FdoQ8C2czWGNd2qmv0UghKf1FGHzssH8=
Received: from MWHPR2201CA0057.namprd22.prod.outlook.com
 (2603:10b6:301:16::31) by BY5PR12MB4902.namprd12.prod.outlook.com
 (2603:10b6:a03:1dd::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Wed, 15 Dec
 2021 00:07:15 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:16:cafe::28) by MWHPR2201CA0057.outlook.office365.com
 (2603:10b6:301:16::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14 via Frontend
 Transport; Wed, 15 Dec 2021 00:07:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:07:15 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:07:14 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Ani Sinha <ani@anisinha.ca>, Igor Mammedov
 <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH 19/47] bios-tables-test: allow changes in DSDT ACPI tables for
 q35
Date: Tue, 14 Dec 2021 18:00:57 -0600
Message-ID: <20211215000125.378126-20-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 71183a53-c57b-4369-095d-08d9bf5ed9de
X-MS-TrafficTypeDiagnostic: BY5PR12MB4902:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4902B8C658AF3FA11F34178795769@BY5PR12MB4902.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:336;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cl6FAZvCWYsGfBYXOx2lt6uXhcMNjXsjbmKsXHEI+jEOz1M4Hz/fuW5SR7ovk7gejCiOfCE0iL1HVhVUk4IRWNNhnlb6bjRl8OsUTi52d5+Lf9zR9Hox7bpRv8LtDoPjPGx4xl/toZKnOh9cNKCdZQGfCRK3m6ZWUyOTbkDZkqjf/DdbeKNKO3moWdHyTE1raCpmiUBbGUzb6jUdc8OwjcTscV45Pl7sDulRuxWJOcibMLY4ekuCLCHCRhxa09kEOmNcb6FPktcfMCWUFCnW2Est9onN6xkUQPxL5e+aWyWAnPckAFpJEFgK0c+VUVCwIaD06Ko6tu939G3EFNoqiala0TCgFUYSuJc480fizJKQRAydSw2Bow+je2Xrl++Pz3o2aQCK6pbH/sBdhT0jHbmaC9J4uFrDHKufzpnzurkQi1UFVOrWuZPpvSSsds2CWGUA3NDs6iiS6azY37NADA4WnIWi7mbSv+dqhuvp2mKkSF9Bz6MG2yIeESje6GSak/xfWCnc7r31cq1f1gydnlImG76Omre35MyyXONPHdqEcZ1QpxFV3Y5Ml2jlNFJAtCnynDRUcW5R9WMFxDJARQ4FoqNi85K27tqB6t+M3g1DFo/esrUQRjmjhRWsMFKwsnlJb/5EoloN8mnC4RUX4TfTFeZmAd+WlDSTVrYEuZPiXvrieS34Urqwa4pjmXXQ3Wq1eADM4TsyhiOD4Jm0nEm+3bqckSOboN0m6CPC8LogHxRZKmAwBt2WFrMPM89Dt9HIrroBBkX8qOOT9MpcKtNm/h/FMD9Aq9O9GB3lsMw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(2906002)(83380400001)(40460700001)(2616005)(44832011)(82310400004)(36860700001)(86362001)(70586007)(70206006)(36756003)(8676002)(316002)(426003)(6916009)(1076003)(336012)(8936002)(47076005)(5660300002)(4326008)(26005)(81166007)(6666004)(356005)(16526019)(508600001)(54906003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:07:15.1267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71183a53-c57b-4369-095d-08d9bf5ed9de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4902
Received-SPF: softfail client-ip=40.107.243.50;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

We are going to commit a change to fix IO address range allocated for acpi pci
hotplug in q35. This affects DSDT tables. This change allows DSDT table
modification so that unit tests are not broken.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210916132838.3469580-2-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 9f29e872d5b3973003701401cf659cfb71c95013)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..c06da38af3 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,13 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
-- 
2.25.1


