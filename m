Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B485FF893
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 07:17:04 +0200 (CEST)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojZXj-0000zQ-Ln
	for lists+qemu-devel@lfdr.de; Sat, 15 Oct 2022 01:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1ojZPw-0006kz-23
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 01:09:00 -0400
Received: from mail-dm6nam11on2052.outbound.protection.outlook.com
 ([40.107.223.52]:58080 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1ojZPg-0007VY-0L
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 01:08:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBBUdUiDkC/gS2g62XBt92Sh9lb5CC7NIcA+25oZK7wQrS96dWa9rn+zKpvfyioPi74lRE2bKA6rBCDA43z3bNiSS+RAi0zQ8JBP5MYd/EsVoFEuYghOx7cMTSmMdcczS1FtxXtJHzvBZJboQyQXMfE/PGWUi5XtAcB+MtIDSD9f/sLGtm2mbADV8GiJ8I/MeDIXRTskJmZb4L7HNAZPBUPSt5bVgipK+Sy6jjme28HX41nAN1u+rgWXHnVVkOBPBX7o5shZ6vHOdMdW63sjJMEgZdyAb/daQhP/lZE76ykqxqqXGc8zocqekMgNauYLpdAoMd9fJdg9bFOfsUeiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjwAtttF/C6oErIUh6XAgf+daduq9Ur89areN8mBdM8=;
 b=Itxgqu4MmkLgxR8Jca/q93FlwS+ykZYGxiYdfZx3UJdXFXGSAopWd7irKuDdFj7sIqihIdWCzp5BUp1o4ns0f7YaQ2y5yL6g8KiFLme/aZQjHHNeGNymzS8c5yLsuiqCTTgs0wxZv2XLK0Sp3j7JykZvE5rY33BWMqasvBQAifI7x6S/5XwYJf0EKmtBJMSF2uUd6zphM25e9TvTzP08oZKK+AFH49TNl2ETsp8wP7MceEJFFWuaCKyjrUiTEQ9vI7qGxM2p0J5YQ2QcAyBDzYTeIYMjbr8pvVjow2PKuyWpVUHPDNi1qXmf7Vw9QjMXdDhTNUBMUzvVkSHUoTTh5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjwAtttF/C6oErIUh6XAgf+daduq9Ur89areN8mBdM8=;
 b=diB4e6n/n1TiqPinOi/fPrsQkFAIYSmyfcjorvTJodf/oOPEGdaAJ3S/LUe/vhIsKELA2HvJLoIwCJHFYpvx4Spevo9DjG/QAbneLRxGXlCkMqGfA5kS5Dsw/HaR/r4Nrn65I4wDMg7qFyRuci+lojyLdZfUd6s+1vPtBLTpPG0=
Received: from DS7PR07CA0024.namprd07.prod.outlook.com (2603:10b6:5:3af::6) by
 CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Sat, 15 Oct 2022 05:08:40 +0000
Received: from CY4PEPF0000B8EB.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::35) by DS7PR07CA0024.outlook.office365.com
 (2603:10b6:5:3af::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Sat, 15 Oct 2022 05:08:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EB.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.13 via Frontend Transport; Sat, 15 Oct 2022 05:08:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:39 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 15 Oct 2022 00:08:38 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <vikram.garhwal@amd.com>, <stefano.stabellini@amd.com>
Subject: [PATCH v1 12/12] meson.build: do not set have_xen_pci_passthrough for
 aarch64 targets
Date: Fri, 14 Oct 2022 22:07:50 -0700
Message-ID: <20221015050750.4185-13-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221015050750.4185-1-vikram.garhwal@amd.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EB:EE_|CH2PR12MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d102a8-0959-4145-4f8b-08daae6b52e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TXm0vfFbJNJcgUbZ+yq20hmX4ZEDTu7dJwf/SFzRX1RkrOf8uZm22LyILdHV/XRp6Mbs/w6lZtTzjH2Ou2ljBOcx01Rlmn+4Pfrtk3JED6HhIfZTKM03vbzY6Po/CZa45w/Suu072DSmm0NaVvnmpO90ahpCdo+nNyUb2/oCvwszujEiS13hz9gKEOnr3hAR+3AL9X1nJs4rccHigqyT8vjiVErhVwzh4CfPf1sMsSkgqsvemFC6iXtxZ6WXXXSIMzuuL/uLmAYkOX4wxO77qQrbOFYW+kF7Ykr0bFMth8OxyF3ia26x1xv8hgQ3HJwWbghN2fPz6hNugW6H6kqQhqgeI1S39EBMYN9c6nUMwu/TcehJS9pOT7og8azdXy+oCvs//53W1uYkAUQrJDGkNyAj8Tgie6VCY0rgwpslEzu1oNOzVstQbYpoK56To9U8Agz9Gqg9cTBC6L/tOm5t+3uYCf/W+1QWfYfNCvfBQtye3sVKc4uLnPYyUsNhfOsYioe4TBCX21HA+EPAcBoqIlNovmS0BYl4f4CiqllfCD4FrUyRM5Xt2HCTKcF/LSMO1PsUBNFBs97h01SIl68sYNtm92XTO+Xv6zuZz9fT3PdzNXxbDq7+5+8ZIzdbk7lnqLWKWJOOObiihUPf+2eIvRP2OISebaSXDMakDNrqyuZ1ShTUC/TB3F8/Cy0J8HbL2u6GnoeBKr5Clv+KG024oz/1t5X3NtySM3mchXncl43nf9YJAq5/aJ255Bgm5MZkYRhoxllAjJ651HjDtv03Q7Rh89eYeYDWx2C1MLDZhzOLQp2pKf0W+OiFslS+EkHp
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(47076005)(6916009)(478600001)(54906003)(316002)(4326008)(40480700001)(8676002)(70206006)(6666004)(70586007)(41300700001)(426003)(26005)(82310400005)(8936002)(36756003)(5660300002)(356005)(44832011)(4744005)(86362001)(336012)(1076003)(81166007)(82740400003)(186003)(2906002)(2616005)(40460700003)(83380400001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 05:08:39.9859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d102a8-0959-4145-4f8b-08daae6b52e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4875
Received-SPF: softfail client-ip=40.107.223.52;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Stefano Stabellini <stefano.stabellini@amd.com>

have_xen_pci_passthrough is only used for Xen x86 VMs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 0027d7d195..43e70936ee 100644
--- a/meson.build
+++ b/meson.build
@@ -1454,6 +1454,8 @@ have_xen_pci_passthrough = get_option('xen_pci_passthrough') \
            error_message: 'Xen PCI passthrough requested but Xen not enabled') \
   .require(targetos == 'linux',
            error_message: 'Xen PCI passthrough not available on this platform') \
+  .require(cpu == 'x86'  or cpu == 'x86_64',
+           error_message: 'Xen PCI passthrough not available on this platform') \
   .allowed()
 
 
-- 
2.17.0


