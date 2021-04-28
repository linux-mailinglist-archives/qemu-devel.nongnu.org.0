Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A9F36DCB8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:12:21 +0200 (CEST)
Received: from localhost ([::1]:41482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmnU-0001o4-Oi
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyk-0006Qr-DM; Wed, 28 Apr 2021 11:19:54 -0400
Received: from mail-eopbgr80094.outbound.protection.outlook.com
 ([40.107.8.94]:21824 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyc-00028Z-N5; Wed, 28 Apr 2021 11:19:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyrnKu62vKDp/nfMQ87Le28xUyaUOZ7uZYSCtLPazsHYGCS/8rVoTWuYQ1XUCAv/NF8vyq1O4RT3E8I+mDj2LqtBVB5jwq6fMdKQ30t5/QETmhBpQtFT3uSlMIJTh+gQ5RTaeTC72Hib4vKAcwvfM9WcPv3FJiuWhUfJgV7dqhHZ0Q8zrKuzZrgxeV+Z6oDWZnUTHUXHHEtdi0ONC5jGoRnnbg90kyxfemHezdIVh7hO0nXYG0FxtyHIngnFBBdXPvC0HXe8E+L4yJt1kAm/RIhE+I9v4BxHKFlgE5bn4p3JIbn7JpSf2hQ4+BVJL4SEOop/Mobusl6if8x/0+YVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2El6aohLf3zkooI+U3WT8q1gOu9wmm5ElO9J3szcBo=;
 b=WnQg3foEyW5fqvhnTgF0HmYKvvHLDK3YFpg/hz+aR05qG/cje9EzXTXyPDuaFoTsoarOflDsKiqt2k4Qq5Q6PeXVevnrAzO012nIvbdFi/oJD4sKCMmh0hiSY2W3wEYkYopTtXkdQmFRRbbYbRrjawSvbawLuk+4btCYebWi0dATmqCpojmNhQlWye2Lez3jqR2H5CtVCQ40elMJE1MrCgWAJz+5G6IxFUtIPvF0LoNRzNtTIpR5JuMA63YMoCyfyNSQHYdn0eUNPzme+AkgFOvCV7aMkxZ7iYArFh7JDb00ImHW5gFWHXkWceRxUL07N0YbY/a54632vL4Qap4gyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2El6aohLf3zkooI+U3WT8q1gOu9wmm5ElO9J3szcBo=;
 b=TSRs5WA9aX7UeJRbase4tIv6t7I+lraxGfe2OAkal2fsuHG+nItylR2PIc4wGF6axCD+HHC6+xuNcQgsu77lX/lJHPe9MobYK0Ok7WjJmIUpsTGXB9a565ZsL0GNj10DlaEBGQSnIoJGDwN3As9JH0GwK+6QtqxZ90gGKCbU8lI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2419.eurprd08.prod.outlook.com (2603:10a6:203:a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.26; Wed, 28 Apr
 2021 15:19:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:19:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 35/36] block: rename bdrv_replace_child_safe() to
 bdrv_replace_child()
Date: Wed, 28 Apr 2021 18:18:03 +0300
Message-Id: <20210428151804.439460-36-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:19:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2db223e3-dd36-4415-d2c4-08d90a58f451
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24192CAB5C7B28A534634BA2C1409@AM5PR0802MB2419.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:24;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rzukEBDAfGJvVpyabfMDVRqw77fFlqwJk4l+Rbh3uLGuK08ufziBMo3so1e3lV+gCyl9RcminF/Rv2ivKYSmBNY1oJ5VAnNEfIm5gJh8dMjLsEUKHif5bMVsU2UpgRNsAePm4qzLLmpqE9URrcaDpnR3Uorea3FyvUIC7vaXpk/8/NAUKr0teMUQI9/weHnfeIepLERyDc6TyeZrtda+TdplMHOTBCv7oO57G7hHdzudI5aExLuYUfSWJi5m6yYWWBpCZDlXdjvTRYJVeWxAYJJajz5JKDtExLcTXHK/nKRNJD6FIIQLnLsRBJ/lOE+ehfYU/O28gEBjDIIsql67/rlFqdDo1ahun7MC5RGgz4LsxByUmamR7LcS1LnqjAwxu3aFHm49TZVc6BKXnEBZgEvl1wkhtIvQhMxHo/8TtJZTkVeKB1rIq8Ky1UkIxWBOlfvZEsda7OT0+XKrWnxVtSDoH9+rQHq+WANbo3hQIYvTmYpnUvAruktbWJpxJstb5w84H8ZGgtXt0V/Ml7lh5a6h6dCNWyQ6zev3rB1rkXblepnrGAmwVp9NuV/xLyBnm9t1ayhJMRGhnvNLh+YExg/wYuNz9a33It76bHuD1OQJ+EKpDTKQG6WY9h6jxT2F3lWYeYVqG1MEK4Cr25I+XAk8h2rcyj6uJegtwrvtGnERwl4RT+aouhT07rxr7+va
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(376002)(346002)(366004)(66476007)(83380400001)(8936002)(186003)(66946007)(16526019)(8676002)(956004)(36756003)(38100700002)(66556008)(4326008)(2616005)(6512007)(478600001)(52116002)(26005)(86362001)(6486002)(6916009)(1076003)(2906002)(6506007)(5660300002)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Dl8wI2AiY1SVablHk33mQCsxkvciFhiF+bHJqPDETqnkOIouS4IEI5+O89LQ?=
 =?us-ascii?Q?+S/e1M/s2A8tyvwCWoGv7oW2jDMqru5WZ4jIUYVTftqi/vpWfYjUg1RlMFrC?=
 =?us-ascii?Q?TyIODz2DGP99wu2Y1mjn31RdTRrqiY7+ytx8F5Sf4EjAfYL/0CBL/8OVYogX?=
 =?us-ascii?Q?MDj11OLUZT/INnQ2dJWg8F1S3VjBf9LWYq/1MGBPta8TWTXMGKdr6TwN6EmC?=
 =?us-ascii?Q?nkk/m14DS25oWCfIUT5HPaUH9pjv2FaC6XVLmbdaxY5Dfit0LqMP6WdP4vUL?=
 =?us-ascii?Q?ouGhxzFM+VNPJfXpdl2XgoTXvQTYt9wXaf6CmVUrjWErOQonOnz1TDh2gDJz?=
 =?us-ascii?Q?e+IRzj9t1NL5r7/hRPsa2JQT4Y3903KPSNZxebNfRmZuujkDMr7H1Ci7mVHG?=
 =?us-ascii?Q?8fB7jtD7f8ifCD0hqlK6f4F7wuKLgGYqzVcbxJFToY33TkT3jFrrKmhBIAGp?=
 =?us-ascii?Q?WvWqGXGuMuQSf4giL1DroY6FGcmoCX7pcf+L9HfiCAyJQRa/xrgdTEf2MRvD?=
 =?us-ascii?Q?4jysiG9L94aBsowAxjzqQITUZwfwJWFIynZy/e27kuYAHq0posZbnDzAjTD5?=
 =?us-ascii?Q?KXrBV2AWtEQdgtwvcXjXTNc3ueQsKCQvVvTYGeD9GKQybUZdWZjnieX+0DfW?=
 =?us-ascii?Q?BvUTFZL5cQ84NXZVKyUknQ4tV93eBKS+XJ2kx+aFizA/gkYSgv+pkp4F2/fl?=
 =?us-ascii?Q?WmSEQVtp8C4ycLjNqvSItCNBLWlEYXa4hFgXJkLH7gNXJ1YyR5kXVtsZ3slO?=
 =?us-ascii?Q?ANpdhtMRImpRjYXq7HoVOudgMYdYk9SyTDNmAKPyMHtfYgRxqG3fOOotsLYs?=
 =?us-ascii?Q?3uxj4cfiABJWhM1gFS62VIY7ixxyjri5B0J+F+37cb5NMc0lTV+NQOuZf2lb?=
 =?us-ascii?Q?2Q7LEkxsHenqxPI8AhW0mToNSdOu9YWXF4NGrcExcjxDZ04AB0bIXY9SQ1hE?=
 =?us-ascii?Q?3uiqOykaR2CjD6lmmRXSz8YuZZu6K6ZGBw46W94thNvYhgs2n28KQ7EEx/tL?=
 =?us-ascii?Q?5z4YEiljq3HMf3MGGiefkWg4kHwiFbqm5Uhm9DfD6B8kD+VFCWgV1hGQGSbj?=
 =?us-ascii?Q?RNsIgZI5ZELAjSm2EYAzSImKC9Em1FyVtk7AJNyxxf1dKzpagOCkaVOzidqp?=
 =?us-ascii?Q?JUdXJ6itE7F0M18lHYGLuVDS95mxDZtIOvEMCYDUqkgsQhVYxmKp6Yr5NQj2?=
 =?us-ascii?Q?YRcFvglQXhfW3Yx6Es7P+xQMIFfnGA1dp5NtLTlHz/Df6ISILcll43+rRjsp?=
 =?us-ascii?Q?q4oxphxrACRVsWQS71MBYN2JH3J2nVxmbTNCbCNZCBz43FOKBw3zU0RbhZEI?=
 =?us-ascii?Q?oww94n7DYtEAUl3Ojx0mqhGV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db223e3-dd36-4415-d2c4-08d90a58f451
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:19:02.3452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXaf/l7gks+haXrcydKxb26NeCWGFLqSLsMZhS9qeoupQ55N51+wyVXtYgzeR26jxGy1C+MXxXJFl74zHbLxrWybU3f+HJQdF576yxzWJd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2419
Received-SPF: pass client-ip=40.107.8.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

We don't have bdrv_replace_child(), so it's time for
bdrv_replace_child_safe() to take its place.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 7b2a8844f6..df8fa6003c 100644
--- a/block.c
+++ b/block.c
@@ -2248,12 +2248,12 @@ static TransactionActionDrv bdrv_replace_child_drv = {
 };
 
 /*
- * bdrv_replace_child_safe
+ * bdrv_replace_child
  *
  * Note: real unref of old_bs is done only on commit.
  */
-static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
-                                    Transaction *tran)
+static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
+                               Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
@@ -4803,7 +4803,7 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        bdrv_replace_child_safe(child, NULL, tran);
+        bdrv_replace_child(child, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
@@ -4843,7 +4843,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-        bdrv_replace_child_safe(c, to, tran);
+        bdrv_replace_child(c, to, tran);
     }
 
     return 0;
-- 
2.29.2


