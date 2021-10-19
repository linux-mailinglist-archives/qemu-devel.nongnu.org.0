Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1C4433A02
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:15:47 +0200 (CEST)
Received: from localhost ([::1]:52216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqqA-0002l8-HX
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq6g-0003U8-AF; Tue, 19 Oct 2021 10:28:46 -0400
Received: from mail-bn7nam10on2088.outbound.protection.outlook.com
 ([40.107.92.88]:13244 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq6c-00052K-Vo; Tue, 19 Oct 2021 10:28:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLHrrYAp3XZO3/d3NRmTGmaVopSwUbfRbKiP9OT+RDU7FB/iBP7pkSdTZ1X4M3OdZjhHFtZb9Wsqq1QyO1wmtxRjaZD5mnuqGDWLr84d/Qlw8fXnk+OqN8os1vXY6k3VP59TNT/3uu0UQJe5F/dBvDGSa83Yty36REtO2m5frp25GyB8rFeKlF+LOgCQhkZzcorT4wZiQGNSbqMFjNhSwH3ecS78OOKo19/zqU2Qoli2cxiV4NGSPfLEgT1iS+3U9RX6tFztm/p+fEpf9aGx/Mk4tEHlxMeEOndI1Q8JBol+9Y1IPHe7J/Dx5/POQO1bIZfKVbB9zCCdwqc4iqfM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4v/xZvSoue/D8NHr6cJOfLOt+Dt7FWF06fCjUXBGGY=;
 b=PWUCa1HsjuWMVnm4xah/ZYs6tgMf3JmOQUF+Ogs/pLg1QE+JlRjPJfpmfJGAa7mH5STdDnN06KHIWSxMbO8XnLgFklhTJAJtPCvLVg8MWJNY/BeKzKuqi7X2YVWISk2ze+bZYC+CSDI8bo00jBxcUo5ihPkqiAxpX4XMwtC5x65YSgV7Rse7hshaExXiLEGtlHAfJlWRUlXmaSR5QtDcSuDfwLHtNSlBtOfDM9E2KUnmJc+b0GJuyiQv3a1uc0rbXYJ7SN280TTjX0mZxuFZxLz2Me8SmAe5VQC2zlHEzdwhwPRQ0Q/9uVuA8/EDqlymTiw2oDd0cFHA2tjHinwzMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4v/xZvSoue/D8NHr6cJOfLOt+Dt7FWF06fCjUXBGGY=;
 b=JN/vDzAyeg2AJPvtHhA6zjJ1vumlKfesBb7tpLzasmrmlycZPzaVmP8ife/EYf+kfGmVFj4gXTu8un6aRIfl1zIA4na7jkSI6K5j1R1xBD07YH7HCewHiKICQ84PNUH1AlPasZVRMURvand527s67pIH5hAC9BaOpd9bbJfkH6w=
Received: from DM5PR13CA0026.namprd13.prod.outlook.com (2603:10b6:3:7b::12) by
 BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:28:39 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::d3) by DM5PR13CA0026.outlook.office365.com
 (2603:10b6:3:7b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Tue, 19 Oct 2021 14:28:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:28:36 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:28:35 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Alexander Bulekov <alxndr@bu.edu>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: [PATCH 44/64] hw/sd/sdcard: Document out-of-range addresses for
 SEND_WRITE_PROT
Date: Tue, 19 Oct 2021 09:09:24 -0500
Message-ID: <20211019140944.152419-45-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5ef2a21f-b5c5-4c53-aac2-08d9930cbc90
X-MS-TrafficTypeDiagnostic: BY5PR12MB4084:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4084CBDA4905C6E764B25F4C95BD9@BY5PR12MB4084.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aPHjgBikjH6ek1ynQIvQ+jq2C0mkZ7TBQAIWpG1CxpuyB3890s4zRPa/C9EY7A76Q+sxnu3yUoX346jy/FnxdoZs9Mox4qTiDMitgnz62f+2otgSyz86uWXkPhoZ38PRAaOHXJ+X4/3oEgTumhupXefa4auEl2PtxruUBbfjjMw6orx3e2h6imjR0IFbcQxly2RoOSAfKJwzFTVcIoXuiGHKnzD8i1U1DGrohOTWni4r/7uL/ZT5Y+DtKVS50LbURdQ5w424JPFPsF3VXnRteHd9NcU7qldz26zPuCMZOPXjZCCoq0d0sFVTT9H+VlgUxnd7y+NOHu984YRhUsSo/HhKrcs7fFaSS06HhxOYG9Z9Ix7tVZjZ2/aL19LyUrYLTQi5U7e3PfYvIIKDgZbI5DExSLlCQmglSitXwhnIhuvOoyeOCcqfxDYn2zBdIXaw0dtPFMl39C9IktzopoRw04chyiscoB2lfnSXcFTzBZjoE1G+0o3vZ5oygnDHLO+eHWpVLSoATvW1M4wA2J+HsqENCEJRzK2LEkBYc6zJJoQHZyhCuxJiWYiVOarfx4LPVtqf4PPoLAYGZI9EjgK+uz4ZrC+22cKNbP3EjML6z30oxTIkKhuBsCTlG5nRNJMEDKZo9XakzEcQDMbNcVOU5zU92ksbuXLGF4r8N+vu5CnJgZtKyq2vGRw0pfBshO8He80jplPutAIPNlmFpi/pVOA04NV+HbWmV/jN/LR1X2E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(1076003)(2616005)(47076005)(26005)(6666004)(8936002)(316002)(8676002)(6916009)(54906003)(70586007)(70206006)(16526019)(186003)(2906002)(508600001)(5660300002)(4326008)(44832011)(36860700001)(82310400003)(36756003)(336012)(356005)(81166007)(86362001)(83380400001)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:28:36.1274 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef2a21f-b5c5-4c53-aac2-08d9930cbc90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084
Received-SPF: softfail client-ip=40.107.92.88;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Per the 'Physical Layer Simplified Specification Version 3.01',
Table 4-22: 'Block Oriented Write Protection Commands'

  SEND_WRITE_PROT (CMD30)

  If the card provides write protection features, this command asks
  the card to send the status of the write protection bits [1].

  [1] 32 write protection bits (representing 32 write protect groups
  starting at the specified address) [...]
  The last (least significant) bit of the protection bits corresponds
  to the first addressed group. If the addresses of the last groups
  are outside the valid range, then the corresponding write protection
  bits shall be set to 0.

Split the if() statement (without changing the behaviour of the code)
to better position the description comment.

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210802235524.3417739-2-f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
(cherry picked from commit 2a0396285daa9483459ec1d3791951300b595e85)
*context dependency for 4ac0b72bae ("hw/sd/sdcard: Fix assertion accessing out-of-range addresses with CMD30")
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/sd/sd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 282d39a704..fa6bb79b15 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -822,7 +822,14 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
 
     for (i = 0; i < 32; i++, wpnum++, addr += WPGROUP_SIZE) {
         assert(wpnum < sd->wpgrps_size);
-        if (addr < sd->size && test_bit(wpnum, sd->wp_groups)) {
+        if (addr >= sd->size) {
+            /*
+             * If the addresses of the last groups are outside the valid range,
+             * then the corresponding write protection bits shall be set to 0.
+             */
+            continue;
+        }
+        if (test_bit(wpnum, sd->wp_groups)) {
             ret |= (1 << i);
         }
     }
-- 
2.25.1


