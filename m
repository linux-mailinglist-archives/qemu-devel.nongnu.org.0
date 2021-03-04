Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A613832D091
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:21:34 +0100 (CET)
Received: from localhost ([::1]:37268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHl6r-0008Mj-LH
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3U-0004s3-TA; Thu, 04 Mar 2021 05:18:04 -0500
Received: from mail-eopbgr20120.outbound.protection.outlook.com
 ([40.107.2.120]:19927 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3T-0002G5-1r; Thu, 04 Mar 2021 05:18:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ce1ZSoyBgp5du6E72mXi8taT/dV5kVhK42KLG/kBXdBBEl9xYzoD6U6iyzT6p0mzO6rvS6UEASR7EowixniSsFKt59hGgzwlQUJwBJMFudGeFhFsTsB/XTpn3JJ6tGVGmUpNfxmH4a29OL3fhf+eVb2eDqkYhA7dyc4xVVCzjVTiis4TlVFgGjaxOJxndICYDbW1xVixjntdzLVy1BIwl2krdhFiR4fUF2aTBfIMqb2y1epYLF0I34SzH7Ax0lVOoPEO6rXa9h/VElzfMy7P25Lghe6G67vtoWRlGaKe2Hh2MXNW9lwROAtSRd6A50hJD6mBJNll8HzignIAUEaKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rByT8a22LIBHxMkcmH2ih0FaMOD4GJLZWLnJMye3mjE=;
 b=NIWZeRQStp7VtEJCfKz4FL0D28Ne3m0KXysYr5JyFsgqDPlCbz1nNtfxtza2yXNy8/yEfyK1UEeJ0ERZl6s+I4TAuj3miu5KMKJZjbBddNFqyUV4/Ih8Z5I/SH4NZR2XM8cDKUxNovCfpNMNJMeH5nJOdMnTUMIQH1AOWJD1w++idDai/DteSEkieCBmmLC8cfXsndMHMhoMa/Fu8GKCTnSi/Ofk7RZ+C9K1H3mVxPpNtfTiSr9Yb75hHB6A2HgpjtxGySGU+jdrctq18w1BegTaE1RD3cBPyFpsuTFkkoD/gGbFxV/+oh/LLxF+6l5Vgg4qcF2R6P+Pa/eU8pscoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rByT8a22LIBHxMkcmH2ih0FaMOD4GJLZWLnJMye3mjE=;
 b=pjnxwpXAI0pw3OnzU8LL/l7PHNsk4zrRfUbrykjsbLG5vu77FcOXupemsxenTmQy9YCyg0eHuIwNhnfimnA7DpVi3Jk3VLqhKjNcYKcOf0e5dB300a+pZmKV0YoJdRxy2F4y+cH6xalm+CBYqZmSoBpaltfYwe8IDrSXkdtRXww=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4913.eurprd08.prod.outlook.com (2603:10a6:20b:ce::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 10:17:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 10:17:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v2 1/8] simplebench: bench_one(): add slow_limit argument
Date: Thu,  4 Mar 2021 13:17:31 +0300
Message-Id: <20210304101738.20248-2-vsementsov@virtuozzo.com>
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
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 10:17:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02a7a066-4ba7-446c-3bf0-08d8def6c7d4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4913094D567A500C34636F38C1979@AM6PR08MB4913.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N+eG24QtiaMW7vjp18zN8sah3W08QKtA+4un3Hkz38Fv7NCxMaVroEUztv1kz5FdcPnVvYhkAqoXtnfB2Mt4DQxqrSiAhPIUQIuLWjTud60SZLh6yWXg7Vc49NuiM2r1/Owlwu7H0o0PwUDnw7nOttP4KzUms46AAKaz0OfLZKhvnPBKemuDuSh9FKCNvVWBFFfo3+p91WEFUHYMzkkJXtoDqIWGDZC19ucdtHsEeV8ccHSapPa2CFKB9rAF8GjSffGQ4ah6spAMqyo0koa6yCdayfBEECrscQ2M9utEScVJA26AntrYj0YGoaYbYnAKl/uhjf3snKtXH7FQ2E4FMlan9CRXkRqPjq2E2wqGF5LdZqHqR1vD1IkoqQRuWsl5+pLb9keoY7Hv3jHvz4BsWwlvc4/lXstEC/BCe2Bsq6M1K0jJxNIXrIENIkQ1pvUPrIG8jopcRTynEAD9vfwaz3eH0gsKse8viJTsGE2ahU23XdIluNaAlvTPQiytVE1Z3APZHN3Xcg3zQvhNEwwpbo8bc+coOHp76SJD9ASHB9TNynQMsmKQ/OVQoL8avSoFJnA8FzcbCRJu8C3KqlwRpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(376002)(396003)(366004)(346002)(186003)(26005)(5660300002)(4326008)(316002)(66476007)(8936002)(69590400012)(1076003)(8676002)(66946007)(66556008)(6916009)(52116002)(6506007)(6666004)(16526019)(956004)(36756003)(2616005)(6486002)(83380400001)(2906002)(86362001)(478600001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F6AAU8djUjeYdhLiAJufuvlXZP37W++OEY+vM9BWubrxMAihU+J6lYQOCFSu?=
 =?us-ascii?Q?RWa4zZDbQ0XoTTyAHTSfe3+Pvf8srgwuaWJh9SvesrRj/YXPbEgcvOuaTLo9?=
 =?us-ascii?Q?6VHhUNwxeEy4FIl0Xwi1t9fIfwN2xzD5wPoj3JCZPp92gjFIysOAtBmI6tV1?=
 =?us-ascii?Q?vZV5Lie3K/56ck//Z3/JoLv0TMhnLRxVzFRppSIb1fVCuAg2K0UJnVRuftqn?=
 =?us-ascii?Q?BKhfzH8dO566h30uZXRdhDmXwQKnd+eNGxLkF3sR0TqpSo89JWQGDJrrzQim?=
 =?us-ascii?Q?sWWAB7+pqiJ0U/bv/V/UnS9JEohwUyPwtKQDsb6eiDRrTdcB+2S1/Wxzfpwb?=
 =?us-ascii?Q?E53xvAJob1GDVHEaO8YG2X+TAdBLhvdp8Hkh1aKjJV05m1bnyYk/o0R2kFES?=
 =?us-ascii?Q?TcfG88FS92riw0KfDW87cahCvVbp2Mn+yhkDLliOb6/Obua3Vu2fN5dskjiM?=
 =?us-ascii?Q?TfqMtS0H5FM59jSGq7VigzJH68NSy4xI0VfPiQx5y7BFBShxqcjF/35UqpTq?=
 =?us-ascii?Q?gHMtUcxS05DABIOqgjCDBPfDjsRDL/x15RGaJ8JWnxpc4pW+Vm9A+5AqLnc5?=
 =?us-ascii?Q?2KYOxWCQwYEIYT4UI08K8YNLjECGDSPVinDzLbmRqQdeopH/wqbKRcVRo73f?=
 =?us-ascii?Q?MufPdjvrJX4zNVD/WRCr09LXxqk6HzsV+pmMMiwKZvTstpFiATwnE9D67UcY?=
 =?us-ascii?Q?SQaFX2uiO2VR0IzOdgxggvD2oBvnLqFDa1DxEo0NovvIPGsyo1slS6fx9GM4?=
 =?us-ascii?Q?dgqRgGD/UaAacCL1qblQrTDhHoL0GvHD6Z/8y4xFO7BjhKh1ySNzfE+ZVe51?=
 =?us-ascii?Q?1XDQ5byzZvnymbYaUNThFFz1tEttrkrIfYaaU9uGoS+P/rwkiG5Lj44uWHHr?=
 =?us-ascii?Q?HfSw1jqJlmtcUOE+VUPubuPXJCUvU3W/4FvXEbCnmjHei2L9+01INqUpQ7Tk?=
 =?us-ascii?Q?AwnTKe4eGtpr+QWJeHzzwTsO+nG9eXRNSIWXrtxKeiWuxNNDD/5HCXDLxjBP?=
 =?us-ascii?Q?H+HumdwMWC1xSGsM4gZ94XN8Ked1kgEN+uMHouQm7D88m+aLenGQY/bqhOes?=
 =?us-ascii?Q?3L5+J/ledrHb/YOOBSXhM+PQBcWrD1NICL5+IkXPY5unhlvBrhgupqo9AFLP?=
 =?us-ascii?Q?ZmqQqfzoHgHR6n3LdOudWEIAtmo9+trPFuq2kSLkh45mgdGqG77W719KlcAP?=
 =?us-ascii?Q?5hsypnCZ6/n/sAbnoW43Pz2T11/6Mg2pLMtWeXto/XLkIGZRS/q8LMvRvjVw?=
 =?us-ascii?Q?KrrmPGRrblN3TFAGrjcKDzRC45F7NFp+zQe5/CwFjCd3wgqw+X744Cfu/Ikf?=
 =?us-ascii?Q?Kb87rr2DhMepWDRmZqpxQcgd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a7a066-4ba7-446c-3bf0-08d8def6c7d4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:17:57.0444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAqvbxdpToQsy0aEQT3JjIJrQyUAZh5c660O2IxF7KO1CaIQ4Qfkin84KW8hDYjqI7Q54y/EdjjmUXr05rKC1qjx6YJF90W1dQ5yJEakOK8=
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

Sometimes one of cells in a testing table runs too slow. And we really
don't want to wait so long. Limit number of runs in this case.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/simplebench.py | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
index f61513af90..b153cae274 100644
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
+    slow_limit  -- reduce test runs to 2, if current run exceedes the limit
+                   (in seconds)
 
     Returns dict with the following fields:
         'runs':     list of test_func results
@@ -47,17 +51,34 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
         'n-failed': number of failed runs (exists only if at least one run
                     failed)
     """
+    runs = []
+    i = 0
     if initial_run:
+        t = time.time()
+
         print('  #initial run:')
-        print('   ', test_func(test_env, test_case))
+        res = test_func(test_env, test_case)
+        print('   ', res)
+
+        if time.time() - t > slow_limit:
+            print('    - initial run is too slow, so it counts')
+            runs.append(res)
+            i = 1
+
+    for i in range(i, count):
+        t = time.time()
 
-    runs = []
-    for i in range(count):
         print('  #run {}'.format(i+1))
         res = test_func(test_env, test_case)
         print('   ', res)
         runs.append(res)
 
+        if time.time() - t > slow_limit and len(runs) >= 2:
+            print('    - run is too slow, and we have enough runs, stop here')
+            break
+
+    count = len(runs)
+
     result = {'runs': runs}
 
     succeeded = [r for r in runs if ('seconds' in r or 'iops' in r)]
-- 
2.29.2


