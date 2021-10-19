Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7036433A13
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:19:39 +0200 (CEST)
Received: from localhost ([::1]:34374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqtu-0001RA-Rx
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq59-0008Df-Jv; Tue, 19 Oct 2021 10:27:11 -0400
Received: from mail-mw2nam10on2074.outbound.protection.outlook.com
 ([40.107.94.74]:65476 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq57-00043M-HW; Tue, 19 Oct 2021 10:27:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkB+04n0/M3SDdx+4wwNYMt7R1269dISIUzc2nPNpdv5FDAbxoKzltZSMk4vHmEgV8IyRwfkCycH33PNs6AFwGuUvZ3eLOY4vOV1fbOUtgftmNTPaMXWm1BngbRR1qZqYDCccjvzLynE5Gy5Od5lCjpdiXX/egp8+afOqNCQ+L7dKA58/Qe1dNSVfRzsu1EnahfiCveHgtpkiLsKCpQ16BDFLYE5Go1KMck1c8y6T6DzL74FK92FRYKEuIi0J5nJJe6KW4BvdlpvKBok8vpqc0Ya5Nuuin61+T4d2ZrotbtXEL/JseEV3lIEik85q+Ycw9ITHPs/vpeMaCqCXejJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eATFIXQsgp8NL06pP86pSYBkK/Gd8ko0uRj9TKjeb2g=;
 b=d/sXFZ2GjnFX4W4PzRFzSc3SC0h/ybZLmkqL4pSmbP5btxllxPYffjtDfveN0sqgMZnioxpImtKEgHj0+eiMlbG+QEmAzIVRhlNM2mDPfLDG+O3onFlOCah/iBuRUgE8OyfiACjyoWla3AteoEtLkFbkgX+TigNIs96xPk7PhD2Ysm9gSRFxUT+BjrewvYgKXMeQ8K5WEyypMlEW4ZWLf1stHst5seFyvrY5v3L+YGJXtOT9gj/gGm1uxMA0NrceYOQ77pIeGiWRfTQRd52UuUvhAKOFK/guH+oOj3JyoKc6zTUpLzkzqs15fT9242pnQDlpI0cNhaiGgETNQ3xr+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eATFIXQsgp8NL06pP86pSYBkK/Gd8ko0uRj9TKjeb2g=;
 b=leL781eGvjc6SPK3hTc6o0sl3LFIDq6HIiBVXxd5V5Vn9EIRO4zOZFpFnYCevgc398Ofnr6lmZFEjSw63gc/jLdtj5wLnojtAJ+TaFX5LOyLaZ8QYNI/mstfQNZZTRfA3JIELMTsEQA6+sM5g1bNJLcCAmIbhvdtZlTYU6ye+aQ=
Received: from DM3PR08CA0022.namprd08.prod.outlook.com (2603:10b6:0:52::32) by
 MW3PR12MB4490.namprd12.prod.outlook.com (2603:10b6:303:2f::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 14:27:05 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:52:cafe::e5) by DM3PR08CA0022.outlook.office365.com
 (2603:10b6:0:52::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:27:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:27:05 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:27:04 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Greg Kurz <groug@kaod.org>, Laurent Vivier
 <laurent@vivier.eu>
Subject: [PATCH 03/64] docs/system: Document the removal of "compat" property
 for POWER CPUs
Date: Tue, 19 Oct 2021 09:08:43 -0500
Message-ID: <20211019140944.152419-4-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 82521485-8ec3-4eff-3c99-08d9930c86b1
X-MS-TrafficTypeDiagnostic: MW3PR12MB4490:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4490CF74D18D3F6072F40A1F95BD9@MW3PR12MB4490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:556;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZYjIjOx1kae4PLkh5W0ughWUwu0sTzJNjIE3GzCJn0ljfg02N4D8UjUW33pSn4HHvacRCFOSKPL6Ow6nIyR52fZwXKOzhhOEtKGDUIouwSt83U5dv6Yk0oL/qvCXLs6R1Wj9VKI5YUIoZ/LNI5ptgwNaP4UaCjfts6pQ9seJ4G8AwpS0ZCxTCnFTLo8gGv7Y2A/OfLCUkRlbJyF2h/fyIsFsBvhnce4f0NgeIztEIt96fS72ntalRSNmP3bs6FcPILFWQBngZFlA7WK/TqiUwfnvpR5ANOrWat4uIFDye0ZqP2AXoF9IfPdNhZAKgdyYPAXlBWIoje6Z3zB6ayssanRs27IdP972+bS5vsDzPkN/L3IJiqMjO87sSTKLdFiJ/0Zma7S9GaW0Fb6SyfPxvozQadyviikSwFmrq0+YBaP3cCmbc2Fb/UdsaYN8GKWXk+0SsHutwjC1b6mSqrBiKaM5lphVCAenybo3nf2Y2BOS6t72nFNu8G4e+U0f+9elzpa2UGAL6wz0P8jvsdX75z2GlDS3sQuEyWAqmjdlo92W2Z4i2e45Cp7blaGwGuHynGQqO1yhi1Ql3dkKZ5uf+uo0+p5fpw/JFhh4fXhJmmWcPGRcqPg8+jdUVyfiLlbje+/7DO6fz6Zz4zLHVso6O2b15ziGCjl3s2K9iNDfBBPFRJFxiFYm44MYSm/BUMvmgdfjvDOqkyew5s/GOllE5j63KnvLZ8P6OP/GSfZ840E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(8936002)(82310400003)(5660300002)(6666004)(70206006)(356005)(26005)(81166007)(426003)(1076003)(186003)(6916009)(2906002)(36756003)(8676002)(36860700001)(508600001)(316002)(2616005)(47076005)(83380400001)(44832011)(16526019)(86362001)(70586007)(54906003)(4326008)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:27:05.7489 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82521485-8ec3-4eff-3c99-08d9930c86b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4490
Received-SPF: softfail client-ip=40.107.94.74;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

From: Greg Kurz <groug@kaod.org>

This is just an oversight.

Fixes: f518be3aa35b ("target/ppc: Remove "compat" property of server class POWER CPUs")
Cc: groug@kaod.org
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <161399328834.51902.14269239378658110394.stgit@bahia.lan>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
(cherry picked from commit a058b895079348d0854a027a42ce3396a4a00bb7)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 docs/system/removed-features.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 29e90601a5..c21e6fa5ee 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -285,6 +285,12 @@ The RISC-V no MMU cpus have been removed. The two CPUs: ``rv32imacu-nommu`` and
 ``rv64imacu-nommu`` can no longer be used. Instead the MMU status can be specified
 via the CPU ``mmu`` option when using the ``rv32`` or ``rv64`` CPUs.
 
+``compat`` property of server class POWER CPUs (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``max-cpu-compat`` property of the ``pseries`` machine type should be used
+instead.
+
 System emulator machines
 ------------------------
 
-- 
2.25.1


