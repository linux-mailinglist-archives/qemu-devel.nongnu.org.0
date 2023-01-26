Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F4B67D4A7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:51:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7KV-0004Xh-1k; Thu, 26 Jan 2023 13:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7KT-0004XH-IN
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:33 -0500
Received: from mail-bn8nam11on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::600]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7KQ-0002Yv-31
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByXg3EeduBnLh/ZeGBryBb/Ysp3D0EsVOi0oxe/fwUQEtT+H+v/OWgBIyYAfR4na2FfRgpticw8dO0BNh1ayOKUwu1D7bhLV9pIWCg6TFbx+jd9UhzRpz3QCCD/Hy8C4akRUc2KdS8C5jjhe/W6HDljFP1WNJa50y2NcD7X+IB8rgRDON+0fRwCNfVZSwWgvmKxizQv/k+n2oJdMIglnIyvfCVbEtl2lu2UbYVf3+kluAVVU+2a14fLdgJRQddKuOHiWdibJd+CTE2G6tUhrkvd+2ujROl0NViRA3y+FbNz4eFfD6+gWgCo6CK3i95YV/L9fl8pWudKtRdppE+vO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+b4GN+Lj86ioZsZiH/9lvinX0evvu9nbrnzBNdUx9o=;
 b=Oeycili6HGoB96ImYOnQj5A2oHuskf9eXxVb0aKbwKW/k7Xqb2fn8vuoo2834g0aU7xhIDVVXw12yukHbMskjf9FbSPnK/yP50yIbI//If79dctrJ98luk0+ogCwsfobcRASH0gm4a/dhalWdam2yNLj2KthTIaE1wksxAcMnlaSVBNq4+Q1TSCM6cAlEhPmBc3V3/kPa82Ncz8Av3N1uDLM7UAK7xnFf43XfTGUh/qAjvK12psSIrlo8yIOHv+UmuSZ1dMvjeDKyBxNt34kEEDqXr7G516N1g76bYQZUJ00d6DSa2lYELUv6XRxtvx+2okgivbjqVlFVPj1wEGHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+b4GN+Lj86ioZsZiH/9lvinX0evvu9nbrnzBNdUx9o=;
 b=W84oNAHJsyliLYx/Cw2L62JiAzeUhN6M/CWttEhYd1R2QvjfU4JBASU1HOkNEMMtuipUuL6a8+8NsohtMuVZSxyLBWEi7/hZOg2UCHmzOHB0gvYa6hyAclrOLBmFopDiJPpFp8OPrFAecHfOmGmdUa8UD6V36844FcE6GLYrg/xnCmFz7aXXc4I/cFPLx0XNnZlncWfwjVdstpOgQyws74aeH1EtBWnkOvgWvjSKxb5JupSxede7n6e+F1+taqDDFtq0nzxLI/oV6bGpiwyv8LMVWjzWNSfNTAD4wORwFxiJLiwZlSHc8GEnevWBl+hQIyJl5xI/S5ZlIzPe/OHAjA==
Received: from MW4PR03CA0335.namprd03.prod.outlook.com (2603:10b6:303:dc::10)
 by DS7PR12MB6165.namprd12.prod.outlook.com (2603:10b6:8:9a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 18:50:27 +0000
Received: from CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::ea) by MW4PR03CA0335.outlook.office365.com
 (2603:10b6:303:dc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:50:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT086.mail.protection.outlook.com (10.13.175.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Thu, 26 Jan 2023 18:50:26 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:50:25 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:50:24 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:50:20 -0800
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
Subject: [PATCH 07/18] util: Extend iova_tree_foreach() to take data argument
Date: Thu, 26 Jan 2023 20:49:37 +0200
Message-ID: <20230126184948.10478-8-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT086:EE_|DS7PR12MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 0829c7bd-d53b-46d5-9a89-08daffce306c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ceZD+x6UspjGNo4cvqf/xqH399jR6hQ6sGsNLnicx97sQZlGoueF/GWUxuv8vZHVPHQRDDeN9GW+awPr+YU2FghPZhixa00mbXuUb5uvXwgsoBv6YVbPTZpgdw5r2aDrBJjt0b1O7smziiijJJwVSNthiamMcaW0CJQIX28tfrNCymN27x8dqmIzi9Tq9OhpuhxHt+BhK3cfqZqd6v2EXpbUZPNspGu5ZdzIUsM0PNF5mbIYGlpmbbB1gj/SvivyBMsF8aGbiqulN4tmY7Y/jANZdd/+ZzsEBJTnO1Ws9siGEkp63vhbEGZrMUe02ldWwtXqa6ZVCvV+/DtJwkjZ/meDP6dGxlnq5qK6TCCq6EeoMYmnK0nsqWDMz7LOVlzHUrfdcU6yUglV3b1jtAaybZjROib6aaJRfv+p58sbHirDzZD+kR46Lk/APad7p48QgukSeOp73W4mCDzKqm+ZYiwexWpslFr+pcWjkcw2ty6QG2pqKq66M+mPRDFRJvck/TlNlFPHLS1x2/nKVGxs0dFq5yocZhhZ1LvaeU+42ObddXZlhI4YlBc8dmmZgkd4MLPz/24oQ2lQuKx7+M/7VwHUJEfIcSYMR07urvG7BJVBPS4QKEgYGQTXRttPWZFpxUqBJhg9NbsLlE18A/vOkajDsQ16aHD2I1DPh6+QN5pWEovs1mN5Kro8+kMHPxyL7nnrtildtacFBTS6fdKyqg==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199018)(36840700001)(46966006)(40470700004)(36860700001)(26005)(356005)(83380400001)(7636003)(5660300002)(82740400003)(7416002)(7696005)(41300700001)(2906002)(86362001)(82310400005)(8936002)(4326008)(40480700001)(40460700003)(6666004)(316002)(186003)(336012)(8676002)(47076005)(2616005)(478600001)(54906003)(6916009)(70586007)(36756003)(426003)(1076003)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:50:26.6178 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0829c7bd-d53b-46d5-9a89-08daffce306c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6165
Received-SPF: softfail client-ip=2a01:111:f400:7eae::600;
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

Extend iova_tree_foreach() to take data argument to be passed and used
by the iterator.

While at it, fix a documentation error:
The documentation says iova_tree_foreach() returns a value even though
it is a void function.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 include/qemu/iova-tree.h |  8 +++++---
 util/iova-tree.c         | 18 ++++++++++++++----
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index 7bb80783ce..1332dce014 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -38,7 +38,7 @@ typedef struct DMAMap {
     hwaddr size;                /* Inclusive */
     IOMMUAccessFlags perm;
 } QEMU_PACKED DMAMap;
-typedef gboolean (*iova_tree_iterator)(DMAMap *map);
+typedef gboolean (*iova_tree_iterator)(DMAMap *map, gpointer data);
 
 /**
  * iova_tree_new:
@@ -129,12 +129,14 @@ const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova);
  *
  * @tree: the iova tree to iterate on
  * @iterator: the interator for the mappings, return true to stop
+ * @data: data to be passed to the iterator
  *
  * Iterate over the iova tree.
  *
- * Return: 1 if found any overlap, 0 if not, <0 if error.
+ * Return: None.
  */
-void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator);
+void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator,
+                       gpointer data);
 
 /**
  * iova_tree_alloc_map:
diff --git a/util/iova-tree.c b/util/iova-tree.c
index 6141a6229b..9845427b86 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -42,6 +42,11 @@ typedef struct IOVATreeFindIOVAArgs {
     const DMAMap *result;
 } IOVATreeFindIOVAArgs;
 
+typedef struct IOVATreeIterator {
+    iova_tree_iterator fn;
+    gpointer data;
+} IOVATreeIterator;
+
 /**
  * Iterate args to the next hole
  *
@@ -151,17 +156,22 @@ int iova_tree_insert(IOVATree *tree, const DMAMap *map)
 static gboolean iova_tree_traverse(gpointer key, gpointer value,
                                 gpointer data)
 {
-    iova_tree_iterator iterator = data;
+    IOVATreeIterator *iterator = data;
     DMAMap *map = key;
 
     g_assert(key == value);
 
-    return iterator(map);
+    return iterator->fn(map, iterator->data);
 }
 
-void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
+void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator,
+                       gpointer data)
 {
-    g_tree_foreach(tree->tree, iova_tree_traverse, iterator);
+    IOVATreeIterator arg = {
+        .fn = iterator,
+        .data = data,
+    };
+    g_tree_foreach(tree->tree, iova_tree_traverse, &arg);
 }
 
 void iova_tree_remove(IOVATree *tree, DMAMap map)
-- 
2.26.3


