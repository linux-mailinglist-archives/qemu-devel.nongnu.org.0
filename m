Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097073735AB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:37:54 +0200 (CEST)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leC6T-0000z5-3B
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4b-0007b0-UP
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57706
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4X-000281-RT
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:57 -0400
Received: from host81-154-26-71.range81-154.btcentralplus.com ([81.154.26.71]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4U-0000OI-MI; Wed, 05 May 2021 08:35:51 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  5 May 2021 08:35:34 +0100
Message-Id: <20210505073538.11438-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
References: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.26.71
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 06/10] hw/sparc/sun4m: Move each sun4m_hwdef definition in its
 class_init
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Remove the sun4m_hwdefs[] array by moving assigning the
structure fields directly in each machine class_init()
function.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210503171303.822501-7-f4bug@amsat.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/sparc/sun4m.c | 248 ++++++++++++++++++++++-------------------------
 1 file changed, 118 insertions(+), 130 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 956216591b..263732b904 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1138,9 +1138,22 @@ enum {
     ss600mp_id,
 };
 
-static const struct sun4m_hwdef sun4m_hwdefs[] = {
-    /* SS-5 */
-    {
+static void sun4m_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->init = sun4m_hw_init;
+    mc->block_default_type = IF_SCSI;
+    mc->default_boot_order = "c";
+    mc->default_display = "tcx";
+    mc->default_ram_id = "sun4m.ram";
+}
+
+static void ss5_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef ss5_hwdef = {
         .iommu_base   = 0x10000000,
         .iommu_pad_base = 0x10004000,
         .iommu_pad_len  = 0x0fffb000,
@@ -1165,9 +1178,19 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss5_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-    /* SS-10 */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCstation 5";
+    mc->is_default = true;
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
+    smc->hwdef = &ss5_hwdef;
+}
+
+static void ss10_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef ss10_hwdef = {
         .iommu_base   = 0xfe0000000ULL,
         .tcx_base     = 0xe20000000ULL,
         .slavio_base  = 0xff0000000ULL,
@@ -1190,9 +1213,19 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss10_id,
         .iommu_version = 0x03000000,
         .max_mem = 0xf00000000ULL,
-    },
-    /* SS-600MP */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCstation 10";
+    mc->max_cpus = 4;
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
+    smc->hwdef = &ss10_hwdef;
+}
+
+static void ss600mp_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef ss600mp_hwdef = {
         .iommu_base   = 0xfe0000000ULL,
         .tcx_base     = 0xe20000000ULL,
         .slavio_base  = 0xff0000000ULL,
@@ -1213,9 +1246,19 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss600mp_id,
         .iommu_version = 0x01000000,
         .max_mem = 0xf00000000ULL,
-    },
-    /* SS-20 */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCserver 600MP";
+    mc->max_cpus = 4;
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
+    smc->hwdef = &ss600mp_hwdef;
+}
+
+static void ss20_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef ss20_hwdef = {
         .iommu_base   = 0xfe0000000ULL,
         .tcx_base     = 0xe20000000ULL,
         .slavio_base  = 0xff0000000ULL,
@@ -1254,9 +1297,19 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss20_id,
         .iommu_version = 0x13000000,
         .max_mem = 0xf00000000ULL,
-    },
-    /* Voyager */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCstation 20";
+    mc->max_cpus = 4;
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
+    smc->hwdef = &ss20_hwdef;
+}
+
+static void voyager_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef voyager_hwdef = {
         .iommu_base   = 0x10000000,
         .tcx_base     = 0x50000000,
         .slavio_base  = 0x70000000,
@@ -1277,9 +1330,18 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = vger_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-    /* LX */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCstation Voyager";
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
+    smc->hwdef = &voyager_hwdef;
+}
+
+static void ss_lx_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef ss_lx_hwdef = {
         .iommu_base   = 0x10000000,
         .iommu_pad_base = 0x10004000,
         .iommu_pad_len  = 0x0fffb000,
@@ -1301,9 +1363,18 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = lx_id,
         .iommu_version = 0x04000000,
         .max_mem = 0x10000000,
-    },
-    /* SS-4 */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCstation LX";
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
+    smc->hwdef = &ss_lx_hwdef;
+}
+
+static void ss4_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef ss4_hwdef = {
         .iommu_base   = 0x10000000,
         .tcx_base     = 0x50000000,
         .cs_base      = 0x6c000000,
@@ -1325,9 +1396,18 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss4_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-    /* SPARCClassic */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCstation 4";
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
+    smc->hwdef = &ss4_hwdef;
+}
+
+static void scls_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef scls_hwdef = {
         .iommu_base   = 0x10000000,
         .tcx_base     = 0x50000000,
         .slavio_base  = 0x70000000,
@@ -1348,9 +1428,18 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = scls_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-    /* SPARCbook */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCClassic";
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
+    smc->hwdef = &scls_hwdef;
+}
+
+static void sbook_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef sbook_hwdef = {
         .iommu_base   = 0x10000000,
         .tcx_base     = 0x50000000, /* XXX */
         .slavio_base  = 0x70000000,
@@ -1371,112 +1460,11 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = sbook_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-};
-
-static void sun4m_machine_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-
-    mc->init = sun4m_hw_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
-}
-
-static void ss5_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCstation 5";
-    mc->is_default = true;
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    smc->hwdef = &sun4m_hwdefs[0];
-}
-
-static void ss10_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCstation 10";
-    mc->max_cpus = 4;
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    smc->hwdef = &sun4m_hwdefs[1];
-}
-
-static void ss600mp_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCserver 600MP";
-    mc->max_cpus = 4;
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    smc->hwdef = &sun4m_hwdefs[2];
-}
-
-static void ss20_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCstation 20";
-    mc->max_cpus = 4;
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    smc->hwdef = &sun4m_hwdefs[3];
-}
-
-static void voyager_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCstation Voyager";
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    smc->hwdef = &sun4m_hwdefs[4];
-}
-
-static void ss_lx_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCstation LX";
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    smc->hwdef = &sun4m_hwdefs[5];
-}
-
-static void ss4_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCstation 4";
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    smc->hwdef = &sun4m_hwdefs[6];
-}
-
-static void scls_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCClassic";
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    smc->hwdef = &sun4m_hwdefs[7];
-}
-
-static void sbook_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    };
 
     mc->desc = "Sun4m platform, SPARCbook";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    smc->hwdef = &sun4m_hwdefs[8];
+    smc->hwdef = &sbook_hwdef;
 }
 
 static const TypeInfo sun4m_machine_types[] = {
-- 
2.20.1


