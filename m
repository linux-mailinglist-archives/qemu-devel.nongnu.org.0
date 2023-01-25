Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077FD67ACB7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 09:46:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKbP6-0002gL-EY; Wed, 25 Jan 2023 03:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbP1-0002RU-Qs
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:45:07 -0500
Received: from mail-dm6nam12on2081.outbound.protection.outlook.com
 ([40.107.243.81] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbOz-0007xr-C0
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:45:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVnhG3HCmOtvqu1mYz1m1obU98TlbaJreLPp6WYTG253DMzCzz/1mF5fZFZoBOhQl2wh07EnqB4AzVqRUVs8sG0fzFKhRnKmJxlNGVspjoqWstRMAdbOH2ELKGasmNlDO1qjWtGwJUAf1Smn4Ig6w8/5jIy2bN+1+nKTPjQ8PL8Na4kI7z/bwKNCpeg3irH3YtnVbsBQRyZu88Ea9VcU/oxSHRKOLe//Ko/dGE2lUIWpRh/y537TYrKan0qNnhKFaeqrQi7s1U8XuINEkZVa9T9bI+jsRsOCBNrM77udok/1utCpC9zBSR8oJQ1XFs44v1daMO6GH6KZRDwxY1v8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmpuP41Ztn/lKlMcuw44+3sOiW4TYVQ+KI34gBksLz8=;
 b=Igq/ddRoW3iSeidStXB/isGPacoiS0QR7skTpOmXN8NnrBylbK4HPFbMSUZoU3PFb1zxWFm1qlIcu+ARxIdZ3R5lak2AsaeBOdXlPDVQVlmtqMjYACZ63K2NpX7LrNTeBu1TjXE1152/+TZMRtWDRY1uhaCFDDtvHy+yn61fL8mcP0NGEKUxvJRatz7CVE/50elk4SyhG7ajiKhoDiauZYkGU6ljeC/elbdog8sIjU0MDAEZWjTByVp1hPIntUqp/Ppbl8cLZzfEPoJEWYuGoAmaDGMqZg4iTYCqNI303LFfKdb692ErsJUUxslx5QnYeerU4QS02Dru+C8QChV3WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmpuP41Ztn/lKlMcuw44+3sOiW4TYVQ+KI34gBksLz8=;
 b=gHUjRYwJKjkyikvIw8q/F94USVX5BA7AAzVnnVYWtl0JvuCPlBApjmR9G1xif4w4eg7ScUtVXqqBQrLe7AD3lu67xvhGzOX/68cJBH3mMsxt5TSNF5GQaYQN+aiH0uDESa2xLwv++idxpNgDttLf6sRA2ueKyTkHNrBMJM8l0HY=
Received: from DS7PR03CA0010.namprd03.prod.outlook.com (2603:10b6:5:3b8::15)
 by IA0PR12MB8280.namprd12.prod.outlook.com (2603:10b6:208:3df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 08:45:00 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::c8) by DS7PR03CA0010.outlook.office365.com
 (2603:10b6:5:3b8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 08:45:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 08:44:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:44:59 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:44:58 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
 <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [QEMU][PATCH v3 08/10] meson.build: do not set
 have_xen_pci_passthrough for aarch64 targets
Date: Wed, 25 Jan 2023 00:43:54 -0800
Message-ID: <20230125084356.6684-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125084356.6684-1-vikram.garhwal@amd.com>
References: <20230125084356.6684-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT016:EE_|IA0PR12MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: a129ade1-a24f-4838-1dc1-08dafeb07184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O1M/qNgEplGq3joZFwMs4OZCGQTYWfbGduEWggrYnGHhqpvO61NSXc/h5to6V8zDyeA+QMJdgYwBEzemXtZGw9ze8rOb9ayY1X9GsMXE7Jm8u+Xj7+yYGzjr8mBjASH7orZbX+LrniTnBbZndl28/as37GmhbnET3YdVP6Oz+93flvBKGoPpQkTMbVZ44O5jTQOvQpoAN1g+XZwskRG78TFPBFNPei826ogX6msqF56CNGxHsiuglfX80pTGRqPgM9HRexIAMKhjP9LZJb/4tSYOi1G25fb0hSQCysJ2FcJeYYw91AuUXMcpzz/ToCi1QWH4+fBRUqzePtdPQpDIIP2/3fyn2eRhEjDWq1THLfXbahBnG8WWWLIOh9sCi9hHgBToQ3VfRS4Id1qH8JDMepkkskrIwOTLYrj15nlxoyjEcCT/JPvs4pgIKqTZojYZ/4RZPCsxOdFCx0OuYi3cvkql/wsYy7e/c+Jy69vHFlz9lxzvPdKGqJRfNxVmaJxuGdZGNmXkcljKkOfCJKcuVoqFsJuu8KlLDJHrlXEcDhOV+Ohv2JlhCozSJ5/jXiJQE9RCm2F/7LI3B5/POqw40sbOiCtqT5d/GlF7I3bqCSSgcrwKpfX+qNbkBc4S5Wxiklm2RR3DopCkt4HdgyG/vXZ3sXwqfwFxrJy2kordT6vHK17iGAdLxbrTP308aoaR0N+Vk7VRB98ZyPefhp2S9xAVOgRce5r91zk6Bo0IDRY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(4744005)(6666004)(5660300002)(83380400001)(40480700001)(41300700001)(8936002)(82310400005)(86362001)(426003)(82740400003)(81166007)(186003)(2906002)(36860700001)(2616005)(70586007)(1076003)(26005)(44832011)(478600001)(356005)(36756003)(54906003)(47076005)(8676002)(70206006)(316002)(4326008)(336012)(40460700003)(6916009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:44:59.7748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a129ade1-a24f-4838-1dc1-08dafeb07184
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8280
Received-SPF: softfail client-ip=40.107.243.81;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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


