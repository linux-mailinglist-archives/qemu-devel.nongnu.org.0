Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C2B592A75
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:53:23 +0200 (CEST)
Received: from localhost ([::1]:32926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUuY-0002ZB-NP
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUZV-000142-Hf
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:31:37 -0400
Received: from mail-eopbgr50098.outbound.protection.outlook.com
 ([40.107.5.98]:11086 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUZP-0001Au-CW
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:31:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtqUXBhkZ66s6HxBsgaT6i6B823OPNBvE5RJSoIp3sdl4iH2vGD6zBwMe6GktrIspQXhD/jd69XdFAdxKgyVgdm0g+JKlh5zH7fi+kj4QLtNtglRsRx3lYxbJ9mJhUo44NHK8CPcxNVbotz22TSVjhxZ3P09RUi5+ucRL3QaGJXYLSJZ1CVm4dPTv82LFYEzTpEWf/vDLYzRjzxiouwnvOPh0oA3zUfIdE9cKzcFr93PyZ9Kz5HLnadEeaexh6qC0wgs8gM5yKIKl8pitKWslhAta5Sa4ZkIJQBiMpyaGWphFDfG3aRjnAmtb9iPQX6Su1LYjlmSmUzdbN591e0DDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn7qUUe/D63pqUZ3JouYl7hjHEN5esYhwQ0AYDF/zxI=;
 b=QLIEUWKUwRGTQmHalX6YJ6KWfUC68Op0UaCz3Uvcv9Ba0syYirEQIKzzSLmob1uXB6TOSSPMKRaFusyHrZqywdcxzZIoEnB+ZfqHP38CgyLSsIFapthR75DSc6Q/seD4SCtVEYOU6yEDVZPooJ9uS4fL6IoTL9RHFvx22qw7xMwGPBa5DPcsbL7Oyif1Kr+uF7p6vnCeeVyqdCw8NBSCY0iIXF2TQWOxX3Bx2okjBs1tztDH3nK2kgT8Fl9uumkS/zVjBjf20LBnWUJIMQ2Uru3UghwziIPAYra4MnOktsYBuV5fQIjdr7eQKGHsfnVbApO6bf62aL4Z0PsRnm4IJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn7qUUe/D63pqUZ3JouYl7hjHEN5esYhwQ0AYDF/zxI=;
 b=Kczd2wJ2IkPObgYZMwSbgJJRDS9A2W1ohvU53PcwGpTdyTmNUTGOStv4B3NEDvWBLC0wR/pDMUmD5/aGKnqDekeClobEmhChRKqsBbqD+TngRLA3JujqnmiGAFENZqdlKZktj6iz1lBXSonYm3+q7GBSpuIi+jqPqRI7DqJ7zak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DU0PR03MB9152.eurprd03.prod.outlook.com (2603:10a6:10:471::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 07:30:57 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:30:57 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 14/20] disas/nanomips: Remove function overloading
Date: Mon, 15 Aug 2022 09:26:23 +0200
Message-Id: <20220815072629.12865-15-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: adb112d0-051c-489c-0452-08da7e901819
X-MS-TrafficTypeDiagnostic: DU0PR03MB9152:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jjNCwyd6r6VPH0Ci9uy4RSCI2KYbMUw4kQ1y7IhvbjpoZVN2bNqNscWYApPOsAcDe6Ljja2NjqcYl2NTg1TTwcnHDyT0DR3xSubvglAqRDhbtxDUzZ6dA9S4CbvzNP7177zWeDRPAXBvtSQOQrevuCNfUCcCJvV29cKo9KS5OBfK9aPQq1afICW8KxWYqGVC1JG/S4FcKu6p6h03T/VnbBJ+LJo9DU8zZ8r7rY9eJJRC5FfYqHbN8k3iHukoS/EHSeg4f0lFiO28bm0OkOh56xs/h6+cySzunTY7wVXk+6tURWMO/DEei8FbVG+bxc8ux+f164d8Ybeu5h69kh8vGWRqa/x2GE7ICCcqTbpaSCfGiq9/Tyqc4YzB6ohWEWbCGpRVPV49u07LD1yjoGIQH7oICArhPph7/p7NE7hwk39Pp/qkJLxfU2dCpjxy6lLL0M0/JNADQ9S1Nv2Iqr369o9euiipJckVdfiNdCprJbx1ocp5sa0uKbA3fQhygYCuovGv03KPWt99pN20eifpBdwQWLJ6+2COcXQpoDpex2PDEc6LK5QVa/4cstto+dPZ+WvEIISn/vrLIUe62wXW8/ygy2oCJacyZ6zoaGtFb20fpuVBxMDXB1rkuhRp1ZPzOKPfqUWYj5U2lkDhS0TNolmHPhGq3dSNghKepDYJcIzUBRE0OZZUojAXgOu3IJcAC/QUTCL+ZGfsFxR1XpP0OE9fFA/XFC8cUaQRAa8xwkgWnZLEky7UVC+x6JWHnYlivmZ6O6msXP1spItOC4V1ovzXI8YysjDLYWIXBRPDS6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39840400004)(376002)(396003)(136003)(346002)(366004)(52116002)(1076003)(8936002)(5660300002)(44832011)(2906002)(26005)(86362001)(30864003)(41300700001)(66476007)(186003)(6666004)(2616005)(6506007)(6512007)(83380400001)(478600001)(38100700002)(4326008)(8676002)(66556008)(316002)(107886003)(6916009)(38350700002)(6486002)(66946007)(36756003)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2+npTXN4/e5pMVQ7ui9/XNLPZjM4QVQ72a43La/6jI4CxRBXBAfUuV8dZ4mz?=
 =?us-ascii?Q?8bYvZPvdOogptTOFtnbBk+Zs2CfLEuuUgRzCmjkouXZP8Lox1qFkgTp22EkW?=
 =?us-ascii?Q?0SgBaxU37ytD7Aixj9A+5mfQlSX4tz5ZoNKzqEH+dtFTmKdGHs0Z+ppr8Iov?=
 =?us-ascii?Q?XiAUi7EzqGaaLSg3TIm/NGJg0UBp6BG9A8HzHGDXai21FmujKnADmP5q6ZSv?=
 =?us-ascii?Q?kRTj4ifBBZkcJW0aWcR6uIOzZQ+FS53OpUtmwq5o0UM9ImrZJ4VA5/3lzji2?=
 =?us-ascii?Q?xcmhD31DjolXvbiFTpsQKlTGJ8URuS/8R0wncWd/m8Zuoedl1bkMBtuK+ACY?=
 =?us-ascii?Q?ksgGiyt6qjX00MFUdX4FUxAVB2TbhwLMsXKzAPq1NgPei7a01R4awuStIvGy?=
 =?us-ascii?Q?CxyRf53pK4R23GSQSEFILAgq1z+3T2gpZWXP9tI9rQFA4Euetv7CnFLAQ0Uc?=
 =?us-ascii?Q?2wuqepndcp8f00uACpAu9h+Xq20PdFzw6+Zo3LKdOSo8QZ4drXhCAxgDlGZs?=
 =?us-ascii?Q?UjZRIRsc7NwnYoREIYJNpxUDDoyy433LAoeId4m/eL1soNdKqGuPOuaUi4co?=
 =?us-ascii?Q?5hx9q5F6DcDRZX32IzITJFqdI9vk9gxW0B/rEkMlZGShZ1oTGBOWp8ZQ45gA?=
 =?us-ascii?Q?lw1+72kHYhJsNoXqj6xbDVAwACFAjp902JqLF5uHe+aC2mW3ixD/SsrfLD81?=
 =?us-ascii?Q?me8pahvJ/x4xB8uZwxCVK0dKaGYOvf2MnWWYjjMB5y/UzXiMNQJ2b2yH6Qw+?=
 =?us-ascii?Q?6flcPM1NhqRD1dgCOnR9nB6nu7w7yedqI6oznoUl565oWQwTjVaxR9ANNXDT?=
 =?us-ascii?Q?RGzd4rCkYzt89g3jmTB8t3upxhBZBC2GiIN8lovSvY8hMVgWujItwunsxqXk?=
 =?us-ascii?Q?4E4w40OVxe1IJtLpidq+IRcBrcwPaDwJQsIJNhc6+SslCKiXFAZUyANZjS1e?=
 =?us-ascii?Q?AfKu/Jyz+2z1K/U8BIY8KbG7K9+plUAaevRmrCMZD6S+9yUNIqmuu0OOVrk6?=
 =?us-ascii?Q?x9VZcq5HLwF6qRnj1sl8jUEMVcR42ogj8/6a5DJkXtRxr4dq/m6bnODr8Thr?=
 =?us-ascii?Q?2e+aNyoNDiy4opbg31IF3cpJGhrDub3pfz2qhUb0Yomb+bVAdiexMNq0c8TL?=
 =?us-ascii?Q?9gnFEcjYTo1tqAQtMQaGX+/dqmtsW+Rg5D8B8Qw3Tc/0Hk6nVgLcHx0vfcn4?=
 =?us-ascii?Q?5Xx8jQrmUV6jSWa38qkoX34i+pCSdctmjk+VOgIWfyxkmCp3oXO5iiFRi3/o?=
 =?us-ascii?Q?OqHQhrSvEPzJo53TQXiqfVme0U4srAppkhtmLALFZ93d6FY9UlzFsfikoD60?=
 =?us-ascii?Q?NPl8aofUN2UerK972Sxpf1fyTvUxJYwwUffzZWDkuuxdbh8osUN6Xkvw+B0S?=
 =?us-ascii?Q?PN3pq6UI0jlJFecdMr0IEkPJEKJldvM60Sd0HHKi9+lNjQT+cBIW44Ey80Av?=
 =?us-ascii?Q?rU7WHwFZ/SL1e1KBE5+Ytb5ClVJbCXU83pWmdFgSc/ngpKTHLcRIR3aPWoVA?=
 =?us-ascii?Q?1Q5E4xDllO9GN3Oag2JPHKlYNTKqf6W5h9TsoZOuVBcnGkzcFmm4k5aM5W1g?=
 =?us-ascii?Q?DXIeyRhbOOCCuuDEl3PfYLV5reychhUDnl9AfVBBoLdikhkV8WG8C5SLaqdv?=
 =?us-ascii?Q?BA=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb112d0-051c-489c-0452-08da7e901819
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:30:57.3841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHDh5SnLtG9NXCneWWAEIOXu4lMscyjEiuLoFnqzC8g2q6x0KmpBpFAOGlDE1Ge3SLzYwWJm4G5dxiYc6jwMXZT5qYkk78oehkAxaVbtigg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9152
Received-SPF: pass client-ip=40.107.5.98;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Renamed the following functions by adding a suffix:
- copy to copy_ui and copy_i
- IMMEDIATE to IMMEDIATE_UI and IMMEDIATE_I
Calls to copy and IMMEDIATE functions are replaced based on the type of
arguments.

Disassemble function that calls the other variant of it is deleted.
Where it is called, now we're directly calling the other implementation.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 3103 ++++++++++++++++++++++----------------------
 1 file changed, 1550 insertions(+), 1553 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 551bcb3164..769368a984 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -398,13 +398,13 @@ static uint64 decode_gpr_gpr1(uint64 d)
 }
 
 
-static uint64 copy(uint64 d)
+static uint64 copy_ui(uint64 d)
 {
     return d;
 }
 
 
-static int64 copy(int64 d)
+static int64 copy_i(int64 d)
 {
     return d;
 }
@@ -568,13 +568,13 @@ static const char *AC(uint64 reg)
 }
 
 
-static const char *IMMEDIATE(uint64 value)
+static const char *IMMEDIATE_UI(uint64 value)
 {
     return img_format("0x%" PRIx64, value);
 }
 
 
-static const char *IMMEDIATE(int64 value)
+static const char *IMMEDIATE_I(int64 value)
 {
     return img_format("%" PRId64, value);
 }
@@ -1627,8 +1627,8 @@ static const char *ABS_D(uint64 instruction)
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *fs = FPR(copy(fs_value));
-    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *fd = FPR(copy_ui(fd_value));
 
     return img_format("ABS.D %s, %s", fd, fs);
 }
@@ -1649,8 +1649,8 @@ static const char *ABS_S(uint64 instruction)
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *fs = FPR(copy(fs_value));
-    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *fd = FPR(copy_ui(fd_value));
 
     return img_format("ABS.S %s, %s", fd, fs);
 }
@@ -1671,8 +1671,8 @@ static const char *ABSQ_S_PH(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("ABSQ_S.PH %s, %s", rt, rs);
 }
@@ -1693,8 +1693,8 @@ static const char *ABSQ_S_QB(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("ABSQ_S.QB %s, %s", rt, rs);
 }
@@ -1715,8 +1715,8 @@ static const char *ABSQ_S_W(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("ABSQ_S.W %s, %s", rt, rs);
 }
@@ -1737,9 +1737,9 @@ static const char *ACLR(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *bit = IMMEDIATE(copy(bit_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *bit = IMMEDIATE_UI(copy_ui(bit_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("ACLR %s, %s(%s)", bit, s, rs);
     free((char *)bit);
@@ -1763,9 +1763,9 @@ static const char *ADD(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADD %s, %s, %s", rd, rs, rt);
 }
@@ -1788,9 +1788,9 @@ static const char *ADD_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *fd = FPR(copy(fd_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *fd = FPR(copy_ui(fd_value));
 
     return img_format("ADD.D %s, %s, %s", fd, fs, ft);
 }
@@ -1813,9 +1813,9 @@ static const char *ADD_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *fd = FPR(copy(fd_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *fd = FPR(copy_ui(fd_value));
 
     return img_format("ADD.S %s, %s, %s", fd, fs, ft);
 }
@@ -1836,9 +1836,9 @@ static const char *ADDIU_32_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_15_to_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("ADDIU %s, %s, %s", rt, rs, u);
     free((char *)u);
@@ -1860,8 +1860,9 @@ static const char *ADDIU_48_(uint64 instruction)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+
     const char *ret = img_format("ADDIU %s, %s", rt, s);
     free((char *)s);
     return ret;
@@ -1882,8 +1883,9 @@ static const char *ADDIU_GP48_(uint64 instruction)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+
     const char *ret = img_format("ADDIU %s, $%d, %s", rt, 28, s);
     free((char *)s);
     return ret;
@@ -1904,8 +1906,8 @@ static const char *ADDIU_GP_B_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("ADDIU %s, $%d, %s", rt, 28, u);
     free((char *)u);
@@ -1927,8 +1929,8 @@ static const char *ADDIU_GP_W_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("ADDIU %s, $%d, %s", rt, 28, u);
     free((char *)u);
@@ -1951,9 +1953,9 @@ static const char *ADDIU_NEG_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *u = IMMEDIATE(neg_copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_I(neg_copy(u_value));
 
     const char *ret = img_format("ADDIU %s, %s, %s", rt, rs, u);
     free((char *)u);
@@ -1976,7 +1978,7 @@ static const char *ADDIU_R1_SP_(uint64 instruction)
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("ADDIU %s, $%d, %s", rt3, 29, u);
     free((char *)u);
@@ -2001,7 +2003,7 @@ static const char *ADDIU_R2_(uint64 instruction)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("ADDIU %s, %s, %s", rt3, rs3, u);
     free((char *)u);
@@ -2022,8 +2024,8 @@ static const char *ADDIU_RS5_(uint64 instruction)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
 
     const char *ret = img_format("ADDIU %s, %s", rt, s);
     free((char *)s);
@@ -2046,7 +2048,7 @@ static const char *ADDIUPC_32_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("ADDIUPC %s, %s", rt, s);
@@ -2070,7 +2072,7 @@ static const char *ADDIUPC_48_(uint64 instruction)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
     const char *ret = img_format("ADDIUPC %s, %s", rt, s);
@@ -2095,9 +2097,9 @@ static const char *ADDQ_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2120,9 +2122,9 @@ static const char *ADDQ_S_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2144,9 +2146,9 @@ static const char *ADDQ_S_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -2169,9 +2171,9 @@ static const char *ADDQH_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2194,9 +2196,9 @@ static const char *ADDQH_R_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2219,9 +2221,9 @@ static const char *ADDQH_R_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -2244,9 +2246,9 @@ static const char *ADDQH_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -2268,9 +2270,9 @@ static const char *ADDSC(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDSC %s, %s, %s", rd, rs, rt);
 }
@@ -2315,9 +2317,9 @@ static const char *ADDU_32_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDU %s, %s, %s", rd, rs, rt);
 }
@@ -2361,9 +2363,9 @@ static const char *ADDU_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2385,9 +2387,9 @@ static const char *ADDU_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2410,9 +2412,9 @@ static const char *ADDU_S_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2434,9 +2436,9 @@ static const char *ADDU_S_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2459,9 +2461,9 @@ static const char *ADDUH_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2484,9 +2486,9 @@ static const char *ADDUH_R_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2507,9 +2509,9 @@ static const char *ADDWC(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ADDWC %s, %s, %s", rd, rs, rt);
 }
@@ -2530,7 +2532,7 @@ static const char *ALUIPC(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
@@ -2576,9 +2578,9 @@ static const char *AND_32_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("AND %s, %s, %s", rd, rs, rt);
 }
@@ -2601,7 +2603,7 @@ static const char *ANDI_16_(uint64 instruction)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
+    const char *eu = IMMEDIATE_UI(encode_eu_from_u_andi16(eu_value));
 
     const char *ret = img_format("ANDI %s, %s, %s", rt3, rs3, eu);
     free((char *)eu);
@@ -2625,9 +2627,9 @@ static const char *ANDI_32_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("ANDI %s, %s, %s", rt, rs, u);
     free((char *)u);
@@ -2651,9 +2653,9 @@ static const char *APPEND(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("APPEND %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -2677,9 +2679,9 @@ static const char *ASET(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *bit = IMMEDIATE(copy(bit_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *bit = IMMEDIATE_UI(copy_ui(bit_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("ASET %s, %s(%s)", bit, s, rs);
     free((char *)bit);
@@ -2747,8 +2749,8 @@ static const char *BALRSC(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("BALRSC %s, %s", rt, rs);
 }
@@ -2770,8 +2772,8 @@ static const char *BBEQZC(uint64 instruction)
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *bit = IMMEDIATE(copy(bit_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *bit = IMMEDIATE_UI(copy_ui(bit_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BBEQZC %s, %s, %s", rt, bit, s);
@@ -2797,8 +2799,8 @@ static const char *BBNEZC(uint64 instruction)
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *bit = IMMEDIATE(copy(bit_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *bit = IMMEDIATE_UI(copy_ui(bit_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BBNEZC %s, %s, %s", rt, bit, s);
@@ -2867,7 +2869,7 @@ static const char *BC1EQZC(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *ft = FPR(copy(ft_value));
+    const char *ft = FPR(copy_ui(ft_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BC1EQZC %s, %s", ft, s);
@@ -2891,7 +2893,7 @@ static const char *BC1NEZC(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *ft = FPR(copy(ft_value));
+    const char *ft = FPR(copy_ui(ft_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BC1NEZC %s, %s", ft, s);
@@ -2915,7 +2917,7 @@ static const char *BC2EQZC(uint64 instruction)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *ct = CPR(copy(ct_value));
+    const char *ct = CPR(copy_ui(ct_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BC2EQZC %s, %s", ct, s);
@@ -2939,7 +2941,7 @@ static const char *BC2NEZC(uint64 instruction)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *ct = CPR(copy(ct_value));
+    const char *ct = CPR(copy_ui(ct_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BC2NEZC %s, %s", ct, s);
@@ -2990,8 +2992,8 @@ static const char *BEQC_32_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BEQC %s, %s, %s", rs, rt, s);
@@ -3016,8 +3018,8 @@ static const char *BEQIC(uint64 instruction)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BEQIC %s, %s, %s", rt, u, s);
@@ -3067,8 +3069,8 @@ static const char *BGEC(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BGEC %s, %s, %s", rs, rt, s);
@@ -3093,8 +3095,8 @@ static const char *BGEIC(uint64 instruction)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BGEIC %s, %s, %s", rt, u, s);
@@ -3120,8 +3122,8 @@ static const char *BGEIUC(uint64 instruction)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BGEIUC %s, %s, %s", rt, u, s);
@@ -3147,8 +3149,8 @@ static const char *BGEUC(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BGEUC %s, %s, %s", rs, rt, s);
@@ -3173,8 +3175,8 @@ static const char *BLTC(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BLTC %s, %s, %s", rs, rt, s);
@@ -3199,8 +3201,8 @@ static const char *BLTIC(uint64 instruction)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BLTIC %s, %s, %s", rt, u, s);
@@ -3226,8 +3228,8 @@ static const char *BLTIUC(uint64 instruction)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BLTIUC %s, %s, %s", rt, u, s);
@@ -3253,8 +3255,8 @@ static const char *BLTUC(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BLTUC %s, %s, %s", rs, rt, s);
@@ -3305,8 +3307,8 @@ static const char *BNEC_32_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BNEC %s, %s, %s", rs, rt, s);
@@ -3331,8 +3333,8 @@ static const char *BNEIC(uint64 instruction)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     const char *ret = img_format("BNEIC %s, %s, %s", rt, u, s);
@@ -3402,7 +3404,7 @@ static const char *BREAK_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    const char *code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     const char *ret = img_format("BREAK %s", code);
     free((char *)code);
@@ -3424,7 +3426,7 @@ static const char *BREAK_32_(uint64 instruction)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    const char *code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     const char *ret = img_format("BREAK %s", code);
     free((char *)code);
@@ -3446,7 +3448,7 @@ static const char *BRSC(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("BRSC %s", rs);
 }
@@ -3468,9 +3470,9 @@ static const char *CACHE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *op = IMMEDIATE(copy(op_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *op = IMMEDIATE_UI(copy_ui(op_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("CACHE %s, %s(%s)", op, s, rs);
     free((char *)op);
@@ -3495,9 +3497,9 @@ static const char *CACHEE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *op = IMMEDIATE(copy(op_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *op = IMMEDIATE_UI(copy_ui(op_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("CACHEE %s, %s(%s)", op, s, rs);
     free((char *)op);
@@ -3521,8 +3523,8 @@ static const char *CEIL_L_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CEIL.L.D %s, %s", ft, fs);
 }
@@ -3543,8 +3545,8 @@ static const char *CEIL_L_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CEIL.L.S %s, %s", ft, fs);
 }
@@ -3565,8 +3567,8 @@ static const char *CEIL_W_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CEIL.W.D %s, %s", ft, fs);
 }
@@ -3587,8 +3589,8 @@ static const char *CEIL_W_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CEIL.W.S %s, %s", ft, fs);
 }
@@ -3609,8 +3611,8 @@ static const char *CFC1(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
     return img_format("CFC1 %s, %s", rt, cs);
 }
@@ -3631,8 +3633,8 @@ static const char *CFC2(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
     return img_format("CFC2 %s, %s", rt, cs);
 }
@@ -3653,8 +3655,8 @@ static const char *CLASS_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CLASS.D %s, %s", ft, fs);
 }
@@ -3675,8 +3677,8 @@ static const char *CLASS_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CLASS.S %s, %s", ft, fs);
 }
@@ -3697,8 +3699,8 @@ static const char *CLO(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("CLO %s, %s", rt, rs);
 }
@@ -3719,8 +3721,8 @@ static const char *CLZ(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("CLZ %s, %s", rt, rs);
 }
@@ -3742,9 +3744,9 @@ static const char *CMP_AF_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.AF.D %s, %s, %s", fd, fs, ft);
 }
@@ -3766,9 +3768,9 @@ static const char *CMP_AF_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.AF.S %s, %s, %s", fd, fs, ft);
 }
@@ -3790,9 +3792,9 @@ static const char *CMP_EQ_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.EQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -3812,8 +3814,8 @@ static const char *CMP_EQ_PH(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMP.EQ.PH %s, %s", rs, rt);
 }
@@ -3835,9 +3837,9 @@ static const char *CMP_EQ_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.EQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -3859,9 +3861,9 @@ static const char *CMP_LE_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.LE.D %s, %s, %s", fd, fs, ft);
 }
@@ -3881,8 +3883,8 @@ static const char *CMP_LE_PH(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMP.LE.PH %s, %s", rs, rt);
 }
@@ -3904,9 +3906,9 @@ static const char *CMP_LE_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.LE.S %s, %s, %s", fd, fs, ft);
 }
@@ -3928,9 +3930,9 @@ static const char *CMP_LT_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.LT.D %s, %s, %s", fd, fs, ft);
 }
@@ -3950,8 +3952,8 @@ static const char *CMP_LT_PH(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMP.LT.PH %s, %s", rs, rt);
 }
@@ -3973,9 +3975,9 @@ static const char *CMP_LT_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.LT.S %s, %s, %s", fd, fs, ft);
 }
@@ -3997,9 +3999,9 @@ static const char *CMP_NE_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.NE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4021,9 +4023,9 @@ static const char *CMP_NE_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.NE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4045,9 +4047,9 @@ static const char *CMP_OR_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.OR.D %s, %s, %s", fd, fs, ft);
 }
@@ -4069,9 +4071,9 @@ static const char *CMP_OR_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.OR.S %s, %s, %s", fd, fs, ft);
 }
@@ -4093,9 +4095,9 @@ static const char *CMP_SAF_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SAF.D %s, %s, %s", fd, fs, ft);
 }
@@ -4117,9 +4119,9 @@ static const char *CMP_SAF_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SAF.S %s, %s, %s", fd, fs, ft);
 }
@@ -4141,9 +4143,9 @@ static const char *CMP_SEQ_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4165,9 +4167,9 @@ static const char *CMP_SEQ_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4189,9 +4191,9 @@ static const char *CMP_SLE_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SLE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4213,9 +4215,9 @@ static const char *CMP_SLE_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SLE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4237,9 +4239,9 @@ static const char *CMP_SLT_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SLT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4261,9 +4263,9 @@ static const char *CMP_SLT_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SLT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4285,9 +4287,9 @@ static const char *CMP_SNE_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4309,9 +4311,9 @@ static const char *CMP_SNE_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4333,9 +4335,9 @@ static const char *CMP_SOR_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SOR.D %s, %s, %s", fd, fs, ft);
 }
@@ -4357,9 +4359,9 @@ static const char *CMP_SOR_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SOR.S %s, %s, %s", fd, fs, ft);
 }
@@ -4381,9 +4383,9 @@ static const char *CMP_SUEQ_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SUEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4405,9 +4407,9 @@ static const char *CMP_SUEQ_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SUEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4429,9 +4431,9 @@ static const char *CMP_SULE_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4453,9 +4455,9 @@ static const char *CMP_SULE_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4477,9 +4479,9 @@ static const char *CMP_SULT_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4501,9 +4503,9 @@ static const char *CMP_SULT_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4525,9 +4527,9 @@ static const char *CMP_SUN_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SUN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4549,9 +4551,9 @@ static const char *CMP_SUNE_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SUNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4573,9 +4575,9 @@ static const char *CMP_SUNE_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SUNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4597,9 +4599,9 @@ static const char *CMP_SUN_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.SUN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4621,9 +4623,9 @@ static const char *CMP_UEQ_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.UEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4645,9 +4647,9 @@ static const char *CMP_UEQ_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.UEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4669,9 +4671,9 @@ static const char *CMP_ULE_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.ULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4693,9 +4695,9 @@ static const char *CMP_ULE_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.ULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4717,9 +4719,9 @@ static const char *CMP_ULT_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.ULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4741,9 +4743,9 @@ static const char *CMP_ULT_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.ULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4765,9 +4767,9 @@ static const char *CMP_UN_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.UN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4789,9 +4791,9 @@ static const char *CMP_UNE_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.UNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4813,9 +4815,9 @@ static const char *CMP_UNE_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.UNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4837,9 +4839,9 @@ static const char *CMP_UN_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("CMP.UN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4862,9 +4864,9 @@ static const char *CMPGDU_EQ_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMPGDU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4887,9 +4889,9 @@ static const char *CMPGDU_LE_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMPGDU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4912,9 +4914,9 @@ static const char *CMPGDU_LT_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMPGDU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4937,9 +4939,9 @@ static const char *CMPGU_EQ_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMPGU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4962,9 +4964,9 @@ static const char *CMPGU_LE_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMPGU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4987,9 +4989,9 @@ static const char *CMPGU_LT_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMPGU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -5010,8 +5012,8 @@ static const char *CMPU_EQ_QB(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMPU.EQ.QB %s, %s", rs, rt);
 }
@@ -5032,8 +5034,8 @@ static const char *CMPU_LE_QB(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMPU.LE.QB %s, %s", rs, rt);
 }
@@ -5054,8 +5056,8 @@ static const char *CMPU_LT_QB(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMPU.LT.QB %s, %s", rs, rt);
 }
@@ -5075,7 +5077,7 @@ static const char *COP2_1(uint64 instruction)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
-    const char *cofun = IMMEDIATE(copy(cofun_value));
+    const char *cofun = IMMEDIATE_UI(copy_ui(cofun_value));
 
     const char *ret = img_format("COP2_1 %s", cofun);
     free((char *)cofun);
@@ -5098,8 +5100,8 @@ static const char *CTC1(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
     return img_format("CTC1 %s, %s", rt, cs);
 }
@@ -5120,8 +5122,8 @@ static const char *CTC2(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
     return img_format("CTC2 %s, %s", rt, cs);
 }
@@ -5142,8 +5144,8 @@ static const char *CVT_D_L(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.D.L %s, %s", ft, fs);
 }
@@ -5164,8 +5166,8 @@ static const char *CVT_D_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.D.S %s, %s", ft, fs);
 }
@@ -5186,8 +5188,8 @@ static const char *CVT_D_W(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.D.W %s, %s", ft, fs);
 }
@@ -5208,8 +5210,8 @@ static const char *CVT_L_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.L.D %s, %s", ft, fs);
 }
@@ -5230,8 +5232,8 @@ static const char *CVT_L_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.L.S %s, %s", ft, fs);
 }
@@ -5252,8 +5254,8 @@ static const char *CVT_S_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.S.D %s, %s", ft, fs);
 }
@@ -5274,8 +5276,8 @@ static const char *CVT_S_L(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.S.L %s, %s", ft, fs);
 }
@@ -5296,8 +5298,8 @@ static const char *CVT_S_PL(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.S.PL %s, %s", ft, fs);
 }
@@ -5318,8 +5320,8 @@ static const char *CVT_S_PU(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.S.PU %s, %s", ft, fs);
 }
@@ -5340,8 +5342,8 @@ static const char *CVT_S_W(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.S.W %s, %s", ft, fs);
 }
@@ -5362,8 +5364,8 @@ static const char *CVT_W_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.W.D %s, %s", ft, fs);
 }
@@ -5384,8 +5386,8 @@ static const char *CVT_W_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.W.S %s, %s", ft, fs);
 }
@@ -5406,8 +5408,8 @@ static const char *DADDIU_48_(uint64 instruction)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
 
     const char *ret = img_format("DADDIU %s, %s", rt, s);
     free((char *)s);
@@ -5431,9 +5433,9 @@ static const char *DADDIU_NEG_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *u = IMMEDIATE(neg_copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(neg_copy(u_value));
 
     const char *ret = img_format("DADDIU %s, %s, %s", rt, rs, u);
     free((char *)u);
@@ -5457,9 +5459,9 @@ static const char *DADDIU_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("DADDIU %s, %s, %s", rt, rs, u);
     free((char *)u);
@@ -5483,9 +5485,9 @@ static const char *DADD(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DADD %s, %s, %s", rd, rs, rt);
 }
@@ -5507,9 +5509,9 @@ static const char *DADDU(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DADDU %s, %s, %s", rd, rs, rt);
 }
@@ -5530,8 +5532,8 @@ static const char *DCLO(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("DCLO %s, %s", rt, rs);
 }
@@ -5552,8 +5554,8 @@ static const char *DCLZ(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("DCLZ %s, %s", rt, rs);
 }
@@ -5575,9 +5577,9 @@ static const char *DDIV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DDIV %s, %s, %s", rd, rs, rt);
 }
@@ -5599,9 +5601,9 @@ static const char *DDIVU(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DDIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5642,10 +5644,10 @@ static const char *DEXTM(uint64 instruction)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *lsb = IMMEDIATE(copy(lsb_value));
-    const char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
+    const char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
     const char *ret = img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
     free((char *)lsb);
@@ -5671,10 +5673,10 @@ static const char *DEXT(uint64 instruction)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *lsb = IMMEDIATE(copy(lsb_value));
-    const char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
+    const char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
     const char *ret = img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
     free((char *)lsb);
@@ -5700,10 +5702,10 @@ static const char *DEXTU(uint64 instruction)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *lsb = IMMEDIATE(copy(lsb_value));
-    const char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
+    const char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
     const char *ret = img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
     free((char *)lsb);
@@ -5729,10 +5731,10 @@ static const char *DINSM(uint64 instruction)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    const char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(lsb_value));
+    const char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     const char *ret = img_format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
@@ -5760,10 +5762,10 @@ static const char *DINS(uint64 instruction)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    const char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(lsb_value));
+    const char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     const char *ret = img_format("DINS %s, %s, %s, %s", rt, rs, pos, size);
@@ -5791,10 +5793,10 @@ static const char *DINSU(uint64 instruction)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    const char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(lsb_value));
+    const char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     const char *ret = img_format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
@@ -5819,7 +5821,7 @@ static const char *DI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DI %s", rt);
 }
@@ -5841,9 +5843,9 @@ static const char *DIV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DIV %s, %s, %s", rd, rs, rt);
 }
@@ -5865,9 +5867,9 @@ static const char *DIV_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("DIV.D %s, %s, %s", fd, fs, ft);
 }
@@ -5889,9 +5891,9 @@ static const char *DIV_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("DIV.S %s, %s, %s", fd, fs, ft);
 }
@@ -5913,9 +5915,9 @@ static const char *DIVU(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5938,10 +5940,10 @@ static const char *DLSA(uint64 instruction)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *u2 = IMMEDIATE(copy(u2_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u2 = IMMEDIATE_UI(copy_ui(u2_value));
 
     const char *ret = img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
     free((char *)u2);
@@ -5964,8 +5966,8 @@ static const char *DLUI_48_(uint64 instruction)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     uint64 u_value = extract_u_31_to_0__s32(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("DLUI %s, %s", rt, u);
     free((char *)u);
@@ -5989,9 +5991,9 @@ static const char *DMFC0(uint64 instruction)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = CPR(copy(c0s_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
     free((char *)sel);
@@ -6014,8 +6016,8 @@ static const char *DMFC1(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("DMFC1 %s, %s", rt, fs);
 }
@@ -6036,8 +6038,8 @@ static const char *DMFC2(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
     return img_format("DMFC2 %s, %s", rt, cs);
 }
@@ -6059,9 +6061,9 @@ static const char *DMFGC0(uint64 instruction)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = CPR(copy(c0s_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
     free((char *)sel);
@@ -6085,9 +6087,9 @@ static const char *DMOD(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DMOD %s, %s, %s", rd, rs, rt);
 }
@@ -6109,9 +6111,9 @@ static const char *DMODU(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DMODU %s, %s, %s", rd, rs, rt);
 }
@@ -6133,9 +6135,9 @@ static const char *DMTC0(uint64 instruction)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = CPR(copy(c0s_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
     free((char *)sel);
@@ -6158,8 +6160,8 @@ static const char *DMTC1(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("DMTC1 %s, %s", rt, fs);
 }
@@ -6180,8 +6182,8 @@ static const char *DMTC2(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
     return img_format("DMTC2 %s, %s", rt, cs);
 }
@@ -6203,9 +6205,9 @@ static const char *DMTGC0(uint64 instruction)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = CPR(copy(c0s_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
     free((char *)sel);
@@ -6227,7 +6229,7 @@ static const char *DMT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DMT %s", rt);
 }
@@ -6249,9 +6251,9 @@ static const char *DMUH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DMUH %s, %s, %s", rd, rs, rt);
 }
@@ -6273,9 +6275,9 @@ static const char *DMUHU(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DMUHU %s, %s, %s", rd, rs, rt);
 }
@@ -6297,9 +6299,9 @@ static const char *DMUL(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DMUL %s, %s, %s", rd, rs, rt);
 }
@@ -6321,9 +6323,9 @@ static const char *DMULU(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DMULU %s, %s, %s", rd, rs, rt);
 }
@@ -6346,9 +6348,9 @@ static const char *DPA_W_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6370,9 +6372,9 @@ static const char *DPAQ_SA_L_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPAQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6394,9 +6396,9 @@ static const char *DPAQ_S_W_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6418,9 +6420,9 @@ static const char *DPAQX_SA_W_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPAQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6442,9 +6444,9 @@ static const char *DPAQX_S_W_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPAQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6466,9 +6468,9 @@ static const char *DPAU_H_QBL(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPAU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6490,9 +6492,9 @@ static const char *DPAU_H_QBR(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPAU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6514,9 +6516,9 @@ static const char *DPAX_W_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPAX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6538,9 +6540,9 @@ static const char *DPS_W_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPS.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6562,9 +6564,9 @@ static const char *DPSQ_SA_L_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPSQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6586,9 +6588,9 @@ static const char *DPSQ_S_W_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPSQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6610,9 +6612,9 @@ static const char *DPSQX_SA_W_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPSQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6634,9 +6636,9 @@ static const char *DPSQX_S_W_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPSQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6658,9 +6660,9 @@ static const char *DPSU_H_QBL(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPSU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6682,9 +6684,9 @@ static const char *DPSU_H_QBR(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPSU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6706,9 +6708,9 @@ static const char *DPSX_W_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DPSX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6730,9 +6732,9 @@ static const char *DROTR(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("DROTR %s, %s, %s", rt, rs, shift);
     free((char *)shift);
@@ -6756,9 +6758,9 @@ static const char *DROTR32(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("DROTR32 %s, %s, %s", rt, rs, shift);
     free((char *)shift);
@@ -6782,9 +6784,9 @@ static const char *DROTRV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -6807,10 +6809,10 @@ static const char *DROTX(uint64 instruction)
     uint64 shiftx_value = extract_shiftx_11_10_9_8_7_6(instruction);
     uint64 shift_value = extract_shift_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
-    const char *shiftx = IMMEDIATE(copy(shiftx_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
+    const char *shiftx = IMMEDIATE_UI(copy_ui(shiftx_value));
 
     const char *ret = img_format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
     free((char *)shift);
@@ -6835,9 +6837,9 @@ static const char *DSLL(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("DSLL %s, %s, %s", rt, rs, shift);
     free((char *)shift);
@@ -6861,9 +6863,9 @@ static const char *DSLL32(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("DSLL32 %s, %s, %s", rt, rs, shift);
     free((char *)shift);
@@ -6887,9 +6889,9 @@ static const char *DSLLV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DSLLV %s, %s, %s", rd, rs, rt);
 }
@@ -6911,9 +6913,9 @@ static const char *DSRA(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("DSRA %s, %s, %s", rt, rs, shift);
     free((char *)shift);
@@ -6937,9 +6939,9 @@ static const char *DSRA32(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("DSRA32 %s, %s, %s", rt, rs, shift);
     free((char *)shift);
@@ -6963,9 +6965,9 @@ static const char *DSRAV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DSRAV %s, %s, %s", rd, rs, rt);
 }
@@ -6987,9 +6989,9 @@ static const char *DSRL(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("DSRL %s, %s, %s", rt, rs, shift);
     free((char *)shift);
@@ -7013,9 +7015,9 @@ static const char *DSRL32(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("DSRL32 %s, %s, %s", rt, rs, shift);
     free((char *)shift);
@@ -7039,9 +7041,9 @@ static const char *DSRLV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DSRLV %s, %s, %s", rd, rs, rt);
 }
@@ -7063,9 +7065,9 @@ static const char *DSUB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DSUB %s, %s, %s", rd, rs, rt);
 }
@@ -7087,9 +7089,9 @@ static const char *DSUBU(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DSUBU %s, %s, %s", rd, rs, rt);
 }
@@ -7109,7 +7111,7 @@ static const char *DVPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DVPE %s", rt);
 }
@@ -7129,7 +7131,7 @@ static const char *DVP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DVP %s", rt);
 }
@@ -7167,7 +7169,7 @@ static const char *EI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("EI %s", rt);
 }
@@ -7187,7 +7189,7 @@ static const char *EMT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("EMT %s", rt);
 }
@@ -7243,7 +7245,7 @@ static const char *EVP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("EVP %s", rt);
 }
@@ -7263,7 +7265,7 @@ static const char *EVPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("EVPE %s", rt);
 }
@@ -7286,10 +7288,10 @@ static const char *EXT(uint64 instruction)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *lsb = IMMEDIATE(copy(lsb_value));
-    const char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
+    const char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
     const char *ret = img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
     free((char *)lsb);
@@ -7315,10 +7317,10 @@ static const char *EXTD(uint64 instruction)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
     free((char *)shift);
@@ -7343,10 +7345,10 @@ static const char *EXTD32(uint64 instruction)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
     free((char *)shift);
@@ -7370,9 +7372,9 @@ static const char *EXTPDP(uint64 instruction)
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    const char *size = IMMEDIATE(copy(size_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *size = IMMEDIATE_UI(copy_ui(size_value));
 
     const char *ret = img_format("EXTPDP %s, %s, %s", rt, ac, size);
     free((char *)size);
@@ -7396,9 +7398,9 @@ static const char *EXTPDPV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("EXTPDPV %s, %s, %s", rt, ac, rs);
 }
@@ -7420,9 +7422,9 @@ static const char *EXTP(uint64 instruction)
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    const char *size = IMMEDIATE(copy(size_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *size = IMMEDIATE_UI(copy_ui(size_value));
 
     const char *ret = img_format("EXTP %s, %s, %s", rt, ac, size);
     free((char *)size);
@@ -7446,9 +7448,9 @@ static const char *EXTPV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("EXTPV %s, %s, %s", rt, ac, rs);
 }
@@ -7471,9 +7473,9 @@ static const char *EXTR_RS_W(uint64 instruction)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
     free((char *)shift);
@@ -7498,9 +7500,9 @@ static const char *EXTR_R_W(uint64 instruction)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
     free((char *)shift);
@@ -7525,9 +7527,9 @@ static const char *EXTR_S_H(uint64 instruction)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
     free((char *)shift);
@@ -7552,9 +7554,9 @@ static const char *EXTR_W(uint64 instruction)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("EXTR.W %s, %s, %s", rt, ac, shift);
     free((char *)shift);
@@ -7579,9 +7581,9 @@ static const char *EXTRV_RS_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("EXTRV_RS.W %s, %s, %s", rt, ac, rs);
 }
@@ -7604,9 +7606,9 @@ static const char *EXTRV_R_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("EXTRV_R.W %s, %s, %s", rt, ac, rs);
 }
@@ -7629,9 +7631,9 @@ static const char *EXTRV_S_H(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("EXTRV_S.H %s, %s, %s", rt, ac, rs);
 }
@@ -7654,9 +7656,9 @@ static const char *EXTRV_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("EXTRV.W %s, %s, %s", rt, ac, rs);
 }
@@ -7680,10 +7682,10 @@ static const char *EXTW(uint64 instruction)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
     free((char *)shift);
@@ -7706,8 +7708,8 @@ static const char *FLOOR_L_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("FLOOR.L.D %s, %s", ft, fs);
 }
@@ -7728,8 +7730,8 @@ static const char *FLOOR_L_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("FLOOR.L.S %s, %s", ft, fs);
 }
@@ -7750,8 +7752,8 @@ static const char *FLOOR_W_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("FLOOR.W.D %s, %s", ft, fs);
 }
@@ -7772,8 +7774,8 @@ static const char *FLOOR_W_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("FLOOR.W.S %s, %s", ft, fs);
 }
@@ -7795,9 +7797,9 @@ static const char *FORK(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("FORK %s, %s, %s", rd, rs, rt);
 }
@@ -7817,7 +7819,7 @@ static const char *HYPCALL(uint64 instruction)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    const char *code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     const char *ret = img_format("HYPCALL %s", code);
     free((char *)code);
@@ -7839,7 +7841,7 @@ static const char *HYPCALL_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    const char *code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     const char *ret = img_format("HYPCALL %s", code);
     free((char *)code);
@@ -7864,10 +7866,10 @@ static const char *INS(uint64 instruction)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    const char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(lsb_value));
+    const char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     const char *ret = img_format("INS %s, %s, %s, %s", rt, rs, pos, size);
@@ -7892,8 +7894,8 @@ static const char *INSV(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("INSV %s, %s", rt, rs);
 }
@@ -7931,7 +7933,7 @@ static const char *JALRC_16_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("JALRC $%d, %s", 31, rt);
 }
@@ -7952,8 +7954,8 @@ static const char *JALRC_32_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("JALRC %s, %s", rt, rs);
 }
@@ -7974,8 +7976,8 @@ static const char *JALRC_HB(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("JALRC.HB %s, %s", rt, rs);
 }
@@ -7995,7 +7997,7 @@ static const char *JRC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("JRC %s", rt);
 }
@@ -8018,7 +8020,7 @@ static const char *LB_16_(uint64 instruction)
     uint64 u_value = extract_u_1_0(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     const char *ret = img_format("LB %s, %s(%s)", rt3, u, rs3);
@@ -8042,8 +8044,8 @@ static const char *LB_GP_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("LB %s, %s($%d)", rt, u, 28);
     free((char *)u);
@@ -8067,9 +8069,9 @@ static const char *LB_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LB %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -8093,9 +8095,9 @@ static const char *LB_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LB %s, %s(%s)", rt, u, rs);
     free((char *)u);
@@ -8119,9 +8121,9 @@ static const char *LBE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LBE %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -8146,7 +8148,7 @@ static const char *LBU_16_(uint64 instruction)
     uint64 u_value = extract_u_1_0(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     const char *ret = img_format("LBU %s, %s(%s)", rt3, u, rs3);
@@ -8170,8 +8172,8 @@ static const char *LBU_GP_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("LBU %s, %s($%d)", rt, u, 28);
     free((char *)u);
@@ -8195,9 +8197,9 @@ static const char *LBU_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LBU %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -8221,9 +8223,9 @@ static const char *LBU_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LBU %s, %s(%s)", rt, u, rs);
     free((char *)u);
@@ -8247,9 +8249,9 @@ static const char *LBUE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LBUE %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -8273,9 +8275,9 @@ static const char *LBUX(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LBUX %s, %s(%s)", rd, rs, rt);
 }
@@ -8297,9 +8299,9 @@ static const char *LBX(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LBX %s, %s(%s)", rd, rs, rt);
 }
@@ -8320,8 +8322,8 @@ static const char *LD_GP_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("LD %s, %s($%d)", rt, u, 28);
     free((char *)u);
@@ -8345,9 +8347,9 @@ static const char *LD_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LD %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -8371,9 +8373,9 @@ static const char *LD_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LD %s, %s(%s)", rt, u, rs);
     free((char *)u);
@@ -8396,8 +8398,8 @@ static const char *LDC1_GP_(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("LDC1 %s, %s($%d)", ft, u, 28);
     free((char *)u);
@@ -8421,9 +8423,9 @@ static const char *LDC1_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LDC1 %s, %s(%s)", ft, s, rs);
     free((char *)s);
@@ -8447,9 +8449,9 @@ static const char *LDC1_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LDC1 %s, %s(%s)", ft, u, rs);
     free((char *)u);
@@ -8473,9 +8475,9 @@ static const char *LDC1XS(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -8497,9 +8499,9 @@ static const char *LDC1X(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -8521,9 +8523,9 @@ static const char *LDC2(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ct = CPR(copy(ct_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ct = CPR(copy_ui(ct_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LDC2 %s, %s(%s)", ct, s, rs);
     free((char *)s);
@@ -8548,10 +8550,10 @@ static const char *LDM(uint64 instruction)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
     const char *ret = img_format("LDM %s, %s(%s), %s", rt, s, rs, count3);
     free((char *)s);
@@ -8575,7 +8577,7 @@ static const char *LDPC_48_(uint64 instruction)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
     const char *ret = img_format("LDPC %s, %s", rt, s);
@@ -8600,9 +8602,9 @@ static const char *LDX(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LDX %s, %s(%s)", rd, rs, rt);
 }
@@ -8624,9 +8626,9 @@ static const char *LDXS(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8649,7 +8651,7 @@ static const char *LH_16_(uint64 instruction)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     const char *ret = img_format("LH %s, %s(%s)", rt3, u, rs3);
@@ -8673,8 +8675,8 @@ static const char *LH_GP_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("LH %s, %s($%d)", rt, u, 28);
     free((char *)u);
@@ -8698,9 +8700,9 @@ static const char *LH_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LH %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -8724,9 +8726,9 @@ static const char *LH_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LH %s, %s(%s)", rt, u, rs);
     free((char *)u);
@@ -8750,9 +8752,9 @@ static const char *LHE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LHE %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -8777,7 +8779,7 @@ static const char *LHU_16_(uint64 instruction)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     const char *ret = img_format("LHU %s, %s(%s)", rt3, u, rs3);
@@ -8801,8 +8803,8 @@ static const char *LHU_GP_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("LHU %s, %s($%d)", rt, u, 28);
     free((char *)u);
@@ -8826,9 +8828,9 @@ static const char *LHU_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LHU %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -8852,9 +8854,9 @@ static const char *LHU_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LHU %s, %s(%s)", rt, u, rs);
     free((char *)u);
@@ -8878,9 +8880,9 @@ static const char *LHUE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LHUE %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -8904,9 +8906,9 @@ static const char *LHUX(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LHUX %s, %s(%s)", rd, rs, rt);
 }
@@ -8928,9 +8930,9 @@ static const char *LHUXS(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LHUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8952,9 +8954,9 @@ static const char *LHXS(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8976,9 +8978,9 @@ static const char *LHX(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LHX %s, %s(%s)", rd, rs, rt);
 }
@@ -9000,7 +9002,7 @@ static const char *LI_16_(uint64 instruction)
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
+    const char *eu = IMMEDIATE_I(encode_eu_from_s_li16(eu_value));
 
     const char *ret = img_format("LI %s, %s", rt3, eu);
     free((char *)eu);
@@ -9023,8 +9025,8 @@ static const char *LI_48_(uint64 instruction)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
 
     const char *ret = img_format("LI %s, %s", rt, s);
     free((char *)s);
@@ -9048,9 +9050,9 @@ static const char *LL(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LL %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -9074,9 +9076,9 @@ static const char *LLD(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LLD %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -9100,9 +9102,9 @@ static const char *LLDP(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ru = GPR(copy(ru_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ru = GPR(copy_ui(ru_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LLDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -9124,9 +9126,9 @@ static const char *LLE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LLE %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -9150,9 +9152,9 @@ static const char *LLWP(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ru = GPR(copy(ru_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ru = GPR(copy_ui(ru_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LLWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -9174,9 +9176,9 @@ static const char *LLWPE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ru = GPR(copy(ru_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ru = GPR(copy_ui(ru_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LLWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -9199,10 +9201,10 @@ static const char *LSA(uint64 instruction)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *u2 = IMMEDIATE(copy(u2_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u2 = IMMEDIATE_UI(copy_ui(u2_value));
 
     const char *ret = img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
     free((char *)u2);
@@ -9225,8 +9227,8 @@ static const char *LUI(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
 
     const char *ret = img_format("LUI %s, %%hi(%s)", rt, s);
     free((char *)s);
@@ -9251,7 +9253,7 @@ static const char *LW_16_(uint64 instruction)
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     const char *ret = img_format("LW %s, %s(%s)", rt3, u, rs3);
@@ -9277,7 +9279,7 @@ static const char *LW_4X4_(uint64 instruction)
     uint64 u_value = extract_u_3_8__s2(instruction);
 
     const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     const char *ret = img_format("LW %s, %s(%s)", rt4, u, rs4);
@@ -9301,8 +9303,8 @@ static const char *LW_GP_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("LW %s, %s($%d)", rt, u, 28);
     free((char *)u);
@@ -9326,7 +9328,7 @@ static const char *LW_GP16_(uint64 instruction)
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("LW %s, %s($%d)", rt3, u, 28);
     free((char *)u);
@@ -9350,9 +9352,9 @@ static const char *LW_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LW %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -9375,8 +9377,8 @@ static const char *LW_SP_(uint64 instruction)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("LW %s, %s($%d)", rt, u, 29);
     free((char *)u);
@@ -9400,9 +9402,9 @@ static const char *LW_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LW %s, %s(%s)", rt, u, rs);
     free((char *)u);
@@ -9425,8 +9427,8 @@ static const char *LWC1_GP_(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("LWC1 %s, %s($%d)", ft, u, 28);
     free((char *)u);
@@ -9450,9 +9452,9 @@ static const char *LWC1_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LWC1 %s, %s(%s)", ft, s, rs);
     free((char *)s);
@@ -9476,9 +9478,9 @@ static const char *LWC1_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LWC1 %s, %s(%s)", ft, u, rs);
     free((char *)u);
@@ -9502,9 +9504,9 @@ static const char *LWC1X(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -9526,9 +9528,9 @@ static const char *LWC1XS(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -9550,9 +9552,9 @@ static const char *LWC2(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ct = CPR(copy(ct_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ct = CPR(copy_ui(ct_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LWC2 %s, %s(%s)", ct, s, rs);
     free((char *)s);
@@ -9576,9 +9578,9 @@ static const char *LWE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LWE %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -9603,10 +9605,10 @@ static const char *LWM(uint64 instruction)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
     const char *ret = img_format("LWM %s, %s(%s), %s", rt, s, rs, count3);
     free((char *)s);
@@ -9630,7 +9632,7 @@ static const char *LWPC_48_(uint64 instruction)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
     const char *ret = img_format("LWPC %s, %s", rt, s);
@@ -9654,8 +9656,8 @@ static const char *LWU_GP_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("LWU %s, %s($%d)", rt, u, 28);
     free((char *)u);
@@ -9679,9 +9681,9 @@ static const char *LWU_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LWU %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -9705,9 +9707,9 @@ static const char *LWU_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("LWU %s, %s(%s)", rt, u, rs);
     free((char *)u);
@@ -9731,9 +9733,9 @@ static const char *LWUX(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LWUX %s, %s(%s)", rd, rs, rt);
 }
@@ -9755,9 +9757,9 @@ static const char *LWUXS(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LWUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9779,9 +9781,9 @@ static const char *LWX(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LWX %s, %s(%s)", rd, rs, rt);
 }
@@ -9805,7 +9807,7 @@ static const char *LWXS_16_(uint64 instruction)
 
     const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
+    const char *rt3 = IMMEDIATE_UI(decode_gpr_gpr3(rt3_value));
 
     const char *ret = img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
     free((char *)rt3);
@@ -9829,9 +9831,9 @@ static const char *LWXS_32_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("LWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9854,9 +9856,9 @@ static const char *MADD_DSP_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MADD %s, %s, %s", ac, rs, rt);
 }
@@ -9878,9 +9880,9 @@ static const char *MADDF_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MADDF.D %s, %s, %s", fd, fs, ft);
 }
@@ -9902,9 +9904,9 @@ static const char *MADDF_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MADDF.S %s, %s, %s", fd, fs, ft);
 }
@@ -9927,9 +9929,9 @@ static const char *MADDU_DSP_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MADDU %s, %s, %s", ac, rs, rt);
 }
@@ -9952,9 +9954,9 @@ static const char *MAQ_S_W_PHL(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MAQ_S.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -9977,9 +9979,9 @@ static const char *MAQ_S_W_PHR(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MAQ_S.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -10002,9 +10004,9 @@ static const char *MAQ_SA_W_PHL(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MAQ_SA.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -10027,9 +10029,9 @@ static const char *MAQ_SA_W_PHR(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MAQ_SA.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -10051,9 +10053,9 @@ static const char *MAX_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MAX.D %s, %s, %s", fd, fs, ft);
 }
@@ -10075,9 +10077,9 @@ static const char *MAX_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MAX.S %s, %s, %s", fd, fs, ft);
 }
@@ -10099,9 +10101,9 @@ static const char *MAXA_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MAXA.D %s, %s, %s", fd, fs, ft);
 }
@@ -10123,9 +10125,9 @@ static const char *MAXA_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MAXA.S %s, %s, %s", fd, fs, ft);
 }
@@ -10147,9 +10149,9 @@ static const char *MFC0(uint64 instruction)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = CPR(copy(c0s_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("MFC0 %s, %s, %s", rt, c0s, sel);
     free((char *)c0s);
@@ -10173,8 +10175,8 @@ static const char *MFC1(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("MFC1 %s, %s", rt, fs);
 }
@@ -10195,8 +10197,8 @@ static const char *MFC2(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
     return img_format("MFC2 %s, %s", rt, cs);
 }
@@ -10218,9 +10220,9 @@ static const char *MFGC0(uint64 instruction)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = CPR(copy(c0s_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
     free((char *)c0s);
@@ -10245,9 +10247,9 @@ static const char *MFHC0(uint64 instruction)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = CPR(copy(c0s_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
     free((char *)c0s);
@@ -10271,8 +10273,8 @@ static const char *MFHC1(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("MFHC1 %s, %s", rt, fs);
 }
@@ -10293,8 +10295,8 @@ static const char *MFHC2(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
     return img_format("MFHC2 %s, %s", rt, cs);
 }
@@ -10316,9 +10318,9 @@ static const char *MFHGC0(uint64 instruction)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = CPR(copy(c0s_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
     free((char *)c0s);
@@ -10341,8 +10343,8 @@ static const char *MFHI_DSP_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     return img_format("MFHI %s, %s", rt, ac);
 }
@@ -10365,10 +10367,10 @@ static const char *MFHTR(uint64 instruction)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = IMMEDIATE(copy(c0s_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
     free((char *)c0s);
@@ -10392,8 +10394,8 @@ static const char *MFLO_DSP_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     return img_format("MFLO %s, %s", rt, ac);
 }
@@ -10416,10 +10418,10 @@ static const char *MFTR(uint64 instruction)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = IMMEDIATE(copy(c0s_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
     free((char *)c0s);
@@ -10445,9 +10447,9 @@ static const char *MIN_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MIN.D %s, %s, %s", fd, fs, ft);
 }
@@ -10469,9 +10471,9 @@ static const char *MIN_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MIN.S %s, %s, %s", fd, fs, ft);
 }
@@ -10493,9 +10495,9 @@ static const char *MINA_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MINA.D %s, %s, %s", fd, fs, ft);
 }
@@ -10517,9 +10519,9 @@ static const char *MINA_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MINA.S %s, %s, %s", fd, fs, ft);
 }
@@ -10541,9 +10543,9 @@ static const char *MOD(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MOD %s, %s, %s", rd, rs, rt);
 }
@@ -10565,9 +10567,9 @@ static const char *MODSUB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MODSUB %s, %s, %s", rd, rs, rt);
 }
@@ -10589,9 +10591,9 @@ static const char *MODU(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MODU %s, %s, %s", rd, rs, rt);
 }
@@ -10612,8 +10614,8 @@ static const char *MOV_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("MOV.D %s, %s", ft, fs);
 }
@@ -10634,8 +10636,8 @@ static const char *MOV_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("MOV.S %s, %s", ft, fs);
 }
@@ -10736,8 +10738,8 @@ static const char *MOVE(uint64 instruction)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 rs_value = extract_rs_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("MOVE %s, %s", rt, rs);
 }
@@ -10759,9 +10761,9 @@ static const char *MOVN(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MOVN %s, %s, %s", rd, rs, rt);
 }
@@ -10783,9 +10785,9 @@ static const char *MOVZ(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MOVZ %s, %s, %s", rd, rs, rt);
 }
@@ -10807,9 +10809,9 @@ static const char *MSUB_DSP_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MSUB %s, %s, %s", ac, rs, rt);
 }
@@ -10831,9 +10833,9 @@ static const char *MSUBF_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MSUBF.D %s, %s, %s", fd, fs, ft);
 }
@@ -10855,9 +10857,9 @@ static const char *MSUBF_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MSUBF.S %s, %s, %s", fd, fs, ft);
 }
@@ -10879,9 +10881,9 @@ static const char *MSUBU_DSP_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MSUBU %s, %s, %s", ac, rs, rt);
 }
@@ -10903,9 +10905,9 @@ static const char *MTC0(uint64 instruction)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = CPR(copy(c0s_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("MTC0 %s, %s, %s", rt, c0s, sel);
     free((char *)c0s);
@@ -10929,8 +10931,8 @@ static const char *MTC1(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("MTC1 %s, %s", rt, fs);
 }
@@ -10951,8 +10953,8 @@ static const char *MTC2(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
     return img_format("MTC2 %s, %s", rt, cs);
 }
@@ -10974,9 +10976,9 @@ static const char *MTGC0(uint64 instruction)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = CPR(copy(c0s_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
     free((char *)c0s);
@@ -11001,9 +11003,9 @@ static const char *MTHC0(uint64 instruction)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = CPR(copy(c0s_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
     free((char *)c0s);
@@ -11027,8 +11029,8 @@ static const char *MTHC1(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("MTHC1 %s, %s", rt, fs);
 }
@@ -11049,8 +11051,8 @@ static const char *MTHC2(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *cs = CPR(copy_ui(cs_value));
 
     return img_format("MTHC2 %s, %s", rt, cs);
 }
@@ -11072,9 +11074,9 @@ static const char *MTHGC0(uint64 instruction)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = CPR(copy(c0s_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = CPR(copy_ui(c0s_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
     free((char *)c0s);
@@ -11097,8 +11099,8 @@ static const char *MTHI_DSP_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     return img_format("MTHI %s, %s", rs, ac);
 }
@@ -11118,8 +11120,8 @@ static const char *MTHLIP(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     return img_format("MTHLIP %s, %s", rs, ac);
 }
@@ -11142,10 +11144,10 @@ static const char *MTHTR(uint64 instruction)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = IMMEDIATE(copy(c0s_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
     free((char *)c0s);
@@ -11169,8 +11171,8 @@ static const char *MTLO_DSP_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     return img_format("MTLO %s, %s", rs, ac);
 }
@@ -11193,10 +11195,10 @@ static const char *MTTR(uint64 instruction)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *c0s = IMMEDIATE(copy(c0s_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
     free((char *)c0s);
@@ -11222,9 +11224,9 @@ static const char *MUH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MUH %s, %s, %s", rd, rs, rt);
 }
@@ -11246,9 +11248,9 @@ static const char *MUHU(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MUHU %s, %s, %s", rd, rs, rt);
 }
@@ -11270,9 +11272,9 @@ static const char *MUL_32_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MUL %s, %s, %s", rd, rs, rt);
 }
@@ -11316,9 +11318,9 @@ static const char *MUL_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MUL.D %s, %s, %s", fd, fs, ft);
 }
@@ -11341,9 +11343,9 @@ static const char *MUL_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MUL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11366,9 +11368,9 @@ static const char *MUL_S_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MUL_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11390,9 +11392,9 @@ static const char *MUL_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("MUL.S %s, %s, %s", fd, fs, ft);
 }
@@ -11415,9 +11417,9 @@ static const char *MULEQ_S_W_PHL(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MULEQ_S.W.PHL %s, %s, %s", rd, rs, rt);
 }
@@ -11440,9 +11442,9 @@ static const char *MULEQ_S_W_PHR(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MULEQ_S.W.PHR %s, %s, %s", rd, rs, rt);
 }
@@ -11465,9 +11467,9 @@ static const char *MULEU_S_PH_QBL(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MULEU_S.PH.QBL %s, %s, %s", rd, rs, rt);
 }
@@ -11490,9 +11492,9 @@ static const char *MULEU_S_PH_QBR(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MULEU_S.PH.QBR %s, %s, %s", rd, rs, rt);
 }
@@ -11515,9 +11517,9 @@ static const char *MULQ_RS_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MULQ_RS.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11540,9 +11542,9 @@ static const char *MULQ_RS_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MULQ_RS.W %s, %s, %s", rd, rs, rt);
 }
@@ -11565,9 +11567,9 @@ static const char *MULQ_S_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MULQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11590,9 +11592,9 @@ static const char *MULQ_S_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MULQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -11615,9 +11617,9 @@ static const char *MULSA_W_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MULSA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11640,9 +11642,9 @@ static const char *MULSAQ_S_W_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MULSAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11664,9 +11666,9 @@ static const char *MULT_DSP_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MULT %s, %s, %s", ac, rs, rt);
 }
@@ -11688,9 +11690,9 @@ static const char *MULTU_DSP_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *ac = AC(copy(ac_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MULTU %s, %s, %s", ac, rs, rt);
 }
@@ -11712,9 +11714,9 @@ static const char *MULU(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("MULU %s, %s, %s", rd, rs, rt);
 }
@@ -11735,8 +11737,8 @@ static const char *NEG_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("NEG.D %s, %s", ft, fs);
 }
@@ -11757,8 +11759,8 @@ static const char *NEG_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("NEG.S %s, %s", ft, fs);
 }
@@ -11816,9 +11818,9 @@ static const char *NOR(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("NOR %s, %s, %s", rd, rs, rt);
 }
@@ -11884,9 +11886,9 @@ static const char *OR_32_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("OR %s, %s, %s", rd, rs, rt);
 }
@@ -11908,9 +11910,9 @@ static const char *ORI(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("ORI %s, %s, %s", rt, rs, u);
     free((char *)u);
@@ -11935,9 +11937,9 @@ static const char *PACKRL_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("PACKRL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11978,9 +11980,9 @@ static const char *PICK_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("PICK.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12003,9 +12005,9 @@ static const char *PICK_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("PICK.QB %s, %s, %s", rd, rs, rt);
 }
@@ -12027,8 +12029,8 @@ static const char *PRECEQ_W_PHL(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEQ.W.PHL %s, %s", rt, rs);
 }
@@ -12050,8 +12052,8 @@ static const char *PRECEQ_W_PHR(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEQ.W.PHR %s, %s", rt, rs);
 }
@@ -12073,8 +12075,8 @@ static const char *PRECEQU_PH_QBLA(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEQU.PH.QBLA %s, %s", rt, rs);
 }
@@ -12096,8 +12098,8 @@ static const char *PRECEQU_PH_QBL(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEQU.PH.QBL %s, %s", rt, rs);
 }
@@ -12119,8 +12121,8 @@ static const char *PRECEQU_PH_QBRA(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEQU.PH.QBRA %s, %s", rt, rs);
 }
@@ -12142,8 +12144,8 @@ static const char *PRECEQU_PH_QBR(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEQU.PH.QBR %s, %s", rt, rs);
 }
@@ -12166,8 +12168,8 @@ static const char *PRECEU_PH_QBLA(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEU.PH.QBLA %s, %s", rt, rs);
 }
@@ -12189,8 +12191,8 @@ static const char *PRECEU_PH_QBL(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEU.PH.QBL %s, %s", rt, rs);
 }
@@ -12213,8 +12215,8 @@ static const char *PRECEU_PH_QBRA(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEU.PH.QBRA %s, %s", rt, rs);
 }
@@ -12236,8 +12238,8 @@ static const char *PRECEU_PH_QBR(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEU.PH.QBR %s, %s", rt, rs);
 }
@@ -12260,9 +12262,9 @@ static const char *PRECR_QB_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("PRECR.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12285,9 +12287,9 @@ static const char *PRECR_SRA_PH_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -12312,9 +12314,9 @@ static const char *PRECR_SRA_R_PH_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -12339,9 +12341,9 @@ static const char *PRECRQ_PH_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("PRECRQ.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -12364,9 +12366,9 @@ static const char *PRECRQ_QB_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("PRECRQ.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12389,9 +12391,9 @@ static const char *PRECRQ_RS_PH_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("PRECRQ_RS.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -12414,9 +12416,9 @@ static const char *PRECRQU_S_QB_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("PRECRQU_S.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12438,9 +12440,9 @@ static const char *PREF_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *hint = IMMEDIATE(copy(hint_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *hint = IMMEDIATE_UI(copy_ui(hint_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("PREF %s, %s(%s)", hint, s, rs);
     free((char *)hint);
@@ -12465,9 +12467,9 @@ static const char *PREF_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *hint = IMMEDIATE(copy(hint_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *hint = IMMEDIATE_UI(copy_ui(hint_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("PREF %s, %s(%s)", hint, u, rs);
     free((char *)hint);
@@ -12492,9 +12494,9 @@ static const char *PREFE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *hint = IMMEDIATE(copy(hint_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *hint = IMMEDIATE_UI(copy_ui(hint_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("PREFE %s, %s(%s)", hint, s, rs);
     free((char *)hint);
@@ -12519,9 +12521,9 @@ static const char *PREPEND(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("PREPEND %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -12543,8 +12545,8 @@ static const char *RADDU_W_QB(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("RADDU.W.QB %s, %s", rt, rs);
 }
@@ -12564,8 +12566,8 @@ static const char *RDDSP(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *mask = IMMEDIATE(copy(mask_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *mask = IMMEDIATE_UI(copy_ui(mask_value));
 
     const char *ret = img_format("RDDSP %s, %s", rt, mask);
     free((char *)mask);
@@ -12589,9 +12591,9 @@ static const char *RDHWR(uint64 instruction)
     uint64 hs_value = extract_hs_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *hs = CPR(copy(hs_value));
-    const char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *hs = CPR(copy_ui(hs_value));
+    const char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     const char *ret = img_format("RDHWR %s, %s, %s", rt, hs, sel);
     free((char *)hs);
@@ -12615,8 +12617,8 @@ static const char *RDPGPR(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("RDPGPR %s, %s", rt, rs);
 }
@@ -12637,8 +12639,8 @@ static const char *RECIP_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("RECIP.D %s, %s", ft, fs);
 }
@@ -12659,8 +12661,8 @@ static const char *RECIP_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("RECIP.S %s, %s", ft, fs);
 }
@@ -12681,8 +12683,8 @@ static const char *REPL_PH(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("REPL.PH %s, %s", rt, s);
 
@@ -12704,8 +12706,8 @@ static const char *REPL_QB(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("REPL.QB %s, %s", rt, u);
     free((char *)u);
@@ -12728,8 +12730,8 @@ static const char *REPLV_PH(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("REPLV.PH %s, %s", rt, rs);
 }
@@ -12749,8 +12751,8 @@ static const char *REPLV_QB(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("REPLV.QB %s, %s", rt, rs);
 }
@@ -12773,7 +12775,7 @@ static const char *RESTORE_32_(uint64 instruction)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *save_restore_str = save_restore_list(
         rt_value, count_value, gp_value);
 
@@ -12800,7 +12802,7 @@ static const char *RESTORE_JRC_16_(uint64 instruction)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *save_restore_str = save_restore_list(
         encode_rt1_from_rt(rt1_value), count_value, 0);
 
@@ -12828,7 +12830,7 @@ static const char *RESTORE_JRC_32_(uint64 instruction)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *save_restore_str = save_restore_list(
         rt_value, count_value, gp_value);
 
@@ -12854,8 +12856,8 @@ static const char *RESTOREF(uint64 instruction)
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *count = IMMEDIATE(copy(count_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *count = IMMEDIATE_UI(copy_ui(count_value));
 
     const char *ret = img_format("RESTOREF %s, %s", u, count);
     free((char *)u);
@@ -12879,8 +12881,8 @@ static const char *RINT_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("RINT.D %s, %s", ft, fs);
 }
@@ -12901,8 +12903,8 @@ static const char *RINT_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("RINT.S %s, %s", ft, fs);
 }
@@ -12924,9 +12926,9 @@ static const char *ROTR(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("ROTR %s, %s, %s", rt, rs, shift);
     free((char *)shift);
@@ -12950,9 +12952,9 @@ static const char *ROTRV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("ROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -12976,11 +12978,11 @@ static const char *ROTX(uint64 instruction)
     uint64 stripe_value = extract_stripe_6(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
-    const char *shiftx = IMMEDIATE(copy(shiftx_value));
-    const char *stripe = IMMEDIATE(copy(stripe_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
+    const char *shiftx = IMMEDIATE_UI(copy_ui(shiftx_value));
+    const char *stripe = IMMEDIATE_UI(copy_ui(stripe_value));
 
     const char *ret = img_format("ROTX %s, %s, %s, %s, %s",
                        rt, rs, shift, shiftx, stripe);
@@ -13006,8 +13008,8 @@ static const char *ROUND_L_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("ROUND.L.D %s, %s", ft, fs);
 }
@@ -13028,8 +13030,8 @@ static const char *ROUND_L_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("ROUND.L.S %s, %s", ft, fs);
 }
@@ -13050,8 +13052,8 @@ static const char *ROUND_W_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("ROUND.W.D %s, %s", ft, fs);
 }
@@ -13072,8 +13074,8 @@ static const char *ROUND_W_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("ROUND.W.S %s, %s", ft, fs);
 }
@@ -13094,8 +13096,8 @@ static const char *RSQRT_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("RSQRT.D %s, %s", ft, fs);
 }
@@ -13116,8 +13118,8 @@ static const char *RSQRT_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("RSQRT.S %s, %s", ft, fs);
 }
@@ -13139,7 +13141,7 @@ static const char *SAVE_16_(uint64 instruction)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *save_restore_str = save_restore_list(
         encode_rt1_from_rt(rt1_value), count_value, 0);
 
@@ -13167,7 +13169,7 @@ static const char *SAVE_32_(uint64 instruction)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *save_restore_str = save_restore_list(
         rt_value, count_value, gp_value);
 
@@ -13193,8 +13195,8 @@ static const char *SAVEF(uint64 instruction)
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *count = IMMEDIATE(copy(count_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *count = IMMEDIATE_UI(copy_ui(count_value));
 
     const char *ret = img_format("SAVEF %s, %s", u, count);
     free((char *)u);
@@ -13220,7 +13222,7 @@ static const char *SB_16_(uint64 instruction)
     uint64 u_value = extract_u_1_0(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     const char *ret = img_format("SB %s, %s(%s)", rtz3, u, rs3);
@@ -13244,8 +13246,8 @@ static const char *SB_GP_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("SB %s, %s($%d)", rt, u, 28);
     free((char *)u);
@@ -13269,9 +13271,9 @@ static const char *SB_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SB %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -13295,9 +13297,9 @@ static const char *SB_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SB %s, %s(%s)", rt, u, rs);
     free((char *)u);
@@ -13321,9 +13323,9 @@ static const char *SBE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SBE %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -13347,9 +13349,9 @@ static const char *SBX(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SBX %s, %s(%s)", rd, rs, rt);
 }
@@ -13371,9 +13373,9 @@ static const char *SC(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SC %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -13397,9 +13399,9 @@ static const char *SCD(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SCD %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -13423,9 +13425,9 @@ static const char *SCDP(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ru = GPR(copy(ru_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ru = GPR(copy_ui(ru_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SCDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -13447,9 +13449,9 @@ static const char *SCE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SCE %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -13473,9 +13475,9 @@ static const char *SCWP(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ru = GPR(copy(ru_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ru = GPR(copy_ui(ru_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SCWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -13497,9 +13499,9 @@ static const char *SCWPE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ru = GPR(copy(ru_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ru = GPR(copy_ui(ru_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SCWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -13520,8 +13522,8 @@ static const char *SD_GP_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("SD %s, %s($%d)", rt, u, 28);
     free((char *)u);
@@ -13545,9 +13547,9 @@ static const char *SD_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SD %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -13571,9 +13573,9 @@ static const char *SD_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SD %s, %s(%s)", rt, u, rs);
     free((char *)u);
@@ -13595,7 +13597,7 @@ static const char *SDBBP_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    const char *code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     const char *ret = img_format("SDBBP %s", code);
     free((char *)code);
@@ -13617,7 +13619,7 @@ static const char *SDBBP_32_(uint64 instruction)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    const char *code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     const char *ret = img_format("SDBBP %s", code);
     free((char *)code);
@@ -13640,8 +13642,8 @@ static const char *SDC1_GP_(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("SDC1 %s, %s($%d)", ft, u, 28);
     free((char *)u);
@@ -13665,9 +13667,9 @@ static const char *SDC1_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SDC1 %s, %s(%s)", ft, s, rs);
     free((char *)s);
@@ -13691,9 +13693,9 @@ static const char *SDC1_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SDC1 %s, %s(%s)", ft, u, rs);
     free((char *)u);
@@ -13717,9 +13719,9 @@ static const char *SDC1X(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -13741,9 +13743,9 @@ static const char *SDC1XS(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -13765,9 +13767,9 @@ static const char *SDC2(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *cs = CPR(copy(cs_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *cs = CPR(copy_ui(cs_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SDC2 %s, %s(%s)", cs, s, rs);
     free((char *)s);
@@ -13792,10 +13794,10 @@ static const char *SDM(uint64 instruction)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
     const char *ret = img_format("SDM %s, %s(%s), %s", rt, s, rs, count3);
     free((char *)s);
@@ -13819,7 +13821,7 @@ static const char *SDPC_48_(uint64 instruction)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
     const char *ret = img_format("SDPC %s, %s", rt, s);
@@ -13844,9 +13846,9 @@ static const char *SDXS(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -13868,9 +13870,9 @@ static const char *SDX(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SDX %s, %s(%s)", rd, rs, rt);
 }
@@ -13891,8 +13893,8 @@ static const char *SEB(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SEB %s, %s", rt, rs);
 }
@@ -13913,8 +13915,8 @@ static const char *SEH(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SEH %s, %s", rt, rs);
 }
@@ -13936,9 +13938,9 @@ static const char *SEL_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("SEL.D %s, %s, %s", fd, fs, ft);
 }
@@ -13960,9 +13962,9 @@ static const char *SEL_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("SEL.S %s, %s, %s", fd, fs, ft);
 }
@@ -13984,9 +13986,9 @@ static const char *SELEQZ_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("SELEQZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -14008,9 +14010,9 @@ static const char *SELEQZ_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("SELEQZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -14032,9 +14034,9 @@ static const char *SELNEZ_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("SELNEZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -14056,9 +14058,9 @@ static const char *SELNEZ_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("SELNEZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -14080,9 +14082,9 @@ static const char *SEQI(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("SEQI %s, %s, %s", rt, rs, u);
     free((char *)u);
@@ -14107,7 +14109,7 @@ static const char *SH_16_(uint64 instruction)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     const char *ret = img_format("SH %s, %s(%s)", rtz3, u, rs3);
@@ -14131,8 +14133,8 @@ static const char *SH_GP_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("SH %s, %s($%d)", rt, u, 28);
     free((char *)u);
@@ -14156,9 +14158,9 @@ static const char *SH_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SH %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -14182,9 +14184,9 @@ static const char *SH_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SH %s, %s(%s)", rt, u, rs);
     free((char *)u);
@@ -14208,9 +14210,9 @@ static const char *SHE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SHE %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -14233,8 +14235,8 @@ static const char *SHILO(uint64 instruction)
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *shift = IMMEDIATE(copy(shift_value));
-    const char *ac = AC(copy(ac_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     const char *ret = img_format("SHILO %s, %s", ac, shift);
     free((char *)shift);
@@ -14257,8 +14259,8 @@ static const char *SHILOV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     return img_format("SHILOV %s, %s", ac, rs);
 }
@@ -14280,9 +14282,9 @@ static const char *SHLL_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -14306,9 +14308,9 @@ static const char *SHLL_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -14333,9 +14335,9 @@ static const char *SHLL_S_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -14359,9 +14361,9 @@ static const char *SHLL_S_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -14386,9 +14388,9 @@ static const char *SHLLV_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SHLLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14410,9 +14412,9 @@ static const char *SHLLV_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SHLLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14435,9 +14437,9 @@ static const char *SHLLV_S_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SHLLV_S.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14459,9 +14461,9 @@ static const char *SHLLV_S_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SHLLV_S.W %s, %s, %s", rd, rt, rs);
 }
@@ -14483,9 +14485,9 @@ static const char *SHRA_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -14509,9 +14511,9 @@ static const char *SHRA_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -14535,9 +14537,9 @@ static const char *SHRA_R_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -14561,9 +14563,9 @@ static const char *SHRA_R_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -14587,9 +14589,9 @@ static const char *SHRA_R_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -14613,9 +14615,9 @@ static const char *SHRAV_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SHRAV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14637,9 +14639,9 @@ static const char *SHRAV_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SHRAV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14661,9 +14663,9 @@ static const char *SHRAV_R_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SHRAV_R.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14685,9 +14687,9 @@ static const char *SHRAV_R_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SHRAV_R.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14709,9 +14711,9 @@ static const char *SHRAV_R_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SHRAV_R.W %s, %s, %s", rd, rt, rs);
 }
@@ -14733,9 +14735,9 @@ static const char *SHRL_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -14759,9 +14761,9 @@ static const char *SHRL_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     const char *ret = img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
     free((char *)sa);
@@ -14786,9 +14788,9 @@ static const char *SHRLV_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SHRLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14810,9 +14812,9 @@ static const char *SHRLV_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SHRLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14834,9 +14836,9 @@ static const char *SHX(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SHX %s, %s(%s)", rd, rs, rt);
 }
@@ -14858,9 +14860,9 @@ static const char *SHXS(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -14880,7 +14882,7 @@ static const char *SIGRIE(uint64 instruction)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    const char *code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     const char *ret = img_format("SIGRIE %s", code);
     free((char *)code);
@@ -14906,7 +14908,7 @@ static const char *SLL_16_(uint64 instruction)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    const char *shift3 = IMMEDIATE_UI(encode_shift3_from_shift(shift3_value));
 
     const char *ret = img_format("SLL %s, %s, %s", rt3, rs3, shift3);
     free((char *)shift3);
@@ -14930,9 +14932,9 @@ static const char *SLL_32_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("SLL %s, %s, %s", rt, rs, shift);
     free((char *)shift);
@@ -14956,9 +14958,9 @@ static const char *SLLV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SLLV %s, %s, %s", rd, rs, rt);
 }
@@ -14980,9 +14982,9 @@ static const char *SLT(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SLT %s, %s, %s", rd, rs, rt);
 }
@@ -15004,9 +15006,9 @@ static const char *SLTI(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("SLTI %s, %s, %s", rt, rs, u);
     free((char *)u);
@@ -15030,9 +15032,9 @@ static const char *SLTIU(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("SLTIU %s, %s, %s", rt, rs, u);
     free((char *)u);
@@ -15056,9 +15058,9 @@ static const char *SLTU(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SLTU %s, %s, %s", rd, rs, rt);
 }
@@ -15080,9 +15082,9 @@ static const char *SOV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SOV %s, %s, %s", rd, rs, rt);
 }
@@ -15102,7 +15104,7 @@ static const char *SPECIAL2(uint64 instruction)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    const char *op = IMMEDIATE(copy(op_value));
+    const char *op = IMMEDIATE_UI(copy_ui(op_value));
 
     const char *ret = img_format("SPECIAL2 %s", op);
     free((char *)op);
@@ -15125,8 +15127,8 @@ static const char *SQRT_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("SQRT.D %s, %s", ft, fs);
 }
@@ -15147,8 +15149,8 @@ static const char *SQRT_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("SQRT.S %s, %s", ft, fs);
 }
@@ -15170,9 +15172,9 @@ static const char *SRA(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("SRA %s, %s, %s", rt, rs, shift);
     free((char *)shift);
@@ -15196,9 +15198,9 @@ static const char *SRAV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SRAV %s, %s, %s", rd, rs, rt);
 }
@@ -15222,7 +15224,7 @@ static const char *SRL_16_(uint64 instruction)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    const char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    const char *shift3 = IMMEDIATE_UI(encode_shift3_from_shift(shift3_value));
 
     const char *ret = img_format("SRL %s, %s, %s", rt3, rs3, shift3);
     free((char *)shift3);
@@ -15246,9 +15248,9 @@ static const char *SRL_32_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     const char *ret = img_format("SRL %s, %s, %s", rt, rs, shift);
     free((char *)shift);
@@ -15272,9 +15274,9 @@ static const char *SRLV(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SRLV %s, %s, %s", rd, rs, rt);
 }
@@ -15296,9 +15298,9 @@ static const char *SUB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUB %s, %s, %s", rd, rs, rt);
 }
@@ -15320,9 +15322,9 @@ static const char *SUB_D(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("SUB.D %s, %s, %s", fd, fs, ft);
 }
@@ -15344,9 +15346,9 @@ static const char *SUB_S(uint64 instruction)
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    const char *fd = FPR(copy(fd_value));
-    const char *fs = FPR(copy(fs_value));
-    const char *ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy_ui(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
 
     return img_format("SUB.S %s, %s, %s", fd, fs, ft);
 }
@@ -15368,9 +15370,9 @@ static const char *SUBQ_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15393,9 +15395,9 @@ static const char *SUBQ_S_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15418,9 +15420,9 @@ static const char *SUBQ_S_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -15443,9 +15445,9 @@ static const char *SUBQH_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15468,9 +15470,9 @@ static const char *SUBQH_R_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15493,9 +15495,9 @@ static const char *SUBQH_R_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -15518,9 +15520,9 @@ static const char *SUBQH_W(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -15566,9 +15568,9 @@ static const char *SUBU_32_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBU %s, %s, %s", rd, rs, rt);
 }
@@ -15590,9 +15592,9 @@ static const char *SUBU_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15614,9 +15616,9 @@ static const char *SUBU_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15639,9 +15641,9 @@ static const char *SUBU_S_PH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15664,9 +15666,9 @@ static const char *SUBU_S_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15689,9 +15691,9 @@ static const char *SUBUH_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15714,9 +15716,9 @@ static const char *SUBUH_R_QB(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SUBUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15739,7 +15741,7 @@ static const char *SW_16_(uint64 instruction)
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     const char *ret = img_format("SW %s, %s(%s)", rtz3, u, rs3);
@@ -15765,7 +15767,7 @@ static const char *SW_4X4_(uint64 instruction)
     uint64 u_value = extract_u_3_8__s2(instruction);
 
     const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     const char *ret = img_format("SW %s, %s(%s)", rtz4, u, rs4);
@@ -15790,7 +15792,7 @@ static const char *SW_GP16_(uint64 instruction)
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("SW %s, %s($%d)", rtz3, u, 28);
     free((char *)u);
@@ -15813,8 +15815,8 @@ static const char *SW_GP_(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("SW %s, %s($%d)", rt, u, 28);
     free((char *)u);
@@ -15838,9 +15840,9 @@ static const char *SW_S9_(uint64 instruction)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SW %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -15863,8 +15865,8 @@ static const char *SW_SP_(uint64 instruction)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("SW %s, %s($%d)", rt, u, 29);
     free((char *)u);
@@ -15888,9 +15890,9 @@ static const char *SW_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SW %s, %s(%s)", rt, u, rs);
     free((char *)u);
@@ -15913,8 +15915,8 @@ static const char *SWC1_GP_(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("SWC1 %s, %s($%d)", ft, u, 28);
     free((char *)u);
@@ -15938,9 +15940,9 @@ static const char *SWC1_S9_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SWC1 %s, %s(%s)", ft, s, rs);
     free((char *)s);
@@ -15964,9 +15966,9 @@ static const char *SWC1_U12_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SWC1 %s, %s(%s)", ft, u, rs);
     free((char *)u);
@@ -15990,9 +15992,9 @@ static const char *SWC1X(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -16014,9 +16016,9 @@ static const char *SWC1XS(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -16038,9 +16040,9 @@ static const char *SWC2(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *cs = CPR(copy(cs_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *cs = CPR(copy_ui(cs_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SWC2 %s, %s(%s)", cs, s, rs);
     free((char *)s);
@@ -16064,9 +16066,9 @@ static const char *SWE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SWE %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -16091,10 +16093,10 @@ static const char *SWM(uint64 instruction)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
     const char *ret = img_format("SWM %s, %s(%s), %s", rt, s, rs, count3);
     free((char *)s);
@@ -16118,7 +16120,7 @@ static const char *SWPC_48_(uint64 instruction)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
     const char *ret = img_format("SWPC %s, %s", rt, s);
@@ -16143,9 +16145,9 @@ static const char *SWX(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SWX %s, %s(%s)", rd, rs, rt);
 }
@@ -16167,9 +16169,9 @@ static const char *SWXS(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("SWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -16189,7 +16191,7 @@ static const char *SYNC(uint64 instruction)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
-    const char *stype = IMMEDIATE(copy(stype_value));
+    const char *stype = IMMEDIATE_UI(copy_ui(stype_value));
 
     const char *ret = img_format("SYNC %s", stype);
     free((char *)stype);
@@ -16212,8 +16214,8 @@ static const char *SYNCI(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SYNCI %s(%s)", s, rs);
     free((char *)s);
@@ -16236,8 +16238,8 @@ static const char *SYNCIE(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("SYNCIE %s(%s)", s, rs);
     free((char *)s);
@@ -16259,7 +16261,7 @@ static const char *SYSCALL_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    const char *code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     const char *ret = img_format("SYSCALL %s", code);
     free((char *)code);
@@ -16279,7 +16281,7 @@ static const char *SYSCALL_32_(uint64 instruction)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    const char *code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     const char *ret = img_format("SYSCALL %s", code);
     free((char *)code);
@@ -16302,8 +16304,8 @@ static const char *TEQ(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("TEQ %s, %s", rs, rt);
 }
@@ -16540,8 +16542,8 @@ static const char *TNE(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("TNE %s, %s", rs, rt);
 }
@@ -16562,8 +16564,8 @@ static const char *TRUNC_L_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("TRUNC.L.D %s, %s", ft, fs);
 }
@@ -16584,8 +16586,8 @@ static const char *TRUNC_L_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("TRUNC.L.S %s, %s", ft, fs);
 }
@@ -16606,8 +16608,8 @@ static const char *TRUNC_W_D(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("TRUNC.W.D %s, %s", ft, fs);
 }
@@ -16628,8 +16630,8 @@ static const char *TRUNC_W_S(uint64 instruction)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("TRUNC.W.S %s, %s", ft, fs);
 }
@@ -16652,10 +16654,10 @@ static const char *UALDM(uint64 instruction)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
     const char *ret = img_format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
     free((char *)s);
@@ -16680,9 +16682,9 @@ static const char *UALH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("UALH %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -16707,10 +16709,10 @@ static const char *UALWM(uint64 instruction)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
     const char *ret = img_format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
     free((char *)s);
@@ -16736,10 +16738,10 @@ static const char *UASDM(uint64 instruction)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
     const char *ret = img_format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
     free((char *)s);
@@ -16764,9 +16766,9 @@ static const char *UASH(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     const char *ret = img_format("UASH %s, %s(%s)", rt, s, rs);
     free((char *)s);
@@ -16791,10 +16793,10 @@ static const char *UASWM(uint64 instruction)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *count3 = IMMEDIATE_UI(encode_count3_from_count(count3_value));
 
     const char *ret = img_format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
     free((char *)s);
@@ -16817,7 +16819,7 @@ static const char *UDI(uint64 instruction)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    const char *op = IMMEDIATE(copy(op_value));
+    const char *op = IMMEDIATE_UI(copy_ui(op_value));
 
     const char *ret = img_format("UDI %s", op);
     free((char *)op);
@@ -16837,7 +16839,7 @@ static const char *WAIT(uint64 instruction)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
-    const char *code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     const char *ret = img_format("WAIT %s", code);
     free((char *)code);
@@ -16860,8 +16862,8 @@ static const char *WRDSP(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *mask = IMMEDIATE(copy(mask_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *mask = IMMEDIATE_UI(copy_ui(mask_value));
 
     const char *ret = img_format("WRDSP %s, %s", rt, mask);
     free((char *)mask);
@@ -16884,8 +16886,8 @@ static const char *WRPGPR(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("WRPGPR %s, %s", rt, rs);
 }
@@ -16929,9 +16931,9 @@ static const char *XOR_32_(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("XOR %s, %s, %s", rd, rs, rt);
 }
@@ -16953,9 +16955,9 @@ static const char *XORI(uint64 instruction)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     const char *ret = img_format("XORI %s, %s, %s", rt, rs, u);
     free((char *)u);
@@ -16977,8 +16979,8 @@ static const char *YIELD(uint64 instruction)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("YIELD %s, %s", rt, rs);
 }
@@ -22781,11 +22783,6 @@ static struct Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-static int Disassemble(const uint16 *data, char *dis,
-                     TABLE_ENTRY_TYPE & type)
-{
-    return Disassemble(data, dis, type, MAJOR, 2);
-}
 
 int nanomips_dis(char *buf,
                  unsigned address,
@@ -22799,7 +22796,7 @@ int nanomips_dis(char *buf,
     TABLE_ENTRY_TYPE type;
     m_pc = address;
     m_requested_instruction_categories = ALL_ATTRIBUTES;
-    int size = Disassemble(bits, disasm, type);
+    int size = Disassemble(bits, disasm, type, MAJOR, 2);
 
     strcpy(buf, disasm);
     return size;
-- 
2.25.1


