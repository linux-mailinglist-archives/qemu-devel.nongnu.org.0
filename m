Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6753F7643
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:47:10 +0200 (CEST)
Received: from localhost ([::1]:45012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItFA-0006Lv-67
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItBE-0005wl-0A
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:43:00 -0400
Received: from mail-dm6nam12on2127.outbound.protection.outlook.com
 ([40.107.243.127]:2657 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItBC-0000OG-6X
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:42:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEV6svc8WmtRLMHx1PBscodum4Q3wCzVdRdBBqROhpoNkEIH+5rxU02/2hktqnWrDAcdiJEmP0o3nTVY6uwnkXGwOjYUG2aHoNTsxKTDj+zrhTrOI/vYVN+4F/oOy/mGMnMOI8JThhzxP85zeSMol4fDewvOfx5yj0Ahc8QikdUodK2qfmNsreHoRxRQjFGuBFv5XIqHPo+xRCPaE5a9XNYtt0Y15gOQlSzlhnfoQ0DWHgf7fqPPQoRwBGRr9hK9YMzbhewn4zuLdcQrQoPH5tHsjg5P4NbM9jnSordUs3qnIpOERF2RNfZgcXIkTGX7esks0n/Z5stHXV3THNnt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViKyFqWQnUNATUV6hbSOgD+ZMIhOJoUIKxxvWtS8oG4=;
 b=IB7TeyOcpdM+rf/+g0BLnMlmm0SkjdU5nRDf344bnU256NG0Ryf9sQXFVy7/1oAv+HEqoM31Z4m74+pttXj+D0v3mTUU67v3/hppdfrSptfEER8tz0L5niwiJPfVlgFFxDjx9xrZpeHSNIiJGmea9tTSap99sNmmcnD67TvyuuOMQSe911tGZo++KzkOwCgbI05B6oM2wzOcWgmRZVxwDxp1vQwWZEqsA55phKgSUb0CQGjdBBSazTB4lSy1U32FGr7AuJnna+Ekrh4FhzF8PLrSRszKk95m9UIKpB6FQQbHMEFG9guE8K/WDjD6kSBabyThToDOmsYMVGF9xpAO2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViKyFqWQnUNATUV6hbSOgD+ZMIhOJoUIKxxvWtS8oG4=;
 b=AlZQfdiWW1+UstNTweiLOSaEZfLeXMeS9vMZL15jcjV69XI6zXIY/x3Sm/pt7pDG/09gpGwSVcZje//JQ7rmNvQIy0bjZ42NGBcIP2G9nGqX4GmaXgoOhUnsY/I9II7br0FE19wGRRUpntcwdU5Ua69pXqJDOnCmicQtxqQZUwg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4399.namprd03.prod.outlook.com (2603:10b6:805:fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 13:42:52 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:42:52 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL v2 6/8] fuzz: unblock SIGALRM so the timeout works
Date: Wed, 25 Aug 2021 09:42:30 -0400
Message-Id: <20210825134232.45074-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825134232.45074-1-alxndr@bu.edu>
References: <20210825134232.45074-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 13:42:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a83c9714-e89a-4974-609b-08d967ce3c0e
X-MS-TrafficTypeDiagnostic: SN6PR03MB4399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4399906B219782C6068421D7BAC69@SN6PR03MB4399.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aEe7Y3yY3+bxL9AO1tl0fweetyhM7Jy8vIDwuXXBmkGPPWq5uX8iadYvkRMwnh2s1IbOHxZMc0dWlI/VB7RDpJfAythdvm904N8nlVA0s625BRBJmbIehf3QnSPDBPv5IbzK4MoQo5BK0o/ap0D6qyah879X/n2IhDjLoKMEELl1RwK2fp98h7sHH4ikWxGsate3S4fEAtxsaqUF4Lvgm2u2dyisQzzL/pPWMlCDtz8au/CfmFpFgJOnz17/c/MXG2auOrpiLdMpD2VkEtEtBSOweOZVxWm3gVWZLp0gEYQjnkphDR4qsQePCAuWq1V7fBWa/fvwc9rYJd13SsZw47odh9ZJk1urzdK9FU/+jngMJvpAlVj4OgINQHPGRXvjxGCsm9P+wGUnW6hKKjhJCFhHXd8U3iTQm6fwVxtANf9hdN+MYAenCQBCJkHnuUWD2APYPqjuzAVbYp3xucy4dy1Efvl0O4lSGM1u46mDpL5R5QHjnpTNl+hocyrtt1IJnzEwW1UC1thugnRIdncNGsqH9+vsC+jNd19xs+Hhu7zLVAM8vJfin2x3SoKOj1XIw14A2Ook//zdeXR+3dQyHwYcE1gUfrrVg6UizxryAxkrxyFy/sPOIjmD+9ZrzFbnVpX7ss4CccNR6XoV9KDXOKX0VgoG5MOOqec1TRHE9TuMt7sTEFFHp2UpMQs3/HsKrHoT8SEA5XVvw+vkDOXv8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(66946007)(52116002)(66476007)(75432002)(86362001)(6486002)(2616005)(1076003)(956004)(8676002)(66556008)(8936002)(6512007)(36756003)(6666004)(83380400001)(4326008)(26005)(316002)(786003)(6506007)(54906003)(5660300002)(186003)(2906002)(38100700002)(38350700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MeW666zxAwzf1nPM0lXVmEuMaJNP6lYoBKf9r8l5bvHSrFcKYak9XK028Rpr?=
 =?us-ascii?Q?g/3sI5ACrl/ZEtIWcco3VNwh2+2wMXlPlFmSsHWW5yE5ESy5afRkvNBWeAhg?=
 =?us-ascii?Q?eCt6spfCGqNKPdBoaBiCaGNGS1F5Lj8OK9o7Mh4yLXAAsUggFiIxEhab2NHi?=
 =?us-ascii?Q?RNT4V4UTRoZ4F8t9zhHCfjpkaLQHLrCB7TB8KcLzm9L5tomzXeoDGtanJ6Ov?=
 =?us-ascii?Q?fBLQ5cGLqteHiAcMokAnayPQn9bjVQTuqEmti3miPXWeOmwZ++QjcC4vVz0s?=
 =?us-ascii?Q?/9SLP7WmN2QaG2P7SutlYs9v8NkeDhGptVJDz8Bm0zfG8XNIxTikYU/00sYQ?=
 =?us-ascii?Q?UGzMvYpjeO7py6GTrvrGKqO5bOVLFy6V/MGmy9j4wN/Quycg2qGLGrAxbATP?=
 =?us-ascii?Q?FnH2QxFHNZ1Rno3ST7PprPPN4lbcy6E4M2Ehc0hpF0prLL1vgCLSfB9t6Ttc?=
 =?us-ascii?Q?hJc4VJQtkzHW0ck/gxji4da+bIgtR3Ef+qkBvmZJTfiJPfWwfZEnEirigDsn?=
 =?us-ascii?Q?En2ksNqv46jUVgUeLXmm35SNOgRvjRoGZkojVMOxWqZvxudchqXemwa2nS3k?=
 =?us-ascii?Q?ZsaK5VdAFOA7igtOreqyqokOd9yrr7Z0mt+CTmYPeEhD1OHJMpDq3PZT87WE?=
 =?us-ascii?Q?5ohC45PgC70DIrkiwm+efjFfsUTpD09Qoj94LYE6QIfYe1rfNZW5fwn4qgqw?=
 =?us-ascii?Q?R/CSrTnWDNiNHm43qCZs6hSH72ItNQuq9gmaG6JRqCc204drI1vHmpZ2JBaJ?=
 =?us-ascii?Q?0myv0U0CeAzShRTcBwn13kfxy05CyvoZjZzNmKbC1E6X8L+FiTwUKGJxabMn?=
 =?us-ascii?Q?K70TDUTVMtQSPOR0j0OLJC3ExzqdR0yDWz/uzsa7rdsPyuH3GUqCLXSRoBP/?=
 =?us-ascii?Q?9i5diA8P9O8fBwDnGjVHLiMmPp27hLxKhk6brixQPX5WPGGFrF4bI6+Ni8ys?=
 =?us-ascii?Q?qTRV558uoBWLGcIYstLnGh8sjUSRHcjEIn9xuAwo06WgYWgCjlHq4LJbZaGL?=
 =?us-ascii?Q?SSg8HSaIdmCG97AfhZbNokj0JoV6E/WEe5BRhXCt4UMA9NW6nrbr/0RnRALE?=
 =?us-ascii?Q?Y1H9Lfy2d7dtFXwRmbJDInbxgG5aLa+3XY4n17xXkgrJn1wvHfsZze5GzbfC?=
 =?us-ascii?Q?F4bOVemfMPlAfnxf5lTMGCbKj9o9F2ezjInzmNtNzKcZBR7pfAJGOFSYLKQj?=
 =?us-ascii?Q?7KI+/yBdMYow5ETFORalmatjIkXrdP5Ti4kPjGldeNRG1jzDW4fk0IeDvRNm?=
 =?us-ascii?Q?l6ysxl6ukkYAMy1KZaESJ50iip4+CLmBYp5Dwd1+twg2nm0VV380OyhCnHRv?=
 =?us-ascii?Q?pvldG2mBDT3L09LLwJXBd1Vf?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: a83c9714-e89a-4974-609b-08d967ce3c0e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:42:51.9474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBzTyNafUxWB2nLjQQjR8ZqNPD1h40tVqCR0m2G0k3GxCgmyjQyz9GpL/zaRcRoV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4399
Received-SPF: pass client-ip=40.107.243.127; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.89, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The timeout mechanism won't work if SIGALRM is blocked. This changes
unmasks SIGALRM when the timer is installed. This doesn't completely
solve the problem, as the fuzzer could trigger some device activity that
re-masks SIGALRM. However, there are currently no inputs on OSS-Fuzz
that re-mask SIGALRM and timeout. If that turns out to be a real issue,
we could try to hook sigmask-type calls, or use a separate timer thread.

Based-on: <20210713150037.9297-1-alxndr@bu.edu>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index de427a3727..dd7e25851c 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -670,6 +670,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
     if (fork() == 0) {
         struct sigaction sact;
         struct itimerval timer;
+        sigset_t set;
         /*
          * Sometimes the fuzzer will find inputs that take quite a long time to
          * process. Often times, these inputs do not result in new coverage.
@@ -684,6 +685,10 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
             sact.sa_handler = handle_timeout;
             sigaction(SIGALRM, &sact, NULL);
 
+            sigemptyset(&set);
+            sigaddset(&set, SIGALRM);
+            pthread_sigmask(SIG_UNBLOCK, &set, NULL);
+
             memset(&timer, 0, sizeof(timer));
             timer.it_value.tv_sec = timeout / USEC_IN_SEC;
             timer.it_value.tv_usec = timeout % USEC_IN_SEC;
-- 
2.30.2


