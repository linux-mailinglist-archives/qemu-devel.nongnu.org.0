Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F243C69EA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 07:50:54 +0200 (CEST)
Received: from localhost ([::1]:58316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3BJl-0005GN-To
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 01:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3BIS-0003Kk-Pq
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 01:49:32 -0400
Received: from mail-bn8nam11on2099.outbound.protection.outlook.com
 ([40.107.236.99]:46657 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3BIQ-0007xc-6y
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 01:49:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8HCZWtA+LoWCcKEJHUXzj/O7A1Z9NpEeVKE48eM/f9hanj25kTEpdV8XlWBJEhjiRNsl24NMSryYZnhHalIKb08dURRAmBDt9gm05303aoayrf2Kf84Ub6LDRnWSY741F8/TzH5u9golnKSFW7jos2sG7NwuEwm25KEXhxinMjf8uXeMv0kaDPCAQtxWeFUIP1s6MeRDxvxNRq3rRa8W+AFb/4cg/HxWGw9MFy/p8nBBqYSq1p5hKGfsV3BS+X7vr/SWh20zrOTnZmrUMu3ZX6ZAFL0kNYN28THrKDMpCy4Et/gf1ek7vGqW0f4272NcjDjvQIajNSxF/kNYLaXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDuTuRvvyyjY/C3Rw978QPEPGrNt41qFTnQqUM9FCgE=;
 b=Qk/YsSlVP32L5KSDcv3sXL7L1M/1a34fdPEVB80vuQ9VCyGyrHESwBoCq2prDiQw/nltw+725Skvtneki7cogPjDDq/hhPYdX0lLd4RswrEeOdzHaELNlWlPaQ8Aw/IYpqk4ZuljrNinv5lDfU1z7pln+MgOZOC/ALgYqKpxdgJlPvMq1kzhhcWe9vPVbnQ9W8i2RDPbZm8DTW2B8a7TTRuMjA5FQU3OVQYDi+Epp6d3LAvjzEhY3e/4LjNcjhXvZq6Thim0bNqRl3YkJpGqzCt7AoNUZiWAHcxH8jFpytqMRLO8DdQ770NV/Pmt0ixrK2RpwWv1VA19nXSWF+LDCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDuTuRvvyyjY/C3Rw978QPEPGrNt41qFTnQqUM9FCgE=;
 b=0YfVwUkKY6oiei1zc6UGxZijbaUr8zB9TP7O2WN77xTpZwu89XV4Z//bZAtz8GOEKzemP09bA3+6HKH3OVJAIOROCqo5pdkR1or6i1GsVld9cF0Nc9jNG0Mv6yH6TE7DQOWMEIQ2+clNQlfKbo6wLazOHspQchxhvBl3D2fB8aE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN2PR03MB2285.namprd03.prod.outlook.com (2603:10b6:804:d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 05:48:57 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 05:48:57 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] fuzz: adjust timeout to allow for longer inputs
Date: Tue, 13 Jul 2021 01:48:35 -0400
Message-Id: <20210713054836.154421-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210713054836.154421-1-alxndr@bu.edu>
References: <20210713054836.154421-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:208:23a::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR03CA0028.namprd03.prod.outlook.com (2603:10b6:208:23a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 13 Jul 2021 05:48:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f3a57ce-b65a-4cfe-01eb-08d945c1e7be
X-MS-TrafficTypeDiagnostic: SN2PR03MB2285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB22857F0300D31A67D1D7B71FBA149@SN2PR03MB2285.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PMpCxN+z5hMEnOlEfWICtQLObVO+HJbP6Q+y0SaWEtK+9YRv9VZsS/QIZ0j7d9kb3QU4CiXd/Ny2H3jjpCcThaQI0EXn4cc1EJaNiVLwJE+T4U1YHBgvZx5mG5kC8c3b0V+zfzEfaVNqQC3lxeOjo87wFxgBiOqTuiNuAHGkOV4z53qmwqQiSZEuqTZzCf9ysbKvGCs3VsPYPndDavT92K9mf4I+mbwmtqLxoRxAQZS5xF8uqp0SNBV5K1v2w9hBvNV0S8sFMQ10oAtIDeIxK0ks6GXmwIe6xWkpn9ZUrDqtVoR580b+AntFS/+Z8PfjaUPXjpMcYFfbzJEG8JoqCl30aNElrKK2yIJTAiNVz+eTV64yVzrWKCf61w491RqvhgX/OZe6pYTJgWGLW/tuyjdrmi3RP3fqggRo+aSlgE/79KhnHtx2IJvS2Bpymo7nk0Asdsm9yKqTMzVoaOWnDdaMETTCzGx2JB+wmJq5O2/LgSxccB1Z4KA1t6PozckF+NpY1FP4BH1PLbjloQtLXuzkSpE0uL9HiBJzR/kJ4pRqKzwSlcEfVdVZbrWOoKZl8t0u9/T61za5OwQCX0rjiDLJs6u4qg/KG0dYryb1hCp54+cVJpsfpjOZ/Cn2CtDqDyXl5cFwnUnStUDyx2BzK9/7PJYDuuDrajZiPl+B+54Ypei2xkaEoy4opNZ/r8e6nEhMdRfzA3wv9LotyydgU8sjcnZbyex+s6Xpb3n4aa0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(75432002)(26005)(8676002)(36756003)(6506007)(86362001)(52116002)(6512007)(38350700002)(8936002)(316002)(786003)(38100700002)(956004)(6486002)(5660300002)(2616005)(66476007)(66946007)(66556008)(4326008)(478600001)(54906003)(1076003)(6916009)(2906002)(83380400001)(186003)(6666004)(148743002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v8fviQpjlBSOZ1gxJwLQv/ia7w0wcmFs3+pn+/R5Lmd3HUzXxsZ20TZOWEI5?=
 =?us-ascii?Q?p5/MO9tmbdETC8BuXmr6XVINRucrvBrgyKM8dE99GWp4Rphs+8uSh4I72rVA?=
 =?us-ascii?Q?Z4EGKclSJOPs91yHrZJGLwjs3l8JhEqglNvHGdgMFGhMcKH/UrEZLMMvXnFQ?=
 =?us-ascii?Q?lukPdjp3NDCTfYD4pBNjHcs08Q2BjLgb1lD2cEZJXNxl9QclsebubQFiCfVj?=
 =?us-ascii?Q?6MLha7Bw23qnKkTJO0ofMWGJsypp/mw5+IkiQEauDZoLh9nbYhHB2V0giB27?=
 =?us-ascii?Q?+mxcjK6+sZAdwPTp6TgDBrlSoQVB3Gktsq5pxF+LHybtg4TtG6Of4WpJAooe?=
 =?us-ascii?Q?RXOjYblXxJzTzn/mtBm03JPsdiyzFaNiEKss4JZevVPP/Vj28Aj5aURF8zSp?=
 =?us-ascii?Q?Xjf2U1VXEOofBZ32pQpWFhkY+CQfm64rrgcr8aB3bJHMdP9t6kmXhV0cHMrD?=
 =?us-ascii?Q?kLgsBndAOSdfpfwSqi82jk2F0i1svhn9Svxis4uCzGxUaCFM9egOKMDKGnVJ?=
 =?us-ascii?Q?YH8A8P7k9agvb2wxGAO2l/ib8mb2PzOQzdsXYFFtxzox0OQf48zDIngekljL?=
 =?us-ascii?Q?ZgI3QvEW0aOChW/7claj0hA/4qrcB25EoyNGSJTTRflX1YMYgMjO/Pb/uOCp?=
 =?us-ascii?Q?hh+4swPt+5wzehUrvTiAJQNs488Z4J9AtxPltCnj8FTVLfGgGKzjGGKP6Tfi?=
 =?us-ascii?Q?qDXiLn7ma01bbo7GR1s3nYVdfmxO9UTf5BPUSupYPewlnlrrh71WGOejzhmL?=
 =?us-ascii?Q?42RAKAC8JpzlVfuGVKZNRZ6FwQrGCDcQ7Ge4DrvakNqKf5/85ZnZRURpj62Y?=
 =?us-ascii?Q?sJhuUIRcjx+HA0w7uuZ36qoS5Vu9txgrmpGR5VK6+vSqzk3zxwaYnhWOG2bd?=
 =?us-ascii?Q?BfQ+96aO4KI9DtwKf3dHhHtT1tsB4xEeeCnz8e4hOEjkNZGJ4oKedqL3N0Ur?=
 =?us-ascii?Q?tZgh8V8Md/dD1+QQ6YoAVZIlxCqKB/sM5Bl0uigfZZrrkLKOxTuqoTfnxkZj?=
 =?us-ascii?Q?U+R+V3rbbl+Pk0WJu5jQrPQ+9k3ApuIfogrhCDY1soDPImvywSC7RepU7708?=
 =?us-ascii?Q?QOPGikqD1XpwbmxtKBkN9JpzXiBWIe1ukYxE9MEnWi/aVjrwHu0zpKufi10Z?=
 =?us-ascii?Q?/wz6Epz4Qf66iawgikzxWWlPMnOdM9jNmmZ+ZYkEv8W+MzEuScL1OlrTEWUh?=
 =?us-ascii?Q?a2w7CD5BW1OLbaVhJWR7hcKxZpnFZbKPAqsv1Kw7R4a3K18J9rClMwR15G7M?=
 =?us-ascii?Q?cDdMjEYq33b6MZQSfcSXfMyULHzGcRJjln6N2zgL00HADzBBCGGZsqUpU/gR?=
 =?us-ascii?Q?A8hqCCyJZhVltW/jIxFUGpSg?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f3a57ce-b65a-4cfe-01eb-08d945c1e7be
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 05:48:57.0418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCX50VpgjY2P3u+8UfEPcx8yGIUFwomQ1jcNC5BTgwsPCDbW0XdloImYYC584Vv0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2285
Received-SPF: pass client-ip=40.107.236.99; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>
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
2.28.0


