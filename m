Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FABC5B5A7E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 14:53:09 +0200 (CEST)
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXiw0-000307-5M
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 08:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiax-0006nq-KJ
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:31:27 -0400
Received: from mail-eopbgr70130.outbound.protection.outlook.com
 ([40.107.7.130]:60486 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiav-0006Rh-1y
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:31:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsX+NMw/CVHyosT5XmYzmd7Oa6f44uF+MAqhrcjLw8ALvUcHfwztluiBnYF9cprPZZraUiZSWzm5AJO4upmmnQPchI4AHAcVl0Z3wwh4WyDSGf1RT6F6vCxDit8FA00xsa1UtBguw/zuVFx5iBbMmIWhcjSn5TtsQyT0prgxf6ciSsxz9wxrw88XuzHz7H9ryTOdbFbNCAi1RNHheH/WkWBVYGbQU7YGqYlIxJT4DDLJNOFiTwyASkMfE8/j0yKoS5+jGsSjI34VsSkP1itJT5FmWoqyw11ZsCpntkXG9cW4cx6yTeCm5Y5AMMDbGw8m+JJHkNC+3/c99eArStA/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+JhZElbfZS799djYrCwHoZznXSD4o1pAG+XKnM+gR4=;
 b=LFOU8fuuQUkE09nL9M2mr0crC7sPdPS3ryx9eBaGwfmEkZ12bm5s8JGMpCm1SCSuZIXmYNhAQtn9CbrwuVDIwhOIWwUo8sjEUTndO8o7UhdIPkiX8C4JI/2G+XNlEMzGe47ixUaxZLcvmWD2gHtgZ51N4MVwUJ6YCka1X/D/SMKN+rbY1m5+0eggL92t5PxlLr01KL23rKyjTi7K680gdF4d3C8SwmObsK4bQVSAbgWbFZECP3dXp+9qxnMSVw71j7vA+K3Z+9LjB9rwDLXKxGn1Tv+FtdsfKg4phZRMagIwmpfftXBtn/S3QBDFytyT3sMIL7C0mZwl6OgPSqBpiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+JhZElbfZS799djYrCwHoZznXSD4o1pAG+XKnM+gR4=;
 b=jM3o8hn1suad1EsPKIkYLzyvM6aLqooJ6BEmRJmEQv0VkztoPcqM4n9d5bEiZ2RN/kn85GEDH3IUYQRegksOVLU8m7ad6yRUzjRNUpFZ1SgKfVfSz3H436hha17DK/iY4XV0Htcx24QrKNhazvBt+Lx57Q2HDL4YWhQy4Jnob4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DB4PR03MB9481.eurprd03.prod.outlook.com (2603:10a6:10:3f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:31:17 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:31:17 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v3 18/24] disas/nanomips: Prevent memory leaking
Date: Mon, 12 Sep 2022 14:26:29 +0200
Message-Id: <20220912122635.74032-19-milica.lazarevic@syrmia.com>
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
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|DB4PR03MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: cfdc4acb-bd99-4bc5-455b-08da94bab091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6kGwq12xOy0fmVWTPmWBDjnfkGLRNx47STF8iyFbzy4Mgjv/Pvg3hy+FF/VCSvLml1NxiMHT0mjJ7EVNKYDJiWYhsbb924ESdcChNUNALxbyTb7E50IZewjM7JKzia5Qcowzk5znAXy1vG+56fxm88GEZ1oMLUzzZmUGfY9IDBrp2DNUCsaMo02LScYTrn7D8OZZ25UlgJzJqPFRncvcWQKuIA4TGOhglGo/PKLdK4Q7txHEm5ioDAQpk9hViRQXRThHXgnDxHpHciOgQnXP20DvPXvppBeo63sdyTKUAXiPLRVcJUWcCOy4Y87tXvJzm+mOwS5Ks5IcPLUEfkJ8xRtGGIyItc+nKuP6tZJhWNs1H9ns2wjveZrnyQYDTpx7yhgczIajyik/s9cZgFhWnqIWUWbEsDtWvvjKKalj6CiK8sWuQEIXLvIb3XP2cSgqEMWlxcWQc1W9/wVNWXUieCswn6ns2UWD3iVgHtB5QZ637DoF/HXc4ui233mitTw0Famxs8jygGBoE4+7pk05IGLSKg99fOhWeY3AAbF8mJMSocESWexvqeWclkTYGIm3BIkeNZEKLiGYK+CQoEr5t/lK5pgMh8Q1gLnE4Su1KQKWFpX1Fu4Bz9BjT0vrlc4mNf/ADNdro+0SAZKCaenw3WBxfVXPIaOFbklanxGp/TGseW5c7sJj2qo2hPdcsQEd3tMQm7EhmzjISczeolfz3u8XFErQ0VUp3CKleR7oyQlHd4nci/NqCgi8fwi3rzw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39830400003)(376002)(346002)(366004)(396003)(38100700002)(26005)(36756003)(6512007)(41300700001)(83380400001)(107886003)(6666004)(2906002)(52116002)(8936002)(2616005)(44832011)(1076003)(186003)(6506007)(30864003)(5660300002)(86362001)(66556008)(66946007)(66476007)(8676002)(6486002)(4326008)(38350700002)(6916009)(316002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c21caZCq8oXk4aYSssLyk9s2UqVzTxfYnzgdBd7C/FqB2YSDuK8jRAXGv9ip?=
 =?us-ascii?Q?RW14vj1KDYSQZTSUhRZ+lQmU/0ozilP2m9rOOwyrXnAPW8KCCVJB3LQ+IQgB?=
 =?us-ascii?Q?jPRL5SNkXc1LHvggEYeVVoUkN4PWNNpJD2LdpS4lESKPrwHw7SofZETqRNpO?=
 =?us-ascii?Q?lE2U+y3sHRAfunJe/fL/GpOmYCSEJlrUixEfHl7uE1UKxUeoP1KPTvYrAn+t?=
 =?us-ascii?Q?lps/047UwUj3L896wpdCdZbzwiZHaXDEnAOnfFOHAZxZd8GOkAGXIjbPDFhA?=
 =?us-ascii?Q?eBbHhM30zqojAcGt4qBbySn5uqbzEli0NsXw9bcr/Kvht2EuOFeHTyfasFl9?=
 =?us-ascii?Q?JIUW20izrLDyL6A+2+vEGwtnLgofEunGofBad2VLFt6EaDiW7NtIRA3rCQfn?=
 =?us-ascii?Q?RpAMgNPppCUHAnhl3fuN8cb3iINhI4mULXpEhIjIOREiJOyZYj2pbkWRT+yG?=
 =?us-ascii?Q?vKdooUzYrps1XaWAiy5Bn8MVJovuObsepiPTkPwkGL47SaC8FCqHy41nyQE5?=
 =?us-ascii?Q?NpYsbCM08VQDpeulXT5GkNGKzQZFGxxJDtKijrK07Bi5G6oYUdnfE4dIqvad?=
 =?us-ascii?Q?YEQRa9y46ZJXtv9/gdiV7s1Jiw9wmAwAqmHhvy4h5sgoAcnZ/Jh/G16XBtz/?=
 =?us-ascii?Q?p7RgLfn/zUbkcP1G35QvmTo2pQpU59NXX1atOH3wXV04rcilFJrpu3Ny6FfW?=
 =?us-ascii?Q?4MT+5gfR67CBUwd3nDX7uLm5BYCWi2Vfj9BoaMoFxwgMq5Z99vyQbz3N965u?=
 =?us-ascii?Q?HrhU/hxw9T5QsCp8aD2dESmR80/FJ79tODI7mFsVWX8RMYw9ZbXHUhqFp3Wf?=
 =?us-ascii?Q?npMLz2e3bwSjMfR5VWtxpi7B0HFJfTsIfvyq95krZwrUJiIgArovw/H77Mon?=
 =?us-ascii?Q?4KXJWYc0CoMBebtEuA8FNBios+BEcHiS3oE6qdEOm+Ne+nCyKE9hLnoIKpz5?=
 =?us-ascii?Q?eJ9ht8b9OhWcAS5If8dvrlcu5NbZVHN93zprPSRMflsrIsR19yVTRnc73fus?=
 =?us-ascii?Q?aPcjfbQ/mSdnNj2lfj2YF24PtONaHZtc5tQrSXmdIujDgM+uouoYX7pnizuc?=
 =?us-ascii?Q?c0XGBUQVyqN7xpP0lK2wsbPY3TeoaJASbAgv47y6M9DnXV3JtPrtUJUPxcOs?=
 =?us-ascii?Q?6pPF9gnNQYCZrftMZDw9NPNhMm7BzX+zdn+U0+MVfHRFoIcbvaDPYToZr0ZF?=
 =?us-ascii?Q?sBqrKQwxJjafNZyAzWGh1os5pyMgxIj5L6uCaefwbYjdSvPYyuaQ3miFSWoy?=
 =?us-ascii?Q?6EWxikKvJy8POyuTlnDmxt/ZwzzMFqSkDL9+L4zHBcLRCBMcalTePA++D1EF?=
 =?us-ascii?Q?4Gs4TxRVVarKyNzB9bjK5R2oHGdg0WiF+yeigJSXw5R38bNRYVXWBlYmIfIW?=
 =?us-ascii?Q?GNprf7fvJE8ElY+Cq+KEd0yqToi24AOb917mNclgg2r4DX1zwOnYcJYWcMJJ?=
 =?us-ascii?Q?OPmQ7dpt3lSVr7XsJQITcqo+bMPEzBL3HRjdjn7S5JNAJZR6nZMYjPSKpg1k?=
 =?us-ascii?Q?B1Kh3aByyFwilHgdeCpYKXaXI6G15nZLDyDWE+kchFneZgnKKyhXkX0RbUc+?=
 =?us-ascii?Q?ZcQNBSc11KZnNrTyMDcxK5WSLRK0KflMR3/CNJQ6JoiMds643tdTtgW1Xxb9?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdc4acb-bd99-4bc5-455b-08da94bab091
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:31:17.5047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEuOy6nG3scGC63oknXgZ6DFmefCBtNNzDHdjQ2ZYydPuWzLSmQYYAYNeP/CZSmN/OkuuUVEaIUMaugN2p9y9eFa09n4Rw+gI9KySMdq3dA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9481
Received-SPF: pass client-ip=40.107.7.130;
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

g_autofree attribute is added for every dynamically allocated string to
prevent memory leaking.

The implementation of the several functions that work with dynamically
allocated strings is slightly changed so we can add those attributes.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 96 ++++++++++++++++++++++++----------------------
 1 file changed, 51 insertions(+), 45 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index e269f853e6..52b3708f75 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -1937,7 +1937,7 @@ static char *ADDIUPC_32_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -1959,7 +1959,7 @@ static char *ADDIUPC_48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 6, info);
+    g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2417,7 +2417,7 @@ static char *ALUIPC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
 }
@@ -2574,7 +2574,7 @@ static char *BALC_16_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 2, info);
+    g_autofree char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BALC %s", s);
 }
@@ -2594,7 +2594,7 @@ static char *BALC_32_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BALC %s", s);
 }
@@ -2639,7 +2639,7 @@ static char *BBEQZC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BBEQZC %s, 0x%" PRIx64 ", %s", rt, bit_value, s);
 }
@@ -2662,7 +2662,7 @@ static char *BBNEZC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BBNEZC %s, 0x%" PRIx64 ", %s", rt, bit_value, s);
 }
@@ -2682,7 +2682,7 @@ static char *BC_16_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 2, info);
+    g_autofree char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BC %s", s);
 }
@@ -2702,7 +2702,7 @@ static char *BC_32_(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC %s", s);
 }
@@ -2724,7 +2724,7 @@ static char *BC1EQZC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     const char *ft = FPR(ft_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC1EQZC %s, %s", ft, s);
 }
@@ -2746,7 +2746,7 @@ static char *BC1NEZC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     const char *ft = FPR(ft_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC1NEZC %s, %s", ft, s);
 }
@@ -2767,7 +2767,7 @@ static char *BC2EQZC(uint64 instruction, Dis_info *info)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC2EQZC CP%" PRIu64 ", %s", ct_value, s);
 }
@@ -2788,7 +2788,7 @@ static char *BC2NEZC(uint64 instruction, Dis_info *info)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BC2NEZC CP%" PRIu64 ", %s", ct_value, s);
 }
@@ -2812,7 +2812,7 @@ static char *BEQC_16_(uint64 instruction, Dis_info *info)
 
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = ADDRESS(u_value, 2, info);
+    g_autofree char *u = ADDRESS(u_value, 2, info);
 
     return img_format("BEQC %s, %s, %s", rs3, rt3, u);
 }
@@ -2836,7 +2836,7 @@ static char *BEQC_32_(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BEQC %s, %s, %s", rs, rt, s);
 }
@@ -2859,7 +2859,7 @@ static char *BEQIC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BEQIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
@@ -2881,7 +2881,7 @@ static char *BEQZC_16_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *s = ADDRESS(s_value, 2, info);
+    g_autofree char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BEQZC %s, %s", rt3, s);
 }
@@ -2905,7 +2905,7 @@ static char *BGEC(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEC %s, %s, %s", rs, rt, s);
 }
@@ -2928,7 +2928,7 @@ static char *BGEIC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
@@ -2951,7 +2951,7 @@ static char *BGEIUC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEIUC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
@@ -2975,7 +2975,7 @@ static char *BGEUC(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BGEUC %s, %s, %s", rs, rt, s);
 }
@@ -2999,7 +2999,7 @@ static char *BLTC(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTC %s, %s, %s", rs, rt, s);
 }
@@ -3022,7 +3022,7 @@ static char *BLTIC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
@@ -3045,7 +3045,7 @@ static char *BLTIUC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTIUC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
@@ -3069,7 +3069,7 @@ static char *BLTUC(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BLTUC %s, %s, %s", rs, rt, s);
 }
@@ -3093,7 +3093,7 @@ static char *BNEC_16_(uint64 instruction, Dis_info *info)
 
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = ADDRESS(u_value, 2, info);
+    g_autofree char *u = ADDRESS(u_value, 2, info);
 
     return img_format("BNEC %s, %s, %s", rs3, rt3, u);
 }
@@ -3117,7 +3117,7 @@ static char *BNEC_32_(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value);
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BNEC %s, %s, %s", rs, rt, s);
 }
@@ -3140,7 +3140,7 @@ static char *BNEIC(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BNEIC %s, 0x%" PRIx64 ", %s", rt, u_value, s);
 }
@@ -3162,7 +3162,7 @@ static char *BNEZC_16_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *s = ADDRESS(s_value, 2, info);
+    g_autofree char *s = ADDRESS(s_value, 2, info);
 
     return img_format("BNEZC %s, %s", rt3, s);
 }
@@ -3182,7 +3182,7 @@ static char *BPOSGE32C(uint64 instruction, Dis_info *info)
 {
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("BPOSGE32C %s", s);
 }
@@ -8182,7 +8182,7 @@ static char *LDPC_48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 6, info);
+    g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("LDPC %s, %s", rt, s);
 }
@@ -9146,7 +9146,7 @@ static char *LWPC_48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 6, info);
+    g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("LWPC %s, %s", rt, s);
 }
@@ -10131,7 +10131,7 @@ static char *MOVE_BALC(uint64 instruction, Dis_info *info)
 
     const char *rd1 = GPR(decode_gpr_gpr1(rd1_value));
     const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    char *s = ADDRESS(s_value, 4, info);
+    g_autofree char *s = ADDRESS(s_value, 4, info);
 
     return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
 }
@@ -12176,8 +12176,9 @@ static char *RESTORE_32_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    return img_format("RESTORE 0x%" PRIx64 "%s", u_value,
-               save_restore_list(rt_value, count_value, gp_value));
+    g_autofree char *save_restore_str = save_restore_list(
+        rt_value, count_value, gp_value);
+    return img_format("RESTORE 0x%" PRIx64 "%s", u_value, save_restore_str);
 }
 
 
@@ -12197,8 +12198,9 @@ static char *RESTORE_JRC_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    return img_format("RESTORE.JRC 0x%" PRIx64 "%s", u_value,
-        save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
+    g_autofree char *save_restore_str = save_restore_list(
+        encode_rt1_from_rt(rt1_value), count_value, 0);
+    return img_format("RESTORE.JRC 0x%" PRIx64 "%s", u_value, save_restore_str);
 }
 
 
@@ -12219,8 +12221,10 @@ static char *RESTORE_JRC_32_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
+    g_autofree char *save_restore_str = save_restore_list(
+        rt_value, count_value, gp_value);
     return img_format("RESTORE.JRC 0x%" PRIx64 "%s", u_value,
-               save_restore_list(rt_value, count_value, gp_value));
+                      save_restore_str);
 }
 
 
@@ -12509,8 +12513,9 @@ static char *SAVE_16_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    return img_format("SAVE 0x%" PRIx64 "%s", u_value,
-        save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
+    g_autofree char *save_restore_str = save_restore_list(
+        encode_rt1_from_rt(rt1_value), count_value, 0);
+    return img_format("SAVE 0x%" PRIx64 "%s", u_value, save_restore_str);
 }
 
 
@@ -12531,8 +12536,9 @@ static char *SAVE_32_(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    return img_format("SAVE 0x%" PRIx64 "%s", u_value,
-               save_restore_list(rt_value, count_value, gp_value));
+    g_autofree char *save_restore_str = save_restore_list(
+        rt_value, count_value, gp_value);
+    return img_format("SAVE 0x%" PRIx64 "%s", u_value, save_restore_str);
 }
 
 
@@ -13117,7 +13123,7 @@ static char *SDPC_48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 6, info);
+    g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("SDPC %s, %s", rt, s);
 }
@@ -15296,7 +15302,7 @@ static char *SWPC_48_(uint64 instruction, Dis_info *info)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *s = ADDRESS(s_value, 6, info);
+    g_autofree char *s = ADDRESS(s_value, 6, info);
 
     return img_format("SWPC %s, %s", rt, s);
 }
@@ -21935,7 +21941,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
     int status;
     bfd_byte buffer[2];
     uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
-    char *buf = NULL;
+    g_autofree char *buf = NULL;
 
     info->bytes_per_chunk = 2;
     info->display_endian = info->endian;
-- 
2.25.1


