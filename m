Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED505AD055
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:42:40 +0200 (CEST)
Received: from localhost ([::1]:43536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9Yt-0001mZ-L1
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8vV-0005YE-AU
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:02:03 -0400
Received: from mail-eopbgr80133.outbound.protection.outlook.com
 ([40.107.8.133]:60797 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8vO-0002PP-T1
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:01:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrSNnEJEDagsx8Wu8KU8PPXkIOCz/+Zr1Zgs91wkcV4NIALJgS6e8LyOfVmk1wlN/GcsD/QCcCacP+RKr82h2LS51ompPuo5PsciepEJEYVFC3tgWcO0sRGRKLLPsLHbUHF+dhZN8bACCH7qOS8MQyZXAQtz47C/7x+yvspcZO9ejrABwn7WbmwC9tlbsFZoD5z/PjPejQyv4j9V45rXokxT9RFob6CKumFICeiNl0Xrz2ClxSMRcqu5wqUAZIprMmNPqVAsf0dTtAo6U7eFBctFX0DUzpbSAbr3to+EYQqVqEytLivLwUXzEsYxzSyyvREBPXAKV9dDOU1vQUAkFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8eg4D7s1dLAgGJYt4YsXoIIfD88NE8Il1fLkgMe4uo=;
 b=LntEpqlZBOpFJTezzV+SsviSdGDiQNZhr3EmTQBLcAzy6/vGbgcJUG/0cuc2QC9GO6ipAAPg9BNB3tVVi0gUzUaf37K4tMhPYTJtxjimVT6V/6kswAAQq408Cf6HhKNFv7He9aCREo+0St/jCGDmqUBVq+Vc3XmNR4W1aTZ08tWzztQjlNdSt+dg+n8TcwMxUHHJcEO6HBTjZG2lRikZqynD4yYk9g03rHIrh9MLx67+5xbiRRHIEKpgdQusO/S7dm20Oo2UF2dxYJjn6Cyhs/9WrEpyI650quR9KE+KnxysZhoql9E6nKWAijQM/fmMehMVNTWxi5uSvJ+5SVdDRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8eg4D7s1dLAgGJYt4YsXoIIfD88NE8Il1fLkgMe4uo=;
 b=e+eaSHop6sPH4RDnBgstmn0WTcfKT0NNTAdxUL3wm4FRZuJrRQP0ZqBaalWeUOc/R10dRqclYlmzbgxvYnmb6/wIXCeRVw3DBPsj+2yo1VygAk9ZeQVBxo2oCnXn0AHBREEVFiqhjc1/O3N+pxRcNV27WVTj4mYB2BRmwgafERs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DB6PR03MB2952.eurprd03.prod.outlook.com (2603:10a6:6:34::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 10:01:20 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 10:01:20 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 13/20] disas/nanomips: Prevent memory leaking
Date: Mon,  5 Sep 2022 11:55:15 +0200
Message-Id: <20220905095522.66941-14-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: b52719e4-59df-4a4b-3108-08da8f2594e3
X-MS-TrafficTypeDiagnostic: DB6PR03MB2952:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3OhJ+NsRfKl7SPCCi7nmbtycmBSo2Mcd7eK07sjXwBS2JLnKaTiRXsyDQyNafV8/0KgX32Gb1dxn+Mr6Vog+UC/Aas7/eR3gRq8F6khs5uzp8i7+48yv6h478oMkEzibW/XdQaMTU85aa0eZ1c3tDxLOPtACEJ088bWkHtlyO4E2/vHG7sSyM/tGLOqOq99Dgjd6Vd76yRmqTqDfiN5BB4qPT9INwwjLSj5I1ufhz9DAsv+TmVuPFinY7uqVdDotkN3pa1LIsz0aVDSaIDh7qQw8+lDFViBa9Wa3DYQS9gr6OekHzHBgAPKG8whBtnjNPs+2Lf0l/YkuD3Yr2E47HD72TRXGZSXKzPR/E1gTFqAGZ/TiiCfTZYVE9doswdxRd7kkFpyojb3+5hsfwQEv5I8hBvnJWcGHZvJ3cl8pP+Ow+2KWUBcHx1yOY1PAXAabKXyk7TQtrracVnzY7YaAJh435c8TEyL08DyG8YLMiH6hqxtw9mkrWxUC2roJRrPBvAXS2B8fmWhleVAF2zXS5j+ZFKVQh+6ylglEtjR9ODigkI4KzzEFynonFp/H3ct5PENeDgWlT2VsUjY/XyfyjDNxSFMaZTtETnvt1XBen0euPDUHbMkF02X5ZcHE3LfI7Jq6gLnMuOgfRjnUOMLjJuXMGKRScAkNIe/dRVZqLVVWlGlk8iOn7DRGwkOSpAvJOJ54+pA8cZqMG6No7VI4OMXUzrhX3cqvtmQDRj+iBZhiCyg9wsd0XAsq/CE+3Wg6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(366004)(39830400003)(136003)(396003)(86362001)(52116002)(107886003)(6666004)(1076003)(186003)(2616005)(41300700001)(6486002)(6512007)(26005)(478600001)(6506007)(38100700002)(38350700002)(83380400001)(316002)(5660300002)(8936002)(6916009)(2906002)(44832011)(66946007)(36756003)(8676002)(4326008)(66556008)(66476007)(30864003)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cK3TR/csRyO601nvmSyO8/mRYHA4KhD2k+J424V/k2XcQRl9GPPyZAWUwC3t?=
 =?us-ascii?Q?pv+HDfpJzAkTjw/IEETSbj5s2q+KrNKefpMd3ZGu6Eje0SS0VQw4OEdSvYIh?=
 =?us-ascii?Q?lKshRHvlnVaGxCVjsu+P2THZS0uXaqkzLs2e0sD7lOCmr5mjOwz8KfhBiVSH?=
 =?us-ascii?Q?uw8ee6k7ao0EmZkexSAG1tEKl/fHr1WhS9ITdEqAXuNvVgMD16uHxbdR1kk+?=
 =?us-ascii?Q?cKLwyrCra3I+sCqTm0QjnBzacfKBHiSDTGvb1yF07PechPws1luVC6JNQDvh?=
 =?us-ascii?Q?AK2fAqjB/Gk2eI/XM3mCW2mbPVVD5lgJ8xZpuPIGu3WibuSWu+Cp3YpUtdpH?=
 =?us-ascii?Q?hLqr4wkSg4X1V+4EBZXVD4zKbZrMEB/v4YHxFdWHlZb1atnB65td+n+kSLUk?=
 =?us-ascii?Q?A2qRYCLC6WpCVBl0bMlY5orSZ13UF5MlnzacEPC60SUChwN/ONK5ocAONjsx?=
 =?us-ascii?Q?vV+NE7On5zOmTN2G3PrRW1h6MtX20CikmGtZw8o3PothqhvgyR0w8zNrAAMr?=
 =?us-ascii?Q?F74BMAH3OT40yq3GTfOMIllOSmVxIVCJ5zrUjOsKsuOMo9tmkhW1oQmR5Iuo?=
 =?us-ascii?Q?SGT+Sp35Tv3YnuM14jGJAoHrOqg/VN3A/pTZ/Jlhv8DKEmqBvxjJD4mpAwqX?=
 =?us-ascii?Q?KE0cWmQUkcA6XeskvMLhI3a/j1ce16qew1lknmERp95Ck5EAiJaP7IjfeAL9?=
 =?us-ascii?Q?1p798V4YBDdP7dAkz1fRTcgxYlu5FxjmfXiSNgQVzKbckyhbWZw1vMtxHnYW?=
 =?us-ascii?Q?Z5V+eyqVcduCMN9jE6n4/M/MXRdc+hKzytm/8zHSSpgXVPYQaVws7AOqn/ib?=
 =?us-ascii?Q?ywHH5W/h3IlZPe4opEpaJubB17X/44p6gj2gajCV2H3MUlL9swUcQYib4TlQ?=
 =?us-ascii?Q?xR8NGAuhs+fYt8/MXs9s4O8NHhsWgzHtQfyocRu1mu0dVVAaJszFVrEZq67C?=
 =?us-ascii?Q?H0kfST2xHkefQaejIGTTpeczqluHbgv2wAjO08ZWNsBBQEX8S7y0mmj96qa+?=
 =?us-ascii?Q?76ipbpXiPpo+R8zsiKStQD+HrKZqQ61ty/BZX1NwSk8OwB0pVoxBhrMlRvOa?=
 =?us-ascii?Q?5yxngO/NxNs/5btnArx6CmCt2fv8zLAy6GUoH/rvR409p55jMLeKhhMD3GBd?=
 =?us-ascii?Q?uFV8p0oYJvY//25Lckt6bvdK+8xInI5JmHZpZEcJHbRopAPehMSqvys6IliY?=
 =?us-ascii?Q?wKGF5LpGf0/MWKjvul+B696AJYO2q846GPFRc9n3Hs5xrF3yDZmrqRJ7+okI?=
 =?us-ascii?Q?2jM0YU/JsXrduMUG3GmbtPUDr8x643ynLG2SdBPH9MxFpKklKr4T805CSsRL?=
 =?us-ascii?Q?JGQb9j0IzlKUK3dovWnEs2S2s1juWos5ruWZqMtwAYn38yslhX/niONFNHLL?=
 =?us-ascii?Q?AaI2bmWqieyTqp3/CGW0htzRRCnXKEyXTU4H4G4REAvGfNBG1Vj272nB2SaZ?=
 =?us-ascii?Q?UJUcThfRKBA/fZpzLBTuuR0fU6UQQE1v0HK9eYs8AWUP2SQJrhDESLB/SOAZ?=
 =?us-ascii?Q?oURDckObmvfqaFfeoSPUgZlpBUiCRJAJ29cACErtETT2QOzcTz57ZykCtvfF?=
 =?us-ascii?Q?DgCkVJfvc8Egpe/kSL/r2mWT3IjczCiXXrwUNk9UI27svSJW531es/COoHO1?=
 =?us-ascii?Q?Cg=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52719e4-59df-4a4b-3108-08da8f2594e3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:01:20.3950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7EA95EBoTFCxgUvFI+bhRJrYWLaIgXdgk+vLjQGtIRUmx7JwcPbhuI7pyM3zEAkS9CwamE/6sl+nx6F6U+i02DidRPX3K77zoTxh9PEFgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR03MB2952
Received-SPF: pass client-ip=40.107.8.133;
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

g_autofree attribute is added for every dynamically allocated string to
prevent memory leaking.

The implementation of the several functions that work with dynamically
allocated strings is slightly changed so we can add those attributes.

Almost every disassembly_function returns the result of the img_format()
function, which returns a dynamically allocated string. To be able to
free that string for every disassembly_function, a strdup() call is
added for a return value of some disassembly functions like TLBGINV,
TLBGINVF, TLBGP, etc.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 714 +++++++++++++++++++++++----------------------
 1 file changed, 361 insertions(+), 353 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index cfea95130d..473c202649 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -523,7 +523,8 @@ static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
     for (uint64 counter = 0; counter != count; counter++) {
         bool use_gp = gp && (counter == count - 1);
         uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
-        strcat(str, img_format(",%s", GPR(this_rt)));
+        g_autofree char *dis_str = img_format(",%s", GPR(this_rt));
+        strcat(str, dis_str);
     }
 
     return str;
@@ -657,7 +658,8 @@ static int Disassemble(const uint16 *data, char *dis,
                                 return -6;
                             }
                             type = table[i].type;
-                            strcpy(dis, dis_fn(op_code, m_pc));
+                            g_autofree char *dis_str = dis_fn(op_code, m_pc);
+                            strcpy(dis, dis_str);
                             return table[i].instructions_size;
                         } else {
                             strcpy(dis, "reserved instruction");
@@ -1727,8 +1729,8 @@ static char *ACLR(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *bit = IMMEDIATE(copy(bit_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *bit = IMMEDIATE(copy(bit_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("ACLR %s, %s(%s)", bit, s, rs);
@@ -1825,7 +1827,7 @@ static char *ADDIU_32_(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
@@ -1846,7 +1848,7 @@ static char *ADDIU_48_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
 
     return img_format("ADDIU %s, %s", rt, s);
 }
@@ -1867,7 +1869,7 @@ static char *ADDIU_GP48_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, s);
 }
@@ -1888,7 +1890,7 @@ static char *ADDIU_GP_B_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_to_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
@@ -1909,7 +1911,7 @@ static char *ADDIU_GP_W_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
@@ -1932,7 +1934,7 @@ static char *ADDIU_NEG_(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *u = IMMEDIATE(neg_copy(u_value));
+    g_autofree char *u = IMMEDIATE(neg_copy(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
@@ -1953,7 +1955,7 @@ static char *ADDIU_R1_SP_(uint64 instruction, img_address m_pc)
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt3, 29, u);
 }
@@ -1976,7 +1978,7 @@ static char *ADDIU_R2_(uint64 instruction, img_address m_pc)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt3, rs3, u);
 }
@@ -1996,7 +1998,7 @@ static char *ADDIU_RS5_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
 
     return img_format("ADDIU %s, %s", rt, s);
 }
@@ -2018,7 +2020,7 @@ static char *ADDIUPC_32_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2040,7 +2042,7 @@ static char *ADDIUPC_48_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2498,7 +2500,7 @@ static char *ALUIPC(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
 }
@@ -2566,7 +2568,7 @@ static char *ANDI_16_(uint64 instruction, img_address m_pc)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    char *eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
+    g_autofree char *eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
 
     return img_format("ANDI %s, %s, %s", rt3, rs3, eu);
 }
@@ -2590,7 +2592,7 @@ static char *ANDI_32_(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ANDI %s, %s, %s", rt, rs, u);
 }
@@ -2614,7 +2616,7 @@ static char *APPEND(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("APPEND %s, %s, %s", rt, rs, sa);
 }
@@ -2636,8 +2638,8 @@ static char *ASET(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *bit = IMMEDIATE(copy(bit_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *bit = IMMEDIATE(copy(bit_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("ASET %s, %s(%s)", bit, s, rs);
@@ -2658,7 +2660,7 @@ static char *BALC_16_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
 
     return img_format("BALC %s", s);
 }
@@ -2678,7 +2680,7 @@ static char *BALC_32_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BALC %s", s);
 }
@@ -2723,8 +2725,8 @@ static char *BBEQZC(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *bit = IMMEDIATE(copy(bit_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *bit = IMMEDIATE(copy(bit_value));
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BBEQZC %s, %s, %s", rt, bit, s);
 }
@@ -2747,8 +2749,8 @@ static char *BBNEZC(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *bit = IMMEDIATE(copy(bit_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *bit = IMMEDIATE(copy(bit_value));
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BBNEZC %s, %s, %s", rt, bit, s);
 }
@@ -2768,7 +2770,7 @@ static char *BC_16_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
 
     return img_format("BC %s", s);
 }
@@ -2788,7 +2790,7 @@ static char *BC_32_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC %s", s);
 }
@@ -2810,7 +2812,7 @@ static char *BC1EQZC(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC1EQZC %s, %s", ft, s);
 }
@@ -2832,7 +2834,7 @@ static char *BC1NEZC(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC1NEZC %s, %s", ft, s);
 }
@@ -2853,8 +2855,8 @@ static char *BC2EQZC(uint64 instruction, img_address m_pc)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    char *ct = CPR(copy(ct_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *ct = CPR(copy(ct_value));
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC2EQZC %s, %s", ct, s);
 }
@@ -2875,8 +2877,8 @@ static char *BC2NEZC(uint64 instruction, img_address m_pc)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    char *ct = CPR(copy(ct_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *ct = CPR(copy(ct_value));
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC2NEZC %s, %s", ct, s);
 }
@@ -2900,7 +2902,7 @@ static char *BEQC_16_(uint64 instruction, img_address m_pc)
 
     const char *rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value));
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = ADDRESS(encode_u_from_address(u_value), 2, m_pc);
+    g_autofree char *u = ADDRESS(encode_u_from_address(u_value), 2, m_pc);
 
     return img_format("BEQC %s, %s, %s", rs3, rt3, u);
 }
@@ -2924,7 +2926,7 @@ static char *BEQC_32_(uint64 instruction, img_address m_pc)
 
     const char *rs = GPR(copy(rs_value));
     const char *rt = GPR(copy(rt_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BEQC %s, %s, %s", rs, rt, s);
 }
@@ -2947,8 +2949,8 @@ static char *BEQIC(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BEQIC %s, %s, %s", rt, u, s);
 }
@@ -2970,7 +2972,7 @@ static char *BEQZC_16_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
 
     return img_format("BEQZC %s, %s", rt3, s);
 }
@@ -2994,7 +2996,7 @@ static char *BGEC(uint64 instruction, img_address m_pc)
 
     const char *rs = GPR(copy(rs_value));
     const char *rt = GPR(copy(rt_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEC %s, %s, %s", rs, rt, s);
 }
@@ -3017,8 +3019,8 @@ static char *BGEIC(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEIC %s, %s, %s", rt, u, s);
 }
@@ -3041,8 +3043,8 @@ static char *BGEIUC(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEIUC %s, %s, %s", rt, u, s);
 }
@@ -3066,7 +3068,7 @@ static char *BGEUC(uint64 instruction, img_address m_pc)
 
     const char *rs = GPR(copy(rs_value));
     const char *rt = GPR(copy(rt_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEUC %s, %s, %s", rs, rt, s);
 }
@@ -3090,7 +3092,7 @@ static char *BLTC(uint64 instruction, img_address m_pc)
 
     const char *rs = GPR(copy(rs_value));
     const char *rt = GPR(copy(rt_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTC %s, %s, %s", rs, rt, s);
 }
@@ -3113,8 +3115,8 @@ static char *BLTIC(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTIC %s, %s, %s", rt, u, s);
 }
@@ -3137,8 +3139,8 @@ static char *BLTIUC(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTIUC %s, %s, %s", rt, u, s);
 }
@@ -3162,7 +3164,7 @@ static char *BLTUC(uint64 instruction, img_address m_pc)
 
     const char *rs = GPR(copy(rs_value));
     const char *rt = GPR(copy(rt_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTUC %s, %s, %s", rs, rt, s);
 }
@@ -3186,7 +3188,7 @@ static char *BNEC_16_(uint64 instruction, img_address m_pc)
 
     const char *rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value));
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = ADDRESS(encode_u_from_address(u_value), 2, m_pc);
+    g_autofree char *u = ADDRESS(encode_u_from_address(u_value), 2, m_pc);
 
     return img_format("BNEC %s, %s, %s", rs3, rt3, u);
 }
@@ -3210,7 +3212,7 @@ static char *BNEC_32_(uint64 instruction, img_address m_pc)
 
     const char *rs = GPR(copy(rs_value));
     const char *rt = GPR(copy(rt_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BNEC %s, %s, %s", rs, rt, s);
 }
@@ -3233,8 +3235,8 @@ static char *BNEIC(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BNEIC %s, %s, %s", rt, u, s);
 }
@@ -3256,7 +3258,7 @@ static char *BNEZC_16_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
 
     return img_format("BNEZC %s, %s", rt3, s);
 }
@@ -3276,7 +3278,7 @@ static char *BPOSGE32C(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BPOSGE32C %s", s);
 }
@@ -3296,7 +3298,7 @@ static char *BREAK_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE(copy(code_value));
 
     return img_format("BREAK %s", code);
 }
@@ -3316,7 +3318,7 @@ static char *BREAK_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE(copy(code_value));
 
     return img_format("BREAK %s", code);
 }
@@ -3358,8 +3360,8 @@ static char *CACHE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *op = IMMEDIATE(copy(op_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *op = IMMEDIATE(copy(op_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("CACHE %s, %s(%s)", op, s, rs);
@@ -3382,8 +3384,8 @@ static char *CACHEE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *op = IMMEDIATE(copy(op_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *op = IMMEDIATE(copy(op_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("CACHEE %s, %s(%s)", op, s, rs);
@@ -3494,7 +3496,7 @@ static char *CFC1(uint64 instruction, img_address m_pc)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *cs = CPR(copy(cs_value));
+    g_autofree char *cs = CPR(copy(cs_value));
 
     return img_format("CFC1 %s, %s", rt, cs);
 }
@@ -3516,7 +3518,7 @@ static char *CFC2(uint64 instruction, img_address m_pc)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *cs = CPR(copy(cs_value));
+    g_autofree char *cs = CPR(copy(cs_value));
 
     return img_format("CFC2 %s, %s", rt, cs);
 }
@@ -4959,7 +4961,7 @@ static char *COP2_1(uint64 instruction, img_address m_pc)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
-    char *cofun = IMMEDIATE(copy(cofun_value));
+    g_autofree char *cofun = IMMEDIATE(copy(cofun_value));
 
     return img_format("COP2_1 %s", cofun);
 }
@@ -4981,7 +4983,7 @@ static char *CTC1(uint64 instruction, img_address m_pc)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *cs = CPR(copy(cs_value));
+    g_autofree char *cs = CPR(copy(cs_value));
 
     return img_format("CTC1 %s, %s", rt, cs);
 }
@@ -5003,7 +5005,7 @@ static char *CTC2(uint64 instruction, img_address m_pc)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *cs = CPR(copy(cs_value));
+    g_autofree char *cs = CPR(copy(cs_value));
 
     return img_format("CTC2 %s, %s", rt, cs);
 }
@@ -5289,7 +5291,7 @@ static char *DADDIU_48_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
 
     return img_format("DADDIU %s, %s", rt, s);
 }
@@ -5313,7 +5315,7 @@ static char *DADDIU_NEG_(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *u = IMMEDIATE(neg_copy(u_value));
+    g_autofree char *u = IMMEDIATE(neg_copy(u_value));
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
@@ -5337,7 +5339,7 @@ static char *DADDIU_U12_(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
@@ -5497,7 +5499,7 @@ static char *DERET(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"DERET ";
+    return strdup("DERET ");
 }
 
 
@@ -5520,8 +5522,8 @@ static char *DEXTM(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *lsb = IMMEDIATE(copy(lsb_value));
-    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    g_autofree char *lsb = IMMEDIATE(copy(lsb_value));
+    g_autofree char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5546,8 +5548,8 @@ static char *DEXT(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *lsb = IMMEDIATE(copy(lsb_value));
-    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    g_autofree char *lsb = IMMEDIATE(copy(lsb_value));
+    g_autofree char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5572,8 +5574,8 @@ static char *DEXTU(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *lsb = IMMEDIATE(copy(lsb_value));
-    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    g_autofree char *lsb = IMMEDIATE(copy(lsb_value));
+    g_autofree char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5598,8 +5600,8 @@ static char *DINSM(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    g_autofree char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
+    g_autofree char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
@@ -5626,8 +5628,8 @@ static char *DINS(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    g_autofree char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
+    g_autofree char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINS %s, %s, %s, %s", rt, rs, pos, size);
@@ -5654,8 +5656,8 @@ static char *DINSU(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    g_autofree char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
+    g_autofree char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
@@ -5799,7 +5801,7 @@ static char *DLSA(uint64 instruction, img_address m_pc)
     const char *rd = GPR(copy(rd_value));
     const char *rs = GPR(copy(rs_value));
     const char *rt = GPR(copy(rt_value));
-    char *u2 = IMMEDIATE(copy(u2_value));
+    g_autofree char *u2 = IMMEDIATE(copy(u2_value));
 
     return img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
@@ -5821,7 +5823,7 @@ static char *DLUI_48_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_31_to_0__s32(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("DLUI %s, %s", rt, u);
 }
@@ -5844,8 +5846,8 @@ static char *DMFC0(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = CPR(copy(c0s_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = CPR(copy(c0s_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -5889,7 +5891,7 @@ static char *DMFC2(uint64 instruction, img_address m_pc)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *cs = CPR(copy(cs_value));
+    g_autofree char *cs = CPR(copy(cs_value));
 
     return img_format("DMFC2 %s, %s", rt, cs);
 }
@@ -5912,8 +5914,8 @@ static char *DMFGC0(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = CPR(copy(c0s_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = CPR(copy(c0s_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -5984,8 +5986,8 @@ static char *DMTC0(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = CPR(copy(c0s_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = CPR(copy(c0s_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6029,7 +6031,7 @@ static char *DMTC2(uint64 instruction, img_address m_pc)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *cs = CPR(copy(cs_value));
+    g_autofree char *cs = CPR(copy(cs_value));
 
     return img_format("DMTC2 %s, %s", rt, cs);
 }
@@ -6052,8 +6054,8 @@ static char *DMTGC0(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = CPR(copy(c0s_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = CPR(copy(c0s_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6578,7 +6580,7 @@ static char *DROTR(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DROTR %s, %s, %s", rt, rs, shift);
 }
@@ -6602,7 +6604,7 @@ static char *DROTR32(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DROTR32 %s, %s, %s", rt, rs, shift);
 }
@@ -6651,8 +6653,8 @@ static char *DROTX(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
-    char *shiftx = IMMEDIATE(copy(shiftx_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shiftx = IMMEDIATE(copy(shiftx_value));
 
     return img_format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
 }
@@ -6676,7 +6678,7 @@ static char *DSLL(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSLL %s, %s, %s", rt, rs, shift);
 }
@@ -6700,7 +6702,7 @@ static char *DSLL32(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSLL32 %s, %s, %s", rt, rs, shift);
 }
@@ -6748,7 +6750,7 @@ static char *DSRA(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSRA %s, %s, %s", rt, rs, shift);
 }
@@ -6772,7 +6774,7 @@ static char *DSRA32(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSRA32 %s, %s, %s", rt, rs, shift);
 }
@@ -6820,7 +6822,7 @@ static char *DSRL(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSRL %s, %s, %s", rt, rs, shift);
 }
@@ -6844,7 +6846,7 @@ static char *DSRL32(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSRL32 %s, %s, %s", rt, rs, shift);
 }
@@ -6976,7 +6978,7 @@ static char *EHB(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"EHB ";
+    return strdup("EHB ");
 }
 
 
@@ -7034,7 +7036,7 @@ static char *ERET(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"ERET ";
+    return strdup("ERET ");
 }
 
 
@@ -7052,7 +7054,7 @@ static char *ERETNC(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"ERETNC ";
+    return strdup("ERETNC ");
 }
 
 
@@ -7115,8 +7117,8 @@ static char *EXT(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *lsb = IMMEDIATE(copy(lsb_value));
-    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    g_autofree char *lsb = IMMEDIATE(copy(lsb_value));
+    g_autofree char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -7142,7 +7144,7 @@ static char *EXTD(uint64 instruction, img_address m_pc)
     const char *rd = GPR(copy(rd_value));
     const char *rs = GPR(copy(rs_value));
     const char *rt = GPR(copy(rt_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7168,7 +7170,7 @@ static char *EXTD32(uint64 instruction, img_address m_pc)
     const char *rd = GPR(copy(rd_value));
     const char *rs = GPR(copy(rs_value));
     const char *rt = GPR(copy(rt_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7192,7 +7194,7 @@ static char *EXTPDP(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *ac = AC(copy(ac_value));
-    char *size = IMMEDIATE(copy(size_value));
+    g_autofree char *size = IMMEDIATE(copy(size_value));
 
     return img_format("EXTPDP %s, %s, %s", rt, ac, size);
 }
@@ -7240,7 +7242,7 @@ static char *EXTP(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *ac = AC(copy(ac_value));
-    char *size = IMMEDIATE(copy(size_value));
+    g_autofree char *size = IMMEDIATE(copy(size_value));
 
     return img_format("EXTP %s, %s, %s", rt, ac, size);
 }
@@ -7289,7 +7291,7 @@ static char *EXTR_RS_W(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *ac = AC(copy(ac_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
 }
@@ -7314,7 +7316,7 @@ static char *EXTR_R_W(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *ac = AC(copy(ac_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
 }
@@ -7339,7 +7341,7 @@ static char *EXTR_S_H(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *ac = AC(copy(ac_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
 }
@@ -7364,7 +7366,7 @@ static char *EXTR_W(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *ac = AC(copy(ac_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTR.W %s, %s, %s", rt, ac, shift);
 }
@@ -7491,7 +7493,7 @@ static char *EXTW(uint64 instruction, img_address m_pc)
     const char *rd = GPR(copy(rd_value));
     const char *rs = GPR(copy(rs_value));
     const char *rt = GPR(copy(rt_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7623,7 +7625,7 @@ static char *HYPCALL(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE(copy(code_value));
 
     return img_format("HYPCALL %s", code);
 }
@@ -7643,7 +7645,7 @@ static char *HYPCALL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE(copy(code_value));
 
     return img_format("HYPCALL %s", code);
 }
@@ -7668,8 +7670,8 @@ static char *INS(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    g_autofree char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
+    g_autofree char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("INS %s, %s, %s, %s", rt, rs, pos, size);
@@ -7712,7 +7714,7 @@ static char *IRET(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"IRET ";
+    return strdup("IRET ");
 }
 
 
@@ -7817,7 +7819,7 @@ static char *LB_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_1_0(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LB %s, %s(%s)", rt3, u, rs3);
@@ -7840,7 +7842,7 @@ static char *LB_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_to_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LB %s, %s($%d)", rt, u, 28);
 }
@@ -7863,7 +7865,7 @@ static char *LB_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LB %s, %s(%s)", rt, s, rs);
@@ -7887,7 +7889,7 @@ static char *LB_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LB %s, %s(%s)", rt, u, rs);
@@ -7911,7 +7913,7 @@ static char *LBE(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LBE %s, %s(%s)", rt, s, rs);
@@ -7935,7 +7937,7 @@ static char *LBU_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_1_0(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LBU %s, %s(%s)", rt3, u, rs3);
@@ -7958,7 +7960,7 @@ static char *LBU_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_to_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LBU %s, %s($%d)", rt, u, 28);
 }
@@ -7981,7 +7983,7 @@ static char *LBU_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LBU %s, %s(%s)", rt, s, rs);
@@ -8005,7 +8007,7 @@ static char *LBU_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LBU %s, %s(%s)", rt, u, rs);
@@ -8029,7 +8031,7 @@ static char *LBUE(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LBUE %s, %s(%s)", rt, s, rs);
@@ -8100,7 +8102,7 @@ static char *LD_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LD %s, %s($%d)", rt, u, 28);
 }
@@ -8123,7 +8125,7 @@ static char *LD_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LD %s, %s(%s)", rt, s, rs);
@@ -8147,7 +8149,7 @@ static char *LD_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LD %s, %s(%s)", rt, u, rs);
@@ -8170,7 +8172,7 @@ static char *LDC1_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LDC1 %s, %s($%d)", ft, u, 28);
 }
@@ -8193,7 +8195,7 @@ static char *LDC1_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LDC1 %s, %s(%s)", ft, s, rs);
@@ -8217,7 +8219,7 @@ static char *LDC1_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LDC1 %s, %s(%s)", ft, u, rs);
@@ -8288,8 +8290,8 @@ static char *LDC2(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *ct = CPR(copy(ct_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *ct = CPR(copy(ct_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LDC2 %s, %s(%s)", ct, s, rs);
@@ -8314,9 +8316,10 @@ static char *LDM(uint64 instruction, img_address m_pc)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(
+        count3_value));
 
     return img_format("LDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -8338,7 +8341,7 @@ static char *LDPC_48_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("LDPC %s, %s", rt, s);
 }
@@ -8409,7 +8412,7 @@ static char *LH_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LH %s, %s(%s)", rt3, u, rs3);
@@ -8432,7 +8435,7 @@ static char *LH_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LH %s, %s($%d)", rt, u, 28);
 }
@@ -8455,7 +8458,7 @@ static char *LH_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LH %s, %s(%s)", rt, s, rs);
@@ -8479,7 +8482,7 @@ static char *LH_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LH %s, %s(%s)", rt, u, rs);
@@ -8503,7 +8506,7 @@ static char *LHE(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LHE %s, %s(%s)", rt, s, rs);
@@ -8527,7 +8530,7 @@ static char *LHU_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LHU %s, %s(%s)", rt3, u, rs3);
@@ -8550,7 +8553,7 @@ static char *LHU_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LHU %s, %s($%d)", rt, u, 28);
 }
@@ -8573,7 +8576,7 @@ static char *LHU_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LHU %s, %s(%s)", rt, s, rs);
@@ -8597,7 +8600,7 @@ static char *LHU_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LHU %s, %s(%s)", rt, u, rs);
@@ -8621,7 +8624,7 @@ static char *LHUE(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LHUE %s, %s(%s)", rt, s, rs);
@@ -8740,7 +8743,7 @@ static char *LI_16_(uint64 instruction, img_address m_pc)
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
+    g_autofree char *eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
 
     return img_format("LI %s, %s", rt3, eu);
 }
@@ -8762,7 +8765,7 @@ static char *LI_48_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
 
     return img_format("LI %s, %s", rt, s);
 }
@@ -8785,7 +8788,7 @@ static char *LL(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LL %s, %s(%s)", rt, s, rs);
@@ -8809,7 +8812,7 @@ static char *LLD(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LLD %s, %s(%s)", rt, s, rs);
@@ -8857,7 +8860,7 @@ static char *LLE(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LLE %s, %s(%s)", rt, s, rs);
@@ -8932,7 +8935,7 @@ static char *LSA(uint64 instruction, img_address m_pc)
     const char *rd = GPR(copy(rd_value));
     const char *rs = GPR(copy(rs_value));
     const char *rt = GPR(copy(rt_value));
-    char *u2 = IMMEDIATE(copy(u2_value));
+    g_autofree char *u2 = IMMEDIATE(copy(u2_value));
 
     return img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
@@ -8954,7 +8957,7 @@ static char *LUI(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
 
     return img_format("LUI %s, %%hi(%s)", rt, s);
 }
@@ -8977,7 +8980,7 @@ static char *LW_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LW %s, %s(%s)", rt3, u, rs3);
@@ -9001,7 +9004,7 @@ static char *LW_4X4_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_3_8__s2(instruction);
 
     const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     return img_format("LW %s, %s(%s)", rt4, u, rs4);
@@ -9024,7 +9027,7 @@ static char *LW_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LW %s, %s($%d)", rt, u, 28);
 }
@@ -9046,7 +9049,7 @@ static char *LW_GP16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LW %s, %s($%d)", rt3, u, 28);
 }
@@ -9069,7 +9072,7 @@ static char *LW_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LW %s, %s(%s)", rt, s, rs);
@@ -9092,7 +9095,7 @@ static char *LW_SP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LW %s, %s($%d)", rt, u, 29);
 }
@@ -9115,7 +9118,7 @@ static char *LW_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LW %s, %s(%s)", rt, u, rs);
@@ -9138,7 +9141,7 @@ static char *LWC1_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LWC1 %s, %s($%d)", ft, u, 28);
 }
@@ -9161,7 +9164,7 @@ static char *LWC1_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LWC1 %s, %s(%s)", ft, s, rs);
@@ -9185,7 +9188,7 @@ static char *LWC1_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LWC1 %s, %s(%s)", ft, u, rs);
@@ -9256,8 +9259,8 @@ static char *LWC2(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *ct = CPR(copy(ct_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *ct = CPR(copy(ct_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LWC2 %s, %s(%s)", ct, s, rs);
@@ -9281,7 +9284,7 @@ static char *LWE(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LWE %s, %s(%s)", rt, s, rs);
@@ -9306,9 +9309,9 @@ static char *LWM(uint64 instruction, img_address m_pc)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("LWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -9330,7 +9333,7 @@ static char *LWPC_48_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("LWPC %s, %s", rt, s);
 }
@@ -9352,7 +9355,7 @@ static char *LWU_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LWU %s, %s($%d)", rt, u, 28);
 }
@@ -9375,7 +9378,7 @@ static char *LWU_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LWU %s, %s(%s)", rt, s, rs);
@@ -9399,7 +9402,7 @@ static char *LWU_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("LWU %s, %s(%s)", rt, u, rs);
@@ -9496,7 +9499,7 @@ static char *LWXS_16_(uint64 instruction, img_address m_pc)
 
     const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    char *rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
+    g_autofree char *rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
 
     return img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
 }
@@ -9837,8 +9840,8 @@ static char *MFC0(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = CPR(copy(c0s_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = CPR(copy(c0s_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -9882,7 +9885,7 @@ static char *MFC2(uint64 instruction, img_address m_pc)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *cs = CPR(copy(cs_value));
+    g_autofree char *cs = CPR(copy(cs_value));
 
     return img_format("MFC2 %s, %s", rt, cs);
 }
@@ -9905,8 +9908,8 @@ static char *MFGC0(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = CPR(copy(c0s_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = CPR(copy(c0s_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -9929,8 +9932,8 @@ static char *MFHC0(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = CPR(copy(c0s_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = CPR(copy(c0s_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -9974,7 +9977,7 @@ static char *MFHC2(uint64 instruction, img_address m_pc)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *cs = CPR(copy(cs_value));
+    g_autofree char *cs = CPR(copy(cs_value));
 
     return img_format("MFHC2 %s, %s", rt, cs);
 }
@@ -9997,8 +10000,8 @@ static char *MFHGC0(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = CPR(copy(c0s_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = CPR(copy(c0s_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10043,9 +10046,9 @@ static char *MFHTR(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_10(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = IMMEDIATE(copy(c0s_value));
-    char *u = IMMEDIATE(copy(u_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = IMMEDIATE(copy(c0s_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10090,9 +10093,9 @@ static char *MFTR(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_10(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = IMMEDIATE(copy(c0s_value));
-    char *u = IMMEDIATE(copy(u_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = IMMEDIATE(copy(c0s_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10328,7 +10331,7 @@ static char *MOVE_BALC(uint64 instruction, img_address m_pc)
 
     const char *rd1 = GPR(decode_gpr_gpr1(rd1_value));
     const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
 }
@@ -10571,8 +10574,8 @@ static char *MTC0(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = CPR(copy(c0s_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = CPR(copy(c0s_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10616,7 +10619,7 @@ static char *MTC2(uint64 instruction, img_address m_pc)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *cs = CPR(copy(cs_value));
+    g_autofree char *cs = CPR(copy(cs_value));
 
     return img_format("MTC2 %s, %s", rt, cs);
 }
@@ -10639,8 +10642,8 @@ static char *MTGC0(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = CPR(copy(c0s_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = CPR(copy(c0s_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10663,8 +10666,8 @@ static char *MTHC0(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = CPR(copy(c0s_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = CPR(copy(c0s_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10708,7 +10711,7 @@ static char *MTHC2(uint64 instruction, img_address m_pc)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *cs = CPR(copy(cs_value));
+    g_autofree char *cs = CPR(copy(cs_value));
 
     return img_format("MTHC2 %s, %s", rt, cs);
 }
@@ -10731,8 +10734,8 @@ static char *MTHGC0(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = CPR(copy(c0s_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = CPR(copy(c0s_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10798,9 +10801,9 @@ static char *MTHTR(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_10(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = IMMEDIATE(copy(c0s_value));
-    char *u = IMMEDIATE(copy(u_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = IMMEDIATE(copy(c0s_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10845,9 +10848,9 @@ static char *MTTR(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_10(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *c0s = IMMEDIATE(copy(c0s_value));
-    char *u = IMMEDIATE(copy(u_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *c0s = IMMEDIATE(copy(c0s_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -11425,7 +11428,7 @@ static char *NOP_16_(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"NOP ";
+    return strdup("NOP ");
 }
 
 
@@ -11443,7 +11446,7 @@ static char *NOP_32_(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"NOP ";
+    return strdup("NOP ");
 }
 
 
@@ -11557,7 +11560,7 @@ static char *ORI(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ORI %s, %s, %s", rt, rs, u);
 }
@@ -11602,7 +11605,7 @@ static char *PAUSE(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"PAUSE ";
+    return strdup("PAUSE ");
 }
 
 
@@ -11932,7 +11935,7 @@ static char *PRECR_SRA_PH_W(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
 }
@@ -11957,7 +11960,7 @@ static char *PRECR_SRA_R_PH_W(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
 }
@@ -12079,8 +12082,8 @@ static char *PREF_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *hint = IMMEDIATE(copy(hint_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *hint = IMMEDIATE(copy(hint_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("PREF %s, %s(%s)", hint, s, rs);
@@ -12103,8 +12106,8 @@ static char *PREF_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    char *hint = IMMEDIATE(copy(hint_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *hint = IMMEDIATE(copy(hint_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("PREF %s, %s(%s)", hint, u, rs);
@@ -12127,8 +12130,8 @@ static char *PREFE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *hint = IMMEDIATE(copy(hint_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *hint = IMMEDIATE(copy(hint_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("PREFE %s, %s(%s)", hint, s, rs);
@@ -12153,7 +12156,7 @@ static char *PREPEND(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("PREPEND %s, %s, %s", rt, rs, sa);
 }
@@ -12195,7 +12198,7 @@ static char *RDDSP(uint64 instruction, img_address m_pc)
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *mask = IMMEDIATE(copy(mask_value));
+    g_autofree char *mask = IMMEDIATE(copy(mask_value));
 
     return img_format("RDDSP %s, %s", rt, mask);
 }
@@ -12218,8 +12221,8 @@ static char *RDHWR(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *hs = CPR(copy(hs_value));
-    char *sel = IMMEDIATE(copy(sel_value));
+    g_autofree char *hs = CPR(copy(hs_value));
+    g_autofree char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("RDHWR %s, %s, %s", rt, hs, sel);
 }
@@ -12307,7 +12310,7 @@ static char *REPL_PH(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
 
     return img_format("REPL.PH %s, %s", rt, s);
 }
@@ -12329,7 +12332,7 @@ static char *REPL_QB(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("REPL.QB %s, %s", rt, u);
 }
@@ -12395,9 +12398,10 @@ static char *RESTORE_32_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    char *u = IMMEDIATE(copy(u_value));
-    return img_format("RESTORE %s%s", u,
-               save_restore_list(rt_value, count_value, gp_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *save_restore_str = save_restore_list(
+        rt_value, count_value, gp_value);
+    return img_format("RESTORE %s%s", u, save_restore_str);
 }
 
 
@@ -12417,9 +12421,10 @@ static char *RESTORE_JRC_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    char *u = IMMEDIATE(copy(u_value));
-    return img_format("RESTORE.JRC %s%s", u,
-        save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *save_restore_str = save_restore_list(
+        encode_rt1_from_rt(rt1_value), count_value, 0);
+    return img_format("RESTORE.JRC %s%s", u, save_restore_str);
 }
 
 
@@ -12440,9 +12445,10 @@ static char *RESTORE_JRC_32_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    char *u = IMMEDIATE(copy(u_value));
-    return img_format("RESTORE.JRC %s%s", u,
-               save_restore_list(rt_value, count_value, gp_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *save_restore_str = save_restore_list(
+        rt_value, count_value, gp_value);
+    return img_format("RESTORE.JRC %s%s", u, save_restore_str);
 }
 
 
@@ -12461,8 +12467,8 @@ static char *RESTOREF(uint64 instruction, img_address m_pc)
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    char *u = IMMEDIATE(copy(u_value));
-    char *count = IMMEDIATE(copy(count_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *count = IMMEDIATE(copy(count_value));
 
     return img_format("RESTOREF %s, %s", u, count);
 }
@@ -12530,7 +12536,7 @@ static char *ROTR(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("ROTR %s, %s, %s", rt, rs, shift);
 }
@@ -12580,9 +12586,9 @@ static char *ROTX(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
-    char *shiftx = IMMEDIATE(copy(shiftx_value));
-    char *stripe = IMMEDIATE(copy(stripe_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shiftx = IMMEDIATE(copy(shiftx_value));
+    g_autofree char *stripe = IMMEDIATE(copy(stripe_value));
 
     return img_format("ROTX %s, %s, %s, %s, %s",
                        rt, rs, shift, shiftx, stripe);
@@ -12737,9 +12743,10 @@ static char *SAVE_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    char *u = IMMEDIATE(copy(u_value));
-    return img_format("SAVE %s%s", u,
-        save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *save_restore_str = save_restore_list(
+        encode_rt1_from_rt(rt1_value), count_value, 0);
+    return img_format("SAVE %s%s", u, save_restore_str);
 }
 
 
@@ -12760,9 +12767,10 @@ static char *SAVE_32_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    char *u = IMMEDIATE(copy(u_value));
-    return img_format("SAVE %s%s", u,
-               save_restore_list(rt_value, count_value, gp_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *save_restore_str = save_restore_list(
+        rt_value, count_value, gp_value);
+    return img_format("SAVE %s%s", u, save_restore_str);
 }
 
 
@@ -12781,8 +12789,8 @@ static char *SAVEF(uint64 instruction, img_address m_pc)
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    char *u = IMMEDIATE(copy(u_value));
-    char *count = IMMEDIATE(copy(count_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *count = IMMEDIATE(copy(count_value));
 
     return img_format("SAVEF %s, %s", u, count);
 }
@@ -12805,7 +12813,7 @@ static char *SB_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_1_0(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SB %s, %s(%s)", rtz3, u, rs3);
@@ -12828,7 +12836,7 @@ static char *SB_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_to_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SB %s, %s($%d)", rt, u, 28);
 }
@@ -12851,7 +12859,7 @@ static char *SB_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SB %s, %s(%s)", rt, s, rs);
@@ -12875,7 +12883,7 @@ static char *SB_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SB %s, %s(%s)", rt, u, rs);
@@ -12899,7 +12907,7 @@ static char *SBE(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SBE %s, %s(%s)", rt, s, rs);
@@ -12947,7 +12955,7 @@ static char *SC(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SC %s, %s(%s)", rt, s, rs);
@@ -12971,7 +12979,7 @@ static char *SCD(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SCD %s, %s(%s)", rt, s, rs);
@@ -13019,7 +13027,7 @@ static char *SCE(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SCE %s, %s(%s)", rt, s, rs);
@@ -13090,7 +13098,7 @@ static char *SD_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SD %s, %s($%d)", rt, u, 28);
 }
@@ -13113,7 +13121,7 @@ static char *SD_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SD %s, %s(%s)", rt, s, rs);
@@ -13137,7 +13145,7 @@ static char *SD_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SD %s, %s(%s)", rt, u, rs);
@@ -13158,7 +13166,7 @@ static char *SDBBP_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SDBBP %s", code);
 }
@@ -13178,7 +13186,7 @@ static char *SDBBP_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SDBBP %s", code);
 }
@@ -13200,7 +13208,7 @@ static char *SDC1_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SDC1 %s, %s($%d)", ft, u, 28);
 }
@@ -13223,7 +13231,7 @@ static char *SDC1_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SDC1 %s, %s(%s)", ft, s, rs);
@@ -13247,7 +13255,7 @@ static char *SDC1_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SDC1 %s, %s(%s)", ft, u, rs);
@@ -13318,8 +13326,8 @@ static char *SDC2(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *cs = CPR(copy(cs_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *cs = CPR(copy(cs_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SDC2 %s, %s(%s)", cs, s, rs);
@@ -13344,9 +13352,9 @@ static char *SDM(uint64 instruction, img_address m_pc)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("SDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -13368,7 +13376,7 @@ static char *SDPC_48_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("SDPC %s, %s", rt, s);
 }
@@ -13628,7 +13636,7 @@ static char *SEQI(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SEQI %s, %s, %s", rt, rs, u);
 }
@@ -13651,7 +13659,7 @@ static char *SH_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SH %s, %s(%s)", rtz3, u, rs3);
@@ -13674,7 +13682,7 @@ static char *SH_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SH %s, %s($%d)", rt, u, 28);
 }
@@ -13697,7 +13705,7 @@ static char *SH_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SH %s, %s(%s)", rt, s, rs);
@@ -13721,7 +13729,7 @@ static char *SH_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SH %s, %s(%s)", rt, u, rs);
@@ -13745,7 +13753,7 @@ static char *SHE(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SHE %s, %s(%s)", rt, s, rs);
@@ -13767,7 +13775,7 @@ static char *SHILO(uint64 instruction, img_address m_pc)
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
     const char *ac = AC(copy(ac_value));
 
     return img_format("SHILO %s, %s", ac, shift);
@@ -13814,7 +13822,7 @@ static char *SHLL_PH(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
 }
@@ -13838,7 +13846,7 @@ static char *SHLL_QB(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
 }
@@ -13863,7 +13871,7 @@ static char *SHLL_S_PH(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
 }
@@ -13887,7 +13895,7 @@ static char *SHLL_S_W(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
 }
@@ -14009,7 +14017,7 @@ static char *SHRA_PH(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14033,7 +14041,7 @@ static char *SHRA_QB(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14057,7 +14065,7 @@ static char *SHRA_R_PH(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14081,7 +14089,7 @@ static char *SHRA_R_QB(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14105,7 +14113,7 @@ static char *SHRA_R_W(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
 }
@@ -14249,7 +14257,7 @@ static char *SHRL_PH(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14273,7 +14281,7 @@ static char *SHRL_QB(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *sa = IMMEDIATE(copy(sa_value));
+    g_autofree char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14390,7 +14398,7 @@ static char *SIGRIE(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SIGRIE %s", code);
 }
@@ -14414,7 +14422,7 @@ static char *SLL_16_(uint64 instruction, img_address m_pc)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    g_autofree char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
 
     return img_format("SLL %s, %s, %s", rt3, rs3, shift3);
 }
@@ -14438,7 +14446,7 @@ static char *SLL_32_(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("SLL %s, %s, %s", rt, rs, shift);
 }
@@ -14510,7 +14518,7 @@ static char *SLTI(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SLTI %s, %s, %s", rt, rs, u);
 }
@@ -14534,7 +14542,7 @@ static char *SLTIU(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SLTIU %s, %s, %s", rt, rs, u);
 }
@@ -14602,7 +14610,7 @@ static char *SPECIAL2(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    char *op = IMMEDIATE(copy(op_value));
+    g_autofree char *op = IMMEDIATE(copy(op_value));
 
     return img_format("SPECIAL2 %s", op);
 }
@@ -14670,7 +14678,7 @@ static char *SRA(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("SRA %s, %s, %s", rt, rs, shift);
 }
@@ -14718,7 +14726,7 @@ static char *SRL_16_(uint64 instruction, img_address m_pc)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    g_autofree char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
 
     return img_format("SRL %s, %s, %s", rt3, rs3, shift3);
 }
@@ -14742,7 +14750,7 @@ static char *SRL_32_(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *shift = IMMEDIATE(copy(shift_value));
+    g_autofree char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("SRL %s, %s, %s", rt, rs, shift);
 }
@@ -15231,7 +15239,7 @@ static char *SW_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SW %s, %s(%s)", rtz3, u, rs3);
@@ -15255,7 +15263,7 @@ static char *SW_4X4_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_3_8__s2(instruction);
 
     const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     return img_format("SW %s, %s(%s)", rtz4, u, rs4);
@@ -15278,7 +15286,7 @@ static char *SW_GP16_(uint64 instruction, img_address m_pc)
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SW %s, %s($%d)", rtz3, u, 28);
 }
@@ -15300,7 +15308,7 @@ static char *SW_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SW %s, %s($%d)", rt, u, 28);
 }
@@ -15323,7 +15331,7 @@ static char *SW_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SW %s, %s(%s)", rt, s, rs);
@@ -15346,7 +15354,7 @@ static char *SW_SP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SW %s, %s($%d)", rt, u, 29);
 }
@@ -15369,7 +15377,7 @@ static char *SW_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SW %s, %s(%s)", rt, u, rs);
@@ -15392,7 +15400,7 @@ static char *SWC1_GP_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SWC1 %s, %s($%d)", ft, u, 28);
 }
@@ -15415,7 +15423,7 @@ static char *SWC1_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SWC1 %s, %s(%s)", ft, s, rs);
@@ -15439,7 +15447,7 @@ static char *SWC1_U12_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
     const char *ft = FPR(copy(ft_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SWC1 %s, %s(%s)", ft, u, rs);
@@ -15510,8 +15518,8 @@ static char *SWC2(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *cs = CPR(copy(cs_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *cs = CPR(copy(cs_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SWC2 %s, %s(%s)", cs, s, rs);
@@ -15535,7 +15543,7 @@ static char *SWE(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SWE %s, %s(%s)", rt, s, rs);
@@ -15560,9 +15568,9 @@ static char *SWM(uint64 instruction, img_address m_pc)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("SWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -15584,7 +15592,7 @@ static char *SWPC_48_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("SWPC %s, %s", rt, s);
 }
@@ -15652,7 +15660,7 @@ static char *SYNC(uint64 instruction, img_address m_pc)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
-    char *stype = IMMEDIATE(copy(stype_value));
+    g_autofree char *stype = IMMEDIATE(copy(stype_value));
 
     return img_format("SYNC %s", stype);
 }
@@ -15673,7 +15681,7 @@ static char *SYNCI(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SYNCI %s(%s)", s, rs);
@@ -15695,7 +15703,7 @@ static char *SYNCIE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("SYNCIE %s(%s)", s, rs);
@@ -15716,7 +15724,7 @@ static char *SYSCALL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SYSCALL %s", code);
 }
@@ -15734,7 +15742,7 @@ static char *SYSCALL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SYSCALL %s", code);
 }
@@ -15776,7 +15784,7 @@ static char *TLBGINV(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"TLBGINV ";
+    return strdup("TLBGINV ");
 }
 
 
@@ -15794,7 +15802,7 @@ static char *TLBGINVF(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"TLBGINVF ";
+    return strdup("TLBGINVF ");
 }
 
 
@@ -15812,7 +15820,7 @@ static char *TLBGP(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"TLBGP ";
+    return strdup("TLBGP ");
 }
 
 
@@ -15830,7 +15838,7 @@ static char *TLBGR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"TLBGR ";
+    return strdup("TLBGR ");
 }
 
 
@@ -15848,7 +15856,7 @@ static char *TLBGWI(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"TLBGWI ";
+    return strdup("TLBGWI ");
 }
 
 
@@ -15866,7 +15874,7 @@ static char *TLBGWR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"TLBGWR ";
+    return strdup("TLBGWR ");
 }
 
 
@@ -15884,7 +15892,7 @@ static char *TLBINV(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"TLBINV ";
+    return strdup("TLBINV ");
 }
 
 
@@ -15902,7 +15910,7 @@ static char *TLBINVF(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"TLBINVF ";
+    return strdup("TLBINVF ");
 }
 
 
@@ -15920,7 +15928,7 @@ static char *TLBP(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"TLBP ";
+    return strdup("TLBP ");
 }
 
 
@@ -15938,7 +15946,7 @@ static char *TLBR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"TLBR ";
+    return strdup("TLBR ");
 }
 
 
@@ -15956,7 +15964,7 @@ static char *TLBWI(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"TLBWI ";
+    return strdup("TLBWI ");
 }
 
 
@@ -15974,7 +15982,7 @@ static char *TLBWR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return (char *)"TLBWR ";
+    return strdup("TLBWR ");
 }
 
 
@@ -16106,9 +16114,9 @@ static char *UALDM(uint64 instruction, img_address m_pc)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16131,7 +16139,7 @@ static char *UALH(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("UALH %s, %s(%s)", rt, s, rs);
@@ -16156,9 +16164,9 @@ static char *UALWM(uint64 instruction, img_address m_pc)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16182,9 +16190,9 @@ static char *UASDM(uint64 instruction, img_address m_pc)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16207,7 +16215,7 @@ static char *UASH(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
     return img_format("UASH %s, %s(%s)", rt, s, rs);
@@ -16232,9 +16240,9 @@ static char *UASWM(uint64 instruction, img_address m_pc)
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *s = IMMEDIATE(copy(s_value));
+    g_autofree char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
-    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16254,7 +16262,7 @@ static char *UDI(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    char *op = IMMEDIATE(copy(op_value));
+    g_autofree char *op = IMMEDIATE(copy(op_value));
 
     return img_format("UDI %s", op);
 }
@@ -16272,7 +16280,7 @@ static char *WAIT(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
-    char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE(copy(code_value));
 
     return img_format("WAIT %s", code);
 }
@@ -16294,7 +16302,7 @@ static char *WRDSP(uint64 instruction, img_address m_pc)
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
     const char *rt = GPR(copy(rt_value));
-    char *mask = IMMEDIATE(copy(mask_value));
+    g_autofree char *mask = IMMEDIATE(copy(mask_value));
 
     return img_format("WRDSP %s, %s", rt, mask);
 }
@@ -16386,7 +16394,7 @@ static char *XORI(uint64 instruction, img_address m_pc)
 
     const char *rt = GPR(copy(rt_value));
     const char *rs = GPR(copy(rs_value));
-    char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE(copy(u_value));
 
     return img_format("XORI %s, %s, %s", rt, rs, u);
 }
-- 
2.25.1


