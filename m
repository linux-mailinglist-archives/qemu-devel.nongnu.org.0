Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26969474FAE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:55:11 +0100 (CET)
Received: from localhost ([::1]:55098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIZa-0002RI-85
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:55:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHw3-0007h6-R6; Tue, 14 Dec 2021 19:14:20 -0500
Received: from mail-mw2nam08on2054.outbound.protection.outlook.com
 ([40.107.101.54]:6273 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHw1-0005rx-O1; Tue, 14 Dec 2021 19:14:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAZ47rCMqLdnHBL85mua3mZNAkKoZN3YIDHpsihJ7Zt/a233q+rw/VlLwydiO0xERG6TJAXeN1Hk/LcxNAh9alZGvg7a45qKjLWHEbcV4meR9Cr3mDoCFwTNx+wDDfDR9HX19Sxm6hG+X0JjI91Of8uiEvdOjkcFLJJH9gfpUz/9GucpqXlLeNYBWRuz3OoooPU1DpIT57VADvQDEimeizqHjt9cz3+Y/GQZRXIixYd5eZours1WQjAW3fzMBOJX7boP0OBxA0dxur0UcdzBreqG1GXKAKkbVBS6JWVZk4J9fiNlh8T+DpqemX3RMx/b3p9rTppfNW90vyio0KfWsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g47yNiRP7LVDXalA1TxaJFioLHbglL02lUbHv7X02sg=;
 b=KfhjnRPTAfpKWKG/9Yx6gE8OHaG73u3nGfnRHDBU6QW9tgsSgNK3NzF5cRK6exSXdDeauj+vp76V38cFH0atQw+7foPdxbE4FMhzfZztUQ/t3aM4fwz1bexy9Av5ZqxIvRUSiPlvSmrAtxWs3F0xuf0HiMustHmReZlJS1ICSbKiX+4evr2u9FWNvSLFnC9mOdJZPJgIWgD6wqXOJ5y/yPsLQzKh+S6+GUXwGE3UkezFIQ8Q5ponrP1NXFJ15etuZUlxqWL86Bhcs03rdYgDpt0weZq6oYMmPwN2OK3E/YjCj2hO1vbAMBG/O69O/jKcL+nnhWK6nWD61XvjsBPc7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g47yNiRP7LVDXalA1TxaJFioLHbglL02lUbHv7X02sg=;
 b=F+5aAldpAsE4yUm//C0uiteB7by6PAmezNL5/jXGULfSzbGFRAaM+huJFqR0D2I/5B/CL4aKJvz9d3ckyoZKzkgPC0VINxlwzv6X+8z+BNl0JmbxggJHOBmV2n2Aq3p1lQ355c3mO5GOABwOaJbEzS6H2frdHeJl1AwxATqsQWw=
Received: from DM6PR05CA0063.namprd05.prod.outlook.com (2603:10b6:5:335::32)
 by BY5PR12MB3714.namprd12.prod.outlook.com (2603:10b6:a03:1a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Wed, 15 Dec
 2021 00:14:12 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::fb) by DM6PR05CA0063.outlook.office365.com
 (2603:10b6:5:335::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Wed, 15 Dec 2021 00:14:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:14:12 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:14:11 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>
Subject: [PATCH 37/47] virtio: use virtio accessor to access packed event
Date: Tue, 14 Dec 2021 18:01:15 -0600
Message-ID: <20211215000125.378126-38-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f73beb56-2490-49b8-71f8-08d9bf5fd259
X-MS-TrafficTypeDiagnostic: BY5PR12MB3714:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB37144E984A44C75B4F7CE8CF95769@BY5PR12MB3714.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sAIxZv4NOavqx1tottXm26caNeMyrhMn02Eth2j0/KgwREzoCA0jhC4dRlMlqziGwrGro4NnQly3j6BNr1rjAGh0eH5VUgw7e+lUgyhIuzcL1uGB649+baOPBFKXSK9t5PbfifCUvwszL5R3+E2WV98NcKUHVG4B8tJ0IVv3Cd/sJij1az8O5czdqxHGYiAPjAAUBUybipUwANs+qCP53UzjcBjnieyEQCpdHn5+WXsabmMEN6cYwjELXt3n7V9dEPNkGw8UpoMItLQiWllNpa7Ly2hEI/Yyn+fyjMTiFZGOco8kmoEqNfG8dS/Y8kRc72/kmnNVRtAZjqtJYa5GXY6H0m7BWlgdjceuhKudUeWvPKIUydIGOnLljdgUIHcJFer5oS9mQVVFyXBg7muVzuMCb3Bm4g0Q+vQIuynoYLq5aSrHhs9Zd4PsWFDuGpHYcv7EXLSRw//PEpgUNgdrNUtBWsAvC7gqZFk4tDJANo/+Po7l3/sWxIlkpRiayAFykgxkRw5G0MSmCPB4xxan8z6/945MpKvZvTQOuPnZMJYo+MM3ZYrBZJjFhZO+qqj5nYvo8r0g4MdV4AzWbvUJ4lL6+3+yI0kk7G35zNQdgQdeg4eJa0qKAY6TdhOl6JHWNcHwYiXhwvFxazm48rOMNVUQrhB6EYIkkg3SoJCFqcloMnKV60oQt8ARwHgZO6x9GEdHFrgi4tkhp9rDsdry9c+RygSjqa4qTdV2t6lmB8PlcUgOiIHWX7AdmB/f196DRM2/X30eT0gU3ggbMWpOcB1h/rVQ5dHeIVx8NxrRrm8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(44832011)(186003)(1076003)(426003)(26005)(6916009)(316002)(2906002)(5660300002)(36860700001)(83380400001)(40460700001)(54906003)(8936002)(86362001)(70206006)(16526019)(4326008)(82310400004)(70586007)(36756003)(2616005)(336012)(8676002)(47076005)(81166007)(508600001)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:14:12.0573 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f73beb56-2490-49b8-71f8-08d9bf5fd259
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3714
Received-SPF: softfail client-ip=40.107.101.54;
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

From: Jason Wang <jasowang@redhat.com>

We used to access packed descriptor event and off_wrap via
address_space_{write|read}_cached(). When we hit the cache, memcpy()
is used which is not atomic which may lead a wrong value to be read or
wrote.

This patch fixes this by switching to use
virito_{stw|lduw}_phys_cached() to make sure the access is atomic.

Fixes: 683f7665679c1 ("virtio: event suppression support for packed ring")
Cc: qemu-stable@nongnu.org
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211111063854.29060-2-jasowang@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit d152cdd6f6fad381e804c8185f0ba938030ccac9)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/virtio/virtio.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 2dbccb6b3f..c9567f09ed 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -249,13 +249,10 @@ static void vring_packed_event_read(VirtIODevice *vdev,
     hwaddr off_off = offsetof(VRingPackedDescEvent, off_wrap);
     hwaddr off_flags = offsetof(VRingPackedDescEvent, flags);
 
-    address_space_read_cached(cache, off_flags, &e->flags,
-                              sizeof(e->flags));
+    e->flags = virtio_lduw_phys_cached(vdev, cache, off_flags);
     /* Make sure flags is seen before off_wrap */
     smp_rmb();
-    address_space_read_cached(cache, off_off, &e->off_wrap,
-                              sizeof(e->off_wrap));
-    virtio_tswap16s(vdev, &e->off_wrap);
+    e->off_wrap = virtio_lduw_phys_cached(vdev, cache, off_off);
     virtio_tswap16s(vdev, &e->flags);
 }
 
@@ -265,8 +262,7 @@ static void vring_packed_off_wrap_write(VirtIODevice *vdev,
 {
     hwaddr off = offsetof(VRingPackedDescEvent, off_wrap);
 
-    virtio_tswap16s(vdev, &off_wrap);
-    address_space_write_cached(cache, off, &off_wrap, sizeof(off_wrap));
+    virtio_stw_phys_cached(vdev, cache, off, off_wrap);
     address_space_cache_invalidate(cache, off, sizeof(off_wrap));
 }
 
@@ -275,8 +271,7 @@ static void vring_packed_flags_write(VirtIODevice *vdev,
 {
     hwaddr off = offsetof(VRingPackedDescEvent, flags);
 
-    virtio_tswap16s(vdev, &flags);
-    address_space_write_cached(cache, off, &flags, sizeof(flags));
+    virtio_stw_phys_cached(vdev, cache, off, flags);
     address_space_cache_invalidate(cache, off, sizeof(flags));
 }
 
-- 
2.25.1


