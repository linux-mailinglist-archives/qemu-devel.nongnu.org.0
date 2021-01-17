Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDBF2F9509
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 21:13:10 +0100 (CET)
Received: from localhost ([::1]:56296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1EQ9-00044u-NA
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 15:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1EO6-00035E-HB
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:11:02 -0500
Received: from mail-bn8nam11on2114.outbound.protection.outlook.com
 ([40.107.236.114]:56801 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1EO5-0003aU-2m
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:11:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAzWqv3UE10806oyQG4WguJnutw9RO8Sik3ufbyCMTLGgp4kySf7k4GSeJVnj5pR8vA5T5X83KNLrXKGMBJsHxmE6NzRuW80tT8L1SiGM4mg9rHfs2609M1YbZbdMrfklKFKOA+qv9x46ZCN6isYEH6T5MhuXTVOB/aPfrYJHf1kZFMP/YEl8igaecTaiMi0QMh3NEYwDbWgJ59x8077/5RRzPs7p4bjkOoc3opc7Sb3ZD1xkE3TxFumGs73bsqM6OckhXH4drbF6p51D4AD8cJf77ADjv6I0vaELitpKfeB3/YdWjCACFwyODqE8kQYo7RmyQSHojVePb0wbU3u2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XtmPY5uc4KFxpQathGjGU2lSro3732mjTBWdV1lNJo=;
 b=Hw7i+fYfbyLQgX6MBhCiGCL5cVRaQzAMcCxaalL4kt+5YjkW07IDg5/ZCgd2QXsjmf0xShv1eMIinfVLhyMVJ0ij3hpTvxLv/w6X/M5luglhYI4UQeY2c+2d6giYL+QgJmbYTh8pW7WHBQkyRN6wy007+Qq+cwcIjQAjqGuB2fnwCEoag8t/TizAUVsHnA8q41o2umnMbqq+dRikXQTrbiIqLTwRVXLY9ugo/4bUju4Iy2P8Jt216sI9hsvQ865TblANi7HZGtqXd+GmMLpnW/IozTklsk1S0FjYtwrgtgoWyNX9w8sXg4jGuwWjjsBPmagX1QaGlQj/f3vkpeFDuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XtmPY5uc4KFxpQathGjGU2lSro3732mjTBWdV1lNJo=;
 b=OWHD4CeP6paXZURG6Mn3fi6Z+SeEp62dEYHFGDoAz+grmVZPl2pwnDUPt/T3I2Qj2fjKc7jPfVXDQ3ePI13TwTRZr82KLGWqIfb7PyhJkSBWaLjwRgumA66Zv9J/R/trNwmeeEl0+GDzfJquf3jB1lk6pqy6qcMCfhlcowqYdLE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5852.namprd03.prod.outlook.com (2603:10b6:806:115::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sun, 17 Jan
 2021 20:10:27 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3763.014; Sun, 17 Jan 2021
 20:10:27 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] fuzz: log the arguments used to initialize QEMU
Date: Sun, 17 Jan 2021 15:10:14 -0500
Message-Id: <20210117201014.271610-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210117201014.271610-1-alxndr@bu.edu>
References: <20210117201014.271610-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BLAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:208:32b::28) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BLAPR03CA0023.namprd03.prod.outlook.com (2603:10b6:208:32b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11 via Frontend
 Transport; Sun, 17 Jan 2021 20:10:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acd88a0e-2b2d-433d-af81-08d8bb23ee51
X-MS-TrafficTypeDiagnostic: SA2PR03MB5852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5852D197BB1263BBF7D7490FBAA50@SA2PR03MB5852.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: glLgMAn/xY0FPxwIwYj00yy8Umw+PX3hyJ+3hL2TKLxvS1PI33TqK7FvAvOfmorjYqeulbcVWd8vWanqWA3Wi4hg2NNqUZHQ5mgHDCd1UbIuC/99+ytPCZPDvu8tw/FoJ8mwB3LLxmDbzyDkK7ljDExCUYSAjbw4dkGbRt4jZpQ5nrer5mKPelwei1e/b68qpvaNhSqGVGRV+dE6g6fAoJrEFTz6KW6eNLzTASi/Vf0cduEC4I4G/eDnNd0/Ong9hK8q72EWYxk1dXictTKvOGJdd7epdSAqlazWpHsX9a6GcTTpBhis5juFLg/qYvWvphl84mYAyYgS9zivZWfARsnBxpSypgFhPjCKCGxNQU5jX/4vseOXrN9MiVo6/3V5eGCyIBmq3dQYe9IvmuUBxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(52116002)(786003)(6506007)(6486002)(8936002)(186003)(26005)(16526019)(316002)(1076003)(75432002)(2906002)(5660300002)(6916009)(6512007)(66476007)(66556008)(66946007)(86362001)(54906003)(478600001)(36756003)(6666004)(956004)(4326008)(2616005)(8676002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Zrn3sVOQUshmgPk63xD5UzIm4k1QhShe5Bv6PM95fwAgl7El/5Y6LBerq4c+?=
 =?us-ascii?Q?+IWqHTJBq+p/YH9UpWNInzUsh9XWD8PeqG32KEKsIN6qZzv3To+Ftnc3sclQ?=
 =?us-ascii?Q?23iFe8K6Jt/2smGa1avjRyc5twczMhYEtc5Sa2w01dpPgtR886B4xdn33GbP?=
 =?us-ascii?Q?YmxgGYFloKjK7r4zUoktTHA/W+h6Zh8cqT81It5PMtygRAirpkNvPWP/k1kw?=
 =?us-ascii?Q?hSEZKboaSMRvaueXi/RyUA//BUq3wghrCQVSmPmNqybhsVKsc/PandhrplCH?=
 =?us-ascii?Q?pf8gym42wXJMCql64fvl4oG8jZLzCjo1tq2ZGrdMes0zSLi0JZqaDyfAIex/?=
 =?us-ascii?Q?XsRVyEXZKtL2KmhUSFmYz/psO0NSb9xsaL9IyEV9Txxq8qou4CTqa1mSrkWK?=
 =?us-ascii?Q?DlI0ZaL5iauB5NsVTqk45v6zRT/kYQQWfbCAkJQAwGMS0tUTtbPexc2iNeav?=
 =?us-ascii?Q?Y29I1+EtuWoHCqXGjHOon1JqPHSWbRNO75I2KBmG6H1jH246yqB3jfx0a2dD?=
 =?us-ascii?Q?l8oCRzEr77CJyywAJ9RnzB1mECDqmB999UvVIdE6nYJfC8kvU6CCUexCL8oZ?=
 =?us-ascii?Q?BR1S7HT5gim74lgqn94yfCjwzDX45U1fehfjniA9HVorm8zlm9zoXMcKXhOE?=
 =?us-ascii?Q?zfSf1GAbjOwfVYcdXjI7XwDuTr2VDvRjcKAYBnhts3GVXak8o79mUBVr/Sgb?=
 =?us-ascii?Q?q0n/ch8KwnjhakoNTZeYeqowbk3STEh9wg/sHF3OHkTC+PAwDE33o8UGBJtn?=
 =?us-ascii?Q?WbVdrnOq4n56c0msE3ZqnLHssuMqv0dsFmdig7869QAD6z/M3ZS5N8C8Ds4S?=
 =?us-ascii?Q?WGQP6MIhXypN8TrbBe5GsZwH+YLWCobxlMEGaBRY2bzyIC1k8D//s6rgPwzF?=
 =?us-ascii?Q?iqNPqMVe5XTkJ0RwHNqvdW/OTWQJWOB18SScf8IW0py/MU0Qx2SETDbKqreg?=
 =?us-ascii?Q?Ccjb+inbsNnbMkRGgnN2QWVU80ARrpInLXabgi4L//mwxPQYcNzn4gmna63j?=
 =?us-ascii?Q?8sEg?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: acd88a0e-2b2d-433d-af81-08d8bb23ee51
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2021 20:10:27.0917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pk6gCBGjGdikr5SrCiU5kwzMvWjgJH6twCqLg51S2LMqWvgbqYwEjdGhm9v/3k7C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5852
Received-SPF: pass client-ip=40.107.236.114; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is useful for building reproducers. Instead checking the code or
the QEMU_FUZZ_ARGS, the arguments are at the top of the crash log.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/fuzz.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 238866a037..496d11a231 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -159,6 +159,8 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
     char *target_name;
     const char *bindir;
     char *datadir;
+    GString *cmd_line;
+    gchar *pretty_cmd_line;
     bool serialize = false;
 
     /* Initialize qgraph and modules */
@@ -217,7 +219,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
     }
 
     /* Run QEMU's softmmu main with the fuzz-target dependent arguments */
-    GString *cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
+    cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
     g_string_append_printf(cmd_line, " %s -qtest /dev/null ",
                            getenv("QTEST_LOG") ? "" : "-qtest-log none");
 
@@ -226,6 +228,13 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
     wordexp(cmd_line->str, &result, 0);
     g_string_free(cmd_line, true);
 
+    if (getenv("QTEST_LOG")) {
+        pretty_cmd_line  = g_strjoinv(" ", result.we_wordv + 1);
+        printf("Starting %s with Arguments: %s\n",
+                result.we_wordv[0], pretty_cmd_line);
+        g_free(pretty_cmd_line);
+    }
+
     qemu_init(result.we_wordc, result.we_wordv, NULL);
 
     /* re-enable the rcu atfork, which was previously disabled in qemu_init */
-- 
2.28.0


