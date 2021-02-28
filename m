Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0F6327434
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:41:30 +0100 (CET)
Received: from localhost ([::1]:39238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRwX-0006co-EC
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:41:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRlD-0000Lr-OG; Sun, 28 Feb 2021 14:29:47 -0500
Received: from mail-dm6nam12on2050.outbound.protection.outlook.com
 ([40.107.243.50]:5633 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl5-0003FQ-0E; Sun, 28 Feb 2021 14:29:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2CO8O5XBW3gw/UsbjB0V8Pi4hyatuwXew2xk3cPxPf8YrMdzcN+0AX/ZzvQhY21dSh1ADWvdb+AIjkedrQJb6Ce296yhVRBZ3s1iU4Sse7wquMhrgZMNb7JS4I9Wrujm8/9Lmnq12YMcEtwspnmcm6JwYBmnbrYUR4EqNRMqoC/IxJ0ErsYzHstEnhvC/8CI53ocENosIrYhpespy4JdMLntiiakqe7OF9hknAeu292UfbJc+iPFGLl5+L1F0bq8s7E31seu4+5mEfkaXWU8mSVhu3WuPdirfxWXiwiBCmpqjPikHFTzgU00OqtiuGNmYFA360XdGi96R7yZoUQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26Ynk5b8zIUW8+RGoW5k1ZHeHD1bLhu9coPmF+7Jjcc=;
 b=YKZwE35RHC8Nb00oo5kV6RNpmwWl0jUfddJoG4bSUpz6oAXXhMA5riJHKsKcNa3EINcZ7gpLkJu+CAjo1aOu6WjpoNPVleZfY2EyBBE2MbZB7zvPf6CSrik523/C2VcG6fbNPr464VnggQIhr/0vCuN1sDw4v7ZuhCITlwtRv2rA9kPI04LHraLRpO4YKCUYo3omVGb8D8kcYeMWp5qolN0DjLGkHibmXe0mv25kIhQhTQ40N5eRwCkE1WjfNXTw4QkvgyYjS3v/EzNfrN/gxzibh/wQJ6/16joo56CEjCsz/TwxptkiPbRj382OlWZ2iAjaafGrmk2u2zzSg3MSxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26Ynk5b8zIUW8+RGoW5k1ZHeHD1bLhu9coPmF+7Jjcc=;
 b=QuuZa51nkuDZqegRx+72udkjaY1CmKD0mXmRZg56kCqvjyIr73fZ6XmYE5oGqyn7ukI8GpxhMJoETwabSn5Hx8b0wRQ/R+jUFf8rQ02a+3RYNokVaGE/MNHNw5pBst/LQC2N+wrx+Wkm0MMDBuGhL9f0t7gkyjrnap7FuNKSeBI=
Received: from DM6PR08CA0056.namprd08.prod.outlook.com (2603:10b6:5:1e0::30)
 by MW4PR02MB7233.namprd02.prod.outlook.com (2603:10b6:303:65::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Sun, 28 Feb
 2021 19:29:35 +0000
Received: from CY1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::ba) by DM6PR08CA0056.outlook.office365.com
 (2603:10b6:5:1e0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT003.mail.protection.outlook.com (10.152.74.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:34 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:19 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:19 -0800
Received: from [10.140.6.35] (port=57786 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkk-0003Md-HY; Sun, 28 Feb 2021 11:29:18 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id D66D413C0AFA; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 19/21] arm: xlnx-versal: Add emmc to versal
Date: Mon, 1 Mar 2021 01:03:25 +0530
Message-ID: <1614540807-30686-20-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb7df4f3-9986-4878-2031-08d8dc1f2e1d
X-MS-TrafficTypeDiagnostic: MW4PR02MB7233:
X-Microsoft-Antispam-PRVS: <MW4PR02MB72339F4BC485A4BC02857DE3CA9B9@MW4PR02MB7233.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uH0TRR+ral6tkf0eqFpCdia5BuVs4rY0qrmOXORqxgp9KJAW/qVzwsJSCHf2k/c/ow9tAuf6DVHnbpnNOphfvHv25/58zLALK8aYte3/+XkWEJ8JYxbm5vLN5T81zme16cCjcqT/dgyWj+XWorfsWWV+lhrFukHvMDWBwi02bckyz7dBSOGRtl4i3lpzQnx30hcJKv6mj8efzx7eLzi4El/hW4RqKepQMmh7rDlP1gARk52ftsmrYOZB6bo7msIZ7mtWTGs/V98r63el9ZffIXMWqYkEDW4mRsPn6hL0J9EzqPiks2qZOzyFTsWRCcFpeVB685kj8HbpP9jw7fvOlmwqTdkJnJPOml4++UpCGhWcr1Z4Xjf94N73PB4/+o28z0ECParx6q20pOG8x+bi47NPK0GwURg0F0FUOijV3OQmSV3YFRpVo9ECXGzCOGBxUUqBcTwg6bEfQhZQpQelRg+fmwruP1tM26/z6p8yN6UkPwuZUL+kRZvUIldprf10Kw3ZdJVlGvTXU4ie+PEVWOrqLuicJ77f0HAgtDlWCPF6PXyF3KL53GstvJ/EvWzPzU9NYszWraBhnLqf7ZvYaa5BalLFDaqMUEJuOi7tisLl9D29j1R1WJw6FClfVfinUsvhafVmiWD3uXpaP8AgbkST4fTInsrvqBr6RQ54v1wzKx/Ey5y/a4Rfb/wnM7nHKXAv8xLAWyqwD3qTd7Udrw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39850400004)(376002)(46966006)(36840700001)(186003)(5660300002)(36756003)(8676002)(8936002)(2906002)(36860700001)(26005)(107886003)(6666004)(82310400003)(6266002)(4326008)(83380400001)(47076005)(54906003)(426003)(110136005)(36906005)(42186006)(316002)(478600001)(82740400003)(7636003)(921005)(70206006)(356005)(2616005)(336012)(70586007)(7416002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:34.8053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7df4f3-9986-4878-2031-08d8dc1f2e1d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7233
Received-SPF: pass client-ip=40.107.243.50; envelope-from=saipava@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
 hw/arm/xlnx-versal-virt.c    | 29 +++++++++++++++++++++++++----
 hw/arm/xlnx-versal.c         | 14 ++++++++++++--
 3 files changed, 38 insertions(+), 6 deletions(-)

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
index 8482cd6..053a322 100644
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
@@ -524,11 +532,17 @@ static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
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
@@ -560,6 +574,8 @@ static void versal_virt_init(MachineState *machine)
                              &error_abort);
     object_property_set_int(OBJECT(&s->soc), "psci-conduit", psci_conduit,
                             &error_abort);
+    object_property_set_bool(OBJECT(&s->soc), "has-emmc", s->cfg.has_emmc,
+                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
 
     fdt_create(s);
@@ -581,10 +597,12 @@ static void versal_virt_init(MachineState *machine)
     memory_region_add_subregion_overlap(get_system_memory(),
                                         0, &s->soc.fpd.apu.mr, 0);
 
-    /* Plugin SD cards.  */
-    for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
-        sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
+    if (!s->cfg.has_emmc) {
+        sd_plugin_card(&s->soc.pmc.iou.sd[0],
+            drive_get_next(IF_SD));
     }
+    /* Plugin SD cards.  */
+    sd_plugin_card(&s->soc.pmc.iou.sd[1], drive_get_next(IF_SD));
 
     s->binfo.ram_size = machine->ram_size;
     s->binfo.loader_start = 0x0;
@@ -621,6 +639,9 @@ static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpus = XLNX_VERSAL_NR_ACPUS;
     mc->no_cdrom = true;
     mc->default_ram_id = "ddr";
+    object_class_property_add_bool(oc, "emmc",
+        NULL, versal_virt_set_emmc);
+
 }
 
 static const TypeInfo versal_virt_machine_init_typeinfo = {
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 628e77e..6ca2c8f 100644
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
@@ -242,11 +245,17 @@ static void versal_create_sds(Versal *s, qemu_irq *pic)
                                 TYPE_SYSBUS_SDHCI);
         dev = DEVICE(&s->pmc.iou.sd[i]);
 
+        dev->id = g_strdup_printf("sdhci%d", i);
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
@@ -386,6 +395,7 @@ static Property versal_properties[] = {
     DEFINE_PROP_LINK("ddr", Versal, cfg.mr_ddr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("psci-conduit", Versal, cfg.psci_conduit, 0),
+    DEFINE_PROP_BOOL("has-emmc", Versal, cfg.has_emmc, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.7.4


