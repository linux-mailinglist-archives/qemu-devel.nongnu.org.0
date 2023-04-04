Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CFF6D5624
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 03:31:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjVUV-0004pS-BD; Mon, 03 Apr 2023 21:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Alexey.Kardashevskiy@amd.com>)
 id 1pjVUQ-0004oz-QF
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:29:41 -0400
Received: from mail-mw2nam04on20627.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::627]
 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Alexey.Kardashevskiy@amd.com>)
 id 1pjVUN-0000Ik-7x
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:29:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OECw6nWdYlMFm1QP+qb4JlbHrtq8UFTzxLf9kfGLWLRK70CBgJomf/iTlaZJfU3DrMQ9wuxYQqUSnCUo+mzTccCgwPj+69h4u1xQSbGFdgz/9RdZjJA0P3q88hnVl0vmF3U3JfYwkyLqBdw0AJdTwqSZz0hmrZtfyNiU/pCTHRhyLaJ6DXL5V6GNQ2yoO9fhmgVMoc0t45u89hihGs4XgRvZFhu+2n3wpxEiDenqNMys5NhUM73EpxVx65a7MJjz5aDrAVpl4CY55naJUzsWM7/DAPNJclSC9d47oLe/AGfRmeyO+31N+s9ssfLGhFJPsT32FYEKBpGq4tOnueyrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2lFnPcFsK/Mka8yGrmaUDAiUhMyI3oJ0iqN3giDIFQ=;
 b=LbEpJxTrCCT7NhT/PsERFKO5p3yZDW6JwAv8gb+5p+Z08Ke1ihIcyQ7SsUd9P1OF+wvIlhCrJBefdex6cT8C3pKSFKIN2qoEMH1A0149Rjo8Ci3eS7D7+S48V3+ENVtwhtOnnDt3+oEVcaMRTunTnjXFBEyHTmJlUL0AW/ANBa2udxcHdM1bDlT7KGQCpHJRDNdQmsdXDXGIn8f8QIyih15LJ3O396nZZ0An7lJVLVafd0QX0MGrg3gI7OSblKyLNyOcsTdkGrgtJCGrESKAyFED4SxzY3xOAS5bnKxgBlCEZIHzjHNeu9CqTGe8sOx/3EqGc2K7X5cHyWJgvNRf+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2lFnPcFsK/Mka8yGrmaUDAiUhMyI3oJ0iqN3giDIFQ=;
 b=vnyXHYtkNWqBWcT8HPczTj/hIerky8tV1YleWzNXwQDgG+gxshR8pPsYK0eQbzCqjjK5a4pCbHU2npZe/1+D68icfG1fPXOqnKQjeA6Gam81XsODFyoLb4bzgvpQYGNvm6T1CD7NMPQjJafDQ9BxjHco0qS4PkzgbOSRPaU4VQM=
Received: from BN9PR03CA0563.namprd03.prod.outlook.com (2603:10b6:408:138::28)
 by PH7PR12MB6881.namprd12.prod.outlook.com (2603:10b6:510:1b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Tue, 4 Apr
 2023 01:29:28 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::cc) by BN9PR03CA0563.outlook.office365.com
 (2603:10b6:408:138::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Tue, 4 Apr 2023 01:29:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.28 via Frontend Transport; Tue, 4 Apr 2023 01:29:27 +0000
Received: from aiemdeew.1.ozlabs.ru (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 3 Apr
 2023 20:29:25 -0500
From: Alexey Kardashevskiy <aik@amd.com>
To: <qemu-devel@nongnu.org>
CC: Markus Armbruster <armbru@redhat.com>, Alexey Kardashevskiy <aik@amd.com>
Subject: [PATCH qemu v2] sev/i386: Fix error reporting
Date: Tue, 4 Apr 2023 11:29:13 +1000
Message-ID: <20230404012913.2051042-1-aik@amd.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT034:EE_|PH7PR12MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b3ba96-f9fb-46bd-2602-08db34ac07fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5tsbh3vOiK7KMPy9y+PkwctL0cK+gKwY2prAAWgBMUBc8OfTvu1Ja6cOggNKwWyjo70awnHKaj5ESXWUWLUhkIWiotAKP/LBjRedpE7GPXKLqiLp3J52R2AWFQTpdl+CX8X2NdVY59MCDF6wlZR7qdDXWI4jqAmQ8WxCo1I7zAAqRwrDakpkgTGab3QUQTrvhEFEskTmWUI+R5Qar53SN3Wr42YUJHnEso1wHY6zqN70Sy/4wWIAV6qKMkwzJh0Z1jYHBayiDfF+Kc484kqlCXde/OoBfZVbQYRM2dMxTZTPsgqdLizFisWnZuNQP6Tx9WFpDtaYn0MYRN4CRT//a2Q4MtkoBg69RpKXMoEGvVMhGFwumkRlvNfLar+g2kt8CU/nmH7XwhKf210Bn6NIyhc5fJppxuzyUmxN2ss6IFrZWJnDgRTlt9JF66SsRClHkAsBjBX1gat1lIDtKKQ31ZMokZ8MZ3t1664ICG3RE+6Lxt/1i8QEgyPFazL+LVsjtpS+uqAX5riDZUfmmCVkUqw+rUj+qr2KRUL7QnYQ9z0xG4CulRAjhr3eqzqxgABIsORvZb8TmhMzbjfrJ7UjDo2IjnFnAuxQ+XLVkNVVCiXQKh0Y2+/JRc3aLPilskkzMaJU5JL6evflSyNDFS8okC4cnx332fD1aeFjKGLxJN49jPrcWLElLuIpHkGzVFRrBz8pbAq0wtjee2s+nHzdl+2Jt1mPk33KepOBbfto+XE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(82740400003)(82310400005)(356005)(81166007)(40460700003)(36756003)(40480700001)(6666004)(16526019)(2906002)(186003)(4326008)(26005)(1076003)(70206006)(70586007)(5660300002)(8936002)(41300700001)(478600001)(6916009)(8676002)(54906003)(316002)(36860700001)(426003)(336012)(47076005)(2616005)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 01:29:27.5704 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b3ba96-f9fb-46bd-2602-08db34ac07fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6881
Received-SPF: softfail client-ip=2a01:111:f400:7e8c::627;
 envelope-from=Alexey.Kardashevskiy@amd.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

c9f5aaa6bce8 ("sev: Add Error ** to sev_kvm_init()") converted
error_report() to error_setg(), however it missed one error_report()
and other 2 changes added error_report() after conversion. The result
is the caller - kvm_init() - crashes in error_report_err as local_err
is NULL.

Follow the pattern and use error_setg instead of error_report.
Remove the __func__ anti-pattern.

Fixes: 9681f8677f26 ("sev/i386: Require in-kernel irqchip support for SEV-ES guests")
Fixes: 6b98e96f1842 ("sev/i386: Add initial support for SEV-ES")
Fixes: c9f5aaa6bce8 ("sev: Add Error ** to sev_kvm_init()")
Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
---
Changes:
v2:
* removed __func__ from afftected lines
---
 target/i386/sev.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 859e06f6ad..eabb095a69 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -922,7 +922,7 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 
     ret = ram_block_discard_disable(true);
     if (ret) {
-        error_report("%s: cannot disable RAM discard", __func__);
+        error_setg(errp, "Cannot disable RAM discard");
         return -1;
     }
 
@@ -968,15 +968,12 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 
     if (sev_es_enabled()) {
         if (!kvm_kernel_irqchip_allowed()) {
-            error_report("%s: SEV-ES guests require in-kernel irqchip support",
-                         __func__);
+            error_setg(errp, "SEV-ES guests require in-kernel irqchip support");
             goto err;
         }
 
         if (!(status.flags & SEV_STATUS_FLAGS_CONFIG_ES)) {
-            error_report("%s: guest policy requires SEV-ES, but "
-                         "host SEV-ES support unavailable",
-                         __func__);
+            error_setg(errp, "Guest policy requires SEV-ES, but host SEV-ES support unavailable");
             goto err;
         }
         cmd = KVM_SEV_ES_INIT;
-- 
2.39.1


