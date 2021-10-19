Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A643394B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:52:50 +0200 (CEST)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqTx-00053N-AU
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq3I-0006Ry-3m; Tue, 19 Oct 2021 10:25:16 -0400
Received: from mail-bn7nam10on2045.outbound.protection.outlook.com
 ([40.107.92.45]:16096 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq3G-0002i1-Cy; Tue, 19 Oct 2021 10:25:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIF/uBdDnWMnd2CFngNU2cEdXSCsXCTTMbnJtOYWCcVDZ3GoEcHkMhdjWedEtME04WikccvQ8FMDbg7mCc8EZUUcyba24Se8ldwYH6s/q43Fag8yIwo89oNROCI0U8Lu4+PeLMrlwvIbXYLiiF5W2gEF8AYTE9YeWpf4M4c7evvcaAvwobt+LcJp3JuUGzvDQPpMEbi1w5y34K4ssq4RKLnwkCRux9kiBEv1mb3mtyAxfINsGKKYLzzD/72MYqrBKcLu0icS73Dqf6E8XcBa4euwKr/ELB1582XbmPyPuE8Ik/22HWwQgadZ7zJPKZZmPT6+MWEGDWLwqYrCGQjioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIvv0UcLg8QtsSCobir40WPlv5hSQ0nTASRNdrpPyCI=;
 b=NgPTrylXAIlMA25pSNWTaG1M7K37pXpWUUgcgz1fOL0cpxHNCV0YTHULa7h303kpM96x16EqWcv9owjzKCexS4gnZCjsiw36fdV2SJZBu3C8eTcdk2e8dEJKq4ekr1EjWCnQjfAe+9XkqOaFAkbE9aGXG2Fp/bN8C50JtxoB+Fqy7/9gB8T5rlrYfEFZXldpwTMMy028BETj8Rwhl3W0pHaNTZ9NagFhRmGn+t4qmXWstX5aJTdaxCvxLT9r77IjJIsdH32SqaQVTJ+OoQX481slfG7LvzYppvCvGbbHggHAVvXHqWQb2FO6tAEoVLy0eZVM9XqZ5NCZMI6JG2p6kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIvv0UcLg8QtsSCobir40WPlv5hSQ0nTASRNdrpPyCI=;
 b=fZmqsFjE0htoxhDKOhXRK14BFf2WfXjpsQTE+G0cCcPIObkCADBdCsB+fZ3tAhOuLG/BylY0nc5D3RPhywT2nlGisx2fPnRnX1bSbJJA2tdsEYNiG4zLElH4OHNxqa5kqB9tHPzGkPTvkQwV0ookAe0FVoOKGxBB9TqBgXtPazo=
Received: from DM3PR08CA0024.namprd08.prod.outlook.com (2603:10b6:0:52::34) by
 BL0PR12MB4884.namprd12.prod.outlook.com (2603:10b6:208:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:25:10 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:52:cafe::e3) by DM3PR08CA0024.outlook.office365.com
 (2603:10b6:0:52::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:25:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:25:10 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:25:08 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Igor Mammedov <imammedo@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, John Sucaet <john.sucaet@ekinops.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH 36/64] tests: acpi: prepare for changing DSDT tables
Date: Tue, 19 Oct 2021 09:09:16 -0500
Message-ID: <20211019140944.152419-37-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44c51576-9723-4193-f97e-08d9930c41bb
X-MS-TrafficTypeDiagnostic: BL0PR12MB4884:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4884A1B80DBA2BB0B5B52CA295BD9@BL0PR12MB4884.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:85;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c3mGJ37hXKWRiTWoMevIUAtIgNKowW8k396XgyJyc8tuPYMG1qdDA6XgiHJ3HNk5m3Kvu8+pwAdEf16zRFp7668ZZG5avxQAJsJAVroLiY4Nlxckn0lOxuJ8jtPqJCqYKrO+T4J0DI7KNbl2AiYWOuRKemuHTgl1SceQs3aOHneGiX7hF9VI82AdxBgGFqyG8CWNxpWjsOudC0T3Of63GEGuSg4Tf5NarFGobVN77JkRguI+CBStKXsPd0PFiWoOufpDXNt9jxDqV9vMsg8yuDc8rgBbrvx9KjRUDq7ogTTpGsRjQNO5tX0GGiy8mxIZLvP1LtTqUn+wd430ZURr3zPluZLhQ4V1YXRtyO+UEldj7o4aw90xZlFKF22RZcy2O4DXBNOL6M14YiX7+xJdDpva77dXOLOmWlmHJob1gI2B/KMyr0ttyHP2wDMFwUp6x23FhRpsetPw79+1YMznIgH6MRP15i5PSRqF5xflI48sim4B3NbQH1OD9B3OM6GTt+BHN5sgG341VSYsrsFu49VsW1zbhsr0X+OEQjgjnI8QTBlfu9kz0NlvMw8aODTBNXzY76piAAztbtkmn8IbXSAl6H3+tjYW6DvPgQOGhLME/1QJ5ag0h7SmXHiSGdRFElUA9UQYkesCJAHYyYJqcSNRA/MttxJLPu6OrDNU02KhZLH1qzI3P/1K1j9m0sFELaPiBuf5oGQzm5PDL3dit9ZnMiMIDEIvAnNxDmf7fT4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36756003)(6916009)(26005)(508600001)(426003)(16526019)(5660300002)(81166007)(186003)(356005)(70206006)(6666004)(2616005)(70586007)(86362001)(8936002)(4326008)(44832011)(47076005)(8676002)(336012)(82310400003)(36860700001)(316002)(2906002)(83380400001)(1076003)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:25:10.0585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c51576-9723-4193-f97e-08d9930c41bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4884
Received-SPF: softfail client-ip=40.107.92.45;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210624204229.998824-2-imammedo@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Sucaet <john.sucaet@ekinops.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit a4344574fd47336b6d8fc85ce1f66d4262e7dafd)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..6c83a3ef76 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,11 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.hpbridge",
-- 
2.25.1


