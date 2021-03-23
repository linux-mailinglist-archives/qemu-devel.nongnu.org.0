Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A043460EF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:05:22 +0100 (CET)
Received: from localhost ([::1]:44666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOher-0006gd-NT
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOY-0007Jm-Ni; Tue, 23 Mar 2021 09:48:30 -0400
Received: from mail-eopbgr80108.outbound.protection.outlook.com
 ([40.107.8.108]:57092 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOW-0001wR-PN; Tue, 23 Mar 2021 09:48:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lASD7Fk6k+HifPLS+p1LeytFIB7M+dvD/6Wf1YRTe/Nt4etbA2pGszp+bZNspKrOAk2gsR2B8xDYrQ79fCnTSrETA3OecAzFeE3a4y6CM4p7XbShkrCeRF3iqwuJxA5Q4PVB0dtJYvXMb3DPaiMBaJm55YcGAEb9Z6O9aR8REf0eqw0aW8x33P/U0u0Jb8cxyMYfm15uLFvNzOUlEdkevjw4Cz48wykbmoTPfIYV/7RlgGzY5tvoK2T68F79Nyqxn9vQ/S/gipMGDWXCHuOOoqkSbMEMMpL4RuhVTiGndVyfATOIX86M6dxBGMg73eg4J86OZXq1BMAtu9ipUMbLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFaAnXBnOYHcCDPhptKAnw8sds4zvh4dIt2077xAwaw=;
 b=EOSDAxFkxKivzDp8VFMYC4tjBpYsw4/B3NMlcRbbbIG0Xknr4Vs8Mw28uIbY4Vn0TVbXHOjDX0Nf4mAp0blkwVj2J+KfVuBEMSAlMQOYuGp0MV0VDyOPhn7M7davFw/oPS8uG0V67DQMgCs93wsf2W2BG2Qe2rsvyNQTHUavTVEdVkmn0oy55rbRsWuhI3W62DC8aZfMpk3te95vyA1yvgdyDtoqQNziEeLaf+3R4iyuyRbfN6I9FkvmhsQnA/khdxL57qt5X/Vuq6pOvSQct82MJmTQUIh7kwR3pdf3RxGWLehSq8jcZE9GwlZnRJjI1LcC9FAH+BONjk0HiPb9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFaAnXBnOYHcCDPhptKAnw8sds4zvh4dIt2077xAwaw=;
 b=mBGxPye+WRfUHnWa1QLCq9bRS3dkm/e9JXXya4ppmUE20Vzj7aYe8vLCyuZPZYl1LHXL4+bPyscZ5Bts4yKcWpGC1eMzVFQXk+rrGyHsgL45W3pmEVgnkPgMRbE6nV8EVYhx0TNE1cwywb1/8SEba+vorD46GWsbRoK76W3R6C0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2034.eurprd08.prod.outlook.com (2603:10a6:203:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Tue, 23 Mar
 2021 13:48:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 13:48:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v3 8/9] simplebench/bench-backup: add --drop-caches argument
Date: Tue, 23 Mar 2021 16:47:33 +0300
Message-Id: <20210323134734.72930-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323134734.72930-1-vsementsov@virtuozzo.com>
References: <20210323134734.72930-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0184.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0184.eurprd05.prod.outlook.com (2603:10a6:3:f8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 13:48:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 748741da-5aa4-476f-fd7f-08d8ee024a59
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2034:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20344CAEF57F12D3AA5F3571C1649@AM5PR0801MB2034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wCSWIeypZnxPdyh+d6NY6l+ERyjuv9nUvsmHcxyL/wqEmg+rJgAefRQZZdvgxL/0owpWCzYDvwRkYRp7VTMwJQMsjoWs1rrgVyv2/EWzkCwW1qI3mutGigekckOquX/ZO2tw0C3NtsN0SFbSN7BbDhViSJlSvk1Jyde0XD0GdBpY5ChvcFsiUtGSrs/es0xE2Pld7EI63ASfL0mHe5dfjt1RCNOQVB0x3WX46mbiNWk4z/n/c23ajPwp/G+oeMTBmfLxgNw4/yKHR7nS74Rz4uBL5BCo+fPqPqc8w1k71vJ+05e871Txo9+l8+lmxRtcK4M0LiIEOlNUsKLk9i97HJtHI20kIGczT6LrUc8PvVGZHXBqBmOMuU+t6F1bi4jramMR0B54fj8L6ovl4Zwm+HO/tAgTg2TnW20wZLHL9MWmRGyIqTDyVnluq6EIH3LumPGwDCTcR29NBHGU+kg3BZWFM3y+r94ugJqT0KLABiBUxd9QaANGZKSzZYjzoNKn2W/W6rW3XAMI82HZ5oNjSm2YzUr33se+nTmeNMW+kx9lIJslI1r0v4GzHylR3Hk19ysmHWvjfmCDLzA7wHaAAprwiuD80fNH8jdsV4d1pDzACq+wNCqZMiGn2DgoAJdrhbVPknXslvnk8RSOAObi2hbbr73ZQ3IvzOuRyOXiVBpu7atE+1bjZ84cNFkbFW4a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(4326008)(186003)(1076003)(6506007)(52116002)(16526019)(66946007)(316002)(26005)(83380400001)(6512007)(6666004)(8936002)(2616005)(38100700001)(956004)(2906002)(8676002)(86362001)(66556008)(66476007)(36756003)(6916009)(69590400012)(6486002)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?l2jcmb7dZL7Wo4qH41oubaT7h5d3Be7au6/GaWdbNz1Wb2b7iGF9O2wHEMPp?=
 =?us-ascii?Q?JP0dVTCetL2VY/w+dXI0vXtpmVA6pZ/dcIhuyy2op0uL1azUyLITQJ/0HXUQ?=
 =?us-ascii?Q?XOfkbDLnjHORdydCEl9GAQAfUVnPgumf0l0dtYONUDJkSxaCcwkPnxeCXK8q?=
 =?us-ascii?Q?RKHxuxFXGyEiTNvUmnnKsUVPHAOyiBzRfVJdXj0nELsF9eUOduQvIOWRuaWP?=
 =?us-ascii?Q?HheIp0zWzPPC5otzGvtcedanqwPrYFDsAkm87c1pVlt88mSwgCB7EyP5GB6q?=
 =?us-ascii?Q?MpHlOkrjb1vHebkd7lY86BWmoJjGT1KmS0t2yTwjXz7WmBrjj0kE7vG5Xxuc?=
 =?us-ascii?Q?7X+/w8sAYp/447q+tyli3rdMogQUIVk93Wt7oZxPrW1CoznEo/4GgSN1EWIx?=
 =?us-ascii?Q?WsqnEiqIgtmSQUY2PWVmIGC482vZZ6fDZeSZLvvSSFXB/YYAi8uKs8louvT4?=
 =?us-ascii?Q?NcFiV2qWsziAly5Vt97waGWya6fji42yIojjn2IZ7QGG4+JN/y/H7QOjGfAs?=
 =?us-ascii?Q?acukLNi/IZRuIuYxwrnASLJ+FyhCubEvBNOysaFyzlIE2byC6ojq8/gFY/PK?=
 =?us-ascii?Q?1hVWbYAsCSuUXX4EUVrUPDjrCnwvyX4rVNjfvl6+dq8/oOM5e/MevtY6lPxl?=
 =?us-ascii?Q?ISGdNmeeQVKHMMTAnYYAxFDOCRQ5SJsPnGHQKckAMGB07ctkU4aaE3hOw1ZK?=
 =?us-ascii?Q?uJxMPf2dOhNE9da0E9C4EMaf92Pn5ramYpXyNCoaYSXntUKbYWr5m18hDPOC?=
 =?us-ascii?Q?36iHxHHeUQA0V3kLJWHrOxx3bLGOHcNddKpLQ2UY/VIhFTg9tP3PQYNC/aGx?=
 =?us-ascii?Q?5aNa2AiS3drpLwha4tnZlmX8lMr374F6QkRbGsnQp9miKLQKZ52KvKhEdSFX?=
 =?us-ascii?Q?s6YNHQBWryadFLYC8/OaauRLh1IKsl/fhe/x0gWhbTXsxX3Bv73wlwCCs2Tu?=
 =?us-ascii?Q?BuiTc2Zv3sbxggLn8b1RGjjb+a6IpzvRmd3w90ji7Cp/k5x/kPz1ajZ48AMW?=
 =?us-ascii?Q?C5SAR60zMZRUMsfQobqQy54GbtjYPYPD6nIsPR6+EDs/MbxRgmdYG0oJyjBS?=
 =?us-ascii?Q?Ri6wRA6gXSrZleyTtvGIzythvCrtKoz2DhwBXjt1AmB73dzXm9U0EXU49BJd?=
 =?us-ascii?Q?52VzXpIV70gGC9wFwtF8nvl+1186oGW0Ww8BQN/pGorcAUd8E/R2hgP59sTe?=
 =?us-ascii?Q?IeSGfXqbi4et/nKGXlT3T8Xym1xwzSRfiQvqblRV+Yb7RTtrvzlvdxJmj0lU?=
 =?us-ascii?Q?LdjsghfW2AP6bkDObLqsy3EQU/si5z8AQVUacbkBNF7bWqC5q7Gru3810w0m?=
 =?us-ascii?Q?4qsihxSjr4pc9DuZ3zGrndAE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 748741da-5aa4-476f-fd7f-08d8ee024a59
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 13:48:07.9484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Bd0tsyv4u3KSHkmP34PP+A0U46YzK6jdCmR8C0ltaXQXciPZqDoteKiw83V7tzBn5jtA0JLmPgu1mUaNSrDrzaxKqXNAKx89UuSKxn6kUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2034
Received-SPF: pass client-ip=40.107.8.108;
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


