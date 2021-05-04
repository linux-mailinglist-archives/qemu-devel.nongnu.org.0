Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89CC3727CD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:08:12 +0200 (CEST)
Received: from localhost ([::1]:60900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldr2J-0006Fd-Qs
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqvx-0000w8-J8; Tue, 04 May 2021 05:01:41 -0400
Received: from mail-he1eur01on0729.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::729]:27621
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqvu-0001xi-Ce; Tue, 04 May 2021 05:01:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZjxvqt5AAZ1aftl2CKrdaccjBRadjSDTkvIHdZ+p5FWESQhzOIDs+X5Z8mwHOFkBdlWDg0XsHZJjUPf5C98/fLUKoNV5XVSwuvIrp5HEJxJu5s9VufWubtFL6SXKKU00g8gSpEkA3Mgdq9C5WH3HCdC0IlO2oxvoE5zEBMzlIZUIqGZ92Honxq9KGJVfr3qWo5Yc7jLfSKc9L23OZ64sv0q9jeDJgrhd+GVsUzgT47SUzvrbH6tDDzTXznKw6PfCI4jGp8afhD1RTFvEMa8uS7Y+94t/XBNGYAXCJ3r+VGfZ1oXernbXOk5Na1nOWBN8wnkmKjxoJa5SLWSq1PKNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHQ7ac2wPzOOmfJru0WutQsluIcD0iKdcjdz4ruWVGM=;
 b=hBi5dWd8FoMxxgz0TOo+PV3gV6XwagI0ACwCD4Qvs3SS5y65rbpdN10A64reBOiEDao83V0yYtrS5USss1RpOeDNIh12wPtaGZgrEWemLm1JehlN+FhIhdOtEYcqzCTSzjT2HxLUPPX6GxaTZpcp2VAXe6WhD/LZMD0fs+mtbLNuWfqt3nWRYGOs3tFoWo353g8RbHgCUAXlMMyzoGMpnQJjfoOjGcP94xVtO1F+pcMvck0tlPtJRzMXObSpDUQeS9pHXgt2h5QZEusVvKm90p7pL2ghf2FlGqkcze8FBNO3gViCuvm9w+evMvQ7/4zP58tj+U4wRDHg9OeofdMi6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHQ7ac2wPzOOmfJru0WutQsluIcD0iKdcjdz4ruWVGM=;
 b=rS8WYCfRkg9gJw/B2JuieeuiV5YktRjqG9m+hhtV+SuS5xH5xllIoAouDGmemapF8+6zm+t9q4U/dwe3I2p+2pF6fWv52hJkYepY2nnL8XF0aRPL/+hEBaHJEpP6i2ZRd0cEDXoHca2ZxkNmjTFSlK3HXdww444viD/fGTLwgGY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.40; Tue, 4 May
 2021 09:01:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:01:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, peter.maydell@linaro.org
Subject: [PULL 1/9] simplebench: bench_one(): add slow_limit argument
Date: Tue,  4 May 2021 12:01:05 +0300
Message-Id: <20210504090113.21311-2-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 09:01:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b976c05-753f-4f10-ea20-08d90edb3502
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6870304FB4D3992222B13FF7C15A9@AS8PR08MB6870.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zckqxp5qL45GuT+/A9tmZbYNirirWcGu2r4K7P070NarxdKW9g2CGzokSEaGBckwSWaM/hVs3UeNdK7OMwAlYLX5qElb88g4AEMHHmPD3WxE7kQRrY2AFZFO6P/D2RP9q4YL3QS9a0ic8x8OVOG7k4UeTQP7MrGWkJYb7ahDDr39LdN5OWp8Um3/P64Fcf995yR8x8Vf9GjfrmhZD0fN/tr+3FuoRocpXFLONtgmTDbdh/W7MDHFuGjliJ0e7yzoTLLwucucr0XUN2GcPAClScexNAgTfEWuNkz4vXWsSxyOkkRvrOMKnUKxkupCjyc+iA7RLbbw3xdNaWE8kop49TqUHTInXGZaCS81/TxpmM6TCPqWfr0v2O4lvQDU8gfy68Ubb8TFJ1pwaWggbDtlQsG8Cx9r7n3R4cT9s6FAFwBkL9EBogeEkAnbPcKUhZJggEUfI3wSpkrwC3dPbe3TA5PGUO8OAqoHVmArXiQtkh8Ps9GW3Ft/vvgc5rVzcAteC35dHV94wL94t2ydYomWFfENzyVsBdnYKwy9L/hufScVhVzsJ7dYx0mkf+lgsB7VS1w+EXKiMz+AtTbhefe6Ny5hd1Tg8vZxxJwty8imQpbczmPdU5ks2slYXLeYZ9gP3GZceOPbetVFNT6/q0E66/cRuEw3z34SLALxBTyhGvI2nsuaTGwvaBuEfR9BlkNX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(396003)(366004)(346002)(376002)(6506007)(6486002)(86362001)(8676002)(4326008)(8936002)(83380400001)(6512007)(2616005)(66556008)(6916009)(1076003)(66946007)(478600001)(5660300002)(38100700002)(38350700002)(66476007)(52116002)(6666004)(956004)(36756003)(186003)(316002)(16526019)(2906002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?elUIVuiOPTgIaG4QDiTbT9AZXVHuCaYlMgDz6/nEk8GH9ETroP+DhRG6QXyA?=
 =?us-ascii?Q?45aQZkhvdy2CdBbWKFQxJ7r/h1lgZAoQ7jmu0qsLVCRCSCEl57n7WGMFEegC?=
 =?us-ascii?Q?ODeUy2czM32a7cFvh4GWW1M5U0jzR65VplRp8gbPF6WlzN6k2L6WKVMjwuLS?=
 =?us-ascii?Q?Uztma8GP9eIC5yqZ3cADHZKQgHEtX0uxIkFE7h6JAuaP7QgQjujXP6suZ0Xm?=
 =?us-ascii?Q?skO1X3tDKQt5sjbjdyfhMT5cSYZITePPr2Y5xeMdlKOtv9Eh2xCAI1Ag44C/?=
 =?us-ascii?Q?lR8ACyrvjOcpFbTY7pBuRUCSYqn1cyS5S23jSe638ZFxQ5k01Iq6qE5QBzup?=
 =?us-ascii?Q?3Um+06GJGZZK1mMjnzt0BHZwcn17I8YgDoGH5gratg8oAu6pPLQOw5HpoPKt?=
 =?us-ascii?Q?n2mGPd8/YINLBTXCQscVM9eORlN7/ycXUOBVlvtLHvhPSw0Sm7e/+r3VCVeM?=
 =?us-ascii?Q?8STh0TwILNRsff4+25La98yDDQRXm8QZvawjIeN7yFyKC4reZ9f+IBAsVrVf?=
 =?us-ascii?Q?oCCr3iYrx75OjgEry7rKW+ZB+zjl0GkKK/FpRuaKvv5AC9f3t7NrHpgrP668?=
 =?us-ascii?Q?Lc+u/hxeXQUJR9tLg8PHAs+jjhSEhJHaxQEv5sne5i+8C6ipw2z+Wqm1GASx?=
 =?us-ascii?Q?EACll7ph/LbAId0BcMvES2RUx0OPBz77C3Fn25/l1FTD2I6TWfmICGAYlq4O?=
 =?us-ascii?Q?Mkz737a9f/xSR9cbgAxu34EyZvL3mEu/fcRT75PHgUB+CKeEFDY0u2tCUesI?=
 =?us-ascii?Q?m+WC0dqrX6lBY+lkoZOqbxhj2t1UxiGzr24/FOz4aeIsnpjEHzZHcmuEC9u/?=
 =?us-ascii?Q?lJosDq36ZHohxqOGRtwLAeCMXTLNpRaNbquXKus+0d0mu7ESM+h1DbaqGiPh?=
 =?us-ascii?Q?+InKbDt8CCx5YKHIiCwM34v6Q68AINLCAPnxOZFG7b7MlRrr2JNsybLUWhfy?=
 =?us-ascii?Q?9cAgCOZYdqUBZGcQq6Q2MDJ0J3dr0M46iPmobopp7kdPeOgpUdSBuc2jWVEJ?=
 =?us-ascii?Q?+fBr+TJvFgAuCFzW9BiAT2hL58IaPxc4wpyah+lA4U4g3G+Tg/jPcIebx2a7?=
 =?us-ascii?Q?MwkfUg91/tFNbrCOLVA280SeG0+sDKM5eYedFOacy3ZJVfizG0ILdjdwdirG?=
 =?us-ascii?Q?VCZYs8rF0fmWNcK//xbPUO5PtjWIIHebUiJLWNPg8NsF9lV2IIUkN8e4gkrT?=
 =?us-ascii?Q?EWa0fd3g9QYpw4GTesaJije5yo6tz1C8LSjlRcX5tRaDp1Too+R6kc1KjOca?=
 =?us-ascii?Q?HsjjsPVcKq7De26Hpl3NkJn2LJb7H2uhi9kkg8Abx5Omdu2kxtEVx9+hct/g?=
 =?us-ascii?Q?+ZkFNgJXhOpoCc6v5Sq+nuGW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b976c05-753f-4f10-ea20-08d90edb3502
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:01:30.0950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkiX2ugnp6Y9riCw70lKv1lWK9odDn+rREemEZiSgcohvBukT9+Hk+SmbyHXvFuHC0ojqjaWAlaOQbbkRUyfwiaY/CMPRv0v5rIEsZMgZaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6870
Received-SPF: pass client-ip=2a01:111:f400:fe1e::729;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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

Sometimes one of cells in a testing table runs too slow. And we really
don't want to wait so long. Limit number of runs in this case.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/simplebench.py | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
index f61513af90..0a3035732c 100644
--- a/scripts/simplebench/simplebench.py
+++ b/scripts/simplebench/simplebench.py
@@ -19,9 +19,11 @@
 #
 
 import statistics
+import time
 
 
-def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
+def bench_one(test_func, test_env, test_case, count=5, initial_run=True,
+              slow_limit=100):
     """Benchmark one test-case
 
     test_func   -- benchmarking function with prototype
@@ -36,6 +38,8 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
     test_case   -- test case - opaque second argument for test_func
     count       -- how many times to call test_func, to calculate average
     initial_run -- do initial run of test_func, which don't get into result
+    slow_limit  -- stop at slow run (that exceedes the slow_limit by seconds).
+                   (initial run is not measured)
 
     Returns dict with the following fields:
         'runs':     list of test_func results
@@ -53,11 +57,19 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
 
     runs = []
     for i in range(count):
+        t = time.time()
+
         print('  #run {}'.format(i+1))
         res = test_func(test_env, test_case)
         print('   ', res)
         runs.append(res)
 
+        if time.time() - t > slow_limit:
+            print('    - run is too slow, stop here')
+            break
+
+    count = len(runs)
+
     result = {'runs': runs}
 
     succeeded = [r for r in runs if ('seconds' in r or 'iops' in r)]
-- 
2.29.2


