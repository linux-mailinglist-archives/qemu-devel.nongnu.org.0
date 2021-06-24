Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2113B25B3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 05:48:47 +0200 (CEST)
Received: from localhost ([::1]:59852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwGMA-0008T5-KC
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 23:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lwGIt-0002rm-SW
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 23:45:24 -0400
Received: from mail-bn7nam10on2106.outbound.protection.outlook.com
 ([40.107.92.106]:38420 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lwGIs-0004TK-7d
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 23:45:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILkZiERHOowglzjntjWunh+OYRyB3lxs9yYgXiIBRT25goG7CKYELTIYShZbHGQnKxkX+6hJZpOQVvxmJmAw19TCq6hsRk7N+9f4pLnHffRuQ8FzcvRwwPfCEUSVmVxRxuJVt1GcdGHqSjBJDlCpSZKvIiPEAAn0y1cKzVfe3mXd+6BQlQup4Z1iSDqTUUXufXea+DtzzeDrKoanY3Em597q8a8CddJxQs3KLA/7+p5ruinu+4nOfI53dNTxxrstASv8+KT1kmcCqbC0NTrYP8dZAZFnUCeD70qRkRm+vqfYPlSV8Z7urcikX5uBlFu/1f9gR/hMeQwFhqJ0DMYOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNbeDS6tK2jnZI1G41uT0YwKt0aKWzQtEKgOWtzPhQQ=;
 b=Kr6g1bfLGW3u7xZnVKcEEzcz6ULyruz0GKR72ijpi7RYRZPEHHWiz6Q19Y+TmFTcfAjqcn3h7N0fsAVyOb6/XTyaxy+OO6yiNO2zZ5J7W5bJ6dfvpt3qnitDf6+PLbQQO+q88wODad2PVzmxfGKOoABLljgiSaaq1VDwJNnOHTHq4t6EwWuet6BP72xMIiu8xpF04aNdJ0Iw01qJk9tenVyjrpCoXPUOegP6L1Ug1g0pbGuN5AOd/WgRI0GUkm0+43/AjwbK/ew3+T1cEbEjmYQupqD0l9SYqaSYutrTRHZTR5W/JsCYu9MKR2VWUkiyIIOdLfqAAv80vIvJnevhXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNbeDS6tK2jnZI1G41uT0YwKt0aKWzQtEKgOWtzPhQQ=;
 b=QpgsDP18mCIMEyjVxa9OhRIUaLnLh+EN1eYSK7CR71W89VOn4sELKWEvunw/OCqVzIS9JYu1s6g14Q/IC4JmCreTezgdivFcgYIlUlXMP7ZL1rx3m15333kGp/Q6JUQm1d3amSRrcDAHS7DKs5BYoB+BWA7G6Hw2pwjSnebzUGI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5468.namprd03.prod.outlook.com (2603:10b6:806:b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 24 Jun
 2021 03:45:15 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.023; Thu, 24 Jun 2021
 03:45:15 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] fuzz: adjust timeout to allow for longer inputs
Date: Wed, 23 Jun 2021 23:45:00 -0400
Message-Id: <20210624034503.86256-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624034503.86256-1-alxndr@bu.edu>
References: <20210624034503.86256-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Thu, 24 Jun 2021 03:45:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8660953a-90c4-439a-f795-08d936c27a19
X-MS-TrafficTypeDiagnostic: SA0PR03MB5468:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5468D856B26A4D85E79DF8D3BA079@SA0PR03MB5468.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bmR/qLCP2YJJSllzyxAXxsL/vXBOX7NAMV74J8CSgHX0TGvtCjx1/4apQxqh0gg89ztYw4NYdVjT8JmrV333GM7M7SOfENa1gJ47FwYN+YxNBB+hflhWKHkF6CBWyIoTHbxpnuYsTIO1XqGHtHvmGMSHPIjiSplW89EdP5munoA1yk3XsERqLT4hdsXd95NGXI4FkiAgFGEoh52QGCOVgFjwJ0t2LMsMMwc/s2ilYOxRjuNYLlsQnk814w+zi29aKbJpVo14LWl75uF31X+gq6/+frFRxNYXjlbfXKZfTd6aK2RPRXs3MyAthWcpppj1HB+Jx1FWIP3RGKHmwTHhWAX0yHYmY4K/7DIIofmHBXZhORH99yzjBihm83xXlXTmqGBSb43oP5MAFvIv1RKwpO5dBx1DkilrmCH59EWLhG+gFNN9MA8v37fLIzBOu1Lt8Gx8x54LaD1yDSU4EIBq0Nl2OiYuMOSC4Z/PAafYnGdhnDRz6HIjf9/CAKeJhovfmzDB/Vc0xvBgOFlN9n0yUXzASR4rIcbiUGGluK+mqQ8/njKQ6UZVhK8PUxKjnohYqQIFRW++Snjc1YfOyXtc/u3+4ceXTpPpzd2Sf5sPIXpF1zDqo3d4IvIuJfqjjtEmZY100vhHwEG/Whb1RRwH43no3W35CMbq+TS50/ZW1bEUvcVrUebK3a94MAG0TqDe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(36756003)(75432002)(52116002)(66556008)(786003)(6486002)(4326008)(6666004)(6512007)(316002)(8676002)(6916009)(66946007)(66476007)(26005)(38350700002)(2906002)(86362001)(956004)(8936002)(38100700002)(54906003)(186003)(16526019)(83380400001)(5660300002)(2616005)(1076003)(6506007)(478600001)(148743002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y03kXv6HuZ0kWXeUDMw4CNKzh47Oz2wia3LGfof96+pHjsO/gebG2onZxovV?=
 =?us-ascii?Q?cj7/HiowbB82u0/zcfe1BiYTg/GHVRJo2FErg3anlt7LDihmWEVtsX4oGmen?=
 =?us-ascii?Q?Z5ml5o17ZTk+FewTHlXdfODM+eJjogapHPMg3svv+A07dLPYzDVZkKnsatgS?=
 =?us-ascii?Q?1xXyCVYY2/Bh2LJGHrY/c5brnCEmf/iTjYt14kRwFVFNj5xV1jVL5+Z2atnB?=
 =?us-ascii?Q?a4oPPTjIJCvKtJFwnufW8NFwU9n6jmQ9C+wRvMxjAvox0EppDxCI/Sqo/Cxc?=
 =?us-ascii?Q?E/sqGP3879HhdlofW6fPFYhT6PWfDX4LNd3BbsGeRGC6wcAz62QmkjPIR++Y?=
 =?us-ascii?Q?je6zwQlT26HT4UkEJ/lvMoLpEaZXH99NaJGTVqiI/6f0JWA/gJgM2SdCPSd3?=
 =?us-ascii?Q?wuoO7FCOYrnnGo0ghhdH4vKQ1aPlDYTwtBU4FeevO7Dau+dv2F8fQiiZckvh?=
 =?us-ascii?Q?4pw8LyE2wn8TS9buVwxkdSOPfvDmy/ZbTklDQgT5QWWmSi41kaBdDbKyCbG1?=
 =?us-ascii?Q?cz4QWwwrCWsNe2VP1TjSlOtIjQdHkprTeTtY9PeDYQ+hJ7UYKX5qj5ZjBnFw?=
 =?us-ascii?Q?i0JNDtrS+gOUgNP3DzOOPItQZeaXUyXy0cSibKP3TvNYFBIiTlSNAA+KuToQ?=
 =?us-ascii?Q?h/sUG48VfV3QgqqlfH7uCBTwZr5xyZyoDJJhUqNFVypEGdqttCQZSx3d1ykW?=
 =?us-ascii?Q?25V5oaS7NGVvoR67lKVUw9hBcYBQ8utezBk//2Aircb8C31nhOEh8G3+Zact?=
 =?us-ascii?Q?jbV48EHonbaEs8626YKA+P7jWXY4OmDwuDWXVSi5qrHdvbJhZY/PGgsIt0P+?=
 =?us-ascii?Q?YBUI40Bmb3IlXOQwE/EGiN5Bljm1FH3WpR8mnJTmFjNJ0blpcSo2C0jDsqbd?=
 =?us-ascii?Q?C63qZsYjj7xf6+GoQy1C/nkfOFPA3oDZmSAFyK0Ipoeq510Mzxnzh23GPk0k?=
 =?us-ascii?Q?ZixYlFyisaMStQQY9KyNVR95mAMvehmNU32GgEWII1FG+MtEepiFEcMCb5BD?=
 =?us-ascii?Q?xBhlaogkiBL4+F4hsS4UZh3SRwUCLWfcV4lGEZCvazQJAGUS9muSeHyTR3i0?=
 =?us-ascii?Q?A6O4oY99OaFd51PM6e2OXnF73Ify34rqo3afsui45O3kaplWTtl2CcQyBf6s?=
 =?us-ascii?Q?+ktWD/0twW/x+RSTWfbRb3BwEuKPdtLnpFkGmSkQAMXCft1+M1652GsT5/26?=
 =?us-ascii?Q?i4BVpBvHBK0f0YLdlUYwDaFjRDMeYB/a9wFXWiqVGhXJyuegIWmZwNBp3bl0?=
 =?us-ascii?Q?RJJd6PkAX7E8p9cHqH6NGxTFlBbP8+iTS5eUsjBRawf6rkDzy4VlBIVvlrGe?=
 =?us-ascii?Q?aFBaNs7xnhxira6eBoi0ERqc?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8660953a-90c4-439a-f795-08d936c27a19
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 03:45:15.1712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0Z5lTZIVXJxe22vu74ert/j+mM4ivPTv3IsS9sYt4jpsmzcg50cFfFFeKn1CHch
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5468
Received-SPF: pass client-ip=40.107.92.106; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 darren.kenny@oracle.com, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using a custom timeout is useful to continue fuzzing complex devices,
even after we run into some slow code-path. However, simply adding a
fixed timeout to each input effectively caps the maximum input
length/number of operations at some artificial value. There are two
major problems with this:
1. Some code might only be reachable through long IO sequences.
2. Longer inputs can actually be _better_ for performance. While the
   raw number of fuzzer executions decreases with larger inputs, the
   number of MMIO/PIO/DMA operation/second actually increases, since
   were are speding proportionately less time fork()ing.

With this change, we keep the custom-timeout, but we renew it, prior to
each MMIO/PIO/DMA operation. Thus, we time-out only when a particaly
operation takes a long time.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index cea7d4058e..71d36e8f6f 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -661,15 +661,16 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
     uint8_t op;
 
     if (fork() == 0) {
+        struct sigaction sact;
+        struct itimerval timer;
         /*
          * Sometimes the fuzzer will find inputs that take quite a long time to
          * process. Often times, these inputs do not result in new coverage.
          * Even if these inputs might be interesting, they can slow down the
-         * fuzzer, overall. Set a timeout to avoid hurting performance, too much
+         * fuzzer, overall. Set a timeout for each command to avoid hurting
+         * performance, too much
          */
         if (timeout) {
-            struct sigaction sact;
-            struct itimerval timer;
 
             sigemptyset(&sact.sa_mask);
             sact.sa_flags   = SA_NODEFER;
@@ -679,13 +680,17 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
             memset(&timer, 0, sizeof(timer));
             timer.it_value.tv_sec = timeout / USEC_IN_SEC;
             timer.it_value.tv_usec = timeout % USEC_IN_SEC;
-            setitimer(ITIMER_VIRTUAL, &timer, NULL);
         }
 
         op_clear_dma_patterns(s, NULL, 0);
         pci_disabled = false;
 
         while (cmd && Size) {
+            /* Reset the timeout, each time we run a new command */
+            if (timeout) {
+                setitimer(ITIMER_VIRTUAL, &timer, NULL);
+            }
+
             /* Get the length until the next command or end of input */
             nextcmd = memmem(cmd, Size, SEPARATOR, strlen(SEPARATOR));
             cmd_len = nextcmd ? nextcmd - cmd : Size;
-- 
2.28.0


