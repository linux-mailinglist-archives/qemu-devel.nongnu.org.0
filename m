Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947643727ED
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:16:30 +0200 (CEST)
Received: from localhost ([::1]:51352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrAL-00066B-M4
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqw6-0000wb-1k; Tue, 04 May 2021 05:01:49 -0400
Received: from mail-db8eur05on2124.outbound.protection.outlook.com
 ([40.107.20.124]:62817 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqvy-0001zo-D6; Tue, 04 May 2021 05:01:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYxnFwwsDdib3eRe/kDXbntMMJV9Cwz1dPO/rsUxDN7l8vY3dXskfcxwQhBwaRliJ95Rd4yEW2/ybe+sFJn1pD6OIiJHjOlASLTUm/98KgQOBtzAo30zZHsEqPOFlRyq5AcALCHfJmlEib4HCtklbMXha5oz1um8kBhBG9je8xKJ/Ycs8W4j7BxMGUiEVHs3a9Ni/Tka/o3US8NtMO+PlOnWr4jFUKtgXfWeob8aKKXVF70Vq19yON5vPCDtuhbaDU6o5sAgOPi2c0zyFypemuTOL3I4T0oISpYFEbpp/EwV9bgeIMIggydSU+DBzHZIftbmwJvaR0HFxTOD3KLHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFaAnXBnOYHcCDPhptKAnw8sds4zvh4dIt2077xAwaw=;
 b=QzkSbG2oMFJSewPdEKuxOIoUq2F5Tcktj67UQFIUy2qKtbV4QYErOAQpz1sQnrxFHnhUGuTHOVfdvRZBp+QIxFSRBvWP1qvmZ9U6S+ssTN4JCfbkXzvylnL2Pr0wZlN/2ZoBkTnEb3nvxJvB1246JbGS+R2BylMNBHsZiNF4VYHvWPqDeShbxJWrbLg9cBxGT08ZdwIhWwEM0jGoW5udXOUt3bIDoNd/fo2PPMQeHmYu+HJSVmzNScWraAynAbosOQlDGvY4lgjlVu6V2nqeQuqrFdHxlY/ZvDYYGPYGSXbsA2PqzBCE96n48FYJ0QqAmM/yeN5GdSlvtc8cAO7UBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFaAnXBnOYHcCDPhptKAnw8sds4zvh4dIt2077xAwaw=;
 b=aTaV5FcBOw7AfP1vVL9OQBd7+opxKWkKFXzmSjjn0LwaRYWr5p6xgj/CZ85d69/5y/vDqoyCvfzo8jPs+/nTjYqa96mCHNYD53zL2Aa1Fgqe6r64YspHQ5F5pXNMDSxZTcKMQE+rpYktNKUZdXc5UWdnWq6hWWEA+aYWYdoKj88=
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
 09:01:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, peter.maydell@linaro.org
Subject: [PULL 8/9] simplebench/bench-backup: add --drop-caches argument
Date: Tue,  4 May 2021 12:01:12 +0300
Message-Id: <20210504090113.21311-9-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 09:01:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b38b11f-5b89-408b-0eda-08d90edb3880
X-MS-TrafficTypeDiagnostic: AS8PR08MB6359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB635979F4846FFB7A63517DA4C15A9@AS8PR08MB6359.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2uAV+ggs92Md84BQC6NGl8kUaBNhw3JUubRV4CouZoOOq7Xu2ONkB3Eer5OGViUoUG8gecc6uwZ155ue7FLaci69BmZdedKsoaDT8IysTaiuw+kSFGNBUk5b5BYRiiyYETV+ih33QZ/V9XqAZIvMyhlwLEUbALY+/SHGoArxVeeWqhL0ZILTXlmWaFG1Cy6duCZ7UbU4qADdibixMQlxTOtEQaYA39TW86nt7hAf6XkC8Uuwgb376UmGf8fp/9Gbo2asG6dqdzvxJ+NcWwNPsFSt39nH1XypcRc8cd6s9Ce6rLdh5ppIVKDE3Sv9G367KTeerksFIiTKjA5iLwKT+3bYBqsc7z/5GJelS/Da+xWhFPTNkPCbEYTiViGXuvwaOslgBze38dFO2qV0aMw+PStfljbXKfLD1R0S5eBSYLSnU8xkjuzO4rxyAlS65ZyG3oMIjO+mViHq9zLtsVm0ZiA+opg0c62cq4eu6ndfsgHBTH4pXZmz16NyMeT/YUihqHA6wT2T56BMfuHdk8w+9jNTotN9Zyi8M7pxFPt/lDbOyem5QHZgYu56V/YUI45iC4xFLmP3zO701LFj6iwm1rEFZ5vXylX4cey+zzdJLF6lFBxLT15kKYMYmeKWQIthlFbNT3WzfTc/ve9MEOwv391mx2eflZZhMe6UI0dttiDwcpgznngb1IwxsCAVBHd9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39840400004)(376002)(16526019)(186003)(36756003)(38100700002)(26005)(6486002)(316002)(52116002)(6916009)(6506007)(1076003)(478600001)(4326008)(6512007)(8676002)(956004)(38350700002)(8936002)(66946007)(66556008)(66476007)(86362001)(2906002)(5660300002)(6666004)(83380400001)(2616005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2736Ru/T4ayVxgLsbHOxJA1L9Wb18aVCpDukxusM4SohrYJ6mCOGwX+csJTR?=
 =?us-ascii?Q?EI3T5kqvHB8jFNDQQKESHRvafZwSxZ2OesEeH94dMkf8RymekwJZMaoxaMBi?=
 =?us-ascii?Q?zAk01UHByoUi3o2LehcK0Sv1S6r/+oKbxNgd0Dg7HmR/P7BYFoX7VM7IXQkh?=
 =?us-ascii?Q?9L+w7O/25Xl/SrgWMvMYL9IQNlzE96beO174AZkH4S/o6g1ZFaTgZiwq/1jL?=
 =?us-ascii?Q?7j4uv0Tv7pAPGwBSV0LUAYTEq6skjUG887sIr7SeR4MBJX+Qiwflh8U9Pm8v?=
 =?us-ascii?Q?L7ckV1DsHCTiEw/fEQw7MKPSlrafwTUaZAjDnohVTW8G1c3ti1vH2UeTwdvv?=
 =?us-ascii?Q?JPfOszPy0wHSF6Xw2rYb7RxiUKEqM1zHeH/uzHuT3MNQ/f3EwIGHISGb+YO5?=
 =?us-ascii?Q?AWWfyvzUS8qJ7j8jsnRijGYL8gH91i988xdu+oPjhtbctNW/MF8IlrthkBc4?=
 =?us-ascii?Q?oKV480U9MdDhoACuAWlmOakwMq+GHLF+dnR2Y1vhbFTERsTYIB2qax+nOuui?=
 =?us-ascii?Q?SwzGQ7wP13+hKZibN3eeITq5VbSyunACH60J+LmyJUkgTGOuN8uEkrAtSbsP?=
 =?us-ascii?Q?cdiT33VeO9aYtWA/j+RvHbTm7s2zFTA3w60XsDSZKT47HVOi9TuYuUZEZp1k?=
 =?us-ascii?Q?T+/Lzdmu5SfDj0yAI0mkoMZpXNyaEeQHYV5Y2ssngma7Xys3VzcpovSDXeKH?=
 =?us-ascii?Q?kkL0OTJ35UIznLONHUuEXfBlBPrpJ+q1hXEuuwgtleQoQW3B3oNNbDXUq8iz?=
 =?us-ascii?Q?fmf437sEkkOO8r/96bhnwovbYR4BkGqpl/hdGprOP0xZZNloEQyL1Vxudwwy?=
 =?us-ascii?Q?5W0bcckcOeTeR9GEwdBFDT+OyOf+T1MvYwNFnLKBcvm8CRLRRlAxX4nKby2P?=
 =?us-ascii?Q?1T188T7cFQGm0eYZHlwLHtmWjCrY1WoI7wwIyGY+k2zvM80tc/SgGHFzTmmE?=
 =?us-ascii?Q?s0RG5PKxoMADp5RPxfv++XSOxir7fQxVY9/GZ2nIF06bg95thkkp6Iowtmhn?=
 =?us-ascii?Q?t9vdWoY1ov7J9tVWEv7+N8TZ8q4QDEPVbFjjFLMQtkcD/OKYNCmcnps9TC/8?=
 =?us-ascii?Q?h0Nf2/ldkglw6p8+LCPco1RCjbQfqvfawn9iiIqy5Nhq1fBdv8YGfz6mrwLN?=
 =?us-ascii?Q?qjw1KfQpNpxJsmF+ibyWCcmM0fyMOnccZ3QaUiKRtpc+s+UJdAImNN1Eqawf?=
 =?us-ascii?Q?QXfZ/3RFgj86mBqmDoMB9uJF4ukyjfHjBqgLoO0ci0NMMcsNHdD32K1lUiEA?=
 =?us-ascii?Q?gXOnlA2jpJlLpDegs5b/IM0Be7vLT/pV8Vl9Gd5e7OHtVTD9QGnWn5vhZdRf?=
 =?us-ascii?Q?4Gv95Dhn1rYdQO9tZaMEJYD1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b38b11f-5b89-408b-0eda-08d90edb3880
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:01:35.9314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sxb9CsjVzjwTLxERTIJfwMoudcNhqR+eRD8NhUyIxC1h5hDIWIf3uXrbpQUZZcDA4TUrOorzGdprABORKxwTxfIwRzjNknIC7dFbl5heMxk=
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

Add an option to drop caches before each test run. It may probably
improve reliability of results when testing in cached mode.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/bench-backup.py |  6 +++++-
 scripts/simplebench/simplebench.py  | 11 ++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
index 092fed5816..5a0675c593 100755
--- a/scripts/simplebench/bench-backup.py
+++ b/scripts/simplebench/bench-backup.py
@@ -156,7 +156,8 @@ def bench(args):
             })
 
     result = simplebench.bench(bench_func, test_envs, test_cases,
-                               count=args.count, initial_run=args.initial_run)
+                               count=args.count, initial_run=args.initial_run,
+                               drop_caches=args.drop_caches)
     with open('results.json', 'w') as f:
         json.dump(result, f, indent=4)
     print(results_to_text(result))
@@ -221,4 +222,7 @@ def __call__(self, parser, namespace, values, option_string=None):
 Do additional initial run per cell which doesn't count in result,
 default true''')
 
+    p.add_argument('--drop-caches', action='store_true', help='''\
+Do "sync; echo 3 > /proc/sys/vm/drop_caches" before each test run''')
+
     bench(p.parse_args())
diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
index 27bc4d4715..8efca2af98 100644
--- a/scripts/simplebench/simplebench.py
+++ b/scripts/simplebench/simplebench.py
@@ -19,11 +19,17 @@
 #
 
 import statistics
+import subprocess
 import time
 
 
+def do_drop_caches():
+    subprocess.run('sync; echo 3 > /proc/sys/vm/drop_caches', shell=True,
+                   check=True)
+
+
 def bench_one(test_func, test_env, test_case, count=5, initial_run=True,
-              slow_limit=100):
+              slow_limit=100, drop_caches=False):
     """Benchmark one test-case
 
     test_func   -- benchmarking function with prototype
@@ -40,6 +46,7 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True,
     initial_run -- do initial run of test_func, which don't get into result
     slow_limit  -- stop at slow run (that exceedes the slow_limit by seconds).
                    (initial run is not measured)
+    drop_caches -- drop caches before each run
 
     Returns dict with the following fields:
         'runs':     list of test_func results
@@ -53,6 +60,7 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True,
     """
     if initial_run:
         print('  #initial run:')
+        do_drop_caches()
         print('   ', test_func(test_env, test_case))
 
     runs = []
@@ -60,6 +68,7 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True,
         t = time.time()
 
         print('  #run {}'.format(i+1))
+        do_drop_caches()
         res = test_func(test_env, test_case)
         print('   ', res)
         runs.append(res)
-- 
2.29.2


