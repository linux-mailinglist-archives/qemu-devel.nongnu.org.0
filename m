Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8E2581B0A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:27:53 +0200 (CEST)
Received: from localhost ([::1]:55546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGR9k-00019x-ME
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQB-0006LL-IR
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQ7-00051x-Ip
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vGBMWsxmCt/y7feB6L2gahZSd7fcXIeSGu61umWiBGY=;
 b=RIccC0Ejaen36twGjedZh6+HQV2eRdwmIojXAp2CQTpMLjCQLTcL76NpgHmjsZHkRFBu2Q
 0u88y5JHyH/+SbNf4IKfQpA0RPwsd0r7Hm+ReyyfBsUgSa5JMJ4OYFJP9CMtr24qU3pOfC
 x/lMWLpefKIQJ1tHoE8bLX6WYrtnV40=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-KJO1CijAMgKYXUUVK62Hlg-1; Tue, 26 Jul 2022 15:40:42 -0400
X-MC-Unique: KJO1CijAMgKYXUUVK62Hlg-1
Received: by mail-wm1-f71.google.com with SMTP id
 bh18-20020a05600c3d1200b003a32044cc9fso8029294wmb.6
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=vGBMWsxmCt/y7feB6L2gahZSd7fcXIeSGu61umWiBGY=;
 b=kFT0oxZYNkTpKHw6zVj6h8uLA/Et+/FSWi8Ki+msCxOYf7HSTMGjUsjCxN92kfvoPa
 SWVRNrvnn3EnKZm8KoVvpFs3wjfV9mQe5dD/tpz0gANEvQLGU5Hz9fEBSaK1rwWSbFCe
 TC1hxl6AmAAUlM+wL687Z/vvutQzud9AqV6Y8n+TqxLXAYU/6I8N6il6XYZdCzWTThHg
 vP2KFXggLmZpW53odxctJu9mJOm4qFnAjdf0qxVlHrV9i7X9+l/6iMcqATYqV4sInLJa
 0jsSbUqXFuG63dHLbUk6V7+XRiYte5QtYp7Wq7w8tm8VEl5iYUgq3caF5AnAl2ORCikJ
 puEQ==
X-Gm-Message-State: AJIora/KGi8/HTpQb+RzWzlv8l0HCH4BI1gM0SyFBv6c70eABREi6Kbm
 WJGi/8ppKqXrzuckWaqskgxqbLrDBhCXSA9ljoNM1TUV2+nuXLNbj8YpDodtnBQxjGv+mATBPse
 18qstglneW4yili4/P9JjtJ8JIYvedoaJaAfx/pm3cFzKP1rAxo09SWtocEYK
X-Received: by 2002:a7b:c453:0:b0:3a3:1c65:ff97 with SMTP id
 l19-20020a7bc453000000b003a31c65ff97mr482941wmi.180.1658864440556; 
 Tue, 26 Jul 2022 12:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uvyYqqonebrom7qJZL3jrZ5ufTYFG5EuOJAR8KoG0du8+LTzW94TI2xkBRJHXp+gIiCHTpEw==
X-Received: by 2002:a7b:c453:0:b0:3a3:1c65:ff97 with SMTP id
 l19-20020a7bc453000000b003a31c65ff97mr482927wmi.180.1658864440269; 
 Tue, 26 Jul 2022 12:40:40 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003a31f71c5b8sm26908380wmq.27.2022.07.26.12.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:39 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 06/16] i386/pc: create pci-host qdev prior to pc_memory_init()
Message-ID: <20220726193858.177462-7-mst@redhat.com>
References: <20220726193858.177462-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726193858.177462-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Joao Martins <joao.m.martins@oracle.com>

At the start of pc_memory_init() we usually pass a range of
0..UINT64_MAX as pci_memory, when really its 2G (i440fx) or
32G (q35). To get the real user value, we need to get pci-host
passed property for default pci_hole64_size. Thus to get that,
create the qdev prior to memory init to better make estimations
on max used/phys addr.

This is in preparation to determine that host-phys-bits are
enough and also for pci-hole64-size to be considered to relocate
ram-above-4g to be at 1T (on AMD platforms).

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220719170014.27028-3-joao.m.martins@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci-host/i440fx.h | 3 ++-
 hw/i386/pc_piix.c            | 7 +++++--
 hw/i386/pc_q35.c             | 6 +++---
 hw/pci-host/i440fx.c         | 5 ++---
 4 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index 52518dbf08..d02bf1ed6b 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -35,7 +35,8 @@ struct PCII440FXState {
 
 #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
 
-PCIBus *i440fx_init(const char *host_type, const char *pci_type,
+PCIBus *i440fx_init(const char *pci_type,
+                    DeviceState *dev,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index fbf9465318..b8b3ce3408 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
     ram_addr_t lowmem;
+    DeviceState *i440fx_host;
 
     /*
      * Calculate ram split, for memory below and above 4G.  It's a bit
@@ -164,9 +165,11 @@ static void pc_init1(MachineState *machine,
         pci_memory = g_new(MemoryRegion, 1);
         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
         rom_memory = pci_memory;
+        i440fx_host = qdev_new(host_type);
     } else {
         pci_memory = NULL;
         rom_memory = system_memory;
+        i440fx_host = NULL;
     }
 
     pc_guest_info_init(pcms);
@@ -200,8 +203,8 @@ static void pc_init1(MachineState *machine,
         const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
                                          : TYPE_PIIX3_DEVICE;
 
-        pci_bus = i440fx_init(host_type,
-                              pci_type,
+        pci_bus = i440fx_init(pci_type,
+                              i440fx_host,
                               system_memory, system_io, machine->ram_size,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 12cc76aaf8..f4d23b1469 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -203,12 +203,12 @@ static void pc_q35_init(MachineState *machine)
                             pcms->smbios_entry_point_type);
     }
 
-    /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
-
     /* create pci host bus */
     q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
 
+    /* allocate ram and load rom/bios */
+    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
+
     object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
                              OBJECT(ram_memory), NULL);
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 1c5ad5f918..d5426ef4a5 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -237,7 +237,8 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
     }
 }
 
-PCIBus *i440fx_init(const char *host_type, const char *pci_type,
+PCIBus *i440fx_init(const char *pci_type,
+                    DeviceState *dev,
                     MemoryRegion *address_space_mem,
                     MemoryRegion *address_space_io,
                     ram_addr_t ram_size,
@@ -246,7 +247,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *pci_address_space,
                     MemoryRegion *ram_memory)
 {
-    DeviceState *dev;
     PCIBus *b;
     PCIDevice *d;
     PCIHostState *s;
@@ -254,7 +254,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     unsigned i;
     I440FXState *i440fx;
 
-    dev = qdev_new(host_type);
     s = PCI_HOST_BRIDGE(dev);
     b = pci_root_bus_new(dev, NULL, pci_address_space,
                          address_space_io, 0, TYPE_PCI_BUS);
-- 
MST


