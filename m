Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14B338B1AB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:25:28 +0200 (CEST)
Received: from localhost ([::1]:45676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjc7-0000X4-Ly
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZM-0005Je-Vy; Thu, 20 May 2021 10:22:37 -0400
Received: from mail-vi1eur05on2112.outbound.protection.outlook.com
 ([40.107.21.112]:56810 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZK-0005Wz-WE; Thu, 20 May 2021 10:22:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ab1oHJHXuLNeg6humdCzDtM9+EnhrREJvXuhVtpat8TqpmXIUeZCZbR2QcQ/xOKaWXwxsS7AF5rALl9kClDLLlIGyo+yS5Pi4kEXYjn3irB1Wo0At9fojixF0e+k28OHs3mlWVLAU8cYWwHqzRJc2LtnHLH1bdrw1PtqDhiiGYbOeYFcP3pYR4MGmcMbKnkCjvLYyvthndRJvf7QfcYX49IdXw3tmE6bDVg2byiORD1HsOmur8IsXaK7SZwammjuOXpeteOQM8ERvOd5gVcYE0zKIZaCBUcdzDxZ3nsH4NltXHCgr5hstFzEt18uPwquwDPSefN84p/mtHgaxo4cPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbeZJghXpTBf7ltG43ob2l5zO8fXwsqOMFDEznaWEN0=;
 b=l9wjF5kZXJVRspQJF4syORM1/wZX0jWv5lRcLg+4DvxWT0fuPTgNMdxYIJAJtK/oe3e8ztccoYe3DT84Xdq4bNqS7FhZts6NVOZyrTVGTusdVpcyuud70wUvDdOF7HzwrO6XVZVbZDWFK4ocKlnsa7pq0qYnKNVMLvwmjnWnvbMX7Npp9ArqoMoAe/FmEhGt2/XY6gKCxgh7hnTfCwucW/nMXYrLNxVS28dAHE9ezdhb67quGC8GqoTcLYuIQlrb0NZKw1FmxhIZ1J93oLuumSvsHfv5eN+YyTZa2buYKxdGBj8N72qUHrSZUI3zP1ZqC3wktnQmxDHqb4sUaazM/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbeZJghXpTBf7ltG43ob2l5zO8fXwsqOMFDEznaWEN0=;
 b=XCnSaj7vYBM6e85XFYGbwMUaf3yAjAxycvgrk+pyTaZKlVUROv4S5UzEwyVfSHHMAmIqrLGjxpKk/iNes4/L55qf7KLN7SRxZpNhD0d1HQKmg71ZpXJBktwGoQ97iRtRfkxrdrGejiLU2pKLBEsPUvJLnUdsFks13lSZ9jy3x/8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:22:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 01/33] block: rename bdrv_replace_child to
 bdrv_replace_child_tran
Date: Thu, 20 May 2021 17:21:33 +0300
Message-Id: <20210520142205.607501-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 415b33d1-880b-47cc-d93f-08d91b9aafc5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6309EC76DECB206164732582C12A9@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6mmxn9FnYMYjDdQnYH4KkZO+xg3DM6tZHYYFbSoTWJMnb0/89vyo/zwkAi+Gv+kKFGS93pYTew5XPf8FndLqSJ+f/S7Tg42K/UidkyH6RhMdWFf4VvQwcjfEKXo4gm1jtYFdtvzHANiZImWoE6NjYkOkScmb0G01vEB6oBgLziIG3b44k88tvrYAywuDLfs+raW2SKaF/ot6LZqd9TzhQ+eo1vF94Sz/Fo1Rcyk+ny2B+ByZJ6UqyF9XVADjGOTjkn69817ejmx61U4UBFLrhOnTinRbzY6vhsDEKaSopGEZPGEQ0Sk4kku4cqH47jXraG5+leZZFgzPlyy+gXnIxP3OEMlSengw19qc5kH7XyclzI5SHk4qyssi2oGiHxvmPVpxeK27zkPqYQzKzgwyNPfSumGGoeHCcE2on+qIksnsz08E/hSD8f1ayROJeqhCB3tGYLdkG+qYiNY0sl8Myzz1nz8vgGn0IqKpl74Q6hzfpZdtGLgvjR40GHK8jrLqgKbCv1nEAhAlxr5cDImivp/6dX+cV1Hu7F6ypC+UM9x9CMIHAMggq3NfTQmQ6oIf27KkBpH1Gqot45sM8QGibv3il6WdvLAf2qXtPGL8cw0wd6lPltELDUuZ6AZ5h1VvuGHu8UD1ODvfShc3g3tURECjY4IVvcDtsUb9x5TnO2Yt/956AqiWxMEB20u3/8x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39840400004)(136003)(366004)(376002)(6512007)(26005)(66556008)(107886003)(2616005)(66476007)(956004)(86362001)(6916009)(66946007)(6486002)(8936002)(8676002)(16526019)(186003)(4326008)(36756003)(478600001)(5660300002)(1076003)(6666004)(83380400001)(52116002)(2906002)(316002)(7416002)(6506007)(38100700002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pYkK24k7ipkkidIl/2LyO3zq1aBwQRmvPVWEbCfeA1sg1mCAImUZr4kn3YCK?=
 =?us-ascii?Q?XUMjOVQeTjW8eRpYWVWcswCPfgaWAD5mtXf3uHNIh+7Spdrk3YclajI7dOOK?=
 =?us-ascii?Q?f3cMttZuY90oQhRCWC2MOnUCQcyLxkiwFPwWY9r2W0nLU1pZpQBJ5fr3xc1/?=
 =?us-ascii?Q?YuPxpCJuGuXCDUoKe3LdfztaMQzU2dJiDa1bd452B0pnelVTTU7WAvsIC0cW?=
 =?us-ascii?Q?SJ6OuSmpxzfOj4j/VUfVSlU4DrIXKSozr1tXgW1Hj9jS7gord8pNQzUiSiwd?=
 =?us-ascii?Q?w8D8ykGUTOJzVXdSGyaXO0BZOZvhV9Mx9qJqpKsxEN01NI7KUp/ra5m/MYf8?=
 =?us-ascii?Q?nwk4WckqxsnOEjGIjsfBcaVo25R0y5I52aapBUT/uBt2sVDzixtJ/N+otmZX?=
 =?us-ascii?Q?LaRYabjjRLR0QYR5G6ClBo3cN7dzh/A34VRDUHASGNGVDnYBfkH8ZHc6k0cr?=
 =?us-ascii?Q?JhskgOo+sbWIAImva9OJ63K3nDLiL5J1thLPgI3UC62yl5u5v1yl6ZwD0qcT?=
 =?us-ascii?Q?IFNl0u4bmYEcpzRrk3G8CS03U+26vY1yGKhvz2xeE8vm3fg9rm3OpnTLwrS1?=
 =?us-ascii?Q?uQUYXOV3A+h1/0Gng91UTTX9Yaui0Ges2KpxcwM+LAHvSV6EbURg2tyHGwac?=
 =?us-ascii?Q?niUcg5D/j8tL0D8giy2To889e2hNME5S8xdFwV/qEaY9pUzKDgJD0qH+RpuK?=
 =?us-ascii?Q?oSQeSnn3Wb1S0o0KKKj4EuLFxbF8xG3RIW76gFIaR5rIRq00LTqsQL7FFwVF?=
 =?us-ascii?Q?o9DUfrdEThhN7ama/d0OdV5pUWoYica6eOE1Xlq2n7B4DidsN+MjVuW3oxah?=
 =?us-ascii?Q?2VXUfhFTB0NtR66XT208++5TBPXB2QwZV+anInt3Wenf+Itu7EgkCp9ZwTAi?=
 =?us-ascii?Q?fbOoMFNgr5Z3ZBSrRWW+s3c4xkoZW0bSUSw1yFheMQ2T2tv1MH3yUmmSHqTx?=
 =?us-ascii?Q?CzBRrP8wPI0tNQHz1C6WRRtq9wrX8gECuLcClrVlLXLqlCHs+mV/jTa+eEHU?=
 =?us-ascii?Q?7y8qqxZZzJYznJWdqyNh2+U2sK+ormvTKSYbOFfO7wj54V0LBG93p8AK3PZg?=
 =?us-ascii?Q?LkgpBpz9Mzd08f9oTuoe/nK5BXdvkbvF3eC77BHKG+BpPn/G4aPrmshYv7z0?=
 =?us-ascii?Q?cF07a8XsuVhTDUmiXjeTKrkuHt2OH/NRAHQSD+OYwCP9jZmBwQknvfVgtcEw?=
 =?us-ascii?Q?kpCLYrBBjGilpOgnXVIMtAhI28Y3UD8mhA8WfypS1LRYP5IoiWgstREQM4bU?=
 =?us-ascii?Q?3B36YJ48elI2v7PDkllHHIT64AuRMfMVBt7vQF2OqTEKlxF3d3MwGyDS2a7i?=
 =?us-ascii?Q?ZZ9FyDxyT+WdBN6DQa9JcOYj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415b33d1-880b-47cc-d93f-08d91b9aafc5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:23.8982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kfIlA+oc1ZnEfS4RL1SyWMrRNSjdrJIoNAEil3qNNvUy17E9//GWugDnaZaveuQnruSpe5DoMdamELxnbChNSNldg3dXl29XwxrfAKWTI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.21.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We have bdrv_replace_child() wrapper on bdrv_replace_child_noperm().
But bdrv_replace_child() doesn't update permissions. It's rather
strange, as normally it's expected that foo() should call foo_noperm()
and update permissions.

Let's rename and add comment.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index 75a82af641..384413c578 100644
--- a/block.c
+++ b/block.c
@@ -2247,12 +2247,14 @@ static TransactionActionDrv bdrv_replace_child_drv = {
 };
 
 /*
- * bdrv_replace_child
+ * bdrv_replace_child_tran
  *
  * Note: real unref of old_bs is done only on commit.
+ *
+ * The function doesn't update permissions, caller is responsible for this.
  */
-static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
-                               Transaction *tran)
+static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
+                                    Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
@@ -4749,7 +4751,7 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
     }
 
     /*
-     * We don't have to restore child->bs here to undo bdrv_replace_child()
+     * We don't have to restore child->bs here to undo bdrv_replace_child_tran()
      * because that function is transactionable and it registered own completion
      * entries in @tran, so .abort() for bdrv_replace_child_safe() will be
      * called automatically.
@@ -4785,7 +4787,7 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        bdrv_replace_child(child, NULL, tran);
+        bdrv_replace_child_tran(child, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
@@ -4825,7 +4827,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-        bdrv_replace_child(c, to, tran);
+        bdrv_replace_child_tran(c, to, tran);
     }
 
     return 0;
-- 
2.29.2


