Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9962FD7B0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 19:04:19 +0100 (CET)
Received: from localhost ([::1]:53126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Hq6-0001ux-JR
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 13:04:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HY8-0001Xs-Pl
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:45 -0500
Received: from mail-bn8nam12on2129.outbound.protection.outlook.com
 ([40.107.237.129]:51169 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HY3-0003o3-2R
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ty0KwBsLXIJujRHhFS/G8daQeTz8n2U3yJFjZ7pqbe7KuWUuivqpjzPutGYw+p/7HsRfRMkbQao6ZGZR0h+QTYHkonvSwbau3nctDlyLjSemD0yW5RmtihJlVrPO1BR1una4Rs1vQwboJ2VIqWdqgAyhCRfjLPKGjRG45kjaIdCw6pJULTMTVhmzdcy7g2oOoDM9SM1knE+iZb5z2kIJzSBh0c+6gDDkNFC9xXmyRw9GI9VILFk6jE5uRYtEuYD12MwOtJkKLJ2R5O/aHirAgCSnr2pIpp2mOGx+aLZuem2WICrPmNStSa+FkKLZBa95EqewiUxfuSguyIfAqYM/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVgYJkhSqwv4Miwh4NFlVzR1B03y1tpvL4eVBWO8GA0=;
 b=V68bO3W8SmdaMGLaLPf6Ghch9F0CSBFl0n4sCoCVOPYhlM0T7znfSER31GJgGZq+28IDPCJCfLWOaum4fF47L6B9GffaWWnGXVbaWVDfL0n+WfrlgERnwBMn6xg4LA4CsFU2VnUmZIWIyMsSGFvtRenb1S7xBImLK+wmACBQolDit7E0kpjVTuAoTgaAxRGRjjfQf9JYBny6rl0awMGB9SOQEaJfNxhrKxGkOuaO9wjCEvS1NLqXxi4gRJ07xBrEJj4qxwNYgaY2UT1/OX4EDBV6X934XSaahrVQSPZviGLE5fcx0yr8Wcevs8y1nT491+KlmIJ7E65tCm1t4erSAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVgYJkhSqwv4Miwh4NFlVzR1B03y1tpvL4eVBWO8GA0=;
 b=1M2r9pxerufrDZxtdiHnryu06QLC7RoMvEUKU+ZpSBfk923v2UL4Xv0PPwsQLPLT5tcMqnlZP70x761SdlMsj8rkUIXXaPAkR2DVXW3SXlFqhuQDFBdgk2bAPjyxh0Y3Abh+kAXsZqXxx5nTH8Gk8BpQATvhd7ovX0HU3ilPEu8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5835.namprd03.prod.outlook.com (2603:10b6:806:113::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 17:45:17 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:45:17 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] fuzz: enable dynamic args for generic-fuzz configs
Date: Wed, 20 Jan 2021 12:44:54 -0500
Message-Id: <20210120174456.275312-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120174456.275312-1-alxndr@bu.edu>
References: <20210120174456.275312-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:91::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.5 via Frontend Transport; Wed, 20 Jan 2021 17:45:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dad3c66-add6-440b-e688-08d8bd6b2444
X-MS-TrafficTypeDiagnostic: SA2PR03MB5835:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5835D8EBB634E548961DA0ECBAA29@SA2PR03MB5835.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t57Xq+eLJLSZ/OWH89KqhsODqmx5u9/fAbm89J+GZMRYZMtYLn8DB5T4QJciBq+Zu9Q+gvQ4xr0E1Y9bi/tILRDT6ikqdPtGFWgSw3Svl2UvmYP02HT/O85HH6z/J2L8KoFBOp/XlHLXacwYwJdh2pUrL/Go27jLPANfaSgwWFpZSXCzdkBTDcBh+NAuAJySYiCNAVvU3fnXjvSfGPe9RG1E1i3vdcS2/rhH7BkOB2UB7KIRI/sppun1FLcy10hycGzGel0DFCKOlZv7kLkN9VLBHHokhCb4apckLYxFOBiZX5OidJOWT3KJjQQ1KRqPQGH22fZ6E6yIUzg0DX83Olr7rCyuw12VRUKi0NHdd+v838MYYeC1d/kXf+Z/lFxTEKDKH9HFmllP8cwhjU7LrE6g2fmFeU2ANV+szXlLQI1Ql4onf0ieajXT+OsqtJWJWseP6q+7M1ieDEScW9BkPgyLGFCgdEDA1ew5oYNqWq4fiY5nMCeVKnN2zNkOD6n3/n5BsnkoeCNC0rWIx7CpUnXr+XX9u4tiYSOPBClebFYHrT9BGfqnjhX3Y5kQgpEC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(8676002)(52116002)(4326008)(2616005)(6512007)(6666004)(956004)(54906003)(75432002)(83380400001)(6486002)(5660300002)(16526019)(186003)(1076003)(6506007)(26005)(8936002)(478600001)(6916009)(316002)(786003)(66946007)(66556008)(66476007)(36756003)(86362001)(2906002)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?H4zeOEQB7C90ygFu97vI8x90TYYyo/1HG9951iqvt681DBFQ/A+ZDgMKrqb5?=
 =?us-ascii?Q?GmjeiGoaO/jCFxt4xVFQ/YP3/HH4alfkFJCBaVrb0HYPr/A/v7IWWQpgNB0n?=
 =?us-ascii?Q?+QosyGM8oPmlEp+CfuWNkvm1OH8Z3fZJxNE2COIhGLRL16F6r/J/wD2uAMNe?=
 =?us-ascii?Q?dK18ulXFjJzaYaiwYFz3Pu0C6ZxHklWmdT2LrRFzXMcP1SDIrM7sHhcUeuTK?=
 =?us-ascii?Q?i0aLG5RDwP5QEZj2cLyDn8qwZYgTy25pZhFTeMYLuihTIvAjnWbx7CLhKtSc?=
 =?us-ascii?Q?NJQ0v/c83RgzXCCWek5g68kLvKxDAUaSWRlShqAXBNl4mUbjmtxVa2kaCxB5?=
 =?us-ascii?Q?oAx/zFK2TlfEnS3zQ1B3ZzSnN2R/ictw+4sKPCC+glWInMeTXq0RAmj/gXs3?=
 =?us-ascii?Q?g8csi7tOAFvekqf+6PZ587vaGtPlqadRkrBrAxWkGkqHYI3vWx+HHzCpB1Cr?=
 =?us-ascii?Q?0Pn9P1LcNyuNpWLnntTP2IsYyKTZYneG5SU3RJVS8byILQ40EWKrWMF0TJOO?=
 =?us-ascii?Q?ckqI2z7xpcBfY/lQB5HPbp4yyFxyveKNLGpPeLNHVs//E1MQ6Td1+JocLDv7?=
 =?us-ascii?Q?PXkrCc9TJf4KXc13vmbifF4AiJ61OS1W1gKP7CBYGvwAqbRKdlo/h2YuiBwV?=
 =?us-ascii?Q?YVHWxOumzEgzuR2vS8NhzIumlHHr7DKNHirDRwzWwmUgYoQDehzQn9NRs+Zs?=
 =?us-ascii?Q?ip0W5Z8ECU62GvNLcSVJ8IOIiPzhN6w2Ro6cqF8OUg0/ZDTZDQtcaj55UXIR?=
 =?us-ascii?Q?NZI0rVZDtGjochAuislMkw/6ZXvjHhohiMkLwzi3q8V7XKeeJeRELfAuzwCS?=
 =?us-ascii?Q?QOZOKrAGJiUBobb4k8f52BwupXPWdkc6JYCoR1BqYnF4Jn3R+rCHpltNYG76?=
 =?us-ascii?Q?2s7t17AzMYQ6jfErdVO0YmhAoDGI+OrFAUXRfzSJXcBcSTkUANdJ3lxKJ9x5?=
 =?us-ascii?Q?a5gV/4QHHeWvAlzfCbuYxkADeGEHbUh8dZxKc44nrvuxuwCp76eRm+efeHCE?=
 =?us-ascii?Q?3rF4?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dad3c66-add6-440b-e688-08d8bd6b2444
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:45:15.3733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9mFoHOMkfoioK2454W+eRy2cggRyEdf8b2a9tQFBMB3Wt+SzAnvz0PFE3YgcYq/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5835
Received-SPF: pass client-ip=40.107.237.129; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some device configurations, it is useful to configure some
resources, and adjust QEMU arguments at runtime, prior to fuzzing. This
patch adds an "argfunc" to generic the generic_fuzz_config. When
specified, it is responsible for configuring the resources and returning
a string containing the corresponding QEMU arguments. This can be useful
for targets that rely on e.g.:
 * a temporary qcow2 image
 * a temporary directory
 * an unused TCP port used to bind the VNC server

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c         | 10 +++++++++-
 tests/qtest/fuzz/generic_fuzz_configs.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index deb74f15be..ee8c17a04c 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -933,12 +933,20 @@ static GString *generic_fuzz_cmdline(FuzzTarget *t)
 
 static GString *generic_fuzz_predefined_config_cmdline(FuzzTarget *t)
 {
+    gchar *args;
     const generic_fuzz_config *config;
     g_assert(t->opaque);
 
     config = t->opaque;
     setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
-    setenv("QEMU_FUZZ_ARGS", config->args, 1);
+    if (config->argfunc) {
+        args = config->argfunc();
+        setenv("QEMU_FUZZ_ARGS", args, 1);
+        g_free(args);
+    } else {
+        g_assert_nonnull(config->args);
+        setenv("QEMU_FUZZ_ARGS", config->args, 1);
+    }
     setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
     return generic_fuzz_cmdline(t);
 }
diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index aa4c03f1ae..51e69c6e42 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -16,6 +16,7 @@
 
 typedef struct generic_fuzz_config {
     const char *name, *args, *objects;
+    gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
 } generic_fuzz_config;
 
 const generic_fuzz_config predefined_configs[] = {
-- 
2.28.0


