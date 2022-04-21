Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A8B50A636
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:51:54 +0200 (CEST)
Received: from localhost ([::1]:53722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nha23-0004Xh-W9
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1nhZKE-0001TL-19
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:06:34 -0400
Received: from mail-bn7nam10on2040.outbound.protection.outlook.com
 ([40.107.92.40]:40032 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1nhZKB-0005iP-Iv
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:06:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+R6R7rNRWGOrUQ0GcZ2h9tdO58X2DPxH6vOkpZuJk4IKa3zwyvzd9vmyzuawXDPM1lYuKgdNWm923jalpf4nts34zRBuJbwIQBLEogrURESjjJ6T9TMePdY6gAXaiHiOqjAq4UVGeQ4VANkDibiyR63Het6sxFeZe0qAvvFBIQ6mvtCcmo3+yuQbF5IrXro4E76For4/b2IR64+sZFnHlpePrlkuAXw1/msPmrgJIEnU2qtAfxARpYTDHye1bP52rYk6b1/NAX/5IQYUm9NnL5mdoteLXpXr3Iak0NMwoZgDMl/YKgrHXr16FDRY8PufE/vG2Ej/PWEHemhKMFPUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipbCu6ihtwJcC1qGIdy46+1dL4cUUllPMkRBbJdN7jI=;
 b=AeOwL9Lo/4jOCjO6mmF6vqHotl/1jwgdq5I39p+7bzK10sNgLTu2paQhE93hJsCSrmP3m6rrxlJDST/5712hhZj1VplnZPflDNXQ8GASPiPiU9pzxHE4ZmcHrIWn2e7pj0ZkxWZnnnJTXt26MKfX4c3Z3clVoUmWdkoiLU6GehnpNOP4zcNB3/SAjBkZ/mhBT207OlizoZE3/oM2cySMYZZe+6ayRJWXSiu6KYCzQRe69tgc1/OZrCAyJvo2byceo4XoBEBuLwM9bnzUiX8MXrHYkEdXXRvm0ikrF6elBvhoBjoWPGCFO4fT/mKKu4xzYj60URdJ4ZKPO0BJXsZfpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipbCu6ihtwJcC1qGIdy46+1dL4cUUllPMkRBbJdN7jI=;
 b=zDVbHsUK84Bf7KoazBjhNSmwBTM7qRgPjCqQZJ2wLbWa14Vu3DBxB5rWk+JBWT7G39awQx8sGxxE/OcRghXOeg/bABoi8WNxzr06h8xiBNJNreQ65Zy70Ojxk7EMd+uXRoBjGFSFHJKP//g/oO53Nvm+xYlReIwpPRSXY/M9h7Q=
Received: from BN9P221CA0015.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::20)
 by DM5PR12MB2375.namprd12.prod.outlook.com (2603:10b6:4:b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Thu, 21 Apr
 2022 16:01:26 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::d4) by BN9P221CA0015.outlook.office365.com
 (2603:10b6:408:10a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Thu, 21 Apr 2022 16:01:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 16:01:25 +0000
Received: from weiserver.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 21 Apr
 2022 11:01:24 -0500
From: Wei Huang <wei.huang2@amd.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
 <richard.henderson@linaro.org>, <eduardo@habkost.net>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <jasowang@redhat.com>, <peterx@redhat.com>,
 <Suravee.Suthikulpanit@amd.com>
Subject: [PATCH 1/1] hw/i386/amd_iommu: Fix IOMMU event log encoding errors
Date: Thu, 21 Apr 2022 11:01:18 -0500
Message-ID: <20220421160118.2386364-1-wei.huang2@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cc604f0-25b4-4e95-2f8c-08da23b0303b
X-MS-TrafficTypeDiagnostic: DM5PR12MB2375:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2375EC7A9E7147B60954C44CCFF49@DM5PR12MB2375.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zh5WcqJuQeP68GVT6PCnzWn21DM3kEgubNPcnH4auAXG/r9cvm4tBslOglf0FNPBfxB/E9n6A8Vykqjhm+SDbv67bY5rFHbdrt0ihJvLeK7gj+EGVof2G3m8/DMdIvTMixr7kZJgs/QA8YDem7C87QNrI2PUY6GhW4yuSPsDa4TtwSC+FsXGGtuUX1tb4thQZFVV/wPmxJudV5TxD6uJcLVi1/tBVe9Z1UTRVypEX6xSEpOoorF81ykCgVhCKvt4J3HAHp6bwd/g2Y0Sl1sEHnMg3kswECpAmAfVavhOi8lHXf3nje56lDfh564HTraUT4o648juGQmHig/uUKkAUYTJyB0yuyQDC04TcFyqfagjXt0vgmrvCwFj3W1PCpJt4ieib4Y+eMihZiw4H3k24vmXrkIVUqi+NelIDXgsL11M0nJGdzsNYpkDAWRcGfwvNQY99fVQQUXc4xnOwx95c72sWrjz7DRSVMQPvSyol/SfcJfidD4LKCpYmTPUC4QzT5Us02b/Yh9VdvKLYXg1zkJFJq6Sm3v+SZeob+gfnpsPd8KSJ4fTfKXMWz9jQRGzuGijcqEehx2BMFUAKSZ0Kk1J9fOBehUQj8RG/3RVk7qrHBElKJXSxzb37whtvfulAZ9fulkfxBOIz1OFDvu5o+t3ShD9l5D12A/i0Mw3OU8SiG6W5yvitvDcJFJMwrimVeIF/PDHQif3SmFAmzTftA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36860700001)(356005)(82310400005)(40460700003)(336012)(7696005)(4326008)(83380400001)(86362001)(8676002)(26005)(2906002)(508600001)(70206006)(6666004)(70586007)(81166007)(36756003)(2616005)(316002)(6916009)(8936002)(16526019)(186003)(1076003)(54906003)(47076005)(426003)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 16:01:25.5966 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc604f0-25b4-4e95-2f8c-08da23b0303b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2375
Received-SPF: softfail client-ip=40.107.92.40; envelope-from=Wei.Huang2@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

Coverity issues several UNINIT warnings against AMD IOMMU device [1]. This
patch fixes them by initializing the variables. On top of it, this patch
changes the event log size to 16 bytes per IOMMU specification. Also the
event encoding function incorrectly defines the format of event log entry,
which is also fixed.

[1] CID 1487116/1487200/1487190/1487232/1487115/1487258

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Wei Huang <wei.huang2@amd.com>
---
 hw/i386/amd_iommu.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index ea8eaeb330b6..0f7f8929a687 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -208,8 +208,8 @@ static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
                                uint16_t info)
 {
     amdvi_setevent_bits(evt, devid, 0, 16);
-    amdvi_setevent_bits(evt, info, 55, 8);
-    amdvi_setevent_bits(evt, addr, 63, 64);
+    amdvi_setevent_bits(evt, info, 48, 16);
+    amdvi_setevent_bits(evt, addr, 64, 64);
 }
 /* log an error encountered during a page walk
  *
@@ -218,7 +218,7 @@ static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
 static void amdvi_page_fault(AMDVIState *s, uint16_t devid,
                              hwaddr addr, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2] = { 0 };
 
     info |= AMDVI_EVENT_IOPF_I | AMDVI_EVENT_IOPF;
     amdvi_encode_event(evt, devid, addr, info);
@@ -234,7 +234,7 @@ static void amdvi_page_fault(AMDVIState *s, uint16_t devid,
 static void amdvi_log_devtab_error(AMDVIState *s, uint16_t devid,
                                    hwaddr devtab, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2] = { 0 };
 
     info |= AMDVI_EVENT_DEV_TAB_HW_ERROR;
 
@@ -248,7 +248,8 @@ static void amdvi_log_devtab_error(AMDVIState *s, uint16_t devid,
  */
 static void amdvi_log_command_error(AMDVIState *s, hwaddr addr)
 {
-    uint64_t evt[4], info = AMDVI_EVENT_COMMAND_HW_ERROR;
+    uint64_t evt[2] = { 0 };
+    uint16_t info = AMDVI_EVENT_COMMAND_HW_ERROR;
 
     amdvi_encode_event(evt, 0, addr, info);
     amdvi_log_event(s, evt);
@@ -261,7 +262,7 @@ static void amdvi_log_command_error(AMDVIState *s, hwaddr addr)
 static void amdvi_log_illegalcom_error(AMDVIState *s, uint16_t info,
                                        hwaddr addr)
 {
-    uint64_t evt[4];
+    uint64_t evt[2] = { 0 };
 
     info |= AMDVI_EVENT_ILLEGAL_COMMAND_ERROR;
     amdvi_encode_event(evt, 0, addr, info);
@@ -276,7 +277,7 @@ static void amdvi_log_illegalcom_error(AMDVIState *s, uint16_t info,
 static void amdvi_log_illegaldevtab_error(AMDVIState *s, uint16_t devid,
                                           hwaddr addr, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2] = { 0 };
 
     info |= AMDVI_EVENT_ILLEGAL_DEVTAB_ENTRY;
     amdvi_encode_event(evt, devid, addr, info);
@@ -288,7 +289,7 @@ static void amdvi_log_illegaldevtab_error(AMDVIState *s, uint16_t devid,
 static void amdvi_log_pagetab_error(AMDVIState *s, uint16_t devid,
                                     hwaddr addr, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2] = { 0 };
 
     info |= AMDVI_EVENT_PAGE_TAB_HW_ERROR;
     amdvi_encode_event(evt, devid, addr, info);
-- 
2.35.1


