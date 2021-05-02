Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FAE370EB3
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 21:02:14 +0200 (CEST)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldHM5-0004u6-7V
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 15:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHFO-0008SR-Rw
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:55:22 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHFL-0008Qp-3Q
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:55:16 -0400
Received: by mail-wr1-x42f.google.com with SMTP id l2so3326043wrm.9
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 11:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uY3UykazvXB5u3WZ3k3UwS05J5/ZA03gCfl0GB/ty3c=;
 b=ZtUMXNG78Va7oUSxqkr3y70eTqK/VEntI9TvY1GwVZmLJuj1xAwHkZbSwr7fU/y3lm
 3i8U9p1IvE+pWK8z+8l+IhSggmXn+UOHKGlfiHn+KG8jIY76g2+0RjSBmM9sUIPNyxUc
 k+F93jB9ZJRLUvMzn2REUX4FpzAg3Z1xXsRbSQmOBQeivI2NdPic9BpOKjWLRilYTFGk
 PchuADCS+pegPrr/cXjPfzBv7YO9KnRAgOxFoYtajvvfHGKpP4Xn7yFj6avg9Jx2JE6+
 XKP921BwAJLUh2twHCX14NxJLKMZqAOZf5xcX0QW4NBAwyghV9rTCYZQk/mnE9ufjMk9
 7ShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uY3UykazvXB5u3WZ3k3UwS05J5/ZA03gCfl0GB/ty3c=;
 b=L6kZ4yPdXBZyjSjxdgKm2UQ4CmKiy26/TUaeB0eZGjImndHLVMS4WT5hFjzuG9WcAb
 c0MeocSIS0MUb/N/3JohtLA21XqoYbENX3g7skRrEheLhIHJAZgBcwloJJ2BGzmxpX9u
 mqU2vboCsDcam0hlO+CDAtgyq2pcnoa21zsOqMVacR0MtoX2L/L13xAnUPpggWf5MLDx
 z5507R4GPIQX/0LHJzGb7xeMxNEVvaTe4vb1Z38tacdqhNEr9TyON8wFGZQx3kcd2vYH
 Qo6syCdCVMgKcQ3eHSjUFMFjG2NGq+STx0gPYkzpb/W5HO00/DR6jUYLmcQeDUAUjkAj
 NZPA==
X-Gm-Message-State: AOAM533MhN1uuDxXAN6W3M8LQ7GMl/j77tRc85h35h1m7jxFCTwW2gSM
 VaZI36gj2kvR0T5/Tfb/W/806+B9GFPqc8cG
X-Google-Smtp-Source: ABdhPJzH9Z5cRKlyrzu6oDhxbRN+DeQ1UcrulmnhjNA4E8gdahvO3pf0iNDTVRhpxWq8shNZNBADFQ==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr16391782wrj.407.1619981713441; 
 Sun, 02 May 2021 11:55:13 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id h13sm4962088wml.26.2021.05.02.11.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 11:55:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] hw/sparc/sun4m: Move each sun4m_hwdef definition in
 its class_init
Date: Sun,  2 May 2021 20:54:41 +0200
Message-Id: <20210502185441.599980-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502185441.599980-1-f4bug@amsat.org>
References: <20210502185441.599980-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the sun4m_hwdefs[] array by moving assigning the
structure fields directly in each machine class_init()
function.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/sun4m.c | 245 ++++++++++++++++++++++-------------------------
 1 file changed, 112 insertions(+), 133 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 956216591b0..52eeb3ce2dd 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1138,9 +1138,26 @@ enum {
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
+
+    mc->desc = "Sun4m platform, SPARCstation 5";
+    mc->is_default = true;
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
+    smc->hwdef = &(const struct sun4m_hwdef) {
         .iommu_base   = 0x10000000,
         .iommu_pad_base = 0x10004000,
         .iommu_pad_len  = 0x0fffb000,
@@ -1165,9 +1182,18 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss5_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-    /* SS-10 */
-    {
+    };
+}
+
+static void ss10_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+
+    mc->desc = "Sun4m platform, SPARCstation 10";
+    mc->max_cpus = 4;
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
+    smc->hwdef = &(const struct sun4m_hwdef) {
         .iommu_base   = 0xfe0000000ULL,
         .tcx_base     = 0xe20000000ULL,
         .slavio_base  = 0xff0000000ULL,
@@ -1190,9 +1216,18 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss10_id,
         .iommu_version = 0x03000000,
         .max_mem = 0xf00000000ULL,
-    },
-    /* SS-600MP */
-    {
+    };
+}
+
+static void ss600mp_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+
+    mc->desc = "Sun4m platform, SPARCserver 600MP";
+    mc->max_cpus = 4;
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
+    smc->hwdef = &(const struct sun4m_hwdef) {
         .iommu_base   = 0xfe0000000ULL,
         .tcx_base     = 0xe20000000ULL,
         .slavio_base  = 0xff0000000ULL,
@@ -1213,9 +1248,18 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss600mp_id,
         .iommu_version = 0x01000000,
         .max_mem = 0xf00000000ULL,
-    },
-    /* SS-20 */
-    {
+    };
+}
+
+static void ss20_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+
+    mc->desc = "Sun4m platform, SPARCstation 20";
+    mc->max_cpus = 4;
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
+    smc->hwdef = &(const struct sun4m_hwdef) {
         .iommu_base   = 0xfe0000000ULL,
         .tcx_base     = 0xe20000000ULL,
         .slavio_base  = 0xff0000000ULL,
@@ -1254,9 +1298,17 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss20_id,
         .iommu_version = 0x13000000,
         .max_mem = 0xf00000000ULL,
-    },
-    /* Voyager */
-    {
+    };
+}
+
+static void voyager_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+
+    mc->desc = "Sun4m platform, SPARCstation Voyager";
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
+    smc->hwdef = &(const struct sun4m_hwdef) {
         .iommu_base   = 0x10000000,
         .tcx_base     = 0x50000000,
         .slavio_base  = 0x70000000,
@@ -1277,9 +1329,17 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = vger_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-    /* LX */
-    {
+    };
+}
+
+static void ss_lx_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+
+    mc->desc = "Sun4m platform, SPARCstation LX";
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
+    smc->hwdef = &(const struct sun4m_hwdef) {
         .iommu_base   = 0x10000000,
         .iommu_pad_base = 0x10004000,
         .iommu_pad_len  = 0x0fffb000,
@@ -1301,9 +1361,17 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = lx_id,
         .iommu_version = 0x04000000,
         .max_mem = 0x10000000,
-    },
-    /* SS-4 */
-    {
+    };
+}
+
+static void ss4_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+
+    mc->desc = "Sun4m platform, SPARCstation 4";
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
+    smc->hwdef = &(const struct sun4m_hwdef) {
         .iommu_base   = 0x10000000,
         .tcx_base     = 0x50000000,
         .cs_base      = 0x6c000000,
@@ -1325,9 +1393,17 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss4_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-    /* SPARCClassic */
-    {
+    };
+}
+
+static void scls_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+
+    mc->desc = "Sun4m platform, SPARCClassic";
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
+    smc->hwdef = &(const struct sun4m_hwdef) {
         .iommu_base   = 0x10000000,
         .tcx_base     = 0x50000000,
         .slavio_base  = 0x70000000,
@@ -1348,9 +1424,17 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = scls_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-    /* SPARCbook */
-    {
+    };
+}
+
+static void sbook_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+
+    mc->desc = "Sun4m platform, SPARCbook";
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
+    smc->hwdef = &(const struct sun4m_hwdef) {
         .iommu_base   = 0x10000000,
         .tcx_base     = 0x50000000, /* XXX */
         .slavio_base  = 0x70000000,
@@ -1371,112 +1455,7 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
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
-
-    mc->desc = "Sun4m platform, SPARCbook";
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    smc->hwdef = &sun4m_hwdefs[8];
+    };
 }
 
 static const TypeInfo sun4m_machine_types[] = {
-- 
2.26.3


