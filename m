Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9595E65D496
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 14:42:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD401-0003is-W3; Wed, 04 Jan 2023 08:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3zy-0003hp-LX
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:40:06 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3zw-0001UR-QI
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:40:06 -0500
Received: by mail-wr1-x434.google.com with SMTP id d9so4407052wrp.10
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 05:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qrPSllnx4YupvoZF9hNQoszmPPNXIKLtvTqBpG1DBSg=;
 b=jpnkc7tLFmJCDSQbw/vmg1ftv3xOG4KrrsHaaoEY+wJQwlhee4kGlmQwPewPh1Zk18
 //ZWyKMz+atySBsXTnOK++HDeF0yfDbkqZUAGKtQ03s+ghKx3fMelY8Ob2NQVos9eqsg
 PM3aBrz289AH/x4+LX7bdF4QQGdb+v7L2V2PRuqeV6yI7BavnyDScPQ1meW5OIgr28nJ
 UDop4VONZAGALGrkh77yyCuu9MXXw1VmMg0dVXFS9HwtkOTsGVttICw5GRM1zMSjcM8E
 mDBnovEYkMImskYn9nP/BVdgJmxcOPlgzyRVSoAapcC4FtEaNV9YtMpYYSAeaNogp/hL
 Bs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qrPSllnx4YupvoZF9hNQoszmPPNXIKLtvTqBpG1DBSg=;
 b=SpNvuW9EKPlHC1TL3/r7wYhe5L6+1Yt2UNjCXQ9MY1kQ+3bQnik7HvTs37Njr46GYz
 ZAfQCZtZ1X07ijXQkOzwOYv0sOBCzKAbRgoDGiZAoDhW9mpBcipduugumvfVePrdo5NR
 xfGnwPkHbYkIfRoqgN7XJjZf1ad7EQYJKi+spC8gS+1vhjZXUzjqYFgMOT5kApzijDTt
 i6IfLr8G54yNS1eY3m/s6VAHWgA5gPaVRDasOQyHBnlfwuj5kGl+1nQqHLPYU0o6SAqv
 O6jVLxAgYv58MO3yfIDW2NeOLVaKCJsVus43kWvVdek2VpTO3Xsn6VX03vCHMBh71wqf
 ysuw==
X-Gm-Message-State: AFqh2kpFPkRuitRRLEB7SciRR0ak7OkB1vHz+rzsZ+uv2z3km8Ai2Ewt
 e6IVgkzxPc8JvZ3c+ATVqV3AVYtWsT42AmVJ
X-Google-Smtp-Source: AMrXdXvJiJqyKhVQ7htRQgyKJNPGBQNXhjdCgk8sF4RDXCGcX9ghRycSdSiDLdle+253GHhAyH7mVA==
X-Received: by 2002:a05:6000:4:b0:248:443:2d81 with SMTP id
 h4-20020a056000000400b0024804432d81mr30012677wrx.59.1672839603585; 
 Wed, 04 Jan 2023 05:40:03 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a5d4ac2000000b0027323b19ecesm32356921wrs.16.2023.01.04.05.40.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 05:40:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/6] hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
 MemoryRegionOps
Date: Wed,  4 Jan 2023 14:39:34 +0100
Message-Id: <20230104133935.4639-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104133935.4639-1-philmd@linaro.org>
References: <20230104133935.4639-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
---
 hw/mips/gt64xxx_pci.c | 70 ++++++++++++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 20 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index d84c2b7349..b92536d3ab 100644
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


