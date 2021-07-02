Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B413BA4FC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:19:08 +0200 (CEST)
Received: from localhost ([::1]:38384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzQZ1-0003eU-38
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzQWy-0001Ep-Rx; Fri, 02 Jul 2021 17:17:01 -0400
Received: from mail-eopbgr60106.outbound.protection.outlook.com
 ([40.107.6.106]:49763 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzQWu-0003iz-QB; Fri, 02 Jul 2021 17:17:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iN+aSysTKtAfURlAxuSORyRFBy3ewcbZWxLSFHf3jmFUdWdRBUXbMUAlWEH1BowHKKg8KuJVRu8KriPLtg1i1npWyaFNak6EJYkPMWIv8grZ/3Q7vcf712kWNb7h64OZdOAqZCAmPFuJpEbRdgR05yJCtcFFZADzK07oOApChwyWuBVgmG518dAFuV6YZ7qaNZwGWLSnqjm24xpRTsvCAy2I/qy1abueoUnTr5H1s3A/gI7TYn8yjVf0e/njp5HNHOYAdKpKXFzmUsfWuphKsvKXRLk4lgS0COtinCgrVykxL+0AIxRoNLRXZ0mC7/+K3W8TBG0Y3M/uZhGeYTRqbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZZ20MjNKRimtkaelOnWgTmROc3p0drlPLCr5yUxTd8=;
 b=R6X8DIoQnh+Ig2GgPh5ilvfY8maqiARlCnTFdU0w28Pl4S9yz1BYH9KeB7r/tzsgxcb3lUz2zaOHhC6f85hAd7WK3/z8usE4BkmF1oKP2Ip1ALLf3jAs32f/V5/evn0KVoIyqYHzoFgO3n+T9O3UlMzhuAjuDGYPPC61rAoj6NUW6i1Vq6PiYdwDkIpQmAs0vl+9CTBzNSgjqNgfR5G1LP3L0wINaIsoxL/nmn3vZdzIL+RQcN5wPKWJDlCV7sZpiU/hQW8SuYdcWp31xJLjhdZ+pf+aGrSrv29L+Y1JuSPqWS8c5lhh8Ja2VoGx/STBChhrnq2RWAUxe9jimfnzDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZZ20MjNKRimtkaelOnWgTmROc3p0drlPLCr5yUxTd8=;
 b=ToQf37zbxakyqh8fCFZuy4DijX1PyDwww9ColdtvKb9dxNaNHZ67PKbeQymjTBLZ5Ys5sMq6mcmZvfdr2/5MC8F84NiWonHPS07hGsauSDKBetv/WIVdNOrsZqXXUyoU6Lbk+Ux24xGmY08N/ZtwmCtxDL45W1EhJXR4peC4t+Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 21:16:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 2 Jul 2021
 21:16:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, dem@openvz.org
Subject: [PATCH 0/3] Fix active mirror dead-lock
Date: Sat,  3 Jul 2021 00:16:33 +0300
Message-Id: <20210702211636.228981-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR02CA0112.eurprd02.prod.outlook.com
 (2603:10a6:7:29::41) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR02CA0112.eurprd02.prod.outlook.com (2603:10a6:7:29::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 21:16:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4daa0c24-cfe6-444a-3ffb-08d93d9eb59c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB469117AE8A41A56C3CDEE66CC11F9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +vpNOIYVrfOE7fPw6YFeSKwVlGUsWamJXb8dwpNUyUNi635KDOCA0RNAfwfQwBX2Qh4/27aggYPyG37CCKxtwR+9ES9uQ0MbvK7inIDdzRj9cyeX8lOyOlrtlInoTmyr/d5NTvZcezgPoXW0EDj+UIVB0YxqWKtng8vhYV3L0sBXSvpW4exOOyco8LhOl1ZriUMzGXdrdkGRhPrJCEOodHe5OKEugn+k+9ORZinEhRrspKGCrhyBu6VTzl9bpVx/XBxY6tgzaMxZfpw8NOyxT43lD1NgU/GzubvWp3kTxAUyz7ZQIU+DrIPl18d56vYhx2eeZT1ChH8+dtjrcNb4NjJXJuP9C2l1ZhWVK9p+1N54NY57ybn7shyH93dll3L7JYi5KJe1O9kpS5/buBg61der8N97kXdY/nPycyrLKCVgoowdMKV+9xBSWRP7ZliDPnO9ixw+99rSn9DRovBm9kvckcwuXcfpvpJ4RtaxPDOQ2CF96viliPlymZ5GItw+WZs8Goc7mDjr51gn3oukWACzsZ3tT+nTzgMJYXk7NdImrrQKAmLlf+Zma7VTJI58eNQidMBkOIfZJkGx8Xd7vDwh5K/rOYrX1mZwS6NZB2edDrViCn3W4duwItgLTGmBgwwfnhvFBuDTCZllO0ea8crdKta/xBzRFdM4Q1d/fB7rfkMvPv6L24i1FITELVbepD5gen5wZ6nhI2wVKpB7OVNg7dcfWBul+QOr4CQHw50=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39830400003)(376002)(346002)(1076003)(86362001)(316002)(2906002)(52116002)(4326008)(38350700002)(8676002)(66476007)(66556008)(5660300002)(38100700002)(66946007)(16526019)(956004)(6916009)(83380400001)(6666004)(107886003)(36756003)(6486002)(186003)(478600001)(26005)(4744005)(6512007)(6506007)(2616005)(8936002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TZCCfEIdux84qQjBEWybsNKys1Um35V+VpWTq13xVJutnRvh8WRBFcQV/3iq?=
 =?us-ascii?Q?NsviAHyns/7zQjYcCWI7An5L0gaCapP8W5/BM11Ielz9FH/XKS5164LI6PxY?=
 =?us-ascii?Q?tucZc1rZok5j8K/ZGzHGvrGRby2fTHHvbIg+mWHyK1a0Ans+JWV2aPg9jixx?=
 =?us-ascii?Q?tnSVCjXriYloI5Op6FxahMHX3qwoFI8R9Fnv5IH9tzNn4zjpP+SGLhpSD6ca?=
 =?us-ascii?Q?vml1UKat2FNaWvQ7RNO3jPxjJwW+30DsDt8JDBD5Ycab84k4yEG7zr68AR+T?=
 =?us-ascii?Q?a3Dt+CYg33On6k4hGXWGGfou9+b4WwnOBxsAIyQHKa646Mf3Uz3crtV2yc9N?=
 =?us-ascii?Q?9IIOQ0fda+RYzh7eonVCJR9I4gcPwTtuZbmsnBM5fOGWq+gk38bMo0Gwbp5O?=
 =?us-ascii?Q?yaVk7gDjx//KDhybp5hyYEwl2EV9b5VS6r02UTp1qFwm1SNgFr0CqzqPSVuR?=
 =?us-ascii?Q?W3MxIu0VsqiIM/U0UCXZDYBwZbp+o6RkNysV5eNUU4K8lf8huR9CAAdXqx60?=
 =?us-ascii?Q?MBuaCVr1dVFrkDSOm2N6lQxbjocIYnbs3iPFYk1ixXr7nuGJ24opaNLWnp3i?=
 =?us-ascii?Q?rJMpJB1H4nsCB+RHwCFIz4AkT1ifbEjpYyFhemjUHDj9BjAuP71N1QFOZFYg?=
 =?us-ascii?Q?w0F7L3jxrlPFQVmODYe3Ry76KzZZUIVdjofQBburiPMwDZae0yCQWxVKFwFI?=
 =?us-ascii?Q?w5fKcUNlPqPtXUemlWJojHlbcNGgof2CdfF+KPR44nJjIu4fMOWXHUwWAz4M?=
 =?us-ascii?Q?CvwGIEjlLAED3bQuLdUdGgNmcFoDl7Cdn9WaSumd2krP79deOiqi4On1Q0Cx?=
 =?us-ascii?Q?FLEW/M31GaO7FHWtbovrc7VD7uLeIi0Bt3sEadYU5jnYteeckbTYbji1M//+?=
 =?us-ascii?Q?XfCnbs8QBhIuYlDKnB9JRP4LiOuJ0Unrt5KI6lHweF430Ncf618hzdO165sn?=
 =?us-ascii?Q?OqgIOOYT2jmYk7noL/hDaCtyoqpOKfaEwz0ZsEVi2Zfxmy2n4V1t7EJc64VS?=
 =?us-ascii?Q?jzelQPA2hjLWVGcZgcGdu8PLtfgTpT3gXOdfI+t8j8tUaQvM2uvvuATNg9cL?=
 =?us-ascii?Q?QAteaF14rfDtuC0sLEw3Z1MsoYJ9gI+kj9LiMlzeis7bYsFSWbuyuaOvJc5L?=
 =?us-ascii?Q?ulqaZZy2C0Drd1VRiMWJSYRrwUUvL+g3cfPaWmINDI6z5r/MNxhK10KV6Rmy?=
 =?us-ascii?Q?IaMsCzbGqZi9meoAhATo7YbydDGqD+F7gkOD+R8hAv5UvKwy7k5S4oXyTSQj?=
 =?us-ascii?Q?ZtbSwFhCBHCjDZMLOg7NhD8vrwHAwBU5AfQUh9mJ67UYjtDa8jEuSeeJ/3Jz?=
 =?us-ascii?Q?zK6cgSYGkf6NOtDK1EFQ0kSH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4daa0c24-cfe6-444a-3ffb-08d93d9eb59c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 21:16:51.3168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TN5BPaVAKhJuR89ZUI/bIoS+tkJm+NiQsjMoGBPVBuH0z9l2i+inbcCw6t1my5wSGgBWZQhq8ScHcQz6E8cVlUIyAHy1monzyspxLAc+qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.6.106;
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

Hi all!

We've faced a dead-lock in active mirror in our Rhev-8.4 based Qemu
build. And it's reproducible on master too.

Vladimir Sementsov-Ogievskiy (3):
  block/mirror: set .co for active-write MirrorOp objects
  iotest 151: add test-case that shows active mirror dead-lock
  block/mirror: fix active mirror dead-lock in mirror_wait_on_conflicts

 block/mirror.c             | 13 +++++++++
 tests/qemu-iotests/151     | 54 ++++++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/151.out |  4 +--
 3 files changed, 67 insertions(+), 4 deletions(-)

-- 
2.29.2


