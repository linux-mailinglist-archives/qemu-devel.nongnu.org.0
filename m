Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F3543387D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:37:41 +0200 (CEST)
Received: from localhost ([::1]:42258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqFH-00069u-Sl
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq0X-0002l2-J8; Tue, 19 Oct 2021 10:22:25 -0400
Received: from mail-dm3nam07on2072.outbound.protection.outlook.com
 ([40.107.95.72]:41217 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq0L-0000qc-Ni; Tue, 19 Oct 2021 10:22:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y85qad6BQHA7g6UKL5Ta2LDO76+zbhl0ymWhVMH1OPu/TCTobh4FqUwEaw4rjQeJU3ooL7Qfx+k4qozOzV2dhbPKUd+9qoKS28vdfGp7Ji/W0lVATGSwEiug1NE/m/Bd8TQXnCgb+ggCzHNqk3sfyaJoj483EN8VifwTEq3NqZGmeMsC3Kcc58NeEfpPbjALkwLSq6jYYma0wkRQBZT9jF+E1i/OntCOkKqOoVcfwiAYS2ygamJmE86SBQ5Gx5/Fvpj+31m6LYKizAJ7k+n50fmg5qMoQpKeiZys5vo9W1NCYUSkqBEGpNKGgBs1dheQPRe393wtIDpmsvSBsDwvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPFkekI1d33+mx59VbBy1biwfoHeqncFhlOBER66vKY=;
 b=UoiYtBBrdhnNkARyYjtPRueDsoa+tYNZolgKpF+IznP4BEu2nZhAxKdge7IXwmbcTva4qUX4DA3kVxXCrywA135OZxETNri68V3qeeJIbRh5aL+gaHZozCJn/okn9MFoWtVbtZYb/WvChilrO8ggUxPcYU3p2BpM89eq5jEAxo9UslUtZeJAzyuMG0E5G4yr3oLMsulNUVElWtI5/MAd7k3vDwbxmkdwnLdErL7jBkv9W7w5Mvy5cMmwe/34HnVjLuy3qEdhpZeJrWgimPNw4/7f0SXdRCZRAfhZqJwI0bva5wzzgY/Zr/AfyzdM4hzDzwrRdtwm4nPS2kWhrVDPWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPFkekI1d33+mx59VbBy1biwfoHeqncFhlOBER66vKY=;
 b=uqPlG51Y7CykSs6ND0MiPK/+tpCNk0klrh/S1vRBET8pRvfrGtYYSjUnHlNKuJ77DdrxMUwKDP2PVFH+mmC+D1hTxAHkIaUZLXnO7g8OSrvpIoaISn6/fvGRD2KNFV/8Jl9WjRL0htyfTr0QVQ6jQWlJMgdeRHvlon5hxtSbpQk=
Received: from DM3PR12CA0069.namprd12.prod.outlook.com (2603:10b6:0:57::13) by
 DM5PR12MB1146.namprd12.prod.outlook.com (2603:10b6:3:73::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 14:22:10 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:57:cafe::df) by DM3PR12CA0069.outlook.office365.com
 (2603:10b6:0:57::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:22:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:22:09 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:22:08 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 29/64] block/nbd: Use qcrypto_tls_creds_check_endpoint()
Date: Tue, 19 Oct 2021 09:09:09 -0500
Message-ID: <20211019140944.152419-30-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6b07deb5-379f-4a1f-4187-08d9930bd605
X-MS-TrafficTypeDiagnostic: DM5PR12MB1146:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1146E726598F1085A88E9C2495BD9@DM5PR12MB1146.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:113;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ewR3kMqL2iknDSEpR18iMrvU27DgLwiEc5T8EsN0LLrxOpCuDRfRL4aaWJh1gwI1sA/FL4WWJ6qTKWqoEeoZSigk8X2XVf0l8bGMs1/GQlQDatAUs+f8qh6LL2D4SqhlzbU/GNMPSPtqU3XRCjsgxqiFaP4b78Fzr6MLPoJbLKExi8J3aYujykznzBjYZw4UVT0jCiTVd5cdvMKzOPzUT79a3isRreUd1uziYyb4nUpuZzJej4NP3vt3ukVyBwRKObMFvgEgH3puD70j5D+CKBN4T+CbWrDp/kLcWzd6rZnrXVUwUMXq6czroy2x7mqLHO2d7I8+eB1118C8fMs4Cq7aLlSE1At4M0wrVsZg7xYPw7F8rM6OpT86mk5G+cnOoe8cQdgfae3yP2mYUY4SYCVUfXyJJY2desQxM1qt/giJzM3YXAtOTyOC87EsUalf7c/IShrlO/SctuvVFNE4CEgNIfjeLF83uJDpjgu02mMMhYViODwQzNKGU2Ol3Z7f5CXkTL1rAZTxT+1XOTDrRd7ncBa54xqH0b8lGlJBVQP+K/2QQ34oEMyUrDIWWuk947nht368QrEcQBKrvBEzvtWBfjocqWCx1X8J+Fn5A9442aRb0yuLg/F+txk+DobHKGCYU9lPzJ2GZV5dt/Rp+3SPUhtqJTVoNQEzEJxqKsNvOHLU/0UGDEFnT0/Hn49qHRxs9nD/71CBRBJNB7Zw2GP29H1hO/q1vbFS3Z5Wf0s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(8676002)(54906003)(336012)(426003)(8936002)(70586007)(356005)(1076003)(70206006)(26005)(2616005)(36756003)(6916009)(5660300002)(2906002)(316002)(47076005)(86362001)(83380400001)(81166007)(16526019)(4326008)(508600001)(44832011)(36860700001)(82310400003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:22:09.3488 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b07deb5-379f-4a1f-4187-08d9930bd605
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1146
Received-SPF: softfail client-ip=40.107.95.72;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
(cherry picked from commit 7b3b616838c30830c004b746e7b1209297118318)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 block/nbd.c    | 6 +++---
 blockdev-nbd.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 1d4668d42d..add03cfa03 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2163,9 +2163,9 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
         return NULL;
     }
 
-    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
-        error_setg(errp,
-                   "Expecting TLS credentials with a client endpoint");
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT,
+                                          errp)) {
         return NULL;
     }
     object_ref(obj);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index b264620b98..bdfa7ed3a5 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -108,9 +108,9 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
         return NULL;
     }
 
-    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-        error_setg(errp,
-                   "Expecting TLS credentials with a server endpoint");
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          QCRYPTO_TLS_CREDS_ENDPOINT_SERVER,
+                                          errp)) {
         return NULL;
     }
     object_ref(obj);
-- 
2.25.1


