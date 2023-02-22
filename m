Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149F869FA7D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:52:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtH2-0002pp-EG; Wed, 22 Feb 2023 12:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtH0-0002ni-9T
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:22 -0500
Received: from mail-bn8nam11hn20300.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::300]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGy-0004ix-F4
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D09gBquFIUE1K3YP0iQkyVmY+ZuKK1WadNn9FkjZKPQUtOw6nujhFv/2wP7XHVxr750rI3AH9Ee7knZtvubEOqOXaiV3jjmgZ8zt3Zcr6DbjEgQKy04YCSrvtThkeqDWhQOSPw0xjYcUnCx5r9CwU3qMqV6pmhcTHgfUN9LtcTnJfiqm5S6IIKfuVd8q0Q8aslLB7GYIlA82lYYpG+hBMNHpAC0DVv3Bte88oJtks2LdsPJX/O63p6/uKTQ67NpM5tTjLkc4YuoctbUdN5CGfywFgUnIePzxqVLcMYf39nvoHptzXDEABywNrTMi1wZpYmiWISwN/GHu/Y29cs0t3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8TJ9rvcw6aZs8xr6BZ3FAgwphVc21Ogf6zXPFRrIHs=;
 b=jmof8zmvlZIRQAFpeWOalzmBUmKFrVuS4NrHeQk4Q/Ol38IU+j0YtEvroxTtXEK2jCIU5z6GwSBeZb+KHxC+/v4gosnBIH0VL4q+13pYLdnEuF5gJmVBUGGPcwqLynP2ZE25PtyXMyqwk+wBmMgvgEpmXzOP1U/koh3nJIJAt0qHftsDNq7gb2ojtdX3KOthZi/MzybIHpSB6dAal2q4wqW/WuypFu58uAAhjJAgJwXU8AhendJgxYLFk6SiH5tRdGJSVA7M/0np3kSC1bjmiMsVQd1CuXQ0S36aR+j2uVeWyiPttVozYwkHwYN1cepJK1hdTIakXc/aZJsQAOi3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8TJ9rvcw6aZs8xr6BZ3FAgwphVc21Ogf6zXPFRrIHs=;
 b=rwpAG4seooK5bG/Ii822gYsr8TvbI4T6I/kOiU3NQqbQUOQ2zld7dssEewjOgUhTBxg39VOA2pzqOsO19gOKfHICtT2SF7Tn302Dy9PoaTW+i7dnRtvxQSFg3kqQznAB029imRR5+4h9KZevUdVDzoOZz89iNrD0hn/nlqw8hf2eddPrBmmnY6By80RcrqRpqQD9wtrKXsfpdFSRGCfOSb0hXV1rQjawde6xMWjnaSiEfOmMQGO2PWAx8UAgDpVCYFVXHAGy9kwWzXjd3eVIcGtKdInG4LltRAQ7hUJ4wEYsKEMDrr8OEtIR7P0uLD7hQDkEcHr4HiubosFiqXbchQ==
Received: from MW4PR03CA0007.namprd03.prod.outlook.com (2603:10b6:303:8f::12)
 by MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Wed, 22 Feb
 2023 17:51:17 +0000
Received: from CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::48) by MW4PR03CA0007.outlook.office365.com
 (2603:10b6:303:8f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.20 via Frontend
 Transport; Wed, 22 Feb 2023 17:51:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT086.mail.protection.outlook.com (10.13.175.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.19 via Frontend Transport; Wed, 22 Feb 2023 17:51:16 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:54 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:54 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:50:49 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, "Jason
 Wang" <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v2 16/20] intel-iommu: Implement get_attr() method
Date: Wed, 22 Feb 2023 19:49:11 +0200
Message-ID: <20230222174915.5647-17-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT086:EE_|MN0PR12MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: f442ee45-dfc9-4cec-0af5-08db14fd65d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dol4XnaQoNaUSg4/tLkryzCd6AMI0cHJKJWKhYddsL91mGz/QNRp/hCojGR0WBoETgNRoP6O/r8TTAeIp5KOwpmWrYjHuX4ZqQ4+NS/xIG2FHt6WmYjVZNrlUCEvZjqSKm67tQdl49hTSr00jt6jziFVqdB86opsVjB4Bpgubz2ZyRxmhi5Hsy/oh8M/+1Z1SXu61nwXOFyU0XFE0vLJXHXTQWYakPT3Wx9l7O/KHTBSKf7v4Zf7z/3sF7eVjsWHkelPh5JpVbibR2mu0bh1yK7x9HeA+MmGt8pEp+8CveAjvXwyO2Bp3JSjSJ+Dr4Tv0117cigv5bFAyPSQRuOU9+lv649sbalxULEngyg+k8fsRfa8uzy6Ry4OkzTMJda7yaXD/3NtHSXhOFYPrRGli4I25kA0IohP8k9V2lmqzurBVWvCOooi5yzmnwlQXVaQECvB5y3pdS5JIRsp+IFIsjQ1T6vNGxfj7PQDHne/c6h+zYLgbQ5I8/ppkn01diYs+wc0GdxE+1Xq0EKCqae21ndlxircDDt7DW3BDfzUElITyqTDw6PPtW2OpDb1qXyoNZYtQqbV6JA5gLhgEfAgKMl4TrUMsmvrYVUvwYVzIK1+U4z7qiZTZUYffnFYSQJhNXHxZVNRx0bWPbMEKx870kXgc2pHn0Ngp773+uSpxK/jiwZKWWRfwHHGKuH1HZYg6FG1ebLMGwisz1ddcaHxO4movYAeKnUylxqRGhX/tfe01QaZnplqNP0JLw0Ft3qJSldtSmvYPRSOMcgjqR4DUg==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39860400002)(136003)(346002)(5400799012)(451199018)(46966006)(36840700001)(40470700004)(316002)(82740400003)(7636003)(41300700001)(2906002)(36756003)(7416002)(40460700003)(5660300002)(40480700001)(36860700001)(4326008)(86362001)(8676002)(70206006)(8936002)(356005)(70586007)(6916009)(34020700004)(54906003)(1076003)(47076005)(336012)(2616005)(82310400005)(426003)(26005)(186003)(478600001)(7696005)(6666004)(12100799015);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:51:16.9534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f442ee45-dfc9-4cec-0af5-08db14fd65d0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055
Received-SPF: softfail client-ip=2a01:111:f400:7eae::300;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Implement get_attr() method and use the address width property to report
the IOMMU_ATTR_MAX_IOVA attribute.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Acked-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 98a5c304a7..b0068b0df4 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3841,6 +3841,23 @@ static void vtd_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
     return;
 }
 
+static int vtd_iommu_get_attr(IOMMUMemoryRegion *iommu_mr,
+                              enum IOMMUMemoryRegionAttr attr, void *data)
+{
+    VTDAddressSpace *vtd_as = container_of(iommu_mr, VTDAddressSpace, iommu);
+    IntelIOMMUState *s = vtd_as->iommu_state;
+
+    if (attr == IOMMU_ATTR_MAX_IOVA) {
+        hwaddr *max_iova = data;
+
+        *max_iova = (1ULL << s->aw_bits) - 1;
+
+        return 0;
+    }
+
+    return -EINVAL;
+}
+
 /* Do the initialization. It will also be called when reset, so pay
  * attention when adding new initialization stuff.
  */
@@ -4173,6 +4190,7 @@ static void vtd_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->translate = vtd_iommu_translate;
     imrc->notify_flag_changed = vtd_iommu_notify_flag_changed;
     imrc->replay = vtd_iommu_replay;
+    imrc->get_attr = vtd_iommu_get_attr;
 }
 
 static const TypeInfo vtd_iommu_memory_region_info = {
-- 
2.26.3


