Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DEE6AAAB8
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:28:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTnO-0003US-Fd; Sat, 04 Mar 2023 10:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTnM-0003Tr-Ih
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:36 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmx-00088x-T9
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:36 -0500
Received: by mail-ed1-x534.google.com with SMTP id g3so21714874eda.1
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677943629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cv7RSnZYYMp3BxNHAK5pG1yMVnE9Pc0AJgvfjnGnrII=;
 b=FxwNMvnlbCjE9h/N8SpdeMtVSaDYKhuvqjE9rBK7pUiFBTZ/bD0LGUpKHURVQHkOzo
 xN5h0hyxY6RC/PCbpJ/5YLswVmpPhafHH5xBgEL0fuG1VDEabYqDa8WHy0txJ5gUIFcD
 ZOtw2shdYqs4IdZGa69sIYh4o33ZYPOO6pTzx2MOmB5sEPCVvEPK8M9oPIntysCKqOPS
 52RTRmWnKJ/bwsJyQWONhDJV/kRltxlW9hkGeTu+eQIsSrFtE4uDlKlYmacCR1lOmzYt
 xs4pEPyXMG7eZoWZ9Q4OqCdjcLmEOX8yR3RoZjqWKbuv1o4OXxGxvoBKLBi+VvNoUjg7
 54/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677943629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cv7RSnZYYMp3BxNHAK5pG1yMVnE9Pc0AJgvfjnGnrII=;
 b=CfWJ/eDyKTYx/NxNgCAWTwn4Lt6XGMEXNm9wYgs6VP8JARj+iyqLJRuBazf3TwcZ36
 ciMMrHw92I9QUiSsLLCbEQCxMdHkNfFd/5EUXyc+SMdWDQ/5oRV7ZzaJxh7XjI35iXpe
 ZNXXmHR5SDOsv+0b2nTDcx8M8AfIFDGXCpwLEUcUO5wwjR8SdrCnZjtAzmTHdPj45em/
 fBdfUDHZT0bePCbOEOTJ9wy5vTHScLDbRJ+eEkxukgWfTWXGdTi0qsMRZ33UJFVsf/Ol
 6cwSCM0ka7ycrGWnFgj4BhiFtqGKMDrnCvrY4xlZ8zjRITNIGBmxBOw4sjUkcVhN7J33
 yLTw==
X-Gm-Message-State: AO0yUKUSujwqVWP00CtZtrWpa0wVnJKg9u0QLVRA1kCWoOE3lWLitEMp
 toPHHWKfYAvgFhf+N6PcGlRUJdw/3JE=
X-Google-Smtp-Source: AK7set902Pa0MK76ndvz66jRoedWF/TcumBePqH+1PiqPTkqMtVQOlon76PHTZlHE7JuJo0xyiPvpw==
X-Received: by 2002:a17:906:6d53:b0:8b1:2614:edfe with SMTP id
 a19-20020a1709066d5300b008b12614edfemr8282011ejt.9.1677943629633; 
 Sat, 04 Mar 2023 07:27:09 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906398700b008dd6bf721c2sm2170540eje.106.2023.03.04.07.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:27:09 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 13/13] hw/pci-host/q35: Move MemoryRegion pointers to host
 device
Date: Sat,  4 Mar 2023 16:26:48 +0100
Message-Id: <20230304152648.103749-14-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304152648.103749-1-shentey@gmail.com>
References: <20230304152648.103749-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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
index 1e0f5b4fbf..769bdffcc2 100644
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
@@ -346,23 +346,23 @@ static void q35_host_initfn(Object *obj)
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
2.39.2


