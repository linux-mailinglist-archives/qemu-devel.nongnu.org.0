Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D71339787C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:53:15 +0200 (CEST)
Received: from localhost ([::1]:52726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7di-0005QL-Iw
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7ba-0001a6-7G; Tue, 01 Jun 2021 12:51:02 -0400
Received: from mail-eopbgr60110.outbound.protection.outlook.com
 ([40.107.6.110]:55602 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bW-0002AT-R1; Tue, 01 Jun 2021 12:51:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZzCp/42+RU7vVmEbEvQYY5GZyOPPDV4Xx43/QgKYCPJht4K6dQhoM0iACLyOVGBfzQgiW+adIq71VE9yOFM4APPHEHeKC5j/CNNuQ41YYFlCily3T16gZADpaYtgg7c3v5ZnSlYuEiLEl9ojOqjrLNxFbogLe0xsgw+xtv+x+Z3uVp7FvQnEIf7G217LpzmGa0LWKJ98Oz216deMLwZXy50Hgs+bWwIE7cKsSXN9HQ4boCbJQsDSlFVzzOOCifMGhiZEP7eyQlKx8W0zekqsUjSG3VVyof28zjkXoQahfh6IH/cgLmajr4BI9YB3l/0cAL5JysAFMfOVYdu2wL2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhDYVSV1YYF4R71rvIky/tLC5qKlaymQygrw4kVEWE8=;
 b=iwsCBXDY/7fHkLAH7qYxPge+lQk2I/CNYjnRW4smoAi/j781VL+TAPbp5cvjfe3SdZAj+lDBDsPcbEcz5xdG2obT7lpYRH+ve3KYvPNGa4gWFtUm1WFaxfqG3sVRsBxoXwF8HOsI+Wdl32IcXlqUddYUCCv5ybMdZ/beRushvWWHEOhf6kkMNAbUqdWoA8X9DO7tW2AdPkA5qM98nO7o7Od2DNxFnC1Clm+6It8PvD9jG+pQhlgYsyJpwGlZGoqUWtrUpOQP2d1rv30ZL8jgdpl8bM4VYubWmE5z3Ca6rgbffAiuQDDvCDvn6NLvNGttW8IzqtdYssTwYluGJfDzVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhDYVSV1YYF4R71rvIky/tLC5qKlaymQygrw4kVEWE8=;
 b=p9diByHxLd5ZvvZl6kAR+8+f/GITQQvW8ZPX6atcABRPfqinG5E/32/UTw5jn8zqBWYv9TnKB5lgjIT1KoapggIF1j7VLxeCXSyPVlMzsVkSYICPrA9NnF2Vwi5b7m/E2nELENtOWZs3cye77J0VpopH/103tzhB0HBofq/wE84=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 16:50:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:50:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 03/35] block: introduce bdrv_replace_child_bs()
Date: Tue,  1 Jun 2021 19:49:54 +0300
Message-Id: <20210601165026.326877-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4215255c-c9f0-46b5-ab7f-08d9251d6767
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4471D60B85186113B3CD022BC13E9@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iaf4vxNsFZbkeIjI9uoyEgseMOhAQpiITUdYbNlMkL3niw6OqLkzTduwS2bt98UNbLHlQsRUfSs9R0HkmkBXhtoYwckRcqplANlrXhdokAVqHvOGnAb2PQTpRJZhyAPsQFRAPz706IaZKbFtGwpljvgYEc8TeEUJ7R6y7AMAva7etwpAHFtEwii7mBgcZDGX5Zj+WGa7pXQhFJCYptroEcDti88Hy5M0Pdns/zDZMa6+ehsC2vMRmkhbYgbVu0gONDHM1kyTstoEy1XSU02AINaZZ8Fcj4xQoGiA2kdpez3n8W63IYMowqq1jwys8h+6eeEwvgBMKlrxp8VMwQ/LCFP0a5KHXHTHxJ49dNl5zjP6UBgX6hXLS0mSQYO50HPmiv8Iw+lhzZ7i6ZTqEe6y0pbJUVdFAFqyAbs+MWTeXXM3CfYck+FGquuDyZfsOn992gjAmQkFZ98jtxwwPi94QQknkS8sn/kx9Z0mXpeZv6UfW7JEIjxkdVqbBhI7XB9UwEcM8EWXjkSK/UC9UiDaII0KztMN5CSIuiXW1h3z4U77VPy1TVhy0aKBDeRfKwWhQviU0v3mQbi0xUeRjmsUAkVZoZzhqsvKkh6wPaEkrmMfKCE+vZApEE+rJ9rG//pSbvbmvhHWgjCZHldVa0PNqZICdkwd7syjLnC+qpQvf9M2ruGT72nS8sN5SKsfgUeX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(83380400001)(186003)(6916009)(16526019)(4326008)(26005)(8676002)(2906002)(8936002)(7416002)(38350700002)(38100700002)(478600001)(36756003)(6486002)(316002)(5660300002)(6666004)(6512007)(52116002)(66946007)(6506007)(2616005)(956004)(66556008)(86362001)(1076003)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vpQN+pGvBcnOPeWkwrfpuA/+DYdbt8Wwu33fm0hkAYsuv3qKhkDlZflSLIc8?=
 =?us-ascii?Q?woBb5YU2feN+Sd5tslsp9FKnwJYRSNx6BvDCxVPuHFkduGE5utRneTjp74hy?=
 =?us-ascii?Q?PNUH+oEleNEOmN9ZzOdo24OhkCL7ppkYvWAexh07jdcbMVoG82q9IzRp02Rz?=
 =?us-ascii?Q?Qoz1tbfqS89rP4c35u/4GVXDZM1ONcaxsCjC3QCjDGU5kl6J2DL9MjMFbaes?=
 =?us-ascii?Q?iTTpKFXevmT+uYflzb5Tc4SF5qR5Or7i+FEaQyS3Df7ciDAgc6DErGYaPW9D?=
 =?us-ascii?Q?dXIcD/GiU0KgsPiO0cs8liq5hR65AxGQGDYesPO+PZQ4tAMJVL/AW75UuGn5?=
 =?us-ascii?Q?njTwdzI8OuYeVKuhG3d4gXwnvL4j0Xt/Q2++fysPzoG2Vqwd2H4Wda2GkNEK?=
 =?us-ascii?Q?NDvGT9OK6wNx3dsmAFqotTcBv1lTOD6no20SLrrPxEtYopaNUD+vqcmnddsC?=
 =?us-ascii?Q?X3ewf/OnczfbkQ4Eu+oa3KJMkgMzRQ+ofCyiYP/yadeXlgwxs+edkOsoEBIA?=
 =?us-ascii?Q?192DRBNHhA+PGxiNTiTUYnGpTewuFrIOgWtMtT9gdaPXc8ntCWlHVHn1YQdE?=
 =?us-ascii?Q?Y1Z9emVl64sVoE2EoU5VFVt4Gnv2MDsgm0OoqNrpdC4tdcUNNwuhv1M3MnXJ?=
 =?us-ascii?Q?+8Qe3NmVTnd5OTQmndiC3qSVQ9G+TqrOUnVvksRheUmhxnhyKvkvxgFTJ83Z?=
 =?us-ascii?Q?O3YCKA5yp1M/vpGvyNz/rfM5n7lm1BBuzgQUQPIHa5XcmeqbqegcDEWlQpiQ?=
 =?us-ascii?Q?w6DkvOymXv3m6gvuuc16+naK3OQO3qDRiT4uLQFs6nkyEm4JxduQvSvGKklv?=
 =?us-ascii?Q?G9oQl72Mk6SgPiUYdDDHprnBrUDqW+7lGCULZpLHVsBgViU3AjpFgCSPs5Jw?=
 =?us-ascii?Q?gNejHi40bsM9N5gCdKQPQ6cGP9gx2hdLKKRUAEJPNt2MDatkx+Nz2YGfsl7r?=
 =?us-ascii?Q?c4WFA9Mge+L7xBj7r2V/Bs+WNOfqsC0yY5Cq3O0wkMl/AWWJxCNEMeDDo7bD?=
 =?us-ascii?Q?wSbJmvwEk5jCMn2daUcBGLerzC/pdIMqOh8Fuq0YbzKBIEpZmO7QfdVoiSxw?=
 =?us-ascii?Q?YGqSxVqVknxc36VSPmGvmZOFzXKqaWxaLGbAY6env08eno0dN4ccQDk2ubNA?=
 =?us-ascii?Q?T1+d4A90t7CWneuPHcp7Y5UkfH9FYVmt3obaXMfPJ4LlVniwXyS7zc1XhE7Y?=
 =?us-ascii?Q?urf6oQYW1USkPBlJfXhM0f8ffXXfpDRlfd52SysqUKGUw9rCEiqdBBpVp+LS?=
 =?us-ascii?Q?46Mh+AHdbDUiiLAOV5QuOK0k8AMjub7cZRBC/wEKmiBFebSeGeeMmI6kvMzq?=
 =?us-ascii?Q?rlY3VvdJ3C3V3kWOgzarzKCA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4215255c-c9f0-46b5-ab7f-08d9251d6767
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:50:46.9957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNzktburYdu0N11AkDMEp0/Se2+ZEEtuERgtMcTq/ac8PO/cicmCyvAMmu+keIZhBt4buRuDn6EoKQ5MzHW+M7qjOp9o/R0D3JqgKcK0UMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.6.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Add function to transactionally replace bs inside BdrvChild.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block.h |  2 ++
 block.c               | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 82185965ff..f9d5fcb108 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -361,6 +361,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp);
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
+int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
+                          Error **errp);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
 int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
diff --git a/block.c b/block.c
index 025df4f02d..526fd83057 100644
--- a/block.c
+++ b/block.c
@@ -4970,6 +4970,37 @@ out:
     return ret;
 }
 
+/* Not for empty child */
+int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
+                          Error **errp)
+{
+    int ret;
+    Transaction *tran = tran_new();
+    g_autoptr(GHashTable) found = NULL;
+    g_autoptr(GSList) refresh_list = NULL;
+    BlockDriverState *old_bs = child->bs;
+
+    bdrv_ref(old_bs);
+    bdrv_drained_begin(old_bs);
+    bdrv_drained_begin(new_bs);
+
+    bdrv_replace_child_tran(child, new_bs, tran);
+
+    found = g_hash_table_new(NULL, NULL);
+    refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
+    refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
+
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
+
+    tran_finalize(tran, ret);
+
+    bdrv_drained_end(old_bs);
+    bdrv_drained_end(new_bs);
+    bdrv_unref(old_bs);
+
+    return ret;
+}
+
 static void bdrv_delete(BlockDriverState *bs)
 {
     assert(bdrv_op_blocker_is_empty(bs));
-- 
2.29.2


