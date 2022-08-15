Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE320592A7A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:58:06 +0200 (CEST)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUz7-0008DY-Vw
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUWs-0007gN-27
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:28:55 -0400
Received: from mail-eopbgr80100.outbound.protection.outlook.com
 ([40.107.8.100]:2713 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUWq-0000T1-2d
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:28:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mq4Pr/yt1bPsV1d9WLBneIgMVkbrmebkvpxsAhevr/DahRRUA8d2ipuIXHVNvs3eClTVKs0HuTdBdGKRsIjz6VdujQX3YNu/99101GdeBb1HT/bTeau8bdoUc7Tknpv99yu1mm8EzBtcxpzPcYN0W3fsJEPqVt8+fmGW6d6pi1HYVFBjU7Ii4xroNc0hkXqbPCmtBV551+Z3Wjv0cinpotFGs7iA3SBZloZUyoM6MYDlV6r5YUgt0fMxGPJUITBLsyiMMSPYcwUs6uiaHZdDXd2+usyrI9DKtU/BSHbN8jmcphcv/hf0flsJG2RD4lhAKU4gJjSjtKv3oh9k8/Yiuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKdLuxf+1qu6S4A10AVye5tA+WvOVyNBAyNZikqlRUk=;
 b=kuMD8BH+HeD8Tl0mzil9+IfD3ZN6cE8L/iemjWGJYHwe5iBINQYYc/Sv2/dbwFYG+iMz1+yi30R77X1tsUHjqYkBcwgeZShF1OByNtWsr8f4cbNYYlXe49Zzd/CjSvrZ0RqW4KSO7ov0ZODmfPLkCX8dzEfo8qdjLZmVcAAMbftW4exac5fzWUuZ0DS8oWUTgzBKstqg6U9MAAqS9m883g2HRcmqzz8OuDvKWfT/SsRPJBGR8DowhyRQeAB7+ITMbnHOeUo5ECzHie8VCah3KVZRbnluK7ce3lf70t9GtGiNneJo9aFxpL540vvOptow9m19m2M6ZcXn9pLz6UGBoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKdLuxf+1qu6S4A10AVye5tA+WvOVyNBAyNZikqlRUk=;
 b=s5kFAQrKfpPgicNybtLNpfTZ98T1CAy4vFn2zlC0wBoCgsjVhFTNSSaGzZyBMQRVOxiG7G3IchuW6gA1VCDqfOyEMML8LovKUg062CJXknHIZk67Y68QrHYla5YXiI4+OaGJpIABCjDpyrXUIOOgvvhZurtaohsaAy+EmKK/LQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by PA4PR03MB8134.eurprd03.prod.outlook.com (2603:10a6:102:2a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 15 Aug
 2022 07:28:43 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:28:43 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 05/20] disas/nanomips: Remove __cond methods from class
Date: Mon, 15 Aug 2022 09:26:14 +0200
Message-Id: <20220815072629.12865-6-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:803:104::22) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a79356db-4816-4589-aa5a-08da7e8fc82f
X-MS-TrafficTypeDiagnostic: PA4PR03MB8134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HiSmmQSKjE/IUld2fnYwQkrhY9SwTS9RaIBESRls/1E49c4nn1EbOn6Jnmxdg4mlpkmKPlwkj2YX4maqbNqTWz+DuVTx2E28meHA7PxirC12n9nvI47zF7wlkAFta2vdC8QSRlMehW3VAtIOxBmOtdB9N/q920c6Fu4vXAESJVropC3EryDVb3eThlfdnyrSecTkfGF3p4JbEgT0gz+lgSf5XwA36Mup6W1e+YllfQiuRkoEZ9zFvKYCP1aQFTg9NURsjxVvBr+wRzGaHNn51P3uHXU0FwmvhSM0fXswTvEidr0vofpj8X7Gm2s23+kdi+As7WiRa7aGXDd5EMzg/Ugi/wEuSlU4K5U4c5PVfAonFS/hifg9myP3fDTZ6CfktIvOhT7XD2/W80MEjzjgRQ9r++WdZcCdW8rM5K/pTx2m8qRxo7TXRBr3KlgXwhxkzAAiXY/UtSMuzw2lQHBS/ZLr8jnqjV3tsKma6kBpClQ34nkFStP6etcshPbU09t8rDX/fnGJKGA47j78DPOyNpQWHaPA6xc9+weg24zeXkYoW29LKnqkvbua9kCTQ5xfQ7f+IhPrhM+Yqx55T08+Rfp865qUik/uo5YMSkYduwEa11pmJvlpkF1Cvd7Mk0XxmYk4tYHhBQyedRnitNCryx8ntDB5e8whr51T4y0Gd8xwOXt630+SiLkRWTKxwQa3TgqZIKPE/ZhlCOqJ2HIgT88NRso5aloQgk/fAgjX5N9YNBx0K2d+iu0lKr3pF+Hibs0U5LOUj8D0OEfWVRAopnLS00yLIYTDSTSFe8BkOSs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(346002)(39830400003)(136003)(396003)(38100700002)(2906002)(26005)(66556008)(5660300002)(66946007)(66476007)(6512007)(52116002)(6506007)(38350700002)(6916009)(478600001)(6486002)(107886003)(41300700001)(186003)(86362001)(2616005)(6666004)(316002)(83380400001)(4326008)(1076003)(8676002)(44832011)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iEAODVEk4PrXkIQQJaJ++vMzKpg185Cykq8b+LBpjT3yw7N7t7hWWe2UTQaN?=
 =?us-ascii?Q?wJCymcR2yvXn//50Y0ew6U86n0/nSJiSpq+mbFJw0j/FRUOPzahLJMGsofkd?=
 =?us-ascii?Q?EGJL3P194hlNqNmfUTlg7ZtEr5SdJQuHwBbCqTdQ40zDyAklyJZmx3YZWlcb?=
 =?us-ascii?Q?aameeq/FcVlthM+WteWOXXx73/r42F3B7Dn4BfQ4Km6GX+YPqCOA4KmNin9r?=
 =?us-ascii?Q?xwqGislq053MdNwuNBc0Rslz6aerklF53KoWKKPifUL3EU9h9Dr91SyFK83V?=
 =?us-ascii?Q?NRLrdvBNo+rYobpQfQ+YbKwmEtULfrhLW7dQXSC7kB1NcAczTOSZgjaxtAkc?=
 =?us-ascii?Q?hXMBsJfxSxoQOZLwHmLVstvk0tVMGViU2zR+PI96PMua2g/RYemnBY6NGqso?=
 =?us-ascii?Q?K9LG6fUbWQOkPfeNGhEnxHuQzbR6bvlbfDEuBkiqwZLBYgVkHK+IE2hXsYAA?=
 =?us-ascii?Q?MlGmdtLkCDsM2Qm/jDv+qAnd1uEabWp6OdOcT5D0W6qUXOL1K5NSsb2iWGdp?=
 =?us-ascii?Q?gjjnycJQ5ySJrDLT6snGcbsQxEz2zO5vT800esNMl8ne2Qault6isVLZlbTz?=
 =?us-ascii?Q?m4LHwzPp2dLkeKZzn+uyG5H5drhFm0TgwovQRQDTaDx2zEK5LQt0U6FT/ByU?=
 =?us-ascii?Q?K+0RJ2cCB3OJ7vEKlyraUk5Zr7gGoHuVVsuOZuPtzBZBJf1Jibtmp13qqMJG?=
 =?us-ascii?Q?YBJaM8eV+SHqNrxk3VHJWpBMRL7HZvjLw9gcWPwlS0BquePze5hiskf+kt5a?=
 =?us-ascii?Q?GWatKX3LyRuOJxBg2eAtsaI41J5XMtKaR0ijTKyr7EFX3fmMaD7/+CTnD0S6?=
 =?us-ascii?Q?UhH1LF3c18S7uLf/z/ajRNa/36rUZgofYWOtJ4wUswr/ezSW4gpqybYaZHZr?=
 =?us-ascii?Q?9Tk1mppuVt9XrcIy5n2+Y7iZzep4E9Cw1PYgLtooI4pjZi3/sZ+zctB8yh20?=
 =?us-ascii?Q?S0sz5MJEFih32avSb9zCu7op7R/p0CjYucmAQY0rtY3NuwMqLMxQkVpqwB9V?=
 =?us-ascii?Q?NBzkm7YPrfjvZv/TtgepyJg9mp2fZCtrZrgQvnMzocaCTOzNqcGzSz3OXoul?=
 =?us-ascii?Q?OOBw99Ua9Kb2HScU+EAU9IWcbeX7nu4kPQ66nobCWAcu+6uAGOgdpcTwyWAG?=
 =?us-ascii?Q?O/n8/0YAd7juG36kk9lbGqYeu7E7xOUBSURONEqSXhuwvvjvnaZ1cPLX2f6M?=
 =?us-ascii?Q?wg7+3Msq0bRZrmUSCnJeQ84ERG3Gr6bmb85PMIFgMB4dUPcjfrwgt2OdNDBB?=
 =?us-ascii?Q?jfnwGCY3NO7pML66cEJ4vHZkUUopLamLcRACPwyVmHt2nwPi1O1kgzzYAjZf?=
 =?us-ascii?Q?u0DEpF1k8DQmtzshdtuLMla1mJt5j1eFfekMNAmVvqX1vedtikw2DbgRfpGQ?=
 =?us-ascii?Q?ZEz2URh/XQZUQzQ8uAiQZwHXCePb2ktqAWbzPxQerF5Z6oYHMRTHiJSLp22w?=
 =?us-ascii?Q?Yg3XE30Wb8EikWymkK1ErpxrZmek1fXL7miCn9Zp+ll7vTVMuuXUM2RMdDba?=
 =?us-ascii?Q?yigbA04R008yuwooqphgiSiELcc0NMvCaAzRQCwoLKLoEvcTQgN8OnFWEuBx?=
 =?us-ascii?Q?0U9ngZZW7Y8B2E5s0PT2yiTsgt3keMMXwpvDaVPxaJstyUBzX2uE2yXm7Ti5?=
 =?us-ascii?Q?vA=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79356db-4816-4589-aa5a-08da7e8fc82f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:28:43.1586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVjBUElPPFTV/Z3iqkSGithLf9uLn5N7oJln1/0NInfahTvx51EHljdxFrQmPz7h1aO/DTZQJqfRkII6EMrKY3STHafP+iqRr08Bx9DnGIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8134
Received-SPF: pass client-ip=40.107.8.100;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

NMD class methods with the conditional_function type like
NMD::ADDIU_32__cond, NMD::ADDIU_RS5__cond, etc. are removed from the NMD
class. They're now declared global static functions. Therefore, typedef
of the function pointer, conditional_function is defined outside of the
class.

Now that conditional_function type functions are not part of the NMD
class we can't access them using the this pointer. Thus, the use of
the this pointer has been deleted.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 42 +++++++++++++++++++++---------------------
 disas/nanomips.h   | 14 ++------------
 2 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 039c353d0b..9e720d0e8d 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -787,7 +787,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
             if ((op_code & table[i].mask) == table[i].value) {
                 /* possible match */
                 conditional_function cond = table[i].condition;
-                if ((cond == 0) || (this->*cond)(op_code)) {
+                if ((cond == 0) || (cond)(op_code)) {
                     try
                     {
                         if (table[i].type == pool) {
@@ -1685,28 +1685,28 @@ static uint64 extract_u_3_2_1_0__s1(uint64 instruction)
 
 
 
-bool NMD::ADDIU_32__cond(uint64 instruction)
+static bool ADDIU_32__cond(uint64 instruction)
 {
     uint64 rt = extract_rt_25_24_23_22_21(instruction);
     return rt != 0;
 }
 
 
-bool NMD::ADDIU_RS5__cond(uint64 instruction)
+static bool ADDIU_RS5__cond(uint64 instruction)
 {
     uint64 rt = extract_rt_9_8_7_6_5(instruction);
     return rt != 0;
 }
 
 
-bool NMD::BALRSC_cond(uint64 instruction)
+static bool BALRSC_cond(uint64 instruction)
 {
     uint64 rt = extract_rt_25_24_23_22_21(instruction);
     return rt != 0;
 }
 
 
-bool NMD::BEQC_16__cond(uint64 instruction)
+static bool BEQC_16__cond(uint64 instruction)
 {
     uint64 rs3 = extract_rs3_6_5_4(instruction);
     uint64 rt3 = extract_rt3_9_8_7(instruction);
@@ -1715,7 +1715,7 @@ bool NMD::BEQC_16__cond(uint64 instruction)
 }
 
 
-bool NMD::BNEC_16__cond(uint64 instruction)
+static bool BNEC_16__cond(uint64 instruction)
 {
     uint64 rs3 = extract_rs3_6_5_4(instruction);
     uint64 rt3 = extract_rt3_9_8_7(instruction);
@@ -1724,35 +1724,35 @@ bool NMD::BNEC_16__cond(uint64 instruction)
 }
 
 
-bool NMD::MOVE_cond(uint64 instruction)
+static bool MOVE_cond(uint64 instruction)
 {
     uint64 rt = extract_rt_9_8_7_6_5(instruction);
     return rt != 0;
 }
 
 
-bool NMD::P16_BR1_cond(uint64 instruction)
+static bool P16_BR1_cond(uint64 instruction)
 {
     uint64 u = extract_u_3_2_1_0__s1(instruction);
     return u != 0;
 }
 
 
-bool NMD::PREF_S9__cond(uint64 instruction)
+static bool PREF_S9__cond(uint64 instruction)
 {
     uint64 hint = extract_hint_25_24_23_22_21(instruction);
     return hint != 31;
 }
 
 
-bool NMD::PREFE_cond(uint64 instruction)
+static bool PREFE_cond(uint64 instruction)
 {
     uint64 hint = extract_hint_25_24_23_22_21(instruction);
     return hint != 31;
 }
 
 
-bool NMD::SLTU_cond(uint64 instruction)
+static bool SLTU_cond(uint64 instruction)
 {
     uint64 rd = extract_rd_15_14_13_12_11(instruction);
     return rd != 0;
@@ -16705,7 +16705,7 @@ NMD::Pool NMD::P_ADDIU[2] = {
        0xffe00000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.RI */
     { instruction         , 0                   , 0   , 32,
-       0xfc000000, 0x00000000, &NMD::ADDIU_32_        , &NMD::ADDIU_32__cond   ,
+       0xfc000000, 0x00000000, &NMD::ADDIU_32_        , &ADDIU_32__cond   ,
        0x0                 },        /* ADDIU[32] */
 };
 
@@ -16803,7 +16803,7 @@ NMD::Pool NMD::P_SLTU[2] = {
        0xfc00fbff, 0x20000390, 0                      , 0,
        0x0                 },        /* P.DVP */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000390, &NMD::SLTU             , &NMD::SLTU_cond        ,
+       0xfc0003ff, 0x20000390, &NMD::SLTU             , &SLTU_cond        ,
        0x0                 },        /* SLTU */
 };
 
@@ -21348,7 +21348,7 @@ NMD::Pool NMD::P_PREF_S9_[2] = {
        0xffe07f00, 0xa7e01800, &NMD::SYNCI            , 0,
        0x0                 },        /* SYNCI */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001800, &NMD::PREF_S9_         , &NMD::PREF_S9__cond    ,
+       0xfc007f00, 0xa4001800, &NMD::PREF_S9_         , &PREF_S9__cond    ,
        0x0                 },        /* PREF[S9] */
 };
 
@@ -21560,7 +21560,7 @@ NMD::Pool NMD::P_PREFE[2] = {
        0xffe07f00, 0xa7e01a00, &NMD::SYNCIE           , 0,
        CP0_ | EVA_         },        /* SYNCIE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001a00, &NMD::PREFE            , &NMD::PREFE_cond       ,
+       0xfc007f00, 0xa4001a00, &NMD::PREFE            , &PREFE_cond       ,
        CP0_ | EVA_         },        /* PREFE */
 };
 
@@ -21732,7 +21732,7 @@ NMD::Pool NMD::P_BALRSC[2] = {
        0xffe0f000, 0x48008000, &NMD::BRSC             , 0,
        0x0                 },        /* BRSC */
     { call_instruction    , 0                   , 0   , 32,
-       0xfc00f000, 0x48008000, &NMD::BALRSC           , &NMD::BALRSC_cond      ,
+       0xfc00f000, 0x48008000, &NMD::BALRSC           , &BALRSC_cond      ,
        0x0                 },        /* BALRSC */
 };
 
@@ -22080,7 +22080,7 @@ NMD::Pool NMD::P16_MV[2] = {
        0xffe0    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x1000    , &NMD::MOVE             , &NMD::MOVE_cond        ,
+       0xfc00    , 0x1000    , &NMD::MOVE             , &MOVE_cond        ,
        0x0                 },        /* MOVE */
 };
 
@@ -22146,7 +22146,7 @@ NMD::Pool NMD::P_ADDIU_RS5_[2] = {
        0xffe8    , 0x9008    , &NMD::NOP_16_          , 0,
        0x0                 },        /* NOP[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x9008    , &NMD::ADDIU_RS5_       , &NMD::ADDIU_RS5__cond  ,
+       0xfc08    , 0x9008    , &NMD::ADDIU_RS5_       , &ADDIU_RS5__cond  ,
        0x0                 },        /* ADDIU[RS5] */
 };
 
@@ -22183,10 +22183,10 @@ NMD::Pool NMD::P16_JRC[2] = {
 
 NMD::Pool NMD::P16_BR1[2] = {
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0xd800    , &NMD::BEQC_16_         , &NMD::BEQC_16__cond    ,
+       0xfc00    , 0xd800    , &NMD::BEQC_16_         , &BEQC_16__cond    ,
        XMMS_               },        /* BEQC[16] */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0xd800    , &NMD::BNEC_16_         , &NMD::BNEC_16__cond    ,
+       0xfc00    , 0xd800    , &NMD::BNEC_16_         , &BNEC_16__cond    ,
        XMMS_               },        /* BNEC[16] */
 };
 
@@ -22196,7 +22196,7 @@ NMD::Pool NMD::P16_BR[2] = {
        0xfc0f    , 0xd800    , 0                      , 0,
        0x0                 },        /* P16.JRC */
     { pool                , P16_BR1             , 2   , 16,
-       0xfc00    , 0xd800    , 0                      , &NMD::P16_BR1_cond     ,
+       0xfc00    , 0xd800    , 0                      , &P16_BR1_cond     ,
        0x0                 },        /* P16.BR1 */
 };
 
diff --git a/disas/nanomips.h b/disas/nanomips.h
index a795ed44e8..0e6670adf5 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -31,6 +31,8 @@ typedef uint32_t uint32;
 typedef uint16_t uint16;
 typedef uint64_t img_address;
 
+typedef bool(*conditional_function)(uint64 instruction);
+
 enum TABLE_ENTRY_TYPE {
     instruction,
     call_instruction,
@@ -71,7 +73,6 @@ public:
 private:
 
     typedef std::string(NMD:: *disassembly_function)(uint64 instruction);
-    typedef bool(NMD:: *conditional_function)(uint64 instruction);
 
     struct Pool {
         TABLE_ENTRY_TYPE     type;
@@ -89,17 +90,6 @@ private:
     int Disassemble(const uint16 *data, std::string & dis,
                     TABLE_ENTRY_TYPE & type, const Pool *table, int table_size);
 
-    bool ADDIU_32__cond(uint64 instruction);
-    bool ADDIU_RS5__cond(uint64 instruction);
-    bool BALRSC_cond(uint64 instruction);
-    bool BEQC_16__cond(uint64 instruction);
-    bool BNEC_16__cond(uint64 instruction);
-    bool MOVE_cond(uint64 instruction);
-    bool P16_BR1_cond(uint64 instruction);
-    bool PREF_S9__cond(uint64 instruction);
-    bool PREFE_cond(uint64 instruction);
-    bool SLTU_cond(uint64 instruction);
-
     std::string ABS_D(uint64 instruction);
     std::string ABS_S(uint64 instruction);
     std::string ABSQ_S_PH(uint64 instruction);
-- 
2.25.1


