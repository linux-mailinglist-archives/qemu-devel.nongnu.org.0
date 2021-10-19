Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58384339B3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:07:12 +0200 (CEST)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqhr-0003pB-SL
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpyw-00007C-Rx; Tue, 19 Oct 2021 10:20:46 -0400
Received: from mail-bn8nam12on2061.outbound.protection.outlook.com
 ([40.107.237.61]:29519 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpyu-0008Le-QH; Tue, 19 Oct 2021 10:20:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJIuSrjm/hPOzEWs71XGktwCBQ3J1DMtZcnkj/ENUDx43gTX62dp7Bz0PKn0IJDEjsmgyJVvRiAIGm7yw1sWJIl5ayfxV67zohdVI/XSw1o4vicrlCkkFGx/6/g6BWdn4L3yvRUDebu1Sz2f4FgEsxFghmpGiY5DqrmPUiUhieCATV+jT3+/doBTM7o/Unuqx4Wr/yWdo00r/Xht6N1qOefuTjzHjmcW/a1gMtoZNWx+nbq+l6x2+ACY85Kh2e+TbAkP0tzBOoE5m9GBV6GrgIe8WYhhPZBkDUvK/zUpTtMxEU30Qnx8C6moxkD0alNG83BHZtEnO55CDnxJaRmvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04Eb/0pxQsQAj0lMej8dK82MEmvta54bVAU9g7aKanw=;
 b=iJh0aCqKkaw7pIgjAHCPeEEEY8ppEeLf8IxKWZgQBBPwF4FQHVtVZk43SqCBWJfCKp21MvMM95DrS4QdTIASLAPdDDocf3MwHoEbBJ0VBeiMImEvr30MEDQZbVmAoZIQcnk3fNAUQjY6FE3aPVBtY8AivahaNO+lE9mhhf0qcZpaiT55vVtbyKasjm8frVnc0ZC/2n7+yqwuqf613pvzA29DDcBESqBpSLTftqzIko3O7lSAm14K5q7i9gjbXg+zhyg4Z4mXrq30K0/bHoRJS7EBb3Gd90kpRlzL+7Md34DohRmprFLFmNVPsVFk5+91pRWLg60RI/2Mb/E2BrpvGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04Eb/0pxQsQAj0lMej8dK82MEmvta54bVAU9g7aKanw=;
 b=zamlsLOE8hjgviPUg/FPCBUkk3jGGMb55ULF8sU/mJwZU3ZabI/d7dp0YI/JW0l7UqTBIfTMw2zVl6lRukMvzBXwWExzJv5eBrvsOoNIcQYd8o3B3P/XF8qlHjDcsNL9QVaq1vPFVPsldddjtDBB6ghWuEpZNHBKMhaYRDvIXMk=
Received: from BN0PR04CA0085.namprd04.prod.outlook.com (2603:10b6:408:ea::30)
 by DM6PR12MB4926.namprd12.prod.outlook.com (2603:10b6:5:1bb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 14:20:41 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::c6) by BN0PR04CA0085.outlook.office365.com
 (2603:10b6:408:ea::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:20:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:20:41 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:20:41 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 25/64] tcg: Allocate sufficient storage in temp_allocate_frame
Date: Tue, 19 Oct 2021 09:09:05 -0500
Message-ID: <20211019140944.152419-26-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 869de57a-4a65-4bcd-28d8-08d9930ba1aa
X-MS-TrafficTypeDiagnostic: DM6PR12MB4926:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4926D59506D1FA75A6E5E92495BD9@DM6PR12MB4926.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:46;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ElWBNNGRkKF6JHGT3TKqe1VgMdz3ABWF45S6PEL9c+cJvNSxAQRoBDZxg1/UHuZpA91wn13xiJta+Flxo11moJaLJvhUWuSTH85iMlIYa+v/YYgI3m256daP2lrGNQVuK+xuoyTIG8B0J0zFrMaB8TQH6vZT8NjgOjFkstovkGMNk91dTLikhK+Ykmu0wLA4bKxorZYb+FpPPsAoK6hBivTw7EN7u11Da1AElg+q0NOomov8lVZWfsL5S6dzmh2mFpOY/nO2hLA041/PiQ33u/emX6XtedhzWf5rMHxZk/IhfZ39ZmTj9aWFxERfjDWd/7JOp28uQIz0GaMIQcd20kQFZ7Ce1vx4Ppl0YPannijtaSCIKB5AFMGK/6yfLJpAuTkYTYHTNdJ9XktcaexdIT2vSlvhp6Q/fyYzj6B81XfzdBwR5RUD+T5LxSF9k95TWcbiHIre9Rr1SQNOXKuYcYbB7PvwMEWQH23C8Oqx/w5/M4TtQ7i9czjeIMghvDbbJXCCd5rVBZKjtvHM4aFIaA3f/vG99f5NrpaD8ylorQXpDgUxvb2qGHu8bP0olfMZbKKPhg+jFYrQcAagM+O8aWNNFfKbNYuyGRcrNcJOOTsEcybhQSK4E9Az9HrY2fxjXyV6bhnqCRTv8znvHxCgOFm5KnXB7bKpRGdGaSiBvUzWePI8sCuHGhmERxNVPOzI3Wn2wvLQFPuspNBoexr/WIcYAS+HANow9mpHlTJffPlnSE/9hoUVKn8in16hzRBdRvZX/RfL943Rh2m3Qtm1pSMbIhAOWIYmji7aaALITVq65M1Wb0VGm/9GFO/HrtB
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(16526019)(186003)(6666004)(2616005)(1076003)(8676002)(426003)(316002)(4326008)(47076005)(82310400003)(36756003)(83380400001)(8936002)(70206006)(44832011)(86362001)(6916009)(356005)(36860700001)(2906002)(70586007)(54906003)(26005)(5660300002)(508600001)(336012)(966005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:20:41.5412 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 869de57a-4a65-4bcd-28d8-08d9930ba1aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4926
Received-SPF: softfail client-ip=40.107.237.61;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

This function should have been updated for vector types
when they were introduced.

Fixes: d2fd745fe8b
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/367
Cc: qemu-stable@nongnu.org
Tested-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
(cherry picked from commit c1c091948ae4a73c1a80b5005f6204d0e665ce52)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 tcg/tcg.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a9cf55531e..21d65969be 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3489,17 +3489,38 @@ static void check_regs(TCGContext *s)
 
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
-    if (s->current_frame_offset + (tcg_target_long)sizeof(tcg_target_long) >
-        s->frame_end) {
-        tcg_abort();
+    intptr_t off, size, align;
+
+    switch (ts->type) {
+    case TCG_TYPE_I32:
+        size = align = 4;
+        break;
+    case TCG_TYPE_I64:
+    case TCG_TYPE_V64:
+        size = align = 8;
+        break;
+    case TCG_TYPE_V128:
+        size = align = 16;
+        break;
+    case TCG_TYPE_V256:
+        /* Note that we do not require aligned storage for V256. */
+        size = 32, align = 16;
+        break;
+    default:
+        g_assert_not_reached();
     }
-    ts->mem_offset = s->current_frame_offset;
+
+    assert(align <= TCG_TARGET_STACK_ALIGN);
+    off = ROUND_UP(s->current_frame_offset, align);
+    assert(off + size <= s->frame_end);
+    s->current_frame_offset = off + size;
+
+    ts->mem_offset = off;
 #if defined(__sparc__)
     ts->mem_offset += TCG_TARGET_STACK_BIAS;
 #endif
     ts->mem_base = s->frame_temp;
     ts->mem_allocated = 1;
-    s->current_frame_offset += sizeof(tcg_target_long);
 }
 
 static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
-- 
2.25.1


