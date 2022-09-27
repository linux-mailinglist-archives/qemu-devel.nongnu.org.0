Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179D75EBF98
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:21:14 +0200 (CEST)
Received: from localhost ([::1]:55506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7iD-0004cK-5e
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7aC-0000xn-6H
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:56 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a9-0002X9-EW
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:55 -0400
Received: by mail-wm1-x336.google.com with SMTP id e18so6199051wmq.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=l/uG4uTbqpFsuZ8etvP0cLENEL6FoiOD5ehdUdm22Dk=;
 b=SzmT04njVq7na/dk2EWJyqyPPOZsiwAhLTcaf7lj94wYpC4/igomIrYEzwm2CwyxX4
 RrVw44Be3+rqja/PyfjAIsn7gnlxyy+4EFJxHgwpjRz44aTSRc1wXA4TGSG9KKLKrOGD
 lcj+mdJlSt2FoC40aMjHKqj0RaDMnUOm3YCuYoEbYNcTGkiuV2cyUa47NSH+MUerYXUi
 uZVCOmyr0mMe9Sv1n5VgYDU+Dfr4OkY4crVDsGSBO6dXROuwe66KNQK+DE0Vw9Gjksfc
 pvTrsP/HUxT3J6awcwywpf6ChHRrkZenEa7WcT1ljxH2EvM3ea5PJ+iMLzihaJ0nbyz5
 A6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=l/uG4uTbqpFsuZ8etvP0cLENEL6FoiOD5ehdUdm22Dk=;
 b=Em4Pyff1JpPjqaVuLA/VvAY1dOXIROkfHqmqqH76OUDKsEKiKFgJbB2heeiYRNfRmX
 HpbUudimfxrA6cLg1J6BKOCOeFRw63yhX0GIC656PNTN8UcyAm0UaE5Ur00sDVxD9VZg
 DURKlIULAfz6sUis0JLP1vDKk54jS9XbgzdyU/T2IaBwAFfWxBcLIj2/H/0Oaednxp2C
 zSm4XocXgbHJNm1cFMW379n5XmygqSOQn+1sQrgZ5C09FCTJ7MnPaStBvaTrnqr2dYeE
 mh+BUjF/RC68CcrlYycuHTo2aqTUsKIs+zsXh1wAL9e+NNrkVKoVPtHNU4nanBERjod6
 lZrA==
X-Gm-Message-State: ACrzQf3Ed4ny6O3u+CoUGw1q2tbmMUWKbDUYV62f/qD/8xxtK8aeDH5L
 SAeFThqgGFZHetmGfOfOr4NnBQ==
X-Google-Smtp-Source: AMsMyM5oX7mLAfKUq2GvatExHXwfLSXrBuckikzYXamzEDbHRuoDkdbOC/lV740o5Sx0rfT9BG5WUg==
X-Received: by 2002:a05:600c:4fce:b0:3b4:935f:b952 with SMTP id
 o14-20020a05600c4fce00b003b4935fb952mr1975172wmq.197.1664273571857; 
 Tue, 27 Sep 2022 03:12:51 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b00223b8168b15sm1398387wrk.66.2022.09.27.03.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:12:51 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 8/8] hw/arm/virt: Fix devicetree warnings about node names
Date: Tue, 27 Sep 2022 11:03:49 +0100
Message-Id: <20220927100347.176606-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927100347.176606-1-jean-philippe@linaro.org>
References: <20220927100347.176606-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The devicetree specification requires that nodes use a generic name
where appropriate. Fix the corresponding dt-validate warnings:

  pl061@9030000: $nodename:0: 'pl061@9030000' does not match '^gpio@[0-9a-f]+$'
  From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
  pl031@9010000: $nodename:0: 'pl031@9010000' does not match '^rtc(@.*|-[0-9a-f])*$'
  From schema: linux/Documentation/devicetree/bindings/rtc/arm,pl031.yaml
  pl011@9000000: $nodename:0: 'pl011@9000000' does not match '^serial(@.*)?$'
  From schema: linux/Documentation/devicetree/bindings/serial/pl011.yaml
  intc@8000000: $nodename:0: 'intc@8000000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
  From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
  intc@8000000: 'its@8080000' does not match any of the regexes: '^(msi-controller|gic-its|interrupt-controller)@[0-9a-f]+$', '^gic-its@', '^interrupt-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
  From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
  smmuv3@9050000: $nodename:0: 'smmuv3@9050000' does not match '^iommu@[0-9a-f]*'
  From schema: linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5e16d54bbb..c1e384e06f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -481,7 +481,7 @@ static void fdt_add_its_gic_node(VirtMachineState *vms)
     MachineState *ms = MACHINE(vms);
 
     vms->msi_phandle = qemu_fdt_alloc_phandle(ms->fdt);
-    nodename = g_strdup_printf("/intc/its@%" PRIx64,
+    nodename = g_strdup_printf("/interrupt-controller/msi-controller@%" PRIx64,
                                vms->memmap[VIRT_GIC_ITS].base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
@@ -500,7 +500,7 @@ static void fdt_add_v2m_gic_node(VirtMachineState *vms)
     MachineState *ms = MACHINE(vms);
     char *nodename;
 
-    nodename = g_strdup_printf("/intc/v2m@%" PRIx64,
+    nodename = g_strdup_printf("/interrupt-controller/v2m@%" PRIx64,
                                vms->memmap[VIRT_GIC_V2M].base);
     vms->msi_phandle = qemu_fdt_alloc_phandle(ms->fdt);
     qemu_fdt_add_subnode(ms->fdt, nodename);
@@ -522,7 +522,7 @@ static void fdt_add_gic_node(VirtMachineState *vms)
     vms->gic_phandle = qemu_fdt_alloc_phandle(ms->fdt);
     qemu_fdt_setprop_cell(ms->fdt, "/", "interrupt-parent", vms->gic_phandle);
 
-    nodename = g_strdup_printf("/intc@%" PRIx64,
+    nodename = g_strdup_printf("/interrupt-controller@%" PRIx64,
                                vms->memmap[VIRT_GIC_DIST].base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop_cell(ms->fdt, nodename, "#interrupt-cells", 3);
@@ -857,7 +857,7 @@ static void create_uart(const VirtMachineState *vms, int uart,
                                 sysbus_mmio_get_region(s, 0));
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
 
-    nodename = g_strdup_printf("/pl011@%" PRIx64, base);
+    nodename = g_strdup_printf("/serial@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     /* Note that we can't use setprop_string because of the embedded NUL */
     qemu_fdt_setprop(ms->fdt, nodename, "compatible",
@@ -897,7 +897,7 @@ static void create_rtc(const VirtMachineState *vms)
 
     sysbus_create_simple("pl031", base, qdev_get_gpio_in(vms->gic, irq));
 
-    nodename = g_strdup_printf("/pl031@%" PRIx64, base);
+    nodename = g_strdup_printf("/rtc@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat));
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
@@ -999,7 +999,7 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
 
     uint32_t phandle = qemu_fdt_alloc_phandle(ms->fdt);
-    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
+    nodename = g_strdup_printf("/gpio@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base, 2, size);
@@ -1348,7 +1348,7 @@ static void create_smmu(const VirtMachineState *vms,
                            qdev_get_gpio_in(vms->gic, irq + i));
     }
 
-    node = g_strdup_printf("/smmuv3@%" PRIx64, base);
+    node = g_strdup_printf("/iommu@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, node);
     qemu_fdt_setprop(ms->fdt, node, "compatible", compat, sizeof(compat));
     qemu_fdt_setprop_sized_cells(ms->fdt, node, "reg", 2, base, 2, size);
@@ -1653,7 +1653,7 @@ void virt_machine_done(Notifier *notifier, void *data)
      * while qemu takes charge of the qom stuff.
      */
     if (info->dtb_filename == NULL) {
-        platform_bus_add_all_fdt_nodes(ms->fdt, "/intc",
+        platform_bus_add_all_fdt_nodes(ms->fdt, "/interrupt-controller",
                                        vms->memmap[VIRT_PLATFORM_BUS].base,
                                        vms->memmap[VIRT_PLATFORM_BUS].size,
                                        vms->irqmap[VIRT_PLATFORM_BUS]);
-- 
2.37.3


