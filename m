Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6156232D0A1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:25:52 +0100 (CET)
Received: from localhost ([::1]:53014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlB1-0006g8-Ew
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3Z-00052G-7o; Thu, 04 Mar 2021 05:18:09 -0500
Received: from mail-eopbgr20120.outbound.protection.outlook.com
 ([40.107.2.120]:19927 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3W-0002G5-9Y; Thu, 04 Mar 2021 05:18:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZRoePQWq4D7m1cGecpqpx6T5ShYtZgBVE0wAA3qCUtyIxr3MZl61xN14suFnJ3VS6l7sBU6fiSZUpJ9GXm2114WLzXGlrISH8pRDVK1vfYiPCegSOGEYCi3udtYya30DyeozfoReFMKSMbziL7itm5wd1MnjaEQXqHX/BZxdY0eA2Gp8CYSBd0gy8Jfe7aVRSQZYX59hxjtfFRVSms9ThLeewTq0FMoKTVIPAkuv25jgDoVzVOlafVNuPmdOx9LGtOn91QfrNR/FqYX3oYZ7XDSM+tUcl8yQP2I47MJG8XsKd7vAdr6LX5LYtOx2D3WPmprqoJi57hXel+TMcruag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XtyZ15xm6Glfp6kjpULXtIJKc0Ul3QK++6UsbXKgWU=;
 b=aXd1K10vYtzfg7mEXpR6/mRQfRSrW+5FUhzBB5dDshtBds3HjqJKozRIWHva8PlQwbBUUi4AFGDfI6Ap07tjO42F1k6mFAxTPXxobtJ4E8YPzhM5vH8p/0QLLkKWQ0nHJ0N2LwLtYLARvhBqMPSX26mmJOm8Y96h9qP/tgidsBB+MZWg9fvWIndFmpB33NOEaSAJXwrPOHDYiR1wytKWPyd3iG/itiFrRamtN/Io2JxMIlUEn7DfKxoiqBiESKwcS7Gg6oHXOTJhGm8NIC9VEA1ZR3DkGzfFwR9InKdi+gzBDoUhOijcK52p4IJsf2Ca3JslYUECcops0mZuestWjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XtyZ15xm6Glfp6kjpULXtIJKc0Ul3QK++6UsbXKgWU=;
 b=rizp/V7w8+oJixJ9pz6xeboWf+IfkKBSt74YovDEkJo/mbW+JuL7U6qAbxxxzMgU7zUe7HBT/gBtBuFyTSW/Zau18z845fYM61Y6UjxZbkBiKvdisNPqz/tkOSTWoxALhIO8C+V3F1ygJ1uiI3lG23GCriIL050WtJexj+bD6kM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4913.eurprd08.prod.outlook.com (2603:10a6:20b:ce::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 10:17:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 10:17:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v2 2/8] simplebench: bench_one(): support count=1
Date: Thu,  4 Mar 2021 13:17:32 +0300
Message-Id: <20210304101738.20248-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304101738.20248-1-vsementsov@virtuozzo.com>
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.246]
X-ClientProxiedBy: HE1P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::45)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.246) by
 HE1P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 10:17:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecefa234-adbc-45bf-34bc-08d8def6c874
X-MS-TrafficTypeDiagnostic: AM6PR08MB4913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB491396C4FEDFE3204EE95809C1979@AM6PR08MB4913.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qf+s/nRF5B0jCIA4hPmGpzrj6jcnvGfMCt7onrjQOCFUbYQqsb8IDnHMpK5//MOH7sHfYGomlYAV4wM5kghira96MFRikYW0KtM0ZHXPl1XHG/x59GBiH9RDCsSOiCCoYCmcwltA4pFLrGDdtwsKX4EBlhooXuncDygCUe957qGwv6YxsE7CbJLZQH0OsofU57DuI4K9hS7TI7TC+Ky8Xa5MowOSWu1f2JB7ulYSAlnZQNKfJ4nI/mjDwaveD410OTa0q5QUebGzwLfjHL6Yv/59RWTfqt7+rTB/nJCAXl5dpw+PZBy/vLS9JcM//L+0N1VPJqFxNW4JrsxcT8aqLRKEadzSEEv45BQvMCS6gMQJSpwJ/yBc/qPoY33ri7QOYoqlxrknxOswczOT9zEQtsVL8nZViut7bMaPf/5nzfa6p0pyRleNypVI1RCOwR66ypvSXXoecAbxBYZK2DJCPMh4NcvSkvB8TvfkLYYH84CDifNFzS0pcKDyGkpQ+JCq+ynWUGrA0Vi48z3SKu6vIqReLDqF4s9Q+McG+FFqkjvp2RmyUgAxfjIlJ6ChSSyFdMDGZ8oaBX8w7HoC9L1dog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(376002)(396003)(366004)(346002)(186003)(26005)(4744005)(5660300002)(4326008)(316002)(66476007)(8936002)(69590400012)(1076003)(8676002)(66946007)(66556008)(6916009)(52116002)(6506007)(6666004)(16526019)(956004)(36756003)(2616005)(6486002)(83380400001)(2906002)(86362001)(478600001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tGgX8dARKkCW82dl2+6ZabJi0hmfWtUz7/RQ9dNIiWnjNPwKZbP5kHB2lIMB?=
 =?us-ascii?Q?L0DUKUBWU6ZQ4lpVoUgdJs/zGesQ8ZKAyOT+5x53Gm1joFl09ZyGEDQ7sZPW?=
 =?us-ascii?Q?H6Xj5DoOr/hs0b7N2vsU9BnEFJH0LIQ9GvJ/lGJrcE+fQCv7ie1bYvl4mBvF?=
 =?us-ascii?Q?B2WrTh/MQUcCJIXn0sxTPlHTUnztkUs2VPo5p3jYlyqnsfR31kFSYpe8dlCv?=
 =?us-ascii?Q?NiApLqvZ1YD75CZ1mIklDn9kRes3TOsye8EK1nFJ7FUL/7UOQFEsUV3kay8L?=
 =?us-ascii?Q?9wd4CH7ddcbSVUZnpJjXnVF7FIovd6jryOqgfqjqGMUK4WtrGtWFe2U5qtv/?=
 =?us-ascii?Q?l40tG5EBN2XL+uXl93vL7DDojmjhsPu5emBMwfQN9DOlQ0pb8OWkiDE5Rlr+?=
 =?us-ascii?Q?o6ZTMp/IewpV+2o+kIXckDzIIuVJP9nv3gZN2vJuvYBrkOWtLSbNJVpC+6aG?=
 =?us-ascii?Q?kn4auwT6SWPnnO+dtA2U//FyfI84JH6v18qo5W2meR9AdTy29jY0JGNfY4md?=
 =?us-ascii?Q?VzrLI3kD3e980K7OUyLKckVcO8oKLIBQdsiaaNm38q804/+SHWFom0Qn6KH+?=
 =?us-ascii?Q?44seF9G7oZR0pAnKQZYYwtVzZnAVlDV4VSy2VvpJaC8k7862Ks0BdVbRUqHH?=
 =?us-ascii?Q?dtj2YLEjxbKxf/o5baeyBH2zpgXhKrqY2H+AoSQ+EsWVW7zwdQGPXc37DfAS?=
 =?us-ascii?Q?BjvCb/J/YDFy4UiRlTObK7YxAsXORCGjdp6iZmvl+aISO+vh6WDIFlWyRxcR?=
 =?us-ascii?Q?faof/udP/kSYs1TOVIP22qpg9D7tk4HJ8AKN4eiPL8C49IvIB3PmQKq2Qc7y?=
 =?us-ascii?Q?ysUsRvkvWm+XJmRvb3qHZAo/rYkHTJ1Nh0hzdoM/XalavJ2YvIk/amguAzuZ?=
 =?us-ascii?Q?s4TbDMc24NhInAPF0OqxNLYXMXpZLrmmZBu7rdqlkQ6JfKJn9SwCtqMoBgF/?=
 =?us-ascii?Q?pIAJp5Ac+twxHRTQkTCJ5bSSNP5Al+nLOxrhBrCI4Ejofo/GkydaiA7hqxxN?=
 =?us-ascii?Q?DTtnKU323p88DF3XZgHYIEq3/ZbVtjX5cUL+UvCGpNhd38rkVCPy5vG7g9BT?=
 =?us-ascii?Q?y9LaehjwjfKy9BV30KyEuFqcicANsQfaUqgE3b43zO0ptUWCOLr6dMy3vfTx?=
 =?us-ascii?Q?lqIsw/PPoAj4bFy5HJwPb5q32KU7RmbeQnfpD8/86wMGTBd+m19ZJ+jBm5SQ?=
 =?us-ascii?Q?gwKn1buoKm3oBu5eV3wWzFVVKTYviIKJwgmpcGQQ4bAwcYbbGow/tdW0YrN6?=
 =?us-ascii?Q?S239lNgeQi2qbUmUZQ3l3M336AqWU/K6ccl5GTbLqJz4Yhk7eC3QA0gOlPjU?=
 =?us-ascii?Q?EvoD150K0XQH/Y2sZrXb8pCt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecefa234-adbc-45bf-34bc-08d8def6c874
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:17:58.1022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/6NvkNnIsnx3xsz04LxU3ircYDl2a0N/00MTr+/J0WgmhLLZgS2Pi9s9xhRcFIBPPbH0oByUbFnwglV4Nc4zyqzWPlWJplueZMePsMMs9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4913
Received-SPF: pass client-ip=40.107.2.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

statistics.stdev raises if sequence length is less than two. Support
that case by hand.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/simplebench.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
index b153cae274..712e1f845b 100644
--- a/scripts/simplebench/simplebench.py
+++ b/scripts/simplebench/simplebench.py
@@ -92,7 +92,10 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True,
             dim = 'seconds'
         result['dimension'] = dim
         result['average'] = statistics.mean(r[dim] for r in succeeded)
-        result['stdev'] = statistics.stdev(r[dim] for r in succeeded)
+        if len(succeeded) == 1:
+            result['stdev'] = 0
+        else:
+            result['stdev'] = statistics.stdev(r[dim] for r in succeeded)
 
     if len(succeeded) < count:
         result['n-failed'] = count - len(succeeded)
-- 
2.29.2


