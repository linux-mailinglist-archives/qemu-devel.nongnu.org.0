Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E74169FA70
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:51:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtGF-0000SA-Ec; Wed, 22 Feb 2023 12:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGB-0000Pg-Th
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:33 -0500
Received: from mail-dm6nam10on20620.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::620]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGA-0004bD-2V
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhEGE/5iHtS3s/nzzZMCg8fVHGaAyskVqr/7t6ZGzTPRY3Neuy/WxlMWyTH0VVU1gRqnAdJaPH3ZhgX/bepTF2Dfk5ygOpmrzntheDZkniQTyJaPP27kcd8K1TqZzNHH/8SWY3TArMX+DEwV6L/E+/UJD7T+1HyI+/e39ATSHSq4hIZVAn4FKVRzHijJAip91vTAyGg1P+Eck7UHS632CDi4n7hyPU61+/RJuoZcp4Wc4kYSqUNo9ibSNWTHPth8myshO+ZyNmOsoDKJkX0tfupROUzvDsSa5QkuZeTUHOQMpF0+J/E1i9c8jgjUpDdZ5tCQ59clIyDqSfZQM5umhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cfvXnQ252Sk3CvCMBgvnfON/9JW4CEJ6dnfYcNSIZ0=;
 b=drpXsL6WrwlWEtu5U6K9V7+GSv1bl5WV3zItbXTJJMRi3d0xvmCIJL2lkpiLDnR5W89Nn8YWXr+gtPJPOmTw3mLmHrt0x/hoe2d2yBpcXupMj+7/gkXifayIK+HpwPeM4mMEvBNPuZNliYJ0dLqzm8BrWDxYT5HrE7ave8hIvxykz+CtWDuGX8VfdGtJXo8TSI0Js+L3w6uvkLxWKO6aOMcoXgZMN0wdlLHwOq1oknBgYRG6DxJpbRPswCVlh4n0JvDK1olRqHH9dRzoOTykbDD0CeCYZBohAXDJGD8q8/w1+vmkBEt1XAZqhDzPoJzuacHQMP3yBPQQWMtmnLg2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cfvXnQ252Sk3CvCMBgvnfON/9JW4CEJ6dnfYcNSIZ0=;
 b=VSmoN25VbvXNAwqcopjQ06wCFJP4fzl8wm1hD1/lhzqe03oq7rhjb60vfVdLBr5ihMpK49vMI3UWu2R/oGjBtwhJYJ6QJ4PwEC+GX6iGLWnizRJchJ8EvnuxxFfg1UgjFjnC0sh6avR6pj75U8d5tDs1XRq9AvJ5ufIB+b2AIIJsX5oLFCmOUjw/osMYb4ZTa3rVSmZOljZglWo4k+29krIDzUAhLX/w6IfR4hpMys1Ns8WjU/9OIO0qw8Ao4AW93xuuOFib9YYBqv4qzgcwUxXEI/WJdmAD3Y39IvRuZgT7/1ZcOtycVWliCjWPax+cKtWknXvnmx734Rp0yUJ/rA==
Received: from BN0PR04CA0071.namprd04.prod.outlook.com (2603:10b6:408:ea::16)
 by DS0PR12MB6463.namprd12.prod.outlook.com (2603:10b6:8:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Wed, 22 Feb
 2023 17:50:27 +0000
Received: from BL02EPF0000C405.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::e1) by BN0PR04CA0071.outlook.office365.com
 (2603:10b6:408:ea::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Wed, 22 Feb 2023 17:50:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000C405.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.14 via Frontend Transport; Wed, 22 Feb 2023 17:50:26 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:14 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:13 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:50:08 -0800
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
Subject: [PATCH v2 09/20] util: Extend iova_tree_foreach() to take data
 argument
Date: Wed, 22 Feb 2023 19:49:04 +0200
Message-ID: <20230222174915.5647-10-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C405:EE_|DS0PR12MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f67b00-9884-4c8e-f535-08db14fd4810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: juqMoWJEE53jfOyF0WTUM4PUM7/Ms5yeWdUDoqK5eNyuP2hdaPnLJg5a+VUJRhnNyoEq0RPCuubYBK96UcURdrUC+lRSiWloBcQJGJKHKYastJxSHVCsXb79Qu8BoNr9qcbopNWe38kUfIMndUrAwhc7jADsJP4F8Zg1sVkoUNM5NtMZBKfzFLUXpdSs2oFVsq8iL7oAOQSVXPeoJtUFdlnuEvsw+TKlE5/7kCy4fbXN+lHHp/dpsPoIvyail8D4IrWA2+qGBBspwlK2YiBDl9hW3L6WRXDUWBPWvYga23bqa2I1FmHalYbmApfiaz4oDqEPJ3GagfhbY77MWRPv1Eug6cvXPoUrxb1DLNIkHjTcU5i4uZQKJ5TIo9qJ5WtK6spr6ZACsnqsb2dhlmafpUdfBBBE+UtSWvPuiFYv5/ZwkpuZTR9p5rYvDv1dyfrQ5kKCRH0rfoo9ASWPvKJOKnS7rIUyXZIT8Wm+/QNX0KhwpLco2zk8wYVPAP4tLCvyKixOxNvk1l5a+NEtRbBI3DhcSTK13S2RTJOfWtiVZdtUCjIJwE7o0DwaHnBaZonoz+FYIVQsRQZXSgV/otBtb539pRPPBixkVaQw7J1Feg0rtzgaGJ5YTYOu63q/jnp4rQ7OofR/K4t7awWnrfvbVYEni36CjOTlJKv6hxlvfMuhA8lpdvA8DsqTlQWRJtk/T+jCmX4Fcj1prt+HLfGkxA==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199018)(36840700001)(46966006)(40470700004)(478600001)(40480700001)(70206006)(36756003)(316002)(40460700003)(54906003)(6916009)(70586007)(8676002)(82310400005)(6666004)(8936002)(7416002)(5660300002)(36860700001)(2906002)(41300700001)(1076003)(82740400003)(83380400001)(2616005)(7636003)(26005)(336012)(47076005)(426003)(356005)(86362001)(7696005)(4326008)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:50:26.9378 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f67b00-9884-4c8e-f535-08db14fd4810
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C405.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6463
Received-SPF: softfail client-ip=2a01:111:f400:7e88::620;
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

Extend iova_tree_foreach() to take data argument to be passed and used
by the iterator.

While at it, fix a documentation error:
The documentation says iova_tree_foreach() returns a value even though
it is a void function.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Acked-by: Peter Xu <peterx@redhat.com>
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


