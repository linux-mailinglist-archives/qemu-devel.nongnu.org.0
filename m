Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22602433A0D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:18:01 +0200 (CEST)
Received: from localhost ([::1]:57470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqsK-0006Oa-2G
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqEG-0005xj-U8; Tue, 19 Oct 2021 10:36:36 -0400
Received: from mail-sn1anam02on2065.outbound.protection.outlook.com
 ([40.107.96.65]:47119 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqEF-0008FN-36; Tue, 19 Oct 2021 10:36:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8uPBQKbORSen2TspjjgBLvkMyphM+tvG3TQQmdNrqlSCxFnnWugiYNDj89m+RQ2ZdNsCxqwZAjBHc+AJG56ugmvv7riz8gr12UJXytm/XV3TPnKFz3ZDIUWnojduxj7SAFAG1TydJ4VwsYlrVnLMpVcQ1C6HzfzFCeuxv+DBWOgV+ULT1Q8WmwAx7w/9Gh20j7gsekih/GtIuS0taujFLys78RdnZTihs5pzV72djbT/QTV8zLHUuiibw1VVFXbmVTlwGLgUpxlIAVeglx++cakwl4o8HrgAiyF2LsW3fGiGJ0Pma3LbINLuE5b3aUZEbbGj3qQ1CtM2eKN84Blpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5Ht0SSs4s5oxoM/DZTJvgzbQ8GZhPeVAtyxL2BeEPY=;
 b=EbeWn4n3POjslYEZ8BMQqqbI3+Nfg33o4KPHvvf/wa5f0JcEWCMkqZAJ4Il2oW6OJVqhNmH8litQ8ExJud+5kCpf6EdvYJ05hG1tWNZN6OH6psIkQdNVkdD7BprljgKE9+SJ2USV1LdbI9EWtIAHp585CpzC+5qbmMYnhPo0xaAayajXvjvzXm2tV6NYP6lSSDYBJZv8AXuajx8hWZqez1MEfkDsM1B+b/EjZZTp42xO52O+SshV5QdwYPNtWjDwx2vh++prmFKdi7MwMiZeRKpqZiNz5Fh/MYENqSN6YNFbwJwdJvluCQPGd3uDaweJTuBvgjuIp7KlT/RsajNFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5Ht0SSs4s5oxoM/DZTJvgzbQ8GZhPeVAtyxL2BeEPY=;
 b=mMbkluEdQIlvr6CS5dXoCmBjUywmv3WvqYrzvX3DJdtKiqfyBu7Z2JGnAvKS7J4miDes6fYFAicrJHv92rJpYh2KG6PVz3QU8d4HeZGvztOWWwvikbpV3TY02DxWYqhMJFDnZO9PD+A5zZF01RhwjSbwV5prRIxGuPIT/wYfYOs=
Received: from DM6PR21CA0026.namprd21.prod.outlook.com (2603:10b6:5:174::36)
 by MWHPR1201MB0222.namprd12.prod.outlook.com (2603:10b6:301:54::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:36:31 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::53) by DM6PR21CA0026.outlook.office365.com
 (2603:10b6:5:174::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.2 via Frontend
 Transport; Tue, 19 Oct 2021 14:36:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:36:31 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:36:30 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 VictorV <vv474172261@gmail.com>, Marcel Apfelbaum <marcel@redhat.com>, Yuval
 Shaia <yuval.shaia.ml@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>
Subject: [PATCH 64/64] pvrdma: Fix the ring init error flow (CVE-2021-3608)
Date: Tue, 19 Oct 2021 09:09:44 -0500
Message-ID: <20211019140944.152419-65-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9370beb9-ec13-40c3-6666-08d9930dd7a5
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0222:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB022296F772D61D41287769AA95BD9@MWHPR1201MB0222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dlQqaHI3OTXqtfvjFbj5DD917IMnW5Ul5Rs8sM2eq5/C5AVzzewGokYTBPO2Op22i1TvoKwc67sMcegO7nWN9CQYEMWY9iOhvYEIHDov3kn7ElK9bjAD3jyVd0dPX3n+FZpp4xhFXfWhMllbvrab6/+GmmaHTEWEXZXdnS2v6mL8MdPsKxP7kwfR7dlfo7NZlNEo59NxldOLre3emFD+ACW41TNGTvR+UhGacAtFiickgpt3qCw5qQg21O9RMKFiIyQdDNqJBj5FU3fe4yy1iHjulT+6AgqCnR2OQzJfX6c0HQuInsuOf6YxjPLCizt9awsXT+9JM4mgmZstaxem7Fh+26w0j4okwWEPMUv4lPuGojwWAxLdYDkEjSh/glZJbXs5P2T7Zdgtc+TX1f9omGMqQA7wQdMobwjZ9ApP42n8HqPvS4JztsGY1Zpf0g+Hp8M9WktWYZoic7pFrZRgSkbpPHb5eDxrhLYxqRPCq406q7yFhQ6u8nQKhsu3+YrXHk6cg2+/U8LkwKmTLqkGjAdcWZ+T+xmrJurlInizx9mN7DE5EldXT0LbfAtR+v+N4Z2q2JI14hNZtHUeC9pkfnt0PBZZ6cO4lKIeomMtc/rYqjfFLMtkXf0agKA9uBNQsnr8TNWxJAGsQsD6om9KIT+MQ16qGiQKpmTYkLZSc6gByRnhOztlStUUro9vDlzQ4rUa6LK9/tITdeVFvowyYOHLkHQljFdlHSYRZscCpHE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2616005)(8676002)(1076003)(36756003)(83380400001)(6666004)(336012)(70586007)(356005)(81166007)(426003)(36860700001)(54906003)(2906002)(6916009)(508600001)(82310400003)(70206006)(4326008)(26005)(16526019)(44832011)(8936002)(5660300002)(186003)(86362001)(316002)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:36:31.0636 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9370beb9-ec13-40c3-6666-08d9930dd7a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0222
Received-SPF: softfail client-ip=40.107.96.65;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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

From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Do not unmap uninitialized dma addresses.

Fixes: CVE-2021-3608
Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Message-Id: <20210630115246.2178219-1-marcel@redhat.com>
Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
(cherry picked from commit 66ae37d8cc313f89272e711174a846a229bcdbd3)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/rdma/vmw/pvrdma_dev_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
index 074ac59b84..42130667a7 100644
--- a/hw/rdma/vmw/pvrdma_dev_ring.c
+++ b/hw/rdma/vmw/pvrdma_dev_ring.c
@@ -41,7 +41,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
     qatomic_set(&ring->ring_state->cons_head, 0);
     */
     ring->npages = npages;
-    ring->pages = g_malloc(npages * sizeof(void *));
+    ring->pages = g_malloc0(npages * sizeof(void *));
 
     for (i = 0; i < npages; i++) {
         if (!tbl[i]) {
-- 
2.25.1


