Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE0D69FA75
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:51:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtGO-0000bt-HB; Wed, 22 Feb 2023 12:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGM-0000bP-4Y
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:42 -0500
Received: from mail-dm6nam10hn20300.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::300]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGK-0004cn-9r
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmTlLtzR9ZWxI8SEuJcRQlPCMSPWF35RIxRiBIQ1eyLIH16Rc/oGmuDGlUzYABYWoHoM/vQisLXlzIHPipfNBeNOnqq3bgq5acw9Nhexg7jsf35/HLQFer0hSi/U/1S1fIbjer1u+sP6e+8OUVT2vElVZV1gaEUC2OAOV/blPv2ChYV4yOP4MjYUKwowHdXax8jZG9n2Fz15q3oMf58494h5PDiGRZGQR7DGc41V70nqq/JaR7AKafUM9U9P7aThDnzx5Ojzw0acgALTNix5B/NeI447MFjgquC6ro6iSD5fRl2m1HiV5zJ/hXLPWHv9Gc+A/ow3bDz0mhySCbygiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6u07zgrVbZiMR+VnEnnIjBG6o/OUltURcQu6o2j/Oo=;
 b=QjGszwfm2mXEiiPmXGctCToVCy7RInc9VCYYMFau0fF858Ztlc08KqG/tU38RcshcbR+kelCZ8EQ0wsc0j+S9Lo6GU9TUI/uDPuKYySENY/XT6jtK49bqkbwnJtvI+gmRC3SEUnPSquN0gq5sPBDxYc5MyslrkR4HXDFPG4vKztzR2XIp5EF5tmFilNJnPqNvlpXwT5rWUpxE5kiNlxqn74aYXlBBM+3XjYUGw2ksfPjsR/Ip6iG6R6k5E1FbU4rnnprgmkvPmV5d5ioPOWq7FCSjZAa6osnvntJkJACIDp3VRcvbwLOggETp2VVn1Iy3Tv3g+YAvVo68IdZbCOkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6u07zgrVbZiMR+VnEnnIjBG6o/OUltURcQu6o2j/Oo=;
 b=r4J/GfXFN9fgMzU6LeDdnBfi342AiPlxg6MAkCvp9BHs/ttZQfm8i9UsIf+fa005RuWmyUYQy+20uE7te16zcDN99p+inY50PKFkdLWqZ9p80eWdwKB69iEjpDaKVMFWSKfCP9z0eVRqr1s83lyOa2G+t4WuBRBSQjFHetstgVVcqtcABFHqFTOyGQubNknqeGqjHD4oSG0/xirc+0byI7VFndKW5vsDM6hekT1R76HDUHZgts1N/Sqrj8UkMB8dXxwpm+jv+LsA25hkhQib/ZUkXbRwodKzaL/4zIupYx04AtkoBr3krM70J9mhlnyWcQYuqpuX8+Bh+nFXEphzeg==
Received: from MW4PR04CA0128.namprd04.prod.outlook.com (2603:10b6:303:84::13)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 17:50:36 +0000
Received: from CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::2b) by MW4PR04CA0128.outlook.office365.com
 (2603:10b6:303:84::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19 via Frontend
 Transport; Wed, 22 Feb 2023 17:50:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT068.mail.protection.outlook.com (10.13.175.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.20 via Frontend Transport; Wed, 22 Feb 2023 17:50:35 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:08 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:07 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:50:02 -0800
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
Subject: [PATCH v2 08/20] util: Add iova_tree_nnodes()
Date: Wed, 22 Feb 2023 19:49:03 +0200
Message-ID: <20230222174915.5647-9-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT068:EE_|MN2PR12MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d31fe87-d791-4a72-f962-08db14fd4d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jVGfEGnp1YFCtYZ0eHXxkzm/sBdG2j+Rt1xJIh02RqeIiFCpEqKLrRu3eJwAj1ISr1b+1l3xej3gzcBF1FFNqP+msaYiV7p6jxVz90EAdD/5J16WYIxsFzYXwOpChyhbIVBP3/e3nKmfK5HxLhj9klWMIYtB/RZB2pfBUYcJnb1TWumWR3ydniIDUNlZDdUstLomkPu3RN1tAIBP9eajZuMZR/eztjWiLaQ7MeZ411z9xNEBKavbiIWO7+UoCHczNEctDIV1tnhzJ72aKbiHMk8YnyYaZLVwEbXdzVFE27Z1joEEkJth9x7k8TRKiUBdLIIXO7xWzela7iEZbo1h8HrHfJFMjce9GrqU4TJQ8ng/hRq+XQ74xsUjjnsPKdxGmL6JOS3fS1pqusYihafazr6wB7AqErpUyQQpKM9Y/pCPFE+mxI0c6dJA/gAaD3m/Zo1x9BjfWBSUcmaR+O3YAyyF3LoYhDKRCs82WvT+DQIhzWYy07dtlGVXB/1RAbZsCSN93Y8l25M+HKO2LxgBFiVeGo4/Dvx4lxUYnIwMmUTI2HQ1jxG0ckjKGHWBadwBjnpCDsNOfqNQ9bcHpAc27DboWbmwc3np1Hgm1r9qIS24iBl3rS7fMf87yyLwN2tVuPIuOw8JZIcF7jMC9pkDHpuN04AJegh5xq+CcHk1/2AvZr2xuLfaSkV+3p3lbP5UCNcdt0FR0YMqHM9SOKqABZPexBSTNaReUjtyQKsnSyj35pziQPy2X1K8+fqebmMJTGMwRdWbbltTnj2sUBqSiQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(136003)(39860400002)(346002)(5400799012)(451199018)(36840700001)(46966006)(40470700004)(7636003)(82740400003)(316002)(41300700001)(186003)(40480700001)(26005)(34020700004)(36860700001)(426003)(7416002)(336012)(47076005)(8936002)(2616005)(356005)(5660300002)(54906003)(478600001)(1076003)(6916009)(40460700003)(70586007)(7696005)(4326008)(8676002)(70206006)(82310400005)(36756003)(86362001)(2906002)(12100799015);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:50:35.7242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d31fe87-d791-4a72-f962-08db14fd4d3c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144
Received-SPF: softfail client-ip=2a01:111:f400:7e88::300;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Acked-by: Peter Xu <peterx@redhat.com>
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


