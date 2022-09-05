Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7775ACFB8
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:14:14 +0200 (CEST)
Received: from localhost ([::1]:57882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV97N-0006GH-2Q
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8s7-0002bQ-Fz
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:58:27 -0400
Received: from mail-am7eur03on2116.outbound.protection.outlook.com
 ([40.107.105.116]:22720 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8s5-0001oc-6W
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:58:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6V0Q0CWneI0rOkn9MV5LvEZBEd/u+K/U7Eyc6yVyEMP6ouWIkHjSZx42ToJjUBUVBAS2vuHo9BVjo3RbNxP5VBse5DWxDMY8ja5LVYebvmoj9B9hRD0B/JdrHaQuZw6gXEYP6HbNg76XfYUxO/yWwavsS6XeEI1XOUy4kd84rxub2odxkAO0YlzRjHZ+5EVxK2a66jwJaosfTMuns3abbhiNwewQC8HUiju+s7T0g2D99F+948U62d2v5O4rh+n3b9nTUn5V/hp+kEh5aObL7i3KUfM3DDs2xRw1mZpzJBN7ogs50xqGCLdo8DVrI/kCd4vtuoNSgmPan6nfvUdlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4+s8Hshep3YojmVmRWXlMx3VKyp/EFH3GDx5BTBTUU=;
 b=OqoE2gBirGl+xxGYYGH/P4kqu8z+/qafprLPahg77nm0iZFabrXUib3CwjOrS1jp1BaOj31NotgUXURxP3wE3Z+GactY5N7rPdh8PgYoKpypm+LYVO3HckmROiI/3o3TAAdIjtbhdwwv+08P1v1EpcRz4QiVqg0awruEsRKw1WPKHF7oAjKm7JZvPmDQz6zUaavoJw91WAOj38PBY0/KEha+UvsUmg43SXEVtu/qxHEMIUD0x2bJOGeRR0pjT/r7wFyYyQqsMwZW/1hidoj8dMHPrzb0dI11mV+nNNpe+7i6SAz0RpDNaibpn77om3r/EF6JFCW+S29DzxiPw25d3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4+s8Hshep3YojmVmRWXlMx3VKyp/EFH3GDx5BTBTUU=;
 b=vN6Q4LP60LMalr+tUn93f/+uVblUzHJflr/7L52dLSxfP3vovpvCVVGZxykC1zY/LJVQZ3fmEISRfoc2GLVrnBEk2um7zYVR0D11j60TpzBRlPjkPPLzkOAJx+nLe9DrLD4YRZatD2sM/W886lu8x0MnVa0bW7ZvpqPjnHkhM9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB8740.eurprd03.prod.outlook.com (2603:10a6:20b:53b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Mon, 5 Sep
 2022 09:58:21 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:58:21 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 05/20] disas/nanomips: Remove __cond methods from class
Date: Mon,  5 Sep 2022 11:55:07 +0200
Message-Id: <20220905095522.66941-6-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::33) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58a3fb32-c3be-4cc5-2117-08da8f252a55
X-MS-TrafficTypeDiagnostic: AS8PR03MB8740:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+vEZ2hbV0DxAmVwIsueFWI6TioAsZtbdFpt6pjFrOD6Tjsm2srk1FmO+C2oV1Ww0803OTJlF7TkouD7oaVvi4UXfWmTEpH8mur4JPG1R3axBN54T7eHqhs++dCDkDqYQjyWy1xWxBR/ybFeD5O1R9dy4KDoSpipOEUgVCWduG3ymCjeBCoPKcLoID9dijMvoMXCglYGPDA/FTkaRGLpA05wJzS548ft57lQhYFl7lcS4E/7wcf/KA+GkZfjnmIpljIjPn7qAsaqNqhGS8wa+hnSx38UwUw8MdOuAEo1OPw14DCe0eIw5SwX5/dxbZxSQL5mVdVstDRavdeMMWIEUoxDRbVmASWHmK7LDut4MU5+eQs2/AtKCM1em+wmbNn5TeGZB+uGkFEQwU+pVryuky0DgrdagsfejnESYHs6T/bBhVmiNAS2WK+/GszEnitU8I+P64ymg6H9IX7PRNOR58aN89NBmekqc8kMQxFfhkrztJ/KsJ4KvrlytxI8zjGQTm4luSYXdQ0BmXh6YasRplLHsFTvl/dRCwQ2X1waFtQx/SSNTK4YoEvfz2o7N/1e83/rPAmPXGIqCt5DS38Ncpg4jvMlUE8lSYXvfQgmSqi9zs/5HhXyNEHbz5TO0gV1ezclkJvR3xn6cKn26Fc38MUKGXZiXTTaD58Hkd4DL5yo/K9etMCXXR2tGXxhFMM1tuTohSwqKPjV9Vh/8w5i3tKp0m9pa3eld4xc5ofMfP5WEyQCn2yz3hOtrXvl8UYJYntkq4sy/isGzd/K/MN97g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(366004)(396003)(39840400004)(7416002)(8936002)(44832011)(5660300002)(2906002)(38100700002)(478600001)(6486002)(41300700001)(38350700002)(52116002)(6506007)(6666004)(316002)(83380400001)(6916009)(54906003)(66476007)(4326008)(66556008)(8676002)(66946007)(26005)(6512007)(186003)(2616005)(1076003)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0p5Q2V2ekloRjhFcUhwTVp4MlhYOWRrTnVNRGFpNDVpNWhHYTZ6UkJCK1ll?=
 =?utf-8?B?STNRT1ZFbG4wb2pvQ254N1V6ZTBuZXB6Ym56QTcvdHhJS1g1a2hMNUxGeGxB?=
 =?utf-8?B?SHBsSmtzYW9jTUUwa1ZWaGZ5VVhlN2hQZHB2OEUraldGTWQrK1VrSWdGSkRP?=
 =?utf-8?B?UUtRYm5RSDFLa2UveXU3WWQ1WGhyUnZlQ0M4TUs5RnVySzk3RWtUTEtmY3dB?=
 =?utf-8?B?MlNKUVkwMVU4bnNNeGtUQTZEeFJtdkNrZ21zMVZRRHJKNTdjOHE0YVVpS3Vs?=
 =?utf-8?B?bjlIVkNvWHJ0TXViZFV5eVRMNHdKU2wrMW9CK2lVNzJZLzJ0NXZyRzN0U0F1?=
 =?utf-8?B?MEJzOFV3cVVQNUFSQTJaNDhPSHFUQ05mVmU0WUxSbTFXV2JqbkQzNTJVTVN6?=
 =?utf-8?B?b1RMWVJvUVhEZS9DZFZnTFF4cDhlRlhBd2pEQ2xqSEVDcEZWNHlKODlrYnRM?=
 =?utf-8?B?VUpXZE9SSWVzaE5oVnNOaC8ycFZWQ0lwUDkreWljZEJud0h3VEt2cEg4Ujl0?=
 =?utf-8?B?ek9tWk5ZNnNRK2ZoSnJydXd3cjNyZWVBZ1FnSU8xbkdoWTEyb2VTTVdGSXox?=
 =?utf-8?B?a0tiekVwS215SUdTMEtrV1ZGR1BvZHV3Skw0S01RcFllMm5KRnJoQnlwa3BG?=
 =?utf-8?B?TlNBTXYwVE9CaTdVaUdwWHdJaUp4d05KQ29WaFBrTjI3dllWQUkvclRxbzQ3?=
 =?utf-8?B?bTlybEswQ3VCZFhyZk8xNHcrRzhrMUc5WmxCbUlUdGlJcDRQQU8wYmVBLzFZ?=
 =?utf-8?B?cWRsRlJMaUtCTjBXYmtrNS9hSkY0dUxqMkcwdkVpbmROS2FEamtHRlZtUjk2?=
 =?utf-8?B?akNQbHZJNjNVYjVkRVhUS05qOUtqMDZNN2F1elRMSXU4SytFWmpZbHh6NEt3?=
 =?utf-8?B?QlFqWWpEdmZyR1ZORlJhVTgzSjFvSjNCa0RHYkZudmxZWTRpWFJuSXo3RTNr?=
 =?utf-8?B?bWRDekw4Uk5OZndQWGhBZzNvYk5IVWpWbGJZeEpEM24rdUpXQ2dzSE1STUEx?=
 =?utf-8?B?UEJIendlOG5ISXQ2NHlkZktoejl4U1lDenZJYng3L1QrUGdZWUJvTHJvbSta?=
 =?utf-8?B?MEVFUGZkWXc2bDFnYlNueDhpWWw4Snp4bVo2NHE2YmJHS3FML0NaUU8xOW1z?=
 =?utf-8?B?UkRuSkIzV3Q0S2tORUpGcFU5QmFiMnZuRGhUQWZBaGtvKzdqNU9Ka1pqSW1D?=
 =?utf-8?B?dW1wTkR1NkN3RlUrSHdxNTQ3aWFrc0tuY3VENGNSNFFJNWxNTXM4TEFjSWRm?=
 =?utf-8?B?Ri9VWk1WYnl0SlZjVHVrTTAwSUNrcWkya2pVWmk0VzE1YUt3aXU1SVJUVTlV?=
 =?utf-8?B?Y3ovUFRZZm9IVCtSc2VYNWRaVjlVNmMwZmNFM2haQ3hlL3M5L0FxM05GcjFD?=
 =?utf-8?B?V0RMV2ZoWFJYY3doYU1KTFpVTzdrV3FhZVRSeS9oL3dUL2J5V0pTTGpaMlF4?=
 =?utf-8?B?ODNRdlQ2MzNSZkl0VTdlc1EyMEFLRE54SDh0aVloRmM4UzNzVUNWajdpZU9l?=
 =?utf-8?B?dUkxSmhNTGtMaHhhcTk0ZXd1TlBtaEU0VWlLWTBVbG8ybTcwSnlBdG1QVnQy?=
 =?utf-8?B?cTJSU24zRDRLU28wMEdQQzVLQXMrcTFIc0Z0Yzl1RCt6TVpXcDdpNjJ3SC9L?=
 =?utf-8?B?VTFQcjc1dDhnUkx1dmplK3VWalVrV01HQjBIYy9YQzRwZ1pqYUpnR0Q3L08w?=
 =?utf-8?B?RXZ0a0pMMWFQNDlxbENhODB5RFhhUDFZYmVkbW50RFY5RmtFMmFsTGhseHdQ?=
 =?utf-8?B?Zms3VnJzNmpvaWNhZ0c0OGlZSHhOYW45c2Y0YnNpNEV0K0syQ2NYa3Ara2V4?=
 =?utf-8?B?TXkyT0pwbUM0TXVIeFZ0bGFnUHo2S3Q5emFwZ1YwME5tMlVwdkhWMXJ2ZGUw?=
 =?utf-8?B?ckhodytRTW9NeXQxQmw4RFdYbXhabnl0N3RtOHRaTUk4QkptNExUcndJOVBB?=
 =?utf-8?B?SEIrdHZtUi9selpqeHVLVExPUXM5MCtseWVkcTErZ3ppWTNra2JLZmw1UDA4?=
 =?utf-8?B?S0FPMXVOTHFhZHpFb2NCTHhJVUFLQmZnZVFIOCttRmtUeVppWVo4LzVVQ1ox?=
 =?utf-8?B?NFYxcnp1UktiNDJxMVdJSmFYVk01ZTUvWms3YzJETVo5M05md1JnQmN3b091?=
 =?utf-8?B?WU1mdXlpdmpBdjdGNnNQQU1DVEE4MTcyVkdGbmVoUkNYRmJscjJ2R2RSSnQ4?=
 =?utf-8?B?MEE9PQ==?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a3fb32-c3be-4cc5-2117-08da8f252a55
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:58:21.4536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2qd+gytbbZICV8MDdY0CY62T27UF17uq9AyOaV/pcjN1dzBv5Umi60BuU/dvczPwt1j/bBjessSju8do0EodEubTUcGaWJz6/yHViDNHnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8740
Received-SPF: pass client-ip=40.107.105.116;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
---
 disas/nanomips.cpp | 42 +++++++++++++++++++++---------------------
 disas/nanomips.h   | 14 ++------------
 2 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 91ea35bf75..ecc3e7efda 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -781,7 +781,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
             if ((op_code & table[i].mask) == table[i].value) {
                 /* possible match */
                 conditional_function cond = table[i].condition;
-                if ((cond == 0) || (this->*cond)(op_code)) {
+                if ((cond == NULL) || cond(op_code)) {
                     try
                     {
                         if (table[i].type == pool) {
@@ -1678,28 +1678,28 @@ static uint64 extract_u_3_2_1_0__s1(uint64 instruction)
 
 
 
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
@@ -1708,7 +1708,7 @@ bool NMD::BEQC_16__cond(uint64 instruction)
 }
 
 
-bool NMD::BNEC_16__cond(uint64 instruction)
+static bool BNEC_16__cond(uint64 instruction)
 {
     uint64 rs3 = extract_rs3_6_5_4(instruction);
     uint64 rt3 = extract_rt3_9_8_7(instruction);
@@ -1717,35 +1717,35 @@ bool NMD::BNEC_16__cond(uint64 instruction)
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
@@ -16698,7 +16698,7 @@ NMD::Pool NMD::P_ADDIU[2] = {
        0xffe00000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.RI */
     { instruction         , 0                   , 0   , 32,
-       0xfc000000, 0x00000000, &NMD::ADDIU_32_        , &NMD::ADDIU_32__cond   ,
+       0xfc000000, 0x00000000, &NMD::ADDIU_32_        , &ADDIU_32__cond   ,
        0x0                 },        /* ADDIU[32] */
 };
 
@@ -16796,7 +16796,7 @@ NMD::Pool NMD::P_SLTU[2] = {
        0xfc00fbff, 0x20000390, 0                      , 0,
        0x0                 },        /* P.DVP */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000390, &NMD::SLTU             , &NMD::SLTU_cond        ,
+       0xfc0003ff, 0x20000390, &NMD::SLTU             , &SLTU_cond        ,
        0x0                 },        /* SLTU */
 };
 
@@ -21341,7 +21341,7 @@ NMD::Pool NMD::P_PREF_S9_[2] = {
        0xffe07f00, 0xa7e01800, &NMD::SYNCI            , 0,
        0x0                 },        /* SYNCI */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001800, &NMD::PREF_S9_         , &NMD::PREF_S9__cond    ,
+       0xfc007f00, 0xa4001800, &NMD::PREF_S9_         , &PREF_S9__cond    ,
        0x0                 },        /* PREF[S9] */
 };
 
@@ -21553,7 +21553,7 @@ NMD::Pool NMD::P_PREFE[2] = {
        0xffe07f00, 0xa7e01a00, &NMD::SYNCIE           , 0,
        CP0_ | EVA_         },        /* SYNCIE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001a00, &NMD::PREFE            , &NMD::PREFE_cond       ,
+       0xfc007f00, 0xa4001a00, &NMD::PREFE            , &PREFE_cond       ,
        CP0_ | EVA_         },        /* PREFE */
 };
 
@@ -21725,7 +21725,7 @@ NMD::Pool NMD::P_BALRSC[2] = {
        0xffe0f000, 0x48008000, &NMD::BRSC             , 0,
        0x0                 },        /* BRSC */
     { call_instruction    , 0                   , 0   , 32,
-       0xfc00f000, 0x48008000, &NMD::BALRSC           , &NMD::BALRSC_cond      ,
+       0xfc00f000, 0x48008000, &NMD::BALRSC           , &BALRSC_cond      ,
        0x0                 },        /* BALRSC */
 };
 
@@ -22073,7 +22073,7 @@ NMD::Pool NMD::P16_MV[2] = {
        0xffe0    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x1000    , &NMD::MOVE             , &NMD::MOVE_cond        ,
+       0xfc00    , 0x1000    , &NMD::MOVE             , &MOVE_cond        ,
        0x0                 },        /* MOVE */
 };
 
@@ -22139,7 +22139,7 @@ NMD::Pool NMD::P_ADDIU_RS5_[2] = {
        0xffe8    , 0x9008    , &NMD::NOP_16_          , 0,
        0x0                 },        /* NOP[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x9008    , &NMD::ADDIU_RS5_       , &NMD::ADDIU_RS5__cond  ,
+       0xfc08    , 0x9008    , &NMD::ADDIU_RS5_       , &ADDIU_RS5__cond  ,
        0x0                 },        /* ADDIU[RS5] */
 };
 
@@ -22176,10 +22176,10 @@ NMD::Pool NMD::P16_JRC[2] = {
 
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
 
@@ -22189,7 +22189,7 @@ NMD::Pool NMD::P16_BR[2] = {
        0xfc0f    , 0xd800    , 0                      , 0,
        0x0                 },        /* P16.JRC */
     { pool                , P16_BR1             , 2   , 16,
-       0xfc00    , 0xd800    , 0                      , &NMD::P16_BR1_cond     ,
+       0xfc00    , 0xd800    , 0                      , &P16_BR1_cond     ,
        0x0                 },        /* P16.BR1 */
 };
 
diff --git a/disas/nanomips.h b/disas/nanomips.h
index c8a098922c..ff91fbf8c6 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -31,6 +31,8 @@ typedef uint32_t uint32;
 typedef uint16_t uint16;
 typedef uint64_t img_address;
 
+typedef bool (*conditional_function)(uint64 instruction);
+
 enum TABLE_ENTRY_TYPE {
     instruction,
     call_instruction,
@@ -72,7 +74,6 @@ private:
 
     typedef std::string(NMD:: *disassembly_function)(uint64 instruction,
                                                      img_address m_pc);
-    typedef bool(NMD:: *conditional_function)(uint64 instruction);
 
     struct Pool {
         TABLE_ENTRY_TYPE     type;
@@ -91,17 +92,6 @@ private:
                     TABLE_ENTRY_TYPE & type, const Pool *table,
                     int table_size, img_address m_pc);
 
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
     std::string ABS_D(uint64 instruction, img_address m_pc);
     std::string ABS_S(uint64 instruction, img_address m_pc);
     std::string ABSQ_S_PH(uint64 instruction, img_address m_pc);
-- 
2.25.1


