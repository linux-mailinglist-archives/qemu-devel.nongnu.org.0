Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA13211E2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:21:39 +0100 (CET)
Received: from localhost ([::1]:51936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6TK-0002B8-I2
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OM-0004yI-0h; Mon, 22 Feb 2021 03:16:30 -0500
Received: from mail-dm6nam11on2077.outbound.protection.outlook.com
 ([40.107.223.77]:21217 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OJ-0001s8-PW; Mon, 22 Feb 2021 03:16:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVcto/r7kHU94oUb+jTRAYzpDL0NnUSUolu3+8mr6rjd8Y6wQBYYjmkYLUrQtJG99H2rbVAOP8HFj0q1VfBazy8EhHOy9BItC+RXsRue6tRXFYzvUWclxmUZ24knH9ar3etQUex24jPmd0tO/yxKd4eH/absr2TySFQC+osB/ElncCFeaafonVH4bh/SUhNdSuh6wxM4ohowpFC0Hc2K0otjbX6dFpFeLGgKOk5CHoRHwFg4Udnub/zpXNlG3InLCVRJ8PAhTS5AXHjSZjHfBxnxzEq6nxYB6R4RGLAh+zb4FWCw3FIGD9mSY6Y2xwly6sV07H1EwT9nkhXyAC3CQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMjKasmr2ykH5giV9bXHm41p3CKzSUG7LOw8eO4rVcI=;
 b=X+mf4T75mYkaUN7bPFY2xvqVNB0XpBnXO75C/SaT4HV6ZAA/tSqqpMZ15xt/HE3ADn17VaqN9FfmsMwhPkahiXGWR2hY7qj95osSsYWXWArkErim3SZO2FXJy3+A4MSQx9hIXY5efo7+EK9AkC0MqYyy/57utzkEOpEFv9Oluq+/zg0jEY0oDs/T5YG2t03k5Kr2NoyT4gp/uMhfoAhkclCe4sHKW/pucxAWvxFBUYvpwXFLNV4cGlYtk68HQVEHdRQkha4j8vxhSH1h7LuDZ1/XjPJhjjUXyaGonbtq7NKG7RYepU+JkRx6PuECaaSiHOpdM9TirMi8aCJHqasYUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMjKasmr2ykH5giV9bXHm41p3CKzSUG7LOw8eO4rVcI=;
 b=BzHMzNReODrB4FgVCT8cnzceEvOsOvJzXz4v9mgHTOE/cJX4HjI4BlaTgComlPjVqUnkDgAdfJd7sEvyt1PkCws4sQRVKPhCqVbyCKWdMlxl04fFBYsT7mEN53/TP8Dm7P3G2NSwBjsGaPPJ9YoFSFnh6l7HnYSzv9lda1AyBPY=
Received: from DS7PR03CA0268.namprd03.prod.outlook.com (2603:10b6:5:3b3::33)
 by DM5PR02MB3194.namprd02.prod.outlook.com (2603:10b6:4:6a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Mon, 22 Feb
 2021 08:16:23 +0000
Received: from CY1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::ca) by DS7PR03CA0268.outlook.office365.com
 (2603:10b6:5:3b3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT053.mail.protection.outlook.com (10.152.74.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:23 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:01 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:01 -0800
Received: from [10.140.6.35] (port=59056 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nt-0004NG-3T; Mon, 22 Feb 2021 00:16:01 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 425D413C0AE6; Mon, 22 Feb 2021 13:50:58 +0530 (IST)
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
Subject: [PATCH v2 20/22] arm: xlnx-versal: Add emmc to versal
Date: Mon, 22 Feb 2021 13:50:37 +0530
Message-ID: <1613982039-13861-21-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4d3e4a4-a352-4bfc-fd82-08d8d70a249b
X-MS-TrafficTypeDiagnostic: DM5PR02MB3194:
X-Microsoft-Antispam-PRVS: <DM5PR02MB3194349B62C3ED31B1698BA4CA819@DM5PR02MB3194.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZAMHTdTf7C477V+IQeuA6ddMRa4Xvt5ukPOvEub2SWVcAxjbZtSRKOxNWCxSjcXkfL+vUuDPnZIIhu3VC3OfTurDWH3kXWG79FZfG2ymXhTrqFzUjRTWbmOLFCMzHdc3ZEeZQJbGangNNvybh9L1MTSza399QkYnNty4U+qnp4X9f6Boryk0TCGq11t2mtj6//l5ZWfS/x5JgO+8xxOWMaFsPvcIAUKGL9G4ndKwGGQwQw5fnHRhsMDHdaSZdeeErBH4cH7oLnE34OcklMX8xdT67rHmIFbGSECXsN8wor5ftBGZiOOrAG85dDEztmnqselyozVIcMpAlo5otEym+3o0MrvbY8u12QcHoqhWmXlEOe7T3v+rah5RjPs8se8w6HE0nr6KfJtyiW9ArBnE9TqDleVeFcuJYNXVpFFLvuDICFw4yfyhDfaqkNWm64wFc/wB2itD1hLR5NyHQ45yg3BBmgViITkDHRlSBt322RAvS5azWhT1h7RfNkLwL2GF/tuqkzWLmctUIS8bXCjFRVOXYOJjOWEx7jlQ92kxDQU89timJzkajpO3Axh4DbZqEKKX5ONhuYE7wjvcK4wfOU37T6QwzxOaEbgWjSiN9i+JzjMby/B5O1etNA0EQ5bHfgDhfucyBI3YoLzapbXLVuBF8lmuBnsmbj7B/yS331clyxuQLhbQ3H3dJoHNWbxXzNHPiPAgLl12+VFNLn56pQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(396003)(376002)(136003)(36840700001)(46966006)(186003)(6666004)(54906003)(7636003)(110136005)(6266002)(921005)(356005)(5660300002)(82740400003)(83380400001)(36860700001)(70586007)(42186006)(2616005)(336012)(82310400003)(8936002)(7416002)(2906002)(70206006)(107886003)(4326008)(478600001)(26005)(426003)(316002)(36756003)(36906005)(8676002)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:23.5963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d3e4a4-a352-4bfc-fd82-08d8d70a249b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3194
Received-SPF: pass client-ip=40.107.223.77; envelope-from=saipava@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
 include/hw/arm/xlnx-versal.h |  1 +
 hw/arm/xlnx-versal-virt.c    | 30 +++++++++++++++++++++++++-----
 hw/arm/xlnx-versal.c         | 13 +++++++++++--
 3 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 2b76885..440f3b4 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -76,6 +76,7 @@ struct Versal {
     struct {
         MemoryRegion *mr_ddr;
         uint32_t psci_conduit;
+        bool has_emmc;
     } cfg;
 };
 
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 8482cd6..273e0c7 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -46,6 +46,7 @@ struct VersalVirt {
 
     struct {
         bool secure;
+        bool has_emmc;
     } cfg;
 };
 
@@ -333,6 +334,13 @@ static void fdt_add_sd_nodes(VersalVirt *s)
         qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
                                      2, addr, 2, MM_PMC_SD0_SIZE);
         qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+        /*
+         * eMMC specific properties
+         */
+        if (s->cfg.has_emmc && i == 0) {
+            qemu_fdt_setprop(s->fdt, name, "non-removable", NULL, 0);
+            qemu_fdt_setprop_sized_cells(s->fdt, name, "bus-width", 1, 8);
+        }
         g_free(name);
     }
 }
@@ -512,7 +520,7 @@ static void create_virtio_regions(VersalVirt *s)
     }
 }
 
-static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
+static void sd_plugin_card(SDHCIState *sd, DriveInfo *di, bool emmc)
 {
     BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
     DeviceState *card;
@@ -520,15 +528,22 @@ static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
     card = qdev_new(TYPE_SD_CARD);
     object_property_add_child(OBJECT(sd), "card[*]", OBJECT(card));
     qdev_prop_set_drive_err(card, "drive", blk, &error_fatal);
+    object_property_set_bool(OBJECT(card), "emmc", emmc, &error_fatal);
     qdev_realize_and_unref(card, qdev_get_child_bus(DEVICE(sd), "sd-bus"),
                            &error_fatal);
 }
 
+static void versal_virt_set_emmc(Object *obj, bool value, Error **errp)
+{
+    VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(obj);
+
+    s->cfg.has_emmc = value;
+}
+
 static void versal_virt_init(MachineState *machine)
 {
     VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(machine);
     int psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
-    int i;
 
     /*
      * If the user provides an Operating System to be loaded, we expect them
@@ -560,6 +575,8 @@ static void versal_virt_init(MachineState *machine)
                              &error_abort);
     object_property_set_int(OBJECT(&s->soc), "psci-conduit", psci_conduit,
                             &error_abort);
+    object_property_set_bool(OBJECT(&s->soc), "has-emmc", s->cfg.has_emmc,
+                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
 
     fdt_create(s);
@@ -581,10 +598,10 @@ static void versal_virt_init(MachineState *machine)
     memory_region_add_subregion_overlap(get_system_memory(),
                                         0, &s->soc.fpd.apu.mr, 0);
 
+    sd_plugin_card(&s->soc.pmc.iou.sd[0],
+        drive_get_next(s->cfg.has_emmc ? IF_EMMC : IF_SD), s->cfg.has_emmc);
     /* Plugin SD cards.  */
-    for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
-        sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
-    }
+    sd_plugin_card(&s->soc.pmc.iou.sd[1], drive_get_next(IF_SD), false);
 
     s->binfo.ram_size = machine->ram_size;
     s->binfo.loader_start = 0x0;
@@ -621,6 +638,9 @@ static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpus = XLNX_VERSAL_NR_ACPUS;
     mc->no_cdrom = true;
     mc->default_ram_id = "ddr";
+    object_class_property_add_bool(oc, "emmc",
+        NULL, versal_virt_set_emmc);
+
 }
 
 static const TypeInfo versal_virt_machine_init_typeinfo = {
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 628e77e..67ed1af 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -230,6 +230,9 @@ static void versal_create_admas(Versal *s, qemu_irq *pic)
 }
 
 #define SDHCI_CAPABILITIES  0x280737ec6481 /* Same as on ZynqMP.  */
+#define SDHCI_EMMC_CAPS ((SDHCI_CAPABILITIES & ~(3 << 30)) | \
+                     (1 << 30))
+
 static void versal_create_sds(Versal *s, qemu_irq *pic)
 {
     int i;
@@ -244,9 +247,14 @@ static void versal_create_sds(Versal *s, qemu_irq *pic)
 
         object_property_set_uint(OBJECT(dev), "sd-spec-version", 3,
                                  &error_fatal);
-        object_property_set_uint(OBJECT(dev), "capareg", SDHCI_CAPABILITIES,
+        object_property_set_uint(OBJECT(dev), "capareg", SDHCI_EMMC_CAPS,
                                  &error_fatal);
-        object_property_set_uint(OBJECT(dev), "uhs", UHS_I, &error_fatal);
+        /*
+         * UHS is not applicable for eMMC
+         */
+        if (!s->cfg.has_emmc || i == 1) {
+            object_property_set_uint(OBJECT(dev), "uhs", UHS_I, &error_fatal);
+        }
         sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
 
         mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
@@ -386,6 +394,7 @@ static Property versal_properties[] = {
     DEFINE_PROP_LINK("ddr", Versal, cfg.mr_ddr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("psci-conduit", Versal, cfg.psci_conduit, 0),
+    DEFINE_PROP_BOOL("has-emmc", Versal, cfg.has_emmc, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.7.4


