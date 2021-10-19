Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FBD433A18
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:21:01 +0200 (CEST)
Received: from localhost ([::1]:38546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqvE-0004M5-JX
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqEx-0007OJ-6C; Tue, 19 Oct 2021 10:37:19 -0400
Received: from mail-bn8nam08on2054.outbound.protection.outlook.com
 ([40.107.100.54]:4192 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqEu-0000NN-VK; Tue, 19 Oct 2021 10:37:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeytaudWFNlBZnWUXvEYwQLXs8uqeWDcOvzHGMrmOIh+brvbaOOf7bJ6gYukM6I8mdKLJxybZkR8lV2hkSVwcYep4SoZivcYlCDADyTIyuDIcOmzB92K9kt4OSvzPhaeyHmapQoouA2vIbqyw4nSeWEy4MEDna1hyV93DcBBON2VgKfQHnF2NkzfoQQWz/JAnuwurDF7J4Tz+QGudTR/Y3xW/4NipH0GTR9T7/EykpMIkF+6PjXgq08Qd11+I3aFwmvimUbwwU5JYpUjHzknMpl9vQh7j7RmYItCtcITw51nGNfZrEr37+vatAQAs+4o7BQBZC+Aj2r5CWP4Jg7Otw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhGRItzSZTnZtRJBCly4eur/9lpsEtrNELZhzoFP+lo=;
 b=HxdhH2hKhRtBIEPGomCh7E8huh8WVtjqwGM0svl/v5RfKpGTLfeksoQ4s/rHuTqTL4ZU07nY04kl0QMlPg8zdAD31yKEI8PQScnSurMvjNiVZw+4BHcGH7GV+SE4seHhr3A/hJqYXWGlUlCwwNmsTHT1harkgHXW4mcXQPcVyTckSXYuxur00P5/aZYbmUUondGGVen5Zhkwt6xe7i65k4srgAIrAJhCkZqWr23VkxR6PduDfMxROLUJIqxzpAn+Sybl89XhugNvpyg8oSv9mY7+a7rh0MbEFXG3my3yAWnmkJUpfKG3TEaL+N5H6CxntfKSgosRwm4RITVsbcAN5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhGRItzSZTnZtRJBCly4eur/9lpsEtrNELZhzoFP+lo=;
 b=f7pyGf668u/27jw8ag9Glig4B7KGdj7nOVEApgx1i/O4wvuz2IIL3el6y0K8muBK2Mb0gbOH0AaIl8oFHIi8wYsGeTYxAWaBSqDr/vPybHQIRH3eNuy9sJm/HvzwAXWtDVFCOd6h1g3oxOF/rrr+272hGXTx4l2wHye5rR5NI2s=
Received: from DM5PR06CA0031.namprd06.prod.outlook.com (2603:10b6:3:5d::17) by
 BY5PR12MB4936.namprd12.prod.outlook.com (2603:10b6:a03:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:37:13 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:5d:cafe::2a) by DM5PR06CA0031.outlook.office365.com
 (2603:10b6:3:5d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:37:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:37:13 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:37:12 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Giuseppe Musacchio <thatlemon@gmail.com>, "Paul
 A . Clarke" <pc@us.ibm.com>, David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 07/64] target/ppc: Fix load endianness for lxvwsx/lxvdsx
Date: Tue, 19 Oct 2021 09:08:47 -0500
Message-ID: <20211019140944.152419-8-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 90711c85-f55a-4306-9781-08d9930df0cb
X-MS-TrafficTypeDiagnostic: BY5PR12MB4936:
X-Microsoft-Antispam-PRVS: <BY5PR12MB493680359DC3922FD207413595BD9@BY5PR12MB4936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gYTCM2PvV+E6XVi+3A7L9hYxOr76po/rZQIniDnmk+V0zrtUnuoIkVMj4s77DvevQTPF1RNIunjd48Rg7x64jGqg07Y4XBKZRhkvZfJqmCuC1R9aONX2C5jBxF9DdKlxo0QLt/wW9D8VqWoESWwM6+cqqjurCkqJQCHRflfZ1l42yOrhiZkKx45xHEt4qfalV+z1oNtVg1iJWafBUT1dPMGDNNLYGKh/wzdaUxV54dahkgrN2eh90HzFGxGF3h3UM6q2O8KbEiC62xVZMg8tCsf9bvCVVaOJ8UkiYtgZHBFWdnwPG1tYiTAvjHaCOJ8S0ug0hN+GkdywjMgAgq4ahvEJOMgyo3GgzOxP2f5wK4bERt6c7bWvxsYshPvFF3q2w/PpzxD9AzzRuILW6Z04YEBZxNWqqDBx06b4xXU75ApWEJ8Xinc/FAiVPwKF+Cbzad6aTYSoxqGCk/AX6AuLiOpKry0ItuJSscXGlde6l83ZLpoSMNuDT7QTuhzhONnfMxY2LF+DkZJJlzIJxxIPHmthAjoVGZnHrhurK79B8DptYCcp0Q/ZQSYywJldIpw5w96a9jpburk/+NoSVr+fkvLFVcgoqjBwnovDv2BoncdHAHxVf6F3qO4TU/Shg6pVrvtuJpPzklHvf8w+eYp1rUBnUwbX5vPBypyccpoyk1YlLKX9lZoCbmxEeXpRoLC5voA0d9V/mZ0A2GAqB+uf+AFouFKZMAavHJ1BxOYJYFMbGdjmcnzAA75eYSDhu/E6eRyq5EK1scFlob0Rbeflm42GHAfWOGQEKuvCInTO92EE3m2apvB7uuE0afkXpMxa
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(186003)(5660300002)(36756003)(8676002)(47076005)(6666004)(36860700001)(1076003)(966005)(82310400003)(16526019)(26005)(8936002)(86362001)(70586007)(356005)(70206006)(336012)(44832011)(4326008)(2616005)(83380400001)(2906002)(508600001)(81166007)(316002)(6916009)(54906003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:37:13.2564 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90711c85-f55a-4306-9781-08d9930df0cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4936
Received-SPF: softfail client-ip=40.107.100.54;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
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

From: Giuseppe Musacchio <thatlemon@gmail.com>

TARGET_WORDS_BIGENDIAN may not match the machine endianness if that's a
runtime-configurable parameter.

Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c
Fixes: afae37d98ae991c0792c867dbd9f32f988044318
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/212

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Message-Id: <20210518133020.58927-1-thatlemon@gmail.com>
Tested-by: Paul A. Clarke <pc@us.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
(cherry picked from commit 861f10fd528263a507476b8c4dda93a9588dfa5c)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 target/ppc/translate/vsx-impl.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index b817d31260..57a7f73bba 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -139,7 +139,7 @@ static void gen_lxvwsx(DisasContext *ctx)
     gen_addr_reg_index(ctx, EA);
 
     data = tcg_temp_new_i32();
-    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_TEUL);
+    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, DEF_MEMOP(MO_UL));
     tcg_gen_gvec_dup_i32(MO_UL, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
 
     tcg_temp_free(EA);
@@ -162,7 +162,7 @@ static void gen_lxvdsx(DisasContext *ctx)
     gen_addr_reg_index(ctx, EA);
 
     data = tcg_temp_new_i64();
-    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
+    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, DEF_MEMOP(MO_Q));
     tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
 
     tcg_temp_free(EA);
-- 
2.25.1


