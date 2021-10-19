Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED7C433888
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:40:00 +0200 (CEST)
Received: from localhost ([::1]:50718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqHX-0003NP-TP
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq1A-0003RN-Oz; Tue, 19 Oct 2021 10:23:05 -0400
Received: from mail-dm6nam10on2086.outbound.protection.outlook.com
 ([40.107.93.86]:41952 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq16-0001KS-IS; Tue, 19 Oct 2021 10:23:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZbhQlrGCpdD+o6eO2TugNdgEBwIUAAODUbZcvz0JRLH/WOF+3T9VxWOy/+5E/I9fuANeO8r0szu/bCd85n7GjqpQMwWB9tQ++DRToGDodMejK0376Hfh7hXyh+UcjEg+WkgHyUVO/EK7vWl+iO7nbYA8II8ylox29M4p/fD3YMjVLnsDxJ50Aqg2w0jnhy5DgLCHbzpQT++57LeBofFjsoGH3ut4XX7AIJY0rEPJ1LtDJAyzB8QhlcFryM7d+qAewVJeaB5TKcM3/s8LP3w8+hQV1RRlCvS3h9yfBi6EHsukY6wHTcZDx7EOyxLqDmuI3sE+ZJ9M+JT2aiA7QliwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvHv9eaWCE3qmCVGDTw3ai276CdKLfaO42BJE6vMc/o=;
 b=dzkKTY0QBmE6qNyMBa/6f5195eFL2kQR+wKNntjJKc9OtpAQ3UCXR2URoAN1iwgyNm5ovXseehfbKHBO1TlLKatmDd5YBszCON/N5ZQ92YVIuTAlAWA/FFOS5q+dSkp2/19xRzy04X3vjWLXOZI2YIrQWo783RJXYNLTO2s6F52lcGIeKYClwqFFduxqRPO9bw089sOY/rv709/jJ46nyOW2jHvNvrFpPxKtoMG8EpoDEcxi8Kp4mC4TPjparqJr556L8xaTLz/O4wypNpgC3I1wp1Eu9cdrLR3TfRv8VpKBC6JHnVZG7RkCOG9f4PuFl7Gh0czdHCBsmPQDua9MUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvHv9eaWCE3qmCVGDTw3ai276CdKLfaO42BJE6vMc/o=;
 b=j4SBFOSq8BnW5qv4MpRBoBL0c3t5/ZPfTen9Fyn27bISVd1zVyhREV9X4HxSVAE/67DPz0HiQFYAaVXrWxcB1lPWI15QeDP/iSN9QEcMexackzjS/ouArPwkaFTwD8d1Tczol5u2fnml6gtj8OwbyWlC9tN0Fw5/XB2rNG7atZY=
Received: from DM5PR07CA0159.namprd07.prod.outlook.com (2603:10b6:3:ee::25) by
 DM5PR12MB1738.namprd12.prod.outlook.com (2603:10b6:3:112::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 14:22:54 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::97) by DM5PR07CA0159.outlook.office365.com
 (2603:10b6:3:ee::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:22:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:22:53 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:22:52 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 02/64] linux-user/aarch64: Enable hwcap for RND, BTI, and MTE
Date: Tue, 19 Oct 2021 09:08:42 -0500
Message-ID: <20211019140944.152419-3-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 305fddac-ad4e-4e12-3844-08d9930bf077
X-MS-TrafficTypeDiagnostic: DM5PR12MB1738:
X-Microsoft-Antispam-PRVS: <DM5PR12MB173844F66A571CD39DA27C8095BD9@DM5PR12MB1738.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +9EycFDjytEukygFOSg0b2iaNPDt40UTELwxL6Kk1Q/Yib0kf9aCzm/pE74NfBDqJDi7cj4BR1QYDAfOAeRv7P9CVr22degBnsqD0pQHzjUbwwOqbaIknvwlVc37fLWANtHianUsPiNMLRh6UIIPeTmeSbBCKZUMt5gFWlTFhxKQpddFXV5zLVLPaGEOHeSFLdDq6tri6Qr7Sobivg0be0GvbOiqh/N1V8t12R7oryHmLHtdak9ry0WgdBrBwE+Pl+U90H6jv00bbM1KLvoXSGfegDxktscZ0rIbxIKaVvlIQMTM627498xn0y2sCn8O3jAid7LOV/tY+2aVLklCIayiQpG4OZ7xrJmI5jN/7u7NY75xKjYTkxP7VcwGiaxG9SE2XmtshAG1CBi2CovrQqEaBSjHIOCYhAfSWBaoa/XEdsYF8gvOXHdqi024tyaIG5mmeDcB1sZlQMmo7XVVS398unCm2LQBEdYni52VVWtP8A01CznNbmCD5tf2ehxnoCMh5vP2AFq8vPOXi0ZGznWNRhjojPkp9JD/GVrv0fJgnetRwmqYmNczS4HuTq49w/0GH77nllh2UNtUFhRp3saa/7P+uzz0l7Jf1W5VpT4uVXZD7mwAQJlzBd9B+5+9STkJR0UE+UmSVOtIFAgFm40ovL80wR35+fgJ1v3+eDGwGZtKuS7wwjGXvMRQB7IfKexnEBQ27O/1UvHDik8lzxGhIChl/Y1iyTCDd9q+AiroRNCrbuMMK7la44pZbHSlT9rQe3FQoMaPUtXgc07G0IEWWsRB8K0mVUvxfvYlNsQJyT898Oz/up8rU3v+cIzx
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(426003)(336012)(36860700001)(54906003)(2906002)(1076003)(26005)(44832011)(2616005)(36756003)(6666004)(5660300002)(16526019)(186003)(6916009)(83380400001)(4326008)(508600001)(70206006)(966005)(70586007)(47076005)(8936002)(81166007)(86362001)(356005)(8676002)(316002)(82310400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:22:53.7114 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 305fddac-ad4e-4e12-3844-08d9930bf077
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1738
Received-SPF: softfail client-ip=40.107.93.86;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These three features are already enabled by TCG, but are missing
their hwcap bits.  Update HWCAP2 from linux v5.12.

Cc: qemu-stable@nongnu.org (for 6.0.1)
Buglink: https://bugs.launchpad.net/bugs/1926044
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210427214108.88503-1-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
(cherry picked from commit 68948d18224b93361e2880e2946ab268d0c650d7)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 linux-user/elfload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c6731013fd..fc9c4f12be 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -586,6 +586,16 @@ enum {
     ARM_HWCAP2_A64_SVESM4       = 1 << 6,
     ARM_HWCAP2_A64_FLAGM2       = 1 << 7,
     ARM_HWCAP2_A64_FRINT        = 1 << 8,
+    ARM_HWCAP2_A64_SVEI8MM      = 1 << 9,
+    ARM_HWCAP2_A64_SVEF32MM     = 1 << 10,
+    ARM_HWCAP2_A64_SVEF64MM     = 1 << 11,
+    ARM_HWCAP2_A64_SVEBF16      = 1 << 12,
+    ARM_HWCAP2_A64_I8MM         = 1 << 13,
+    ARM_HWCAP2_A64_BF16         = 1 << 14,
+    ARM_HWCAP2_A64_DGH          = 1 << 15,
+    ARM_HWCAP2_A64_RNG          = 1 << 16,
+    ARM_HWCAP2_A64_BTI          = 1 << 17,
+    ARM_HWCAP2_A64_MTE          = 1 << 18,
 };
 
 #define ELF_HWCAP   get_elf_hwcap()
@@ -640,6 +650,9 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
+    GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
+    GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
+    GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
 
     return hwcaps;
 }
-- 
2.25.1


