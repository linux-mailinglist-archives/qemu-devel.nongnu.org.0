Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D985AD014
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:29:19 +0200 (CEST)
Received: from localhost ([::1]:43724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9Ly-0005il-4Q
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8tO-0004cu-D0
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:59:48 -0400
Received: from mail-am7eur03on2106.outbound.protection.outlook.com
 ([40.107.105.106]:56865 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8tH-0001wM-1H
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:59:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/vpzjumjPBMgXREwwr0eL41oyEYu7zpW7WdUKA4selJeByVzVinTDJhSsoo3y8rAvTges6sWDck9MFPagwZ5rofhPjc8uf35y/hOi261qvILjPho23u/VPX63zqTqnM8eh8lZKhylcqxa6wczX956iK39R5eit1Oh2zNkSUfHwMLNkh76PmPmdy2h3skUDm660jTegZMSC90AUs38byw6P1GGd7gnZGsb3Gls5QEJ3fNk6cgoS7CYsY6cB0SYtb9UDQvzlqQsZBGcNOwq0DDzo01dNCbaPwGlR1nbaUzIisgw1HlwchriqKIboTixHFS4xEwqP4fbczebEPkYRLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73aiyIVItiGgyThjF19aB/vzMxUt22L9BP1hrM/xfn0=;
 b=PBxL1u/kegdTxlzwvGoPFkx2VNWAFoMmhP7XuiUI8dBXU1VvyYchLu4ywQu1YG9S0FC0bWBglJLiMhe+sYDZPXvgTIR73d0CQBPsrzSV7qp73c12gyNfV/auFvBfTSHxtfHaYiRpAnstN/dJaVFvSfwjkLkdx2hdY2685QHte4xFUKvgiOQtbNXLpeyl0D9ARVY7XiUI07h87uKbBobX+7vjk1Ycgd0ypLZN/vvPFAVbpUSUx4ymIqkC1ywPJMlXg+fS2pvfpQDs15hLXUGfkCjSxDKiCwqWBCYFpOFMzU76EnSIm0MGgroR8H1YrlMhkfhmabHXY1tE6DSxaUI2Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73aiyIVItiGgyThjF19aB/vzMxUt22L9BP1hrM/xfn0=;
 b=k8kCFL2/XsoSnTubJc1hG47URGTpj6UC5Jo2tGJ72AeuwdJ5BDZ5g0pRDqkbJO9wVHk+TwsA4+Il5Ya2klEQ2llo7tIAyPTR2G8HeFhTRMnujh/9TYsKTuuGd9WrMTG2Kt8uh2hPUEnR8OqdvXqYkBFfaGTZL0jDWugiiIZv1NM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB8740.eurprd03.prod.outlook.com (2603:10a6:20b:53b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Mon, 5 Sep
 2022 09:58:29 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:58:28 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 06/20] disas/nanomips: Remove disasm methods from class
Date: Mon,  5 Sep 2022 11:55:08 +0200
Message-Id: <20220905095522.66941-7-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 35e2908b-8aae-42d3-5592-08da8f252e69
X-MS-TrafficTypeDiagnostic: AS8PR03MB8740:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zPSOS15TDGHYSpjSJivrWXBrukv/0X7ohNcbNYZSOcjhpfegvVO3Xz7KytPFLLSLHrLbmSQ5NizApb8lkph+PUGgAXmEWeUOzWL0VSkkEGCzKvNFUQKQhZoW2PujPMWu6KFwyPjm8DzFKWUvPoM5bnjPfXklacnH7ji6Fbh9Z57CpDUCjeGumwrEd03onIWNTNK/BPnwWCFIU6Uwu3azuRfmoSDjjEdd/5zL0X4Hs21h6RCAORkrU+DtchqCNtOvGsMU+P22WE9O6HkXedtMDxWatF+M436bRCRJAf8a0NOZYp2FcmZaKEVjrXcyEAIbFYE9LaGlmN0U2FB8a3c9QejHm6jGfItnfbb6aHzC+Z3ljy186mRSx110C8rBj3oHGBW+m5MLTBVKiv2udbQCaDtnrJUlzd7kO4FM8aV1f8e364zpXxr8jGuyBr+qU+Uyfvxjz9ZZeKZoXYNkdaVZsHnoASoyvz/kuP5hDeilZtENeysaTGMEElKzyHxcvEmKM+bFEiPBO5iO1R5MY3vOps8FVU+Bw8uCNT+pkgfvjby5EwtO5FB39Ug5u/mE/HJgVr7ttXXbSdyYz4XcH3WCqXE7xxsKfO+kQVZz+bbfEo9OWiR8ufSWg1YarfEaW3En4vyC9IMZMQ61R/obuV9k7eBEcCFWHKxXDAESGr+a+PUlBn3gqQVycYVkV+TztGkIzBuHvQ/ieiVorWC2dCNQDydQS4VSZSX/Vu8d2jtzO6Z4ADLToX2p/ygF9E4N9xRmhuU1fHFCEnvNYClPTTHhRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(366004)(396003)(39840400004)(7416002)(8936002)(44832011)(5660300002)(30864003)(2906002)(38100700002)(478600001)(6486002)(41300700001)(38350700002)(52116002)(6506007)(6666004)(316002)(83380400001)(6916009)(54906003)(66476007)(4326008)(66556008)(8676002)(66946007)(26005)(6512007)(186003)(2616005)(1076003)(86362001)(36756003)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXUyeVdlZEpNTmMxaXNuWEZzUVZoazJ1eEJtUUY4NWVtTXJxSEV1MFRSTm5x?=
 =?utf-8?B?aEtpT3VhWHBiRDZuSDZPVVV1NkRnL3hqOFBsT3k3WWwxUWdyQmp6OGpqUUYr?=
 =?utf-8?B?MjNHaUFmMTNNYmVZNDIwM05oUmhJN05WOFBEa0UzTEI3UGVEbjU4VUdDRmlD?=
 =?utf-8?B?TlNDdlR0LzhUcDhlKzI4VlR5ZTY4dzFJUVhCRThkd3poSjVpVzN5cXZuVks1?=
 =?utf-8?B?WDZPM0xZL2l6VHZnOGprMFZlRHVBYmVBMHdLeDhpOVFSRlY1QW0wM25vdWc2?=
 =?utf-8?B?UVcwNldaaUJNSnJobE1FOVplc202RlpsSWxDTXZiZmMycGJCdFZRM2MwOTl0?=
 =?utf-8?B?RHB6azNLL2dDbVZIQXdJV2M1VXRIcHFXR3A5dGxSb2lWMFdpY3h3RDlvRzUx?=
 =?utf-8?B?V294RXloT3g2YW1mU2pQTzRZMVp6N2xrYUFKWW5MRVRsZnFhVXZLd285YVRl?=
 =?utf-8?B?ZU05OE1EallUTEFZa0ZLck45WFVVUmhiTmVZTUFtV3QrSnNsZHpSdnFpcWcz?=
 =?utf-8?B?MWJkdEFVQVcvbjRPSmdkN0lZRFc1ZDd1MlJOZ1VPNmxhM3QrZmlnY1JHVGcz?=
 =?utf-8?B?UzYzRWhUWjZQSFlTSCt2b1QzRkhLcUtQSGpLc2t1cjFUSlhGeHRsbGJXb1gy?=
 =?utf-8?B?NGMzVHJCSXJ4cjdmRWt4czN5b2dRemRIdzk2Zks0Nit5L2N5QlczaGpoa0pQ?=
 =?utf-8?B?a3ovMXVPTnJPVmc0Ymo1S2RKWVFQWWpFcldRWXd1TDFqZm5EYmRmTmUrRW00?=
 =?utf-8?B?cStrWFg1ZExZdTNkamorbElIMGprZTd3SDJOSTI4NGdEVUZtQTJaVDBxYVJt?=
 =?utf-8?B?SFVoY1Z4b0F5SnBhbnZHa3JFNkk3azcveE1LbzJLNnJvSVQ0cGJobzQrNjVr?=
 =?utf-8?B?dlRDVVdDOFFad29nMnovdjRybEROZVJ3Ukxua3pWMmV3aXkzNE9uQlZ6VDJK?=
 =?utf-8?B?YXB4ZlhKZmlCRnVRYWFuM2tsbUpPaXNsUG1Weld0THp1dmlNRFZMcmNKYUk4?=
 =?utf-8?B?NlQ5V015N0dwc1FXSkpmc1pHdFM0dkxXMzBQTjdCWllXcWgzbFowYnlFUlgv?=
 =?utf-8?B?dEFNQ3lCamoxZzlkMmlROVM4d3FaSlVzQ3oweklTR0tnT2VPVXoyYzVNZTR4?=
 =?utf-8?B?NUVCYU9BaVJucW5kN2J0QzIzL0FrN1VzNmE4ZUhMNjlFNTYzL0kvWFlhLzNP?=
 =?utf-8?B?MGNBSUhzN3BZM0RwOURFYmF1YklkU3NWN3BUNXpmd2FDSUlqbS9PNjBvVko2?=
 =?utf-8?B?ZHhkTWU2RkRmZHRCSjJNbjFWYUpqa0t4WnMvYU55eHl6Ry9LYXlOQUpIc0I0?=
 =?utf-8?B?NmpkRjRCbHBxL1Y5SGpKbGViSmM1MHZ6SEJ2cDRzVzVzeDZqWXF4dkNNQTNH?=
 =?utf-8?B?OG4rMCtHUVZkVDU5OVMzdHVZT1ZwZUJ5bEhhS1FlOWovdFdjUTRKY1llVW9Z?=
 =?utf-8?B?RGhPTlBYekd1TGo1dkxhdmJjMXpGaXNwUHVxdzJWa20vQW4zSDVJTUhSbENp?=
 =?utf-8?B?ODRuazJDZVZqQkpmS3p3NUxWVUEyMWZzMHhNWUVLRUpRRlVqeFdNdDBJa2dM?=
 =?utf-8?B?emIzNG1JY0tFc0hOc0crRnB3VjA4OWs5RXorQmtvWmR6QnFUclhSdDE0Sjhj?=
 =?utf-8?B?SlN4WDN4Ukw1ZlFaeWFET1JuTmFML3lBcm1UcWsvaG5FU0xYSDBSbUszWlNm?=
 =?utf-8?B?ZEtBR0RUVDdlemgxaFd2T29qQVgzV0RWVnoyN0RmZ1FiUmFTM1JEcmpwYzhQ?=
 =?utf-8?B?NENtc0xpWVJZU3BwSk9tc0FodHBKOUM1a25LMDFqaGNhMTViRWRtYWluWWtO?=
 =?utf-8?B?bTdweGhJdUxjaEdVRjlLZ1ZZeG5Zcklvd3k3TTduMEVZSG5FaFB3TDQ0bFBR?=
 =?utf-8?B?NlpHY2grSHFkaC8wUTdsUHB2cUw0VUJucU1Sam8rWS9jb08xdmZwbkhEOW1G?=
 =?utf-8?B?OCs0cGxHbnFZN0NZVUZPQnNvV1dDMWRjNVdYTVhTZ0RzbjFKa3JrTVU0K0Uy?=
 =?utf-8?B?ME9NRHcrSko0MDRqRjJYOEU1NUtyanpjcFF1ZlhVS2x4a0xVT09ybUhNYnph?=
 =?utf-8?B?eXc3QXFrN1JWVzROZmRkaWVNODBPRndBN1RNTGdMVWRWU0xNRnA1UTZEWC9t?=
 =?utf-8?B?OFBvMEY3QVRLdHNBWnYzazB1S0s1b2FXM2IvZkJVRmV4K2J0SG5ibmlNQS9P?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e2908b-8aae-42d3-5592-08da8f252e69
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:58:28.8281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tyjsXLIp1VKUVBPjPQl1+s9PTiCN9r1mQzBGKnDmMoGIAC4n+MFhZ8Syih0SgjMAitn+QCoWMlJvQluCfUKOVr7Gc/JH9wg65GMcusZxoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8740
Received-SPF: pass client-ip=40.107.105.106;
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

NMD class methods with the disassembly_function type like
NMD::ABS_D, NMD::ABS_S, etc. are removed from the class. They're now
declared global static functions. Therefore, typedef of the function
pointer, disassembly_function is defined outside of the class.

Now that disassembly_function type functions are not part of the NMD
class we can't access them using the this pointer. Thus, the use of
the this pointer has been deleted.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 disas/nanomips.cpp | 2546 ++++++++++++++++++++++----------------------
 disas/nanomips.h   |  642 +----------
 2 files changed, 1275 insertions(+), 1913 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index ecc3e7efda..7ea6326f1d 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -808,7 +808,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
                                 return -6;
                             }
                             type = table[i].type;
-                            dis = (this->*dis_fn)(op_code, m_pc);
+                            dis = dis_fn(op_code, m_pc);
                             return table[i].instructions_size;
                         } else {
                             dis = "reserved instruction";
@@ -1763,7 +1763,7 @@ static bool SLTU_cond(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ABS_D(uint64 instruction, img_address m_pc)
+static std::string ABS_D(uint64 instruction, img_address m_pc)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1785,7 +1785,7 @@ std::string NMD::ABS_D(uint64 instruction, img_address m_pc)
  *               fd -----
  *                    fs -----
  */
-std::string NMD::ABS_S(uint64 instruction, img_address m_pc)
+static std::string ABS_S(uint64 instruction, img_address m_pc)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1807,7 +1807,7 @@ std::string NMD::ABS_S(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_PH(uint64 instruction, img_address m_pc)
+static std::string ABSQ_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1829,7 +1829,7 @@ std::string NMD::ABSQ_S_PH(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_QB(uint64 instruction, img_address m_pc)
+static std::string ABSQ_S_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1851,7 +1851,7 @@ std::string NMD::ABSQ_S_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_W(uint64 instruction, img_address m_pc)
+static std::string ABSQ_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1872,7 +1872,7 @@ std::string NMD::ABSQ_S_W(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ACLR(uint64 instruction, img_address m_pc)
+static std::string ACLR(uint64 instruction, img_address m_pc)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1895,7 +1895,7 @@ std::string NMD::ACLR(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADD(uint64 instruction, img_address m_pc)
+static std::string ADD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1920,7 +1920,7 @@ std::string NMD::ADD(uint64 instruction, img_address m_pc)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ADD_D(uint64 instruction, img_address m_pc)
+static std::string ADD_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1945,7 +1945,7 @@ std::string NMD::ADD_D(uint64 instruction, img_address m_pc)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ADD_S(uint64 instruction, img_address m_pc)
+static std::string ADD_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1968,7 +1968,7 @@ std::string NMD::ADD_S(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_32_(uint64 instruction, img_address m_pc)
+static std::string ADDIU_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1991,7 +1991,7 @@ std::string NMD::ADDIU_32_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_48_(uint64 instruction, img_address m_pc)
+static std::string ADDIU_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -2012,7 +2012,7 @@ std::string NMD::ADDIU_48_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP48_(uint64 instruction, img_address m_pc)
+static std::string ADDIU_GP48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -2033,7 +2033,7 @@ std::string NMD::ADDIU_GP48_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP_B_(uint64 instruction, img_address m_pc)
+static std::string ADDIU_GP_B_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -2054,7 +2054,7 @@ std::string NMD::ADDIU_GP_B_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP_W_(uint64 instruction, img_address m_pc)
+static std::string ADDIU_GP_W_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
@@ -2075,7 +2075,7 @@ std::string NMD::ADDIU_GP_W_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_NEG_(uint64 instruction, img_address m_pc)
+static std::string ADDIU_NEG_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2098,7 +2098,7 @@ std::string NMD::ADDIU_NEG_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_R1_SP_(uint64 instruction, img_address m_pc)
+static std::string ADDIU_R1_SP_(uint64 instruction, img_address m_pc)
 {
     uint64 u_value = extract_u_5_4_3_2_1_0__s2(instruction);
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
@@ -2119,7 +2119,7 @@ std::string NMD::ADDIU_R1_SP_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_R2_(uint64 instruction, img_address m_pc)
+static std::string ADDIU_R2_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2141,7 +2141,7 @@ std::string NMD::ADDIU_R2_(uint64 instruction, img_address m_pc)
  *     rt -----
  *           s - ---
  */
-std::string NMD::ADDIU_RS5_(uint64 instruction, img_address m_pc)
+static std::string ADDIU_RS5_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
@@ -2163,7 +2163,7 @@ std::string NMD::ADDIU_RS5_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDIUPC_32_(uint64 instruction, img_address m_pc)
+static std::string ADDIUPC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
@@ -2185,7 +2185,7 @@ std::string NMD::ADDIUPC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDIUPC_48_(uint64 instruction, img_address m_pc)
+static std::string ADDIUPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -2207,7 +2207,7 @@ std::string NMD::ADDIUPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_PH(uint64 instruction, img_address m_pc)
+static std::string ADDQ_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2232,7 +2232,7 @@ std::string NMD::ADDQ_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_S_PH(uint64 instruction, img_address m_pc)
+static std::string ADDQ_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2256,7 +2256,7 @@ std::string NMD::ADDQ_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_S_W(uint64 instruction, img_address m_pc)
+static std::string ADDQ_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2281,7 +2281,7 @@ std::string NMD::ADDQ_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_PH(uint64 instruction, img_address m_pc)
+static std::string ADDQH_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2306,7 +2306,7 @@ std::string NMD::ADDQH_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_R_PH(uint64 instruction, img_address m_pc)
+static std::string ADDQH_R_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2331,7 +2331,7 @@ std::string NMD::ADDQH_R_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_R_W(uint64 instruction, img_address m_pc)
+static std::string ADDQH_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2356,7 +2356,7 @@ std::string NMD::ADDQH_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_W(uint64 instruction, img_address m_pc)
+static std::string ADDQH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2380,7 +2380,7 @@ std::string NMD::ADDQH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDSC(uint64 instruction, img_address m_pc)
+static std::string ADDSC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2403,7 +2403,7 @@ std::string NMD::ADDSC(uint64 instruction, img_address m_pc)
  *       rs3 ---
  *          rd3 ---
  */
-std::string NMD::ADDU_16_(uint64 instruction, img_address m_pc)
+static std::string ADDU_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2427,7 +2427,7 @@ std::string NMD::ADDU_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_32_(uint64 instruction, img_address m_pc)
+static std::string ADDU_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2451,7 +2451,7 @@ std::string NMD::ADDU_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_4X4_(uint64 instruction, img_address m_pc)
+static std::string ADDU_4X4_(uint64 instruction, img_address m_pc)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -2473,7 +2473,7 @@ std::string NMD::ADDU_4X4_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_PH(uint64 instruction, img_address m_pc)
+static std::string ADDU_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2497,7 +2497,7 @@ std::string NMD::ADDU_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_QB(uint64 instruction, img_address m_pc)
+static std::string ADDU_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2522,7 +2522,7 @@ std::string NMD::ADDU_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_S_PH(uint64 instruction, img_address m_pc)
+static std::string ADDU_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2546,7 +2546,7 @@ std::string NMD::ADDU_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_S_QB(uint64 instruction, img_address m_pc)
+static std::string ADDU_S_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2571,7 +2571,7 @@ std::string NMD::ADDU_S_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDUH_QB(uint64 instruction, img_address m_pc)
+static std::string ADDUH_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2596,7 +2596,7 @@ std::string NMD::ADDUH_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDUH_R_QB(uint64 instruction, img_address m_pc)
+static std::string ADDUH_R_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2619,7 +2619,7 @@ std::string NMD::ADDUH_R_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDWC(uint64 instruction, img_address m_pc)
+static std::string ADDWC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2643,7 +2643,7 @@ std::string NMD::ADDWC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ALUIPC(uint64 instruction, img_address m_pc)
+static std::string ALUIPC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
@@ -2664,7 +2664,7 @@ std::string NMD::ALUIPC(uint64 instruction, img_address m_pc)
  *       rs3 ---
  *           eu ----
  */
-std::string NMD::AND_16_(uint64 instruction, img_address m_pc)
+static std::string AND_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2686,7 +2686,7 @@ std::string NMD::AND_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::AND_32_(uint64 instruction, img_address m_pc)
+static std::string AND_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2709,7 +2709,7 @@ std::string NMD::AND_32_(uint64 instruction, img_address m_pc)
  *       rs3 ---
  *           eu ----
  */
-std::string NMD::ANDI_16_(uint64 instruction, img_address m_pc)
+static std::string ANDI_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2733,7 +2733,7 @@ std::string NMD::ANDI_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ANDI_32_(uint64 instruction, img_address m_pc)
+static std::string ANDI_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2757,7 +2757,7 @@ std::string NMD::ANDI_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::APPEND(uint64 instruction, img_address m_pc)
+static std::string APPEND(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2781,7 +2781,7 @@ std::string NMD::APPEND(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ASET(uint64 instruction, img_address m_pc)
+static std::string ASET(uint64 instruction, img_address m_pc)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2805,7 +2805,7 @@ std::string NMD::ASET(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALC_16_(uint64 instruction, img_address m_pc)
+static std::string BALC_16_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
@@ -2825,7 +2825,7 @@ std::string NMD::BALC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALC_32_(uint64 instruction, img_address m_pc)
+static std::string BALC_32_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
@@ -2845,7 +2845,7 @@ std::string NMD::BALC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALRSC(uint64 instruction, img_address m_pc)
+static std::string BALRSC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2867,7 +2867,7 @@ std::string NMD::BALRSC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BBEQZC(uint64 instruction, img_address m_pc)
+static std::string BBEQZC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
@@ -2891,7 +2891,7 @@ std::string NMD::BBEQZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BBNEZC(uint64 instruction, img_address m_pc)
+static std::string BBNEZC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
@@ -2915,7 +2915,7 @@ std::string NMD::BBNEZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC_16_(uint64 instruction, img_address m_pc)
+static std::string BC_16_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
@@ -2935,7 +2935,7 @@ std::string NMD::BC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC_32_(uint64 instruction, img_address m_pc)
+static std::string BC_32_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
@@ -2955,7 +2955,7 @@ std::string NMD::BC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC1EQZC(uint64 instruction, img_address m_pc)
+static std::string BC1EQZC(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
@@ -2977,7 +2977,7 @@ std::string NMD::BC1EQZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC1NEZC(uint64 instruction, img_address m_pc)
+static std::string BC1NEZC(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
@@ -2999,7 +2999,7 @@ std::string NMD::BC1NEZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC2EQZC(uint64 instruction, img_address m_pc)
+static std::string BC2EQZC(uint64 instruction, img_address m_pc)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
@@ -3021,7 +3021,7 @@ std::string NMD::BC2EQZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC2NEZC(uint64 instruction, img_address m_pc)
+static std::string BC2NEZC(uint64 instruction, img_address m_pc)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
@@ -3043,7 +3043,7 @@ std::string NMD::BC2NEZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQC_16_(uint64 instruction, img_address m_pc)
+static std::string BEQC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -3067,7 +3067,7 @@ std::string NMD::BEQC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQC_32_(uint64 instruction, img_address m_pc)
+static std::string BEQC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3091,7 +3091,7 @@ std::string NMD::BEQC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQIC(uint64 instruction, img_address m_pc)
+static std::string BEQIC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3115,7 +3115,7 @@ std::string NMD::BEQIC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQZC_16_(uint64 instruction, img_address m_pc)
+static std::string BEQZC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
@@ -3137,7 +3137,7 @@ std::string NMD::BEQZC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEC(uint64 instruction, img_address m_pc)
+static std::string BGEC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3161,7 +3161,7 @@ std::string NMD::BGEC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEIC(uint64 instruction, img_address m_pc)
+static std::string BGEIC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3185,7 +3185,7 @@ std::string NMD::BGEIC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEIUC(uint64 instruction, img_address m_pc)
+static std::string BGEIUC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3209,7 +3209,7 @@ std::string NMD::BGEIUC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEUC(uint64 instruction, img_address m_pc)
+static std::string BGEUC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3233,7 +3233,7 @@ std::string NMD::BGEUC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTC(uint64 instruction, img_address m_pc)
+static std::string BLTC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3257,7 +3257,7 @@ std::string NMD::BLTC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTIC(uint64 instruction, img_address m_pc)
+static std::string BLTIC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3281,7 +3281,7 @@ std::string NMD::BLTIC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTIUC(uint64 instruction, img_address m_pc)
+static std::string BLTIUC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3305,7 +3305,7 @@ std::string NMD::BLTIUC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTUC(uint64 instruction, img_address m_pc)
+static std::string BLTUC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3329,7 +3329,7 @@ std::string NMD::BLTUC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEC_16_(uint64 instruction, img_address m_pc)
+static std::string BNEC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -3353,7 +3353,7 @@ std::string NMD::BNEC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEC_32_(uint64 instruction, img_address m_pc)
+static std::string BNEC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3377,7 +3377,7 @@ std::string NMD::BNEC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEIC(uint64 instruction, img_address m_pc)
+static std::string BNEIC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3401,7 +3401,7 @@ std::string NMD::BNEIC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEZC_16_(uint64 instruction, img_address m_pc)
+static std::string BNEZC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
@@ -3423,7 +3423,7 @@ std::string NMD::BNEZC_16_(uint64 instruction, img_address m_pc)
  *            s[13:1] -------------
  *                           s[14] -
  */
-std::string NMD::BPOSGE32C(uint64 instruction, img_address m_pc)
+static std::string BPOSGE32C(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
@@ -3443,7 +3443,7 @@ std::string NMD::BPOSGE32C(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BREAK_16_(uint64 instruction, img_address m_pc)
+static std::string BREAK_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
@@ -3463,7 +3463,7 @@ std::string NMD::BREAK_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BREAK_32_(uint64 instruction, img_address m_pc)
+static std::string BREAK_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -3483,7 +3483,7 @@ std::string NMD::BREAK_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BRSC(uint64 instruction, img_address m_pc)
+static std::string BRSC(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
@@ -3503,7 +3503,7 @@ std::string NMD::BRSC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CACHE(uint64 instruction, img_address m_pc)
+static std::string CACHE(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3527,7 +3527,7 @@ std::string NMD::CACHE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CACHEE(uint64 instruction, img_address m_pc)
+static std::string CACHEE(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3551,7 +3551,7 @@ std::string NMD::CACHEE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_L_D(uint64 instruction, img_address m_pc)
+static std::string CEIL_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3573,7 +3573,7 @@ std::string NMD::CEIL_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_L_S(uint64 instruction, img_address m_pc)
+static std::string CEIL_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3595,7 +3595,7 @@ std::string NMD::CEIL_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_W_D(uint64 instruction, img_address m_pc)
+static std::string CEIL_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3617,7 +3617,7 @@ std::string NMD::CEIL_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_W_S(uint64 instruction, img_address m_pc)
+static std::string CEIL_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3639,7 +3639,7 @@ std::string NMD::CEIL_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CFC1(uint64 instruction, img_address m_pc)
+static std::string CFC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -3661,7 +3661,7 @@ std::string NMD::CFC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CFC2(uint64 instruction, img_address m_pc)
+static std::string CFC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -3683,7 +3683,7 @@ std::string NMD::CFC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLASS_D(uint64 instruction, img_address m_pc)
+static std::string CLASS_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3705,7 +3705,7 @@ std::string NMD::CLASS_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLASS_S(uint64 instruction, img_address m_pc)
+static std::string CLASS_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3727,7 +3727,7 @@ std::string NMD::CLASS_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLO(uint64 instruction, img_address m_pc)
+static std::string CLO(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3749,7 +3749,7 @@ std::string NMD::CLO(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLZ(uint64 instruction, img_address m_pc)
+static std::string CLZ(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3771,7 +3771,7 @@ std::string NMD::CLZ(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_AF_D(uint64 instruction, img_address m_pc)
+static std::string CMP_AF_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3795,7 +3795,7 @@ std::string NMD::CMP_AF_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_AF_S(uint64 instruction, img_address m_pc)
+static std::string CMP_AF_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3819,7 +3819,7 @@ std::string NMD::CMP_AF_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_EQ_D(uint64 instruction, img_address m_pc)
+static std::string CMP_EQ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3842,7 +3842,7 @@ std::string NMD::CMP_EQ_D(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_EQ_PH(uint64 instruction, img_address m_pc)
+static std::string CMP_EQ_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3864,7 +3864,7 @@ std::string NMD::CMP_EQ_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_EQ_S(uint64 instruction, img_address m_pc)
+static std::string CMP_EQ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3888,7 +3888,7 @@ std::string NMD::CMP_EQ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LE_D(uint64 instruction, img_address m_pc)
+static std::string CMP_LE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3911,7 +3911,7 @@ std::string NMD::CMP_LE_D(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_LE_PH(uint64 instruction, img_address m_pc)
+static std::string CMP_LE_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3933,7 +3933,7 @@ std::string NMD::CMP_LE_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LE_S(uint64 instruction, img_address m_pc)
+static std::string CMP_LE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3957,7 +3957,7 @@ std::string NMD::CMP_LE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LT_D(uint64 instruction, img_address m_pc)
+static std::string CMP_LT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3980,7 +3980,7 @@ std::string NMD::CMP_LT_D(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_LT_PH(uint64 instruction, img_address m_pc)
+static std::string CMP_LT_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4002,7 +4002,7 @@ std::string NMD::CMP_LT_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LT_S(uint64 instruction, img_address m_pc)
+static std::string CMP_LT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4026,7 +4026,7 @@ std::string NMD::CMP_LT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_NE_D(uint64 instruction, img_address m_pc)
+static std::string CMP_NE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4050,7 +4050,7 @@ std::string NMD::CMP_NE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_NE_S(uint64 instruction, img_address m_pc)
+static std::string CMP_NE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4074,7 +4074,7 @@ std::string NMD::CMP_NE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_OR_D(uint64 instruction, img_address m_pc)
+static std::string CMP_OR_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4098,7 +4098,7 @@ std::string NMD::CMP_OR_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_OR_S(uint64 instruction, img_address m_pc)
+static std::string CMP_OR_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4122,7 +4122,7 @@ std::string NMD::CMP_OR_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SAF_D(uint64 instruction, img_address m_pc)
+static std::string CMP_SAF_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4146,7 +4146,7 @@ std::string NMD::CMP_SAF_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SAF_S(uint64 instruction, img_address m_pc)
+static std::string CMP_SAF_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4170,7 +4170,7 @@ std::string NMD::CMP_SAF_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SEQ_D(uint64 instruction, img_address m_pc)
+static std::string CMP_SEQ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4194,7 +4194,7 @@ std::string NMD::CMP_SEQ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SEQ_S(uint64 instruction, img_address m_pc)
+static std::string CMP_SEQ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4218,7 +4218,7 @@ std::string NMD::CMP_SEQ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLE_D(uint64 instruction, img_address m_pc)
+static std::string CMP_SLE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4242,7 +4242,7 @@ std::string NMD::CMP_SLE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLE_S(uint64 instruction, img_address m_pc)
+static std::string CMP_SLE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4266,7 +4266,7 @@ std::string NMD::CMP_SLE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLT_D(uint64 instruction, img_address m_pc)
+static std::string CMP_SLT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4290,7 +4290,7 @@ std::string NMD::CMP_SLT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLT_S(uint64 instruction, img_address m_pc)
+static std::string CMP_SLT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4314,7 +4314,7 @@ std::string NMD::CMP_SLT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SNE_D(uint64 instruction, img_address m_pc)
+static std::string CMP_SNE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4338,7 +4338,7 @@ std::string NMD::CMP_SNE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SNE_S(uint64 instruction, img_address m_pc)
+static std::string CMP_SNE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4362,7 +4362,7 @@ std::string NMD::CMP_SNE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SOR_D(uint64 instruction, img_address m_pc)
+static std::string CMP_SOR_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4386,7 +4386,7 @@ std::string NMD::CMP_SOR_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SOR_S(uint64 instruction, img_address m_pc)
+static std::string CMP_SOR_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4410,7 +4410,7 @@ std::string NMD::CMP_SOR_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUEQ_D(uint64 instruction, img_address m_pc)
+static std::string CMP_SUEQ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4434,7 +4434,7 @@ std::string NMD::CMP_SUEQ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUEQ_S(uint64 instruction, img_address m_pc)
+static std::string CMP_SUEQ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4458,7 +4458,7 @@ std::string NMD::CMP_SUEQ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULE_D(uint64 instruction, img_address m_pc)
+static std::string CMP_SULE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4482,7 +4482,7 @@ std::string NMD::CMP_SULE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULE_S(uint64 instruction, img_address m_pc)
+static std::string CMP_SULE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4506,7 +4506,7 @@ std::string NMD::CMP_SULE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULT_D(uint64 instruction, img_address m_pc)
+static std::string CMP_SULT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4530,7 +4530,7 @@ std::string NMD::CMP_SULT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULT_S(uint64 instruction, img_address m_pc)
+static std::string CMP_SULT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4554,7 +4554,7 @@ std::string NMD::CMP_SULT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUN_D(uint64 instruction, img_address m_pc)
+static std::string CMP_SUN_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4578,7 +4578,7 @@ std::string NMD::CMP_SUN_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUNE_D(uint64 instruction, img_address m_pc)
+static std::string CMP_SUNE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4602,7 +4602,7 @@ std::string NMD::CMP_SUNE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUNE_S(uint64 instruction, img_address m_pc)
+static std::string CMP_SUNE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4626,7 +4626,7 @@ std::string NMD::CMP_SUNE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUN_S(uint64 instruction, img_address m_pc)
+static std::string CMP_SUN_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4650,7 +4650,7 @@ std::string NMD::CMP_SUN_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UEQ_D(uint64 instruction, img_address m_pc)
+static std::string CMP_UEQ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4674,7 +4674,7 @@ std::string NMD::CMP_UEQ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UEQ_S(uint64 instruction, img_address m_pc)
+static std::string CMP_UEQ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4698,7 +4698,7 @@ std::string NMD::CMP_UEQ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULE_D(uint64 instruction, img_address m_pc)
+static std::string CMP_ULE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4722,7 +4722,7 @@ std::string NMD::CMP_ULE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULE_S(uint64 instruction, img_address m_pc)
+static std::string CMP_ULE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4746,7 +4746,7 @@ std::string NMD::CMP_ULE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULT_D(uint64 instruction, img_address m_pc)
+static std::string CMP_ULT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4770,7 +4770,7 @@ std::string NMD::CMP_ULT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULT_S(uint64 instruction, img_address m_pc)
+static std::string CMP_ULT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4794,7 +4794,7 @@ std::string NMD::CMP_ULT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UN_D(uint64 instruction, img_address m_pc)
+static std::string CMP_UN_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4818,7 +4818,7 @@ std::string NMD::CMP_UN_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UNE_D(uint64 instruction, img_address m_pc)
+static std::string CMP_UNE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4842,7 +4842,7 @@ std::string NMD::CMP_UNE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UNE_S(uint64 instruction, img_address m_pc)
+static std::string CMP_UNE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4866,7 +4866,7 @@ std::string NMD::CMP_UNE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UN_S(uint64 instruction, img_address m_pc)
+static std::string CMP_UN_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4891,7 +4891,7 @@ std::string NMD::CMP_UN_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_EQ_QB(uint64 instruction, img_address m_pc)
+static std::string CMPGDU_EQ_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4916,7 +4916,7 @@ std::string NMD::CMPGDU_EQ_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_LE_QB(uint64 instruction, img_address m_pc)
+static std::string CMPGDU_LE_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4941,7 +4941,7 @@ std::string NMD::CMPGDU_LE_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_LT_QB(uint64 instruction, img_address m_pc)
+static std::string CMPGDU_LT_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4966,7 +4966,7 @@ std::string NMD::CMPGDU_LT_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_EQ_QB(uint64 instruction, img_address m_pc)
+static std::string CMPGU_EQ_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4991,7 +4991,7 @@ std::string NMD::CMPGU_EQ_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_LE_QB(uint64 instruction, img_address m_pc)
+static std::string CMPGU_LE_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5016,7 +5016,7 @@ std::string NMD::CMPGU_LE_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_LT_QB(uint64 instruction, img_address m_pc)
+static std::string CMPGU_LT_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5040,7 +5040,7 @@ std::string NMD::CMPGU_LT_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_EQ_QB(uint64 instruction, img_address m_pc)
+static std::string CMPU_EQ_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5062,7 +5062,7 @@ std::string NMD::CMPU_EQ_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_LE_QB(uint64 instruction, img_address m_pc)
+static std::string CMPU_LE_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5084,7 +5084,7 @@ std::string NMD::CMPU_LE_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_LT_QB(uint64 instruction, img_address m_pc)
+static std::string CMPU_LT_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5106,7 +5106,7 @@ std::string NMD::CMPU_LT_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::COP2_1(uint64 instruction, img_address m_pc)
+static std::string COP2_1(uint64 instruction, img_address m_pc)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
@@ -5126,7 +5126,7 @@ std::string NMD::COP2_1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CTC1(uint64 instruction, img_address m_pc)
+static std::string CTC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -5148,7 +5148,7 @@ std::string NMD::CTC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CTC2(uint64 instruction, img_address m_pc)
+static std::string CTC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -5170,7 +5170,7 @@ std::string NMD::CTC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_L(uint64 instruction, img_address m_pc)
+static std::string CVT_D_L(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5192,7 +5192,7 @@ std::string NMD::CVT_D_L(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_S(uint64 instruction, img_address m_pc)
+static std::string CVT_D_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5214,7 +5214,7 @@ std::string NMD::CVT_D_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_W(uint64 instruction, img_address m_pc)
+static std::string CVT_D_W(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5236,7 +5236,7 @@ std::string NMD::CVT_D_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_L_D(uint64 instruction, img_address m_pc)
+static std::string CVT_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5258,7 +5258,7 @@ std::string NMD::CVT_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_L_S(uint64 instruction, img_address m_pc)
+static std::string CVT_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5280,7 +5280,7 @@ std::string NMD::CVT_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_D(uint64 instruction, img_address m_pc)
+static std::string CVT_S_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5302,7 +5302,7 @@ std::string NMD::CVT_S_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_L(uint64 instruction, img_address m_pc)
+static std::string CVT_S_L(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5324,7 +5324,7 @@ std::string NMD::CVT_S_L(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_PL(uint64 instruction, img_address m_pc)
+static std::string CVT_S_PL(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5346,7 +5346,7 @@ std::string NMD::CVT_S_PL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_PU(uint64 instruction, img_address m_pc)
+static std::string CVT_S_PU(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5368,7 +5368,7 @@ std::string NMD::CVT_S_PU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_W(uint64 instruction, img_address m_pc)
+static std::string CVT_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5390,7 +5390,7 @@ std::string NMD::CVT_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_W_D(uint64 instruction, img_address m_pc)
+static std::string CVT_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5412,7 +5412,7 @@ std::string NMD::CVT_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_W_S(uint64 instruction, img_address m_pc)
+static std::string CVT_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5434,7 +5434,7 @@ std::string NMD::CVT_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_48_(uint64 instruction, img_address m_pc)
+static std::string DADDIU_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -5456,7 +5456,7 @@ std::string NMD::DADDIU_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_NEG_(uint64 instruction, img_address m_pc)
+static std::string DADDIU_NEG_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5480,7 +5480,7 @@ std::string NMD::DADDIU_NEG_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_U12_(uint64 instruction, img_address m_pc)
+static std::string DADDIU_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5504,7 +5504,7 @@ std::string NMD::DADDIU_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADD(uint64 instruction, img_address m_pc)
+static std::string DADD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5528,7 +5528,7 @@ std::string NMD::DADD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDU(uint64 instruction, img_address m_pc)
+static std::string DADDU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5552,7 +5552,7 @@ std::string NMD::DADDU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DCLO(uint64 instruction, img_address m_pc)
+static std::string DCLO(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5574,7 +5574,7 @@ std::string NMD::DCLO(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DCLZ(uint64 instruction, img_address m_pc)
+static std::string DCLZ(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5596,7 +5596,7 @@ std::string NMD::DCLZ(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DDIV(uint64 instruction, img_address m_pc)
+static std::string DDIV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5620,7 +5620,7 @@ std::string NMD::DDIV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DDIVU(uint64 instruction, img_address m_pc)
+static std::string DDIVU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5644,7 +5644,7 @@ std::string NMD::DDIVU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DERET(uint64 instruction, img_address m_pc)
+static std::string DERET(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -5662,7 +5662,7 @@ std::string NMD::DERET(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXTM(uint64 instruction, img_address m_pc)
+static std::string DEXTM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5688,7 +5688,7 @@ std::string NMD::DEXTM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXT(uint64 instruction, img_address m_pc)
+static std::string DEXT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5714,7 +5714,7 @@ std::string NMD::DEXT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXTU(uint64 instruction, img_address m_pc)
+static std::string DEXTU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5740,7 +5740,7 @@ std::string NMD::DEXTU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINSM(uint64 instruction, img_address m_pc)
+static std::string DINSM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5768,7 +5768,7 @@ std::string NMD::DINSM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINS(uint64 instruction, img_address m_pc)
+static std::string DINS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5796,7 +5796,7 @@ std::string NMD::DINS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINSU(uint64 instruction, img_address m_pc)
+static std::string DINSU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5824,7 +5824,7 @@ std::string NMD::DINSU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DI(uint64 instruction, img_address m_pc)
+static std::string DI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -5844,7 +5844,7 @@ std::string NMD::DI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV(uint64 instruction, img_address m_pc)
+static std::string DIV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5868,7 +5868,7 @@ std::string NMD::DIV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV_D(uint64 instruction, img_address m_pc)
+static std::string DIV_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5892,7 +5892,7 @@ std::string NMD::DIV_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV_S(uint64 instruction, img_address m_pc)
+static std::string DIV_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5916,7 +5916,7 @@ std::string NMD::DIV_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIVU(uint64 instruction, img_address m_pc)
+static std::string DIVU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5940,7 +5940,7 @@ std::string NMD::DIVU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DLSA(uint64 instruction, img_address m_pc)
+static std::string DLSA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5966,7 +5966,7 @@ std::string NMD::DLSA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DLUI_48_(uint64 instruction, img_address m_pc)
+static std::string DLUI_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     uint64 u_value = extract_u_31_to_0__s32(instruction);
@@ -5988,7 +5988,7 @@ std::string NMD::DLUI_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC0(uint64 instruction, img_address m_pc)
+static std::string DMFC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6012,7 +6012,7 @@ std::string NMD::DMFC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC1(uint64 instruction, img_address m_pc)
+static std::string DMFC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -6034,7 +6034,7 @@ std::string NMD::DMFC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC2(uint64 instruction, img_address m_pc)
+static std::string DMFC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -6056,7 +6056,7 @@ std::string NMD::DMFC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFGC0(uint64 instruction, img_address m_pc)
+static std::string DMFGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6080,7 +6080,7 @@ std::string NMD::DMFGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMOD(uint64 instruction, img_address m_pc)
+static std::string DMOD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6104,7 +6104,7 @@ std::string NMD::DMOD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMODU(uint64 instruction, img_address m_pc)
+static std::string DMODU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6128,7 +6128,7 @@ std::string NMD::DMODU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC0(uint64 instruction, img_address m_pc)
+static std::string DMTC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6152,7 +6152,7 @@ std::string NMD::DMTC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC1(uint64 instruction, img_address m_pc)
+static std::string DMTC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -6174,7 +6174,7 @@ std::string NMD::DMTC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC2(uint64 instruction, img_address m_pc)
+static std::string DMTC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -6196,7 +6196,7 @@ std::string NMD::DMTC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTGC0(uint64 instruction, img_address m_pc)
+static std::string DMTGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6220,7 +6220,7 @@ std::string NMD::DMTGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMT(uint64 instruction, img_address m_pc)
+static std::string DMT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -6240,7 +6240,7 @@ std::string NMD::DMT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUH(uint64 instruction, img_address m_pc)
+static std::string DMUH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6264,7 +6264,7 @@ std::string NMD::DMUH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUHU(uint64 instruction, img_address m_pc)
+static std::string DMUHU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6288,7 +6288,7 @@ std::string NMD::DMUHU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUL(uint64 instruction, img_address m_pc)
+static std::string DMUL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6312,7 +6312,7 @@ std::string NMD::DMUL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMULU(uint64 instruction, img_address m_pc)
+static std::string DMULU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6337,7 +6337,7 @@ std::string NMD::DMULU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::DPA_W_PH(uint64 instruction, img_address m_pc)
+static std::string DPA_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6361,7 +6361,7 @@ std::string NMD::DPA_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQ_SA_L_W(uint64 instruction, img_address m_pc)
+static std::string DPAQ_SA_L_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6385,7 +6385,7 @@ std::string NMD::DPAQ_SA_L_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQ_S_W_PH(uint64 instruction, img_address m_pc)
+static std::string DPAQ_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6409,7 +6409,7 @@ std::string NMD::DPAQ_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQX_SA_W_PH(uint64 instruction, img_address m_pc)
+static std::string DPAQX_SA_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6433,7 +6433,7 @@ std::string NMD::DPAQX_SA_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQX_S_W_PH(uint64 instruction, img_address m_pc)
+static std::string DPAQX_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6457,7 +6457,7 @@ std::string NMD::DPAQX_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAU_H_QBL(uint64 instruction, img_address m_pc)
+static std::string DPAU_H_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6481,7 +6481,7 @@ std::string NMD::DPAU_H_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAU_H_QBR(uint64 instruction, img_address m_pc)
+static std::string DPAU_H_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6505,7 +6505,7 @@ std::string NMD::DPAU_H_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAX_W_PH(uint64 instruction, img_address m_pc)
+static std::string DPAX_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6529,7 +6529,7 @@ std::string NMD::DPAX_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPS_W_PH(uint64 instruction, img_address m_pc)
+static std::string DPS_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6553,7 +6553,7 @@ std::string NMD::DPS_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQ_SA_L_W(uint64 instruction, img_address m_pc)
+static std::string DPSQ_SA_L_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6577,7 +6577,7 @@ std::string NMD::DPSQ_SA_L_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQ_S_W_PH(uint64 instruction, img_address m_pc)
+static std::string DPSQ_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6601,7 +6601,7 @@ std::string NMD::DPSQ_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQX_SA_W_PH(uint64 instruction, img_address m_pc)
+static std::string DPSQX_SA_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6625,7 +6625,7 @@ std::string NMD::DPSQX_SA_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQX_S_W_PH(uint64 instruction, img_address m_pc)
+static std::string DPSQX_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6649,7 +6649,7 @@ std::string NMD::DPSQX_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSU_H_QBL(uint64 instruction, img_address m_pc)
+static std::string DPSU_H_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6673,7 +6673,7 @@ std::string NMD::DPSU_H_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSU_H_QBR(uint64 instruction, img_address m_pc)
+static std::string DPSU_H_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6697,7 +6697,7 @@ std::string NMD::DPSU_H_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSX_W_PH(uint64 instruction, img_address m_pc)
+static std::string DPSX_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6721,7 +6721,7 @@ std::string NMD::DPSX_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTR(uint64 instruction, img_address m_pc)
+static std::string DROTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6745,7 +6745,7 @@ std::string NMD::DROTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DROTR32(uint64 instruction, img_address m_pc)
+static std::string DROTR32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6769,7 +6769,7 @@ std::string NMD::DROTR32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTRV(uint64 instruction, img_address m_pc)
+static std::string DROTRV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6793,7 +6793,7 @@ std::string NMD::DROTRV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTX(uint64 instruction, img_address m_pc)
+static std::string DROTX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6819,7 +6819,7 @@ std::string NMD::DROTX(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSLL(uint64 instruction, img_address m_pc)
+static std::string DSLL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6843,7 +6843,7 @@ std::string NMD::DSLL(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSLL32(uint64 instruction, img_address m_pc)
+static std::string DSLL32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6867,7 +6867,7 @@ std::string NMD::DSLL32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSLLV(uint64 instruction, img_address m_pc)
+static std::string DSLLV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6891,7 +6891,7 @@ std::string NMD::DSLLV(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRA(uint64 instruction, img_address m_pc)
+static std::string DSRA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6915,7 +6915,7 @@ std::string NMD::DSRA(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRA32(uint64 instruction, img_address m_pc)
+static std::string DSRA32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6939,7 +6939,7 @@ std::string NMD::DSRA32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSRAV(uint64 instruction, img_address m_pc)
+static std::string DSRAV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6963,7 +6963,7 @@ std::string NMD::DSRAV(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRL(uint64 instruction, img_address m_pc)
+static std::string DSRL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6987,7 +6987,7 @@ std::string NMD::DSRL(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRL32(uint64 instruction, img_address m_pc)
+static std::string DSRL32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7011,7 +7011,7 @@ std::string NMD::DSRL32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSRLV(uint64 instruction, img_address m_pc)
+static std::string DSRLV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7035,7 +7035,7 @@ std::string NMD::DSRLV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSUB(uint64 instruction, img_address m_pc)
+static std::string DSUB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7059,7 +7059,7 @@ std::string NMD::DSUB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSUBU(uint64 instruction, img_address m_pc)
+static std::string DSUBU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7083,7 +7083,7 @@ std::string NMD::DSUBU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DVPE(uint64 instruction, img_address m_pc)
+static std::string DVPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7103,7 +7103,7 @@ std::string NMD::DVPE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DVP(uint64 instruction, img_address m_pc)
+static std::string DVP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7123,7 +7123,7 @@ std::string NMD::DVP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EHB(uint64 instruction, img_address m_pc)
+static std::string EHB(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -7141,7 +7141,7 @@ std::string NMD::EHB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EI(uint64 instruction, img_address m_pc)
+static std::string EI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7161,7 +7161,7 @@ std::string NMD::EI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EMT(uint64 instruction, img_address m_pc)
+static std::string EMT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7181,7 +7181,7 @@ std::string NMD::EMT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ERET(uint64 instruction, img_address m_pc)
+static std::string ERET(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -7199,7 +7199,7 @@ std::string NMD::ERET(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ERETNC(uint64 instruction, img_address m_pc)
+static std::string ERETNC(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -7217,7 +7217,7 @@ std::string NMD::ERETNC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EVP(uint64 instruction, img_address m_pc)
+static std::string EVP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7237,7 +7237,7 @@ std::string NMD::EVP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EVPE(uint64 instruction, img_address m_pc)
+static std::string EVPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7257,7 +7257,7 @@ std::string NMD::EVPE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXT(uint64 instruction, img_address m_pc)
+static std::string EXT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7283,7 +7283,7 @@ std::string NMD::EXT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTD(uint64 instruction, img_address m_pc)
+static std::string EXTD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7309,7 +7309,7 @@ std::string NMD::EXTD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTD32(uint64 instruction, img_address m_pc)
+static std::string EXTD32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7335,7 +7335,7 @@ std::string NMD::EXTD32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPDP(uint64 instruction, img_address m_pc)
+static std::string EXTPDP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
@@ -7359,7 +7359,7 @@ std::string NMD::EXTPDP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPDPV(uint64 instruction, img_address m_pc)
+static std::string EXTPDPV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7383,7 +7383,7 @@ std::string NMD::EXTPDPV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTP(uint64 instruction, img_address m_pc)
+static std::string EXTP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
@@ -7407,7 +7407,7 @@ std::string NMD::EXTP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPV(uint64 instruction, img_address m_pc)
+static std::string EXTPV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7432,7 +7432,7 @@ std::string NMD::EXTPV(uint64 instruction, img_address m_pc)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_RS_W(uint64 instruction, img_address m_pc)
+static std::string EXTR_RS_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7457,7 +7457,7 @@ std::string NMD::EXTR_RS_W(uint64 instruction, img_address m_pc)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_R_W(uint64 instruction, img_address m_pc)
+static std::string EXTR_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7482,7 +7482,7 @@ std::string NMD::EXTR_R_W(uint64 instruction, img_address m_pc)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_S_H(uint64 instruction, img_address m_pc)
+static std::string EXTR_S_H(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7507,7 +7507,7 @@ std::string NMD::EXTR_S_H(uint64 instruction, img_address m_pc)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_W(uint64 instruction, img_address m_pc)
+static std::string EXTR_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7532,7 +7532,7 @@ std::string NMD::EXTR_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_RS_W(uint64 instruction, img_address m_pc)
+static std::string EXTRV_RS_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7557,7 +7557,7 @@ std::string NMD::EXTRV_RS_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_R_W(uint64 instruction, img_address m_pc)
+static std::string EXTRV_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7582,7 +7582,7 @@ std::string NMD::EXTRV_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_S_H(uint64 instruction, img_address m_pc)
+static std::string EXTRV_S_H(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7607,7 +7607,7 @@ std::string NMD::EXTRV_S_H(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_W(uint64 instruction, img_address m_pc)
+static std::string EXTRV_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7632,7 +7632,7 @@ std::string NMD::EXTRV_W(uint64 instruction, img_address m_pc)
  *               rd -----
  *                 shift -----
  */
-std::string NMD::EXTW(uint64 instruction, img_address m_pc)
+static std::string EXTW(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7658,7 +7658,7 @@ std::string NMD::EXTW(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_L_D(uint64 instruction, img_address m_pc)
+static std::string FLOOR_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7680,7 +7680,7 @@ std::string NMD::FLOOR_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_L_S(uint64 instruction, img_address m_pc)
+static std::string FLOOR_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7702,7 +7702,7 @@ std::string NMD::FLOOR_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_W_D(uint64 instruction, img_address m_pc)
+static std::string FLOOR_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7724,7 +7724,7 @@ std::string NMD::FLOOR_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_W_S(uint64 instruction, img_address m_pc)
+static std::string FLOOR_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7746,7 +7746,7 @@ std::string NMD::FLOOR_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FORK(uint64 instruction, img_address m_pc)
+static std::string FORK(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7770,7 +7770,7 @@ std::string NMD::FORK(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::HYPCALL(uint64 instruction, img_address m_pc)
+static std::string HYPCALL(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
@@ -7790,7 +7790,7 @@ std::string NMD::HYPCALL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::HYPCALL_16_(uint64 instruction, img_address m_pc)
+static std::string HYPCALL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
@@ -7810,7 +7810,7 @@ std::string NMD::HYPCALL_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::INS(uint64 instruction, img_address m_pc)
+static std::string INS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7837,7 +7837,7 @@ std::string NMD::INS(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::INSV(uint64 instruction, img_address m_pc)
+static std::string INSV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7859,7 +7859,7 @@ std::string NMD::INSV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::IRET(uint64 instruction, img_address m_pc)
+static std::string IRET(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -7877,7 +7877,7 @@ std::string NMD::IRET(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_16_(uint64 instruction, img_address m_pc)
+static std::string JALRC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
@@ -7897,7 +7897,7 @@ std::string NMD::JALRC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_32_(uint64 instruction, img_address m_pc)
+static std::string JALRC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7919,7 +7919,7 @@ std::string NMD::JALRC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_HB(uint64 instruction, img_address m_pc)
+static std::string JALRC_HB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7941,7 +7941,7 @@ std::string NMD::JALRC_HB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JRC(uint64 instruction, img_address m_pc)
+static std::string JRC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
@@ -7961,7 +7961,7 @@ std::string NMD::JRC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_16_(uint64 instruction, img_address m_pc)
+static std::string LB_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -7985,7 +7985,7 @@ std::string NMD::LB_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_GP_(uint64 instruction, img_address m_pc)
+static std::string LB_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -8007,7 +8007,7 @@ std::string NMD::LB_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_S9_(uint64 instruction, img_address m_pc)
+static std::string LB_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8031,7 +8031,7 @@ std::string NMD::LB_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_U12_(uint64 instruction, img_address m_pc)
+static std::string LB_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8055,7 +8055,7 @@ std::string NMD::LB_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBE(uint64 instruction, img_address m_pc)
+static std::string LBE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8079,7 +8079,7 @@ std::string NMD::LBE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_16_(uint64 instruction, img_address m_pc)
+static std::string LBU_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -8103,7 +8103,7 @@ std::string NMD::LBU_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_GP_(uint64 instruction, img_address m_pc)
+static std::string LBU_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -8125,7 +8125,7 @@ std::string NMD::LBU_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_S9_(uint64 instruction, img_address m_pc)
+static std::string LBU_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8149,7 +8149,7 @@ std::string NMD::LBU_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_U12_(uint64 instruction, img_address m_pc)
+static std::string LBU_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8173,7 +8173,7 @@ std::string NMD::LBU_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBUE(uint64 instruction, img_address m_pc)
+static std::string LBUE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8197,7 +8197,7 @@ std::string NMD::LBUE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBUX(uint64 instruction, img_address m_pc)
+static std::string LBUX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8221,7 +8221,7 @@ std::string NMD::LBUX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBX(uint64 instruction, img_address m_pc)
+static std::string LBX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8245,7 +8245,7 @@ std::string NMD::LBX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_GP_(uint64 instruction, img_address m_pc)
+static std::string LD_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
@@ -8267,7 +8267,7 @@ std::string NMD::LD_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_S9_(uint64 instruction, img_address m_pc)
+static std::string LD_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8291,7 +8291,7 @@ std::string NMD::LD_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_U12_(uint64 instruction, img_address m_pc)
+static std::string LD_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8315,7 +8315,7 @@ std::string NMD::LD_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_GP_(uint64 instruction, img_address m_pc)
+static std::string LDC1_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -8337,7 +8337,7 @@ std::string NMD::LDC1_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_S9_(uint64 instruction, img_address m_pc)
+static std::string LDC1_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8361,7 +8361,7 @@ std::string NMD::LDC1_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_U12_(uint64 instruction, img_address m_pc)
+static std::string LDC1_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8385,7 +8385,7 @@ std::string NMD::LDC1_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1XS(uint64 instruction, img_address m_pc)
+static std::string LDC1XS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8409,7 +8409,7 @@ std::string NMD::LDC1XS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1X(uint64 instruction, img_address m_pc)
+static std::string LDC1X(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8433,7 +8433,7 @@ std::string NMD::LDC1X(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC2(uint64 instruction, img_address m_pc)
+static std::string LDC2(uint64 instruction, img_address m_pc)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8457,7 +8457,7 @@ std::string NMD::LDC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDM(uint64 instruction, img_address m_pc)
+static std::string LDM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8483,7 +8483,7 @@ std::string NMD::LDM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDPC_48_(uint64 instruction, img_address m_pc)
+static std::string LDPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -8505,7 +8505,7 @@ std::string NMD::LDPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDX(uint64 instruction, img_address m_pc)
+static std::string LDX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8529,7 +8529,7 @@ std::string NMD::LDX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDXS(uint64 instruction, img_address m_pc)
+static std::string LDXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8553,7 +8553,7 @@ std::string NMD::LDXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_16_(uint64 instruction, img_address m_pc)
+static std::string LH_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -8577,7 +8577,7 @@ std::string NMD::LH_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_GP_(uint64 instruction, img_address m_pc)
+static std::string LH_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
@@ -8599,7 +8599,7 @@ std::string NMD::LH_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_S9_(uint64 instruction, img_address m_pc)
+static std::string LH_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8623,7 +8623,7 @@ std::string NMD::LH_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_U12_(uint64 instruction, img_address m_pc)
+static std::string LH_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8647,7 +8647,7 @@ std::string NMD::LH_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHE(uint64 instruction, img_address m_pc)
+static std::string LHE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8671,7 +8671,7 @@ std::string NMD::LHE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_16_(uint64 instruction, img_address m_pc)
+static std::string LHU_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -8695,7 +8695,7 @@ std::string NMD::LHU_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_GP_(uint64 instruction, img_address m_pc)
+static std::string LHU_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
@@ -8717,7 +8717,7 @@ std::string NMD::LHU_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_S9_(uint64 instruction, img_address m_pc)
+static std::string LHU_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8741,7 +8741,7 @@ std::string NMD::LHU_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_U12_(uint64 instruction, img_address m_pc)
+static std::string LHU_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8765,7 +8765,7 @@ std::string NMD::LHU_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUE(uint64 instruction, img_address m_pc)
+static std::string LHUE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8789,7 +8789,7 @@ std::string NMD::LHUE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUX(uint64 instruction, img_address m_pc)
+static std::string LHUX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8813,7 +8813,7 @@ std::string NMD::LHUX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUXS(uint64 instruction, img_address m_pc)
+static std::string LHUXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8837,7 +8837,7 @@ std::string NMD::LHUXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHXS(uint64 instruction, img_address m_pc)
+static std::string LHXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8861,7 +8861,7 @@ std::string NMD::LHXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHX(uint64 instruction, img_address m_pc)
+static std::string LHX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8885,7 +8885,7 @@ std::string NMD::LHX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LI_16_(uint64 instruction, img_address m_pc)
+static std::string LI_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
@@ -8907,7 +8907,7 @@ std::string NMD::LI_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LI_48_(uint64 instruction, img_address m_pc)
+static std::string LI_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -8929,7 +8929,7 @@ std::string NMD::LI_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LL(uint64 instruction, img_address m_pc)
+static std::string LL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8953,7 +8953,7 @@ std::string NMD::LL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLD(uint64 instruction, img_address m_pc)
+static std::string LLD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8977,7 +8977,7 @@ std::string NMD::LLD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLDP(uint64 instruction, img_address m_pc)
+static std::string LLDP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9001,7 +9001,7 @@ std::string NMD::LLDP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLE(uint64 instruction, img_address m_pc)
+static std::string LLE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9025,7 +9025,7 @@ std::string NMD::LLE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLWP(uint64 instruction, img_address m_pc)
+static std::string LLWP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9049,7 +9049,7 @@ std::string NMD::LLWP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLWPE(uint64 instruction, img_address m_pc)
+static std::string LLWPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9073,7 +9073,7 @@ std::string NMD::LLWPE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LSA(uint64 instruction, img_address m_pc)
+static std::string LSA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9099,7 +9099,7 @@ std::string NMD::LSA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LUI(uint64 instruction, img_address m_pc)
+static std::string LUI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
@@ -9121,7 +9121,7 @@ std::string NMD::LUI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_16_(uint64 instruction, img_address m_pc)
+static std::string LW_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -9145,7 +9145,7 @@ std::string NMD::LW_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_4X4_(uint64 instruction, img_address m_pc)
+static std::string LW_4X4_(uint64 instruction, img_address m_pc)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -9169,7 +9169,7 @@ std::string NMD::LW_4X4_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_GP_(uint64 instruction, img_address m_pc)
+static std::string LW_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
@@ -9191,7 +9191,7 @@ std::string NMD::LW_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_GP16_(uint64 instruction, img_address m_pc)
+static std::string LW_GP16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
@@ -9213,7 +9213,7 @@ std::string NMD::LW_GP16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_S9_(uint64 instruction, img_address m_pc)
+static std::string LW_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9237,7 +9237,7 @@ std::string NMD::LW_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_SP_(uint64 instruction, img_address m_pc)
+static std::string LW_SP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
@@ -9259,7 +9259,7 @@ std::string NMD::LW_SP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_U12_(uint64 instruction, img_address m_pc)
+static std::string LW_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9283,7 +9283,7 @@ std::string NMD::LW_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_GP_(uint64 instruction, img_address m_pc)
+static std::string LWC1_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -9305,7 +9305,7 @@ std::string NMD::LWC1_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_S9_(uint64 instruction, img_address m_pc)
+static std::string LWC1_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9329,7 +9329,7 @@ std::string NMD::LWC1_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_U12_(uint64 instruction, img_address m_pc)
+static std::string LWC1_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9353,7 +9353,7 @@ std::string NMD::LWC1_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1X(uint64 instruction, img_address m_pc)
+static std::string LWC1X(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9377,7 +9377,7 @@ std::string NMD::LWC1X(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1XS(uint64 instruction, img_address m_pc)
+static std::string LWC1XS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9401,7 +9401,7 @@ std::string NMD::LWC1XS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC2(uint64 instruction, img_address m_pc)
+static std::string LWC2(uint64 instruction, img_address m_pc)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9425,7 +9425,7 @@ std::string NMD::LWC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWE(uint64 instruction, img_address m_pc)
+static std::string LWE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9449,7 +9449,7 @@ std::string NMD::LWE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWM(uint64 instruction, img_address m_pc)
+static std::string LWM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9475,7 +9475,7 @@ std::string NMD::LWM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWPC_48_(uint64 instruction, img_address m_pc)
+static std::string LWPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -9497,7 +9497,7 @@ std::string NMD::LWPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_GP_(uint64 instruction, img_address m_pc)
+static std::string LWU_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -9519,7 +9519,7 @@ std::string NMD::LWU_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_S9_(uint64 instruction, img_address m_pc)
+static std::string LWU_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9543,7 +9543,7 @@ std::string NMD::LWU_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_U12_(uint64 instruction, img_address m_pc)
+static std::string LWU_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9567,7 +9567,7 @@ std::string NMD::LWU_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWUX(uint64 instruction, img_address m_pc)
+static std::string LWUX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9591,7 +9591,7 @@ std::string NMD::LWUX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWUXS(uint64 instruction, img_address m_pc)
+static std::string LWUXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9615,7 +9615,7 @@ std::string NMD::LWUXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWX(uint64 instruction, img_address m_pc)
+static std::string LWX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9639,7 +9639,7 @@ std::string NMD::LWX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWXS_16_(uint64 instruction, img_address m_pc)
+static std::string LWXS_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -9663,7 +9663,7 @@ std::string NMD::LWXS_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWXS_32_(uint64 instruction, img_address m_pc)
+static std::string LWXS_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9688,7 +9688,7 @@ std::string NMD::LWXS_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADD_DSP_(uint64 instruction, img_address m_pc)
+static std::string MADD_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9712,7 +9712,7 @@ std::string NMD::MADD_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDF_D(uint64 instruction, img_address m_pc)
+static std::string MADDF_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9736,7 +9736,7 @@ std::string NMD::MADDF_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDF_S(uint64 instruction, img_address m_pc)
+static std::string MADDF_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9761,7 +9761,7 @@ std::string NMD::MADDF_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDU_DSP_(uint64 instruction, img_address m_pc)
+static std::string MADDU_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9786,7 +9786,7 @@ std::string NMD::MADDU_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_S_W_PHL(uint64 instruction, img_address m_pc)
+static std::string MAQ_S_W_PHL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9811,7 +9811,7 @@ std::string NMD::MAQ_S_W_PHL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_S_W_PHR(uint64 instruction, img_address m_pc)
+static std::string MAQ_S_W_PHR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9836,7 +9836,7 @@ std::string NMD::MAQ_S_W_PHR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_SA_W_PHL(uint64 instruction, img_address m_pc)
+static std::string MAQ_SA_W_PHL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9861,7 +9861,7 @@ std::string NMD::MAQ_SA_W_PHL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_SA_W_PHR(uint64 instruction, img_address m_pc)
+static std::string MAQ_SA_W_PHR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9885,7 +9885,7 @@ std::string NMD::MAQ_SA_W_PHR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAX_D(uint64 instruction, img_address m_pc)
+static std::string MAX_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9909,7 +9909,7 @@ std::string NMD::MAX_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAX_S(uint64 instruction, img_address m_pc)
+static std::string MAX_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9933,7 +9933,7 @@ std::string NMD::MAX_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAXA_D(uint64 instruction, img_address m_pc)
+static std::string MAXA_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9957,7 +9957,7 @@ std::string NMD::MAXA_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAXA_S(uint64 instruction, img_address m_pc)
+static std::string MAXA_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9981,7 +9981,7 @@ std::string NMD::MAXA_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC0(uint64 instruction, img_address m_pc)
+static std::string MFC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10005,7 +10005,7 @@ std::string NMD::MFC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC1(uint64 instruction, img_address m_pc)
+static std::string MFC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10027,7 +10027,7 @@ std::string NMD::MFC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC2(uint64 instruction, img_address m_pc)
+static std::string MFC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10049,7 +10049,7 @@ std::string NMD::MFC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFGC0(uint64 instruction, img_address m_pc)
+static std::string MFGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10073,7 +10073,7 @@ std::string NMD::MFGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC0(uint64 instruction, img_address m_pc)
+static std::string MFHC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10097,7 +10097,7 @@ std::string NMD::MFHC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC1(uint64 instruction, img_address m_pc)
+static std::string MFHC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10119,7 +10119,7 @@ std::string NMD::MFHC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC2(uint64 instruction, img_address m_pc)
+static std::string MFHC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10141,7 +10141,7 @@ std::string NMD::MFHC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHGC0(uint64 instruction, img_address m_pc)
+static std::string MFHGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10164,7 +10164,7 @@ std::string NMD::MFHGC0(uint64 instruction, img_address m_pc)
  *     rt -----
  *               ac --
  */
-std::string NMD::MFHI_DSP_(uint64 instruction, img_address m_pc)
+static std::string MFHI_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10186,7 +10186,7 @@ std::string NMD::MFHI_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHTR(uint64 instruction, img_address m_pc)
+static std::string MFHTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10211,7 +10211,7 @@ std::string NMD::MFHTR(uint64 instruction, img_address m_pc)
  *     rt -----
  *               ac --
  */
-std::string NMD::MFLO_DSP_(uint64 instruction, img_address m_pc)
+static std::string MFLO_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10233,7 +10233,7 @@ std::string NMD::MFLO_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFTR(uint64 instruction, img_address m_pc)
+static std::string MFTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10259,7 +10259,7 @@ std::string NMD::MFTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MIN_D(uint64 instruction, img_address m_pc)
+static std::string MIN_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10283,7 +10283,7 @@ std::string NMD::MIN_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MIN_S(uint64 instruction, img_address m_pc)
+static std::string MIN_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10307,7 +10307,7 @@ std::string NMD::MIN_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MINA_D(uint64 instruction, img_address m_pc)
+static std::string MINA_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10331,7 +10331,7 @@ std::string NMD::MINA_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MINA_S(uint64 instruction, img_address m_pc)
+static std::string MINA_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10355,7 +10355,7 @@ std::string NMD::MINA_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOD(uint64 instruction, img_address m_pc)
+static std::string MOD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10379,7 +10379,7 @@ std::string NMD::MOD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MODSUB(uint64 instruction, img_address m_pc)
+static std::string MODSUB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10403,7 +10403,7 @@ std::string NMD::MODSUB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MODU(uint64 instruction, img_address m_pc)
+static std::string MODU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10427,7 +10427,7 @@ std::string NMD::MODU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOV_D(uint64 instruction, img_address m_pc)
+static std::string MOV_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10449,7 +10449,7 @@ std::string NMD::MOV_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOV_S(uint64 instruction, img_address m_pc)
+static std::string MOV_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10471,7 +10471,7 @@ std::string NMD::MOV_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVE_BALC(uint64 instruction, img_address m_pc)
+static std::string MOVE_BALC(uint64 instruction, img_address m_pc)
 {
     uint64 rtz4_value = extract_rtz4_27_26_25_23_22_21(instruction);
     uint64 rd1_value = extract_rdl_25_24(instruction);
@@ -10495,7 +10495,7 @@ std::string NMD::MOVE_BALC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVEP(uint64 instruction, img_address m_pc)
+static std::string MOVEP(uint64 instruction, img_address m_pc)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
@@ -10522,7 +10522,7 @@ std::string NMD::MOVEP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVEP_REV_(uint64 instruction, img_address m_pc)
+static std::string MOVEP_REV_(uint64 instruction, img_address m_pc)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
@@ -10549,7 +10549,7 @@ std::string NMD::MOVEP_REV_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVE(uint64 instruction, img_address m_pc)
+static std::string MOVE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 rs_value = extract_rs_4_3_2_1_0(instruction);
@@ -10571,7 +10571,7 @@ std::string NMD::MOVE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVN(uint64 instruction, img_address m_pc)
+static std::string MOVN(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10595,7 +10595,7 @@ std::string NMD::MOVN(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVZ(uint64 instruction, img_address m_pc)
+static std::string MOVZ(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10619,7 +10619,7 @@ std::string NMD::MOVZ(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::MSUB_DSP_(uint64 instruction, img_address m_pc)
+static std::string MSUB_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10643,7 +10643,7 @@ std::string NMD::MSUB_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MSUBF_D(uint64 instruction, img_address m_pc)
+static std::string MSUBF_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10667,7 +10667,7 @@ std::string NMD::MSUBF_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MSUBF_S(uint64 instruction, img_address m_pc)
+static std::string MSUBF_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10691,7 +10691,7 @@ std::string NMD::MSUBF_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::MSUBU_DSP_(uint64 instruction, img_address m_pc)
+static std::string MSUBU_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10715,7 +10715,7 @@ std::string NMD::MSUBU_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC0(uint64 instruction, img_address m_pc)
+static std::string MTC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10739,7 +10739,7 @@ std::string NMD::MTC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC1(uint64 instruction, img_address m_pc)
+static std::string MTC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10761,7 +10761,7 @@ std::string NMD::MTC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC2(uint64 instruction, img_address m_pc)
+static std::string MTC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10783,7 +10783,7 @@ std::string NMD::MTC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTGC0(uint64 instruction, img_address m_pc)
+static std::string MTGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10807,7 +10807,7 @@ std::string NMD::MTGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC0(uint64 instruction, img_address m_pc)
+static std::string MTHC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10831,7 +10831,7 @@ std::string NMD::MTHC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC1(uint64 instruction, img_address m_pc)
+static std::string MTHC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10853,7 +10853,7 @@ std::string NMD::MTHC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC2(uint64 instruction, img_address m_pc)
+static std::string MTHC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10875,7 +10875,7 @@ std::string NMD::MTHC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHGC0(uint64 instruction, img_address m_pc)
+static std::string MTHGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10898,7 +10898,7 @@ std::string NMD::MTHGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTHI_DSP_(uint64 instruction, img_address m_pc)
+static std::string MTHI_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10919,7 +10919,7 @@ std::string NMD::MTHI_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTHLIP(uint64 instruction, img_address m_pc)
+static std::string MTHLIP(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10941,7 +10941,7 @@ std::string NMD::MTHLIP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHTR(uint64 instruction, img_address m_pc)
+static std::string MTHTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10966,7 +10966,7 @@ std::string NMD::MTHTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTLO_DSP_(uint64 instruction, img_address m_pc)
+static std::string MTLO_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10988,7 +10988,7 @@ std::string NMD::MTLO_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTTR(uint64 instruction, img_address m_pc)
+static std::string MTTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -11014,7 +11014,7 @@ std::string NMD::MTTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUH(uint64 instruction, img_address m_pc)
+static std::string MUH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11038,7 +11038,7 @@ std::string NMD::MUH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUHU(uint64 instruction, img_address m_pc)
+static std::string MUHU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11062,7 +11062,7 @@ std::string NMD::MUHU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_32_(uint64 instruction, img_address m_pc)
+static std::string MUL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11086,7 +11086,7 @@ std::string NMD::MUL_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_4X4_(uint64 instruction, img_address m_pc)
+static std::string MUL_4X4_(uint64 instruction, img_address m_pc)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -11108,7 +11108,7 @@ std::string NMD::MUL_4X4_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_D(uint64 instruction, img_address m_pc)
+static std::string MUL_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11133,7 +11133,7 @@ std::string NMD::MUL_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_PH(uint64 instruction, img_address m_pc)
+static std::string MUL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11158,7 +11158,7 @@ std::string NMD::MUL_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_S_PH(uint64 instruction, img_address m_pc)
+static std::string MUL_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11182,7 +11182,7 @@ std::string NMD::MUL_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_S(uint64 instruction, img_address m_pc)
+static std::string MUL_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11207,7 +11207,7 @@ std::string NMD::MUL_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEQ_S_W_PHL(uint64 instruction, img_address m_pc)
+static std::string MULEQ_S_W_PHL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11232,7 +11232,7 @@ std::string NMD::MULEQ_S_W_PHL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEQ_S_W_PHR(uint64 instruction, img_address m_pc)
+static std::string MULEQ_S_W_PHR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11257,7 +11257,7 @@ std::string NMD::MULEQ_S_W_PHR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEU_S_PH_QBL(uint64 instruction, img_address m_pc)
+static std::string MULEU_S_PH_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11282,7 +11282,7 @@ std::string NMD::MULEU_S_PH_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEU_S_PH_QBR(uint64 instruction, img_address m_pc)
+static std::string MULEU_S_PH_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11307,7 +11307,7 @@ std::string NMD::MULEU_S_PH_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_RS_PH(uint64 instruction, img_address m_pc)
+static std::string MULQ_RS_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11332,7 +11332,7 @@ std::string NMD::MULQ_RS_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_RS_W(uint64 instruction, img_address m_pc)
+static std::string MULQ_RS_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11357,7 +11357,7 @@ std::string NMD::MULQ_RS_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_S_PH(uint64 instruction, img_address m_pc)
+static std::string MULQ_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11382,7 +11382,7 @@ std::string NMD::MULQ_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_S_W(uint64 instruction, img_address m_pc)
+static std::string MULQ_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11407,7 +11407,7 @@ std::string NMD::MULQ_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULSA_W_PH(uint64 instruction, img_address m_pc)
+static std::string MULSA_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11432,7 +11432,7 @@ std::string NMD::MULSA_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULSAQ_S_W_PH(uint64 instruction, img_address m_pc)
+static std::string MULSAQ_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11456,7 +11456,7 @@ std::string NMD::MULSAQ_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULT_DSP_(uint64 instruction, img_address m_pc)
+static std::string MULT_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11480,7 +11480,7 @@ std::string NMD::MULT_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULTU_DSP_(uint64 instruction, img_address m_pc)
+static std::string MULTU_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11504,7 +11504,7 @@ std::string NMD::MULTU_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULU(uint64 instruction, img_address m_pc)
+static std::string MULU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11528,7 +11528,7 @@ std::string NMD::MULU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NEG_D(uint64 instruction, img_address m_pc)
+static std::string NEG_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11550,7 +11550,7 @@ std::string NMD::NEG_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NEG_S(uint64 instruction, img_address m_pc)
+static std::string NEG_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11572,7 +11572,7 @@ std::string NMD::NEG_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOP_16_(uint64 instruction, img_address m_pc)
+static std::string NOP_16_(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -11590,7 +11590,7 @@ std::string NMD::NOP_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOP_32_(uint64 instruction, img_address m_pc)
+static std::string NOP_32_(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -11608,7 +11608,7 @@ std::string NMD::NOP_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOR(uint64 instruction, img_address m_pc)
+static std::string NOR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11632,7 +11632,7 @@ std::string NMD::NOR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOT_16_(uint64 instruction, img_address m_pc)
+static std::string NOT_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -11654,7 +11654,7 @@ std::string NMD::NOT_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::OR_16_(uint64 instruction, img_address m_pc)
+static std::string OR_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -11676,7 +11676,7 @@ std::string NMD::OR_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::OR_32_(uint64 instruction, img_address m_pc)
+static std::string OR_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11700,7 +11700,7 @@ std::string NMD::OR_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ORI(uint64 instruction, img_address m_pc)
+static std::string ORI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11725,7 +11725,7 @@ std::string NMD::ORI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PACKRL_PH(uint64 instruction, img_address m_pc)
+static std::string PACKRL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11749,7 +11749,7 @@ std::string NMD::PACKRL_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PAUSE(uint64 instruction, img_address m_pc)
+static std::string PAUSE(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -11768,7 +11768,7 @@ std::string NMD::PAUSE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PICK_PH(uint64 instruction, img_address m_pc)
+static std::string PICK_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11793,7 +11793,7 @@ std::string NMD::PICK_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PICK_QB(uint64 instruction, img_address m_pc)
+static std::string PICK_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11818,7 +11818,7 @@ std::string NMD::PICK_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQ_W_PHL(uint64 instruction, img_address m_pc)
+static std::string PRECEQ_W_PHL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11841,7 +11841,7 @@ std::string NMD::PRECEQ_W_PHL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQ_W_PHR(uint64 instruction, img_address m_pc)
+static std::string PRECEQ_W_PHR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11864,7 +11864,7 @@ std::string NMD::PRECEQ_W_PHR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBLA(uint64 instruction, img_address m_pc)
+static std::string PRECEQU_PH_QBLA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11887,7 +11887,7 @@ std::string NMD::PRECEQU_PH_QBLA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBL(uint64 instruction, img_address m_pc)
+static std::string PRECEQU_PH_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11910,7 +11910,7 @@ std::string NMD::PRECEQU_PH_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBRA(uint64 instruction, img_address m_pc)
+static std::string PRECEQU_PH_QBRA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11933,7 +11933,7 @@ std::string NMD::PRECEQU_PH_QBRA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBR(uint64 instruction, img_address m_pc)
+static std::string PRECEQU_PH_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11957,7 +11957,7 @@ std::string NMD::PRECEQU_PH_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBLA(uint64 instruction, img_address m_pc)
+static std::string PRECEU_PH_QBLA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11980,7 +11980,7 @@ std::string NMD::PRECEU_PH_QBLA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBL(uint64 instruction, img_address m_pc)
+static std::string PRECEU_PH_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12004,7 +12004,7 @@ std::string NMD::PRECEU_PH_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBRA(uint64 instruction, img_address m_pc)
+static std::string PRECEU_PH_QBRA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12027,7 +12027,7 @@ std::string NMD::PRECEU_PH_QBRA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBR(uint64 instruction, img_address m_pc)
+static std::string PRECEU_PH_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12050,7 +12050,7 @@ std::string NMD::PRECEU_PH_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_QB_PH(uint64 instruction, img_address m_pc)
+static std::string PRECR_QB_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12075,7 +12075,7 @@ std::string NMD::PRECR_QB_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_SRA_PH_W(uint64 instruction, img_address m_pc)
+static std::string PRECR_SRA_PH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12100,7 +12100,7 @@ std::string NMD::PRECR_SRA_PH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_SRA_R_PH_W(uint64 instruction, img_address m_pc)
+static std::string PRECR_SRA_R_PH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12125,7 +12125,7 @@ std::string NMD::PRECR_SRA_R_PH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_PH_W(uint64 instruction, img_address m_pc)
+static std::string PRECRQ_PH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12150,7 +12150,7 @@ std::string NMD::PRECRQ_PH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_QB_PH(uint64 instruction, img_address m_pc)
+static std::string PRECRQ_QB_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12175,7 +12175,7 @@ std::string NMD::PRECRQ_QB_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_RS_PH_W(uint64 instruction, img_address m_pc)
+static std::string PRECRQ_RS_PH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12200,7 +12200,7 @@ std::string NMD::PRECRQ_RS_PH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQU_S_QB_PH(uint64 instruction, img_address m_pc)
+static std::string PRECRQU_S_QB_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12224,7 +12224,7 @@ std::string NMD::PRECRQU_S_QB_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREF_S9_(uint64 instruction, img_address m_pc)
+static std::string PREF_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12248,7 +12248,7 @@ std::string NMD::PREF_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREF_U12_(uint64 instruction, img_address m_pc)
+static std::string PREF_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12272,7 +12272,7 @@ std::string NMD::PREF_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREFE(uint64 instruction, img_address m_pc)
+static std::string PREFE(uint64 instruction, img_address m_pc)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12296,7 +12296,7 @@ std::string NMD::PREFE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREPEND(uint64 instruction, img_address m_pc)
+static std::string PREPEND(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12319,7 +12319,7 @@ std::string NMD::PREPEND(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::RADDU_W_QB(uint64 instruction, img_address m_pc)
+static std::string RADDU_W_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12340,7 +12340,7 @@ std::string NMD::RADDU_W_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *        mask -------
  */
-std::string NMD::RDDSP(uint64 instruction, img_address m_pc)
+static std::string RDDSP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
@@ -12362,7 +12362,7 @@ std::string NMD::RDDSP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RDHWR(uint64 instruction, img_address m_pc)
+static std::string RDHWR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 hs_value = extract_hs_20_19_18_17_16(instruction);
@@ -12386,7 +12386,7 @@ std::string NMD::RDHWR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RDPGPR(uint64 instruction, img_address m_pc)
+static std::string RDPGPR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12408,7 +12408,7 @@ std::string NMD::RDPGPR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RECIP_D(uint64 instruction, img_address m_pc)
+static std::string RECIP_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12430,7 +12430,7 @@ std::string NMD::RECIP_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RECIP_S(uint64 instruction, img_address m_pc)
+static std::string RECIP_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12452,7 +12452,7 @@ std::string NMD::RECIP_S(uint64 instruction, img_address m_pc)
  *     rt -----
  *           s ----------
  */
-std::string NMD::REPL_PH(uint64 instruction, img_address m_pc)
+static std::string REPL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
@@ -12474,7 +12474,7 @@ std::string NMD::REPL_PH(uint64 instruction, img_address m_pc)
  *     rt -----
  *           u --------
  */
-std::string NMD::REPL_QB(uint64 instruction, img_address m_pc)
+static std::string REPL_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
@@ -12496,7 +12496,7 @@ std::string NMD::REPL_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::REPLV_PH(uint64 instruction, img_address m_pc)
+static std::string REPLV_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12517,7 +12517,7 @@ std::string NMD::REPLV_PH(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::REPLV_QB(uint64 instruction, img_address m_pc)
+static std::string REPLV_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12539,7 +12539,7 @@ std::string NMD::REPLV_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_32_(uint64 instruction, img_address m_pc)
+static std::string RESTORE_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
@@ -12562,7 +12562,7 @@ std::string NMD::RESTORE_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_JRC_16_(uint64 instruction, img_address m_pc)
+static std::string RESTORE_JRC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
@@ -12584,7 +12584,7 @@ std::string NMD::RESTORE_JRC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_JRC_32_(uint64 instruction, img_address m_pc)
+static std::string RESTORE_JRC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
@@ -12607,7 +12607,7 @@ std::string NMD::RESTORE_JRC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTOREF(uint64 instruction, img_address m_pc)
+static std::string RESTOREF(uint64 instruction, img_address m_pc)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
@@ -12629,7 +12629,7 @@ std::string NMD::RESTOREF(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RINT_D(uint64 instruction, img_address m_pc)
+static std::string RINT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12651,7 +12651,7 @@ std::string NMD::RINT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RINT_S(uint64 instruction, img_address m_pc)
+static std::string RINT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12673,7 +12673,7 @@ std::string NMD::RINT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTR(uint64 instruction, img_address m_pc)
+static std::string ROTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12697,7 +12697,7 @@ std::string NMD::ROTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTRV(uint64 instruction, img_address m_pc)
+static std::string ROTRV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12721,7 +12721,7 @@ std::string NMD::ROTRV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTX(uint64 instruction, img_address m_pc)
+static std::string ROTX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12750,7 +12750,7 @@ std::string NMD::ROTX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_L_D(uint64 instruction, img_address m_pc)
+static std::string ROUND_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12772,7 +12772,7 @@ std::string NMD::ROUND_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_L_S(uint64 instruction, img_address m_pc)
+static std::string ROUND_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12794,7 +12794,7 @@ std::string NMD::ROUND_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_W_D(uint64 instruction, img_address m_pc)
+static std::string ROUND_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12816,7 +12816,7 @@ std::string NMD::ROUND_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_W_S(uint64 instruction, img_address m_pc)
+static std::string ROUND_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12838,7 +12838,7 @@ std::string NMD::ROUND_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RSQRT_D(uint64 instruction, img_address m_pc)
+static std::string RSQRT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12860,7 +12860,7 @@ std::string NMD::RSQRT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RSQRT_S(uint64 instruction, img_address m_pc)
+static std::string RSQRT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12882,7 +12882,7 @@ std::string NMD::RSQRT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVE_16_(uint64 instruction, img_address m_pc)
+static std::string SAVE_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
@@ -12904,7 +12904,7 @@ std::string NMD::SAVE_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVE_32_(uint64 instruction, img_address m_pc)
+static std::string SAVE_32_(uint64 instruction, img_address m_pc)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
@@ -12927,7 +12927,7 @@ std::string NMD::SAVE_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVEF(uint64 instruction, img_address m_pc)
+static std::string SAVEF(uint64 instruction, img_address m_pc)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
@@ -12949,7 +12949,7 @@ std::string NMD::SAVEF(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_16_(uint64 instruction, img_address m_pc)
+static std::string SB_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -12973,7 +12973,7 @@ std::string NMD::SB_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_GP_(uint64 instruction, img_address m_pc)
+static std::string SB_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -12995,7 +12995,7 @@ std::string NMD::SB_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_S9_(uint64 instruction, img_address m_pc)
+static std::string SB_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13019,7 +13019,7 @@ std::string NMD::SB_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_U12_(uint64 instruction, img_address m_pc)
+static std::string SB_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13043,7 +13043,7 @@ std::string NMD::SB_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SBE(uint64 instruction, img_address m_pc)
+static std::string SBE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13067,7 +13067,7 @@ std::string NMD::SBE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SBX(uint64 instruction, img_address m_pc)
+static std::string SBX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13091,7 +13091,7 @@ std::string NMD::SBX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SC(uint64 instruction, img_address m_pc)
+static std::string SC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13115,7 +13115,7 @@ std::string NMD::SC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCD(uint64 instruction, img_address m_pc)
+static std::string SCD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13139,7 +13139,7 @@ std::string NMD::SCD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCDP(uint64 instruction, img_address m_pc)
+static std::string SCDP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13163,7 +13163,7 @@ std::string NMD::SCDP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCE(uint64 instruction, img_address m_pc)
+static std::string SCE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13187,7 +13187,7 @@ std::string NMD::SCE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCWP(uint64 instruction, img_address m_pc)
+static std::string SCWP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13211,7 +13211,7 @@ std::string NMD::SCWP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCWPE(uint64 instruction, img_address m_pc)
+static std::string SCWPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13235,7 +13235,7 @@ std::string NMD::SCWPE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_GP_(uint64 instruction, img_address m_pc)
+static std::string SD_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
@@ -13257,7 +13257,7 @@ std::string NMD::SD_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_S9_(uint64 instruction, img_address m_pc)
+static std::string SD_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13281,7 +13281,7 @@ std::string NMD::SD_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_U12_(uint64 instruction, img_address m_pc)
+static std::string SD_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13305,7 +13305,7 @@ std::string NMD::SD_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDBBP_16_(uint64 instruction, img_address m_pc)
+static std::string SDBBP_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
@@ -13325,7 +13325,7 @@ std::string NMD::SDBBP_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDBBP_32_(uint64 instruction, img_address m_pc)
+static std::string SDBBP_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -13345,7 +13345,7 @@ std::string NMD::SDBBP_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_GP_(uint64 instruction, img_address m_pc)
+static std::string SDC1_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -13367,7 +13367,7 @@ std::string NMD::SDC1_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_S9_(uint64 instruction, img_address m_pc)
+static std::string SDC1_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13391,7 +13391,7 @@ std::string NMD::SDC1_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_U12_(uint64 instruction, img_address m_pc)
+static std::string SDC1_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13415,7 +13415,7 @@ std::string NMD::SDC1_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1X(uint64 instruction, img_address m_pc)
+static std::string SDC1X(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13439,7 +13439,7 @@ std::string NMD::SDC1X(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1XS(uint64 instruction, img_address m_pc)
+static std::string SDC1XS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13463,7 +13463,7 @@ std::string NMD::SDC1XS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC2(uint64 instruction, img_address m_pc)
+static std::string SDC2(uint64 instruction, img_address m_pc)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13487,7 +13487,7 @@ std::string NMD::SDC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDM(uint64 instruction, img_address m_pc)
+static std::string SDM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13513,7 +13513,7 @@ std::string NMD::SDM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDPC_48_(uint64 instruction, img_address m_pc)
+static std::string SDPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -13535,7 +13535,7 @@ std::string NMD::SDPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDXS(uint64 instruction, img_address m_pc)
+static std::string SDXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13559,7 +13559,7 @@ std::string NMD::SDXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDX(uint64 instruction, img_address m_pc)
+static std::string SDX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13583,7 +13583,7 @@ std::string NMD::SDX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEB(uint64 instruction, img_address m_pc)
+static std::string SEB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13605,7 +13605,7 @@ std::string NMD::SEB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEH(uint64 instruction, img_address m_pc)
+static std::string SEH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13627,7 +13627,7 @@ std::string NMD::SEH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEL_D(uint64 instruction, img_address m_pc)
+static std::string SEL_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13651,7 +13651,7 @@ std::string NMD::SEL_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEL_S(uint64 instruction, img_address m_pc)
+static std::string SEL_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13675,7 +13675,7 @@ std::string NMD::SEL_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELEQZ_D(uint64 instruction, img_address m_pc)
+static std::string SELEQZ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13699,7 +13699,7 @@ std::string NMD::SELEQZ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELEQZ_S(uint64 instruction, img_address m_pc)
+static std::string SELEQZ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13723,7 +13723,7 @@ std::string NMD::SELEQZ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELNEZ_D(uint64 instruction, img_address m_pc)
+static std::string SELNEZ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13747,7 +13747,7 @@ std::string NMD::SELNEZ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELNEZ_S(uint64 instruction, img_address m_pc)
+static std::string SELNEZ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13771,7 +13771,7 @@ std::string NMD::SELNEZ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEQI(uint64 instruction, img_address m_pc)
+static std::string SEQI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13795,7 +13795,7 @@ std::string NMD::SEQI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_16_(uint64 instruction, img_address m_pc)
+static std::string SH_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -13819,7 +13819,7 @@ std::string NMD::SH_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_GP_(uint64 instruction, img_address m_pc)
+static std::string SH_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
@@ -13841,7 +13841,7 @@ std::string NMD::SH_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_S9_(uint64 instruction, img_address m_pc)
+static std::string SH_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13865,7 +13865,7 @@ std::string NMD::SH_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_U12_(uint64 instruction, img_address m_pc)
+static std::string SH_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13889,7 +13889,7 @@ std::string NMD::SH_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHE(uint64 instruction, img_address m_pc)
+static std::string SHE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13913,7 +13913,7 @@ std::string NMD::SHE(uint64 instruction, img_address m_pc)
  *      shift ------
  *               ac --
  */
-std::string NMD::SHILO(uint64 instruction, img_address m_pc)
+static std::string SHILO(uint64 instruction, img_address m_pc)
 {
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -13935,7 +13935,7 @@ std::string NMD::SHILO(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-std::string NMD::SHILOV(uint64 instruction, img_address m_pc)
+static std::string SHILOV(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -13957,7 +13957,7 @@ std::string NMD::SHILOV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHLL_PH(uint64 instruction, img_address m_pc)
+static std::string SHLL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13981,7 +13981,7 @@ std::string NMD::SHLL_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ---
  */
-std::string NMD::SHLL_QB(uint64 instruction, img_address m_pc)
+static std::string SHLL_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14006,7 +14006,7 @@ std::string NMD::SHLL_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHLL_S_PH(uint64 instruction, img_address m_pc)
+static std::string SHLL_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14030,7 +14030,7 @@ std::string NMD::SHLL_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa -----
  */
-std::string NMD::SHLL_S_W(uint64 instruction, img_address m_pc)
+static std::string SHLL_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14055,7 +14055,7 @@ std::string NMD::SHLL_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_PH(uint64 instruction, img_address m_pc)
+static std::string SHLLV_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14079,7 +14079,7 @@ std::string NMD::SHLLV_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_QB(uint64 instruction, img_address m_pc)
+static std::string SHLLV_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14104,7 +14104,7 @@ std::string NMD::SHLLV_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_S_PH(uint64 instruction, img_address m_pc)
+static std::string SHLLV_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14128,7 +14128,7 @@ std::string NMD::SHLLV_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_S_W(uint64 instruction, img_address m_pc)
+static std::string SHLLV_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14152,7 +14152,7 @@ std::string NMD::SHLLV_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_PH(uint64 instruction, img_address m_pc)
+static std::string SHRA_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14176,7 +14176,7 @@ std::string NMD::SHRA_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_QB(uint64 instruction, img_address m_pc)
+static std::string SHRA_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14200,7 +14200,7 @@ std::string NMD::SHRA_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_PH(uint64 instruction, img_address m_pc)
+static std::string SHRA_R_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14224,7 +14224,7 @@ std::string NMD::SHRA_R_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_QB(uint64 instruction, img_address m_pc)
+static std::string SHRA_R_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14248,7 +14248,7 @@ std::string NMD::SHRA_R_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_W(uint64 instruction, img_address m_pc)
+static std::string SHRA_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14272,7 +14272,7 @@ std::string NMD::SHRA_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_PH(uint64 instruction, img_address m_pc)
+static std::string SHRAV_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14296,7 +14296,7 @@ std::string NMD::SHRAV_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_QB(uint64 instruction, img_address m_pc)
+static std::string SHRAV_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14320,7 +14320,7 @@ std::string NMD::SHRAV_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_PH(uint64 instruction, img_address m_pc)
+static std::string SHRAV_R_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14344,7 +14344,7 @@ std::string NMD::SHRAV_R_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_QB(uint64 instruction, img_address m_pc)
+static std::string SHRAV_R_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14368,7 +14368,7 @@ std::string NMD::SHRAV_R_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_W(uint64 instruction, img_address m_pc)
+static std::string SHRAV_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14392,7 +14392,7 @@ std::string NMD::SHRAV_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHRL_PH(uint64 instruction, img_address m_pc)
+static std::string SHRL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14416,7 +14416,7 @@ std::string NMD::SHRL_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ---
  */
-std::string NMD::SHRL_QB(uint64 instruction, img_address m_pc)
+static std::string SHRL_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14441,7 +14441,7 @@ std::string NMD::SHRL_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRLV_PH(uint64 instruction, img_address m_pc)
+static std::string SHRLV_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14465,7 +14465,7 @@ std::string NMD::SHRLV_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRLV_QB(uint64 instruction, img_address m_pc)
+static std::string SHRLV_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14489,7 +14489,7 @@ std::string NMD::SHRLV_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHX(uint64 instruction, img_address m_pc)
+static std::string SHX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14513,7 +14513,7 @@ std::string NMD::SHX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHXS(uint64 instruction, img_address m_pc)
+static std::string SHXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14537,7 +14537,7 @@ std::string NMD::SHXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SIGRIE(uint64 instruction, img_address m_pc)
+static std::string SIGRIE(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -14557,7 +14557,7 @@ std::string NMD::SIGRIE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLL_16_(uint64 instruction, img_address m_pc)
+static std::string SLL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -14581,7 +14581,7 @@ std::string NMD::SLL_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLL_32_(uint64 instruction, img_address m_pc)
+static std::string SLL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14605,7 +14605,7 @@ std::string NMD::SLL_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLLV(uint64 instruction, img_address m_pc)
+static std::string SLLV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14629,7 +14629,7 @@ std::string NMD::SLLV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLT(uint64 instruction, img_address m_pc)
+static std::string SLT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14653,7 +14653,7 @@ std::string NMD::SLT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTI(uint64 instruction, img_address m_pc)
+static std::string SLTI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14677,7 +14677,7 @@ std::string NMD::SLTI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTIU(uint64 instruction, img_address m_pc)
+static std::string SLTIU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14701,7 +14701,7 @@ std::string NMD::SLTIU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTU(uint64 instruction, img_address m_pc)
+static std::string SLTU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14725,7 +14725,7 @@ std::string NMD::SLTU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SOV(uint64 instruction, img_address m_pc)
+static std::string SOV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14749,7 +14749,7 @@ std::string NMD::SOV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SPECIAL2(uint64 instruction, img_address m_pc)
+static std::string SPECIAL2(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
@@ -14769,7 +14769,7 @@ std::string NMD::SPECIAL2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SQRT_D(uint64 instruction, img_address m_pc)
+static std::string SQRT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -14791,7 +14791,7 @@ std::string NMD::SQRT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SQRT_S(uint64 instruction, img_address m_pc)
+static std::string SQRT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -14813,7 +14813,7 @@ std::string NMD::SQRT_S(uint64 instruction, img_address m_pc)
  *               rd -----
  *                    sa -----
  */
-std::string NMD::SRA(uint64 instruction, img_address m_pc)
+static std::string SRA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14837,7 +14837,7 @@ std::string NMD::SRA(uint64 instruction, img_address m_pc)
  *          rt -----
  *               rd -----
  */
-std::string NMD::SRAV(uint64 instruction, img_address m_pc)
+static std::string SRAV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14861,7 +14861,7 @@ std::string NMD::SRAV(uint64 instruction, img_address m_pc)
  *          rt -----
  *               rd -----
  */
-std::string NMD::SRL_16_(uint64 instruction, img_address m_pc)
+static std::string SRL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -14885,7 +14885,7 @@ std::string NMD::SRL_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SRL_32_(uint64 instruction, img_address m_pc)
+static std::string SRL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14909,7 +14909,7 @@ std::string NMD::SRL_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SRLV(uint64 instruction, img_address m_pc)
+static std::string SRLV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14933,7 +14933,7 @@ std::string NMD::SRLV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB(uint64 instruction, img_address m_pc)
+static std::string SUB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14957,7 +14957,7 @@ std::string NMD::SUB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB_D(uint64 instruction, img_address m_pc)
+static std::string SUB_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -14981,7 +14981,7 @@ std::string NMD::SUB_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB_S(uint64 instruction, img_address m_pc)
+static std::string SUB_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -15005,7 +15005,7 @@ std::string NMD::SUB_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_PH(uint64 instruction, img_address m_pc)
+static std::string SUBQ_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15030,7 +15030,7 @@ std::string NMD::SUBQ_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_S_PH(uint64 instruction, img_address m_pc)
+static std::string SUBQ_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15055,7 +15055,7 @@ std::string NMD::SUBQ_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_S_W(uint64 instruction, img_address m_pc)
+static std::string SUBQ_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15080,7 +15080,7 @@ std::string NMD::SUBQ_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_PH(uint64 instruction, img_address m_pc)
+static std::string SUBQH_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15105,7 +15105,7 @@ std::string NMD::SUBQH_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_R_PH(uint64 instruction, img_address m_pc)
+static std::string SUBQH_R_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15130,7 +15130,7 @@ std::string NMD::SUBQH_R_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_R_W(uint64 instruction, img_address m_pc)
+static std::string SUBQH_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15155,7 +15155,7 @@ std::string NMD::SUBQH_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_W(uint64 instruction, img_address m_pc)
+static std::string SUBQH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15179,7 +15179,7 @@ std::string NMD::SUBQH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_16_(uint64 instruction, img_address m_pc)
+static std::string SUBU_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -15203,7 +15203,7 @@ std::string NMD::SUBU_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_32_(uint64 instruction, img_address m_pc)
+static std::string SUBU_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15227,7 +15227,7 @@ std::string NMD::SUBU_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_PH(uint64 instruction, img_address m_pc)
+static std::string SUBU_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15251,7 +15251,7 @@ std::string NMD::SUBU_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_QB(uint64 instruction, img_address m_pc)
+static std::string SUBU_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15276,7 +15276,7 @@ std::string NMD::SUBU_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_S_PH(uint64 instruction, img_address m_pc)
+static std::string SUBU_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15301,7 +15301,7 @@ std::string NMD::SUBU_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_S_QB(uint64 instruction, img_address m_pc)
+static std::string SUBU_S_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15326,7 +15326,7 @@ std::string NMD::SUBU_S_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBUH_QB(uint64 instruction, img_address m_pc)
+static std::string SUBUH_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15351,7 +15351,7 @@ std::string NMD::SUBUH_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBUH_R_QB(uint64 instruction, img_address m_pc)
+static std::string SUBUH_R_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15375,7 +15375,7 @@ std::string NMD::SUBUH_R_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_16_(uint64 instruction, img_address m_pc)
+static std::string SW_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -15399,7 +15399,7 @@ std::string NMD::SW_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_4X4_(uint64 instruction, img_address m_pc)
+static std::string SW_4X4_(uint64 instruction, img_address m_pc)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -15423,7 +15423,7 @@ std::string NMD::SW_4X4_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_GP16_(uint64 instruction, img_address m_pc)
+static std::string SW_GP16_(uint64 instruction, img_address m_pc)
 {
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
@@ -15445,7 +15445,7 @@ std::string NMD::SW_GP16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_GP_(uint64 instruction, img_address m_pc)
+static std::string SW_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
@@ -15467,7 +15467,7 @@ std::string NMD::SW_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_S9_(uint64 instruction, img_address m_pc)
+static std::string SW_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
@@ -15491,7 +15491,7 @@ std::string NMD::SW_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_SP_(uint64 instruction, img_address m_pc)
+static std::string SW_SP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
@@ -15513,7 +15513,7 @@ std::string NMD::SW_SP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_U12_(uint64 instruction, img_address m_pc)
+static std::string SW_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15537,7 +15537,7 @@ std::string NMD::SW_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_GP_(uint64 instruction, img_address m_pc)
+static std::string SWC1_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -15559,7 +15559,7 @@ std::string NMD::SWC1_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_S9_(uint64 instruction, img_address m_pc)
+static std::string SWC1_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15583,7 +15583,7 @@ std::string NMD::SWC1_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_U12_(uint64 instruction, img_address m_pc)
+static std::string SWC1_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15607,7 +15607,7 @@ std::string NMD::SWC1_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1X(uint64 instruction, img_address m_pc)
+static std::string SWC1X(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15631,7 +15631,7 @@ std::string NMD::SWC1X(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1XS(uint64 instruction, img_address m_pc)
+static std::string SWC1XS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15655,7 +15655,7 @@ std::string NMD::SWC1XS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC2(uint64 instruction, img_address m_pc)
+static std::string SWC2(uint64 instruction, img_address m_pc)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15679,7 +15679,7 @@ std::string NMD::SWC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWE(uint64 instruction, img_address m_pc)
+static std::string SWE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15703,7 +15703,7 @@ std::string NMD::SWE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWM(uint64 instruction, img_address m_pc)
+static std::string SWM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15729,7 +15729,7 @@ std::string NMD::SWM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWPC_48_(uint64 instruction, img_address m_pc)
+static std::string SWPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -15751,7 +15751,7 @@ std::string NMD::SWPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWX(uint64 instruction, img_address m_pc)
+static std::string SWX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15775,7 +15775,7 @@ std::string NMD::SWX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWXS(uint64 instruction, img_address m_pc)
+static std::string SWXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15799,7 +15799,7 @@ std::string NMD::SWXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNC(uint64 instruction, img_address m_pc)
+static std::string SYNC(uint64 instruction, img_address m_pc)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
@@ -15819,7 +15819,7 @@ std::string NMD::SYNC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNCI(uint64 instruction, img_address m_pc)
+static std::string SYNCI(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
@@ -15841,7 +15841,7 @@ std::string NMD::SYNCI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNCIE(uint64 instruction, img_address m_pc)
+static std::string SYNCIE(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
@@ -15863,7 +15863,7 @@ std::string NMD::SYNCIE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYSCALL_16_(uint64 instruction, img_address m_pc)
+static std::string SYSCALL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
@@ -15881,7 +15881,7 @@ std::string NMD::SYSCALL_16_(uint64 instruction, img_address m_pc)
  *  00000000000010
  *           code ------------------
  */
-std::string NMD::SYSCALL_32_(uint64 instruction, img_address m_pc)
+static std::string SYSCALL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
@@ -15901,7 +15901,7 @@ std::string NMD::SYSCALL_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TEQ(uint64 instruction, img_address m_pc)
+static std::string TEQ(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15923,7 +15923,7 @@ std::string NMD::TEQ(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGINV(uint64 instruction, img_address m_pc)
+static std::string TLBGINV(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -15941,7 +15941,7 @@ std::string NMD::TLBGINV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGINVF(uint64 instruction, img_address m_pc)
+static std::string TLBGINVF(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -15959,7 +15959,7 @@ std::string NMD::TLBGINVF(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGP(uint64 instruction, img_address m_pc)
+static std::string TLBGP(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -15977,7 +15977,7 @@ std::string NMD::TLBGP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGR(uint64 instruction, img_address m_pc)
+static std::string TLBGR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -15995,7 +15995,7 @@ std::string NMD::TLBGR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGWI(uint64 instruction, img_address m_pc)
+static std::string TLBGWI(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16013,7 +16013,7 @@ std::string NMD::TLBGWI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGWR(uint64 instruction, img_address m_pc)
+static std::string TLBGWR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16031,7 +16031,7 @@ std::string NMD::TLBGWR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBINV(uint64 instruction, img_address m_pc)
+static std::string TLBINV(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16049,7 +16049,7 @@ std::string NMD::TLBINV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBINVF(uint64 instruction, img_address m_pc)
+static std::string TLBINVF(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16067,7 +16067,7 @@ std::string NMD::TLBINVF(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBP(uint64 instruction, img_address m_pc)
+static std::string TLBP(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16085,7 +16085,7 @@ std::string NMD::TLBP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBR(uint64 instruction, img_address m_pc)
+static std::string TLBR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16103,7 +16103,7 @@ std::string NMD::TLBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBWI(uint64 instruction, img_address m_pc)
+static std::string TLBWI(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16121,7 +16121,7 @@ std::string NMD::TLBWI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBWR(uint64 instruction, img_address m_pc)
+static std::string TLBWR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16139,7 +16139,7 @@ std::string NMD::TLBWR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TNE(uint64 instruction, img_address m_pc)
+static std::string TNE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16161,7 +16161,7 @@ std::string NMD::TNE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_L_D(uint64 instruction, img_address m_pc)
+static std::string TRUNC_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16183,7 +16183,7 @@ std::string NMD::TRUNC_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_L_S(uint64 instruction, img_address m_pc)
+static std::string TRUNC_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16205,7 +16205,7 @@ std::string NMD::TRUNC_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_W_D(uint64 instruction, img_address m_pc)
+static std::string TRUNC_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16227,7 +16227,7 @@ std::string NMD::TRUNC_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_W_S(uint64 instruction, img_address m_pc)
+static std::string TRUNC_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16249,7 +16249,7 @@ std::string NMD::TRUNC_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALDM(uint64 instruction, img_address m_pc)
+static std::string UALDM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16275,7 +16275,7 @@ std::string NMD::UALDM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALH(uint64 instruction, img_address m_pc)
+static std::string UALH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16299,7 +16299,7 @@ std::string NMD::UALH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALWM(uint64 instruction, img_address m_pc)
+static std::string UALWM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16325,7 +16325,7 @@ std::string NMD::UALWM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASDM(uint64 instruction, img_address m_pc)
+static std::string UASDM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16351,7 +16351,7 @@ std::string NMD::UASDM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASH(uint64 instruction, img_address m_pc)
+static std::string UASH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16375,7 +16375,7 @@ std::string NMD::UASH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASWM(uint64 instruction, img_address m_pc)
+static std::string UASWM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16401,7 +16401,7 @@ std::string NMD::UASWM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UDI(uint64 instruction, img_address m_pc)
+static std::string UDI(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
@@ -16419,7 +16419,7 @@ std::string NMD::UDI(uint64 instruction, img_address m_pc)
  *  001000          1100001101111111
  *   code ----------
  */
-std::string NMD::WAIT(uint64 instruction, img_address m_pc)
+static std::string WAIT(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
@@ -16439,7 +16439,7 @@ std::string NMD::WAIT(uint64 instruction, img_address m_pc)
  *     rt -----
  *        mask -------
  */
-std::string NMD::WRDSP(uint64 instruction, img_address m_pc)
+static std::string WRDSP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
@@ -16461,7 +16461,7 @@ std::string NMD::WRDSP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::WRPGPR(uint64 instruction, img_address m_pc)
+static std::string WRPGPR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16483,7 +16483,7 @@ std::string NMD::WRPGPR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XOR_16_(uint64 instruction, img_address m_pc)
+static std::string XOR_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -16505,7 +16505,7 @@ std::string NMD::XOR_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XOR_32_(uint64 instruction, img_address m_pc)
+static std::string XOR_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16529,7 +16529,7 @@ std::string NMD::XOR_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XORI(uint64 instruction, img_address m_pc)
+static std::string XORI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16552,7 +16552,7 @@ std::string NMD::XORI(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-std::string NMD::YIELD(uint64 instruction, img_address m_pc)
+static std::string YIELD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16669,26 +16669,26 @@ std::string NMD::YIELD(uint64 instruction, img_address m_pc)
 
 NMD::Pool NMD::P_SYSCALL[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfffc0000, 0x00080000, &NMD::SYSCALL_32_      , 0,
+       0xfffc0000, 0x00080000, &SYSCALL_32_      , 0,
        0x0                 },        /* SYSCALL[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfffc0000, 0x000c0000, &NMD::HYPCALL          , 0,
+       0xfffc0000, 0x000c0000, &HYPCALL          , 0,
        CP0_ | VZ_          },        /* HYPCALL */
 };
 
 
 NMD::Pool NMD::P_RI[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfff80000, 0x00000000, &NMD::SIGRIE           , 0,
+       0xfff80000, 0x00000000, &SIGRIE           , 0,
        0x0                 },        /* SIGRIE */
     { pool                , P_SYSCALL           , 2   , 32,
        0xfff80000, 0x00080000, 0                      , 0,
        0x0                 },        /* P.SYSCALL */
     { instruction         , 0                   , 0   , 32,
-       0xfff80000, 0x00100000, &NMD::BREAK_32_        , 0,
+       0xfff80000, 0x00100000, &BREAK_32_        , 0,
        0x0                 },        /* BREAK[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfff80000, 0x00180000, &NMD::SDBBP_32_        , 0,
+       0xfff80000, 0x00180000, &SDBBP_32_        , 0,
        EJTAG_              },        /* SDBBP[32] */
 };
 
@@ -16698,47 +16698,47 @@ NMD::Pool NMD::P_ADDIU[2] = {
        0xffe00000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.RI */
     { instruction         , 0                   , 0   , 32,
-       0xfc000000, 0x00000000, &NMD::ADDIU_32_        , &ADDIU_32__cond   ,
+       0xfc000000, 0x00000000, &ADDIU_32_        , &ADDIU_32__cond   ,
        0x0                 },        /* ADDIU[32] */
 };
 
 
 NMD::Pool NMD::P_TRAP[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000000, &NMD::TEQ              , 0,
+       0xfc0007ff, 0x20000000, &TEQ              , 0,
        XMMS_               },        /* TEQ */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000400, &NMD::TNE              , 0,
+       0xfc0007ff, 0x20000400, &TNE              , 0,
        XMMS_               },        /* TNE */
 };
 
 
 NMD::Pool NMD::P_CMOVE[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000210, &NMD::MOVZ             , 0,
+       0xfc0007ff, 0x20000210, &MOVZ             , 0,
        0x0                 },        /* MOVZ */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000610, &NMD::MOVN             , 0,
+       0xfc0007ff, 0x20000610, &MOVN             , 0,
        0x0                 },        /* MOVN */
 };
 
 
 NMD::Pool NMD::P_D_MT_VPE[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1f3fff, 0x20010ab0, &NMD::DMT              , 0,
+       0xfc1f3fff, 0x20010ab0, &DMT              , 0,
        MT_                 },        /* DMT */
     { instruction         , 0                   , 0   , 32,
-       0xfc1f3fff, 0x20000ab0, &NMD::DVPE             , 0,
+       0xfc1f3fff, 0x20000ab0, &DVPE             , 0,
        MT_                 },        /* DVPE */
 };
 
 
 NMD::Pool NMD::P_E_MT_VPE[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1f3fff, 0x20010eb0, &NMD::EMT              , 0,
+       0xfc1f3fff, 0x20010eb0, &EMT              , 0,
        MT_                 },        /* EMT */
     { instruction         , 0                   , 0   , 32,
-       0xfc1f3fff, 0x20000eb0, &NMD::EVPE             , 0,
+       0xfc1f3fff, 0x20000eb0, &EVPE             , 0,
        MT_                 },        /* EVPE */
 };
 
@@ -16783,10 +16783,10 @@ NMD::Pool NMD::P_MT_VPE[8] = {
 
 NMD::Pool NMD::P_DVP[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20000390, &NMD::DVP              , 0,
+       0xfc00ffff, 0x20000390, &DVP              , 0,
        0x0                 },        /* DVP */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20000790, &NMD::EVP              , 0,
+       0xfc00ffff, 0x20000790, &EVP              , 0,
        0x0                 },        /* EVP */
 };
 
@@ -16796,7 +16796,7 @@ NMD::Pool NMD::P_SLTU[2] = {
        0xfc00fbff, 0x20000390, 0                      , 0,
        0x0                 },        /* P.DVP */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000390, &NMD::SLTU             , &SLTU_cond        ,
+       0xfc0003ff, 0x20000390, &SLTU             , &SLTU_cond        ,
        0x0                 },        /* SLTU */
 };
 
@@ -16806,13 +16806,13 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000000, 0                      , 0,
        0x0                 },        /* P.TRAP */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000008, &NMD::SEB              , 0,
+       0xfc0003ff, 0x20000008, &SEB              , 0,
        XMMS_               },        /* SEB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000010, &NMD::SLLV             , 0,
+       0xfc0003ff, 0x20000010, &SLLV             , 0,
        0x0                 },        /* SLLV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000018, &NMD::MUL_32_          , 0,
+       0xfc0003ff, 0x20000018, &MUL_32_          , 0,
        0x0                 },        /* MUL[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000020, 0                      , 0,
@@ -16821,22 +16821,22 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000028, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(5) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000030, &NMD::MFC0             , 0,
+       0xfc0003ff, 0x20000030, &MFC0             , 0,
        0x0                 },        /* MFC0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000038, &NMD::MFHC0            , 0,
+       0xfc0003ff, 0x20000038, &MFHC0            , 0,
        CP0_ | MVH_         },        /* MFHC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000040, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(8) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000048, &NMD::SEH              , 0,
+       0xfc0003ff, 0x20000048, &SEH              , 0,
        0x0                 },        /* SEH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000050, &NMD::SRLV             , 0,
+       0xfc0003ff, 0x20000050, &SRLV             , 0,
        0x0                 },        /* SRLV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000058, &NMD::MUH              , 0,
+       0xfc0003ff, 0x20000058, &MUH              , 0,
        0x0                 },        /* MUH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000060, 0                      , 0,
@@ -16845,10 +16845,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000068, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(13) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000070, &NMD::MTC0             , 0,
+       0xfc0003ff, 0x20000070, &MTC0             , 0,
        CP0_                },        /* MTC0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000078, &NMD::MTHC0            , 0,
+       0xfc0003ff, 0x20000078, &MTHC0            , 0,
        CP0_ | MVH_         },        /* MTHC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000080, 0                      , 0,
@@ -16857,10 +16857,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000088, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(17) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000090, &NMD::SRAV             , 0,
+       0xfc0003ff, 0x20000090, &SRAV             , 0,
        0x0                 },        /* SRAV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000098, &NMD::MULU             , 0,
+       0xfc0003ff, 0x20000098, &MULU             , 0,
        0x0                 },        /* MULU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000a0, 0                      , 0,
@@ -16869,10 +16869,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200000a8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(21) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000b0, &NMD::MFGC0            , 0,
+       0xfc0003ff, 0x200000b0, &MFGC0            , 0,
        CP0_ | VZ_          },        /* MFGC0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000b8, &NMD::MFHGC0           , 0,
+       0xfc0003ff, 0x200000b8, &MFHGC0           , 0,
        CP0_ | VZ_ | MVH_   },        /* MFHGC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000c0, 0                      , 0,
@@ -16881,10 +16881,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200000c8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(25) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000d0, &NMD::ROTRV            , 0,
+       0xfc0003ff, 0x200000d0, &ROTRV            , 0,
        0x0                 },        /* ROTRV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000d8, &NMD::MUHU             , 0,
+       0xfc0003ff, 0x200000d8, &MUHU             , 0,
        0x0                 },        /* MUHU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000e0, 0                      , 0,
@@ -16893,10 +16893,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200000e8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(29) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000f0, &NMD::MTGC0            , 0,
+       0xfc0003ff, 0x200000f0, &MTGC0            , 0,
        CP0_ | VZ_          },        /* MTGC0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000f8, &NMD::MTHGC0           , 0,
+       0xfc0003ff, 0x200000f8, &MTHGC0           , 0,
        CP0_ | VZ_ | MVH_   },        /* MTHGC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000100, 0                      , 0,
@@ -16905,10 +16905,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000108, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(33) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000110, &NMD::ADD              , 0,
+       0xfc0003ff, 0x20000110, &ADD              , 0,
        XMMS_               },        /* ADD */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000118, &NMD::DIV              , 0,
+       0xfc0003ff, 0x20000118, &DIV              , 0,
        0x0                 },        /* DIV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000120, 0                      , 0,
@@ -16917,7 +16917,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000128, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(37) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000130, &NMD::DMFC0            , 0,
+       0xfc0003ff, 0x20000130, &DMFC0            , 0,
        CP0_ | MIPS64_      },        /* DMFC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000138, 0                      , 0,
@@ -16929,10 +16929,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000148, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(41) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000150, &NMD::ADDU_32_         , 0,
+       0xfc0003ff, 0x20000150, &ADDU_32_         , 0,
        0x0                 },        /* ADDU[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000158, &NMD::MOD              , 0,
+       0xfc0003ff, 0x20000158, &MOD              , 0,
        0x0                 },        /* MOD */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000160, 0                      , 0,
@@ -16941,7 +16941,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000168, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(45) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000170, &NMD::DMTC0            , 0,
+       0xfc0003ff, 0x20000170, &DMTC0            , 0,
        CP0_ | MIPS64_      },        /* DMTC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000178, 0                      , 0,
@@ -16953,10 +16953,10 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000188, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(49) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000190, &NMD::SUB              , 0,
+       0xfc0003ff, 0x20000190, &SUB              , 0,
        XMMS_               },        /* SUB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000198, &NMD::DIVU             , 0,
+       0xfc0003ff, 0x20000198, &DIVU             , 0,
        0x0                 },        /* DIVU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001a0, 0                      , 0,
@@ -16965,22 +16965,22 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200001a8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(53) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001b0, &NMD::DMFGC0           , 0,
+       0xfc0003ff, 0x200001b0, &DMFGC0           , 0,
        CP0_ | MIPS64_ | VZ_},        /* DMFGC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001b8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(55) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001c0, &NMD::RDHWR            , 0,
+       0xfc0003ff, 0x200001c0, &RDHWR            , 0,
        XMMS_               },        /* RDHWR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001c8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(57) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001d0, &NMD::SUBU_32_         , 0,
+       0xfc0003ff, 0x200001d0, &SUBU_32_         , 0,
        0x0                 },        /* SUBU[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001d8, &NMD::MODU             , 0,
+       0xfc0003ff, 0x200001d8, &MODU             , 0,
        0x0                 },        /* MODU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001e0, 0                      , 0,
@@ -16989,7 +16989,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200001e8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(61) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001f0, &NMD::DMTGC0           , 0,
+       0xfc0003ff, 0x200001f0, &DMTGC0           , 0,
        CP0_ | MIPS64_ | VZ_},        /* DMTGC0 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001f8, 0                      , 0,
@@ -17010,13 +17010,13 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000220, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(68) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000228, &NMD::FORK             , 0,
+       0xfc0003ff, 0x20000228, &FORK             , 0,
        MT_                 },        /* FORK */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000230, &NMD::MFTR             , 0,
+       0xfc0003ff, 0x20000230, &MFTR             , 0,
        MT_                 },        /* MFTR */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000238, &NMD::MFHTR            , 0,
+       0xfc0003ff, 0x20000238, &MFHTR            , 0,
        MT_                 },        /* MFHTR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000240, 0                      , 0,
@@ -17025,7 +17025,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000248, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(73) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000250, &NMD::AND_32_          , 0,
+       0xfc0003ff, 0x20000250, &AND_32_          , 0,
        0x0                 },        /* AND[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000258, 0                      , 0,
@@ -17034,13 +17034,13 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000260, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(76) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000268, &NMD::YIELD            , 0,
+       0xfc0003ff, 0x20000268, &YIELD            , 0,
        MT_                 },        /* YIELD */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000270, &NMD::MTTR             , 0,
+       0xfc0003ff, 0x20000270, &MTTR             , 0,
        MT_                 },        /* MTTR */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000278, &NMD::MTHTR            , 0,
+       0xfc0003ff, 0x20000278, &MTHTR            , 0,
        MT_                 },        /* MTHTR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000280, 0                      , 0,
@@ -17049,7 +17049,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000288, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(81) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000290, &NMD::OR_32_           , 0,
+       0xfc0003ff, 0x20000290, &OR_32_           , 0,
        0x0                 },        /* OR[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000298, 0                      , 0,
@@ -17073,7 +17073,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200002c8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(89) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200002d0, &NMD::NOR              , 0,
+       0xfc0003ff, 0x200002d0, &NOR              , 0,
        0x0                 },        /* NOR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200002d8, 0                      , 0,
@@ -17097,7 +17097,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000308, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(97) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000310, &NMD::XOR_32_          , 0,
+       0xfc0003ff, 0x20000310, &XOR_32_          , 0,
        0x0                 },        /* XOR[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000318, 0                      , 0,
@@ -17121,7 +17121,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x20000348, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(105) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000350, &NMD::SLT              , 0,
+       0xfc0003ff, 0x20000350, &SLT              , 0,
        0x0                 },        /* SLT */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000358, 0                      , 0,
@@ -17169,7 +17169,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
        0xfc0003ff, 0x200003c8, 0                      , 0,
        0x0                 },        /* _POOL32A0~*(121) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200003d0, &NMD::SOV              , 0,
+       0xfc0003ff, 0x200003d0, &SOV              , 0,
        0x0                 },        /* SOV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200003d8, 0                      , 0,
@@ -17191,183 +17191,183 @@ NMD::Pool NMD::_POOL32A0[128] = {
 
 NMD::Pool NMD::ADDQ__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000000d, &NMD::ADDQ_PH          , 0,
+       0xfc0007ff, 0x2000000d, &ADDQ_PH          , 0,
        DSP_                },        /* ADDQ.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000040d, &NMD::ADDQ_S_PH        , 0,
+       0xfc0007ff, 0x2000040d, &ADDQ_S_PH        , 0,
        DSP_                },        /* ADDQ_S.PH */
 };
 
 
 NMD::Pool NMD::MUL__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000002d, &NMD::MUL_PH           , 0,
+       0xfc0007ff, 0x2000002d, &MUL_PH           , 0,
        DSP_                },        /* MUL.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000042d, &NMD::MUL_S_PH         , 0,
+       0xfc0007ff, 0x2000042d, &MUL_S_PH         , 0,
        DSP_                },        /* MUL_S.PH */
 };
 
 
 NMD::Pool NMD::ADDQH__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000004d, &NMD::ADDQH_PH         , 0,
+       0xfc0007ff, 0x2000004d, &ADDQH_PH         , 0,
        DSP_                },        /* ADDQH.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000044d, &NMD::ADDQH_R_PH       , 0,
+       0xfc0007ff, 0x2000044d, &ADDQH_R_PH       , 0,
        DSP_                },        /* ADDQH_R.PH */
 };
 
 
 NMD::Pool NMD::ADDQH__R__W[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000008d, &NMD::ADDQH_W          , 0,
+       0xfc0007ff, 0x2000008d, &ADDQH_W          , 0,
        DSP_                },        /* ADDQH.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000048d, &NMD::ADDQH_R_W        , 0,
+       0xfc0007ff, 0x2000048d, &ADDQH_R_W        , 0,
        DSP_                },        /* ADDQH_R.W */
 };
 
 
 NMD::Pool NMD::ADDU__S__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200000cd, &NMD::ADDU_QB          , 0,
+       0xfc0007ff, 0x200000cd, &ADDU_QB          , 0,
        DSP_                },        /* ADDU.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200004cd, &NMD::ADDU_S_QB        , 0,
+       0xfc0007ff, 0x200004cd, &ADDU_S_QB        , 0,
        DSP_                },        /* ADDU_S.QB */
 };
 
 
 NMD::Pool NMD::ADDU__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000010d, &NMD::ADDU_PH          , 0,
+       0xfc0007ff, 0x2000010d, &ADDU_PH          , 0,
        DSP_                },        /* ADDU.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000050d, &NMD::ADDU_S_PH        , 0,
+       0xfc0007ff, 0x2000050d, &ADDU_S_PH        , 0,
        DSP_                },        /* ADDU_S.PH */
 };
 
 
 NMD::Pool NMD::ADDUH__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000014d, &NMD::ADDUH_QB         , 0,
+       0xfc0007ff, 0x2000014d, &ADDUH_QB         , 0,
        DSP_                },        /* ADDUH.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000054d, &NMD::ADDUH_R_QB       , 0,
+       0xfc0007ff, 0x2000054d, &ADDUH_R_QB       , 0,
        DSP_                },        /* ADDUH_R.QB */
 };
 
 
 NMD::Pool NMD::SHRAV__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000018d, &NMD::SHRAV_PH         , 0,
+       0xfc0007ff, 0x2000018d, &SHRAV_PH         , 0,
        DSP_                },        /* SHRAV.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000058d, &NMD::SHRAV_R_PH       , 0,
+       0xfc0007ff, 0x2000058d, &SHRAV_R_PH       , 0,
        DSP_                },        /* SHRAV_R.PH */
 };
 
 
 NMD::Pool NMD::SHRAV__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200001cd, &NMD::SHRAV_QB         , 0,
+       0xfc0007ff, 0x200001cd, &SHRAV_QB         , 0,
        DSP_                },        /* SHRAV.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200005cd, &NMD::SHRAV_R_QB       , 0,
+       0xfc0007ff, 0x200005cd, &SHRAV_R_QB       , 0,
        DSP_                },        /* SHRAV_R.QB */
 };
 
 
 NMD::Pool NMD::SUBQ__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000020d, &NMD::SUBQ_PH          , 0,
+       0xfc0007ff, 0x2000020d, &SUBQ_PH          , 0,
        DSP_                },        /* SUBQ.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000060d, &NMD::SUBQ_S_PH        , 0,
+       0xfc0007ff, 0x2000060d, &SUBQ_S_PH        , 0,
        DSP_                },        /* SUBQ_S.PH */
 };
 
 
 NMD::Pool NMD::SUBQH__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000024d, &NMD::SUBQH_PH         , 0,
+       0xfc0007ff, 0x2000024d, &SUBQH_PH         , 0,
        DSP_                },        /* SUBQH.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000064d, &NMD::SUBQH_R_PH       , 0,
+       0xfc0007ff, 0x2000064d, &SUBQH_R_PH       , 0,
        DSP_                },        /* SUBQH_R.PH */
 };
 
 
 NMD::Pool NMD::SUBQH__R__W[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000028d, &NMD::SUBQH_W          , 0,
+       0xfc0007ff, 0x2000028d, &SUBQH_W          , 0,
        DSP_                },        /* SUBQH.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000068d, &NMD::SUBQH_R_W        , 0,
+       0xfc0007ff, 0x2000068d, &SUBQH_R_W        , 0,
        DSP_                },        /* SUBQH_R.W */
 };
 
 
 NMD::Pool NMD::SUBU__S__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200002cd, &NMD::SUBU_QB          , 0,
+       0xfc0007ff, 0x200002cd, &SUBU_QB          , 0,
        DSP_                },        /* SUBU.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200006cd, &NMD::SUBU_S_QB        , 0,
+       0xfc0007ff, 0x200006cd, &SUBU_S_QB        , 0,
        DSP_                },        /* SUBU_S.QB */
 };
 
 
 NMD::Pool NMD::SUBU__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000030d, &NMD::SUBU_PH          , 0,
+       0xfc0007ff, 0x2000030d, &SUBU_PH          , 0,
        DSP_                },        /* SUBU.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000070d, &NMD::SUBU_S_PH        , 0,
+       0xfc0007ff, 0x2000070d, &SUBU_S_PH        , 0,
        DSP_                },        /* SUBU_S.PH */
 };
 
 
 NMD::Pool NMD::SHRA__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000335, &NMD::SHRA_PH          , 0,
+       0xfc0007ff, 0x20000335, &SHRA_PH          , 0,
        DSP_                },        /* SHRA.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000735, &NMD::SHRA_R_PH        , 0,
+       0xfc0007ff, 0x20000735, &SHRA_R_PH        , 0,
        DSP_                },        /* SHRA_R.PH */
 };
 
 
 NMD::Pool NMD::SUBUH__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000034d, &NMD::SUBUH_QB         , 0,
+       0xfc0007ff, 0x2000034d, &SUBUH_QB         , 0,
        DSP_                },        /* SUBUH.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000074d, &NMD::SUBUH_R_QB       , 0,
+       0xfc0007ff, 0x2000074d, &SUBUH_R_QB       , 0,
        DSP_                },        /* SUBUH_R.QB */
 };
 
 
 NMD::Pool NMD::SHLLV__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000038d, &NMD::SHLLV_PH         , 0,
+       0xfc0007ff, 0x2000038d, &SHLLV_PH         , 0,
        DSP_                },        /* SHLLV.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x2000078d, &NMD::SHLLV_S_PH       , 0,
+       0xfc0007ff, 0x2000078d, &SHLLV_S_PH       , 0,
        DSP_                },        /* SHLLV_S.PH */
 };
 
 
 NMD::Pool NMD::SHLL__S__PH[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000fff, 0x200003b5, &NMD::SHLL_PH          , 0,
+       0xfc000fff, 0x200003b5, &SHLL_PH          , 0,
        DSP_                },        /* SHLL.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000fff, 0x200007b5, 0                      , 0,
        0x0                 },        /* SHLL[_S].PH~*(1) */
     { instruction         , 0                   , 0   , 32,
-       0xfc000fff, 0x20000bb5, &NMD::SHLL_S_PH        , 0,
+       0xfc000fff, 0x20000bb5, &SHLL_S_PH        , 0,
        DSP_                },        /* SHLL_S.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000fff, 0x20000fb5, 0                      , 0,
@@ -17377,17 +17377,17 @@ NMD::Pool NMD::SHLL__S__PH[4] = {
 
 NMD::Pool NMD::PRECR_SRA__R__PH_W[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200003cd, &NMD::PRECR_SRA_PH_W   , 0,
+       0xfc0007ff, 0x200003cd, &PRECR_SRA_PH_W   , 0,
        DSP_                },        /* PRECR_SRA.PH.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200007cd, &NMD::PRECR_SRA_R_PH_W , 0,
+       0xfc0007ff, 0x200007cd, &PRECR_SRA_R_PH_W , 0,
        DSP_                },        /* PRECR_SRA_R.PH.W */
 };
 
 
 NMD::Pool NMD::_POOL32A5[128] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000005, &NMD::CMP_EQ_PH        , 0,
+       0xfc0003ff, 0x20000005, &CMP_EQ_PH        , 0,
        DSP_                },        /* CMP.EQ.PH */
     { pool                , ADDQ__S__PH         , 2   , 32,
        0xfc0003ff, 0x2000000d, 0                      , 0,
@@ -17396,10 +17396,10 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000015, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(2) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000001d, &NMD::SHILO            , 0,
+       0xfc0003ff, 0x2000001d, &SHILO            , 0,
        DSP_                },        /* SHILO */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000025, &NMD::MULEQ_S_W_PHL    , 0,
+       0xfc0003ff, 0x20000025, &MULEQ_S_W_PHL    , 0,
        DSP_                },        /* MULEQ_S.W.PHL */
     { pool                , MUL__S__PH          , 2   , 32,
        0xfc0003ff, 0x2000002d, 0                      , 0,
@@ -17408,10 +17408,10 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000035, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(6) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000003d, &NMD::REPL_PH          , 0,
+       0xfc0003ff, 0x2000003d, &REPL_PH          , 0,
        DSP_                },        /* REPL.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000045, &NMD::CMP_LT_PH        , 0,
+       0xfc0003ff, 0x20000045, &CMP_LT_PH        , 0,
        DSP_                },        /* CMP.LT.PH */
     { pool                , ADDQH__R__PH        , 2   , 32,
        0xfc0003ff, 0x2000004d, 0                      , 0,
@@ -17423,10 +17423,10 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000005d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(11) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000065, &NMD::MULEQ_S_W_PHR    , 0,
+       0xfc0003ff, 0x20000065, &MULEQ_S_W_PHR    , 0,
        DSP_                },        /* MULEQ_S.W.PHR */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000006d, &NMD::PRECR_QB_PH      , 0,
+       0xfc0003ff, 0x2000006d, &PRECR_QB_PH      , 0,
        DSP_                },        /* PRECR.QB.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000075, 0                      , 0,
@@ -17435,13 +17435,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000007d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000085, &NMD::CMP_LE_PH        , 0,
+       0xfc0003ff, 0x20000085, &CMP_LE_PH        , 0,
        DSP_                },        /* CMP.LE.PH */
     { pool                , ADDQH__R__W         , 2   , 32,
        0xfc0003ff, 0x2000008d, 0                      , 0,
        0x0                 },        /* ADDQH[_R].W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000095, &NMD::MULEU_S_PH_QBL   , 0,
+       0xfc0003ff, 0x20000095, &MULEU_S_PH_QBL   , 0,
        DSP_                },        /* MULEU_S.PH.QBL */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000009d, 0                      , 0,
@@ -17450,7 +17450,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200000a5, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(20) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000ad, &NMD::PRECRQ_QB_PH     , 0,
+       0xfc0003ff, 0x200000ad, &PRECRQ_QB_PH     , 0,
        DSP_                },        /* PRECRQ.QB.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000b5, 0                      , 0,
@@ -17459,13 +17459,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200000bd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(23) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000c5, &NMD::CMPGU_EQ_QB      , 0,
+       0xfc0003ff, 0x200000c5, &CMPGU_EQ_QB      , 0,
        DSP_                },        /* CMPGU.EQ.QB */
     { pool                , ADDU__S__QB         , 2   , 32,
        0xfc0003ff, 0x200000cd, 0                      , 0,
        0x0                 },        /* ADDU[_S].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000d5, &NMD::MULEU_S_PH_QBR   , 0,
+       0xfc0003ff, 0x200000d5, &MULEU_S_PH_QBR   , 0,
        DSP_                },        /* MULEU_S.PH.QBR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000dd, 0                      , 0,
@@ -17474,7 +17474,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200000e5, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(28) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200000ed, &NMD::PRECRQ_PH_W      , 0,
+       0xfc0003ff, 0x200000ed, &PRECRQ_PH_W      , 0,
        DSP_                },        /* PRECRQ.PH.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200000f5, 0                      , 0,
@@ -17483,13 +17483,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200000fd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(31) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000105, &NMD::CMPGU_LT_QB      , 0,
+       0xfc0003ff, 0x20000105, &CMPGU_LT_QB      , 0,
        DSP_                },        /* CMPGU.LT.QB */
     { pool                , ADDU__S__PH         , 2   , 32,
        0xfc0003ff, 0x2000010d, 0                      , 0,
        0x0                 },        /* ADDU[_S].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000115, &NMD::MULQ_RS_PH       , 0,
+       0xfc0003ff, 0x20000115, &MULQ_RS_PH       , 0,
        DSP_                },        /* MULQ_RS.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000011d, 0                      , 0,
@@ -17498,7 +17498,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000125, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(36) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000012d, &NMD::PRECRQ_RS_PH_W   , 0,
+       0xfc0003ff, 0x2000012d, &PRECRQ_RS_PH_W   , 0,
        DSP_                },        /* PRECRQ_RS.PH.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000135, 0                      , 0,
@@ -17507,13 +17507,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000013d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(39) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000145, &NMD::CMPGU_LE_QB      , 0,
+       0xfc0003ff, 0x20000145, &CMPGU_LE_QB      , 0,
        DSP_                },        /* CMPGU.LE.QB */
     { pool                , ADDUH__R__QB        , 2   , 32,
        0xfc0003ff, 0x2000014d, 0                      , 0,
        0x0                 },        /* ADDUH[_R].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000155, &NMD::MULQ_S_PH        , 0,
+       0xfc0003ff, 0x20000155, &MULQ_S_PH        , 0,
        DSP_                },        /* MULQ_S.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000015d, 0                      , 0,
@@ -17522,7 +17522,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000165, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(44) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000016d, &NMD::PRECRQU_S_QB_PH  , 0,
+       0xfc0003ff, 0x2000016d, &PRECRQU_S_QB_PH  , 0,
        DSP_                },        /* PRECRQU_S.QB.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000175, 0                      , 0,
@@ -17531,13 +17531,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000017d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(47) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000185, &NMD::CMPGDU_EQ_QB     , 0,
+       0xfc0003ff, 0x20000185, &CMPGDU_EQ_QB     , 0,
        DSP_                },        /* CMPGDU.EQ.QB */
     { pool                , SHRAV__R__PH        , 2   , 32,
        0xfc0003ff, 0x2000018d, 0                      , 0,
        0x0                 },        /* SHRAV[_R].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000195, &NMD::MULQ_RS_W        , 0,
+       0xfc0003ff, 0x20000195, &MULQ_RS_W        , 0,
        DSP_                },        /* MULQ_RS.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000019d, 0                      , 0,
@@ -17546,7 +17546,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200001a5, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(52) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001ad, &NMD::PACKRL_PH        , 0,
+       0xfc0003ff, 0x200001ad, &PACKRL_PH        , 0,
        DSP_                },        /* PACKRL.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001b5, 0                      , 0,
@@ -17555,13 +17555,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200001bd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(55) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001c5, &NMD::CMPGDU_LT_QB     , 0,
+       0xfc0003ff, 0x200001c5, &CMPGDU_LT_QB     , 0,
        DSP_                },        /* CMPGDU.LT.QB */
     { pool                , SHRAV__R__QB        , 2   , 32,
        0xfc0003ff, 0x200001cd, 0                      , 0,
        0x0                 },        /* SHRAV[_R].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001d5, &NMD::MULQ_S_W         , 0,
+       0xfc0003ff, 0x200001d5, &MULQ_S_W         , 0,
        DSP_                },        /* MULQ_S.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001dd, 0                      , 0,
@@ -17570,7 +17570,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200001e5, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(60) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200001ed, &NMD::PICK_QB          , 0,
+       0xfc0003ff, 0x200001ed, &PICK_QB          , 0,
        DSP_                },        /* PICK.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200001f5, 0                      , 0,
@@ -17579,13 +17579,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200001fd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(63) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000205, &NMD::CMPGDU_LE_QB     , 0,
+       0xfc0003ff, 0x20000205, &CMPGDU_LE_QB     , 0,
        DSP_                },        /* CMPGDU.LE.QB */
     { pool                , SUBQ__S__PH         , 2   , 32,
        0xfc0003ff, 0x2000020d, 0                      , 0,
        0x0                 },        /* SUBQ[_S].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000215, &NMD::APPEND           , 0,
+       0xfc0003ff, 0x20000215, &APPEND           , 0,
        DSP_                },        /* APPEND */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000021d, 0                      , 0,
@@ -17594,7 +17594,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x20000225, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(68) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x2000022d, &NMD::PICK_PH          , 0,
+       0xfc0003ff, 0x2000022d, &PICK_PH          , 0,
        DSP_                },        /* PICK.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x20000235, 0                      , 0,
@@ -17603,13 +17603,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000023d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(71) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000245, &NMD::CMPU_EQ_QB       , 0,
+       0xfc0003ff, 0x20000245, &CMPU_EQ_QB       , 0,
        DSP_                },        /* CMPU.EQ.QB */
     { pool                , SUBQH__R__PH        , 2   , 32,
        0xfc0003ff, 0x2000024d, 0                      , 0,
        0x0                 },        /* SUBQH[_R].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000255, &NMD::PREPEND          , 0,
+       0xfc0003ff, 0x20000255, &PREPEND          , 0,
        DSP_                },        /* PREPEND */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000025d, 0                      , 0,
@@ -17627,13 +17627,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000027d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(79) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000285, &NMD::CMPU_LT_QB       , 0,
+       0xfc0003ff, 0x20000285, &CMPU_LT_QB       , 0,
        DSP_                },        /* CMPU.LT.QB */
     { pool                , SUBQH__R__W         , 2   , 32,
        0xfc0003ff, 0x2000028d, 0                      , 0,
        0x0                 },        /* SUBQH[_R].W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000295, &NMD::MODSUB           , 0,
+       0xfc0003ff, 0x20000295, &MODSUB           , 0,
        DSP_                },        /* MODSUB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000029d, 0                      , 0,
@@ -17651,13 +17651,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200002bd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(87) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200002c5, &NMD::CMPU_LE_QB       , 0,
+       0xfc0003ff, 0x200002c5, &CMPU_LE_QB       , 0,
        DSP_                },        /* CMPU.LE.QB */
     { pool                , SUBU__S__QB         , 2   , 32,
        0xfc0003ff, 0x200002cd, 0                      , 0,
        0x0                 },        /* SUBU[_S].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200002d5, &NMD::SHRAV_R_W        , 0,
+       0xfc0003ff, 0x200002d5, &SHRAV_R_W        , 0,
        DSP_                },        /* SHRAV_R.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200002dd, 0                      , 0,
@@ -17669,19 +17669,19 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200002ed, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(93) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200002f5, &NMD::SHRA_R_W         , 0,
+       0xfc0003ff, 0x200002f5, &SHRA_R_W         , 0,
        DSP_                },        /* SHRA_R.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200002fd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(95) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000305, &NMD::ADDQ_S_W         , 0,
+       0xfc0003ff, 0x20000305, &ADDQ_S_W         , 0,
        DSP_                },        /* ADDQ_S.W */
     { pool                , SUBU__S__PH         , 2   , 32,
        0xfc0003ff, 0x2000030d, 0                      , 0,
        0x0                 },        /* SUBU[_S].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000315, &NMD::SHRLV_PH         , 0,
+       0xfc0003ff, 0x20000315, &SHRLV_PH         , 0,
        DSP_                },        /* SHRLV.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000031d, 0                      , 0,
@@ -17699,13 +17699,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000033d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(103) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000345, &NMD::SUBQ_S_W         , 0,
+       0xfc0003ff, 0x20000345, &SUBQ_S_W         , 0,
        DSP_                },        /* SUBQ_S.W */
     { pool                , SUBUH__R__QB        , 2   , 32,
        0xfc0003ff, 0x2000034d, 0                      , 0,
        0x0                 },        /* SUBUH[_R].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000355, &NMD::SHRLV_QB         , 0,
+       0xfc0003ff, 0x20000355, &SHRLV_QB         , 0,
        DSP_                },        /* SHRLV.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000035d, 0                      , 0,
@@ -17723,13 +17723,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x2000037d, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(111) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000385, &NMD::ADDSC            , 0,
+       0xfc0003ff, 0x20000385, &ADDSC            , 0,
        DSP_                },        /* ADDSC */
     { pool                , SHLLV__S__PH        , 2   , 32,
        0xfc0003ff, 0x2000038d, 0                      , 0,
        0x0                 },        /* SHLLV[_S].PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x20000395, &NMD::SHLLV_QB         , 0,
+       0xfc0003ff, 0x20000395, &SHLLV_QB         , 0,
        DSP_                },        /* SHLLV.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x2000039d, 0                      , 0,
@@ -17747,13 +17747,13 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200003bd, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(119) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200003c5, &NMD::ADDWC            , 0,
+       0xfc0003ff, 0x200003c5, &ADDWC            , 0,
        DSP_                },        /* ADDWC */
     { pool                , PRECR_SRA__R__PH_W  , 2   , 32,
        0xfc0003ff, 0x200003cd, 0                      , 0,
        0x0                 },        /* PRECR_SRA[_R].PH.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200003d5, &NMD::SHLLV_S_W        , 0,
+       0xfc0003ff, 0x200003d5, &SHLLV_S_W        , 0,
        DSP_                },        /* SHLLV_S.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200003dd, 0                      , 0,
@@ -17765,7 +17765,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
        0xfc0003ff, 0x200003ed, 0                      , 0,
        0x0                 },        /* _POOL32A5~*(125) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0x200003f5, &NMD::SHLL_S_W         , 0,
+       0xfc0003ff, 0x200003f5, &SHLL_S_W         , 0,
        DSP_                },        /* SHLL_S.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0x200003fd, 0                      , 0,
@@ -17775,52 +17775,52 @@ NMD::Pool NMD::_POOL32A5[128] = {
 
 NMD::Pool NMD::PP_LSX[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000007, &NMD::LBX              , 0,
+       0xfc0007ff, 0x20000007, &LBX              , 0,
        0x0                 },        /* LBX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000087, &NMD::SBX              , 0,
+       0xfc0007ff, 0x20000087, &SBX              , 0,
        XMMS_               },        /* SBX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000107, &NMD::LBUX             , 0,
+       0xfc0007ff, 0x20000107, &LBUX             , 0,
        0x0                 },        /* LBUX */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0x20000187, 0                      , 0,
        0x0                 },        /* PP.LSX~*(3) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000207, &NMD::LHX              , 0,
+       0xfc0007ff, 0x20000207, &LHX              , 0,
        0x0                 },        /* LHX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000287, &NMD::SHX              , 0,
+       0xfc0007ff, 0x20000287, &SHX              , 0,
        XMMS_               },        /* SHX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000307, &NMD::LHUX             , 0,
+       0xfc0007ff, 0x20000307, &LHUX             , 0,
        0x0                 },        /* LHUX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000387, &NMD::LWUX             , 0,
+       0xfc0007ff, 0x20000387, &LWUX             , 0,
        MIPS64_             },        /* LWUX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000407, &NMD::LWX              , 0,
+       0xfc0007ff, 0x20000407, &LWX              , 0,
        0x0                 },        /* LWX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000487, &NMD::SWX              , 0,
+       0xfc0007ff, 0x20000487, &SWX              , 0,
        XMMS_               },        /* SWX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000507, &NMD::LWC1X            , 0,
+       0xfc0007ff, 0x20000507, &LWC1X            , 0,
        CP1_                },        /* LWC1X */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000587, &NMD::SWC1X            , 0,
+       0xfc0007ff, 0x20000587, &SWC1X            , 0,
        CP1_                },        /* SWC1X */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000607, &NMD::LDX              , 0,
+       0xfc0007ff, 0x20000607, &LDX              , 0,
        MIPS64_             },        /* LDX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000687, &NMD::SDX              , 0,
+       0xfc0007ff, 0x20000687, &SDX              , 0,
        MIPS64_             },        /* SDX */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000707, &NMD::LDC1X            , 0,
+       0xfc0007ff, 0x20000707, &LDC1X            , 0,
        CP1_                },        /* LDC1X */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000787, &NMD::SDC1X            , 0,
+       0xfc0007ff, 0x20000787, &SDC1X            , 0,
        CP1_                },        /* SDC1X */
 };
 
@@ -17839,40 +17839,40 @@ NMD::Pool NMD::PP_LSXS[16] = {
        0xfc0007ff, 0x200001c7, 0                      , 0,
        0x0                 },        /* PP.LSXS~*(3) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000247, &NMD::LHXS             , 0,
+       0xfc0007ff, 0x20000247, &LHXS             , 0,
        0x0                 },        /* LHXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200002c7, &NMD::SHXS             , 0,
+       0xfc0007ff, 0x200002c7, &SHXS             , 0,
        XMMS_               },        /* SHXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000347, &NMD::LHUXS            , 0,
+       0xfc0007ff, 0x20000347, &LHUXS            , 0,
        0x0                 },        /* LHUXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200003c7, &NMD::LWUXS            , 0,
+       0xfc0007ff, 0x200003c7, &LWUXS            , 0,
        MIPS64_             },        /* LWUXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000447, &NMD::LWXS_32_         , 0,
+       0xfc0007ff, 0x20000447, &LWXS_32_         , 0,
        0x0                 },        /* LWXS[32] */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200004c7, &NMD::SWXS             , 0,
+       0xfc0007ff, 0x200004c7, &SWXS             , 0,
        XMMS_               },        /* SWXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000547, &NMD::LWC1XS           , 0,
+       0xfc0007ff, 0x20000547, &LWC1XS           , 0,
        CP1_                },        /* LWC1XS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200005c7, &NMD::SWC1XS           , 0,
+       0xfc0007ff, 0x200005c7, &SWC1XS           , 0,
        CP1_                },        /* SWC1XS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000647, &NMD::LDXS             , 0,
+       0xfc0007ff, 0x20000647, &LDXS             , 0,
        MIPS64_             },        /* LDXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200006c7, &NMD::SDXS             , 0,
+       0xfc0007ff, 0x200006c7, &SDXS             , 0,
        MIPS64_             },        /* SDXS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x20000747, &NMD::LDC1XS           , 0,
+       0xfc0007ff, 0x20000747, &LDC1XS           , 0,
        CP1_                },        /* LDC1XS */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0x200007c7, &NMD::SDC1XS           , 0,
+       0xfc0007ff, 0x200007c7, &SDC1XS           , 0,
        CP1_                },        /* SDC1XS */
 };
 
@@ -17889,26 +17889,26 @@ NMD::Pool NMD::P_LSX[2] = {
 
 NMD::Pool NMD::POOL32Axf_1_0[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000007f, &NMD::MFHI_DSP_        , 0,
+       0xfc003fff, 0x2000007f, &MFHI_DSP_        , 0,
        DSP_                },        /* MFHI[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000107f, &NMD::MFLO_DSP_        , 0,
+       0xfc003fff, 0x2000107f, &MFLO_DSP_        , 0,
        DSP_                },        /* MFLO[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000207f, &NMD::MTHI_DSP_        , 0,
+       0xfc003fff, 0x2000207f, &MTHI_DSP_        , 0,
        DSP_                },        /* MTHI[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000307f, &NMD::MTLO_DSP_        , 0,
+       0xfc003fff, 0x2000307f, &MTLO_DSP_        , 0,
        DSP_                },        /* MTLO[DSP] */
 };
 
 
 NMD::Pool NMD::POOL32Axf_1_1[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000027f, &NMD::MTHLIP           , 0,
+       0xfc003fff, 0x2000027f, &MTHLIP           , 0,
        DSP_                },        /* MTHLIP */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000127f, &NMD::SHILOV           , 0,
+       0xfc003fff, 0x2000127f, &SHILOV           , 0,
        DSP_                },        /* SHILOV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0x2000227f, 0                      , 0,
@@ -17921,46 +17921,46 @@ NMD::Pool NMD::POOL32Axf_1_1[4] = {
 
 NMD::Pool NMD::POOL32Axf_1_3[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000067f, &NMD::RDDSP            , 0,
+       0xfc003fff, 0x2000067f, &RDDSP            , 0,
        DSP_                },        /* RDDSP */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000167f, &NMD::WRDSP            , 0,
+       0xfc003fff, 0x2000167f, &WRDSP            , 0,
        DSP_                },        /* WRDSP */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000267f, &NMD::EXTP             , 0,
+       0xfc003fff, 0x2000267f, &EXTP             , 0,
        DSP_                },        /* EXTP */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x2000367f, &NMD::EXTPDP           , 0,
+       0xfc003fff, 0x2000367f, &EXTPDP           , 0,
        DSP_                },        /* EXTPDP */
 };
 
 
 NMD::Pool NMD::POOL32Axf_1_4[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc001fff, 0x2000087f, &NMD::SHLL_QB          , 0,
+       0xfc001fff, 0x2000087f, &SHLL_QB          , 0,
        DSP_                },        /* SHLL.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc001fff, 0x2000187f, &NMD::SHRL_QB          , 0,
+       0xfc001fff, 0x2000187f, &SHRL_QB          , 0,
        DSP_                },        /* SHRL.QB */
 };
 
 
 NMD::Pool NMD::MAQ_S_A__W_PHR[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000a7f, &NMD::MAQ_S_W_PHR      , 0,
+       0xfc003fff, 0x20000a7f, &MAQ_S_W_PHR      , 0,
        DSP_                },        /* MAQ_S.W.PHR */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002a7f, &NMD::MAQ_SA_W_PHR     , 0,
+       0xfc003fff, 0x20002a7f, &MAQ_SA_W_PHR     , 0,
        DSP_                },        /* MAQ_SA.W.PHR */
 };
 
 
 NMD::Pool NMD::MAQ_S_A__W_PHL[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001a7f, &NMD::MAQ_S_W_PHL      , 0,
+       0xfc003fff, 0x20001a7f, &MAQ_S_W_PHL      , 0,
        DSP_                },        /* MAQ_S.W.PHL */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003a7f, &NMD::MAQ_SA_W_PHL     , 0,
+       0xfc003fff, 0x20003a7f, &MAQ_SA_W_PHL     , 0,
        DSP_                },        /* MAQ_SA.W.PHL */
 };
 
@@ -17977,16 +17977,16 @@ NMD::Pool NMD::POOL32Axf_1_5[2] = {
 
 NMD::Pool NMD::POOL32Axf_1_7[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000e7f, &NMD::EXTR_W           , 0,
+       0xfc003fff, 0x20000e7f, &EXTR_W           , 0,
        DSP_                },        /* EXTR.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001e7f, &NMD::EXTR_R_W         , 0,
+       0xfc003fff, 0x20001e7f, &EXTR_R_W         , 0,
        DSP_                },        /* EXTR_R.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002e7f, &NMD::EXTR_RS_W        , 0,
+       0xfc003fff, 0x20002e7f, &EXTR_RS_W        , 0,
        DSP_                },        /* EXTR_RS.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003e7f, &NMD::EXTR_S_H         , 0,
+       0xfc003fff, 0x20003e7f, &EXTR_S_H         , 0,
        DSP_                },        /* EXTR_S.H */
 };
 
@@ -18021,112 +18021,112 @@ NMD::Pool NMD::POOL32Axf_1[8] = {
 
 NMD::Pool NMD::POOL32Axf_2_DSP__0_7[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200000bf, &NMD::DPA_W_PH         , 0,
+       0xfc003fff, 0x200000bf, &DPA_W_PH         , 0,
        DSP_                },        /* DPA.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200002bf, &NMD::DPAQ_S_W_PH      , 0,
+       0xfc003fff, 0x200002bf, &DPAQ_S_W_PH      , 0,
        DSP_                },        /* DPAQ_S.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200004bf, &NMD::DPS_W_PH         , 0,
+       0xfc003fff, 0x200004bf, &DPS_W_PH         , 0,
        DSP_                },        /* DPS.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200006bf, &NMD::DPSQ_S_W_PH      , 0,
+       0xfc003fff, 0x200006bf, &DPSQ_S_W_PH      , 0,
        DSP_                },        /* DPSQ_S.W.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0x200008bf, 0                      , 0,
        0x0                 },        /* POOL32Axf_2(DSP)_0_7~*(4) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000abf, &NMD::MADD_DSP_        , 0,
+       0xfc003fff, 0x20000abf, &MADD_DSP_        , 0,
        DSP_                },        /* MADD[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000cbf, &NMD::MULT_DSP_        , 0,
+       0xfc003fff, 0x20000cbf, &MULT_DSP_        , 0,
        DSP_                },        /* MULT[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20000ebf, &NMD::EXTRV_W          , 0,
+       0xfc003fff, 0x20000ebf, &EXTRV_W          , 0,
        DSP_                },        /* EXTRV.W */
 };
 
 
 NMD::Pool NMD::POOL32Axf_2_DSP__8_15[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200010bf, &NMD::DPAX_W_PH        , 0,
+       0xfc003fff, 0x200010bf, &DPAX_W_PH        , 0,
        DSP_                },        /* DPAX.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200012bf, &NMD::DPAQ_SA_L_W      , 0,
+       0xfc003fff, 0x200012bf, &DPAQ_SA_L_W      , 0,
        DSP_                },        /* DPAQ_SA.L.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200014bf, &NMD::DPSX_W_PH        , 0,
+       0xfc003fff, 0x200014bf, &DPSX_W_PH        , 0,
        DSP_                },        /* DPSX.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200016bf, &NMD::DPSQ_SA_L_W      , 0,
+       0xfc003fff, 0x200016bf, &DPSQ_SA_L_W      , 0,
        DSP_                },        /* DPSQ_SA.L.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0x200018bf, 0                      , 0,
        0x0                 },        /* POOL32Axf_2(DSP)_8_15~*(4) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001abf, &NMD::MADDU_DSP_       , 0,
+       0xfc003fff, 0x20001abf, &MADDU_DSP_       , 0,
        DSP_                },        /* MADDU[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001cbf, &NMD::MULTU_DSP_       , 0,
+       0xfc003fff, 0x20001cbf, &MULTU_DSP_       , 0,
        DSP_                },        /* MULTU[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20001ebf, &NMD::EXTRV_R_W        , 0,
+       0xfc003fff, 0x20001ebf, &EXTRV_R_W        , 0,
        DSP_                },        /* EXTRV_R.W */
 };
 
 
 NMD::Pool NMD::POOL32Axf_2_DSP__16_23[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200020bf, &NMD::DPAU_H_QBL       , 0,
+       0xfc003fff, 0x200020bf, &DPAU_H_QBL       , 0,
        DSP_                },        /* DPAU.H.QBL */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200022bf, &NMD::DPAQX_S_W_PH     , 0,
+       0xfc003fff, 0x200022bf, &DPAQX_S_W_PH     , 0,
        DSP_                },        /* DPAQX_S.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200024bf, &NMD::DPSU_H_QBL       , 0,
+       0xfc003fff, 0x200024bf, &DPSU_H_QBL       , 0,
        DSP_                },        /* DPSU.H.QBL */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200026bf, &NMD::DPSQX_S_W_PH     , 0,
+       0xfc003fff, 0x200026bf, &DPSQX_S_W_PH     , 0,
        DSP_                },        /* DPSQX_S.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200028bf, &NMD::EXTPV            , 0,
+       0xfc003fff, 0x200028bf, &EXTPV            , 0,
        DSP_                },        /* EXTPV */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002abf, &NMD::MSUB_DSP_        , 0,
+       0xfc003fff, 0x20002abf, &MSUB_DSP_        , 0,
        DSP_                },        /* MSUB[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002cbf, &NMD::MULSA_W_PH       , 0,
+       0xfc003fff, 0x20002cbf, &MULSA_W_PH       , 0,
        DSP_                },        /* MULSA.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20002ebf, &NMD::EXTRV_RS_W       , 0,
+       0xfc003fff, 0x20002ebf, &EXTRV_RS_W       , 0,
        DSP_                },        /* EXTRV_RS.W */
 };
 
 
 NMD::Pool NMD::POOL32Axf_2_DSP__24_31[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200030bf, &NMD::DPAU_H_QBR       , 0,
+       0xfc003fff, 0x200030bf, &DPAU_H_QBR       , 0,
        DSP_                },        /* DPAU.H.QBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200032bf, &NMD::DPAQX_SA_W_PH    , 0,
+       0xfc003fff, 0x200032bf, &DPAQX_SA_W_PH    , 0,
        DSP_                },        /* DPAQX_SA.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200034bf, &NMD::DPSU_H_QBR       , 0,
+       0xfc003fff, 0x200034bf, &DPSU_H_QBR       , 0,
        DSP_                },        /* DPSU.H.QBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200036bf, &NMD::DPSQX_SA_W_PH    , 0,
+       0xfc003fff, 0x200036bf, &DPSQX_SA_W_PH    , 0,
        DSP_                },        /* DPSQX_SA.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x200038bf, &NMD::EXTPDPV          , 0,
+       0xfc003fff, 0x200038bf, &EXTPDPV          , 0,
        DSP_                },        /* EXTPDPV */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003abf, &NMD::MSUBU_DSP_       , 0,
+       0xfc003fff, 0x20003abf, &MSUBU_DSP_       , 0,
        DSP_                },        /* MSUBU[DSP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003cbf, &NMD::MULSAQ_S_W_PH    , 0,
+       0xfc003fff, 0x20003cbf, &MULSAQ_S_W_PH    , 0,
        DSP_                },        /* MULSAQ_S.W.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0x20003ebf, &NMD::EXTRV_S_H        , 0,
+       0xfc003fff, 0x20003ebf, &EXTRV_S_H        , 0,
        DSP_                },        /* EXTRV_S.H */
 };
 
@@ -18149,10 +18149,10 @@ NMD::Pool NMD::POOL32Axf_2[4] = {
 
 NMD::Pool NMD::POOL32Axf_4[128] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000013f, &NMD::ABSQ_S_QB        , 0,
+       0xfc00ffff, 0x2000013f, &ABSQ_S_QB        , 0,
        DSP_                },        /* ABSQ_S.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000033f, &NMD::REPLV_PH         , 0,
+       0xfc00ffff, 0x2000033f, &REPLV_PH         , 0,
        DSP_                },        /* REPLV.PH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000053f, 0                      , 0,
@@ -18173,10 +18173,10 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20000f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(7) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000113f, &NMD::ABSQ_S_PH        , 0,
+       0xfc00ffff, 0x2000113f, &ABSQ_S_PH        , 0,
        DSP_                },        /* ABSQ_S.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000133f, &NMD::REPLV_QB         , 0,
+       0xfc00ffff, 0x2000133f, &REPLV_QB         , 0,
        DSP_                },        /* REPLV.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000153f, 0                      , 0,
@@ -18197,7 +18197,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20001f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000213f, &NMD::ABSQ_S_W         , 0,
+       0xfc00ffff, 0x2000213f, &ABSQ_S_W         , 0,
        DSP_                },        /* ABSQ_S.W */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000233f, 0                      , 0,
@@ -18245,7 +18245,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20003f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(31) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000413f, &NMD::INSV             , 0,
+       0xfc00ffff, 0x2000413f, &INSV             , 0,
        DSP_                },        /* INSV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000433f, 0                      , 0,
@@ -18260,16 +18260,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000493f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(36) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20004b3f, &NMD::CLO              , 0,
+       0xfc00ffff, 0x20004b3f, &CLO              , 0,
        XMMS_               },        /* CLO */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20004d3f, &NMD::MFC2             , 0,
+       0xfc00ffff, 0x20004d3f, &MFC2             , 0,
        CP2_                },        /* MFC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20004f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(39) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000513f, &NMD::PRECEQ_W_PHL     , 0,
+       0xfc00ffff, 0x2000513f, &PRECEQ_W_PHL     , 0,
        DSP_                },        /* PRECEQ.W.PHL */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000533f, 0                      , 0,
@@ -18284,16 +18284,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000593f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(44) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20005b3f, &NMD::CLZ              , 0,
+       0xfc00ffff, 0x20005b3f, &CLZ              , 0,
        XMMS_               },        /* CLZ */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20005d3f, &NMD::MTC2             , 0,
+       0xfc00ffff, 0x20005d3f, &MTC2             , 0,
        CP2_                },        /* MTC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20005f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(47) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000613f, &NMD::PRECEQ_W_PHR     , 0,
+       0xfc00ffff, 0x2000613f, &PRECEQ_W_PHR     , 0,
        DSP_                },        /* PRECEQ.W.PHR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000633f, 0                      , 0,
@@ -18311,16 +18311,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20006b3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(53) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20006d3f, &NMD::DMFC2            , 0,
+       0xfc00ffff, 0x20006d3f, &DMFC2            , 0,
        CP2_                },        /* DMFC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20006f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(55) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000713f, &NMD::PRECEQU_PH_QBL   , 0,
+       0xfc00ffff, 0x2000713f, &PRECEQU_PH_QBL   , 0,
        DSP_                },        /* PRECEQU.PH.QBL */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000733f, &NMD::PRECEQU_PH_QBLA  , 0,
+       0xfc00ffff, 0x2000733f, &PRECEQU_PH_QBLA  , 0,
        DSP_                },        /* PRECEQU.PH.QBLA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000753f, 0                      , 0,
@@ -18335,7 +18335,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20007b3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(61) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20007d3f, &NMD::DMTC2            , 0,
+       0xfc00ffff, 0x20007d3f, &DMTC2            , 0,
        CP2_                },        /* DMTC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20007f3f, 0                      , 0,
@@ -18359,16 +18359,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20008b3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(69) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20008d3f, &NMD::MFHC2            , 0,
+       0xfc00ffff, 0x20008d3f, &MFHC2            , 0,
        CP2_                },        /* MFHC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20008f3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(71) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000913f, &NMD::PRECEQU_PH_QBR   , 0,
+       0xfc00ffff, 0x2000913f, &PRECEQU_PH_QBR   , 0,
        DSP_                },        /* PRECEQU.PH.QBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000933f, &NMD::PRECEQU_PH_QBRA  , 0,
+       0xfc00ffff, 0x2000933f, &PRECEQU_PH_QBRA  , 0,
        DSP_                },        /* PRECEQU.PH.QBRA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000953f, 0                      , 0,
@@ -18383,7 +18383,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x20009b3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(77) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x20009d3f, &NMD::MTHC2            , 0,
+       0xfc00ffff, 0x20009d3f, &MTHC2            , 0,
        CP2_                },        /* MTHC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x20009f3f, 0                      , 0,
@@ -18413,10 +18413,10 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000af3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(87) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000b13f, &NMD::PRECEU_PH_QBL    , 0,
+       0xfc00ffff, 0x2000b13f, &PRECEU_PH_QBL    , 0,
        DSP_                },        /* PRECEU.PH.QBL */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000b33f, &NMD::PRECEU_PH_QBLA   , 0,
+       0xfc00ffff, 0x2000b33f, &PRECEU_PH_QBLA   , 0,
        DSP_                },        /* PRECEU.PH.QBLA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000b53f, 0                      , 0,
@@ -18455,16 +18455,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000cb3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(101) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000cd3f, &NMD::CFC2             , 0,
+       0xfc00ffff, 0x2000cd3f, &CFC2             , 0,
        CP2_                },        /* CFC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000cf3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(103) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000d13f, &NMD::PRECEU_PH_QBR    , 0,
+       0xfc00ffff, 0x2000d13f, &PRECEU_PH_QBR    , 0,
        DSP_                },        /* PRECEU.PH.QBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000d33f, &NMD::PRECEU_PH_QBRA   , 0,
+       0xfc00ffff, 0x2000d33f, &PRECEU_PH_QBRA   , 0,
        DSP_                },        /* PRECEU.PH.QBRA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000d53f, 0                      , 0,
@@ -18479,7 +18479,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000db3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(109) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000dd3f, &NMD::CTC2             , 0,
+       0xfc00ffff, 0x2000dd3f, &CTC2             , 0,
        CP2_                },        /* CTC2 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000df3f, 0                      , 0,
@@ -18509,7 +18509,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
        0xfc00ffff, 0x2000ef3f, 0                      , 0,
        0x0                 },        /* POOL32Axf_4~*(119) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000f13f, &NMD::RADDU_W_QB       , 0,
+       0xfc00ffff, 0x2000f13f, &RADDU_W_QB       , 0,
        DSP_                },        /* RADDU.W.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000f33f, 0                      , 0,
@@ -18537,16 +18537,16 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
 
 NMD::Pool NMD::POOL32Axf_5_group0[32] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000017f, &NMD::TLBGP            , 0,
+       0xfc00ffff, 0x2000017f, &TLBGP            , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGP */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000037f, &NMD::TLBP             , 0,
+       0xfc00ffff, 0x2000037f, &TLBP             , 0,
        CP0_ | TLB_         },        /* TLBP */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000057f, &NMD::TLBGINV          , 0,
+       0xfc00ffff, 0x2000057f, &TLBGINV          , 0,
        CP0_ | VZ_ | TLB_ | TLBINV_},        /* TLBGINV */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000077f, &NMD::TLBINV           , 0,
+       0xfc00ffff, 0x2000077f, &TLBINV           , 0,
        CP0_ | TLB_ | TLBINV_},        /* TLBINV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000097f, 0                      , 0,
@@ -18561,16 +18561,16 @@ NMD::Pool NMD::POOL32Axf_5_group0[32] = {
        0xfc00ffff, 0x20000f7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group0~*(7) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000117f, &NMD::TLBGR            , 0,
+       0xfc00ffff, 0x2000117f, &TLBGR            , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000137f, &NMD::TLBR             , 0,
+       0xfc00ffff, 0x2000137f, &TLBR             , 0,
        CP0_ | TLB_         },        /* TLBR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000157f, &NMD::TLBGINVF         , 0,
+       0xfc00ffff, 0x2000157f, &TLBGINVF         , 0,
        CP0_ | VZ_ | TLB_ | TLBINV_},        /* TLBGINVF */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000177f, &NMD::TLBINVF          , 0,
+       0xfc00ffff, 0x2000177f, &TLBINVF          , 0,
        CP0_ | TLB_ | TLBINV_},        /* TLBINVF */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000197f, 0                      , 0,
@@ -18585,10 +18585,10 @@ NMD::Pool NMD::POOL32Axf_5_group0[32] = {
        0xfc00ffff, 0x20001f7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group0~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000217f, &NMD::TLBGWI           , 0,
+       0xfc00ffff, 0x2000217f, &TLBGWI           , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGWI */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000237f, &NMD::TLBWI            , 0,
+       0xfc00ffff, 0x2000237f, &TLBWI            , 0,
        CP0_ | TLB_         },        /* TLBWI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000257f, 0                      , 0,
@@ -18609,10 +18609,10 @@ NMD::Pool NMD::POOL32Axf_5_group0[32] = {
        0xfc00ffff, 0x20002f7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group0~*(23) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000317f, &NMD::TLBGWR           , 0,
+       0xfc00ffff, 0x2000317f, &TLBGWR           , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGWR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000337f, &NMD::TLBWR            , 0,
+       0xfc00ffff, 0x2000337f, &TLBWR            , 0,
        CP0_ | TLB_         },        /* TLBWR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000357f, 0                      , 0,
@@ -18646,7 +18646,7 @@ NMD::Pool NMD::POOL32Axf_5_group1[32] = {
        0xfc00ffff, 0x2000457f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group1~*(2) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000477f, &NMD::DI               , 0,
+       0xfc00ffff, 0x2000477f, &DI               , 0,
        0x0                 },        /* DI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000497f, 0                      , 0,
@@ -18670,7 +18670,7 @@ NMD::Pool NMD::POOL32Axf_5_group1[32] = {
        0xfc00ffff, 0x2000557f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group1~*(10) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000577f, &NMD::EI               , 0,
+       0xfc00ffff, 0x2000577f, &EI               , 0,
        0x0                 },        /* EI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000597f, 0                      , 0,
@@ -18737,10 +18737,10 @@ NMD::Pool NMD::POOL32Axf_5_group1[32] = {
 
 NMD::Pool NMD::ERETx[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc01ffff, 0x2000f37f, &NMD::ERET             , 0,
+       0xfc01ffff, 0x2000f37f, &ERET             , 0,
        0x0                 },        /* ERET */
     { instruction         , 0                   , 0   , 32,
-       0xfc01ffff, 0x2001f37f, &NMD::ERETNC           , 0,
+       0xfc01ffff, 0x2001f37f, &ERETNC           , 0,
        0x0                 },        /* ERETNC */
 };
 
@@ -18750,7 +18750,7 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
        0xfc00ffff, 0x2000c17f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(0) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000c37f, &NMD::WAIT             , 0,
+       0xfc00ffff, 0x2000c37f, &WAIT             , 0,
        0x0                 },        /* WAIT */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000c57f, 0                      , 0,
@@ -18774,7 +18774,7 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
        0xfc00ffff, 0x2000d17f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(8) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000d37f, &NMD::IRET             , 0,
+       0xfc00ffff, 0x2000d37f, &IRET             , 0,
        MCU_                },        /* IRET */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000d57f, 0                      , 0,
@@ -18795,10 +18795,10 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
        0xfc00ffff, 0x2000df7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000e17f, &NMD::RDPGPR           , 0,
+       0xfc00ffff, 0x2000e17f, &RDPGPR           , 0,
        CP0_                },        /* RDPGPR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000e37f, &NMD::DERET            , 0,
+       0xfc00ffff, 0x2000e37f, &DERET            , 0,
        EJTAG_              },        /* DERET */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000e57f, 0                      , 0,
@@ -18819,7 +18819,7 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
        0xfc00ffff, 0x2000ef7f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(23) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0x2000f17f, &NMD::WRPGPR           , 0,
+       0xfc00ffff, 0x2000f17f, &WRPGPR           , 0,
        CP0_                },        /* WRPGPR */
     { pool                , ERETx               , 2   , 32,
        0xfc00ffff, 0x2000f37f, 0                      , 0,
@@ -18863,10 +18863,10 @@ NMD::Pool NMD::POOL32Axf_5[4] = {
 
 NMD::Pool NMD::SHRA__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc001fff, 0x200001ff, &NMD::SHRA_QB          , 0,
+       0xfc001fff, 0x200001ff, &SHRA_QB          , 0,
        DSP_                },        /* SHRA.QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc001fff, 0x200011ff, &NMD::SHRA_R_QB        , 0,
+       0xfc001fff, 0x200011ff, &SHRA_R_QB        , 0,
        DSP_                },        /* SHRA_R.QB */
 };
 
@@ -18876,10 +18876,10 @@ NMD::Pool NMD::POOL32Axf_7[8] = {
        0xfc000fff, 0x200001ff, 0                      , 0,
        0x0                 },        /* SHRA[_R].QB */
     { instruction         , 0                   , 0   , 32,
-       0xfc000fff, 0x200003ff, &NMD::SHRL_PH          , 0,
+       0xfc000fff, 0x200003ff, &SHRL_PH          , 0,
        DSP_                },        /* SHRL.PH */
     { instruction         , 0                   , 0   , 32,
-       0xfc000fff, 0x200005ff, &NMD::REPL_QB          , 0,
+       0xfc000fff, 0x200005ff, &REPL_QB          , 0,
        DSP_                },        /* REPL.QB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000fff, 0x200007ff, 0                      , 0,
@@ -18932,13 +18932,13 @@ NMD::Pool NMD::_POOL32A7[8] = {
        0xfc00003f, 0x20000007, 0                      , 0,
        0x0                 },        /* P.LSX */
     { instruction         , 0                   , 0   , 32,
-       0xfc00003f, 0x2000000f, &NMD::LSA              , 0,
+       0xfc00003f, 0x2000000f, &LSA              , 0,
        0x0                 },        /* LSA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00003f, 0x20000017, 0                      , 0,
        0x0                 },        /* _POOL32A7~*(2) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00003f, 0x2000001f, &NMD::EXTW             , 0,
+       0xfc00003f, 0x2000001f, &EXTW             , 0,
        0x0                 },        /* EXTW */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00003f, 0x20000027, 0                      , 0,
@@ -18960,13 +18960,13 @@ NMD::Pool NMD::P32A[8] = {
        0xfc000007, 0x20000000, 0                      , 0,
        0x0                 },        /* _POOL32A0 */
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x20000001, &NMD::SPECIAL2         , 0,
+       0xfc000007, 0x20000001, &SPECIAL2         , 0,
        UDI_                },        /* SPECIAL2 */
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x20000002, &NMD::COP2_1           , 0,
+       0xfc000007, 0x20000002, &COP2_1           , 0,
        CP2_                },        /* COP2_1 */
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x20000003, &NMD::UDI              , 0,
+       0xfc000007, 0x20000003, &UDI              , 0,
        UDI_                },        /* UDI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000007, 0x20000004, 0                      , 0,
@@ -18985,42 +18985,42 @@ NMD::Pool NMD::P32A[8] = {
 
 NMD::Pool NMD::P_GP_D[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x40000001, &NMD::LD_GP_           , 0,
+       0xfc000007, 0x40000001, &LD_GP_           , 0,
        MIPS64_             },        /* LD[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc000007, 0x40000005, &NMD::SD_GP_           , 0,
+       0xfc000007, 0x40000005, &SD_GP_           , 0,
        MIPS64_             },        /* SD[GP] */
 };
 
 
 NMD::Pool NMD::P_GP_W[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000003, 0x40000000, &NMD::ADDIU_GP_W_      , 0,
+       0xfc000003, 0x40000000, &ADDIU_GP_W_      , 0,
        0x0                 },        /* ADDIU[GP.W] */
     { pool                , P_GP_D              , 2   , 32,
        0xfc000003, 0x40000001, 0                      , 0,
        0x0                 },        /* P.GP.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc000003, 0x40000002, &NMD::LW_GP_           , 0,
+       0xfc000003, 0x40000002, &LW_GP_           , 0,
        0x0                 },        /* LW[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc000003, 0x40000003, &NMD::SW_GP_           , 0,
+       0xfc000003, 0x40000003, &SW_GP_           , 0,
        0x0                 },        /* SW[GP] */
 };
 
 
 NMD::Pool NMD::POOL48I[32] = {
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600000000000ull, &NMD::LI_48_           , 0,
+       0xfc1f00000000ull, 0x600000000000ull, &LI_48_           , 0,
        XMMS_               },        /* LI[48] */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600100000000ull, &NMD::ADDIU_48_        , 0,
+       0xfc1f00000000ull, 0x600100000000ull, &ADDIU_48_        , 0,
        XMMS_               },        /* ADDIU[48] */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600200000000ull, &NMD::ADDIU_GP48_      , 0,
+       0xfc1f00000000ull, 0x600200000000ull, &ADDIU_GP48_      , 0,
        XMMS_               },        /* ADDIU[GP48] */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600300000000ull, &NMD::ADDIUPC_48_      , 0,
+       0xfc1f00000000ull, 0x600300000000ull, &ADDIUPC_48_      , 0,
        XMMS_               },        /* ADDIUPC[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x600400000000ull, 0                      , 0,
@@ -19044,7 +19044,7 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x600a00000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(10) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600b00000000ull, &NMD::LWPC_48_         , 0,
+       0xfc1f00000000ull, 0x600b00000000ull, &LWPC_48_         , 0,
        XMMS_               },        /* LWPC[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x600c00000000ull, 0                      , 0,
@@ -19056,13 +19056,13 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x600e00000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(14) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x600f00000000ull, &NMD::SWPC_48_         , 0,
+       0xfc1f00000000ull, 0x600f00000000ull, &SWPC_48_         , 0,
        XMMS_               },        /* SWPC[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x601000000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(16) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x601100000000ull, &NMD::DADDIU_48_       , 0,
+       0xfc1f00000000ull, 0x601100000000ull, &DADDIU_48_       , 0,
        MIPS64_             },        /* DADDIU[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x601200000000ull, 0                      , 0,
@@ -19071,7 +19071,7 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x601300000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(19) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x601400000000ull, &NMD::DLUI_48_         , 0,
+       0xfc1f00000000ull, 0x601400000000ull, &DLUI_48_         , 0,
        MIPS64_             },        /* DLUI[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x601500000000ull, 0                      , 0,
@@ -19092,7 +19092,7 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x601a00000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(26) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x601b00000000ull, &NMD::LDPC_48_         , 0,
+       0xfc1f00000000ull, 0x601b00000000ull, &LDPC_48_         , 0,
        MIPS64_             },        /* LDPC[48] */
     { reserved_block      , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x601c00000000ull, 0                      , 0,
@@ -19104,33 +19104,33 @@ NMD::Pool NMD::POOL48I[32] = {
        0xfc1f00000000ull, 0x601e00000000ull, 0                      , 0,
        0x0                 },        /* POOL48I~*(30) */
     { instruction         , 0                   , 0   , 48,
-       0xfc1f00000000ull, 0x601f00000000ull, &NMD::SDPC_48_         , 0,
+       0xfc1f00000000ull, 0x601f00000000ull, &SDPC_48_         , 0,
        MIPS64_             },        /* SDPC[48] */
 };
 
 
 NMD::Pool NMD::PP_SR[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc10f003, 0x80003000, &NMD::SAVE_32_         , 0,
+       0xfc10f003, 0x80003000, &SAVE_32_         , 0,
        0x0                 },        /* SAVE[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc10f003, 0x80003001, 0                      , 0,
        0x0                 },        /* PP.SR~*(1) */
     { instruction         , 0                   , 0   , 32,
-       0xfc10f003, 0x80003002, &NMD::RESTORE_32_      , 0,
+       0xfc10f003, 0x80003002, &RESTORE_32_      , 0,
        0x0                 },        /* RESTORE[32] */
     { return_instruction  , 0                   , 0   , 32,
-       0xfc10f003, 0x80003003, &NMD::RESTORE_JRC_32_  , 0,
+       0xfc10f003, 0x80003003, &RESTORE_JRC_32_  , 0,
        0x0                 },        /* RESTORE.JRC[32] */
 };
 
 
 NMD::Pool NMD::P_SR_F[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc10f007, 0x80103000, &NMD::SAVEF            , 0,
+       0xfc10f007, 0x80103000, &SAVEF            , 0,
        CP1_                },        /* SAVEF */
     { instruction         , 0                   , 0   , 32,
-       0xfc10f007, 0x80103001, &NMD::RESTOREF         , 0,
+       0xfc10f007, 0x80103001, &RESTOREF         , 0,
        CP1_                },        /* RESTOREF */
     { reserved_block      , 0                   , 0   , 32,
        0xfc10f007, 0x80103002, 0                      , 0,
@@ -19165,19 +19165,19 @@ NMD::Pool NMD::P_SR[2] = {
 
 NMD::Pool NMD::P_SLL[5] = {
     { instruction         , 0                   , 0   , 32,
-       0xffe0f1ff, 0x8000c000, &NMD::NOP_32_          , 0,
+       0xffe0f1ff, 0x8000c000, &NOP_32_          , 0,
        0x0                 },        /* NOP[32] */
     { instruction         , 0                   , 0   , 32,
-       0xffe0f1ff, 0x8000c003, &NMD::EHB              , 0,
+       0xffe0f1ff, 0x8000c003, &EHB              , 0,
        0x0                 },        /* EHB */
     { instruction         , 0                   , 0   , 32,
-       0xffe0f1ff, 0x8000c005, &NMD::PAUSE            , 0,
+       0xffe0f1ff, 0x8000c005, &PAUSE            , 0,
        0x0                 },        /* PAUSE */
     { instruction         , 0                   , 0   , 32,
-       0xffe0f1ff, 0x8000c006, &NMD::SYNC             , 0,
+       0xffe0f1ff, 0x8000c006, &SYNC             , 0,
        0x0                 },        /* SYNC */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c000, &NMD::SLL_32_          , 0,
+       0xfc00f1e0, 0x8000c000, &SLL_32_          , 0,
        0x0                 },        /* SLL[32] */
 };
 
@@ -19190,53 +19190,53 @@ NMD::Pool NMD::P_SHIFT[16] = {
        0xfc00f1e0, 0x8000c020, 0                      , 0,
        0x0                 },        /* P.SHIFT~*(1) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c040, &NMD::SRL_32_          , 0,
+       0xfc00f1e0, 0x8000c040, &SRL_32_          , 0,
        0x0                 },        /* SRL[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f1e0, 0x8000c060, 0                      , 0,
        0x0                 },        /* P.SHIFT~*(3) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c080, &NMD::SRA              , 0,
+       0xfc00f1e0, 0x8000c080, &SRA              , 0,
        0x0                 },        /* SRA */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f1e0, 0x8000c0a0, 0                      , 0,
        0x0                 },        /* P.SHIFT~*(5) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c0c0, &NMD::ROTR             , 0,
+       0xfc00f1e0, 0x8000c0c0, &ROTR             , 0,
        0x0                 },        /* ROTR */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f1e0, 0x8000c0e0, 0                      , 0,
        0x0                 },        /* P.SHIFT~*(7) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c100, &NMD::DSLL             , 0,
+       0xfc00f1e0, 0x8000c100, &DSLL             , 0,
        MIPS64_             },        /* DSLL */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c120, &NMD::DSLL32           , 0,
+       0xfc00f1e0, 0x8000c120, &DSLL32           , 0,
        MIPS64_             },        /* DSLL32 */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c140, &NMD::DSRL             , 0,
+       0xfc00f1e0, 0x8000c140, &DSRL             , 0,
        MIPS64_             },        /* DSRL */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c160, &NMD::DSRL32           , 0,
+       0xfc00f1e0, 0x8000c160, &DSRL32           , 0,
        MIPS64_             },        /* DSRL32 */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c180, &NMD::DSRA             , 0,
+       0xfc00f1e0, 0x8000c180, &DSRA             , 0,
        MIPS64_             },        /* DSRA */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c1a0, &NMD::DSRA32           , 0,
+       0xfc00f1e0, 0x8000c1a0, &DSRA32           , 0,
        MIPS64_             },        /* DSRA32 */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c1c0, &NMD::DROTR            , 0,
+       0xfc00f1e0, 0x8000c1c0, &DROTR            , 0,
        MIPS64_             },        /* DROTR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f1e0, 0x8000c1e0, &NMD::DROTR32          , 0,
+       0xfc00f1e0, 0x8000c1e0, &DROTR32          , 0,
        MIPS64_             },        /* DROTR32 */
 };
 
 
 NMD::Pool NMD::P_ROTX[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000d000, &NMD::ROTX             , 0,
+       0xfc00f820, 0x8000d000, &ROTX             , 0,
        XMMS_               },        /* ROTX */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f820, 0x8000d020, 0                      , 0,
@@ -19252,72 +19252,72 @@ NMD::Pool NMD::P_ROTX[4] = {
 
 NMD::Pool NMD::P_INS[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000e000, &NMD::INS              , 0,
+       0xfc00f820, 0x8000e000, &INS              , 0,
        XMMS_               },        /* INS */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000e020, &NMD::DINSU            , 0,
+       0xfc00f820, 0x8000e020, &DINSU            , 0,
        MIPS64_             },        /* DINSU */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000e800, &NMD::DINSM            , 0,
+       0xfc00f820, 0x8000e800, &DINSM            , 0,
        MIPS64_             },        /* DINSM */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000e820, &NMD::DINS             , 0,
+       0xfc00f820, 0x8000e820, &DINS             , 0,
        MIPS64_             },        /* DINS */
 };
 
 
 NMD::Pool NMD::P_EXT[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000f000, &NMD::EXT              , 0,
+       0xfc00f820, 0x8000f000, &EXT              , 0,
        XMMS_               },        /* EXT */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000f020, &NMD::DEXTU            , 0,
+       0xfc00f820, 0x8000f020, &DEXTU            , 0,
        MIPS64_             },        /* DEXTU */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000f800, &NMD::DEXTM            , 0,
+       0xfc00f820, 0x8000f800, &DEXTM            , 0,
        MIPS64_             },        /* DEXTM */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f820, 0x8000f820, &NMD::DEXT             , 0,
+       0xfc00f820, 0x8000f820, &DEXT             , 0,
        MIPS64_             },        /* DEXT */
 };
 
 
 NMD::Pool NMD::P_U12[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80000000, &NMD::ORI              , 0,
+       0xfc00f000, 0x80000000, &ORI              , 0,
        0x0                 },        /* ORI */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80001000, &NMD::XORI             , 0,
+       0xfc00f000, 0x80001000, &XORI             , 0,
        0x0                 },        /* XORI */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80002000, &NMD::ANDI_32_         , 0,
+       0xfc00f000, 0x80002000, &ANDI_32_         , 0,
        0x0                 },        /* ANDI[32] */
     { pool                , P_SR                , 2   , 32,
        0xfc00f000, 0x80003000, 0                      , 0,
        0x0                 },        /* P.SR */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80004000, &NMD::SLTI             , 0,
+       0xfc00f000, 0x80004000, &SLTI             , 0,
        0x0                 },        /* SLTI */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80005000, &NMD::SLTIU            , 0,
+       0xfc00f000, 0x80005000, &SLTIU            , 0,
        0x0                 },        /* SLTIU */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80006000, &NMD::SEQI             , 0,
+       0xfc00f000, 0x80006000, &SEQI             , 0,
        0x0                 },        /* SEQI */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f000, 0x80007000, 0                      , 0,
        0x0                 },        /* P.U12~*(7) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80008000, &NMD::ADDIU_NEG_       , 0,
+       0xfc00f000, 0x80008000, &ADDIU_NEG_       , 0,
        0x0                 },        /* ADDIU[NEG] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x80009000, &NMD::DADDIU_U12_      , 0,
+       0xfc00f000, 0x80009000, &DADDIU_U12_      , 0,
        MIPS64_             },        /* DADDIU[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8000a000, &NMD::DADDIU_NEG_      , 0,
+       0xfc00f000, 0x8000a000, &DADDIU_NEG_      , 0,
        MIPS64_             },        /* DADDIU[NEG] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8000b000, &NMD::DROTX            , 0,
+       0xfc00f000, 0x8000b000, &DROTX            , 0,
        MIPS64_             },        /* DROTX */
     { pool                , P_SHIFT             , 16  , 32,
        0xfc00f000, 0x8000c000, 0                      , 0,
@@ -19336,17 +19336,17 @@ NMD::Pool NMD::P_U12[16] = {
 
 NMD::Pool NMD::RINT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000020, &NMD::RINT_S           , 0,
+       0xfc0003ff, 0xa0000020, &RINT_S           , 0,
        CP1_                },        /* RINT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000220, &NMD::RINT_D           , 0,
+       0xfc0003ff, 0xa0000220, &RINT_D           , 0,
        CP1_                },        /* RINT.D */
 };
 
 
 NMD::Pool NMD::ADD_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000030, &NMD::ADD_S            , 0,
+       0xfc0003ff, 0xa0000030, &ADD_S            , 0,
        CP1_                },        /* ADD.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000230, 0                      , 0,
@@ -19356,27 +19356,27 @@ NMD::Pool NMD::ADD_fmt0[2] = {
 
 NMD::Pool NMD::SELEQZ_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000038, &NMD::SELEQZ_S         , 0,
+       0xfc0003ff, 0xa0000038, &SELEQZ_S         , 0,
        CP1_                },        /* SELEQZ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000238, &NMD::SELEQZ_D         , 0,
+       0xfc0003ff, 0xa0000238, &SELEQZ_D         , 0,
        CP1_                },        /* SELEQZ.D */
 };
 
 
 NMD::Pool NMD::CLASS_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000060, &NMD::CLASS_S          , 0,
+       0xfc0003ff, 0xa0000060, &CLASS_S          , 0,
        CP1_                },        /* CLASS.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000260, &NMD::CLASS_D          , 0,
+       0xfc0003ff, 0xa0000260, &CLASS_D          , 0,
        CP1_                },        /* CLASS.D */
 };
 
 
 NMD::Pool NMD::SUB_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000070, &NMD::SUB_S            , 0,
+       0xfc0003ff, 0xa0000070, &SUB_S            , 0,
        CP1_                },        /* SUB.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000270, 0                      , 0,
@@ -19386,17 +19386,17 @@ NMD::Pool NMD::SUB_fmt0[2] = {
 
 NMD::Pool NMD::SELNEZ_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000078, &NMD::SELNEZ_S         , 0,
+       0xfc0003ff, 0xa0000078, &SELNEZ_S         , 0,
        CP1_                },        /* SELNEZ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000278, &NMD::SELNEZ_D         , 0,
+       0xfc0003ff, 0xa0000278, &SELNEZ_D         , 0,
        CP1_                },        /* SELNEZ.D */
 };
 
 
 NMD::Pool NMD::MUL_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00000b0, &NMD::MUL_S            , 0,
+       0xfc0003ff, 0xa00000b0, &MUL_S            , 0,
        CP1_                },        /* MUL.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa00002b0, 0                      , 0,
@@ -19406,17 +19406,17 @@ NMD::Pool NMD::MUL_fmt0[2] = {
 
 NMD::Pool NMD::SEL_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00000b8, &NMD::SEL_S            , 0,
+       0xfc0003ff, 0xa00000b8, &SEL_S            , 0,
        CP1_                },        /* SEL.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00002b8, &NMD::SEL_D            , 0,
+       0xfc0003ff, 0xa00002b8, &SEL_D            , 0,
        CP1_                },        /* SEL.D */
 };
 
 
 NMD::Pool NMD::DIV_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00000f0, &NMD::DIV_S            , 0,
+       0xfc0003ff, 0xa00000f0, &DIV_S            , 0,
        CP1_                },        /* DIV.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa00002f0, 0                      , 0,
@@ -19426,7 +19426,7 @@ NMD::Pool NMD::DIV_fmt0[2] = {
 
 NMD::Pool NMD::ADD_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000130, &NMD::ADD_D            , 0,
+       0xfc0003ff, 0xa0000130, &ADD_D            , 0,
        CP1_                },        /* ADD.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000330, 0                      , 0,
@@ -19436,7 +19436,7 @@ NMD::Pool NMD::ADD_fmt1[2] = {
 
 NMD::Pool NMD::SUB_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa0000170, &NMD::SUB_D            , 0,
+       0xfc0003ff, 0xa0000170, &SUB_D            , 0,
        CP1_                },        /* SUB.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000370, 0                      , 0,
@@ -19446,7 +19446,7 @@ NMD::Pool NMD::SUB_fmt1[2] = {
 
 NMD::Pool NMD::MUL_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00001b0, &NMD::MUL_D            , 0,
+       0xfc0003ff, 0xa00001b0, &MUL_D            , 0,
        CP1_                },        /* MUL.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa00003b0, 0                      , 0,
@@ -19456,17 +19456,17 @@ NMD::Pool NMD::MUL_fmt1[2] = {
 
 NMD::Pool NMD::MADDF_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00001b8, &NMD::MADDF_S          , 0,
+       0xfc0003ff, 0xa00001b8, &MADDF_S          , 0,
        CP1_                },        /* MADDF.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00003b8, &NMD::MADDF_D          , 0,
+       0xfc0003ff, 0xa00003b8, &MADDF_D          , 0,
        CP1_                },        /* MADDF.D */
 };
 
 
 NMD::Pool NMD::DIV_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00001f0, &NMD::DIV_D            , 0,
+       0xfc0003ff, 0xa00001f0, &DIV_D            , 0,
        CP1_                },        /* DIV.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0003ff, 0xa00003f0, 0                      , 0,
@@ -19476,10 +19476,10 @@ NMD::Pool NMD::DIV_fmt1[2] = {
 
 NMD::Pool NMD::MSUBF_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00001f8, &NMD::MSUBF_S          , 0,
+       0xfc0003ff, 0xa00001f8, &MSUBF_S          , 0,
        CP1_                },        /* MSUBF.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0003ff, 0xa00003f8, &NMD::MSUBF_D          , 0,
+       0xfc0003ff, 0xa00003f8, &MSUBF_D          , 0,
        CP1_                },        /* MSUBF.D */
 };
 
@@ -19682,170 +19682,170 @@ NMD::Pool NMD::POOL32F_0[64] = {
 
 NMD::Pool NMD::MIN_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa0000003, &NMD::MIN_S            , 0,
+       0xfc00023f, 0xa0000003, &MIN_S            , 0,
        CP1_                },        /* MIN.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa0000203, &NMD::MIN_D            , 0,
+       0xfc00023f, 0xa0000203, &MIN_D            , 0,
        CP1_                },        /* MIN.D */
 };
 
 
 NMD::Pool NMD::MAX_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa000000b, &NMD::MAX_S            , 0,
+       0xfc00023f, 0xa000000b, &MAX_S            , 0,
        CP1_                },        /* MAX.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa000020b, &NMD::MAX_D            , 0,
+       0xfc00023f, 0xa000020b, &MAX_D            , 0,
        CP1_                },        /* MAX.D */
 };
 
 
 NMD::Pool NMD::MINA_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa0000023, &NMD::MINA_S           , 0,
+       0xfc00023f, 0xa0000023, &MINA_S           , 0,
        CP1_                },        /* MINA.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa0000223, &NMD::MINA_D           , 0,
+       0xfc00023f, 0xa0000223, &MINA_D           , 0,
        CP1_                },        /* MINA.D */
 };
 
 
 NMD::Pool NMD::MAXA_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa000002b, &NMD::MAXA_S           , 0,
+       0xfc00023f, 0xa000002b, &MAXA_S           , 0,
        CP1_                },        /* MAXA.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc00023f, 0xa000022b, &NMD::MAXA_D           , 0,
+       0xfc00023f, 0xa000022b, &MAXA_D           , 0,
        CP1_                },        /* MAXA.D */
 };
 
 
 NMD::Pool NMD::CVT_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000013b, &NMD::CVT_L_S          , 0,
+       0xfc007fff, 0xa000013b, &CVT_L_S          , 0,
        CP1_                },        /* CVT.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000413b, &NMD::CVT_L_D          , 0,
+       0xfc007fff, 0xa000413b, &CVT_L_D          , 0,
        CP1_                },        /* CVT.L.D */
 };
 
 
 NMD::Pool NMD::RSQRT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000023b, &NMD::RSQRT_S          , 0,
+       0xfc007fff, 0xa000023b, &RSQRT_S          , 0,
        CP1_                },        /* RSQRT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000423b, &NMD::RSQRT_D          , 0,
+       0xfc007fff, 0xa000423b, &RSQRT_D          , 0,
        CP1_                },        /* RSQRT.D */
 };
 
 
 NMD::Pool NMD::FLOOR_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000033b, &NMD::FLOOR_L_S        , 0,
+       0xfc007fff, 0xa000033b, &FLOOR_L_S        , 0,
        CP1_                },        /* FLOOR.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000433b, &NMD::FLOOR_L_D        , 0,
+       0xfc007fff, 0xa000433b, &FLOOR_L_D        , 0,
        CP1_                },        /* FLOOR.L.D */
 };
 
 
 NMD::Pool NMD::CVT_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000093b, &NMD::CVT_W_S          , 0,
+       0xfc007fff, 0xa000093b, &CVT_W_S          , 0,
        CP1_                },        /* CVT.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000493b, &NMD::CVT_W_D          , 0,
+       0xfc007fff, 0xa000493b, &CVT_W_D          , 0,
        CP1_                },        /* CVT.W.D */
 };
 
 
 NMD::Pool NMD::SQRT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0000a3b, &NMD::SQRT_S           , 0,
+       0xfc007fff, 0xa0000a3b, &SQRT_S           , 0,
        CP1_                },        /* SQRT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0004a3b, &NMD::SQRT_D           , 0,
+       0xfc007fff, 0xa0004a3b, &SQRT_D           , 0,
        CP1_                },        /* SQRT.D */
 };
 
 
 NMD::Pool NMD::FLOOR_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0000b3b, &NMD::FLOOR_W_S        , 0,
+       0xfc007fff, 0xa0000b3b, &FLOOR_W_S        , 0,
        CP1_                },        /* FLOOR.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0004b3b, &NMD::FLOOR_W_D        , 0,
+       0xfc007fff, 0xa0004b3b, &FLOOR_W_D        , 0,
        CP1_                },        /* FLOOR.W.D */
 };
 
 
 NMD::Pool NMD::RECIP_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000123b, &NMD::RECIP_S          , 0,
+       0xfc007fff, 0xa000123b, &RECIP_S          , 0,
        CP1_                },        /* RECIP.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000523b, &NMD::RECIP_D          , 0,
+       0xfc007fff, 0xa000523b, &RECIP_D          , 0,
        CP1_                },        /* RECIP.D */
 };
 
 
 NMD::Pool NMD::CEIL_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000133b, &NMD::CEIL_L_S         , 0,
+       0xfc007fff, 0xa000133b, &CEIL_L_S         , 0,
        CP1_                },        /* CEIL.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000533b, &NMD::CEIL_L_D         , 0,
+       0xfc007fff, 0xa000533b, &CEIL_L_D         , 0,
        CP1_                },        /* CEIL.L.D */
 };
 
 
 NMD::Pool NMD::CEIL_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0001b3b, &NMD::CEIL_W_S         , 0,
+       0xfc007fff, 0xa0001b3b, &CEIL_W_S         , 0,
        CP1_                },        /* CEIL.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0005b3b, &NMD::CEIL_W_D         , 0,
+       0xfc007fff, 0xa0005b3b, &CEIL_W_D         , 0,
        CP1_                },        /* CEIL.W.D */
 };
 
 
 NMD::Pool NMD::TRUNC_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000233b, &NMD::TRUNC_L_S        , 0,
+       0xfc007fff, 0xa000233b, &TRUNC_L_S        , 0,
        CP1_                },        /* TRUNC.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000633b, &NMD::TRUNC_L_D        , 0,
+       0xfc007fff, 0xa000633b, &TRUNC_L_D        , 0,
        CP1_                },        /* TRUNC.L.D */
 };
 
 
 NMD::Pool NMD::TRUNC_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0002b3b, &NMD::TRUNC_W_S        , 0,
+       0xfc007fff, 0xa0002b3b, &TRUNC_W_S        , 0,
        CP1_                },        /* TRUNC.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0006b3b, &NMD::TRUNC_W_D        , 0,
+       0xfc007fff, 0xa0006b3b, &TRUNC_W_D        , 0,
        CP1_                },        /* TRUNC.W.D */
 };
 
 
 NMD::Pool NMD::ROUND_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000333b, &NMD::ROUND_L_S        , 0,
+       0xfc007fff, 0xa000333b, &ROUND_L_S        , 0,
        CP1_                },        /* ROUND.L.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000733b, &NMD::ROUND_L_D        , 0,
+       0xfc007fff, 0xa000733b, &ROUND_L_D        , 0,
        CP1_                },        /* ROUND.L.D */
 };
 
 
 NMD::Pool NMD::ROUND_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0003b3b, &NMD::ROUND_W_S        , 0,
+       0xfc007fff, 0xa0003b3b, &ROUND_W_S        , 0,
        CP1_                },        /* ROUND.W.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0007b3b, &NMD::ROUND_W_D        , 0,
+       0xfc007fff, 0xa0007b3b, &ROUND_W_D        , 0,
        CP1_                },        /* ROUND.W.D */
 };
 
@@ -19900,7 +19900,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa0000f3b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(15) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000103b, &NMD::CFC1             , 0,
+       0xfc003fff, 0xa000103b, &CFC1             , 0,
        CP1_                },        /* CFC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000113b, 0                      , 0,
@@ -19924,7 +19924,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa000173b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(23) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000183b, &NMD::CTC1             , 0,
+       0xfc003fff, 0xa000183b, &CTC1             , 0,
        CP1_                },        /* CTC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000193b, 0                      , 0,
@@ -19948,10 +19948,10 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa0001f3b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(31) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000203b, &NMD::MFC1             , 0,
+       0xfc003fff, 0xa000203b, &MFC1             , 0,
        CP1_                },        /* MFC1 */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000213b, &NMD::CVT_S_PL         , 0,
+       0xfc003fff, 0xa000213b, &CVT_S_PL         , 0,
        CP1_                },        /* CVT.S.PL */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000223b, 0                      , 0,
@@ -19960,7 +19960,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa000233b, 0                      , 0,
        CP1_                },        /* TRUNC.L.fmt */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000243b, &NMD::DMFC1            , 0,
+       0xfc003fff, 0xa000243b, &DMFC1            , 0,
        CP1_ | MIPS64_      },        /* DMFC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000253b, 0                      , 0,
@@ -19972,10 +19972,10 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa000273b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(39) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000283b, &NMD::MTC1             , 0,
+       0xfc003fff, 0xa000283b, &MTC1             , 0,
        CP1_                },        /* MTC1 */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000293b, &NMD::CVT_S_PU         , 0,
+       0xfc003fff, 0xa000293b, &CVT_S_PU         , 0,
        CP1_                },        /* CVT.S.PU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa0002a3b, 0                      , 0,
@@ -19984,7 +19984,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa0002b3b, 0                      , 0,
        CP1_                },        /* TRUNC.W.fmt */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa0002c3b, &NMD::DMTC1            , 0,
+       0xfc003fff, 0xa0002c3b, &DMTC1            , 0,
        CP1_ | MIPS64_      },        /* DMTC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa0002d3b, 0                      , 0,
@@ -19996,7 +19996,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa0002f3b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(47) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000303b, &NMD::MFHC1            , 0,
+       0xfc003fff, 0xa000303b, &MFHC1            , 0,
        CP1_                },        /* MFHC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000313b, 0                      , 0,
@@ -20020,7 +20020,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
        0xfc003fff, 0xa000373b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(55) */
     { instruction         , 0                   , 0   , 32,
-       0xfc003fff, 0xa000383b, &NMD::MTHC1            , 0,
+       0xfc003fff, 0xa000383b, &MTHC1            , 0,
        CP1_                },        /* MTHC1 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000393b, 0                      , 0,
@@ -20048,10 +20048,10 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
 
 NMD::Pool NMD::MOV_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000007b, &NMD::MOV_S            , 0,
+       0xfc007fff, 0xa000007b, &MOV_S            , 0,
        CP1_                },        /* MOV.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000207b, &NMD::MOV_D            , 0,
+       0xfc007fff, 0xa000207b, &MOV_D            , 0,
        CP1_                },        /* MOV.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa000407b, 0                      , 0,
@@ -20064,10 +20064,10 @@ NMD::Pool NMD::MOV_fmt[4] = {
 
 NMD::Pool NMD::ABS_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000037b, &NMD::ABS_S            , 0,
+       0xfc007fff, 0xa000037b, &ABS_S            , 0,
        CP1_                },        /* ABS.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000237b, &NMD::ABS_D            , 0,
+       0xfc007fff, 0xa000237b, &ABS_D            , 0,
        CP1_                },        /* ABS.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa000437b, 0                      , 0,
@@ -20080,10 +20080,10 @@ NMD::Pool NMD::ABS_fmt[4] = {
 
 NMD::Pool NMD::NEG_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0000b7b, &NMD::NEG_S            , 0,
+       0xfc007fff, 0xa0000b7b, &NEG_S            , 0,
        CP1_                },        /* NEG.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0002b7b, &NMD::NEG_D            , 0,
+       0xfc007fff, 0xa0002b7b, &NEG_D            , 0,
        CP1_                },        /* NEG.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa0004b7b, 0                      , 0,
@@ -20096,13 +20096,13 @@ NMD::Pool NMD::NEG_fmt[4] = {
 
 NMD::Pool NMD::CVT_D_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000137b, &NMD::CVT_D_S          , 0,
+       0xfc007fff, 0xa000137b, &CVT_D_S          , 0,
        CP1_                },        /* CVT.D.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000337b, &NMD::CVT_D_W          , 0,
+       0xfc007fff, 0xa000337b, &CVT_D_W          , 0,
        CP1_                },        /* CVT.D.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa000537b, &NMD::CVT_D_L          , 0,
+       0xfc007fff, 0xa000537b, &CVT_D_L          , 0,
        CP1_                },        /* CVT.D.L */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa000737b, 0                      , 0,
@@ -20112,13 +20112,13 @@ NMD::Pool NMD::CVT_D_fmt[4] = {
 
 NMD::Pool NMD::CVT_S_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0001b7b, &NMD::CVT_S_D          , 0,
+       0xfc007fff, 0xa0001b7b, &CVT_S_D          , 0,
        CP1_                },        /* CVT.S.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0003b7b, &NMD::CVT_S_W          , 0,
+       0xfc007fff, 0xa0003b7b, &CVT_S_W          , 0,
        CP1_                },        /* CVT.S.W */
     { instruction         , 0                   , 0   , 32,
-       0xfc007fff, 0xa0005b7b, &NMD::CVT_S_L          , 0,
+       0xfc007fff, 0xa0005b7b, &CVT_S_L          , 0,
        CP1_                },        /* CVT.S.L */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007fff, 0xa0007b7b, 0                      , 0,
@@ -20272,64 +20272,64 @@ NMD::Pool NMD::POOL32F_3[8] = {
 
 NMD::Pool NMD::CMP_condn_S[32] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000005, &NMD::CMP_AF_S         , 0,
+       0xfc0007ff, 0xa0000005, &CMP_AF_S         , 0,
        CP1_                },        /* CMP.AF.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000045, &NMD::CMP_UN_S         , 0,
+       0xfc0007ff, 0xa0000045, &CMP_UN_S         , 0,
        CP1_                },        /* CMP.UN.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000085, &NMD::CMP_EQ_S         , 0,
+       0xfc0007ff, 0xa0000085, &CMP_EQ_S         , 0,
        CP1_                },        /* CMP.EQ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00000c5, &NMD::CMP_UEQ_S        , 0,
+       0xfc0007ff, 0xa00000c5, &CMP_UEQ_S        , 0,
        CP1_                },        /* CMP.UEQ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000105, &NMD::CMP_LT_S         , 0,
+       0xfc0007ff, 0xa0000105, &CMP_LT_S         , 0,
        CP1_                },        /* CMP.LT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000145, &NMD::CMP_ULT_S        , 0,
+       0xfc0007ff, 0xa0000145, &CMP_ULT_S        , 0,
        CP1_                },        /* CMP.ULT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000185, &NMD::CMP_LE_S         , 0,
+       0xfc0007ff, 0xa0000185, &CMP_LE_S         , 0,
        CP1_                },        /* CMP.LE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00001c5, &NMD::CMP_ULE_S        , 0,
+       0xfc0007ff, 0xa00001c5, &CMP_ULE_S        , 0,
        CP1_                },        /* CMP.ULE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000205, &NMD::CMP_SAF_S        , 0,
+       0xfc0007ff, 0xa0000205, &CMP_SAF_S        , 0,
        CP1_                },        /* CMP.SAF.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000245, &NMD::CMP_SUN_S        , 0,
+       0xfc0007ff, 0xa0000245, &CMP_SUN_S        , 0,
        CP1_                },        /* CMP.SUN.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000285, &NMD::CMP_SEQ_S        , 0,
+       0xfc0007ff, 0xa0000285, &CMP_SEQ_S        , 0,
        CP1_                },        /* CMP.SEQ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00002c5, &NMD::CMP_SUEQ_S       , 0,
+       0xfc0007ff, 0xa00002c5, &CMP_SUEQ_S       , 0,
        CP1_                },        /* CMP.SUEQ.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000305, &NMD::CMP_SLT_S        , 0,
+       0xfc0007ff, 0xa0000305, &CMP_SLT_S        , 0,
        CP1_                },        /* CMP.SLT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000345, &NMD::CMP_SULT_S       , 0,
+       0xfc0007ff, 0xa0000345, &CMP_SULT_S       , 0,
        CP1_                },        /* CMP.SULT.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000385, &NMD::CMP_SLE_S        , 0,
+       0xfc0007ff, 0xa0000385, &CMP_SLE_S        , 0,
        CP1_                },        /* CMP.SLE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00003c5, &NMD::CMP_SULE_S       , 0,
+       0xfc0007ff, 0xa00003c5, &CMP_SULE_S       , 0,
        CP1_                },        /* CMP.SULE.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000405, 0                      , 0,
        CP1_                },        /* CMP.condn.S~*(16) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000445, &NMD::CMP_OR_S         , 0,
+       0xfc0007ff, 0xa0000445, &CMP_OR_S         , 0,
        CP1_                },        /* CMP.OR.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000485, &NMD::CMP_UNE_S        , 0,
+       0xfc0007ff, 0xa0000485, &CMP_UNE_S        , 0,
        CP1_                },        /* CMP.UNE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00004c5, &NMD::CMP_NE_S         , 0,
+       0xfc0007ff, 0xa00004c5, &CMP_NE_S         , 0,
        CP1_                },        /* CMP.NE.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000505, 0                      , 0,
@@ -20347,13 +20347,13 @@ NMD::Pool NMD::CMP_condn_S[32] = {
        0xfc0007ff, 0xa0000605, 0                      , 0,
        CP1_                },        /* CMP.condn.S~*(24) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000645, &NMD::CMP_SOR_S        , 0,
+       0xfc0007ff, 0xa0000645, &CMP_SOR_S        , 0,
        CP1_                },        /* CMP.SOR.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000685, &NMD::CMP_SUNE_S       , 0,
+       0xfc0007ff, 0xa0000685, &CMP_SUNE_S       , 0,
        CP1_                },        /* CMP.SUNE.S */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00006c5, &NMD::CMP_SNE_S        , 0,
+       0xfc0007ff, 0xa00006c5, &CMP_SNE_S        , 0,
        CP1_                },        /* CMP.SNE.S */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000705, 0                      , 0,
@@ -20372,64 +20372,64 @@ NMD::Pool NMD::CMP_condn_S[32] = {
 
 NMD::Pool NMD::CMP_condn_D[32] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000015, &NMD::CMP_AF_D         , 0,
+       0xfc0007ff, 0xa0000015, &CMP_AF_D         , 0,
        CP1_                },        /* CMP.AF.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000055, &NMD::CMP_UN_D         , 0,
+       0xfc0007ff, 0xa0000055, &CMP_UN_D         , 0,
        CP1_                },        /* CMP.UN.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000095, &NMD::CMP_EQ_D         , 0,
+       0xfc0007ff, 0xa0000095, &CMP_EQ_D         , 0,
        CP1_                },        /* CMP.EQ.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00000d5, &NMD::CMP_UEQ_D        , 0,
+       0xfc0007ff, 0xa00000d5, &CMP_UEQ_D        , 0,
        CP1_                },        /* CMP.UEQ.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000115, &NMD::CMP_LT_D         , 0,
+       0xfc0007ff, 0xa0000115, &CMP_LT_D         , 0,
        CP1_                },        /* CMP.LT.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000155, &NMD::CMP_ULT_D        , 0,
+       0xfc0007ff, 0xa0000155, &CMP_ULT_D        , 0,
        CP1_                },        /* CMP.ULT.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000195, &NMD::CMP_LE_D         , 0,
+       0xfc0007ff, 0xa0000195, &CMP_LE_D         , 0,
        CP1_                },        /* CMP.LE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00001d5, &NMD::CMP_ULE_D        , 0,
+       0xfc0007ff, 0xa00001d5, &CMP_ULE_D        , 0,
        CP1_                },        /* CMP.ULE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000215, &NMD::CMP_SAF_D        , 0,
+       0xfc0007ff, 0xa0000215, &CMP_SAF_D        , 0,
        CP1_                },        /* CMP.SAF.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000255, &NMD::CMP_SUN_D        , 0,
+       0xfc0007ff, 0xa0000255, &CMP_SUN_D        , 0,
        CP1_                },        /* CMP.SUN.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000295, &NMD::CMP_SEQ_D        , 0,
+       0xfc0007ff, 0xa0000295, &CMP_SEQ_D        , 0,
        CP1_                },        /* CMP.SEQ.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00002d5, &NMD::CMP_SUEQ_D       , 0,
+       0xfc0007ff, 0xa00002d5, &CMP_SUEQ_D       , 0,
        CP1_                },        /* CMP.SUEQ.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000315, &NMD::CMP_SLT_D        , 0,
+       0xfc0007ff, 0xa0000315, &CMP_SLT_D        , 0,
        CP1_                },        /* CMP.SLT.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000355, &NMD::CMP_SULT_D       , 0,
+       0xfc0007ff, 0xa0000355, &CMP_SULT_D       , 0,
        CP1_                },        /* CMP.SULT.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000395, &NMD::CMP_SLE_D        , 0,
+       0xfc0007ff, 0xa0000395, &CMP_SLE_D        , 0,
        CP1_                },        /* CMP.SLE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00003d5, &NMD::CMP_SULE_D       , 0,
+       0xfc0007ff, 0xa00003d5, &CMP_SULE_D       , 0,
        CP1_                },        /* CMP.SULE.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000415, 0                      , 0,
        CP1_                },        /* CMP.condn.D~*(16) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000455, &NMD::CMP_OR_D         , 0,
+       0xfc0007ff, 0xa0000455, &CMP_OR_D         , 0,
        CP1_                },        /* CMP.OR.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000495, &NMD::CMP_UNE_D        , 0,
+       0xfc0007ff, 0xa0000495, &CMP_UNE_D        , 0,
        CP1_                },        /* CMP.UNE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00004d5, &NMD::CMP_NE_D         , 0,
+       0xfc0007ff, 0xa00004d5, &CMP_NE_D         , 0,
        CP1_                },        /* CMP.NE.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000515, 0                      , 0,
@@ -20447,13 +20447,13 @@ NMD::Pool NMD::CMP_condn_D[32] = {
        0xfc0007ff, 0xa0000615, 0                      , 0,
        CP1_                },        /* CMP.condn.D~*(24) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000655, &NMD::CMP_SOR_D        , 0,
+       0xfc0007ff, 0xa0000655, &CMP_SOR_D        , 0,
        CP1_                },        /* CMP.SOR.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa0000695, &NMD::CMP_SUNE_D       , 0,
+       0xfc0007ff, 0xa0000695, &CMP_SUNE_D       , 0,
        CP1_                },        /* CMP.SUNE.D */
     { instruction         , 0                   , 0   , 32,
-       0xfc0007ff, 0xa00006d5, &NMD::CMP_SNE_D        , 0,
+       0xfc0007ff, 0xa00006d5, &CMP_SNE_D        , 0,
        CP1_                },        /* CMP.SNE.D */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000715, 0                      , 0,
@@ -20531,13 +20531,13 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000000, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(0) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000008, &NMD::DLSA             , 0,
+       0xfc0001ff, 0xc0000008, &DLSA             , 0,
        MIPS64_             },        /* DLSA */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000010, &NMD::DSLLV            , 0,
+       0xfc0001ff, 0xc0000010, &DSLLV            , 0,
        MIPS64_             },        /* DSLLV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000018, &NMD::DMUL             , 0,
+       0xfc0001ff, 0xc0000018, &DMUL             , 0,
        MIPS64_             },        /* DMUL */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000020, 0                      , 0,
@@ -20558,10 +20558,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000048, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(9) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000050, &NMD::DSRLV            , 0,
+       0xfc0001ff, 0xc0000050, &DSRLV            , 0,
        MIPS64_             },        /* DSRLV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000058, &NMD::DMUH             , 0,
+       0xfc0001ff, 0xc0000058, &DMUH             , 0,
        MIPS64_             },        /* DMUH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000060, 0                      , 0,
@@ -20582,10 +20582,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000088, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(17) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000090, &NMD::DSRAV            , 0,
+       0xfc0001ff, 0xc0000090, &DSRAV            , 0,
        MIPS64_             },        /* DSRAV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000098, &NMD::DMULU            , 0,
+       0xfc0001ff, 0xc0000098, &DMULU            , 0,
        MIPS64_             },        /* DMULU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc00000a0, 0                      , 0,
@@ -20606,10 +20606,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc00000c8, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(25) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc00000d0, &NMD::DROTRV           , 0,
+       0xfc0001ff, 0xc00000d0, &DROTRV           , 0,
        MIPS64_             },        /* DROTRV */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc00000d8, &NMD::DMUHU            , 0,
+       0xfc0001ff, 0xc00000d8, &DMUHU            , 0,
        MIPS64_             },        /* DMUHU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc00000e0, 0                      , 0,
@@ -20630,10 +20630,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000108, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(33) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000110, &NMD::DADD             , 0,
+       0xfc0001ff, 0xc0000110, &DADD             , 0,
        MIPS64_             },        /* DADD */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000118, &NMD::DDIV             , 0,
+       0xfc0001ff, 0xc0000118, &DDIV             , 0,
        MIPS64_             },        /* DDIV */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000120, 0                      , 0,
@@ -20654,10 +20654,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000148, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(41) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000150, &NMD::DADDU            , 0,
+       0xfc0001ff, 0xc0000150, &DADDU            , 0,
        MIPS64_             },        /* DADDU */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000158, &NMD::DMOD             , 0,
+       0xfc0001ff, 0xc0000158, &DMOD             , 0,
        MIPS64_             },        /* DMOD */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000160, 0                      , 0,
@@ -20678,10 +20678,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc0000188, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(49) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000190, &NMD::DSUB             , 0,
+       0xfc0001ff, 0xc0000190, &DSUB             , 0,
        MIPS64_             },        /* DSUB */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc0000198, &NMD::DDIVU            , 0,
+       0xfc0001ff, 0xc0000198, &DDIVU            , 0,
        MIPS64_             },        /* DDIVU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc00001a0, 0                      , 0,
@@ -20702,10 +20702,10 @@ NMD::Pool NMD::POOL32S_0[64] = {
        0xfc0001ff, 0xc00001c8, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(57) */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc00001d0, &NMD::DSUBU            , 0,
+       0xfc0001ff, 0xc00001d0, &DSUBU            , 0,
        MIPS64_             },        /* DSUBU */
     { instruction         , 0                   , 0   , 32,
-       0xfc0001ff, 0xc00001d8, &NMD::DMODU            , 0,
+       0xfc0001ff, 0xc00001d8, &DMODU            , 0,
        MIPS64_             },        /* DMODU */
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc00001e0, 0                      , 0,
@@ -20835,7 +20835,7 @@ NMD::Pool NMD::POOL32Sxf_4[128] = {
        0xfc00ffff, 0xc000493c, 0                      , 0,
        0x0                 },        /* POOL32Sxf_4~*(36) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0xc0004b3c, &NMD::DCLO             , 0,
+       0xfc00ffff, 0xc0004b3c, &DCLO             , 0,
        MIPS64_             },        /* DCLO */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0xc0004d3c, 0                      , 0,
@@ -20859,7 +20859,7 @@ NMD::Pool NMD::POOL32Sxf_4[128] = {
        0xfc00ffff, 0xc000593c, 0                      , 0,
        0x0                 },        /* POOL32Sxf_4~*(44) */
     { instruction         , 0                   , 0   , 32,
-       0xfc00ffff, 0xc0005b3c, &NMD::DCLZ             , 0,
+       0xfc00ffff, 0xc0005b3c, &DCLZ             , 0,
        MIPS64_             },        /* DCLZ */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0xc0005d3c, 0                      , 0,
@@ -21140,10 +21140,10 @@ NMD::Pool NMD::POOL32Sxf[8] = {
 
 NMD::Pool NMD::POOL32S_4[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00003f, 0xc0000004, &NMD::EXTD             , 0,
+       0xfc00003f, 0xc0000004, &EXTD             , 0,
        MIPS64_             },        /* EXTD */
     { instruction         , 0                   , 0   , 32,
-       0xfc00003f, 0xc000000c, &NMD::EXTD32           , 0,
+       0xfc00003f, 0xc000000c, &EXTD32           , 0,
        MIPS64_             },        /* EXTD32 */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00003f, 0xc0000014, 0                      , 0,
@@ -21196,27 +21196,27 @@ NMD::Pool NMD::POOL32S[8] = {
 
 NMD::Pool NMD::P_LUI[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000002, 0xe0000000, &NMD::LUI              , 0,
+       0xfc000002, 0xe0000000, &LUI              , 0,
        0x0                 },        /* LUI */
     { instruction         , 0                   , 0   , 32,
-       0xfc000002, 0xe0000002, &NMD::ALUIPC           , 0,
+       0xfc000002, 0xe0000002, &ALUIPC           , 0,
        0x0                 },        /* ALUIPC */
 };
 
 
 NMD::Pool NMD::P_GP_LH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0001, 0x44100000, &NMD::LH_GP_           , 0,
+       0xfc1c0001, 0x44100000, &LH_GP_           , 0,
        0x0                 },        /* LH[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0001, 0x44100001, &NMD::LHU_GP_          , 0,
+       0xfc1c0001, 0x44100001, &LHU_GP_          , 0,
        0x0                 },        /* LHU[GP] */
 };
 
 
 NMD::Pool NMD::P_GP_SH[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0001, 0x44140000, &NMD::SH_GP_           , 0,
+       0xfc1c0001, 0x44140000, &SH_GP_           , 0,
        0x0                 },        /* SH[GP] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc1c0001, 0x44140001, 0                      , 0,
@@ -21226,23 +21226,23 @@ NMD::Pool NMD::P_GP_SH[2] = {
 
 NMD::Pool NMD::P_GP_CP1[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x44180000, &NMD::LWC1_GP_         , 0,
+       0xfc1c0003, 0x44180000, &LWC1_GP_         , 0,
        CP1_                },        /* LWC1[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x44180001, &NMD::SWC1_GP_         , 0,
+       0xfc1c0003, 0x44180001, &SWC1_GP_         , 0,
        CP1_                },        /* SWC1[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x44180002, &NMD::LDC1_GP_         , 0,
+       0xfc1c0003, 0x44180002, &LDC1_GP_         , 0,
        CP1_                },        /* LDC1[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x44180003, &NMD::SDC1_GP_         , 0,
+       0xfc1c0003, 0x44180003, &SDC1_GP_         , 0,
        CP1_                },        /* SDC1[GP] */
 };
 
 
 NMD::Pool NMD::P_GP_M64[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0003, 0x441c0000, &NMD::LWU_GP_          , 0,
+       0xfc1c0003, 0x441c0000, &LWU_GP_          , 0,
        MIPS64_             },        /* LWU[GP] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc1c0003, 0x441c0001, 0                      , 0,
@@ -21258,16 +21258,16 @@ NMD::Pool NMD::P_GP_M64[4] = {
 
 NMD::Pool NMD::P_GP_BH[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0000, 0x44000000, &NMD::LB_GP_           , 0,
+       0xfc1c0000, 0x44000000, &LB_GP_           , 0,
        0x0                 },        /* LB[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0000, 0x44040000, &NMD::SB_GP_           , 0,
+       0xfc1c0000, 0x44040000, &SB_GP_           , 0,
        0x0                 },        /* SB[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0000, 0x44080000, &NMD::LBU_GP_          , 0,
+       0xfc1c0000, 0x44080000, &LBU_GP_          , 0,
        0x0                 },        /* LBU[GP] */
     { instruction         , 0                   , 0   , 32,
-       0xfc1c0000, 0x440c0000, &NMD::ADDIU_GP_B_      , 0,
+       0xfc1c0000, 0x440c0000, &ADDIU_GP_B_      , 0,
        0x0                 },        /* ADDIU[GP.B] */
     { pool                , P_GP_LH             , 2   , 32,
        0xfc1c0000, 0x44100000, 0                      , 0,
@@ -21286,134 +21286,134 @@ NMD::Pool NMD::P_GP_BH[8] = {
 
 NMD::Pool NMD::P_LS_U12[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84000000, &NMD::LB_U12_          , 0,
+       0xfc00f000, 0x84000000, &LB_U12_          , 0,
        0x0                 },        /* LB[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84001000, &NMD::SB_U12_          , 0,
+       0xfc00f000, 0x84001000, &SB_U12_          , 0,
        0x0                 },        /* SB[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84002000, &NMD::LBU_U12_         , 0,
+       0xfc00f000, 0x84002000, &LBU_U12_         , 0,
        0x0                 },        /* LBU[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84003000, &NMD::PREF_U12_        , 0,
+       0xfc00f000, 0x84003000, &PREF_U12_        , 0,
        0x0                 },        /* PREF[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84004000, &NMD::LH_U12_          , 0,
+       0xfc00f000, 0x84004000, &LH_U12_          , 0,
        0x0                 },        /* LH[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84005000, &NMD::SH_U12_          , 0,
+       0xfc00f000, 0x84005000, &SH_U12_          , 0,
        0x0                 },        /* SH[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84006000, &NMD::LHU_U12_         , 0,
+       0xfc00f000, 0x84006000, &LHU_U12_         , 0,
        0x0                 },        /* LHU[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84007000, &NMD::LWU_U12_         , 0,
+       0xfc00f000, 0x84007000, &LWU_U12_         , 0,
        MIPS64_             },        /* LWU[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84008000, &NMD::LW_U12_          , 0,
+       0xfc00f000, 0x84008000, &LW_U12_          , 0,
        0x0                 },        /* LW[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x84009000, &NMD::SW_U12_          , 0,
+       0xfc00f000, 0x84009000, &SW_U12_          , 0,
        0x0                 },        /* SW[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400a000, &NMD::LWC1_U12_        , 0,
+       0xfc00f000, 0x8400a000, &LWC1_U12_        , 0,
        CP1_                },        /* LWC1[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400b000, &NMD::SWC1_U12_        , 0,
+       0xfc00f000, 0x8400b000, &SWC1_U12_        , 0,
        CP1_                },        /* SWC1[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400c000, &NMD::LD_U12_          , 0,
+       0xfc00f000, 0x8400c000, &LD_U12_          , 0,
        MIPS64_             },        /* LD[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400d000, &NMD::SD_U12_          , 0,
+       0xfc00f000, 0x8400d000, &SD_U12_          , 0,
        MIPS64_             },        /* SD[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400e000, &NMD::LDC1_U12_        , 0,
+       0xfc00f000, 0x8400e000, &LDC1_U12_        , 0,
        CP1_                },        /* LDC1[U12] */
     { instruction         , 0                   , 0   , 32,
-       0xfc00f000, 0x8400f000, &NMD::SDC1_U12_        , 0,
+       0xfc00f000, 0x8400f000, &SDC1_U12_        , 0,
        CP1_                },        /* SDC1[U12] */
 };
 
 
 NMD::Pool NMD::P_PREF_S9_[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xffe07f00, 0xa7e01800, &NMD::SYNCI            , 0,
+       0xffe07f00, 0xa7e01800, &SYNCI            , 0,
        0x0                 },        /* SYNCI */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001800, &NMD::PREF_S9_         , &PREF_S9__cond    ,
+       0xfc007f00, 0xa4001800, &PREF_S9_         , &PREF_S9__cond    ,
        0x0                 },        /* PREF[S9] */
 };
 
 
 NMD::Pool NMD::P_LS_S0[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4000000, &NMD::LB_S9_           , 0,
+       0xfc007f00, 0xa4000000, &LB_S9_           , 0,
        0x0                 },        /* LB[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4000800, &NMD::SB_S9_           , 0,
+       0xfc007f00, 0xa4000800, &SB_S9_           , 0,
        0x0                 },        /* SB[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001000, &NMD::LBU_S9_          , 0,
+       0xfc007f00, 0xa4001000, &LBU_S9_          , 0,
        0x0                 },        /* LBU[S9] */
     { pool                , P_PREF_S9_          , 2   , 32,
        0xfc007f00, 0xa4001800, 0                      , 0,
        0x0                 },        /* P.PREF[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002000, &NMD::LH_S9_           , 0,
+       0xfc007f00, 0xa4002000, &LH_S9_           , 0,
        0x0                 },        /* LH[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002800, &NMD::SH_S9_           , 0,
+       0xfc007f00, 0xa4002800, &SH_S9_           , 0,
        0x0                 },        /* SH[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003000, &NMD::LHU_S9_          , 0,
+       0xfc007f00, 0xa4003000, &LHU_S9_          , 0,
        0x0                 },        /* LHU[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003800, &NMD::LWU_S9_          , 0,
+       0xfc007f00, 0xa4003800, &LWU_S9_          , 0,
        MIPS64_             },        /* LWU[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004000, &NMD::LW_S9_           , 0,
+       0xfc007f00, 0xa4004000, &LW_S9_           , 0,
        0x0                 },        /* LW[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004800, &NMD::SW_S9_           , 0,
+       0xfc007f00, 0xa4004800, &SW_S9_           , 0,
        0x0                 },        /* SW[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4005000, &NMD::LWC1_S9_         , 0,
+       0xfc007f00, 0xa4005000, &LWC1_S9_         , 0,
        CP1_                },        /* LWC1[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4005800, &NMD::SWC1_S9_         , 0,
+       0xfc007f00, 0xa4005800, &SWC1_S9_         , 0,
        CP1_                },        /* SWC1[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4006000, &NMD::LD_S9_           , 0,
+       0xfc007f00, 0xa4006000, &LD_S9_           , 0,
        MIPS64_             },        /* LD[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4006800, &NMD::SD_S9_           , 0,
+       0xfc007f00, 0xa4006800, &SD_S9_           , 0,
        MIPS64_             },        /* SD[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4007000, &NMD::LDC1_S9_         , 0,
+       0xfc007f00, 0xa4007000, &LDC1_S9_         , 0,
        CP1_                },        /* LDC1[S9] */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4007800, &NMD::SDC1_S9_         , 0,
+       0xfc007f00, 0xa4007800, &SDC1_S9_         , 0,
        CP1_                },        /* SDC1[S9] */
 };
 
 
 NMD::Pool NMD::ASET_ACLR[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfe007f00, 0xa4001100, &NMD::ASET             , 0,
+       0xfe007f00, 0xa4001100, &ASET             , 0,
        MCU_                },        /* ASET */
     { instruction         , 0                   , 0   , 32,
-       0xfe007f00, 0xa6001100, &NMD::ACLR             , 0,
+       0xfe007f00, 0xa6001100, &ACLR             , 0,
        MCU_                },        /* ACLR */
 };
 
 
 NMD::Pool NMD::P_LL[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005100, &NMD::LL               , 0,
+       0xfc007f03, 0xa4005100, &LL               , 0,
        0x0                 },        /* LL */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005101, &NMD::LLWP             , 0,
+       0xfc007f03, 0xa4005101, &LLWP             , 0,
        XNP_                },        /* LLWP */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f03, 0xa4005102, 0                      , 0,
@@ -21426,10 +21426,10 @@ NMD::Pool NMD::P_LL[4] = {
 
 NMD::Pool NMD::P_SC[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005900, &NMD::SC               , 0,
+       0xfc007f03, 0xa4005900, &SC               , 0,
        0x0                 },        /* SC */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005901, &NMD::SCWP             , 0,
+       0xfc007f03, 0xa4005901, &SCWP             , 0,
        XNP_                },        /* SCWP */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f03, 0xa4005902, 0                      , 0,
@@ -21442,10 +21442,10 @@ NMD::Pool NMD::P_SC[4] = {
 
 NMD::Pool NMD::P_LLD[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f07, 0xa4007100, &NMD::LLD              , 0,
+       0xfc007f07, 0xa4007100, &LLD              , 0,
        MIPS64_             },        /* LLD */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f07, 0xa4007101, &NMD::LLDP             , 0,
+       0xfc007f07, 0xa4007101, &LLDP             , 0,
        MIPS64_             },        /* LLDP */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f07, 0xa4007102, 0                      , 0,
@@ -21470,10 +21470,10 @@ NMD::Pool NMD::P_LLD[8] = {
 
 NMD::Pool NMD::P_SCD[8] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f07, 0xa4007900, &NMD::SCD              , 0,
+       0xfc007f07, 0xa4007900, &SCD              , 0,
        MIPS64_             },        /* SCD */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f07, 0xa4007901, &NMD::SCDP             , 0,
+       0xfc007f07, 0xa4007901, &SCDP             , 0,
        MIPS64_             },        /* SCDP */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f07, 0xa4007902, 0                      , 0,
@@ -21510,22 +21510,22 @@ NMD::Pool NMD::P_LS_S1[16] = {
        0xfc007f00, 0xa4001900, 0                      , 0,
        0x0                 },        /* P.LS.S1~*(3) */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002100, &NMD::UALH             , 0,
+       0xfc007f00, 0xa4002100, &UALH             , 0,
        XMMS_               },        /* UALH */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002900, &NMD::UASH             , 0,
+       0xfc007f00, 0xa4002900, &UASH             , 0,
        XMMS_               },        /* UASH */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f00, 0xa4003100, 0                      , 0,
        0x0                 },        /* P.LS.S1~*(6) */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003900, &NMD::CACHE            , 0,
+       0xfc007f00, 0xa4003900, &CACHE            , 0,
        CP0_                },        /* CACHE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004100, &NMD::LWC2             , 0,
+       0xfc007f00, 0xa4004100, &LWC2             , 0,
        CP2_                },        /* LWC2 */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004900, &NMD::SWC2             , 0,
+       0xfc007f00, 0xa4004900, &SWC2             , 0,
        CP2_                },        /* SWC2 */
     { pool                , P_LL                , 4   , 32,
        0xfc007f00, 0xa4005100, 0                      , 0,
@@ -21534,10 +21534,10 @@ NMD::Pool NMD::P_LS_S1[16] = {
        0xfc007f00, 0xa4005900, 0                      , 0,
        0x0                 },        /* P.SC */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4006100, &NMD::LDC2             , 0,
+       0xfc007f00, 0xa4006100, &LDC2             , 0,
        CP2_                },        /* LDC2 */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4006900, &NMD::SDC2             , 0,
+       0xfc007f00, 0xa4006900, &SDC2             , 0,
        CP2_                },        /* SDC2 */
     { pool                , P_LLD               , 8   , 32,
        0xfc007f00, 0xa4007100, 0                      , 0,
@@ -21550,20 +21550,20 @@ NMD::Pool NMD::P_LS_S1[16] = {
 
 NMD::Pool NMD::P_PREFE[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xffe07f00, 0xa7e01a00, &NMD::SYNCIE           , 0,
+       0xffe07f00, 0xa7e01a00, &SYNCIE           , 0,
        CP0_ | EVA_         },        /* SYNCIE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001a00, &NMD::PREFE            , &PREFE_cond       ,
+       0xfc007f00, 0xa4001a00, &PREFE            , &PREFE_cond       ,
        CP0_ | EVA_         },        /* PREFE */
 };
 
 
 NMD::Pool NMD::P_LLE[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005200, &NMD::LLE              , 0,
+       0xfc007f03, 0xa4005200, &LLE              , 0,
        CP0_ | EVA_         },        /* LLE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005201, &NMD::LLWPE            , 0,
+       0xfc007f03, 0xa4005201, &LLWPE            , 0,
        CP0_ | EVA_         },        /* LLWPE */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f03, 0xa4005202, 0                      , 0,
@@ -21576,10 +21576,10 @@ NMD::Pool NMD::P_LLE[4] = {
 
 NMD::Pool NMD::P_SCE[4] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005a00, &NMD::SCE              , 0,
+       0xfc007f03, 0xa4005a00, &SCE              , 0,
        CP0_ | EVA_         },        /* SCE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f03, 0xa4005a01, &NMD::SCWPE            , 0,
+       0xfc007f03, 0xa4005a01, &SCWPE            , 0,
        CP0_ | EVA_         },        /* SCWPE */
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f03, 0xa4005a02, 0                      , 0,
@@ -21592,34 +21592,34 @@ NMD::Pool NMD::P_SCE[4] = {
 
 NMD::Pool NMD::P_LS_E0[16] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4000200, &NMD::LBE              , 0,
+       0xfc007f00, 0xa4000200, &LBE              , 0,
        CP0_ | EVA_         },        /* LBE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4000a00, &NMD::SBE              , 0,
+       0xfc007f00, 0xa4000a00, &SBE              , 0,
        CP0_ | EVA_         },        /* SBE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4001200, &NMD::LBUE             , 0,
+       0xfc007f00, 0xa4001200, &LBUE             , 0,
        CP0_ | EVA_         },        /* LBUE */
     { pool                , P_PREFE             , 2   , 32,
        0xfc007f00, 0xa4001a00, 0                      , 0,
        0x0                 },        /* P.PREFE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002200, &NMD::LHE              , 0,
+       0xfc007f00, 0xa4002200, &LHE              , 0,
        CP0_ | EVA_         },        /* LHE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4002a00, &NMD::SHE              , 0,
+       0xfc007f00, 0xa4002a00, &SHE              , 0,
        CP0_ | EVA_         },        /* SHE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003200, &NMD::LHUE             , 0,
+       0xfc007f00, 0xa4003200, &LHUE             , 0,
        CP0_ | EVA_         },        /* LHUE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4003a00, &NMD::CACHEE           , 0,
+       0xfc007f00, 0xa4003a00, &CACHEE           , 0,
        CP0_ | EVA_         },        /* CACHEE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004200, &NMD::LWE              , 0,
+       0xfc007f00, 0xa4004200, &LWE              , 0,
        CP0_ | EVA_         },        /* LWE */
     { instruction         , 0                   , 0   , 32,
-       0xfc007f00, 0xa4004a00, &NMD::SWE              , 0,
+       0xfc007f00, 0xa4004a00, &SWE              , 0,
        CP0_ | EVA_         },        /* SWE */
     { pool                , P_LLE               , 4   , 32,
        0xfc007f00, 0xa4005200, 0                      , 0,
@@ -21644,40 +21644,40 @@ NMD::Pool NMD::P_LS_E0[16] = {
 
 NMD::Pool NMD::P_LS_WM[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000400, &NMD::LWM              , 0,
+       0xfc000f00, 0xa4000400, &LWM              , 0,
        XMMS_               },        /* LWM */
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000c00, &NMD::SWM              , 0,
+       0xfc000f00, 0xa4000c00, &SWM              , 0,
        XMMS_               },        /* SWM */
 };
 
 
 NMD::Pool NMD::P_LS_UAWM[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000500, &NMD::UALWM            , 0,
+       0xfc000f00, 0xa4000500, &UALWM            , 0,
        XMMS_               },        /* UALWM */
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000d00, &NMD::UASWM            , 0,
+       0xfc000f00, 0xa4000d00, &UASWM            , 0,
        XMMS_               },        /* UASWM */
 };
 
 
 NMD::Pool NMD::P_LS_DM[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000600, &NMD::LDM              , 0,
+       0xfc000f00, 0xa4000600, &LDM              , 0,
        MIPS64_             },        /* LDM */
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000e00, &NMD::SDM              , 0,
+       0xfc000f00, 0xa4000e00, &SDM              , 0,
        MIPS64_             },        /* SDM */
 };
 
 
 NMD::Pool NMD::P_LS_UADM[2] = {
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000700, &NMD::UALDM            , 0,
+       0xfc000f00, 0xa4000700, &UALDM            , 0,
        MIPS64_             },        /* UALDM */
     { instruction         , 0                   , 0   , 32,
-       0xfc000f00, 0xa4000f00, &NMD::UASDM            , 0,
+       0xfc000f00, 0xa4000f00, &UASDM            , 0,
        MIPS64_             },        /* UASDM */
 };
 
@@ -21712,30 +21712,30 @@ NMD::Pool NMD::P_LS_S9[8] = {
 
 NMD::Pool NMD::P_BAL[2] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfe000000, 0x28000000, &NMD::BC_32_           , 0,
+       0xfe000000, 0x28000000, &BC_32_           , 0,
        0x0                 },        /* BC[32] */
     { call_instruction    , 0                   , 0   , 32,
-       0xfe000000, 0x2a000000, &NMD::BALC_32_         , 0,
+       0xfe000000, 0x2a000000, &BALC_32_         , 0,
        0x0                 },        /* BALC[32] */
 };
 
 
 NMD::Pool NMD::P_BALRSC[2] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xffe0f000, 0x48008000, &NMD::BRSC             , 0,
+       0xffe0f000, 0x48008000, &BRSC             , 0,
        0x0                 },        /* BRSC */
     { call_instruction    , 0                   , 0   , 32,
-       0xfc00f000, 0x48008000, &NMD::BALRSC           , &BALRSC_cond      ,
+       0xfc00f000, 0x48008000, &BALRSC           , &BALRSC_cond      ,
        0x0                 },        /* BALRSC */
 };
 
 
 NMD::Pool NMD::P_J[16] = {
     { call_instruction    , 0                   , 0   , 32,
-       0xfc00f000, 0x48000000, &NMD::JALRC_32_        , 0,
+       0xfc00f000, 0x48000000, &JALRC_32_        , 0,
        0x0                 },        /* JALRC[32] */
     { call_instruction    , 0                   , 0   , 32,
-       0xfc00f000, 0x48001000, &NMD::JALRC_HB         , 0,
+       0xfc00f000, 0x48001000, &JALRC_HB         , 0,
        0x0                 },        /* JALRC.HB */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00f000, 0x48002000, 0                      , 0,
@@ -21784,19 +21784,19 @@ NMD::Pool NMD::P_J[16] = {
 
 NMD::Pool NMD::P_BR3A[32] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88004000, &NMD::BC1EQZC          , 0,
+       0xfc1fc000, 0x88004000, &BC1EQZC          , 0,
        CP1_                },        /* BC1EQZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88014000, &NMD::BC1NEZC          , 0,
+       0xfc1fc000, 0x88014000, &BC1NEZC          , 0,
        CP1_                },        /* BC1NEZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88024000, &NMD::BC2EQZC          , 0,
+       0xfc1fc000, 0x88024000, &BC2EQZC          , 0,
        CP2_                },        /* BC2EQZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88034000, &NMD::BC2NEZC          , 0,
+       0xfc1fc000, 0x88034000, &BC2NEZC          , 0,
        CP2_                },        /* BC2NEZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1fc000, 0x88044000, &NMD::BPOSGE32C        , 0,
+       0xfc1fc000, 0x88044000, &BPOSGE32C        , 0,
        DSP_                },        /* BPOSGE32C */
     { reserved_block      , 0                   , 0   , 32,
        0xfc1fc000, 0x88054000, 0                      , 0,
@@ -21884,60 +21884,60 @@ NMD::Pool NMD::P_BR3A[32] = {
 
 NMD::Pool NMD::P_BR1[4] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0x88000000, &NMD::BEQC_32_         , 0,
+       0xfc00c000, 0x88000000, &BEQC_32_         , 0,
        0x0                 },        /* BEQC[32] */
     { pool                , P_BR3A              , 32  , 32,
        0xfc00c000, 0x88004000, 0                      , 0,
        0x0                 },        /* P.BR3A */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0x88008000, &NMD::BGEC             , 0,
+       0xfc00c000, 0x88008000, &BGEC             , 0,
        0x0                 },        /* BGEC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0x8800c000, &NMD::BGEUC            , 0,
+       0xfc00c000, 0x8800c000, &BGEUC            , 0,
        0x0                 },        /* BGEUC */
 };
 
 
 NMD::Pool NMD::P_BR2[4] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0xa8000000, &NMD::BNEC_32_         , 0,
+       0xfc00c000, 0xa8000000, &BNEC_32_         , 0,
        0x0                 },        /* BNEC[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc00c000, 0xa8004000, 0                      , 0,
        0x0                 },        /* P.BR2~*(1) */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0xa8008000, &NMD::BLTC             , 0,
+       0xfc00c000, 0xa8008000, &BLTC             , 0,
        0x0                 },        /* BLTC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc00c000, 0xa800c000, &NMD::BLTUC            , 0,
+       0xfc00c000, 0xa800c000, &BLTUC            , 0,
        0x0                 },        /* BLTUC */
 };
 
 
 NMD::Pool NMD::P_BRI[8] = {
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8000000, &NMD::BEQIC            , 0,
+       0xfc1c0000, 0xc8000000, &BEQIC            , 0,
        0x0                 },        /* BEQIC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8040000, &NMD::BBEQZC           , 0,
+       0xfc1c0000, 0xc8040000, &BBEQZC           , 0,
        XMMS_               },        /* BBEQZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8080000, &NMD::BGEIC            , 0,
+       0xfc1c0000, 0xc8080000, &BGEIC            , 0,
        0x0                 },        /* BGEIC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc80c0000, &NMD::BGEIUC           , 0,
+       0xfc1c0000, 0xc80c0000, &BGEIUC           , 0,
        0x0                 },        /* BGEIUC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8100000, &NMD::BNEIC            , 0,
+       0xfc1c0000, 0xc8100000, &BNEIC            , 0,
        0x0                 },        /* BNEIC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8140000, &NMD::BBNEZC           , 0,
+       0xfc1c0000, 0xc8140000, &BBNEZC           , 0,
        XMMS_               },        /* BBNEZC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc8180000, &NMD::BLTIC            , 0,
+       0xfc1c0000, 0xc8180000, &BLTIC            , 0,
        0x0                 },        /* BLTIC */
     { branch_instruction  , 0                   , 0   , 32,
-       0xfc1c0000, 0xc81c0000, &NMD::BLTIUC           , 0,
+       0xfc1c0000, 0xc81c0000, &BLTIUC           , 0,
        0x0                 },        /* BLTIUC */
 };
 
@@ -21968,7 +21968,7 @@ NMD::Pool NMD::P32[32] = {
        0xfc000000, 0xe0000000, 0                      , 0,
        0x0                 },        /* P.LUI */
     { instruction         , 0                   , 0   , 32,
-       0xfc000000, 0x04000000, &NMD::ADDIUPC_32_      , 0,
+       0xfc000000, 0x04000000, &ADDIUPC_32_      , 0,
        0x0                 },        /* ADDIUPC[32] */
     { reserved_block      , 0                   , 0   , 32,
        0xfc000000, 0x24000000, 0                      , 0,
@@ -21992,7 +21992,7 @@ NMD::Pool NMD::P32[32] = {
        0xfc000000, 0xe4000000, 0                      , 0,
        0x0                 },        /* P32~*(29) */
     { call_instruction    , 0                   , 0   , 32,
-       0xfc000000, 0x08000000, &NMD::MOVE_BALC        , 0,
+       0xfc000000, 0x08000000, &MOVE_BALC        , 0,
        XMMS_               },        /* MOVE.BALC */
     { pool                , P_BAL               , 2   , 32,
        0xfc000000, 0x28000000, 0                      , 0,
@@ -22044,10 +22044,10 @@ NMD::Pool NMD::P32[32] = {
 
 NMD::Pool NMD::P16_SYSCALL[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfffc    , 0x1008    , &NMD::SYSCALL_16_      , 0,
+       0xfffc    , 0x1008    , &SYSCALL_16_      , 0,
        0x0                 },        /* SYSCALL[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfffc    , 0x100c    , &NMD::HYPCALL_16_      , 0,
+       0xfffc    , 0x100c    , &HYPCALL_16_      , 0,
        CP0_ | VZ_          },        /* HYPCALL[16] */
 };
 
@@ -22060,10 +22060,10 @@ NMD::Pool NMD::P16_RI[4] = {
        0xfff8    , 0x1008    , 0                      , 0,
        0x0                 },        /* P16.SYSCALL */
     { instruction         , 0                   , 0   , 16,
-       0xfff8    , 0x1010    , &NMD::BREAK_16_        , 0,
+       0xfff8    , 0x1010    , &BREAK_16_        , 0,
        0x0                 },        /* BREAK[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfff8    , 0x1018    , &NMD::SDBBP_16_        , 0,
+       0xfff8    , 0x1018    , &SDBBP_16_        , 0,
        EJTAG_              },        /* SDBBP[16] */
 };
 
@@ -22073,33 +22073,33 @@ NMD::Pool NMD::P16_MV[2] = {
        0xffe0    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x1000    , &NMD::MOVE             , &MOVE_cond        ,
+       0xfc00    , 0x1000    , &MOVE             , &MOVE_cond        ,
        0x0                 },        /* MOVE */
 };
 
 
 NMD::Pool NMD::P16_SHIFT[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x3000    , &NMD::SLL_16_          , 0,
+       0xfc08    , 0x3000    , &SLL_16_          , 0,
        0x0                 },        /* SLL[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x3008    , &NMD::SRL_16_          , 0,
+       0xfc08    , 0x3008    , &SRL_16_          , 0,
        0x0                 },        /* SRL[16] */
 };
 
 
 NMD::Pool NMD::POOL16C_00[4] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc0f    , 0x5000    , &NMD::NOT_16_          , 0,
+       0xfc0f    , 0x5000    , &NOT_16_          , 0,
        0x0                 },        /* NOT[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0f    , 0x5004    , &NMD::XOR_16_          , 0,
+       0xfc0f    , 0x5004    , &XOR_16_          , 0,
        0x0                 },        /* XOR[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0f    , 0x5008    , &NMD::AND_16_          , 0,
+       0xfc0f    , 0x5008    , &AND_16_          , 0,
        0x0                 },        /* AND[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0f    , 0x500c    , &NMD::OR_16_           , 0,
+       0xfc0f    , 0x500c    , &OR_16_           , 0,
        0x0                 },        /* OR[16] */
 };
 
@@ -22119,7 +22119,7 @@ NMD::Pool NMD::P16C[2] = {
        0xfc01    , 0x5000    , 0                      , 0,
        0x0                 },        /* POOL16C_0 */
     { instruction         , 0                   , 0   , 16,
-       0xfc01    , 0x5001    , &NMD::LWXS_16_         , 0,
+       0xfc01    , 0x5001    , &LWXS_16_         , 0,
        0x0                 },        /* LWXS[16] */
 };
 
@@ -22129,24 +22129,24 @@ NMD::Pool NMD::P16_A1[2] = {
        0xfc40    , 0x7000    , 0                      , 0,
        0x0                 },        /* P16.A1~*(0) */
     { instruction         , 0                   , 0   , 16,
-       0xfc40    , 0x7040    , &NMD::ADDIU_R1_SP_     , 0,
+       0xfc40    , 0x7040    , &ADDIU_R1_SP_     , 0,
        0x0                 },        /* ADDIU[R1.SP] */
 };
 
 
 NMD::Pool NMD::P_ADDIU_RS5_[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xffe8    , 0x9008    , &NMD::NOP_16_          , 0,
+       0xffe8    , 0x9008    , &NOP_16_          , 0,
        0x0                 },        /* NOP[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x9008    , &NMD::ADDIU_RS5_       , &ADDIU_RS5__cond  ,
+       0xfc08    , 0x9008    , &ADDIU_RS5_       , &ADDIU_RS5__cond  ,
        0x0                 },        /* ADDIU[RS5] */
 };
 
 
 NMD::Pool NMD::P16_A2[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc08    , 0x9000    , &NMD::ADDIU_R2_        , 0,
+       0xfc08    , 0x9000    , &ADDIU_R2_        , 0,
        0x0                 },        /* ADDIU[R2] */
     { pool                , P_ADDIU_RS5_        , 2   , 16,
        0xfc08    , 0x9008    , 0                      , 0,
@@ -22156,30 +22156,30 @@ NMD::Pool NMD::P16_A2[2] = {
 
 NMD::Pool NMD::P16_ADDU[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc01    , 0xb000    , &NMD::ADDU_16_         , 0,
+       0xfc01    , 0xb000    , &ADDU_16_         , 0,
        0x0                 },        /* ADDU[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc01    , 0xb001    , &NMD::SUBU_16_         , 0,
+       0xfc01    , 0xb001    , &SUBU_16_         , 0,
        0x0                 },        /* SUBU[16] */
 };
 
 
 NMD::Pool NMD::P16_JRC[2] = {
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc1f    , 0xd800    , &NMD::JRC              , 0,
+       0xfc1f    , 0xd800    , &JRC              , 0,
        0x0                 },        /* JRC */
     { call_instruction    , 0                   , 0   , 16,
-       0xfc1f    , 0xd810    , &NMD::JALRC_16_        , 0,
+       0xfc1f    , 0xd810    , &JALRC_16_        , 0,
        0x0                 },        /* JALRC[16] */
 };
 
 
 NMD::Pool NMD::P16_BR1[2] = {
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0xd800    , &NMD::BEQC_16_         , &BEQC_16__cond    ,
+       0xfc00    , 0xd800    , &BEQC_16_         , &BEQC_16__cond    ,
        XMMS_               },        /* BEQC[16] */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0xd800    , &NMD::BNEC_16_         , &BNEC_16__cond    ,
+       0xfc00    , 0xd800    , &BNEC_16_         , &BNEC_16__cond    ,
        XMMS_               },        /* BNEC[16] */
 };
 
@@ -22196,20 +22196,20 @@ NMD::Pool NMD::P16_BR[2] = {
 
 NMD::Pool NMD::P16_SR[2] = {
     { instruction         , 0                   , 0   , 16,
-       0xfd00    , 0x1c00    , &NMD::SAVE_16_         , 0,
+       0xfd00    , 0x1c00    , &SAVE_16_         , 0,
        0x0                 },        /* SAVE[16] */
     { return_instruction  , 0                   , 0   , 16,
-       0xfd00    , 0x1d00    , &NMD::RESTORE_JRC_16_  , 0,
+       0xfd00    , 0x1d00    , &RESTORE_JRC_16_  , 0,
        0x0                 },        /* RESTORE.JRC[16] */
 };
 
 
 NMD::Pool NMD::P16_4X4[4] = {
     { instruction         , 0                   , 0   , 16,
-       0xfd08    , 0x3c00    , &NMD::ADDU_4X4_        , 0,
+       0xfd08    , 0x3c00    , &ADDU_4X4_        , 0,
        XMMS_               },        /* ADDU[4X4] */
     { instruction         , 0                   , 0   , 16,
-       0xfd08    , 0x3c08    , &NMD::MUL_4X4_         , 0,
+       0xfd08    , 0x3c08    , &MUL_4X4_         , 0,
        XMMS_               },        /* MUL[4X4] */
     { reserved_block      , 0                   , 0   , 16,
        0xfd08    , 0x3d00    , 0                      , 0,
@@ -22222,13 +22222,13 @@ NMD::Pool NMD::P16_4X4[4] = {
 
 NMD::Pool NMD::P16_LB[4] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc0c    , 0x5c00    , &NMD::LB_16_           , 0,
+       0xfc0c    , 0x5c00    , &LB_16_           , 0,
        0x0                 },        /* LB[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0c    , 0x5c04    , &NMD::SB_16_           , 0,
+       0xfc0c    , 0x5c04    , &SB_16_           , 0,
        0x0                 },        /* SB[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc0c    , 0x5c08    , &NMD::LBU_16_          , 0,
+       0xfc0c    , 0x5c08    , &LBU_16_          , 0,
        0x0                 },        /* LBU[16] */
     { reserved_block      , 0                   , 0   , 16,
        0xfc0c    , 0x5c0c    , 0                      , 0,
@@ -22238,13 +22238,13 @@ NMD::Pool NMD::P16_LB[4] = {
 
 NMD::Pool NMD::P16_LH[4] = {
     { instruction         , 0                   , 0   , 16,
-       0xfc09    , 0x7c00    , &NMD::LH_16_           , 0,
+       0xfc09    , 0x7c00    , &LH_16_           , 0,
        0x0                 },        /* LH[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc09    , 0x7c01    , &NMD::SH_16_           , 0,
+       0xfc09    , 0x7c01    , &SH_16_           , 0,
        0x0                 },        /* SH[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc09    , 0x7c08    , &NMD::LHU_16_          , 0,
+       0xfc09    , 0x7c08    , &LHU_16_          , 0,
        0x0                 },        /* LHU[16] */
     { reserved_block      , 0                   , 0   , 16,
        0xfc09    , 0x7c09    , 0                      , 0,
@@ -22272,40 +22272,40 @@ NMD::Pool NMD::P16[32] = {
        0xfc00    , 0xb000    , 0                      , 0,
        0x0                 },        /* P16.ADDU */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xd000    , &NMD::LI_16_           , 0,
+       0xfc00    , 0xd000    , &LI_16_           , 0,
        0x0                 },        /* LI[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xf000    , &NMD::ANDI_16_         , 0,
+       0xfc00    , 0xf000    , &ANDI_16_         , 0,
        0x0                 },        /* ANDI[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x1400    , &NMD::LW_16_           , 0,
+       0xfc00    , 0x1400    , &LW_16_           , 0,
        0x0                 },        /* LW[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x3400    , &NMD::LW_SP_           , 0,
+       0xfc00    , 0x3400    , &LW_SP_           , 0,
        0x0                 },        /* LW[SP] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x5400    , &NMD::LW_GP16_         , 0,
+       0xfc00    , 0x5400    , &LW_GP16_         , 0,
        0x0                 },        /* LW[GP16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x7400    , &NMD::LW_4X4_          , 0,
+       0xfc00    , 0x7400    , &LW_4X4_          , 0,
        XMMS_               },        /* LW[4X4] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0x9400    , &NMD::SW_16_           , 0,
+       0xfc00    , 0x9400    , &SW_16_           , 0,
        0x0                 },        /* SW[16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xb400    , &NMD::SW_SP_           , 0,
+       0xfc00    , 0xb400    , &SW_SP_           , 0,
        0x0                 },        /* SW[SP] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xd400    , &NMD::SW_GP16_         , 0,
+       0xfc00    , 0xd400    , &SW_GP16_         , 0,
        0x0                 },        /* SW[GP16] */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xf400    , &NMD::SW_4X4_          , 0,
+       0xfc00    , 0xf400    , &SW_4X4_          , 0,
        XMMS_               },        /* SW[4X4] */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0x1800    , &NMD::BC_16_           , 0,
+       0xfc00    , 0x1800    , &BC_16_           , 0,
        0x0                 },        /* BC[16] */
     { call_instruction    , 0                   , 0   , 16,
-       0xfc00    , 0x3800    , &NMD::BALC_16_         , 0,
+       0xfc00    , 0x3800    , &BALC_16_         , 0,
        0x0                 },        /* BALC[16] */
     { reserved_block      , 0                   , 0   , 16,
        0xfc00    , 0x5800    , 0                      , 0,
@@ -22314,10 +22314,10 @@ NMD::Pool NMD::P16[32] = {
        0xfc00    , 0x7800    , 0                      , 0,
        0x0                 },        /* P16~*(14) */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0x9800    , &NMD::BEQZC_16_        , 0,
+       0xfc00    , 0x9800    , &BEQZC_16_        , 0,
        0x0                 },        /* BEQZC[16] */
     { branch_instruction  , 0                   , 0   , 16,
-       0xfc00    , 0xb800    , &NMD::BNEZC_16_        , 0,
+       0xfc00    , 0xb800    , &BNEZC_16_        , 0,
        0x0                 },        /* BNEZC[16] */
     { pool                , P16_BR              , 2   , 16,
        0xfc00    , 0xd800    , 0                      , 0,
@@ -22341,13 +22341,13 @@ NMD::Pool NMD::P16[32] = {
        0xfc00    , 0x9c00    , 0                      , 0,
        0x0                 },        /* P16~*(19) */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xbc00    , &NMD::MOVEP            , 0,
+       0xfc00    , 0xbc00    , &MOVEP            , 0,
        XMMS_               },        /* MOVEP */
     { reserved_block      , 0                   , 0   , 16,
        0xfc00    , 0xdc00    , 0                      , 0,
        0x0                 },        /* P16~*(27) */
     { instruction         , 0                   , 0   , 16,
-       0xfc00    , 0xfc00    , &NMD::MOVEP_REV_       , 0,
+       0xfc00    , 0xfc00    , &MOVEP_REV_       , 0,
        XMMS_               },        /* MOVEP[REV] */
 };
 
diff --git a/disas/nanomips.h b/disas/nanomips.h
index ff91fbf8c6..dead0bcb94 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -32,6 +32,8 @@ typedef uint16_t uint16;
 typedef uint64_t img_address;
 
 typedef bool (*conditional_function)(uint64 instruction);
+typedef std::string (*disassembly_function)(uint64 instruction,
+                                            img_address m_pc);
 
 enum TABLE_ENTRY_TYPE {
     instruction,
@@ -72,9 +74,6 @@ public:
 
 private:
 
-    typedef std::string(NMD:: *disassembly_function)(uint64 instruction,
-                                                     img_address m_pc);
-
     struct Pool {
         TABLE_ENTRY_TYPE     type;
         struct Pool          *next_table;
@@ -92,643 +91,6 @@ private:
                     TABLE_ENTRY_TYPE & type, const Pool *table,
                     int table_size, img_address m_pc);
 
-    std::string ABS_D(uint64 instruction, img_address m_pc);
-    std::string ABS_S(uint64 instruction, img_address m_pc);
-    std::string ABSQ_S_PH(uint64 instruction, img_address m_pc);
-    std::string ABSQ_S_QB(uint64 instruction, img_address m_pc);
-    std::string ABSQ_S_W(uint64 instruction, img_address m_pc);
-    std::string ACLR(uint64 instruction, img_address m_pc);
-    std::string ADD(uint64 instruction, img_address m_pc);
-    std::string ADD_D(uint64 instruction, img_address m_pc);
-    std::string ADD_S(uint64 instruction, img_address m_pc);
-    std::string ADDIU_32_(uint64 instruction, img_address m_pc);
-    std::string ADDIU_48_(uint64 instruction, img_address m_pc);
-    std::string ADDIU_GP48_(uint64 instruction, img_address m_pc);
-    std::string ADDIU_GP_B_(uint64 instruction, img_address m_pc);
-    std::string ADDIU_GP_W_(uint64 instruction, img_address m_pc);
-    std::string ADDIU_NEG_(uint64 instruction, img_address m_pc);
-    std::string ADDIU_R1_SP_(uint64 instruction, img_address m_pc);
-    std::string ADDIU_R2_(uint64 instruction, img_address m_pc);
-    std::string ADDIU_RS5_(uint64 instruction, img_address m_pc);
-    std::string ADDIUPC_32_(uint64 instruction, img_address m_pc);
-    std::string ADDIUPC_48_(uint64 instruction, img_address m_pc);
-    std::string ADDQ_PH(uint64 instruction, img_address m_pc);
-    std::string ADDQ_S_PH(uint64 instruction, img_address m_pc);
-    std::string ADDQ_S_W(uint64 instruction, img_address m_pc);
-    std::string ADDQH_PH(uint64 instruction, img_address m_pc);
-    std::string ADDQH_R_PH(uint64 instruction, img_address m_pc);
-    std::string ADDQH_R_W(uint64 instruction, img_address m_pc);
-    std::string ADDQH_W(uint64 instruction, img_address m_pc);
-    std::string ADDSC(uint64 instruction, img_address m_pc);
-    std::string ADDU_16_(uint64 instruction, img_address m_pc);
-    std::string ADDU_32_(uint64 instruction, img_address m_pc);
-    std::string ADDU_4X4_(uint64 instruction, img_address m_pc);
-    std::string ADDU_PH(uint64 instruction, img_address m_pc);
-    std::string ADDU_QB(uint64 instruction, img_address m_pc);
-    std::string ADDU_S_PH(uint64 instruction, img_address m_pc);
-    std::string ADDU_S_QB(uint64 instruction, img_address m_pc);
-    std::string ADDUH_QB(uint64 instruction, img_address m_pc);
-    std::string ADDUH_R_QB(uint64 instruction, img_address m_pc);
-    std::string ADDWC(uint64 instruction, img_address m_pc);
-    std::string ALUIPC(uint64 instruction, img_address m_pc);
-    std::string AND_16_(uint64 instruction, img_address m_pc);
-    std::string AND_32_(uint64 instruction, img_address m_pc);
-    std::string ANDI_16_(uint64 instruction, img_address m_pc);
-    std::string ANDI_32_(uint64 instruction, img_address m_pc);
-    std::string APPEND(uint64 instruction, img_address m_pc);
-    std::string ASET(uint64 instruction, img_address m_pc);
-    std::string BALC_16_(uint64 instruction, img_address m_pc);
-    std::string BALC_32_(uint64 instruction, img_address m_pc);
-    std::string BALRSC(uint64 instruction, img_address m_pc);
-    std::string BBEQZC(uint64 instruction, img_address m_pc);
-    std::string BBNEZC(uint64 instruction, img_address m_pc);
-    std::string BC_16_(uint64 instruction, img_address m_pc);
-    std::string BC_32_(uint64 instruction, img_address m_pc);
-    std::string BC1EQZC(uint64 instruction, img_address m_pc);
-    std::string BC1NEZC(uint64 instruction, img_address m_pc);
-    std::string BC2EQZC(uint64 instruction, img_address m_pc);
-    std::string BC2NEZC(uint64 instruction, img_address m_pc);
-    std::string BEQC_16_(uint64 instruction, img_address m_pc);
-    std::string BEQC_32_(uint64 instruction, img_address m_pc);
-    std::string BEQIC(uint64 instruction, img_address m_pc);
-    std::string BEQZC_16_(uint64 instruction, img_address m_pc);
-    std::string BGEC(uint64 instruction, img_address m_pc);
-    std::string BGEIC(uint64 instruction, img_address m_pc);
-    std::string BGEIUC(uint64 instruction, img_address m_pc);
-    std::string BGEUC(uint64 instruction, img_address m_pc);
-    std::string BLTC(uint64 instruction, img_address m_pc);
-    std::string BLTIC(uint64 instruction, img_address m_pc);
-    std::string BLTIUC(uint64 instruction, img_address m_pc);
-    std::string BLTUC(uint64 instruction, img_address m_pc);
-    std::string BNEC_16_(uint64 instruction, img_address m_pc);
-    std::string BNEC_32_(uint64 instruction, img_address m_pc);
-    std::string BNEIC(uint64 instruction, img_address m_pc);
-    std::string BNEZC_16_(uint64 instruction, img_address m_pc);
-    std::string BPOSGE32C(uint64 instruction, img_address m_pc);
-    std::string BREAK_16_(uint64 instruction, img_address m_pc);
-    std::string BREAK_32_(uint64 instruction, img_address m_pc);
-    std::string BRSC(uint64 instruction, img_address m_pc);
-    std::string CACHE(uint64 instruction, img_address m_pc);
-    std::string CACHEE(uint64 instruction, img_address m_pc);
-    std::string CEIL_L_D(uint64 instruction, img_address m_pc);
-    std::string CEIL_L_S(uint64 instruction, img_address m_pc);
-    std::string CEIL_W_D(uint64 instruction, img_address m_pc);
-    std::string CEIL_W_S(uint64 instruction, img_address m_pc);
-    std::string CFC1(uint64 instruction, img_address m_pc);
-    std::string CFC2(uint64 instruction, img_address m_pc);
-    std::string CLASS_D(uint64 instruction, img_address m_pc);
-    std::string CLASS_S(uint64 instruction, img_address m_pc);
-    std::string CLO(uint64 instruction, img_address m_pc);
-    std::string CLZ(uint64 instruction, img_address m_pc);
-    std::string CMP_AF_D(uint64 instruction, img_address m_pc);
-    std::string CMP_AF_S(uint64 instruction, img_address m_pc);
-    std::string CMP_EQ_D(uint64 instruction, img_address m_pc);
-    std::string CMP_EQ_PH(uint64 instruction, img_address m_pc);
-    std::string CMP_EQ_S(uint64 instruction, img_address m_pc);
-    std::string CMP_LE_D(uint64 instruction, img_address m_pc);
-    std::string CMP_LE_PH(uint64 instruction, img_address m_pc);
-    std::string CMP_LE_S(uint64 instruction, img_address m_pc);
-    std::string CMP_LT_D(uint64 instruction, img_address m_pc);
-    std::string CMP_LT_PH(uint64 instruction, img_address m_pc);
-    std::string CMP_LT_S(uint64 instruction, img_address m_pc);
-    std::string CMP_NE_D(uint64 instruction, img_address m_pc);
-    std::string CMP_NE_S(uint64 instruction, img_address m_pc);
-    std::string CMP_OR_D(uint64 instruction, img_address m_pc);
-    std::string CMP_OR_S(uint64 instruction, img_address m_pc);
-    std::string CMP_SAF_D(uint64 instruction, img_address m_pc);
-    std::string CMP_SAF_S(uint64 instruction, img_address m_pc);
-    std::string CMP_SEQ_D(uint64 instruction, img_address m_pc);
-    std::string CMP_SEQ_S(uint64 instruction, img_address m_pc);
-    std::string CMP_SLE_D(uint64 instruction, img_address m_pc);
-    std::string CMP_SLE_S(uint64 instruction, img_address m_pc);
-    std::string CMP_SLT_D(uint64 instruction, img_address m_pc);
-    std::string CMP_SLT_S(uint64 instruction, img_address m_pc);
-    std::string CMP_SNE_D(uint64 instruction, img_address m_pc);
-    std::string CMP_SNE_S(uint64 instruction, img_address m_pc);
-    std::string CMP_SOR_D(uint64 instruction, img_address m_pc);
-    std::string CMP_SOR_S(uint64 instruction, img_address m_pc);
-    std::string CMP_SUEQ_D(uint64 instruction, img_address m_pc);
-    std::string CMP_SUEQ_S(uint64 instruction, img_address m_pc);
-    std::string CMP_SULE_D(uint64 instruction, img_address m_pc);
-    std::string CMP_SULE_S(uint64 instruction, img_address m_pc);
-    std::string CMP_SULT_D(uint64 instruction, img_address m_pc);
-    std::string CMP_SULT_S(uint64 instruction, img_address m_pc);
-    std::string CMP_SUN_D(uint64 instruction, img_address m_pc);
-    std::string CMP_SUN_S(uint64 instruction, img_address m_pc);
-    std::string CMP_SUNE_D(uint64 instruction, img_address m_pc);
-    std::string CMP_SUNE_S(uint64 instruction, img_address m_pc);
-    std::string CMP_UEQ_D(uint64 instruction, img_address m_pc);
-    std::string CMP_UEQ_S(uint64 instruction, img_address m_pc);
-    std::string CMP_ULE_D(uint64 instruction, img_address m_pc);
-    std::string CMP_ULE_S(uint64 instruction, img_address m_pc);
-    std::string CMP_ULT_D(uint64 instruction, img_address m_pc);
-    std::string CMP_ULT_S(uint64 instruction, img_address m_pc);
-    std::string CMP_UN_D(uint64 instruction, img_address m_pc);
-    std::string CMP_UN_S(uint64 instruction, img_address m_pc);
-    std::string CMP_UNE_D(uint64 instruction, img_address m_pc);
-    std::string CMP_UNE_S(uint64 instruction, img_address m_pc);
-    std::string CMPGDU_EQ_QB(uint64 instruction, img_address m_pc);
-    std::string CMPGDU_LE_QB(uint64 instruction, img_address m_pc);
-    std::string CMPGDU_LT_QB(uint64 instruction, img_address m_pc);
-    std::string CMPGU_EQ_QB(uint64 instruction, img_address m_pc);
-    std::string CMPGU_LE_QB(uint64 instruction, img_address m_pc);
-    std::string CMPGU_LT_QB(uint64 instruction, img_address m_pc);
-    std::string CMPU_EQ_QB(uint64 instruction, img_address m_pc);
-    std::string CMPU_LE_QB(uint64 instruction, img_address m_pc);
-    std::string CMPU_LT_QB(uint64 instruction, img_address m_pc);
-    std::string COP2_1(uint64 instruction, img_address m_pc);
-    std::string CTC1(uint64 instruction, img_address m_pc);
-    std::string CTC2(uint64 instruction, img_address m_pc);
-    std::string CVT_D_L(uint64 instruction, img_address m_pc);
-    std::string CVT_D_S(uint64 instruction, img_address m_pc);
-    std::string CVT_D_W(uint64 instruction, img_address m_pc);
-    std::string CVT_L_D(uint64 instruction, img_address m_pc);
-    std::string CVT_L_S(uint64 instruction, img_address m_pc);
-    std::string CVT_S_D(uint64 instruction, img_address m_pc);
-    std::string CVT_S_L(uint64 instruction, img_address m_pc);
-    std::string CVT_S_PL(uint64 instruction, img_address m_pc);
-    std::string CVT_S_PU(uint64 instruction, img_address m_pc);
-    std::string CVT_S_W(uint64 instruction, img_address m_pc);
-    std::string CVT_W_D(uint64 instruction, img_address m_pc);
-    std::string CVT_W_S(uint64 instruction, img_address m_pc);
-    std::string DADDIU_48_(uint64 instruction, img_address m_pc);
-    std::string DADDIU_NEG_(uint64 instruction, img_address m_pc);
-    std::string DADDIU_U12_(uint64 instruction, img_address m_pc);
-    std::string DADD(uint64 instruction, img_address m_pc);
-    std::string DADDU(uint64 instruction, img_address m_pc);
-    std::string DCLO(uint64 instruction, img_address m_pc);
-    std::string DCLZ(uint64 instruction, img_address m_pc);
-    std::string DDIV(uint64 instruction, img_address m_pc);
-    std::string DDIVU(uint64 instruction, img_address m_pc);
-    std::string DERET(uint64 instruction, img_address m_pc);
-    std::string DEXTM(uint64 instruction, img_address m_pc);
-    std::string DEXT(uint64 instruction, img_address m_pc);
-    std::string DEXTU(uint64 instruction, img_address m_pc);
-    std::string DINSM(uint64 instruction, img_address m_pc);
-    std::string DINS(uint64 instruction, img_address m_pc);
-    std::string DINSU(uint64 instruction, img_address m_pc);
-    std::string DI(uint64 instruction, img_address m_pc);
-    std::string DIV(uint64 instruction, img_address m_pc);
-    std::string DIV_D(uint64 instruction, img_address m_pc);
-    std::string DIV_S(uint64 instruction, img_address m_pc);
-    std::string DIVU(uint64 instruction, img_address m_pc);
-    std::string DLSA(uint64 instruction, img_address m_pc);
-    std::string DLUI_48_(uint64 instruction, img_address m_pc);
-    std::string DMFC0(uint64 instruction, img_address m_pc);
-    std::string DMFC1(uint64 instruction, img_address m_pc);
-    std::string DMFC2(uint64 instruction, img_address m_pc);
-    std::string DMFGC0(uint64 instruction, img_address m_pc);
-    std::string DMOD(uint64 instruction, img_address m_pc);
-    std::string DMODU(uint64 instruction, img_address m_pc);
-    std::string DMTC0(uint64 instruction, img_address m_pc);
-    std::string DMTC1(uint64 instruction, img_address m_pc);
-    std::string DMTC2(uint64 instruction, img_address m_pc);
-    std::string DMTGC0(uint64 instruction, img_address m_pc);
-    std::string DMT(uint64 instruction, img_address m_pc);
-    std::string DMUH(uint64 instruction, img_address m_pc);
-    std::string DMUHU(uint64 instruction, img_address m_pc);
-    std::string DMUL(uint64 instruction, img_address m_pc);
-    std::string DMULU(uint64 instruction, img_address m_pc);
-    std::string DPAQ_S_W_PH(uint64 instruction, img_address m_pc);
-    std::string DPAQ_SA_L_W(uint64 instruction, img_address m_pc);
-    std::string DPAQX_S_W_PH(uint64 instruction, img_address m_pc);
-    std::string DPAQX_SA_W_PH(uint64 instruction, img_address m_pc);
-    std::string DPAU_H_QBL(uint64 instruction, img_address m_pc);
-    std::string DPAU_H_QBR(uint64 instruction, img_address m_pc);
-    std::string DPA_W_PH(uint64 instruction, img_address m_pc);
-    std::string DPAX_W_PH(uint64 instruction, img_address m_pc);
-    std::string DPS_W_PH(uint64 instruction, img_address m_pc);
-    std::string DPSQ_SA_L_W(uint64 instruction, img_address m_pc);
-    std::string DPSQ_S_W_PH(uint64 instruction, img_address m_pc);
-    std::string DPSQX_SA_W_PH(uint64 instruction, img_address m_pc);
-    std::string DPSQX_S_W_PH(uint64 instruction, img_address m_pc);
-    std::string DPSU_H_QBL(uint64 instruction, img_address m_pc);
-    std::string DPSU_H_QBR(uint64 instruction, img_address m_pc);
-    std::string DPSX_W_PH(uint64 instruction, img_address m_pc);
-    std::string DROTR(uint64 instruction, img_address m_pc);
-    std::string DROTR32(uint64 instruction, img_address m_pc);
-    std::string DROTRV(uint64 instruction, img_address m_pc);
-    std::string DROTX(uint64 instruction, img_address m_pc);
-    std::string DSLL(uint64 instruction, img_address m_pc);
-    std::string DSLL32(uint64 instruction, img_address m_pc);
-    std::string DSLLV(uint64 instruction, img_address m_pc);
-    std::string DSRA(uint64 instruction, img_address m_pc);
-    std::string DSRA32(uint64 instruction, img_address m_pc);
-    std::string DSRAV(uint64 instruction, img_address m_pc);
-    std::string DSRL32(uint64 instruction, img_address m_pc);
-    std::string DSRL(uint64 instruction, img_address m_pc);
-    std::string DSRLV(uint64 instruction, img_address m_pc);
-    std::string DSUB(uint64 instruction, img_address m_pc);
-    std::string DSUBU(uint64 instruction, img_address m_pc);
-    std::string DVP(uint64 instruction, img_address m_pc);
-    std::string DVPE(uint64 instruction, img_address m_pc);
-    std::string EHB(uint64 instruction, img_address m_pc);
-    std::string EI(uint64 instruction, img_address m_pc);
-    std::string EMT(uint64 instruction, img_address m_pc);
-    std::string ERET(uint64 instruction, img_address m_pc);
-    std::string ERETNC(uint64 instruction, img_address m_pc);
-    std::string EVP(uint64 instruction, img_address m_pc);
-    std::string EVPE(uint64 instruction, img_address m_pc);
-    std::string EXT(uint64 instruction, img_address m_pc);
-    std::string EXTD(uint64 instruction, img_address m_pc);
-    std::string EXTD32(uint64 instruction, img_address m_pc);
-    std::string EXTP(uint64 instruction, img_address m_pc);
-    std::string EXTPDP(uint64 instruction, img_address m_pc);
-    std::string EXTPDPV(uint64 instruction, img_address m_pc);
-    std::string EXTPV(uint64 instruction, img_address m_pc);
-    std::string EXTR_RS_W(uint64 instruction, img_address m_pc);
-    std::string EXTR_R_W(uint64 instruction, img_address m_pc);
-    std::string EXTR_S_H(uint64 instruction, img_address m_pc);
-    std::string EXTR_W(uint64 instruction, img_address m_pc);
-    std::string EXTRV_R_W(uint64 instruction, img_address m_pc);
-    std::string EXTRV_RS_W(uint64 instruction, img_address m_pc);
-    std::string EXTRV_S_H(uint64 instruction, img_address m_pc);
-    std::string EXTRV_W(uint64 instruction, img_address m_pc);
-    std::string EXTW(uint64 instruction, img_address m_pc);
-    std::string FLOOR_L_D(uint64 instruction, img_address m_pc);
-    std::string FLOOR_L_S(uint64 instruction, img_address m_pc);
-    std::string FLOOR_W_D(uint64 instruction, img_address m_pc);
-    std::string FLOOR_W_S(uint64 instruction, img_address m_pc);
-    std::string FORK(uint64 instruction, img_address m_pc);
-    std::string HYPCALL(uint64 instruction, img_address m_pc);
-    std::string HYPCALL_16_(uint64 instruction, img_address m_pc);
-    std::string INS(uint64 instruction, img_address m_pc);
-    std::string INSV(uint64 instruction, img_address m_pc);
-    std::string IRET(uint64 instruction, img_address m_pc);
-    std::string JALRC_16_(uint64 instruction, img_address m_pc);
-    std::string JALRC_32_(uint64 instruction, img_address m_pc);
-    std::string JALRC_HB(uint64 instruction, img_address m_pc);
-    std::string JRC(uint64 instruction, img_address m_pc);
-    std::string LB_16_(uint64 instruction, img_address m_pc);
-    std::string LB_GP_(uint64 instruction, img_address m_pc);
-    std::string LB_S9_(uint64 instruction, img_address m_pc);
-    std::string LB_U12_(uint64 instruction, img_address m_pc);
-    std::string LBE(uint64 instruction, img_address m_pc);
-    std::string LBU_16_(uint64 instruction, img_address m_pc);
-    std::string LBU_GP_(uint64 instruction, img_address m_pc);
-    std::string LBU_S9_(uint64 instruction, img_address m_pc);
-    std::string LBU_U12_(uint64 instruction, img_address m_pc);
-    std::string LBUE(uint64 instruction, img_address m_pc);
-    std::string LBUX(uint64 instruction, img_address m_pc);
-    std::string LBX(uint64 instruction, img_address m_pc);
-    std::string LD_GP_(uint64 instruction, img_address m_pc);
-    std::string LD_S9_(uint64 instruction, img_address m_pc);
-    std::string LD_U12_(uint64 instruction, img_address m_pc);
-    std::string LDC1_GP_(uint64 instruction, img_address m_pc);
-    std::string LDC1_S9_(uint64 instruction, img_address m_pc);
-    std::string LDC1_U12_(uint64 instruction, img_address m_pc);
-    std::string LDC1X(uint64 instruction, img_address m_pc);
-    std::string LDC1XS(uint64 instruction, img_address m_pc);
-    std::string LDC2(uint64 instruction, img_address m_pc);
-    std::string LDM(uint64 instruction, img_address m_pc);
-    std::string LDPC_48_(uint64 instruction, img_address m_pc);
-    std::string LDX(uint64 instruction, img_address m_pc);
-    std::string LDXS(uint64 instruction, img_address m_pc);
-    std::string LH_16_(uint64 instruction, img_address m_pc);
-    std::string LH_GP_(uint64 instruction, img_address m_pc);
-    std::string LH_S9_(uint64 instruction, img_address m_pc);
-    std::string LH_U12_(uint64 instruction, img_address m_pc);
-    std::string LHE(uint64 instruction, img_address m_pc);
-    std::string LHU_16_(uint64 instruction, img_address m_pc);
-    std::string LHU_GP_(uint64 instruction, img_address m_pc);
-    std::string LHU_S9_(uint64 instruction, img_address m_pc);
-    std::string LHU_U12_(uint64 instruction, img_address m_pc);
-    std::string LHUE(uint64 instruction, img_address m_pc);
-    std::string LHUX(uint64 instruction, img_address m_pc);
-    std::string LHUXS(uint64 instruction, img_address m_pc);
-    std::string LHX(uint64 instruction, img_address m_pc);
-    std::string LHXS(uint64 instruction, img_address m_pc);
-    std::string LI_16_(uint64 instruction, img_address m_pc);
-    std::string LI_48_(uint64 instruction, img_address m_pc);
-    std::string LL(uint64 instruction, img_address m_pc);
-    std::string LLD(uint64 instruction, img_address m_pc);
-    std::string LLDP(uint64 instruction, img_address m_pc);
-    std::string LLE(uint64 instruction, img_address m_pc);
-    std::string LLWP(uint64 instruction, img_address m_pc);
-    std::string LLWPE(uint64 instruction, img_address m_pc);
-    std::string LSA(uint64 instruction, img_address m_pc);
-    std::string LUI(uint64 instruction, img_address m_pc);
-    std::string LW_16_(uint64 instruction, img_address m_pc);
-    std::string LW_4X4_(uint64 instruction, img_address m_pc);
-    std::string LWC1_GP_(uint64 instruction, img_address m_pc);
-    std::string LWC1_S9_(uint64 instruction, img_address m_pc);
-    std::string LWC1_U12_(uint64 instruction, img_address m_pc);
-    std::string LWC1X(uint64 instruction, img_address m_pc);
-    std::string LWC1XS(uint64 instruction, img_address m_pc);
-    std::string LWC2(uint64 instruction, img_address m_pc);
-    std::string LWE(uint64 instruction, img_address m_pc);
-    std::string LW_GP_(uint64 instruction, img_address m_pc);
-    std::string LW_GP16_(uint64 instruction, img_address m_pc);
-    std::string LWM(uint64 instruction, img_address m_pc);
-    std::string LWPC_48_(uint64 instruction, img_address m_pc);
-    std::string LW_S9_(uint64 instruction, img_address m_pc);
-    std::string LW_SP_(uint64 instruction, img_address m_pc);
-    std::string LW_U12_(uint64 instruction, img_address m_pc);
-    std::string LWU_GP_(uint64 instruction, img_address m_pc);
-    std::string LWU_S9_(uint64 instruction, img_address m_pc);
-    std::string LWU_U12_(uint64 instruction, img_address m_pc);
-    std::string LWUX(uint64 instruction, img_address m_pc);
-    std::string LWUXS(uint64 instruction, img_address m_pc);
-    std::string LWX(uint64 instruction, img_address m_pc);
-    std::string LWXS_16_(uint64 instruction, img_address m_pc);
-    std::string LWXS_32_(uint64 instruction, img_address m_pc);
-    std::string MADD_DSP_(uint64 instruction, img_address m_pc);
-    std::string MADDF_D(uint64 instruction, img_address m_pc);
-    std::string MADDF_S(uint64 instruction, img_address m_pc);
-    std::string MADDU_DSP_(uint64 instruction, img_address m_pc);
-    std::string MAQ_S_W_PHL(uint64 instruction, img_address m_pc);
-    std::string MAQ_S_W_PHR(uint64 instruction, img_address m_pc);
-    std::string MAQ_SA_W_PHL(uint64 instruction, img_address m_pc);
-    std::string MAQ_SA_W_PHR(uint64 instruction, img_address m_pc);
-    std::string MAX_D(uint64 instruction, img_address m_pc);
-    std::string MAX_S(uint64 instruction, img_address m_pc);
-    std::string MAXA_D(uint64 instruction, img_address m_pc);
-    std::string MAXA_S(uint64 instruction, img_address m_pc);
-    std::string MFC0(uint64 instruction, img_address m_pc);
-    std::string MFC1(uint64 instruction, img_address m_pc);
-    std::string MFC2(uint64 instruction, img_address m_pc);
-    std::string MFGC0(uint64 instruction, img_address m_pc);
-    std::string MFHC0(uint64 instruction, img_address m_pc);
-    std::string MFHC1(uint64 instruction, img_address m_pc);
-    std::string MFHC2(uint64 instruction, img_address m_pc);
-    std::string MFHGC0(uint64 instruction, img_address m_pc);
-    std::string MFHI_DSP_(uint64 instruction, img_address m_pc);
-    std::string MFHTR(uint64 instruction, img_address m_pc);
-    std::string MFLO_DSP_(uint64 instruction, img_address m_pc);
-    std::string MFTR(uint64 instruction, img_address m_pc);
-    std::string MIN_D(uint64 instruction, img_address m_pc);
-    std::string MIN_S(uint64 instruction, img_address m_pc);
-    std::string MINA_D(uint64 instruction, img_address m_pc);
-    std::string MINA_S(uint64 instruction, img_address m_pc);
-    std::string MOD(uint64 instruction, img_address m_pc);
-    std::string MODSUB(uint64 instruction, img_address m_pc);
-    std::string MODU(uint64 instruction, img_address m_pc);
-    std::string MOV_D(uint64 instruction, img_address m_pc);
-    std::string MOV_S(uint64 instruction, img_address m_pc);
-    std::string MOVE_BALC(uint64 instruction, img_address m_pc);
-    std::string MOVEP(uint64 instruction, img_address m_pc);
-    std::string MOVEP_REV_(uint64 instruction, img_address m_pc);
-    std::string MOVE(uint64 instruction, img_address m_pc);
-    std::string MOVN(uint64 instruction, img_address m_pc);
-    std::string MOVZ(uint64 instruction, img_address m_pc);
-    std::string MSUB_DSP_(uint64 instruction, img_address m_pc);
-    std::string MSUBF_D(uint64 instruction, img_address m_pc);
-    std::string MSUBF_S(uint64 instruction, img_address m_pc);
-    std::string MSUBU_DSP_(uint64 instruction, img_address m_pc);
-    std::string MTC0(uint64 instruction, img_address m_pc);
-    std::string MTC1(uint64 instruction, img_address m_pc);
-    std::string MTC2(uint64 instruction, img_address m_pc);
-    std::string MTGC0(uint64 instruction, img_address m_pc);
-    std::string MTHC0(uint64 instruction, img_address m_pc);
-    std::string MTHC1(uint64 instruction, img_address m_pc);
-    std::string MTHC2(uint64 instruction, img_address m_pc);
-    std::string MTHGC0(uint64 instruction, img_address m_pc);
-    std::string MTHI_DSP_(uint64 instruction, img_address m_pc);
-    std::string MTHLIP(uint64 instruction, img_address m_pc);
-    std::string MTHTR(uint64 instruction, img_address m_pc);
-    std::string MTLO_DSP_(uint64 instruction, img_address m_pc);
-    std::string MTTR(uint64 instruction, img_address m_pc);
-    std::string MUH(uint64 instruction, img_address m_pc);
-    std::string MUHU(uint64 instruction, img_address m_pc);
-    std::string MUL_32_(uint64 instruction, img_address m_pc);
-    std::string MUL_4X4_(uint64 instruction, img_address m_pc);
-    std::string MUL_D(uint64 instruction, img_address m_pc);
-    std::string MUL_PH(uint64 instruction, img_address m_pc);
-    std::string MUL_S(uint64 instruction, img_address m_pc);
-    std::string MUL_S_PH(uint64 instruction, img_address m_pc);
-    std::string MULEQ_S_W_PHL(uint64 instruction, img_address m_pc);
-    std::string MULEQ_S_W_PHR(uint64 instruction, img_address m_pc);
-    std::string MULEU_S_PH_QBL(uint64 instruction, img_address m_pc);
-    std::string MULEU_S_PH_QBR(uint64 instruction, img_address m_pc);
-    std::string MULQ_RS_PH(uint64 instruction, img_address m_pc);
-    std::string MULQ_RS_W(uint64 instruction, img_address m_pc);
-    std::string MULQ_S_PH(uint64 instruction, img_address m_pc);
-    std::string MULQ_S_W(uint64 instruction, img_address m_pc);
-    std::string MULSA_W_PH(uint64 instruction, img_address m_pc);
-    std::string MULSAQ_S_W_PH(uint64 instruction, img_address m_pc);
-    std::string MULT_DSP_(uint64 instruction, img_address m_pc);
-    std::string MULTU_DSP_(uint64 instruction, img_address m_pc);
-    std::string MULU(uint64 instruction, img_address m_pc);
-    std::string NEG_D(uint64 instruction, img_address m_pc);
-    std::string NEG_S(uint64 instruction, img_address m_pc);
-    std::string NOP_16_(uint64 instruction, img_address m_pc);
-    std::string NOP_32_(uint64 instruction, img_address m_pc);
-    std::string NOR(uint64 instruction, img_address m_pc);
-    std::string NOT_16_(uint64 instruction, img_address m_pc);
-    std::string OR_16_(uint64 instruction, img_address m_pc);
-    std::string OR_32_(uint64 instruction, img_address m_pc);
-    std::string ORI(uint64 instruction, img_address m_pc);
-    std::string PACKRL_PH(uint64 instruction, img_address m_pc);
-    std::string PAUSE(uint64 instruction, img_address m_pc);
-    std::string PICK_PH(uint64 instruction, img_address m_pc);
-    std::string PICK_QB(uint64 instruction, img_address m_pc);
-    std::string PRECEQ_W_PHL(uint64 instruction, img_address m_pc);
-    std::string PRECEQ_W_PHR(uint64 instruction, img_address m_pc);
-    std::string PRECEQU_PH_QBL(uint64 instruction, img_address m_pc);
-    std::string PRECEQU_PH_QBLA(uint64 instruction, img_address m_pc);
-    std::string PRECEQU_PH_QBR(uint64 instruction, img_address m_pc);
-    std::string PRECEQU_PH_QBRA(uint64 instruction, img_address m_pc);
-    std::string PRECEU_PH_QBL(uint64 instruction, img_address m_pc);
-    std::string PRECEU_PH_QBLA(uint64 instruction, img_address m_pc);
-    std::string PRECEU_PH_QBR(uint64 instruction, img_address m_pc);
-    std::string PRECEU_PH_QBRA(uint64 instruction, img_address m_pc);
-    std::string PRECR_QB_PH(uint64 instruction, img_address m_pc);
-    std::string PRECR_SRA_PH_W(uint64 instruction, img_address m_pc);
-    std::string PRECR_SRA_R_PH_W(uint64 instruction, img_address m_pc);
-    std::string PRECRQ_PH_W(uint64 instruction, img_address m_pc);
-    std::string PRECRQ_QB_PH(uint64 instruction, img_address m_pc);
-    std::string PRECRQ_RS_PH_W(uint64 instruction, img_address m_pc);
-    std::string PRECRQU_S_QB_PH(uint64 instruction, img_address m_pc);
-    std::string PREF_S9_(uint64 instruction, img_address m_pc);
-    std::string PREF_U12_(uint64 instruction, img_address m_pc);
-    std::string PREFE(uint64 instruction, img_address m_pc);
-    std::string PREPEND(uint64 instruction, img_address m_pc);
-    std::string RADDU_W_QB(uint64 instruction, img_address m_pc);
-    std::string RDDSP(uint64 instruction, img_address m_pc);
-    std::string RDHWR(uint64 instruction, img_address m_pc);
-    std::string RDPGPR(uint64 instruction, img_address m_pc);
-    std::string RECIP_D(uint64 instruction, img_address m_pc);
-    std::string RECIP_S(uint64 instruction, img_address m_pc);
-    std::string REPL_PH(uint64 instruction, img_address m_pc);
-    std::string REPL_QB(uint64 instruction, img_address m_pc);
-    std::string REPLV_PH(uint64 instruction, img_address m_pc);
-    std::string REPLV_QB(uint64 instruction, img_address m_pc);
-    std::string RESTORE_32_(uint64 instruction, img_address m_pc);
-    std::string RESTORE_JRC_16_(uint64 instruction, img_address m_pc);
-    std::string RESTORE_JRC_32_(uint64 instruction, img_address m_pc);
-    std::string RESTOREF(uint64 instruction, img_address m_pc);
-    std::string RINT_D(uint64 instruction, img_address m_pc);
-    std::string RINT_S(uint64 instruction, img_address m_pc);
-    std::string ROTR(uint64 instruction, img_address m_pc);
-    std::string ROTRV(uint64 instruction, img_address m_pc);
-    std::string ROTX(uint64 instruction, img_address m_pc);
-    std::string ROUND_L_D(uint64 instruction, img_address m_pc);
-    std::string ROUND_L_S(uint64 instruction, img_address m_pc);
-    std::string ROUND_W_D(uint64 instruction, img_address m_pc);
-    std::string ROUND_W_S(uint64 instruction, img_address m_pc);
-    std::string RSQRT_D(uint64 instruction, img_address m_pc);
-    std::string RSQRT_S(uint64 instruction, img_address m_pc);
-    std::string SAVE_16_(uint64 instruction, img_address m_pc);
-    std::string SAVE_32_(uint64 instruction, img_address m_pc);
-    std::string SAVEF(uint64 instruction, img_address m_pc);
-    std::string SB_16_(uint64 instruction, img_address m_pc);
-    std::string SB_GP_(uint64 instruction, img_address m_pc);
-    std::string SB_S9_(uint64 instruction, img_address m_pc);
-    std::string SB_U12_(uint64 instruction, img_address m_pc);
-    std::string SBE(uint64 instruction, img_address m_pc);
-    std::string SBX(uint64 instruction, img_address m_pc);
-    std::string SC(uint64 instruction, img_address m_pc);
-    std::string SCD(uint64 instruction, img_address m_pc);
-    std::string SCDP(uint64 instruction, img_address m_pc);
-    std::string SCE(uint64 instruction, img_address m_pc);
-    std::string SCWP(uint64 instruction, img_address m_pc);
-    std::string SCWPE(uint64 instruction, img_address m_pc);
-    std::string SD_GP_(uint64 instruction, img_address m_pc);
-    std::string SD_S9_(uint64 instruction, img_address m_pc);
-    std::string SD_U12_(uint64 instruction, img_address m_pc);
-    std::string SDBBP_16_(uint64 instruction, img_address m_pc);
-    std::string SDBBP_32_(uint64 instruction, img_address m_pc);
-    std::string SDC1_GP_(uint64 instruction, img_address m_pc);
-    std::string SDC1_S9_(uint64 instruction, img_address m_pc);
-    std::string SDC1_U12_(uint64 instruction, img_address m_pc);
-    std::string SDC1X(uint64 instruction, img_address m_pc);
-    std::string SDC1XS(uint64 instruction, img_address m_pc);
-    std::string SDC2(uint64 instruction, img_address m_pc);
-    std::string SDM(uint64 instruction, img_address m_pc);
-    std::string SDPC_48_(uint64 instruction, img_address m_pc);
-    std::string SDX(uint64 instruction, img_address m_pc);
-    std::string SDXS(uint64 instruction, img_address m_pc);
-    std::string SEB(uint64 instruction, img_address m_pc);
-    std::string SEH(uint64 instruction, img_address m_pc);
-    std::string SEL_D(uint64 instruction, img_address m_pc);
-    std::string SEL_S(uint64 instruction, img_address m_pc);
-    std::string SELEQZ_D(uint64 instruction, img_address m_pc);
-    std::string SELEQZ_S(uint64 instruction, img_address m_pc);
-    std::string SELNEZ_D(uint64 instruction, img_address m_pc);
-    std::string SELNEZ_S(uint64 instruction, img_address m_pc);
-    std::string SEQI(uint64 instruction, img_address m_pc);
-    std::string SH_16_(uint64 instruction, img_address m_pc);
-    std::string SH_GP_(uint64 instruction, img_address m_pc);
-    std::string SH_S9_(uint64 instruction, img_address m_pc);
-    std::string SH_U12_(uint64 instruction, img_address m_pc);
-    std::string SHE(uint64 instruction, img_address m_pc);
-    std::string SHILO(uint64 instruction, img_address m_pc);
-    std::string SHILOV(uint64 instruction, img_address m_pc);
-    std::string SHLL_PH(uint64 instruction, img_address m_pc);
-    std::string SHLL_QB(uint64 instruction, img_address m_pc);
-    std::string SHLL_S_PH(uint64 instruction, img_address m_pc);
-    std::string SHLL_S_W(uint64 instruction, img_address m_pc);
-    std::string SHLLV_PH(uint64 instruction, img_address m_pc);
-    std::string SHLLV_QB(uint64 instruction, img_address m_pc);
-    std::string SHLLV_S_PH(uint64 instruction, img_address m_pc);
-    std::string SHLLV_S_W(uint64 instruction, img_address m_pc);
-    std::string SHRA_PH(uint64 instruction, img_address m_pc);
-    std::string SHRA_QB(uint64 instruction, img_address m_pc);
-    std::string SHRA_R_PH(uint64 instruction, img_address m_pc);
-    std::string SHRA_R_QB(uint64 instruction, img_address m_pc);
-    std::string SHRA_R_W(uint64 instruction, img_address m_pc);
-    std::string SHRAV_PH(uint64 instruction, img_address m_pc);
-    std::string SHRAV_QB(uint64 instruction, img_address m_pc);
-    std::string SHRAV_R_PH(uint64 instruction, img_address m_pc);
-    std::string SHRAV_R_QB(uint64 instruction, img_address m_pc);
-    std::string SHRAV_R_W(uint64 instruction, img_address m_pc);
-    std::string SHRL_PH(uint64 instruction, img_address m_pc);
-    std::string SHRL_QB(uint64 instruction, img_address m_pc);
-    std::string SHRLV_PH(uint64 instruction, img_address m_pc);
-    std::string SHRLV_QB(uint64 instruction, img_address m_pc);
-    std::string SHX(uint64 instruction, img_address m_pc);
-    std::string SHXS(uint64 instruction, img_address m_pc);
-    std::string SIGRIE(uint64 instruction, img_address m_pc);
-    std::string SLL_16_(uint64 instruction, img_address m_pc);
-    std::string SLL_32_(uint64 instruction, img_address m_pc);
-    std::string SLLV(uint64 instruction, img_address m_pc);
-    std::string SLT(uint64 instruction, img_address m_pc);
-    std::string SLTI(uint64 instruction, img_address m_pc);
-    std::string SLTIU(uint64 instruction, img_address m_pc);
-    std::string SLTU(uint64 instruction, img_address m_pc);
-    std::string SOV(uint64 instruction, img_address m_pc);
-    std::string SPECIAL2(uint64 instruction, img_address m_pc);
-    std::string SQRT_D(uint64 instruction, img_address m_pc);
-    std::string SQRT_S(uint64 instruction, img_address m_pc);
-    std::string SRA(uint64 instruction, img_address m_pc);
-    std::string SRAV(uint64 instruction, img_address m_pc);
-    std::string SRL_16_(uint64 instruction, img_address m_pc);
-    std::string SRL_32_(uint64 instruction, img_address m_pc);
-    std::string SRLV(uint64 instruction, img_address m_pc);
-    std::string SUB(uint64 instruction, img_address m_pc);
-    std::string SUB_D(uint64 instruction, img_address m_pc);
-    std::string SUB_S(uint64 instruction, img_address m_pc);
-    std::string SUBQ_PH(uint64 instruction, img_address m_pc);
-    std::string SUBQ_S_PH(uint64 instruction, img_address m_pc);
-    std::string SUBQ_S_W(uint64 instruction, img_address m_pc);
-    std::string SUBQH_PH(uint64 instruction, img_address m_pc);
-    std::string SUBQH_R_PH(uint64 instruction, img_address m_pc);
-    std::string SUBQH_R_W(uint64 instruction, img_address m_pc);
-    std::string SUBQH_W(uint64 instruction, img_address m_pc);
-    std::string SUBU_16_(uint64 instruction, img_address m_pc);
-    std::string SUBU_32_(uint64 instruction, img_address m_pc);
-    std::string SUBU_PH(uint64 instruction, img_address m_pc);
-    std::string SUBU_QB(uint64 instruction, img_address m_pc);
-    std::string SUBU_S_PH(uint64 instruction, img_address m_pc);
-    std::string SUBU_S_QB(uint64 instruction, img_address m_pc);
-    std::string SUBUH_QB(uint64 instruction, img_address m_pc);
-    std::string SUBUH_R_QB(uint64 instruction, img_address m_pc);
-    std::string SW_16_(uint64 instruction, img_address m_pc);
-    std::string SW_4X4_(uint64 instruction, img_address m_pc);
-    std::string SW_GP16_(uint64 instruction, img_address m_pc);
-    std::string SW_GP_(uint64 instruction, img_address m_pc);
-    std::string SW_S9_(uint64 instruction, img_address m_pc);
-    std::string SW_SP_(uint64 instruction, img_address m_pc);
-    std::string SW_U12_(uint64 instruction, img_address m_pc);
-    std::string SWC1_GP_(uint64 instruction, img_address m_pc);
-    std::string SWC1_S9_(uint64 instruction, img_address m_pc);
-    std::string SWC1_U12_(uint64 instruction, img_address m_pc);
-    std::string SWC1X(uint64 instruction, img_address m_pc);
-    std::string SWC1XS(uint64 instruction, img_address m_pc);
-    std::string SWC2(uint64 instruction, img_address m_pc);
-    std::string SWE(uint64 instruction, img_address m_pc);
-    std::string SWM(uint64 instruction, img_address m_pc);
-    std::string SWPC_48_(uint64 instruction, img_address m_pc);
-    std::string SWX(uint64 instruction, img_address m_pc);
-    std::string SWXS(uint64 instruction, img_address m_pc);
-    std::string SYNC(uint64 instruction, img_address m_pc);
-    std::string SYNCI(uint64 instruction, img_address m_pc);
-    std::string SYNCIE(uint64 instruction, img_address m_pc);
-    std::string SYSCALL_16_(uint64 instruction, img_address m_pc);
-    std::string SYSCALL_32_(uint64 instruction, img_address m_pc);
-    std::string TEQ(uint64 instruction, img_address m_pc);
-    std::string TLBGINV(uint64 instruction, img_address m_pc);
-    std::string TLBGINVF(uint64 instruction, img_address m_pc);
-    std::string TLBGP(uint64 instruction, img_address m_pc);
-    std::string TLBGR(uint64 instruction, img_address m_pc);
-    std::string TLBGWI(uint64 instruction, img_address m_pc);
-    std::string TLBGWR(uint64 instruction, img_address m_pc);
-    std::string TLBINV(uint64 instruction, img_address m_pc);
-    std::string TLBINVF(uint64 instruction, img_address m_pc);
-    std::string TLBP(uint64 instruction, img_address m_pc);
-    std::string TLBR(uint64 instruction, img_address m_pc);
-    std::string TLBWI(uint64 instruction, img_address m_pc);
-    std::string TLBWR(uint64 instruction, img_address m_pc);
-    std::string TNE(uint64 instruction, img_address m_pc);
-    std::string TRUNC_L_D(uint64 instruction, img_address m_pc);
-    std::string TRUNC_L_S(uint64 instruction, img_address m_pc);
-    std::string TRUNC_W_D(uint64 instruction, img_address m_pc);
-    std::string TRUNC_W_S(uint64 instruction, img_address m_pc);
-    std::string UALDM(uint64 instruction, img_address m_pc);
-    std::string UALH(uint64 instruction, img_address m_pc);
-    std::string UALWM(uint64 instruction, img_address m_pc);
-    std::string UASDM(uint64 instruction, img_address m_pc);
-    std::string UASH(uint64 instruction, img_address m_pc);
-    std::string UASWM(uint64 instruction, img_address m_pc);
-    std::string UDI(uint64 instruction, img_address m_pc);
-    std::string WAIT(uint64 instruction, img_address m_pc);
-    std::string WRDSP(uint64 instruction, img_address m_pc);
-    std::string WRPGPR(uint64 instruction, img_address m_pc);
-    std::string XOR_16_(uint64 instruction, img_address m_pc);
-    std::string XOR_32_(uint64 instruction, img_address m_pc);
-    std::string XORI(uint64 instruction, img_address m_pc);
-    std::string YIELD(uint64 instruction, img_address m_pc);
-
     static Pool P_SYSCALL[2];
     static Pool P_RI[4];
     static Pool P_ADDIU[2];
-- 
2.25.1


