Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5745B5A48
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 14:41:15 +0200 (CEST)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXikU-0007ZM-6P
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 08:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiYN-0003uN-TN
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:28:44 -0400
Received: from mail-db8eur05on2095.outbound.protection.outlook.com
 ([40.107.20.95]:56929 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiYL-0005mE-Ts
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:28:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJ8oq9VT/HZeYlZ4qi91mkJL7BsJNYqShR7/3ivNA8cUF5A8QrNdu0EWTr6iz5q73wL89OwpxPiumfFEab9nz+GikDtPTbS9ZZCcFNiP59hCZissbK5j+V1Ruc8CescSr5N8tfRzwMUp9Zf6g/BjiBUzl8rwajEnSfilbGkKyeoKSstAo8XJFDECig5J2aIXe/APDUPfCS11GsDJPhwYL4cm9TZ+YHSbtzy8WCauZbB6TdHIa07RJwOmksAWmmH9thWPNaitZT3EXiWZUIacqK0dw0QPLw0rW/SND+9ZrBT1yeGJ92es94Z5MkS00GEQe8gRj70/qLOrRzc3By54mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUGlD5yv3C23BY73vd8z3UclK/EAeks6JdApBdsFY9g=;
 b=D1LIWDZFJDxP4hIz+hyMM63YImDDSxO6nv7f33u9crM7KtSpEP0zAeA7hJcme5BIFboUOnncOsiaGWsSL9LLLPIKBTM3/Pm+OSFzULdpxNgmFxDZM5dVM13xvdfVAvm1BQ4299Cu9gKmzQUftaQiVyuAXDvk+rbJ7lVpUy8UlD/303N/2Rm0d8T8aqbJ+Rvvf1MgcvkxHhqj5Ko6R62lt+UXBSer3EYqnGRukNuYtK19Hd1UQaJWLFtsbuB1wOg5uNs9Pfd2PCVAibUXpsWEtwVtdHF64wkuKY1bePDCouheyFjq6eAnit/uDifrfcHSRa89w2gJ1hMk35SwWyuefA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUGlD5yv3C23BY73vd8z3UclK/EAeks6JdApBdsFY9g=;
 b=WJ94akLVWiK+1TWFWnr+ZluZWI/rgl8l2ral7hkHYtd3osu6hhxTid4EU/Sib9FjzUG7iN5RtruiqWVqFzbY7KbwW05SdB3FNY9tSiM2wuCe0a+mEoRBcb3gjohlBJ5cCX/FwL0C7cZyPdpSUOSUn1O483d7oQy6UsCBfsdWvEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS2PR03MB9768.eurprd03.prod.outlook.com (2603:10a6:20b:60b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:28:40 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:28:40 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 06/24] disas/nanomips: Remove __cond methods from class
Date: Mon, 12 Sep 2022 14:26:17 +0200
Message-Id: <20220912122635.74032-7-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0145.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::23) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|AS2PR03MB9768:EE_
X-MS-Office365-Filtering-Correlation-Id: ea94672b-1636-4826-164d-08da94ba52ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e6L1qe7F9Ul6YJKgpceIatDy9ANapLcp3pPSisryt7oQO8YOE1C0h/Lwdi1D3nxN3Bxp0NqekUIZI3jQ9rWU/xSOICCK2nlZl0r5buVt1vC3KSukG+C8IlmyH4UQzbRxVEkINgZZALpZK7FSLMu9ZmVw4g0J31uvWWdg62pRMytEExjhDW9NkwzXmkYOBGuOOPHx/uEZUlX6qp5tJTDJmazgSKGl5oLSmZZN0VhPtZ8AcirRiHlwPrJPWaNljgIdTHOV6dg1YAjOkUCPElYQDTXFSAd3E3yUW3K2PznbOrzfu/Z7MbMMwFEUgeXPKImlP988A9fBXsrj3mGkIvoK5NdTRUxTumsHL3CPpzTkgh+L4pP5M4jdqpc5N1aUIAkrT7EfPH5eBdWUH8lRuVu533b+/uV8YCF3mNPGVE36hJDggReKUuS1b+zidkVV9yY/vVAhRtUlPULHYv294L/u6/eZ36OZzei+tGfHXKKixA+gIVh4EsQNCdPBqkuBz57KRmDGBXqsdVNpC7aisflLKEhH9s10sUDf+HEB3+Ew1qJIIE2xbNO/kMB4C2Tvfdd7jBM03qpx6NDNuV40a6BsuCwbfkdM4PkJtwqEqhJfYFB6XL0Mq3RTWhfqoXiRS0YwxqKVriYXrdSxpMnp7MVvRwE4rS7ITmOeXbYoimIfzEI2JO4oz4dnqzAkJ7oyS6FPm6PzH91aM+/3IEpzb1ec1uKjlOm8G1RjtdPSbcifiSj/EgviwCyw41cuy1Unvmdd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(39840400004)(136003)(346002)(366004)(86362001)(66946007)(8676002)(38100700002)(66556008)(66476007)(4326008)(36756003)(38350700002)(186003)(83380400001)(2616005)(52116002)(6512007)(26005)(478600001)(6486002)(41300700001)(6506007)(6666004)(2906002)(6916009)(54906003)(316002)(1076003)(5660300002)(7416002)(8936002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVNtcFl1SXgyUjdKQWpTV3FQMFVhb2dKazA2cldjSEg3dmEydDNOVzFoeEp5?=
 =?utf-8?B?bERJbkZYM3JBUDYwOTduVmp1KzUzR2h4d2YzVFBGUUprY1lKdEc0eTRHZTBT?=
 =?utf-8?B?cGVLMDk3T21wb1V5YVVBaEs3SGZrNW91d2JjN1lCSzZIdlRHRGt6V3dvc1Bp?=
 =?utf-8?B?angxb1Rmc2p3RngvbG8wdE9NT002dmp1UC95S3cweFQ5bnc5bnRraG12NkZB?=
 =?utf-8?B?TFByb0w4YjJHZ3B5OVdqaWxsMEE1YUhFWGF2SG1KS3RVVzNwWTNNVzFlNU1i?=
 =?utf-8?B?cUlvZWthclkzakcybTZVSXZRRDI5Z0F1WkNpQ1Zmb2NFQVZ5d3B2VDVLTmdu?=
 =?utf-8?B?blo3Vm5EbjlVZnlWN2NvS1pKSXQ5WGJTNWdJT2tkUEpmRksrdGZrZHJMQ1Fm?=
 =?utf-8?B?VFQ1QXN0V08xZU1HUjhsRlZzYTlyRW9QcURBOVZQc3NXcnp5UmtPTE9jOTA2?=
 =?utf-8?B?TDJHeEJuQ3VKSWlhSGtvTVlSNm82dEJhSEhuL2JDZ1lNM1hFbi93SlYxYlIw?=
 =?utf-8?B?djBDek9IQ0JjNUJBWjRNZGZxV0s3Umxzc1UwSklkSUh1VG5HRlg2NXFGbHcr?=
 =?utf-8?B?eTM5c0YvNk53L1JRbHFuRC9lRnNSRVNieFNRSFBKYUV4WmRKWVVlb3AyNWJD?=
 =?utf-8?B?NExseXluQnVaN0dsZ2d5Zk45eVVpWkI4MzRFUENQVEpjWmpDblZiYjFoaHlv?=
 =?utf-8?B?TlZtUXBnRExoR3hwdFlvamw4WVVSTWo3eHdOeU5PbEMvWGVyWWExUlJ5TGVq?=
 =?utf-8?B?eDlpaDFqMTVadGFMdVZUSUcxOHBxS1IzdVF4V0dvNjlITEdtcW05Rythc1hO?=
 =?utf-8?B?bFU2bXMxUkIwOWJTalFlS3JWMWFzUm5tSXJyTTFEb1UwQit2MWFDcjhyV0pH?=
 =?utf-8?B?SHcwRkIvSk1NZ2JBZ3lmdm41enlJZ2YvYWVVQk9lQ2M4dWh4SDhuRE0zbHNj?=
 =?utf-8?B?WndrZUw1RG5FSThkM0w1MzBlTmMyOW11d2NMTE5SWXV2K1dkaUlHa2xFbDRk?=
 =?utf-8?B?MzczTVU5THJRZVdxK2tJRUNWQlM2UUxqOXlpaUdJVThjR290N1RNZnhvTzcv?=
 =?utf-8?B?cU1nQ3ppRUxCWmU5VzcxWmxKelI2SCtvcHIxcXNIcWJpMWgvaWcyZ3RqeVdu?=
 =?utf-8?B?MkpMc1hSVUd5WjNwVVVxc1pSV280OThHZDFmVnB2cWdyT0RLUS8rMTV2ZWto?=
 =?utf-8?B?dDhmWEl5NEZCcHVHQ0NsREJ5WjJFQ3lGTmIxbzVZVTNLc3FVcC9xTUlxWVhu?=
 =?utf-8?B?MXlBZ000Z1lFdW05SGtmSFJhWEt3Ym5USjEzd01Ec2hSTzY4ZWIrMGY1aXNj?=
 =?utf-8?B?cXZIR3pNVHJqRjFUYVNmdWh1OFdPZWNZT0J4TnRuV3VzazdSRnA3dEkzcUF6?=
 =?utf-8?B?WFY1ajNOaFoxT3E3UmY1QmEzaFMvTnIzZ3VPbEQ3ZUczcEZsblgxbllLS3Jv?=
 =?utf-8?B?eFdBblQ4THJ5NEhLS1dLR0FwM0ZnZkNmOE1XSWZpU0d4MVVCcFhNcW1iYmpV?=
 =?utf-8?B?VjlrSGFaVzI4RTdjSGZxaXM1bndOUCtvK3pUcUNScStER1JoNWNuTmdrK2Zz?=
 =?utf-8?B?dXhCYS9SWVd4Yjlsc3JHT21XblQyVWtGVkNxSHUrYjdQZ09yRjNFaHdxZHlu?=
 =?utf-8?B?N1haZ2xVVWt1NC80N3VoQzAyVGlTUWRycWJTTFAyQ3ptdi9TMXA5WWx1QUYv?=
 =?utf-8?B?YU1LeEc5NTgvdkJkU2VSalhOaTJoUlhTRmdaMFBWKzg2b0FIZTRTVzd2YnV6?=
 =?utf-8?B?dnRKWStnd0E3UkZGR3N4Kys4Z0k1dGFNdTdQdWJ4R29qUWJRSktBMXBXekFl?=
 =?utf-8?B?bm5VSnVTTm9sbHVJejRxVUE4dnBneWkxaDlYZktuV3NGR0ZhaXN4czczUDJP?=
 =?utf-8?B?QUs3V1RLS0NyaUpZbFdYSS9Nc2pQcXNwRVE5N3QwYzZaSm1RS1NocUhQTnB0?=
 =?utf-8?B?ejF3Q0RKMSt6ZTZ1VWpZZ0lYZXpaMW5OVnJsbXhEM3NtbVBYNlg1bzNRQ0ZZ?=
 =?utf-8?B?VEpuUEMvcy9TZDhHK1RQajZNdlQyeHpncWlZTDI3a3RIUjh5ZHRuTUNtYUMx?=
 =?utf-8?B?Z0hIVXRnY2Z2ajdYTER1d2dRcGFjSm13TUU0V1ZMZTFjNGlmQ3dsamdZN3N1?=
 =?utf-8?B?YUt0bmxTLzBYSnBZYnd3NjR5SW5EWFMzNEVRZ1l2bWJEeUxmS1AwNXN5SDBO?=
 =?utf-8?B?Rnc9PQ==?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea94672b-1636-4826-164d-08da94ba52ca
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:28:40.1556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2fFZkbIIFb6Ncc16zOShlSDcvhcpYL5WqqgM7oNq+cGRIuHL7BTi9dYdX8u2joLiYMxUqukII9Qhq5XnuBF9ByPCuFZWMn9q8PuR0ssimo=
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

NMD class methods with the conditional_function type like
NMD::ADDIU_32__cond, NMD::ADDIU_RS5__cond, etc. are removed from the NMD
class. They're now declared global static functions. Therefore, typedef
of the function pointer, conditional_function is defined outside of the
class.

Now that conditional_function type functions are not part of the NMD
class we can't access them using the this pointer. Thus, the use of
the this pointer has been deleted.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.cpp | 42 +++++++++++++++++++++---------------------
 disas/nanomips.h   | 14 ++------------
 2 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 271afcde07..98a632a3fc 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -784,7 +784,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
             if ((op_code & table[i].mask) == table[i].value) {
                 /* possible match */
                 conditional_function cond = table[i].condition;
-                if ((cond == 0) || (this->*cond)(op_code)) {
+                if ((cond == NULL) || cond(op_code)) {
                     try
                     {
                         if (table[i].type == pool) {
@@ -1672,28 +1672,28 @@ static uint64 extract_u_3_2_1_0__s1(uint64 instruction)
 
 
 
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
@@ -1702,7 +1702,7 @@ bool NMD::BEQC_16__cond(uint64 instruction)
 }
 
 
-bool NMD::BNEC_16__cond(uint64 instruction)
+static bool BNEC_16__cond(uint64 instruction)
 {
     uint64 rs3 = extract_rs3_6_5_4(instruction);
     uint64 rt3 = extract_rt3_9_8_7(instruction);
@@ -1711,35 +1711,35 @@ bool NMD::BNEC_16__cond(uint64 instruction)
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
@@ -16692,7 +16692,7 @@ NMD::Pool NMD::P_ADDIU[2] = {
        0xffe00000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.RI */
     { instruction         , 0                   , 0   , 32,
-       0xfc000000, 0x00000000, &NMD::ADDIU_32_        , &NMD::ADDIU_32__cond   ,
+       0xfc000000, 0x00000000, &NMD::ADDIU_32_        , &ADDIU_32__cond   ,
        0x0                 },        /* ADDIU[32] */
 };
 
@@ -16790,7 +16790,7 @@ NMD::Pool NMD::P_SLTU[2] = {
        0xfc00fbff, 0x20000390, 0                      , 0,
        0x0                 },        /* P.DVP */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000390, &NMD::SLTU             , &NMD::SLTU_cond        ,
+       0xfc0003ff, 0x20000390, &NMD::SLTU             , &SLTU_cond        ,
        0x0                 },        /* SLTU */
 };
 
@@ -21335,7 +21335,7 @@ NMD::Pool NMD::P_PREF_S9_[2] = {
        0xffe07f00, 0xa7e01800, &NMD::SYNCI            , 0,
        0x0                 },        /* SYNCI */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001800, &NMD::PREF_S9_         , &NMD::PREF_S9__cond    ,
+       0xfc007f00, 0xa4001800, &NMD::PREF_S9_         , &PREF_S9__cond    ,
        0x0                 },        /* PREF[S9] */
 };
 
@@ -21547,7 +21547,7 @@ NMD::Pool NMD::P_PREFE[2] = {
        0xffe07f00, 0xa7e01a00, &NMD::SYNCIE           , 0,
        CP0_ | EVA_         },        /* SYNCIE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001a00, &NMD::PREFE            , &NMD::PREFE_cond       ,
+       0xfc007f00, 0xa4001a00, &NMD::PREFE            , &PREFE_cond       ,
        CP0_ | EVA_         },        /* PREFE */
 };
 
@@ -21719,7 +21719,7 @@ NMD::Pool NMD::P_BALRSC[2] = {
        0xffe0f000, 0x48008000, &NMD::BRSC             , 0,
        0x0                 },        /* BRSC */
     { call_instruction    , 0                   , 0   , 32,
-       0xfc00f000, 0x48008000, &NMD::BALRSC           , &NMD::BALRSC_cond      ,
+       0xfc00f000, 0x48008000, &NMD::BALRSC           , &BALRSC_cond      ,
        0x0                 },        /* BALRSC */
 };
 
@@ -22067,7 +22067,7 @@ NMD::Pool NMD::P16_MV[2] = {
        0xffe0    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x1000    , &NMD::MOVE             , &NMD::MOVE_cond        ,
+       0xfc00    , 0x1000    , &NMD::MOVE             , &MOVE_cond        ,
        0x0                 },        /* MOVE */
 };
 
@@ -22133,7 +22133,7 @@ NMD::Pool NMD::P_ADDIU_RS5_[2] = {
        0xffe8    , 0x9008    , &NMD::NOP_16_          , 0,
        0x0                 },        /* NOP[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x9008    , &NMD::ADDIU_RS5_       , &NMD::ADDIU_RS5__cond  ,
+       0xfc08    , 0x9008    , &NMD::ADDIU_RS5_       , &ADDIU_RS5__cond  ,
        0x0                 },        /* ADDIU[RS5] */
 };
 
@@ -22170,10 +22170,10 @@ NMD::Pool NMD::P16_JRC[2] = {
 
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
 
@@ -22183,7 +22183,7 @@ NMD::Pool NMD::P16_BR[2] = {
        0xfc0f    , 0xd800    , 0                      , 0,
        0x0                 },        /* P16.JRC */
     { pool                , P16_BR1             , 2   , 16,
-       0xfc00    , 0xd800    , 0                      , &NMD::P16_BR1_cond     ,
+       0xfc00    , 0xd800    , 0                      , &P16_BR1_cond     ,
        0x0                 },        /* P16.BR1 */
 };
 
diff --git a/disas/nanomips.h b/disas/nanomips.h
index 8eca843ef0..af803f4cc0 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -64,6 +64,8 @@ typedef struct Dis_info {
   img_address m_pc;
 } Dis_info;
 
+typedef bool (*conditional_function)(uint64 instruction);
+
 class NMD
 {
 public:
@@ -75,7 +77,6 @@ private:
 
     typedef std::string(NMD:: *disassembly_function)(uint64 instruction,
                                                      Dis_info *info);
-    typedef bool(NMD:: *conditional_function)(uint64 instruction);
 
     struct Pool {
         TABLE_ENTRY_TYPE     type;
@@ -94,17 +95,6 @@ private:
                     TABLE_ENTRY_TYPE & type, const Pool *table, int table_size,
                     Dis_info *info);
 
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
     std::string ABS_D(uint64 instruction, Dis_info *info);
     std::string ABS_S(uint64 instruction, Dis_info *info);
     std::string ABSQ_S_PH(uint64 instruction, Dis_info *info);
-- 
2.25.1


