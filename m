Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389EB43394F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:53:21 +0200 (CEST)
Received: from localhost ([::1]:50708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqUS-0005y5-9C
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpzz-0001Rx-TH; Tue, 19 Oct 2021 10:21:51 -0400
Received: from mail-bn8nam12on2074.outbound.protection.outlook.com
 ([40.107.237.74]:11744 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpzy-0000aG-1Q; Tue, 19 Oct 2021 10:21:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAhDcsdj4oaLyiqzQdHSu9INRi8tDdO7lAMLvHNGImrEMXNzBp/147ovyE/voBNMFmJDfPES3YfHvaz6I/wG34pTxJCqVPe+/YcIFDKBlHYehMha1yOlM5Sj/MKpOGv3AJWtXcPRMSQA1u//FhA54+rTQt4zdCfSHGI5sO2XD2tLy1K8/NWlpKe4ohCbe6ygnQf+ayDtTDiIWaTEHMrJIFgu7Cp8FmIsqCYhNnhR5BuicS04+S7ci9PXfHotoUXLrTrStUWN3tfVYkiQl1e1OOknumZuFdU/10NHnzWRmoRnvdA1uqiYi3Hh4OnXIphMMPAfYurQVy6M5+Eb2cF5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pj2prL90NpPq53YJ15s5rCp3sc3uLgr3Dr2QWfOkf3U=;
 b=N+b0D+XWcaO09IuK9z75w/d966QGcWkJEQd5FFzlBb30ngndFPCCpkyGv8sIcNGS6UBBWGBMf8e2uaSmB9MFOWKAbbFSInWXIubK+uEyd4eCvNhCo1UevkzKukAlpoFXsIfzWnFSVSFfjqfNNfvrf+Ep8owowScip+ZupzyEJZJxBHyyVLaAtUU9qygfxtzY6AoekpORrpd+c0WO7Ptmkx3DT3qYHhz5NqRRzVUd2sV+am9B2IPZkVYlRaaYaiLXLUhfla3txr6Eo+krXOurY0dPG+eWBsmot7Sk0+B6tZSo6hvcjiM+q0Fj1mBekhq5QR0Pg2Wj0a0/cg38pKz80g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj2prL90NpPq53YJ15s5rCp3sc3uLgr3Dr2QWfOkf3U=;
 b=MPSBWw35zBQVrHqeMRf34TbvFCb19cBYx5cfl4ePYLOaI2r0tn29yn3q71BPJZ3K5cwlIpvMlx9oMGDbEwjjv05IJ5poOMtKQMT2pnMxLV20g6KAkkBDGlpITwW3dcIMtavTYQqR4CQScBgQLpX1ZhTeLrwRuxUybWOoCMDh0aU=
Received: from DM6PR03CA0084.namprd03.prod.outlook.com (2603:10b6:5:333::17)
 by DM6PR12MB2937.namprd12.prod.outlook.com (2603:10b6:5:181::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:21:46 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::7f) by DM6PR03CA0084.outlook.office365.com
 (2603:10b6:5:333::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:21:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:21:46 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:21:46 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 28/64] crypto/tlscreds: Introduce
 qcrypto_tls_creds_check_endpoint() helper
Date: Tue, 19 Oct 2021 09:09:08 -0500
Message-ID: <20211019140944.152419-29-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 30eee8a4-b1c1-4add-5e26-08d9930bc890
X-MS-TrafficTypeDiagnostic: DM6PR12MB2937:
X-Microsoft-Antispam-PRVS: <DM6PR12MB293795A006F3118C9416C3B695BD9@DM6PR12MB2937.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OKuVXkTGyYTmw7lQQnD8ebSiBjjhrfLQ+NqdZwb+Kkms6bcLK3/Afpklo/kwdxIUmDJBi7xi3AsxBHIeaMgteUS06BvEZ3uDx8v2lIsCgAQfxaHWm8swJIMDZXL6iPh2r7NldVQFOlj/WaYI+V0lm2tAwf63fakBXBXLWyyFIuASvHUuelQURTXwSd3rwul1HR69y06adSNQq2AGwZSD1AzI2rt6J8fwkx/bhtZN8IhxN+UR6iKtyI4sb01F1avLxUBoGWgWeHFA5Waml/L1b7FbynM1+2Ez2kFJdhGSZ7WvXLa2Shq0EwoMptI62FzojCEO2ZngoUkLx3pXcojhHcVzXL3bSJ/59rLLPbns/lUiEYiyaCfOPwDEgWLjRHcfwhGAlG1K+p3oOMIXjDIeO96Kj6vWZrusYhrsIoxBdzpOsOns+kGOoatRu/Nf3RxJxKk7TOIvvwnZYuwYexlGfJqRigGQcs4Lnt1kLgPoJ1ZvQKAJI5C8QYh0mWd3LCEMFU+Yc2Sca7TSWwCEmZ5t5c9NdQEPwHqRl/hZvIVRS/CgzaT8A8YoQlZdvLd9B+bNAJWkWER4LCmv+RoyPo8qIyle4jj1EH+7C4Y653G8drSW9uOiKMLhhFuqJ5e16NShiEKKkxhgVALdomEhxsuUtaybc+hFy0+crsunRXv0OBCUnLVDLXaqG6spvZprJ3xMoZZwxhD3a/61Dq0X7i32jWU2qt/7pk076EbAAJTp1qc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2906002)(8936002)(6916009)(70586007)(1076003)(81166007)(47076005)(54906003)(356005)(336012)(2616005)(316002)(83380400001)(36756003)(4326008)(36860700001)(86362001)(82310400003)(44832011)(8676002)(5660300002)(70206006)(186003)(6666004)(426003)(16526019)(26005)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:21:46.7730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30eee8a4-b1c1-4add-5e26-08d9930bc890
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2937
Received-SPF: softfail client-ip=40.107.237.74;
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Introduce the qcrypto_tls_creds_check_endpoint() helper
to access QCryptoTLSCreds internal 'endpoint' field.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
(cherry picked from commit e9ac68083f26759b85ef0d871ca2bbe897218f64)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 crypto/tlscreds.c         | 12 ++++++++++++
 include/crypto/tlscreds.h | 14 ++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/crypto/tlscreds.c b/crypto/tlscreds.c
index b68735f06f..084ce0d51a 100644
--- a/crypto/tlscreds.c
+++ b/crypto/tlscreds.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi-types-crypto.h"
 #include "qemu/module.h"
 #include "tlscredspriv.h"
 #include "trace.h"
@@ -259,6 +260,17 @@ qcrypto_tls_creds_finalize(Object *obj)
     g_free(creds->priority);
 }
 
+bool qcrypto_tls_creds_check_endpoint(QCryptoTLSCreds *creds,
+                                      QCryptoTLSCredsEndpoint endpoint,
+                                      Error **errp)
+{
+    if (creds->endpoint != endpoint) {
+        error_setg(errp, "Expected TLS credentials for a %s endpoint",
+                   QCryptoTLSCredsEndpoint_str(endpoint));
+        return false;
+    }
+    return true;
+}
 
 static const TypeInfo qcrypto_tls_creds_info = {
     .parent = TYPE_OBJECT,
diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
index d0808e391e..a14e44fac1 100644
--- a/include/crypto/tlscreds.h
+++ b/include/crypto/tlscreds.h
@@ -65,5 +65,19 @@ struct QCryptoTLSCredsClass {
     CryptoTLSCredsReload reload;
 };
 
+/**
+ * qcrypto_tls_creds_check_endpoint:
+ * @creds: pointer to a TLS credentials object
+ * @endpoint: type of network endpoint that will be using the credentials
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Check whether the credentials is setup according to
+ * the type of @endpoint argument.
+ *
+ * Returns true if the credentials is setup for the endpoint, false otherwise
+ */
+bool qcrypto_tls_creds_check_endpoint(QCryptoTLSCreds *creds,
+                                      QCryptoTLSCredsEndpoint endpoint,
+                                      Error **errp);
 
 #endif /* QCRYPTO_TLSCREDS_H */
-- 
2.25.1


