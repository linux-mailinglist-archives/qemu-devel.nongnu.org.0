Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F068F474EFE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:18:01 +0100 (CET)
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxHzd-0002qv-2f
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:18:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHmj-0001gY-OY; Tue, 14 Dec 2021 19:04:41 -0500
Received: from mail-dm6nam12on2073.outbound.protection.outlook.com
 ([40.107.243.73]:33504 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHmh-0004lq-As; Tue, 14 Dec 2021 19:04:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xxn/LozB67Zsi09UrICoeJOayp0yGUfBBDenaZkHJviGzgLCrJS+LlIbH2FBNGnVb0L4yo2EYVaeqTioEiX4AUDgHtu0jsJAbZD+cmBcgPextB19xsGK3O7ZEaKcqJ+opp38qM85MDURkEf/V5Y+JsW9OSnJJeo9CQodT99ZSxsQ0rp4CC0i4TbjIY/+9WFbsE8NvZ6kkzFJzGga/AOxLbH/1QggbjtBUvKMkZUTviMkCiGdTNx3AUgbcS4oYem2enVdsiAWQai7GIpEbED5Mwl5vCLWOweAG7vVHkPl3Z8mUtK5OPNiNP2mo0qCXBbIDXHu2KRZdI8pF2bwEtUPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0Fdq9gaIvjbxByobVgBu/1V705dm/0Olz6VpF8lEAY=;
 b=ISCFUxfBCRxg76C6vxIiTg6wf7lPNiISJmnCvV4/h/WGOCEK7Xmh48fO1FR7K69/tunW7qaIbnOYZ4WIfKY6/0EAb8jDJuiaHdIMIDT1UXUz8n7XF85DnWPgQOAcMpxs3t+Dy72qsk/KUuYxRZ0BdqCgwPB8L0IAkP660YZ8toEk8dRyHJ9SdMnxR1VFVAO7Txea3SBc+q9aZ4f7l0ZeOfntSvcnqY3WV5DfQyN/aiom+AnfG3eskuS+Tv/IZ+PfsmWtzGp7ZZr2wCxchcLg359VTqcKC9FBQwEC4rrR7t8FgnLj8lriBMPOtrVss5sUQo5i1wbhzAj5zeY/2B3SnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0Fdq9gaIvjbxByobVgBu/1V705dm/0Olz6VpF8lEAY=;
 b=OXoiOtLBJpaYzjftx1vthlqzrxm8o2zCih1xPOO/OTL92SjkBoL0GSqfpMgFYJAOepTnHFiHge9wBvMIEYfiUG4YEioADr1leXWFyHbc6ew+u+OmtrJ/nDI+oL81bcZd9XqMxCzOkFAKZu96iBoloJW13N/6koyU3N4grrh2YCM=
Received: from MW4PR03CA0154.namprd03.prod.outlook.com (2603:10b6:303:8d::9)
 by MN2PR12MB4437.namprd12.prod.outlook.com (2603:10b6:208:26f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:04:32 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::2b) by MW4PR03CA0154.outlook.office365.com
 (2603:10b6:303:8d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:04:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:04:31 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:04:26 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Yang Zhong <yang.zhong@intel.com>, Eduardo
 Habkost <ehabkost@redhat.com>
Subject: [PATCH 11/47] i386/cpu: Remove AVX_VNNI feature from Cooperlake cpu
 model
Date: Tue, 14 Dec 2021 18:00:49 -0600
Message-ID: <20211215000125.378126-12-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ea218974-bad1-49e6-2211-08d9bf5e7856
X-MS-TrafficTypeDiagnostic: MN2PR12MB4437:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4437AED48650FD0D2EC73EDB95769@MN2PR12MB4437.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:348;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YW7OgbRVopnAsPRyWYokNhyX9s9hcDuXZJRvW+puhlF+267BsPXV52wJDLKBkuPJZwcoc+moBws+PvDQGrmggoDXE9nOotbJrDBDV4mX6jFeA1KKx5DdzOrX5o5ThnisUCCsEbNPeVj2lafhmbLTnQc4fO1DopfChcSiM9nPcvTLdORFi3qbvsPCchjlVcNdVMHDzZpdlvooLmTanKT584Pb3RXydlBaJeRtIfUDnKf+fl/uL4C/mOzt02BStikG6rYaJkqULbzwkPEzhAud+muSbDmJKN5HQLj2NaA6Ccsmp92eEjck1MarMec7d8+UQMEjRwUqwKJ7ZOh1011INAvoC7Oo9MchW3FRkXYQ/dEm6HipiIE0ClaSi9x1Z4B4HenIrujl7os3wxAl6YZb53w3mzdqLPq9mcAs0zLHbkPb6gGs09CJfCLquCY5uLU7R6/ObUMw6xINexk+duoptVN1QZzKCmZWcvyRc5hoB2zj7AGeahgByGXkOcQZIZDite9dPd+RJLagFJDIHdkLIvknz5J0NU4eZNQzpwYACviKw18ZDINpRESMi+AoxWZKYlfqnoeiT5AjL46bY7OfulVOgYrUxnesPWJr2mDkoIXNK9vWdX8sncBvX56BN3CZede2Coq/pxpddFaMy5dRo0Mi3F7MgJyZNw0BzsfPZy2qJNPWdCzddN1Jd4HiC9Qnti/rCgYB3QDXLo33vi1CNGgBAcbM9fsGl8vpwv/AtwMYtZnvdoGBnNi41RMabFIPJu6zJaD+oGmPX5n9hSeAKXxoOoOPBea+ctvcDvGKuKc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(16526019)(186003)(1076003)(2616005)(54906003)(81166007)(2906002)(86362001)(36756003)(47076005)(6666004)(336012)(6916009)(40460700001)(26005)(8936002)(8676002)(316002)(44832011)(5660300002)(83380400001)(4326008)(36860700001)(356005)(426003)(70206006)(508600001)(70586007)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:04:31.4815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea218974-bad1-49e6-2211-08d9bf5e7856
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4437
Received-SPF: softfail client-ip=40.107.243.73;
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

From: Yang Zhong <yang.zhong@intel.com>

The AVX_VNNI feature is not in Cooperlake platform, remove it
from cpu model.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210820054611.84303-1-yang.zhong@intel.com>
Fixes: c1826ea6a052 ("i386/cpu: Expose AVX_VNNI instruction to guest")
Cc: qemu-stable@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
(cherry picked from commit f429dbf8fc526a9cacf531176b28d0c65701475a)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 34a7ce865b..24ddc5b926 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3102,7 +3102,7 @@ static const X86CPUDefinition builtin_x86_defs[] = {
             MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY | MSR_ARCH_CAP_MDS_NO |
             MSR_ARCH_CAP_PSCHANGE_MC_NO | MSR_ARCH_CAP_TAA_NO,
         .features[FEAT_7_1_EAX] =
-            CPUID_7_1_EAX_AVX_VNNI | CPUID_7_1_EAX_AVX512_BF16,
+            CPUID_7_1_EAX_AVX512_BF16,
         /* XSAVES is added in version 2 */
         .features[FEAT_XSAVE] =
             CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
-- 
2.25.1


