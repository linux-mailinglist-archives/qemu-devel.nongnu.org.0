Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA319474F05
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:20:07 +0100 (CET)
Received: from localhost ([::1]:60946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI1e-0007gi-RG
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:20:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHoe-0003Ej-0I; Tue, 14 Dec 2021 19:06:40 -0500
Received: from mail-mw2nam12on2070.outbound.protection.outlook.com
 ([40.107.244.70]:62048 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHob-00052U-BB; Tue, 14 Dec 2021 19:06:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1fIVDU595dWe+tl6XXxDuHB4M/XdziV8byYD7Gq+v771nP7ko7OoGhBViMrwZr8yQcSJZlzs8Dr5kmEtT3zlVQssEjpw0y7AbZOb1aIBl2eJcjyNmB1HGDS1I5uiZ6qYuF5rTlCLmGtaFE6MwLpfDgx4XhUWmh1+IOOmEmp2aulkf7ktHi5/w9aZ4JLTe+W3nLv73DUQFVMoZCMIBl/KMfIbSYk/f9YN2OXVvvWmrzju9AISFddSZmC5xOGIZ93sNmHGPq8mdKdHQ11g8xo6FkPp1EwJJziNa4Knbu/grkO/5QdTMKGuwqzSphDjtH/W3Hb27vdGlCIAbYlkAc5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dojY5gAGdpmgNqfOgvgxWyMUS6huRpXlIa7A9adTA+s=;
 b=g68PmPZutJimVgrK2G/YFhvgfAM/Hp0RZjWxh6veHVOHWUPOZDrIUOrgDzuZXJZq2sLvJ0vKxpql4h2BtFRGw67W+o9XV1UPm/KJayNmRFv4SMdtbxLOyh8t1GL8B9/UMczHMUseo2NUuR8eY3bHF8jBqIxAv0Qw1SUoycCl5nEul+SZzmlI1FdF0ahtBzoDds9tF5A5cJEUKpgpgyXUINO4Cbspn89IMtR50pahhsNv2LD8cYcX6vmoVXo9wOcT4FFSFGkmuGY/w9dv6nLRJQw7HhNKIhTORiPa3WTotDaqPMw64Znir7eQSLQITQqBB65Z//OoGq5KJhLvuXEF4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dojY5gAGdpmgNqfOgvgxWyMUS6huRpXlIa7A9adTA+s=;
 b=UQ0kH+KU8UTcsf5Xs0RiRdVgQ4pRefbU/+uCfNGHdjG1rQWCq0RpXWBrF1zKFGl+PoyW525KbPC2iiMvsFTc0Jk3kkSi5ww4RbIMKxfGp7kCjjgK5mtBQro1vpF+UAMyaoilzQHMh0tZ00LS8CGSt3cMYIHXXXn+b5ao7/D63F0=
Received: from MWHPR1601CA0024.namprd16.prod.outlook.com
 (2603:10b6:300:da::34) by BYAPR12MB3624.namprd12.prod.outlook.com
 (2603:10b6:a03:aa::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 15 Dec
 2021 00:06:33 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:da:cafe::21) by MWHPR1601CA0024.outlook.office365.com
 (2603:10b6:300:da::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Wed, 15 Dec 2021 00:06:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:06:33 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:06:32 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: [PATCH 17/47] hw/arm/virt: Rename default_bus_bypass_iommu
Date: Tue, 14 Dec 2021 18:00:55 -0600
Message-ID: <20211215000125.378126-18-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 293dfb42-b3a1-42b7-4fb1-08d9bf5ec0c9
X-MS-TrafficTypeDiagnostic: BYAPR12MB3624:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3624227BB80D758C982AB18695769@BYAPR12MB3624.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x9WNkyEEiN5oiL7wAG+0rqHw7V/dnIgZ84vPSfzRM2SnmKHLAkc38DyEjEVC+lcKQPUiYOTh9dq9i42i4ReJTxIKxBcMPSbM0I7XBLAiV8RhG977uPDSuE7oRNwm2+zW9Z3ZopFg/0LLdfsOwW02vC0esY9UEG91wVNf9TCzvB8DRdvoSrP25GIuy5qwHYi+W0yAZPCCzLsMORVBrI3BWAO3GyqFvPGzlQBz9iP+75DXa6gZzHsdC7GpNzP9SxUuLp9QfvEWIfmzg+YgI8ESk5a0L3T1qrOShCrHsheL0E1ClwyS3F4MuKecXuqrbLiiWCBcxNcFAokIAkd7OaXKRrPLH3kv6/fr6qGAr5R5gl9MJNLsCCKSu07gjKsPjJoqXpDC/wIFt+hCSFlVxcaJo7cg7W8DFHfRBiaXgA/p19gbkR859iMZEPOGoKnr0of2rDZgORIH0mQW9ktONNhW8RVgwYO80+9AiIZeKmtqVG/7m8ooiojg9Ae72B5fIps/A6KPl8r7MMq0xb4R2beNYUqKClGdgrWTbXVhIdSvQS9vdh1EX/1Y6+pp+j/en/mbaASFBkFAWZEV924KE3rrT84NBT49ScZ5eyywORl/Bk0pNctVKew/3hVOzumXYJXL1eeFZFp1rzrEb4GpJxj4kSnb9YIru9LG7dkZlw7NxfLEpZUVX5mRWmFu6J8G3+FspmDFhKJzAKi4nRvH1wKzVWzSfiKFSMCBsfN31WklsQ5E/3RinSxYFmGB3uLYyJRAq1ycRg1SsUPDl8p7sye2z0xbk68l2501zB62x7QMMf0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(44832011)(8936002)(2616005)(336012)(1076003)(186003)(36860700001)(47076005)(54906003)(26005)(426003)(356005)(508600001)(81166007)(6666004)(8676002)(70206006)(16526019)(4326008)(316002)(36756003)(83380400001)(70586007)(2906002)(86362001)(82310400004)(5660300002)(6916009)(40460700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:06:33.0166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 293dfb42-b3a1-42b7-4fb1-08d9bf5ec0c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3624
Received-SPF: softfail client-ip=40.107.244.70;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
parameter definitions cannot use underscores, because keyval_dashify()
transforms them to dashes and the parser doesn't find the parameter.

This affects option default_bus_bypass_iommu which was introduced in the
same release:

$ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found

Rename the parameter to "default-bus-bypass-iommu". Passing
"default_bus_bypass_iommu" is still valid since the underscore are
transformed automatically.

Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Tested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211026093733.2144161-1-jean-philippe@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
(cherry picked from commit 9dad363a223df8269175d218413aa8cd265e078e)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0b..106be60fd4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2677,10 +2677,10 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set the IOMMU type. "
                                           "Valid values are none and smmuv3");
 
-    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
                                    virt_get_default_bus_bypass_iommu,
                                    virt_set_default_bus_bypass_iommu);
-    object_class_property_set_description(oc, "default_bus_bypass_iommu",
+    object_class_property_set_description(oc, "default-bus-bypass-iommu",
                                           "Set on/off to enable/disable "
                                           "bypass_iommu for default root bus");
 
-- 
2.25.1


