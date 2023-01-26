Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36FE67D4B9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:55:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7LW-00061e-6P; Thu, 26 Jan 2023 13:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7L3-0005Fq-OE
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:15 -0500
Received: from mail-bn8nam12on20613.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::613]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7L0-0002ut-Qa
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYXgNfK6NBo/R6/GLeysry6wbOQlC7ru8PTJD6YJ5utcYroXHe3NigZ4Kusqn8GxenwsvKlYIc7uVg4QQTBBfw+Yy3fpngpuDqrT4pqOE5huAGuHGNSzUSKRD1cytq8OxsIbq2HbDZaMUT2yx4MwPqUMAHr9MLCCyEEJWAIkdeG9W+VUYryIHa2QZxFBOrLK+ClrWFdMaiO8oAhP+08VciHsjERIQlUGTnFUu1kO+P2vxLXm0B0/lQwU7Um2Pkuhen0bgIEy9XHZRmyaLCZckFJBCNdqjBVqv10FDFpYxiiYQBpd1jvjF3xnElcyWNYIPmJePPfJUboRLx/7rbupWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuWcVYbadQ793r5UWyDS1lhsUw5avGS07TznOJIoXAA=;
 b=Jc3Uknm7Cq++DgAmaXceys5mQxbOz6+Mr2iMlB/RHQnTLUTe9J1DAVBDd4o2u56Kv7sq+qrVKfQQ02fdEgP2YPtAABeIJmz5QuBFKkGrQGEir9AiQmNndNMdqtraeUarny3vs66/VXwrpyM8iLG/0v50rOhXnvDVrs4LZcsSfmKdKoLDCuc+bcvDcGmrrQQFGedzUQz256oV00hF90R8c6ohHK6y+TMQz6Kwu9nir7EndXReC6wz9saCqfchhHFVndgfKrHXXhAY8C4mM1sOTwQ6gRXpWbM8aq9vFlIQ/Ml8q5zQOrxlhjSzZ9+KIlV07HinVUeyE5cvOF5pde5ywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuWcVYbadQ793r5UWyDS1lhsUw5avGS07TznOJIoXAA=;
 b=AsVOE+IoaS9F+IIxqdlfBredMYfKMo9u20WzdfoWc/YrxhY887yX2PKzI5huGhT498wh21tObyYk0DQaKGyMuOBOPSdVPS/WSH2WcqcLA3T2ADm5vR7dFoUNa3kAIzbBLsD4aJQLbA/A6jG21nl8Ol5YVs7/JrxVQGiDusBNR6pb7jLvGFn/Rna2GUIuMPpric97q/uu8+WdI8fwoSqT13nbNjZlc9jwa4Qqk4rt2BgD/4k7b89/i7wGObKOVutu5oZ95srxFGyMRPhHteIsP6La4yGia4hg5N29Xfs7Zj1y/IhB2rXHD7mpq15y8pegSt4UT5Ns0MMXnen4QnqOjA==
Received: from MW3PR05CA0008.namprd05.prod.outlook.com (2603:10b6:303:2b::13)
 by CH2PR12MB4972.namprd12.prod.outlook.com (2603:10b6:610:69::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:51:03 +0000
Received: from CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::1a) by MW3PR05CA0008.outlook.office365.com
 (2603:10b6:303:2b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:51:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT014.mail.protection.outlook.com (10.13.175.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Thu, 26 Jan 2023 18:51:03 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:50:52 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:50:52 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:50:48 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH 13/18] memory/iommu: Add IOMMU_ATTR_MAX_IOVA attribute
Date: Thu, 26 Jan 2023 20:49:43 +0200
Message-ID: <20230126184948.10478-14-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT014:EE_|CH2PR12MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ba2aca-ce2b-4fb0-abc0-08daffce462f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tG6YwENbKJfBSK2gwTl0SsxKzWF2+M9TIcvnzJDz56DiTvGB4ERL+gh/szGkOlc7XXT48BX68C8b6+L4x9Sr1SCRGxOREne0DgdtcdjOLhU9K0Dsh9C4LRmOCDphqXFeEHlBhmBFHYwOjsbbdyJDiLnC/r93Dwd1uXjKOarg4YgRq4qHkNkPixdqTT0J9FVtJjVNOJJmuiRZn57mQb944/gcvtuU/nt9IwWPZc05cFWtifU5ktDqKPT/y5OUfNasEMXzEs7rql8gyrfMStWAEDE4X2i1UbxFmVIyjSfwyT8qErnvxZZtLj+z2FS7x2PlNOQqmitoHqVN1avjbaZDsNAgeaeb3btDAoE0fsR0/qDGwSVIDUOoV7o9I19+31VqDnFLv6YvqyfSOyNH47wwU86BMRwaEDmQHjkJca8zEycxS0m3X3W61D6x7OGT9UnIGAUZFaX0w5w18OVoKbxgQ+5EMrWW+k+SEOVkMrsqJFxvvScT/pHHpi12HwTwcHSB6hH6GHF7jsozgz5rkLvc/cOOfiZD+wox9YvlNZ+YYFOyDhDPgU3JUhxJBphx1VJDrfN7+pap8BRbTHUyWnafhR0oMxo1uUki/C0zGNItwJy3+vZOzuUqaMUa2HPmhHeo8qBiTgxoOUIIq4X7DT2ED+iwcd/nojT+xSH4Jd94oeIjc02sYMmCrhd/fq9VWMUpuWlbmZH2iSkCeEdvrb6GqA==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199018)(36840700001)(40470700004)(46966006)(86362001)(40460700003)(40480700001)(4744005)(5660300002)(356005)(7416002)(336012)(83380400001)(426003)(26005)(186003)(2616005)(47076005)(7636003)(36860700001)(8676002)(82740400003)(316002)(36756003)(54906003)(4326008)(8936002)(70586007)(70206006)(478600001)(6666004)(82310400005)(1076003)(6916009)(7696005)(41300700001)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:51:03.1284 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ba2aca-ce2b-4fb0-abc0-08daffce462f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4972
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::613;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

Add a new IOMMU attribute IOMMU_ATTR_MAX_IOVA which indicates the
maximal IOVA that an IOMMU can use.

This attribute will be used by VFIO device dirty page tracking so it can
track the entire IOVA space when needed (i.e. when vIOMMU is enabled).

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 include/exec/memory.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c37ffdbcd1..910067a3a5 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -290,7 +290,8 @@ typedef struct MemoryRegionClass {
 
 
 enum IOMMUMemoryRegionAttr {
-    IOMMU_ATTR_SPAPR_TCE_FD
+    IOMMU_ATTR_SPAPR_TCE_FD,
+    IOMMU_ATTR_MAX_IOVA,
 };
 
 /*
-- 
2.26.3


