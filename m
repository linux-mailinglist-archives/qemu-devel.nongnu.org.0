Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802902FD730
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:41:33 +0100 (CET)
Received: from localhost ([::1]:54360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HU4-0003K1-I2
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPR-0000Il-0z
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:45 -0500
Received: from mail-dm6nam12on2125.outbound.protection.outlook.com
 ([40.107.243.125]:3041 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPO-0002pJ-1h
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ez2Ou1wXWf/RWIibImrWgbo+wgrdcMaTGMOVT2/AbY9uzFzrJbRsceRi/1U/L5fKoO6V06Fk/YOJvw9ZXF7GU4eaMKHzXrK1I6qX8lLe3KO87khh9wHArrajwBImfuuo9NsL767n+5jtxYntFL3S1tUG5YkXt6bkHMg8bzndZJ+MqO3llNZLrx4FX9DkLL0SBMMFrjQG46cynz3NR6yGvLG1e7PutfcZA91uCw0ZghAIBUY3Rr6eX6jrbp+U/+hGqh9Ooh9jniNEjqtnfcEKQPCx4VWRxoh02QDi7lwEOSQLfA5Pun/UsZL70OMl6RzNgwaMUGRDFZIWYgwWWuW/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLy9WKWcmh244PrZT1+eMURUT6rfHcabjnR2Och+ikA=;
 b=YgJWeHhNPi3R9/wDOLeqrqJVcdqGlDHY4adswPPlfPxKcu+zZFVYbMX2lk1Xw6DGhBHP5ZnxMSHswmLMsueBWNlnpsbhN/m5sONzWPFg8u6MlUrkck0goq1t24RmFwKfqLNNGjeLnpiDn+Yz+9ybkPTkrwv4bg5GK6fApDSYIKM8TR1s5brGPVUJLkHQpJwByxR38QFS/MwqhsJPaHMqp6mOqJowYtkbyqMo+GVNSzBf4E6zTk2Vd1AuiPyGlntH4X94OUwyZ87oiU0XmgEueR6qbEsUld0rAWdzTdDq9GRQrKNOLEnm58wNf9mqqRaOSNIWvbZXUpyM9zYE9EZ3Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLy9WKWcmh244PrZT1+eMURUT6rfHcabjnR2Och+ikA=;
 b=hdROYoDwF/h8KF2yEeiDrFc/ORWTSHoDon/mgIx+lvFx+NzJ+UZJ1dXdfh0+p3j9H7qFKEay0ExqLzyeokdYsXXWuQ2Gd3IKNhxsGtD7Tkv73RWPiAdi4e1/fI9yUV36WTh3hHxvcbR97cXkgvfSce5ehPDW81X0QXGabekakfc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5530.namprd03.prod.outlook.com (2603:10b6:806:b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Wed, 20 Jan
 2021 17:36:36 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:36:35 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] fuzz: log the arguments used to initialize QEMU
Date: Wed, 20 Jan 2021 12:35:25 -0500
Message-Id: <20210120173536.265601-4-alxndr@bu.edu>
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
 Transport; Wed, 20 Jan 2021 17:36:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f8770e4-d7d8-418c-f76f-08d8bd69ee57
X-MS-TrafficTypeDiagnostic: SA0PR03MB5530:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB553041061CED1084C29D2255BAA20@SA0PR03MB5530.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IAdTWhxVRxNTBbTt8fHTcWjyUmPvCCVKw7MsAyd8XDd3EJutt0POVoY/Etz5Eo7JyTOWo4mIEFxx0FwNW9EDr2k1TjJ4Okhx3QvA60ZFw2IsFQcCYCMKUupJMKxgISDuJ0a7p/1o63fKuGMLHKO5KZseqiGVcXF4GUgawDGH93K2/OjPLPL+MRXa0FIBGplvGLunhMXtj38+RZtFCcc85vb0xqEk/UCZpmL+Dhhv0Ui1Ea+oGyrNqWewtwHORgVAkAqTZM+g7DyrX2qTs8rYeb67NoArBmE2zEAaZ1jWIApodkMVvYvwVJ1aIWxmWXEk0oZR0y7rAlsKLRG2w5wFWt57AQTcr7eDW9fCDjphELMLEby+4iNEm7n4KndYEbvSpZDdEK1MZIcOo2tYgxKFxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(8936002)(6512007)(66476007)(6486002)(8676002)(956004)(5660300002)(4326008)(2616005)(1076003)(75432002)(2906002)(66556008)(86362001)(83380400001)(6916009)(52116002)(186003)(6506007)(16526019)(498600001)(36756003)(54906003)(66946007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OOCDNRL1KrJTivknHUq40OsctJsqfSxrey8i3Kg7wj0NrtTFK5v0FV1ZQP34?=
 =?us-ascii?Q?p4pGvunPnzQQPWfT6HDIhZU86At9A9UoKCaUUt9TYdoeXZakh17gnZ7lKkH7?=
 =?us-ascii?Q?lQbPkQ64CVLdTV4rYWwCQlHQfsOEKyD0TlytuaudkULZB0UgmFK0w5TUQ+4o?=
 =?us-ascii?Q?xAa7mHTl3ogFOdF6ucdUbJvSbrqxGCXHEOja/MRGNp8U6W3xzoFo1BAwq8v+?=
 =?us-ascii?Q?/nAE0wDemBbf1u3pvFeJnJcSOcebuxExGT7XIHVhzvepL8VcdodwJ8DN2i5E?=
 =?us-ascii?Q?dDGrgVwkSsd+xHnTQRSzpKKUIw/ObxJ/G4rEL4ZWeERKvHQbdZ2gXOY/Him0?=
 =?us-ascii?Q?20gv1RIMuqkauG8InSSKbsmtX3nlf6o6vk3e/D2TX5p0sOwYpXXOYgioPtS7?=
 =?us-ascii?Q?qA7f9fr4swGnQPPXn5YaFfnds31JFypaz+anz4L+BnNyS9U2JnbckMjokqKc?=
 =?us-ascii?Q?ONWy89/TPVwM5KfwInwnA2zmedVyqEzRSJmxIipnpzlxW1Uyn5NxhzbeOTM4?=
 =?us-ascii?Q?xgb3OfdgfXnZpWTKV1Y9kfWn/GEsundKoD28/8+vfLYh/YSDTOebnd7ZqMAQ?=
 =?us-ascii?Q?zlzetP3j/oIH8BLFIzaOoB2cE1+7E16YH4OzQWMP+53l5Hsty+TjDxwB0GFH?=
 =?us-ascii?Q?WTuCgaiAWjyzxRFi8ksOpkXz+D6zAc8gnxaV/NRBl8rPrr0G2gs9+pqmXf8p?=
 =?us-ascii?Q?Edikeynmef8kDC1F4NZrN6EdaBxnKOWdsLtJV4goT3A7VmcDBdfYrjeJ4ikz?=
 =?us-ascii?Q?PmaeHgtIAwE2iIrOMms2kXK/UtO1psqUzCotW/nvWVTTmmp9UPWBqvCacoNR?=
 =?us-ascii?Q?i1bXx1x93Hw8Pbin3vDTUJ2GKwe5QHQaQrdJntttoQgs8YnyRiLa7jkiyx/P?=
 =?us-ascii?Q?XlXTXp8d/fZu9Ojg0xhr7aE33M6HmrUGcCjOgnMMh+spImRpgGrDpRg5NV5B?=
 =?us-ascii?Q?fFhYLb6qVzwA2sbV62usPDbGlQ1mSi7VLpyHNLkBcAcrF5N9rfvfKJ4SIWtL?=
 =?us-ascii?Q?PYyl?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8770e4-d7d8-418c-f76f-08d8bd69ee57
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:36:34.6919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7FDOiBWpQsLQurwxQ0C4ZSo7/YTUpT+q4lfsH3CePSAUVZj2sbVUNlkF44ZMVgv
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


