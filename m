Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AD234604D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:53:39 +0100 (CET)
Received: from localhost ([::1]:42576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhTW-0006Vv-Ib
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOT-0007Ck-RL; Tue, 23 Mar 2021 09:48:26 -0400
Received: from mail-eopbgr130102.outbound.protection.outlook.com
 ([40.107.13.102]:31392 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOM-0001rq-6S; Tue, 23 Mar 2021 09:48:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Afr14d+mvJWjixnJaanTrA+0ItDX8ineuLS2PrLbw647Z8YG1TPKbCtXxPnkKEJcZ0aUSNV8Wf80tgxdJbswEThu9rV3DnHlDwZBtZxa+cVlmQzxwGtZ/6+VHnZiWmUj8SxYO3vU9GYlZlOVRWmqL20FVJDl9zYtBHNyC5Sx8svSlYudpm3Uz42EAMRB2btWKPRXxesjr9vSp3Kil9QyOtCDFIU6nu13AAOswiKtUaKCJ3kigk5TWTBFQ9K/pZmuVVR8l0DBoKRXiQtfvLrwXn+cnhcNmfUFyBFZp/g01bDdTvmqA7dnWQYfBj0zekQqzejFjcOm7xP/y9KAVloy9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHQ7ac2wPzOOmfJru0WutQsluIcD0iKdcjdz4ruWVGM=;
 b=EObX24zUre3VsUaD85VQcMhKMTn5qGShtQW9ZFZ71w1Rcov5eK4qRtuqwUzCYC79cq+wqr7tEpyBX1I87L47x6+Ga1jc2MsompIfuZ7mnKPkxPYGEEjWgQcnSWrrgZhE0Tka+y3zVvqFx61vul6e3zxEslIi3IK7+HD4YqUaGZCNleqBZJ5s0L4uVEawRmef9fVawYBJ8Bs2fOgrpd/OdgO470IjbEgwDTCWcLZi05bvK6u/3Dbdbj4/rsKXFjLU3vvVwjQeOKOgrc+XOhtMb3N44NoBSlQ9Bk5uHa2u7ayqMYK5TIzj45rjtxDFys3LF5UE9nuiBrbTRvbLJTdpaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHQ7ac2wPzOOmfJru0WutQsluIcD0iKdcjdz4ruWVGM=;
 b=tVkfQBurRG9/GYEA94jKxXCzkT8ObX+MnSekhC8nMb2LgNEpjJoGquNBZTEasjQjkJWj4g2DHeXifqWrAlqyk+5w78QP0xgzsqs0XI4ki68jmdxKaa+ZeMbbb8oLjCDSoRxSe3Bwhvei/eOwh0ALY/9m7smTz9gNYh89H8skvmU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4070.eurprd08.prod.outlook.com (2603:10a6:20b:a3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.27; Tue, 23 Mar
 2021 13:48:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 13:48:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v3 1/9] simplebench: bench_one(): add slow_limit argument
Date: Tue, 23 Mar 2021 16:47:26 +0300
Message-Id: <20210323134734.72930-2-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 13:47:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa356c8b-c7c0-4476-11c3-08d8ee02459b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4070:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4070A56F4F197C62EE1B60D2C1649@AM6PR08MB4070.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O6iP9Us0TxYhrkcfwyHjSPhCFLWlX/PS24xtFGexl1Sv98gciSUDmXSxFNqPkD6sY3CNpKiWCMbKWm4TqsBd8agfolW7FpKKDvbKcRlmdrew2l9Elg38sS0QfmEvmTosik0AJ4t6fvOGeVpnxj1DRyFHGGz3SMF74hfSy9QFwBoOYKdYA9lkecZIqeFVpeFzRH9gQjhjwIShFZRkY++wLg2OZYpmnaYrO8a89l90sSgYjGb+YOL3wS8SFBtaIk0jydDMgWQdOIXYHAjvuZ4hnJfJPGezxQrpZIqq4wBQl8Vk0skqZa+K7foo8iMtVjQWd1oCDH5OC2EvR9ArcnywenH4gQJ/exaNU8Rp+dt5XnDs6yHiwbUh0niQx5MJKHNwadg/1Cuqy9yZvZigBToqt6J3uX3HMaILwiVmwRDEX8pm3W+jTroH+8cClpRtWEw+i6KWbSgU4gHcbi/JHhgqg6DSUmC0JDsXuWCEz2UIZVD/oYxdxEuC0xtcTMJTBxtyZGxV4OY9JbzesimlGrd3DrAnPJRNlKBoURiHXtxSK+ppbNJMOrdZkUQDIZ/pyAeng4pqNd6nA5H0GAEfvuQzZRfK57e5gOFdf2pC/VoZy2krjiipILjZ/8nTCRIK6Evu7Cm3UNSkunvOSuI/UPJZrzUax0F+lRJLjQ9ZbxCGnYi7IRPVuVtRy4oXsNVC8/CK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(39830400003)(346002)(69590400012)(52116002)(8936002)(6916009)(8676002)(1076003)(66476007)(6506007)(956004)(83380400001)(66946007)(4326008)(6512007)(5660300002)(2616005)(36756003)(38100700001)(478600001)(66556008)(316002)(26005)(16526019)(186003)(86362001)(6666004)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TU3jtzRdsXIJ+Cu0jsJ1u1MXrlrQGrNjnlMZ4DlypuV271Iyos0XwOzmJwAT?=
 =?us-ascii?Q?WsnIjRClhoQqdc+oUzHRQiMNBwiW80B2EqMQNhCB5nA+D8BKX0KMRwPiwdM8?=
 =?us-ascii?Q?J7SVkKFH66cNKhbokYX+d+yu/uMjQii3WdveY5OIPUifaBlCbQ3ffemF/Z7d?=
 =?us-ascii?Q?o2eAP9ZPzXAGvWE9aInKAnUcZn7YSW3ublSlrFHZ7YnjfnR7zcjhDsCPgG/E?=
 =?us-ascii?Q?GLjHbXDJWQVB2l8ouOjbbk4AHgfvKXdQF6w7rRzs18QKDACuPvVi0K4mGJRI?=
 =?us-ascii?Q?HM8jYcfuxyNnZMWIxRgR5XiLl9bw09/6+8XS9p/zyEhZ1HLy1jxRF1E++5SB?=
 =?us-ascii?Q?wTPh8tBPlYTUvUhb5Y0cU5IdDAmwp6huJ1BXu0Gvy0F7QNGT1ot8Xf+LGKib?=
 =?us-ascii?Q?IobAzxypccD87lrvMT9C/19kLlktFK86vTmV0Vi1IF6n12lQ+SdCFVzEmAqm?=
 =?us-ascii?Q?wmBnP9vowUrKPkcYb3qDYdEM4P6nEmx9TbFmKSPrnKUD/zxApfEQCwIfVzm2?=
 =?us-ascii?Q?0XsXY6pW6+diZqpOk+8gI9tHT5Gq1PanwIYvJnQ57HmkJoSDePHeEhJuEyd/?=
 =?us-ascii?Q?Rty41IaGEKDQ6kBEgjyvRnEkbqY2+8B2OCG/5X0kJAAhG4sBi1JRxkunijQQ?=
 =?us-ascii?Q?XCwcKuNiP4TgvAiDZg2uFTra1rPS4Wc+oKpUJi7OUrf56RESSj/7y6MjaTOs?=
 =?us-ascii?Q?itvxtEqFQySF4hPikTRDsd0uhwoJRCefzPa/skk3WLILPq9+5CxjmrVk6flK?=
 =?us-ascii?Q?Mb6IVjGg7+JihfIIpfWIDwnQYiuR0rwdrpvotqPpFbfrgzmy92JIw8i4/DIT?=
 =?us-ascii?Q?7VLcVbQAxpBoEZJiJgQKE8F7jz9B785fphkoIQLcA3voQuAMQBrOtayf+bvm?=
 =?us-ascii?Q?tYktJT682JYj71kRfjoFEOJd9vCTh9NIBeib/hrsBw9/DnpCUIWIEcCcsZ/M?=
 =?us-ascii?Q?l2l25sFameVvGvvS4FpZCCU/xJ+o2zGejJIkB7PKWrU+RrUgEuRJrgdpY56S?=
 =?us-ascii?Q?kuocONDQ8rDb2GGGt3kM0fVrEDGnt7lBpDG2fqWn0xdxH84DOtkyBO/9XbpV?=
 =?us-ascii?Q?IiWYD4xwuWy2nAkqckRH3v+CkNvVBaB6ATAlAbNRCm4xdRcFRfW7mAO3md3P?=
 =?us-ascii?Q?d9pI85SvHkZ2ck2Jhjwnk4z9kNNHCAZANtdv9/t3A0cazKzsBvUaF7b8LRao?=
 =?us-ascii?Q?q8VEFP7xq8E2RVC//6FdtH8WA+A07tmAQODeJGUNXjGX+crSNjV2iV6HRpyB?=
 =?us-ascii?Q?cqIfJn10SfMBAejVldbRqRdPxTirrPX6iXD1UIs+LAN8xtk7BMMhiIYtkJ0U?=
 =?us-ascii?Q?0KQDwrwYPAPzqi7kLC0I5B4w?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa356c8b-c7c0-4476-11c3-08d8ee02459b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 13:48:00.0052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1b9QNvE863WjiaJ/YjUGHIeLlUdB/KG+rRoAioz5bOI3Ajro6LybvEzYuptbSRFpkfyg1N2CVbp32xkOlR/eTzE+PLaXGUSq9UxzIm11c08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4070
Received-SPF: pass client-ip=40.107.13.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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


