Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943732FD790
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:58:15 +0100 (CET)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HkE-00061j-MB
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HY2-0001W6-Em
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:38 -0500
Received: from mail-bn8nam12on2129.outbound.protection.outlook.com
 ([40.107.237.129]:51169 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HXv-0003o3-7a
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJwendLGgKp+KrzZuu6Hl3sEmFPlMxb+qS+pFGCJJjFIDVEe5WtDA1jf3Nay9kNdLuUwjsRLnORADwndmQ7l21/Nb7nzvVVlltta3A7q+VVe8cw/OSiTxlqdf96sz241fWgg2btdtRnMg8dzciGvRzouCVZTfh0tGTGIGeuF8Kq6Ho2eZf0q6Fk7Uof+BAV/iqYzt1Kb6+XmaZjd0d1zuUcvqhQz74N5I8MqWerq2PGZZpi0koYiXFW6koH0gwvYQ0W07gn9Auawzjin4GUPES9mpL806Bli8WKkHNN/vQNGajuSCu3kLaVL1hYMQ3Oi0+I2EsW8pE7Fg2FsbQTq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLy9WKWcmh244PrZT1+eMURUT6rfHcabjnR2Och+ikA=;
 b=m43CQgKeSGFX6c9unRin8N1+Fpko/4uZCj5dKpHPwLOFyTWwmBkyNQS9L7IOX1/OntPKxeZ3J9tkVOI0Pv387tHX8z6fz4FGukRIDPeIH472xh2uulkT8Y5hgOw76lvsPI8vCCrMP6cDOl0aoB5XGlJa+h6YiaHDpWqkzaVsuZEcVm4UCAo2Pqvkwu/Xv4UUR48lv6RBoVQ4Rv4LNy69weLvUvLvuMEhGUHEXPWkFQwd4lpj8SJhpKNxrWKiqoUd+yg02Jr1Fo8EBwtlhz262oXT7WSFpjzYrhcnNQfPmMOZVsHSD65EvvtXocKV5/1JLkfgnxM/Xv+OvsWf44DzUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLy9WKWcmh244PrZT1+eMURUT6rfHcabjnR2Och+ikA=;
 b=hfQvREJabTHkwodwRPFop+D6X8ISUGO5pX5jA0CDK4hXd5KwIdI5IYu3AmIYion/5dgT10JfBjZX9x5aqkdNWTZWdMBYMfl29kTyNuKNPLfjBg7iZSseSEzaVDHQv5hdqW2OYPINJWrvcmeP7jduMrelWw25UpPY53QJv+YOo5U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5835.namprd03.prod.outlook.com (2603:10b6:806:113::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 17:45:13 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:45:13 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] fuzz: log the arguments used to initialize QEMU
Date: Wed, 20 Jan 2021 12:44:53 -0500
Message-Id: <20210120174456.275312-5-alxndr@bu.edu>
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
 15.20.3805.5 via Frontend Transport; Wed, 20 Jan 2021 17:45:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87144543-00db-44bc-249b-08d8bd6b2347
X-MS-TrafficTypeDiagnostic: SA2PR03MB5835:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5835835E32C60F761414D3D4BAA29@SA2PR03MB5835.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ywvKcWlvxREebfh4IiSq1cT5jMkLGoPo3O3tdEJli3/hvpZFwzHDLOKMgXpkRUJIaOC5qs1N8miFOfZdvEgA5yTtReJJkZ93iqbSqBDhpVJRqB3RUdmUu1i6BS7E95l/PectEvbHMA2juv7DeTgrVWIogDl+1v86apj1v47zqA+wYki02SJX+cMahk3MO4S+Kuzub5ktaSvyytPI6BMCqvSPtMQHWJK9JkfYLgxuJXzvl4WidSPXN0SL5OJ/QdAZwSHuIj1Dp6DiQWcHGrCoBa4jJoLy/a/NwX2tbv91EfyejVvlfO3COpfOWhwWmvjVw/ifHJE7tvWqtjEERBwzX6rVyKBLG96ZkpaEkjFV/MlTCu28ITd46Ca5Axxgnd7/N1HED4mC7fcYfjANsexpasp1neiBQZkdhr5Marz6ufZkiMXgYBN4wEfteuZRXo0Tgc/ifvhV5vw4d3agm66uGhAt0Cpw3g2GRP/GjfxuFN04n/RE+T9hDH2pQMX9hA7sJe7l0rHtLoxd+keEWfaPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(8676002)(52116002)(4326008)(2616005)(6512007)(6666004)(956004)(54906003)(75432002)(83380400001)(6486002)(5660300002)(16526019)(186003)(1076003)(6506007)(26005)(8936002)(478600001)(6916009)(316002)(786003)(66946007)(66556008)(66476007)(36756003)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WguULCvorpZxbp0VC1pN27iYjHjrJ4NlNEoCJZ+IlUBRYQKwI9czskXaDOH4?=
 =?us-ascii?Q?3uK3IABWmA18V1yAuo6cbQ9Ea0KvaBbmdYePtgWS/o8vYhg4MlPt1se8hu9w?=
 =?us-ascii?Q?GQhKhkPO63YF1PRgZOkiZtgr9RmOVRT7hQT+o0Fi7F3P7k/RYe2VBxg0UxVB?=
 =?us-ascii?Q?YUaALGyDTbK0KkQ6wE4ZV7iRh8TRbpDzAJ6ZmvyaVsJKCGW+2foJQ0rVw5Lp?=
 =?us-ascii?Q?KzG/9cBpOaGS7j9SVuuaEyxWloH1/ebnrj5sdR3qPYcwgprRIkOE8wLNMi9f?=
 =?us-ascii?Q?B1pp5KvT0Nvhx/PnbSAWsLdC9+Ti/X0T3gGewWklsicQk08kKPOkPc8PbXiw?=
 =?us-ascii?Q?E0G1jJNvaH4O+0aGDU72nSBFlrRgYm/kQFAQl+FH7LqZ2oQKxVo/A1nyYN81?=
 =?us-ascii?Q?3/n687VM3/McMeLOlzNbdRYW0NKGkxy0OBft+D7m1Zvptt8OvkEY2ygs31+9?=
 =?us-ascii?Q?JSK3z6fEmWPMdCBNXZZrDPXFVEPrVPyBnuDrOdbDgwcMQu2KGxEksK9vU8hG?=
 =?us-ascii?Q?l6pylf05ijHkbJEqZ0jId8ZcdO3l333NzPryX84UhuRz+wbDkScn27LKMiZn?=
 =?us-ascii?Q?6Du2ncxlF/PP2IbpXSJsfYdcKMb1F6WcV2BH5SuVvIaWqNEZ5lyCHMo7Z8Xk?=
 =?us-ascii?Q?DTeQ0Un6nlMN3jaSAaNOoNzEKQHIjB55rEjRh2vpWOXKEv0/Wn6AUD0q/O70?=
 =?us-ascii?Q?uryI9uHU7xc1ZsUnnypydSBH4JoCVdesEoNwwyPjO+7XUA/KRyIzBgK1EzWB?=
 =?us-ascii?Q?rPN9d3+QO2PMam4Vvx46zOkd1tvXv2UBQu+Y+jJbAb0viPVAYZUDD86Bu3NG?=
 =?us-ascii?Q?Tc3dJoJmUsWpMCF+N5K87p0/QI3jx4ffJ3+nhDDrfZfDSm/PRTo6Bw5+X+4q?=
 =?us-ascii?Q?PKW7HbWHHpV7iPFDGtb8lOHSGZQYHMgU5CfbWm46ptzUDa9hNmYyIkKnnXkQ?=
 =?us-ascii?Q?gejDH8qWghzooTCFA2I8n+PXSD0oIO+/Ptu+XH20oRt4i323yhwJKNF+AvBu?=
 =?us-ascii?Q?Hkp5?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 87144543-00db-44bc-249b-08d8bd6b2347
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:45:13.0876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNcImdQy92ouGzLKd9rRX4htKAy4gvEb7k+12+el9tygJ+jw03QUaiKpN4zPD0G7
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


