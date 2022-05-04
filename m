Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7865192D0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 02:29:27 +0200 (CEST)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm2tS-00012C-G0
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 20:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1nm2rx-0007om-Sx
 for qemu-devel@nongnu.org; Tue, 03 May 2022 20:27:53 -0400
Received: from mail-dm6nam10on2051.outbound.protection.outlook.com
 ([40.107.93.51]:18729 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1nm2rv-0004zF-DI
 for qemu-devel@nongnu.org; Tue, 03 May 2022 20:27:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXHEahuF80wuMntJpO2BxudN2ZF9QswQLBO8BVNoD1qBdH95WtV5U0jKi4Zv5jrAER92iO8lP6YRuIrIUpttlkLN+tuY3Hf/vIfg2gaJ666bow90RKnB/SjLnOYiz5UVojS/gHdu4lAIfk/ZwhQpx3MHolCNWVMcnI0f6IuD3qdF9UKkAS9r4nS1TiUal7v+zPwRflbayuN95Yzj/zXja3hceNjFUz8fNU5G9ehq2Z44B+Qw3zfNRLjfA52JKF7u54WKWc0EHTsdt5OdjKM1TJE/jJRLbeoGomdOtMqDxYgJq3LwA+JyFf2+OmYDyWoUF/setR+4SAJSjNmZsPN6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/6u5e1xfVWgCHX7EBjqM6yP2PfErpq4cKfylNLaDb0=;
 b=a1/b6CLrFw2n5vvmrtsQIiDbCFZS6coifDXFzWRuWpkUejKaPkn34ztT2+myiek8wnXqHRPq7uSsOHHeGv9A2SeJGzOticfIvrQIgKhfQ449iWhgJ+3hCaF+n3aj3U4mwE2/jf1CxnWFdsS22b6hd0GDO1vTx0ayJWHUCL6w9HNWbqCXMwIB2HKlE6YCn0qlYAwjZ1b9z+i2BrJezIZNBSpzXAe2jJSpahtY7yHcXMYibS9HaAkAXvPTtb9c7M+2FTFfTpkXC2Th7I3lHCn4NHfo//S6EeDfGHn3pi6+koSL1scBK/l+dUJKINXhJJf9bg5pj22B+J68tTaxUkbbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/6u5e1xfVWgCHX7EBjqM6yP2PfErpq4cKfylNLaDb0=;
 b=PEuKS6sLslWF4sCqhaeIUQFPrmksyHHg16Rf9z7p0ngs8fX0OKrb4nd+ZRCY6sC2oLmV097w+AX7JWhC94uY5IWFFU5l9JHY7XJi9rCrzf0OLb5HBsaUSQvyolfCCQQrEq9/jdXwn1lfGUyUwBoPwMAOSWPxueOgVqiaH2ZGzvU=
Received: from MW4PR04CA0366.namprd04.prod.outlook.com (2603:10b6:303:81::11)
 by BYAPR12MB4695.namprd12.prod.outlook.com (2603:10b6:a03:a4::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Wed, 4 May
 2022 00:22:41 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::b5) by MW4PR04CA0366.outlook.office365.com
 (2603:10b6:303:81::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Wed, 4 May 2022 00:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 00:22:40 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 3 May
 2022 19:22:38 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <pbonzini@redhat.com>, <peter.maydell@linaro.org>, <thuth@redhat.com>,
 <stefanha@redhat.com>
Subject: [qemu-web PATCH] Add public key for tarball-signing to download page
Date: Tue, 3 May 2022 19:21:29 -0500
Message-ID: <20220504002129.286001-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b70aa3cc-6831-4655-ec5a-08da2d643346
X-MS-TrafficTypeDiagnostic: BYAPR12MB4695:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB46954FE4EB9DCF2B3D02C61F95C39@BYAPR12MB4695.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eZCqNimhUwhhPS84f6WUKHAcakiHkinHYuT+PxlkVBZLvvo2c/AN4bq2NtHyv5VFUk9kHCeUPilGEs47KTlOQzbk2oUPECY4F5bsLHnL7ve5MmQV/BaL8dW8TV4vOD/EYlthpktMwJ1n2LJ6S4rBomYyO7IfxaE0Z7yvluEjLtcw+KmYBt4g+RdI/YKpQK0/2z83JSovNOa5oUMB4jUBjaQ6JA3qRawnC5GU2uxBPiTgqQCSmrdqsc+zop6fcojfmxqJ/YuXo2IFWILhV8xzc1CIA0VDGiUuLzJ0oGDL91zBZ5UEbI9E3JIjxfN9VXIl7GlFdOEFoh0zj1eULm/epcTbi7AH4+Zxq8atJcLb+1jbsqYnL58Y3ZTfcZqqg9QlEGJ53mJp7YRrrJ2rhzjcD2KZ5MIPiW7wot+6oGMOJaqYaRfHKZnGzhFq4zNXSRXRRQpJjohK0/1z/IhCadyC030ZPz6aF+0A6b68fwpimwS9s83vzTSliMTTgwoncWvzmx7OvjuHeVXrtiMm841o0Er1aNfocrRAtS4f5HkWs0cWuDpOYS3jbkHH8aaxnOAcsz/wavrdccnd5+dfGhpvLdN7CzJU13sSkikNoFuqG/MoKM3lYUkoS8VwKH6Av9D7A/xEQtvrZ3uQj9kF2OmmFjXsna9GvF73SXg8OFLgALvZPd3EDyyICkwLFFXGKrddBaw5aavXXV7w/V0N800wYtWWMj+y5epWyWWGt7L05axWy1TOX+b9FPf+L9K95WI4huenEsgL8UBTnnexqQQvfYxldrjrd1TIp0hb2iyx0o0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(966005)(36756003)(36860700001)(83380400001)(4326008)(6666004)(70206006)(70586007)(6916009)(54906003)(8676002)(8936002)(44832011)(5660300002)(316002)(16526019)(2616005)(186003)(336012)(1076003)(26005)(47076005)(2906002)(426003)(40460700003)(86362001)(356005)(166002)(81166007)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 00:22:40.4893 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b70aa3cc-6831-4655-ec5a-08da2d643346
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4695
Received-SPF: softfail client-ip=40.107.93.51;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We used to have public keys listed on the SecurityProcess page back
when it was still part of the wiki, but they are no longer available
there and some users have asked where to obtain them so they can verify
the tarball signatures.

That was probably not a great place for them anyway, so address this by
adding the public signing key directly to the download page.

Since a compromised tarball has a high likelyhood of coinciding with a
compromised host (in general at least), also include some information
so they can verify the correct signing key via stable tree git tags if
desired.

Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 _download/source.html | 1 +
 1 file changed, 1 insertion(+)

diff --git a/_download/source.html b/_download/source.html
index 8671f4e..c0a55ac 100644
--- a/_download/source.html
+++ b/_download/source.html
@@ -23,6 +23,7 @@ make
 </pre>
 	{% endfor %}
 
+	<p>Source tarballs on this site are generated and signed by the package maintainer using the public key <a href="https://keys.openpgp.org/vks/v1/by-fingerprint/CEACC9E15534EBABB82D3FA03353C9CEF108B584">F108B584</a>. This key is also used to tag the QEMU stable releases in the official QEMU gitlab mirror, and so can be verified through git as well if there are concerns about the authenticity of this information.</p>
 	<p>To download and build QEMU from git:</p>
 <pre>git clone https://gitlab.com/qemu-project/qemu.git
 cd qemu
-- 
2.25.1


