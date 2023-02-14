Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F71696464
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:17:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv9j-0007eW-C3; Tue, 14 Feb 2023 08:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9c-0007ZG-CB
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:28 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9a-0003yK-A3
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:28 -0500
Received: by mail-ej1-x630.google.com with SMTP id a3so5911763ejb.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tN2G4l8Mw0zarPkuoO29FQXWSzmJO54bRjWj5GX17Tk=;
 b=XwBxjmZe2RfwcKpt+mTIoanCURenEFSBvRaA77amIXyCgm7xcBG6yXT+jBewZfebSd
 JQfoA+fgEEy0aJtBEQFuzV8HqYRGzz5OnxWNQ3r+t6pJdmfMSYjngCu61Gw6tm4Ssofa
 RujlOD+DGjoaIf/60FrEEEf79KcqXwL2xWVni7ctdLl9VWEYEBUY9xbryqQdA03Ivkij
 u8zAP6CRTF2GyHPeU19sQ0NGfrE+7C8FMycvc5d9Vu/vl+TnVVpqN0pv7u8kp9vRjvXe
 7CPu18EL3DZpYWHBy00taFCJPu4Ik2KbGcuWlxKDqp/+2/xV3muwgnqH+DgrUgqQPQiy
 inrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tN2G4l8Mw0zarPkuoO29FQXWSzmJO54bRjWj5GX17Tk=;
 b=DjqOAs3bBTupcVP3NpGjOUn0GerAUQwqGUMBBH67Uv/pShA1GBAGZp+ykuB6RFZZ87
 wlkccPCa77Ogbc5iFLQW6x9MuvL5wguS01XHP4xgBK37aRaV47jUXcji5uiVRMYnT8Lb
 XdLHpKsmlDNPm1nLcbfs1SXKr5h0nWVVit+GR0ro8tysmN6vRSol0uvXTLbtT5eU1BfE
 LGGckH0ufkpC4uqmXugNm1NbQ359nyYYMVRMNq2jLvOBYNHOlo6PDCmk5xfB0/tiR8g9
 DmMM9ZjVgERL/prnCI7jHPAYDm7ETKbd0CAC8pMpbFu/Jbmg7mdF9s8uKxbNOwKACshN
 9lWQ==
X-Gm-Message-State: AO0yUKVlrF27T2dU9LXYwm0F2EbJNru9bFwQ8tNlll5UYXkRSbzpfad8
 BOhwbLn2eVLjLCym2tGii80rXza2CPk=
X-Google-Smtp-Source: AK7set9U+YbRNhxIezu1eOlV/8gGbdiCodLR98tUqMdzMbX3W3w1MDiT2iI7xuuir5kVZ668QFztmA==
X-Received: by 2002:a17:906:8a6a:b0:87b:d503:2ee3 with SMTP id
 hy10-20020a1709068a6a00b0087bd5032ee3mr1764155ejc.11.1676380524731; 
 Tue, 14 Feb 2023 05:15:24 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-101-237.92.224.pool.telefonica.de. [92.224.101.237])
 by smtp.gmail.com with ESMTPSA id
 hz17-20020a1709072cf100b008b13836801bsm220153ejc.183.2023.02.14.05.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 05:15:24 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 12/12] hw/pci-host/q35: Move MemoryRegion pointers to host
 device
Date: Tue, 14 Feb 2023 14:14:41 +0100
Message-Id: <20230214131441.101760-13-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214131441.101760-1-shentey@gmail.com>
References: <20230214131441.101760-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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

The pointers are set through the host device's properties and are only
used during its realization phase.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/pci-host/q35.h | 10 +++----
 hw/pci-host/q35.c         | 56 +++++++++++++++++++--------------------
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index a04d5f1a17..9b9ce48ca8 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -40,11 +40,6 @@ struct MCHPCIState {
     PCIDevice parent_obj;
     /*< public >*/
 
-    MemoryRegion *ram_memory;
-    MemoryRegion *pci_address_space;
-    MemoryRegion *system_memory;
-    MemoryRegion *address_space_io;
-    MemoryRegion *smram;
     PAMMemoryRegion pam_regions[PAM_REGIONS_COUNT];
     MemoryRegion smram_region, open_high_smram;
     MemoryRegion low_smram, high_smram;
@@ -61,6 +56,11 @@ struct Q35PCIHost {
     PCIExpressHost parent_obj;
     /*< public >*/
 
+    MemoryRegion *ram_memory;
+    MemoryRegion *pci_address_space;
+    MemoryRegion *system_memory;
+    MemoryRegion *address_space_io;
+    MemoryRegion *smram;
     Range pci_hole;
     uint64_t pci_hole64_size;
     uint32_t short_root_bus;
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 3a7f9185a3..cb8ea58c25 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -79,11 +79,11 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    memory_region_add_subregion(s->mch.address_space_io,
+    memory_region_add_subregion(s->address_space_io,
                                 MCH_HOST_BRIDGE_CONFIG_ADDR, &phb->conf_mem);
     sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, 4);
 
-    memory_region_add_subregion(s->mch.address_space_io,
+    memory_region_add_subregion(s->address_space_io,
                                 MCH_HOST_BRIDGE_CONFIG_DATA, &phb->data_mem);
     sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_DATA, 4);
 
@@ -99,47 +99,47 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
                      IO_APIC_DEFAULT_ADDRESS - 1);
 
     /* setup pci memory mapping */
-    pc_pci_as_mapping_init(s->mch.system_memory, s->mch.pci_address_space);
+    pc_pci_as_mapping_init(s->system_memory, s->pci_address_space);
 
     /* if *disabled* show SMRAM to all CPUs */
     memory_region_init_alias(&s->mch.smram_region, OBJECT(s), "smram-region",
-                             s->mch.pci_address_space, MCH_HOST_BRIDGE_SMRAM_C_BASE,
+                             s->pci_address_space, MCH_HOST_BRIDGE_SMRAM_C_BASE,
                              MCH_HOST_BRIDGE_SMRAM_C_SIZE);
-    memory_region_add_subregion_overlap(s->mch.system_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
+    memory_region_add_subregion_overlap(s->system_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
                                         &s->mch.smram_region, 1);
     memory_region_set_enabled(&s->mch.smram_region, true);
 
     memory_region_init_alias(&s->mch.open_high_smram, OBJECT(s), "smram-open-high",
-                             s->mch.ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
+                             s->ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
                              MCH_HOST_BRIDGE_SMRAM_C_SIZE);
-    memory_region_add_subregion_overlap(s->mch.system_memory, 0xfeda0000,
+    memory_region_add_subregion_overlap(s->system_memory, 0xfeda0000,
                                         &s->mch.open_high_smram, 1);
     memory_region_set_enabled(&s->mch.open_high_smram, false);
 
     /* smram, as seen by SMM CPUs */
     memory_region_init_alias(&s->mch.low_smram, OBJECT(s), "smram-low",
-                             s->mch.ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
+                             s->ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
                              MCH_HOST_BRIDGE_SMRAM_C_SIZE);
     memory_region_set_enabled(&s->mch.low_smram, true);
-    memory_region_add_subregion(s->mch.smram, MCH_HOST_BRIDGE_SMRAM_C_BASE,
+    memory_region_add_subregion(s->smram, MCH_HOST_BRIDGE_SMRAM_C_BASE,
                                 &s->mch.low_smram);
     memory_region_init_alias(&s->mch.high_smram, OBJECT(s), "smram-high",
-                             s->mch.ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
+                             s->ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
                              MCH_HOST_BRIDGE_SMRAM_C_SIZE);
     memory_region_set_enabled(&s->mch.high_smram, true);
-    memory_region_add_subregion(s->mch.smram, 0xfeda0000, &s->mch.high_smram);
+    memory_region_add_subregion(s->smram, 0xfeda0000, &s->mch.high_smram);
 
     memory_region_init_io(&s->mch.tseg_blackhole, OBJECT(s),
                           &blackhole_ops, NULL, "tseg-blackhole", 0);
     memory_region_set_enabled(&s->mch.tseg_blackhole, false);
-    memory_region_add_subregion_overlap(s->mch.system_memory,
+    memory_region_add_subregion_overlap(s->system_memory,
                                         s->mch.below_4g_mem_size,
                                         &s->mch.tseg_blackhole, 1);
 
     memory_region_init_alias(&s->mch.tseg_window, OBJECT(s), "tseg-window",
-                             s->mch.ram_memory, s->mch.below_4g_mem_size, 0);
+                             s->ram_memory, s->mch.below_4g_mem_size, 0);
     memory_region_set_enabled(&s->mch.tseg_window, false);
-    memory_region_add_subregion(s->mch.smram, s->mch.below_4g_mem_size,
+    memory_region_add_subregion(s->smram, s->mch.below_4g_mem_size,
                                 &s->mch.tseg_window);
 
     /*
@@ -150,30 +150,30 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
                           NULL, "smbase-blackhole",
                           MCH_HOST_BRIDGE_SMBASE_SIZE);
     memory_region_set_enabled(&s->mch.smbase_blackhole, false);
-    memory_region_add_subregion_overlap(s->mch.system_memory,
+    memory_region_add_subregion_overlap(s->system_memory,
                                         MCH_HOST_BRIDGE_SMBASE_ADDR,
                                         &s->mch.smbase_blackhole, 1);
 
     memory_region_init_alias(&s->mch.smbase_window, OBJECT(s),
-                             "smbase-window", s->mch.ram_memory,
+                             "smbase-window", s->ram_memory,
                              MCH_HOST_BRIDGE_SMBASE_ADDR,
                              MCH_HOST_BRIDGE_SMBASE_SIZE);
     memory_region_set_enabled(&s->mch.smbase_window, false);
-    memory_region_add_subregion(s->mch.smram, MCH_HOST_BRIDGE_SMBASE_ADDR,
+    memory_region_add_subregion(s->smram, MCH_HOST_BRIDGE_SMBASE_ADDR,
                                 &s->mch.smbase_window);
 
-    init_pam(&s->mch.pam_regions[0], OBJECT(s), s->mch.ram_memory,
-             s->mch.system_memory, s->mch.pci_address_space,
+    init_pam(&s->mch.pam_regions[0], OBJECT(s), s->ram_memory,
+             s->system_memory, s->pci_address_space,
              PAM_BIOS_BASE, PAM_BIOS_SIZE);
     for (i = 0; i < ARRAY_SIZE(s->mch.pam_regions) - 1; ++i) {
-        init_pam(&s->mch.pam_regions[i + 1], OBJECT(s), s->mch.ram_memory,
-                 s->mch.system_memory, s->mch.pci_address_space,
+        init_pam(&s->mch.pam_regions[i + 1], OBJECT(s), s->ram_memory,
+                 s->system_memory, s->pci_address_space,
                  PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE, PAM_EXPAN_SIZE);
     }
 
     phb->bus = pci_root_bus_new(DEVICE(s), "pcie.0",
-                                s->mch.pci_address_space,
-                                s->mch.address_space_io,
+                                s->pci_address_space,
+                                s->address_space_io,
                                 0, TYPE_PCIE_BUS);
 
     qdev_realize(DEVICE(&s->mch), BUS(phb->bus), errp);
@@ -338,23 +338,23 @@ static void q35_host_initfn(Object *obj)
                                    &pehb->size, OBJ_PROP_FLAG_READ);
 
     object_property_add_link(obj, MCH_HOST_PROP_RAM_MEM, TYPE_MEMORY_REGION,
-                             (Object **) &s->mch.ram_memory,
+                             (Object **) &s->ram_memory,
                              qdev_prop_allow_set_link_before_realize, 0);
 
     object_property_add_link(obj, MCH_HOST_PROP_SMRAM_MEM, TYPE_MEMORY_REGION,
-                             (Object **) &s->mch.smram,
+                             (Object **) &s->smram,
                              qdev_prop_allow_set_link_before_realize, 0);
 
     object_property_add_link(obj, MCH_HOST_PROP_PCI_MEM, TYPE_MEMORY_REGION,
-                             (Object **) &s->mch.pci_address_space,
+                             (Object **) &s->pci_address_space,
                              qdev_prop_allow_set_link_before_realize, 0);
 
     object_property_add_link(obj, MCH_HOST_PROP_SYSTEM_MEM, TYPE_MEMORY_REGION,
-                             (Object **) &s->mch.system_memory,
+                             (Object **) &s->system_memory,
                              qdev_prop_allow_set_link_before_realize, 0);
 
     object_property_add_link(obj, MCH_HOST_PROP_IO_MEM, TYPE_MEMORY_REGION,
-                             (Object **) &s->mch.address_space_io,
+                             (Object **) &s->address_space_io,
                              qdev_prop_allow_set_link_before_realize, 0);
 }
 
-- 
2.39.1


