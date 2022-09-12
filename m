Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D04E5B5A45
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 14:39:18 +0200 (CEST)
Received: from localhost ([::1]:38364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXiia-0005Jy-UC
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 08:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiZx-0005Wh-Da
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:30:21 -0400
Received: from mail-eopbgr70110.outbound.protection.outlook.com
 ([40.107.7.110]:8421 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiZv-0006Az-Ol
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:30:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vq+Iv4lmVlLditI1KyhDaQg+XvLYGwXnQkqqK9WDOeCFU1RlbbwVbki6L90LjQGi4YssHtmTia6unbz00rKdbkZT2gZeOJ3zZZvZnqOsSiAOfoUoqqr1AXfVhMyn6pJPhcvroNkJ0XTPxXVQV3nnTPxqBYgnTuyGzqZF+1Y1ZHce7bROUeM6u8VJwsWVMisQmf+MLeIoRGFOOcvLnnjKSQbJQ9x0VZCm4kaOrKieIBiorggCH4M6RiW5aOk+0deBuq2IZDb0E16llL0FV7xV42V2wAin7tvkmWyMvgZwW5heIW/hf26sRE4ji5FuYSQ2kp8vsrTGKjJBEPpc3s1xcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vyRvGf0xgb+csgPwZHdKRYAd9YK67In1wmGvQpBmoY=;
 b=eXP9aLM8SYw3hAMHzRO6OrHUgTy3mGnKhTf/hpKmmpjevkpwl9Lo2ZTVMqZ01nObe+SJ88Nsq8uhnO8nYlB9dcUUNXYUCmT7eezaeJl7lfVoRpWMIS1LMogoMgchyc0BA4mtvZk2yg5IFD5ySJl1dnv1XIC+azUyxNUYvfjibyjlhGsMbNA1Gf1nYv81L0ygfhaAonNbfy08Y19kPi41OxvIShHlzPRJOYL/pK9ciTuuHC9Tvw3JI6TSVEi4mVwgZ5CBJ8HBIccvbkcFEy9f1XXSYg0QWbrTgtVdE52xKG/nXQnH1FVTX6fqzpTMg+lrkwuGUVTbtV+nMi7DXgAWcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vyRvGf0xgb+csgPwZHdKRYAd9YK67In1wmGvQpBmoY=;
 b=fPTDGJ65XcbqGl06LvBhM7QKYQZQ6IFE8V6h8XZbuC6w7q5YPq8AiFJwsQp1o7U9Ez1IQ8yQj49rpl+l/Oo864kQo8fU4ykQfnJwJe89Y80Y2WNhbCWXDJ+xB0V2iXGSXSMcfSX7CvALdq8FD2/cEFa6H0HkdatPGCC+8hUZ9PU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:30:10 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:30:10 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v3 14/24] disas/nanomips: Delete wrapper functions
Date: Mon, 12 Sep 2022 14:26:25 +0200
Message-Id: <20220912122635.74032-15-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR08CA0145.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::23) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|AS8PR03MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c57b245-4bde-4a90-b45b-08da94ba888a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kf/PLHJpAzJlQLBCDpJkK9ny4XFEU2iJ+B38u+V2233lC770ayBZtqvvWS52PrTyKET1+SWi/xUact2Nmu5M7LkEFfn8F9U0JWTIxPU0u8nr1880tkbY4ps0rKH4w3JOZrp2okrgGF7YP8P7dI+UP8/oa6IzhDsVNCYP+Lr/VKsKqIAezvOQpwDptCFrxwMrScp+xxH432i2JdCwqf+AdDnas7sq8uvuP7hL9uPs6AvSqVXMU1yYaEW4KdOSr1ydgXtAQTg/aN77kSs9DjwwV8r9lfuUcvfWpiPbSAixngIpGLIabr/dhIoiyjSQvy7lug3IqYwsL9J2z8SdVVl1OQ0cd7eEadL1QYH9fctplHXKpvvZrZZLPKNWVdGBbLqwMb9vmfGvWomX+56D677O1W97J7wh/UbjY9fywp7/Rx2+AIhbN9yK1eOwGOeHDDzP/wsx32Gtv01O+kE6v9oX/1uL0fr4+V6+w13UoKOze32lq/v3L0WQ2KQW2kjjMHiteEl1Fm2XvFsyArqlsRKLTLBp4Sj3PVwpRQiOmvC3OTXdJqVk4RzuVp7RPlxyMKqUMaeqNB2pZZ0Rn0xzqlIJRJ1mg2E5zW969q59zEGTmpYvZstdsmDK4actFBXkqjLJgytVGr6uvfD9YDkGMGtt9KaMnvVuBkPgN2B1vIWJEhbc9gV7jipTLUrccmgJcz252K5Ihaa744uoVVnOxPke7ALOBw5x8WqcOO7Ow+VUfAWFU8Ey5vct6MsFk9Kj5ws5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(346002)(396003)(366004)(39840400004)(38100700002)(38350700002)(44832011)(83380400001)(2616005)(186003)(1076003)(8936002)(4326008)(66476007)(66946007)(316002)(8676002)(2906002)(6916009)(5660300002)(36756003)(66556008)(6506007)(41300700001)(6486002)(478600001)(26005)(6512007)(52116002)(86362001)(107886003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wFfTS9qevcc9QFzn35PSC/WZ63DNKDodbIr31tgiMg4Hzp2KlKSK8QIxvnZZ?=
 =?us-ascii?Q?TZ1P8OTjfELNxatyoDK79OE7fN0aX7oUMTtNFWC8J+nMx0EKpVW2X/TT75jp?=
 =?us-ascii?Q?PCgMPVuXf8ciQyshjn0XBmWKF4+I1jdQuOKJXn+LwRD3W8LAFdx5qJJw05m7?=
 =?us-ascii?Q?jYkC5bHQt4AnZxo5feUt7Pj0PPzkzTe7sTmE6yUMFmMw2SF7OdnA4Vnatd5/?=
 =?us-ascii?Q?3fAYvtgU1oMrZPGhZzQJIXxcDbDDZz1F7XrMyoQliWEmfd/RJqNim+xMblkM?=
 =?us-ascii?Q?Pz8iuNmUguI+CyBpLCPxIDOlEvTOimaB6vKSwys+hZdqapEC0epHIf/9PSYl?=
 =?us-ascii?Q?LzLM/uJx8RU6c1kLPs9Ms75/QOQiCf7YoX6599xh4aTUpZRcMOJ+/hEfMi6V?=
 =?us-ascii?Q?a9VTMsAkJCugpfjQ6cMjrPA2ERFIte+aEsnSZk6aIZ+l/oagsUY8xxu5uov/?=
 =?us-ascii?Q?oBwCHDoqK/U6kAhTXwQkmW3mx4vc85ncdZ7mnjz26A3G+r5TpJrAGZX7z0OY?=
 =?us-ascii?Q?sYv/DEOaEJGKAmD6Kqw/Zqr5iedDhbi0bO+qBh4+rzzXNi+kJ4OLMRSdwz3/?=
 =?us-ascii?Q?gjh/v85shjWfPXGLBleFpMziQnEDim4xfOAIMRFBLVJE8WbwM7hqLN7jBiGP?=
 =?us-ascii?Q?f6g1Qrgy1lzf3ubOAVPT3TS2/ExxfBM7gzZJPFiqh2NR5mqcG01XtqvIyeyP?=
 =?us-ascii?Q?rVwysWXejxZISvJbUUs1J0FVvHsKkUiM/vle3QefYJOS1AjyUpYgqzS9xRCx?=
 =?us-ascii?Q?jSKBqOumu+UOi5Isim9VyCso7+ecYRpNd0pJQITgUII4iShmH5xhFOaODn+S?=
 =?us-ascii?Q?xAtaW5AL4RNmY7rsXhiAFDwIXyXmSx6Q86Ds27rs5Zes0Xd6d+PCRrLT02C0?=
 =?us-ascii?Q?QYMWtT6wT/xBKrzPt/B9OpnChkTvIj15SbY7HmATuoHhQsutjYrPw5NmnCwN?=
 =?us-ascii?Q?JKc7JpsjwuP2GRiFV+EPJrSsMz9sY83+I226REH9TEckR3zwNqol+PhVCxHw?=
 =?us-ascii?Q?JhHgXQ8yvmm8y64b1I7oNHn+s8uGIfF1XQTMDaziiw3x7H2ZJ3F5p0jV0nz1?=
 =?us-ascii?Q?iuzSLETgOHY/GXKnghAj3l6D3k1ydEaxh+PdN2szxkr58/HIzO7VYosukG4z?=
 =?us-ascii?Q?ll8/sBKakAntkcLdhz5/PkPP6zNr7hzQt67fC452h97sJMgtKah+DCScspDG?=
 =?us-ascii?Q?lE3Pc6uTIMwJIMsn7tVPRwagVL6fmBUpdf05A3FuIIu7b+5LFOb/nU/f+VGK?=
 =?us-ascii?Q?8gi6nHoAB0O/7OIV0z9SfuTRNEl/mRTNeAd9yUWebzIJL3VF6tDfk/U/szbx?=
 =?us-ascii?Q?leuYrsUyMsoN77R9JV0jUWDBaUBU9Aaafo0enGckSQAW2aJPLAHYry+X/hRL?=
 =?us-ascii?Q?XwBxeN5ssCHoC09KUpnQau2UQgLbv0kKV4ojPIwsMO2wEPBm9VnN+mdvDxQ1?=
 =?us-ascii?Q?gTEEuoj5NthN0Bl0Tv2tyBmTG+0PDgpSaGy6NGNEad13O/M5E7gSexY/6IRp?=
 =?us-ascii?Q?5NykHx5eQOkX989tJdHYM10K1mbewaZzLJbU6Dk427o3g9//28owpDWpNduB?=
 =?us-ascii?Q?f8W9Z0XawaxFlhRHa/+2ODM62l4SEuBwLVra2nOe/DcYWiaQkTJrov1p2Ept?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c57b245-4bde-4a90-b45b-08da94ba888a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:30:10.3372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxISxrSf5eD/ervn2XcVSDyhA8rA2m81dFOOhhN7lajRpTocA3LGoVfRlymjf1+uCtTtRshb9CakJzUmSJA/qlkaDU9zxPW5GizyoT9lT7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7603
Received-SPF: pass client-ip=40.107.7.110;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Following functions just wrap the decode_gpr_gpr3() function:
- encode_rs3_and_check_rs3_ge_rt3()
- encode_rs3_and_check_rs3_lt_rt3()
Therefore those have been deleted. Calls to these two functions have
been replaced with calls to decode_gpr_gpr3.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 634ce8d08c..b5a4adb121 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -505,20 +505,6 @@ static int64 neg_copy(uint64 d)
 }
 
 
-/* strange wrapper around  gpr3 */
-static uint64 encode_rs3_and_check_rs3_ge_rt3(uint64 d)
-{
-return decode_gpr_gpr3(d);
-}
-
-
-/* strange wrapper around  gpr3 */
-static uint64 encode_rs3_and_check_rs3_lt_rt3(uint64 d)
-{
-    return decode_gpr_gpr3(d);
-}
-
-
 static uint64 encode_count3_from_count(uint64 d)
 {
     IMGASSERTONCE(d < 8);
@@ -2958,7 +2944,7 @@ static std::string BEQC_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    std::string rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value));
+    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string u = ADDRESS(u_value, 2, info);
 
@@ -3244,7 +3230,7 @@ static std::string BNEC_16_(uint64 instruction, Dis_info *info)
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    std::string rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value));
+    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string u = ADDRESS(u_value, 2, info);
 
-- 
2.25.1


