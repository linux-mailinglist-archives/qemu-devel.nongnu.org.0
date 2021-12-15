Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF07474F7E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:48:17 +0100 (CET)
Received: from localhost ([::1]:39818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxISu-0000KI-Gi
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:48:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHz3-00041r-KA; Tue, 14 Dec 2021 19:17:25 -0500
Received: from mail-dm6nam11on2088.outbound.protection.outlook.com
 ([40.107.223.88]:7200 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHz1-0006Mn-2g; Tue, 14 Dec 2021 19:17:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDMJgsq0r0JGx2tk2z/eCRPCuaKC+kH1I44BLGwwyZkY4ibNLE7Yc/TQxHtzwLLz72bGkRykUZOd7h7UM94r455k//kDQeco3FR1BkgQv95vpVFJMbmJJCdrE7hrUeh6wClvnTlvQAcsv8KEaYGFAuBERGbjFxt7ly2SUEdDVLDyFZdVtbT+s7cnrInTmEGVv2BIilP6j4WRHTjMZJXIJU2ujTRifiu6fG4bEEFQVK7s1jp/jwV6YhvkAj3RH/UAxzr5cVNFQXk2ygcJ28a2a3sbi5dhABSiWGlS0bnC3a4kGn7diUm3z/kkyAKV+3a2jfeQ/V+M7wj+aZgpOlPeSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+67iRhqQDcEsbyb6W2vQy+Zy9nh1gVs5WkgPxLFzWU=;
 b=arQEN/6HNkmJ4iQ74mq+bxUpzoG3LLoEMSatJ+BQwLBEIb9m/4NRgpbGgOy7AoQz+lTGYUJLhLlpXSqAoBrefO6VRdoM3Cv4N4U30pq3DnlIHdv+JlvVY8qEd2eYTLNcrVXnPsZvoTJKfDcwRoJ+UB4s1JknIvxx0otm4yK8nyFAuEMBv6qKTBtDj9h9lFaz27x71urNmWo+aSRqKz149bqG4dsJOgFQieki/+YygaHDeBOCOOulHZypAipn9VfPY0L3eFechc4HXiAdBLY9NxvcDCA9oxsYO/sCAiUw3Fm2Xv+NWfUIZEew9uP4OSZY/XKJSb4lLgUyHy78iyTYYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+67iRhqQDcEsbyb6W2vQy+Zy9nh1gVs5WkgPxLFzWU=;
 b=xWBsdlzqTEn/tvuww1UzoTqY2MCV1lKcCwLHlSna5Nt+Qq7dO0TbJ9F7G+NvHB3XmG8B2ax1Y802ZTtnhj1CeYVN1hCC62YlNXoWeEdIl9SVWmG7Ag99b8A2fRhjtOTs9wTjkMtim+a+125RktsBhh+cXCiNrhtydFzALCcFuTI=
Received: from BN6PR19CA0107.namprd19.prod.outlook.com (2603:10b6:404:a0::21)
 by BN8PR12MB2994.namprd12.prod.outlook.com (2603:10b6:408:42::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:17:20 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:a0:cafe::66) by BN6PR19CA0107.outlook.office365.com
 (2603:10b6:404:a0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16 via Frontend
 Transport; Wed, 15 Dec 2021 00:17:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:17:20 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:17:19 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Mark Mielke <mark.mielke@gmail.com>, Stefan
 Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 45/47] virtio-blk: Fix clean up of host notifiers for single
 MR transaction.
Date: Tue, 14 Dec 2021 18:01:23 -0600
Message-ID: <20211215000125.378126-46-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ca042a0f-4a34-4d13-b7a4-08d9bf604293
X-MS-TrafficTypeDiagnostic: BN8PR12MB2994:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB2994178733421E200DBA46E995769@BN8PR12MB2994.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r7JnZaYDm/ePwHtqhR6AC2wRP0mLQBSIDmC7uPed1gcV5WaiMTp4D8/XLjxBba2jomrPZNRVl4AA00uwTgGIfOIW6Z3RCeaBJqwKbxdxoyyY1otCPrR6v6nvpt6z6J3wRoo6DOWbSX8tZPfpfDv1Nqe3qmTNMROk0JVybKWfB6pHQ4HOLtUAvSCLt7E2u8QdAZk1cxcXydlo8J0IQKwMj7X37zBDUNJo1aedXhsQ8nF7NOJ5UwT6PTT/HrNDq40tUaen+r3kVyqzESrIZd8yVldNRQw/LlxI56LfRvzCTb/V9Bd+JdyDpMcPPOKBkDdRfLJ7GIZD6ksrdizNkjRlzUylRZPx85BcsncHrcViWwGtGICl7w5GPp2KtNRKeLZtsCDB1bp8zmdmXP5JKCKfmPQjfEkX0iGkbeFKrsZ7p4Yv7j4OioFhkA10CbaKoPd1Tu2dNHcZ9F/JgverworsGdXu5TWE6xARKEpy08h0YZSh1vUuGuBPlRjWfBlMNDigzxhDPJaJqJhwSoKUerq0tE7MesOjO9l/M6OBO7INnt8k02HAtrJJmOjKy0D9jynhxuJ3DuHZidn/82l+vJCYF6FBl2X02SQ2V7tYZrRsMd8gQN7DUbVPgXkVMffqkjhkDelfOWFbOUW7egE3P8nMIATUyIjppjdFM/DO9JTvEnTkrn6jYPx/4hBnIMrimSQWnudZJUPwyAT+yY0P3fDD8kYdpC/qqgcnzJfOpe2YwD8908L29cayuEPOx5UUSwUa4dIn6Mbpd58b4sm8xstdKHOxPVzB78YHNrM+K9Eefds=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(336012)(44832011)(6916009)(40460700001)(5660300002)(8936002)(6666004)(36860700001)(47076005)(70586007)(2616005)(82310400004)(86362001)(70206006)(83380400001)(4326008)(1076003)(16526019)(36756003)(186003)(81166007)(2906002)(26005)(426003)(508600001)(316002)(356005)(8676002)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:17:20.3909 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca042a0f-4a34-4d13-b7a4-08d9bf604293
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2994
Received-SPF: softfail client-ip=40.107.223.88;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

From: Mark Mielke <mark.mielke@gmail.com>

The code that introduced "virtio-blk: Configure all host notifiers in
a single MR transaction" introduced a second loop variable to perform
cleanup in second loop, but mistakenly still refers to the first
loop variable within the second loop body.

Fixes: d0267da61489 ("virtio-blk: Configure all host notifiers in a single MR transaction")
Signed-off-by: Mark Mielke <mark.mielke@gmail.com>
Message-id: CALm7yL08qarOu0dnQkTN+pa=BSRC92g31YpQQNDeAiT4yLZWQQ@mail.gmail.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
(cherry picked from commit 5b807181c27a940a3a7ad1f221a2e76a132cbdc0)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/block/dataplane/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 252c3a7a23..ee5a5352dc 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -222,7 +222,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
             memory_region_transaction_commit();
 
             while (j--) {
-                virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
+                virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), j);
             }
             goto fail_host_notifiers;
         }
-- 
2.25.1


