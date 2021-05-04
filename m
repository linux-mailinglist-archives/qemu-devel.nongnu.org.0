Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45C23727FE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:18:51 +0200 (CEST)
Received: from localhost ([::1]:56166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrCc-0008IF-R3
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqwC-0000xH-AD; Tue, 04 May 2021 05:01:52 -0400
Received: from mail-db8eur05on2124.outbound.protection.outlook.com
 ([40.107.20.124]:62817 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqw7-0001zo-U8; Tue, 04 May 2021 05:01:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhjGmS6r4WqTMk4d6XIj3vVKrjIBqceOtKWUijsBiwEIzKCG5YHQ85/rm7oqAc1r1YBActJF1Ej7HVVSsrBORXe1b12vNldpe3BkUcD/h0mpt2wdQyRNuiKxaW7Mom9TG91cllsbvPdN0t6xiC4koxEgpfIi/LMoGqtnC8ojW9vG+o4C5yadWhR6q3/DhcEmZmybRLT6Ng3PWshp1ubxn5jPznE1/iNY7Y6tK8r/wfTKdwzScOxRa3IYhcACk+0G71qe523Xa8te/pbNx/QaFWczsFxzupjzZK2f2eTYuzb5jJEMg7m2Bpr4yRVrLTdRUU6PPbBm59uGXOBxMnOJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdGIqoBeyqkz4rWcWlmVwGGlfyLipswVPrYB45Ty2NQ=;
 b=gGawmCBiiiLfK1AUgAbxzY4JkFg/hccX2L638xEuc8xrYcss6OaufsrZ0wTgafetSOXJh6Fbp0Qcyk46Fn0lbI4uq3yNvRZdLHpfuJZjFLtQJtwpw3FMs42HwZoaGgH0rjUrwhS4MjoLGzLdqIoasi6AI5wT+VaD6XFBWmmzS7Ix7pp7zJ35o15Xgcpt90vbPdd7vAoRmhUzwN39VoXcW4gPQ8vOkhC6gGFLhCZgjM+SXt5EIG3cw7oeFPS+IApUXjyHuXND6RWwQ57yjppHLLNF6tVG5OdS7XM51+VgkyMIxthZz4b+ARuKE868uhTN3H9tP0PBj0jZiFzImqgsNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdGIqoBeyqkz4rWcWlmVwGGlfyLipswVPrYB45Ty2NQ=;
 b=IaU1KcsReHiG4U87rBij7WZ2g5/Rb0zCgT1o0TtY8BIixqeUR6qKVHuMFhj1UcpVAa3ZRwgBO/0gJmdARl0HMg1tqkMYdHKrcuHBcBgg5dIxoTPhaRyaz+l9+LHc0ZVD2lsoHplIfYPRxdxKIPllgpNKX5sZiiGKGsy2d82RBOM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6359.eurprd08.prod.outlook.com (2603:10a6:20b:31a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Tue, 4 May
 2021 09:01:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:01:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, peter.maydell@linaro.org
Subject: [PULL 9/9] MAINTAINERS: update Benchmark util: add git tree
Date: Tue,  4 May 2021 12:01:13 +0300
Message-Id: <20210504090113.21311-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504090113.21311-1-vsementsov@virtuozzo.com>
References: <20210504090113.21311-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 09:01:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a45f1a16-ee98-4f17-f2dd-08d90edb38f5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63593D59EE9C9EDF1358F884C15A9@AS8PR08MB6359.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WD9O8ucgYLyHV6yHUnDsZPoztwFXPYtgIC7JEswOey2kLtpxhlhjzo3d9bbnueC2L7Q5Q+YxO4xVjctb6OaIiQ6Tpvbm5tpMJvcqXKfLkPqiVlGpywsC2AoQlyDm6b7v3027wlhfoYWxKfJe70U4IdV4acg861LrwX1ZpASrNmwQf4o0Md4CXVfRv/GEzcV9WpgGaZWEOqO8XRgZm8wY5LBV+Be1Y9LkBw+/aZHf2w/Yd1DnvGHdDTUkWGEobCBaVUaDmzkzrNTryJF0WAVuC0mP7RnVDiznJRrEO73BVnp16d/dsAFzloFz0UEQ4MxSF5PW7efz/UZQ+gbwW1VyqkSptzElCYT2ov0bX5kcazlT8yJUFNAH+dRxWqVe8iqrzVtkz5cP9NQR9K7FOg4ylW8Vaw5eq9yt+2SMsoNcQrUX0X0AESjIEHhI1UYsvw33Wqiu3N3pOTzJfnWcDzaRpab0ctXH/BcRtgGNhqOedqm4+4z+Jw4QTfOjSg+Gdkgb3xfUIoLbp3nkfnzethhcwqKgPcWSNmgXh0u3Glck5+kCT9P/jErbqNnuTGVn0ILD1OumBibhYo704kegsRCwyqRZPJe5xinNf+IzG5YPcBzOY6ZJGc2q2nEKeQFYY9kVWgB0u3RW/+pDMXK2DT5qvnAl1LCbn0mLCbu1LnLyPUw619qAeTftnPN9jsRqo7tTgr7sGAhPVQKr9UVqGwbvUrA2v7yD47/Gqr+F5byPBBeC/MZxWrGk0P7/qyv3bHHLBGdtpH/tE0/qBZDkfNovgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39840400004)(376002)(16526019)(186003)(36756003)(38100700002)(26005)(6486002)(4744005)(316002)(52116002)(6916009)(6506007)(1076003)(478600001)(4326008)(6512007)(966005)(8676002)(956004)(38350700002)(8936002)(66946007)(66556008)(66476007)(86362001)(2906002)(5660300002)(6666004)(2616005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lKam4+k8w6ebtr2Ijvkq+ihp++ByZgA8wQG+ozhPnN8UeIR9ldXuvrvV2eFe?=
 =?us-ascii?Q?oe7kmVIk2voKij3j87gyOX51ltoaBSh9uYznrwBSslo472mlcInzB6BmdwUG?=
 =?us-ascii?Q?n+XuFyLw7uSuLdM9DNZ2lHi785TuSBu2XMFdofLHM6uBHczjKIRslJyTeRXs?=
 =?us-ascii?Q?Mk1vHmpBf2/9pJPvy/82CVe8LgcDg2qH+EfowJX1BrVibPqfGNput5fGwO+S?=
 =?us-ascii?Q?GXNXYZhRche+cIxbERlQ0Rg90HOjcLPHPkS/TIiANtml/x5z8g/nCH7MymWr?=
 =?us-ascii?Q?aHLIguwIHu8IPWOLVO/BL1QN3kUJSqg4q3C7k6WE+lBLRTj0kIyLNAbx+U4s?=
 =?us-ascii?Q?UY+vj8AanDbExglMBjq/DVKPbnIkVfdT9yCRZB7/JQD1kuxRqO4sMYHMwIEL?=
 =?us-ascii?Q?NSDQwUQpgL/GAKaqv17rXIDCpw7NtBVkMV4kU8wGLLoH30CIqPXu6GTDKeig?=
 =?us-ascii?Q?TjA9Oy3F2G8YIAnVXjsmDRyyyq0OEGt556RYd3Y/Wx1+NuoMz4wNM67WBRHL?=
 =?us-ascii?Q?PKpmWqpOZk8xxSnqKMmy9hkooSAzQ6jIWYYdFgXNjG3tB3zJ4sGE0IRd9p84?=
 =?us-ascii?Q?w37Qaex0XNpR+C104fK0qC+EDfzsqHythfF9EywZqjU4uREGbvUGTaPDBS+j?=
 =?us-ascii?Q?jNGKUo9W+u52wKIwuvoO0Y8Y4kaquynwLAB2P0IcyKY7spysHPXkQZEnUx8D?=
 =?us-ascii?Q?tbGgXhJ9OUyQxSJ/u+11k5ynNbKeFQh8dl9aMd9cUDiDGu9LhLs4IHaUW2gI?=
 =?us-ascii?Q?1nQgwvFtlf4AvIAIU75ZWP561E+mkSvG/NWdBhMGEFx0XHUT+Srpi2dif2Ue?=
 =?us-ascii?Q?tsi2tT7xfyoLUOcfklIzKPMsIQXItCEvpO+1+ohkoJsmJUBvrxcxR24oQw8h?=
 =?us-ascii?Q?GDKtU+pC9vcjRipMzS3mGD798SZFBy23XVzIhIWoGfY1G7UaR3jVhq1QLZ/i?=
 =?us-ascii?Q?fAPJ9y2mB0CYjSi+qzhoK+4Fa1tkwqEuiQtaFf3YCLYKKGSOn+Q0pHeWeMPt?=
 =?us-ascii?Q?HwIM8jsg3yVEAg7YO1Cw1l6lO+GGzPChA51pGMwIeWB3veg08WXOFxECK0IS?=
 =?us-ascii?Q?AN3UEspPk8B3nh0zObckc6TeaBtCOWRpZE0Mc0iP54OL8YTV12mFhl+NOrFd?=
 =?us-ascii?Q?0JY5a09qvWFFl2l3Z5gQZ9zNmm/StH0LOQI/tXmL0pUGGzZQ/z/hbgaIRUDn?=
 =?us-ascii?Q?uFCUXFHOeYCPwr1XEOzfURsJcYqVmSZEXb2X5ysdBsLddLPuIbkGxYnIXOG7?=
 =?us-ascii?Q?/AMJ4UHy3Sqysh+NnEZlTGHeaM9F6cnT/lL67bk+ThLH31JkIPsxCZ19bq8I?=
 =?us-ascii?Q?si2o1c/Te0YatdvMAHkaw6Gl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a45f1a16-ee98-4f17-f2dd-08d90edb38f5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:01:36.7089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dB5i9GMhsSOLecRELlfCXDXRk5cbhm0QYTbm3taga0roH99FlMOuWOrwyR4XRygD2ixlxULDM444a/yGTizOfV9tEeh15w+jj5PQjiuHzDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6359
Received-SPF: pass client-ip=40.107.20.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4c05ff8bba..f9f2acea8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2531,6 +2531,7 @@ Benchmark util
 M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 S: Maintained
 F: scripts/simplebench/
+T: git https://src.openvz.org/scm/~vsementsov/qemu.git simplebench
 
 Transactions helper
 M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
-- 
2.29.2


