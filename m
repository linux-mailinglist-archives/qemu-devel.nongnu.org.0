Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7C0433A06
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:16:46 +0200 (CEST)
Received: from localhost ([::1]:54276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqr7-00048f-9k
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq4o-0007vD-B9; Tue, 19 Oct 2021 10:26:50 -0400
Received: from mail-dm6nam12on2050.outbound.protection.outlook.com
 ([40.107.243.50]:44748 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq4m-0003oR-AA; Tue, 19 Oct 2021 10:26:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrMKETpuaHuwRE8u1TAuiAXVQYO0LMJWKQbL4ktlHg3NJkWVQ9UyWhfQcGxqWLjwHLeiS/AdzTJ3TXmbREQvKAHai3hkxBipGVDvK4ktWTZ8euP5dP6NxA+pAexGzAO+VC2cL01wD//QNvtrVXjrdH82NqH8EYenWFU9GEBXWG1zgq3m4Eqe8Azo+WxrSIggJMud359rUr4+hq7zTJlwRzeiKYAzMwJ+XscmQToOsNVlvwIbG5MiEydK1S9cAOhTQqNLyvfrbpccKcoFUuJQRARcEhQ22xd1UsPf4iVWxKDNUYmegYN3nwedc0GAgR7qzku3U+5Bdobspn0vR6rIUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmYSX/vXEq0cVlWcOAHycoQSqqyL7NN/0z+2b3k+tkw=;
 b=TetMGiy4AE6kdJGFTRzm6CAYsvv4uuR7fBHchT2C26Nc4jrHt77yF0G8+N1evwoVkFUgVIKLufVN1UMDoJvxKxlVKMXmTflUc1jhraHRsLJICLAXcwwqbzTslK0iTww5s3DOWmKN3cSGgCtbcRQ0B2IkQhvroch2U8ztG6U9M32GRKw8saxiaSuonifb1v9xsRzQ5VA7G6vzwGFiqLiowP6M4ybrvw/vLBpW60/u3VUMMYxaDWqaFIq3cQaVwX9GSIxN6RT40jNm50+NhYAEbIOO/2DFiwWuLcibcE9rH4NlnQHgHUvvyaLYoDfmzfMyWFsoJN3ztbu758kBqAj6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmYSX/vXEq0cVlWcOAHycoQSqqyL7NN/0z+2b3k+tkw=;
 b=MWhPk9u9z6rtR9AXJpU7+UDXI+DakFRWFuKPDFeTV05+UaIpuLwVXfAFSqiSavZRMcWBrwNsqf1TP978MD2rXnxbuJBFE5oHX8D79tL5EUlWSWtO17RlXKtF9lbCk4CRUkygSwhZms6WUaqH42F4qxd4qp1IC+8IFsrEH6rDf3Y=
Received: from DM6PR11CA0020.namprd11.prod.outlook.com (2603:10b6:5:190::33)
 by DM5PR1201MB2537.namprd12.prod.outlook.com (2603:10b6:3:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:26:44 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::8e) by DM6PR11CA0020.outlook.office365.com
 (2603:10b6:5:190::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:26:44 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:26:41 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>, Keith Busch
 <kbusch@kernel.org>
Subject: [PATCH 40/64] hw/nvme: fix missing check for PMR capability
Date: Tue, 19 Oct 2021 09:09:20 -0500
Message-ID: <20211019140944.152419-41-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 42da104b-16fb-404f-379f-08d9930c7a18
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2537:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB25371270D8995A3B7EB6098395BD9@DM5PR1201MB2537.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k5D+VmpBgs4dyTesdbEHiotN3HAfMbHZsI5SMGEepQbQw4qAo5bUJyNTpvoDwlCqmx8cxH5eCgls4JMybQpX16vDEAiezYZIWQtrY+L6mCIsPFl9Bmm0hSC+WOnl1i/9th/Q2SxE/ueuwT5rRUB8RZxXPKQZ19NN8Ihex/wSlCoalXNDL51+MEvIlOAvo34I1V1E6Vfyf8CLxXcZNjmAQ8x5tGwuHrfn96nNjILkFqEbl7dyEmFBtmBiLRYJfQ4L4NM0NZgPIPnK6KinV9m+ZKOrvc95Dlaqt2DwJF/qYDlBdyekmWl+KtnvNX7zSRjfWCxwBJjJ+bHUVocn0nO5RIWrHmMd0rGY+4VJ+QCqziycqQIIQA77dBBELTfl/+Kno/zlj5OLypjoqZmbQ9dMFQRDYun+YFYJr1ig8q+jTR+hWUFmzXe7WSvcV9sL1vtArjatd7yPd3jdL6MhNYnHQ3UKe5lRND5ox0TGSmPAZBXleerZ9A9nimTrBZtakwJN2gUC7ohlpwWLk109mv3sCilCOAiDaJ17kP+O394hd6aEbtp37556HuawSqFOiLMpALkIiAkHL9HPBNI2gkGkzYSYmJQSmOwXmRTWCZ7+30pOJA1T3v/Dq3X1XV8C2A/sMRRKrtUzB2TYAG80hQQn4LB1yQ1mBvCWCAVH+PMRhhF/DRxkB6xSJAYSs5WUfLTBtEfCA/oGM6uigbBKgMfj2FIwlCpXgaj25DKc4b1RZ5zaUr/CJWVR7e6Zxrp0rJ9kveMjjIUZkCfst4Wl28iaLyFSbgGp/YTvLJ7CQyrZUDByV4xRufARcu7A2K3L6l8O
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(70586007)(6916009)(70206006)(16526019)(36860700001)(5660300002)(44832011)(83380400001)(82310400003)(54906003)(6666004)(336012)(36756003)(356005)(426003)(4326008)(26005)(508600001)(2906002)(2616005)(8936002)(1076003)(86362001)(47076005)(966005)(8676002)(186003)(316002)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:26:44.6144 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42da104b-16fb-404f-379f-08d9930c7a18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2537
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

From: Klaus Jensen <k.jensen@samsung.com>

Qiang Liu reported that an access on an unknown address is triggered in
memory_region_set_enabled because a check on CAP.PMRS is missing for the
PMRCTL register write when no PMR is configured.

Cc: qemu-stable@nongnu.org
Fixes: 75c3c9de961d ("hw/block/nvme: disable PMR at boot up")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/362
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
(cherry picked from commit 2b02aabc9d02f9e95946cf639f546bb61f1721b7)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/block/nvme.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2c7ca587c5..8f4e1fc3ac 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -5589,6 +5589,10 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
                        "invalid write to PMRCAP register, ignored");
         return;
     case 0xe04: /* PMRCTL */
+        if (!NVME_CAP_PMRS(n->bar.cap)) {
+            return;
+        }
+
         n->bar.pmrctl = data;
         if (NVME_PMRCTL_EN(data)) {
             memory_region_set_enabled(&n->pmr.dev->mr, true);
-- 
2.25.1


