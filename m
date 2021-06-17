Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3303ABD49
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 22:11:06 +0200 (CEST)
Received: from localhost ([::1]:41972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltyLx-0006Pt-Dl
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 16:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ltyK6-00056S-TD
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 16:09:11 -0400
Received: from mail-mw2nam12on2099.outbound.protection.outlook.com
 ([40.107.244.99]:22094 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ltyK4-0007DS-F1
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 16:09:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqV90xd2LYZPB0bEtYjm52Gu/edXJiztkAhoJELwQONXBrxsqKKXLe9xveEV/bWNc203vNMm/55O8dXLtPyIOQQv3xqrCTwK4D6e0Q9c2lXAEO8tS0q9VRXly04/B8tpEwqxNKxRsva7nm46i+tgPgLxf6+7ufAv1fN8jHX4hS3LbNvi8FlsjPXtxsUF274VvazGQftVQg3YQvNDl+W3G+kao08ktlqFOkbU9g/y/dOMgwc7r5uPGv95VwpaPY+T7sYYUy+4CqHVqlsbBpjLfe6bWYFH9fN2QJ/6TxdjJOxuuKwsK+KoYK+4wXsW0U1UvlW2A8iVCWmivssfdZY4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNbeDS6tK2jnZI1G41uT0YwKt0aKWzQtEKgOWtzPhQQ=;
 b=HhWnBem3PHwhKFSba7qn6L6cYXGnatyxeA1g/r/Qb49BnmrJseaIgM5/Fbuk14vkUhNlmB6FfADqEVRxgZ67VuOA/fCLQbXvNrJFL4mdHaGTf/Plmq/NjIkxG7QNMamHxROfX+Q+Xgw5jqJ1/cv6FgFQJzLvjX3u26JipX/n/AFqrDFElbwJNDHQtVlggTm23qqSC91fGZxgB629ytZo1Y13QsTTozxKqKWHzcU7m38qng6IeBBfYqX2V14N6jA4gKvorSqCEawXQM0UtJx1bdpSs8qsJEowTzIt+ks+W5sVr8Rphb66bYVymdmv/U1QDD5x0QNaqlOfAshq7kTAbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNbeDS6tK2jnZI1G41uT0YwKt0aKWzQtEKgOWtzPhQQ=;
 b=V9dM/SsJNxqvqPqIHGG2kJl60uXV8E9wYBS2g2yHWy97tnqQbCZvQBi62E6z4qIsmBcLzr9Gp7cPQQFGInk/gnC30XMEksK0vHAe/P0Pn8qLEMLxRocWJMj0qeRMxDdphKYDjW9vVtObErxWVQzvbt3IN0GT+2XwuQiSC8oWB1Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3808.namprd03.prod.outlook.com (2603:10b6:805:67::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 19:54:05 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 19:54:05 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] fuzz: adjust timeout to allow for longer inputs
Date: Thu, 17 Jun 2021 15:53:50 -0400
Message-Id: <20210617195353.284082-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210617195353.284082-1-alxndr@bu.edu>
References: <20210617195353.284082-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR18CA0030.namprd18.prod.outlook.com
 (2603:10b6:208:23c::35) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR18CA0030.namprd18.prod.outlook.com (2603:10b6:208:23c::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend
 Transport; Thu, 17 Jun 2021 19:54:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d379760-8918-48d0-29fd-08d931c9a948
X-MS-TrafficTypeDiagnostic: SN6PR03MB3808:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB38081D387566E915D96D5CB8BA0E9@SN6PR03MB3808.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aPz8N90f1xCxOi8EG9BiLsyFDdu1+jp3Yj1h9S7esMnbuaTP04khl0rT99t9JQIMCPyHkrbKEVGI614Mzw6HCcUeiXTcYVDSjlXWnMMQLa21S2pa/SM57FY0ukXtSKzotvUA36pLf26KotoAxceOg9KGVEb1wItUHeCUiLKL2lz3HDSS6DNY3JQqBVRAblCHm7nQCZzGdG0IVRo1J+gRu3D+r8W9r7St5lIS8jlMT/BUoodAOFt4xrJAeRuqe1yxM0Dricvsa6Mooq5Omd5AHmRjYb4WjVLqtRyzapqsqLuhnTjVBURxcE2ciB1Df/j8DVda59Ln/MSFa+T/ET195D/J948W+SBgLEdaFM/u9KTlqnKHGjJCXGgFz8bz56HAieR8aUy+ptGxtNWWzl0dCrbrcV/DrrFQMiyw7ukr77IrpT1my1BvH0zcLklINwxjnQxo0RqAjzP/8m+XNJNeQmDcRyq/wtRQ7KFlZK91EykmqQrAv02nKSyQeTb8LwiPwsr8UZyZ1RLuJ6CSuIibXrxQKHA+KvtTT+ZsjUeP8ZFj7nb+mu4i1q3Eq9Aw4ES4ChgjChWdJWG0N2JBsEhLnBMhH/+6Ni75Ihn2XRi1Lm6RMjiJUb4ZO9unmnhLj9h16CMNyL7+jG7Y1J/yKtUBtlK62t1RmbEXVzFQtELQQDLv2BcCoUGZfeX5cPt9naIL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(38100700002)(38350700002)(6486002)(2906002)(6916009)(5660300002)(1076003)(16526019)(8676002)(4326008)(478600001)(8936002)(36756003)(52116002)(26005)(54906003)(66556008)(66946007)(6506007)(86362001)(75432002)(83380400001)(6512007)(316002)(6666004)(2616005)(956004)(186003)(66476007)(786003)(148743002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dgQO7T3W+Pvn6e+sWr1MlygDMVUlR8bGEFyW4lecmaL0cBsF+VQfQ49LiBhk?=
 =?us-ascii?Q?BCSxzPxQm3VXeRZ1eSns+D+E3FypnQQ9jjC3RErT4UCc5v9289W8523h0924?=
 =?us-ascii?Q?NT1+dkq8Kq9Wj6C9IO4PGu9u2rmX40xVF0xXDq6SLz8Au0RDlT+ySdBHl0Zd?=
 =?us-ascii?Q?o8rj63JsR7hzFRKpoZdRQ4hvPPRzgZtXFa+6JLles/cwNGXsFrb1gyGhfkw+?=
 =?us-ascii?Q?PqCBSNei24tvfyLPXsve1DZ5U/LGky1eS+f0/KYs0CvjPu/OpIkRGAuNYApx?=
 =?us-ascii?Q?Mbs4NdBZwMaRs3A3fTRyo9Rq2TR43Ke/j7CpwIPLvoRxWR5DDD3ik59YLtVD?=
 =?us-ascii?Q?SsdTcrJD1KlvS6UTDelQjcurubwlJcNzPE4bRaZeA412IalGV3VUJXl8mp4V?=
 =?us-ascii?Q?J9cNOM3J2a0VtMpt2qmv7a0VM8HAryfcN6UhSEjFNW9Z/kYGdEbYTNV4t8XV?=
 =?us-ascii?Q?DXH2WZLp4OEudhcemNqUCOcMv6L6S1OVktEpN9ap2e+w2STKfpEejGlIWOki?=
 =?us-ascii?Q?kyCqrJzRSGQmTQQX78IKk4AWmFSZzN4nxsalD8w5ujIziZloo4ltAnU6muLF?=
 =?us-ascii?Q?UYQdOoZ0C4JrELtQjCPn1IbSDt5k154HjbpW1ye3uUdsK736Z5Am75Bzkwtx?=
 =?us-ascii?Q?OUSVq8Gb00By+ODSzoWnx/+1zo+dkpkq2b6LxVOZq7jqxip52yJnMEm/dtOF?=
 =?us-ascii?Q?MODlZo1zbMWTxkVku7z/nXPADqvWB8+yY89sqqh5kUtwkOETJLUz8BrCe+bB?=
 =?us-ascii?Q?SdhqJ6MaDb6oS8sY/18sMVbAS0jImxUPV31TN4KPu8fCYc0+kI+m13G+8FyF?=
 =?us-ascii?Q?OCC3v1t2KeuVn1QZ9BFW0DdacshD02eczqLhSrGorkPuVTuMOUYlBtJa79kL?=
 =?us-ascii?Q?JMtTVVBq2QNNfGMwqhYpXjv4VLPzp1cDo4BdNbEGhuLomjAFzWSBLNSfvOcT?=
 =?us-ascii?Q?eTNB76AMpdXHlZkClJl+M/dkC8OOm8mMMg6DE288bEe3zA4jHNqtXNUqXAxP?=
 =?us-ascii?Q?NUb9v/kq0W+QHgrYF8RFg8lwlaTUpR7I4hkjHuXlZ4L81wCMXM2FsuRqNXy5?=
 =?us-ascii?Q?sk9YKPt4B6D42mCns4jQTFU7sneCuPWcanNxYa4djDMx2qUhOe2Izjc/Vp2M?=
 =?us-ascii?Q?h+mNgjuhvQxY+ckq4FtO4v82WyLBC8llWb9+nV14KpAo8SEUdqNpeP7znl8Q?=
 =?us-ascii?Q?oUKznvPZx200mXBpleZWIQBnqtE62c8litKIorAKgRnrQFwU35kkXue0pvLT?=
 =?us-ascii?Q?hqcOE9ykLtI3FAfj+dZpvO344HA8RrjUu3DtwQendkhh/LFGrOhmKR9LDHT9?=
 =?us-ascii?Q?8A8vSFizrPVO8mwGJdm1XqRZ?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d379760-8918-48d0-29fd-08d931c9a948
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 19:54:04.9681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tvOVo+Cu4Ve8nQpkiu8QVhd/U2wksL/ku4deLTu1Yn9JJrB+2go7K7P1GENXNr7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3808
Received-SPF: pass client-ip=40.107.244.99; envelope-from=alxndr@bu.edu;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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


