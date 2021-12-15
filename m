Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70E9474F09
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:20:22 +0100 (CET)
Received: from localhost ([::1]:33200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI1t-00080Q-O8
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:20:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHt1-0002Cy-DS; Tue, 14 Dec 2021 19:11:11 -0500
Received: from mail-mw2nam10on2076.outbound.protection.outlook.com
 ([40.107.94.76]:29057 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHsy-0005ea-Uw; Tue, 14 Dec 2021 19:11:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqJwfe3DHoqVUCZLDRV70IyRZGQ8m8ueztA9pZRH5DuRUd38XDRisjejTiE69RkG3MMrpplf8Y0V72DtSBeysY54JaSJ7GDE982Zz/O7aD/iZMyzwDWjdTnqeTEOtFq3vigHOPkXSZKoST9EwrmLHBJ38a1WWbGgiy/+paQaEJO9RRcLo7oWvYJqLmdLXew7BxfNH0TrOeaZQoWymb9j4TlrV1HT1EBNjYRL1leUvyKbkxhAQIxvm/r5+ij6gyydsTJSTbYfxy9g3ZnjZWRS2dgW0DIg/3FJ13+c+B4U7bk6Bx5VXMhxfizJvjn7cD2mawyK4o9zy0caoBGRdJC7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mx7+9Ejo7oDq2KCbdfHMy0z423O59dIWRaxqfqHMZUk=;
 b=i/Tbf1CvtJ6ZjOopr1kJoiJjOrXYWl1nVIXMf5r5VnLANmVjlrajh4LQsqkCVgaa32G5mifunbb2K76+ZvIvQdk8rnIdX2IP7R+EHgxX2zNyqSiLdjyovHZ/Sm282JrVdvVLs5JFYKKVIO0EMpw/1242V5Ocw42mkizHBm28Z9bWKA3TB1IX6jbaRFgHPLyymi0urOo7Xt+8XMRwI8Ugb/XapTyW/qWcCeKGSft5ZikKr/F3Cu2y5O5J43taIenvT1FGCeWAOuGA3r6XuXXTq5ilOG//EdTdq3ni2LOvR/S+B0tWFnO4H+n2a14cWT9xB+yNmF0q9Q/ZEhpbJuVwdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mx7+9Ejo7oDq2KCbdfHMy0z423O59dIWRaxqfqHMZUk=;
 b=AU65ZuiiwfEL7C2xicXv0oW1prUSDJQFBEkHuF0z8qz1/qqjlLsuTOSSDLq4YU0J4pEsFTquzDJUepvV26o+XHlxagqRq4lIXceXyBTvY1wTHUkfYYgHPQcNVm3MxPW2g7zjd2EzYoC22frZRw57nNffpwyELj3z6Wqo0quYLG0=
Received: from CO2PR04CA0174.namprd04.prod.outlook.com (2603:10b6:104:4::28)
 by BY5PR12MB4308.namprd12.prod.outlook.com (2603:10b6:a03:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 00:11:05 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:4:cafe::18) by CO2PR04CA0174.outlook.office365.com
 (2603:10b6:104:4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14 via Frontend
 Transport; Wed, 15 Dec 2021 00:11:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:11:04 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:11:04 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 29/47] target-i386: mmu: use pg_mode instead of HF_LMA_MASK
Date: Tue, 14 Dec 2021 18:01:07 -0600
Message-ID: <20211215000125.378126-30-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d09a9eb-5c2e-4054-61fa-08d9bf5f62bb
X-MS-TrafficTypeDiagnostic: BY5PR12MB4308:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB430889449E8B7908897E3E2F95769@BY5PR12MB4308.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LOZ+sVSnT4UfesGOA6N4UfWOVRQpgWt/0Vt7eqSdsJsyMGm63RgFzO0ifu827g7zjWoQadWEvHCJOPPF6mDJ+cdlcDlm5W5P4h0lc9ViWZzEzwjS5CKk9+QyhzXoCbP+gXXaf8d/3tdAfwDsfxAJwaYmdZ37trpwKzrVMD9/EZnKZs6+ytRAVRaLK2J5XZSHZc8Tr/zm4HKt7bekoADqbCsjjmxNs9bK0rGBnBonUSDOQoSdlbCcHJ4coRucQ1cZOEa9jL1LiaIR5scSxbD1B/y5rrSKGiWSr74z+OfRRW834a14HbZc5jzw74xBYoJmv+C3pE40l78ylXCAjwdSjcpaMKIkFm4h8ItRZiydPkv9ZrrPqj8G6/pF5WOVLZvpUbq0dhVsPkwozXcPMtPnaPFxdwD2QqGRA1Ol0PVZNEUx7rH/X9Dua8FMQkbU1nlDS9IPoMAvOZ6/OaccqzcuKrr4Hw1b6JbjjuHf1hqFbrjGRFizBfcpV5BD2psxZLWCPoNeQoUm+33MU/XUMTwSuM8XIQikoRtnBqkohknumLhkMh1loYzk/ZUaIKzFGXoOVsyv68paXGA7Q3kvR0VUK9G/qekf06BMlHqJkufg29HmRGkjMWwDWCRfjAz/n0LzUsisZJ7In+1fpDwGiwdBghYluk7B8UU2VU5V8O9LpJQLSs7d8Nf0WeC5CPXg4pzwotdC9Ad37Smoh403xuXNOrpitOXAXlIMVPwNt5YuWCMlDtNcknacsm4Izz7AU4/KCHwOb6iMc28OvWl75amSRKCuubgHaLjOZdvjyOE07sw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(70586007)(1076003)(81166007)(186003)(47076005)(2616005)(8936002)(70206006)(356005)(316002)(426003)(336012)(2906002)(40460700001)(16526019)(26005)(54906003)(6916009)(86362001)(36756003)(44832011)(508600001)(82310400004)(4326008)(8676002)(5660300002)(36860700001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:11:04.7475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d09a9eb-5c2e-4054-61fa-08d9bf5f62bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4308
Received-SPF: softfail client-ip=40.107.94.76;
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

From: Paolo Bonzini <pbonzini@redhat.com>

Correctly look up the paging mode of the hypervisor when it is using 64-bit
mode but the guest is not.

Fixes: 68746930ae ("target/i386: use mmu_translate for NPT walk", 2021-05-11)
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 93eae3583256896dd91a4c2ca38dcbb8d4051cff)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index b6d940e04e..2dea4a248e 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -90,7 +90,7 @@ static int mmu_translate(CPUState *cs, hwaddr addr, MMUTranslateFunc get_hphys_f
         target_ulong pdpe_addr;
 
 #ifdef TARGET_X86_64
-        if (env->hflags & HF_LMA_MASK) {
+        if (pg_mode & PG_MODE_LMA) {
             bool la57 = pg_mode & PG_MODE_LA57;
             uint64_t pml5e_addr, pml5e;
             uint64_t pml4e_addr, pml4e;
@@ -287,7 +287,7 @@ do_check_protect_pse36:
         *prot |= PAGE_EXEC;
     }
 
-    if (!(env->hflags & HF_LMA_MASK)) {
+    if (!(pg_mode & PG_MODE_LMA)) {
         pkr = 0;
     } else if (ptep & PG_USER_MASK) {
         pkr = pg_mode & PG_MODE_PKE ? env->pkru : 0;
-- 
2.25.1


