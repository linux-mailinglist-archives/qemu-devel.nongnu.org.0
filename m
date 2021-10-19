Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD00433955
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:55:39 +0200 (CEST)
Received: from localhost ([::1]:59376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqWg-0003KW-BY
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq1e-0004R2-HP; Tue, 19 Oct 2021 10:23:38 -0400
Received: from mail-co1nam11on2066.outbound.protection.outlook.com
 ([40.107.220.66]:27696 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq1Q-0001YZ-SK; Tue, 19 Oct 2021 10:23:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRYc7WeadYtBw3ysXH9unBlHnlLdYN9bdO0P5N8ipWik76unmH/xIrOZzCfXrIKAVDTEGkLNFc/K3t+1lGNGzNRGJaQrqpZjfU9ORyMZh9HCKvC0gWuYITogSmeYB/xuRCzWchJ28T535pm21d5zMSkcjRHQZS3M2YDxY/L04Ex82m2+GbLP5j1EBLB50dWEFj7E69I/qv3jKI+rAidG/SC8aiJmc3ZOByRDSzPbo/y7eFYRo5RILFEU0i0fRDJbjDJqibUedp1K2hHqL7V6FwhykICJBrbXkm41Dc1ZFzQQ00WkZvIrc7/th7a/Cll0WERm+CzuRYqFjAM6wNPR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLUQxpaVSjd5uQPUJktQq9LPZvNg4IN5wr2knhaJ84c=;
 b=SCR87cQjTsYZIrg6ixCqhcr8UcZ46til6uC2MizvMBac+MSqo+xKY+U/a4Vi4ggPgXPgyigxKH0xx4alYCHnLtePgIDQZtTUfzCEmxab/kH/xUXZhZ0WPLQblDE9nZXxJxMXSg0uB2rzXmQIr7OFh70EnW5yXglpFbe1NGh+x20ar2yqeZ1HjfHpS15EoIb70kzBr743Ia+biM7bl3Ie/yn7GSMTOVP0Ez6hC+5Gu+dZTv4Et07h4VcDUDkOadzxIQnze8ANNLmON+aQAvJwuARWLhGlF3MZAv7+SpAKtZuYb1JqGA5a41p2LYilPvZyJSP5j290bYnlIRvgkDfvrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLUQxpaVSjd5uQPUJktQq9LPZvNg4IN5wr2knhaJ84c=;
 b=pEWY2qe1R8tM3CWGTZ+4dkI9I5wgjVKoOO80Igq4X26uFpb/EC4tPg+/1II8ZnJzzS1sr8hRZHyUno03W8M5VcUS9t5qI/oJeW9IBLdjW/mfCPbJT3aWhATu5D14p+xgchYr87y9Ygh/1HopOtbiviZf66+51vtQG2pHzv3kZio=
Received: from DM6PR13CA0021.namprd13.prod.outlook.com (2603:10b6:5:bc::34) by
 BL1PR12MB5287.namprd12.prod.outlook.com (2603:10b6:208:317::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:23:16 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::c0) by DM6PR13CA0021.outlook.office365.com
 (2603:10b6:5:bc::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Tue, 19 Oct 2021 14:23:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:23:15 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:23:14 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 31/64] chardev/socket: Use qcrypto_tls_creds_check_endpoint()
Date: Tue, 19 Oct 2021 09:09:11 -0500
Message-ID: <20211019140944.152419-32-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 290cae30-3f56-4b47-bdfd-08d9930bfd76
X-MS-TrafficTypeDiagnostic: BL1PR12MB5287:
X-Microsoft-Antispam-PRVS: <BL1PR12MB52874358B8DE5091FF9F606395BD9@BL1PR12MB5287.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ORmz/sgBUR6F0vcfgzfOHCYfF3dPxQS/NwBv4aY6s655ngL/+PxRXs1tFeEI1yelnGKwoG6TbP5FI05ILYRL4DvNNsyFw1hv7t3D6NvuB8VceWzC/OLwwzS35HNBA0OkX9CF/QcR3JUb4S+wWAS1FyMEdq6CiZEGPJxlSy/HPUFW6XzXQCdQSh+DLNyLtn+B6Ka+Ijat0VBawQbVag7knIFAlgKh8EbrjWa9waFxoeWvIpnampwO+nMgojB3AexH/EmNRK5MgLb+SnpYRJuYebKLXe2kTSwACMaR0o+CFjWuBDO8JuArbQBceDwlckxLG0kmxf59BdqeMDBtGYBMwC1dzH+qwBMFf1M0cO7qOi6QC3RnhVHg0Q39OiPMcEUjaieQzuMkRue5+ep6JjcUJTaB3+EKwxhs8tg4ogYMzWK7RfLk5AMcMlC5qHgek8OS+7jOk7RoPQ7gxpkTG6j6IMteBmeXxL+wh1Tl3iQOcpOLKXfPycCAVhCgdpPvaJbK5u9lq8yOdolWdxXv1+58ORX9Mdfv/Opbv0DBbTow/omLLjzsuN9begDWzRRqjzQCUUBzjQLVKpUiq4zlrKC9xuKzTSL1/ukeRVtXHgk8oHLAduSIar/8+RPFXADqKtRjw8a4GrEaLgWSE7GkXIu3ABOOXuCNHfvbF37SUdN+d7NrfaThjw66gYSY97UZESklyENn5pUVCsnKbaiEnczUIOLpO4zfqUhgHq+sh14uQW8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(336012)(8676002)(36860700001)(316002)(2906002)(81166007)(8936002)(83380400001)(1076003)(6666004)(6916009)(70206006)(86362001)(2616005)(186003)(426003)(508600001)(5660300002)(70586007)(26005)(44832011)(16526019)(82310400003)(47076005)(356005)(36756003)(54906003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:23:15.5227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 290cae30-3f56-4b47-bdfd-08d9930bfd76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5287
Received-SPF: softfail client-ip=40.107.220.66;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
(cherry picked from commit 8612df2ebef9ff1f880fe76d223a3369b9c98db2)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 chardev/char-socket.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index daa89fe5d1..d0fb545963 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1402,18 +1402,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
             return;
         }
         object_ref(OBJECT(s->tls_creds));
-        if (is_listen) {
-            if (s->tls_creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-                error_setg(errp, "%s",
-                           "Expected TLS credentials for server endpoint");
-                return;
-            }
-        } else {
-            if (s->tls_creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
-                error_setg(errp, "%s",
-                           "Expected TLS credentials for client endpoint");
-                return;
-            }
+        if (!qcrypto_tls_creds_check_endpoint(s->tls_creds,
+                                          is_listen
+                                          ? QCRYPTO_TLS_CREDS_ENDPOINT_SERVER
+                                          : QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT,
+                                          errp)) {
+            return;
         }
     }
     s->tls_authz = g_strdup(sock->tls_authz);
-- 
2.25.1


