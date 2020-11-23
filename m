Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4512C158F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:27:09 +0100 (CET)
Received: from localhost ([::1]:48746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIQW-0000Cj-RU
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID4-0004KE-0p; Mon, 23 Nov 2020 15:13:14 -0500
Received: from mail-am6eur05on2112.outbound.protection.outlook.com
 ([40.107.22.112]:43328 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID1-0007SQ-C8; Mon, 23 Nov 2020 15:13:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtKuO/vxl/NWnZ3MkmpMRZwYCTHQSPIF4nNCFRnFb2RjnKO3OnKZ3FLt4to/osdGgn9hiVMuskmp5jezhQ+2vzJF32NoNNkC0/gMLx7jyC4aSR7TYp9bO7UQHHmOXgGsSnovAA8NqQ+dnNh3xo05Tim1qdfq3v6/mqeABMARXPICJHkrqqFxJZTbq4z2xbcvW0+2tT7wCKupgZ5AwXusUHPEjWKLbTKZ2E2819vGpgZWurGgufMCVHdH3ju8AWXCkwm+O/ax8zIvfg4JGSahlet/6C6gucZFOJL2c3odeXbCUkyA7ADF/wDOVSuPS22Y38O/gS7FgN2PGLd5u6xC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNApFnlITFJCxcfsefwL3RIss+ldxxk+P/80GeIqGSc=;
 b=XWWy78dFDwad2t90Lg/ssaIDCt11O7WIF3p8Q6+huKz4Pehtn2j/FsBPU73T2Afk99Xl7LDuaOIqmZWuD5YGoTsP5L7bMeGVau5Ulz4y3aJ3Q8Jv3nB1E3Q2g1BGD/2zvJbb/rAzMpUWK1V8iuWvowLRgIILO3U/oWyzUsI1GZsBi8hv2MrIFIbMB0tTwwOre+Fx52fFf34ZNqBICGfnb5pKZk8FxG5vViGq3oElhwPIcgddcOWDjaBS26s6c+P4cY53+uKCzZLW8PbwG0sswEAuO0fr2ILSb6WyPRke8LmJhFhuc8lrnWV6hDXKqpLNicnfvtOAdN5oAMnvgHeLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNApFnlITFJCxcfsefwL3RIss+ldxxk+P/80GeIqGSc=;
 b=uwRtuQ+E0TRxHiqYdclwlJel0in0bdxPH0YUp2q+k3MhOnW1NWPbK8pNcsyCuzQN2u5kAQdnpOqpFkO0mDLtFkQthmZepn37plqj/vUMriFuOF33xZO8MKjpMK1fN2sFFWBVMYIfC8p/B+JRFUD/q1N+/ivlbOoC366X/HjWFY8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:13:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:13:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 10/21] block: add bdrv_list_* permission update functions
Date: Mon, 23 Nov 2020 23:12:22 +0300
Message-Id: <20201123201233.9534-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:12:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0bd09f9-df8e-4625-3a5a-08d88fec2cb1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46909B9E6B9FFB2DD520341DC1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C8ArIIitDnxoarwQ6DqSAj7S+IC2aWj/U7x4GZuZfTLD0xllm61m6WMpGs0qQFybybekvv+WVUfAzzXzjMYf3T1DUwE+I+etxKZxpJI2VxqkzXK9Efiq4E3HV6X1Lfqb/4UFk++ry5ljPHD/aYbC9mXUwk4DuSCaNlbKeIX6wXUfISLIbCf8BYmV78T4T09DxjrXjS7zaEX0ha2lJYZ/7dnvmELrsXs3SGJl2Y1VsMXVu2Erd0q2MKSCsR1gRKyizs1nCNbcRqZONUdvHMtX/o8RqXWPeO0jbL6RvT2+baNd0cqjdubqlfy/qObsmLfbTaZ9pqqcRPCpqnNSUqUftQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(15650500001)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 5kgO8V4BagGX0WWYHrnAFHIYRtNH1Ria8Uya4hC8qXZx9wFHfrf8fF4OlI393mhOj1/YXlbZDQN4CV6/d4UY37MmxWAxlZ9YAjXbiO4qI887iTmuyOCLJH/Sc0xUYW0Lex4mx46d1r+r8ZPN3QZmq3Q3xLrBzZITBvhmZzSTmq3+wo3bNail9QhNmh30zyfWzIPcSOKs3v1aB4pLA7ACXWqr7YdFRdVT5RQN9LVD41oywjV4wAn1uJ5F9+n+Q78qnMcZ/R38t4pGpWUIKd7+M9iYxcrrY2pY7HU/l0P+IzEWanQGkCgoENjDFQNnNIANR/JDz4HzsbqjHR/KUiAuwisSWn0Xc+xlUhb9VblJsSUoWMCapL37B/YGuHvaWH2ngkZvS/wQ7BkYvwG7Ef05lvT7C7baa/8qr/1nEAX8H85IUoEQMjrwLGva2LfhICAT44uv/JDWfwaj6ioOmbqPQ6Wz6pvwI5naftVb71Ol343+7JoTFVD0fbF3UjMzYdylinqIESkyLzraOO2KLiGc0AgPHpT1svgKsSDnckAsvGXKDJvU1YdqTHMou8hBEkdldfhn/ZAZv4S9RdFkrem7uEajWXjIZgOoa00eoBGzb/TqWo9ygh0rp8bsPtGdrUdObDUl+caJ7YgNRmnRMPyynpZ4UTVrUEehMr3CwwJtELLzDentbkRACQebGw5JgJGDafIfwbwhn4tRc0td28nOqJ+C4TisSEScf9ipfY2Delq5fXT6QMxiZ8IBlq7wuOVWnFsz7ZqZXmW72qr0HtOug0gx+368AO2JNfmHxqrDFCjYjFJmlopK4Nxipit/t69xwi3AK6/w9bGvoJQTd8grLzn25v2SfrBMA1U+onuoak0cgXlHUvc7q2b9a+eDVXc931EaIUKij1jo1Izwg7xMkQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bd09f9-df8e-4625-3a5a-08d88fec2cb1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:13:00.0220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BW7e1sbGYINYCYaSMGhPVwm0C8X8h1bApXf6Fj5LSVwO8/CzzUk1reu3gM6S8944y/HjASY0d7TkFSjZPE38VyzRgyzRl6yvJ6PIXpuLZEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
to fix bdrv_replace_node() in the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 112 ++++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 76 insertions(+), 36 deletions(-)

diff --git a/block.c b/block.c
index 799c475dda..d799afeedd 100644
--- a/block.c
+++ b/block.c
@@ -2154,7 +2154,8 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
 static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                 uint64_t cumulative_perms,
                                 uint64_t cumulative_shared_perms,
-                                GSList *ignore_children, Error **errp)
+                                GSList *ignore_children,
+                                GSList **tran, Error **errp)
 {
     int ret;
     BlockDriver *drv = bs->drv;
@@ -2202,7 +2203,7 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         return 0;
     }
 
-    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, NULL,
+    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, tran,
                             errp);
     if (ret < 0) {
         return ret;
@@ -2221,36 +2222,53 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
+
+        list = list->next;
+    }
 
-            bdrv_get_cumulative_perm(bs, &cumulative_perms,
-                                     &cumulative_shared_perms);
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
@@ -2259,6 +2277,22 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
+static int bdrv_list_check_perm(GSList *list, GSList **tran, Error **errp)
+{
+    return bdrv_check_perm_common(list, NULL, false, 0, 0, NULL, tran, errp);
+}
+
 /*
  * Notifies drivers that after a previous bdrv_check_perm() call, the
  * permission update is not performed and any preparations made for it (e.g.
@@ -2280,15 +2314,19 @@ static void bdrv_node_abort_perm_update(BlockDriverState *bs)
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
@@ -2312,15 +2350,19 @@ static void bdrv_node_set_perm(BlockDriverState *bs)
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
@@ -2425,23 +2467,21 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                            ignore_children, errp);
 }
 
-static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
+static int bdrv_list_refresh_perms(GSList *list, Error **errp)
 {
     int ret;
-    uint64_t perm, shared_perm;
+    GSList *tran = NULL;
 
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
+    ret = bdrv_list_check_perm(list, &tran, errp);
+    tran_finalize(tran, ret);
 
-    return 0;
+    return ret;
+}
+
+static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+    return bdrv_list_refresh_perms(list, errp);
 }
 
 int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
-- 
2.21.3


