Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1E1308AFB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:10:16 +0100 (CET)
Received: from localhost ([::1]:45884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XHf-0000da-VC
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X0Q-0001YN-50; Fri, 29 Jan 2021 11:52:22 -0500
Received: from mail-eopbgr60100.outbound.protection.outlook.com
 ([40.107.6.100]:29349 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X0M-0007OV-Pt; Fri, 29 Jan 2021 11:52:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBFDrj301vRYLnfnzHOGZrCHDIl/QukRtz/hIKHwrIW+J24eVwD6WzfjSjK+9pPZ/S918Mb3IdOluDrx6+mzi8xlocRWRqmGo8MZbPMqih+hx9BL6zyPp7Gafku/MYgzZMoxmGI3UkGHRleAhkD50Q6402S6a9BkX+tJp/RJG3leCoo/yLPUj1cGtmjumuYHrPpFfe9NHvRriwK+CUgmnliNPyau5+SDRhYfQlNWZInoYBCXusD9XUfYrkcZu+gvcsgeW52rBx0Rv2waHuQ/4fVyf1TuKIqFfdIJn63kccOwRkNJNxOtTQLTfV3IhGomK8/3zZqS0DYFCJeohIOQkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuU5U8ExdiQchUZ41oPhpNoMvYCUBoVyADNBAItP90I=;
 b=TNVk8Pc81zUtOpc9ptEexf/dGuTuVAWLns5V74uydeflIlzjSWaN+IyNi7p7vyiJx7EyxIYOZUcb4uzLlhb5Y03TfKSGQuGgsMLjmim81IQkjUE++tEsKRBlz26UqKuNhzzoZF4q+OaznU/6LLXTBW0q+6NcRMFbwi6wg6//uUwmQnMlx+7k6YyQANr0dlB1CJCWSR5fMX0eYJLLMSUotTImoajeAXfltjVPw7Wnmwr5GrYWKvvixR19y5B5fFrYpGZrPGOmX+tMnUcja8az7a/183uJ2LRHcPe2ehXF19izlEbiZIFqaWefBzDY2BbwxIGavp8Q/1ETEpWpHI+Pqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuU5U8ExdiQchUZ41oPhpNoMvYCUBoVyADNBAItP90I=;
 b=uT4Y1Lo4oXJbtrrquMh9D1zw5Ivxq/CyEtCsyydrMShsGNqQYtXKlrM9K8u+5o0VzKWlm02+nJ47/8ZcG618DSu7sxiGw0lzF7Q7r6jlt5FI84Kcv8Mgqr1tmLWU1lnfY9lSwSsQrDKYgFvtJUK+MyghZLjm2ISDscblW+SdSLE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3621.eurprd08.prod.outlook.com (2603:10a6:20b:4b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Fri, 29 Jan
 2021 16:51:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 16:51:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/7] simplebench: bench_one(): add slow_limit argument
Date: Fri, 29 Jan 2021 19:50:27 +0300
Message-Id: <20210129165030.640169-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129165030.640169-1-vsementsov@virtuozzo.com>
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.152]
X-ClientProxiedBy: AM0PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.152) by
 AM0PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:208:3e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 16:51:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 258df72e-7957-40ff-f3a1-08d8c47628a0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3621520C5510E28BE6D4A721C1B99@AM6PR08MB3621.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fqnViCFSv6sWoBh/X/lyKcXSYlWCoZt5vtQXl3wOnb0v198mYOKgXDjLw5+Rk2/m+PkG7XyT9hYRWEKwX28w9RLMQ51HLSRjp50cQKCd/BtyLBcy1JwKhut58gVphwglGyxdMWWUJCAOV38R4F2BBOaRravpT4NkrxOEz3qDf+dl5YH8qFG/Mit2s/9w2FTwi7EDCv4YDcAifPkL6kAjj1wgkrCnwyj4XpSxcxP/QlPeYTEOycn31BekoVf3QEAC1hJe97CKk7jtcGujTtXzYGhWUP/8ixUfBDh9/hUT+3nvCh4lreSE3fszKlYuvIrGlo156KE2yXrq233/CHwD2PCXhvHMxwZHDHBlNARnFpmFaWTXfSgnL0A8ZoogBnFnp/HuxCFi46mJBLCt2X6GP2fXkPVo9QlNJ5tJnasa8O4pkO5S2v+WyBl/bR7u+nUr16HdzwuNCAnC5qdaf6FJ+NQO0Dh2AMknTePkxP27T1iriamZ0bogzmI9UliKHD3uBQm5aM1XVCZ6/+zC4OUSbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39840400004)(376002)(66476007)(83380400001)(1076003)(86362001)(8936002)(6486002)(316002)(52116002)(6512007)(66946007)(8676002)(2616005)(2906002)(66556008)(36756003)(4326008)(16526019)(6506007)(26005)(186003)(107886003)(956004)(6916009)(6666004)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SN2eTLdxYrvMIF7RgUWw8ghwVytnSQYHGDS5T9D3Z4Wz5lz18BpGaqeRKnp7?=
 =?us-ascii?Q?l6GDI29zUf27krolgp1BU8BG8JvxqQfNd4jv+4bgY1xVU2/+LE2fb8qrqWz0?=
 =?us-ascii?Q?5Q4uVywj2pQUtr0aRc26AUown8Y6uH1uYkOmA9NNdRjxjs5RP4dS14y4iwnh?=
 =?us-ascii?Q?aR3EvP8tykw+bfE2x75f3HwIUyIcWXiMbfcYiIH2W3+AXGotcYXfBYFbSOEY?=
 =?us-ascii?Q?3/eC3p78wBdEVfa38fTWR1Vmd4x2OaYlNGiW2tydgadn2cnERVLExkAYvfWU?=
 =?us-ascii?Q?tdOhoiD1ef5w2LhG9YxI/uhzm9wM0OOFNNWGfsFsVqCfUnCBQhTWBBCC+Wha?=
 =?us-ascii?Q?QDiUdIHH8EXxzqgsgsXCyAvbCvXWgEcx72Ua1lvh5UqcsNKt4eWoUwrCD8X8?=
 =?us-ascii?Q?F6KeIN0rKQm0k2mxHfOoMLTEd9w1aKZpn9mOuYYmY6bz0p5+pFEvE2jnZEaj?=
 =?us-ascii?Q?rohXR5QFRSDNFcunVWhNEXB3biglSihCSxBtkOZ9OMDyXU00H4L0hWeE6Yaa?=
 =?us-ascii?Q?h2Jc6n6k5MhiJ24385JcF+rRPsIYaWxdxG9P52LuPbgRrnHTqvXBfAbNgYM5?=
 =?us-ascii?Q?MTygFFGXMatgOm5kafPKGvfyXlZ2bCQQsR37J9BWMiW4a1uc7cLKS+b23Dsq?=
 =?us-ascii?Q?/Mmty0U4F9MV1488wjVmRAV9rgBhe0jiret1F7bOG2bANycqBU8XRr2RXXW2?=
 =?us-ascii?Q?Z2m1seZ4cPQWy4u8s/EzmUpC1/AE1AQhVXPqNEPr7gNecjU+RKuXZKMEDFWO?=
 =?us-ascii?Q?1bAjGQpwitaTHZlxiu2a+vI/D3CmNTKzSKcMfDkszQTh72Q8mFTQKGH4LPGD?=
 =?us-ascii?Q?eaJa9iFZ0i85Lk2800VURs737r11vZEs5KpKuS1LhUCRvzeE/qPmiBYM01ik?=
 =?us-ascii?Q?uVcSZ6A3H25+QRCG1Tfh5Tdqs6s8ENM0u9ljHuwbqIZA+cElK+YJxeuq+0Jv?=
 =?us-ascii?Q?oZ7yb47uKBD/VPuzp2G+IJ+Qdea7b61i+9aBWllP1AKAHEPYacK9vOJvTC2V?=
 =?us-ascii?Q?jq20w/xl2bJPVQfSpbQGc1uRbn9sOG4JLTnVsyRft4+n08AGuGREHzi4S/Fg?=
 =?us-ascii?Q?R8EKvXmi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 258df72e-7957-40ff-f3a1-08d8c47628a0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:51:44.1459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngwWV7/oXuOV5BUIoEP3xS7y677as8cYDcVHnGIDIcg+JMIZ3mp8yV3GHWbpYCOiiEdxJzZ+RnKdh9p4UpS75dS+bPmAiryzKRjVSDfSkFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3621
Received-SPF: pass client-ip=40.107.6.100;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes one of cells in a testing table runs too slow. And we really
don't want to wait so long. Limit number of runs in this case.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/simplebench.py | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
index f61513af90..78d90faf4d 100644
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
+        if time.time() - t > 50:
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
 
+        if time.time() - t > 50 and len(runs) >= 2:
+            print('    - run is too slow, and we have enough runs, stop here')
+            break
+
+    count = len(runs)
+
     result = {'runs': runs}
 
     succeeded = [r for r in runs if ('seconds' in r or 'iops' in r)]
-- 
2.29.2


