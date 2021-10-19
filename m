Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4A5433879
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:34:25 +0200 (CEST)
Received: from localhost ([::1]:34474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqC8-0000nf-N7
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpzJ-0000W6-Uh; Tue, 19 Oct 2021 10:21:09 -0400
Received: from mail-dm6nam12on2074.outbound.protection.outlook.com
 ([40.107.243.74]:30304 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpzH-00007t-VX; Tue, 19 Oct 2021 10:21:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1rRRA7HhRWQbQ0C4B0HGdY9SI3uR8Ak/5ztSm71AKLOX7++vwj3Gs4GXHExKaxREk+g3bgFH+jXZxLaBfr8j5WmSojcjQ1iu1aTexivdMBDKiUsKmRwc7/eLYZkvhI52oYrxd+kp37T7E/J4IQuVaA08UW+t39uEEauLAAZVCEsIS9mFbjxeenXUAZ8agnEjOEpC1VT/GySIxogMVGehkCiXlNezZ3X1yARdx1IIdZb2Vr8zsxj2Y4Ny/0fGYxU5QnADgXqiHMRpbHrpEBfE12inAcRWO3A83678bcVNhRQotPIO9WtopqqUqQVMkMCI7EWTjRBb+IVD7g3hBD6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPHuPyhOL+1rptkqXujKFWLoNcReUCPL/TH+vw3w1lU=;
 b=K9hCCHlUgOUIxjQrgdvHb62Vaw1yQgAkECq4xNV/wIzmgfU+c0ZUketeTZ5vHrKD6TnRxXqzfDzA6FOdpX8fpGfZ2qnIOgaIp76xrlA6bvzQaaKvV5tAOlx7Tj/NamxYdUivRD/JgnNNsJeKa596G8RJITNKPhINdpvF80iEWE/DqT2evnUhvWkrxriFdKuB29xjLtW1wBwFq3oa4whsGtNbw977m9ZiyfPYq4I49lb+83PxVpr43gMTohMBZMKZIE24nGjhYGB1uqLMVgILToVi9aKfq/OyUeyo+0qGwB4VV5gnURKj9OBUnuBRfAIIs/vnqsi0EdWmwcwm9srdaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPHuPyhOL+1rptkqXujKFWLoNcReUCPL/TH+vw3w1lU=;
 b=1WAs9TdyF5g5MOQ5sRfE+TZ1TBj7qHX3qIBg4fq+kA1ccZ87932jkeoPLWpzUZnpQj+scaQAb8ZMNAA3PvzxKvdX+KDxAkOc8CM+lh99EO9C7dLJwMXmMn9mTIe0joUjV9TevVlDzJUboRHgoijoJ5Er9zs41UU2vZfJbLR72QU=
Received: from DM5PR19CA0030.namprd19.prod.outlook.com (2603:10b6:3:9a::16) by
 DM6PR12MB4339.namprd12.prod.outlook.com (2603:10b6:5:2af::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 14:21:03 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:9a:cafe::6c) by DM5PR19CA0030.outlook.office365.com
 (2603:10b6:3:9a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:21:03 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:21:02 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Alexander Bulekov <alxndr@bu.edu>, Richard Henderson
 <richard.henderson@linaro.org>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH 26/64] hw/pci-host/q35: Ignore write of reserved PCIEXBAR
 LENGTH field
Date: Tue, 19 Oct 2021 09:09:06 -0500
Message-ID: <20211019140944.152419-27-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 127d0520-4e94-4318-8f50-08d9930baeca
X-MS-TrafficTypeDiagnostic: DM6PR12MB4339:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4339C3AD5E248F4B7E11E5BF95BD9@DM6PR12MB4339.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:197;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5MiBg5i7OPgyZhw5CGthQ/JkCT6z9l9HERzpPoo6gxDoP1uI51yLdT/jbR/RjV4n3/tIAl95f4sRlKxH260ZrAy9EDTYpkKr3pkWY4O1OSNGFY9sFDi88Bgdtq97SfsOBKvwTlBP6aKSRWIo9C6zWc4kXHFzNNa77oAazL2XES2Rq8HTS3nJXQkFAuKuN7LA8Uw7t1MkhPctYF87wWG+fevfIYvA5IChSfSNh39IYvQn7lmUt6j5zBWQ7jbzMTO15fGHUxmGUXVdKprrPyaM3MHEaTV+jBwQihnzVbs4TivsUMDi7mlOwzij1FbSfxxS+dOBiB1A2AaKaW3Rm/P3aMLT3MaKNofiY+MRDM7qWDDnPdN3HVFk9GEflQ/vdAZsQmmduhdrFHwGymiev8Xlasl0M20RdZ1n1kp5iQwLTkZFNWeNmvcBr9PCnI+gn2Afkeob8kjNGmsE5hYbYsp34SnPMXattrNWfXa2fGxT3DggoaBRvwV0Cn3DLOPAPhFjY6NxWlOUCXU7Z1vdZpFJs6iL4AGFpOVgfxZBjBD9PB1PAGASOawMCMssjapzD4UE0CgfgSG9PfBefw59n6i5XSgDIQiSNbXzrI2G4Ls4droLtJ8qRe6qTR0wArzNy0xuUC4IFQE1aqnE5WBkRCE0eUnGfC8qDvUQqNmulV9EK3CBkhD2PHWsSWHzyoTBlUyadkzssqOTDSffKpWMwlZCVlJ527QDFOvsQ8Ph990afqxdTtIGioCDvIllzi7xKnijTVMgxoec3DhANldKj6FYr/G2+6L7u9lbItVKZW0fd9EV3U2UYX4ykEFfDDF9beeS
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(336012)(508600001)(356005)(1076003)(47076005)(16526019)(6916009)(966005)(2616005)(81166007)(36756003)(4326008)(86362001)(82310400003)(316002)(83380400001)(36860700001)(54906003)(70586007)(5660300002)(186003)(8936002)(426003)(70206006)(26005)(8676002)(44832011)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:21:03.5310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 127d0520-4e94-4318-8f50-08d9930baeca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4339
Received-SPF: softfail client-ip=40.107.243.74;
 envelope-from=Michael.Roth@amd.com;
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

libFuzzer triggered the following assertion:

  cat << EOF | qemu-system-i386 -M pc-q35-5.0 \
    -nographic -monitor none -serial none \
    -qtest stdio -d guest_errors -trace pci\*
  outl 0xcf8 0xf2000060
  outl 0xcfc 0x8400056e
  EOF
  pci_cfg_write mch 00:0 @0x60 <- 0x8400056e
  Aborted (core dumped)

This is because guest wrote MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD
(reserved value) to the PCIE XBAR register.

There is no indication on the datasheet about what occurs when
this value is written. Simply ignore it on QEMU (and report an
guest error):

  pci_cfg_write mch 00:0 @0x60 <- 0x8400056e
  Q35: Reserved PCIEXBAR LENGTH
  pci_cfg_read mch 00:0 @0x0 -> 0x8086
  pci_cfg_read mch 00:0 @0x0 -> 0x29c08086
  ...

Cc: qemu-stable@nongnu.org
Reported-by: Alexander Bulekov <alxndr@bu.edu>
BugLink: https://bugs.launchpad.net/qemu/+bug/1878641
Fixes: df2d8b3ed4 ("q35: Introduce q35 pc based chipset emulator")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210526142438.281477-1-f4bug@amsat.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 9b0ca75e0196a72523232063db1e07ae36a5077a)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/pci-host/q35.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 2eb729dff5..0f37cf056a 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -29,6 +29,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/i386/pc.h"
 #include "hw/pci-host/q35.h"
 #include "hw/qdev-properties.h"
@@ -318,6 +319,8 @@ static void mch_update_pciexbar(MCHPCIState *mch)
         addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
         break;
     case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD:
+        qemu_log_mask(LOG_GUEST_ERROR, "Q35: Reserved PCIEXBAR LENGTH\n");
+        return;
     default:
         abort();
     }
-- 
2.25.1


