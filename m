Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CED95AD053
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:42:32 +0200 (CEST)
Received: from localhost ([::1]:44434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9Yl-0001Ss-L7
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8wU-0005vp-7O
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:03:01 -0400
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:25728 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8wH-0002Wo-FP
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:02:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X88YywFu0vikC9WH42Xv2YtNbGO/XNQ2nrMJlgrJ86JcKep1Bg9QQ7qpAEn2H5hGfToxl9xJF1oELR9JzbFV93lXE/j0e9+Nkg+mdSgnRuk7dYjlp+Fdy+hjBcPRa+RPSlQMik9zSqkBqt/EKE0wy/BHymlkBHUoZkDBL6MDjzyE/nhbrvz8Z+mO/d2th9g51EfDyCcgpUfnEO92wVlfAzOdseHVIpcOtYfe056eN84ILvPrwe9TU08geY9OHv6O55ubIXTorMT2yeLDhkFDoZSANm0ABFEya0Zyhasa2Cp3R3dlv563aNw3YfE7QjYFzO0vqYW5GkM61+TcYeaURw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IS8Pdmhx6rumy+kTzEicJfl/Mt00uFDlSzPLH3oeNZs=;
 b=UTeYlQrpOikXWNx7lhi+G5Du3XWGiMFbq1WWu23r4iK3bq4DsbCWubNa2cOGIDD2tOhRIggeqN7EuN5UrG52HwiZz9paSA3V9mrn+gWXOnDFqCK6qATTAWmt1x9Dk952doNoRduPLDCk1sXVKboqF3lHJpNK0ZmtEZVuRIul+sdGvZIjbLCSI7CxkYsJZity2VssNvENhLjckIKpt9vY0GhWmSrdLJYJVNILnvqxdVNdRZeh4fb5NJeLMUy68ctdpLBEk612HANiHyW362wgvWCScxZDqpkKFylXdTuhmu5Mls8MTwDRs9DqvQ1RrfTaLG5Fhatog0jLfFT5LllP5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IS8Pdmhx6rumy+kTzEicJfl/Mt00uFDlSzPLH3oeNZs=;
 b=cjWtZrviAyDI/JBkh5+DXMWGgU4rxJlGQ3cBYPC/pUWlso8HPvX+RWqlL2MPSKePn08hT6mdqGqCPSWKQjVoY0cu1i5mj6FpP+kjEKkAEUpHkgmIQCxMgcVg7p6PuAavM1xkJmQtzxzX+OSOJDKH2nvuccZ/xuTP3kdQOw/mhl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by VI1PR03MB3871.eurprd03.prod.outlook.com (2603:10a6:803:6c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 10:01:52 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 10:01:52 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 14/20] disas/nanomips: Remove function overloading
Date: Mon,  5 Sep 2022 11:55:16 +0200
Message-Id: <20220905095522.66941-15-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3d098566-f8da-495e-6507-08da8f25a7a9
X-MS-TrafficTypeDiagnostic: VI1PR03MB3871:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sbp+Ad8dpN2qsMlhBnUY4F7aovJ6+3dl3/T7JxOZk3Fdvr8574sA9t5o2BMVqcIfXBahmDzv3T04eab8qk8YrhGLsVP9pQgljOWw8n0mpPkvcpVDK33r0MsHeBKNAJwG9HFXSlGK5H2lXCnNFK90EzixWAXunma70ef/3U/De+PTX0KD+HB49p3nBfiAEMkya6UfZeEOLlYvWDLHscOMM+Ikcg+X9NUj5/PxjBgUtevrm25tLUCtKd08GcHKxJxRHWUjXyQ5eSbcK1Sy9AEzIDtUupXggCEkCFhXm4fenM2hje0OpaEoMnbmMWSEtWCYjT1S5as19WqJNS/uyKPXGzXt4phWk532LFYAKZ0q1p8dd9N92v1JEhYuzzF47ScIDHg93cbJU+iokRaGm4JULXvnUthQEQpksJOuWxl1OQEKqdr7Sd4gR8ThsxWnF0OQFnEBAH5665UjnEr/nuFQJONyFp//KGORv9yAoHa9Qzyja0AUHn1Tdt5/O2pCagKhNqYXWt2XWJWklUiS3odw5un4cBCzwcelISbd4lZAAaTvqKC8GGbFHlPDK7SNjwCys2Ac70hLRXVDju35Od9i3CJyR+zR3Y3VOO3zq2Um+CJCYJCk57nxEh7XPghbewZ+HF80zyyEdAZKReaGiMCWK/BqwS1WGbbRTJM9puURaCSmSSPISsBd1eO5toBxZ63vLsXD4eLOhcudHuQH8I6ELorK1Rj7IjipBvecwDthIuq7p27qVTDMXTXV6pRKcbwd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(136003)(346002)(39830400003)(376002)(1076003)(186003)(478600001)(41300700001)(6506007)(107886003)(6666004)(52116002)(86362001)(2616005)(6486002)(38350700002)(6512007)(83380400001)(38100700002)(30864003)(316002)(26005)(6916009)(8936002)(2906002)(8676002)(4326008)(66946007)(66476007)(36756003)(66556008)(5660300002)(44832011)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ipIkAk1B9vw/pGRmi1LhKG/1bI8zgRweCP/Anl28R7s6/sHpVNKW4ievuisy?=
 =?us-ascii?Q?Ur4y+KxEBEL8PmYMZNALCWa68PmETjujlh1Ryf4f+YXEpv8KPfkb53D7sP5Z?=
 =?us-ascii?Q?YswNuWUWSdwJDUbeXpOooizC0RzAUxOw9Ok7dnGAU44AsQE4IJxCooreweoQ?=
 =?us-ascii?Q?7pP2u+ApHn/st3xuP/vlyqiGpiRnP/ODV5ICgLNCV4wkbPLaVhguU+AKaic4?=
 =?us-ascii?Q?IzEEXglSBWr+X75gCH+8TXdTwNEJFSDa6IBxHlPWNb4K5YSktICUtl1G7wG9?=
 =?us-ascii?Q?FRbje3vnAnN8IR6hW8igPeBNRcgnjmr/N8sTtcTKZwq6Siq6kpSqEA5OhDc1?=
 =?us-ascii?Q?qTQT4EOiEMHZXLm5507KjMOTJHjIyyzzwFMTY//3oVU/QO1nIZxgZMTLGnb/?=
 =?us-ascii?Q?ATJs0R8zepm22z0muBW2nlZg0ZBpiyQLhtP0ydb4xKLbzVEgyBikMV6SYrgm?=
 =?us-ascii?Q?LkyDzsjSEP3QdIvT6QTjPrU+VZoQNtqruixlO2rul+G48JcCzW430a5+ECuI?=
 =?us-ascii?Q?8R7NXQFgAEyVMqE7rILHyqaufiDATWjgENhCv+nmFbGP2tcHkLYT5NsAAWfD?=
 =?us-ascii?Q?O3CW/Nqno14EFsZzUvwzGMIE79xMP3KDq41RmEHhXeJYVlkk355A+qx0SjWI?=
 =?us-ascii?Q?upXjOK4fJ69MZGwFKSfhC0G1KO5dbzH1P1ZBExMXZzV5lMx9C5dQ/XXQf/an?=
 =?us-ascii?Q?H/6SM24+L10C4owKPXoUDpK6Xi4WSZAxrq3t7QGJBErxiQ6E0YP5yhOGNEi9?=
 =?us-ascii?Q?Ko/EgUxBBTBDuUH/kEkVXVAnSAe83SLPD6S4ndc9LCM9xZ2XePtDSi6aktqc?=
 =?us-ascii?Q?vcBXBwwiFzn+ERqqYIrvtP58qR7ZtN4quIloen85bsysoILvxNLxbdDuMIwE?=
 =?us-ascii?Q?5m0Rb4TJjUWuycoqQDrJutodLVIl2JmvvGr2oAKVp882UjMLurIq3LNkTGEb?=
 =?us-ascii?Q?pvmgJFkuMHnJF1EMUbPtL1+/PfD5p+NA40rTZ8aUCfvhfp2+4SPVJuopSF5s?=
 =?us-ascii?Q?KtOA2kK6D+R6avQRtwV9dK/ObROUKi42KjAeH+0kwVIuLBrtnVU6V0dX4PZx?=
 =?us-ascii?Q?HfZQ56sYKxUh3m9yEGZE9cIxldkeTl5g8Qop/TyrqD7Z8ujuPqi4byJwe/xg?=
 =?us-ascii?Q?THabTZZN56xnsDvfgjGHRgOxQ/DxD7/RcrykYIZR78ylq+2eBkiT7X+FRQDV?=
 =?us-ascii?Q?nwI96Fs+sPph+jgvCCjwuJwDTGWXJJDll2M/RqsPgxIqh+L2k6/gkOZC/QfV?=
 =?us-ascii?Q?iwb71qfiO1qPFCjQ4kvHAwFUyea41Hyy1Hi8oQNxslLBGI3/UFwsZW2tHz85?=
 =?us-ascii?Q?W/ZgeuuPk1tqyo65KlHPkZ+TtlcW5rRKrb96HCSgSlUt2rStu8bdsPW8z01Y?=
 =?us-ascii?Q?jFSv7R4vxeuT6+qkUU94WaFFP1hv+8XW5h950APFFGWZplbfdNrr+0CzTEyB?=
 =?us-ascii?Q?WNDl94oiPoyMqvRlK6uTXfhWWVjrcoTsynHrxqXeDjwM77SacZeNeqprHDl/?=
 =?us-ascii?Q?8VDoRc81kjwcF4aAtn1ThtVCqqyVwvP48tgnngldNESisTK4JYH+TPmhHvF5?=
 =?us-ascii?Q?DfXgl3gHnWq6UwlfoY/N9ZvybOdZjjjXHKauXYOuD4U4Z8oqghl5UEdo+ifb?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d098566-f8da-495e-6507-08da8f25a7a9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:01:52.1742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeYiAZ+ZEVP4tySEmDzVffVi2q3SEronnuzGwxeoTuKP60xRTWY9mamRJtvqqQaKt47vnsLNlRxErvuQGAG9XgfZR2nX2VD2nMYgd3O2dM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3871
Received-SPF: pass client-ip=40.107.20.134;
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

Renamed the following functions by adding a suffix:
- copy to copy_ui and copy_i
- IMMEDIATE to IMMEDIATE_UI and IMMEDIATE_I
Calls to copy and IMMEDIATE functions are replaced based on the type of
arguments.

Disassemble function that calls the other variant of it is deleted.
Where it is called, now we're directly calling the other implementation.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 disas/nanomips.cpp | 3118 ++++++++++++++++++++++----------------------
 1 file changed, 1565 insertions(+), 1553 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 473c202649..9e34ca164c 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -391,13 +391,13 @@ static uint64 decode_gpr_gpr1(uint64 d)
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
@@ -564,13 +564,13 @@ static const char *AC(uint64 reg)
 }
 
 
-static char *IMMEDIATE(uint64 value)
+static char *IMMEDIATE_UI(uint64 value)
 {
     return img_format("0x%" PRIx64, value);
 }
 
 
-static char *IMMEDIATE(int64 value)
+static char *IMMEDIATE_I(int64 value)
 {
     return img_format("%" PRId64, value);
 }
@@ -1619,8 +1619,8 @@ static char *ABS_D(uint64 instruction, img_address m_pc)
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *fs = FPR(copy(fs_value));
-    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *fd = FPR(copy_ui(fd_value));
 
     return img_format("ABS.D %s, %s", fd, fs);
 }
@@ -1641,8 +1641,8 @@ static char *ABS_S(uint64 instruction, img_address m_pc)
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *fs = FPR(copy(fs_value));
-    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy_ui(fs_value));
+    const char *fd = FPR(copy_ui(fd_value));
 
     return img_format("ABS.S %s, %s", fd, fs);
 }
@@ -1663,8 +1663,8 @@ static char *ABSQ_S_PH(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("ABSQ_S.PH %s, %s", rt, rs);
 }
@@ -1685,8 +1685,8 @@ static char *ABSQ_S_QB(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("ABSQ_S.QB %s, %s", rt, rs);
 }
@@ -1707,8 +1707,8 @@ static char *ABSQ_S_W(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("ABSQ_S.W %s, %s", rt, rs);
 }
@@ -1729,9 +1729,9 @@ static char *ACLR(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    g_autofree char *bit = IMMEDIATE(copy(bit_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    g_autofree char *bit = IMMEDIATE_UI(copy_ui(bit_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("ACLR %s, %s(%s)", bit, s, rs);
 }
@@ -1752,9 +1752,9 @@ static char *ADD(uint64 instruction, img_address m_pc)
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
@@ -1777,9 +1777,9 @@ static char *ADD_D(uint64 instruction, img_address m_pc)
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
@@ -1802,9 +1802,9 @@ static char *ADD_S(uint64 instruction, img_address m_pc)
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
@@ -1825,9 +1825,9 @@ static char *ADDIU_32_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_15_to_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
@@ -1847,8 +1847,8 @@ static char *ADDIU_48_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("ADDIU %s, %s", rt, s);
 }
@@ -1868,8 +1868,8 @@ static char *ADDIU_GP48_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, s);
 }
@@ -1889,8 +1889,8 @@ static char *ADDIU_GP_B_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
@@ -1910,8 +1910,8 @@ static char *ADDIU_GP_W_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
@@ -1932,9 +1932,9 @@ static char *ADDIU_NEG_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *u = IMMEDIATE(neg_copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *u = IMMEDIATE_I(neg_copy(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
@@ -1955,7 +1955,7 @@ static char *ADDIU_R1_SP_(uint64 instruction, img_address m_pc)
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt3, 29, u);
 }
@@ -1978,7 +1978,7 @@ static char *ADDIU_R2_(uint64 instruction, img_address m_pc)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt3, rs3, u);
 }
@@ -1997,8 +1997,8 @@ static char *ADDIU_RS5_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("ADDIU %s, %s", rt, s);
 }
@@ -2019,7 +2019,7 @@ static char *ADDIUPC_32_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("ADDIUPC %s, %s", rt, s);
@@ -2041,7 +2041,7 @@ static char *ADDIUPC_48_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("ADDIUPC %s, %s", rt, s);
@@ -2064,9 +2064,9 @@ static char *ADDQ_PH(uint64 instruction, img_address m_pc)
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
@@ -2089,9 +2089,9 @@ static char *ADDQ_S_PH(uint64 instruction, img_address m_pc)
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
@@ -2113,9 +2113,9 @@ static char *ADDQ_S_W(uint64 instruction, img_address m_pc)
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
@@ -2138,9 +2138,9 @@ static char *ADDQH_PH(uint64 instruction, img_address m_pc)
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
@@ -2163,9 +2163,9 @@ static char *ADDQH_R_PH(uint64 instruction, img_address m_pc)
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
@@ -2188,9 +2188,9 @@ static char *ADDQH_R_W(uint64 instruction, img_address m_pc)
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
@@ -2213,9 +2213,9 @@ static char *ADDQH_W(uint64 instruction, img_address m_pc)
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
@@ -2237,9 +2237,9 @@ static char *ADDSC(uint64 instruction, img_address m_pc)
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
@@ -2284,9 +2284,9 @@ static char *ADDU_32_(uint64 instruction, img_address m_pc)
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
@@ -2330,9 +2330,9 @@ static char *ADDU_PH(uint64 instruction, img_address m_pc)
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
@@ -2354,9 +2354,9 @@ static char *ADDU_QB(uint64 instruction, img_address m_pc)
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
@@ -2379,9 +2379,9 @@ static char *ADDU_S_PH(uint64 instruction, img_address m_pc)
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
@@ -2403,9 +2403,9 @@ static char *ADDU_S_QB(uint64 instruction, img_address m_pc)
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
@@ -2428,9 +2428,9 @@ static char *ADDUH_QB(uint64 instruction, img_address m_pc)
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
@@ -2453,9 +2453,9 @@ static char *ADDUH_R_QB(uint64 instruction, img_address m_pc)
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
@@ -2476,9 +2476,9 @@ static char *ADDWC(uint64 instruction, img_address m_pc)
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
@@ -2499,7 +2499,7 @@ static char *ALUIPC(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
@@ -2543,9 +2543,9 @@ static char *AND_32_(uint64 instruction, img_address m_pc)
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
@@ -2568,7 +2568,7 @@ static char *ANDI_16_(uint64 instruction, img_address m_pc)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    g_autofree char *eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
+    g_autofree char *eu = IMMEDIATE_UI(encode_eu_from_u_andi16(eu_value));
 
     return img_format("ANDI %s, %s, %s", rt3, rs3, eu);
 }
@@ -2590,9 +2590,9 @@ static char *ANDI_32_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ANDI %s, %s, %s", rt, rs, u);
 }
@@ -2614,9 +2614,9 @@ static char *APPEND(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("APPEND %s, %s, %s", rt, rs, sa);
 }
@@ -2638,9 +2638,9 @@ static char *ASET(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    g_autofree char *bit = IMMEDIATE(copy(bit_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    g_autofree char *bit = IMMEDIATE_UI(copy_ui(bit_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("ASET %s, %s(%s)", bit, s, rs);
 }
@@ -2701,8 +2701,8 @@ static char *BALRSC(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("BALRSC %s, %s", rt, rs);
 }
@@ -2724,8 +2724,8 @@ static char *BBEQZC(uint64 instruction, img_address m_pc)
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *bit = IMMEDIATE(copy(bit_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *bit = IMMEDIATE_UI(copy_ui(bit_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BBEQZC %s, %s, %s", rt, bit, s);
@@ -2748,8 +2748,8 @@ static char *BBNEZC(uint64 instruction, img_address m_pc)
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *bit = IMMEDIATE(copy(bit_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *bit = IMMEDIATE_UI(copy_ui(bit_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BBNEZC %s, %s, %s", rt, bit, s);
@@ -2811,7 +2811,7 @@ static char *BC1EQZC(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *ft = FPR(copy(ft_value));
+    const char *ft = FPR(copy_ui(ft_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC1EQZC %s, %s", ft, s);
@@ -2833,7 +2833,7 @@ static char *BC1NEZC(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *ft = FPR(copy(ft_value));
+    const char *ft = FPR(copy_ui(ft_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC1NEZC %s, %s", ft, s);
@@ -2855,7 +2855,7 @@ static char *BC2EQZC(uint64 instruction, img_address m_pc)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    g_autofree char *ct = CPR(copy(ct_value));
+    g_autofree char *ct = CPR(copy_ui(ct_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC2EQZC %s, %s", ct, s);
@@ -2877,7 +2877,7 @@ static char *BC2NEZC(uint64 instruction, img_address m_pc)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    g_autofree char *ct = CPR(copy(ct_value));
+    g_autofree char *ct = CPR(copy_ui(ct_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC2NEZC %s, %s", ct, s);
@@ -2924,8 +2924,8 @@ static char *BEQC_32_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BEQC %s, %s, %s", rs, rt, s);
@@ -2948,8 +2948,8 @@ static char *BEQIC(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BEQIC %s, %s, %s", rt, u, s);
@@ -2994,8 +2994,8 @@ static char *BGEC(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEC %s, %s, %s", rs, rt, s);
@@ -3018,8 +3018,8 @@ static char *BGEIC(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEIC %s, %s, %s", rt, u, s);
@@ -3042,8 +3042,8 @@ static char *BGEIUC(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEIUC %s, %s, %s", rt, u, s);
@@ -3066,8 +3066,8 @@ static char *BGEUC(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEUC %s, %s, %s", rs, rt, s);
@@ -3090,8 +3090,8 @@ static char *BLTC(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTC %s, %s, %s", rs, rt, s);
@@ -3114,8 +3114,8 @@ static char *BLTIC(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTIC %s, %s, %s", rt, u, s);
@@ -3138,8 +3138,8 @@ static char *BLTIUC(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTIUC %s, %s, %s", rt, u, s);
@@ -3162,8 +3162,8 @@ static char *BLTUC(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTUC %s, %s, %s", rs, rt, s);
@@ -3210,8 +3210,8 @@ static char *BNEC_32_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BNEC %s, %s, %s", rs, rt, s);
@@ -3234,8 +3234,8 @@ static char *BNEIC(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BNEIC %s, %s, %s", rt, u, s);
@@ -3298,7 +3298,7 @@ static char *BREAK_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    g_autofree char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     return img_format("BREAK %s", code);
 }
@@ -3318,7 +3318,7 @@ static char *BREAK_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    g_autofree char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     return img_format("BREAK %s", code);
 }
@@ -3338,7 +3338,7 @@ static char *BRSC(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("BRSC %s", rs);
 }
@@ -3360,9 +3360,9 @@ static char *CACHE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    g_autofree char *op = IMMEDIATE(copy(op_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    g_autofree char *op = IMMEDIATE_UI(copy_ui(op_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("CACHE %s, %s(%s)", op, s, rs);
 }
@@ -3384,9 +3384,9 @@ static char *CACHEE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    g_autofree char *op = IMMEDIATE(copy(op_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    g_autofree char *op = IMMEDIATE_UI(copy_ui(op_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("CACHEE %s, %s(%s)", op, s, rs);
 }
@@ -3407,8 +3407,8 @@ static char *CEIL_L_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CEIL.L.D %s, %s", ft, fs);
 }
@@ -3429,8 +3429,8 @@ static char *CEIL_L_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CEIL.L.S %s, %s", ft, fs);
 }
@@ -3451,8 +3451,8 @@ static char *CEIL_W_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CEIL.W.D %s, %s", ft, fs);
 }
@@ -3473,8 +3473,8 @@ static char *CEIL_W_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CEIL.W.S %s, %s", ft, fs);
 }
@@ -3495,8 +3495,8 @@ static char *CFC1(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("CFC1 %s, %s", rt, cs);
 }
@@ -3517,8 +3517,8 @@ static char *CFC2(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("CFC2 %s, %s", rt, cs);
 }
@@ -3539,8 +3539,8 @@ static char *CLASS_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CLASS.D %s, %s", ft, fs);
 }
@@ -3561,8 +3561,8 @@ static char *CLASS_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CLASS.S %s, %s", ft, fs);
 }
@@ -3583,8 +3583,8 @@ static char *CLO(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("CLO %s, %s", rt, rs);
 }
@@ -3605,8 +3605,8 @@ static char *CLZ(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("CLZ %s, %s", rt, rs);
 }
@@ -3628,9 +3628,9 @@ static char *CMP_AF_D(uint64 instruction, img_address m_pc)
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
@@ -3652,9 +3652,9 @@ static char *CMP_AF_S(uint64 instruction, img_address m_pc)
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
@@ -3676,9 +3676,9 @@ static char *CMP_EQ_D(uint64 instruction, img_address m_pc)
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
@@ -3698,8 +3698,8 @@ static char *CMP_EQ_PH(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMP.EQ.PH %s, %s", rs, rt);
 }
@@ -3721,9 +3721,9 @@ static char *CMP_EQ_S(uint64 instruction, img_address m_pc)
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
@@ -3745,9 +3745,9 @@ static char *CMP_LE_D(uint64 instruction, img_address m_pc)
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
@@ -3767,8 +3767,8 @@ static char *CMP_LE_PH(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMP.LE.PH %s, %s", rs, rt);
 }
@@ -3790,9 +3790,9 @@ static char *CMP_LE_S(uint64 instruction, img_address m_pc)
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
@@ -3814,9 +3814,9 @@ static char *CMP_LT_D(uint64 instruction, img_address m_pc)
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
@@ -3836,8 +3836,8 @@ static char *CMP_LT_PH(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMP.LT.PH %s, %s", rs, rt);
 }
@@ -3859,9 +3859,9 @@ static char *CMP_LT_S(uint64 instruction, img_address m_pc)
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
@@ -3883,9 +3883,9 @@ static char *CMP_NE_D(uint64 instruction, img_address m_pc)
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
@@ -3907,9 +3907,9 @@ static char *CMP_NE_S(uint64 instruction, img_address m_pc)
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
@@ -3931,9 +3931,9 @@ static char *CMP_OR_D(uint64 instruction, img_address m_pc)
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
@@ -3955,9 +3955,9 @@ static char *CMP_OR_S(uint64 instruction, img_address m_pc)
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
@@ -3979,9 +3979,9 @@ static char *CMP_SAF_D(uint64 instruction, img_address m_pc)
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
@@ -4003,9 +4003,9 @@ static char *CMP_SAF_S(uint64 instruction, img_address m_pc)
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
@@ -4027,9 +4027,9 @@ static char *CMP_SEQ_D(uint64 instruction, img_address m_pc)
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
@@ -4051,9 +4051,9 @@ static char *CMP_SEQ_S(uint64 instruction, img_address m_pc)
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
@@ -4075,9 +4075,9 @@ static char *CMP_SLE_D(uint64 instruction, img_address m_pc)
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
@@ -4099,9 +4099,9 @@ static char *CMP_SLE_S(uint64 instruction, img_address m_pc)
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
@@ -4123,9 +4123,9 @@ static char *CMP_SLT_D(uint64 instruction, img_address m_pc)
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
@@ -4147,9 +4147,9 @@ static char *CMP_SLT_S(uint64 instruction, img_address m_pc)
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
@@ -4171,9 +4171,9 @@ static char *CMP_SNE_D(uint64 instruction, img_address m_pc)
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
@@ -4195,9 +4195,9 @@ static char *CMP_SNE_S(uint64 instruction, img_address m_pc)
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
@@ -4219,9 +4219,9 @@ static char *CMP_SOR_D(uint64 instruction, img_address m_pc)
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
@@ -4243,9 +4243,9 @@ static char *CMP_SOR_S(uint64 instruction, img_address m_pc)
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
@@ -4267,9 +4267,9 @@ static char *CMP_SUEQ_D(uint64 instruction, img_address m_pc)
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
@@ -4291,9 +4291,9 @@ static char *CMP_SUEQ_S(uint64 instruction, img_address m_pc)
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
@@ -4315,9 +4315,9 @@ static char *CMP_SULE_D(uint64 instruction, img_address m_pc)
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
@@ -4339,9 +4339,9 @@ static char *CMP_SULE_S(uint64 instruction, img_address m_pc)
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
@@ -4363,9 +4363,9 @@ static char *CMP_SULT_D(uint64 instruction, img_address m_pc)
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
@@ -4387,9 +4387,9 @@ static char *CMP_SULT_S(uint64 instruction, img_address m_pc)
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
@@ -4411,9 +4411,9 @@ static char *CMP_SUN_D(uint64 instruction, img_address m_pc)
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
@@ -4435,9 +4435,9 @@ static char *CMP_SUNE_D(uint64 instruction, img_address m_pc)
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
@@ -4459,9 +4459,9 @@ static char *CMP_SUNE_S(uint64 instruction, img_address m_pc)
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
@@ -4483,9 +4483,9 @@ static char *CMP_SUN_S(uint64 instruction, img_address m_pc)
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
@@ -4507,9 +4507,9 @@ static char *CMP_UEQ_D(uint64 instruction, img_address m_pc)
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
@@ -4531,9 +4531,9 @@ static char *CMP_UEQ_S(uint64 instruction, img_address m_pc)
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
@@ -4555,9 +4555,9 @@ static char *CMP_ULE_D(uint64 instruction, img_address m_pc)
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
@@ -4579,9 +4579,9 @@ static char *CMP_ULE_S(uint64 instruction, img_address m_pc)
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
@@ -4603,9 +4603,9 @@ static char *CMP_ULT_D(uint64 instruction, img_address m_pc)
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
@@ -4627,9 +4627,9 @@ static char *CMP_ULT_S(uint64 instruction, img_address m_pc)
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
@@ -4651,9 +4651,9 @@ static char *CMP_UN_D(uint64 instruction, img_address m_pc)
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
@@ -4675,9 +4675,9 @@ static char *CMP_UNE_D(uint64 instruction, img_address m_pc)
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
@@ -4699,9 +4699,9 @@ static char *CMP_UNE_S(uint64 instruction, img_address m_pc)
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
@@ -4723,9 +4723,9 @@ static char *CMP_UN_S(uint64 instruction, img_address m_pc)
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
@@ -4748,9 +4748,9 @@ static char *CMPGDU_EQ_QB(uint64 instruction, img_address m_pc)
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
@@ -4773,9 +4773,9 @@ static char *CMPGDU_LE_QB(uint64 instruction, img_address m_pc)
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
@@ -4798,9 +4798,9 @@ static char *CMPGDU_LT_QB(uint64 instruction, img_address m_pc)
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
@@ -4823,9 +4823,9 @@ static char *CMPGU_EQ_QB(uint64 instruction, img_address m_pc)
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
@@ -4848,9 +4848,9 @@ static char *CMPGU_LE_QB(uint64 instruction, img_address m_pc)
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
@@ -4873,9 +4873,9 @@ static char *CMPGU_LT_QB(uint64 instruction, img_address m_pc)
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
@@ -4896,8 +4896,8 @@ static char *CMPU_EQ_QB(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMPU.EQ.QB %s, %s", rs, rt);
 }
@@ -4918,8 +4918,8 @@ static char *CMPU_LE_QB(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMPU.LE.QB %s, %s", rs, rt);
 }
@@ -4940,8 +4940,8 @@ static char *CMPU_LT_QB(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("CMPU.LT.QB %s, %s", rs, rt);
 }
@@ -4961,7 +4961,7 @@ static char *COP2_1(uint64 instruction, img_address m_pc)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
-    g_autofree char *cofun = IMMEDIATE(copy(cofun_value));
+    g_autofree char *cofun = IMMEDIATE_UI(copy_ui(cofun_value));
 
     return img_format("COP2_1 %s", cofun);
 }
@@ -4982,8 +4982,8 @@ static char *CTC1(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("CTC1 %s, %s", rt, cs);
 }
@@ -5004,8 +5004,8 @@ static char *CTC2(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("CTC2 %s, %s", rt, cs);
 }
@@ -5026,8 +5026,8 @@ static char *CVT_D_L(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.D.L %s, %s", ft, fs);
 }
@@ -5048,8 +5048,8 @@ static char *CVT_D_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.D.S %s, %s", ft, fs);
 }
@@ -5070,8 +5070,8 @@ static char *CVT_D_W(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.D.W %s, %s", ft, fs);
 }
@@ -5092,8 +5092,8 @@ static char *CVT_L_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.L.D %s, %s", ft, fs);
 }
@@ -5114,8 +5114,8 @@ static char *CVT_L_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.L.S %s, %s", ft, fs);
 }
@@ -5136,8 +5136,8 @@ static char *CVT_S_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.S.D %s, %s", ft, fs);
 }
@@ -5158,8 +5158,8 @@ static char *CVT_S_L(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.S.L %s, %s", ft, fs);
 }
@@ -5180,8 +5180,8 @@ static char *CVT_S_PL(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.S.PL %s, %s", ft, fs);
 }
@@ -5202,8 +5202,8 @@ static char *CVT_S_PU(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.S.PU %s, %s", ft, fs);
 }
@@ -5224,8 +5224,8 @@ static char *CVT_S_W(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.S.W %s, %s", ft, fs);
 }
@@ -5246,8 +5246,8 @@ static char *CVT_W_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.W.D %s, %s", ft, fs);
 }
@@ -5268,8 +5268,8 @@ static char *CVT_W_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("CVT.W.S %s, %s", ft, fs);
 }
@@ -5290,8 +5290,8 @@ static char *DADDIU_48_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("DADDIU %s, %s", rt, s);
 }
@@ -5313,9 +5313,9 @@ static char *DADDIU_NEG_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *u = IMMEDIATE(neg_copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *u = IMMEDIATE_I(neg_copy(u_value));
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
@@ -5337,9 +5337,9 @@ static char *DADDIU_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
@@ -5361,9 +5361,9 @@ static char *DADD(uint64 instruction, img_address m_pc)
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
@@ -5385,9 +5385,9 @@ static char *DADDU(uint64 instruction, img_address m_pc)
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
@@ -5408,8 +5408,8 @@ static char *DCLO(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("DCLO %s, %s", rt, rs);
 }
@@ -5430,8 +5430,8 @@ static char *DCLZ(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("DCLZ %s, %s", rt, rs);
 }
@@ -5453,9 +5453,9 @@ static char *DDIV(uint64 instruction, img_address m_pc)
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
@@ -5477,9 +5477,9 @@ static char *DDIVU(uint64 instruction, img_address m_pc)
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
@@ -5520,10 +5520,10 @@ static char *DEXTM(uint64 instruction, img_address m_pc)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *lsb = IMMEDIATE(copy(lsb_value));
-    g_autofree char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
+    g_autofree char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5546,10 +5546,10 @@ static char *DEXT(uint64 instruction, img_address m_pc)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *lsb = IMMEDIATE(copy(lsb_value));
-    g_autofree char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
+    g_autofree char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5572,10 +5572,10 @@ static char *DEXTU(uint64 instruction, img_address m_pc)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *lsb = IMMEDIATE(copy(lsb_value));
-    g_autofree char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
+    g_autofree char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5598,10 +5598,12 @@ static char *DINSM(uint64 instruction, img_address m_pc)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    g_autofree char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
+        lsb_value));
+    g_autofree char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
+        msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
@@ -5626,10 +5628,12 @@ static char *DINS(uint64 instruction, img_address m_pc)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    g_autofree char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
+        lsb_value));
+    g_autofree char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
+        msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINS %s, %s, %s, %s", rt, rs, pos, size);
@@ -5654,10 +5658,12 @@ static char *DINSU(uint64 instruction, img_address m_pc)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    g_autofree char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
+        lsb_value));
+    g_autofree char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
+        msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
@@ -5679,7 +5685,7 @@ static char *DI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DI %s", rt);
 }
@@ -5701,9 +5707,9 @@ static char *DIV(uint64 instruction, img_address m_pc)
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
@@ -5725,9 +5731,9 @@ static char *DIV_D(uint64 instruction, img_address m_pc)
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
@@ -5749,9 +5755,9 @@ static char *DIV_S(uint64 instruction, img_address m_pc)
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
@@ -5773,9 +5779,9 @@ static char *DIVU(uint64 instruction, img_address m_pc)
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
@@ -5798,10 +5804,10 @@ static char *DLSA(uint64 instruction, img_address m_pc)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u2 = IMMEDIATE(copy(u2_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u2 = IMMEDIATE_UI(copy_ui(u2_value));
 
     return img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
@@ -5822,8 +5828,8 @@ static char *DLUI_48_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     uint64 u_value = extract_u_31_to_0__s32(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("DLUI %s, %s", rt, u);
 }
@@ -5845,9 +5851,9 @@ static char *DMFC0(uint64 instruction, img_address m_pc)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = CPR(copy(c0s_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = CPR(copy_ui(c0s_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -5868,8 +5874,8 @@ static char *DMFC1(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("DMFC1 %s, %s", rt, fs);
 }
@@ -5890,8 +5896,8 @@ static char *DMFC2(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("DMFC2 %s, %s", rt, cs);
 }
@@ -5913,9 +5919,9 @@ static char *DMFGC0(uint64 instruction, img_address m_pc)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = CPR(copy(c0s_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = CPR(copy_ui(c0s_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -5937,9 +5943,9 @@ static char *DMOD(uint64 instruction, img_address m_pc)
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
@@ -5961,9 +5967,9 @@ static char *DMODU(uint64 instruction, img_address m_pc)
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
@@ -5985,9 +5991,9 @@ static char *DMTC0(uint64 instruction, img_address m_pc)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = CPR(copy(c0s_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = CPR(copy_ui(c0s_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6008,8 +6014,8 @@ static char *DMTC1(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("DMTC1 %s, %s", rt, fs);
 }
@@ -6030,8 +6036,8 @@ static char *DMTC2(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("DMTC2 %s, %s", rt, cs);
 }
@@ -6053,9 +6059,9 @@ static char *DMTGC0(uint64 instruction, img_address m_pc)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = CPR(copy(c0s_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = CPR(copy_ui(c0s_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6075,7 +6081,7 @@ static char *DMT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DMT %s", rt);
 }
@@ -6097,9 +6103,9 @@ static char *DMUH(uint64 instruction, img_address m_pc)
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
@@ -6121,9 +6127,9 @@ static char *DMUHU(uint64 instruction, img_address m_pc)
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
@@ -6145,9 +6151,9 @@ static char *DMUL(uint64 instruction, img_address m_pc)
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
@@ -6169,9 +6175,9 @@ static char *DMULU(uint64 instruction, img_address m_pc)
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
@@ -6194,9 +6200,9 @@ static char *DPA_W_PH(uint64 instruction, img_address m_pc)
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
@@ -6218,9 +6224,9 @@ static char *DPAQ_SA_L_W(uint64 instruction, img_address m_pc)
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
@@ -6242,9 +6248,9 @@ static char *DPAQ_S_W_PH(uint64 instruction, img_address m_pc)
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
@@ -6266,9 +6272,9 @@ static char *DPAQX_SA_W_PH(uint64 instruction, img_address m_pc)
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
@@ -6290,9 +6296,9 @@ static char *DPAQX_S_W_PH(uint64 instruction, img_address m_pc)
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
@@ -6314,9 +6320,9 @@ static char *DPAU_H_QBL(uint64 instruction, img_address m_pc)
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
@@ -6338,9 +6344,9 @@ static char *DPAU_H_QBR(uint64 instruction, img_address m_pc)
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
@@ -6362,9 +6368,9 @@ static char *DPAX_W_PH(uint64 instruction, img_address m_pc)
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
@@ -6386,9 +6392,9 @@ static char *DPS_W_PH(uint64 instruction, img_address m_pc)
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
@@ -6410,9 +6416,9 @@ static char *DPSQ_SA_L_W(uint64 instruction, img_address m_pc)
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
@@ -6434,9 +6440,9 @@ static char *DPSQ_S_W_PH(uint64 instruction, img_address m_pc)
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
@@ -6458,9 +6464,9 @@ static char *DPSQX_SA_W_PH(uint64 instruction, img_address m_pc)
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
@@ -6482,9 +6488,9 @@ static char *DPSQX_S_W_PH(uint64 instruction, img_address m_pc)
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
@@ -6506,9 +6512,9 @@ static char *DPSU_H_QBL(uint64 instruction, img_address m_pc)
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
@@ -6530,9 +6536,9 @@ static char *DPSU_H_QBR(uint64 instruction, img_address m_pc)
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
@@ -6554,9 +6560,9 @@ static char *DPSX_W_PH(uint64 instruction, img_address m_pc)
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
@@ -6578,9 +6584,9 @@ static char *DROTR(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DROTR %s, %s, %s", rt, rs, shift);
 }
@@ -6602,9 +6608,9 @@ static char *DROTR32(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DROTR32 %s, %s, %s", rt, rs, shift);
 }
@@ -6626,9 +6632,9 @@ static char *DROTRV(uint64 instruction, img_address m_pc)
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
@@ -6651,10 +6657,10 @@ static char *DROTX(uint64 instruction, img_address m_pc)
     uint64 shiftx_value = extract_shiftx_11_10_9_8_7_6(instruction);
     uint64 shift_value = extract_shift_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
-    g_autofree char *shiftx = IMMEDIATE(copy(shiftx_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
+    g_autofree char *shiftx = IMMEDIATE_UI(copy_ui(shiftx_value));
 
     return img_format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
 }
@@ -6676,9 +6682,9 @@ static char *DSLL(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DSLL %s, %s, %s", rt, rs, shift);
 }
@@ -6700,9 +6706,9 @@ static char *DSLL32(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DSLL32 %s, %s, %s", rt, rs, shift);
 }
@@ -6724,9 +6730,9 @@ static char *DSLLV(uint64 instruction, img_address m_pc)
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
@@ -6748,9 +6754,9 @@ static char *DSRA(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DSRA %s, %s, %s", rt, rs, shift);
 }
@@ -6772,9 +6778,9 @@ static char *DSRA32(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DSRA32 %s, %s, %s", rt, rs, shift);
 }
@@ -6796,9 +6802,9 @@ static char *DSRAV(uint64 instruction, img_address m_pc)
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
@@ -6820,9 +6826,9 @@ static char *DSRL(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DSRL %s, %s, %s", rt, rs, shift);
 }
@@ -6844,9 +6850,9 @@ static char *DSRL32(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("DSRL32 %s, %s, %s", rt, rs, shift);
 }
@@ -6868,9 +6874,9 @@ static char *DSRLV(uint64 instruction, img_address m_pc)
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
@@ -6892,9 +6898,9 @@ static char *DSUB(uint64 instruction, img_address m_pc)
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
@@ -6916,9 +6922,9 @@ static char *DSUBU(uint64 instruction, img_address m_pc)
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
@@ -6938,7 +6944,7 @@ static char *DVPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DVPE %s", rt);
 }
@@ -6958,7 +6964,7 @@ static char *DVP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("DVP %s", rt);
 }
@@ -6996,7 +7002,7 @@ static char *EI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("EI %s", rt);
 }
@@ -7016,7 +7022,7 @@ static char *EMT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("EMT %s", rt);
 }
@@ -7072,7 +7078,7 @@ static char *EVP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("EVP %s", rt);
 }
@@ -7092,7 +7098,7 @@ static char *EVPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("EVPE %s", rt);
 }
@@ -7115,10 +7121,10 @@ static char *EXT(uint64 instruction, img_address m_pc)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *lsb = IMMEDIATE(copy(lsb_value));
-    g_autofree char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *lsb = IMMEDIATE_UI(copy_ui(lsb_value));
+    g_autofree char *msbd = IMMEDIATE_UI(encode_msbd_from_size(msbd_value));
 
     return img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -7141,10 +7147,10 @@ static char *EXTD(uint64 instruction, img_address m_pc)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7167,10 +7173,10 @@ static char *EXTD32(uint64 instruction, img_address m_pc)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7192,9 +7198,9 @@ static char *EXTPDP(uint64 instruction, img_address m_pc)
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    g_autofree char *size = IMMEDIATE(copy(size_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    g_autofree char *size = IMMEDIATE_UI(copy_ui(size_value));
 
     return img_format("EXTPDP %s, %s, %s", rt, ac, size);
 }
@@ -7216,9 +7222,9 @@ static char *EXTPDPV(uint64 instruction, img_address m_pc)
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
@@ -7240,9 +7246,9 @@ static char *EXTP(uint64 instruction, img_address m_pc)
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    g_autofree char *size = IMMEDIATE(copy(size_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    g_autofree char *size = IMMEDIATE_UI(copy_ui(size_value));
 
     return img_format("EXTP %s, %s, %s", rt, ac, size);
 }
@@ -7264,9 +7270,9 @@ static char *EXTPV(uint64 instruction, img_address m_pc)
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
@@ -7289,9 +7295,9 @@ static char *EXTR_RS_W(uint64 instruction, img_address m_pc)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
 }
@@ -7314,9 +7320,9 @@ static char *EXTR_R_W(uint64 instruction, img_address m_pc)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
 }
@@ -7339,9 +7345,9 @@ static char *EXTR_S_H(uint64 instruction, img_address m_pc)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
 }
@@ -7364,9 +7370,9 @@ static char *EXTR_W(uint64 instruction, img_address m_pc)
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTR.W %s, %s, %s", rt, ac, shift);
 }
@@ -7389,9 +7395,9 @@ static char *EXTRV_RS_W(uint64 instruction, img_address m_pc)
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
@@ -7414,9 +7420,9 @@ static char *EXTRV_R_W(uint64 instruction, img_address m_pc)
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
@@ -7439,9 +7445,9 @@ static char *EXTRV_S_H(uint64 instruction, img_address m_pc)
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
@@ -7464,9 +7470,9 @@ static char *EXTRV_W(uint64 instruction, img_address m_pc)
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
@@ -7490,10 +7496,10 @@ static char *EXTW(uint64 instruction, img_address m_pc)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7514,8 +7520,8 @@ static char *FLOOR_L_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("FLOOR.L.D %s, %s", ft, fs);
 }
@@ -7536,8 +7542,8 @@ static char *FLOOR_L_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("FLOOR.L.S %s, %s", ft, fs);
 }
@@ -7558,8 +7564,8 @@ static char *FLOOR_W_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("FLOOR.W.D %s, %s", ft, fs);
 }
@@ -7580,8 +7586,8 @@ static char *FLOOR_W_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("FLOOR.W.S %s, %s", ft, fs);
 }
@@ -7603,9 +7609,9 @@ static char *FORK(uint64 instruction, img_address m_pc)
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
@@ -7625,7 +7631,7 @@ static char *HYPCALL(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    g_autofree char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     return img_format("HYPCALL %s", code);
 }
@@ -7645,7 +7651,7 @@ static char *HYPCALL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    g_autofree char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     return img_format("HYPCALL %s", code);
 }
@@ -7668,10 +7674,12 @@ static char *INS(uint64 instruction, img_address m_pc)
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    g_autofree char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *pos = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
+        lsb_value));
+    g_autofree char *size = IMMEDIATE_UI(encode_lsb_from_pos_and_size(
+        msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("INS %s, %s, %s, %s", rt, rs, pos, size);
@@ -7693,8 +7701,8 @@ static char *INSV(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("INSV %s, %s", rt, rs);
 }
@@ -7732,7 +7740,7 @@ static char *JALRC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("JALRC $%d, %s", 31, rt);
 }
@@ -7753,8 +7761,8 @@ static char *JALRC_32_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("JALRC %s, %s", rt, rs);
 }
@@ -7775,8 +7783,8 @@ static char *JALRC_HB(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("JALRC.HB %s, %s", rt, rs);
 }
@@ -7796,7 +7804,7 @@ static char *JRC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("JRC %s", rt);
 }
@@ -7819,7 +7827,7 @@ static char *LB_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_1_0(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LB %s, %s(%s)", rt3, u, rs3);
@@ -7841,8 +7849,8 @@ static char *LB_GP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LB %s, %s($%d)", rt, u, 28);
 }
@@ -7864,9 +7872,9 @@ static char *LB_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LB %s, %s(%s)", rt, s, rs);
 }
@@ -7888,9 +7896,9 @@ static char *LB_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LB %s, %s(%s)", rt, u, rs);
 }
@@ -7912,9 +7920,9 @@ static char *LBE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LBE %s, %s(%s)", rt, s, rs);
 }
@@ -7937,7 +7945,7 @@ static char *LBU_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_1_0(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LBU %s, %s(%s)", rt3, u, rs3);
@@ -7959,8 +7967,8 @@ static char *LBU_GP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LBU %s, %s($%d)", rt, u, 28);
 }
@@ -7982,9 +7990,9 @@ static char *LBU_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LBU %s, %s(%s)", rt, s, rs);
 }
@@ -8006,9 +8014,9 @@ static char *LBU_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LBU %s, %s(%s)", rt, u, rs);
 }
@@ -8030,9 +8038,9 @@ static char *LBUE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LBUE %s, %s(%s)", rt, s, rs);
 }
@@ -8054,9 +8062,9 @@ static char *LBUX(uint64 instruction, img_address m_pc)
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
@@ -8078,9 +8086,9 @@ static char *LBX(uint64 instruction, img_address m_pc)
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
@@ -8101,8 +8109,8 @@ static char *LD_GP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LD %s, %s($%d)", rt, u, 28);
 }
@@ -8124,9 +8132,9 @@ static char *LD_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LD %s, %s(%s)", rt, s, rs);
 }
@@ -8148,9 +8156,9 @@ static char *LD_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LD %s, %s(%s)", rt, u, rs);
 }
@@ -8171,8 +8179,8 @@ static char *LDC1_GP_(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LDC1 %s, %s($%d)", ft, u, 28);
 }
@@ -8194,9 +8202,9 @@ static char *LDC1_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LDC1 %s, %s(%s)", ft, s, rs);
 }
@@ -8218,9 +8226,9 @@ static char *LDC1_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LDC1 %s, %s(%s)", ft, u, rs);
 }
@@ -8242,9 +8250,9 @@ static char *LDC1XS(uint64 instruction, img_address m_pc)
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
@@ -8266,9 +8274,9 @@ static char *LDC1X(uint64 instruction, img_address m_pc)
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
@@ -8290,9 +8298,9 @@ static char *LDC2(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    g_autofree char *ct = CPR(copy(ct_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    g_autofree char *ct = CPR(copy_ui(ct_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LDC2 %s, %s(%s)", ct, s, rs);
 }
@@ -8315,10 +8323,10 @@ static char *LDM(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
         count3_value));
 
     return img_format("LDM %s, %s(%s), %s", rt, s, rs, count3);
@@ -8340,7 +8348,7 @@ static char *LDPC_48_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("LDPC %s, %s", rt, s);
@@ -8363,9 +8371,9 @@ static char *LDX(uint64 instruction, img_address m_pc)
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
@@ -8387,9 +8395,9 @@ static char *LDXS(uint64 instruction, img_address m_pc)
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
@@ -8412,7 +8420,7 @@ static char *LH_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LH %s, %s(%s)", rt3, u, rs3);
@@ -8434,8 +8442,8 @@ static char *LH_GP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LH %s, %s($%d)", rt, u, 28);
 }
@@ -8457,9 +8465,9 @@ static char *LH_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LH %s, %s(%s)", rt, s, rs);
 }
@@ -8481,9 +8489,9 @@ static char *LH_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LH %s, %s(%s)", rt, u, rs);
 }
@@ -8505,9 +8513,9 @@ static char *LHE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LHE %s, %s(%s)", rt, s, rs);
 }
@@ -8530,7 +8538,7 @@ static char *LHU_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LHU %s, %s(%s)", rt3, u, rs3);
@@ -8552,8 +8560,8 @@ static char *LHU_GP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LHU %s, %s($%d)", rt, u, 28);
 }
@@ -8575,9 +8583,9 @@ static char *LHU_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LHU %s, %s(%s)", rt, s, rs);
 }
@@ -8599,9 +8607,9 @@ static char *LHU_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LHU %s, %s(%s)", rt, u, rs);
 }
@@ -8623,9 +8631,9 @@ static char *LHUE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LHUE %s, %s(%s)", rt, s, rs);
 }
@@ -8647,9 +8655,9 @@ static char *LHUX(uint64 instruction, img_address m_pc)
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
@@ -8671,9 +8679,9 @@ static char *LHUXS(uint64 instruction, img_address m_pc)
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
@@ -8695,9 +8703,9 @@ static char *LHXS(uint64 instruction, img_address m_pc)
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
@@ -8719,9 +8727,9 @@ static char *LHX(uint64 instruction, img_address m_pc)
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
@@ -8743,7 +8751,7 @@ static char *LI_16_(uint64 instruction, img_address m_pc)
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    g_autofree char *eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
+    g_autofree char *eu = IMMEDIATE_I(encode_eu_from_s_li16(eu_value));
 
     return img_format("LI %s, %s", rt3, eu);
 }
@@ -8764,8 +8772,8 @@ static char *LI_48_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("LI %s, %s", rt, s);
 }
@@ -8787,9 +8795,9 @@ static char *LL(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LL %s, %s(%s)", rt, s, rs);
 }
@@ -8811,9 +8819,9 @@ static char *LLD(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LLD %s, %s(%s)", rt, s, rs);
 }
@@ -8835,9 +8843,9 @@ static char *LLDP(uint64 instruction, img_address m_pc)
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
@@ -8859,9 +8867,9 @@ static char *LLE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LLE %s, %s(%s)", rt, s, rs);
 }
@@ -8883,9 +8891,9 @@ static char *LLWP(uint64 instruction, img_address m_pc)
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
@@ -8907,9 +8915,9 @@ static char *LLWPE(uint64 instruction, img_address m_pc)
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
@@ -8932,10 +8940,10 @@ static char *LSA(uint64 instruction, img_address m_pc)
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    const char *rd = GPR(copy(rd_value));
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u2 = IMMEDIATE(copy(u2_value));
+    const char *rd = GPR(copy_ui(rd_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u2 = IMMEDIATE_UI(copy_ui(u2_value));
 
     return img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
@@ -8956,8 +8964,8 @@ static char *LUI(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("LUI %s, %%hi(%s)", rt, s);
 }
@@ -8980,7 +8988,7 @@ static char *LW_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LW %s, %s(%s)", rt3, u, rs3);
@@ -9004,7 +9012,7 @@ static char *LW_4X4_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_3_8__s2(instruction);
 
     const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     return img_format("LW %s, %s(%s)", rt4, u, rs4);
@@ -9026,8 +9034,8 @@ static char *LW_GP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LW %s, %s($%d)", rt, u, 28);
 }
@@ -9049,7 +9057,7 @@ static char *LW_GP16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LW %s, %s($%d)", rt3, u, 28);
 }
@@ -9071,9 +9079,9 @@ static char *LW_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LW %s, %s(%s)", rt, s, rs);
 }
@@ -9094,8 +9102,8 @@ static char *LW_SP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LW %s, %s($%d)", rt, u, 29);
 }
@@ -9117,9 +9125,9 @@ static char *LW_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LW %s, %s(%s)", rt, u, rs);
 }
@@ -9140,8 +9148,8 @@ static char *LWC1_GP_(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LWC1 %s, %s($%d)", ft, u, 28);
 }
@@ -9163,9 +9171,9 @@ static char *LWC1_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LWC1 %s, %s(%s)", ft, s, rs);
 }
@@ -9187,9 +9195,9 @@ static char *LWC1_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LWC1 %s, %s(%s)", ft, u, rs);
 }
@@ -9211,9 +9219,9 @@ static char *LWC1X(uint64 instruction, img_address m_pc)
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
@@ -9235,9 +9243,9 @@ static char *LWC1XS(uint64 instruction, img_address m_pc)
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
@@ -9259,9 +9267,9 @@ static char *LWC2(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    g_autofree char *ct = CPR(copy(ct_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    g_autofree char *ct = CPR(copy_ui(ct_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LWC2 %s, %s(%s)", ct, s, rs);
 }
@@ -9283,9 +9291,9 @@ static char *LWE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LWE %s, %s(%s)", rt, s, rs);
 }
@@ -9308,10 +9316,11 @@ static char *LWM(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
+        count3_value));
 
     return img_format("LWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -9332,7 +9341,7 @@ static char *LWPC_48_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("LWPC %s, %s", rt, s);
@@ -9354,8 +9363,8 @@ static char *LWU_GP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("LWU %s, %s($%d)", rt, u, 28);
 }
@@ -9377,9 +9386,9 @@ static char *LWU_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LWU %s, %s(%s)", rt, s, rs);
 }
@@ -9401,9 +9410,9 @@ static char *LWU_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("LWU %s, %s(%s)", rt, u, rs);
 }
@@ -9425,9 +9434,9 @@ static char *LWUX(uint64 instruction, img_address m_pc)
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
@@ -9449,9 +9458,9 @@ static char *LWUXS(uint64 instruction, img_address m_pc)
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
@@ -9473,9 +9482,9 @@ static char *LWX(uint64 instruction, img_address m_pc)
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
@@ -9499,7 +9508,7 @@ static char *LWXS_16_(uint64 instruction, img_address m_pc)
 
     const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    g_autofree char *rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
+    g_autofree char *rt3 = IMMEDIATE_UI(decode_gpr_gpr3(rt3_value));
 
     return img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
 }
@@ -9521,9 +9530,9 @@ static char *LWXS_32_(uint64 instruction, img_address m_pc)
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
@@ -9546,9 +9555,9 @@ static char *MADD_DSP_(uint64 instruction, img_address m_pc)
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
@@ -9570,9 +9579,9 @@ static char *MADDF_D(uint64 instruction, img_address m_pc)
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
@@ -9594,9 +9603,9 @@ static char *MADDF_S(uint64 instruction, img_address m_pc)
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
@@ -9619,9 +9628,9 @@ static char *MADDU_DSP_(uint64 instruction, img_address m_pc)
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
@@ -9644,9 +9653,9 @@ static char *MAQ_S_W_PHL(uint64 instruction, img_address m_pc)
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
@@ -9669,9 +9678,9 @@ static char *MAQ_S_W_PHR(uint64 instruction, img_address m_pc)
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
@@ -9694,9 +9703,9 @@ static char *MAQ_SA_W_PHL(uint64 instruction, img_address m_pc)
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
@@ -9719,9 +9728,9 @@ static char *MAQ_SA_W_PHR(uint64 instruction, img_address m_pc)
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
@@ -9743,9 +9752,9 @@ static char *MAX_D(uint64 instruction, img_address m_pc)
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
@@ -9767,9 +9776,9 @@ static char *MAX_S(uint64 instruction, img_address m_pc)
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
@@ -9791,9 +9800,9 @@ static char *MAXA_D(uint64 instruction, img_address m_pc)
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
@@ -9815,9 +9824,9 @@ static char *MAXA_S(uint64 instruction, img_address m_pc)
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
@@ -9839,9 +9848,9 @@ static char *MFC0(uint64 instruction, img_address m_pc)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = CPR(copy(c0s_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = CPR(copy_ui(c0s_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("MFC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -9862,8 +9871,8 @@ static char *MFC1(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("MFC1 %s, %s", rt, fs);
 }
@@ -9884,8 +9893,8 @@ static char *MFC2(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("MFC2 %s, %s", rt, cs);
 }
@@ -9907,9 +9916,9 @@ static char *MFGC0(uint64 instruction, img_address m_pc)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = CPR(copy(c0s_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = CPR(copy_ui(c0s_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -9931,9 +9940,9 @@ static char *MFHC0(uint64 instruction, img_address m_pc)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = CPR(copy(c0s_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = CPR(copy_ui(c0s_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -9954,8 +9963,8 @@ static char *MFHC1(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("MFHC1 %s, %s", rt, fs);
 }
@@ -9976,8 +9985,8 @@ static char *MFHC2(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("MFHC2 %s, %s", rt, cs);
 }
@@ -9999,9 +10008,9 @@ static char *MFHGC0(uint64 instruction, img_address m_pc)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = CPR(copy(c0s_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = CPR(copy_ui(c0s_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10021,8 +10030,8 @@ static char *MFHI_DSP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     return img_format("MFHI %s, %s", rt, ac);
 }
@@ -10045,10 +10054,10 @@ static char *MFHTR(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = IMMEDIATE(copy(c0s_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10068,8 +10077,8 @@ static char *MFLO_DSP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *ac = AC(copy(ac_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     return img_format("MFLO %s, %s", rt, ac);
 }
@@ -10092,10 +10101,10 @@ static char *MFTR(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = IMMEDIATE(copy(c0s_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10117,9 +10126,9 @@ static char *MIN_D(uint64 instruction, img_address m_pc)
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
@@ -10141,9 +10150,9 @@ static char *MIN_S(uint64 instruction, img_address m_pc)
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
@@ -10165,9 +10174,9 @@ static char *MINA_D(uint64 instruction, img_address m_pc)
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
@@ -10189,9 +10198,9 @@ static char *MINA_S(uint64 instruction, img_address m_pc)
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
@@ -10213,9 +10222,9 @@ static char *MOD(uint64 instruction, img_address m_pc)
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
@@ -10237,9 +10246,9 @@ static char *MODSUB(uint64 instruction, img_address m_pc)
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
@@ -10261,9 +10270,9 @@ static char *MODU(uint64 instruction, img_address m_pc)
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
@@ -10284,8 +10293,8 @@ static char *MOV_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("MOV.D %s, %s", ft, fs);
 }
@@ -10306,8 +10315,8 @@ static char *MOV_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("MOV.S %s, %s", ft, fs);
 }
@@ -10406,8 +10415,8 @@ static char *MOVE(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 rs_value = extract_rs_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("MOVE %s, %s", rt, rs);
 }
@@ -10429,9 +10438,9 @@ static char *MOVN(uint64 instruction, img_address m_pc)
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
@@ -10453,9 +10462,9 @@ static char *MOVZ(uint64 instruction, img_address m_pc)
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
@@ -10477,9 +10486,9 @@ static char *MSUB_DSP_(uint64 instruction, img_address m_pc)
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
@@ -10501,9 +10510,9 @@ static char *MSUBF_D(uint64 instruction, img_address m_pc)
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
@@ -10525,9 +10534,9 @@ static char *MSUBF_S(uint64 instruction, img_address m_pc)
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
@@ -10549,9 +10558,9 @@ static char *MSUBU_DSP_(uint64 instruction, img_address m_pc)
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
@@ -10573,9 +10582,9 @@ static char *MTC0(uint64 instruction, img_address m_pc)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = CPR(copy(c0s_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = CPR(copy_ui(c0s_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("MTC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10596,8 +10605,8 @@ static char *MTC1(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("MTC1 %s, %s", rt, fs);
 }
@@ -10618,8 +10627,8 @@ static char *MTC2(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("MTC2 %s, %s", rt, cs);
 }
@@ -10641,9 +10650,9 @@ static char *MTGC0(uint64 instruction, img_address m_pc)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = CPR(copy(c0s_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = CPR(copy_ui(c0s_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10665,9 +10674,9 @@ static char *MTHC0(uint64 instruction, img_address m_pc)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = CPR(copy(c0s_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = CPR(copy_ui(c0s_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10688,8 +10697,8 @@ static char *MTHC1(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("MTHC1 %s, %s", rt, fs);
 }
@@ -10710,8 +10719,8 @@ static char *MTHC2(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *cs = CPR(copy_ui(cs_value));
 
     return img_format("MTHC2 %s, %s", rt, cs);
 }
@@ -10733,9 +10742,9 @@ static char *MTHGC0(uint64 instruction, img_address m_pc)
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = CPR(copy(c0s_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = CPR(copy_ui(c0s_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10755,8 +10764,8 @@ static char *MTHI_DSP_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     return img_format("MTHI %s, %s", rs, ac);
 }
@@ -10776,8 +10785,8 @@ static char *MTHLIP(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     return img_format("MTHLIP %s, %s", rs, ac);
 }
@@ -10800,10 +10809,10 @@ static char *MTHTR(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = IMMEDIATE(copy(c0s_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10823,8 +10832,8 @@ static char *MTLO_DSP_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     return img_format("MTLO %s, %s", rs, ac);
 }
@@ -10847,10 +10856,10 @@ static char *MTTR(uint64 instruction, img_address m_pc)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *c0s = IMMEDIATE(copy(c0s_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *c0s = IMMEDIATE_UI(copy_ui(c0s_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10872,9 +10881,9 @@ static char *MUH(uint64 instruction, img_address m_pc)
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
@@ -10896,9 +10905,9 @@ static char *MUHU(uint64 instruction, img_address m_pc)
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
@@ -10920,9 +10929,9 @@ static char *MUL_32_(uint64 instruction, img_address m_pc)
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
@@ -10966,9 +10975,9 @@ static char *MUL_D(uint64 instruction, img_address m_pc)
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
@@ -10991,9 +11000,9 @@ static char *MUL_PH(uint64 instruction, img_address m_pc)
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
@@ -11016,9 +11025,9 @@ static char *MUL_S_PH(uint64 instruction, img_address m_pc)
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
@@ -11040,9 +11049,9 @@ static char *MUL_S(uint64 instruction, img_address m_pc)
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
@@ -11065,9 +11074,9 @@ static char *MULEQ_S_W_PHL(uint64 instruction, img_address m_pc)
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
@@ -11090,9 +11099,9 @@ static char *MULEQ_S_W_PHR(uint64 instruction, img_address m_pc)
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
@@ -11115,9 +11124,9 @@ static char *MULEU_S_PH_QBL(uint64 instruction, img_address m_pc)
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
@@ -11140,9 +11149,9 @@ static char *MULEU_S_PH_QBR(uint64 instruction, img_address m_pc)
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
@@ -11165,9 +11174,9 @@ static char *MULQ_RS_PH(uint64 instruction, img_address m_pc)
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
@@ -11190,9 +11199,9 @@ static char *MULQ_RS_W(uint64 instruction, img_address m_pc)
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
@@ -11215,9 +11224,9 @@ static char *MULQ_S_PH(uint64 instruction, img_address m_pc)
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
@@ -11240,9 +11249,9 @@ static char *MULQ_S_W(uint64 instruction, img_address m_pc)
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
@@ -11265,9 +11274,9 @@ static char *MULSA_W_PH(uint64 instruction, img_address m_pc)
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
@@ -11290,9 +11299,9 @@ static char *MULSAQ_S_W_PH(uint64 instruction, img_address m_pc)
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
@@ -11314,9 +11323,9 @@ static char *MULT_DSP_(uint64 instruction, img_address m_pc)
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
@@ -11338,9 +11347,9 @@ static char *MULTU_DSP_(uint64 instruction, img_address m_pc)
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
@@ -11362,9 +11371,9 @@ static char *MULU(uint64 instruction, img_address m_pc)
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
@@ -11385,8 +11394,8 @@ static char *NEG_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("NEG.D %s, %s", ft, fs);
 }
@@ -11407,8 +11416,8 @@ static char *NEG_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("NEG.S %s, %s", ft, fs);
 }
@@ -11466,9 +11475,9 @@ static char *NOR(uint64 instruction, img_address m_pc)
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
@@ -11534,9 +11543,9 @@ static char *OR_32_(uint64 instruction, img_address m_pc)
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
@@ -11558,9 +11567,9 @@ static char *ORI(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("ORI %s, %s, %s", rt, rs, u);
 }
@@ -11583,9 +11592,9 @@ static char *PACKRL_PH(uint64 instruction, img_address m_pc)
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
@@ -11626,9 +11635,9 @@ static char *PICK_PH(uint64 instruction, img_address m_pc)
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
@@ -11651,9 +11660,9 @@ static char *PICK_QB(uint64 instruction, img_address m_pc)
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
@@ -11675,8 +11684,8 @@ static char *PRECEQ_W_PHL(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEQ.W.PHL %s, %s", rt, rs);
 }
@@ -11698,8 +11707,8 @@ static char *PRECEQ_W_PHR(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEQ.W.PHR %s, %s", rt, rs);
 }
@@ -11721,8 +11730,8 @@ static char *PRECEQU_PH_QBLA(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEQU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11744,8 +11753,8 @@ static char *PRECEQU_PH_QBL(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEQU.PH.QBL %s, %s", rt, rs);
 }
@@ -11767,8 +11776,8 @@ static char *PRECEQU_PH_QBRA(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEQU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11790,8 +11799,8 @@ static char *PRECEQU_PH_QBR(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEQU.PH.QBR %s, %s", rt, rs);
 }
@@ -11814,8 +11823,8 @@ static char *PRECEU_PH_QBLA(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11837,8 +11846,8 @@ static char *PRECEU_PH_QBL(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEU.PH.QBL %s, %s", rt, rs);
 }
@@ -11861,8 +11870,8 @@ static char *PRECEU_PH_QBRA(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11884,8 +11893,8 @@ static char *PRECEU_PH_QBR(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PRECEU.PH.QBR %s, %s", rt, rs);
 }
@@ -11908,9 +11917,9 @@ static char *PRECR_QB_PH(uint64 instruction, img_address m_pc)
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
@@ -11933,9 +11942,9 @@ static char *PRECR_SRA_PH_W(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
 }
@@ -11958,9 +11967,9 @@ static char *PRECR_SRA_R_PH_W(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
 }
@@ -11983,9 +11992,9 @@ static char *PRECRQ_PH_W(uint64 instruction, img_address m_pc)
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
@@ -12008,9 +12017,9 @@ static char *PRECRQ_QB_PH(uint64 instruction, img_address m_pc)
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
@@ -12033,9 +12042,9 @@ static char *PRECRQ_RS_PH_W(uint64 instruction, img_address m_pc)
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
@@ -12058,9 +12067,9 @@ static char *PRECRQU_S_QB_PH(uint64 instruction, img_address m_pc)
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
@@ -12082,9 +12091,9 @@ static char *PREF_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    g_autofree char *hint = IMMEDIATE(copy(hint_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    g_autofree char *hint = IMMEDIATE_UI(copy_ui(hint_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PREF %s, %s(%s)", hint, s, rs);
 }
@@ -12106,9 +12115,9 @@ static char *PREF_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    g_autofree char *hint = IMMEDIATE(copy(hint_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    g_autofree char *hint = IMMEDIATE_UI(copy_ui(hint_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PREF %s, %s(%s)", hint, u, rs);
 }
@@ -12130,9 +12139,9 @@ static char *PREFE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    g_autofree char *hint = IMMEDIATE(copy(hint_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    g_autofree char *hint = IMMEDIATE_UI(copy_ui(hint_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("PREFE %s, %s(%s)", hint, s, rs);
 }
@@ -12154,9 +12163,9 @@ static char *PREPEND(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("PREPEND %s, %s, %s", rt, rs, sa);
 }
@@ -12176,8 +12185,8 @@ static char *RADDU_W_QB(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("RADDU.W.QB %s, %s", rt, rs);
 }
@@ -12197,8 +12206,8 @@ static char *RDDSP(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *mask = IMMEDIATE(copy(mask_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *mask = IMMEDIATE_UI(copy_ui(mask_value));
 
     return img_format("RDDSP %s, %s", rt, mask);
 }
@@ -12220,9 +12229,9 @@ static char *RDHWR(uint64 instruction, img_address m_pc)
     uint64 hs_value = extract_hs_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *hs = CPR(copy(hs_value));
-    g_autofree char *sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *hs = CPR(copy_ui(hs_value));
+    g_autofree char *sel = IMMEDIATE_UI(copy_ui(sel_value));
 
     return img_format("RDHWR %s, %s, %s", rt, hs, sel);
 }
@@ -12243,8 +12252,8 @@ static char *RDPGPR(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("RDPGPR %s, %s", rt, rs);
 }
@@ -12265,8 +12274,8 @@ static char *RECIP_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("RECIP.D %s, %s", ft, fs);
 }
@@ -12287,8 +12296,8 @@ static char *RECIP_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("RECIP.S %s, %s", ft, fs);
 }
@@ -12309,8 +12318,8 @@ static char *REPL_PH(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
 
     return img_format("REPL.PH %s, %s", rt, s);
 }
@@ -12331,8 +12340,8 @@ static char *REPL_QB(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("REPL.QB %s, %s", rt, u);
 }
@@ -12353,8 +12362,8 @@ static char *REPLV_PH(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("REPLV.PH %s, %s", rt, rs);
 }
@@ -12374,8 +12383,8 @@ static char *REPLV_QB(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("REPLV.QB %s, %s", rt, rs);
 }
@@ -12398,7 +12407,7 @@ static char *RESTORE_32_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *save_restore_str = save_restore_list(
         rt_value, count_value, gp_value);
     return img_format("RESTORE %s%s", u, save_restore_str);
@@ -12421,7 +12430,7 @@ static char *RESTORE_JRC_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *save_restore_str = save_restore_list(
         encode_rt1_from_rt(rt1_value), count_value, 0);
     return img_format("RESTORE.JRC %s%s", u, save_restore_str);
@@ -12445,7 +12454,7 @@ static char *RESTORE_JRC_32_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *save_restore_str = save_restore_list(
         rt_value, count_value, gp_value);
     return img_format("RESTORE.JRC %s%s", u, save_restore_str);
@@ -12467,8 +12476,8 @@ static char *RESTOREF(uint64 instruction, img_address m_pc)
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    g_autofree char *count = IMMEDIATE(copy(count_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    g_autofree char *count = IMMEDIATE_UI(copy_ui(count_value));
 
     return img_format("RESTOREF %s, %s", u, count);
 }
@@ -12489,8 +12498,8 @@ static char *RINT_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("RINT.D %s, %s", ft, fs);
 }
@@ -12511,8 +12520,8 @@ static char *RINT_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("RINT.S %s, %s", ft, fs);
 }
@@ -12534,9 +12543,9 @@ static char *ROTR(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("ROTR %s, %s, %s", rt, rs, shift);
 }
@@ -12558,9 +12567,9 @@ static char *ROTRV(uint64 instruction, img_address m_pc)
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
@@ -12584,11 +12593,11 @@ static char *ROTX(uint64 instruction, img_address m_pc)
     uint64 stripe_value = extract_stripe_6(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
-    g_autofree char *shiftx = IMMEDIATE(copy(shiftx_value));
-    g_autofree char *stripe = IMMEDIATE(copy(stripe_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
+    g_autofree char *shiftx = IMMEDIATE_UI(copy_ui(shiftx_value));
+    g_autofree char *stripe = IMMEDIATE_UI(copy_ui(stripe_value));
 
     return img_format("ROTX %s, %s, %s, %s, %s",
                        rt, rs, shift, shiftx, stripe);
@@ -12610,8 +12619,8 @@ static char *ROUND_L_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("ROUND.L.D %s, %s", ft, fs);
 }
@@ -12632,8 +12641,8 @@ static char *ROUND_L_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("ROUND.L.S %s, %s", ft, fs);
 }
@@ -12654,8 +12663,8 @@ static char *ROUND_W_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("ROUND.W.D %s, %s", ft, fs);
 }
@@ -12676,8 +12685,8 @@ static char *ROUND_W_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("ROUND.W.S %s, %s", ft, fs);
 }
@@ -12698,8 +12707,8 @@ static char *RSQRT_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("RSQRT.D %s, %s", ft, fs);
 }
@@ -12720,8 +12729,8 @@ static char *RSQRT_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("RSQRT.S %s, %s", ft, fs);
 }
@@ -12743,7 +12752,7 @@ static char *SAVE_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *save_restore_str = save_restore_list(
         encode_rt1_from_rt(rt1_value), count_value, 0);
     return img_format("SAVE %s%s", u, save_restore_str);
@@ -12767,7 +12776,7 @@ static char *SAVE_32_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     g_autofree char *save_restore_str = save_restore_list(
         rt_value, count_value, gp_value);
     return img_format("SAVE %s%s", u, save_restore_str);
@@ -12789,8 +12798,8 @@ static char *SAVEF(uint64 instruction, img_address m_pc)
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    g_autofree char *count = IMMEDIATE(copy(count_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    g_autofree char *count = IMMEDIATE_UI(copy_ui(count_value));
 
     return img_format("SAVEF %s, %s", u, count);
 }
@@ -12813,7 +12822,7 @@ static char *SB_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_1_0(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SB %s, %s(%s)", rtz3, u, rs3);
@@ -12835,8 +12844,8 @@ static char *SB_GP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SB %s, %s($%d)", rt, u, 28);
 }
@@ -12858,9 +12867,9 @@ static char *SB_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SB %s, %s(%s)", rt, s, rs);
 }
@@ -12882,9 +12891,9 @@ static char *SB_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SB %s, %s(%s)", rt, u, rs);
 }
@@ -12906,9 +12915,9 @@ static char *SBE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SBE %s, %s(%s)", rt, s, rs);
 }
@@ -12930,9 +12939,9 @@ static char *SBX(uint64 instruction, img_address m_pc)
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
@@ -12954,9 +12963,9 @@ static char *SC(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SC %s, %s(%s)", rt, s, rs);
 }
@@ -12978,9 +12987,9 @@ static char *SCD(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SCD %s, %s(%s)", rt, s, rs);
 }
@@ -13002,9 +13011,9 @@ static char *SCDP(uint64 instruction, img_address m_pc)
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
@@ -13026,9 +13035,9 @@ static char *SCE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SCE %s, %s(%s)", rt, s, rs);
 }
@@ -13050,9 +13059,9 @@ static char *SCWP(uint64 instruction, img_address m_pc)
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
@@ -13074,9 +13083,9 @@ static char *SCWPE(uint64 instruction, img_address m_pc)
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
@@ -13097,8 +13106,8 @@ static char *SD_GP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SD %s, %s($%d)", rt, u, 28);
 }
@@ -13120,9 +13129,9 @@ static char *SD_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SD %s, %s(%s)", rt, s, rs);
 }
@@ -13144,9 +13153,9 @@ static char *SD_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SD %s, %s(%s)", rt, u, rs);
 }
@@ -13166,7 +13175,7 @@ static char *SDBBP_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    g_autofree char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     return img_format("SDBBP %s", code);
 }
@@ -13186,7 +13195,7 @@ static char *SDBBP_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    g_autofree char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     return img_format("SDBBP %s", code);
 }
@@ -13207,8 +13216,8 @@ static char *SDC1_GP_(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SDC1 %s, %s($%d)", ft, u, 28);
 }
@@ -13230,9 +13239,9 @@ static char *SDC1_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SDC1 %s, %s(%s)", ft, s, rs);
 }
@@ -13254,9 +13263,9 @@ static char *SDC1_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SDC1 %s, %s(%s)", ft, u, rs);
 }
@@ -13278,9 +13287,9 @@ static char *SDC1X(uint64 instruction, img_address m_pc)
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
@@ -13302,9 +13311,9 @@ static char *SDC1XS(uint64 instruction, img_address m_pc)
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
@@ -13326,9 +13335,9 @@ static char *SDC2(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    g_autofree char *cs = CPR(copy(cs_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    g_autofree char *cs = CPR(copy_ui(cs_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SDC2 %s, %s(%s)", cs, s, rs);
 }
@@ -13351,10 +13360,11 @@ static char *SDM(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
+        count3_value));
 
     return img_format("SDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -13375,7 +13385,7 @@ static char *SDPC_48_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("SDPC %s, %s", rt, s);
@@ -13398,9 +13408,9 @@ static char *SDXS(uint64 instruction, img_address m_pc)
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
@@ -13422,9 +13432,9 @@ static char *SDX(uint64 instruction, img_address m_pc)
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
@@ -13445,8 +13455,8 @@ static char *SEB(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SEB %s, %s", rt, rs);
 }
@@ -13467,8 +13477,8 @@ static char *SEH(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SEH %s, %s", rt, rs);
 }
@@ -13490,9 +13500,9 @@ static char *SEL_D(uint64 instruction, img_address m_pc)
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
@@ -13514,9 +13524,9 @@ static char *SEL_S(uint64 instruction, img_address m_pc)
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
@@ -13538,9 +13548,9 @@ static char *SELEQZ_D(uint64 instruction, img_address m_pc)
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
@@ -13562,9 +13572,9 @@ static char *SELEQZ_S(uint64 instruction, img_address m_pc)
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
@@ -13586,9 +13596,9 @@ static char *SELNEZ_D(uint64 instruction, img_address m_pc)
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
@@ -13610,9 +13620,9 @@ static char *SELNEZ_S(uint64 instruction, img_address m_pc)
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
@@ -13634,9 +13644,9 @@ static char *SEQI(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SEQI %s, %s, %s", rt, rs, u);
 }
@@ -13659,7 +13669,7 @@ static char *SH_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_2_1__s1(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SH %s, %s(%s)", rtz3, u, rs3);
@@ -13681,8 +13691,8 @@ static char *SH_GP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SH %s, %s($%d)", rt, u, 28);
 }
@@ -13704,9 +13714,9 @@ static char *SH_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SH %s, %s(%s)", rt, s, rs);
 }
@@ -13728,9 +13738,9 @@ static char *SH_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SH %s, %s(%s)", rt, u, rs);
 }
@@ -13752,9 +13762,9 @@ static char *SHE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SHE %s, %s(%s)", rt, s, rs);
 }
@@ -13775,8 +13785,8 @@ static char *SHILO(uint64 instruction, img_address m_pc)
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
-    const char *ac = AC(copy(ac_value));
+    g_autofree char *shift = IMMEDIATE_I(copy_i(shift_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     return img_format("SHILO %s, %s", ac, shift);
 }
@@ -13797,8 +13807,8 @@ static char *SHILOV(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *ac = AC(copy_ui(ac_value));
 
     return img_format("SHILOV %s, %s", ac, rs);
 }
@@ -13820,9 +13830,9 @@ static char *SHLL_PH(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
 }
@@ -13844,9 +13854,9 @@ static char *SHLL_QB(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
 }
@@ -13869,9 +13879,9 @@ static char *SHLL_S_PH(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
 }
@@ -13893,9 +13903,9 @@ static char *SHLL_S_W(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
 }
@@ -13918,9 +13928,9 @@ static char *SHLLV_PH(uint64 instruction, img_address m_pc)
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
@@ -13942,9 +13952,9 @@ static char *SHLLV_QB(uint64 instruction, img_address m_pc)
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
@@ -13967,9 +13977,9 @@ static char *SHLLV_S_PH(uint64 instruction, img_address m_pc)
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
@@ -13991,9 +14001,9 @@ static char *SHLLV_S_W(uint64 instruction, img_address m_pc)
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
@@ -14015,9 +14025,9 @@ static char *SHRA_PH(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14039,9 +14049,9 @@ static char *SHRA_QB(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14063,9 +14073,9 @@ static char *SHRA_R_PH(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14087,9 +14097,9 @@ static char *SHRA_R_QB(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14111,9 +14121,9 @@ static char *SHRA_R_W(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
 }
@@ -14135,9 +14145,9 @@ static char *SHRAV_PH(uint64 instruction, img_address m_pc)
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
@@ -14159,9 +14169,9 @@ static char *SHRAV_QB(uint64 instruction, img_address m_pc)
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
@@ -14183,9 +14193,9 @@ static char *SHRAV_R_PH(uint64 instruction, img_address m_pc)
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
@@ -14207,9 +14217,9 @@ static char *SHRAV_R_QB(uint64 instruction, img_address m_pc)
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
@@ -14231,9 +14241,9 @@ static char *SHRAV_R_W(uint64 instruction, img_address m_pc)
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
@@ -14255,9 +14265,9 @@ static char *SHRL_PH(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14279,9 +14289,9 @@ static char *SHRL_QB(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *sa = IMMEDIATE_UI(copy_ui(sa_value));
 
     return img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14304,9 +14314,9 @@ static char *SHRLV_PH(uint64 instruction, img_address m_pc)
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
@@ -14328,9 +14338,9 @@ static char *SHRLV_QB(uint64 instruction, img_address m_pc)
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
@@ -14352,9 +14362,9 @@ static char *SHX(uint64 instruction, img_address m_pc)
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
@@ -14376,9 +14386,9 @@ static char *SHXS(uint64 instruction, img_address m_pc)
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
@@ -14398,7 +14408,7 @@ static char *SIGRIE(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    g_autofree char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     return img_format("SIGRIE %s", code);
 }
@@ -14422,7 +14432,8 @@ static char *SLL_16_(uint64 instruction, img_address m_pc)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    g_autofree char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    g_autofree char *shift3 = IMMEDIATE_UI(encode_shift3_from_shift(
+        shift3_value));
 
     return img_format("SLL %s, %s, %s", rt3, rs3, shift3);
 }
@@ -14444,9 +14455,9 @@ static char *SLL_32_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("SLL %s, %s, %s", rt, rs, shift);
 }
@@ -14468,9 +14479,9 @@ static char *SLLV(uint64 instruction, img_address m_pc)
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
@@ -14492,9 +14503,9 @@ static char *SLT(uint64 instruction, img_address m_pc)
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
@@ -14516,9 +14527,9 @@ static char *SLTI(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SLTI %s, %s, %s", rt, rs, u);
 }
@@ -14540,9 +14551,9 @@ static char *SLTIU(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SLTIU %s, %s, %s", rt, rs, u);
 }
@@ -14564,9 +14575,9 @@ static char *SLTU(uint64 instruction, img_address m_pc)
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
@@ -14588,9 +14599,9 @@ static char *SOV(uint64 instruction, img_address m_pc)
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
@@ -14610,7 +14621,7 @@ static char *SPECIAL2(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    g_autofree char *op = IMMEDIATE(copy(op_value));
+    g_autofree char *op = IMMEDIATE_UI(copy_ui(op_value));
 
     return img_format("SPECIAL2 %s", op);
 }
@@ -14631,8 +14642,8 @@ static char *SQRT_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("SQRT.D %s, %s", ft, fs);
 }
@@ -14653,8 +14664,8 @@ static char *SQRT_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("SQRT.S %s, %s", ft, fs);
 }
@@ -14676,9 +14687,9 @@ static char *SRA(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("SRA %s, %s, %s", rt, rs, shift);
 }
@@ -14700,9 +14711,9 @@ static char *SRAV(uint64 instruction, img_address m_pc)
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
@@ -14726,7 +14737,8 @@ static char *SRL_16_(uint64 instruction, img_address m_pc)
 
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    g_autofree char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    g_autofree char *shift3 = IMMEDIATE_UI(encode_shift3_from_shift(
+        shift3_value));
 
     return img_format("SRL %s, %s, %s", rt3, rs3, shift3);
 }
@@ -14748,9 +14760,9 @@ static char *SRL_32_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *shift = IMMEDIATE_UI(copy_ui(shift_value));
 
     return img_format("SRL %s, %s, %s", rt, rs, shift);
 }
@@ -14772,9 +14784,9 @@ static char *SRLV(uint64 instruction, img_address m_pc)
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
@@ -14796,9 +14808,9 @@ static char *SUB(uint64 instruction, img_address m_pc)
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
@@ -14820,9 +14832,9 @@ static char *SUB_D(uint64 instruction, img_address m_pc)
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
@@ -14844,9 +14856,9 @@ static char *SUB_S(uint64 instruction, img_address m_pc)
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
@@ -14868,9 +14880,9 @@ static char *SUBQ_PH(uint64 instruction, img_address m_pc)
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
@@ -14893,9 +14905,9 @@ static char *SUBQ_S_PH(uint64 instruction, img_address m_pc)
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
@@ -14918,9 +14930,9 @@ static char *SUBQ_S_W(uint64 instruction, img_address m_pc)
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
@@ -14943,9 +14955,9 @@ static char *SUBQH_PH(uint64 instruction, img_address m_pc)
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
@@ -14968,9 +14980,9 @@ static char *SUBQH_R_PH(uint64 instruction, img_address m_pc)
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
@@ -14993,9 +15005,9 @@ static char *SUBQH_R_W(uint64 instruction, img_address m_pc)
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
@@ -15018,9 +15030,9 @@ static char *SUBQH_W(uint64 instruction, img_address m_pc)
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
@@ -15066,9 +15078,9 @@ static char *SUBU_32_(uint64 instruction, img_address m_pc)
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
@@ -15090,9 +15102,9 @@ static char *SUBU_PH(uint64 instruction, img_address m_pc)
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
@@ -15114,9 +15126,9 @@ static char *SUBU_QB(uint64 instruction, img_address m_pc)
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
@@ -15139,9 +15151,9 @@ static char *SUBU_S_PH(uint64 instruction, img_address m_pc)
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
@@ -15164,9 +15176,9 @@ static char *SUBU_S_QB(uint64 instruction, img_address m_pc)
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
@@ -15189,9 +15201,9 @@ static char *SUBUH_QB(uint64 instruction, img_address m_pc)
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
@@ -15214,9 +15226,9 @@ static char *SUBUH_R_QB(uint64 instruction, img_address m_pc)
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
@@ -15239,7 +15251,7 @@ static char *SW_16_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SW %s, %s(%s)", rtz3, u, rs3);
@@ -15263,7 +15275,7 @@ static char *SW_4X4_(uint64 instruction, img_address m_pc)
     uint64 u_value = extract_u_3_8__s2(instruction);
 
     const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
     const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     return img_format("SW %s, %s(%s)", rtz4, u, rs4);
@@ -15286,7 +15298,7 @@ static char *SW_GP16_(uint64 instruction, img_address m_pc)
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
 
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SW %s, %s($%d)", rtz3, u, 28);
 }
@@ -15307,8 +15319,8 @@ static char *SW_GP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SW %s, %s($%d)", rt, u, 28);
 }
@@ -15330,9 +15342,9 @@ static char *SW_S9_(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SW %s, %s(%s)", rt, s, rs);
 }
@@ -15353,8 +15365,8 @@ static char *SW_SP_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SW %s, %s($%d)", rt, u, 29);
 }
@@ -15376,9 +15388,9 @@ static char *SW_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SW %s, %s(%s)", rt, u, rs);
 }
@@ -15399,8 +15411,8 @@ static char *SWC1_GP_(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("SWC1 %s, %s($%d)", ft, u, 28);
 }
@@ -15422,9 +15434,9 @@ static char *SWC1_S9_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SWC1 %s, %s(%s)", ft, s, rs);
 }
@@ -15446,9 +15458,9 @@ static char *SWC1_U12_(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SWC1 %s, %s(%s)", ft, u, rs);
 }
@@ -15470,9 +15482,9 @@ static char *SWC1X(uint64 instruction, img_address m_pc)
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
@@ -15494,9 +15506,9 @@ static char *SWC1XS(uint64 instruction, img_address m_pc)
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
@@ -15518,9 +15530,9 @@ static char *SWC2(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    g_autofree char *cs = CPR(copy(cs_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    g_autofree char *cs = CPR(copy_ui(cs_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SWC2 %s, %s(%s)", cs, s, rs);
 }
@@ -15542,9 +15554,9 @@ static char *SWE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SWE %s, %s(%s)", rt, s, rs);
 }
@@ -15567,10 +15579,11 @@ static char *SWM(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
+        count3_value));
 
     return img_format("SWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -15591,7 +15604,7 @@ static char *SWPC_48_(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy_ui(rt_value));
     g_autofree char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("SWPC %s, %s", rt, s);
@@ -15614,9 +15627,9 @@ static char *SWX(uint64 instruction, img_address m_pc)
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
@@ -15638,9 +15651,9 @@ static char *SWXS(uint64 instruction, img_address m_pc)
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
@@ -15660,7 +15673,7 @@ static char *SYNC(uint64 instruction, img_address m_pc)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
-    g_autofree char *stype = IMMEDIATE(copy(stype_value));
+    g_autofree char *stype = IMMEDIATE_UI(copy_ui(stype_value));
 
     return img_format("SYNC %s", stype);
 }
@@ -15681,8 +15694,8 @@ static char *SYNCI(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SYNCI %s(%s)", s, rs);
 }
@@ -15703,8 +15716,8 @@ static char *SYNCIE(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("SYNCIE %s(%s)", s, rs);
 }
@@ -15724,7 +15737,7 @@ static char *SYSCALL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    g_autofree char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     return img_format("SYSCALL %s", code);
 }
@@ -15742,7 +15755,7 @@ static char *SYSCALL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    g_autofree char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     return img_format("SYSCALL %s", code);
 }
@@ -15763,8 +15776,8 @@ static char *TEQ(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("TEQ %s, %s", rs, rt);
 }
@@ -16001,8 +16014,8 @@ static char *TNE(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rs = GPR(copy(rs_value));
-    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
 
     return img_format("TNE %s, %s", rs, rt);
 }
@@ -16023,8 +16036,8 @@ static char *TRUNC_L_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("TRUNC.L.D %s, %s", ft, fs);
 }
@@ -16045,8 +16058,8 @@ static char *TRUNC_L_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("TRUNC.L.S %s, %s", ft, fs);
 }
@@ -16067,8 +16080,8 @@ static char *TRUNC_W_D(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("TRUNC.W.D %s, %s", ft, fs);
 }
@@ -16089,8 +16102,8 @@ static char *TRUNC_W_S(uint64 instruction, img_address m_pc)
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    const char *ft = FPR(copy(ft_value));
-    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy_ui(ft_value));
+    const char *fs = FPR(copy_ui(fs_value));
 
     return img_format("TRUNC.W.S %s, %s", ft, fs);
 }
@@ -16113,10 +16126,11 @@ static char *UALDM(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
+        count3_value));
 
     return img_format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16138,9 +16152,9 @@ static char *UALH(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("UALH %s, %s(%s)", rt, s, rs);
 }
@@ -16163,10 +16177,11 @@ static char *UALWM(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
+        count3_value));
 
     return img_format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16189,10 +16204,11 @@ static char *UASDM(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
+        count3_value));
 
     return img_format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16214,9 +16230,9 @@ static char *UASH(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("UASH %s, %s(%s)", rt, s, rs);
 }
@@ -16239,10 +16255,11 @@ static char *UASWM(uint64 instruction, img_address m_pc)
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *s = IMMEDIATE(copy(s_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *s = IMMEDIATE_I(copy_i(s_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *count3 = IMMEDIATE_UI(encode_count3_from_count(
+        count3_value));
 
     return img_format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16262,7 +16279,7 @@ static char *UDI(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    g_autofree char *op = IMMEDIATE(copy(op_value));
+    g_autofree char *op = IMMEDIATE_UI(copy_ui(op_value));
 
     return img_format("UDI %s", op);
 }
@@ -16280,7 +16297,7 @@ static char *WAIT(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
-    g_autofree char *code = IMMEDIATE(copy(code_value));
+    g_autofree char *code = IMMEDIATE_UI(copy_ui(code_value));
 
     return img_format("WAIT %s", code);
 }
@@ -16301,8 +16318,8 @@ static char *WRDSP(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    g_autofree char *mask = IMMEDIATE(copy(mask_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    g_autofree char *mask = IMMEDIATE_UI(copy_ui(mask_value));
 
     return img_format("WRDSP %s, %s", rt, mask);
 }
@@ -16323,8 +16340,8 @@ static char *WRPGPR(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("WRPGPR %s, %s", rt, rs);
 }
@@ -16368,9 +16385,9 @@ static char *XOR_32_(uint64 instruction, img_address m_pc)
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
@@ -16392,9 +16409,9 @@ static char *XORI(uint64 instruction, img_address m_pc)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
-    g_autofree char *u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
+    g_autofree char *u = IMMEDIATE_UI(copy_ui(u_value));
 
     return img_format("XORI %s, %s, %s", rt, rs, u);
 }
@@ -16414,8 +16431,8 @@ static char *YIELD(uint64 instruction, img_address m_pc)
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    const char *rt = GPR(copy(rt_value));
-    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy_ui(rt_value));
+    const char *rs = GPR(copy_ui(rs_value));
 
     return img_format("YIELD %s, %s", rt, rs);
 }
@@ -22218,11 +22235,6 @@ static struct Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-static int Disassemble(const uint16 *data, char *dis,
-                       TABLE_ENTRY_TYPE & type, img_address m_pc)
-{
-    return Disassemble(data, dis, type, MAJOR, 2, m_pc);
-}
 
 static int nanomips_dis(char *buf,
                  unsigned address,
@@ -22234,7 +22246,7 @@ static int nanomips_dis(char *buf,
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
-    int size = Disassemble(bits, disasm, type, address);
+    int size = Disassemble(bits, disasm, type, MAJOR, 2, address);
 
     strcpy(buf, disasm);
     return size;
-- 
2.25.1


