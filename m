Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE08474F25
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:25:40 +0100 (CET)
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI71-0003J0-Qw
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:25:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHvj-0007Wq-A1; Tue, 14 Dec 2021 19:13:59 -0500
Received: from mail-bn7nam10on2040.outbound.protection.outlook.com
 ([40.107.92.40]:51041 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHvg-0005rO-GP; Tue, 14 Dec 2021 19:13:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dniVPkVnBLI1jcqbjQGDMMB0ZDbJLooUuH58Xpwz01Q/IHSXLBuaJwJPkXO4eq7nTKIXqHkZg5J05kxg7kWj6ExV/mnbbGIOJQHbieLPezaHai/g4goMtrjhhFkTHK9iGE9EnertWeyBKjXoTJohki/ejZmrWmcqatoaMsO9dJeWmw1ih7dntYV0ukgZn/gkJrKyuARudNCpW/BebBhCSiyhU4aPAjHo2N2WpCKb9NDs/Vz1Qp+tBoEqrpWTU2BQUvuR7tmJlOY8JVzuFjGPt3W09HcrmY98qljy3JZF81oujRGTt4OU9M2eX3xnTHn2aItCmtsEVzKJQw51ZCWcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQpEolrYULUH43xYHLxpK97VIQpUgNqzM92nqdSg62E=;
 b=kmrLwRFXe4qgIxNdz3XwCUIwSexNN0MHnx2BPB1I0qFs/419GaZ4qWzKamjyhoC4b/gjPFQxG7kza9qxzanQSXOrI08jfalvW8FVk/idbEIkAO/eXDWhKSK55mFpJlhWN2Wq3weAi0lku4M6Bd/pSXBkoRmwrPqxqN2MAxR0lozgP9e0Pt8WRu9jtURk6ihJS82cwi1GHW/juiT8shcQkMAcD/rci+stjaVFrTGcFeTjnbm2JiVeL9p7uQClecGGIaTmWkSgJiAssjmuUHX2OnAQYkSMy7juYSDK3lppphwsiCBk0IGqezwx5VZ6MJAw177SPDZXg5VT5PhwMz+ccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQpEolrYULUH43xYHLxpK97VIQpUgNqzM92nqdSg62E=;
 b=pxsYLLX7/6wHdiR7hmxqqJBHkQo3/JwE4R87V9Vnyh8tmMBSmtZjWs25EKuTW8gOTSL4px38fAQ44DGJtVyoUMt4yQ2H8c3dEgYAZcM2AZ6lehlRf31RFINgTXKRb26SihEML73CGaIvex9+9NyTXVPwKGF50ad6NIdafNW/tAo=
Received: from DM6PR03CA0016.namprd03.prod.outlook.com (2603:10b6:5:40::29) by
 MN2PR12MB3278.namprd12.prod.outlook.com (2603:10b6:208:ac::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.15; Wed, 15 Dec 2021 00:13:52 +0000
Received: from DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::fd) by DM6PR03CA0016.outlook.office365.com
 (2603:10b6:5:40::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT022.mail.protection.outlook.com (10.13.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:13:51 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:13:51 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>
Subject: [PATCH 36/47] virtio: use virtio accessor to access packed descriptor
 flags
Date: Tue, 14 Dec 2021 18:01:14 -0600
Message-ID: <20211215000125.378126-37-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0a273df5-c03f-4063-8814-08d9bf5fc637
X-MS-TrafficTypeDiagnostic: MN2PR12MB3278:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3278BA345152BD8D26936B1795769@MN2PR12MB3278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:197;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lPXsLNEmxEEtwMGeAHVr3uZlUpmNq2uo5EamWYoaNtmdxKuhafTHA+Pcn5d+rvYFQvXrPgD0roz6EcmX33Cy/4Dq5IjFe7zLfCP3oQwK2EJZTLQIwUaQOWFgswLo9nNpsYDEwAdwdbnMklQGA5Jqt8nt0p518TuctoI45GOOPMplRD/aE/ayvvcmIpbeL6b3Ek9ye9EeexvlGvo05VEKEdoU4pGZ2Cxpk76nJ03I+AMBYbjRH2oh9GeiDrYMaKyUC/X97+xfB6eIIscHHCcworKoaZeeKaRon9C1CyEO3XgfkpPyjFRwlHOfHEwVEFL+CDVHekuoaUUp/09BIe32iQc9+ulpn8e/PnKPcoFnalWfpRO9pC/kHs4KIJco7DYRuXUBC+yOxDkFpkv5XQ1I6JfWnXKadZtambKlcT08YK8nxCn1wdxVmHRIirNgRVhbIjAdMf1VYXYjTOmaxOe9/J6Q7qNMPJK0c7jRImu6OeReBYFlXGIdUKwkZMlLrM2dmvij8xlNfqP9zMEjkbkKnYUqTyiXfRsmAmWF/5+9jDYGH4BNUzfZnZTnUOIxCOjUyjA0tdidhvYMYl4Ad93TVhwxa4kGcWVxi5j0VnCgFhkJGFFToaOCV2HZ8vVMOnUh2UgLoJceBLUxPoPbxFHeH7nIe/kdMzc4YiU83pDXxBA92D+vQ/eI8ktcJlLMxyVQ8iWv8VPwNKaSXqGUcV4D3saDcq1MlFoChnTOoiJWlmDGcee6jHcJXL7T/9U2usYKgYA8moiMzltBiOzTmCscrFbaM9zffPIGHqqDY2qCqZk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(186003)(70586007)(2616005)(508600001)(4326008)(70206006)(5660300002)(2906002)(36860700001)(44832011)(40460700001)(8936002)(6916009)(16526019)(86362001)(1076003)(8676002)(81166007)(83380400001)(426003)(356005)(54906003)(47076005)(336012)(6666004)(26005)(36756003)(82310400004)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:13:51.6909 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a273df5-c03f-4063-8814-08d9bf5fc637
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3278
Received-SPF: softfail client-ip=40.107.92.40;
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

We used to access packed descriptor flags via
address_space_{write|read}_cached(). When we hit the cache, memcpy()
is used which is not an atomic operation which may lead a wrong value
is read or wrote.

So this patch switches to use virito_{stw|lduw}_phys_cached() to make
sure the aceess is atomic.

Fixes: 86044b24e865f ("virtio: basic packed virtqueue support")
Cc: qemu-stable@nongnu.org
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211111063854.29060-1-jasowang@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit f463e761a41ee71e59892121e1c74d9c25c985d2)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/virtio/virtio.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 874377f37a..2dbccb6b3f 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -509,11 +509,9 @@ static void vring_packed_desc_read_flags(VirtIODevice *vdev,
                                          MemoryRegionCache *cache,
                                          int i)
 {
-    address_space_read_cached(cache,
-                              i * sizeof(VRingPackedDesc) +
-                              offsetof(VRingPackedDesc, flags),
-                              flags, sizeof(*flags));
-    virtio_tswap16s(vdev, flags);
+    hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
+
+    *flags = virtio_lduw_phys_cached(vdev, cache, off);
 }
 
 static void vring_packed_desc_read(VirtIODevice *vdev,
@@ -566,8 +564,7 @@ static void vring_packed_desc_write_flags(VirtIODevice *vdev,
 {
     hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
 
-    virtio_tswap16s(vdev, &desc->flags);
-    address_space_write_cached(cache, off, &desc->flags, sizeof(desc->flags));
+    virtio_stw_phys_cached(vdev, cache, off, desc->flags);
     address_space_cache_invalidate(cache, off, sizeof(desc->flags));
 }
 
-- 
2.25.1


