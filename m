Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED31336BB5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 06:40:36 +0100 (CET)
Received: from localhost ([::1]:55418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKE3n-0001Mw-99
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 00:40:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lKDzz-0006Zl-Mv
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 00:36:39 -0500
Received: from mail-co1nam11on2133.outbound.protection.outlook.com
 ([40.107.220.133]:22657 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lKDzy-0003ph-8Z
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 00:36:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyTOr8BCzoFOIlrAcFM+vDtaINFYchQcMwiKfiBMwWM+hcTZ6crHlgEisn+3tM89rNtClk2pc8byICs1Pm02urMrqZ8X8kkUgG8LecD8ODFtxoRfV8g3NknrcG78LiY+z3QhdTmTonyRCLTyrx761eXWQgyq4MJeB9gmo5SO1EnrFpuOiIJLgpTr5Mxj4eLrLw2M7pt+5K6nQFGWwWpIoOyiv4T27lCy7b18kuQnGLFLMOWrNysi3CB6mopRd21wNxmUclahqISoy0vA3fVh0wcUY2IsTAUiky3lcgqArClFwOmwAxwAkTGM7IYEe/ClS7i8MVSGfDvURPYcdNEjVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5F49/J7Ee2b9cUVENFFOl1WNY1BUk2tQI71+Q/Z0r0=;
 b=eliQSi6lnketsYymo181cBgYhNGjlDqldfuvshuSB880FcpIgmeEtLNUadcEWQqrnqKs8ZhCht67VjWiwDBzVHu1C4TI6GYq/D9aeLBX7CW7DhjctVLil7NluFrYb65uBN/CLTi/0V8NceWb/HVOpaeZomBpmLFo7rcoFVLN5I7ZMP5Ebylt8F2BjpY+tx5YxUBsfzXHIeEcLimuZbQRqtbAy+UzVEVn9YIIks6twGtqJ+qdBXZCWwRXexOJJ32ZeYor1VyUC5Q/BmMiKmvN3auWk+PkWBBwuAtyfFjg9/lDkCgrjwXwxGxbDEtt/4q/PUPg2gIi+89KzwhY2NRUIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5F49/J7Ee2b9cUVENFFOl1WNY1BUk2tQI71+Q/Z0r0=;
 b=68/rusFYomKjeLGWh+yVoqpRZe+v5oGzdx4xEf04Wi8xR1Au+BO5uvqxvLqxifIqZ1JRO4YnVk3I3zNne2b8y/hyaB4VO7hoVwHVRWwpugO9a6LpJEiNQVV954f3NSgHE0PdjKdHEun1FzElGMyJ2C8vQ+W6M9wrEgxoiDy8Kyc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3869.namprd03.prod.outlook.com (2603:10b6:805:68::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Thu, 11 Mar
 2021 05:36:31 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 05:36:31 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] fuzz: configure a sparse-mem device, by default
Date: Thu, 11 Mar 2021 00:36:14 -0500
Message-Id: <20210311053614.940352-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210311053614.940352-1-alxndr@bu.edu>
References: <20210311053614.940352-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR14CA0021.namprd14.prod.outlook.com
 (2603:10b6:208:23e::26) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR14CA0021.namprd14.prod.outlook.com (2603:10b6:208:23e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 11 Mar 2021 05:36:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6b5b2ea-e6ef-4f90-b309-08d8e44f9ff2
X-MS-TrafficTypeDiagnostic: SN6PR03MB3869:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3869A472AF4BF973D07D2538BA909@SN6PR03MB3869.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ufFjrbX8Lw6vIk0/Lj6QQDiHe9vs+PbJKOiZXXPHrtZz/gDg+xXLKKUG6N/ODJ6UCjPgo/SkqV/bHbsq2rmTkbJ+L4HTzB/jTao7iFwanFCKmWhuznIQmCaOTR5SZ53rlhxNyVKSuOBMTCevF+OIdqjfpjG7An2YMKOj+MOR8EHNtvC72GD6RW41A8dnod7wCL9Ji7j6+/z/s3ut/YQG+MEtjqklaixv2wfTt8m8A4b6V6tH2Nhc+7xyZ1REOiIuaC5VH0O6bSSGMmQ5z3m1Msz4TByPW0mqps7PJ57Om3uhL68DucHETuQ7GUCh+2FQIP8r1Yj/Pcs9xmfUylTPqQfCKAj/wKX2hJHYyOkiJPwN9Z41uZdVpjp8XjkD8wBWHQaSbr4lcGaWe0Qa3BPFEyEetg4hdPgKDm7mcWC5p78c3SXjXJKNen4qTawX5DFrb0E2n2QIIi9iLWvHQCNjGpvskKfq16X/ETAB5L9m4sjjqGiGpoIkb85clsUkq8L/eu1E9Uiks5ZhyTEMb2LEgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(2906002)(786003)(6916009)(6512007)(54906003)(83380400001)(36756003)(26005)(86362001)(6486002)(186003)(16526019)(1076003)(66946007)(66556008)(4326008)(66476007)(52116002)(6666004)(5660300002)(8936002)(75432002)(6506007)(8676002)(478600001)(316002)(956004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IK8J2CMmEmvEVvEM7+F6sVgu9ijxbdlO7VtOXbalyc0zyl+fN0u932F4epmE?=
 =?us-ascii?Q?+MDAz2Vrw9ry2V4BfaiT6H8gIfbAcLmqUHKcE/F1Uei1YLzOoByT2pOobmAl?=
 =?us-ascii?Q?H1b57Qz/VY7ja7+Ewi65cCuHRv/NLd8U6cKZ/x5YK//nu2gbfkAVL9SYITmd?=
 =?us-ascii?Q?LkXt/1ZZVNzbIhv2M5r7NXcBm4+WVjqp2bCRSSGiB/r9Lj0cK/nDoOzA5f56?=
 =?us-ascii?Q?EHvTDeYkGrLexymZUA+1UJoU20ZTf774NUVuDXfdOKrRKULhsAlJf1G4vLWD?=
 =?us-ascii?Q?VUlLB9ZyPZLroODkgWAsFyg93K2BkuUksyXw0B8HokfNKXRpIzYfu1HmqKEE?=
 =?us-ascii?Q?RE0io2TODBJbHc6aUM9CZOKWbqYm+HlspKTGvCxQipncLk2WMLZfBsrTKVJa?=
 =?us-ascii?Q?hbSEq08Dj4TZ450JNlcV6+dRD38EtENjkHa10rDh3l3+lerIAxxXhla5GawQ?=
 =?us-ascii?Q?TxKtFAcGf10y6Ktw4bqr6OyCqIirVSpBCQAeMPFoFMMHMHcKql7mEqmdwGfD?=
 =?us-ascii?Q?CXxHk/w1wbykGWKNKhesvSKJocOz4yULC/H4vha1B+dqSFG89DiQRFMtH3oR?=
 =?us-ascii?Q?TUcz+hxidJKq6NkF7EdQwKdowYzhP0TpSlKtHplPulO3ITtGYmhqLN4LcW3o?=
 =?us-ascii?Q?xXT335qxYbl+g6DyuIFyu+Zf9o7tZMjim468Wv+B6b70TBPpouzF/iLtRh99?=
 =?us-ascii?Q?xmDnHt0Aj3/AHMQ8lilS94niFBp0huctxPZqkbH6nDIFShFUOGJYJSqG1eOe?=
 =?us-ascii?Q?bbxkaojCD0MOLwle5h4Qfz/Q9wxQr1xYydWbHolIQye+viazMkezJO0DoE6i?=
 =?us-ascii?Q?G03FyHqT0kvhC8c5RNtrItxuJT7PMdFVCDTdBV31jnn3YsA7WRcdwBKhPgEr?=
 =?us-ascii?Q?2hqAv6sG2YIOYozg82z2d9e/XI+8yoSC8aBld1d40LTZum2juK7xWmhZaB0n?=
 =?us-ascii?Q?lkehr0ope4kab/9s1wBV0RtdaEVvyfQAewJkm7PghDNmS+eSRsIFCsYBH7K8?=
 =?us-ascii?Q?8zC1w7MYa0MmDcY/3Zkf5g6DEfHP/wtAEXr1OmAdvlTJHP12WF0Pfo7tHFQT?=
 =?us-ascii?Q?nNBUflJsrLr2oa+h8K2a2SpzrnayrpMpdcJdHsMctp54FtsfPEroeLw1n/jx?=
 =?us-ascii?Q?yBX00pwWb18yGvGZ2P7DkcjQ6Tklh3ZBNuuht37Ic4kDpyIdkv5Gv7ZFjGwR?=
 =?us-ascii?Q?9iol/giAXYspmKVNPaNPW1qTAMDwAtgC3S8EEAAWv/1O/jOtgCtBTcFK1PAK?=
 =?us-ascii?Q?my4yLTMXX+vfcQgeZkv6UqNZtWYD3Qh+JZKpg5YMKtDorpiEAiOJWj1cOoJ7?=
 =?us-ascii?Q?pp0RauEKpUKWlLBTwPPNWuYG?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b5b2ea-e6ef-4f90-b309-08d8e44f9ff2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 05:36:31.2622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+h746tMjyCCKzZG4aCJfuEO0ng+KMXxj3rkpyfU/RGSe5fn2cthWghLaD/tuIb1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3869
Received-SPF: pass client-ip=40.107.220.133; envelope-from=alxndr@bu.edu;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
 Alexander Bulekov <alxndr@bu.edu>, f4bug@amsat.org, lidong.chen@oracle.com,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The generic-fuzzer often provides randomized DMA addresses to
virtual-devices. For a 64-bit address-space, the chance of these
randomized addresses coinciding with RAM regions, is fairly small. Even
though the fuzzer's instrumentation eventually finds valid addresses,
this can take some-time, and slows-down fuzzing progress (especially,
when multiple DMA buffers are involved). To work around this, create
"fake" sparse-memory that spans all of the 64-bit address-space.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 387ae2020a..08a6c5ac5e 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -940,7 +940,7 @@ static GString *generic_fuzz_cmdline(FuzzTarget *t)
     if (!getenv("QEMU_FUZZ_ARGS")) {
         usage();
     }
-    g_string_append_printf(cmd_line, " -display none \
+    g_string_append_printf(cmd_line, " -display none -device sparse-mem \
                                       -machine accel=qtest, \
                                       -m 512M %s ", getenv("QEMU_FUZZ_ARGS"));
     return cmd_line;
-- 
2.28.0


