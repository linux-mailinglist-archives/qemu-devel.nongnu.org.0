Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AD35AD0AF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:54:40 +0200 (CEST)
Received: from localhost ([::1]:58778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9kV-00045t-2A
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8xC-0006OO-Qo
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:03:43 -0400
Received: from mail-db8eur05on2100.outbound.protection.outlook.com
 ([40.107.20.100]:63058 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8xA-0002ix-43
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:03:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NV0wEXVC3OX7omSgAnMVCkOUYyvVFfJpiPfZXSJTj7eMBpO63WYNArHXAj+ZL/zSjssneKsD1s2JPyRRRW/NW3BbXbs/LhUIreS8UvKPm+KPOvnG3JvcmYHcXTXCLxP0Iip1c6wgK58swGH/8adLYPlRPkcSKyg+r9YTWiy9gX9oA3iq92V7bwJ7XV+WOlb9MtKjwNP2NETfE8U8w6S4XR9FMqKuNJ4ey6UEL+rV/+kLVqocBgnqwJLQv4r56AMf1W9NytXOchOYKx+hsxsOOV4B2i0R8uHUbXIZRms2UVEt0WP+wlbsRrjkIrLqsz/KiWz0nMGjlxY3vWwLsuCuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kfrn2p1qAE5uNqMVzBV1Q8oZY61gptjaP65f3TLbYl8=;
 b=gMJZTSS+n3C84X4JWZxOV7bLyFwziUtJNbIhhBfd9a06MLNyhEniu80sJ3csAWqjD0J4QM7rvbsu6EwQT3RhDPOJZxxykRaXa/AG2deHdpWjMwESB/YJb8TIvObDigwo3cdyd8m/NWDHrrJ+e1XjDKWAkTC8f2ULNu90wUPK6YCMjOOqjTsc30ghDZjRmRaiJPmPJ6ChsaQ6snH/70kx66mlt+d9IaTmck0uRP4fSHS2b7+xTj80yh0T7IEClBCUuKIRazOrb5sm3+Vy7Oz1ekIwDC/v7OHbI9eXO4LKZc5PTVRjMTDOFEFSUQ7WGIgx2mWVi/OpyG8tI6SqwS4DHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kfrn2p1qAE5uNqMVzBV1Q8oZY61gptjaP65f3TLbYl8=;
 b=eNvum0SAP6YtNFQaoirF9NokfCqoCe0pG5rbhtSQW4lNt4HwnkYRr/8wM/0RQT+QTx+O4jl4qrDv1omWKIRibgU6C4uGIcaYBCcGumURbHegp2UniCb27f8/u0MgLeuq3h6kPf0cyJdDf1Gp1mVUAOOkn4ziXe10xYd2ksEaGCk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by VI1PR03MB3871.eurprd03.prod.outlook.com (2603:10a6:803:6c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 10:03:37 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 10:03:37 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 17/20] disas/nanomips: Replace Cpp enums for C enums
Date: Mon,  5 Sep 2022 11:55:19 +0200
Message-Id: <20220905095522.66941-18-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::33) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f24194dd-7a33-4fa6-ce46-08da8f25e6be
X-MS-TrafficTypeDiagnostic: VI1PR03MB3871:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xcQDAUke+5C0/aFBeVRhzzLc28f+ZZMt46Ieqgke6Gnu4eGO53clW8yyXU1PQVUYlAhueSMtGzYckA59P5BJdGTKwjbS5B0lSMHjkAuCpZFMU0tTcoimC8Ncsh0m4D1K3FrxY+Zxpj3jeWsQtrofVOuoEDkPuAGlU8rUfGvolTIBG6CFYacGdB9nXR0mcHT6RjGt23kjuZJjOsVZBwzdcVUuC2r0rwMCYUfZEvSvWKugowgrc7AKjGld0I2wdkG/Mnjh9aWW5TVBbhRE5hqOsRk2BLQFBgPmt1LayPgEAEGy70LS2WDQNSlmY7rg30+6pbAQBkQzalrQytxCrtZdi7Nm6vIiklpoIlktlpyP6cQqoqSbi+4bTAT3gEQOPUaPjnVTBQe8LUzFpLsDG77oEQ5AFqJQ6WvXf/chRy+fCot7jSAiCcL57b5jPpHNivPqG+K7Wswie8PI6dQ/re57XxInsNE2+UEDgGfe2nlX0S/Vdp/tRT6i2FtyCiL7CS96JO24kCq9XcOISbu9YM84iX92VeRkLyz4HzJ+r6HAV6xREmjdX1nI9L+6iYlwd4OjSNz5MhcrpMCDk6+WnR6iljC24jsjPuvU+Uk1DUuq6/tupw1B3E+/aVOgQpkq1E45Oapd8/IyVxxNiwtyE+Cw6qBnFMvhav8PeThDHuW90+wDboIbHiLQleSzrtBFHTJzcsYA9HdfL+gQ+Tx6zdDEIiXcj9oo7b29dWMIvpYSoYbmXhABBFXiESpKXAxMyGdz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(136003)(346002)(39830400003)(376002)(1076003)(186003)(478600001)(41300700001)(6506007)(107886003)(6666004)(52116002)(86362001)(2616005)(6486002)(38350700002)(6512007)(83380400001)(38100700002)(316002)(26005)(6916009)(8936002)(2906002)(8676002)(4326008)(66946007)(66476007)(36756003)(66556008)(4744005)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?99u1P5TR0rbdsbqJt+Ci7+GQV13OLRKkBYzenYsHhvOqYVqXaYomPKDEAZEz?=
 =?us-ascii?Q?q+SqeLSTGdFo4EzAPnSf3LULU5d8UB9Ea6PUgiSyr0JjmqUNYNcyGVosjiz+?=
 =?us-ascii?Q?Bpm9XYcu2Qn75vx71NiH2wcMfo4XRSRWJNDiJKMF0K4uzk3XMYQBMhB1vpQ6?=
 =?us-ascii?Q?Yb+pOtg0FNPv9lCPbEc55iocT0Wh9VVSGL/9lnKpEVZbEgyb3XXv388Fzl2I?=
 =?us-ascii?Q?BaWRWw7NH9y2Okf8jD05GYDYWAJw/C4xXOBtKB7jebVAMpvvyXO4OqU+nqHb?=
 =?us-ascii?Q?WSo7OBP2WxdVjh0zavHiyCWgXeNuua6JkJpPVBiBnXm0sFo1axnmUsoDRFEt?=
 =?us-ascii?Q?pA45xvb5uTeByMRsiFaCKCI25IMJ44ej+7+TKedSBIbM/hzqNt+h/hUzZomy?=
 =?us-ascii?Q?h5OfLw/mIOB0tfu9lHcJc69jU0gzQzEi6Ne82bITsyXoNiX4ytS48bYp5m5Q?=
 =?us-ascii?Q?gNMpcTZbwg+WZ6hHDChMFbkZehD03DKG2qz5So4y4mKZjLo+t8MqyNsc45dN?=
 =?us-ascii?Q?8LelXWd8FPNdyhg5+lJwOXxvHKcUs6y5Tx2tz2BXno23gyn/W6BEydFQMI1q?=
 =?us-ascii?Q?iUOnyHLQ4usyYb3lCp2atyU0yWnlf/32coctzAyKKAOFgxYilE4DRNemPuRC?=
 =?us-ascii?Q?/92unAyrl/dXu2XYIU8N3KH1kNy4WWa0tAq8TUY+QPMfhEmuWXeeWj0t/SnO?=
 =?us-ascii?Q?sh1nZzaAiAp6O8V37CfKVSsLS0w/Zoot8GIQJbziSfablySK6qxiVlKkkfWD?=
 =?us-ascii?Q?p0Gyb74MAcHf6nY1dwuXilF27Vbk553oxYL4vVB3P+sXGwsdP9pz7sfHQKFm?=
 =?us-ascii?Q?cvFopvez3TsvroeT/wpbOt4uv3NlCn2viS/QOvlGz53lQAeYpuNvo0YX5gr+?=
 =?us-ascii?Q?nFBHTrVCA/cfwO7XUnyGzw8wXx755HCttuh4tVPsIf+9QBJU462HJohwdC9X?=
 =?us-ascii?Q?BwlqsIVy6EntYzfkFQ5pDZg1P8IUj6lH6SDPhTolcsu5N0HYEsCane7Yjci/?=
 =?us-ascii?Q?/RPo50Mhe913uen89pFOEcUvgWtGYb2Ff7YGd5wyQ1n50D/mAZUxe5/PJJmM?=
 =?us-ascii?Q?c2L5oeltUc5yyrYQsZznDl71VACONTuEcPWiGGsLuQI9S3+etfGYoF7Hht9g?=
 =?us-ascii?Q?E0eF2OSqOJzNvqsy65WRVShfARmhFSgfKtgRIYYIDYH6iXvlH0Z2Qa4Hg5iI?=
 =?us-ascii?Q?eMEBcaxEZx0veDANpO3PbhBeICmPGqyZDWvzIMJdskNOResQMMlLBa6aYhf2?=
 =?us-ascii?Q?jh8u/ijNYdNzlpz1iU2Z4CZL+TSy2A1O+RvAJBkKxcXe29cny87S7ArY5Eqm?=
 =?us-ascii?Q?QBGk0wH34XPu16lrYnmtsoQHowJ8WqWgibdYNju6x/KxFgewj8fpC4+c1W/Y?=
 =?us-ascii?Q?U0dXUq+TA7zsvg4T47qiYt4WEn2NSn4s2Bqse1nggqGIP3XEeQobBTKh3bYQ?=
 =?us-ascii?Q?RDBUoCpSvaRgOoWpXAR4Ttqul50+HiQ2H1sYXJZ9anRpQ1EabRm1SAv7IHQs?=
 =?us-ascii?Q?KnRGyUrfnm3lt8Gcfa8MO6xllYe2GaDg+in1izVpcHqlaDcpWS5r+j4nbt4B?=
 =?us-ascii?Q?+/Fw+X1HYCSUqffzJWB0RSn8eFwp33DKqxcj29pWgOT2cCQ4Rf7Jv/bzs0b5?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f24194dd-7a33-4fa6-ce46-08da8f25e6be
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:03:37.5735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVfnkitxFx0/CKrb+Wvi0cNpG4ZKjx0rU7WPts5FkLR+0DZUYkGfRaqhhkQ20EAd5j3d0gERU5Zi/XHi8BCdwSa8VMDMiRLkITDDTY7CGWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3871
Received-SPF: pass client-ip=40.107.20.100;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Change enums to typedef enums to keep naming clear.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 disas/nanomips.cpp | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index a8295ebfa8..f57d255de3 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -51,16 +51,16 @@ typedef bool (*conditional_function)(uint64 instruction);
 typedef char * (*disassembly_function)(uint64 instruction,
                                        struct Dis_info *info);
 
-enum TABLE_ENTRY_TYPE {
+typedef enum {
     instruction,
     call_instruction,
     branch_instruction,
     return_instruction,
     reserved_block,
     pool,
-};
+} TABLE_ENTRY_TYPE;
 
-enum TABLE_ATTRIBUTE_TYPE {
+typedef enum {
     MIPS64_    = 0x00000001,
     XNP_       = 0x00000002,
     XMMS_      = 0x00000004,
@@ -78,7 +78,7 @@ enum TABLE_ATTRIBUTE_TYPE {
     TLB_       = 0x00004000,
     MVH_       = 0x00008000,
     ALL_ATTRIBUTES = 0xffffffffull,
-};
+} TABLE_ATTRIBUTE_TYPE;
 
 struct Pool {
     TABLE_ENTRY_TYPE     type;
-- 
2.25.1


