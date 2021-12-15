Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D05474F28
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:26:45 +0100 (CET)
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI84-0005Yd-AJ
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:26:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHuO-0004cR-AG; Tue, 14 Dec 2021 19:12:36 -0500
Received: from mail-sn1anam02on2070.outbound.protection.outlook.com
 ([40.107.96.70]:3722 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHuK-0005kt-F8; Tue, 14 Dec 2021 19:12:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFsJKfpXkFLGxdtO3NuWeDVLB1HhU22RXmWP/wLhirPYDddqCjR87qc3DW1pg42T4yefSmPRTNTpIKR2/NYRJ2YX9Vnc2RGe9yS5Dy+8WOVFdCWrzQHC1KTPcUB7vsC86UhtARaO+ORJY4hk4DnKp/9VG0XkyXOpvi/1NX0LnD/kWsjEPxxA2i3EV5gwrWP/wbBfzS0kjLfW1zO8PK6ULkUd0z9cKjQla08yPGxvFiU18YvAR0dxT1JbUEIhbZnhGAsQR3yyXWlKi1T4Afa9rseymNZ9xV4+MfuI/f6J2j5eAMSz92wIvDUMqHm9jaAloPTubEYanVsE871lMbh+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jjlg8j7uE0kLAtkoFMk8R6boU6/m82+LAr9NWo0tbg=;
 b=CRjE6uOIucWj5RZQ/MgK0THER+d3Yha+8BuRjJkvDoERcnUiYezUbiWIPvlYaJ6Qfm6p36VfnYdhkGgFuZyYP3fhk6Vqa1DhKvNYU+bRLNP8g6W8aDam3y4jIS1wBg8lBlueXtHqXIq4vZqGmT/w6HqQ9BZGXq5BZSQ5L99NlgCi7lOeANRntBjwZFuiPhXQ2nHMTL/bJOsVsF629TefbH6P5QWGbNGPB3CzWQjAXhGSLZeNRHBWku2asQeqotUFKpglR65U+ipfvZoyAnckoYI5FrK8WCLCz0y9SufXW919Qhnc+Jw3EsWUjdcLLl15/uolBujSAa+8SRtJoWEXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jjlg8j7uE0kLAtkoFMk8R6boU6/m82+LAr9NWo0tbg=;
 b=y0tnrZnk8tmb9nBlCzgOf5yq+/lDDOH+I/6oJmO2fCO5qB8ugng1R+O6JompcXVE3vsG+XQ/lHBB6EowhKEld7Lqy7/GA3oqNiaSOTGrym3krBIMCMh4NNfjmjELHAT6gM990Wh+mbu4Uhrh44ukOkY5ShTfDHLvT9RYgTsueNQ=
Received: from DM6PR06CA0043.namprd06.prod.outlook.com (2603:10b6:5:54::20) by
 MWHPR12MB1472.namprd12.prod.outlook.com (2603:10b6:301:11::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Wed, 15 Dec 2021 00:12:28 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::c7) by DM6PR06CA0043.outlook.office365.com
 (2603:10b6:5:54::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:12:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:12:28 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:12:27 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 32/47] hw: m68k: virt: Add compat machine for 6.1
Date: Tue, 14 Dec 2021 18:01:10 -0600
Message-ID: <20211215000125.378126-33-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: f89740ff-5665-47b1-3902-08d9bf5f946b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1472:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB14724D3CFE1B6B311414027C95769@MWHPR12MB1472.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xt4nZEx8xpinNDIcnFYI6ia2HoZU6qib28HTnolJuXo/ecLPGJLW3qnmwpj9P8JYiNkKpXH7qGBaw3cV919Grc7U0Twq9jq3AWTSTvvHGS/lfNww0/Cmg1VzP7JJcQFjHZ+9zPdGKu/PJKvUm3gp+2vcy7C+k2eypf8vpxEhlP7KUM5eD9fe0mFAaYmQSgVLQqRH36ovpNT2vjFNAbbjcmkPO2r6EIgDmRhDcRMscR8TTSztVwxi7/cG3G2IETttHFWpXAl5OfpKywesG9qfy2QR8dvqV+bXVhRxrY7WOScZRjgrP2mESmGWIPtkIIO4K3TGDTe7UUr34UiivPXamLVtT6nRF0mrq+YFhWxbclymrIB1TWHnyqOATk8Gf3UIZKeZTjfh8VUDOC7epOQp3pqr424liu9KmM1mqJD4Yqgfrq7Tl7IBWLC1Qwi06osin03MeSXr784txoZHchHQ+cJmc+sJie84qObm5/98JDaWbhPbrsIGARRjpPI/gSVJSN37F5bwxdTmz8NP9yMm6GIAFJXeVIgV3pCGswR9rRru+jW5kfMzAunudfo2tm9YF2KasPR3WVxvPBwxHRp7AFbQUIqvBR0jYOPEougkwMsdQD+q+gX1IEMLSgLAOx4w+zRGL7JYkNQowBdcS7F0hXXwyvY403mtxTsSAA7irSSh1FSWztDJ5wWxe2AMwt4HNX4cm1+7ZwYUWwg9MJXGRjHeKUGRhzrh+twyzjT5PTlOFTSSnyuYTMq2AL842MPF++PECwKAyWcOtp8RD/lHpmTdD64CicenxwbZt0CAPQ8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(26005)(426003)(2616005)(336012)(47076005)(2906002)(16526019)(54906003)(44832011)(86362001)(36756003)(316002)(186003)(81166007)(40460700001)(356005)(82310400004)(70206006)(508600001)(6916009)(1076003)(36860700001)(6666004)(70586007)(8676002)(4326008)(8936002)(5660300002)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:12:28.1395 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f89740ff-5665-47b1-3902-08d9bf5f946b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1472
Received-SPF: softfail client-ip=40.107.96.70;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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

From: Laurent Vivier <laurent@vivier.eu>

Add the missing machine type for m68k/virt

Cc: qemu-stable@nongnu.org
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211106194158.4068596-2-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
(cherry picked from commit 6837f299762679429924242a63f16490862578e3)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/m68k/virt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 4e8bce5aa6..0d9e3f83c1 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -304,7 +304,14 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+static void virt_machine_6_1_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE(6, 1, true)
+
 static void virt_machine_6_0_options(MachineClass *mc)
 {
+    virt_machine_6_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
 }
-DEFINE_VIRT_MACHINE(6, 0, true)
+DEFINE_VIRT_MACHINE(6, 0, false)
-- 
2.25.1


