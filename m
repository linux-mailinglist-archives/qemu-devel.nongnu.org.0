Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B965A67D4AA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:51:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7LH-0005Fz-6L; Thu, 26 Jan 2023 13:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7Kd-0004cJ-EU
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:54 -0500
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::601]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7Kb-0002jb-At
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPSM8dbPw8ox1Udk2HLGhXQdTvN3UgZLHwVGBdKj9ONsvYCYQlQOt17e10o1t0cYiOV3M8CQLRS8sFLSjZY9IGwXFvjV5vv0Q7N4H73L+HbXdPMUA7W0bRbdiq0CML2r7NuYyeHpIHMNq4z21uTakhT67xFOZVVESbcSBjuTzGxnpzYEai6qmQ2x2Il0q/BCHU2vXQqlMXHLm5RioCzdnTVZaulq8fxkRKVhykCtHbkGFDZn/wFMdTxIqDCYelSBEzP3ddMhhFEMiZHuzLDVNrmu0g2y0c+noqnDFfu9nZE8TLSh1sKpNBoVix9RikXkbNSPsWHkXwMBQaW3M2ou7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkntuEtOlJY33+Zvdent9wgvbmBGEGFIQIBt4XgDqjM=;
 b=XOW1Tmd3xUjnLYP4KpjD+z3kKa9zgMXCXIlAB8T3bvOZBbQoebMyi3H2cSxcxkti5RzTgBzXGPcFKVTyHbxmcM6FyooA6TsF2uGSAlMdJkBjrecjfku2mbuotJPRP1CzaaTL3OrISC3rqE0SJSbKVBmyxKhuDJ1vwOdkITEl3sPcxFPcWY+X7qlp7g4B9GysxlNJnK9fuy6Qye1X57UKkBtXUR9grL3+/d7OQnTFPJizCOKpDFbH4Q4D/gcMuEQuRNe/EjvHExuPRNgs9KUIHbUQxwMa+oFACf2YVnCSheAGLkdnQsL039YLPUnXivbZF+JzD8jTyCajtqATc/awfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkntuEtOlJY33+Zvdent9wgvbmBGEGFIQIBt4XgDqjM=;
 b=Qnx/IOhkvO+mJZb80zqFs2z6feqOlo8styCuqN9Xyu7+WAlwtkF1zPcmC8PKBFFOLPlB+kzn4TbmgyRwoI5bot/RiAALEtPFpUFN740ZTnDgPNQTIMIgW00qXdZSNvk+HdyINpMkVY/K9x3loWVbSBBy8TLY2pBpoRPs/qcMq9TZFumiThEuyCYKXjHfERaZhQ4mtIKh5e/BwUNLiC6aKoRyt7jgWUiHSIPnYs7ggd3T6wDWu+5hQWwgDWfVI+Gi6/o/V6jiMHZffyk0uBq6Va1VX/SdNGcjfKsvK9RnqITdnwmXFjdoeJNRv78f1TNHaWt/Y36GgA9HV2E57AGaWA==
Received: from BN1PR10CA0012.namprd10.prod.outlook.com (2603:10b6:408:e0::17)
 by BN9PR12MB5196.namprd12.prod.outlook.com (2603:10b6:408:11d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:50:37 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::dc) by BN1PR10CA0012.outlook.office365.com
 (2603:10b6:408:e0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:50:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Thu, 26 Jan 2023 18:50:37 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:50:20 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:50:20 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:50:16 -0800
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
Subject: [PATCH 06/18] util: Add iova_tree_nnodes()
Date: Thu, 26 Jan 2023 20:49:36 +0200
Message-ID: <20230126184948.10478-7-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT004:EE_|BN9PR12MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9e5348-0566-4b37-0bcc-08daffce36bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rpX5Y/W7JHsq6rXXZDnNBuAJEllupXoHysH4DI3caWFQJkaoYDuK6jyLgf52JTqzLaq6gh9gw2YLfiAJ3DZ7xW4UqhFGIbog/43NJHfJhuwNgJx/7XlSeJWMTk5/IzAOEfdnF0fUt0oyq6cK2PsHuQprSKA/NnwVqYYzRpgeO2u+2QGx1xYr1Qz/NxXD7Aj80nYYFXG2M3G0PY5NvTYCRA7x+iadLV8UZpchaqnJsIzEazORzyaGqO+IouKg/c1xGS0bjV6S8Qn5Z25jhnUqUliwJ+BxCdUySJdDTB333XNu0TtK8JQqxXkmTNY7eQ0ChJSm/JhaiytlRcqBpUFwm2OlQC2bQhZVo+mcaEs0QQq8URrnFE75xcmGSIehAwhNJQogI3NtOjoVYt070t2lei/XOlPD0qb222Nwx431KBoMzQrUeXH+azHzHaxYtB+F0LVsd1IEy9g907EECLugeWdFBjmEfqoe9wEReV7gDYtc746qdG9oPmWFJ95eBCo3DmrgmD9gCI7IALmwff+xdiz5p3T6kh7FAsu3sEMWksryME4ph60qs1eb18c8z7GGk8tctO3lWQlupagLG6MFrAUNCBWaTSaD6miGR5wk3hyHZDV3KVBYlEGtJzBtxBrPsUyoCBToHBtjX+GV2eYG57bNdSwnXkXSWflw7Bjr8OMiuHscWs9OErqoCtEQchCq9oX/uchDyblpu2raOnFvvQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199018)(46966006)(40470700004)(36840700001)(70206006)(316002)(54906003)(41300700001)(8676002)(7636003)(356005)(6916009)(70586007)(5660300002)(7416002)(40460700003)(86362001)(36756003)(8936002)(4326008)(40480700001)(2906002)(36860700001)(82740400003)(1076003)(26005)(186003)(478600001)(7696005)(426003)(6666004)(47076005)(82310400005)(336012)(2616005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:50:37.1045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9e5348-0566-4b37-0bcc-08daffce36bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5196
Received-SPF: softfail client-ip=2a01:111:f400:7eae::601;
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

From: Joao Martins <joao.m.martins@oracle.com>

Add iova_tree_nnodes() which returns the number of nodes in the IOVA
tree.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 include/qemu/iova-tree.h | 11 +++++++++++
 util/iova-tree.c         |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index 8528e5c98f..7bb80783ce 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -164,4 +164,15 @@ int iova_tree_alloc_map(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
  */
 void iova_tree_destroy(IOVATree *tree);
 
+/**
+ * iova_tree_nnodes:
+ *
+ * @tree: the iova tree to consult
+ *
+ * Returns the number of nodes in the iova tree
+ *
+ * Return: >=0 for the number of nodes.
+ */
+gint iova_tree_nnodes(IOVATree *tree);
+
 #endif
diff --git a/util/iova-tree.c b/util/iova-tree.c
index 536789797e..6141a6229b 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -280,3 +280,8 @@ void iova_tree_destroy(IOVATree *tree)
     g_tree_destroy(tree->tree);
     g_free(tree);
 }
+
+gint iova_tree_nnodes(IOVATree *tree)
+{
+    return g_tree_nnodes(tree->tree);
+}
-- 
2.26.3


