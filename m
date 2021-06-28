Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9139F3B5898
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 07:26:18 +0200 (CEST)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxjmj-0000rJ-Jw
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 01:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lxjlA-00078T-Tb
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:24:40 -0400
Received: from mail-bn8nam11on2137.outbound.protection.outlook.com
 ([40.107.236.137]:14944 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lxjl8-0004bu-Gj
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:24:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ly7USAo2q4fAHtpkAPeBQsNZozd6bJN320RrctWQ0kYV6JuuQH54Gilsgjdf6hK6zniP/uIvNwc6mq3stN2LSUQ1o0n0FT8C8zBDtXoE2B4Ah3rUGAtfxERRyeOfIYI9g4TNgRjTdwdOVZcWIee+8ckNtizHVacGkwx54ClZRcUAevQvElWL1ab4bjZJloXtJdSKnqDgjTKxs3AHQxeXuGP+ce7xCetUQ9CxVJ/ZDDCFv8IgWdbmQPy/utIIPx9B7SS5HJ6K8GOKzY7JzTmFgoLvll+8o715Bf0pZBiwe7dhKltCppD6Y8kneB+k7ME8KyX9tdAnRENy/czPTSfgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5JwGs66XBU5IsrbGqM2g7dJaqSzusrpNTPzZotlaOI=;
 b=lji1ThNcRG8NVGwZsP9V4VryKn5npXeU1y2kygSFeckoIL3wl7RHIWw632nOhjYE8bkwzmzdtkYhsTvHUrlqlk8+3bNkNzAx6dfCygLbapToj15B50PKogNlP7KB2zeuUQFvpGVqGEy89/ZvGPOdorjzUuXng7/PBWXHXIowTqq3J1Dsfko9VAOszsWuW6B/X7R1HiTNq0qRp+67CV/HVBkMeS/mGgEM9msT+sqaWN3GUXAvIwcn2d6UWUMnivNVgEzPLUYhJHPKhijucKg9Bw/ykbE9fram3D/SMh+x/QyE10bcpHYe9LOwEnhfxwAJaGvZvv/BGrE1FMwneYHnag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5JwGs66XBU5IsrbGqM2g7dJaqSzusrpNTPzZotlaOI=;
 b=uBbyhXvOny6gnQwontil7ueAyekrKdbm/hd3Hl1KXdoygoXDMifl0LDJrpMp04I4YSBeEGbRcvCjRFoV5cx2q4w7vjkDEmAUnj/BLNrF4tyBkwWWuwLhxhQDZ6Q82qvSS8IQayzcgDNWFPgm2ng7MPOT+QiH5Il/4QWpZ8SoEKQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4446.namprd03.prod.outlook.com (2603:10b6:805:f6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 05:24:05 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 05:24:05 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] fuzz: adjust timeout to allow for longer inputs
Date: Mon, 28 Jun 2021 01:23:47 -0400
Message-Id: <20210628052349.113262-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210628052349.113262-1-alxndr@bu.edu>
References: <20210628052349.113262-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:91::23) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR05CA0013.namprd05.prod.outlook.com (2603:10b6:208:91::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Mon, 28 Jun 2021 05:24:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ac96244-b67d-4886-be06-08d939f4f277
X-MS-TrafficTypeDiagnostic: SN6PR03MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB444646CC8E4F32154EC26B24BA039@SN6PR03MB4446.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B4b9PscMG1AcinB9Sy0jj73zVlXjDM/e8IBQ/BaWy7tC6WWOgS0dy4gP0EItMRRAkkumyJWuQtTFG9voaqSKstvbRjvM2WrylIKukbocRd8557N2BLghiqiSRDnFU2gVdi63kNo8335OwUzp8OOeoIAv+2Az/P1yJ+AyCIZLmWo7aMKnmbGzPGhAuh616q+aGNIMupPJYFJz7a8SXIeWVZn6YYTHMVOxbxrUDRVTv3vb1vYZ3afq9frGZLwioBBffolgzxiVo5nYn69rwnCw0I1q5/XST1J5zBVdbaPPcgRH+XAh8oOGx+0MdAtiycBZXUXAH1wJg9qkP7Sm0oDdVlr8SI8txeLZ6QgBGZY+lXHyxvblrwWkuMwPQXWyxHdGAValCRdsKcv39q3syU6zVQgOTEkhnrUKlzJ9Zh5lURCafJTE6rzyPjskGTsZ0J9EDO7nw6IfMdA3l0zJ/fvJM2LgM0+QkyjYLLeTGMJdaizWkGOoZXgP7euZwey+bL5w17PKn6PM7JbTrVAP921ZElTJ1WwevoUyz1RPRJ9xfFNjX7M8+4pijF4brj3KlEj303FujkvPxtQK7kd5cK6srkVbbCZYmeATdoMYcnIqpESGRGQh+mXqGxFE9AapfO1XdRvdTQvyR77nv0gf8tWKiCD4hdKS1RI6/uFuzQ4D74A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(86362001)(16526019)(26005)(6916009)(52116002)(8676002)(786003)(2906002)(186003)(6512007)(4326008)(2616005)(36756003)(83380400001)(38100700002)(1076003)(956004)(316002)(6666004)(478600001)(8936002)(6506007)(38350700002)(6486002)(66556008)(66476007)(5660300002)(75432002)(66946007)(54906003)(148743002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SGHS3CoRQtTgkAKt1t0Lwx8BFiw/BeCY7fgpHrZnDCob6hSkZke5dDGmNt8k?=
 =?us-ascii?Q?gtLYgXHsy7o9PR3MX+BvnoOfDHv8+Pc8opQD+ZBSds4u45NwNl4xUqA47jTg?=
 =?us-ascii?Q?wjflENN1yzu+h16vI0KIeFDXOCjyVsaxT8gHu8wa/eo4d3djvIxXIJxM/LF8?=
 =?us-ascii?Q?p6KJmu8AFoD5ncC03XspGvAxlz7kNI7Oj+1G5tXJPfvtiR0PPAxVpx5PKgQk?=
 =?us-ascii?Q?6Ej2ylrTbx08eGAhvvfpj+7Qaj0o1vuxCnn7QcxlOI/KFxsd2vRkpFReLLJP?=
 =?us-ascii?Q?yyKpP6RqymhN2WxaU/KCN6vAgpN4ELBXvIPImWT2DUBFwI3CIcPER52tqMe+?=
 =?us-ascii?Q?kYwNn83gXnOckXNpLgZsv6IjMs+VVsZ3M6hru88VSm53fgXUiFk5IF3EqwCl?=
 =?us-ascii?Q?8dlDNA/Yz+ZrckfCQhq6NP79npIiLRTbz8DS1JQyEzvQkI2clyZr3kj5hUbS?=
 =?us-ascii?Q?ukUy5ZJgUyQsJSdyuR+h7E/qrWoJOP3z2yAqlavtqEyKyacoNafTlBAlbHB4?=
 =?us-ascii?Q?ST1rR873gqxY3Cyq2D7tLagAG7nSCq0YnWt+gvYDz3+YTzg8qbAN3/Ol8/H0?=
 =?us-ascii?Q?UuZr+q7NQb7eB2uX2f9W4O9rta4YHSZ9eOgzbwK5nEQT+X0vkOnB8Knxr6fV?=
 =?us-ascii?Q?x7GD5V1F8WcyuU6mSfQsu4hp6lYOKORD/CYAqJqBDN/WpxLf5Q/Nb+v+rWQw?=
 =?us-ascii?Q?+5V2YXpeBPlfz6lPMcGpFISYsL6+Kh8nt0y+N6609cMQT7xs5jnwTbwz18Vn?=
 =?us-ascii?Q?/xIBXdgKsMssfEC1lu1dKQ259ibzRDKsI5IZuJDlPXUyU8A1xdBZvXNNSz6g?=
 =?us-ascii?Q?cKFjqbLjiDDdWt/rM3m3fY361GoPVd06xMMh8TrXEgagfknl8FtHoAHlFwZ1?=
 =?us-ascii?Q?HQAk9YavuVDGlj2xxL+7CMLcyq2DpXZfNHnG+ypBDQspfh5BcOw7WWkO2Vmx?=
 =?us-ascii?Q?m3fWSQUyWd9QWl1RHkscoUgHTBYAV/MkHfR5Nsgq13cgKWnFeQgQsWizyAo9?=
 =?us-ascii?Q?Ow1QCaO5BJTgyddAHxwacYGkLcjh/LeTc315DC0UWmeFaFlknv8wyIydBWf9?=
 =?us-ascii?Q?tjhnEbsUggn6ZmNILu4JCOWvp4xB6sJuJxyMXRYrKL22BvLwucpEntTD58Lk?=
 =?us-ascii?Q?5mFCdDvx1EBthOFWShAX38KmTAKL70+O4+Ju0tcw7pwS/2ihcTqRh5hcidD0?=
 =?us-ascii?Q?FVBqu18drqtjClNQgsMcrPpQfvIy8nPdTHMHNH8uctUM+B1W9B55seu3WxXN?=
 =?us-ascii?Q?8EU95E74AOQhmommpqx5V4HaeWEOvPzey0qZAzcSMN3jlkesJMI5Of2ReLhb?=
 =?us-ascii?Q?ByrZBSfvIrYJeffPJNYQwgJ/?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac96244-b67d-4886-be06-08d939f4f277
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 05:24:05.3822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /msPBI7/Hv9B8yzO40h5V/QjfVlE9lUQ/9sn2bhfJ45j/2MZt9nxUz65Xw9jFmq3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4446
Received-SPF: pass client-ip=40.107.236.137; envelope-from=alxndr@bu.edu;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 darren.kenny@oracle.com, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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


