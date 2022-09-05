Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF375AD0AD
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:54:32 +0200 (CEST)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9kN-0003mg-Sl
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8x4-0006Ma-Eo
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:03:41 -0400
Received: from mail-db8eur05on2114.outbound.protection.outlook.com
 ([40.107.20.114]:64833 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8wy-0002dU-IJ
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:03:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUwwLF97aAXQpLbfUWRn8Ec5tSLAIeqXmzaYoiUJEqRJ+flMCyVY9nmzbBmDYMKDPGkfFm4LuZhlIKEEUPuHAbSrxRSD4TykZao2TID/amcLUeOTjEoTRaSbpjRccEvDeXw6FZDbwUd/Jzbq74vCRTfoHVgP2KnC3A/fEH1CHCYApW/pcyfmvCFEiojtjXkKOIpFizW1pgBlEYxjpCsU5aacDi8GWr79vz3qSDEMVIZT2qythDjmBtvmWptBbjD6pmBDcBdsj8TYiVWhlFaFadi/MosTIRZ8YMvTApdO/C6h1KXM2ZOEmHdDNxvJDYsmFcyDtEFAFeLntnqbSET+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVy5KECXp2aqXMRewhfdAR6V523W0tutyH1/N6sRQC4=;
 b=T2oOPapWt/xplk+O2bGHVW8jXpK38u0boN1T/5b92FxfEE7Qeoo33i5rmb5MczrVR9BqyeJmDVN1g2uZFQWRHvSqJfXIqGBZUtNkCmrI4os2Jhz4xTP0QtUqO/2amXs4VD+jHJyiQuUO4sQp2uyKs/LpfGCqY+t+xpibV8B1C+3P0uNLmFYzviY54MfN1FKxwC5+QiNyL/30YTcQkCixyqcfvRp5L/xYZ9QErmsc21P6f3lTn/j/0sNPednTYDtg1v+vNGQTWKbROAbwZ/l97ziB9ZHMJf3Q6W9kIKgZENgCjwuKiPwTsA1/ZNlesFDKQ/5CeIyF2ZRwA8gz0ljP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVy5KECXp2aqXMRewhfdAR6V523W0tutyH1/N6sRQC4=;
 b=LodbKIgS6tKYnWuH7aqpaZWCOBg6r8kbnxvH9CB62KsBcinAUKDTeDmuYYLZdKQNYdmXuNhr3cD6itjdU0XRHFTd54JhQR7/YhPLWFePj7kNz4DnWZkOKX4ElDIAroAc+c6Eps3nQa6/rM3ky4o9dG2kwojFDiVCYmi2qO7TrKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by VI1PR03MB3871.eurprd03.prod.outlook.com (2603:10a6:803:6c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 10:02:46 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 10:02:46 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 15/20] disas/nanomips: Introduce Dis_info struct
Date: Mon,  5 Sep 2022 11:55:17 +0200
Message-Id: <20220905095522.66941-16-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4712967e-5777-44dd-4747-08da8f25c808
X-MS-TrafficTypeDiagnostic: VI1PR03MB3871:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5dWtpABmxVS+aM4XYPg/bqzf6NPDaxYqLdCLY0hN1+snmhgTwTNqf9FeAh6Hd5ejG8hOLPictmj/JBPeq4wU4QPMAy82FJc8DpujtI3cpggj10VHPgvVIs+diS6HOupp/DYuA2aTf3CdEzyFtUMzYHMMG4+ZpiA6GoVQ058RbBo/P7sOIBvgzn+x7rflnBeM7R1kxFFf6c8U6jdNQp+1h23Dz7ba8hkV2czl7dIcy/7vOtiuPwtK7p7PYbpT2S0rViEYOOVjIVztIziM8FqbXvSo7IKHabrnM9nTDzkRswn61eASPtNdUMq9s+yemONHJDvtSuZS/udwJZKhlGUVyzmCLuNvqkIMwBwe1rMpw4niDjxjnGLVsM25ou6HF1UyE7zUVcleEzTMB9oZuUUt0nKuvXCyf7ThNPeneewiEUo/uyjCmALP79V1aJ+FAUYWNlUqe5pjWxw+3E5TDmCwg/klovKwPLlsaegvwM3vZiOm7Fypo4rmnF0rK4dNKBaE2LRHOQqB+62r/nBQHK+KhGfzxr8AqkUGVaBiI6XuUxbN0N1igR0d3s9mFvs81P7AEXZrNPQVgQPoRSw/gnRcKCx4Fv7hWLBR5FYiWyTyOQ0BuugM2a6s82K/UaPU5bKpCAT8VmGYaR92F+QksVYu0DLTcH/gJNVbQou6LkiVsyi+WAp24za8YIxBDSgUZNpx9Tzl0VA9dN0wGrfYz0O4CY3TBdiz3yuz/Wljk7choZsmK1y24Sgw37VDLW866FUz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(136003)(346002)(39830400003)(376002)(1076003)(186003)(478600001)(41300700001)(6506007)(107886003)(6666004)(52116002)(86362001)(2616005)(6486002)(38350700002)(6512007)(83380400001)(38100700002)(30864003)(316002)(26005)(6916009)(8936002)(2906002)(8676002)(4326008)(66946007)(66476007)(36756003)(66556008)(5660300002)(44832011)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yl7b0KKnANhgViSSZFkhaVrm3p/+SF1NwjXqQ8INmeiRqmsL7DPKwfVr7CUS?=
 =?us-ascii?Q?v3xcCWq6DLBMed1r+AAsHjwOzgimWeLFGmLpSFMp1q/Tb47klVJgvNXIrt27?=
 =?us-ascii?Q?1smAB93LGmZNsST1vcLadH1t6ZcdYglCrnA9PbqvOEemZKeGrmOcwAaLRwwm?=
 =?us-ascii?Q?lAUMOAqB7FGFEQQ2eD+RdRcwkVdHQLFr29AuUAakQ0gFwFjvOsLEDE5ULZvh?=
 =?us-ascii?Q?UDoSrp9L/wDkToGIPmjxdazlvXlAMbMXMZCMeW6bspQTUxG+28RIOHmT5DEK?=
 =?us-ascii?Q?bbnR6wNlRmkmJ/zsqHKmnd67RrbDhpPw4vWbcfmyftXHlpSWoq0Xxm0r5KA1?=
 =?us-ascii?Q?hyuvtjcEoYeD/0Y3Eo/w8RbqDVB7J7yhfIPcHj0NA9JNmT5IBvahg4uhf7BS?=
 =?us-ascii?Q?uxfLocU3O/Pk5uf3WI+kDOqiPS7SRRsRDUGg0CTvleh9H2qKqMJTbpcZHgL8?=
 =?us-ascii?Q?sLurBbZzrfg0pDJBlFbpZuuzgKVuwXtAyuCtUFffbAyxwdfYO4mjYPTciQcP?=
 =?us-ascii?Q?Cc1/ESYjUXyA9JdgNUvZFVGG5GV6uQ0BhLrSXmNKbeR6YRUOvYpslEuwc9uz?=
 =?us-ascii?Q?BMNemi3I0nVNRantjK6t9asKX9HfZB/EwHwqbKH5SKLZrHAKiZepmEQUC/2d?=
 =?us-ascii?Q?V/qp4Ohk2sRQguB3M64cvS8n7cTitcIR4hplb2ddx/bKpM+dAAaxgib/Vonn?=
 =?us-ascii?Q?MSSMdfknLnTA4YFjj2ZYWdKhJWLzdu9Jz2/nN+70RNtu5wjN6ZnDQ/YTkl+0?=
 =?us-ascii?Q?L35n4A7hf4p1O+65IVuohxdwSJcXaHudc8rCOZkb3j+svbVgLjT/jaI3aPzt?=
 =?us-ascii?Q?sBWIfT+PNoCMSmWnbzraZt2IroXC5uprI2uklPaBtqLuVmLKE9aghco8acPW?=
 =?us-ascii?Q?PGEMYHG3djiFYRTrxCn5f/F7pAMphJj2LmynNc8qTukT+Bx2g6uVDduPseI2?=
 =?us-ascii?Q?HJK5BYsmEdvx62DS2vRvCdw5G7nwR6bKT9ZwPWK8EhXhUtniz08t3PlZiXMS?=
 =?us-ascii?Q?l370uE2L0VeY4ZwG3wngiRBTn5Muou47jhaJzaAz5pyLDr6d22vG1nlZms1G?=
 =?us-ascii?Q?A6RvnLIxEOyMYS20peodIZ5A4h2ANjxklLqbI8qmk1Vn1m7tHDxxSZBG6PED?=
 =?us-ascii?Q?0afwFErOp5nCnrRoR1Ax1873Oz0IgQj4IAZUxC7ac3a1K9y6bqHZCIXtiCcm?=
 =?us-ascii?Q?V5ZppnCkEhk5iIembAu5feLO69T/H0lNRZmztVkZM/OZPiUKfbp5I/5RHWXe?=
 =?us-ascii?Q?9ZfoWO9EFqo/GVqpORCNWfxSBjWlV5Q1jaj6kl0KFS8LUL2XMQg6rTyBqyTc?=
 =?us-ascii?Q?hHiXw73p45TfEsA4T5mQu1DLN86HbLovuHqILdfHLCGDSFRK0TPnNTKDa4W2?=
 =?us-ascii?Q?XyMBtXAw9iLedKemQ7VdV4LXd5WOXuhHwlmgjTGsn0pH6TZ3ThIXzXmnCD0c?=
 =?us-ascii?Q?omM6wpExU7LudNwMM5p3NSi5z2QDm8G+vUlQZbq/bvWAJwD/Ln9ncZPtifOW?=
 =?us-ascii?Q?hrDtRT6s14lF4qLxqOnpt9OfiomaG3OVIcE435QBxP6KL+HMkQOad3qg1d6p?=
 =?us-ascii?Q?tnSObY5NnhzBGvoJTC/zs92RewmW7rMyT0y0vJZL8Mq/n8gwCb0gWUPdepLC?=
 =?us-ascii?Q?Iw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4712967e-5777-44dd-4747-08da8f25c808
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:02:46.6081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZt1sGHyebEMTCB5yKQ2VlcTpKsFoJ4fa9xQjz5fokc0/X+YklbJUt+2aKnVTNHH0lUPbN66rfLT2pQh6fJPPkBS/2s4VovgI3PQTHXc1ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3871
Received-SPF: pass client-ip=40.107.20.114;
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

This patch introduces the Dis_info struct, which should hold the
necessary data for handling runtime errors. Fields fprintf_func and
stream are in charge of error printing. Field buf enables the use of
sigsetjmp() and siglongjmp() functions. Support for runtime error
handling will be added later.

Parameter m_pc, which we need for address calculation, is integrated
into the Dis_info struct.

We're filling Dis_info at the entrance of the nanoMIPS disassembler,
i.e. print_insn_nanomips. Next, we're adding that information as an
argument wherever we need to.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 4083 ++++++++++++++++++++++----------------------
 1 file changed, 2050 insertions(+), 2033 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 9e34ca164c..5142f307fc 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -41,9 +41,16 @@ typedef uint32_t uint32;
 typedef uint16_t uint16;
 typedef uint64_t img_address;
 
+struct Dis_info {
+  img_address m_pc;
+  fprintf_function fprintf_func;
+  FILE *stream;
+  sigjmp_buf buf;
+};
+
 typedef bool (*conditional_function)(uint64 instruction);
 typedef char * (*disassembly_function)(uint64 instruction,
-                                       img_address m_pc);
+                                       struct Dis_info *info);
 
 enum TABLE_ENTRY_TYPE {
     instruction,
@@ -86,6 +93,7 @@ struct Pool {
     uint64               attributes;
 };
 
+
 #define IMGASSERTONCE(test)
 
 
@@ -120,7 +128,7 @@ static int64 sign_extend(int64 data, int msb)
 
 
 static uint64 renumber_registers(uint64 index, uint64 *register_list,
-                               size_t register_list_size)
+                            size_t register_list_size, struct Dis_info *info)
 {
     if (index < register_list_size) {
         return register_list[index];
@@ -159,12 +167,12 @@ static uint64 renumber_registers(uint64 index, uint64 *register_list,
  *     - MUL[4X4]
  *     - SW[4X4]
  */
-static uint64 decode_gpr_gpr4(uint64 d)
+static uint64 decode_gpr_gpr4(uint64 d, struct Dis_info *info)
 {
     static uint64 register_list[] = {  8,  9, 10, 11,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -195,12 +203,12 @@ static uint64 decode_gpr_gpr4(uint64 d)
  *     - MOVEP
  *     - SW[4X4]
  */
-static uint64 decode_gpr_gpr4_zero(uint64 d)
+static uint64 decode_gpr_gpr4_zero(uint64 d, struct Dis_info *info)
 {
     static uint64 register_list[] = {  8,  9, 10,  0,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -254,11 +262,11 @@ static uint64 decode_gpr_gpr4_zero(uint64 d)
  *     - SW[16]
  *     - XOR[16]
  */
-static uint64 decode_gpr_gpr3(uint64 d)
+static uint64 decode_gpr_gpr3(uint64 d, struct Dis_info *info)
 {
     static uint64 register_list[] = { 16, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -294,11 +302,11 @@ static uint64 decode_gpr_gpr3(uint64 d)
  *     - SW[16]
  *     - SW[GP16]
  */
-static uint64 decode_gpr_gpr3_src_store(uint64 d)
+static uint64 decode_gpr_gpr3_src_store(uint64 d, struct Dis_info *info)
 {
     static uint64 register_list[] = {  0, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -324,11 +332,11 @@ static uint64 decode_gpr_gpr3_src_store(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-static uint64 decode_gpr_gpr2_reg1(uint64 d)
+static uint64 decode_gpr_gpr2_reg1(uint64 d, struct Dis_info *info)
 {
     static uint64 register_list[] = {  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -354,11 +362,11 @@ static uint64 decode_gpr_gpr2_reg1(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-static uint64 decode_gpr_gpr2_reg2(uint64 d)
+static uint64 decode_gpr_gpr2_reg2(uint64 d, struct Dis_info *info)
 {
     static uint64 register_list[] = {  5,  6,  7,  8 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -383,11 +391,11 @@ static uint64 decode_gpr_gpr2_reg2(uint64 d)
  *
  *     - MOVE.BALC
  */
-static uint64 decode_gpr_gpr1(uint64 d)
+static uint64 decode_gpr_gpr1(uint64 d, struct Dis_info *info)
 {
     static uint64 register_list[] = {  4,  5 };
     return renumber_registers(d, register_list,
-               sizeof(register_list) / sizeof(register_list[0]));
+               sizeof(register_list) / sizeof(register_list[0]), info);
 }
 
 
@@ -410,16 +418,16 @@ static int64 neg_copy(uint64 d)
 
 
 /* strange wrapper around  gpr3 */
-static uint64 encode_rs3_and_check_rs3_ge_rt3(uint64 d)
+static uint64 encode_rs3_and_check_rs3_ge_rt3(uint64 d, struct Dis_info *info)
 {
-return decode_gpr_gpr3(d);
+return decode_gpr_gpr3(d, info);
 }
 
 
 /* strange wrapper around  gpr3 */
-static uint64 encode_rs3_and_check_rs3_lt_rt3(uint64 d)
+static uint64 encode_rs3_and_check_rs3_lt_rt3(uint64 d, struct Dis_info *info)
 {
-    return decode_gpr_gpr3(d);
+    return decode_gpr_gpr3(d, info);
 }
 
 
@@ -493,7 +501,7 @@ static uint64 encode_lsb_from_pos_and_size(uint64 d)
 }
 
 
-static const char *GPR(uint64 reg)
+static const char *GPR(uint64 reg, struct Dis_info *info)
 {
     static const char *gpr_reg[32] = {
         "zero", "at",   "v0",   "v1",   "a0",   "a1",   "a2",   "a3",
@@ -511,7 +519,8 @@ static const char *GPR(uint64 reg)
 }
 
 
-static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
+static char *save_restore_list(uint64 rt, uint64 count, uint64 gp,
+                               struct Dis_info *info)
 {
     /*
      * Currently, this file compiles as a cpp file, so the explicit cast here
@@ -523,7 +532,7 @@ static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
     for (uint64 counter = 0; counter != count; counter++) {
         bool use_gp = gp && (counter == count - 1);
         uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
-        g_autofree char *dis_str = img_format(",%s", GPR(this_rt));
+        g_autofree char *dis_str = img_format(",%s", GPR(this_rt, info), info);
         strcat(str, dis_str);
     }
 
@@ -531,7 +540,7 @@ static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
 }
 
 
-static const char *FPR(uint64 reg)
+static const char *FPR(uint64 reg, struct Dis_info *info)
 {
     static const char *fpr_reg[32] = {
         "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
@@ -549,7 +558,7 @@ static const char *FPR(uint64 reg)
 }
 
 
-static const char *AC(uint64 reg)
+static const char *AC(uint64 reg, struct Dis_info *info)
 {
     static const char *ac_reg[4] = {
         "ac0",  "ac1",  "ac2",  "ac3"
@@ -620,7 +629,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
  */
 static int Disassemble(const uint16 *data, char *dis,
                        TABLE_ENTRY_TYPE & type, const Pool *table,
-                       int table_size, img_address m_pc)
+                       int table_size, struct Dis_info *info)
 {
     try
     {
@@ -636,7 +645,7 @@ static int Disassemble(const uint16 *data, char *dis,
                         if (table[i].type == pool) {
                             return Disassemble(data, dis, type,
                                                table[i].next_table,
-                                               table[i].next_table_size, m_pc);
+                                               table[i].next_table_size, info);
                         } else if ((table[i].type == instruction) ||
                                    (table[i].type == call_instruction) ||
                                    (table[i].type == branch_instruction) ||
@@ -658,7 +667,7 @@ static int Disassemble(const uint16 *data, char *dis,
                                 return -6;
                             }
                             type = table[i].type;
-                            g_autofree char *dis_str = dis_fn(op_code, m_pc);
+                            g_autofree char *dis_str = dis_fn(op_code, info);
                             strcpy(dis, dis_str);
                             return table[i].instructions_size;
                         } else {
@@ -1614,13 +1623,13 @@ static bool SLTU_cond(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-static char *ABS_D(uint64 instruction, img_address m_pc)
+static char *ABS_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *fd = FPR(copy_ui(fd_value), info);
 
     return img_format("ABS.D %s, %s", fd, fs);
 }
@@ -1636,13 +1645,13 @@ static char *ABS_D(uint64 instruction, img_address m_pc)
  *               fd -----
  *                    fs -----
  */
-static char *ABS_S(uint64 instruction, img_address m_pc)
+static char *ABS_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *fd = FPR(copy_ui(fd_value), info);
 
     return img_format("ABS.S %s, %s", fd, fs);
 }
@@ -1658,13 +1667,13 @@ static char *ABS_S(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *ABSQ_S_PH(uint64 instruction, img_address m_pc)
+static char *ABSQ_S_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("ABSQ_S.PH %s, %s", rt, rs);
 }
@@ -1680,13 +1689,13 @@ static char *ABSQ_S_PH(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *ABSQ_S_QB(uint64 instruction, img_address m_pc)
+static char *ABSQ_S_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("ABSQ_S.QB %s, %s", rt, rs);
 }
@@ -1702,13 +1711,13 @@ static char *ABSQ_S_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *ABSQ_S_W(uint64 instruction, img_address m_pc)
+static char *ABSQ_S_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("ABSQ_S.W %s, %s", rt, rs);
 }
@@ -1723,7 +1732,7 @@ static char *ABSQ_S_W(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *ACLR(uint64 instruction, img_address m_pc)
+static char *ACLR(uint64 instruction, struct Dis_info *info)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1731,7 +1740,7 @@ static char *ACLR(uint64 instruction, img_address m_pc)
 
     g_autofree char *bit = IMMEDIATE_UI(copy_ui(bit_value));
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("ACLR %s, %s(%s)", bit, s, rs);
 }
@@ -1746,15 +1755,15 @@ static char *ACLR(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *ADD(uint64 instruction, img_address m_pc)
+static char *ADD(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADD %s, %s, %s", rd, rs, rt);
 }
@@ -1771,15 +1780,15 @@ static char *ADD(uint64 instruction, img_address m_pc)
  *               fs -----
  *                    fd -----
  */
-static char *ADD_D(uint64 instruction, img_address m_pc)
+static char *ADD_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *fd = FPR(copy_ui(fd_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *fd = FPR(copy_ui(fd_value), info);
 
     return img_format("ADD.D %s, %s, %s", fd, fs, ft);
 }
@@ -1796,15 +1805,15 @@ static char *ADD_D(uint64 instruction, img_address m_pc)
  *               fs -----
  *                    fd -----
  */
-static char *ADD_S(uint64 instruction, img_address m_pc)
+static char *ADD_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *fd = FPR(copy_ui(fd_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *fd = FPR(copy_ui(fd_value), info);
 
     return img_format("ADD.S %s, %s, %s", fd, fs, ft);
 }
@@ -1819,14 +1828,14 @@ static char *ADD_S(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *ADDIU_32_(uint64 instruction, img_address m_pc)
+static char *ADDIU_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_15_to_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
@@ -1842,12 +1851,12 @@ static char *ADDIU_32_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *ADDIU_48_(uint64 instruction, img_address m_pc)
+static char *ADDIU_48_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("ADDIU %s, %s", rt, s);
@@ -1863,12 +1872,12 @@ static char *ADDIU_48_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *ADDIU_GP48_(uint64 instruction, img_address m_pc)
+static char *ADDIU_GP48_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, s);
@@ -1884,12 +1893,12 @@ static char *ADDIU_GP48_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *ADDIU_GP_B_(uint64 instruction, img_address m_pc)
+static char *ADDIU_GP_B_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
@@ -1905,12 +1914,12 @@ static char *ADDIU_GP_B_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *ADDIU_GP_W_(uint64 instruction, img_address m_pc)
+static char *ADDIU_GP_W_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
@@ -1926,14 +1935,14 @@ static char *ADDIU_GP_W_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *ADDIU_NEG_(uint64 instruction, img_address m_pc)
+static char *ADDIU_NEG_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *u = IMMEDIATE_I(neg_copy(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
@@ -1949,12 +1958,12 @@ static char *ADDIU_NEG_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *ADDIU_R1_SP_(uint64 instruction, img_address m_pc)
+static char *ADDIU_R1_SP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 u_value = extract_u_5_4_3_2_1_0__s2(instruction);
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt3, 29, u);
@@ -1970,14 +1979,14 @@ static char *ADDIU_R1_SP_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *ADDIU_R2_(uint64 instruction, img_address m_pc)
+static char *ADDIU_R2_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1_0__s2(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt3, rs3, u);
@@ -1992,12 +2001,12 @@ static char *ADDIU_R2_(uint64 instruction, img_address m_pc)
  *     rt -----
  *           s - ---
  */
-static char *ADDIU_RS5_(uint64 instruction, img_address m_pc)
+static char *ADDIU_RS5_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("ADDIU %s, %s", rt, s);
@@ -2014,13 +2023,13 @@ static char *ADDIU_RS5_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDIUPC_32_(uint64 instruction, img_address m_pc)
+static char *ADDIUPC_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2036,13 +2045,13 @@ static char *ADDIUPC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDIUPC_48_(uint64 instruction, img_address m_pc)
+static char *ADDIUPC_48_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, info->m_pc);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2058,15 +2067,15 @@ static char *ADDIUPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDQ_PH(uint64 instruction, img_address m_pc)
+static char *ADDQ_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2083,15 +2092,15 @@ static char *ADDQ_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDQ_S_PH(uint64 instruction, img_address m_pc)
+static char *ADDQ_S_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2107,15 +2116,15 @@ static char *ADDQ_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDQ_S_W(uint64 instruction, img_address m_pc)
+static char *ADDQ_S_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -2132,15 +2141,15 @@ static char *ADDQ_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDQH_PH(uint64 instruction, img_address m_pc)
+static char *ADDQH_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2157,15 +2166,15 @@ static char *ADDQH_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDQH_R_PH(uint64 instruction, img_address m_pc)
+static char *ADDQH_R_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2182,15 +2191,15 @@ static char *ADDQH_R_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDQH_R_W(uint64 instruction, img_address m_pc)
+static char *ADDQH_R_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -2207,15 +2216,15 @@ static char *ADDQH_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDQH_W(uint64 instruction, img_address m_pc)
+static char *ADDQH_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -2231,15 +2240,15 @@ static char *ADDQH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDSC(uint64 instruction, img_address m_pc)
+static char *ADDSC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDSC %s, %s, %s", rd, rs, rt);
 }
@@ -2254,15 +2263,15 @@ static char *ADDSC(uint64 instruction, img_address m_pc)
  *       rs3 ---
  *          rd3 ---
  */
-static char *ADDU_16_(uint64 instruction, img_address m_pc)
+static char *ADDU_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value, info), info);
 
     return img_format("ADDU %s, %s, %s", rd3, rs3, rt3);
 }
@@ -2278,15 +2287,15 @@ static char *ADDU_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDU_32_(uint64 instruction, img_address m_pc)
+static char *ADDU_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDU %s, %s, %s", rd, rs, rt);
 }
@@ -2302,13 +2311,13 @@ static char *ADDU_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDU_4X4_(uint64 instruction, img_address m_pc)
+static char *ADDU_4X4_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value, info), info);
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value, info), info);
 
     return img_format("ADDU %s, %s", rs4, rt4);
 }
@@ -2324,15 +2333,15 @@ static char *ADDU_4X4_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDU_PH(uint64 instruction, img_address m_pc)
+static char *ADDU_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2348,15 +2357,15 @@ static char *ADDU_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDU_QB(uint64 instruction, img_address m_pc)
+static char *ADDU_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2373,15 +2382,15 @@ static char *ADDU_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDU_S_PH(uint64 instruction, img_address m_pc)
+static char *ADDU_S_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2397,15 +2406,15 @@ static char *ADDU_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDU_S_QB(uint64 instruction, img_address m_pc)
+static char *ADDU_S_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2422,15 +2431,15 @@ static char *ADDU_S_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDUH_QB(uint64 instruction, img_address m_pc)
+static char *ADDUH_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2447,15 +2456,15 @@ static char *ADDUH_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDUH_R_QB(uint64 instruction, img_address m_pc)
+static char *ADDUH_R_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2470,15 +2479,15 @@ static char *ADDUH_R_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ADDWC(uint64 instruction, img_address m_pc)
+static char *ADDWC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ADDWC %s, %s, %s", rd, rs, rt);
 }
@@ -2494,13 +2503,13 @@ static char *ADDWC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ALUIPC(uint64 instruction, img_address m_pc)
+static char *ALUIPC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
 }
@@ -2515,13 +2524,13 @@ static char *ALUIPC(uint64 instruction, img_address m_pc)
  *       rs3 ---
  *           eu ----
  */
-static char *AND_16_(uint64 instruction, img_address m_pc)
+static char *AND_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("AND %s, %s", rs3, rt3);
 }
@@ -2537,15 +2546,15 @@ static char *AND_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *AND_32_(uint64 instruction, img_address m_pc)
+static char *AND_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("AND %s, %s, %s", rd, rs, rt);
 }
@@ -2560,14 +2569,14 @@ static char *AND_32_(uint64 instruction, img_address m_pc)
  *       rs3 ---
  *           eu ----
  */
-static char *ANDI_16_(uint64 instruction, img_address m_pc)
+static char *ANDI_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 eu_value = extract_eu_3_2_1_0(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
     g_autofree char *eu = IMMEDIATE_UI(encode_eu_from_u_andi16(eu_value));
 
     return img_format("ANDI %s, %s, %s", rt3, rs3, eu);
@@ -2584,14 +2593,14 @@ static char *ANDI_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ANDI_32_(uint64 instruction, img_address m_pc)
+static char *ANDI_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ANDI %s, %s, %s", rt, rs, u);
@@ -2608,14 +2617,14 @@ static char *ANDI_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *APPEND(uint64 instruction, img_address m_pc)
+static char *APPEND(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("APPEND %s, %s, %s", rt, rs, sa);
@@ -2632,7 +2641,7 @@ static char *APPEND(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ASET(uint64 instruction, img_address m_pc)
+static char *ASET(uint64 instruction, struct Dis_info *info)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2640,7 +2649,7 @@ static char *ASET(uint64 instruction, img_address m_pc)
 
     g_autofree char *bit = IMMEDIATE_UI(copy_ui(bit_value));
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("ASET %s, %s(%s)", bit, s, rs);
 }
@@ -2656,11 +2665,11 @@ static char *ASET(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BALC_16_(uint64 instruction, img_address m_pc)
+static char *BALC_16_(uint64 instruction, struct Dis_info *info)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 2, info->m_pc);
 
     return img_format("BALC %s", s);
 }
@@ -2676,11 +2685,11 @@ static char *BALC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BALC_32_(uint64 instruction, img_address m_pc)
+static char *BALC_32_(uint64 instruction, struct Dis_info *info)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BALC %s", s);
 }
@@ -2696,13 +2705,13 @@ static char *BALC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BALRSC(uint64 instruction, img_address m_pc)
+static char *BALRSC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("BALRSC %s, %s", rt, rs);
 }
@@ -2718,15 +2727,15 @@ static char *BALRSC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BBEQZC(uint64 instruction, img_address m_pc)
+static char *BBEQZC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *bit = IMMEDIATE_UI(copy_ui(bit_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BBEQZC %s, %s, %s", rt, bit, s);
 }
@@ -2742,15 +2751,15 @@ static char *BBEQZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BBNEZC(uint64 instruction, img_address m_pc)
+static char *BBNEZC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *bit = IMMEDIATE_UI(copy_ui(bit_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BBNEZC %s, %s, %s", rt, bit, s);
 }
@@ -2766,11 +2775,11 @@ static char *BBNEZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BC_16_(uint64 instruction, img_address m_pc)
+static char *BC_16_(uint64 instruction, struct Dis_info *info)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 2, info->m_pc);
 
     return img_format("BC %s", s);
 }
@@ -2786,11 +2795,11 @@ static char *BC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BC_32_(uint64 instruction, img_address m_pc)
+static char *BC_32_(uint64 instruction, struct Dis_info *info)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BC %s", s);
 }
@@ -2806,13 +2815,13 @@ static char *BC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BC1EQZC(uint64 instruction, img_address m_pc)
+static char *BC1EQZC(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *ft = FPR(copy_ui(ft_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BC1EQZC %s, %s", ft, s);
 }
@@ -2828,13 +2837,13 @@ static char *BC1EQZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BC1NEZC(uint64 instruction, img_address m_pc)
+static char *BC1NEZC(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *ft = FPR(copy_ui(ft_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BC1NEZC %s, %s", ft, s);
 }
@@ -2850,13 +2859,13 @@ static char *BC1NEZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BC2EQZC(uint64 instruction, img_address m_pc)
+static char *BC2EQZC(uint64 instruction, struct Dis_info *info)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     g_autofree char *ct = CPR(copy_ui(ct_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BC2EQZC %s, %s", ct, s);
 }
@@ -2872,13 +2881,13 @@ static char *BC2EQZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BC2NEZC(uint64 instruction, img_address m_pc)
+static char *BC2NEZC(uint64 instruction, struct Dis_info *info)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     g_autofree char *ct = CPR(copy_ui(ct_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BC2NEZC %s, %s", ct, s);
 }
@@ -2894,15 +2903,17 @@ static char *BC2NEZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BEQC_16_(uint64 instruction, img_address m_pc)
+static char *BEQC_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    const char *rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value));
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    g_autofree char *u = ADDRESS(encode_u_from_address(u_value), 2, m_pc);
+    const char *rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value, info),
+                          info);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    g_autofree char *u = ADDRESS(
+        encode_u_from_address(u_value), 2, info->m_pc);
 
     return img_format("BEQC %s, %s, %s", rs3, rt3, u);
 }
@@ -2918,15 +2929,15 @@ static char *BEQC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BEQC_32_(uint64 instruction, img_address m_pc)
+static char *BEQC_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BEQC %s, %s, %s", rs, rt, s);
 }
@@ -2942,15 +2953,15 @@ static char *BEQC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BEQIC(uint64 instruction, img_address m_pc)
+static char *BEQIC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BEQIC %s, %s, %s", rt, u, s);
 }
@@ -2966,13 +2977,13 @@ static char *BEQIC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BEQZC_16_(uint64 instruction, img_address m_pc)
+static char *BEQZC_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 2, info->m_pc);
 
     return img_format("BEQZC %s, %s", rt3, s);
 }
@@ -2988,15 +2999,15 @@ static char *BEQZC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BGEC(uint64 instruction, img_address m_pc)
+static char *BGEC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BGEC %s, %s, %s", rs, rt, s);
 }
@@ -3012,15 +3023,15 @@ static char *BGEC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BGEIC(uint64 instruction, img_address m_pc)
+static char *BGEIC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BGEIC %s, %s, %s", rt, u, s);
 }
@@ -3036,15 +3047,15 @@ static char *BGEIC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BGEIUC(uint64 instruction, img_address m_pc)
+static char *BGEIUC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BGEIUC %s, %s, %s", rt, u, s);
 }
@@ -3060,15 +3071,15 @@ static char *BGEIUC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BGEUC(uint64 instruction, img_address m_pc)
+static char *BGEUC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BGEUC %s, %s, %s", rs, rt, s);
 }
@@ -3084,15 +3095,15 @@ static char *BGEUC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BLTC(uint64 instruction, img_address m_pc)
+static char *BLTC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BLTC %s, %s, %s", rs, rt, s);
 }
@@ -3108,15 +3119,15 @@ static char *BLTC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BLTIC(uint64 instruction, img_address m_pc)
+static char *BLTIC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BLTIC %s, %s, %s", rt, u, s);
 }
@@ -3132,15 +3143,15 @@ static char *BLTIC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BLTIUC(uint64 instruction, img_address m_pc)
+static char *BLTIUC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BLTIUC %s, %s, %s", rt, u, s);
 }
@@ -3156,15 +3167,15 @@ static char *BLTIUC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BLTUC(uint64 instruction, img_address m_pc)
+static char *BLTUC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BLTUC %s, %s, %s", rs, rt, s);
 }
@@ -3180,15 +3191,16 @@ static char *BLTUC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BNEC_16_(uint64 instruction, img_address m_pc)
+static char *BNEC_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    const char *rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value));
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    g_autofree char *u = ADDRESS(encode_u_from_address(u_value), 2, m_pc);
+    const char *rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value, info),
+                          info);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    g_autofree char *u = ADDRESS(encode_u_from_address(u_value), 2, info->m_pc);
 
     return img_format("BNEC %s, %s, %s", rs3, rt3, u);
 }
@@ -3204,15 +3216,15 @@ static char *BNEC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BNEC_32_(uint64 instruction, img_address m_pc)
+static char *BNEC_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BNEC %s, %s, %s", rs, rt, s);
 }
@@ -3228,15 +3240,15 @@ static char *BNEC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BNEIC(uint64 instruction, img_address m_pc)
+static char *BNEIC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BNEIC %s, %s, %s", rt, u, s);
 }
@@ -3252,13 +3264,13 @@ static char *BNEIC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BNEZC_16_(uint64 instruction, img_address m_pc)
+static char *BNEZC_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 2, info->m_pc);
 
     return img_format("BNEZC %s, %s", rt3, s);
 }
@@ -3274,11 +3286,11 @@ static char *BNEZC_16_(uint64 instruction, img_address m_pc)
  *            s[13:1] -------------
  *                           s[14] -
  */
-static char *BPOSGE32C(uint64 instruction, img_address m_pc)
+static char *BPOSGE32C(uint64 instruction, struct Dis_info *info)
 {
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("BPOSGE32C %s", s);
 }
@@ -3294,7 +3306,7 @@ static char *BPOSGE32C(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BREAK_16_(uint64 instruction, img_address m_pc)
+static char *BREAK_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
@@ -3314,7 +3326,7 @@ static char *BREAK_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BREAK_32_(uint64 instruction, img_address m_pc)
+static char *BREAK_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -3334,11 +3346,11 @@ static char *BREAK_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *BRSC(uint64 instruction, img_address m_pc)
+static char *BRSC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("BRSC %s", rs);
 }
@@ -3354,7 +3366,7 @@ static char *BRSC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CACHE(uint64 instruction, img_address m_pc)
+static char *CACHE(uint64 instruction, struct Dis_info *info)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3362,7 +3374,7 @@ static char *CACHE(uint64 instruction, img_address m_pc)
 
     g_autofree char *op = IMMEDIATE_UI(copy_ui(op_value));
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("CACHE %s, %s(%s)", op, s, rs);
 }
@@ -3378,7 +3390,7 @@ static char *CACHE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CACHEE(uint64 instruction, img_address m_pc)
+static char *CACHEE(uint64 instruction, struct Dis_info *info)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3386,7 +3398,7 @@ static char *CACHEE(uint64 instruction, img_address m_pc)
 
     g_autofree char *op = IMMEDIATE_UI(copy_ui(op_value));
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("CACHEE %s, %s(%s)", op, s, rs);
 }
@@ -3402,13 +3414,13 @@ static char *CACHEE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CEIL_L_D(uint64 instruction, img_address m_pc)
+static char *CEIL_L_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CEIL.L.D %s, %s", ft, fs);
 }
@@ -3424,13 +3436,13 @@ static char *CEIL_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CEIL_L_S(uint64 instruction, img_address m_pc)
+static char *CEIL_L_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CEIL.L.S %s, %s", ft, fs);
 }
@@ -3446,13 +3458,13 @@ static char *CEIL_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CEIL_W_D(uint64 instruction, img_address m_pc)
+static char *CEIL_W_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CEIL.W.D %s, %s", ft, fs);
 }
@@ -3468,13 +3480,13 @@ static char *CEIL_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CEIL_W_S(uint64 instruction, img_address m_pc)
+static char *CEIL_W_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CEIL.W.S %s, %s", ft, fs);
 }
@@ -3490,12 +3502,12 @@ static char *CEIL_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CFC1(uint64 instruction, img_address m_pc)
+static char *CFC1(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("CFC1 %s, %s", rt, cs);
@@ -3512,12 +3524,12 @@ static char *CFC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CFC2(uint64 instruction, img_address m_pc)
+static char *CFC2(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("CFC2 %s, %s", rt, cs);
@@ -3534,13 +3546,13 @@ static char *CFC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CLASS_D(uint64 instruction, img_address m_pc)
+static char *CLASS_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CLASS.D %s, %s", ft, fs);
 }
@@ -3556,13 +3568,13 @@ static char *CLASS_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CLASS_S(uint64 instruction, img_address m_pc)
+static char *CLASS_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CLASS.S %s, %s", ft, fs);
 }
@@ -3578,13 +3590,13 @@ static char *CLASS_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CLO(uint64 instruction, img_address m_pc)
+static char *CLO(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("CLO %s, %s", rt, rs);
 }
@@ -3600,13 +3612,13 @@ static char *CLO(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CLZ(uint64 instruction, img_address m_pc)
+static char *CLZ(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("CLZ %s, %s", rt, rs);
 }
@@ -3622,15 +3634,15 @@ static char *CLZ(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_AF_D(uint64 instruction, img_address m_pc)
+static char *CMP_AF_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.AF.D %s, %s, %s", fd, fs, ft);
 }
@@ -3646,15 +3658,15 @@ static char *CMP_AF_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_AF_S(uint64 instruction, img_address m_pc)
+static char *CMP_AF_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.AF.S %s, %s, %s", fd, fs, ft);
 }
@@ -3670,15 +3682,15 @@ static char *CMP_AF_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_EQ_D(uint64 instruction, img_address m_pc)
+static char *CMP_EQ_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.EQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -3693,13 +3705,13 @@ static char *CMP_EQ_D(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *CMP_EQ_PH(uint64 instruction, img_address m_pc)
+static char *CMP_EQ_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("CMP.EQ.PH %s, %s", rs, rt);
 }
@@ -3715,15 +3727,15 @@ static char *CMP_EQ_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_EQ_S(uint64 instruction, img_address m_pc)
+static char *CMP_EQ_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.EQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -3739,15 +3751,15 @@ static char *CMP_EQ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_LE_D(uint64 instruction, img_address m_pc)
+static char *CMP_LE_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.LE.D %s, %s, %s", fd, fs, ft);
 }
@@ -3762,13 +3774,13 @@ static char *CMP_LE_D(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *CMP_LE_PH(uint64 instruction, img_address m_pc)
+static char *CMP_LE_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("CMP.LE.PH %s, %s", rs, rt);
 }
@@ -3784,15 +3796,15 @@ static char *CMP_LE_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_LE_S(uint64 instruction, img_address m_pc)
+static char *CMP_LE_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.LE.S %s, %s, %s", fd, fs, ft);
 }
@@ -3808,15 +3820,15 @@ static char *CMP_LE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_LT_D(uint64 instruction, img_address m_pc)
+static char *CMP_LT_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.LT.D %s, %s, %s", fd, fs, ft);
 }
@@ -3831,13 +3843,13 @@ static char *CMP_LT_D(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *CMP_LT_PH(uint64 instruction, img_address m_pc)
+static char *CMP_LT_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("CMP.LT.PH %s, %s", rs, rt);
 }
@@ -3853,15 +3865,15 @@ static char *CMP_LT_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_LT_S(uint64 instruction, img_address m_pc)
+static char *CMP_LT_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.LT.S %s, %s, %s", fd, fs, ft);
 }
@@ -3877,15 +3889,15 @@ static char *CMP_LT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_NE_D(uint64 instruction, img_address m_pc)
+static char *CMP_NE_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.NE.D %s, %s, %s", fd, fs, ft);
 }
@@ -3901,15 +3913,15 @@ static char *CMP_NE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_NE_S(uint64 instruction, img_address m_pc)
+static char *CMP_NE_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.NE.S %s, %s, %s", fd, fs, ft);
 }
@@ -3925,15 +3937,15 @@ static char *CMP_NE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_OR_D(uint64 instruction, img_address m_pc)
+static char *CMP_OR_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.OR.D %s, %s, %s", fd, fs, ft);
 }
@@ -3949,15 +3961,15 @@ static char *CMP_OR_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_OR_S(uint64 instruction, img_address m_pc)
+static char *CMP_OR_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.OR.S %s, %s, %s", fd, fs, ft);
 }
@@ -3973,15 +3985,15 @@ static char *CMP_OR_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SAF_D(uint64 instruction, img_address m_pc)
+static char *CMP_SAF_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SAF.D %s, %s, %s", fd, fs, ft);
 }
@@ -3997,15 +4009,15 @@ static char *CMP_SAF_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SAF_S(uint64 instruction, img_address m_pc)
+static char *CMP_SAF_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SAF.S %s, %s, %s", fd, fs, ft);
 }
@@ -4021,15 +4033,15 @@ static char *CMP_SAF_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SEQ_D(uint64 instruction, img_address m_pc)
+static char *CMP_SEQ_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4045,15 +4057,15 @@ static char *CMP_SEQ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SEQ_S(uint64 instruction, img_address m_pc)
+static char *CMP_SEQ_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4069,15 +4081,15 @@ static char *CMP_SEQ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SLE_D(uint64 instruction, img_address m_pc)
+static char *CMP_SLE_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SLE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4093,15 +4105,15 @@ static char *CMP_SLE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SLE_S(uint64 instruction, img_address m_pc)
+static char *CMP_SLE_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SLE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4117,15 +4129,15 @@ static char *CMP_SLE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SLT_D(uint64 instruction, img_address m_pc)
+static char *CMP_SLT_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SLT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4141,15 +4153,15 @@ static char *CMP_SLT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SLT_S(uint64 instruction, img_address m_pc)
+static char *CMP_SLT_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SLT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4165,15 +4177,15 @@ static char *CMP_SLT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SNE_D(uint64 instruction, img_address m_pc)
+static char *CMP_SNE_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4189,15 +4201,15 @@ static char *CMP_SNE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SNE_S(uint64 instruction, img_address m_pc)
+static char *CMP_SNE_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4213,15 +4225,15 @@ static char *CMP_SNE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SOR_D(uint64 instruction, img_address m_pc)
+static char *CMP_SOR_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SOR.D %s, %s, %s", fd, fs, ft);
 }
@@ -4237,15 +4249,15 @@ static char *CMP_SOR_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SOR_S(uint64 instruction, img_address m_pc)
+static char *CMP_SOR_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SOR.S %s, %s, %s", fd, fs, ft);
 }
@@ -4261,15 +4273,15 @@ static char *CMP_SOR_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SUEQ_D(uint64 instruction, img_address m_pc)
+static char *CMP_SUEQ_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SUEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4285,15 +4297,15 @@ static char *CMP_SUEQ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SUEQ_S(uint64 instruction, img_address m_pc)
+static char *CMP_SUEQ_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SUEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4309,15 +4321,15 @@ static char *CMP_SUEQ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SULE_D(uint64 instruction, img_address m_pc)
+static char *CMP_SULE_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4333,15 +4345,15 @@ static char *CMP_SULE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SULE_S(uint64 instruction, img_address m_pc)
+static char *CMP_SULE_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4357,15 +4369,15 @@ static char *CMP_SULE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SULT_D(uint64 instruction, img_address m_pc)
+static char *CMP_SULT_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4381,15 +4393,15 @@ static char *CMP_SULT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SULT_S(uint64 instruction, img_address m_pc)
+static char *CMP_SULT_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4405,15 +4417,15 @@ static char *CMP_SULT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SUN_D(uint64 instruction, img_address m_pc)
+static char *CMP_SUN_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SUN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4429,15 +4441,15 @@ static char *CMP_SUN_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SUNE_D(uint64 instruction, img_address m_pc)
+static char *CMP_SUNE_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SUNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4453,15 +4465,15 @@ static char *CMP_SUNE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SUNE_S(uint64 instruction, img_address m_pc)
+static char *CMP_SUNE_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SUNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4477,15 +4489,15 @@ static char *CMP_SUNE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_SUN_S(uint64 instruction, img_address m_pc)
+static char *CMP_SUN_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.SUN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4501,15 +4513,15 @@ static char *CMP_SUN_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_UEQ_D(uint64 instruction, img_address m_pc)
+static char *CMP_UEQ_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.UEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4525,15 +4537,15 @@ static char *CMP_UEQ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_UEQ_S(uint64 instruction, img_address m_pc)
+static char *CMP_UEQ_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.UEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4549,15 +4561,15 @@ static char *CMP_UEQ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_ULE_D(uint64 instruction, img_address m_pc)
+static char *CMP_ULE_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.ULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4573,15 +4585,15 @@ static char *CMP_ULE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_ULE_S(uint64 instruction, img_address m_pc)
+static char *CMP_ULE_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.ULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4597,15 +4609,15 @@ static char *CMP_ULE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_ULT_D(uint64 instruction, img_address m_pc)
+static char *CMP_ULT_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.ULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4621,15 +4633,15 @@ static char *CMP_ULT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_ULT_S(uint64 instruction, img_address m_pc)
+static char *CMP_ULT_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.ULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4645,15 +4657,15 @@ static char *CMP_ULT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_UN_D(uint64 instruction, img_address m_pc)
+static char *CMP_UN_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.UN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4669,15 +4681,15 @@ static char *CMP_UN_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_UNE_D(uint64 instruction, img_address m_pc)
+static char *CMP_UNE_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.UNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4693,15 +4705,15 @@ static char *CMP_UNE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_UNE_S(uint64 instruction, img_address m_pc)
+static char *CMP_UNE_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.UNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4717,15 +4729,15 @@ static char *CMP_UNE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMP_UN_S(uint64 instruction, img_address m_pc)
+static char *CMP_UN_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("CMP.UN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4742,15 +4754,15 @@ static char *CMP_UN_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMPGDU_EQ_QB(uint64 instruction, img_address m_pc)
+static char *CMPGDU_EQ_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("CMPGDU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4767,15 +4779,15 @@ static char *CMPGDU_EQ_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMPGDU_LE_QB(uint64 instruction, img_address m_pc)
+static char *CMPGDU_LE_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("CMPGDU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4792,15 +4804,15 @@ static char *CMPGDU_LE_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMPGDU_LT_QB(uint64 instruction, img_address m_pc)
+static char *CMPGDU_LT_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("CMPGDU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4817,15 +4829,15 @@ static char *CMPGDU_LT_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMPGU_EQ_QB(uint64 instruction, img_address m_pc)
+static char *CMPGU_EQ_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("CMPGU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4842,15 +4854,15 @@ static char *CMPGU_EQ_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMPGU_LE_QB(uint64 instruction, img_address m_pc)
+static char *CMPGU_LE_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("CMPGU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4867,15 +4879,15 @@ static char *CMPGU_LE_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CMPGU_LT_QB(uint64 instruction, img_address m_pc)
+static char *CMPGU_LT_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("CMPGU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4891,13 +4903,13 @@ static char *CMPGU_LT_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *CMPU_EQ_QB(uint64 instruction, img_address m_pc)
+static char *CMPU_EQ_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("CMPU.EQ.QB %s, %s", rs, rt);
 }
@@ -4913,13 +4925,13 @@ static char *CMPU_EQ_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *CMPU_LE_QB(uint64 instruction, img_address m_pc)
+static char *CMPU_LE_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("CMPU.LE.QB %s, %s", rs, rt);
 }
@@ -4935,13 +4947,13 @@ static char *CMPU_LE_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *CMPU_LT_QB(uint64 instruction, img_address m_pc)
+static char *CMPU_LT_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("CMPU.LT.QB %s, %s", rs, rt);
 }
@@ -4957,7 +4969,7 @@ static char *CMPU_LT_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *COP2_1(uint64 instruction, img_address m_pc)
+static char *COP2_1(uint64 instruction, struct Dis_info *info)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
@@ -4977,12 +4989,12 @@ static char *COP2_1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CTC1(uint64 instruction, img_address m_pc)
+static char *CTC1(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("CTC1 %s, %s", rt, cs);
@@ -4999,12 +5011,12 @@ static char *CTC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CTC2(uint64 instruction, img_address m_pc)
+static char *CTC2(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("CTC2 %s, %s", rt, cs);
@@ -5021,13 +5033,13 @@ static char *CTC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CVT_D_L(uint64 instruction, img_address m_pc)
+static char *CVT_D_L(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CVT.D.L %s, %s", ft, fs);
 }
@@ -5043,13 +5055,13 @@ static char *CVT_D_L(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CVT_D_S(uint64 instruction, img_address m_pc)
+static char *CVT_D_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CVT.D.S %s, %s", ft, fs);
 }
@@ -5065,13 +5077,13 @@ static char *CVT_D_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CVT_D_W(uint64 instruction, img_address m_pc)
+static char *CVT_D_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CVT.D.W %s, %s", ft, fs);
 }
@@ -5087,13 +5099,13 @@ static char *CVT_D_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CVT_L_D(uint64 instruction, img_address m_pc)
+static char *CVT_L_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CVT.L.D %s, %s", ft, fs);
 }
@@ -5109,13 +5121,13 @@ static char *CVT_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CVT_L_S(uint64 instruction, img_address m_pc)
+static char *CVT_L_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CVT.L.S %s, %s", ft, fs);
 }
@@ -5131,13 +5143,13 @@ static char *CVT_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CVT_S_D(uint64 instruction, img_address m_pc)
+static char *CVT_S_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CVT.S.D %s, %s", ft, fs);
 }
@@ -5153,13 +5165,13 @@ static char *CVT_S_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CVT_S_L(uint64 instruction, img_address m_pc)
+static char *CVT_S_L(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CVT.S.L %s, %s", ft, fs);
 }
@@ -5175,13 +5187,13 @@ static char *CVT_S_L(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CVT_S_PL(uint64 instruction, img_address m_pc)
+static char *CVT_S_PL(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CVT.S.PL %s, %s", ft, fs);
 }
@@ -5197,13 +5209,13 @@ static char *CVT_S_PL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CVT_S_PU(uint64 instruction, img_address m_pc)
+static char *CVT_S_PU(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CVT.S.PU %s, %s", ft, fs);
 }
@@ -5219,13 +5231,13 @@ static char *CVT_S_PU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CVT_S_W(uint64 instruction, img_address m_pc)
+static char *CVT_S_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CVT.S.W %s, %s", ft, fs);
 }
@@ -5241,13 +5253,13 @@ static char *CVT_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CVT_W_D(uint64 instruction, img_address m_pc)
+static char *CVT_W_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CVT.W.D %s, %s", ft, fs);
 }
@@ -5263,13 +5275,13 @@ static char *CVT_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *CVT_W_S(uint64 instruction, img_address m_pc)
+static char *CVT_W_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("CVT.W.S %s, %s", ft, fs);
 }
@@ -5285,12 +5297,12 @@ static char *CVT_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DADDIU_48_(uint64 instruction, img_address m_pc)
+static char *DADDIU_48_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("DADDIU %s, %s", rt, s);
@@ -5307,14 +5319,14 @@ static char *DADDIU_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DADDIU_NEG_(uint64 instruction, img_address m_pc)
+static char *DADDIU_NEG_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *u = IMMEDIATE_I(neg_copy(u_value));
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
@@ -5331,14 +5343,14 @@ static char *DADDIU_NEG_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DADDIU_U12_(uint64 instruction, img_address m_pc)
+static char *DADDIU_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
@@ -5355,15 +5367,15 @@ static char *DADDIU_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DADD(uint64 instruction, img_address m_pc)
+static char *DADD(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DADD %s, %s, %s", rd, rs, rt);
 }
@@ -5379,15 +5391,15 @@ static char *DADD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DADDU(uint64 instruction, img_address m_pc)
+static char *DADDU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DADDU %s, %s, %s", rd, rs, rt);
 }
@@ -5403,13 +5415,13 @@ static char *DADDU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DCLO(uint64 instruction, img_address m_pc)
+static char *DCLO(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("DCLO %s, %s", rt, rs);
 }
@@ -5425,13 +5437,13 @@ static char *DCLO(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DCLZ(uint64 instruction, img_address m_pc)
+static char *DCLZ(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("DCLZ %s, %s", rt, rs);
 }
@@ -5447,15 +5459,15 @@ static char *DCLZ(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DDIV(uint64 instruction, img_address m_pc)
+static char *DDIV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DDIV %s, %s, %s", rd, rs, rt);
 }
@@ -5471,15 +5483,15 @@ static char *DDIV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DDIVU(uint64 instruction, img_address m_pc)
+static char *DDIVU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DDIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5495,7 +5507,7 @@ static char *DDIVU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DERET(uint64 instruction, img_address m_pc)
+static char *DERET(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -5513,15 +5525,15 @@ static char *DERET(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DEXTM(uint64 instruction, img_address m_pc)
+static char *DEXTM(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
     g_autofree char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
@@ -5539,15 +5551,15 @@ static char *DEXTM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DEXT(uint64 instruction, img_address m_pc)
+static char *DEXT(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
     g_autofree char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
@@ -5565,15 +5577,15 @@ static char *DEXT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DEXTU(uint64 instruction, img_address m_pc)
+static char *DEXTU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
     g_autofree char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
@@ -5591,15 +5603,15 @@ static char *DEXTU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DINSM(uint64 instruction, img_address m_pc)
+static char *DINSM(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
         lsb_value));
     g_autofree char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
@@ -5621,15 +5633,15 @@ static char *DINSM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DINS(uint64 instruction, img_address m_pc)
+static char *DINS(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
         lsb_value));
     g_autofree char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
@@ -5651,15 +5663,15 @@ static char *DINS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DINSU(uint64 instruction, img_address m_pc)
+static char *DINSU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
         lsb_value));
     g_autofree char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
@@ -5681,11 +5693,11 @@ static char *DINSU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DI(uint64 instruction, img_address m_pc)
+static char *DI(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DI %s", rt);
 }
@@ -5701,15 +5713,15 @@ static char *DI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DIV(uint64 instruction, img_address m_pc)
+static char *DIV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DIV %s, %s, %s", rd, rs, rt);
 }
@@ -5725,15 +5737,15 @@ static char *DIV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DIV_D(uint64 instruction, img_address m_pc)
+static char *DIV_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("DIV.D %s, %s, %s", fd, fs, ft);
 }
@@ -5749,15 +5761,15 @@ static char *DIV_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DIV_S(uint64 instruction, img_address m_pc)
+static char *DIV_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("DIV.S %s, %s, %s", fd, fs, ft);
 }
@@ -5773,15 +5785,15 @@ static char *DIV_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DIVU(uint64 instruction, img_address m_pc)
+static char *DIVU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5797,16 +5809,16 @@ static char *DIVU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DLSA(uint64 instruction, img_address m_pc)
+static char *DLSA(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u2 = IMMEDIATE_UI(copy_ui(u2_value));
 
     return img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
@@ -5823,12 +5835,12 @@ static char *DLSA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DLUI_48_(uint64 instruction, img_address m_pc)
+static char *DLUI_48_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     uint64 u_value = extract_u_31_to_0__s32(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("DLUI %s, %s", rt, u);
@@ -5845,13 +5857,13 @@ static char *DLUI_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMFC0(uint64 instruction, img_address m_pc)
+static char *DMFC0(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = CPR(copy_ui(c0s_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
@@ -5869,13 +5881,13 @@ static char *DMFC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMFC1(uint64 instruction, img_address m_pc)
+static char *DMFC1(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("DMFC1 %s, %s", rt, fs);
 }
@@ -5891,12 +5903,12 @@ static char *DMFC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMFC2(uint64 instruction, img_address m_pc)
+static char *DMFC2(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("DMFC2 %s, %s", rt, cs);
@@ -5913,13 +5925,13 @@ static char *DMFC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMFGC0(uint64 instruction, img_address m_pc)
+static char *DMFGC0(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = CPR(copy_ui(c0s_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
@@ -5937,15 +5949,15 @@ static char *DMFGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMOD(uint64 instruction, img_address m_pc)
+static char *DMOD(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DMOD %s, %s, %s", rd, rs, rt);
 }
@@ -5961,15 +5973,15 @@ static char *DMOD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMODU(uint64 instruction, img_address m_pc)
+static char *DMODU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DMODU %s, %s, %s", rd, rs, rt);
 }
@@ -5985,13 +5997,13 @@ static char *DMODU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMTC0(uint64 instruction, img_address m_pc)
+static char *DMTC0(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = CPR(copy_ui(c0s_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
@@ -6009,13 +6021,13 @@ static char *DMTC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMTC1(uint64 instruction, img_address m_pc)
+static char *DMTC1(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("DMTC1 %s, %s", rt, fs);
 }
@@ -6031,12 +6043,12 @@ static char *DMTC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMTC2(uint64 instruction, img_address m_pc)
+static char *DMTC2(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("DMTC2 %s, %s", rt, cs);
@@ -6053,13 +6065,13 @@ static char *DMTC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMTGC0(uint64 instruction, img_address m_pc)
+static char *DMTGC0(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = CPR(copy_ui(c0s_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
@@ -6077,11 +6089,11 @@ static char *DMTGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMT(uint64 instruction, img_address m_pc)
+static char *DMT(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DMT %s", rt);
 }
@@ -6097,15 +6109,15 @@ static char *DMT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMUH(uint64 instruction, img_address m_pc)
+static char *DMUH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DMUH %s, %s, %s", rd, rs, rt);
 }
@@ -6121,15 +6133,15 @@ static char *DMUH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMUHU(uint64 instruction, img_address m_pc)
+static char *DMUHU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DMUHU %s, %s, %s", rd, rs, rt);
 }
@@ -6145,15 +6157,15 @@ static char *DMUHU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMUL(uint64 instruction, img_address m_pc)
+static char *DMUL(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DMUL %s, %s, %s", rd, rs, rt);
 }
@@ -6169,15 +6181,15 @@ static char *DMUL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DMULU(uint64 instruction, img_address m_pc)
+static char *DMULU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DMULU %s, %s, %s", rd, rs, rt);
 }
@@ -6194,15 +6206,15 @@ static char *DMULU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *DPA_W_PH(uint64 instruction, img_address m_pc)
+static char *DPA_W_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6218,15 +6230,15 @@ static char *DPA_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPAQ_SA_L_W(uint64 instruction, img_address m_pc)
+static char *DPAQ_SA_L_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPAQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6242,15 +6254,15 @@ static char *DPAQ_SA_L_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPAQ_S_W_PH(uint64 instruction, img_address m_pc)
+static char *DPAQ_S_W_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6266,15 +6278,15 @@ static char *DPAQ_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPAQX_SA_W_PH(uint64 instruction, img_address m_pc)
+static char *DPAQX_SA_W_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPAQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6290,15 +6302,15 @@ static char *DPAQX_SA_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPAQX_S_W_PH(uint64 instruction, img_address m_pc)
+static char *DPAQX_S_W_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPAQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6314,15 +6326,15 @@ static char *DPAQX_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPAU_H_QBL(uint64 instruction, img_address m_pc)
+static char *DPAU_H_QBL(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPAU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6338,15 +6350,15 @@ static char *DPAU_H_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPAU_H_QBR(uint64 instruction, img_address m_pc)
+static char *DPAU_H_QBR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPAU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6362,15 +6374,15 @@ static char *DPAU_H_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPAX_W_PH(uint64 instruction, img_address m_pc)
+static char *DPAX_W_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPAX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6386,15 +6398,15 @@ static char *DPAX_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPS_W_PH(uint64 instruction, img_address m_pc)
+static char *DPS_W_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPS.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6410,15 +6422,15 @@ static char *DPS_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPSQ_SA_L_W(uint64 instruction, img_address m_pc)
+static char *DPSQ_SA_L_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPSQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6434,15 +6446,15 @@ static char *DPSQ_SA_L_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPSQ_S_W_PH(uint64 instruction, img_address m_pc)
+static char *DPSQ_S_W_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPSQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6458,15 +6470,15 @@ static char *DPSQ_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPSQX_SA_W_PH(uint64 instruction, img_address m_pc)
+static char *DPSQX_SA_W_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPSQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6482,15 +6494,15 @@ static char *DPSQX_SA_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPSQX_S_W_PH(uint64 instruction, img_address m_pc)
+static char *DPSQX_S_W_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPSQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6506,15 +6518,15 @@ static char *DPSQX_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPSU_H_QBL(uint64 instruction, img_address m_pc)
+static char *DPSU_H_QBL(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPSU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6530,15 +6542,15 @@ static char *DPSU_H_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPSU_H_QBR(uint64 instruction, img_address m_pc)
+static char *DPSU_H_QBR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPSU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6554,15 +6566,15 @@ static char *DPSU_H_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DPSX_W_PH(uint64 instruction, img_address m_pc)
+static char *DPSX_W_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DPSX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6578,14 +6590,14 @@ static char *DPSX_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DROTR(uint64 instruction, img_address m_pc)
+static char *DROTR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DROTR %s, %s, %s", rt, rs, shift);
@@ -6602,14 +6614,14 @@ static char *DROTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static char *DROTR32(uint64 instruction, img_address m_pc)
+static char *DROTR32(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DROTR32 %s, %s, %s", rt, rs, shift);
@@ -6626,15 +6638,15 @@ static char *DROTR32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DROTRV(uint64 instruction, img_address m_pc)
+static char *DROTRV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -6650,15 +6662,15 @@ static char *DROTRV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DROTX(uint64 instruction, img_address m_pc)
+static char *DROTX(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shiftx_value = extract_shiftx_11_10_9_8_7_6(instruction);
     uint64 shift_value = extract_shift_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
     g_autofree char *shiftx = IMMEDIATE_UI(copy_ui(shiftx_value));
 
@@ -6676,14 +6688,14 @@ static char *DROTX(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static char *DSLL(uint64 instruction, img_address m_pc)
+static char *DSLL(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DSLL %s, %s, %s", rt, rs, shift);
@@ -6700,14 +6712,14 @@ static char *DSLL(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static char *DSLL32(uint64 instruction, img_address m_pc)
+static char *DSLL32(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DSLL32 %s, %s, %s", rt, rs, shift);
@@ -6724,15 +6736,15 @@ static char *DSLL32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DSLLV(uint64 instruction, img_address m_pc)
+static char *DSLLV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DSLLV %s, %s, %s", rd, rs, rt);
 }
@@ -6748,14 +6760,14 @@ static char *DSLLV(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static char *DSRA(uint64 instruction, img_address m_pc)
+static char *DSRA(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DSRA %s, %s, %s", rt, rs, shift);
@@ -6772,14 +6784,14 @@ static char *DSRA(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static char *DSRA32(uint64 instruction, img_address m_pc)
+static char *DSRA32(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DSRA32 %s, %s, %s", rt, rs, shift);
@@ -6796,15 +6808,15 @@ static char *DSRA32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DSRAV(uint64 instruction, img_address m_pc)
+static char *DSRAV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DSRAV %s, %s, %s", rd, rs, rt);
 }
@@ -6820,14 +6832,14 @@ static char *DSRAV(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static char *DSRL(uint64 instruction, img_address m_pc)
+static char *DSRL(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DSRL %s, %s, %s", rt, rs, shift);
@@ -6844,14 +6856,14 @@ static char *DSRL(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static char *DSRL32(uint64 instruction, img_address m_pc)
+static char *DSRL32(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DSRL32 %s, %s, %s", rt, rs, shift);
@@ -6868,15 +6880,15 @@ static char *DSRL32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DSRLV(uint64 instruction, img_address m_pc)
+static char *DSRLV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DSRLV %s, %s, %s", rd, rs, rt);
 }
@@ -6892,15 +6904,15 @@ static char *DSRLV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DSUB(uint64 instruction, img_address m_pc)
+static char *DSUB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DSUB %s, %s, %s", rd, rs, rt);
 }
@@ -6916,15 +6928,15 @@ static char *DSUB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DSUBU(uint64 instruction, img_address m_pc)
+static char *DSUBU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DSUBU %s, %s, %s", rd, rs, rt);
 }
@@ -6940,11 +6952,11 @@ static char *DSUBU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DVPE(uint64 instruction, img_address m_pc)
+static char *DVPE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DVPE %s", rt);
 }
@@ -6960,11 +6972,11 @@ static char *DVPE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *DVP(uint64 instruction, img_address m_pc)
+static char *DVP(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("DVP %s", rt);
 }
@@ -6980,7 +6992,7 @@ static char *DVP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *EHB(uint64 instruction, img_address m_pc)
+static char *EHB(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -6998,11 +7010,11 @@ static char *EHB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *EI(uint64 instruction, img_address m_pc)
+static char *EI(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("EI %s", rt);
 }
@@ -7018,11 +7030,11 @@ static char *EI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *EMT(uint64 instruction, img_address m_pc)
+static char *EMT(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("EMT %s", rt);
 }
@@ -7038,7 +7050,7 @@ static char *EMT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ERET(uint64 instruction, img_address m_pc)
+static char *ERET(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -7056,7 +7068,7 @@ static char *ERET(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ERETNC(uint64 instruction, img_address m_pc)
+static char *ERETNC(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -7074,11 +7086,11 @@ static char *ERETNC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *EVP(uint64 instruction, img_address m_pc)
+static char *EVP(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("EVP %s", rt);
 }
@@ -7094,11 +7106,11 @@ static char *EVP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *EVPE(uint64 instruction, img_address m_pc)
+static char *EVPE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("EVPE %s", rt);
 }
@@ -7114,15 +7126,15 @@ static char *EVPE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *EXT(uint64 instruction, img_address m_pc)
+static char *EXT(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
     g_autofree char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
@@ -7140,16 +7152,16 @@ static char *EXT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *EXTD(uint64 instruction, img_address m_pc)
+static char *EXTD(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
@@ -7166,16 +7178,16 @@ static char *EXTD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *EXTD32(uint64 instruction, img_address m_pc)
+static char *EXTD32(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
@@ -7192,14 +7204,14 @@ static char *EXTD32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *EXTPDP(uint64 instruction, img_address m_pc)
+static char *EXTPDP(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
     g_autofree char *size = IMMEDIATE_UI(copy_ui(size_value));
 
     return img_format("EXTPDP %s, %s, %s", rt, ac, size);
@@ -7216,15 +7228,15 @@ static char *EXTPDP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *EXTPDPV(uint64 instruction, img_address m_pc)
+static char *EXTPDPV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("EXTPDPV %s, %s, %s", rt, ac, rs);
 }
@@ -7240,14 +7252,14 @@ static char *EXTPDPV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *EXTP(uint64 instruction, img_address m_pc)
+static char *EXTP(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
     g_autofree char *size = IMMEDIATE_UI(copy_ui(size_value));
 
     return img_format("EXTP %s, %s, %s", rt, ac, size);
@@ -7264,15 +7276,15 @@ static char *EXTP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *EXTPV(uint64 instruction, img_address m_pc)
+static char *EXTPV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("EXTPV %s, %s, %s", rt, ac, rs);
 }
@@ -7289,14 +7301,14 @@ static char *EXTPV(uint64 instruction, img_address m_pc)
  *       shift -----
  *               ac --
  */
-static char *EXTR_RS_W(uint64 instruction, img_address m_pc)
+static char *EXTR_RS_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
@@ -7314,14 +7326,14 @@ static char *EXTR_RS_W(uint64 instruction, img_address m_pc)
  *       shift -----
  *               ac --
  */
-static char *EXTR_R_W(uint64 instruction, img_address m_pc)
+static char *EXTR_R_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
@@ -7339,14 +7351,14 @@ static char *EXTR_R_W(uint64 instruction, img_address m_pc)
  *       shift -----
  *               ac --
  */
-static char *EXTR_S_H(uint64 instruction, img_address m_pc)
+static char *EXTR_S_H(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
@@ -7364,14 +7376,14 @@ static char *EXTR_S_H(uint64 instruction, img_address m_pc)
  *       shift -----
  *               ac --
  */
-static char *EXTR_W(uint64 instruction, img_address m_pc)
+static char *EXTR_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTR.W %s, %s, %s", rt, ac, shift);
@@ -7389,15 +7401,15 @@ static char *EXTR_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *EXTRV_RS_W(uint64 instruction, img_address m_pc)
+static char *EXTRV_RS_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("EXTRV_RS.W %s, %s, %s", rt, ac, rs);
 }
@@ -7414,15 +7426,15 @@ static char *EXTRV_RS_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *EXTRV_R_W(uint64 instruction, img_address m_pc)
+static char *EXTRV_R_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("EXTRV_R.W %s, %s, %s", rt, ac, rs);
 }
@@ -7439,15 +7451,15 @@ static char *EXTRV_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *EXTRV_S_H(uint64 instruction, img_address m_pc)
+static char *EXTRV_S_H(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("EXTRV_S.H %s, %s, %s", rt, ac, rs);
 }
@@ -7464,15 +7476,15 @@ static char *EXTRV_S_H(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *EXTRV_W(uint64 instruction, img_address m_pc)
+static char *EXTRV_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("EXTRV.W %s, %s, %s", rt, ac, rs);
 }
@@ -7489,16 +7501,16 @@ static char *EXTRV_W(uint64 instruction, img_address m_pc)
  *               rd -----
  *                 shift -----
  */
-static char *EXTW(uint64 instruction, img_address m_pc)
+static char *EXTW(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
@@ -7515,13 +7527,13 @@ static char *EXTW(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *FLOOR_L_D(uint64 instruction, img_address m_pc)
+static char *FLOOR_L_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("FLOOR.L.D %s, %s", ft, fs);
 }
@@ -7537,13 +7549,13 @@ static char *FLOOR_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *FLOOR_L_S(uint64 instruction, img_address m_pc)
+static char *FLOOR_L_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("FLOOR.L.S %s, %s", ft, fs);
 }
@@ -7559,13 +7571,13 @@ static char *FLOOR_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *FLOOR_W_D(uint64 instruction, img_address m_pc)
+static char *FLOOR_W_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("FLOOR.W.D %s, %s", ft, fs);
 }
@@ -7581,13 +7593,13 @@ static char *FLOOR_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *FLOOR_W_S(uint64 instruction, img_address m_pc)
+static char *FLOOR_W_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("FLOOR.W.S %s, %s", ft, fs);
 }
@@ -7603,15 +7615,15 @@ static char *FLOOR_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *FORK(uint64 instruction, img_address m_pc)
+static char *FORK(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("FORK %s, %s, %s", rd, rs, rt);
 }
@@ -7627,7 +7639,7 @@ static char *FORK(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *HYPCALL(uint64 instruction, img_address m_pc)
+static char *HYPCALL(uint64 instruction, struct Dis_info *info)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
@@ -7647,7 +7659,7 @@ static char *HYPCALL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *HYPCALL_16_(uint64 instruction, img_address m_pc)
+static char *HYPCALL_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
@@ -7667,15 +7679,15 @@ static char *HYPCALL_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *INS(uint64 instruction, img_address m_pc)
+static char *INS(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
         lsb_value));
     g_autofree char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
@@ -7696,13 +7708,13 @@ static char *INS(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *INSV(uint64 instruction, img_address m_pc)
+static char *INSV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("INSV %s, %s", rt, rs);
 }
@@ -7718,7 +7730,7 @@ static char *INSV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *IRET(uint64 instruction, img_address m_pc)
+static char *IRET(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -7736,11 +7748,11 @@ static char *IRET(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *JALRC_16_(uint64 instruction, img_address m_pc)
+static char *JALRC_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("JALRC $%d, %s", 31, rt);
 }
@@ -7756,13 +7768,13 @@ static char *JALRC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *JALRC_32_(uint64 instruction, img_address m_pc)
+static char *JALRC_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("JALRC %s, %s", rt, rs);
 }
@@ -7778,13 +7790,13 @@ static char *JALRC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *JALRC_HB(uint64 instruction, img_address m_pc)
+static char *JALRC_HB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("JALRC.HB %s, %s", rt, rs);
 }
@@ -7800,11 +7812,11 @@ static char *JALRC_HB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *JRC(uint64 instruction, img_address m_pc)
+static char *JRC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("JRC %s", rt);
 }
@@ -7820,15 +7832,15 @@ static char *JRC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LB_16_(uint64 instruction, img_address m_pc)
+static char *LB_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("LB %s, %s(%s)", rt3, u, rs3);
 }
@@ -7844,12 +7856,12 @@ static char *LB_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LB_GP_(uint64 instruction, img_address m_pc)
+static char *LB_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LB %s, %s($%d)", rt, u, 28);
@@ -7866,15 +7878,15 @@ static char *LB_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LB_S9_(uint64 instruction, img_address m_pc)
+static char *LB_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LB %s, %s(%s)", rt, s, rs);
 }
@@ -7890,15 +7902,15 @@ static char *LB_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LB_U12_(uint64 instruction, img_address m_pc)
+static char *LB_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LB %s, %s(%s)", rt, u, rs);
 }
@@ -7914,15 +7926,15 @@ static char *LB_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LBE(uint64 instruction, img_address m_pc)
+static char *LBE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LBE %s, %s(%s)", rt, s, rs);
 }
@@ -7938,15 +7950,15 @@ static char *LBE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LBU_16_(uint64 instruction, img_address m_pc)
+static char *LBU_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("LBU %s, %s(%s)", rt3, u, rs3);
 }
@@ -7962,12 +7974,12 @@ static char *LBU_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LBU_GP_(uint64 instruction, img_address m_pc)
+static char *LBU_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LBU %s, %s($%d)", rt, u, 28);
@@ -7984,15 +7996,15 @@ static char *LBU_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LBU_S9_(uint64 instruction, img_address m_pc)
+static char *LBU_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LBU %s, %s(%s)", rt, s, rs);
 }
@@ -8008,15 +8020,15 @@ static char *LBU_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LBU_U12_(uint64 instruction, img_address m_pc)
+static char *LBU_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LBU %s, %s(%s)", rt, u, rs);
 }
@@ -8032,15 +8044,15 @@ static char *LBU_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LBUE(uint64 instruction, img_address m_pc)
+static char *LBUE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LBUE %s, %s(%s)", rt, s, rs);
 }
@@ -8056,15 +8068,15 @@ static char *LBUE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LBUX(uint64 instruction, img_address m_pc)
+static char *LBUX(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LBUX %s, %s(%s)", rd, rs, rt);
 }
@@ -8080,15 +8092,15 @@ static char *LBUX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LBX(uint64 instruction, img_address m_pc)
+static char *LBX(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LBX %s, %s(%s)", rd, rs, rt);
 }
@@ -8104,12 +8116,12 @@ static char *LBX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LD_GP_(uint64 instruction, img_address m_pc)
+static char *LD_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LD %s, %s($%d)", rt, u, 28);
@@ -8126,15 +8138,15 @@ static char *LD_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LD_S9_(uint64 instruction, img_address m_pc)
+static char *LD_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LD %s, %s(%s)", rt, s, rs);
 }
@@ -8150,15 +8162,15 @@ static char *LD_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LD_U12_(uint64 instruction, img_address m_pc)
+static char *LD_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LD %s, %s(%s)", rt, u, rs);
 }
@@ -8174,12 +8186,12 @@ static char *LD_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LDC1_GP_(uint64 instruction, img_address m_pc)
+static char *LDC1_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LDC1 %s, %s($%d)", ft, u, 28);
@@ -8196,15 +8208,15 @@ static char *LDC1_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LDC1_S9_(uint64 instruction, img_address m_pc)
+static char *LDC1_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LDC1 %s, %s(%s)", ft, s, rs);
 }
@@ -8220,15 +8232,15 @@ static char *LDC1_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LDC1_U12_(uint64 instruction, img_address m_pc)
+static char *LDC1_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LDC1 %s, %s(%s)", ft, u, rs);
 }
@@ -8244,15 +8256,15 @@ static char *LDC1_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LDC1XS(uint64 instruction, img_address m_pc)
+static char *LDC1XS(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -8268,15 +8280,15 @@ static char *LDC1XS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LDC1X(uint64 instruction, img_address m_pc)
+static char *LDC1X(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -8292,7 +8304,7 @@ static char *LDC1X(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LDC2(uint64 instruction, img_address m_pc)
+static char *LDC2(uint64 instruction, struct Dis_info *info)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8300,7 +8312,7 @@ static char *LDC2(uint64 instruction, img_address m_pc)
 
     g_autofree char *ct = CPR(copy_ui(ct_value));
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LDC2 %s, %s(%s)", ct, s, rs);
 }
@@ -8316,16 +8328,16 @@ static char *LDC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LDM(uint64 instruction, img_address m_pc)
+static char *LDM(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
         count3_value));
 
@@ -8343,13 +8355,13 @@ static char *LDM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LDPC_48_(uint64 instruction, img_address m_pc)
+static char *LDPC_48_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, info->m_pc);
 
     return img_format("LDPC %s, %s", rt, s);
 }
@@ -8365,15 +8377,15 @@ static char *LDPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LDX(uint64 instruction, img_address m_pc)
+static char *LDX(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LDX %s, %s(%s)", rd, rs, rt);
 }
@@ -8389,15 +8401,15 @@ static char *LDX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LDXS(uint64 instruction, img_address m_pc)
+static char *LDXS(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8413,15 +8425,15 @@ static char *LDXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LH_16_(uint64 instruction, img_address m_pc)
+static char *LH_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("LH %s, %s(%s)", rt3, u, rs3);
 }
@@ -8437,12 +8449,12 @@ static char *LH_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LH_GP_(uint64 instruction, img_address m_pc)
+static char *LH_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LH %s, %s($%d)", rt, u, 28);
@@ -8459,15 +8471,15 @@ static char *LH_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LH_S9_(uint64 instruction, img_address m_pc)
+static char *LH_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LH %s, %s(%s)", rt, s, rs);
 }
@@ -8483,15 +8495,15 @@ static char *LH_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LH_U12_(uint64 instruction, img_address m_pc)
+static char *LH_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LH %s, %s(%s)", rt, u, rs);
 }
@@ -8507,15 +8519,15 @@ static char *LH_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LHE(uint64 instruction, img_address m_pc)
+static char *LHE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LHE %s, %s(%s)", rt, s, rs);
 }
@@ -8531,15 +8543,15 @@ static char *LHE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LHU_16_(uint64 instruction, img_address m_pc)
+static char *LHU_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("LHU %s, %s(%s)", rt3, u, rs3);
 }
@@ -8555,12 +8567,12 @@ static char *LHU_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LHU_GP_(uint64 instruction, img_address m_pc)
+static char *LHU_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LHU %s, %s($%d)", rt, u, 28);
@@ -8577,15 +8589,15 @@ static char *LHU_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LHU_S9_(uint64 instruction, img_address m_pc)
+static char *LHU_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LHU %s, %s(%s)", rt, s, rs);
 }
@@ -8601,15 +8613,15 @@ static char *LHU_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LHU_U12_(uint64 instruction, img_address m_pc)
+static char *LHU_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LHU %s, %s(%s)", rt, u, rs);
 }
@@ -8625,15 +8637,15 @@ static char *LHU_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LHUE(uint64 instruction, img_address m_pc)
+static char *LHUE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LHUE %s, %s(%s)", rt, s, rs);
 }
@@ -8649,15 +8661,15 @@ static char *LHUE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LHUX(uint64 instruction, img_address m_pc)
+static char *LHUX(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LHUX %s, %s(%s)", rd, rs, rt);
 }
@@ -8673,15 +8685,15 @@ static char *LHUX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LHUXS(uint64 instruction, img_address m_pc)
+static char *LHUXS(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LHUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8697,15 +8709,15 @@ static char *LHUXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LHXS(uint64 instruction, img_address m_pc)
+static char *LHXS(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8721,15 +8733,15 @@ static char *LHXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LHX(uint64 instruction, img_address m_pc)
+static char *LHX(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LHX %s, %s(%s)", rd, rs, rt);
 }
@@ -8745,12 +8757,12 @@ static char *LHX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LI_16_(uint64 instruction, img_address m_pc)
+static char *LI_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
     g_autofree char *eu = IMMEDIATE_I(encode_eu_from_s_li16(eu_value));
 
     return img_format("LI %s, %s", rt3, eu);
@@ -8767,12 +8779,12 @@ static char *LI_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LI_48_(uint64 instruction, img_address m_pc)
+static char *LI_48_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("LI %s, %s", rt, s);
@@ -8789,15 +8801,15 @@ static char *LI_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LL(uint64 instruction, img_address m_pc)
+static char *LL(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LL %s, %s(%s)", rt, s, rs);
 }
@@ -8813,15 +8825,15 @@ static char *LL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LLD(uint64 instruction, img_address m_pc)
+static char *LLD(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LLD %s, %s(%s)", rt, s, rs);
 }
@@ -8837,15 +8849,15 @@ static char *LLD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LLDP(uint64 instruction, img_address m_pc)
+static char *LLDP(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ru = GPR(copy_ui(ru_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ru = GPR(copy_ui(ru_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LLDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -8861,15 +8873,15 @@ static char *LLDP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LLE(uint64 instruction, img_address m_pc)
+static char *LLE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LLE %s, %s(%s)", rt, s, rs);
 }
@@ -8885,15 +8897,15 @@ static char *LLE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LLWP(uint64 instruction, img_address m_pc)
+static char *LLWP(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ru = GPR(copy_ui(ru_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ru = GPR(copy_ui(ru_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LLWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -8909,15 +8921,15 @@ static char *LLWP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LLWPE(uint64 instruction, img_address m_pc)
+static char *LLWPE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ru = GPR(copy_ui(ru_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ru = GPR(copy_ui(ru_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LLWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -8933,16 +8945,16 @@ static char *LLWPE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LSA(uint64 instruction, img_address m_pc)
+static char *LSA(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u2 = IMMEDIATE_UI(copy_ui(u2_value));
 
     return img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
@@ -8959,12 +8971,12 @@ static char *LSA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LUI(uint64 instruction, img_address m_pc)
+static char *LUI(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("LUI %s, %%hi(%s)", rt, s);
@@ -8981,15 +8993,15 @@ static char *LUI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LW_16_(uint64 instruction, img_address m_pc)
+static char *LW_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("LW %s, %s(%s)", rt3, u, rs3);
 }
@@ -9005,15 +9017,15 @@ static char *LW_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LW_4X4_(uint64 instruction, img_address m_pc)
+static char *LW_4X4_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
     uint64 u_value = extract_u_3_8__s2(instruction);
 
-    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value, info), info);
 
     return img_format("LW %s, %s(%s)", rt4, u, rs4);
 }
@@ -9029,12 +9041,12 @@ static char *LW_4X4_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LW_GP_(uint64 instruction, img_address m_pc)
+static char *LW_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LW %s, %s($%d)", rt, u, 28);
@@ -9051,12 +9063,12 @@ static char *LW_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LW_GP16_(uint64 instruction, img_address m_pc)
+static char *LW_GP16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LW %s, %s($%d)", rt3, u, 28);
@@ -9073,15 +9085,15 @@ static char *LW_GP16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LW_S9_(uint64 instruction, img_address m_pc)
+static char *LW_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LW %s, %s(%s)", rt, s, rs);
 }
@@ -9097,12 +9109,12 @@ static char *LW_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LW_SP_(uint64 instruction, img_address m_pc)
+static char *LW_SP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LW %s, %s($%d)", rt, u, 29);
@@ -9119,15 +9131,15 @@ static char *LW_SP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LW_U12_(uint64 instruction, img_address m_pc)
+static char *LW_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LW %s, %s(%s)", rt, u, rs);
 }
@@ -9143,12 +9155,12 @@ static char *LW_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWC1_GP_(uint64 instruction, img_address m_pc)
+static char *LWC1_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LWC1 %s, %s($%d)", ft, u, 28);
@@ -9165,15 +9177,15 @@ static char *LWC1_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWC1_S9_(uint64 instruction, img_address m_pc)
+static char *LWC1_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LWC1 %s, %s(%s)", ft, s, rs);
 }
@@ -9189,15 +9201,15 @@ static char *LWC1_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWC1_U12_(uint64 instruction, img_address m_pc)
+static char *LWC1_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LWC1 %s, %s(%s)", ft, u, rs);
 }
@@ -9213,15 +9225,15 @@ static char *LWC1_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWC1X(uint64 instruction, img_address m_pc)
+static char *LWC1X(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -9237,15 +9249,15 @@ static char *LWC1X(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWC1XS(uint64 instruction, img_address m_pc)
+static char *LWC1XS(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -9261,7 +9273,7 @@ static char *LWC1XS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWC2(uint64 instruction, img_address m_pc)
+static char *LWC2(uint64 instruction, struct Dis_info *info)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9269,7 +9281,7 @@ static char *LWC2(uint64 instruction, img_address m_pc)
 
     g_autofree char *ct = CPR(copy_ui(ct_value));
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LWC2 %s, %s(%s)", ct, s, rs);
 }
@@ -9285,15 +9297,15 @@ static char *LWC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWE(uint64 instruction, img_address m_pc)
+static char *LWE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LWE %s, %s(%s)", rt, s, rs);
 }
@@ -9309,16 +9321,16 @@ static char *LWE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWM(uint64 instruction, img_address m_pc)
+static char *LWM(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
         count3_value));
 
@@ -9336,13 +9348,13 @@ static char *LWM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWPC_48_(uint64 instruction, img_address m_pc)
+static char *LWPC_48_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, info->m_pc);
 
     return img_format("LWPC %s, %s", rt, s);
 }
@@ -9358,12 +9370,12 @@ static char *LWPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWU_GP_(uint64 instruction, img_address m_pc)
+static char *LWU_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LWU %s, %s($%d)", rt, u, 28);
@@ -9380,15 +9392,15 @@ static char *LWU_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWU_S9_(uint64 instruction, img_address m_pc)
+static char *LWU_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LWU %s, %s(%s)", rt, s, rs);
 }
@@ -9404,15 +9416,15 @@ static char *LWU_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWU_U12_(uint64 instruction, img_address m_pc)
+static char *LWU_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("LWU %s, %s(%s)", rt, u, rs);
 }
@@ -9428,15 +9440,15 @@ static char *LWU_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWUX(uint64 instruction, img_address m_pc)
+static char *LWUX(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LWUX %s, %s(%s)", rd, rs, rt);
 }
@@ -9452,15 +9464,15 @@ static char *LWUX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWUXS(uint64 instruction, img_address m_pc)
+static char *LWUXS(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LWUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9476,15 +9488,15 @@ static char *LWUXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWX(uint64 instruction, img_address m_pc)
+static char *LWX(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LWX %s, %s(%s)", rd, rs, rt);
 }
@@ -9500,15 +9512,15 @@ static char *LWX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWXS_16_(uint64 instruction, img_address m_pc)
+static char *LWXS_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    g_autofree char *rt3 = IMMEDIATE_UI(decode_gpr_gpr3(rt3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
+    g_autofree char *rt3 = IMMEDIATE_UI(decode_gpr_gpr3(rt3_value, info));
 
     return img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
 }
@@ -9524,15 +9536,15 @@ static char *LWXS_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *LWXS_32_(uint64 instruction, img_address m_pc)
+static char *LWXS_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("LWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9549,15 +9561,15 @@ static char *LWXS_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MADD_DSP_(uint64 instruction, img_address m_pc)
+static char *MADD_DSP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MADD %s, %s, %s", ac, rs, rt);
 }
@@ -9573,15 +9585,15 @@ static char *MADD_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MADDF_D(uint64 instruction, img_address m_pc)
+static char *MADDF_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MADDF.D %s, %s, %s", fd, fs, ft);
 }
@@ -9597,15 +9609,15 @@ static char *MADDF_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MADDF_S(uint64 instruction, img_address m_pc)
+static char *MADDF_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MADDF.S %s, %s, %s", fd, fs, ft);
 }
@@ -9622,15 +9634,15 @@ static char *MADDF_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MADDU_DSP_(uint64 instruction, img_address m_pc)
+static char *MADDU_DSP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MADDU %s, %s, %s", ac, rs, rt);
 }
@@ -9647,15 +9659,15 @@ static char *MADDU_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MAQ_S_W_PHL(uint64 instruction, img_address m_pc)
+static char *MAQ_S_W_PHL(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MAQ_S.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -9672,15 +9684,15 @@ static char *MAQ_S_W_PHL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MAQ_S_W_PHR(uint64 instruction, img_address m_pc)
+static char *MAQ_S_W_PHR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MAQ_S.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -9697,15 +9709,15 @@ static char *MAQ_S_W_PHR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MAQ_SA_W_PHL(uint64 instruction, img_address m_pc)
+static char *MAQ_SA_W_PHL(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MAQ_SA.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -9722,15 +9734,15 @@ static char *MAQ_SA_W_PHL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MAQ_SA_W_PHR(uint64 instruction, img_address m_pc)
+static char *MAQ_SA_W_PHR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MAQ_SA.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -9746,15 +9758,15 @@ static char *MAQ_SA_W_PHR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MAX_D(uint64 instruction, img_address m_pc)
+static char *MAX_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MAX.D %s, %s, %s", fd, fs, ft);
 }
@@ -9770,15 +9782,15 @@ static char *MAX_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MAX_S(uint64 instruction, img_address m_pc)
+static char *MAX_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MAX.S %s, %s, %s", fd, fs, ft);
 }
@@ -9794,15 +9806,15 @@ static char *MAX_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MAXA_D(uint64 instruction, img_address m_pc)
+static char *MAXA_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MAXA.D %s, %s, %s", fd, fs, ft);
 }
@@ -9818,15 +9830,15 @@ static char *MAXA_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MAXA_S(uint64 instruction, img_address m_pc)
+static char *MAXA_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MAXA.S %s, %s, %s", fd, fs, ft);
 }
@@ -9842,13 +9854,13 @@ static char *MAXA_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MFC0(uint64 instruction, img_address m_pc)
+static char *MFC0(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = CPR(copy_ui(c0s_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
@@ -9866,13 +9878,13 @@ static char *MFC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MFC1(uint64 instruction, img_address m_pc)
+static char *MFC1(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("MFC1 %s, %s", rt, fs);
 }
@@ -9888,12 +9900,12 @@ static char *MFC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MFC2(uint64 instruction, img_address m_pc)
+static char *MFC2(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("MFC2 %s, %s", rt, cs);
@@ -9910,13 +9922,13 @@ static char *MFC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MFGC0(uint64 instruction, img_address m_pc)
+static char *MFGC0(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = CPR(copy_ui(c0s_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
@@ -9934,13 +9946,13 @@ static char *MFGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MFHC0(uint64 instruction, img_address m_pc)
+static char *MFHC0(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = CPR(copy_ui(c0s_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
@@ -9958,13 +9970,13 @@ static char *MFHC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MFHC1(uint64 instruction, img_address m_pc)
+static char *MFHC1(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("MFHC1 %s, %s", rt, fs);
 }
@@ -9980,12 +9992,12 @@ static char *MFHC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MFHC2(uint64 instruction, img_address m_pc)
+static char *MFHC2(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("MFHC2 %s, %s", rt, cs);
@@ -10002,13 +10014,13 @@ static char *MFHC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MFHGC0(uint64 instruction, img_address m_pc)
+static char *MFHGC0(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = CPR(copy_ui(c0s_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
@@ -10025,13 +10037,13 @@ static char *MFHGC0(uint64 instruction, img_address m_pc)
  *     rt -----
  *               ac --
  */
-static char *MFHI_DSP_(uint64 instruction, img_address m_pc)
+static char *MFHI_DSP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
 
     return img_format("MFHI %s, %s", rt, ac);
 }
@@ -10047,14 +10059,14 @@ static char *MFHI_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MFHTR(uint64 instruction, img_address m_pc)
+static char *MFHTR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
@@ -10072,13 +10084,13 @@ static char *MFHTR(uint64 instruction, img_address m_pc)
  *     rt -----
  *               ac --
  */
-static char *MFLO_DSP_(uint64 instruction, img_address m_pc)
+static char *MFLO_DSP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ac = AC(copy_ui(ac_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
 
     return img_format("MFLO %s, %s", rt, ac);
 }
@@ -10094,14 +10106,14 @@ static char *MFLO_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MFTR(uint64 instruction, img_address m_pc)
+static char *MFTR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
@@ -10120,15 +10132,15 @@ static char *MFTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MIN_D(uint64 instruction, img_address m_pc)
+static char *MIN_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MIN.D %s, %s, %s", fd, fs, ft);
 }
@@ -10144,15 +10156,15 @@ static char *MIN_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MIN_S(uint64 instruction, img_address m_pc)
+static char *MIN_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MIN.S %s, %s, %s", fd, fs, ft);
 }
@@ -10168,15 +10180,15 @@ static char *MIN_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MINA_D(uint64 instruction, img_address m_pc)
+static char *MINA_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MINA.D %s, %s, %s", fd, fs, ft);
 }
@@ -10192,15 +10204,15 @@ static char *MINA_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MINA_S(uint64 instruction, img_address m_pc)
+static char *MINA_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MINA.S %s, %s, %s", fd, fs, ft);
 }
@@ -10216,15 +10228,15 @@ static char *MINA_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MOD(uint64 instruction, img_address m_pc)
+static char *MOD(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MOD %s, %s, %s", rd, rs, rt);
 }
@@ -10240,15 +10252,15 @@ static char *MOD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MODSUB(uint64 instruction, img_address m_pc)
+static char *MODSUB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MODSUB %s, %s, %s", rd, rs, rt);
 }
@@ -10264,15 +10276,15 @@ static char *MODSUB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MODU(uint64 instruction, img_address m_pc)
+static char *MODU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MODU %s, %s, %s", rd, rs, rt);
 }
@@ -10288,13 +10300,13 @@ static char *MODU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MOV_D(uint64 instruction, img_address m_pc)
+static char *MOV_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("MOV.D %s, %s", ft, fs);
 }
@@ -10310,13 +10322,13 @@ static char *MOV_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MOV_S(uint64 instruction, img_address m_pc)
+static char *MOV_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("MOV.S %s, %s", ft, fs);
 }
@@ -10332,15 +10344,15 @@ static char *MOV_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MOVE_BALC(uint64 instruction, img_address m_pc)
+static char *MOVE_BALC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rtz4_value = extract_rtz4_27_26_25_23_22_21(instruction);
     uint64 rd1_value = extract_rdl_25_24(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    const char *rd1 = GPR(decode_gpr_gpr1(rd1_value));
-    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rd1 = GPR(decode_gpr_gpr1(rd1_value, info), info);
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value, info), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, info->m_pc);
 
     return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
 }
@@ -10356,17 +10368,17 @@ static char *MOVE_BALC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MOVEP(uint64 instruction, img_address m_pc)
+static char *MOVEP(uint64 instruction, struct Dis_info *info)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
     uint64 rsz4_value = extract_rsz4_4_2_1_0(instruction);
 
-    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
-    const char *re2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
+    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value, info), info);
+    const char *re2 = GPR(decode_gpr_gpr2_reg2(rd2_value, info), info);
     /* !!!!!!!!!! - no conversion function */
-    const char *rsz4 = GPR(decode_gpr_gpr4_zero(rsz4_value));
-    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    const char *rsz4 = GPR(decode_gpr_gpr4_zero(rsz4_value, info), info);
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value, info), info);
 
     return img_format("MOVEP %s, %s, %s, %s", rd2, re2, rsz4, rtz4);
     /* hand edited */
@@ -10383,16 +10395,16 @@ static char *MOVEP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MOVEP_REV_(uint64 instruction, img_address m_pc)
+static char *MOVEP_REV_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
-    const char *rs2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value, info), info);
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value, info), info);
+    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value, info), info);
+    const char *rs2 = GPR(decode_gpr_gpr2_reg2(rd2_value, info), info);
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("MOVEP %s, %s, %s, %s", rs4, rt4, rd2, rs2);
@@ -10410,13 +10422,13 @@ static char *MOVEP_REV_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MOVE(uint64 instruction, img_address m_pc)
+static char *MOVE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 rs_value = extract_rs_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("MOVE %s, %s", rt, rs);
 }
@@ -10432,15 +10444,15 @@ static char *MOVE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MOVN(uint64 instruction, img_address m_pc)
+static char *MOVN(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MOVN %s, %s, %s", rd, rs, rt);
 }
@@ -10456,15 +10468,15 @@ static char *MOVN(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MOVZ(uint64 instruction, img_address m_pc)
+static char *MOVZ(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MOVZ %s, %s, %s", rd, rs, rt);
 }
@@ -10480,15 +10492,15 @@ static char *MOVZ(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *MSUB_DSP_(uint64 instruction, img_address m_pc)
+static char *MSUB_DSP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MSUB %s, %s, %s", ac, rs, rt);
 }
@@ -10504,15 +10516,15 @@ static char *MSUB_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MSUBF_D(uint64 instruction, img_address m_pc)
+static char *MSUBF_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MSUBF.D %s, %s, %s", fd, fs, ft);
 }
@@ -10528,15 +10540,15 @@ static char *MSUBF_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MSUBF_S(uint64 instruction, img_address m_pc)
+static char *MSUBF_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MSUBF.S %s, %s, %s", fd, fs, ft);
 }
@@ -10552,15 +10564,15 @@ static char *MSUBF_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *MSUBU_DSP_(uint64 instruction, img_address m_pc)
+static char *MSUBU_DSP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MSUBU %s, %s, %s", ac, rs, rt);
 }
@@ -10576,13 +10588,13 @@ static char *MSUBU_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MTC0(uint64 instruction, img_address m_pc)
+static char *MTC0(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = CPR(copy_ui(c0s_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
@@ -10600,13 +10612,13 @@ static char *MTC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MTC1(uint64 instruction, img_address m_pc)
+static char *MTC1(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("MTC1 %s, %s", rt, fs);
 }
@@ -10622,12 +10634,12 @@ static char *MTC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MTC2(uint64 instruction, img_address m_pc)
+static char *MTC2(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("MTC2 %s, %s", rt, cs);
@@ -10644,13 +10656,13 @@ static char *MTC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MTGC0(uint64 instruction, img_address m_pc)
+static char *MTGC0(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = CPR(copy_ui(c0s_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
@@ -10668,13 +10680,13 @@ static char *MTGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MTHC0(uint64 instruction, img_address m_pc)
+static char *MTHC0(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = CPR(copy_ui(c0s_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
@@ -10692,13 +10704,13 @@ static char *MTHC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MTHC1(uint64 instruction, img_address m_pc)
+static char *MTHC1(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("MTHC1 %s, %s", rt, fs);
 }
@@ -10714,12 +10726,12 @@ static char *MTHC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MTHC2(uint64 instruction, img_address m_pc)
+static char *MTHC2(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("MTHC2 %s, %s", rt, cs);
@@ -10736,13 +10748,13 @@ static char *MTHC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MTHGC0(uint64 instruction, img_address m_pc)
+static char *MTHGC0(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = CPR(copy_ui(c0s_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
@@ -10759,13 +10771,13 @@ static char *MTHGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *MTHI_DSP_(uint64 instruction, img_address m_pc)
+static char *MTHI_DSP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
 
     return img_format("MTHI %s, %s", rs, ac);
 }
@@ -10780,13 +10792,13 @@ static char *MTHI_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *MTHLIP(uint64 instruction, img_address m_pc)
+static char *MTHLIP(uint64 instruction, struct Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
 
     return img_format("MTHLIP %s, %s", rs, ac);
 }
@@ -10802,14 +10814,14 @@ static char *MTHLIP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MTHTR(uint64 instruction, img_address m_pc)
+static char *MTHTR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
@@ -10827,13 +10839,13 @@ static char *MTHTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *MTLO_DSP_(uint64 instruction, img_address m_pc)
+static char *MTLO_DSP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
 
     return img_format("MTLO %s, %s", rs, ac);
 }
@@ -10849,14 +10861,14 @@ static char *MTLO_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MTTR(uint64 instruction, img_address m_pc)
+static char *MTTR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
@@ -10875,15 +10887,15 @@ static char *MTTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MUH(uint64 instruction, img_address m_pc)
+static char *MUH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MUH %s, %s, %s", rd, rs, rt);
 }
@@ -10899,15 +10911,15 @@ static char *MUH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MUHU(uint64 instruction, img_address m_pc)
+static char *MUHU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MUHU %s, %s, %s", rd, rs, rt);
 }
@@ -10923,15 +10935,15 @@ static char *MUHU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MUL_32_(uint64 instruction, img_address m_pc)
+static char *MUL_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MUL %s, %s, %s", rd, rs, rt);
 }
@@ -10947,13 +10959,13 @@ static char *MUL_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MUL_4X4_(uint64 instruction, img_address m_pc)
+static char *MUL_4X4_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value, info), info);
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value, info), info);
 
     return img_format("MUL %s, %s", rs4, rt4);
 }
@@ -10969,15 +10981,15 @@ static char *MUL_4X4_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MUL_D(uint64 instruction, img_address m_pc)
+static char *MUL_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MUL.D %s, %s, %s", fd, fs, ft);
 }
@@ -10994,15 +11006,15 @@ static char *MUL_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MUL_PH(uint64 instruction, img_address m_pc)
+static char *MUL_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MUL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11019,15 +11031,15 @@ static char *MUL_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MUL_S_PH(uint64 instruction, img_address m_pc)
+static char *MUL_S_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MUL_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11043,15 +11055,15 @@ static char *MUL_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MUL_S(uint64 instruction, img_address m_pc)
+static char *MUL_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("MUL.S %s, %s, %s", fd, fs, ft);
 }
@@ -11068,15 +11080,15 @@ static char *MUL_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MULEQ_S_W_PHL(uint64 instruction, img_address m_pc)
+static char *MULEQ_S_W_PHL(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MULEQ_S.W.PHL %s, %s, %s", rd, rs, rt);
 }
@@ -11093,15 +11105,15 @@ static char *MULEQ_S_W_PHL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MULEQ_S_W_PHR(uint64 instruction, img_address m_pc)
+static char *MULEQ_S_W_PHR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MULEQ_S.W.PHR %s, %s, %s", rd, rs, rt);
 }
@@ -11118,15 +11130,15 @@ static char *MULEQ_S_W_PHR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MULEU_S_PH_QBL(uint64 instruction, img_address m_pc)
+static char *MULEU_S_PH_QBL(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MULEU_S.PH.QBL %s, %s, %s", rd, rs, rt);
 }
@@ -11143,15 +11155,15 @@ static char *MULEU_S_PH_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MULEU_S_PH_QBR(uint64 instruction, img_address m_pc)
+static char *MULEU_S_PH_QBR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MULEU_S.PH.QBR %s, %s, %s", rd, rs, rt);
 }
@@ -11168,15 +11180,15 @@ static char *MULEU_S_PH_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MULQ_RS_PH(uint64 instruction, img_address m_pc)
+static char *MULQ_RS_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MULQ_RS.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11193,15 +11205,15 @@ static char *MULQ_RS_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MULQ_RS_W(uint64 instruction, img_address m_pc)
+static char *MULQ_RS_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MULQ_RS.W %s, %s, %s", rd, rs, rt);
 }
@@ -11218,15 +11230,15 @@ static char *MULQ_RS_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MULQ_S_PH(uint64 instruction, img_address m_pc)
+static char *MULQ_S_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MULQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11243,15 +11255,15 @@ static char *MULQ_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MULQ_S_W(uint64 instruction, img_address m_pc)
+static char *MULQ_S_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MULQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -11268,15 +11280,15 @@ static char *MULQ_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *MULSA_W_PH(uint64 instruction, img_address m_pc)
+static char *MULSA_W_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MULSA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11293,15 +11305,15 @@ static char *MULSA_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *MULSAQ_S_W_PH(uint64 instruction, img_address m_pc)
+static char *MULSAQ_S_W_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MULSAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11317,15 +11329,15 @@ static char *MULSAQ_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *MULT_DSP_(uint64 instruction, img_address m_pc)
+static char *MULT_DSP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MULT %s, %s, %s", ac, rs, rt);
 }
@@ -11341,15 +11353,15 @@ static char *MULT_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *MULTU_DSP_(uint64 instruction, img_address m_pc)
+static char *MULTU_DSP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy_ui(ac_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MULTU %s, %s, %s", ac, rs, rt);
 }
@@ -11365,15 +11377,15 @@ static char *MULTU_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *MULU(uint64 instruction, img_address m_pc)
+static char *MULU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("MULU %s, %s, %s", rd, rs, rt);
 }
@@ -11389,13 +11401,13 @@ static char *MULU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *NEG_D(uint64 instruction, img_address m_pc)
+static char *NEG_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("NEG.D %s, %s", ft, fs);
 }
@@ -11411,13 +11423,13 @@ static char *NEG_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *NEG_S(uint64 instruction, img_address m_pc)
+static char *NEG_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("NEG.S %s, %s", ft, fs);
 }
@@ -11433,7 +11445,7 @@ static char *NEG_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *NOP_16_(uint64 instruction, img_address m_pc)
+static char *NOP_16_(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -11451,7 +11463,7 @@ static char *NOP_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *NOP_32_(uint64 instruction, img_address m_pc)
+static char *NOP_32_(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -11469,15 +11481,15 @@ static char *NOP_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *NOR(uint64 instruction, img_address m_pc)
+static char *NOR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("NOR %s, %s, %s", rd, rs, rt);
 }
@@ -11493,13 +11505,13 @@ static char *NOR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *NOT_16_(uint64 instruction, img_address m_pc)
+static char *NOT_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("NOT %s, %s", rt3, rs3);
 }
@@ -11515,13 +11527,13 @@ static char *NOT_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *OR_16_(uint64 instruction, img_address m_pc)
+static char *OR_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
 
     return img_format("OR %s, %s", rs3, rt3);
 }
@@ -11537,15 +11549,15 @@ static char *OR_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *OR_32_(uint64 instruction, img_address m_pc)
+static char *OR_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("OR %s, %s, %s", rd, rs, rt);
 }
@@ -11561,14 +11573,14 @@ static char *OR_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ORI(uint64 instruction, img_address m_pc)
+static char *ORI(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ORI %s, %s, %s", rt, rs, u);
@@ -11586,15 +11598,15 @@ static char *ORI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PACKRL_PH(uint64 instruction, img_address m_pc)
+static char *PACKRL_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("PACKRL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11610,7 +11622,7 @@ static char *PACKRL_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PAUSE(uint64 instruction, img_address m_pc)
+static char *PAUSE(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -11629,15 +11641,15 @@ static char *PAUSE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PICK_PH(uint64 instruction, img_address m_pc)
+static char *PICK_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("PICK.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11654,15 +11666,15 @@ static char *PICK_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PICK_QB(uint64 instruction, img_address m_pc)
+static char *PICK_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("PICK.QB %s, %s, %s", rd, rs, rt);
 }
@@ -11679,13 +11691,13 @@ static char *PICK_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECEQ_W_PHL(uint64 instruction, img_address m_pc)
+static char *PRECEQ_W_PHL(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("PRECEQ.W.PHL %s, %s", rt, rs);
 }
@@ -11702,13 +11714,13 @@ static char *PRECEQ_W_PHL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECEQ_W_PHR(uint64 instruction, img_address m_pc)
+static char *PRECEQ_W_PHR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("PRECEQ.W.PHR %s, %s", rt, rs);
 }
@@ -11725,13 +11737,13 @@ static char *PRECEQ_W_PHR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECEQU_PH_QBLA(uint64 instruction, img_address m_pc)
+static char *PRECEQU_PH_QBLA(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("PRECEQU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11748,13 +11760,13 @@ static char *PRECEQU_PH_QBLA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECEQU_PH_QBL(uint64 instruction, img_address m_pc)
+static char *PRECEQU_PH_QBL(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("PRECEQU.PH.QBL %s, %s", rt, rs);
 }
@@ -11771,13 +11783,13 @@ static char *PRECEQU_PH_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECEQU_PH_QBRA(uint64 instruction, img_address m_pc)
+static char *PRECEQU_PH_QBRA(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("PRECEQU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11794,13 +11806,13 @@ static char *PRECEQU_PH_QBRA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECEQU_PH_QBR(uint64 instruction, img_address m_pc)
+static char *PRECEQU_PH_QBR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("PRECEQU.PH.QBR %s, %s", rt, rs);
 }
@@ -11818,13 +11830,13 @@ static char *PRECEQU_PH_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECEU_PH_QBLA(uint64 instruction, img_address m_pc)
+static char *PRECEU_PH_QBLA(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("PRECEU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11841,13 +11853,13 @@ static char *PRECEU_PH_QBLA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECEU_PH_QBL(uint64 instruction, img_address m_pc)
+static char *PRECEU_PH_QBL(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("PRECEU.PH.QBL %s, %s", rt, rs);
 }
@@ -11865,13 +11877,13 @@ static char *PRECEU_PH_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECEU_PH_QBRA(uint64 instruction, img_address m_pc)
+static char *PRECEU_PH_QBRA(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("PRECEU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11888,13 +11900,13 @@ static char *PRECEU_PH_QBRA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECEU_PH_QBR(uint64 instruction, img_address m_pc)
+static char *PRECEU_PH_QBR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("PRECEU.PH.QBR %s, %s", rt, rs);
 }
@@ -11911,15 +11923,15 @@ static char *PRECEU_PH_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECR_QB_PH(uint64 instruction, img_address m_pc)
+static char *PRECR_QB_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("PRECR.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11936,14 +11948,14 @@ static char *PRECR_QB_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECR_SRA_PH_W(uint64 instruction, img_address m_pc)
+static char *PRECR_SRA_PH_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
@@ -11961,14 +11973,14 @@ static char *PRECR_SRA_PH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECR_SRA_R_PH_W(uint64 instruction, img_address m_pc)
+static char *PRECR_SRA_R_PH_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
@@ -11986,15 +11998,15 @@ static char *PRECR_SRA_R_PH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECRQ_PH_W(uint64 instruction, img_address m_pc)
+static char *PRECRQ_PH_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("PRECRQ.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -12011,15 +12023,15 @@ static char *PRECRQ_PH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECRQ_QB_PH(uint64 instruction, img_address m_pc)
+static char *PRECRQ_QB_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("PRECRQ.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12036,15 +12048,15 @@ static char *PRECRQ_QB_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECRQ_RS_PH_W(uint64 instruction, img_address m_pc)
+static char *PRECRQ_RS_PH_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("PRECRQ_RS.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -12061,15 +12073,15 @@ static char *PRECRQ_RS_PH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PRECRQU_S_QB_PH(uint64 instruction, img_address m_pc)
+static char *PRECRQU_S_QB_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("PRECRQU_S.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12085,7 +12097,7 @@ static char *PRECRQU_S_QB_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PREF_S9_(uint64 instruction, img_address m_pc)
+static char *PREF_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12093,7 +12105,7 @@ static char *PREF_S9_(uint64 instruction, img_address m_pc)
 
     g_autofree char *hint = IMMEDIATE_UI(copy_ui(hint_value));
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("PREF %s, %s(%s)", hint, s, rs);
 }
@@ -12109,7 +12121,7 @@ static char *PREF_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PREF_U12_(uint64 instruction, img_address m_pc)
+static char *PREF_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12117,7 +12129,7 @@ static char *PREF_U12_(uint64 instruction, img_address m_pc)
 
     g_autofree char *hint = IMMEDIATE_UI(copy_ui(hint_value));
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("PREF %s, %s(%s)", hint, u, rs);
 }
@@ -12133,7 +12145,7 @@ static char *PREF_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PREFE(uint64 instruction, img_address m_pc)
+static char *PREFE(uint64 instruction, struct Dis_info *info)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12141,7 +12153,7 @@ static char *PREFE(uint64 instruction, img_address m_pc)
 
     g_autofree char *hint = IMMEDIATE_UI(copy_ui(hint_value));
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("PREFE %s, %s(%s)", hint, s, rs);
 }
@@ -12157,14 +12169,14 @@ static char *PREFE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *PREPEND(uint64 instruction, img_address m_pc)
+static char *PREPEND(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("PREPEND %s, %s, %s", rt, rs, sa);
@@ -12180,13 +12192,13 @@ static char *PREPEND(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *RADDU_W_QB(uint64 instruction, img_address m_pc)
+static char *RADDU_W_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("RADDU.W.QB %s, %s", rt, rs);
 }
@@ -12201,12 +12213,12 @@ static char *RADDU_W_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *        mask -------
  */
-static char *RDDSP(uint64 instruction, img_address m_pc)
+static char *RDDSP(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *mask = IMMEDIATE_UI(copy_ui(mask_value));
 
     return img_format("RDDSP %s, %s", rt, mask);
@@ -12223,13 +12235,13 @@ static char *RDDSP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *RDHWR(uint64 instruction, img_address m_pc)
+static char *RDHWR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 hs_value = extract_hs_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *hs = CPR(copy_ui(hs_value));
     g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
@@ -12247,13 +12259,13 @@ static char *RDHWR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *RDPGPR(uint64 instruction, img_address m_pc)
+static char *RDPGPR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("RDPGPR %s, %s", rt, rs);
 }
@@ -12269,13 +12281,13 @@ static char *RDPGPR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *RECIP_D(uint64 instruction, img_address m_pc)
+static char *RECIP_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("RECIP.D %s, %s", ft, fs);
 }
@@ -12291,13 +12303,13 @@ static char *RECIP_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *RECIP_S(uint64 instruction, img_address m_pc)
+static char *RECIP_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("RECIP.S %s, %s", ft, fs);
 }
@@ -12313,12 +12325,12 @@ static char *RECIP_S(uint64 instruction, img_address m_pc)
  *     rt -----
  *           s ----------
  */
-static char *REPL_PH(uint64 instruction, img_address m_pc)
+static char *REPL_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("REPL.PH %s, %s", rt, s);
@@ -12335,12 +12347,12 @@ static char *REPL_PH(uint64 instruction, img_address m_pc)
  *     rt -----
  *           u --------
  */
-static char *REPL_QB(uint64 instruction, img_address m_pc)
+static char *REPL_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("REPL.QB %s, %s", rt, u);
@@ -12357,13 +12369,13 @@ static char *REPL_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *REPLV_PH(uint64 instruction, img_address m_pc)
+static char *REPLV_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("REPLV.PH %s, %s", rt, rs);
 }
@@ -12378,13 +12390,13 @@ static char *REPLV_PH(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *REPLV_QB(uint64 instruction, img_address m_pc)
+static char *REPLV_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("REPLV.QB %s, %s", rt, rs);
 }
@@ -12400,7 +12412,7 @@ static char *REPLV_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *RESTORE_32_(uint64 instruction, img_address m_pc)
+static char *RESTORE_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
@@ -12409,7 +12421,7 @@ static char *RESTORE_32_(uint64 instruction, img_address m_pc)
 
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *save_restore_str = save_restore_list(
-        rt_value, count_value, gp_value);
+        rt_value, count_value, gp_value, info);
     return img_format("RESTORE %s%s", u, save_restore_str);
 }
 
@@ -12424,7 +12436,7 @@ static char *RESTORE_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *RESTORE_JRC_16_(uint64 instruction, img_address m_pc)
+static char *RESTORE_JRC_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
@@ -12432,7 +12444,7 @@ static char *RESTORE_JRC_16_(uint64 instruction, img_address m_pc)
 
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *save_restore_str = save_restore_list(
-        encode_rt1_from_rt(rt1_value), count_value, 0);
+        encode_rt1_from_rt(rt1_value), count_value, 0, info);
     return img_format("RESTORE.JRC %s%s", u, save_restore_str);
 }
 
@@ -12447,7 +12459,7 @@ static char *RESTORE_JRC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *RESTORE_JRC_32_(uint64 instruction, img_address m_pc)
+static char *RESTORE_JRC_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
@@ -12456,7 +12468,7 @@ static char *RESTORE_JRC_32_(uint64 instruction, img_address m_pc)
 
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *save_restore_str = save_restore_list(
-        rt_value, count_value, gp_value);
+        rt_value, count_value, gp_value, info);
     return img_format("RESTORE.JRC %s%s", u, save_restore_str);
 }
 
@@ -12471,7 +12483,7 @@ static char *RESTORE_JRC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *RESTOREF(uint64 instruction, img_address m_pc)
+static char *RESTOREF(uint64 instruction, struct Dis_info *info)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
@@ -12493,13 +12505,13 @@ static char *RESTOREF(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *RINT_D(uint64 instruction, img_address m_pc)
+static char *RINT_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("RINT.D %s, %s", ft, fs);
 }
@@ -12515,13 +12527,13 @@ static char *RINT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *RINT_S(uint64 instruction, img_address m_pc)
+static char *RINT_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("RINT.S %s, %s", ft, fs);
 }
@@ -12537,14 +12549,14 @@ static char *RINT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ROTR(uint64 instruction, img_address m_pc)
+static char *ROTR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("ROTR %s, %s, %s", rt, rs, shift);
@@ -12561,15 +12573,15 @@ static char *ROTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ROTRV(uint64 instruction, img_address m_pc)
+static char *ROTRV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("ROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -12585,7 +12597,7 @@ static char *ROTRV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ROTX(uint64 instruction, img_address m_pc)
+static char *ROTX(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12593,8 +12605,8 @@ static char *ROTX(uint64 instruction, img_address m_pc)
     uint64 stripe_value = extract_stripe_6(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
     g_autofree char *shiftx = IMMEDIATE_UI(copy_ui(shiftx_value));
     g_autofree char *stripe = IMMEDIATE_UI(copy_ui(stripe_value));
@@ -12614,13 +12626,13 @@ static char *ROTX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ROUND_L_D(uint64 instruction, img_address m_pc)
+static char *ROUND_L_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("ROUND.L.D %s, %s", ft, fs);
 }
@@ -12636,13 +12648,13 @@ static char *ROUND_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ROUND_L_S(uint64 instruction, img_address m_pc)
+static char *ROUND_L_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("ROUND.L.S %s, %s", ft, fs);
 }
@@ -12658,13 +12670,13 @@ static char *ROUND_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ROUND_W_D(uint64 instruction, img_address m_pc)
+static char *ROUND_W_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("ROUND.W.D %s, %s", ft, fs);
 }
@@ -12680,13 +12692,13 @@ static char *ROUND_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *ROUND_W_S(uint64 instruction, img_address m_pc)
+static char *ROUND_W_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("ROUND.W.S %s, %s", ft, fs);
 }
@@ -12702,13 +12714,13 @@ static char *ROUND_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *RSQRT_D(uint64 instruction, img_address m_pc)
+static char *RSQRT_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("RSQRT.D %s, %s", ft, fs);
 }
@@ -12724,13 +12736,13 @@ static char *RSQRT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *RSQRT_S(uint64 instruction, img_address m_pc)
+static char *RSQRT_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("RSQRT.S %s, %s", ft, fs);
 }
@@ -12746,7 +12758,7 @@ static char *RSQRT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SAVE_16_(uint64 instruction, img_address m_pc)
+static char *SAVE_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
@@ -12754,7 +12766,7 @@ static char *SAVE_16_(uint64 instruction, img_address m_pc)
 
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *save_restore_str = save_restore_list(
-        encode_rt1_from_rt(rt1_value), count_value, 0);
+        encode_rt1_from_rt(rt1_value), count_value, 0, info);
     return img_format("SAVE %s%s", u, save_restore_str);
 }
 
@@ -12769,7 +12781,7 @@ static char *SAVE_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SAVE_32_(uint64 instruction, img_address m_pc)
+static char *SAVE_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
@@ -12778,7 +12790,7 @@ static char *SAVE_32_(uint64 instruction, img_address m_pc)
 
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *save_restore_str = save_restore_list(
-        rt_value, count_value, gp_value);
+        rt_value, count_value, gp_value, info);
     return img_format("SAVE %s%s", u, save_restore_str);
 }
 
@@ -12793,7 +12805,7 @@ static char *SAVE_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SAVEF(uint64 instruction, img_address m_pc)
+static char *SAVEF(uint64 instruction, struct Dis_info *info)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
@@ -12815,15 +12827,15 @@ static char *SAVEF(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SB_16_(uint64 instruction, img_address m_pc)
+static char *SB_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("SB %s, %s(%s)", rtz3, u, rs3);
 }
@@ -12839,12 +12851,12 @@ static char *SB_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SB_GP_(uint64 instruction, img_address m_pc)
+static char *SB_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SB %s, %s($%d)", rt, u, 28);
@@ -12861,15 +12873,15 @@ static char *SB_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SB_S9_(uint64 instruction, img_address m_pc)
+static char *SB_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SB %s, %s(%s)", rt, s, rs);
 }
@@ -12885,15 +12897,15 @@ static char *SB_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SB_U12_(uint64 instruction, img_address m_pc)
+static char *SB_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SB %s, %s(%s)", rt, u, rs);
 }
@@ -12909,15 +12921,15 @@ static char *SB_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SBE(uint64 instruction, img_address m_pc)
+static char *SBE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SBE %s, %s(%s)", rt, s, rs);
 }
@@ -12933,15 +12945,15 @@ static char *SBE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SBX(uint64 instruction, img_address m_pc)
+static char *SBX(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SBX %s, %s(%s)", rd, rs, rt);
 }
@@ -12957,15 +12969,15 @@ static char *SBX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SC(uint64 instruction, img_address m_pc)
+static char *SC(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SC %s, %s(%s)", rt, s, rs);
 }
@@ -12981,15 +12993,15 @@ static char *SC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SCD(uint64 instruction, img_address m_pc)
+static char *SCD(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SCD %s, %s(%s)", rt, s, rs);
 }
@@ -13005,15 +13017,15 @@ static char *SCD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SCDP(uint64 instruction, img_address m_pc)
+static char *SCDP(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ru = GPR(copy_ui(ru_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ru = GPR(copy_ui(ru_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SCDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -13029,15 +13041,15 @@ static char *SCDP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SCE(uint64 instruction, img_address m_pc)
+static char *SCE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SCE %s, %s(%s)", rt, s, rs);
 }
@@ -13053,15 +13065,15 @@ static char *SCE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SCWP(uint64 instruction, img_address m_pc)
+static char *SCWP(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ru = GPR(copy_ui(ru_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ru = GPR(copy_ui(ru_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SCWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -13077,15 +13089,15 @@ static char *SCWP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SCWPE(uint64 instruction, img_address m_pc)
+static char *SCWPE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *ru = GPR(copy_ui(ru_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *ru = GPR(copy_ui(ru_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SCWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -13101,12 +13113,12 @@ static char *SCWPE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SD_GP_(uint64 instruction, img_address m_pc)
+static char *SD_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SD %s, %s($%d)", rt, u, 28);
@@ -13123,15 +13135,15 @@ static char *SD_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SD_S9_(uint64 instruction, img_address m_pc)
+static char *SD_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SD %s, %s(%s)", rt, s, rs);
 }
@@ -13147,15 +13159,15 @@ static char *SD_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SD_U12_(uint64 instruction, img_address m_pc)
+static char *SD_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SD %s, %s(%s)", rt, u, rs);
 }
@@ -13171,7 +13183,7 @@ static char *SD_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SDBBP_16_(uint64 instruction, img_address m_pc)
+static char *SDBBP_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
@@ -13191,7 +13203,7 @@ static char *SDBBP_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SDBBP_32_(uint64 instruction, img_address m_pc)
+static char *SDBBP_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -13211,12 +13223,12 @@ static char *SDBBP_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SDC1_GP_(uint64 instruction, img_address m_pc)
+static char *SDC1_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SDC1 %s, %s($%d)", ft, u, 28);
@@ -13233,15 +13245,15 @@ static char *SDC1_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SDC1_S9_(uint64 instruction, img_address m_pc)
+static char *SDC1_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SDC1 %s, %s(%s)", ft, s, rs);
 }
@@ -13257,15 +13269,15 @@ static char *SDC1_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SDC1_U12_(uint64 instruction, img_address m_pc)
+static char *SDC1_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SDC1 %s, %s(%s)", ft, u, rs);
 }
@@ -13281,15 +13293,15 @@ static char *SDC1_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SDC1X(uint64 instruction, img_address m_pc)
+static char *SDC1X(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -13305,15 +13317,15 @@ static char *SDC1X(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SDC1XS(uint64 instruction, img_address m_pc)
+static char *SDC1XS(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -13329,7 +13341,7 @@ static char *SDC1XS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SDC2(uint64 instruction, img_address m_pc)
+static char *SDC2(uint64 instruction, struct Dis_info *info)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13337,7 +13349,7 @@ static char *SDC2(uint64 instruction, img_address m_pc)
 
     g_autofree char *cs = CPR(copy_ui(cs_value));
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SDC2 %s, %s(%s)", cs, s, rs);
 }
@@ -13353,16 +13365,16 @@ static char *SDC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SDM(uint64 instruction, img_address m_pc)
+static char *SDM(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
         count3_value));
 
@@ -13380,13 +13392,13 @@ static char *SDM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SDPC_48_(uint64 instruction, img_address m_pc)
+static char *SDPC_48_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, info->m_pc);
 
     return img_format("SDPC %s, %s", rt, s);
 }
@@ -13402,15 +13414,15 @@ static char *SDPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SDXS(uint64 instruction, img_address m_pc)
+static char *SDXS(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -13426,15 +13438,15 @@ static char *SDXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SDX(uint64 instruction, img_address m_pc)
+static char *SDX(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SDX %s, %s(%s)", rd, rs, rt);
 }
@@ -13450,13 +13462,13 @@ static char *SDX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SEB(uint64 instruction, img_address m_pc)
+static char *SEB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SEB %s, %s", rt, rs);
 }
@@ -13472,13 +13484,13 @@ static char *SEB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SEH(uint64 instruction, img_address m_pc)
+static char *SEH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SEH %s, %s", rt, rs);
 }
@@ -13494,15 +13506,15 @@ static char *SEH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SEL_D(uint64 instruction, img_address m_pc)
+static char *SEL_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("SEL.D %s, %s, %s", fd, fs, ft);
 }
@@ -13518,15 +13530,15 @@ static char *SEL_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SEL_S(uint64 instruction, img_address m_pc)
+static char *SEL_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("SEL.S %s, %s, %s", fd, fs, ft);
 }
@@ -13542,15 +13554,15 @@ static char *SEL_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SELEQZ_D(uint64 instruction, img_address m_pc)
+static char *SELEQZ_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("SELEQZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -13566,15 +13578,15 @@ static char *SELEQZ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SELEQZ_S(uint64 instruction, img_address m_pc)
+static char *SELEQZ_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("SELEQZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -13590,15 +13602,15 @@ static char *SELEQZ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SELNEZ_D(uint64 instruction, img_address m_pc)
+static char *SELNEZ_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("SELNEZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -13614,15 +13626,15 @@ static char *SELNEZ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SELNEZ_S(uint64 instruction, img_address m_pc)
+static char *SELNEZ_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("SELNEZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -13638,14 +13650,14 @@ static char *SELNEZ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SEQI(uint64 instruction, img_address m_pc)
+static char *SEQI(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SEQI %s, %s, %s", rt, rs, u);
@@ -13662,15 +13674,15 @@ static char *SEQI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SH_16_(uint64 instruction, img_address m_pc)
+static char *SH_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("SH %s, %s(%s)", rtz3, u, rs3);
 }
@@ -13686,12 +13698,12 @@ static char *SH_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SH_GP_(uint64 instruction, img_address m_pc)
+static char *SH_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SH %s, %s($%d)", rt, u, 28);
@@ -13708,15 +13720,15 @@ static char *SH_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SH_S9_(uint64 instruction, img_address m_pc)
+static char *SH_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SH %s, %s(%s)", rt, s, rs);
 }
@@ -13732,15 +13744,15 @@ static char *SH_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SH_U12_(uint64 instruction, img_address m_pc)
+static char *SH_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SH %s, %s(%s)", rt, u, rs);
 }
@@ -13756,15 +13768,15 @@ static char *SH_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHE(uint64 instruction, img_address m_pc)
+static char *SHE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SHE %s, %s(%s)", rt, s, rs);
 }
@@ -13780,13 +13792,13 @@ static char *SHE(uint64 instruction, img_address m_pc)
  *      shift ------
  *               ac --
  */
-static char *SHILO(uint64 instruction, img_address m_pc)
+static char *SHILO(uint64 instruction, struct Dis_info *info)
 {
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
     g_autofree char *shift = IMMEDIATE_I(copy_i(shift_value));
-    const char *ac = AC(copy_ui(ac_value));
+    const char *ac = AC(copy_ui(ac_value), info);
 
     return img_format("SHILO %s, %s", ac, shift);
 }
@@ -13802,13 +13814,13 @@ static char *SHILO(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static char *SHILOV(uint64 instruction, img_address m_pc)
+static char *SHILOV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *ac = AC(copy_ui(ac_value), info);
 
     return img_format("SHILOV %s, %s", ac, rs);
 }
@@ -13824,14 +13836,14 @@ static char *SHILOV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ----
  */
-static char *SHLL_PH(uint64 instruction, img_address m_pc)
+static char *SHLL_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
@@ -13848,14 +13860,14 @@ static char *SHLL_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ---
  */
-static char *SHLL_QB(uint64 instruction, img_address m_pc)
+static char *SHLL_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
@@ -13873,14 +13885,14 @@ static char *SHLL_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ----
  */
-static char *SHLL_S_PH(uint64 instruction, img_address m_pc)
+static char *SHLL_S_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
@@ -13897,14 +13909,14 @@ static char *SHLL_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa -----
  */
-static char *SHLL_S_W(uint64 instruction, img_address m_pc)
+static char *SHLL_S_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
@@ -13922,15 +13934,15 @@ static char *SHLL_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHLLV_PH(uint64 instruction, img_address m_pc)
+static char *SHLLV_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SHLLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -13946,15 +13958,15 @@ static char *SHLLV_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHLLV_QB(uint64 instruction, img_address m_pc)
+static char *SHLLV_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SHLLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -13971,15 +13983,15 @@ static char *SHLLV_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHLLV_S_PH(uint64 instruction, img_address m_pc)
+static char *SHLLV_S_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SHLLV_S.PH %s, %s, %s", rd, rt, rs);
 }
@@ -13995,15 +14007,15 @@ static char *SHLLV_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHLLV_S_W(uint64 instruction, img_address m_pc)
+static char *SHLLV_S_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SHLLV_S.W %s, %s, %s", rd, rt, rs);
 }
@@ -14019,14 +14031,14 @@ static char *SHLLV_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHRA_PH(uint64 instruction, img_address m_pc)
+static char *SHRA_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
@@ -14043,14 +14055,14 @@ static char *SHRA_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHRA_QB(uint64 instruction, img_address m_pc)
+static char *SHRA_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
@@ -14067,14 +14079,14 @@ static char *SHRA_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHRA_R_PH(uint64 instruction, img_address m_pc)
+static char *SHRA_R_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
@@ -14091,14 +14103,14 @@ static char *SHRA_R_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHRA_R_QB(uint64 instruction, img_address m_pc)
+static char *SHRA_R_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
@@ -14115,14 +14127,14 @@ static char *SHRA_R_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHRA_R_W(uint64 instruction, img_address m_pc)
+static char *SHRA_R_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
@@ -14139,15 +14151,15 @@ static char *SHRA_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHRAV_PH(uint64 instruction, img_address m_pc)
+static char *SHRAV_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SHRAV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14163,15 +14175,15 @@ static char *SHRAV_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHRAV_QB(uint64 instruction, img_address m_pc)
+static char *SHRAV_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SHRAV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14187,15 +14199,15 @@ static char *SHRAV_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHRAV_R_PH(uint64 instruction, img_address m_pc)
+static char *SHRAV_R_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SHRAV_R.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14211,15 +14223,15 @@ static char *SHRAV_R_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHRAV_R_QB(uint64 instruction, img_address m_pc)
+static char *SHRAV_R_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SHRAV_R.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14235,15 +14247,15 @@ static char *SHRAV_R_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHRAV_R_W(uint64 instruction, img_address m_pc)
+static char *SHRAV_R_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SHRAV_R.W %s, %s, %s", rd, rt, rs);
 }
@@ -14259,14 +14271,14 @@ static char *SHRAV_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ----
  */
-static char *SHRL_PH(uint64 instruction, img_address m_pc)
+static char *SHRL_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
@@ -14283,14 +14295,14 @@ static char *SHRL_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ---
  */
-static char *SHRL_QB(uint64 instruction, img_address m_pc)
+static char *SHRL_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
@@ -14308,15 +14320,15 @@ static char *SHRL_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHRLV_PH(uint64 instruction, img_address m_pc)
+static char *SHRLV_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SHRLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14332,15 +14344,15 @@ static char *SHRLV_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHRLV_QB(uint64 instruction, img_address m_pc)
+static char *SHRLV_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SHRLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14356,15 +14368,15 @@ static char *SHRLV_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHX(uint64 instruction, img_address m_pc)
+static char *SHX(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SHX %s, %s(%s)", rd, rs, rt);
 }
@@ -14380,15 +14392,15 @@ static char *SHX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SHXS(uint64 instruction, img_address m_pc)
+static char *SHXS(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -14404,7 +14416,7 @@ static char *SHXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SIGRIE(uint64 instruction, img_address m_pc)
+static char *SIGRIE(uint64 instruction, struct Dis_info *info)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -14424,14 +14436,14 @@ static char *SIGRIE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SLL_16_(uint64 instruction, img_address m_pc)
+static char *SLL_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 shift3_value = extract_shift3_2_1_0(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
     g_autofree char *shift3 = IMMEDIATE_UI(encode_shift3_from_shift(
         shift3_value));
 
@@ -14449,14 +14461,14 @@ static char *SLL_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SLL_32_(uint64 instruction, img_address m_pc)
+static char *SLL_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("SLL %s, %s, %s", rt, rs, shift);
@@ -14473,15 +14485,15 @@ static char *SLL_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SLLV(uint64 instruction, img_address m_pc)
+static char *SLLV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SLLV %s, %s, %s", rd, rs, rt);
 }
@@ -14497,15 +14509,15 @@ static char *SLLV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SLT(uint64 instruction, img_address m_pc)
+static char *SLT(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SLT %s, %s, %s", rd, rs, rt);
 }
@@ -14521,14 +14533,14 @@ static char *SLT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SLTI(uint64 instruction, img_address m_pc)
+static char *SLTI(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SLTI %s, %s, %s", rt, rs, u);
@@ -14545,14 +14557,14 @@ static char *SLTI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SLTIU(uint64 instruction, img_address m_pc)
+static char *SLTIU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SLTIU %s, %s, %s", rt, rs, u);
@@ -14569,15 +14581,15 @@ static char *SLTIU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SLTU(uint64 instruction, img_address m_pc)
+static char *SLTU(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SLTU %s, %s, %s", rd, rs, rt);
 }
@@ -14593,15 +14605,15 @@ static char *SLTU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SOV(uint64 instruction, img_address m_pc)
+static char *SOV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SOV %s, %s, %s", rd, rs, rt);
 }
@@ -14617,7 +14629,7 @@ static char *SOV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SPECIAL2(uint64 instruction, img_address m_pc)
+static char *SPECIAL2(uint64 instruction, struct Dis_info *info)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
@@ -14637,13 +14649,13 @@ static char *SPECIAL2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SQRT_D(uint64 instruction, img_address m_pc)
+static char *SQRT_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("SQRT.D %s, %s", ft, fs);
 }
@@ -14659,13 +14671,13 @@ static char *SQRT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SQRT_S(uint64 instruction, img_address m_pc)
+static char *SQRT_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("SQRT.S %s, %s", ft, fs);
 }
@@ -14681,14 +14693,14 @@ static char *SQRT_S(uint64 instruction, img_address m_pc)
  *               rd -----
  *                    sa -----
  */
-static char *SRA(uint64 instruction, img_address m_pc)
+static char *SRA(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("SRA %s, %s, %s", rt, rs, shift);
@@ -14705,15 +14717,15 @@ static char *SRA(uint64 instruction, img_address m_pc)
  *          rt -----
  *               rd -----
  */
-static char *SRAV(uint64 instruction, img_address m_pc)
+static char *SRAV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SRAV %s, %s, %s", rd, rs, rt);
 }
@@ -14729,14 +14741,14 @@ static char *SRAV(uint64 instruction, img_address m_pc)
  *          rt -----
  *               rd -----
  */
-static char *SRL_16_(uint64 instruction, img_address m_pc)
+static char *SRL_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 shift3_value = extract_shift3_2_1_0(instruction);
 
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
     g_autofree char *shift3 = IMMEDIATE_UI(encode_shift3_from_shift(
         shift3_value));
 
@@ -14754,14 +14766,14 @@ static char *SRL_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SRL_32_(uint64 instruction, img_address m_pc)
+static char *SRL_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("SRL %s, %s, %s", rt, rs, shift);
@@ -14778,15 +14790,15 @@ static char *SRL_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SRLV(uint64 instruction, img_address m_pc)
+static char *SRLV(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SRLV %s, %s, %s", rd, rs, rt);
 }
@@ -14802,15 +14814,15 @@ static char *SRLV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUB(uint64 instruction, img_address m_pc)
+static char *SUB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUB %s, %s, %s", rd, rs, rt);
 }
@@ -14826,15 +14838,15 @@ static char *SUB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUB_D(uint64 instruction, img_address m_pc)
+static char *SUB_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("SUB.D %s, %s, %s", fd, fs, ft);
 }
@@ -14850,15 +14862,15 @@ static char *SUB_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUB_S(uint64 instruction, img_address m_pc)
+static char *SUB_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy_ui(fd_value));
-    const char *fs = FPR(copy_ui(fs_value));
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *fd = FPR(copy_ui(fd_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
+    const char *ft = FPR(copy_ui(ft_value), info);
 
     return img_format("SUB.S %s, %s, %s", fd, fs, ft);
 }
@@ -14874,15 +14886,15 @@ static char *SUB_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBQ_PH(uint64 instruction, img_address m_pc)
+static char *SUBQ_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14899,15 +14911,15 @@ static char *SUBQ_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBQ_S_PH(uint64 instruction, img_address m_pc)
+static char *SUBQ_S_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14924,15 +14936,15 @@ static char *SUBQ_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBQ_S_W(uint64 instruction, img_address m_pc)
+static char *SUBQ_S_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -14949,15 +14961,15 @@ static char *SUBQ_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBQH_PH(uint64 instruction, img_address m_pc)
+static char *SUBQH_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14974,15 +14986,15 @@ static char *SUBQH_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBQH_R_PH(uint64 instruction, img_address m_pc)
+static char *SUBQH_R_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14999,15 +15011,15 @@ static char *SUBQH_R_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBQH_R_W(uint64 instruction, img_address m_pc)
+static char *SUBQH_R_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -15024,15 +15036,15 @@ static char *SUBQH_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBQH_W(uint64 instruction, img_address m_pc)
+static char *SUBQH_W(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -15048,15 +15060,15 @@ static char *SUBQH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBU_16_(uint64 instruction, img_address m_pc)
+static char *SUBU_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value, info), info);
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
 
     return img_format("SUBU %s, %s, %s", rd3, rs3, rt3);
 }
@@ -15072,15 +15084,15 @@ static char *SUBU_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBU_32_(uint64 instruction, img_address m_pc)
+static char *SUBU_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBU %s, %s, %s", rd, rs, rt);
 }
@@ -15096,15 +15108,15 @@ static char *SUBU_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBU_PH(uint64 instruction, img_address m_pc)
+static char *SUBU_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15120,15 +15132,15 @@ static char *SUBU_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBU_QB(uint64 instruction, img_address m_pc)
+static char *SUBU_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15145,15 +15157,15 @@ static char *SUBU_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBU_S_PH(uint64 instruction, img_address m_pc)
+static char *SUBU_S_PH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15170,15 +15182,15 @@ static char *SUBU_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBU_S_QB(uint64 instruction, img_address m_pc)
+static char *SUBU_S_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15195,15 +15207,15 @@ static char *SUBU_S_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBUH_QB(uint64 instruction, img_address m_pc)
+static char *SUBUH_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15220,15 +15232,15 @@ static char *SUBUH_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SUBUH_R_QB(uint64 instruction, img_address m_pc)
+static char *SUBUH_R_QB(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SUBUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15244,15 +15256,15 @@ static char *SUBUH_R_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SW_16_(uint64 instruction, img_address m_pc)
+static char *SW_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
-    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
 
     return img_format("SW %s, %s(%s)", rtz3, u, rs3);
 }
@@ -15268,15 +15280,15 @@ static char *SW_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SW_4X4_(uint64 instruction, img_address m_pc)
+static char *SW_4X4_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
     uint64 u_value = extract_u_3_8__s2(instruction);
 
-    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value, info), info);
 
     return img_format("SW %s, %s(%s)", rtz4, u, rs4);
 }
@@ -15292,12 +15304,12 @@ static char *SW_4X4_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SW_GP16_(uint64 instruction, img_address m_pc)
+static char *SW_GP16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
 
-    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value, info), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SW %s, %s($%d)", rtz3, u, 28);
@@ -15314,12 +15326,12 @@ static char *SW_GP16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SW_GP_(uint64 instruction, img_address m_pc)
+static char *SW_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SW %s, %s($%d)", rt, u, 28);
@@ -15336,15 +15348,15 @@ static char *SW_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SW_S9_(uint64 instruction, img_address m_pc)
+static char *SW_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SW %s, %s(%s)", rt, s, rs);
 }
@@ -15360,12 +15372,12 @@ static char *SW_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SW_SP_(uint64 instruction, img_address m_pc)
+static char *SW_SP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SW %s, %s($%d)", rt, u, 29);
@@ -15382,15 +15394,15 @@ static char *SW_SP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SW_U12_(uint64 instruction, img_address m_pc)
+static char *SW_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SW %s, %s(%s)", rt, u, rs);
 }
@@ -15406,12 +15418,12 @@ static char *SW_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SWC1_GP_(uint64 instruction, img_address m_pc)
+static char *SWC1_GP_(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SWC1 %s, %s($%d)", ft, u, 28);
@@ -15428,15 +15440,15 @@ static char *SWC1_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SWC1_S9_(uint64 instruction, img_address m_pc)
+static char *SWC1_S9_(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SWC1 %s, %s(%s)", ft, s, rs);
 }
@@ -15452,15 +15464,15 @@ static char *SWC1_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SWC1_U12_(uint64 instruction, img_address m_pc)
+static char *SWC1_U12_(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SWC1 %s, %s(%s)", ft, u, rs);
 }
@@ -15476,15 +15488,15 @@ static char *SWC1_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SWC1X(uint64 instruction, img_address m_pc)
+static char *SWC1X(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -15500,15 +15512,15 @@ static char *SWC1X(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SWC1XS(uint64 instruction, img_address m_pc)
+static char *SWC1XS(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -15524,7 +15536,7 @@ static char *SWC1XS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SWC2(uint64 instruction, img_address m_pc)
+static char *SWC2(uint64 instruction, struct Dis_info *info)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15532,7 +15544,7 @@ static char *SWC2(uint64 instruction, img_address m_pc)
 
     g_autofree char *cs = CPR(copy_ui(cs_value));
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SWC2 %s, %s(%s)", cs, s, rs);
 }
@@ -15548,15 +15560,15 @@ static char *SWC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SWE(uint64 instruction, img_address m_pc)
+static char *SWE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SWE %s, %s(%s)", rt, s, rs);
 }
@@ -15572,16 +15584,16 @@ static char *SWE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SWM(uint64 instruction, img_address m_pc)
+static char *SWM(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
         count3_value));
 
@@ -15599,13 +15611,13 @@ static char *SWM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SWPC_48_(uint64 instruction, img_address m_pc)
+static char *SWPC_48_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    const char *rt = GPR(copy_ui(rt_value), info);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, info->m_pc);
 
     return img_format("SWPC %s, %s", rt, s);
 }
@@ -15621,15 +15633,15 @@ static char *SWPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SWX(uint64 instruction, img_address m_pc)
+static char *SWX(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SWX %s, %s(%s)", rd, rs, rt);
 }
@@ -15645,15 +15657,15 @@ static char *SWX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SWXS(uint64 instruction, img_address m_pc)
+static char *SWXS(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("SWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -15669,7 +15681,7 @@ static char *SWXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SYNC(uint64 instruction, img_address m_pc)
+static char *SYNC(uint64 instruction, struct Dis_info *info)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
@@ -15689,13 +15701,13 @@ static char *SYNC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SYNCI(uint64 instruction, img_address m_pc)
+static char *SYNCI(uint64 instruction, struct Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SYNCI %s(%s)", s, rs);
 }
@@ -15711,13 +15723,13 @@ static char *SYNCI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SYNCIE(uint64 instruction, img_address m_pc)
+static char *SYNCIE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("SYNCIE %s(%s)", s, rs);
 }
@@ -15733,7 +15745,7 @@ static char *SYNCIE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *SYSCALL_16_(uint64 instruction, img_address m_pc)
+static char *SYSCALL_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
@@ -15751,7 +15763,7 @@ static char *SYSCALL_16_(uint64 instruction, img_address m_pc)
  *  00000000000010
  *           code ------------------
  */
-static char *SYSCALL_32_(uint64 instruction, img_address m_pc)
+static char *SYSCALL_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
@@ -15771,13 +15783,13 @@ static char *SYSCALL_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TEQ(uint64 instruction, img_address m_pc)
+static char *TEQ(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("TEQ %s, %s", rs, rt);
 }
@@ -15793,7 +15805,7 @@ static char *TEQ(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TLBGINV(uint64 instruction, img_address m_pc)
+static char *TLBGINV(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -15811,7 +15823,7 @@ static char *TLBGINV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TLBGINVF(uint64 instruction, img_address m_pc)
+static char *TLBGINVF(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -15829,7 +15841,7 @@ static char *TLBGINVF(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TLBGP(uint64 instruction, img_address m_pc)
+static char *TLBGP(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -15847,7 +15859,7 @@ static char *TLBGP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TLBGR(uint64 instruction, img_address m_pc)
+static char *TLBGR(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -15865,7 +15877,7 @@ static char *TLBGR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TLBGWI(uint64 instruction, img_address m_pc)
+static char *TLBGWI(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -15883,7 +15895,7 @@ static char *TLBGWI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TLBGWR(uint64 instruction, img_address m_pc)
+static char *TLBGWR(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -15901,7 +15913,7 @@ static char *TLBGWR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TLBINV(uint64 instruction, img_address m_pc)
+static char *TLBINV(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -15919,7 +15931,7 @@ static char *TLBINV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TLBINVF(uint64 instruction, img_address m_pc)
+static char *TLBINVF(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -15937,7 +15949,7 @@ static char *TLBINVF(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TLBP(uint64 instruction, img_address m_pc)
+static char *TLBP(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -15955,7 +15967,7 @@ static char *TLBP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TLBR(uint64 instruction, img_address m_pc)
+static char *TLBR(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -15973,7 +15985,7 @@ static char *TLBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TLBWI(uint64 instruction, img_address m_pc)
+static char *TLBWI(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -15991,7 +16003,7 @@ static char *TLBWI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TLBWR(uint64 instruction, img_address m_pc)
+static char *TLBWR(uint64 instruction, struct Dis_info *info)
 {
     (void)instruction;
 
@@ -16009,13 +16021,13 @@ static char *TLBWR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TNE(uint64 instruction, img_address m_pc)
+static char *TNE(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("TNE %s, %s", rs, rt);
 }
@@ -16031,13 +16043,13 @@ static char *TNE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TRUNC_L_D(uint64 instruction, img_address m_pc)
+static char *TRUNC_L_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("TRUNC.L.D %s, %s", ft, fs);
 }
@@ -16053,13 +16065,13 @@ static char *TRUNC_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TRUNC_L_S(uint64 instruction, img_address m_pc)
+static char *TRUNC_L_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("TRUNC.L.S %s, %s", ft, fs);
 }
@@ -16075,13 +16087,13 @@ static char *TRUNC_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TRUNC_W_D(uint64 instruction, img_address m_pc)
+static char *TRUNC_W_D(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("TRUNC.W.D %s, %s", ft, fs);
 }
@@ -16097,13 +16109,13 @@ static char *TRUNC_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *TRUNC_W_S(uint64 instruction, img_address m_pc)
+static char *TRUNC_W_S(uint64 instruction, struct Dis_info *info)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy_ui(ft_value));
-    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value), info);
+    const char *fs = FPR(copy_ui(fs_value), info);
 
     return img_format("TRUNC.W.S %s, %s", ft, fs);
 }
@@ -16119,16 +16131,16 @@ static char *TRUNC_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *UALDM(uint64 instruction, img_address m_pc)
+static char *UALDM(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
         count3_value));
 
@@ -16146,15 +16158,15 @@ static char *UALDM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *UALH(uint64 instruction, img_address m_pc)
+static char *UALH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("UALH %s, %s(%s)", rt, s, rs);
 }
@@ -16170,16 +16182,16 @@ static char *UALH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *UALWM(uint64 instruction, img_address m_pc)
+static char *UALWM(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
         count3_value));
 
@@ -16197,16 +16209,16 @@ static char *UALWM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *UASDM(uint64 instruction, img_address m_pc)
+static char *UASDM(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
         count3_value));
 
@@ -16224,15 +16236,15 @@ static char *UASDM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *UASH(uint64 instruction, img_address m_pc)
+static char *UASH(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("UASH %s, %s(%s)", rt, s, rs);
 }
@@ -16248,16 +16260,16 @@ static char *UASH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *UASWM(uint64 instruction, img_address m_pc)
+static char *UASWM(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
         count3_value));
 
@@ -16275,7 +16287,7 @@ static char *UASWM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *UDI(uint64 instruction, img_address m_pc)
+static char *UDI(uint64 instruction, struct Dis_info *info)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
@@ -16293,7 +16305,7 @@ static char *UDI(uint64 instruction, img_address m_pc)
  *  001000          1100001101111111
  *   code ----------
  */
-static char *WAIT(uint64 instruction, img_address m_pc)
+static char *WAIT(uint64 instruction, struct Dis_info *info)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
@@ -16313,12 +16325,12 @@ static char *WAIT(uint64 instruction, img_address m_pc)
  *     rt -----
  *        mask -------
  */
-static char *WRDSP(uint64 instruction, img_address m_pc)
+static char *WRDSP(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
     g_autofree char *mask = IMMEDIATE_UI(copy_ui(mask_value));
 
     return img_format("WRDSP %s, %s", rt, mask);
@@ -16335,13 +16347,13 @@ static char *WRDSP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *WRPGPR(uint64 instruction, img_address m_pc)
+static char *WRPGPR(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("WRPGPR %s, %s", rt, rs);
 }
@@ -16357,13 +16369,13 @@ static char *WRPGPR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *XOR_16_(uint64 instruction, img_address m_pc)
+static char *XOR_16_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value, info), info);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value, info), info);
 
     return img_format("XOR %s, %s", rs3, rt3);
 }
@@ -16379,15 +16391,15 @@ static char *XOR_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *XOR_32_(uint64 instruction, img_address m_pc)
+static char *XOR_32_(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy_ui(rd_value));
-    const char *rs = GPR(copy_ui(rs_value));
-    const char *rt = GPR(copy_ui(rt_value));
+    const char *rd = GPR(copy_ui(rd_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
+    const char *rt = GPR(copy_ui(rt_value), info);
 
     return img_format("XOR %s, %s, %s", rd, rs, rt);
 }
@@ -16403,14 +16415,14 @@ static char *XOR_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static char *XORI(uint64 instruction, img_address m_pc)
+static char *XORI(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
     g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("XORI %s, %s, %s", rt, rs, u);
@@ -16426,13 +16438,13 @@ static char *XORI(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static char *YIELD(uint64 instruction, img_address m_pc)
+static char *YIELD(uint64 instruction, struct Dis_info *info)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy_ui(rt_value));
-    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value), info);
+    const char *rs = GPR(copy_ui(rs_value), info);
 
     return img_format("YIELD %s, %s", rt, rs);
 }
@@ -22237,7 +22249,7 @@ static struct Pool MAJOR[2] = {
 
 
 static int nanomips_dis(char *buf,
-                 unsigned address,
+                 struct Dis_info *info,
                  unsigned short one,
                  unsigned short two,
                  unsigned short three)
@@ -22246,7 +22258,7 @@ static int nanomips_dis(char *buf,
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
-    int size = Disassemble(bits, disasm, type, MAJOR, 2, address);
+    int size = Disassemble(bits, disasm, type, MAJOR, 2, info);
 
     strcpy(buf, disasm);
     return size;
@@ -22268,6 +22280,11 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
     info->target = 0;
     info->target2 = 0;
 
+    struct Dis_info disassm_info;
+    disassm_info.m_pc = memaddr;
+    disassm_info.fprintf_func = info->fprintf_func;
+    disassm_info.stream = info->stream;
+
     status = (*info->read_memory_func)(memaddr, buffer, 2, info);
     if (status != 0) {
         (*info->memory_error_func)(status, memaddr, info);
@@ -22316,7 +22333,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         (*info->fprintf_func)(info->stream, "     ");
     }
 
-    int length = nanomips_dis(buf, memaddr, insn1, insn2, insn3);
+    int length = nanomips_dis(buf, &disassm_info, insn1, insn2, insn3);
 
     /* FIXME: Should probably use a hash table on the major opcode here.  */
 
-- 
2.25.1


