Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2086433862
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:26:24 +0200 (CEST)
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcq4N-0005O3-Nb
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpql-0004Rc-NA; Tue, 19 Oct 2021 10:12:19 -0400
Received: from mail-co1nam11on2073.outbound.protection.outlook.com
 ([40.107.220.73]:46337 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpqj-0004F5-7B; Tue, 19 Oct 2021 10:12:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNEk3gv808+iWebQsUa8d0nOAjBoLjv7AG5WzhmkD0mSSJW3UPNUB8LSyO2C1Rp81E3CpP5foXt5gSRJhi+mJL2zEF4jTWMtmCglM7bvikLL6xSiPGwdUMgTKEEXBlvR+SpsllPIjBQpmuy7QwZdEZDOeorCNl9ON3s/kvurl7gFDN8wWXGyTDngCdiLY2xYreZDNS32MMzlxnyFYCzc3EfsGNMkBoqEK7KZmc/EZwFBKzb9yZwYp4/rCBYUs1DAWYqvGgsHzJckycpb9NOIm9GW3AgfSee4y3MyyPo0NlA5LYOCF6Mw8Ma2Lp7IVzXYhMy3J4GJ3BZiAyAVu2Umng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpHV6SblamuH9pRvxIeBV2ts8xEuCx/gKb1Pd6OPiVg=;
 b=ISVGfm2km5Ns0sGaogS4OIR9IurSGrmxisLyBjmyf7zsRJPDvWarnIS0Yj8d4cVBGbWNFihGdVSy+PrwWQ1VirPKbhpOrciKnxZoef5xN3piRPBX/ovcROh4aRyKWLhc+BvbwY3Qm3xz3HDlBlbYT9xhWGAidw3goNpPzXOU6prtHQX5rDcX582ixB/pG7Xv3V+JyPjvoZE7efZejPWkeI7TJEeLXErFKKL01BhTPDDdJP3f4jfP6pKIN6ZQSa3CCyCKwdc1lMePXreHN3/JfwekhVZU5Kk25h429Yu2ywbMgOeJ0Dv5qjy9BLNemHbyjlX6KrPFJz0Jzgco5zec/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpHV6SblamuH9pRvxIeBV2ts8xEuCx/gKb1Pd6OPiVg=;
 b=0IHDLVURU1j87uXOhG7Xm+9N6PihQQjz/FZCydjFgB/+COgAZBxZWWX3A5PJsMF3vB1iO8ro+4l21ZcMhB6Wuf2DyvEn9UWFoOR0mOT2FNgUVrETVBs9tleZlbI4r8fnBbv94suub9V6qX3IRgGylVBnJibsY0sg4ZlLBbrdvcA=
Received: from DS7PR03CA0251.namprd03.prod.outlook.com (2603:10b6:5:3b3::16)
 by BYAPR12MB4760.namprd12.prod.outlook.com (2603:10b6:a03:9c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Tue, 19 Oct
 2021 14:12:12 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::8c) by DS7PR03CA0251.outlook.office365.com
 (2603:10b6:5:3b3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:12:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:12:09 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:12:04 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 09/64] target/xtensa: fix access ring in l32ex
Date: Tue, 19 Oct 2021 09:08:49 -0500
Message-ID: <20211019140944.152419-10-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: a8d3445b-0884-4223-f2b5-08d9930a70b9
X-MS-TrafficTypeDiagnostic: BYAPR12MB4760:
X-Microsoft-Antispam-PRVS: <BYAPR12MB47600BEB6986FB506B8E074E95BD9@BYAPR12MB4760.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RZ/56qZ8C2uS2uAZA1QKcdb5p8LPuh2PcjIlnbwYs0fdXvqMVntAiBH86bO5yHcPL7SzFVTFgmKwOnJGaKlGCNkwWgoK/Aa38PAZ+eRyo2neOcebZ5KIzAQMAb54nIB2TYnhqOqicnWIPXhpyr3YpckULs+LnV+yYJPMQsBcXFcedA6aB2hSAEmHwTfsSL/WAdWK6OizznwD39qBWPymJgT0OMdsRbmVBulqH7bd4x08hsJh7fdwX0fbTiVGICt/okm0RNUIlc8Dcdp8YfAM3PrSa1/XPUZR6pD8JXJbrTrlMl/omKA+rFpyJz0CDR2bnym/k8sObelqOr6imzco1Xm/E1wNA4w4wcE9a1PWiBuGu9nUxsIyDrVjf1NGcJQ6oaIxl3THjl/53OGuQF9akg7174ozHCZQRL7wF+Y1eHP/WMdPiRMJ67icvNXN1OqSM9U+Ap3CHP0OUdMV8Uht26hdiQF3Fari/M2q5GeSytUOlSD9dOoYKzkE0YT0tjDF/snIvu7z+/QbYxfvTOeipyEMOLLZH4ng7rgUcP3W2RZQtUqA0rhRv36ofnFjGfUe0pQmD3ChYAZuNE26wIbJ3TES/QhEqa5ruMWSU6V5h1owdrA2I53acrmnMkLoYqMBITN8VNvz+4kFvJHvuJiolt6VASffNQJ5vYay7S40mgGokyEioygFPHz5RYhqY/dWCRqmoYS9b75HwJut0gupOFrpOt/AG0lGRJ5J72DpCmE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(47076005)(356005)(86362001)(81166007)(2906002)(1076003)(4326008)(26005)(36860700001)(6916009)(6666004)(508600001)(44832011)(82310400003)(83380400001)(70206006)(5660300002)(336012)(36756003)(426003)(54906003)(316002)(2616005)(8936002)(70586007)(16526019)(8676002)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:12:09.1760 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d3445b-0884-4223-f2b5-08d9930a70b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4760
Received-SPF: softfail client-ip=40.107.220.73;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

From: Max Filippov <jcmvbkbc@gmail.com>

l32ex does memory access as all regular load/store operations at CRING
level. Fix apparent pasto from l32e that caused it to use RING instead.

This is a correctness issue, not a security issue, because in the worst
case the privilege level of memory access may be lowered, resulting in
an exception when the correct implementation would've succeeded.
In no case it would allow memory access that would've raised an
exception in the correct implementation.

Cc: qemu-stable@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
(cherry picked from commit 735aa900e4bf57b777ac620bed7c88234ec4b601)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 target/xtensa/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 0ae4efc48a..1678b65607 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1817,7 +1817,7 @@ static void translate_l32ex(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_mov_i32(addr, arg[1].in);
     gen_load_store_alignment(dc, 2, addr, true);
     gen_check_exclusive(dc, addr, false);
-    tcg_gen_qemu_ld_i32(arg[0].out, addr, dc->ring, MO_TEUL);
+    tcg_gen_qemu_ld_i32(arg[0].out, addr, dc->cring, MO_TEUL);
     tcg_gen_mov_i32(cpu_exclusive_addr, addr);
     tcg_gen_mov_i32(cpu_exclusive_val, arg[0].out);
     tcg_temp_free(addr);
-- 
2.25.1


