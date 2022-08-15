Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B050592A74
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:52:29 +0200 (CEST)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUtd-0002DV-Ta
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUWp-0007fd-PG
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:28:51 -0400
Received: from mail-eopbgr80100.outbound.protection.outlook.com
 ([40.107.8.100]:2713 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUWl-0000T1-28
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:28:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R61hHjF1pHHN4OvoRaWtsin4LD3iUfZkK1OwvohSKDKbk94l39g1cj+Yh1Hl0TDJbZyz54xYMwYWv/A4zGItCSoTgcmZisMdgqSbFPlw12El9PSaY5VYSqEvQUFHOzm1eHa0wUmibLyJFzj5VzQNkQum6dRorVe87iEhGQdQMUReBXLPG81Zg+q+vynKA7vKsevH8I3F3nGpY4ACYY4syuCS8ZGVmV1b2WYBxlMQGHIkwTgVsQRIC3pZCsWZ/kbNBKufVIn4935bjDYm0FU3DBcn2ybleF2i5vrTQwpsZGidLLWQPP63PjRjBsBBkZJfIxAM156B+WS6VrJhp5AUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3GMzuKFc9pt7GXKKc3whJfDMS5sj/OSXW4CMmqqEks=;
 b=m3+w5tz0HEcV1indfZVVRdDT9aTxwwWPWRx4BPH0cBa0wWuJEW7JJFr3CPI2cQMbhFdrn5+aAIKHKyAPAWIiH8k3nJmt9e7OnTADsTahvxz1la0SjWGMc1fjGxYMZV+uH0GPFSlyhiSGsadiQJHDnD2McRSsliMD9sn2h++qC1KsnVLzTqjXY4riyHGlinALUaYsJiUV8taSNlFZ/WFOWQu7C8KnFpRSN2XpFRPDWvWzpXjUL4Y+g9W0XRG0zQE3nFcs22Q0rUaO+w+D4ybO5d2dT40TRUnBuw9wZgFanhqGpjaXw2vmhlg9onXkkvYt5+Os3B0Oyelc6BUldFvYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3GMzuKFc9pt7GXKKc3whJfDMS5sj/OSXW4CMmqqEks=;
 b=pYYTEEc+UpJbEtcLjvZachTZZmKvowa3q8K6mWELClotuvSWqBY3Yf2RPW6Aj3FN6nUVR9EAo/HZLTtYHV4D6GqF2yKirkTPtsPKQGPcTayKKeycWV7tWZDr5Aa0nj6xajFAxOngWUS0dPCaZtwbkI9oVp8BpD2WILIbHQinW/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by PA4PR03MB8134.eurprd03.prod.outlook.com (2603:10a6:102:2a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 15 Aug
 2022 07:28:12 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:28:11 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 04/20] disas/nanomips: Remove helper methods from class
Date: Mon, 15 Aug 2022 09:26:13 +0200
Message-Id: <20220815072629.12865-5-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0f1201a3-10a6-4178-d6dd-08da7e8fb58a
X-MS-TrafficTypeDiagnostic: PA4PR03MB8134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R/lwUW4bCwCQIuoXMXLyYkTB6SIT0M2gmS4VBLipM8X4HyflT909ZtqUX8sr3hTWTZpDZRNN65GgrYiO1u7MfLJhFAPmlb1mZpWL/vjimBkkUB3okV2Wy6xQnZFVnTG8eFasWGGOeBioOtDpntPkSs6fU4ii3Sz3V6E1VR72Z3RtC6ufMDRvYsrSRYGrsuLvqSTLjLT8doY4YN65hPynFWLD1eX+F348hhGGPXe2dizj0d4G4SjpMgyGDkmoKPEv9F+3srNNWngbbJUebgP/jLBjDb3ZJqYryQNu5ZtJAKdHcKqR8AOjhwf1FQ/eAlU0WesCFIJf/PJMUgiNMIjJlduqtGAT1qDv03C5VP6bJZDKr5mb5uAYCoNjKsQraL8mgCtWo8RGdB6FJZT9cYr32mtqSZhZ4RBfkfr2bW/5341+U8Tm49sbndku+8DAUb4CjhKfrqEpF5vTRMdo7WD7tBWYlLLEgmYctl2IK6XT5K1AejRTfYfi8ecubLmLUa101SJQu4Ghsgop/SJT190BQw5gTvMlzIbt+oAccaRrBatgwvUGKPQYixNlRx4ZLumqsxT12F+lV2dCGP1/FFQrgGf5L09KcTXFMTwZnULDXj9EDoH3kmfoF9LB0tKg3wkIhuHe/Xin0kGkRMQF46trGNBFKhX/ubL4QIUcwsobgPXFgLmEa8lCFsrIctal4/z0mLRvHKJp1Yyj/ZnsUTSUAEzjfnfZqDEECLpuo9AuWpywyLU+RSAQLaCHD0bf+GrPJJ68I4Sxe8H0QWOdiu9XS2nGQrWs9mKH3TA107FjweY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(346002)(39830400003)(136003)(396003)(38100700002)(2906002)(26005)(66556008)(5660300002)(66946007)(66476007)(6512007)(52116002)(6506007)(38350700002)(6916009)(478600001)(6486002)(107886003)(41300700001)(186003)(86362001)(2616005)(316002)(83380400001)(4326008)(1076003)(8676002)(44832011)(8936002)(30864003)(36756003)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7sXKdAOkF32yroa7/+web6eWeqlzckMCx4GDn8s0M1lxKzZhQ8u/oYQAK9hQ?=
 =?us-ascii?Q?QWFkX44NIs9IwZvj5yavT4vsdxFn6intn5bvA93R9vAVsvazlEgGzWfIPFau?=
 =?us-ascii?Q?s+lWA6dAZiVcwAcnafiujHRM0O4Q+amxVGhtNJ4WBQvuqIupayFUuEecepu6?=
 =?us-ascii?Q?CBoHIM8DpUy8nbWXl8dZE+RjJj6FjucRMoW4p8p1f2ddv4pDYwsxSia9LiN8?=
 =?us-ascii?Q?QkSvCyFxF8BuXmR+XzMzExX3gJ5JtFNOhIP6+ozPZvQZLfad1KZdCn3e4/d5?=
 =?us-ascii?Q?hZbChsb0hC4MkOEs9uxXZ+elGA+dr6GRrcNW8PAXaVklqQzZxq8q1hNYFzdu?=
 =?us-ascii?Q?sGMbgFOMBS/AGJz8CWH3mc6c0NW5RzrMU5+uuaNvnND8f5HcqhdH41/u5dYu?=
 =?us-ascii?Q?3pAB+CaUt+vuVxUla9X3LOC0bZrjRfb49A7XleRrqb+Yl0aPiRv9n1iAigE5?=
 =?us-ascii?Q?OLa+54ROju713K/LFL2C7d7R56g1XmDkBiQ4T7g69F+tFsI1BOzvvxbK05vn?=
 =?us-ascii?Q?K6YxmnqBRNRlwBeuTJfpX4HP/FS6tRFZfo7pK+diinhbknPjR6p7c88sZsQl?=
 =?us-ascii?Q?VjgcGZ2ppuyWAsEhV+xw+OVLQKWRg/uXJil3+H3BhHAo96WSLHVq9MLkLiby?=
 =?us-ascii?Q?BW1z3GCnzqe7zaZG57dkwBxZytakurfVb5Icf2/irg/GdA+9xbLjWTQ4Hq1Q?=
 =?us-ascii?Q?OtXha/NvCeVkZf2zSDi1CYaTEmaGWeK5o1m/OgB7jA33XY6j813NviMvx9NT?=
 =?us-ascii?Q?ICE4SdQ+sb67wEJIK4hsFNjVZ21tf73nljbGjPpIWDKAjW+g65D8kPYuKbur?=
 =?us-ascii?Q?6hg1mAJ8bzusIv2z51KFENNQ5i8JvfDvZC5YnDmihdBl44u4dQ30IshQKPx1?=
 =?us-ascii?Q?mujuWrPf/CSOB7MAjSa4i6OcoMXrUo9sYzyzSZqzIjrkLTJXZ9+vgurpfYXI?=
 =?us-ascii?Q?emnY5pCoKSlG0vlApvi8Tj2d+sxwnZ0RosPw3CxRmdlSw0zaVnHMBJJrQ1a9?=
 =?us-ascii?Q?SDqdFGeUyHUejBM3TuTDEKi+pu/Ec/H4AJmMzjfIaz6vt2+vTLui8AbiUNGz?=
 =?us-ascii?Q?Y+aXladEl9gfyBo4s9EBN5NvBdBneouQN2ccE/DH8q1XSAwuzSfhsk7iAlqP?=
 =?us-ascii?Q?WSvrgNtj5Qx7NDlQwz9/UqYCWNWUaVUL1IRjnddKyOpdhDLzVqlWop6L6Shv?=
 =?us-ascii?Q?uCsTwrE6pfrGcAh6yplK0LI+nJ4jsgRJzhEpT5Sme8yO1CwxqUp5BJZlKX0y?=
 =?us-ascii?Q?5Cc5RB5ofSdW+5WZ29XBCZk14c+rSgb93AgWqW2q+TMf/Dg9Np239oqgX+PW?=
 =?us-ascii?Q?JwgVQf1hO1HAb5dTcxXRBZcyC7ehxxM4k5Z6LeSRrc2oBMIVA02v2wefjBR3?=
 =?us-ascii?Q?xL1JNv8B+LNPR3C7QPbyXrM84jgUbSoQ2HnhnVpPQbV+Wdd9YhDhch2SZJLD?=
 =?us-ascii?Q?USycq2r9lAL//qy2QvcHqRD1dGgY/vfwWWRGaH793vflWa0NEJFy6c+Csj3P?=
 =?us-ascii?Q?KaRJlwDHn6ODQMW1su7wNWHW6ro7l1R7EANQFVfGMfCZ/S9TpcHumodPFGJV?=
 =?us-ascii?Q?mls1aRor+1kPGqtctEuM9HXCEY+oD9ttJcj/y8i2HvkaiDRtMFsink7w9UTO?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1201a3-10a6-4178-d6dd-08da7e8fb58a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:28:11.9419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqszsCzVFcC7jdnBagLvzZrTVMWiN0JlyLbdx/6RBcnnbLRBlL4/Fkeq76B2sPJb1N93UNBwRxB7j+3lv4dN1BmZ3v3WCgvC2l8PUBqmVA8=
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

Helper methods from NMD class like NMD::renumber_registers,
NMD::decode_gpr_gpr4... etc. are removed from the class. They're now
declared global static functions.

Following helper methods have been deleted because they're not used by
the nanomips disassembler:
- NMD::encode_msbd_from_pos_and_size,
- NMD::encode_s_from_s_hi,
- NMD::neg_copy

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 322 +++++++++++++++++++++------------------------
 disas/nanomips.h   | 144 --------------------
 2 files changed, 151 insertions(+), 315 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 2cbaa122ae..039c353d0b 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -273,7 +273,7 @@ int64 sign_extend(int64 data, int msb)
 }
 
 
-uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
+static uint64 renumber_registers(uint64 index, uint64 *register_list,
                                size_t register_list_size)
 {
     if (index < register_list_size) {
@@ -288,7 +288,7 @@ uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
 
 
 /*
- * NMD::decode_gpr_gpr4() - decoder for 'gpr4' gpr encoding type
+ * decode_gpr_gpr4() - decoder for 'gpr4' gpr encoding type
  *
  *   Map a 4-bit code to the 5-bit register space according to this pattern:
  *
@@ -313,7 +313,7 @@ uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
  *     - MUL[4X4]
  *     - SW[4X4]
  */
-uint64 NMD::decode_gpr_gpr4(uint64 d)
+static uint64 decode_gpr_gpr4(uint64 d)
 {
     static uint64 register_list[] = {  8,  9, 10, 11,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
@@ -323,7 +323,7 @@ uint64 NMD::decode_gpr_gpr4(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr4_zero() - decoder for 'gpr4.zero' gpr encoding type
+ * decode_gpr_gpr4_zero() - decoder for 'gpr4.zero' gpr encoding type
  *
  *   Map a 4-bit code to the 5-bit register space according to this pattern:
  *
@@ -349,7 +349,7 @@ uint64 NMD::decode_gpr_gpr4(uint64 d)
  *     - MOVEP
  *     - SW[4X4]
  */
-uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
+static uint64 decode_gpr_gpr4_zero(uint64 d)
 {
     static uint64 register_list[] = {  8,  9, 10,  0,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
@@ -359,7 +359,7 @@ uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr3() - decoder for 'gpr3' gpr encoding type
+ * decode_gpr_gpr3() - decoder for 'gpr3' gpr encoding type
  *
  *   Map a 3-bit code to the 5-bit register space according to this pattern:
  *
@@ -408,7 +408,7 @@ uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
  *     - SW[16]
  *     - XOR[16]
  */
-uint64 NMD::decode_gpr_gpr3(uint64 d)
+static uint64 decode_gpr_gpr3(uint64 d)
 {
     static uint64 register_list[] = { 16, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -417,7 +417,7 @@ uint64 NMD::decode_gpr_gpr3(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr3_src_store() - decoder for 'gpr3.src.store' gpr encoding
+ * decode_gpr_gpr3_src_store() - decoder for 'gpr3.src.store' gpr encoding
  *     type
  *
  *   Map a 3-bit code to the 5-bit register space according to this pattern:
@@ -448,7 +448,7 @@ uint64 NMD::decode_gpr_gpr3(uint64 d)
  *     - SW[16]
  *     - SW[GP16]
  */
-uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
+static uint64 decode_gpr_gpr3_src_store(uint64 d)
 {
     static uint64 register_list[] = {  0, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -457,7 +457,7 @@ uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr2_reg1() - decoder for 'gpr2.reg1' gpr encoding type
+ * decode_gpr_gpr2_reg1() - decoder for 'gpr2.reg1' gpr encoding type
  *
  *   Map a 2-bit code to the 5-bit register space according to this pattern:
  *
@@ -478,7 +478,7 @@ uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
+static uint64 decode_gpr_gpr2_reg1(uint64 d)
 {
     static uint64 register_list[] = {  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -487,7 +487,7 @@ uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr2_reg2() - decoder for 'gpr2.reg2' gpr encoding type
+ * decode_gpr_gpr2_reg2() - decoder for 'gpr2.reg2' gpr encoding type
  *
  *   Map a 2-bit code to the 5-bit register space according to this pattern:
  *
@@ -508,7 +508,7 @@ uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
+static uint64 decode_gpr_gpr2_reg2(uint64 d)
 {
     static uint64 register_list[] = {  5,  6,  7,  8 };
     return renumber_registers(d, register_list,
@@ -517,7 +517,7 @@ uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr1() - decoder for 'gpr1' gpr encoding type
+ * decode_gpr_gpr1() - decoder for 'gpr1' gpr encoding type
  *
  *   Map a 1-bit code to the 5-bit register space according to this pattern:
  *
@@ -537,7 +537,7 @@ uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
  *
  *     - MOVE.BALC
  */
-uint64 NMD::decode_gpr_gpr1(uint64 d)
+static uint64 decode_gpr_gpr1(uint64 d)
 {
     static uint64 register_list[] = {  4,  5 };
     return renumber_registers(d, register_list,
@@ -545,73 +545,60 @@ uint64 NMD::decode_gpr_gpr1(uint64 d)
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
@@ -619,21 +606,21 @@ uint64 NMD::encode_shift3_from_shift(uint64 d)
 
 
 /* special value for load literal */
-int64 NMD::encode_eu_from_s_li16(uint64 d)
+int64 encode_eu_from_s_li16(uint64 d)
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
@@ -646,42 +633,21 @@ uint64 NMD::encode_eu_from_u_andi16(uint64 d)
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
@@ -699,7 +665,21 @@ std::string NMD::GPR(uint64 reg)
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
@@ -717,7 +697,7 @@ std::string NMD::FPR(uint64 reg)
 }
 
 
-std::string NMD::AC(uint64 reg)
+static std::string AC(uint64 reg)
 {
     static const char *ac_reg[4] = {
         "ac0",  "ac1",  "ac2",  "ac3"
@@ -732,26 +712,26 @@ std::string NMD::AC(uint64 reg)
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
 
 
-std::string NMD::ADDRESS(uint64 value, int instruction_size)
+static std::string ADDRESS(uint64 value, int instruction_size)
 {
     /* token for string replace */
     /* const char TOKEN_REPLACE = (char)0xa2; */
@@ -862,7 +842,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
 }
 
 
-uint64 NMD::extract_code_18_to_0(uint64 instruction)
+static uint64 extract_code_18_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 19);
@@ -870,7 +850,7 @@ uint64 NMD::extract_code_18_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift3_2_1_0(uint64 instruction)
+static uint64 extract_shift3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -878,7 +858,7 @@ uint64 NMD::extract_shift3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
+static uint64 extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 9) << 3;
@@ -886,7 +866,7 @@ uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count_3_2_1_0(uint64 instruction)
+static uint64 extract_count_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4);
@@ -894,7 +874,7 @@ uint64 NMD::extract_count_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz3_9_8_7(uint64 instruction)
+static uint64 extract_rtz3_9_8_7(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 3);
@@ -902,7 +882,7 @@ uint64 NMD::extract_rtz3_9_8_7(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_1__s1(uint64 instruction)
+static uint64 extract_u_17_to_1__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 17) << 1;
@@ -910,7 +890,7 @@ uint64 NMD::extract_u_17_to_1__s1(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
+static int64 extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 11, 10);
@@ -919,7 +899,7 @@ int64 NMD::extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
+static int64 extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 11;
@@ -929,7 +909,7 @@ int64 NMD::extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_10(uint64 instruction)
+static uint64 extract_u_10(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 10, 1);
@@ -937,7 +917,7 @@ uint64 NMD::extract_u_10(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz4_27_26_25_23_22_21(uint64 instruction)
+static uint64 extract_rtz4_27_26_25_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 3);
@@ -946,7 +926,7 @@ uint64 NMD::extract_rtz4_27_26_25_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13_12_11(uint64 instruction)
+static uint64 extract_sa_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -954,7 +934,7 @@ uint64 NMD::extract_sa_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_4_3_2_1_0(uint64 instruction)
+static uint64 extract_shift_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -962,7 +942,7 @@ uint64 NMD::extract_shift_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shiftx_10_9_8_7__s1(uint64 instruction)
+static uint64 extract_shiftx_10_9_8_7__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 4) << 1;
@@ -970,7 +950,7 @@ uint64 NMD::extract_shiftx_10_9_8_7__s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_hint_25_24_23_22_21(uint64 instruction)
+static uint64 extract_hint_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -978,7 +958,7 @@ uint64 NMD::extract_hint_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count3_14_13_12(uint64 instruction)
+static uint64 extract_count3_14_13_12(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 12, 3);
@@ -986,7 +966,7 @@ uint64 NMD::extract_count3_14_13_12(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
+static int64 extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 31;
@@ -997,7 +977,7 @@ int64 NMD::extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
+static int64 extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 7;
@@ -1007,7 +987,7 @@ int64 NMD::extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u2_10_9(uint64 instruction)
+static uint64 extract_u2_10_9(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 9, 2);
@@ -1015,7 +995,7 @@ uint64 NMD::extract_u2_10_9(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
+static uint64 extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 10);
@@ -1023,7 +1003,7 @@ uint64 NMD::extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_rs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1031,7 +1011,7 @@ uint64 NMD::extract_rs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_2_1__s1(uint64 instruction)
+static uint64 extract_u_2_1__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 2) << 1;
@@ -1039,7 +1019,7 @@ uint64 NMD::extract_u_2_1__s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_stripe_6(uint64 instruction)
+static uint64 extract_stripe_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 1);
@@ -1047,7 +1027,7 @@ uint64 NMD::extract_stripe_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ac_15_14(uint64 instruction)
+static uint64 extract_ac_15_14(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 14, 2);
@@ -1055,7 +1035,7 @@ uint64 NMD::extract_ac_15_14(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_20_19_18_17_16(uint64 instruction)
+static uint64 extract_shift_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1063,7 +1043,7 @@ uint64 NMD::extract_shift_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rdl_25_24(uint64 instruction)
+static uint64 extract_rdl_25_24(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 24, 1);
@@ -1071,7 +1051,7 @@ uint64 NMD::extract_rdl_25_24(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
+static int64 extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 10;
@@ -1081,7 +1061,7 @@ int64 NMD::extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_eu_6_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_eu_6_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 7);
@@ -1089,7 +1069,7 @@ uint64 NMD::extract_eu_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_shift_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 6);
@@ -1097,7 +1077,7 @@ uint64 NMD::extract_shift_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count_19_18_17_16(uint64 instruction)
+static uint64 extract_count_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 4);
@@ -1105,7 +1085,7 @@ uint64 NMD::extract_count_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_2_1_0(uint64 instruction)
+static uint64 extract_code_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1113,7 +1093,7 @@ uint64 NMD::extract_code_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 12);
@@ -1121,7 +1101,7 @@ uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs_4_3_2_1_0(uint64 instruction)
+static uint64 extract_rs_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -1129,7 +1109,7 @@ uint64 NMD::extract_rs_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_to_3__s3(uint64 instruction)
+static uint64 extract_u_20_to_3__s3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 18) << 3;
@@ -1137,7 +1117,7 @@ uint64 NMD::extract_u_20_to_3__s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4) << 2;
@@ -1145,7 +1125,7 @@ uint64 NMD::extract_u_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cofun_25_24_23(uint64 instruction)
+static uint64 extract_cofun_25_24_23(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 23);
@@ -1153,7 +1133,7 @@ uint64 NMD::extract_cofun_25_24_23(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3) << 2;
@@ -1161,7 +1141,7 @@ uint64 NMD::extract_u_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd3_3_2_1(uint64 instruction)
+static uint64 extract_rd3_3_2_1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 3);
@@ -1169,7 +1149,7 @@ uint64 NMD::extract_rd3_3_2_1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13_12(uint64 instruction)
+static uint64 extract_sa_15_14_13_12(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 12, 4);
@@ -1177,7 +1157,7 @@ uint64 NMD::extract_sa_15_14_13_12(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_25_24_23_22_21(uint64 instruction)
+static uint64 extract_rt_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1185,7 +1165,7 @@ uint64 NMD::extract_rt_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ru_7_6_5_4_3(uint64 instruction)
+static uint64 extract_ru_7_6_5_4_3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 5);
@@ -1193,7 +1173,7 @@ uint64 NMD::extract_ru_7_6_5_4_3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_0(uint64 instruction)
+static uint64 extract_u_17_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 18);
@@ -1201,7 +1181,7 @@ uint64 NMD::extract_u_17_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rsz4_4_2_1_0(uint64 instruction)
+static uint64 extract_rsz4_4_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1210,7 +1190,7 @@ uint64 NMD::extract_rsz4_4_2_1_0(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se21_0_20_to_1_s1(uint64 instruction)
+static int64 extract_s__se21_0_20_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 21;
@@ -1220,7 +1200,7 @@ int64 NMD::extract_s__se21_0_20_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_op_25_to_3(uint64 instruction)
+static uint64 extract_op_25_to_3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 23);
@@ -1228,7 +1208,7 @@ uint64 NMD::extract_op_25_to_3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs4_4_2_1_0(uint64 instruction)
+static uint64 extract_rs4_4_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1237,7 +1217,7 @@ uint64 NMD::extract_rs4_4_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_bit_23_22_21(uint64 instruction)
+static uint64 extract_bit_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 3);
@@ -1245,7 +1225,7 @@ uint64 NMD::extract_bit_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_41_40_39_38_37(uint64 instruction)
+static uint64 extract_rt_41_40_39_38_37(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 37, 5);
@@ -1253,7 +1233,7 @@ uint64 NMD::extract_rt_41_40_39_38_37(uint64 instruction)
 }
 
 
-int64 NMD::extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
+static int64 extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 16, 6);
@@ -1262,7 +1242,7 @@ int64 NMD::extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd2_3_8(uint64 instruction)
+static uint64 extract_rd2_3_8(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 1) << 1;
@@ -1271,7 +1251,7 @@ uint64 NMD::extract_rd2_3_8(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_17_to_0(uint64 instruction)
+static uint64 extract_code_17_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 18);
@@ -1279,7 +1259,7 @@ uint64 NMD::extract_code_17_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_size_20_19_18_17_16(uint64 instruction)
+static uint64 extract_size_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1287,7 +1267,7 @@ uint64 NMD::extract_size_20_19_18_17_16(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 2, 6) << 2;
@@ -1297,7 +1277,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_15_to_0(uint64 instruction)
+static uint64 extract_u_15_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 16);
@@ -1305,7 +1285,7 @@ uint64 NMD::extract_u_15_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_fs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_fs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1313,7 +1293,7 @@ uint64 NMD::extract_fs_20_19_18_17_16(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 8);
@@ -1323,7 +1303,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_stype_20_19_18_17_16(uint64 instruction)
+static uint64 extract_stype_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1331,7 +1311,7 @@ uint64 NMD::extract_stype_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtl_11(uint64 instruction)
+static uint64 extract_rtl_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 9, 1);
@@ -1339,7 +1319,7 @@ uint64 NMD::extract_rtl_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_hs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_hs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1347,7 +1327,7 @@ uint64 NMD::extract_hs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sel_13_12_11(uint64 instruction)
+static uint64 extract_sel_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 3);
@@ -1355,7 +1335,7 @@ uint64 NMD::extract_sel_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_lsb_4_3_2_1_0(uint64 instruction)
+static uint64 extract_lsb_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -1363,7 +1343,7 @@ uint64 NMD::extract_lsb_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_gp_2(uint64 instruction)
+static uint64 extract_gp_2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 1);
@@ -1371,7 +1351,7 @@ uint64 NMD::extract_gp_2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt3_9_8_7(uint64 instruction)
+static uint64 extract_rt3_9_8_7(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 3);
@@ -1379,7 +1359,7 @@ uint64 NMD::extract_rt3_9_8_7(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ft_25_24_23_22_21(uint64 instruction)
+static uint64 extract_ft_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1387,7 +1367,7 @@ uint64 NMD::extract_ft_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_16_15_14_13_12_11(uint64 instruction)
+static uint64 extract_u_17_16_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 7);
@@ -1395,7 +1375,7 @@ uint64 NMD::extract_u_17_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_cs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1403,7 +1383,7 @@ uint64 NMD::extract_cs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt4_9_7_6_5(uint64 instruction)
+static uint64 extract_rt4_9_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 3);
@@ -1412,7 +1392,7 @@ uint64 NMD::extract_rt4_9_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_msbt_10_9_8_7_6(uint64 instruction)
+static uint64 extract_msbt_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 5);
@@ -1420,7 +1400,7 @@ uint64 NMD::extract_msbt_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_5_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_5_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 6) << 2;
@@ -1428,7 +1408,7 @@ uint64 NMD::extract_u_5_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13(uint64 instruction)
+static uint64 extract_sa_15_14_13(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 13, 3);
@@ -1436,7 +1416,7 @@ uint64 NMD::extract_sa_15_14_13(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se14_0_13_to_1_s1(uint64 instruction)
+static int64 extract_s__se14_0_13_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 14;
@@ -1446,7 +1426,7 @@ int64 NMD::extract_s__se14_0_13_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs3_6_5_4(uint64 instruction)
+static uint64 extract_rs3_6_5_4(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 4, 3);
@@ -1454,7 +1434,7 @@ uint64 NMD::extract_rs3_6_5_4(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_31_to_0__s32(uint64 instruction)
+static uint64 extract_u_31_to_0__s32(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 32) << 32;
@@ -1462,7 +1442,7 @@ uint64 NMD::extract_u_31_to_0__s32(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_10_9_8_7_6(uint64 instruction)
+static uint64 extract_shift_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 5);
@@ -1470,7 +1450,7 @@ uint64 NMD::extract_shift_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cs_25_24_23_22_21(uint64 instruction)
+static uint64 extract_cs_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1478,7 +1458,7 @@ uint64 NMD::extract_cs_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shiftx_11_10_9_8_7_6(uint64 instruction)
+static uint64 extract_shiftx_11_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 6);
@@ -1486,7 +1466,7 @@ uint64 NMD::extract_shiftx_11_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_9_8_7_6_5(uint64 instruction)
+static uint64 extract_rt_9_8_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 5);
@@ -1494,7 +1474,7 @@ uint64 NMD::extract_rt_9_8_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_op_25_24_23_22_21(uint64 instruction)
+static uint64 extract_op_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1502,7 +1482,7 @@ uint64 NMD::extract_op_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 7) << 2;
@@ -1510,7 +1490,7 @@ uint64 NMD::extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_bit_16_15_14_13_12_11(uint64 instruction)
+static uint64 extract_bit_16_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 6);
@@ -1518,7 +1498,7 @@ uint64 NMD::extract_bit_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_mask_20_19_18_17_16_15_14(uint64 instruction)
+static uint64 extract_mask_20_19_18_17_16_15_14(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 14, 7);
@@ -1526,7 +1506,7 @@ uint64 NMD::extract_mask_20_19_18_17_16_15_14(uint64 instruction)
 }
 
 
-uint64 NMD::extract_eu_3_2_1_0(uint64 instruction)
+static uint64 extract_eu_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4);
@@ -1534,7 +1514,7 @@ uint64 NMD::extract_eu_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_7_6_5_4__s4(uint64 instruction)
+static uint64 extract_u_7_6_5_4__s4(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 4, 4) << 4;
@@ -1542,7 +1522,7 @@ uint64 NMD::extract_u_7_6_5_4__s4(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 3, 5) << 3;
@@ -1552,7 +1532,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ft_15_14_13_12_11(uint64 instruction)
+static uint64 extract_ft_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1560,7 +1540,7 @@ uint64 NMD::extract_ft_15_14_13_12_11(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se31_15_to_0_31_to_16(uint64 instruction)
+static int64 extract_s__se31_15_to_0_31_to_16(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 16) << 16;
@@ -1570,7 +1550,7 @@ int64 NMD::extract_s__se31_15_to_0_31_to_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
+static uint64 extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 13, 8);
@@ -1578,7 +1558,7 @@ uint64 NMD::extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_2__s2(uint64 instruction)
+static uint64 extract_u_17_to_2__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 16) << 2;
@@ -1586,7 +1566,7 @@ uint64 NMD::extract_u_17_to_2__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd_15_14_13_12_11(uint64 instruction)
+static uint64 extract_rd_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1594,7 +1574,7 @@ uint64 NMD::extract_rd_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_c0s_20_19_18_17_16(uint64 instruction)
+static uint64 extract_c0s_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1602,7 +1582,7 @@ uint64 NMD::extract_c0s_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_1_0(uint64 instruction)
+static uint64 extract_code_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 2);
@@ -1610,7 +1590,7 @@ uint64 NMD::extract_code_1_0(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se25_0_24_to_1_s1(uint64 instruction)
+static int64 extract_s__se25_0_24_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 25;
@@ -1620,7 +1600,7 @@ int64 NMD::extract_s__se25_0_24_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_1_0(uint64 instruction)
+static uint64 extract_u_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 2);
@@ -1628,7 +1608,7 @@ uint64 NMD::extract_u_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_8__s2(uint64 instruction)
+static uint64 extract_u_3_8__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 1) << 3;
@@ -1637,7 +1617,7 @@ uint64 NMD::extract_u_3_8__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_fd_15_14_13_12_11(uint64 instruction)
+static uint64 extract_fd_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1645,7 +1625,7 @@ uint64 NMD::extract_fd_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5) << 2;
@@ -1653,7 +1633,7 @@ uint64 NMD::extract_u_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz4_9_7_6_5(uint64 instruction)
+static uint64 extract_rtz4_9_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 3);
@@ -1662,7 +1642,7 @@ uint64 NMD::extract_rtz4_9_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sel_15_14_13_12_11(uint64 instruction)
+static uint64 extract_sel_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1670,7 +1650,7 @@ uint64 NMD::extract_sel_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ct_25_24_23_22_21(uint64 instruction)
+static uint64 extract_ct_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1678,7 +1658,7 @@ uint64 NMD::extract_ct_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_to_2__s2(uint64 instruction)
+static uint64 extract_u_20_to_2__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 19) << 2;
@@ -1686,7 +1666,7 @@ uint64 NMD::extract_u_20_to_2__s2(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se3_4_2_1_0(uint64 instruction)
+static int64 extract_s__se3_4_2_1_0(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1696,7 +1676,7 @@ int64 NMD::extract_s__se3_4_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_2_1_0__s1(uint64 instruction)
+static uint64 extract_u_3_2_1_0__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4) << 1;
diff --git a/disas/nanomips.h b/disas/nanomips.h
index 9858740bf3..a795ed44e8 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -89,150 +89,6 @@ private:
     int Disassemble(const uint16 *data, std::string & dis,
                     TABLE_ENTRY_TYPE & type, const Pool *table, int table_size);
 
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
-    std::string ADDRESS(uint64 value, int instruction_size);
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


