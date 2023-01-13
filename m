Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC9669D03
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:58:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMFi-0001EX-Vu; Fri, 13 Jan 2023 10:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFh-0001Db-8t
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:45:57 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFf-0005nv-AR
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:45:56 -0500
Received: by mail-wm1-x331.google.com with SMTP id ay40so15559952wmb.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Gf+LwcpZ3Ktm+9qB/ZTMzjKqzlYdeXHI3H35FNRABE=;
 b=nxs28CDwfezp4W2I9vhNj96/YgE79ocIU4BPzOCKPSihTcKFyKgKMd7o6yJT5qygEB
 n7Q+KZnZ5i3/gWH6aOMtY/mKeZBoCbPJa1PNZQ77rrzyyNTHPnDjUw+4bAX4hBSubW75
 HhZdycMO4KmgmUGiJj4Mmxk2kAl/00vqA5D8RsUJcmPKIeyVIgPlZ+hqqsOQIwcatvpl
 rP5fX+qmLdb1PI4l56LKiY+D94fy47FfLvbIYruU/Grvp2RpdEG3Eez26HLGRYDRC48N
 hnt6zkHHM1hoWbVEqlNp5DzrZmx5F/n9vgQOW+hMj3REjt4HWhe9KyTAEUZC01T9iDJB
 /pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Gf+LwcpZ3Ktm+9qB/ZTMzjKqzlYdeXHI3H35FNRABE=;
 b=Mc7E9vOBLV9VKNKtdyRtRaLE1dx8ld6MGSDzHdqLqkEtWNgd4UaIdqajNM65TwByEo
 A6fMUQqdI1DZ1KTYtuhbeHgxQADb2rLm4SIQfABk0oT/Xvb2+/rD1PZpLHfyI7RTqj+l
 vSWzRAU6M1WWqt1Zx4z2MCuWDgXT3NiSxv7czCubzM94Iz+OF+g9j1WkbinUd17QoKOu
 WJjK7BeRL01DSSUR0e5FElBQY1qLo8kW3Xfq4U5yzQmqJKjYlFOeoICUiZcpZAREFeTM
 D9vAxMN7qcnnKLOwcU23b5Om6FKXUKS/e1zgvGCHj3jEcx87M34Y6TXZzuZqaCz9GApx
 mfEg==
X-Gm-Message-State: AFqh2kpwNVk11RzkQ551vSFDEEwNNqmpAwtowWKSjVTp0YadN49ykWaO
 KnDUQzSG8wl3sohtVJwn7BOD9oTrHPJ3N6a6
X-Google-Smtp-Source: AMrXdXsXHEhoB5XYUEsny5K9EWOFk1O/bcs/blKMDPIdpQXcfVqNBK8dXLqRu6VwXmBWTE95i8rqYw==
X-Received: by 2002:a05:600c:154b:b0:3cf:674a:aefe with SMTP id
 f11-20020a05600c154b00b003cf674aaefemr58939512wmg.22.1673624753622; 
 Fri, 13 Jan 2023 07:45:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c510900b003c6f8d30e40sm33854166wms.31.2023.01.13.07.45.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:45:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 04/46] hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
 MemoryRegionOps
Date: Fri, 13 Jan 2023 16:44:50 +0100
Message-Id: <20230113154532.49979-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

GT64120's PCI endianness swapping works on little-endian hosts,
but doesn't on big-endian ones. Instead of complicating how
CFGADDR/CFGDATA registers deal with endianness, use the existing
MemoryRegionOps from hw/pci/pci_host.c. Doing so also reduce the
access to internal PCI_HOST_BRIDGE fields.

Map the PCI_HOST_BRIDGE MemoryRegionOps into the corresponding
CFGADDR/CFGDATA regions in the ISD MMIO and remove the unused
code in the current ISD read/write handlers.

Update the mapping when PCI0_CMD register is accessed (in case
the endianness is changed).

This allows using the GT64120 on a big-endian host (and boot
the MIPS Malta machine in little-endian).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230104133935.4639-6-philmd@linaro.org>
---
 hw/mips/gt64xxx_pci.c | 70 ++++++++++++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 20 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 65416c7b27..81232514c5 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -298,6 +298,50 @@ static void gt64120_isd_mapping(GT64120State *s)
     memory_region_transaction_commit();
 }
 
+static void gt64120_update_pci_cfgdata_mapping(GT64120State *s)
+{
+    /* Indexed on MByteSwap bit, see Table 158: PCI_0 Command, Offset: 0xc00 */
+    static const MemoryRegionOps *pci_host_conf_ops[] = {
+        &pci_host_conf_be_ops, &pci_host_conf_le_ops
+    };
+    static const MemoryRegionOps *pci_host_data_ops[] = {
+        &pci_host_data_be_ops, &pci_host_data_le_ops
+    };
+    PCIHostState *phb = PCI_HOST_BRIDGE(s);
+
+    memory_region_transaction_begin();
+
+    /*
+     * The setting of the MByteSwap bit and MWordSwap bit in the PCI Internal
+     * Command Register determines how data transactions from the CPU to/from
+     * PCI are handled along with the setting of the Endianess bit in the CPU
+     * Configuration Register. See:
+     * - Table 16: 32-bit PCI Transaction Endianess
+     * - Table 158: PCI_0 Command, Offset: 0xc00
+     */
+    if (memory_region_is_mapped(&phb->conf_mem)) {
+        memory_region_del_subregion(&s->ISD_mem, &phb->conf_mem);
+        object_unparent(OBJECT(&phb->conf_mem));
+    }
+    memory_region_init_io(&phb->conf_mem, OBJECT(phb),
+                          pci_host_conf_ops[s->regs[GT_PCI0_CMD] & 1],
+                          s, "pci-conf-idx", 4);
+    memory_region_add_subregion_overlap(&s->ISD_mem, GT_PCI0_CFGADDR << 2,
+                                        &phb->conf_mem, 1);
+
+    if (memory_region_is_mapped(&phb->data_mem)) {
+        memory_region_del_subregion(&s->ISD_mem, &phb->data_mem);
+        object_unparent(OBJECT(&phb->data_mem));
+    }
+    memory_region_init_io(&phb->data_mem, OBJECT(phb),
+                          pci_host_data_ops[s->regs[GT_PCI0_CMD] & 1],
+                          s, "pci-conf-data", 4);
+    memory_region_add_subregion_overlap(&s->ISD_mem, GT_PCI0_CFGDATA << 2,
+                                        &phb->data_mem, 1);
+
+    memory_region_transaction_commit();
+}
+
 static void gt64120_pci_mapping(GT64120State *s)
 {
     memory_region_transaction_begin();
@@ -389,7 +433,6 @@ static void gt64120_writel(void *opaque, hwaddr addr,
                            uint64_t val, unsigned size)
 {
     GT64120State *s = opaque;
-    PCIHostState *phb = PCI_HOST_BRIDGE(s);
     uint32_t saddr = addr >> 2;
 
     trace_gt64120_write(addr, val);
@@ -592,6 +635,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
     case GT_PCI0_CMD:
     case GT_PCI1_CMD:
         s->regs[saddr] = val & 0x0401fc0f;
+        gt64120_update_pci_cfgdata_mapping(s);
         break;
     case GT_PCI0_TOR:
     case GT_PCI0_BS_SCS10:
@@ -632,15 +676,9 @@ static void gt64120_writel(void *opaque, hwaddr addr,
                       saddr << 2, size, size << 1, val);
         break;
     case GT_PCI0_CFGADDR:
-        phb->config_reg = val & 0x80fffffc;
-        break;
     case GT_PCI0_CFGDATA:
-        if (!(s->regs[GT_PCI0_CMD] & 1) && (phb->config_reg & 0x00fff800)) {
-            val = bswap32(val);
-        }
-        if (phb->config_reg & (1u << 31)) {
-            pci_data_write(phb->bus, phb->config_reg, val, 4);
-        }
+        /* Mapped via in gt64120_pci_mapping() */
+        g_assert_not_reached();
         break;
 
     /* Interrupts */
@@ -698,7 +736,6 @@ static uint64_t gt64120_readl(void *opaque,
                               hwaddr addr, unsigned size)
 {
     GT64120State *s = opaque;
-    PCIHostState *phb = PCI_HOST_BRIDGE(s);
     uint32_t val;
     uint32_t saddr = addr >> 2;
 
@@ -883,17 +920,9 @@ static uint64_t gt64120_readl(void *opaque,
 
     /* PCI Internal */
     case GT_PCI0_CFGADDR:
-        val = phb->config_reg;
-        break;
     case GT_PCI0_CFGDATA:
-        if (!(phb->config_reg & (1 << 31))) {
-            val = 0xffffffff;
-        } else {
-            val = pci_data_read(phb->bus, phb->config_reg, 4);
-        }
-        if (!(s->regs[GT_PCI0_CMD] & 1) && (phb->config_reg & 0x00fff800)) {
-            val = bswap32(val);
-        }
+        /* Mapped via in gt64120_pci_mapping() */
+        g_assert_not_reached();
         break;
 
     case GT_PCI0_CMD:
@@ -1153,6 +1182,7 @@ static void gt64120_reset(DeviceState *dev)
 
     gt64120_isd_mapping(s);
     gt64120_pci_mapping(s);
+    gt64120_update_pci_cfgdata_mapping(s);
 }
 
 static void gt64120_realize(DeviceState *dev, Error **errp)
-- 
2.38.1


