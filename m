Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317053F763C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:45:40 +0200 (CEST)
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItDn-0003HT-7g
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItB7-0005g8-Tn
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:42:53 -0400
Received: from mail-dm6nam12on2127.outbound.protection.outlook.com
 ([40.107.243.127]:2657 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItB6-0000OG-1X
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:42:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCUKwfcU1WdvRiasMP8DVZW363E2H+zcLSOwe1kUTBOf8R4yPMPpP2lfNojG5S5niwveM23oJUMDyuWMiTQGTia/q7PKtiEFYuLQI0rpkcQixX8Vb1TvtzrFH1Nj/dlUH6xdSdyJ3itQNMrmLpIttA7oVM878aEaHITtl8PWXfXuD4Aqz/4FL4PPIO4HsSWiKL0wex/6DC5Hn0SHBDyFsy8q5XtkSholIdTiYz9lp0fSEK7a+i2fFVTOJwKfoqWaLX8TFSQYqoUcV1W9/RFyhTayKoWKs8Pue1R1cv9CrqTDpyHBbp2Y7CXpMsRyC+Vkwen9jRWKuXwx9HzLKTi7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmPJ+fD4N3a/Adp1pQJyGkU/mGVHfc5J0H8LriDEbPI=;
 b=IgMOJtrKWKUINmGJ3iz5C7IENsbEyCntLfgPvvTPspsBgrvSM+yaVd3YBd8rddP/uvT7hFYx1zRspkB5esz4djOHeuNsJDWEmVWr79Qiy1z17rTK48hjAyzVfAvRhPOfUD2TkyRmG45N91Vyj+HwWyAo3JcRBqhbd8/HOh1QMg4UkwIoZ235BVP7rlAV1+KagsUUTfAHOrf1ipPBhK5FvRnvrq1F9saa0KBBXORkMUe0nbl4Gmmu/4ykslt5KpYmR38tdAEElVUdZKYtLE/NWPTuUQegMWPp5OLzwiXa5T7cB3gyFtY17jqFfePQ30caU/SHa+sBH7BIkJiXHpAW0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmPJ+fD4N3a/Adp1pQJyGkU/mGVHfc5J0H8LriDEbPI=;
 b=F693H4bU3EvObTGojW1WUNK2yhkd8gVflx4eABoaPMjcjmMLte9Qs/HoBYsllv2OB1qW2hlShWvzN38mWVDsHW2+sD0L9Y0x+hcOkBNXsmfUB0qG0oB9bMUECVQg3srBlZyBKaNXg2ZoMGlfqQNPJdAU0zQxCrvdjgPU6PhVQUE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4399.namprd03.prod.outlook.com (2603:10b6:805:fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 13:42:48 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:42:48 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL v2 2/8] fuzz: adjust timeout to allow for longer inputs
Date: Wed, 25 Aug 2021 09:42:26 -0400
Message-Id: <20210825134232.45074-3-alxndr@bu.edu>
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
 Transport; Wed, 25 Aug 2021 13:42:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d4352aa-f9aa-4fec-8f17-08d967ce3a22
X-MS-TrafficTypeDiagnostic: SN6PR03MB4399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB439958554009FFDE26B347DEBAC69@SN6PR03MB4399.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LeHBk7mWyNk4gVOuZohkSz54UhTf9PhG6w6M49dket4ZZEV1Lm+1IsQi9BEdHY+ABTYLo2psh8RauzQiM+6oiRRXqnY/QdxwNscW+730Uj/Eu4+ckqeDY+Dz/Gs100acEF1RhrHU9OWeNrN+/M+Z05ELzNkCI9Ut7PC+Kvwe77XwiA0aqlCAR85ai/A6NKpvt/ue7lj6T+DYP5HPDekarRUEvimKtA8R66VD5+6Q/1kvvvTCM0e0pnUOec6SDnY19qvjrys21qv+SgXDmWXBGe0bueSF6heL3KSVidelozfYDVCFJ0WK5OXN7bi0PLB6oJiTW/dn7cKDv4++KroNyZcMrRVbODyung/nc0ml6XlF6TYitqprSEFO+7XfTgPnFDMikylXUhdTPEB3URAqjHRcwlkHkN2O2FToT9scegkQwfE8BlyCv6TWtJaE21lK/4WAHQ80n9nzI2I1n1gp9Ptcop2kdKXHryIC2vPtsxtFLR04ZpKk23tEAYagm7q/0y/J2DGTJPhsgnMwnJ93JKIszPBXH11IdqbCePZOrffMPqrYkOrih6nWpfBi64AO0P6CL2oGPYfXCPIJkOwAdLEEUn8KpmXZR/8EYDMpH9xNCc2BFejrH8tCVsp0KZd18v+5OVgtpraqH9RyoJQu7sWrpOG3KcXlSuTZlM6s8o+HZjw8A4JUx3XFQenANxXnBKC1IXR1DC+F3EmJZOPXAOialRBb/4tfFX0BmxXCv68=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(66946007)(52116002)(66476007)(75432002)(86362001)(6486002)(2616005)(1076003)(956004)(8676002)(66556008)(8936002)(6512007)(36756003)(6666004)(83380400001)(4326008)(26005)(316002)(786003)(6506007)(54906003)(5660300002)(186003)(2906002)(38100700002)(38350700002)(478600001)(148743002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HIkiogMSPYm/t8uxOud/Wl2CFyaJjfQgiOd6hFMaeiaq59imw4aDQKZywTlC?=
 =?us-ascii?Q?eNmfQHpBBCRacW1fVwPh4RHH6xswWhaKvtppS9m2kag9IWiE85kzBZQM52Ia?=
 =?us-ascii?Q?URASHaBc0/P/eLIAG5Bs5bIves9JlTRl+aERCFkW4r9B4g3sZgwcIwk6LaDq?=
 =?us-ascii?Q?iti1GSUaT6TS6ZEjpBuZI6/yNvkH77ZldaKs/4FAUmvZ5X1v0t/U3nDLgkTX?=
 =?us-ascii?Q?eSJuGe0A7ksFviPXpJTkPwHsEBpsWx+vV+tgL4lJ0HdnOm8AwA9S1mra3ACv?=
 =?us-ascii?Q?omKmff/r8QdMBwagT1x+K4XuuxVMugwtvQv8haBh3xOkgz/zk0uR6tJQ/Ugx?=
 =?us-ascii?Q?K8kvoX1CFTplkuEk5vT5t6PYXIs4BaGXxrnG7cDQhATQa/xkGHIprDItzsVy?=
 =?us-ascii?Q?oM2ItJ8d6fJ/1udi/xIrJ+hrTFL2/6avSvQ0JCXcRbNBLA5ezhxnljHSYULK?=
 =?us-ascii?Q?Xy09i2mB5VsqH9FqD7mMd1NOtYld0m1M3JRFlgUcxt6pf9KYlN+Ic5Bzj+8j?=
 =?us-ascii?Q?IRtmouadNLv132QnX3/yhkXMbzeWxeT2upkPWY0En6LXh1TZflBR23LuLPiy?=
 =?us-ascii?Q?T37KJwkcwETSfKj7UF5Sx6gXbVJwaewm4Yg1IhtOWbCSeWQfCZ8puO+8WxR3?=
 =?us-ascii?Q?t0rKeCUm6tRkQbW4sdvftF8OGn0kErihBuIqvXpeBBFRT5g+JfvfSq8OnEq5?=
 =?us-ascii?Q?5GuTzbcL31MvK2kiEbxVQzsHwCE+S3QWc+4e9bRcHqetCUtqdFXcefftNRYO?=
 =?us-ascii?Q?kR/jxDjaX+JPQLgphGyNfLEZhfWkUYG97Nk8mGxgtwu4ACpCjKamRRod/HJz?=
 =?us-ascii?Q?LhpiJxED3uTbQdKZAKExKVZtlEvhXMnbUvgAS1Br+Ll/ELm1TqSepN6ePUc0?=
 =?us-ascii?Q?2jPL0cQwEo1ELbXtlxYp1LXeSgduBQd0vQXTmo3Zzk23FMGhGXK0LI2j6RBo?=
 =?us-ascii?Q?YVpgYllr7SRtldxkLh5mzSsV8e+leXo5obo+fARliK7pqxEJ4T4FKvrIfX+H?=
 =?us-ascii?Q?p9WXnAGAxyxGLHxkjV32w+3SdZvdaYeAq6JCDTMLb20ZSr99rgzwcjPFHura?=
 =?us-ascii?Q?9NEkK7qUjR32pmWxGaO6mb1r0UDvxv31Z2cktr+oWEgeE56XSUTokYR+SsHN?=
 =?us-ascii?Q?c1LhOzMkuMLc27Ugh7lgV/mR2StEsyNEq+ST4KXLydhiNL6Yiqef6cYRIBjz?=
 =?us-ascii?Q?4m1DdvSvTldcfWUpMJiNbOyfHev+5sh8VgqPDK0dChidB6dpSPU4erJj2XFk?=
 =?us-ascii?Q?6UIF7F84xQI2+ENXIKoNIuxagQbaXxofrUpHCOiXd1lpmcVjyZdoh4pflnqg?=
 =?us-ascii?Q?BR0Unu317oTari6CVWROHjpX?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4352aa-f9aa-4fec-8f17-08d967ce3a22
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:42:48.7272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzrMqUek9iIRmUAuqJuUkPMqN7RMUykZp31uDu4ZrCX3xG3u5voIRyEdmpoR4how
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


