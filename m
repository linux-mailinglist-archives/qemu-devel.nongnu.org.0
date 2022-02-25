Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA34C5244
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:50:27 +0100 (CET)
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNkLy-0006s5-Rv
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:50:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFW-0006jR-Il; Fri, 25 Feb 2022 18:43:46 -0500
Received: from [2a01:111:f400:fe0e::72e] (port=3086
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFU-0005gS-VE; Fri, 25 Feb 2022 18:43:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6Yu8cGK5MILS7547baHHmOHgStdFqFoucWefDJiFnJa/0k2rBitwtDX6qxLvuunOLxln+AQ3razSM0Of+lbuOdBqJ4C3ICDY18YKwzuEEfmusC27RcMrIsITiA5vQai0BGDb2HS700Ur6USmCFYn3DNeUFXRFdhjIVbtEY3gyHgz03exkR0bPacRnQZ6RDlI8AOGQJW9zr3zLSm/WYiNKzoXElbfDlgsMb2yzsvouR4eFuvOKRa0VymLbRmbydq0zq07Xq7iyftQGpG8rO153NG7OQjQhVPioLteAvWiubVJFqLfq3bH8YGuCuOlYWf2L1Ma9dpeByu8l/PwxRcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VA7gD3vqPfqMhcfLCNGZ3OMC94fZQXbyiFV197DLGnw=;
 b=oP7BeYiGTXMZ+QANknY18GKRTN180BkHtgd78yZhyjEHO4XrKK27dNNnuM8Q1B7C/fIc/vh03iGY6r1iRxmk3elKpIp8CEgmSXpn47CYO+nh2Q+gUd2DhGC3t7k+YZOjRo1nBrSsLW5OqAAlxgtgqxcN8RoQk1VyrBgUr0ysJsZlTnjQeGuLVmwbuKs8UI4MR8B799MuYp9bFD0HrDsZFUqK0BnJKowzGPlsl4txrYA8+Ax8ShG2Ba0us9E5sGF081R1pWxdx1MGWoTKKhd00/aENohwIR6Nf6e1Z6khwrVODAHAMv0abW02rG9dv70ZwGRx8rMhpzm1/89AP+onkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VA7gD3vqPfqMhcfLCNGZ3OMC94fZQXbyiFV197DLGnw=;
 b=H8LJym60ISlOITq3p5j5ozMeZVS9+190IUAE4h8m3Vo0+nfH+nmygsQyYRNm/4pLlYrF71eRM6jvEZeOTC7+YP46RgVdzGAFV8otxjaWNZej4SoScPq2vOt1No0vMaOR3HSD/6vYDANpK8ZYrkeUSWqS/ylIOountmZgXMFVOqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 23:43:38 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Fri, 25 Feb 2022
 23:43:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nshirokovskiy@virtuozzo.com,
 yur@virtuozzo.com, dim@virtuozzo.com, igor@virtuozzo.com,
 pkrempa@redhat.com, libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v3 04/11] block: bdrv_replace_child_bs(): move to external
 transaction
Date: Sat, 26 Feb 2022 00:43:01 +0100
Message-Id: <20220225234308.1754763-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
References: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1c04a6f-ccc9-49f4-9af3-08d9f8b8a54a
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB4172E497BE05608B1E0A0AD7C13E9@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cv/Jfqocji2yX5vSUAmS/OI+mU/wXeHc3bvhBUJLrbaK81GxxflxLT+03fvXh+N3WcQxUnIU4FThNjdM8fb+8zoyxJncvIUhpYjMwQqUZmlQWYI76plPAgtVa4ZSP43vUcC13C1Z9fl+9oAOuetLrDCpnbWPE9pGdBLCJMeIIjEFOzALxlhOD+RKVYXELLMBbClJt17Jw7R22xtDEytD/bTpjnuWGu9XH88U6kpJCwc4KOIIxS/6FgnXMBZ6AM5MHZvgLEh4wS8/u5L3trVQGfmsQI39Z7rmhvYua04tKgJaHtseLnW7r64ufu+7J/n+fCVFhAsPmsiPXdeMy9+l8xEZY4735bazA2MHZi7l/vAgtt3seseVZ1a5KlWtuzzrA66d1gLtTpdc3yY7ycCI9m37874Xt3Q2zrbf6gz1R+p/JAeMNSk8GUVCSlTVeWEnwxNcziyBK1MkO/OVj82B+ijKjUKCEMRHnUaXTzh9Zt3PB3UMYGKhtdYab4aOkyvfMKb9BAjp1txyET1ZG5ddcOLGnMF2i6ZTYy5WPyk6l1UYmRZ5CAx4dHEJnDdf8Y3f02FS4MAwt/+MHxaRuUnEprmXqMnkcSbyu270BqGesDgTVdo7VKEP6fi7MtRF/Z84TCX+v85h3c0+Krthm3qcB9djyBoMcPmhOJeUll4n+plBAxJnG1LbFYt4tmwN2ZagdCst1B7b1UvZ0vNtZ1TxRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(6506007)(8676002)(66556008)(5660300002)(83380400001)(6666004)(7416002)(8936002)(52116002)(508600001)(6486002)(6512007)(2616005)(26005)(316002)(36756003)(38350700002)(1076003)(38100700002)(2906002)(86362001)(4326008)(186003)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0y2hBbaoe16Hm5oe6Iv2H1dGLDPzekTjyhxbSwhqC8FMKOuX6kUzsg377atU?=
 =?us-ascii?Q?uyUUFJZ0C+IaRQTo4nXFhDDGmkYnxMXU1W2TuhpQF3QnwNcnf+8BnJ8TZelL?=
 =?us-ascii?Q?7O7+3MAw9GFM/g7oaq4hshlVgRrgHYdLB29CK7JsmQagfvrLiWI0DT7mk7Gb?=
 =?us-ascii?Q?SvsiRR1OgFLcw59wKO+Eb2T7ZF3FRBE1777xelCnuwsY5hh+v/sWlDCFc2zj?=
 =?us-ascii?Q?KPjkLtYrdXci86Mvd0CvPusPf/bpuC9msO+dnfBQyLsNb7PLy4qJpYYxeh3Y?=
 =?us-ascii?Q?AbbVpkeAQuaV/u17wCtaEvKzb7F25xYntJY41XkBmR2qhKTQaivh0TUllL7d?=
 =?us-ascii?Q?Cs07izjz5TiQIvKha3Cg5FXFftoGOwAPBNXorpHQoFWTzB3RGbz1H22/j2B5?=
 =?us-ascii?Q?TK0ZpOZTt/HbC7rGvxOnI9EXP+BcJwdyMlzhz7Dk10POZp2jozYlsuHVT/zi?=
 =?us-ascii?Q?cl+/35/xPDNSAaA2orUMYkgjtCBT/06vjj+WBb50jj72rLP+34fhMDFwsFJc?=
 =?us-ascii?Q?Yh9rgbVpZiIJkUVgaI75hS7Y9fnAIZrV7omL7KWsWyqnngoeMsIQAHK0cOIr?=
 =?us-ascii?Q?o1ffrx33fKipNSEQEhyJhRQCv08TN70rEnSoSw2DWoDrKY/+OhvGjmorZ6JZ?=
 =?us-ascii?Q?uw0Y9P8vCqbDBQqXgk2wTiA83huUBh7ERCpYV5TnOZvDcJCSkmRNTrdwbrYb?=
 =?us-ascii?Q?yd6AmCC0PCujk3gJrBwaoM4PauIdjqpj99JzRz4olmnvb8P0m6fhUf2Pi2rf?=
 =?us-ascii?Q?YZ7PamXeVCKv0Jzs3ztilnI7hjevLJf/Y6Fxv5uol+shBwDoUotd83QtmF3f?=
 =?us-ascii?Q?9Truq3IJrGrBAaram3jj2BkmoXa3WfnlY2Z8RRpzaOjfi4mabVn64rtP2BBc?=
 =?us-ascii?Q?5wApE2bM491egS5bSfY2KvkWqWwbVXsLcvE4EUB5Tmez2VNKgrU4OBOLrIT5?=
 =?us-ascii?Q?b9Vk1eEd7Qj3VHCN5OHuceNk0ES+slmMZUl2yp+uhlLTzXKbM+BoHDqwWCMD?=
 =?us-ascii?Q?k2MFNQPQ0QY3VmtRYz7mH/op6zBfEgyJQ1Oo5j3t3+T9mAgiQctSaUqNVwte?=
 =?us-ascii?Q?JJbYvRxWGoyqoUSafWa/7/45U55FjatCzPN167l4srbJCeayR0YQO/4mdggm?=
 =?us-ascii?Q?ypQXddbGwTy4ipMFRSbP+AnQeTQD7hCLf+YvRiU4YNll7tZJRwowV/AUFiu1?=
 =?us-ascii?Q?b4/1c7E2q4sUzZdX4sMoXYKORrqAwjYCKcJ/OxwW6Oio3IRXGn5L2gzxYW5e?=
 =?us-ascii?Q?/7k/cdsnfBqJ/O/rJaT6c3S73jn6tLS3ZS6r2FLQdfeX7O0mHVVbAbDVfTn7?=
 =?us-ascii?Q?JpnM2hGsL1srj0FjE+9WOXQWmjVtcqaF/r5tF2osYUxrcN0urEVUja7+T4dN?=
 =?us-ascii?Q?jB7LDBa++0LsY5a89QPBY/UqnHlo6bIAXm0n9ZNCGQxd13Baem/+TPhjDXtg?=
 =?us-ascii?Q?YLSwTnnbqS9RfQIN8/3cgP50/iJWph6B/w3k5YUrpwPap5llOLVrhSAfiUCZ?=
 =?us-ascii?Q?EcJLWXC5ttwDXF4dESvTOYLriWHlIEDLfJilvjIGUZ6la1YVqFEtkM/41+Ob?=
 =?us-ascii?Q?oJBW6bOJ2YPtfIs4qScSBmQigutn+hpM7/r5v5GompjGJrYes2D3tQX4dCa+?=
 =?us-ascii?Q?5bqP9nU4UKlb4uCJIvzfKJnl3cMq+GZbw9AuQQJLueitKc1lU+ELbjtR1uBy?=
 =?us-ascii?Q?XBSjLkkvq3U2brVgdJrrcBE9+js=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c04a6f-ccc9-49f4-9af3-08d9f8b8a54a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 23:43:38.1217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Hunq56/z7yUP/ED7uEyxQ/fZJTIqt+pwK59DjzAkpmRiL2jlyCdDCnefmfLHgNiRf4Up9OQsFEeX+EQeMfMzBlVs15JQ0+BN/y0lXMhHys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::72e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

We'll need this functionality as part of external transaction, so make
the whole function to be transaction action. For this we need to
introduce a transaction action helper: bdrv_drained(), which calls
bdrv_drained_begin() and postpone bdrv_drained_end() to .clean() phase.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  2 +-
 block.c               | 42 +++++++++++++++++++++++++++---------------
 block/block-backend.c |  8 +++++++-
 3 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index e1713ee306..1cc1f736c7 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -362,7 +362,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
 int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
-                          Error **errp);
+                          Transaction *tran, Error **errp);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
 int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
diff --git a/block.c b/block.c
index 601fee163b..b2f55ff872 100644
--- a/block.c
+++ b/block.c
@@ -5204,19 +5204,39 @@ out:
     return ret;
 }
 
+static void bdrv_drained_clean(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    bdrv_drained_end(bs);
+    bdrv_unref(bs);
+}
+
+TransactionActionDrv bdrv_drained_drv = {
+    .clean = bdrv_drained_clean,
+};
+
+/*
+ * Start drained section on @bs, and finish it in .clean action.
+ * Reference to @bs is kept, so @bs can't be removed during transaction.
+ */
+static void bdrv_drained(BlockDriverState *bs, Transaction *tran)
+{
+    bdrv_ref(bs);
+    bdrv_drained_begin(bs);
+    tran_add(tran, &bdrv_drained_drv, bs);
+}
+
 /* Not for empty child */
 int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
-                          Error **errp)
+                          Transaction *tran, Error **errp)
 {
-    int ret;
-    Transaction *tran = tran_new();
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
     BlockDriverState *old_bs = child->bs;
 
-    bdrv_ref(old_bs);
-    bdrv_drained_begin(old_bs);
-    bdrv_drained_begin(new_bs);
+    bdrv_drained(old_bs, tran);
+    bdrv_drained(new_bs, tran);
 
     bdrv_replace_child_tran(&child, new_bs, tran, true);
     /* @new_bs must have been non-NULL, so @child must not have been freed */
@@ -5226,15 +5246,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
     refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
 
-    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
-
-    tran_finalize(tran, ret);
-
-    bdrv_drained_end(old_bs);
-    bdrv_drained_end(new_bs);
-    bdrv_unref(old_bs);
-
-    return ret;
+    return bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
 }
 
 static void bdrv_delete(BlockDriverState *bs)
diff --git a/block/block-backend.c b/block/block-backend.c
index 97913acfcd..dbbbc56b2c 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -892,7 +892,13 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
  */
 int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp)
 {
-    return bdrv_replace_child_bs(blk->root, new_bs, errp);
+    int ret;
+    Transaction *tran = tran_new();
+
+    ret = bdrv_replace_child_bs(blk->root, new_bs, tran, errp);
+    tran_finalize(tran, ret);
+
+    return ret;
 }
 
 /*
-- 
2.31.1


