Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28403B4ACB
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 01:04:08 +0200 (CEST)
Received: from localhost ([::1]:52340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwurn-0000zW-NO
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 19:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1lwuqk-00085G-SV; Fri, 25 Jun 2021 19:03:02 -0400
Received: from mail-bn8nam12on2067.outbound.protection.outlook.com
 ([40.107.237.67]:64704 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1lwuqh-0001BR-FV; Fri, 25 Jun 2021 19:03:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNzVFdGIVh1TMIgygOhj4w9qO5pRfYiBcCRNoDK9/RberbrMaiEYCcNZ0I5q8/PlKPDdEoGwEGRzOn7OXBVBmUGOcs9Y39bzgWOJf/j2lcEcIECdsjFUe13bxHT2m9K9A+NWkQFwHDBfgMd2b+or0U8HkIgdz93QQ7/irPBA2moj4dUpLBzSxp7H2AwOBfx/FEQNYdxPCR9a3djcIcZc36qTwvNmM9bZj5urZ+l0g5JuEZohr7RjzddO9OhKGAuX12KiOPH/GWDCA3aSnQDtdT2KgGqvjqN48CgKwNSpfZrbmy6k9/Ema6skt2F9JPtibuWd//QAyL2mdB4prYQajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn/8Izsc15Bp2MGTWyDZMXyNYEWGNbw2NY7Qan/L6Dg=;
 b=bPpBIBaUjsfkMDtM3KeuELMuNeWKfWFh7061p/8e/cDQzFkTrOOBYgYHoYmADK8X0DpG20WLx//JAcuQ1I5uk9gMe5EPmyb/Ymw7pPero3lKOr8Xo07sn8WK+9iTvivYlnFE0B7ZYayIQkYvpAG8RF3HbLXMoXkTCU7bwqjG9VG6tkVLAOHxKU+dDuHQ/1HsNoX57q1s/prXldewKyuJkH498fsE3sZ2BEjPWCPXqze5QL5caS7CiguYt6bsdjPpisBz544EnRefXsz19zh9G5nc4Nzi5o4afbT87kg7HLZi9rBBg6IUvOMbm4eGD3k+SXnotzgaOmrKSanj9GZcKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn/8Izsc15Bp2MGTWyDZMXyNYEWGNbw2NY7Qan/L6Dg=;
 b=DrppKmwMwMB1NwcqLpk8ufku9Ytxm9PKXSEHaKpJvLNyzB/9WPuUrhFb05NMuYFQ/5tAvXCmAv8DcVziZp+wU8orh2FFNrr9wGN4iWaPtTvFpCj79oVc/Ya34JGfUXZeRXmZg9DcTJ0Qg1g1cZwoTw7rGK3k00m5PZsBP3kUD7A=
Received: from BN6PR13CA0006.namprd13.prod.outlook.com (2603:10b6:404:10a::16)
 by DM5PR02MB3655.namprd02.prod.outlook.com (2603:10b6:4:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 23:02:56 +0000
Received: from BN1NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::2c) by BN6PR13CA0006.outlook.office365.com
 (2603:10b6:404:10a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.8 via Frontend
 Transport; Fri, 25 Jun 2021 23:02:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT010.mail.protection.outlook.com (10.13.2.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 23:02:55 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 25 Jun 2021 16:02:54 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 25 Jun 2021 16:02:54 -0700
Received: from [172.19.2.32] (port=34046 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1lwuqc-0007uv-TL; Fri, 25 Jun 2021 16:02:54 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 1/1] target/arm: Check NaN mode before silencing NaN
Date: Fri, 25 Jun 2021 16:02:54 -0700
Message-ID: <1624662174-175828-2-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
References: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c3d3f03-5896-4ef0-d8e3-08d9382d5e7c
X-MS-TrafficTypeDiagnostic: DM5PR02MB3655:
X-Microsoft-Antispam-PRVS: <DM5PR02MB365517A46918A0383ACF1AA5D0069@DM5PR02MB3655.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:105;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EI2MVrwQSrnD9DyRhLPQ4RMuiXms/WqK2rPDMVL1GgZ9NSaDJsf/hA26GH/ID5Bj7sRKPZjERSH8cFSreFCItf1GFbC4AN1pgdVrQABcfkkhefVjlb3/gnpzZy7pMSbyoSpdOxyy8+f8o12r4GjQW0j85QzCe9qnXp/ZI1fRvIOpv4/yqaabkIBuj8toTc+IDu72yzB3SkgWgsvKu2vi9migGkJcSAjrXzQKKccIP7VFSQrB4noWYAAaRfaZ/sMuoqcyYc5QIJrAjPP4qohQ8CJmS0o6+Z/Vfu8iDbMCMhyxqeXHas91Hn3AQUdX2DV9bQRimef3Sro1tLCuaY8VoiSTI+bcl6KKxsvFwD6sQSeN+ctH61yjSQhT2L1iSbWt/NKrzUK+CA6wI/shuz8qJ8cX/zyYrqWa1tUuGjTRcxsG0ZeICE1KLvo3VFQedoTRmiy81f2jAjQ+VL3+WQ43twGoJ2X7/xVnOrYL1z7Yhhy+/oKMwxo3coYDwzgWxWrLLG1b6WPwX3fN43nr8Kro5ejd5G7OWgn7EbRMardvdmjSnWfwWkSN6lCmPsHGK8Xg75TY9/Tii6GFJGOCUCOR9RHdUVeRoL/s3izp8bPS2Bcu/PMMEzkgDl/8H+6VWDwTt6dusbTGx35v/cPGl78VmAZGW027HdF7U3YQyzpXv9NFtZljJ28IMslAkgchqlyx
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966006)(36840700001)(4326008)(36906005)(450100002)(44832011)(336012)(316002)(83380400001)(82310400003)(47076005)(2616005)(8676002)(2906002)(426003)(82740400003)(86362001)(70586007)(7696005)(478600001)(36756003)(6916009)(5660300002)(7636003)(9786002)(36860700001)(26005)(70206006)(8936002)(356005)(186003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 23:02:55.8020 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3d3f03-5896-4ef0-d8e3-08d9382d5e7c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3655
Received-SPF: pass client-ip=40.107.237.67; envelope-from=komlodi@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the CPU is running in default NaN mode (FPCR.DN == 1) and we execute
FRSQRTE, FRECPE, or FRECPX with a signaling NaN, parts_silence_nan_frac() will
assert due to fpst->default_nan_mode being set.

To avoid this, we check to see what NaN mode we're running in before we call
floatxx_silence_nan().

Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
---
 target/arm/helper-a64.c | 12 +++++++++---
 target/arm/vfp_helper.c | 24 ++++++++++++++++++------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 9cc3b06..ac5c445 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -365,7 +365,9 @@ uint32_t HELPER(frecpx_f16)(uint32_t a, void *fpstp)
         float16 nan = a;
         if (float16_is_signaling_nan(a, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float16_silence_nan(a, fpst);
+            if (!fpst->default_nan_mode) {
+                nan = float16_silence_nan(a, fpst);
+            }
         }
         if (fpst->default_nan_mode) {
             nan = float16_default_nan(fpst);
@@ -396,7 +398,9 @@ float32 HELPER(frecpx_f32)(float32 a, void *fpstp)
         float32 nan = a;
         if (float32_is_signaling_nan(a, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float32_silence_nan(a, fpst);
+            if (!fpst->default_nan_mode) {
+                nan = float32_silence_nan(a, fpst);
+            }
         }
         if (fpst->default_nan_mode) {
             nan = float32_default_nan(fpst);
@@ -427,7 +431,9 @@ float64 HELPER(frecpx_f64)(float64 a, void *fpstp)
         float64 nan = a;
         if (float64_is_signaling_nan(a, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float64_silence_nan(a, fpst);
+            if (!fpst->default_nan_mode) {
+                nan = float64_silence_nan(a, fpst);
+            }
         }
         if (fpst->default_nan_mode) {
             nan = float64_default_nan(fpst);
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 8a71660..24e3d82 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -671,7 +671,9 @@ uint32_t HELPER(recpe_f16)(uint32_t input, void *fpstp)
         float16 nan = f16;
         if (float16_is_signaling_nan(f16, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float16_silence_nan(f16, fpst);
+            if (!fpst->default_nan_mode) {
+                nan = float16_silence_nan(f16, fpst);
+            }
         }
         if (fpst->default_nan_mode) {
             nan =  float16_default_nan(fpst);
@@ -719,7 +721,9 @@ float32 HELPER(recpe_f32)(float32 input, void *fpstp)
         float32 nan = f32;
         if (float32_is_signaling_nan(f32, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float32_silence_nan(f32, fpst);
+            if (!fpst->default_nan_mode) {
+                nan = float32_silence_nan(f32, fpst);
+            }
         }
         if (fpst->default_nan_mode) {
             nan =  float32_default_nan(fpst);
@@ -767,7 +771,9 @@ float64 HELPER(recpe_f64)(float64 input, void *fpstp)
         float64 nan = f64;
         if (float64_is_signaling_nan(f64, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float64_silence_nan(f64, fpst);
+            if (!fpst->default_nan_mode) {
+                nan = float64_silence_nan(f64, fpst);
+            }
         }
         if (fpst->default_nan_mode) {
             nan =  float64_default_nan(fpst);
@@ -866,7 +872,9 @@ uint32_t HELPER(rsqrte_f16)(uint32_t input, void *fpstp)
         float16 nan = f16;
         if (float16_is_signaling_nan(f16, s)) {
             float_raise(float_flag_invalid, s);
-            nan = float16_silence_nan(f16, s);
+            if (!s->default_nan_mode) {
+                nan = float16_silence_nan(f16, fpstp);
+            }
         }
         if (s->default_nan_mode) {
             nan =  float16_default_nan(s);
@@ -910,7 +918,9 @@ float32 HELPER(rsqrte_f32)(float32 input, void *fpstp)
         float32 nan = f32;
         if (float32_is_signaling_nan(f32, s)) {
             float_raise(float_flag_invalid, s);
-            nan = float32_silence_nan(f32, s);
+            if (!s->default_nan_mode) {
+                nan = float32_silence_nan(f32, fpstp);
+            }
         }
         if (s->default_nan_mode) {
             nan =  float32_default_nan(s);
@@ -953,7 +963,9 @@ float64 HELPER(rsqrte_f64)(float64 input, void *fpstp)
         float64 nan = f64;
         if (float64_is_signaling_nan(f64, s)) {
             float_raise(float_flag_invalid, s);
-            nan = float64_silence_nan(f64, s);
+            if (!s->default_nan_mode) {
+                nan = float64_silence_nan(f64, fpstp);
+            }
         }
         if (s->default_nan_mode) {
             nan =  float64_default_nan(s);
-- 
2.7.4


