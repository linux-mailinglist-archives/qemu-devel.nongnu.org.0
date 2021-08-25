Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654673F75F2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:35:33 +0200 (CEST)
Received: from localhost ([::1]:41254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIt40-0001d9-EZ
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2W-0007IR-NK
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:00 -0400
Received: from mail-dm6nam10on2122.outbound.protection.outlook.com
 ([40.107.93.122]:65035 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2S-0005W2-CK
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFDxHcM3q8SKUNlhPX3zaI3qEPG2X2nVAH59cvHl/LyM/+VNE/mjtCYxNuheZWeiTRdGFOp47NS/QJbcrVd449aOvxKIhnd3TK+vVaWsrL1dDF+hWBPEVFcwNPQMsWOt2RG89NyMHTZOTjH6Q5SHdFGGGhwDngg3LzeFA54lUd9vsVFBXqFnkimn/klBXBKliNYdHZH2cJDT68IR7AjTvICuVWToGuQBqq6Q7zBPOiSv0sgbn/gQvPVQcq/+vFdGGZ8PpLnN+ITLQZMy+QptyWU2bDcRrIu8458prMo2AS900dBBZ9HKfOiKi/3nT39wLZPsghFbSyf0Cp9wiQnLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmPJ+fD4N3a/Adp1pQJyGkU/mGVHfc5J0H8LriDEbPI=;
 b=bacgQdIvTGqODsXNpxDaNjkbI8i0gNXxmv7p+VgYtCHjQBujiMXFoX6hN1unybcHu+SS0lypQQE7dmzn0V7Fgps0XThI50uK6se+jhDeVquxaZrupnsG5aljNvdmPDHSPX8bVwWu7LmTghfLBCi8fUu5Xd12JzRRPWqRP/ekFIlMJJGCCObsxPcDXx3eG43psgPnn1sb022G5kowbIOiZhGEJpNeP2j8bkMLelcRSZH4TSTFDyiaTywymepB9CPdfxGxAx0H4oM+sHlJDShU4hLepceHwLgFrHDdOeD17fGxyVIJ1FqMOHHEhXkjh/r1rlNPtmi0aO2WQmynr3tEeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmPJ+fD4N3a/Adp1pQJyGkU/mGVHfc5J0H8LriDEbPI=;
 b=1Yu+NWJkj4R9RjbagsN8sK/6tcOt0/WibhYBm35Vf/pev0QYdl2xH3TIVIT9vXFpiZ5AedMe5amC868BJLoAsAWeHANXeykw50iXaVkWTs4kT7XWrnnS/Hz0aRlkqI1kZDa/fhQwuFEfbrudBcV/qTa+SnVqMew4+nKSClYStLk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4447.namprd03.prod.outlook.com (2603:10b6:805:ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 13:33:48 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:33:48 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 2/8] fuzz: adjust timeout to allow for longer inputs
Date: Wed, 25 Aug 2021 09:33:26 -0400
Message-Id: <20210825133332.44378-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825133332.44378-1-alxndr@bu.edu>
References: <20210825133332.44378-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:208:329::30) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BLAPR03CA0085.namprd03.prod.outlook.com (2603:10b6:208:329::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 13:33:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 686ea47a-3770-4d57-1629-08d967ccf7e9
X-MS-TrafficTypeDiagnostic: SN6PR03MB4447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4447D32494E2F8D2325B73FEBAC69@SN6PR03MB4447.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zq3C6J786UG4vgkskqjgjSSzxZHyBcskR1l9i64WPbsmMuCp0mjroUC+OaDjceVeDpt7rYTlNTi9f5Zng1xGaKbjGrt0V5oHtvTfGnVyGVgY5R0RwEWJMt/Bk0HG/D1lAmGxH6iNhhxw6SOxktz3kaQQ98emQIAxrTyjGl08pB7RJdB3dPdn06PNUAO7lcSKPUbwe2N/o5pLYph6C3jcgNe4qiB7hXO7PBLgdxgv00TwxbbxOR1fcGFlE5g8kCaj1Ok8B7gwqgf6DimrZqNorlBjEiNvTg5SsZ1L4JlM/VpRByuBkdRS+UzuBPs7u+j6mAm0weeblYZKRFNXnflNJ9G3gQVbFjsVWOB/gLAEbUrCMjas0prtajFe4BcZWKPiMMRf4sojWMNMG11PaNS0/1YwWaVrOuyYlv0ILZEjRPr7mdMGPOVg2qiAp9m5Hz46OT1jEISYfLtv42OVHeawfqh/FG+YzkdnYNvWbZJblJq1tyDLAS8geEXan98m9ZAax9junKTMtJiDqRJMNAjFREHZudhACgxyBLnk2H6MoYlQMMQdNsSU3G3wc2DV4ie0aG8MuRm4vF6g0BWZNAtDqn4kD+fi3hB2mjYTn2WofyfikdyHRDzQ0s75A3hOOy0UPjRoTnFPZd8n9nIp495yUV7IyTZF1nRGGB0KcgWhEiuc92QM302oNTiZD9xngVGj87dtbjiuiP0K8vq0cenOxa0uxvIjOPavSeGBp1owKVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(83380400001)(75432002)(186003)(1076003)(86362001)(478600001)(8936002)(36756003)(6916009)(52116002)(4326008)(6512007)(6666004)(26005)(6486002)(38100700002)(54906003)(66556008)(38350700002)(5660300002)(2906002)(66476007)(316002)(786003)(2616005)(956004)(8676002)(6506007)(66946007)(148743002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LiWx3dyrtvHmOB9xE2ehuv+TQNEo7ni5oVNzk4HfjpRYI2ZQ8rfL62qv4w6G?=
 =?us-ascii?Q?9c0Thx6Isss59CzvQd6HA3+/nRi5Tt9tP0pnlhh72Cg6m8Tpdtb9DoAufDJj?=
 =?us-ascii?Q?/UzT9+ZwVQg8n1Xe4l7y/jGFQwp4zbjBs0nIARIfCZQByIoIHl8QSIcs7Tf7?=
 =?us-ascii?Q?5M5t/WyPrkg9SywnvEajKn9ITDGLVEnye4CrO0gSDfG4WJBtnGPh3F80G1rs?=
 =?us-ascii?Q?IVEdqgaqvALDzwN790iOhiGTR2vVG9mSf2yxqQftoqZ2jM9PjmPQR35agJIf?=
 =?us-ascii?Q?uDYccgF8dEzBei3v9jo5TxdjNUDjJnAD2oRLreVBrLuBLVh4vmUvvWOrd+eN?=
 =?us-ascii?Q?NtZmFnFodnu3wRrPvoTNBnwSUwxFYLQ4QJkEOZ+q+Lo8vnB9+V3tYwi0KLlu?=
 =?us-ascii?Q?nxLKbeR8hjJY84fSCSRpbhEv5iT0EQUI6K85CUNZgGeYjffCiDFxBVGf7c6r?=
 =?us-ascii?Q?U6vMH4dhOpQsYRT281r+NEKWaeqQQCO6Gen33dYjKvUVpGxEoFCgMJGSNgiY?=
 =?us-ascii?Q?O7JAs83KG/xUPRAZNzPLcB1wRb7kaA3hbs/+7OUyhci84dXItoFlNSGUrW8J?=
 =?us-ascii?Q?vkB2juymTnGTTTzV1hZFVRMBj5ORWCY+g2AF4i0/spmK1AT3Zktj0TAekjIm?=
 =?us-ascii?Q?ibrymYY+3MiQhTqiNuH76bSRZIVNKcJiUXz8LpAFM3SywnqS8UAGPZyg/J+z?=
 =?us-ascii?Q?TZAl4MdwxcJrujsP7tBjVAKD7oggUragsyzSbdk7sjFRcw46RV8b/tA3tw3F?=
 =?us-ascii?Q?E5h00dNlO9aNSHJK/04aTs/EkbFnZrhBs6gIwSMMyfdihjJqAE70WZJBbGl6?=
 =?us-ascii?Q?F1Du8eQvTYK50hBVbUp1ftRg7dhWnjehrHQAbdZ+1OQOvk/IMZ+jlUVNBIjd?=
 =?us-ascii?Q?sxR6VKY7Gq2JVX0vGXB7ZjHAf5tsURno1kk6JydxWU7HeZbkCXsXvM/ATfmB?=
 =?us-ascii?Q?9gmgB+dhX+EznHuqXqOkyPN1PyG+NQ+EZ8i9BV+G2/P98il5ovQNJm8MrOdt?=
 =?us-ascii?Q?0En+rA0TQeDxTDaMtsUJErjXEdjPUKLug1FN3Fn4uI2vI3V+QI1jHU3mchYz?=
 =?us-ascii?Q?uQn5msHSrZ/jwsEfU1xy8rQ4W3UIfdKx/EjYpZWMC3D0lXviOq2eoPtoWi/s?=
 =?us-ascii?Q?Hfux9k/WBqkLYSauVJ3gs/1EMli12KiS6gYgKtqq7EdU+FlO3EhErcXMpjRe?=
 =?us-ascii?Q?IkGgR72lIxd9tBBNQXIxbELhfPTUZRUksbOa3aoggAH825S1Vuix6ow20i+1?=
 =?us-ascii?Q?9jjh7YIHGtqxcqHTJtCjC8vQ8n3HCYfaajMHtV8rX648xV/3t5f8ErwhJeIl?=
 =?us-ascii?Q?RG4W0/AHXDbcnRmXCMmNU7U8?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 686ea47a-3770-4d57-1629-08d967ccf7e9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:33:48.1202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0SVINul5zJIX3APkP8sWMRpzoJFIXlG2b67dNQfk7Pc6yAUTW5urXAcdfdm+F+k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4447
Received-SPF: pass client-ip=40.107.93.122; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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
each MMIO/PIO/DMA operation. Thus, we time-out only when a specific
operation takes a long time.

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 0ea47298b7..80eb29bd2d 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -668,15 +668,16 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
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
@@ -686,13 +687,17 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
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
2.30.2


