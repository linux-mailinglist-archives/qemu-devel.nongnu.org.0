Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF243386E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:32:55 +0200 (CEST)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqAg-00072Y-9K
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpxx-0007Z2-SR; Tue, 19 Oct 2021 10:19:46 -0400
Received: from mail-mw2nam08on2086.outbound.protection.outlook.com
 ([40.107.101.86]:50657 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpxv-0007XG-Ua; Tue, 19 Oct 2021 10:19:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKXAMoeT/8jU6fIn8OHJxwPjvMCd7pyE+LY4aGct0wUToOk38wxndIwxPm9M9Sawed4LYS2xqGNsNN/a18UkMr0pgAQuKE0Q7bCW4OP0/MvsZ0STo/fD5DET4YX1nuPyYg6VeRH+L9FbKZgl6iVaMaVrW6jsI8+bc4s6N8f4JqRamECDaQuAAWI6qXE/GHxXn1PjoiP3cqY8ZiR3nC8Dfbj7fQ9suz5UJg1nPrlBr259k4EYDzwWWClk0FbcPKSCl65PQpmePTzZxAGCw6oGYsXtfdn1zpXzan6BOL3E+jzeJqv/RAWz+RZUYFPBCyhch8V1Oa5RoilrkPHMTDqcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksEOSlW8SkYmYmeyXACdJBK0uUYEopxk+VljEfnck7U=;
 b=cgeRDcpEpUZQRo4c7btQD+aHq6n3+72J2puKBa2Zvv8LvAK/CqZt19X6JYwKDq7Gu+Ql5BPHAOl3g/nodZ27WhlutADrc5Rhm8X9wxiQ7aqVWJIqoVIWwvg6NVrv6tvvXN1juBdepvBflezMgGgj4WGGZCYz6lir/WwwZrQScAlRX/0rUteZA2jKaVZqu2RW5A3qAV0V2iVpGoIX/8aNKg+rJH0H/oq04BS340oK/m2y0+m697YzWrJgzHGk+Wr9NnXKj+1JGumksNH1HwHO2ipjdvki0LxmOfcRw/AJ7Xo8P44AelpnQhi/FRZnPX7FtV2F5guESnPW2EuYc6m/nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksEOSlW8SkYmYmeyXACdJBK0uUYEopxk+VljEfnck7U=;
 b=yt7gC+dM/R4s8AOngAVG+vDVZaqlGf59BmYg2D8C9Af+phXcM4AqJ93EkykTMPNzL/yqMGEK2JBMqcPzycH3ypnxVUplQnl42rwmCCN/zWqUIXwWzvr9FTH3SOmyAZeptFu3+zCcxVHWgbydAZ4vGqEcJXsYDPI3erSYgLugSEM=
Received: from BN9PR03CA0953.namprd03.prod.outlook.com (2603:10b6:408:108::28)
 by MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 14:19:39 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::d3) by BN9PR03CA0953.outlook.office365.com
 (2603:10b6:408:108::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:19:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:19:39 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:19:37 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Kunkun Jiang <jiangkunkun@huawei.com>, Qixin Gan
 <ganqixin@huawei.com>, Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 22/64] vfio: Fix unregister SaveVMHandler in
 vfio_migration_finalize
Date: Tue, 19 Oct 2021 09:09:02 -0500
Message-ID: <20211019140944.152419-23-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9b12c456-2b64-4abf-7256-08d9930b7c81
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4409F4E806E388B4155F26EF95BD9@MW3PR12MB4409.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4dS6zLACaGWjwwZeWWsWrOPn81/OByEbpjun5TnuE1lDjKhn8/zqc/xzRhXcLPSo7TxxvNicWHKoQcfT/lv4drXMK7Oyl0LyEjjffGKl+8/Ogw//0ybVNhC319AOW6Z6ryBjG52lw3NV4QabV1dLV5Ne9w+VQOtFq3P0MVkXsorBZJz1zaf4Qqq6i0SpDWsoXzbnVjl+wQprgZzdMCsoYMtiC66Pvl0b6mps3GHIm81M3oLU66Ml1AayxMoy/42wmoOurCqZdRzWcEEwNmEOln83T51qNt5Fvx/Hkh64tk18zwgHFJXmfPgd8T4QoZF/jD5SXneBy11chzETKEs12zbIedyYqPJ1QAOrcJEpdAVsi0JbHsVoMcdwZAMajp654acp853RS//tTOP+VcGijtb73hMR1QOGW1ZbmJ9/QYQ9LorQ/joQkgjVQ5i0vs0dd/Ru49X6buZSugnASxLa9E8eB4RNOuQj4whNaEAzcgnACgU0ruOtzUFwBON1OHYcP69OSykTfMeQGMCWPzpBVGB1ckaWaqRP2JFURM2yBaS+Ep7PDGwo/O23VzowvAGtFKFYtN5du7XCQwHHqNhUKWmt1e9yJ8U4tnggNgNud/Nm4VavXEnxDvIEfH/Q5jVLNY3etz90xxJSQ8trnEk9UntGutnJzQ/bS97vJh1TZJtUCqSpj/K4O+JycLdB5mK32bzYLCkZ1tGbImieik+HqG+h7E2dNHoG2L3xQa2QcgY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(336012)(316002)(47076005)(82310400003)(4326008)(83380400001)(2616005)(70586007)(70206006)(6666004)(81166007)(426003)(26005)(186003)(5660300002)(36756003)(8936002)(36860700001)(8676002)(54906003)(16526019)(2906002)(1076003)(86362001)(6916009)(44832011)(356005)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:19:39.1977 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b12c456-2b64-4abf-7256-08d9930b7c81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4409
Received-SPF: softfail client-ip=40.107.101.86;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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

From: Kunkun Jiang <jiangkunkun@huawei.com>

In the vfio_migration_init(), the SaveVMHandler is registered for
VFIO device. But it lacks the operation of 'unregister'. It will
lead to 'Segmentation fault (core dumped)' in
qemu_savevm_state_setup(), if performing live migration after a
VFIO device is hot deleted.

Fixes: 7c2f5f75f94 (vfio: Register SaveVMHandlers for VFIO device)
Reported-by: Qixin Gan <ganqixin@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
Message-Id: <20210527123101.289-1-jiangkunkun@huawei.com>
Reviewed by: Kirti Wankhede <kwankhede@nvidia.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
(cherry picked from commit 22fca190e25b10761925bb1eeadeda07aabf3c26)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/vfio/migration.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 384576cfc0..3ed3d595b8 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -893,6 +893,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
 
         remove_migration_state_change_notifier(&migration->migration_state);
         qemu_del_vm_change_state_handler(migration->vm_state);
+        unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
         vfio_migration_exit(vbasedev);
     }
 
-- 
2.25.1


