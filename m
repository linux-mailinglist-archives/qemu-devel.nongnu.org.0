Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D8C318663
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:37:42 +0100 (CET)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7Tp-0007Jp-K6
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76Q-00033H-Cp; Thu, 11 Feb 2021 03:13:30 -0500
Received: from mail-bn7nam10on2067.outbound.protection.outlook.com
 ([40.107.92.67]:36963 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76N-0004hQ-8R; Thu, 11 Feb 2021 03:13:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHXdG96LjxNIvFOX0vy5Bh0z+Oh/8/urQ/F9mEYy6r0zCaUIZd3gf0VEeHfD/xiXIowFIiBjfliIHI8Lx6r6FTCiD+eifTAMdgiyh0fUqAb7zzJD+iCmc8A/ABJdzsnqSYGhyAGIW1weRgsqoUP44dibBCPmdwiWr6iDy7Wx5GSQanWSZr9n8yfSbprhNhFMuSOWWVycq/zt28X1fZLPtLmvrHWMxZ1MII71YAVku7Khjs/1ChzsEw0CdASy54PnU1u7KkSl79TnKObFr+rdtMW1RmMq9SXeZXzHgt3/fTUPTHtzwUdekLEp/VuMSRZzbAh8jFq2EAOTHrji9lIYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cun2MBT2kdQVFs0ptFeEVksMmQ5I1SLRtIMvocuE3eI=;
 b=ErTdG4Y8R9ohzdf3uqT86nIVv5b0fNrt9ihRNGC37pLap7RnkAfW7L+1gr4IpIR4HKmDWordETfaiA1nSGUIU0fA8jsKKKcb5+wu7ev3/6SAFci80eVogg0gkBUyUE2CvQh67W0WlMEcSVzrRV7xBp2sdXYQkGy/LZlL9rWpHNtUeuXTBVLupGZ34Indf36cklx1l+4mFMG8zOhPhl1DproFyktZikKpJx4kru/DepqFkldJyMQo8YJvPt1M9gpP3s6/Vag7H6LvaqxaL0xHOyWou57SCqBYdom8sY9ZRBEl0fq+7pWV9oDmX6TQ/i1PRfRhstu4jdKX9qA2qNTGaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cun2MBT2kdQVFs0ptFeEVksMmQ5I1SLRtIMvocuE3eI=;
 b=j6LJzx8PzJKVRTqKVb2TDCqCA3OQpXlGWfhIzNvO3hMMve6X3b1hl0xEnp8B6rdVgnHe/X2ZOtWJSq7vo5orIGkviGibWrCFNFjPnPQ30BafSu3A2d53Y50S6ViratPCkD/noKHy/NqvZpt/KHiCI/Aa0L3IjUoZTt29OUsf3Ss=
Received: from BL0PR0102CA0023.prod.exchangelabs.com (2603:10b6:207:18::36) by
 BY5PR02MB6486.namprd02.prod.outlook.com (2603:10b6:a03:1d6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25; Thu, 11 Feb 2021 08:13:19 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:207:18:cafe::57) by BL0PR0102CA0023.outlook.office365.com
 (2603:10b6:207:18::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 08:13:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT034.mail.protection.outlook.com (10.152.77.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:13:19 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:59 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:59 -0800
Received: from [10.140.6.35] (port=49692 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75u-0000Qi-HQ; Thu, 11 Feb 2021 00:12:59 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 1569C13C0653; Thu, 11 Feb 2021 13:48:21 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, "Max
 Reitz" <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, Eric Blake <eblake@redhat.com>, Joel Stanley
 <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Vincent Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Alistair
 Francis" <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>
Subject: [RFC PATCH 15/15] arm: xlnx-versal: Add emmc to versal
Date: Thu, 11 Feb 2021 13:47:26 +0530
Message-ID: <1613031446-22154-16-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a3e72f2-1f98-4aa6-fcf5-08d8ce64e466
X-MS-TrafficTypeDiagnostic: BY5PR02MB6486:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6486B3AA65E3E9FE9D008A96CA8C9@BY5PR02MB6486.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vCsLIJ2umCiheQKGuNoR3bTJtboMILrsdc5ULe/3RV1KtnkbEnvKVzkqbRzr+fpMl+rtkyFMslWMPgHSr/8riS6ycH5X1th1sAfAKEu5fhjqPMn7DGkbISpIBj1H1IMzF9CRcDUQM2VNF7bZmtXvGCJnNdzkBc9ZSSh42QzD3hEaAFG0gvZbcNEY+253gkTMmnYDKsip/qsbHLdkfA7Vhz5PZFFZc2GrfnaWtJFiSw/uFCKLJfB+C7tyZ6uk5qqCWDhkNU67pgtkIhL4inZ5b5RdSUFvV9+qm6pxd901rTSG2Tk2A2Q8831+KPIpZKPcM5jovHCHHW2CXq/yfOFlQjhJbtaXZB4wsmPrPX/ZKeU2TS8S1Vve8rCypERoAOpWIbrc4kj5MfyHJRRrWYRY/UIWwObwPcEnwaip1zTDOROTu42SPq9N7W6/I4+a67Ul8QRxw15nTnVqotiN/ZyHG4eeAW2lrwjzQz9M1VM3buSZBtGagHM6byEJI1KNLnxc/B/EVGFyL6QeLJDeODWKC+kVcW6mpikfm6Q7gvWfI80l2jn4WyX8vEqfiMpfikdoSJAN4BEBfpZ+aJ2nt3QKtPt9WczPeMnZroWmbsDu9F0+pWma6Z/n4xpZKJ6LCO3fVK/LG0mrCjZClR/pMAO0A78511wc5kC0RMiKrmSldxlnDeKMSNWDOPvD+sVMeZc6sSfsvOsiaPpUWxLiuwGnCQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(36840700001)(46966006)(5660300002)(107886003)(7636003)(82310400003)(2906002)(2616005)(36756003)(70586007)(70206006)(336012)(82740400003)(83380400001)(426003)(36860700001)(4326008)(186003)(8676002)(6266002)(26005)(54906003)(36906005)(921005)(110136005)(316002)(8936002)(42186006)(47076005)(478600001)(356005)(7416002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:13:19.5521 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3e72f2-1f98-4aa6-fcf5-08d8ce64e466
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6486
Received-SPF: pass client-ip=40.107.92.67; envelope-from=saipava@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Configuring SDHCI-0 to act as eMMC controller.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c | 16 +++++++++++-----
 hw/arm/xlnx-versal.c      | 14 ++++++++++++--
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 8482cd6..18489e4 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -333,6 +333,13 @@ static void fdt_add_sd_nodes(VersalVirt *s)
         qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
                                      2, addr, 2, MM_PMC_SD0_SIZE);
         qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+        /*
+         * eMMC specific properties
+         */
+        if (i == 0) {
+            qemu_fdt_setprop(s->fdt, name, "non-removable", NULL, 0);
+            qemu_fdt_setprop_sized_cells(s->fdt, name, "bus-width", 1, 8);
+        }
         g_free(name);
     }
 }
@@ -512,7 +519,7 @@ static void create_virtio_regions(VersalVirt *s)
     }
 }
 
-static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
+static void sd_plugin_card(SDHCIState *sd, DriveInfo *di, bool emmc)
 {
     BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
     DeviceState *card;
@@ -520,6 +527,7 @@ static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
     card = qdev_new(TYPE_SD_CARD);
     object_property_add_child(OBJECT(sd), "card[*]", OBJECT(card));
     qdev_prop_set_drive_err(card, "drive", blk, &error_fatal);
+    object_property_set_bool(OBJECT(card), "emmc", emmc, &error_fatal);
     qdev_realize_and_unref(card, qdev_get_child_bus(DEVICE(sd), "sd-bus"),
                            &error_fatal);
 }
@@ -528,7 +536,6 @@ static void versal_virt_init(MachineState *machine)
 {
     VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(machine);
     int psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
-    int i;
 
     /*
      * If the user provides an Operating System to be loaded, we expect them
@@ -581,10 +588,9 @@ static void versal_virt_init(MachineState *machine)
     memory_region_add_subregion_overlap(get_system_memory(),
                                         0, &s->soc.fpd.apu.mr, 0);
 
+    sd_plugin_card(&s->soc.pmc.iou.sd[0], drive_get_next(IF_EMMC), true);
     /* Plugin SD cards.  */
-    for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
-        sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
-    }
+    sd_plugin_card(&s->soc.pmc.iou.sd[1], drive_get_next(IF_SD), false);
 
     s->binfo.ram_size = machine->ram_size;
     s->binfo.loader_start = 0x0;
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index b077716..3498dd9 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -230,9 +230,14 @@ static void versal_create_admas(Versal *s, qemu_irq *pic)
 }
 
 #define SDHCI_CAPABILITIES  0x280737ec6481 /* Same as on ZynqMP.  */
+#define SDHCI0_CAPS ((SDHCI_CAPABILITIES & ~(3 << 30)) | \
+                     (1 << 30))
+#define SDHCI1_CAPS SDHCI_CAPABILITIES
+
 static void versal_create_sds(Versal *s, qemu_irq *pic)
 {
     int i;
+    uint64_t caps[] = {SDHCI0_CAPS, SDHCI1_CAPS};
 
     for (i = 0; i < ARRAY_SIZE(s->pmc.iou.sd); i++) {
         DeviceState *dev;
@@ -244,9 +249,14 @@ static void versal_create_sds(Versal *s, qemu_irq *pic)
 
         object_property_set_uint(OBJECT(dev), "sd-spec-version", 3,
                                  &error_fatal);
-        object_property_set_uint(OBJECT(dev), "capareg", SDHCI_CAPABILITIES,
+        object_property_set_uint(OBJECT(dev), "capareg", caps[i],
                                  &error_fatal);
-        object_property_set_uint(OBJECT(dev), "uhs", UHS_I, &error_fatal);
+        /*
+         * UHS is not applicable for eMMC
+         */
+        if (i == 1) {
+            object_property_set_uint(OBJECT(dev), "uhs", UHS_I, &error_fatal);
+        }
         sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
 
         mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
-- 
2.7.4


