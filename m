Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F6C371490
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:49:38 +0200 (CEST)
Received: from localhost ([::1]:60706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldX4z-0004gt-MM
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqQ-00008U-5a; Mon, 03 May 2021 07:34:34 -0400
Received: from mail-db8eur05on2096.outbound.protection.outlook.com
 ([40.107.20.96]:36951 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqO-000054-ED; Mon, 03 May 2021 07:34:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4S0xY0AUmmSAbZ5YTiG5rZwa7HtVuAF9BS0Wb2hQFmdGcQ27koenkx8j2jh9GPpjChQs1KrziUIanxo/tnpTeE+w+Bu5udERrUgN8FR5gOqB2jjxAwkhcMZCiL2LzYOMnM5YXeqR06JhlPWv5eA5s6GdFhmsK4WWMQTeKrcoGyega2KMVma4t1VV7eWiRpC4CiCMdc1e930YWMwd7t8yIjV6z9/q7RhCNEQNADvzo54v+xB2ai6GJ3BPw91S2pVTmMgRC33NYuoJEhXqY3fDRuHORpXX6N3wrNvT9h2gHl2SYsKFGugTHp9BsVd3ezyLu5n6OmIymBaTSDtMGhe8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jMGYuXvnUMFwLuZnSGolYql//koQ97rDvTpYyVWDtA=;
 b=VPkSwQqE9Ur2fkjaIs06vhMFG6HrBnXRieZizSTavAZTYiGHp9lAwuXnNHVSFSsXN5NP9ONUgRk9Yq71x/3hwRDCZMnNOJmxg6b4v7D7ifIkO6CUigVq+ht6MglpcqmqconuDsg99n5lQQTsLnngSAYdBIgsB7Lo8xL7bhPKVAHexY4icLqoIHgCTVAsRufLQkCfnDKZ4G6JbbmpIZxNwbQNjmAp2BLCIF4uRxsEcFttWZJPgWZyDPOLX95Uam6+bi6Fq29c7iGWUBcwPdYdXjT0ICma0gVNCy5XlN3KO9yqEOOZF2StmMAQwImONLOxK937DZhKe9xHNlZcjWqRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jMGYuXvnUMFwLuZnSGolYql//koQ97rDvTpYyVWDtA=;
 b=SbH3cKiS063OoCVYig7uclMWBfuvCT7wB8zorq4Ae5/mPjoZvemX1i79Ji8Usw77vVc6D3Qcj58R9ky0c5FxZ3GdKJY6KzZS9ByYZnFwXAuyUzLAZysyaTvVUmq7aiXq9RyoDKWKIceVqzFiwU+eBCiSFK/XL7NOeJAHkrCNBlc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Mon, 3 May
 2021 11:34:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 11:34:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 5/6] block: simplify bdrv_child_user_desc()
Date: Mon,  3 May 2021 14:34:01 +0300
Message-Id: <20210503113402.185852-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210503113402.185852-1-vsementsov@virtuozzo.com>
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR05CA0255.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR05CA0255.eurprd05.prod.outlook.com (2603:10a6:3:fb::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 11:34:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db188f0a-e5d6-48a4-13b6-08d90e276497
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB171360198F08710547E66F0EC15B9@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n5sb8lEBZJfJ141ucoANb5LgMgDoXe26vST4puMI4qwBlEFuKlTudUEnBNUlxN7arsFQI0dI5YIwE66wDU+nO6kAxowCJJJbgEmWFvh3ZsrXtr255wTEjFj8qePamIlHuRTuv7fYTZFuzOPQULTKvzuj7LokE9GlAPoWKqujpS01jIxIksORqpbYohLAlgKBgLMtu6MfHTUwaiGBnH70zGmezO9TcVbtJockS8lIeZAHqIcZUdhU0YJVK9/5bDm/9bUXCmDnMn403+9Fn6bgb5hEoA7Ypm+/AtUiGhbIYBi83+XIgYcosX9hqM09iLw2qckjCrz+fph/JAKtCz59PKU7TMOz0bfj6JjGa966IPAAGksbkFkeJwWhg2uL9F2aGZLvoHqSsvbOXEUTSNd3VbOKxvQBNGwLMXv+yfHokbCt6APTg6bI1ldzUjPe0Wg1hVxxc++j4xQBINNQb6flpLC2/d6Hbi09T5OcHIIKVKgkQqmgScANwr5bHi2h2hlrmd76My8xrl1TzSYbrikHgJVTJw6QPpaFtP/m1Tu+IylKNeklQs/tjm+3hSEt11hzTv0RjT/FGvu4uBNXtiuya2CUfaKJvOlfGn8f0wGvC1iYhblhEytsGnqa/roAuCPoUzGI742azwU3hRn/cEgrGZePJfidqgRhRsb30fTug8ipBD/p0w0uc7hppFeEQa25
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39830400003)(346002)(396003)(107886003)(5660300002)(6506007)(956004)(1076003)(2616005)(6916009)(4744005)(6512007)(52116002)(4326008)(16526019)(2906002)(186003)(36756003)(38100700002)(83380400001)(66556008)(66946007)(66476007)(86362001)(6486002)(8676002)(8936002)(478600001)(26005)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?I884Y6X+GuWbqdM0MWbw7AqUfQQIu9rPDzXY1ML1WTYmnTG3+9wryQdGJlUk?=
 =?us-ascii?Q?Zk+csozAEHUIwYndOq/YDLW3RXQHfSzMdFxabUMDBr7Gh4zxKn2C8R10D9HX?=
 =?us-ascii?Q?J3GOz0m6dv3y0CyCS42T6HCY3fFzRQx+M3Sr7Ol1puh1JPdCBQQ95p5xATL9?=
 =?us-ascii?Q?IIlMC5si75ounNqUO7KZCl4mlHPDd1jrT/SrQiWtyP/ZUzDdNKWH09QdNRNf?=
 =?us-ascii?Q?zKHxAwE+nkmSAOChxY2PfAtZoV1b+vFf/qj8/jv0flW14zZC+SEyWSqFDuSf?=
 =?us-ascii?Q?R9vOTaS95Xvd6UlFG2q7DQf5mGl6kIG5PKMPvPKgK0BZYcFRaUgruOeOxhig?=
 =?us-ascii?Q?qCdgaNlyz2r5oYiFHmjSmGk+VeXRuXxesg+SEn1yPAjTAA4TEqf6qRC13Jg4?=
 =?us-ascii?Q?iAss5L+eS53WHaWQmnyKn+8IWecSjBMyk4oTvhd9pixvTYQh+JlFJBddhxbk?=
 =?us-ascii?Q?b6YFfgFewqAE73CgwrjGXQ6+zpkb+ol8jbw2W6DFNSvsE+bbq+7vxR1o7QPY?=
 =?us-ascii?Q?7rHv6Hg1pO3SoveYuhEq4DgbaW/3J241alaLnfiWfEtSMk8Mbo4DTB4O4IOG?=
 =?us-ascii?Q?3KYCRtnzboFmtfCm1AptEWM6bicbcgOJ3eddnVz7utSGBtq1w7al2OtXy0oW?=
 =?us-ascii?Q?kobJ1d+mehrveUm1bEHFkl7HGuqTUcenTAgaU9bzN8g1cE9kivcP7tXOe5//?=
 =?us-ascii?Q?ziupXAvAhVnofoJRFzgM0maclSXX7wIO74Mx+DAY7nEdkTj1E/0sufp7vtFo?=
 =?us-ascii?Q?ZHXPC4QvfuuhSn1/QYvUAOS5M9IYymJY6YYo6LWy7SdJw9TE+yLokDGgDgx1?=
 =?us-ascii?Q?/Nkig/AVBs/J9gft7BjOXThtZeeeN9WJd2YQaa9Vg085o9ooRalat3elFWxg?=
 =?us-ascii?Q?StqJ3Rhp5UvMeLnuCndakQrlUHdLPJibeh/6uSSv8/Sp6VxiBFrEF8irnmMB?=
 =?us-ascii?Q?7L8PPJl/m845+uZIYNtcbHLz7H03g3aZ0QUMZgzh97e8M7MIvGK7hDbiOanY?=
 =?us-ascii?Q?Yz3jfde//VBz1BXECibPHhNBgNiuGhsT1EZNT5ZbBWzg7+XChHKE+WuHa2DS?=
 =?us-ascii?Q?IsClBlPrYj8J3WEJ69IzR0Y6vh2jNyFphsCNcb19UF3qq5tqU+6mIfVxiEmr?=
 =?us-ascii?Q?lxQmQ1ItoKz3w2aqj5Uev3Smfyjl5nc5N7yxQ/PUUUyHj5afmOdeCJEifU02?=
 =?us-ascii?Q?cJIqBrWfIcSnTvkzSUy9i41VOKiPiWDsJWxyo8JX6Ruzh3ADWeUuKjfqp5+q?=
 =?us-ascii?Q?ipQ0qsXiVJPGrzZzu8yOoWZAeCOlluTsewLPGVm5FlxCg8aTnEBiq4a8WjOR?=
 =?us-ascii?Q?z9haIkoYThuuUefuMQACHJux?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db188f0a-e5d6-48a4-13b6-08d90e276497
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 11:34:20.5046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDZtZNHwLv9qtARXIzPoPcFaC47VwjEVzTvr9UVE735SQxE0VTRlywx6fXq7K+UT51xtW7qOxvPDnHtaGyH5gwSRhD/PFYSqKB2Qxs8t088=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.20.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

All existing parent types (block nodes, block devices, jobs) has the
realization. So, drop unreachable code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 1de2365843..20efd7a7b0 100644
--- a/block.c
+++ b/block.c
@@ -2037,11 +2037,7 @@ bool bdrv_is_writable(BlockDriverState *bs)
 
 static char *bdrv_child_user_desc(BdrvChild *c)
 {
-    if (c->klass->get_parent_desc) {
-        return c->klass->get_parent_desc(c);
-    }
-
-    return g_strdup("another user");
+    return c->klass->get_parent_desc(c);
 }
 
 static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
-- 
2.29.2


