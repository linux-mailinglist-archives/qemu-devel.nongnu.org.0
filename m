Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A89367ACE2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 09:55:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKbYY-0003xE-FS; Wed, 25 Jan 2023 03:54:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbYW-0003w1-1X
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:54:56 -0500
Received: from mail-dm6nam11on2049.outbound.protection.outlook.com
 ([40.107.223.49] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbYU-000129-Cb
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:54:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBr7wPoI9gyrbG/Lls5evEW14t00tRtwoX2TDDfOxEzCLOtGXQihdXSTeq3cgwiHNdGz9rPb4RHYMAqJ6SEArSUBo3908fXz53DYJTqUrSu+ZghrJbASeGI+7h64nBC1A3czsVTlegfNCDxAaiS36ZbO/cH+3FKSLPc6GHaNNPbtJivHmsPcsaQINQfYjZ0Od9Fd2PkgE4Xrjs8bvUgSgYeXEgkARskt9GJjPKBsZVgURcDMCtrnS1VMjWBpTCFyGvCOtszJVD7obAoOgM4nW1qbc1pI2482gPOVVNgPf26QQRqvR9szm6CaQ0Pt3VoewjWHksWaExvva6qSfxQwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmpuP41Ztn/lKlMcuw44+3sOiW4TYVQ+KI34gBksLz8=;
 b=TBld6471/HQGm7V0G/POxlUjS9XAXjpca2gLogIJ/1C4iIJRZrxzQ6K6DNOup2GaSLCE0KjN7LWqKlWTHT2ub33SWqbKus11bp1tjNlt4XmGnfMzKrOg58UbSALALPP8ixSrQraYWCa8v/33P1o2W0b8gvbJXMjGz+5WB/0v0QwTp6cbuamdhQETBKcwya9EmRv+P2yvz3yI4ZoIVcHfR343kdOi+m+b0iUc1p5G49AMit+8xB7IhxBeUqL4jl9IJ5r/Imq77yIrjNABFRYvkqk2+JtZ97Rv/ilplIz3spKKO+QPMjnYm7Nt3Ri/E3Sb7hZ1YNvp5GS6ZizkeYtrnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmpuP41Ztn/lKlMcuw44+3sOiW4TYVQ+KI34gBksLz8=;
 b=xMW7ZuxoqDm7ruV8kMuNoAwdLg4q9yMzU4S0PUpd1mPzrxABlzgt/e/ElDUDeYNdct0jiJcpnntG3Ae8a1ZBHY6SWzlmQJ9CzlriJ+3P2FFXa9UFk6WWgClYO4lFud8jYE1e7PjTxdFFXoRzzXeqjwTPBJ8snzhIhoG41jL1sbk=
Received: from MW4P223CA0021.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::26)
 by MN0PR12MB5836.namprd12.prod.outlook.com (2603:10b6:208:37b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20; Wed, 25 Jan
 2023 08:54:50 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::da) by MW4P223CA0021.outlook.office365.com
 (2603:10b6:303:80::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 08:54:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 08:54:49 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:54:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 00:54:48 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:54:47 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
 <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [QEMU][PATCH v4 08/10] meson.build: do not set
 have_xen_pci_passthrough for aarch64 targets
Date: Wed, 25 Jan 2023 00:54:05 -0800
Message-ID: <20230125085407.7144-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125085407.7144-1-vikram.garhwal@amd.com>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT011:EE_|MN0PR12MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e33193-298d-4928-0a9b-08dafeb1d136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JrU+L8fHBezUmbiy8yLf6TqoYHDBgtn2b8vkCyyZy6Cw7RyRyOj1eynGgBhTiJXoHZExtTbeCH4DW5DMM2l/8C20VVlsoh9SKysux2HmfHwq9pwDbBO1OqbJoaIwg0HXxNvCWJAb4W5OgCt/4Uzjv0hNKCzSFXODa1zLmOMc6WtSeNkGYRdAFEpLY9L1IhPUxRXQIL8Dm7JFO7vZanKQG3VhZLZgQwfpeH3Eo5NcwJ+JsIs0Veb2uj6+Xa6y2SOx+h5KYMuo/EUFB7INnb3Anx+s4V0PyVBwiRyHPUAhVmvM7FkAWy5TcBQovaWvHD4P8TLEqribioPtdeqqm9dMUK0iJPd/zGxNOd0Ytz110aIKlyEcpGsM1Tl5LpuoQykOOJeAS+yf5SYSMehkn5U/9WG1DQw1NOymkQa4JFN1FqqF1Md9N51pfC+GVwlKKn9HJ7pj4zN1ZjGVkL7SdNp9epGWwoHxg7RFvR64GTN48ZmPlAACbb5dZF0YY+BxVXTcvoDHJei8bVVYu57V1kItxZLc983OaqG227guANXDrRlp6tBfg2F1vm7jBwEEZqAyboA9nEHmBnbsDiKPEiMKLgbdhhsGyfncKF/91I7HUIwg8g9W0UJbiSKbaFsCsWr/TbMShen5Je1/yN2MdLuHRbTO3MUc/uJI8i/DOhyyBFwIHo7+Lr6S+lcmGl6h3zDwnajPDVwtJpvAVkYt3SHNQoPhSOTYFafa8CpSKGZbtFA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(5660300002)(8936002)(2906002)(70206006)(6916009)(70586007)(4326008)(8676002)(41300700001)(478600001)(1076003)(6666004)(186003)(26005)(2616005)(336012)(426003)(83380400001)(82310400005)(47076005)(82740400003)(316002)(44832011)(54906003)(4744005)(81166007)(356005)(86362001)(36756003)(40480700001)(40460700003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:54:49.7274 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e33193-298d-4928-0a9b-08dafeb1d136
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5836
Received-SPF: softfail client-ip=40.107.223.49;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefano Stabellini <stefano.stabellini@amd.com>

have_xen_pci_passthrough is only used for Xen x86 VMs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 6d3b665629..693802adb2 100644
--- a/meson.build
+++ b/meson.build
@@ -1471,6 +1471,8 @@ have_xen_pci_passthrough = get_option('xen_pci_passthrough') \
            error_message: 'Xen PCI passthrough requested but Xen not enabled') \
   .require(targetos == 'linux',
            error_message: 'Xen PCI passthrough not available on this platform') \
+  .require(cpu == 'x86'  or cpu == 'x86_64',
+           error_message: 'Xen PCI passthrough not available on this platform') \
   .allowed()
 
 
-- 
2.17.0


