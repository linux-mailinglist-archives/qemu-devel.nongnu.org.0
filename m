Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF782C6846
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:55:38 +0100 (CET)
Received: from localhost ([::1]:35242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kif9r-00035m-8u
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif17-0001Dg-3x; Fri, 27 Nov 2020 09:46:33 -0500
Received: from mail-am6eur05on2120.outbound.protection.outlook.com
 ([40.107.22.120]:28961 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0y-0003Ef-3k; Fri, 27 Nov 2020 09:46:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpYTpsBB+qlPEOUgNr/c2f2QeysY9hxcFn1L4hNVY0D9JZ2iBL9txKdvoLcaw6sSh7Uak+JZoqZgbKfqpTCgP1daqOIEEejkScAdOVMv1kzUwTiCmftkTpN8OV+bDSkA+E4TL6i/OXeiKUeu7AOjbjtk4EoOPzwJlmuh+Hx0eXGH15ejGWrMRa34eLVNiEhuLg7aGz+I2s6EIAVymmNJ5NwfegiXKtjfHQyFKiSJbtb8E4SJGez6p4CqFU6dFENCNfjKZsyRBW4Tg+Vud3FI6WQrvnBmejuJLuxxIwvSxRuLsdBHyjVQ52YnQ9klKc0vmMGLRqg/S4o02EAlsaSY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6Grryz7uauPZjgtaar6dqd38PAQPHov5EWmu9xkFTc=;
 b=YnH0HN9dHZzkgYDvJCUpfcZuuCfAS6DdRuX3f4HA1ludubY/LtL0DOss6Z658aeY/DkNrWK69c5URsPAfF5HHOMEqheOzTI32VW+3vaBc/WBBNzJmyuF2FmkAN8fsDKY8FAvx9bKncvl02C2lYUKLqwmrIrDbmBihceXDlljGMCzbYZBbDLjeCDFgK8/1zycgor9DBGqrQZhSXBs4ebYvJPmE03YsSTIrgC/pBEuwRkqsS0oB4mNQyjC18RcaiZGosKe6MslTQcUaFhoW2uCQu+FKSfkY7x6LyCWcmIoyL8fENi6uQ8njk4e5S9WWTRdJSUMQgLZPBcreGwreb2n+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6Grryz7uauPZjgtaar6dqd38PAQPHov5EWmu9xkFTc=;
 b=eEcZZTl/Vc1edqaj2QDjGXfOCp+4Fv8wZbjtXRhe4bbhtSULPgp1ko6+pGrc/aufH08MxwCPfRejGKOf5FWgZawjfvMwrIHe+UBsZrC04b443/E+k1RjnsywM8Cm/HQigQ/eyGXwoNcq+fHbPwV56ql7y1fiwPRuc0If8lwChWk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 17/36] block: add bdrv_list_* permission update functions
Date: Fri, 27 Nov 2020 17:45:03 +0300
Message-Id: <20201127144522.29991-18-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 550a51e0-69c6-42fb-8f04-08d892e321f7
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50784C675DD649D51C11078FC1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rh0zQ/f/BkYRq4Ih6zecWz///GKzl6snpL7UAq5X3/pTPGKB78wRdJX8VFXvVbiLiva4sJWQ4Y7rHXmCRuFhbG0A1mxMreS78H8LlQZAXLdT+YazkDhIIFXvNEWHtgYIRJuz2URVT0h64pwsTlaZC5OLwR4uXxh6qi4dB4uRz2uS/8LQq0V45hF44r20dxNglf+BcJwBLvaSwQ3404ap/HODZ8Gzouxz2hs4CAGITBTLrTQKKhI2r9mU2b9D5Z6DDGqi4srj0Sg4zZRkFzjH6D3eSckyj5lnp4c89QL2lF+ZnoO8N5G3nMIkzmqtq5RFb5bfobc96wGjvbMfiHDNxcR4PgsTXqMgKY8CwNKdmxCKHJbhy6GAtOr2NiV3Y70p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(15650500001)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?J9MmBBxnrvvx/5pfttO8ikDXRDuab5nPCnPPsBQfCKiwABnOiSLwmBLhbB5r?=
 =?us-ascii?Q?j/mzUTDoBRBJFO/JZwkpg+bJRyHQkCJJ8Iq40wtgXY5uzaEDPBG7dALoMma+?=
 =?us-ascii?Q?0CKJvjmr+6Xva7NIaBrepiovQgnfi6KRwD0hOGO5znAgG+kFrRa8vax7dtdy?=
 =?us-ascii?Q?P8c4EFQgBTPhtfa+ml4nKGMD+j7XAfKl0qka7Lfa4aSWSgZm8FmuBETbRpgy?=
 =?us-ascii?Q?GpBn8GfKeWCJrVZGWbjYVg8u+Qp58ZM+o0+mq4tXmdMuKsHj0pp59HK5N0Zc?=
 =?us-ascii?Q?OtCRm3NxQhfHAkhWm8qOaS/93LYwrahSAVaOJQLVTH/bqUp3lLMyC7ROZGcW?=
 =?us-ascii?Q?qlPoaTAKEERq8ReEYDSAfPc7n9iS0SaKrAXyP3paT/H4WFXjDr4p/aVHaBZA?=
 =?us-ascii?Q?SrhTi1vIgG/St3YDrWYtIgn03FmTgpS9X9scUm/vq1F9lJO//ubArrPjG/3h?=
 =?us-ascii?Q?rdqegSW9UqjH7skaXFgtAYz9WvfidGdfIhi+nf5zDaTi03mR7elVo6ReGffF?=
 =?us-ascii?Q?Roqgm2lJL4vv41hLOpEY3d+Q/XYqHKghyDAlFal1NY+Qpi42tSUPA+vdritC?=
 =?us-ascii?Q?DdhPLTjSRiRxj2tv/WNGfqmos1J2+WvAZ4IdSssqPMNx4LD4idJenaiPsg+q?=
 =?us-ascii?Q?jD+rGpW0t6R7nM1hJlsEnR5eBJ7EwdMEMDhnFayU2J5kfO/SrqhGdsb/ehxv?=
 =?us-ascii?Q?jJMRcL+1zpwlGVrgWjQ55qQTIfizXYoC0wPgScLU9nFao2ZBfsgQ9uuA3tQy?=
 =?us-ascii?Q?N8h4/1XgtxVdxuXpYy/YAdG+oXCJrI6ZIu1E2Qetf9b7yxdGmS7xfWv7OsNN?=
 =?us-ascii?Q?dVsNAxHaUewU8ij5ci4Rol00UNhYYOEIdlpSKjfyzuEv0Er8/hEYHGCIKIg2?=
 =?us-ascii?Q?Q3XW3/zV3q5H0xVQebcJI3cZk/Aad8ONCK7HUqftpM1K/GNrfHp6bh5cLDqe?=
 =?us-ascii?Q?7M6yEYhREByR42f8Uz4PSid4c+DnJY/gAbYHsKrn1mxtfn2gcAcmjPmzyiXL?=
 =?us-ascii?Q?B9BO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550a51e0-69c6-42fb-8f04-08d892e321f7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:49.9930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vx23PScXzFOlREG05doRKGU3YMhbjH7StEfg+6ysY3VbAKZHgPUU5Mwd2DuKyL/EU+EUB3bWalgmK+Hfw0VUeo+3sAF2PfUQvh4Z7aFzdmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
index 4a43a33401..6996aee1cf 100644
--- a/block.c
+++ b/block.c
@@ -2176,7 +2176,8 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
 static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                 uint64_t cumulative_perms,
                                 uint64_t cumulative_shared_perms,
-                                GSList *ignore_children, Error **errp)
+                                GSList *ignore_children,
+                                GSList **tran, Error **errp)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
@@ -2224,7 +2225,7 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         return 0;
     }
 
-    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, NULL,
+    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, tran,
                             errp);
     if (ret < 0) {
         return ret;
@@ -2243,36 +2244,53 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
+                                  GSList **tran, Error **errp)
 {
     int ret;
-    BlockDriverState *root = bs;
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, root);
+    BlockDriverState *bs;
 
-    for ( ; list; list = list->next) {
+    if (use_cumulative_perms) {
         bs = list->data;
 
-        if (bs != root) {
-            if (!bdrv_check_parents_compliance(bs, ignore_children, errp)) {
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
+        if (!bdrv_check_parents_compliance(bs, ignore_children, errp)) {
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
@@ -2281,6 +2299,23 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
+                                   GSList **tran, Error **errp)
+{
+    return bdrv_check_perm_common(list, q, false, 0, 0, NULL, tran, errp);
+}
+
 /*
  * Notifies drivers that after a previous bdrv_check_perm() call, the
  * permission update is not performed and any preparations made for it (e.g.
@@ -2302,15 +2337,19 @@ static void bdrv_node_abort_perm_update(BlockDriverState *bs)
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
@@ -2334,15 +2373,19 @@ static void bdrv_node_set_perm(BlockDriverState *bs)
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
@@ -2450,20 +2493,13 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
 {
     int ret;
-    uint64_t perm, shared_perm;
+    GSList *tran = NULL;
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
 
-    if (!bdrv_check_parents_compliance(bs, NULL, errp)) {
-        return -EPERM;
-    }
-    bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
-    ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL, errp);
-    if (ret < 0) {
-        bdrv_abort_perm_update(bs);
-        return ret;
-    }
-    bdrv_set_perm(bs);
+    ret = bdrv_list_refresh_perms(list, NULL, &tran, errp);
+    tran_finalize(tran, ret);
 
-    return 0;
+    return ret;
 }
 
 int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
-- 
2.21.3


