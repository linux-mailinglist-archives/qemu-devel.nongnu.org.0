Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0FF696466
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:17:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv9h-0007dH-Av; Tue, 14 Feb 2023 08:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9b-0007YR-Mp
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:27 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9Z-0003xm-GV
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:27 -0500
Received: by mail-ed1-x529.google.com with SMTP id v13so17235717eda.11
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZOVaZx3fH6UEahXjtANeXqEewjt57bWvCFtaZrt0zUc=;
 b=GM1URdy90zS8aKYTQKHhDl061Cy/zrSh/iaKTvTIoT1cHA9U4Yr17kzhSzioAetLSB
 CD+jabM/V17hfxkSXWqUxK3wO+XOFU8ymCfo4DGiqMhvqORF8+1Kz0TesowHpYfFwx23
 Wl3bw/z1QH8Dsx4z62Ajgrp152ss2RB0tA4qOCsUO/nkNy/cPxdv4UmkemrCwDfI5Wfi
 qwO9/PUjjuNN3oaKs6spGMCXJ+FplMBEgw5wIvrgcfeWCPatQ+eQ8dhbYoFTo6H5LWgl
 cBpR3JEezWuxLpqDNcj53XzH0SZuaGturKJoWoRLuAQnCTkwcJhYxjYMcmvroCORO6wP
 QSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZOVaZx3fH6UEahXjtANeXqEewjt57bWvCFtaZrt0zUc=;
 b=1s9XieYNI0R0kVLl5q+Rm372YTkix4zUxKPwnXjk8VqXKxC7X0VFj8D94XP/1J97nF
 d3hargsftmxpM1GTeY1BBkzj4EGrGzxW/JkYmtOlbQR912ZDuFNaikYsMfQxbkMSCeN+
 u/BhRavxwhb8jvhLECJPFgtOvdq423WMjRxjf5EySMGO9LbxKLsiWycK5ITyAf017wd2
 9kLPx9uf6pizqDcpSBZ6omKpwDJCco/GFYuqIeutbCepQ7W1H8xgq8QEePA6h3vNUD3R
 Kph0tIouJ8HBPz1hS39le7+WZaef7rOSdhG37zCYmjtZlaCcCiy4yXv7do7rQAw5wT+V
 bXrA==
X-Gm-Message-State: AO0yUKUT9iW7oetMCbhcQddgwt5RXm8zUTuIEbIP/U+khPFkypXpckJC
 zVg+Pr/2b8bWo6Ynd7jxxLxe3/7+gBk=
X-Google-Smtp-Source: AK7set92RtWQesDatv5ckixCIhqvHXtMmhxDp0FqvGIYfOnD2axTrItNkRYnLUrTNXhQVLjJTCxhGw==
X-Received: by 2002:a50:9b03:0:b0:4aa:a9c7:4224 with SMTP id
 o3-20020a509b03000000b004aaa9c74224mr2623231edi.30.1676380523791; 
 Tue, 14 Feb 2023 05:15:23 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-101-237.92.224.pool.telefonica.de. [92.224.101.237])
 by smtp.gmail.com with ESMTPSA id
 hz17-20020a1709072cf100b008b13836801bsm220153ejc.183.2023.02.14.05.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 05:15:23 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 11/12] hw/pci-host/q35: Merge mch_realize() into
 q35_host_realize()
Date: Tue, 14 Feb 2023 14:14:40 +0100
Message-Id: <20230214131441.101760-12-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214131441.101760-1-shentey@gmail.com>
References: <20230214131441.101760-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This patch prepares movement of the MemoryRegion pointers (which are set
through properties) into the host state. Moreover, it's usually the
parent device which maps the memory regions of its child devices into
its address space. Do the same in q35.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/q35.c | 209 ++++++++++++++++++++++------------------------
 1 file changed, 101 insertions(+), 108 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index d517f5622b..3a7f9185a3 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -44,12 +44,40 @@
 
 #define Q35_PCI_HOST_HOLE64_SIZE_DEFAULT (1ULL << 35)
 
+static uint64_t blackhole_read(void *ptr, hwaddr reg, unsigned size)
+{
+    return 0xffffffff;
+}
+
+static void blackhole_write(void *opaque, hwaddr addr, uint64_t val,
+                            unsigned width)
+{
+    /* nothing */
+}
+
+static const MemoryRegionOps blackhole_ops = {
+    .read = blackhole_read,
+    .write = blackhole_write,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
 static void q35_host_realize(DeviceState *dev, Error **errp)
 {
     ERRP_GUARD();
     Q35PCIHost *s = Q35_HOST_DEVICE(dev);
     PCIHostState *phb = PCI_HOST_BRIDGE(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    int i;
+
+    if (s->mch.ext_tseg_mbytes > MCH_HOST_BRIDGE_EXT_TSEG_MBYTES_MAX) {
+        error_setg(errp, "invalid extended-tseg-mbytes value: %" PRIu16,
+                   s->mch.ext_tseg_mbytes);
+        return;
+    }
 
     memory_region_add_subregion(s->mch.address_space_io,
                                 MCH_HOST_BRIDGE_CONFIG_ADDR, &phb->conf_mem);
@@ -70,6 +98,79 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
     range_set_bounds(&s->pci_hole, s->mch.below_4g_mem_size,
                      IO_APIC_DEFAULT_ADDRESS - 1);
 
+    /* setup pci memory mapping */
+    pc_pci_as_mapping_init(s->mch.system_memory, s->mch.pci_address_space);
+
+    /* if *disabled* show SMRAM to all CPUs */
+    memory_region_init_alias(&s->mch.smram_region, OBJECT(s), "smram-region",
+                             s->mch.pci_address_space, MCH_HOST_BRIDGE_SMRAM_C_BASE,
+                             MCH_HOST_BRIDGE_SMRAM_C_SIZE);
+    memory_region_add_subregion_overlap(s->mch.system_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
+                                        &s->mch.smram_region, 1);
+    memory_region_set_enabled(&s->mch.smram_region, true);
+
+    memory_region_init_alias(&s->mch.open_high_smram, OBJECT(s), "smram-open-high",
+                             s->mch.ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
+                             MCH_HOST_BRIDGE_SMRAM_C_SIZE);
+    memory_region_add_subregion_overlap(s->mch.system_memory, 0xfeda0000,
+                                        &s->mch.open_high_smram, 1);
+    memory_region_set_enabled(&s->mch.open_high_smram, false);
+
+    /* smram, as seen by SMM CPUs */
+    memory_region_init_alias(&s->mch.low_smram, OBJECT(s), "smram-low",
+                             s->mch.ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
+                             MCH_HOST_BRIDGE_SMRAM_C_SIZE);
+    memory_region_set_enabled(&s->mch.low_smram, true);
+    memory_region_add_subregion(s->mch.smram, MCH_HOST_BRIDGE_SMRAM_C_BASE,
+                                &s->mch.low_smram);
+    memory_region_init_alias(&s->mch.high_smram, OBJECT(s), "smram-high",
+                             s->mch.ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
+                             MCH_HOST_BRIDGE_SMRAM_C_SIZE);
+    memory_region_set_enabled(&s->mch.high_smram, true);
+    memory_region_add_subregion(s->mch.smram, 0xfeda0000, &s->mch.high_smram);
+
+    memory_region_init_io(&s->mch.tseg_blackhole, OBJECT(s),
+                          &blackhole_ops, NULL, "tseg-blackhole", 0);
+    memory_region_set_enabled(&s->mch.tseg_blackhole, false);
+    memory_region_add_subregion_overlap(s->mch.system_memory,
+                                        s->mch.below_4g_mem_size,
+                                        &s->mch.tseg_blackhole, 1);
+
+    memory_region_init_alias(&s->mch.tseg_window, OBJECT(s), "tseg-window",
+                             s->mch.ram_memory, s->mch.below_4g_mem_size, 0);
+    memory_region_set_enabled(&s->mch.tseg_window, false);
+    memory_region_add_subregion(s->mch.smram, s->mch.below_4g_mem_size,
+                                &s->mch.tseg_window);
+
+    /*
+     * This is not what hardware does, so it's QEMU specific hack.
+     * See commit message for details.
+     */
+    memory_region_init_io(&s->mch.smbase_blackhole, OBJECT(s), &blackhole_ops,
+                          NULL, "smbase-blackhole",
+                          MCH_HOST_BRIDGE_SMBASE_SIZE);
+    memory_region_set_enabled(&s->mch.smbase_blackhole, false);
+    memory_region_add_subregion_overlap(s->mch.system_memory,
+                                        MCH_HOST_BRIDGE_SMBASE_ADDR,
+                                        &s->mch.smbase_blackhole, 1);
+
+    memory_region_init_alias(&s->mch.smbase_window, OBJECT(s),
+                             "smbase-window", s->mch.ram_memory,
+                             MCH_HOST_BRIDGE_SMBASE_ADDR,
+                             MCH_HOST_BRIDGE_SMBASE_SIZE);
+    memory_region_set_enabled(&s->mch.smbase_window, false);
+    memory_region_add_subregion(s->mch.smram, MCH_HOST_BRIDGE_SMBASE_ADDR,
+                                &s->mch.smbase_window);
+
+    init_pam(&s->mch.pam_regions[0], OBJECT(s), s->mch.ram_memory,
+             s->mch.system_memory, s->mch.pci_address_space,
+             PAM_BIOS_BASE, PAM_BIOS_SIZE);
+    for (i = 0; i < ARRAY_SIZE(s->mch.pam_regions) - 1; ++i) {
+        init_pam(&s->mch.pam_regions[i + 1], OBJECT(s), s->mch.ram_memory,
+                 s->mch.system_memory, s->mch.pci_address_space,
+                 PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE, PAM_EXPAN_SIZE);
+    }
+
     phb->bus = pci_root_bus_new(DEVICE(s), "pcie.0",
                                 s->mch.pci_address_space,
                                 s->mch.address_space_io,
@@ -269,27 +370,6 @@ static const TypeInfo q35_host_info = {
  * MCH D0:F0
  */
 
-static uint64_t blackhole_read(void *ptr, hwaddr reg, unsigned size)
-{
-    return 0xffffffff;
-}
-
-static void blackhole_write(void *opaque, hwaddr addr, uint64_t val,
-                            unsigned width)
-{
-    /* nothing */
-}
-
-static const MemoryRegionOps blackhole_ops = {
-    .read = blackhole_read,
-    .write = blackhole_write,
-    .valid.min_access_size = 1,
-    .valid.max_access_size = 4,
-    .impl.min_access_size = 4,
-    .impl.max_access_size = 4,
-    .endianness = DEVICE_LITTLE_ENDIAN,
-};
-
 /* PCIe MMCFG */
 static void mch_update_pciexbar(MCHPCIState *mch)
 {
@@ -552,92 +632,6 @@ static void mch_reset(DeviceState *qdev)
     mch_update(mch);
 }
 
-static void mch_realize(PCIDevice *d, Error **errp)
-{
-    int i;
-    MCHPCIState *mch = MCH_PCI_DEVICE(d);
-
-    if (mch->ext_tseg_mbytes > MCH_HOST_BRIDGE_EXT_TSEG_MBYTES_MAX) {
-        error_setg(errp, "invalid extended-tseg-mbytes value: %" PRIu16,
-                   mch->ext_tseg_mbytes);
-        return;
-    }
-
-    /* setup pci memory mapping */
-    pc_pci_as_mapping_init(mch->system_memory, mch->pci_address_space);
-
-    /* if *disabled* show SMRAM to all CPUs */
-    memory_region_init_alias(&mch->smram_region, OBJECT(mch), "smram-region",
-                             mch->pci_address_space, MCH_HOST_BRIDGE_SMRAM_C_BASE,
-                             MCH_HOST_BRIDGE_SMRAM_C_SIZE);
-    memory_region_add_subregion_overlap(mch->system_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
-                                        &mch->smram_region, 1);
-    memory_region_set_enabled(&mch->smram_region, true);
-
-    memory_region_init_alias(&mch->open_high_smram, OBJECT(mch), "smram-open-high",
-                             mch->ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
-                             MCH_HOST_BRIDGE_SMRAM_C_SIZE);
-    memory_region_add_subregion_overlap(mch->system_memory, 0xfeda0000,
-                                        &mch->open_high_smram, 1);
-    memory_region_set_enabled(&mch->open_high_smram, false);
-
-    /* smram, as seen by SMM CPUs */
-    memory_region_init_alias(&mch->low_smram, OBJECT(mch), "smram-low",
-                             mch->ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
-                             MCH_HOST_BRIDGE_SMRAM_C_SIZE);
-    memory_region_set_enabled(&mch->low_smram, true);
-    memory_region_add_subregion(mch->smram, MCH_HOST_BRIDGE_SMRAM_C_BASE,
-                                &mch->low_smram);
-    memory_region_init_alias(&mch->high_smram, OBJECT(mch), "smram-high",
-                             mch->ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
-                             MCH_HOST_BRIDGE_SMRAM_C_SIZE);
-    memory_region_set_enabled(&mch->high_smram, true);
-    memory_region_add_subregion(mch->smram, 0xfeda0000, &mch->high_smram);
-
-    memory_region_init_io(&mch->tseg_blackhole, OBJECT(mch),
-                          &blackhole_ops, NULL,
-                          "tseg-blackhole", 0);
-    memory_region_set_enabled(&mch->tseg_blackhole, false);
-    memory_region_add_subregion_overlap(mch->system_memory,
-                                        mch->below_4g_mem_size,
-                                        &mch->tseg_blackhole, 1);
-
-    memory_region_init_alias(&mch->tseg_window, OBJECT(mch), "tseg-window",
-                             mch->ram_memory, mch->below_4g_mem_size, 0);
-    memory_region_set_enabled(&mch->tseg_window, false);
-    memory_region_add_subregion(mch->smram, mch->below_4g_mem_size,
-                                &mch->tseg_window);
-
-    /*
-     * This is not what hardware does, so it's QEMU specific hack.
-     * See commit message for details.
-     */
-    memory_region_init_io(&mch->smbase_blackhole, OBJECT(mch), &blackhole_ops,
-                          NULL, "smbase-blackhole",
-                          MCH_HOST_BRIDGE_SMBASE_SIZE);
-    memory_region_set_enabled(&mch->smbase_blackhole, false);
-    memory_region_add_subregion_overlap(mch->system_memory,
-                                        MCH_HOST_BRIDGE_SMBASE_ADDR,
-                                        &mch->smbase_blackhole, 1);
-
-    memory_region_init_alias(&mch->smbase_window, OBJECT(mch),
-                             "smbase-window", mch->ram_memory,
-                             MCH_HOST_BRIDGE_SMBASE_ADDR,
-                             MCH_HOST_BRIDGE_SMBASE_SIZE);
-    memory_region_set_enabled(&mch->smbase_window, false);
-    memory_region_add_subregion(mch->smram, MCH_HOST_BRIDGE_SMBASE_ADDR,
-                                &mch->smbase_window);
-
-    init_pam(&mch->pam_regions[0], OBJECT(mch), mch->ram_memory,
-             mch->system_memory, mch->pci_address_space,
-             PAM_BIOS_BASE, PAM_BIOS_SIZE);
-    for (i = 0; i < ARRAY_SIZE(mch->pam_regions) - 1; ++i) {
-        init_pam(&mch->pam_regions[i + 1], OBJECT(mch), mch->ram_memory,
-                 mch->system_memory, mch->pci_address_space,
-                 PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE, PAM_EXPAN_SIZE);
-    }
-}
-
 uint64_t mch_mcfg_base(void)
 {
     bool ambiguous;
@@ -660,7 +654,6 @@ static void mch_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    k->realize = mch_realize;
     k->config_write = mch_write_config;
     dc->reset = mch_reset;
     device_class_set_props(dc, mch_props);
-- 
2.39.1


