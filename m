Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92F633F3D4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:07:21 +0100 (CET)
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXlY-000410-QB
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIF-0005EN-FM; Wed, 17 Mar 2021 10:37:03 -0400
Received: from mail-eopbgr10137.outbound.protection.outlook.com
 ([40.107.1.137]:61154 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI4-0006nM-9P; Wed, 17 Mar 2021 10:37:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2IX+o/84RPoI278synmcrMBWmUFq5PENe7wjowrTBFA4/aWACytmmhtUbJwDXDCDqlnTuFgGq17qIH+EeleTny9Rj6nd/ryAgRUj4m9z+YhKdCL2gKcWCkaIETBmH88XaKfYCEEESzT2wGMmt3nifuXoQRiS+a3468nX1tJPdae+G6f6ZD48pgAOk64L2OFIpDonVmc6aL9HzV/J4SJo01j0sLM93prbknq7ivd6bSNFpPBHm5cwleciZPqXR8mz/I63avKtYe5tqbK9byF0b/pP83xBNtFCbqneoapIPmwqpYQmb+JnhtJ22qQb1x4GdndJrggBE5XPRFd0qDNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgOTkDm7vxV0ldJFl7lvkhfEgy5mIdY8S6HcGDtnfq4=;
 b=RFZWzvGQenrkfpdH+pZFJ1YVfw+UDxVnSa7NzedZL4MXJ+uGbbTLLcTyZm2ZLB38QfdAI/u92jLsgqH2lUFg0vSocT3d+dalf7upW5fZm0olbyQvp3vxEqTCI9HCVpdrAujjyap8eRTneQmP6caVfxKZmdGSah2G0ZpFXDNHW8I7Nqb1vmqnrZZcfJsX6NPBaf2qCj/Si7hBTbDkU4rgDN7rfIbGxAUNwpLY19+0zlizArAApopS4HWuTDzM5nJyDoJx106ZQ/arTNweibJb/he9/Yif4xfxdaLXJbVCaTtrlilvO+XXBHg28G/tSH2dX0AxMe/OK4d/Lk05cbLY9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgOTkDm7vxV0ldJFl7lvkhfEgy5mIdY8S6HcGDtnfq4=;
 b=WrCf2ssl1wYirQaTTLVBHWJ9dQ0WclJlUdtAQuKODZmXplJEzki5dJKcygKNdTvRsk6aAxooG8gu508wnFbIMjGd4LniG1XPFMxJs1ue83YQnQwy0Pd2bOT7En5cU/5QmOSbfsXq7wCi1XRXm45Q+eUB9yMfbwBZxdxEOA1L1k8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 15/36] block: add bdrv_list_* permission update functions
Date: Wed, 17 Mar 2021 17:35:08 +0300
Message-Id: <20210317143529.615584-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 091d4b33-6a1c-48f8-fe15-08d8e9520a9d
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1650F7A600B43FA44E32BA56C16A9@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dYlK+riRDHvUmnk9o3xeXYGQIfCy/3x4vkAj3U7lyT5cBRMvbGclGStrBefJksqK385gbq60MAHR5DKy+W6JJayaEDkMoN+c5Z0ultHCxx7midRcSWXe0Hf7KTgyN/xVbmqASghrfx2N+r3rVkWVejHWWoIKxiPqvGelZpxFDrl3YxqVe6DPE99hf8b4SViFv4VWMCTTndmsOB9vbqKKtg8HLo4DPFLq52OkR53EMheUd+tjagfEHQ+mmzJpSD6yyD6e44CK34XXDtQMfQqhIUbQmEikkGSLeHzdtZrien0zIZDrFvP0EDf8l1SIYhn6ZBfP4P0SN/z+WJG3eGBNXMt6qH28qYAYX7S3YXwyRoDCfqBJZ8YWt7t2xhYMoqy2Ki4JZstNtxf2S3ub7+g6EbmmebUUkSmqruyNNtAJ6tP1ei+ihL5Os06sTw6lH07HybmW71GcaFPtjh2sAjEsljbu7OkjshdW6laTx08T/LXuLUfhtUTiE7W7T789OURtPUs9OHm8/oQptsN4weqkIiSWcwsHSFnLrvZlDzrhj9yT6+WzQT9nknYxNLgIkcsn+57LmdX2Q79f6mFm03U02lEGAXhV4krJcKsHgx1TRzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(376002)(136003)(366004)(316002)(1076003)(956004)(6916009)(6506007)(69590400012)(66556008)(66476007)(6512007)(26005)(4326008)(5660300002)(83380400001)(8676002)(52116002)(2616005)(66946007)(6486002)(6666004)(186003)(36756003)(16526019)(2906002)(86362001)(8936002)(15650500001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cahQYcavwsBytr9+k+kolMzj9048OF1fJ3MZKIxixK7XheawQDT227I/su1J?=
 =?us-ascii?Q?nmvFElAg1yGLlWaK+khCnsB+mB78gRRYwMbQGlCfkll+MYr8+uTR5RBiLiLs?=
 =?us-ascii?Q?/tcszRvOYSNC0OINBc1DsPCP/904HRSInUq/EJ9vseltwea2O67vy5uQPgOI?=
 =?us-ascii?Q?KJZ5RAglOAEzkPqiS5UOJPemiXPdTxBKbhNmmMEFaEk/X9PeIjHE7m5NcrCY?=
 =?us-ascii?Q?Fts2LarSE2JNX0D7Ia5T8kLqkV8gZ8LrsbJFbVZf4y/lCAAd1DMdDxHH9A9W?=
 =?us-ascii?Q?j/yiBilqTy37QrXNzCE5v4RKdeOBk9LrzkQCZOx+DqH4C2CAqo4h3wPa0Oce?=
 =?us-ascii?Q?Dmxln0RjQooswDSObTy+e8hJKZeolvCVSWBj+lt1sObiKZDYOhuoc2k+IJ5I?=
 =?us-ascii?Q?+cGEbH6KSNoG3cxsRTYafLh/oNJfMaREhihKlWbCRaHqXTxa1gf2lDe0L0ns?=
 =?us-ascii?Q?luJuapQ7kMNp6e9iOJIpUuGTNPKkvcYU/slCJht9lfKQdnNc/jfSkEQ+1DIu?=
 =?us-ascii?Q?Cuoitb+S83xDDL2kribVgKvf3ZT1b5HEfE24JmCEogaKwzwl6OzUhSjGd1hc?=
 =?us-ascii?Q?Lh5PpBH8ejn8IVXOtOdRvJly6VS9bfehZc/bVqMrj5KgHPSZzlbr3yjgaoxP?=
 =?us-ascii?Q?/XETOjVS/atTJjbKQHHgqGEfMR9A9pYHDIPRaW++TNPJAj5Wn0dLPIBjPW0I?=
 =?us-ascii?Q?9qOTGHky/37PqGJn3S5BBkpC0qiGKnGdXG0sYBBAN3FkPgttAnQrwRy2HzLL?=
 =?us-ascii?Q?Q1FGypf20IhMxrDSQ2ZYEoHsC6elih08AVLQuDV46d1n3oi7otAvadDw9+ob?=
 =?us-ascii?Q?CiwuR+Bc0gPgoASlFLo/v1uZyoaHj8orwsGEoNJTkIdbDMxiLPTE23vMGP5Y?=
 =?us-ascii?Q?il7YPjH+dSOFSCjukTUOsTe8WQbkudnEAi4MkdSBoOpntmk2bTXQlD1gHrpW?=
 =?us-ascii?Q?CF88WFGaDb1IeFrJD9kpFy+nSv5ymPM9SlfunUzu81aFlrYUPd+lrM8KSoeO?=
 =?us-ascii?Q?F85rQxkzEMsvOlTjy1NjyQrtNCUQG7PE2LpBChlKQCG+8svf9DN1YNywCifU?=
 =?us-ascii?Q?te/5hLQgb5F/AsgIDs7gSoYyZkmIAFbOYnNf8FpEOkIrwcVZch8ofaiI/fWH?=
 =?us-ascii?Q?FFZOAPXcMXdPU/pS7O6OJZ+8MLFtr6Sc2ukhYmKxyRA/egM6UWIWBG4Jgcr+?=
 =?us-ascii?Q?6c+zo9IgOGe2cG/cC+a7R6xDWWAxbXO1PCWOrZGhhewAxx5hQ8+Mv5dIFjzw?=
 =?us-ascii?Q?i7eRPE4bOUUf+Q8InHS0x0p9ua+451aS9p+2lktFd/Xa/zrIFSNDPdRqfg3r?=
 =?us-ascii?Q?tdCl9n8NNibSMEwVT6SwVspL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 091d4b33-6a1c-48f8-fe15-08d8e9520a9d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:24.9513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KsDuSLcHO11qoymLal6pxMbdFWNvTzzvN3XSRGTX50JpXHbh2gnQybIJ2FMxIvGVPRGGeeRAQk/FYcIAIABW2VVDbjoEQG2AQ+tb21+zPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.1.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Add new interface, allowing use of existing node list. It will be used
to fix bdrv_replace_node() in the further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 106 +++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 35 deletions(-)

diff --git a/block.c b/block.c
index 337b515034..31a4e4fa5c 100644
--- a/block.c
+++ b/block.c
@@ -2215,7 +2215,8 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
 static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                 uint64_t cumulative_perms,
                                 uint64_t cumulative_shared_perms,
-                                GSList *ignore_children, Error **errp)
+                                GSList *ignore_children,
+                                Transaction *tran, Error **errp)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
@@ -2263,7 +2264,7 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         return 0;
     }
 
-    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, NULL,
+    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, tran,
                             errp);
     if (ret < 0) {
         return ret;
@@ -2282,36 +2283,53 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
-        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
+        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, tran);
     }
 
     return 0;
 }
 
-static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                           uint64_t cumulative_perms,
-                           uint64_t cumulative_shared_perms,
-                           GSList *ignore_children, Error **errp)
+/*
+ * If use_cumulative_perms is true, use cumulative_perms and
+ * cumulative_shared_perms for first element of the list. Otherwise just refresh
+ * all permissions.
+ */
+static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
+                                  bool use_cumulative_perms,
+                                  uint64_t cumulative_perms,
+                                  uint64_t cumulative_shared_perms,
+                                  GSList *ignore_children,
+                                  Transaction *tran, Error **errp)
 {
     int ret;
-    BlockDriverState *root = bs;
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, root);
+    BlockDriverState *bs;
 
-    for ( ; list; list = list->next) {
+    if (use_cumulative_perms) {
         bs = list->data;
 
-        if (bs != root) {
-            if (bdrv_parent_perms_conflict(bs, ignore_children, errp)) {
-                return -EINVAL;
-            }
+        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
+                                   cumulative_shared_perms,
+                                   ignore_children, tran, errp);
+        if (ret < 0) {
+            return ret;
+        }
 
-            bdrv_get_cumulative_perm(bs, &cumulative_perms,
-                                     &cumulative_shared_perms);
+        list = list->next;
+    }
+
+    for ( ; list; list = list->next) {
+        bs = list->data;
+
+        if (bdrv_parent_perms_conflict(bs, ignore_children, errp)) {
+            return -EINVAL;
         }
 
+        bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                                 &cumulative_shared_perms);
+
         ret = bdrv_node_check_perm(bs, q, cumulative_perms,
                                    cumulative_shared_perms,
-                                   ignore_children, errp);
+                                   ignore_children, tran, errp);
         if (ret < 0) {
             return ret;
         }
@@ -2320,6 +2338,23 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     return 0;
 }
 
+static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                           uint64_t cumulative_perms,
+                           uint64_t cumulative_shared_perms,
+                           GSList *ignore_children, Error **errp)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+    return bdrv_check_perm_common(list, q, true, cumulative_perms,
+                                  cumulative_shared_perms, ignore_children,
+                                  NULL, errp);
+}
+
+static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
+                                   Transaction *tran, Error **errp)
+{
+    return bdrv_check_perm_common(list, q, false, 0, 0, NULL, tran, errp);
+}
+
 /*
  * Notifies drivers that after a previous bdrv_check_perm() call, the
  * permission update is not performed and any preparations made for it (e.g.
@@ -2341,15 +2376,19 @@ static void bdrv_node_abort_perm_update(BlockDriverState *bs)
     }
 }
 
-static void bdrv_abort_perm_update(BlockDriverState *bs)
+static void bdrv_list_abort_perm_update(GSList *list)
 {
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-
     for ( ; list; list = list->next) {
         bdrv_node_abort_perm_update((BlockDriverState *)list->data);
     }
 }
 
+static void bdrv_abort_perm_update(BlockDriverState *bs)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+    return bdrv_list_abort_perm_update(list);
+}
+
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
@@ -2373,15 +2412,19 @@ static void bdrv_node_set_perm(BlockDriverState *bs)
     }
 }
 
-static void bdrv_set_perm(BlockDriverState *bs)
+static void bdrv_list_set_perm(GSList *list)
 {
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-
     for ( ; list; list = list->next) {
         bdrv_node_set_perm((BlockDriverState *)list->data);
     }
 }
 
+static void bdrv_set_perm(BlockDriverState *bs)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+    return bdrv_list_set_perm(list);
+}
+
 void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
                               uint64_t *shared_perm)
 {
@@ -2489,20 +2532,13 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
 {
     int ret;
-    uint64_t perm, shared_perm;
+    Transaction *tran = tran_new();
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
 
-    if (bdrv_parent_perms_conflict(bs, NULL, errp)) {
-        return -EPERM;
-    }
-    bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
-    ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL, errp);
-    if (ret < 0) {
-        bdrv_abort_perm_update(bs);
-        return ret;
-    }
-    bdrv_set_perm(bs);
+    ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
+    tran_finalize(tran, ret);
 
-    return 0;
+    return ret;
 }
 
 int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
-- 
2.29.2


