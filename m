Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849F75B5A46
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 14:40:06 +0200 (CEST)
Received: from localhost ([::1]:34954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXijN-0006IO-JL
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 08:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiYL-0003tM-Lb
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:28:42 -0400
Received: from mail-db8eur05on2095.outbound.protection.outlook.com
 ([40.107.20.95]:56929 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiYG-0005mE-Vz
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:28:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVGpkHs+3T031Y4XJ8UktB/dCE12hI+MsS5gPYi+BS7ZAMlr623+AmmrGySqi6J6XxlcyxfNNTTJGrrSyD9a8VRfq6giE8ZZx05O86nC4J0XjlXK/Fjgj76QED6/ZwnZNqbbXOT3wPTcqx6MctUpob1JRvuVGdoJ5dbn6nPr7Ppe5lMSgwCTa4eXjToxjjoXTbqF/1FK05tOphyLwlvgIV4m1WTByFz3626HG3dsu4FUFlZJpRvyYF57GP9lemsb0RQddUKOBlWeae3uupzGxyyvIc94tmq1gRtY4ZpSL/2krxOExy6vJ1TUYYqsJPWthCFZizp8BbnNREKFwmkYCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbx0ZB1BVjv1kDBX4C9RfHrYu26WAOE9uG+/pLdTWVQ=;
 b=dBvcHUb/EffoIguhhqF3hlzw/6bp+5lAca1d8ppRq1cJP5dDLJBkwZY2I2G26pbN4wAjp1eTfTt2JJAEAKPSbt1MVxXcraktK+hf7K7k4GjXxRo+64bbYqTcxKsKr1uF3EIXDuPPaxXaLBi3lxaaxHkOo90uKqOM3HT2OBp5P+hvkYutVfq/aAwfOOPKcGM4m/bP2Q9neY382apLKo9B+HKwOmqeCA27GL3utj394VWaTdloE9gA/q4zdr7GXBmmh/JJIpRn/jsEXWvrCLIKq/f+Qe1ucd8xg0jlVoFhudZV6E9oBvhTYln7LKRMzQ7nkQS1Q757uHIYBT6P0lQQ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbx0ZB1BVjv1kDBX4C9RfHrYu26WAOE9uG+/pLdTWVQ=;
 b=CZAqUvjq/J9SOvdVt625ExLJYEzRkodV3QjV36ldKfMwl9fmxQ31fbW8pmkgPjWTbhzQETDohvtBGbUB9nfS7hMHw6QGUQ+PcLq7x2dFFb1LCqlpKFUIz6X0csIElnjdlUPXXWejMe++Io21RvcQnCJswC6/xUAC3LYY3rki2cY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS2PR03MB9768.eurprd03.prod.outlook.com (2603:10a6:20b:60b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:28:32 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:28:32 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v3 05/24] disas/nanomips: Remove helper methods from class
Date: Mon, 12 Sep 2022 14:26:16 +0200
Message-Id: <20220912122635.74032-6-milica.lazarevic@syrmia.com>
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
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|AS2PR03MB9768:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b55f44a-7de6-4956-3d63-08da94ba4deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MOxeJuGnmwE9Q+dQtPG0YzplAai+GvbzCD/tdcFO4CSN6X0WxJ+4LUSzuByJRc+B2j9qAsve1WhhVURBpeyYX84SAgdTWUlEcWGJIKYChpftAK83QPZmXijWhnC3SUrXoho8EZWdzzuNK9/wp6/Lf8LDvoNVthrFcKGXzjzQxGPUEgpUB6Qx+peZD4L4XcxLSlYswXrmntQlHYs1VYm6R4wBz+uR/aWcLX6BRtQrCSVr0KTEfild40bgTfR/4q2Ud5J7DdMOxDmlh3Rou6bIL14cDGqR2tghKcLWMNpipPpy9dREtF9ZuJl5UsuAv7kicvVY//S/Q+jfFULRUBdJOELI2ZqYKJLJ8EcJOJEwb9LJiezifmhu6uLvsfaETYBXLsCWyc2QaIXah3jOzre8Ml0HBKx8T2DzLUAXtI4STx4OAHjjfkpVPP9a+Aq5T1FpmtkeVeKQhnHBHL+YZA0RBruW2EcsSy/S4s1lZIO6sSzU0PCPlQ93utFVsx/k9BWAPqRmgvJJC8KZ1xMZ299cqIRkHtQMEhnQobsV4MS2w2yDNvIAuq1cMGBv9vWB2xkUR5fY4Mfa5TG01S8q2/AlyE+dTBTYvm/2W4ffRrnsFRImiFfPr0dHvh40QdMx/bPJXSHYV60IGq+TJCUZWBUY9CYdLx5ZMx8HIh+Tmq8SUHHpt8AJ1qiRspk1MdTgKa7RypM4wgyoMxto5FLzZ8Ch2a9xQ9Mk4uGU954+S/1TLof+7RO9mcHRWEItiHDwPgzf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(39840400004)(136003)(346002)(366004)(86362001)(66946007)(8676002)(38100700002)(66556008)(66476007)(4326008)(36756003)(38350700002)(186003)(83380400001)(2616005)(52116002)(6512007)(26005)(478600001)(107886003)(6486002)(41300700001)(6506007)(6666004)(2906002)(6916009)(316002)(1076003)(5660300002)(8936002)(44832011)(30864003)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+HA8tZ0ezjYwxu+ZJ2r689Our3lWREecWo0kzRcZ2BaqyIVY4240pk2dhDmy?=
 =?us-ascii?Q?/WFEn8iXylAuyoMtJY35PMML0ry9r2/c/9m3Oa2zuhYnPmdqut+6YSUpBE1X?=
 =?us-ascii?Q?feUE3WcewaKngHm9ryJgSDdkDmUg+2vrXcw5MQ2tqIGo/U9p6Z+dDWWa/Nan?=
 =?us-ascii?Q?Panmsgza5ZEmWLsGWCE7TZfswxFs5zlvn8krZAqNRrpPD+SbFv0dTCF32aZu?=
 =?us-ascii?Q?xyjYzMS0foRDMYnlMIGAvZtyGIZcpAQ14isTd+uP4ywOkgBnskSpGilWPB16?=
 =?us-ascii?Q?Y+nB1tfrijJsAL67HG2Jc9zKaq+/n2/LMXi44xMig74MY06vxp7ihGP9KwOV?=
 =?us-ascii?Q?VTCPIBgpcMDQ/sp0U8hoeZRegKP14IWQIDJQNzol4YAYtbHafSSDLQEWAp7o?=
 =?us-ascii?Q?gzdY92Xn12Prj2uonpetN5pjtBHbNVApkiM+7x0dzDIevxk1kAXIurr/D0P0?=
 =?us-ascii?Q?+HOklk7eKhS0fcSX8wZ0uXnFd7UryDdjGHxHmWZFGBchb5NGbUi+S4fl8Axs?=
 =?us-ascii?Q?5lApbVWQFjjDIymskk6wFBxM+Yu1i1CvDJ54m1j/ewu3/XxoL5DbQkJrwXFp?=
 =?us-ascii?Q?VtlU7zLjaMDoV2/5VBz6w7N2uVc40/nRPCM6IKoBp6zXLv6heT5GVQl9EWHx?=
 =?us-ascii?Q?iOXxIy0liq7rJDFmBg/wGjaAiCtBqdOLD4Jz5t7UBcZEAnXZHmiBtQ2y9XpC?=
 =?us-ascii?Q?tzBule39YGYekyl9wPCFCyAeo0V5K1YLPeEvFMgnJoUxmMGcqHYdYJDL/Gl2?=
 =?us-ascii?Q?40/K2KRueeAtAShBhcKigIxO6F8J2Iz0z38eg5WhFbgdL+Fcc0XxSmzygL2q?=
 =?us-ascii?Q?p3Iz8gXcEiYdcHD+KdJizrjusZIAB+m/9LRKOmDqk8VjAxK9dNx2zwvKnvW4?=
 =?us-ascii?Q?gBQFVtuXFnnA855aquV9O2DnfMJ8vNrnUk8GrauQP5T6O6p5gV5KPBkAF2EL?=
 =?us-ascii?Q?KMAgBrSQ4ZejDSE/RZgh2oqUyIoFhyubtmucHo9rswJpOErcHl8JGATYSQI/?=
 =?us-ascii?Q?CPyEwPPl7mKkwAAjq6jFdt2hVGde5VydhukmzR8eJcRYaaG6yMb6nPnm3Mkl?=
 =?us-ascii?Q?xLjqLbWtVDLi4XS31qjAS+pINpcrg8IPY4m+cR3x3oqufejxvvwsib+MlZkA?=
 =?us-ascii?Q?poYMDBgsZRbtihlj/b/lsf/0Z0pfEwJ7rqB0liI0PXp0tQaqW+unptnGwm4E?=
 =?us-ascii?Q?zIREawiBOok1LU8onYpb1jSZrqGRb+YsM7J87obF0JDgMHhKvw5OXjHbSWDU?=
 =?us-ascii?Q?AKnYcl0Lplp51XsVXoslpNDWtwJBMOjbxuF+KyPf94js1WHIRS/JQdQACd4D?=
 =?us-ascii?Q?0pSqmIgH8Nq7aJe9j1Rang0nTqMrMEP/JIqg02vqYa18CNtQgj9Sa7jH4W0T?=
 =?us-ascii?Q?IQ/VT+NFWOY+F8cejemrzfAcbPmU41Qw6EH+vD8jwDEaAobr0JSZv5AxbkdL?=
 =?us-ascii?Q?bP7SFaZaJ0yNV7rqxEs9t8hyGTUoSvXAjFpOJXuXVB6nYTGaeaGivqiiEj5i?=
 =?us-ascii?Q?+5lyatjaja2cBA2C2zpkw8IcNmkRLTWU8lLkoyR0GJQdT11HA+Em/SBwbuNM?=
 =?us-ascii?Q?V8Kp2c1XS1zOxpeupW0o+eyFHpQXlCGJ/A29HPiLvW1auROi6or8AiIAaie2?=
 =?us-ascii?Q?uQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b55f44a-7de6-4956-3d63-08da94ba4deb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:28:32.0311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2x7ln4W2IKh1T4Lft/LH82X26EnMfUKyV1FP37xgMI3Oy5aRqpuBfaQfBvYGIpnov3C7Lqn9ZcZu4XFnt2snMAavzfizueoALMpQVAaA+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9768
Received-SPF: pass client-ip=40.107.20.95;
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

Helper methods from NMD class like NMD::renumber_registers,
NMD::decode_gpr_gpr4... etc. are removed from the class. They're now
declared global static functions.

Following helper methods have been deleted because they're not used by
the nanomips disassembler:
- NMD::encode_msbd_from_pos_and_size,
- NMD::encode_s_from_s_hi,
- NMD::neg_copy

Global functions used by those methods:
- nanomips_dis
- sign_extend
- extract_bits
have also been defined as static global functions.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.cpp | 328 +++++++++++++++++++++------------------------
 disas/nanomips.h   | 144 --------------------
 2 files changed, 154 insertions(+), 318 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 9005f26ee3..271afcde07 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -41,7 +41,7 @@
 #define IMGASSERTONCE(test)
 
 
-int nanomips_dis(char *buf,
+static int nanomips_dis(char *buf,
                  Dis_info *info,
                  unsigned short one,
                  unsigned short two,
@@ -259,20 +259,20 @@ std::string to_string(img_address a)
 }
 
 
-uint64 extract_bits(uint64 data, uint32 bit_offset, uint32 bit_size)
+static uint64 extract_bits(uint64 data, uint32 bit_offset, uint32 bit_size)
 {
     return (data << (64 - (bit_size + bit_offset))) >> (64 - bit_size);
 }
 
 
-int64 sign_extend(int64 data, int msb)
+static int64 sign_extend(int64 data, int msb)
 {
     uint64 shift = 63 - msb;
     return (data << shift) >> shift;
 }
 
 
-uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
+static uint64 renumber_registers(uint64 index, uint64 *register_list,
                                size_t register_list_size)
 {
     if (index < register_list_size) {
@@ -287,7 +287,7 @@ uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
 
 
 /*
- * NMD::decode_gpr_gpr4() - decoder for 'gpr4' gpr encoding type
+ * decode_gpr_gpr4() - decoder for 'gpr4' gpr encoding type
  *
  *   Map a 4-bit code to the 5-bit register space according to this pattern:
  *
@@ -312,7 +312,7 @@ uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
  *     - MUL[4X4]
  *     - SW[4X4]
  */
-uint64 NMD::decode_gpr_gpr4(uint64 d)
+static uint64 decode_gpr_gpr4(uint64 d)
 {
     static uint64 register_list[] = {  8,  9, 10, 11,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
@@ -322,7 +322,7 @@ uint64 NMD::decode_gpr_gpr4(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr4_zero() - decoder for 'gpr4.zero' gpr encoding type
+ * decode_gpr_gpr4_zero() - decoder for 'gpr4.zero' gpr encoding type
  *
  *   Map a 4-bit code to the 5-bit register space according to this pattern:
  *
@@ -348,7 +348,7 @@ uint64 NMD::decode_gpr_gpr4(uint64 d)
  *     - MOVEP
  *     - SW[4X4]
  */
-uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
+static uint64 decode_gpr_gpr4_zero(uint64 d)
 {
     static uint64 register_list[] = {  8,  9, 10,  0,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
@@ -358,7 +358,7 @@ uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr3() - decoder for 'gpr3' gpr encoding type
+ * decode_gpr_gpr3() - decoder for 'gpr3' gpr encoding type
  *
  *   Map a 3-bit code to the 5-bit register space according to this pattern:
  *
@@ -407,7 +407,7 @@ uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
  *     - SW[16]
  *     - XOR[16]
  */
-uint64 NMD::decode_gpr_gpr3(uint64 d)
+static uint64 decode_gpr_gpr3(uint64 d)
 {
     static uint64 register_list[] = { 16, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -416,7 +416,7 @@ uint64 NMD::decode_gpr_gpr3(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr3_src_store() - decoder for 'gpr3.src.store' gpr encoding
+ * decode_gpr_gpr3_src_store() - decoder for 'gpr3.src.store' gpr encoding
  *     type
  *
  *   Map a 3-bit code to the 5-bit register space according to this pattern:
@@ -447,7 +447,7 @@ uint64 NMD::decode_gpr_gpr3(uint64 d)
  *     - SW[16]
  *     - SW[GP16]
  */
-uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
+static uint64 decode_gpr_gpr3_src_store(uint64 d)
 {
     static uint64 register_list[] = {  0, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -456,7 +456,7 @@ uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr2_reg1() - decoder for 'gpr2.reg1' gpr encoding type
+ * decode_gpr_gpr2_reg1() - decoder for 'gpr2.reg1' gpr encoding type
  *
  *   Map a 2-bit code to the 5-bit register space according to this pattern:
  *
@@ -477,7 +477,7 @@ uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
+static uint64 decode_gpr_gpr2_reg1(uint64 d)
 {
     static uint64 register_list[] = {  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -486,7 +486,7 @@ uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr2_reg2() - decoder for 'gpr2.reg2' gpr encoding type
+ * decode_gpr_gpr2_reg2() - decoder for 'gpr2.reg2' gpr encoding type
  *
  *   Map a 2-bit code to the 5-bit register space according to this pattern:
  *
@@ -507,7 +507,7 @@ uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
+static uint64 decode_gpr_gpr2_reg2(uint64 d)
 {
     static uint64 register_list[] = {  5,  6,  7,  8 };
     return renumber_registers(d, register_list,
@@ -516,7 +516,7 @@ uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr1() - decoder for 'gpr1' gpr encoding type
+ * decode_gpr_gpr1() - decoder for 'gpr1' gpr encoding type
  *
  *   Map a 1-bit code to the 5-bit register space according to this pattern:
  *
@@ -536,7 +536,7 @@ uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
  *
  *     - MOVE.BALC
  */
-uint64 NMD::decode_gpr_gpr1(uint64 d)
+static uint64 decode_gpr_gpr1(uint64 d)
 {
     static uint64 register_list[] = {  4,  5 };
     return renumber_registers(d, register_list,
@@ -544,73 +544,60 @@ uint64 NMD::decode_gpr_gpr1(uint64 d)
 }
 
 
-uint64 NMD::copy(uint64 d)
+static uint64 copy(uint64 d)
 {
     return d;
 }
 
 
-int64 NMD::copy(int64 d)
+static int64 copy(int64 d)
 {
     return d;
 }
 
 
-int64 NMD::neg_copy(uint64 d)
+static int64 neg_copy(uint64 d)
 {
     return 0ll - d;
 }
 
 
-int64 NMD::neg_copy(int64 d)
-{
-    return -d;
-}
-
-
 /* strange wrapper around  gpr3 */
-uint64 NMD::encode_rs3_and_check_rs3_ge_rt3(uint64 d)
+static uint64 encode_rs3_and_check_rs3_ge_rt3(uint64 d)
 {
 return decode_gpr_gpr3(d);
 }
 
 
 /* strange wrapper around  gpr3 */
-uint64 NMD::encode_rs3_and_check_rs3_lt_rt3(uint64 d)
+static uint64 encode_rs3_and_check_rs3_lt_rt3(uint64 d)
 {
     return decode_gpr_gpr3(d);
 }
 
 
 /* nop - done by extraction function */
-uint64 NMD::encode_s_from_address(uint64 d)
+static uint64 encode_s_from_address(uint64 d)
 {
     return d;
 }
 
 
 /* nop - done by extraction function */
-uint64 NMD::encode_u_from_address(uint64 d)
+static uint64 encode_u_from_address(uint64 d)
 {
     return d;
 }
 
 
-/* nop - done by extraction function */
-uint64 NMD::encode_s_from_s_hi(uint64 d)
-{
-    return d;
-}
-
-
-uint64 NMD::encode_count3_from_count(uint64 d)
+static uint64 encode_count3_from_count(uint64 d)
 {
     IMGASSERTONCE(d < 8);
     return d == 0ull ? 8ull : d;
 }
 
 
-uint64 NMD::encode_shift3_from_shift(uint64 d)
+static uint64 encode_shift3_from_shift(uint64 d)
 {
     IMGASSERTONCE(d < 8);
     return d == 0ull ? 8ull : d;
@@ -618,21 +605,21 @@ uint64 NMD::encode_shift3_from_shift(uint64 d)
 
 
 /* special value for load literal */
-int64 NMD::encode_eu_from_s_li16(uint64 d)
+static int64 encode_eu_from_s_li16(uint64 d)
 {
     IMGASSERTONCE(d < 128);
     return d == 127 ? -1 : (int64)d;
 }
 
 
-uint64 NMD::encode_msbd_from_size(uint64 d)
+static uint64 encode_msbd_from_size(uint64 d)
 {
     IMGASSERTONCE(d < 32);
     return d + 1;
 }
 
 
-uint64 NMD::encode_eu_from_u_andi16(uint64 d)
+static uint64 encode_eu_from_u_andi16(uint64 d)
 {
     IMGASSERTONCE(d < 16);
     if (d == 12) {
@@ -645,42 +632,21 @@ uint64 NMD::encode_eu_from_u_andi16(uint64 d)
 }
 
 
-uint64 NMD::encode_msbd_from_pos_and_size(uint64 d)
-{
-    IMGASSERTONCE(0);
-    return d;
-}
-
-
 /* save16 / restore16   ???? */
-uint64 NMD::encode_rt1_from_rt(uint64 d)
+static uint64 encode_rt1_from_rt(uint64 d)
 {
     return d ? 31 : 30;
 }
 
 
 /* ? */
-uint64 NMD::encode_lsb_from_pos_and_size(uint64 d)
+static uint64 encode_lsb_from_pos_and_size(uint64 d)
 {
     return d;
 }
 
 
-std::string NMD::save_restore_list(uint64 rt, uint64 count, uint64 gp)
-{
-    std::string str;
-
-    for (uint64 counter = 0; counter != count; counter++) {
-        bool use_gp = gp && (counter == count - 1);
-        uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
-        str += img_format(",%s", GPR(this_rt));
-    }
-
-    return str;
-}
-
-
-std::string NMD::GPR(uint64 reg)
+static std::string GPR(uint64 reg)
 {
     static const char *gpr_reg[32] = {
         "zero", "at",   "v0",   "v1",   "a0",   "a1",   "a2",   "a3",
@@ -698,7 +664,21 @@ std::string NMD::GPR(uint64 reg)
 }
 
 
-std::string NMD::FPR(uint64 reg)
+static std::string save_restore_list(uint64 rt, uint64 count, uint64 gp)
+{
+    std::string str;
+
+    for (uint64 counter = 0; counter != count; counter++) {
+        bool use_gp = gp && (counter == count - 1);
+        uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
+        str += img_format(",%s", GPR(this_rt));
+    }
+
+    return str;
+}
+
+
+static std::string FPR(uint64 reg)
 {
     static const char *fpr_reg[32] = {
         "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
@@ -716,7 +696,7 @@ std::string NMD::FPR(uint64 reg)
 }
 
 
-std::string NMD::AC(uint64 reg)
+static std::string AC(uint64 reg)
 {
     static const char *ac_reg[4] = {
         "ac0",  "ac1",  "ac2",  "ac3"
@@ -731,26 +711,26 @@ std::string NMD::AC(uint64 reg)
 }
 
 
-std::string NMD::IMMEDIATE(uint64 value)
+static std::string IMMEDIATE(uint64 value)
 {
     return img_format("0x%" PRIx64, value);
 }
 
 
-std::string NMD::IMMEDIATE(int64 value)
+static std::string IMMEDIATE(int64 value)
 {
     return img_format("%" PRId64, value);
 }
 
 
-std::string NMD::CPR(uint64 reg)
+static std::string CPR(uint64 reg)
 {
     /* needs more work */
     return img_format("CP%" PRIu64, reg);
 }
 
 
-std::string NMD::ADDRESS(uint64 value, int instruction_size, Dis_info *info)
+static std::string ADDRESS(uint64 value, int instruction_size, Dis_info *info)
 {
     /* token for string replace */
     img_address address = info->m_pc + value + instruction_size;
@@ -849,7 +829,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
 }
 
 
-uint64 NMD::extract_code_18_to_0(uint64 instruction)
+static uint64 extract_code_18_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 19);
@@ -857,7 +837,7 @@ uint64 NMD::extract_code_18_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift3_2_1_0(uint64 instruction)
+static uint64 extract_shift3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -865,7 +845,7 @@ uint64 NMD::extract_shift3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
+static uint64 extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 9) << 3;
@@ -873,7 +853,7 @@ uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count_3_2_1_0(uint64 instruction)
+static uint64 extract_count_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4);
@@ -881,7 +861,7 @@ uint64 NMD::extract_count_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz3_9_8_7(uint64 instruction)
+static uint64 extract_rtz3_9_8_7(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 3);
@@ -889,7 +869,7 @@ uint64 NMD::extract_rtz3_9_8_7(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_1__s1(uint64 instruction)
+static uint64 extract_u_17_to_1__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 17) << 1;
@@ -897,7 +877,7 @@ uint64 NMD::extract_u_17_to_1__s1(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
+static int64 extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 11, 10);
@@ -906,7 +886,7 @@ int64 NMD::extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
+static int64 extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 11;
@@ -916,7 +896,7 @@ int64 NMD::extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_10(uint64 instruction)
+static uint64 extract_u_10(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 10, 1);
@@ -924,7 +904,7 @@ uint64 NMD::extract_u_10(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz4_27_26_25_23_22_21(uint64 instruction)
+static uint64 extract_rtz4_27_26_25_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 3);
@@ -933,7 +913,7 @@ uint64 NMD::extract_rtz4_27_26_25_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13_12_11(uint64 instruction)
+static uint64 extract_sa_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -941,7 +921,7 @@ uint64 NMD::extract_sa_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_4_3_2_1_0(uint64 instruction)
+static uint64 extract_shift_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -949,7 +929,7 @@ uint64 NMD::extract_shift_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shiftx_10_9_8_7__s1(uint64 instruction)
+static uint64 extract_shiftx_10_9_8_7__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 4) << 1;
@@ -957,7 +937,7 @@ uint64 NMD::extract_shiftx_10_9_8_7__s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_hint_25_24_23_22_21(uint64 instruction)
+static uint64 extract_hint_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -965,7 +945,7 @@ uint64 NMD::extract_hint_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count3_14_13_12(uint64 instruction)
+static uint64 extract_count3_14_13_12(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 12, 3);
@@ -973,7 +953,7 @@ uint64 NMD::extract_count3_14_13_12(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
+static int64 extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 31;
@@ -984,7 +964,7 @@ int64 NMD::extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
+static int64 extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 7;
@@ -994,7 +974,7 @@ int64 NMD::extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u2_10_9(uint64 instruction)
+static uint64 extract_u2_10_9(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 9, 2);
@@ -1002,7 +982,7 @@ uint64 NMD::extract_u2_10_9(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
+static uint64 extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 10);
@@ -1010,7 +990,7 @@ uint64 NMD::extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_rs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1018,7 +998,7 @@ uint64 NMD::extract_rs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_2_1__s1(uint64 instruction)
+static uint64 extract_u_2_1__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 2) << 1;
@@ -1026,7 +1006,7 @@ uint64 NMD::extract_u_2_1__s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_stripe_6(uint64 instruction)
+static uint64 extract_stripe_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 1);
@@ -1034,7 +1014,7 @@ uint64 NMD::extract_stripe_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ac_15_14(uint64 instruction)
+static uint64 extract_ac_15_14(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 14, 2);
@@ -1042,7 +1022,7 @@ uint64 NMD::extract_ac_15_14(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_20_19_18_17_16(uint64 instruction)
+static uint64 extract_shift_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1050,7 +1030,7 @@ uint64 NMD::extract_shift_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rdl_25_24(uint64 instruction)
+static uint64 extract_rdl_25_24(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 24, 1);
@@ -1058,7 +1038,7 @@ uint64 NMD::extract_rdl_25_24(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
+static int64 extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 10;
@@ -1068,7 +1048,7 @@ int64 NMD::extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_eu_6_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_eu_6_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 7);
@@ -1076,7 +1056,7 @@ uint64 NMD::extract_eu_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_shift_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 6);
@@ -1084,7 +1064,7 @@ uint64 NMD::extract_shift_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count_19_18_17_16(uint64 instruction)
+static uint64 extract_count_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 4);
@@ -1092,7 +1072,7 @@ uint64 NMD::extract_count_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_2_1_0(uint64 instruction)
+static uint64 extract_code_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1100,7 +1080,7 @@ uint64 NMD::extract_code_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 12);
@@ -1108,7 +1088,7 @@ uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs_4_3_2_1_0(uint64 instruction)
+static uint64 extract_rs_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -1116,7 +1096,7 @@ uint64 NMD::extract_rs_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_to_3__s3(uint64 instruction)
+static uint64 extract_u_20_to_3__s3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 18) << 3;
@@ -1124,7 +1104,7 @@ uint64 NMD::extract_u_20_to_3__s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4) << 2;
@@ -1132,7 +1112,7 @@ uint64 NMD::extract_u_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cofun_25_24_23(uint64 instruction)
+static uint64 extract_cofun_25_24_23(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 23);
@@ -1140,7 +1120,7 @@ uint64 NMD::extract_cofun_25_24_23(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3) << 2;
@@ -1148,7 +1128,7 @@ uint64 NMD::extract_u_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd3_3_2_1(uint64 instruction)
+static uint64 extract_rd3_3_2_1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 3);
@@ -1156,7 +1136,7 @@ uint64 NMD::extract_rd3_3_2_1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13_12(uint64 instruction)
+static uint64 extract_sa_15_14_13_12(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 12, 4);
@@ -1164,7 +1144,7 @@ uint64 NMD::extract_sa_15_14_13_12(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_25_24_23_22_21(uint64 instruction)
+static uint64 extract_rt_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1172,7 +1152,7 @@ uint64 NMD::extract_rt_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ru_7_6_5_4_3(uint64 instruction)
+static uint64 extract_ru_7_6_5_4_3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 5);
@@ -1180,7 +1160,7 @@ uint64 NMD::extract_ru_7_6_5_4_3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_0(uint64 instruction)
+static uint64 extract_u_17_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 18);
@@ -1188,7 +1168,7 @@ uint64 NMD::extract_u_17_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rsz4_4_2_1_0(uint64 instruction)
+static uint64 extract_rsz4_4_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1197,7 +1177,7 @@ uint64 NMD::extract_rsz4_4_2_1_0(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se21_0_20_to_1_s1(uint64 instruction)
+static int64 extract_s__se21_0_20_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 21;
@@ -1207,7 +1187,7 @@ int64 NMD::extract_s__se21_0_20_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_op_25_to_3(uint64 instruction)
+static uint64 extract_op_25_to_3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 23);
@@ -1215,7 +1195,7 @@ uint64 NMD::extract_op_25_to_3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs4_4_2_1_0(uint64 instruction)
+static uint64 extract_rs4_4_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1224,7 +1204,7 @@ uint64 NMD::extract_rs4_4_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_bit_23_22_21(uint64 instruction)
+static uint64 extract_bit_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 3);
@@ -1232,7 +1212,7 @@ uint64 NMD::extract_bit_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_41_40_39_38_37(uint64 instruction)
+static uint64 extract_rt_41_40_39_38_37(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 37, 5);
@@ -1240,7 +1220,7 @@ uint64 NMD::extract_rt_41_40_39_38_37(uint64 instruction)
 }
 
 
-int64 NMD::extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
+static int64 extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 16, 6);
@@ -1249,7 +1229,7 @@ int64 NMD::extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd2_3_8(uint64 instruction)
+static uint64 extract_rd2_3_8(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 1) << 1;
@@ -1258,7 +1238,7 @@ uint64 NMD::extract_rd2_3_8(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_17_to_0(uint64 instruction)
+static uint64 extract_code_17_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 18);
@@ -1266,7 +1246,7 @@ uint64 NMD::extract_code_17_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_size_20_19_18_17_16(uint64 instruction)
+static uint64 extract_size_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1274,7 +1254,7 @@ uint64 NMD::extract_size_20_19_18_17_16(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 2, 6) << 2;
@@ -1284,7 +1264,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_15_to_0(uint64 instruction)
+static uint64 extract_u_15_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 16);
@@ -1292,7 +1272,7 @@ uint64 NMD::extract_u_15_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_fs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_fs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1300,7 +1280,7 @@ uint64 NMD::extract_fs_20_19_18_17_16(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 8);
@@ -1310,7 +1290,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_stype_20_19_18_17_16(uint64 instruction)
+static uint64 extract_stype_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1318,7 +1298,7 @@ uint64 NMD::extract_stype_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtl_11(uint64 instruction)
+static uint64 extract_rtl_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 9, 1);
@@ -1326,7 +1306,7 @@ uint64 NMD::extract_rtl_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_hs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_hs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1334,7 +1314,7 @@ uint64 NMD::extract_hs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sel_13_12_11(uint64 instruction)
+static uint64 extract_sel_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 3);
@@ -1342,7 +1322,7 @@ uint64 NMD::extract_sel_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_lsb_4_3_2_1_0(uint64 instruction)
+static uint64 extract_lsb_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -1350,7 +1330,7 @@ uint64 NMD::extract_lsb_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_gp_2(uint64 instruction)
+static uint64 extract_gp_2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 1);
@@ -1358,7 +1338,7 @@ uint64 NMD::extract_gp_2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt3_9_8_7(uint64 instruction)
+static uint64 extract_rt3_9_8_7(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 3);
@@ -1366,7 +1346,7 @@ uint64 NMD::extract_rt3_9_8_7(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ft_25_24_23_22_21(uint64 instruction)
+static uint64 extract_ft_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1374,7 +1354,7 @@ uint64 NMD::extract_ft_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_16_15_14_13_12_11(uint64 instruction)
+static uint64 extract_u_17_16_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 7);
@@ -1382,7 +1362,7 @@ uint64 NMD::extract_u_17_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_cs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1390,7 +1370,7 @@ uint64 NMD::extract_cs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt4_9_7_6_5(uint64 instruction)
+static uint64 extract_rt4_9_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 3);
@@ -1399,7 +1379,7 @@ uint64 NMD::extract_rt4_9_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_msbt_10_9_8_7_6(uint64 instruction)
+static uint64 extract_msbt_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 5);
@@ -1407,7 +1387,7 @@ uint64 NMD::extract_msbt_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_5_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_5_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 6) << 2;
@@ -1415,7 +1395,7 @@ uint64 NMD::extract_u_5_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13(uint64 instruction)
+static uint64 extract_sa_15_14_13(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 13, 3);
@@ -1423,7 +1403,7 @@ uint64 NMD::extract_sa_15_14_13(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se14_0_13_to_1_s1(uint64 instruction)
+static int64 extract_s__se14_0_13_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 14;
@@ -1433,7 +1413,7 @@ int64 NMD::extract_s__se14_0_13_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs3_6_5_4(uint64 instruction)
+static uint64 extract_rs3_6_5_4(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 4, 3);
@@ -1441,7 +1421,7 @@ uint64 NMD::extract_rs3_6_5_4(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_31_to_0__s32(uint64 instruction)
+static uint64 extract_u_31_to_0__s32(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 32) << 32;
@@ -1449,7 +1429,7 @@ uint64 NMD::extract_u_31_to_0__s32(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_10_9_8_7_6(uint64 instruction)
+static uint64 extract_shift_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 5);
@@ -1457,7 +1437,7 @@ uint64 NMD::extract_shift_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cs_25_24_23_22_21(uint64 instruction)
+static uint64 extract_cs_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1465,7 +1445,7 @@ uint64 NMD::extract_cs_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shiftx_11_10_9_8_7_6(uint64 instruction)
+static uint64 extract_shiftx_11_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 6);
@@ -1473,7 +1453,7 @@ uint64 NMD::extract_shiftx_11_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_9_8_7_6_5(uint64 instruction)
+static uint64 extract_rt_9_8_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 5);
@@ -1481,7 +1461,7 @@ uint64 NMD::extract_rt_9_8_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_op_25_24_23_22_21(uint64 instruction)
+static uint64 extract_op_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1489,7 +1469,7 @@ uint64 NMD::extract_op_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 7) << 2;
@@ -1497,7 +1477,7 @@ uint64 NMD::extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_bit_16_15_14_13_12_11(uint64 instruction)
+static uint64 extract_bit_16_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 6);
@@ -1505,7 +1485,7 @@ uint64 NMD::extract_bit_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_mask_20_19_18_17_16_15_14(uint64 instruction)
+static uint64 extract_mask_20_19_18_17_16_15_14(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 14, 7);
@@ -1513,7 +1493,7 @@ uint64 NMD::extract_mask_20_19_18_17_16_15_14(uint64 instruction)
 }
 
 
-uint64 NMD::extract_eu_3_2_1_0(uint64 instruction)
+static uint64 extract_eu_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4);
@@ -1521,7 +1501,7 @@ uint64 NMD::extract_eu_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_7_6_5_4__s4(uint64 instruction)
+static uint64 extract_u_7_6_5_4__s4(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 4, 4) << 4;
@@ -1529,7 +1509,7 @@ uint64 NMD::extract_u_7_6_5_4__s4(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 3, 5) << 3;
@@ -1539,7 +1519,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ft_15_14_13_12_11(uint64 instruction)
+static uint64 extract_ft_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1547,7 +1527,7 @@ uint64 NMD::extract_ft_15_14_13_12_11(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se31_15_to_0_31_to_16(uint64 instruction)
+static int64 extract_s__se31_15_to_0_31_to_16(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 16) << 16;
@@ -1557,7 +1537,7 @@ int64 NMD::extract_s__se31_15_to_0_31_to_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
+static uint64 extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 13, 8);
@@ -1565,7 +1545,7 @@ uint64 NMD::extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_2__s2(uint64 instruction)
+static uint64 extract_u_17_to_2__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 16) << 2;
@@ -1573,7 +1553,7 @@ uint64 NMD::extract_u_17_to_2__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd_15_14_13_12_11(uint64 instruction)
+static uint64 extract_rd_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1581,7 +1561,7 @@ uint64 NMD::extract_rd_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_c0s_20_19_18_17_16(uint64 instruction)
+static uint64 extract_c0s_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1589,7 +1569,7 @@ uint64 NMD::extract_c0s_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_1_0(uint64 instruction)
+static uint64 extract_code_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 2);
@@ -1597,7 +1577,7 @@ uint64 NMD::extract_code_1_0(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se25_0_24_to_1_s1(uint64 instruction)
+static int64 extract_s__se25_0_24_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 25;
@@ -1607,7 +1587,7 @@ int64 NMD::extract_s__se25_0_24_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_1_0(uint64 instruction)
+static uint64 extract_u_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 2);
@@ -1615,7 +1595,7 @@ uint64 NMD::extract_u_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_8__s2(uint64 instruction)
+static uint64 extract_u_3_8__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 1) << 3;
@@ -1624,7 +1604,7 @@ uint64 NMD::extract_u_3_8__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_fd_15_14_13_12_11(uint64 instruction)
+static uint64 extract_fd_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1632,7 +1612,7 @@ uint64 NMD::extract_fd_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5) << 2;
@@ -1640,7 +1620,7 @@ uint64 NMD::extract_u_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz4_9_7_6_5(uint64 instruction)
+static uint64 extract_rtz4_9_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 3);
@@ -1649,7 +1629,7 @@ uint64 NMD::extract_rtz4_9_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sel_15_14_13_12_11(uint64 instruction)
+static uint64 extract_sel_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1657,7 +1637,7 @@ uint64 NMD::extract_sel_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ct_25_24_23_22_21(uint64 instruction)
+static uint64 extract_ct_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1665,7 +1645,7 @@ uint64 NMD::extract_ct_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_to_2__s2(uint64 instruction)
+static uint64 extract_u_20_to_2__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 19) << 2;
@@ -1673,7 +1653,7 @@ uint64 NMD::extract_u_20_to_2__s2(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se3_4_2_1_0(uint64 instruction)
+static int64 extract_s__se3_4_2_1_0(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1683,7 +1663,7 @@ int64 NMD::extract_s__se3_4_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_2_1_0__s1(uint64 instruction)
+static uint64 extract_u_3_2_1_0__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4) << 1;
diff --git a/disas/nanomips.h b/disas/nanomips.h
index fcd41c405c..8eca843ef0 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -94,150 +94,6 @@ private:
                     TABLE_ENTRY_TYPE & type, const Pool *table, int table_size,
                     Dis_info *info);
 
-    uint64 renumber_registers(uint64 index, uint64 *register_list,
-                              size_t register_list_size);
-
-    uint64 decode_gpr_gpr4(uint64 d);
-    uint64 decode_gpr_gpr4_zero(uint64 d);
-    uint64 decode_gpr_gpr3(uint64 d);
-    uint64 decode_gpr_gpr3_src_store(uint64 d);
-    uint64 decode_gpr_gpr2_reg1(uint64 d);
-    uint64 decode_gpr_gpr2_reg2(uint64 d);
-    uint64 decode_gpr_gpr1(uint64 d);
-
-    uint64 copy(uint64 d);
-    int64 copy(int64 d);
-    int64 neg_copy(uint64 d);
-    int64 neg_copy(int64 d);
-    uint64 encode_rs3_and_check_rs3_ge_rt3(uint64 d);
-    uint64 encode_rs3_and_check_rs3_lt_rt3(uint64 d);
-    uint64 encode_s_from_address(uint64 d);
-    uint64 encode_u_from_address(uint64 d);
-    uint64 encode_s_from_s_hi(uint64 d);
-    uint64 encode_count3_from_count(uint64 d);
-    uint64 encode_shift3_from_shift(uint64 d);
-    int64 encode_eu_from_s_li16(uint64 d);
-    uint64 encode_msbd_from_size(uint64 d);
-    uint64 encode_eu_from_u_andi16(uint64 d);
-
-    uint64 encode_msbd_from_pos_and_size(uint64 d);
-
-    uint64 encode_rt1_from_rt(uint64 d);
-    uint64 encode_lsb_from_pos_and_size(uint64 d);
-
-    std::string save_restore_list(uint64 rt, uint64 count, uint64 gp);
-
-    std::string GPR(uint64 reg);
-    std::string FPR(uint64 reg);
-    std::string AC(uint64 reg);
-    std::string IMMEDIATE(uint64 value);
-    std::string IMMEDIATE(int64 value);
-    std::string CPR(uint64 reg);
-    std::string ADDRESS(uint64 value, int instruction_size, Dis_info *info);
-
-    int64 extract_s__se3_4_2_1_0(uint64 instruction);
-    int64 extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction);
-    int64 extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction);
-    int64 extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction);
-    int64 extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction);
-    int64 extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction);
-    int64 extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction);
-    int64 extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction);
-    int64 extract_s__se14_0_13_to_1_s1(uint64 instruction);
-    int64 extract_s__se21_0_20_to_1_s1(uint64 instruction);
-    int64 extract_s__se25_0_24_to_1_s1(uint64 instruction);
-    int64 extract_s__se31_15_to_0_31_to_16(uint64 instruction);
-    int64 extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction);
-    int64 extract_shift__se5_21_20_19_18_17_16(uint64 instruction);
-
-    uint64 extract_ac_15_14(uint64 instruction);
-    uint64 extract_bit_16_15_14_13_12_11(uint64 instruction);
-    uint64 extract_bit_23_22_21(uint64 instruction);
-    uint64 extract_c0s_20_19_18_17_16(uint64 instruction);
-    uint64 extract_code_17_to_0(uint64 instruction);
-    uint64 extract_code_18_to_0(uint64 instruction);
-    uint64 extract_code_1_0(uint64 instruction);
-    uint64 extract_code_2_1_0(uint64 instruction);
-    uint64 extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction);
-    uint64 extract_cofun_25_24_23(uint64 instruction);
-    uint64 extract_count3_14_13_12(uint64 instruction);
-    uint64 extract_count_3_2_1_0(uint64 instruction);
-    uint64 extract_count_19_18_17_16(uint64 instruction);
-    uint64 extract_cs_20_19_18_17_16(uint64 instruction);
-    uint64 extract_cs_25_24_23_22_21(uint64 instruction);
-    uint64 extract_ct_25_24_23_22_21(uint64 instruction);
-    uint64 extract_eu_3_2_1_0(uint64 instruction);
-    uint64 extract_eu_6_5_4_3_2_1_0(uint64 instruction);
-    uint64 extract_fd_15_14_13_12_11(uint64 instruction);
-    uint64 extract_fs_20_19_18_17_16(uint64 instruction);
-    uint64 extract_ft_15_14_13_12_11(uint64 instruction);
-    uint64 extract_ft_25_24_23_22_21(uint64 instruction);
-    uint64 extract_gp_2(uint64 instruction);
-    uint64 extract_hint_25_24_23_22_21(uint64 instruction);
-    uint64 extract_hs_20_19_18_17_16(uint64 instruction);
-    uint64 extract_lsb_4_3_2_1_0(uint64 instruction);
-    uint64 extract_mask_20_19_18_17_16_15_14(uint64 instruction);
-    uint64 extract_msbt_10_9_8_7_6(uint64 instruction);
-    uint64 extract_op_25_24_23_22_21(uint64 instruction);
-    uint64 extract_op_25_to_3(uint64 instruction);
-    uint64 extract_rdl_25_24(uint64 instruction);
-    uint64 extract_rd2_3_8(uint64 instruction);
-    uint64 extract_rd3_3_2_1(uint64 instruction);
-    uint64 extract_rd_15_14_13_12_11(uint64 instruction);
-    uint64 extract_rs3_6_5_4(uint64 instruction);
-    uint64 extract_rs4_4_2_1_0(uint64 instruction);
-    uint64 extract_rs_4_3_2_1_0(uint64 instruction);
-    uint64 extract_rs_20_19_18_17_16(uint64 instruction);
-    uint64 extract_rsz4_4_2_1_0(uint64 instruction);
-    uint64 extract_rtl_11(uint64 instruction);
-    uint64 extract_rt3_9_8_7(uint64 instruction);
-    uint64 extract_rt4_9_7_6_5(uint64 instruction);
-    uint64 extract_rt_25_24_23_22_21(uint64 instruction);
-    uint64 extract_rt_41_40_39_38_37(uint64 instruction);
-    uint64 extract_rt_9_8_7_6_5(uint64 instruction);
-    uint64 extract_rtz3_9_8_7(uint64 instruction);
-    uint64 extract_rtz4_27_26_25_23_22_21(uint64 instruction);
-    uint64 extract_rtz4_9_7_6_5(uint64 instruction);
-    uint64 extract_ru_7_6_5_4_3(uint64 instruction);
-    uint64 extract_sa_15_14_13_12_11(uint64 instruction);
-    uint64 extract_sa_15_14_13_12(uint64 instruction);
-    uint64 extract_sa_15_14_13(uint64 instruction);
-    uint64 extract_sel_13_12_11(uint64 instruction);
-    uint64 extract_sel_15_14_13_12_11(uint64 instruction);
-    uint64 extract_shift3_2_1_0(uint64 instruction);
-    uint64 extract_shift_4_3_2_1_0(uint64 instruction);
-    uint64 extract_shift_5_4_3_2_1_0(uint64 instruction);
-    uint64 extract_shift_20_19_18_17_16(uint64 instruction);
-    uint64 extract_shift_10_9_8_7_6(uint64 instruction);
-    uint64 extract_shiftx_11_10_9_8_7_6(uint64 instruction);
-    uint64 extract_shiftx_10_9_8_7__s1(uint64 instruction);
-    uint64 extract_size_20_19_18_17_16(uint64 instruction);
-    uint64 extract_stripe_6(uint64 instruction);
-    uint64 extract_stype_20_19_18_17_16(uint64 instruction);
-    uint64 extract_u2_10_9(uint64 instruction);
-    uint64 extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction);
-    uint64 extract_u_15_to_0(uint64 instruction);
-    uint64 extract_u_17_to_0(uint64 instruction);
-    uint64 extract_u_1_0(uint64 instruction);
-    uint64 extract_u_3_2_1_0__s1(uint64 instruction);
-    uint64 extract_u_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_3_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_4_3_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_5_4_3_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_6_5_4_3_2_1_0__s2(uint64 instruction);
-    uint64 extract_u_31_to_0__s32(uint64 instruction);
-    uint64 extract_u_10(uint64 instruction);
-    uint64 extract_u_17_16_15_14_13_12_11(uint64 instruction);
-    uint64 extract_u_20_19_18_17_16_15_14_13(uint64 instruction);
-    uint64 extract_u_17_to_1__s1(uint64 instruction);
-    uint64 extract_u_2_1__s1(uint64 instruction);
-    uint64 extract_u_17_to_2__s2(uint64 instruction);
-    uint64 extract_u_20_to_2__s2(uint64 instruction);
-    uint64 extract_u_20_to_3__s3(uint64 instruction);
-    uint64 extract_u_3_8__s2(uint64 instruction);
-    uint64 extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction);
-    uint64 extract_u_7_6_5_4__s4(uint64 instruction);
-
     bool ADDIU_32__cond(uint64 instruction);
     bool ADDIU_RS5__cond(uint64 instruction);
     bool BALRSC_cond(uint64 instruction);
-- 
2.25.1


