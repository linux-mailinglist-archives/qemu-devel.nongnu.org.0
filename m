Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518B43F5A37
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:54:00 +0200 (CEST)
Received: from localhost ([::1]:41344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISBz-0001p5-5b
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyH-0002f5-12; Tue, 24 Aug 2021 04:39:49 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:20612 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyC-0007OJ-MS; Tue, 24 Aug 2021 04:39:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQzkMeD4sAdVxR00xrCW+/TSYy58IGfHQTR2XreQhgJGk0W+GhzHgZDNqRXS6ghIEj1FFb/WyEXj6LkqZc7iCjDN6OO6F+Ap9LWRBl55RoLO2r2j1QSG1y6fUt2/ddSdxTzYszgzwKERLrXLxzaLI62jQfnDwU+TL1hj6s7YXgvz4VTN4M+9yqMLzf2TZ9f/fHZ5fAQN3q1u38CWMzzlIca7F466CBqUsW0v0NVKGiQ9n8+vhjFUgx0TuyMg36UijxXqMyei+8D2SQLbT450DhYRULwRCBuuNh+beQT84RW7bJDtLI6FnPON9mVWuoY7IA3md66sTogUDD97zpxvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bInQE/uHeOJXFSRvTK95+xxJ8i89selJqzUmDfHwl4k=;
 b=eY7FMzrbQf329Zi6+uCwlR4VbD8Y5GlGpT92N2qF6zsZK8a19P4ueXSD5FNOwuADMfVLzEbBgNoWopTd9Tm7WsAohC4qgvzBjJjD7oM6C9ctJMQm+WgPtq6WwNfNtCrztJ398QmO3u4dulN0+N838MJJokoy3kDfLerZFyO0Dtg2ZII7hqetHWnKnKxMABtB+8Bby+686HU9jwpoNZV9XyzRDCmkGP95kHG7C0CT5KiehLGnwaGvz1R3g+oGVVJfcPKG4Y/1Jma7lfDimv/wzpuB96hQaDYVWxyWd/FnD1yLO8/LW7msRYQHfPBGZAs5MEZirkY1xpXJ8u4oHfMNMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bInQE/uHeOJXFSRvTK95+xxJ8i89selJqzUmDfHwl4k=;
 b=jRKR51bUxiYY7zx8KyMsHv6gE2DM1IpwQQMRLSO/P9NB9s38bGqwu6BjENhfXHS6XOAExFfz7ZmqQev+bPa0myOIOSN3hAU3zhsjOZgOJMtssHCDlSLMGRLmUfwnRBv+QgEPC6UqRpMSf2eqj/9TD2A/pEhxUG3bz9pv2kGCErQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 10/34] block/copy-before-write: relax permission
 requirements when no parents
Date: Tue, 24 Aug 2021 11:38:32 +0300
Message-Id: <20210824083856.17408-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 291a3f49-8fbe-487e-223c-08d966dab137
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17805B5FDA9EC293256D57C5C1C59@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n39OvZPNA7Vw85pOeonq7tRoKoCgTDU3R0B8LJi+8+iJ+9jfBP0LAuOYyFsSrx5x6Gq7yaPGupaN/Rh1xkdLhuuFwy7ESpkfAVRFBVvDbjGa/WIvR/MI6DRLA4Zj7mat3uZ/h7MzGYIMjxt+Q7asNaUZVHhxWhl6ig1hR/WwppeizVDvBiYy24pqqhO+CNTr4G7cQHzeVPJW2PCtpY85dMW+AZ10GtkQXHlYaCcImVpTq7LsBRVGmqFZNN8d59XMKLypqXTmVm+Y88Vdapn65wFhR9XPlzZfCZIlkWFhcOjOlTddO+BgCSsPsa0g61KJa9Q/jOzMKxMa9t/7sOW2zx1XQWWxBYLs8kXlEaDcoc9kGizCb200rTasUJwI2ZoT5weg4HhDwgu09omzu52bACWrTCEtboFne1y0e4E+VBeGoGduA6KCHTHyqnWl+pqtsIclAAuD0VRnm7wV6MjKMyZSE4vqR4LzBKC1jNzwxCScLL2ZS0sKwaOp2ADIgVKAAtGvRQTN8lgHO9a5ObRDQnEF1QsD5fiFiNvxTYUL5VcsCeWeRlutir9kbB3oK3bgLUT9cgGGA6bTdb2Vb7l7ovEe5MNSn5Sok/3JzlZPNAupw9cP8par/Iw0y70jC2ZHVNWmKXcpqYiPugjab+Dg2/MAjZmgFxVatiNQ/IPCqVMT6Y1CVMvMfWnyqxjypwBlfQ7yO1+cdBk5marfWlTjuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(346002)(366004)(396003)(6512007)(83380400001)(4326008)(66556008)(66476007)(186003)(86362001)(38100700002)(38350700002)(36756003)(316002)(7416002)(478600001)(1076003)(52116002)(8676002)(2906002)(26005)(66946007)(2616005)(956004)(5660300002)(6486002)(6916009)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1x6ZLOl4bh985vhLLMGjhjoRGuwCTy0445nBrkO6ZFrsRvSkLNXo9mfo4o5x?=
 =?us-ascii?Q?4He9zVq2tV9Q80BbblYqrgZ3+ZZzWg119m3TijbI3Y2INIB4bEPo5M1eef+9?=
 =?us-ascii?Q?YSivC0JGovVWkF2RsurvDcW4g07VOwEFYUHko+PVKAP3kPmQWs/h8M4YUazF?=
 =?us-ascii?Q?rfsvK5/H9m2t73uSXz1dJmlrRNoKaYzbNHyaQwK931/PPMTWVYxZlTd/32/M?=
 =?us-ascii?Q?NyVpP6mWzlGhq0lf/2oLLV5jXDI9pwMEfJ71+H1O4V27Uw/NiuJBgBJS3wba?=
 =?us-ascii?Q?KDzAn66IHNpCwNE6P8QlVqjXrIJJf3pt2dXzsW2uf4WRAVG0Law/GLl9YUde?=
 =?us-ascii?Q?twb/r0nm91TVL+OHhT91a/lubjAhR/kyjBKjO7viZL2/HwlXwCqqMg/iXrxG?=
 =?us-ascii?Q?6AoeR9ajqr7ERZiE0yttaeWbI5MsWsneqq7kb4wkxB5P6Rq73vZvxR10TNqp?=
 =?us-ascii?Q?McTw6OXkFTJc+wqZxAbp7/yibQ+JxpS1WhHIw1lDZsBl3dcNGFOL3Jd+qdqP?=
 =?us-ascii?Q?Qtwe9LNeXBtJymxmD7zFWa6d2sTDB8USKKI4sbufkT5ooLSZVqxcUjw0TiYH?=
 =?us-ascii?Q?sQPhCSCOzfcgl+LbvtTyGj3ZQdELZIZA2JZpZN4PbK+/FvhDpMTBaSBof+Cu?=
 =?us-ascii?Q?WIXAGxZGLorlmrP+dNbHE4P1IK1ZmAvyMHL1lC9TqOp1q2oyKXEqj0PoCS7D?=
 =?us-ascii?Q?mjmTIPR23Io+dzpFOY6KzUKfaXS8/7kiTNT97PjUviPTdEhB/ClRTWJJgE5W?=
 =?us-ascii?Q?IMZw4MJJ/nxOgVZ5S4nbPQp8qZ8Pr+7tHpxR9eiWYqpy999b6IYFvjit9Wf7?=
 =?us-ascii?Q?LuwiDquCK24nX5ZtkYY/8ZRao57BUUQO4VD/KmifImldkszCzWUJiQULSn57?=
 =?us-ascii?Q?lrEjI3KniM63qkHPr53drTOxrNSqmCErT5qpxb0Y4h2ViIWwv5Aw99/G/3B4?=
 =?us-ascii?Q?DX0wO34tbyQ7FXo2tACazlHQpp8XelWGNvi4b1zOghoX9OtgAvWVvrG/9D+6?=
 =?us-ascii?Q?izHdc3pVGe8Q/ZlfhWlUPNPmqHKFNEcoUrQRKQjjdytQDxOAB4xzCps7Myif?=
 =?us-ascii?Q?wF9DX0yDD7cZPwQA4W0mTmxBN21joK2KOBXVgsQKjJ1WQICIBNfmk+iC34/S?=
 =?us-ascii?Q?CfaWpfssva0iPIQWUktxCOg0LzgR0eCsJfKvzaBzotBP0bwGJpx1GN23Lnx9?=
 =?us-ascii?Q?gu8ZW1Aa2EsoZBJYqnSnk91mjQ8l7hTvzS2qSPScSXdwDCn/+nAAzC7jY+pa?=
 =?us-ascii?Q?o7+N9+Uq03j7Yndtbd06P953Yxt7Up+RZEb6P8KjsRLQ15ugPHX5I4EMXrJt?=
 =?us-ascii?Q?dRkE+F6zYnu0MU3yn1MZEJ1o?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291a3f49-8fbe-487e-223c-08d966dab137
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:31.3203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4u+YIqjYaRlf/QrU1/uLh5J99Hqi7PBU7TdMJHyjhRdV1a0bkbP2YMdKNYDYclSV6iqV/yXR3wHUWb2VbZQCUIV2f7V5rCk9koTGlML23XQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780
Received-SPF: pass client-ip=40.107.7.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

We are going to publish copy-before-write filter. So, user should be
able to create it with blockdev-add first, specifying both filtered and
target children. And then do blockdev-reopen, to actually insert the
filter where needed.

Currently, filter unshares write permission unconditionally on source
node. It's good, but it will not allow to do blockdev-add. So, let's
relax restrictions when filter doesn't have any parent.

Test output is modified, as now permission conflict happens only when
job creates a blk parent for filter node.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c  | 8 +++++---
 tests/qemu-iotests/283.out | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a7996d54db..2a51cc64e4 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -142,10 +142,12 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
         bdrv_default_perms(bs, c, role, reopen_queue,
                            perm, shared, nperm, nshared);
 
-        if (perm & BLK_PERM_WRITE) {
-            *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+        if (!QLIST_EMPTY(&bs->parents)) {
+            if (perm & BLK_PERM_WRITE) {
+                *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+            }
+            *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
         }
-        *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
     }
 }
 
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index f2b7219632..5bb75952ef 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append copy-before-write filter: Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
+{"error": {"class": "GenericError", "desc": "Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
 
 === copy-before-write filter should be gone after job-finalize ===
 
-- 
2.29.2


