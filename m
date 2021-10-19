Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE19433B55
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:54:49 +0200 (CEST)
Received: from localhost ([::1]:34812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrRw-0000lt-K2
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqDe-0004QL-5q; Tue, 19 Oct 2021 10:35:58 -0400
Received: from mail-co1nam11on2050.outbound.protection.outlook.com
 ([40.107.220.50]:52320 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqDY-0007aQ-60; Tue, 19 Oct 2021 10:35:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhIh4BJRUb6LiM50p9BhNsb1wNlRc7MRctF3DW3g3a5zYE0HiGvZZWWNegkqlIY/mtfDC1HWoxfsoQPTPpNE8SKtOgvwOM6ZbVkn5UtnP/U4xR63ILoypMcbaJtn7JsMX3IaOoRmpdBGkhGLKim9CL2HJakURwruZrBVnR7Ti3ja2VVNaz9yyEpw0sYquMA/mpTROr80xyKzt+PViDvVtuZvlt4JGBjLqScIiOIOtUO2KwSMYGK4Qw4sZ6cv+FB0RuE69ef3nQjYB2iCiGRRIAWY/WlfoKca2dlD4R7PIQ/2boRTaVr+QqYBpa/xS0L3GfV5DJIYJI+COAOnOyErYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgJ6LE9fMpufEDMAUh3VQZ9tW353qgKNpPYMBnUVlh0=;
 b=ZCtYEB0E86EDRbMIiWeSPjJNgonwRPJ7vveyih1b2YlKiqGytkPwxSUNUllZ8l8iePRQ0HIkcg6S9K8hA9w+qK7t50C7Q+pMzIUfoKi/vt4fc5JO1QyNTesFpkdvNiOOXD87oyjJYX4aef6l1Kew9z1PIBqzUuxz6eiq9MZKgqroNKw98GivHvyZLTozkjWRSczdcRhIiAqcCfDpLB6DWnlcvFOuXvgpktnXEXeyoB7lI327vzHmTGchV3qoXZJuU0GYia8yn5N20e5sRx4HzxAisvLwokADB/UTTBmINdYNuwfuvcViYHPxURMefk/kFdm6VnV2KaiU12emn8RhUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgJ6LE9fMpufEDMAUh3VQZ9tW353qgKNpPYMBnUVlh0=;
 b=iGzzvx6rqkBmgFcttEs3Q67vKzaBnHnfzmre586I8EdJVQAEXUfYx3SPEVZ9+xlJoIYWT7leny4nf7s27/LiS5KbryMSyNq8oHllvlwEksT9+N1jmMSh+gsO8DwMUgJqdp9I5Zz+Mmpa7n48wWkjf7bYaZ1mYzSpSCZKXacj/ss=
Received: from DM5PR1101CA0012.namprd11.prod.outlook.com (2603:10b6:4:4c::22)
 by BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 14:35:47 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4c:cafe::d1) by DM5PR1101CA0012.outlook.office365.com
 (2603:10b6:4:4c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:35:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:35:47 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:35:46 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, VictorV
 <vv474172261@gmail.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>, Prasad J
 Pandit <pjp@fedoraproject.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 62/64] hw/rdma: Fix possible mremap overflow in the pvrdma
 device (CVE-2021-3582)
Date: Tue, 19 Oct 2021 09:09:42 -0500
Message-ID: <20211019140944.152419-63-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6320a76f-7cd1-4146-8714-08d9930dbdcf
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5176ACBC5D4505A6FFE9820595BD9@BL1PR12MB5176.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:83;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJP/WZRnVpwaiJ9oJpb3aYqqJAO0C9syjKwhzY4k7rMV5Fzu7hfo9zeNMfTd6lBc1Urg4u5gLZqVw8kxTyM+mC+dDtzRZ4kxYLHRPjoI+PGgWe/gvOaEoC2IpyY7wKHZdfCgsUYb1QBqtvmEiYzyILmWqB7U+uB2HO6fQHeYV3aKQ7zq8UBEUn+9gF9AxqJKcVUHJgaxG2gwSAIHBsRCg5BpBVC0rDiC/Bc1FbY2lq9x4v57k1tc04NOw9poE4F+FIMiX/KvC8QbMXDoztuClLewi5L7Mq1wcTOgrxwIqldCOEn1dDSDh4m7GEVWx9Fh0m3NEUryhlxM1uMUh3iE4M0xC2NTAl5RaifeM/aaA2yLvAhBwM/vnNzeN9qO4X7yv7BjEnzy3GV6L+N54skwFl9ww7+9aFp/JZTmRQBFA45ViJsM6JCb0SbC11huNBkJtuBxtCwHomjqYI47QUpA/buXkTYzh3yozAuWEali+fJ9OqD/9OhU7Nvw/eDmc9zXMI8hY++OT4O/hI/+yMtopveFwmTWBU9My8nKJh0B8pRo1QnfmLe+/gFgc4Kwma+DVhYD6iLJU1T7Y9O8Mr4YNTgK65CQcImQcaMtjFsiRFUT6ju+9AWDJrl+tPpdmueVgtZ3S8ZGjCem3gn7ro8p8bXQPoafZHKDmS8CbcJWBCCHJdV5fXhlQncZLLiIbeEsvrpj97jFLu5WWGb2rjf9UphydQdth6/+aa0MH46YXyc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(70206006)(36860700001)(54906003)(70586007)(2616005)(1076003)(81166007)(356005)(86362001)(2906002)(426003)(44832011)(16526019)(6916009)(186003)(5660300002)(6666004)(83380400001)(8936002)(36756003)(82310400003)(316002)(508600001)(47076005)(8676002)(26005)(336012)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:35:47.7168 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6320a76f-7cd1-4146-8714-08d9930dbdcf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5176
Received-SPF: softfail client-ip=40.107.220.50;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

From: Marcel Apfelbaum <marcel@redhat.com>

Ensure mremap boundaries not trusting the guest kernel to
pass the correct buffer length.

Fixes: CVE-2021-3582
Reported-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Message-Id: <20210616110600.20889-1-marcel.apfelbaum@gmail.com>
Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
(cherry picked from commit 284f191b4abad213aed04cb0458e1600fd18d7c4)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/rdma/vmw/pvrdma_cmd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
index f59879e257..da7ddfa548 100644
--- a/hw/rdma/vmw/pvrdma_cmd.c
+++ b/hw/rdma/vmw/pvrdma_cmd.c
@@ -38,6 +38,13 @@ static void *pvrdma_map_to_pdir(PCIDevice *pdev, uint64_t pdir_dma,
         return NULL;
     }
 
+    length = ROUND_UP(length, TARGET_PAGE_SIZE);
+    if (nchunks * TARGET_PAGE_SIZE != length) {
+        rdma_error_report("Invalid nchunks/length (%u, %lu)", nchunks,
+                          (unsigned long)length);
+        return NULL;
+    }
+
     dir = rdma_pci_dma_map(pdev, pdir_dma, TARGET_PAGE_SIZE);
     if (!dir) {
         rdma_error_report("Failed to map to page directory");
-- 
2.25.1


