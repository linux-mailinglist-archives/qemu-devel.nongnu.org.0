Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979EB50AFBD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 07:55:21 +0200 (CEST)
Received: from localhost ([::1]:33756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhmGG-0005F3-Aj
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 01:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1nhmD2-0004Rv-Uj
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 01:52:00 -0400
Received: from mail-mw2nam10on2061c.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::61c]:29448
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1nhmD0-00079K-DW
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 01:52:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKeoWLInwIrpUQzyFAPu8s+LtybDMe2gH1ZWAJZu6NQwnutjPIaABA//cHHbWB165pB/liTj5lKg5OK3m9S9eqJKrTItyHd/MSNA1YoKqNkvy4yIFgIekdEyMnW58iON+HN3FlJ01ANTjg2dciNTHEFbNCNeYF3+o1DtEdow5i7z2DovYl7XbCZ6EHyngsdOvvItCJ99pPkKPEUwF5bL6mA9gYE5flpsdOtWTBC6+q6SVoyDsua3RofDSaAcEridkedvt48KdZGFju2ifbbyoMmVu4d79V2jupsemmiH4KtCOo0KYEVWEzYbl40kViz/+wWtX4B9Ptn1T9jAUvxVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOoV4zsJuf/2vYHzGpwChNx2j67RESqla0p+ro5U97I=;
 b=XgKzdrlG8CRmUO3pudeG1t//qImJISi8CBCfmvGx2VZDhLaCpnwlHbplbKUbiPcCJv8+iv5a7YHByEleKToIvggpl8SKCApxCjGPZ/A6ucorKfnsLmxMmyGXBnhR7qaD+pnd6POrAegx+CrAZuSffTiUR5K33WeTpcq6q49q99+LPQ7TPfQ0whfOQOsmpMowecEIGUJZAqfox8KvUfgAuJh72E3BKXQkOmbNp4EwpjzTD+PabkTkVMypYu7zWGUoZAKn8xkKqvig8zezuMoNbSq4wefmSOfoikKQnos7/F+AxrZ3LJPSPaGBFoNl94W8b2JM1QfwZ96igVpU6WBRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOoV4zsJuf/2vYHzGpwChNx2j67RESqla0p+ro5U97I=;
 b=VnA6mq9c8vdfFDYSdXpukSkH8bOP25DTeGmUaPNDBiI1d/sM+SysPcQWpYuuTXNz/NQuxlc097IxX5O9HSYfe53UICW1DXUlX+J+o7hmQBCGucaCpxP3Rc/RGIdEGsz/6FD86yWlOPBwkSw9zFWbZyRSgzpuDMUW+kNdHWrRCfc=
Received: from BN9PR03CA0647.namprd03.prod.outlook.com (2603:10b6:408:13b::22)
 by DM5PR12MB1628.namprd12.prod.outlook.com (2603:10b6:4:7::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Fri, 22 Apr 2022 05:51:54 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::31) by BN9PR03CA0647.outlook.office365.com
 (2603:10b6:408:13b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Fri, 22 Apr 2022 05:51:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Fri, 22 Apr 2022 05:51:53 +0000
Received: from weiserver.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 22 Apr
 2022 00:51:52 -0500
From: Wei Huang <wei.huang2@amd.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
 <richard.henderson@linaro.org>, <eduardo@habkost.net>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <jasowang@redhat.com>, <peterx@redhat.com>,
 <Suravee.Suthikulpanit@amd.com>
Subject: [PATCH v2 1/1] hw/i386/amd_iommu: Fix IOMMU event log encoding errors
Date: Fri, 22 Apr 2022 00:51:46 -0500
Message-ID: <20220422055146.3312226-1-wei.huang2@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef531ad0-8e21-4e76-172a-08da242433f7
X-MS-TrafficTypeDiagnostic: DM5PR12MB1628:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB162875430700EF3DBB78485CCFF79@DM5PR12MB1628.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMIlaStdPAKzxcLmrkWFf3Gln3vRQ1ttHJxhc6CiYQG1ek1lGp+ncjaYACvSXbbWJxS4hQglrGgukKqv4eqkkv8edHZB3bRY4RxJGDcExHZ/2r4mhfvT+3haNsGwnxQD4d7MciAkezl/SSySf20ZAjXG83AlsUDkXA0z6sKPwBasoPwMjQjoEJQPFfLe68HjT875VfgJzsVk/37UBlLaWeEF/MIfZNKPT1im+ucnbM2X+hp85fBbHl51Hi5PkMWcO4hU90KOSBmNV+vTSx4RnsRmZEQQf2yhFjGfEw/tXJubGlFbfaKheg/nqaIYVE7rvmy8WajYXdsvgbdfaguTt8oS4k9S7/dzPJLsnrFvXy76WpWpzrQMphlH1LOtuKfI75C6zWzAjjT3YWE7loXhDINX1XPp8pBroB9so/4aFhnRUwjsF2Lqnmn5e+5BYOQlgPpW0H6g78s9+VbCp8YI1hoMPd6UVE1dMP7FbR0U9zKCzHnAm2EFTrFMBhiExX6AUA/RSmMGaASE6FsbyWEQ14hEaQM5etG8jYj7PmjV7Q/nFjHEtK1rS3KvljQ4KNRQ3MrxbLd75u86SZRJXRjfXzIFUmiPd6e8J5XoGeGaK7n5ugxwA2FdUOYIzPb/lbhsm2NUevICGUpA0ZSafuzb3ERtgX1BvlQzR41tJaMb/q+Qev0IRTXrwnzbJy2ACRDNj5BGRFOpCr+A4E6Oy3FXNA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36756003)(82310400005)(2616005)(36860700001)(47076005)(83380400001)(336012)(8936002)(356005)(81166007)(5660300002)(426003)(2906002)(16526019)(186003)(316002)(508600001)(54906003)(6666004)(70586007)(40460700003)(8676002)(4326008)(86362001)(6916009)(70206006)(1076003)(26005)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 05:51:53.4975 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef531ad0-8e21-4e76-172a-08da242433f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1628
Received-SPF: softfail client-ip=2a01:111:f400:7e89::61c;
 envelope-from=Wei.Huang2@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Coverity issues several UNINIT warnings against amd_iommu.c [1]. This
patch fixes them by clearing evt before encoding. On top of it, this
patch changes the event log size to 16 bytes per IOMMU specification,
and fixes the event log entry format in amdvi_encode_event().

[1] CID 1487116/1487200/1487190/1487232/1487115/1487258

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Wei Huang <wei.huang2@amd.com>
---
 hw/i386/amd_iommu.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index ea8eaeb330b6..725f69095b9e 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -201,15 +201,18 @@ static void amdvi_setevent_bits(uint64_t *buffer, uint64_t value, int start,
 /*
  * AMDVi event structure
  *    0:15   -> DeviceID
- *    55:63  -> event type + miscellaneous info
- *    63:127 -> related address
+ *    48:63  -> event type + miscellaneous info
+ *    64:127 -> related address
  */
 static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
                                uint16_t info)
 {
+    evt[0] = 0;
+    evt[1] = 0;
+
     amdvi_setevent_bits(evt, devid, 0, 16);
-    amdvi_setevent_bits(evt, info, 55, 8);
-    amdvi_setevent_bits(evt, addr, 63, 64);
+    amdvi_setevent_bits(evt, info, 48, 16);
+    amdvi_setevent_bits(evt, addr, 64, 64);
 }
 /* log an error encountered during a page walk
  *
@@ -218,7 +221,7 @@ static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
 static void amdvi_page_fault(AMDVIState *s, uint16_t devid,
                              hwaddr addr, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_IOPF_I | AMDVI_EVENT_IOPF;
     amdvi_encode_event(evt, devid, addr, info);
@@ -234,7 +237,7 @@ static void amdvi_page_fault(AMDVIState *s, uint16_t devid,
 static void amdvi_log_devtab_error(AMDVIState *s, uint16_t devid,
                                    hwaddr devtab, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_DEV_TAB_HW_ERROR;
 
@@ -248,7 +251,8 @@ static void amdvi_log_devtab_error(AMDVIState *s, uint16_t devid,
  */
 static void amdvi_log_command_error(AMDVIState *s, hwaddr addr)
 {
-    uint64_t evt[4], info = AMDVI_EVENT_COMMAND_HW_ERROR;
+    uint64_t evt[2];
+    uint16_t info = AMDVI_EVENT_COMMAND_HW_ERROR;
 
     amdvi_encode_event(evt, 0, addr, info);
     amdvi_log_event(s, evt);
@@ -261,7 +265,7 @@ static void amdvi_log_command_error(AMDVIState *s, hwaddr addr)
 static void amdvi_log_illegalcom_error(AMDVIState *s, uint16_t info,
                                        hwaddr addr)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_ILLEGAL_COMMAND_ERROR;
     amdvi_encode_event(evt, 0, addr, info);
@@ -276,7 +280,7 @@ static void amdvi_log_illegalcom_error(AMDVIState *s, uint16_t info,
 static void amdvi_log_illegaldevtab_error(AMDVIState *s, uint16_t devid,
                                           hwaddr addr, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_ILLEGAL_DEVTAB_ENTRY;
     amdvi_encode_event(evt, devid, addr, info);
@@ -288,7 +292,7 @@ static void amdvi_log_illegaldevtab_error(AMDVIState *s, uint16_t devid,
 static void amdvi_log_pagetab_error(AMDVIState *s, uint16_t devid,
                                     hwaddr addr, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_PAGE_TAB_HW_ERROR;
     amdvi_encode_event(evt, devid, addr, info);
-- 
2.35.1


