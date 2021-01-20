Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F37D2FD779
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:50:54 +0100 (CET)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Hd7-0005QO-6O
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPh-0000SZ-1i
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:37:02 -0500
Received: from mail-dm6nam12on2125.outbound.protection.outlook.com
 ([40.107.243.125]:3041 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPc-0002pJ-A9
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5N9pd7Wkr7N6oVXd/IfSoRgpGvRR0I88F7e8gNQlr+8GhOhsdSyutUAeL9wX6viNVkdhymSuKZ28fUEFmKeTbTPtxruhOv97Hy8D+u1tAHDyLW8GjvX57T1WphskDIxStegvwjVTty9gQbUhJ0Pdj4MP+Maots168MMpXV70SFY2krDHccgdxapKtrraAqHRhODNeKZVTTweK+t9fvTHiEGsmlDc5iafAufdCvL1YZWtPcTverUmPV3QCuoyoVkIW2CuGZkMhH7jBzaxPKa+FgmYlhoF76R2QETExYeiweGXD7PpyR9yZGjN/bdpnEy9OIxXuOeL8sBosKi4h+ptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLy9WKWcmh244PrZT1+eMURUT6rfHcabjnR2Och+ikA=;
 b=Qp+zc8S3fu66kBNbtrvHUqFDqgBJIz4Wp+1F0cBk935j2WQ2BFSCEtYyqSYshLOlNYo6M8JbGGu7ql+XS6S0ZgSKjd7XHcTwJQgXtFTI9mLY3b0Ds2DIIeLQW76qhMtVBePSXpdVsyPsR9WCcf/zX46g7EOW0ipP2PLjKi4G2U5YZ58kcd6WJDueltXWBnAjlypeSbQSNhsiP5nb/Aq5q+SGRg3R1tSTK/rkfpL/+k7PzkIfEOIguICenCxTTL+NXQtPC02Ftzk0tJaMwK85l1BRlN8Wt3qIe5ViPeOD+FwjZgVkffG0xOCCi3BAXZgCdUu7qgxAfFBWE62OV2Cx6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLy9WKWcmh244PrZT1+eMURUT6rfHcabjnR2Och+ikA=;
 b=pBEdxb2I1XvwhPADlXSGgvn/TIeA+oBh1oHkfJFGQZzWCHpGQNQFtWaiYGJ6YM6nE/PqqVpTGkwYvoCZ5TpscpjxGgqA0fcJZ9hqN9m/RVMkQNsWaACjoCKqoOEQRlR06lKAz9lvivXM1f8cF28WiGdB8GO3Mp3ly8a9I23KGgw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5530.namprd03.prod.outlook.com (2603:10b6:806:b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Wed, 20 Jan
 2021 17:36:46 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:36:46 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] fuzz: log the arguments used to initialize QEMU
Date: Wed, 20 Jan 2021 12:35:30 -0500
Message-Id: <20210120173536.265601-9-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120173536.265601-1-alxndr@bu.edu>
References: <20210120173536.265601-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL1PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::27) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0142.namprd13.prod.outlook.com (2603:10b6:208:2bb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.8 via Frontend
 Transport; Wed, 20 Jan 2021 17:36:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8803ede8-8455-411f-324f-08d8bd69f457
X-MS-TrafficTypeDiagnostic: SA0PR03MB5530:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB55308F374B64AA13CB808052BAA20@SA0PR03MB5530.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UK6ZgKM8Eeig+sK56KZRiCw5u8kjSNnxhObPY7C7kCBTQ6xW00DE/SQAKgbPKQ2170PMfaJ/xTwFk0891jRqH/IrgNOALI/RLY8HTQQjPwS+iP/cCMLdevltqpz4YrzyiTJe0+Lf7D8C61r7yuANzGrSj4DyZ1l44KD6qXG5AaK2WdqPQH1T8oPUZNwtQjeQ3NENl0VmlmRFCDA8QhqnUNRATFI/nSbBgTfjIECVbhn+wFuURqZawXapM9dYzBNni633SyONZpnn80/Il98IalvpA2aZqGNhZ67KFnBCnkesNPD9u/1357OUFfwS+FV6AnF3TbVbSlMy8aN8gpsyYMkVCIzQNnMCjYsD7uOG9prAk9yknpC8xG9moshcyTu8vE1nMt5y6h5/BCbZDZ8MSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(8936002)(6512007)(66476007)(6486002)(8676002)(956004)(5660300002)(4326008)(2616005)(1076003)(75432002)(2906002)(66556008)(86362001)(83380400001)(6916009)(52116002)(186003)(6506007)(16526019)(498600001)(36756003)(54906003)(66946007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rPnQZWa5Clc9xDuWbng1J39xw09hX0Lw/loG6+qpc2WE3axj/i2VDVMNP99i?=
 =?us-ascii?Q?EgrdTOeC/9P2dxZQ3TXZrw9lbP1z8FeRLWYEl29hdf80xlBb1gEQNKJjvc9b?=
 =?us-ascii?Q?SoRmQe8Pwd2gT+1yvmYC4BOES+7IH8Q8YgwQCTVdmokXZu6sD8j3XEYmTgY5?=
 =?us-ascii?Q?lf7XCLonGFA9Z5YZNfrZw00iLZEiULDr1d7OBiAm+EqzxPLQllAGLr1EoGwT?=
 =?us-ascii?Q?d/R0vkuUwtMm/qmFbIRxAKVbBbcEEbdwa70yMZXGs2HScASKUNvZ2pl0Yp6/?=
 =?us-ascii?Q?p5masdxvsqwjxzqpM7ZDswZbRAGuNg65YiW83UWmPQ6bUMgcUAgCC4Cutylv?=
 =?us-ascii?Q?EM9Y3O9g45ksF5/Xw8q82MPddW1oSbdLdkY/3nspIU0GzXUIwiSiwPNJuLIX?=
 =?us-ascii?Q?myy3ehoK4us2UOQcseQvXBqmuZILOSMuJPjRtiQQBuDgNLjY/V9+O5tRkqwa?=
 =?us-ascii?Q?r6Pn+8YJrCLUE6c7B/lRco/fdCB6E1P2xFzfeWOMWsLlCkcmBfjavGrnOS9q?=
 =?us-ascii?Q?SSYY8OdtipWoQ3bSnus5LkWoHx2B/dD/oj2W43A88IHkyOzkpCZty1b1WIPL?=
 =?us-ascii?Q?ryWM3pt7Yp73MlJPiBwQeiDIzB8kH9Mh9g4LKds9ga015PTLYIKwwiq9l431?=
 =?us-ascii?Q?GsXUK9rfsV1hLbHsFi7wH2twsJXdyt60hviz8qUAqUfnRp6ki0fz7GENa70O?=
 =?us-ascii?Q?PrFBnSuZyqn3lkoBxzW337UDr8QgDTn5bONfV5U7hSvxyK4OJlFFnt/FK3iQ?=
 =?us-ascii?Q?hyzoMFy5xlvdJEqSMAybbOEzaxy5SyLkd4sDceLUoTY3AcuKPmYwrXnZ83Am?=
 =?us-ascii?Q?HqBD7UJUspK9sgu9rumwRUH/AcYxw9l7gZ0l3v7DWpUpnqwlCPO5dWCRX2to?=
 =?us-ascii?Q?6j/Y7wv0gAmz9L6EQvh+n0/5UaBfdJjRjzEFcNde2mRf+ulP15nYXyyjXLUF?=
 =?us-ascii?Q?K9mfW+KZq2Ze18zPV5HGCkYwrq91vZ3ok1i2FdKeGKsuikVm1+MHDypg0OCK?=
 =?us-ascii?Q?CZgd?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8803ede8-8455-411f-324f-08d8bd69f457
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:36:45.4158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDXK+azJ+HTTE+EiXaKzCxvGzaa4ycRnSaxT23QYap1P5Uqu81BeSWX+ZHrzURs0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5530
Received-SPF: pass client-ip=40.107.243.125; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is useful for building reproducers. Instead checking the code or
the QEMU_FUZZ_ARGS, the arguments are at the top of the crash log.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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


