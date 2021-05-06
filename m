Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B906A375148
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:09:42 +0200 (CEST)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lea0r-0004ou-Q6
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZyO-0002Ym-Bg; Thu, 06 May 2021 05:07:10 -0400
Received: from mail-eopbgr60093.outbound.protection.outlook.com
 ([40.107.6.93]:50670 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZyL-0002tO-7k; Thu, 06 May 2021 05:07:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIOnwzfbnZdbGubk6hktPb2UqtNWymx4L4aV7+cddqDlU4+XWHguRmMGubiWuHyUeCnMHmIsF2Wh1ZLvspko3y6YnmbeJbliKPicmGgcsKqImBmgYn0128TzkBI1AXOhDpwU9ouzDp25wiBJLrJUV6f0MAe4s6wUxpx6Nn1QMQo9oOnCdMUKFbTh5gSkMBA9QdEMtfUeXfcdoIVeVnXM20ABn0+PMxxwsZV3c2Z6XbXBu9cUShwH0pj3KEGr5eP1Ebw5+pvJ0raHIMuFoje7LzwVswa1RqjNsMARpGBD16OeIViR4UgfsmEIUQYuS+L83eXzLrh2ReZZB+KqRVugog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQpTMrlJpXfNGPXl/8hXhgnKwhByqoTByrokQat5ef0=;
 b=Y4wga2byI6UY1jKn/8vaINPgAGvwK6Yq/fVIw2b3qvdzi4v2gmhA8A1FcbygquaEGJdZsTOUtlpNP4ORFp0HVQ0RMxBAwai0Jgwv7Zdt0GIfkZrtQ3NBO+QizP7/S7x66Pvsq4Jy5wnV4oNjLsO+iNmIEja8Ref0eeRirjUZkjK5rrgWtThmkEuOTEhfh6Mi233jNe/wPGB2GLAJ4i1moBVIMiw9pd9JVNUXgujY8C7w24DJsT6+8B6wOHXGkyhmH9syJwprQpcnXKuwcCXUpv4/2+rkpfXwM3jdWjUO4sjLx2SOgFrFNJmP4+cb1xlYNb6BRHwgxIOZmcKX+X5PZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQpTMrlJpXfNGPXl/8hXhgnKwhByqoTByrokQat5ef0=;
 b=QxgzdaIHw9+f+UXCJmS6N8gxnBVM6Vd9laqfWyCWFB7LhOZkyAtL3/WAIPbssX1ko0lkCb8b74auImxLAT40uIRwM16dOiKfDpM8wyTkQwmGn4RBBXWMIMmNjRRm/5BycQHW45+hEFZ8Bwya4hIze7ep85J9WxRZbPriUAAmyHA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4166.eurprd08.prod.outlook.com (2603:10a6:20b:a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 09:06:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 09:06:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v3 7/8] test-write-threshold: drop extra TestStruct structure
Date: Thu,  6 May 2021 12:06:20 +0300
Message-Id: <20210506090621.11848-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210506090621.11848-1-vsementsov@virtuozzo.com>
References: <20210506090621.11848-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 09:06:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 933fd35a-56f8-431c-ecdb-08d9106e469e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4166B18A7F65FEBD10EB727CC1589@AM6PR08MB4166.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k64WIZAHaTQve9OEgZMPOv+cvkTcJtpka2VeHvSS3dFUVVF8dsCU//qu6y3fXqWSl3W1h8K+5OJwB1qHb0AjYnR1LR7iUFOTccC0hD0DT84j40Yr6sXH2w+qSaGxT0cHgGKTXxgIGNNfrjHs0TKQu6A/on3jfIH3Oi3Eh+VTzs2BwNEF9OyxoPI37ws5mpsURhTtloCYwheCDpeb7TO7aYqvN/ecGJho+DHvjbI834PkbCFaJrlHF9PUv1L2RAUxTOCwrRFReOzWVevP18TapkvzucUniRnZqXNZjMQu7PX4m6e/ZPi0U1HVEhgMVFPu2ydeK90PKBWYUgxsWHqBR3JKY1be6QFTpxSkqSKEwril/zzTr50fLVFEUavMIQWTiXoL8oqfWj0os7tpkZiB4c1jObKtE10b00C2bBNC1HHYhsRznwkd+dWMcmhFtOgHxBzK6f1ORtGJfWlrYj+7MjC6+ZCabC/X9MybxxDQmJonawh7YJjdilx7BV5lsK4v9wZxbzYqmlvSAdvp46ocDrBKEPe5w2qSXJPmJNHqRJbDOa6wxsgukuhSAJSHlHwL8f7h1vc32nf5TZJWQ664+Q2uSMNq7T/UfnpyAhjTZT//28T+jWUHzCOZGPGeLg/7mvKx/2vX3POhMRBRQ9w7XXhrvMx/gmNB3ZlvXvN+LY7w9gMemPt1i/CLGbl6wxNV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(366004)(376002)(136003)(86362001)(66556008)(6512007)(8936002)(66476007)(66946007)(316002)(6666004)(8676002)(36756003)(6486002)(1076003)(52116002)(4326008)(478600001)(2906002)(956004)(186003)(83380400001)(6916009)(6506007)(38350700002)(2616005)(38100700002)(26005)(16526019)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?L7lD3ndxvMaSNtHvurYkVa3hVztqTZU08DB6dhCOPuxz8zNK9dBEIKd45hVA?=
 =?us-ascii?Q?Sp6zp/f3K1+QJaSkYpVkB1MTaJgQsaztYY40I57FtUBqAs0MQ1h1NVCG+5/7?=
 =?us-ascii?Q?l4NXyC5tZ32cm17gq0btDKV29lJUWFNtkow6tlerJAkJOpcnMLQ2OBbgTPKt?=
 =?us-ascii?Q?awq+KYl5IVbxdAFo7XQkZbV8c0Z9aqrAVHhw1scGE22ctIj9jIPwsiRKioCZ?=
 =?us-ascii?Q?xwExjuNcfe1DhsVURSEoHVeb8hQh+dL9u5PWGgEAFJobLzGN4I5aZLxMQ3So?=
 =?us-ascii?Q?glRRoTCcEcVeFiasiEynUmufKslF19xIUSDYFOQeNfUuw9xVKpG01csCgpEU?=
 =?us-ascii?Q?4XZvqXZCi2vABwA86hnt6OGNuRp0vqY5cuZK0qzk3Pr7HH/DFNAU1Whi10P6?=
 =?us-ascii?Q?rXokDXag9R/sh0cjuvpO1f53rQxAXP1x4f/KL7W9fiJYhGxDtcts9oyVilzP?=
 =?us-ascii?Q?jxdYhom+FwDjiovFX8L7e/3/e8m7Omm5xYeHE9g60eokEfoSW+OzDcXNK4S/?=
 =?us-ascii?Q?9+kfeoixa9nr84S8ceOmUWFUJLO0a/+J+nkAzMgsintiDqNdtsWlfA1aFCE5?=
 =?us-ascii?Q?eNojnjzlCzxY00Hnyu6+sN50XBIRwnKFT1EG3hEa5H7V/RZH66qaB016nZDT?=
 =?us-ascii?Q?cRGhokNu/tbJI9smwP+AtXPnNdy8IsIEGhwSjPtD8ZF+5Ane40Ax/XTdmUCE?=
 =?us-ascii?Q?usu0vZckIyAF3izCJal//KnWVFfSjQPE9BAXvhnSvZ1i6qkCJTpFbjeTznLP?=
 =?us-ascii?Q?uIj3BnDA+jbLAhFheZFMSD28sJeo7FM1JjqvrwTcpEsSNxlozsZIq+pz0QYF?=
 =?us-ascii?Q?DwSKrQUlJEKC88lHcjoE4SbTLIkYPg+9nBVpsbe1uPOOqX77aqLR18GWKPhe?=
 =?us-ascii?Q?YHEhuW52ZTnZfthRam0qrihQAajGTvtPRo5g7QqliZqF8zNdbVwvnjkFZLJn?=
 =?us-ascii?Q?tokh9WAk8zPYkV51Cg4SO4qS+WMuUPl+9ZMCrCl1NRqT3bJJUGg8miIrlLxE?=
 =?us-ascii?Q?wabpDVwnKQvdv+/yCUK9vEBH7aKkBpbquqsuBeM00SI1kz0Fd4t7ofBN9ixz?=
 =?us-ascii?Q?ZbkdHlA5cVB41w11o/lpQXDe43dyRfT1cPhJyMD1aFl9T4Z0M1UIkqE2iknE?=
 =?us-ascii?Q?tcAKZnUImtljI4AXI4TlCHC0fQSfeJWWdUQ2FYuYeYYMx0WmF9hVC8gnVy5i?=
 =?us-ascii?Q?JzIZ662zZlgLcfPcrCSB7Vu3bH1g7gZIZkBBI5YN/Jd8GjLpeR2Dhei2WQS2?=
 =?us-ascii?Q?qSLFZ7qkwX1HlCdbRi88QFOWJfqii1HeUYMShJzaREQcSGoeJSkxXg8kkdZb?=
 =?us-ascii?Q?ButqGomS11MB93XtIXdxgGTx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933fd35a-56f8-431c-ecdb-08d9106e469e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 09:06:46.8466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvRy5xjWPoeSN3Bt8A0taViDmUqpICdkbDbU0iuF7ZNXH+ivdcc1np1hhIxS96GKklGfs0EseOZ1tbF9fDoIf4x/NlMON4tBvAyn+cMeiLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4166
Received-SPF: pass client-ip=40.107.6.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

We don't need this extra logic: it doesn't make code simpler.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/unit/test-write-threshold.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index 9e9986aefc..49b1ef7a20 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -37,26 +37,12 @@ static void test_threshold_trigger(void)
     g_assert_cmpuint(bdrv_write_threshold_get(&bs), ==, 0);
 }
 
-typedef struct TestStruct {
-    const char *name;
-    void (*func)(void);
-} TestStruct;
-
 
 int main(int argc, char **argv)
 {
-    size_t i;
-    TestStruct tests[] = {
-        { "/write-threshold/not-trigger",
-          test_threshold_not_trigger },
-        { "/write-threshold/trigger",
-          test_threshold_trigger },
-        { NULL, NULL }
-    };
-
     g_test_init(&argc, &argv, NULL);
-    for (i = 0; tests[i].name != NULL; i++) {
-        g_test_add_func(tests[i].name, tests[i].func);
-    }
+    g_test_add_func("/write-threshold/not-trigger", test_threshold_not_trigger);
+    g_test_add_func("/write-threshold/trigger", test_threshold_trigger);
+
     return g_test_run();
 }
-- 
2.29.2


