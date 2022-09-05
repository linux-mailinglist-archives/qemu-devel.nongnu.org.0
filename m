Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9B55AD012
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:27:39 +0200 (CEST)
Received: from localhost ([::1]:33004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9KL-0004Rf-Ug
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8sS-0003Hm-3x
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:58:48 -0400
Received: from mail-eopbgr80099.outbound.protection.outlook.com
 ([40.107.8.99]:49027 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8sN-0001pX-2L
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:58:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gu0XASCPiIw8Hs9kjqba0An+VsRSVARBzs2sLFjJCk2z/D0PCmmR3F4ZqM/+2bqahqIRNKHFqmFhZecSOmOCLuOlDRXiRhcNryvihEcQ+CCNl1D0LFPilbVmzdYHHJpnHjnc4NmwDlISVEgvYK7r/jLuvzM4uKaxoVdM52orH5B3R4wGmL7YyEZx+oCCFGW8+3bPHY3DskvM4bfYcUM9ffHIGaRQu6MihxWnL3ENewTAl76chFlVmBl9nIyySE1M8jYgrl8ezzfQNekU1psWUwYt0Qq4xA+1IJLP2TOtm0nYNumt9FnebiKIFGhH8Asbl4q1LT2kBqn9SeHeG/+TBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJ/sCmtINb6WDr8sPKI+B3qQzFLcmvLzLhp7o+XmJzo=;
 b=g69dcjAKCq4ISsRTD36MXSUhph/vHBSmXfALRzRGlLyKbpEI70rpuToWwbyTEIkD9T/d5N5kTqQ+O8+utANaXCQExHm7LO1wVc7ZbHqGFcK240qAd8RVEYsPxtQ8qfFwwBfO7DU+Ym7AAA6gROHjHbnQwe4rU3tRgCmMRsMdBSLfsnmWfkZpLQU1W6pmrKqIPGX+rWO3VUpY+A8qWGR8rTr4xcqSdGwqN0en6vQNp3AtM/C32X1ycJHrzQkar/Yi2Ke1eDmfKeyBN8+P90dchrjrnGC66drlB4IfoNu8CNMZO2vabbRQCb3rg6y0AqHmMV8T+3lA/FwzC/5zmO0DBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJ/sCmtINb6WDr8sPKI+B3qQzFLcmvLzLhp7o+XmJzo=;
 b=a9YHCp4Mvaf07Kf0mwrvzdv0/W70KP17dTXoyxzC8GM66C8ZbAogootzXeUOe/O3qEO9QlFPVrMQWSH4XgWOFaKzPV+l0CS+pY1FDJHWjV6CsYx/gewnlrpp7FN/LdVhvoabjZR5UffDR8Iwo6TTXOFzmGgyRQCDkBHL+M8Lcbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by PR3PR03MB6444.eurprd03.prod.outlook.com (2603:10a6:102:7f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 09:58:11 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:58:11 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 04/20] disas/nanomips: Remove helper methods from class
Date: Mon,  5 Sep 2022 11:55:06 +0200
Message-Id: <20220905095522.66941-5-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: c944277a-593f-478d-bdf6-08da8f252442
X-MS-TrafficTypeDiagnostic: PR3PR03MB6444:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i1A0lSPTRyfHPwqG6pFbYPwWKG3n3LNE1V04gKNX/XNnZam1YCQQ4j6xiwxGUdNLPlYivRW2NEfmqSPmNh01oYvOh+KFE9RJbrVkJm7yB5QDMfHkv0ZcWAgu/5rZkuqHagkkVSaW/+UbG/Ja8awTczEQgk8I7gsHTT7XHb3wlEf7minWi6S9c5hR3VlH2VBrFJ0OnO7yThX3u/f6nbw7+NnCQOMQQjz/zZ1JF4crb4qvYgFlEXmDPtiRo3MHC588Oteu/OCxZG1evQEZ8Zn1vI5ahP95ftw8R+QMNYSb9v+y2A78c1ErScPvGxlBQ5POU3x+trmcoF8A17rP+At/4CrnUX13KnY9PMCXukmtrBK41gHBt4JVXsczFn3gTCV0atFQmbqCl7QwuOp+jah6leEU+xfdoK/fPN5l5xNmkZese5CROPEcF24kDJyMjg5eVwkeTrpEoVcrVwF9N5POdDvuyIBXlDth/Ma++eCg4wd/qwedS6tEofGQgExcy28RUempMR+QLKPBDFGpT/k0pZVdKvGESJwpbvK797CkIl8TBKjVBeJ2jExG3W3maBW9Nj7HfvPJOPBfLrgQFmkSTe7w+v6HJyeQBE69yahJx7s/TjnrMhEzmI8mEyqiaGr42piJZSnwPqMqCMKfOg2MR9SIjsiXZLqd7xFaHhnBuPEAzyRXZO0SHz3G2zFdU1unRd+L9G7D2daMb1ebxFsfsvKe+2L4zE1u1Y92kxmGRQWhfoQlDrY9wYfg9R0koIbgB/ZN96xYynmb1ZwknLS+9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39840400004)(376002)(136003)(366004)(346002)(396003)(6512007)(6506007)(26005)(52116002)(86362001)(6486002)(478600001)(107886003)(6666004)(41300700001)(2616005)(38100700002)(38350700002)(83380400001)(1076003)(186003)(316002)(2906002)(4326008)(8676002)(66946007)(66556008)(6916009)(66476007)(36756003)(30864003)(44832011)(8936002)(5660300002)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EIUoMADuIh5lS5aLefMdZXmx5ASmx0HFiDODquMskpALCWk2wD8mz4rUllsu?=
 =?us-ascii?Q?XfzUj3Mm+QwbIkIZs4wjAL19u9dEsEzxOn+44ZT7n8tMb9qj6ZwELSSITEO5?=
 =?us-ascii?Q?e3HJTKGynP8DfM54v5JK4JkpZduIt0qlK+LXaKLKJWhcFSwAvJ9u/C54eOj4?=
 =?us-ascii?Q?86RcqP99dFe/DRgcKx3OXjfhOAyVjf1dkT3NDTfUUH8t+ew1KUj8ZRsHl7Kr?=
 =?us-ascii?Q?680sHHmoyOPrCegp+1Prj6C6+18PHzjOnHST/R3LYAEg/NBXiQSlrnpOFtiL?=
 =?us-ascii?Q?VBRCeg/ZSOcwxwrCLfhpIosWQ2Y0KijncmFoDFtuNxfZkf+oIRNguuJU+D2f?=
 =?us-ascii?Q?B7Ol3Y0KxGj8Wkn/FOjQPU5Zsg/6RdDsWayArk2qIKrMU1hxox4o4qABxPzP?=
 =?us-ascii?Q?FAgyBcIJRc8GUuTgZOvLKZGU8RWv0f4s5AuJ5A0S/kqBS+xKiBjt1uzP8uPj?=
 =?us-ascii?Q?k+aYKwsSbJX7siLxTvm70/gT9tgaEnViRWmGWs3CVX/wohfynwWMvB3RMh5G?=
 =?us-ascii?Q?1319Tw/fQMinuAQlhdoNxQ1ovtT8jBQihkleFLVPnYOmb5ljuFZ/cKphrkgv?=
 =?us-ascii?Q?ANcIdonbCKxFENHotwVs+czRJ8HF6XXWP0uIhNtXnsDNqmt3OJtfUoO08Tas?=
 =?us-ascii?Q?Ys2wrXoKMwAB+XPrf31r9jLRSWGZ9fko6sMvDTUi+T5iUdOqps0QNTRmM83L?=
 =?us-ascii?Q?NTTrCQU4abU/rmT6b5ZH6xlfjTrH3SzLUHGpv+Kz9a5s3ZZajKG/rrMGgTGN?=
 =?us-ascii?Q?pyfw9MWcM2oci/o3oiBNJnmtr6hI7ikHIG8Hc9TKizN1neGzbgyOJuu4lt4r?=
 =?us-ascii?Q?SwyHwwoNIg2e9ANvlm49sFZ+61Q2FrSFBJoUR2K6Q9ucvYqWzwuLLwx21REI?=
 =?us-ascii?Q?giFR710G1Rmg7QmLB77GrRXzJsZVYZzA68NyM2gaIBitnh2keu0Q8MMdJRg2?=
 =?us-ascii?Q?2rryHk/8o1XY4nmxNZ7a3xLeGk1H8mdImT8XOxEFOit/6lGtmchCgZoOHUDM?=
 =?us-ascii?Q?o1lwZenwk3GV1P99rgLGjjBo0/2ea/Aic4rAxefRmQRMEtZfBnJR0c1s6BIS?=
 =?us-ascii?Q?JIVsqZyO5GdHRpbb4Zl2TVcbwJjbML5mWwLanftzmfwN1BXP+QPJCpG3ZWch?=
 =?us-ascii?Q?dGsiXROd416l8NoO0MdpdvcdJ381Q9HcYRGE5Vy2xocoxqIHcX1XSdPg47Yr?=
 =?us-ascii?Q?+qgfSg6T5gUiHiy/nvaK03pNNzfxXSdZnR7tA8Nu44j6jBq9PVnH7GEfNWFW?=
 =?us-ascii?Q?PFKI2ACosXaJbOh3K6YAUB04i3uWzTbGAnhJF6gT7L5cXm9oiVtumMf+F1yW?=
 =?us-ascii?Q?acV4mCjqsh6sni56zRdSV9VWulX04vgNeIbw67hQvB8P5V9pGdxeZkPWQxW5?=
 =?us-ascii?Q?fbG+NQPcE6M6ZS3KnBkC1gWSO0HGMU+NSbY904laAEE9e0Q06cnoaRTTXwiy?=
 =?us-ascii?Q?/W0++hz2YzkDWXu8APHAPBEl9sEW91AuVB/rCwJxW2Ttc5ntaWdV3B2DfPc6?=
 =?us-ascii?Q?tDy8kfgQmAFsERGtEuKm6Bjqq57WdLokTgOy7QVCPa9D5sAbWu7f3JjWbMB9?=
 =?us-ascii?Q?O6H7XaY85SVLDS/WckTfiJDAXsOANBLT9JZAI2zfpMXb+egSGAA/vOrqWP2K?=
 =?us-ascii?Q?kQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c944277a-593f-478d-bdf6-08da8f252442
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:58:11.4230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jm69Ix7O4AaK4/NJYjcMKBxGa7hJVCHZ2R4mqnL/s8AYLrsRgsIUslgRmJje9lM91KlN0hAh+7eosjXiL5O118zrBimJjR9jAWynLZaYlmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6444
Received-SPF: pass client-ip=40.107.8.99;
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

Global functions used by those methods:
- nanomips_dis
- sign_extend
- extract_bits
have also been defined as static global functions.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 328 +++++++++++++++++++++------------------------
 disas/nanomips.h   | 144 --------------------
 2 files changed, 154 insertions(+), 318 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 49cdf23dbc..91ea35bf75 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -41,7 +41,7 @@
 #define IMGASSERTONCE(test)
 
 
-int nanomips_dis(char *buf,
+static int nanomips_dis(char *buf,
                  unsigned address,
                  unsigned short one,
                  unsigned short two,
@@ -256,20 +256,20 @@ std::string to_string(img_address a)
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
@@ -284,7 +284,7 @@ uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
 
 
 /*
- * NMD::decode_gpr_gpr4() - decoder for 'gpr4' gpr encoding type
+ * decode_gpr_gpr4() - decoder for 'gpr4' gpr encoding type
  *
  *   Map a 4-bit code to the 5-bit register space according to this pattern:
  *
@@ -309,7 +309,7 @@ uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
  *     - MUL[4X4]
  *     - SW[4X4]
  */
-uint64 NMD::decode_gpr_gpr4(uint64 d)
+static uint64 decode_gpr_gpr4(uint64 d)
 {
     static uint64 register_list[] = {  8,  9, 10, 11,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
@@ -319,7 +319,7 @@ uint64 NMD::decode_gpr_gpr4(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr4_zero() - decoder for 'gpr4.zero' gpr encoding type
+ * decode_gpr_gpr4_zero() - decoder for 'gpr4.zero' gpr encoding type
  *
  *   Map a 4-bit code to the 5-bit register space according to this pattern:
  *
@@ -345,7 +345,7 @@ uint64 NMD::decode_gpr_gpr4(uint64 d)
  *     - MOVEP
  *     - SW[4X4]
  */
-uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
+static uint64 decode_gpr_gpr4_zero(uint64 d)
 {
     static uint64 register_list[] = {  8,  9, 10,  0,  4,  5,  6,  7,
                                       16, 17, 18, 19, 20, 21, 22, 23 };
@@ -355,7 +355,7 @@ uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr3() - decoder for 'gpr3' gpr encoding type
+ * decode_gpr_gpr3() - decoder for 'gpr3' gpr encoding type
  *
  *   Map a 3-bit code to the 5-bit register space according to this pattern:
  *
@@ -404,7 +404,7 @@ uint64 NMD::decode_gpr_gpr4_zero(uint64 d)
  *     - SW[16]
  *     - XOR[16]
  */
-uint64 NMD::decode_gpr_gpr3(uint64 d)
+static uint64 decode_gpr_gpr3(uint64 d)
 {
     static uint64 register_list[] = { 16, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -413,7 +413,7 @@ uint64 NMD::decode_gpr_gpr3(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr3_src_store() - decoder for 'gpr3.src.store' gpr encoding
+ * decode_gpr_gpr3_src_store() - decoder for 'gpr3.src.store' gpr encoding
  *     type
  *
  *   Map a 3-bit code to the 5-bit register space according to this pattern:
@@ -444,7 +444,7 @@ uint64 NMD::decode_gpr_gpr3(uint64 d)
  *     - SW[16]
  *     - SW[GP16]
  */
-uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
+static uint64 decode_gpr_gpr3_src_store(uint64 d)
 {
     static uint64 register_list[] = {  0, 17, 18, 19,  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -453,7 +453,7 @@ uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr2_reg1() - decoder for 'gpr2.reg1' gpr encoding type
+ * decode_gpr_gpr2_reg1() - decoder for 'gpr2.reg1' gpr encoding type
  *
  *   Map a 2-bit code to the 5-bit register space according to this pattern:
  *
@@ -474,7 +474,7 @@ uint64 NMD::decode_gpr_gpr3_src_store(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
+static uint64 decode_gpr_gpr2_reg1(uint64 d)
 {
     static uint64 register_list[] = {  4,  5,  6,  7 };
     return renumber_registers(d, register_list,
@@ -483,7 +483,7 @@ uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr2_reg2() - decoder for 'gpr2.reg2' gpr encoding type
+ * decode_gpr_gpr2_reg2() - decoder for 'gpr2.reg2' gpr encoding type
  *
  *   Map a 2-bit code to the 5-bit register space according to this pattern:
  *
@@ -504,7 +504,7 @@ uint64 NMD::decode_gpr_gpr2_reg1(uint64 d)
  *     - MOVEP
  *     - MOVEP[REV]
  */
-uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
+static uint64 decode_gpr_gpr2_reg2(uint64 d)
 {
     static uint64 register_list[] = {  5,  6,  7,  8 };
     return renumber_registers(d, register_list,
@@ -513,7 +513,7 @@ uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
 
 
 /*
- * NMD::decode_gpr_gpr1() - decoder for 'gpr1' gpr encoding type
+ * decode_gpr_gpr1() - decoder for 'gpr1' gpr encoding type
  *
  *   Map a 1-bit code to the 5-bit register space according to this pattern:
  *
@@ -533,7 +533,7 @@ uint64 NMD::decode_gpr_gpr2_reg2(uint64 d)
  *
  *     - MOVE.BALC
  */
-uint64 NMD::decode_gpr_gpr1(uint64 d)
+static uint64 decode_gpr_gpr1(uint64 d)
 {
     static uint64 register_list[] = {  4,  5 };
     return renumber_registers(d, register_list,
@@ -541,73 +541,60 @@ uint64 NMD::decode_gpr_gpr1(uint64 d)
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
@@ -615,21 +602,21 @@ uint64 NMD::encode_shift3_from_shift(uint64 d)
 
 
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
@@ -642,42 +629,21 @@ uint64 NMD::encode_eu_from_u_andi16(uint64 d)
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
@@ -695,7 +661,21 @@ std::string NMD::GPR(uint64 reg)
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
@@ -713,7 +693,7 @@ std::string NMD::FPR(uint64 reg)
 }
 
 
-std::string NMD::AC(uint64 reg)
+static std::string AC(uint64 reg)
 {
     static const char *ac_reg[4] = {
         "ac0",  "ac1",  "ac2",  "ac3"
@@ -728,26 +708,26 @@ std::string NMD::AC(uint64 reg)
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
 
 
-std::string NMD::ADDRESS(uint64 value, int instruction_size, img_address m_pc)
+static std::string ADDRESS(uint64 value, int instruction_size, img_address m_pc)
 {
     /* token for string replace */
     img_address address = m_pc + value + instruction_size;
@@ -855,7 +835,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
 }
 
 
-uint64 NMD::extract_code_18_to_0(uint64 instruction)
+static uint64 extract_code_18_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 19);
@@ -863,7 +843,7 @@ uint64 NMD::extract_code_18_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift3_2_1_0(uint64 instruction)
+static uint64 extract_shift3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -871,7 +851,7 @@ uint64 NMD::extract_shift3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
+static uint64 extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 9) << 3;
@@ -879,7 +859,7 @@ uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3__s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count_3_2_1_0(uint64 instruction)
+static uint64 extract_count_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4);
@@ -887,7 +867,7 @@ uint64 NMD::extract_count_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz3_9_8_7(uint64 instruction)
+static uint64 extract_rtz3_9_8_7(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 3);
@@ -895,7 +875,7 @@ uint64 NMD::extract_rtz3_9_8_7(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_1__s1(uint64 instruction)
+static uint64 extract_u_17_to_1__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 17) << 1;
@@ -903,7 +883,7 @@ uint64 NMD::extract_u_17_to_1__s1(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
+static int64 extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 11, 10);
@@ -912,7 +892,7 @@ int64 NMD::extract_s__se9_20_19_18_17_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
+static int64 extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 11;
@@ -922,7 +902,7 @@ int64 NMD::extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_10(uint64 instruction)
+static uint64 extract_u_10(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 10, 1);
@@ -930,7 +910,7 @@ uint64 NMD::extract_u_10(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz4_27_26_25_23_22_21(uint64 instruction)
+static uint64 extract_rtz4_27_26_25_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 3);
@@ -939,7 +919,7 @@ uint64 NMD::extract_rtz4_27_26_25_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13_12_11(uint64 instruction)
+static uint64 extract_sa_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -947,7 +927,7 @@ uint64 NMD::extract_sa_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_4_3_2_1_0(uint64 instruction)
+static uint64 extract_shift_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -955,7 +935,7 @@ uint64 NMD::extract_shift_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shiftx_10_9_8_7__s1(uint64 instruction)
+static uint64 extract_shiftx_10_9_8_7__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 4) << 1;
@@ -963,7 +943,7 @@ uint64 NMD::extract_shiftx_10_9_8_7__s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_hint_25_24_23_22_21(uint64 instruction)
+static uint64 extract_hint_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -971,7 +951,7 @@ uint64 NMD::extract_hint_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count3_14_13_12(uint64 instruction)
+static uint64 extract_count3_14_13_12(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 12, 3);
@@ -979,7 +959,7 @@ uint64 NMD::extract_count3_14_13_12(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
+static int64 extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 31;
@@ -990,7 +970,7 @@ int64 NMD::extract_s__se31_0_11_to_2_20_to_12_s12(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
+static int64 extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 7;
@@ -1000,7 +980,7 @@ int64 NMD::extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u2_10_9(uint64 instruction)
+static uint64 extract_u2_10_9(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 9, 2);
@@ -1008,7 +988,7 @@ uint64 NMD::extract_u2_10_9(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
+static uint64 extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 10);
@@ -1016,7 +996,7 @@ uint64 NMD::extract_code_25_24_23_22_21_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_rs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1024,7 +1004,7 @@ uint64 NMD::extract_rs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_2_1__s1(uint64 instruction)
+static uint64 extract_u_2_1__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 2) << 1;
@@ -1032,7 +1012,7 @@ uint64 NMD::extract_u_2_1__s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_stripe_6(uint64 instruction)
+static uint64 extract_stripe_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 1);
@@ -1040,7 +1020,7 @@ uint64 NMD::extract_stripe_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ac_15_14(uint64 instruction)
+static uint64 extract_ac_15_14(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 14, 2);
@@ -1048,7 +1028,7 @@ uint64 NMD::extract_ac_15_14(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_20_19_18_17_16(uint64 instruction)
+static uint64 extract_shift_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1056,7 +1036,7 @@ uint64 NMD::extract_shift_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rdl_25_24(uint64 instruction)
+static uint64 extract_rdl_25_24(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 24, 1);
@@ -1064,7 +1044,7 @@ uint64 NMD::extract_rdl_25_24(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
+static int64 extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 10;
@@ -1074,7 +1054,7 @@ int64 NMD::extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_eu_6_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_eu_6_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 7);
@@ -1082,7 +1062,7 @@ uint64 NMD::extract_eu_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_shift_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 6);
@@ -1090,7 +1070,7 @@ uint64 NMD::extract_shift_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_count_19_18_17_16(uint64 instruction)
+static uint64 extract_count_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 4);
@@ -1098,7 +1078,7 @@ uint64 NMD::extract_count_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_2_1_0(uint64 instruction)
+static uint64 extract_code_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1106,7 +1086,7 @@ uint64 NMD::extract_code_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
+static uint64 extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 12);
@@ -1114,7 +1094,7 @@ uint64 NMD::extract_u_11_10_9_8_7_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs_4_3_2_1_0(uint64 instruction)
+static uint64 extract_rs_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -1122,7 +1102,7 @@ uint64 NMD::extract_rs_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_to_3__s3(uint64 instruction)
+static uint64 extract_u_20_to_3__s3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 18) << 3;
@@ -1130,7 +1110,7 @@ uint64 NMD::extract_u_20_to_3__s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4) << 2;
@@ -1138,7 +1118,7 @@ uint64 NMD::extract_u_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cofun_25_24_23(uint64 instruction)
+static uint64 extract_cofun_25_24_23(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 23);
@@ -1146,7 +1126,7 @@ uint64 NMD::extract_cofun_25_24_23(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3) << 2;
@@ -1154,7 +1134,7 @@ uint64 NMD::extract_u_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd3_3_2_1(uint64 instruction)
+static uint64 extract_rd3_3_2_1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 1, 3);
@@ -1162,7 +1142,7 @@ uint64 NMD::extract_rd3_3_2_1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13_12(uint64 instruction)
+static uint64 extract_sa_15_14_13_12(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 12, 4);
@@ -1170,7 +1150,7 @@ uint64 NMD::extract_sa_15_14_13_12(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_25_24_23_22_21(uint64 instruction)
+static uint64 extract_rt_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1178,7 +1158,7 @@ uint64 NMD::extract_rt_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ru_7_6_5_4_3(uint64 instruction)
+static uint64 extract_ru_7_6_5_4_3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 5);
@@ -1186,7 +1166,7 @@ uint64 NMD::extract_ru_7_6_5_4_3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_0(uint64 instruction)
+static uint64 extract_u_17_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 18);
@@ -1194,7 +1174,7 @@ uint64 NMD::extract_u_17_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rsz4_4_2_1_0(uint64 instruction)
+static uint64 extract_rsz4_4_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1203,7 +1183,7 @@ uint64 NMD::extract_rsz4_4_2_1_0(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se21_0_20_to_1_s1(uint64 instruction)
+static int64 extract_s__se21_0_20_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 21;
@@ -1213,7 +1193,7 @@ int64 NMD::extract_s__se21_0_20_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_op_25_to_3(uint64 instruction)
+static uint64 extract_op_25_to_3(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 23);
@@ -1221,7 +1201,7 @@ uint64 NMD::extract_op_25_to_3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs4_4_2_1_0(uint64 instruction)
+static uint64 extract_rs4_4_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1230,7 +1210,7 @@ uint64 NMD::extract_rs4_4_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_bit_23_22_21(uint64 instruction)
+static uint64 extract_bit_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 3);
@@ -1238,7 +1218,7 @@ uint64 NMD::extract_bit_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_41_40_39_38_37(uint64 instruction)
+static uint64 extract_rt_41_40_39_38_37(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 37, 5);
@@ -1246,7 +1226,7 @@ uint64 NMD::extract_rt_41_40_39_38_37(uint64 instruction)
 }
 
 
-int64 NMD::extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
+static int64 extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 16, 6);
@@ -1255,7 +1235,7 @@ int64 NMD::extract_shift__se5_21_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd2_3_8(uint64 instruction)
+static uint64 extract_rd2_3_8(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 1) << 1;
@@ -1264,7 +1244,7 @@ uint64 NMD::extract_rd2_3_8(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_17_to_0(uint64 instruction)
+static uint64 extract_code_17_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 18);
@@ -1272,7 +1252,7 @@ uint64 NMD::extract_code_17_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_size_20_19_18_17_16(uint64 instruction)
+static uint64 extract_size_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1280,7 +1260,7 @@ uint64 NMD::extract_size_20_19_18_17_16(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 2, 6) << 2;
@@ -1290,7 +1270,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_2_s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_15_to_0(uint64 instruction)
+static uint64 extract_u_15_to_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 16);
@@ -1298,7 +1278,7 @@ uint64 NMD::extract_u_15_to_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_fs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_fs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1306,7 +1286,7 @@ uint64 NMD::extract_fs_20_19_18_17_16(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 8);
@@ -1316,7 +1296,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_stype_20_19_18_17_16(uint64 instruction)
+static uint64 extract_stype_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1324,7 +1304,7 @@ uint64 NMD::extract_stype_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtl_11(uint64 instruction)
+static uint64 extract_rtl_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 9, 1);
@@ -1332,7 +1312,7 @@ uint64 NMD::extract_rtl_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_hs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_hs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1340,7 +1320,7 @@ uint64 NMD::extract_hs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sel_13_12_11(uint64 instruction)
+static uint64 extract_sel_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 3);
@@ -1348,7 +1328,7 @@ uint64 NMD::extract_sel_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_lsb_4_3_2_1_0(uint64 instruction)
+static uint64 extract_lsb_4_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5);
@@ -1356,7 +1336,7 @@ uint64 NMD::extract_lsb_4_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_gp_2(uint64 instruction)
+static uint64 extract_gp_2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 1);
@@ -1364,7 +1344,7 @@ uint64 NMD::extract_gp_2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt3_9_8_7(uint64 instruction)
+static uint64 extract_rt3_9_8_7(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 7, 3);
@@ -1372,7 +1352,7 @@ uint64 NMD::extract_rt3_9_8_7(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ft_25_24_23_22_21(uint64 instruction)
+static uint64 extract_ft_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1380,7 +1360,7 @@ uint64 NMD::extract_ft_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_16_15_14_13_12_11(uint64 instruction)
+static uint64 extract_u_17_16_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 7);
@@ -1388,7 +1368,7 @@ uint64 NMD::extract_u_17_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cs_20_19_18_17_16(uint64 instruction)
+static uint64 extract_cs_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1396,7 +1376,7 @@ uint64 NMD::extract_cs_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt4_9_7_6_5(uint64 instruction)
+static uint64 extract_rt4_9_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 3);
@@ -1405,7 +1385,7 @@ uint64 NMD::extract_rt4_9_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_msbt_10_9_8_7_6(uint64 instruction)
+static uint64 extract_msbt_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 5);
@@ -1413,7 +1393,7 @@ uint64 NMD::extract_msbt_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_5_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_5_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 6) << 2;
@@ -1421,7 +1401,7 @@ uint64 NMD::extract_u_5_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sa_15_14_13(uint64 instruction)
+static uint64 extract_sa_15_14_13(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 13, 3);
@@ -1429,7 +1409,7 @@ uint64 NMD::extract_sa_15_14_13(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se14_0_13_to_1_s1(uint64 instruction)
+static int64 extract_s__se14_0_13_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 14;
@@ -1439,7 +1419,7 @@ int64 NMD::extract_s__se14_0_13_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rs3_6_5_4(uint64 instruction)
+static uint64 extract_rs3_6_5_4(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 4, 3);
@@ -1447,7 +1427,7 @@ uint64 NMD::extract_rs3_6_5_4(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_31_to_0__s32(uint64 instruction)
+static uint64 extract_u_31_to_0__s32(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 32) << 32;
@@ -1455,7 +1435,7 @@ uint64 NMD::extract_u_31_to_0__s32(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shift_10_9_8_7_6(uint64 instruction)
+static uint64 extract_shift_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 5);
@@ -1463,7 +1443,7 @@ uint64 NMD::extract_shift_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_cs_25_24_23_22_21(uint64 instruction)
+static uint64 extract_cs_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1471,7 +1451,7 @@ uint64 NMD::extract_cs_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_shiftx_11_10_9_8_7_6(uint64 instruction)
+static uint64 extract_shiftx_11_10_9_8_7_6(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 6, 6);
@@ -1479,7 +1459,7 @@ uint64 NMD::extract_shiftx_11_10_9_8_7_6(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rt_9_8_7_6_5(uint64 instruction)
+static uint64 extract_rt_9_8_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 5);
@@ -1487,7 +1467,7 @@ uint64 NMD::extract_rt_9_8_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_op_25_24_23_22_21(uint64 instruction)
+static uint64 extract_op_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1495,7 +1475,7 @@ uint64 NMD::extract_op_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 7) << 2;
@@ -1503,7 +1483,7 @@ uint64 NMD::extract_u_6_5_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_bit_16_15_14_13_12_11(uint64 instruction)
+static uint64 extract_bit_16_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 6);
@@ -1511,7 +1491,7 @@ uint64 NMD::extract_bit_16_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_mask_20_19_18_17_16_15_14(uint64 instruction)
+static uint64 extract_mask_20_19_18_17_16_15_14(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 14, 7);
@@ -1519,7 +1499,7 @@ uint64 NMD::extract_mask_20_19_18_17_16_15_14(uint64 instruction)
 }
 
 
-uint64 NMD::extract_eu_3_2_1_0(uint64 instruction)
+static uint64 extract_eu_3_2_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4);
@@ -1527,7 +1507,7 @@ uint64 NMD::extract_eu_3_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_7_6_5_4__s4(uint64 instruction)
+static uint64 extract_u_7_6_5_4__s4(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 4, 4) << 4;
@@ -1535,7 +1515,7 @@ uint64 NMD::extract_u_7_6_5_4__s4(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
+static int64 extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 3, 5) << 3;
@@ -1545,7 +1525,7 @@ int64 NMD::extract_s__se8_15_7_6_5_4_3_s3(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ft_15_14_13_12_11(uint64 instruction)
+static uint64 extract_ft_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1553,7 +1533,7 @@ uint64 NMD::extract_ft_15_14_13_12_11(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se31_15_to_0_31_to_16(uint64 instruction)
+static int64 extract_s__se31_15_to_0_31_to_16(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 16) << 16;
@@ -1563,7 +1543,7 @@ int64 NMD::extract_s__se31_15_to_0_31_to_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
+static uint64 extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 13, 8);
@@ -1571,7 +1551,7 @@ uint64 NMD::extract_u_20_19_18_17_16_15_14_13(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_17_to_2__s2(uint64 instruction)
+static uint64 extract_u_17_to_2__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 16) << 2;
@@ -1579,7 +1559,7 @@ uint64 NMD::extract_u_17_to_2__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rd_15_14_13_12_11(uint64 instruction)
+static uint64 extract_rd_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1587,7 +1567,7 @@ uint64 NMD::extract_rd_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_c0s_20_19_18_17_16(uint64 instruction)
+static uint64 extract_c0s_20_19_18_17_16(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 16, 5);
@@ -1595,7 +1575,7 @@ uint64 NMD::extract_c0s_20_19_18_17_16(uint64 instruction)
 }
 
 
-uint64 NMD::extract_code_1_0(uint64 instruction)
+static uint64 extract_code_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 2);
@@ -1603,7 +1583,7 @@ uint64 NMD::extract_code_1_0(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se25_0_24_to_1_s1(uint64 instruction)
+static int64 extract_s__se25_0_24_to_1_s1(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 1) << 25;
@@ -1613,7 +1593,7 @@ int64 NMD::extract_s__se25_0_24_to_1_s1(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_1_0(uint64 instruction)
+static uint64 extract_u_1_0(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 2);
@@ -1621,7 +1601,7 @@ uint64 NMD::extract_u_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_8__s2(uint64 instruction)
+static uint64 extract_u_3_8__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 3, 1) << 3;
@@ -1630,7 +1610,7 @@ uint64 NMD::extract_u_3_8__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_fd_15_14_13_12_11(uint64 instruction)
+static uint64 extract_fd_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1638,7 +1618,7 @@ uint64 NMD::extract_fd_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_4_3_2_1_0__s2(uint64 instruction)
+static uint64 extract_u_4_3_2_1_0__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 5) << 2;
@@ -1646,7 +1626,7 @@ uint64 NMD::extract_u_4_3_2_1_0__s2(uint64 instruction)
 }
 
 
-uint64 NMD::extract_rtz4_9_7_6_5(uint64 instruction)
+static uint64 extract_rtz4_9_7_6_5(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 5, 3);
@@ -1655,7 +1635,7 @@ uint64 NMD::extract_rtz4_9_7_6_5(uint64 instruction)
 }
 
 
-uint64 NMD::extract_sel_15_14_13_12_11(uint64 instruction)
+static uint64 extract_sel_15_14_13_12_11(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 11, 5);
@@ -1663,7 +1643,7 @@ uint64 NMD::extract_sel_15_14_13_12_11(uint64 instruction)
 }
 
 
-uint64 NMD::extract_ct_25_24_23_22_21(uint64 instruction)
+static uint64 extract_ct_25_24_23_22_21(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 21, 5);
@@ -1671,7 +1651,7 @@ uint64 NMD::extract_ct_25_24_23_22_21(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_20_to_2__s2(uint64 instruction)
+static uint64 extract_u_20_to_2__s2(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 2, 19) << 2;
@@ -1679,7 +1659,7 @@ uint64 NMD::extract_u_20_to_2__s2(uint64 instruction)
 }
 
 
-int64 NMD::extract_s__se3_4_2_1_0(uint64 instruction)
+static int64 extract_s__se3_4_2_1_0(uint64 instruction)
 {
     int64 value = 0;
     value |= extract_bits(instruction, 0, 3);
@@ -1689,7 +1669,7 @@ int64 NMD::extract_s__se3_4_2_1_0(uint64 instruction)
 }
 
 
-uint64 NMD::extract_u_3_2_1_0__s1(uint64 instruction)
+static uint64 extract_u_3_2_1_0__s1(uint64 instruction)
 {
     uint64 value = 0;
     value |= extract_bits(instruction, 0, 4) << 1;
diff --git a/disas/nanomips.h b/disas/nanomips.h
index 4f9ac4b9ab..c8a098922c 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -91,150 +91,6 @@ private:
                     TABLE_ENTRY_TYPE & type, const Pool *table,
                     int table_size, img_address m_pc);
 
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
-    std::string ADDRESS(uint64 value, int instruction_size, img_address m_pc);
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


