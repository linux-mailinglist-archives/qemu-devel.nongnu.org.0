Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B143659FF47
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 18:16:06 +0200 (CEST)
Received: from localhost ([::1]:45346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQt2z-000176-IK
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 12:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsfA-0002BD-1B
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:28 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf7-0002Eg-5s
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:27 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b5so17006950wrr.5
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/y1zm97n6IGKhSBa6qGqkTluIHtkqiOpSJE6ybC/cmQ=;
 b=XwlW40h1EREpZkq6bDzc17N3GOMsYtv0OAPbS70wPH/7excd57FtyJRddtkf1pDhu8
 phIoFoGUmX75T8ofO/nMriJKx8K1YgW0F70ec5EM1ixE5PoC7+r03CkEv6AMFSQ0pq+N
 bOZQAatftnREL+sp6QjSfb51wbYJa2kCPb4qI1JTGF/58357c/JFAWFNGSLOGGRu+1Af
 q9VCzXLigWE6aqNp0sP23osm4Po9n9rtqC3szzkkuQgJ6A/Tb873QaPDDDSwTSDgiYvM
 VfPippxj9mE1sQ5FKI3wRST2nejAh054NJDoS1oy/qVdz0pfVu0DDp4CvruJw4NvRN2n
 BwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/y1zm97n6IGKhSBa6qGqkTluIHtkqiOpSJE6ybC/cmQ=;
 b=SgMmj8nsG6SX82cgnVbeoVEUgrIgtjNYV+1qhP4PV0c6GkrZUXI16JTdfJx0jJu26i
 HaO6nA4NTzRgAXzs+0nDEJW0vkDS/HnHt7zoh6X+1uouhgwA8LcSGLKPGtzuGYbr24oL
 m3WKLq/zOrrke6U8DsDjRqSS9+FVKDTyan1yIDH1c4mAO8D3Sxccl9SNZGsVQzVi75fD
 sMLeMK/GHcQjZvv3JdnJDFx8b6a7ffg+SHuJiGoptlG77ZzO9HwWyvhEGwFrpvEiEKSr
 QuG60mIwuN5u10fHkR7sQOz1YC5I9CmQH+yRGPQBYWvFZfuUUryX9qShys7GopiJlpnZ
 B17w==
X-Gm-Message-State: ACgBeo3LRd6M0RtA9sqMRx7dZ12GQm73QMBtbTxDXY7CEOOMzVQi/DwI
 PKTSigrpMIWVDphYvepCUDGXRBMOvu551QrX
X-Google-Smtp-Source: AA6agR5DDsjT6YIa36WJCSMsUHy5mjhSCmL6/qDsYn0662SwQr1ZXxPLiJ4J2er79f/1Xc2tmA7ZDg==
X-Received: by 2002:a05:6000:1812:b0:225:7383:d739 with SMTP id
 m18-20020a056000181200b002257383d739mr1654652wrh.333.1661356284426; 
 Wed, 24 Aug 2022 08:51:24 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:24 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 09/10] hw/arm/virt: Fix devicetree warnings about the SMMU node
Date: Wed, 24 Aug 2022 16:51:13 +0100
Message-Id: <20220824155113.286730-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

dt-validate reports three issues in the SMMU device-tree node:

  smmuv3@9050000: $nodename:0: 'smmuv3@9050000' does not match '^iommu@[0-9a-f]*'
  smmuv3@9050000: interrupt-names: 'oneOf' conditional failed, one must be fixed:
  	['eventq', 'priq', 'cmdq-sync', 'gerror'] is too long
  	'combined' was expected
  	'gerror' was expected
  	'gerror' is not one of ['cmdq-sync', 'priq']
  smmuv3@9050000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
  From schema: linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml

Fix them by:
* changing the node name
* reordering the IRQs
* removing the clock properties which are not expected for the SMMU node

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 779eb5ea31..de508d5329 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1329,7 +1329,9 @@ static void create_smmu(const VirtMachineState *vms,
     int i;
     hwaddr base = vms->memmap[VIRT_SMMU].base;
     hwaddr size = vms->memmap[VIRT_SMMU].size;
-    const char irq_names[] = "eventq\0priq\0cmdq-sync\0gerror";
+    uint32_t irq_type = GIC_FDT_IRQ_TYPE_SPI;
+    uint32_t irq_trigger = GIC_FDT_IRQ_FLAGS_EDGE_LO_HI;
+    const char irq_names[] = "eventq\0gerror\0priq\0cmdq-sync";
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
 
@@ -1348,22 +1350,20 @@ static void create_smmu(const VirtMachineState *vms,
                            qdev_get_gpio_in(vms->gic, irq + i));
     }
 
-    node = g_strdup_printf("/smmuv3@%" PRIx64, base);
+    node = g_strdup_printf("/iommu@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, node);
     qemu_fdt_setprop(ms->fdt, node, "compatible", compat, sizeof(compat));
     qemu_fdt_setprop_sized_cells(ms->fdt, node, "reg", 2, base, 2, size);
 
     qemu_fdt_setprop_cells(ms->fdt, node, "interrupts",
-            GIC_FDT_IRQ_TYPE_SPI, irq    , GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
-            GIC_FDT_IRQ_TYPE_SPI, irq + 1, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
-            GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
-            GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+            irq_type, irq + SMMU_IRQ_EVTQ,      irq_trigger,
+            irq_type, irq + SMMU_IRQ_GERROR,    irq_trigger,
+            irq_type, irq + SMMU_IRQ_PRIQ,      irq_trigger,
+            irq_type, irq + SMMU_IRQ_CMD_SYNC,  irq_trigger);
 
     qemu_fdt_setprop(ms->fdt, node, "interrupt-names", irq_names,
                      sizeof(irq_names));
 
-    qemu_fdt_setprop_cell(ms->fdt, node, "clocks", vms->clock_phandle);
-    qemu_fdt_setprop_string(ms->fdt, node, "clock-names", "apb_pclk");
     qemu_fdt_setprop(ms->fdt, node, "dma-coherent", NULL, 0);
 
     qemu_fdt_setprop_cell(ms->fdt, node, "#iommu-cells", 1);
-- 
2.37.1


