Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C943388F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:42:00 +0200 (CEST)
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqJT-0006fZ-RI
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq1p-0004nn-Dn; Tue, 19 Oct 2021 10:23:45 -0400
Received: from mail-bn7nam10on2041.outbound.protection.outlook.com
 ([40.107.92.41]:62497 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq1m-0001m1-UY; Tue, 19 Oct 2021 10:23:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+I5/pBBCJchbeMhsG6FXwEgdpG93skUkyYI55OOb3cP2o0bZkQuoxcaE+2Marwi07rP6VhherNK9hQbSv9DYFlPAAENXhIowYZ/GOrGfv5XAx8cZUOxInOrYJZ9jcvLaI0We21flQzzaSc6aBf7PA6TOXM0/aZNZAjMupKdusSUZ0RXiCHoogATvReNOUfbMQVifdqJxAmBfGdNm7hDAXXls3/J4+XCntnFaWGu4z1ZaBO4/Fgx2IwGOpflOJB7zK0PT9ztqdCiRusHffD6mF8wjFkJbxy3kghLsD5fPOBQIMy87NUPODfUyPjPZe5jisw5jO6cLrL2lmazH02lMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgPuhkB71lDQhel0VWuXd7+42Nll4m71v30uuNkeseU=;
 b=CbfYx8w2c4UjHfi0vXSJX4IurXYmUzfWJJXWd13ObZ7cT/cW4cuepDv3DMHK+JGMfxAjlxZg/ojCNZyMc8j1P8Py8sVSsYh1nCAAEZifoCISiyZRrYyKWXWl/c4iGG3up+9oa7CUWVIsf6bPNfvFQs7ab2MZU8OJEdtqcllDEDOv5DEO4dYdPdlVHYA2MecNsx+T8pIrWUNOPSjr3vQVdeo1tQP/Bc+sBg52lpNqy9mEc3dIKDYyV36I2e9MMoEyQkgVTC03o9eeVP7pHCb8ap55/GgsOuuXHLtn2Hg5Id2cXozOgWh4qDcaPRcoiB46MqVQBxvz3Z5Q3w5qTAPZEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgPuhkB71lDQhel0VWuXd7+42Nll4m71v30uuNkeseU=;
 b=FNJJpR6U6rd31m3McPZJC9DeMFuYrI3sd4vSOnqpWIccr7abKURc/zeKPwudLbHse84xaAmt1FgH5pDaX218sfWl4YvDpYmYnTAoHxR6d6dk+w27Thk77LPKDu6PI3mloN3QZ2579Qgd++dCsZXncEciH6W+pQDd+sQOB7075M0=
Received: from DS7PR03CA0196.namprd03.prod.outlook.com (2603:10b6:5:3b6::21)
 by SN6PR12MB4751.namprd12.prod.outlook.com (2603:10b6:805:df::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:23:38 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::89) by DS7PR03CA0196.outlook.office365.com
 (2603:10b6:5:3b6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:23:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:23:38 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:23:37 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 32/64] migration/tls: Use qcrypto_tls_creds_check_endpoint()
Date: Tue, 19 Oct 2021 09:09:12 -0500
Message-ID: <20211019140944.152419-33-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: b501d785-7721-4a8e-4793-08d9930c0b42
X-MS-TrafficTypeDiagnostic: SN6PR12MB4751:
X-Microsoft-Antispam-PRVS: <SN6PR12MB47518439F031EFDADE54CFC495BD9@SN6PR12MB4751.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sO02JWEKU8VvGvRcFq9Gslyjg0BiMlovSyzROunD73MeHGy8HvdeOrRaSDjHxSkpkwP1ZETeoyylOaR3EsXrkuUoNgsGmTg+yPZ/07RExBI82O6ihaZJZwjQ4WRgxbp/faBHzs7DW64uVKXMcyz1iBhYAY+Yv2/W8CpCULAl1NuhLJoQAYoJQM3cj7U2GGINWG3RahnDisVNecwMtjMhLjvDQdIODgcIhxHAYtNNRmXTHA9/38pOrtl//FulWS6wJKwxfuIS6t7SyI6Rd0tUJlXZCtzT6Iy1jyaUfvB/6TGr6xyJI6pQGfH7caST+/VpXaiOOIPn9ZFDoz/LZJz7FDesWitFgzXFaZrpQA7LMIbZgxlholZZbdGOB0mjScfhe8YLPbskBH0UIThi44OoSokCLobMzNEMMOWHbmrKtHUjWyy+eVjNXu0JXMhw1pW+Qs/fiAQnoQrZTm2kRkRug3RytguGq3VDvx7mXN+9ExxQuJYjh3yKSM49G40KX+sk8Lf3fIEXlr3xoee8g8IBptgS0mhN3YD1dh5z4GCe8+OU15IEZS0lieE2qGdi7b12F0rl3xG7VLWqUGoUbM8RN9IuIvtga1vNyncTgGc8/mruuydmSmspKXJWkUqlpeFUtmYgzDcyv/bd0wwoemHg3ozWvbzqIirMy+jKOyodxPSD4cYH8Wktglt09DRjsBERWEI0zpQk4Iu/8ayrqDerRhW89icKeKGwJvWvd4EX4Zc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(2906002)(6666004)(8936002)(316002)(36756003)(4326008)(186003)(36860700001)(70206006)(70586007)(54906003)(2616005)(5660300002)(26005)(508600001)(1076003)(83380400001)(44832011)(81166007)(16526019)(426003)(356005)(8676002)(6916009)(47076005)(86362001)(336012)(82310400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:23:38.6640 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b501d785-7721-4a8e-4793-08d9930c0b42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4751
Received-SPF: softfail client-ip=40.107.92.41;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
(cherry picked from commit 5590f65facc508fbc38575f19a0ab2fdcdcf18a4)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 migration/tls.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/migration/tls.c b/migration/tls.c
index abb149d832..ca1ea3bbdd 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -49,11 +49,7 @@ migration_tls_get_creds(MigrationState *s,
                    s->parameters.tls_creds);
         return NULL;
     }
-    if (ret->endpoint != endpoint) {
-        error_setg(errp,
-                   "Expected TLS credentials for a %s endpoint",
-                   endpoint == QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT ?
-                   "client" : "server");
+    if (!qcrypto_tls_creds_check_endpoint(ret, endpoint, errp)) {
         return NULL;
     }
 
-- 
2.25.1


