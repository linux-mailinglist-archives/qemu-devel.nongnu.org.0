Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3164F694C68
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:22:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbZR-0004dn-1T; Mon, 13 Feb 2023 11:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZO-0004bu-GX; Mon, 13 Feb 2023 11:20:46 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZM-0007xD-RX; Mon, 13 Feb 2023 11:20:46 -0500
Received: by mail-ej1-x62e.google.com with SMTP id ml19so33358380ejb.0;
 Mon, 13 Feb 2023 08:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=drXiSmMhmqlJvPhiv+dKQt+fuq5k4HQA4wYOcYoI5f8=;
 b=KrrOsalPPyenSN+6PpgseJUYt00uAJW3JzW4s8guam3GHTMCarAPwuHt8Xj8SVBace
 TFsH7XY5b5A4F8zUrOkM22ZsBQ3CAQYwtvv8zlzTUu4ik2G9T3B20ZQt8E/kAmWmLFxa
 HtHVjp0S0wEcrKMAti7syEcS0+NQpFKlWjaCFL+afb+UWTHgdp4R5ldDm++umgCjOyP8
 YlacrPLkL03Ag7hmHGw1drjE/RX+qR5pr0Aga/thXtUJdja3EWVbbExQW5xlG6Ho71kZ
 2lMgYVtoRcUSHCBF0Dll+jIrQYRwxaswORu9K8zayhEAthQMFo/7Z1YB6BK3QFBTQ/HM
 80VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=drXiSmMhmqlJvPhiv+dKQt+fuq5k4HQA4wYOcYoI5f8=;
 b=QPG1RCYTTEtoXyfIP0ERnj3OHx9SGXnDCJNSQDS98rAPqENB4yIWc/Oj/5zrr5+BrS
 ZpgboVlXcEOFX4wv0HJjOuGjTkBGoXX1pl5LsFpz099DDANWkp6HYwgSULCf9u12b9kE
 z34d1gF62IMgCczUkirnEjQFfKJ+tl2Nn9lLFPlrgdC92ZSrKjHgzhQb8u4JLdOnGzjQ
 a/SvlW73oaQuBGQ+FN7eZsyAvrfQ5jVoL8bylr+40vBqlmXVHU8UW0bGfdOxKq90sWaY
 +/AZB6b354vnysfXzHZIn1CqqW/Gu3rbtMHdj8SqMB+U+VvzxZryncDeIgdhdJ+W7CWL
 7g1Q==
X-Gm-Message-State: AO0yUKWbV9q1N5ozRgi9BxPSBMso0E2eBjM2/6o71NvD6P4xRsm/Q5fi
 D4CkmoIv1ThI05lbP4jt4X3jNljUoec=
X-Google-Smtp-Source: AK7set/m3qvuQUcycFKVIADubZwf/nc3FvFQm909JaiNgrhoXzl7o3oDjheUEi2P5Y93zipM3P/FNA==
X-Received: by 2002:a17:907:7da0:b0:8aa:c038:974c with SMTP id
 oz32-20020a1709077da000b008aac038974cmr31897628ejc.54.1676305242622; 
 Mon, 13 Feb 2023 08:20:42 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906025400b008841aa86484sm6979952ejl.211.2023.02.13.08.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:20:42 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 5/9] hw/i386/pc_{q35,
 piix}: Minimize usage of get_system_memory()
Date: Mon, 13 Feb 2023 17:20:00 +0100
Message-Id: <20230213162004.2797-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213162004.2797-1-shentey@gmail.com>
References: <20230213162004.2797-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/pc_piix.c | 2 +-
 hw/i386/pc_q35.c  | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index ee9d9a4175..5bde4533cc 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -241,7 +241,7 @@ static void pc_init1(MachineState *machine,
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
     } else {
         pci_bus = NULL;
-        isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
+        isa_bus = isa_bus_new(NULL, system_memory, system_io,
                               &error_abort);
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 71b7a30bb9..8253b49296 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -125,6 +125,7 @@ static void pc_q35_init(MachineState *machine)
     DeviceState *lpc_dev;
     BusState *idebus[MAX_SATA_PORTS];
     ISADevice *rtc_state;
+    MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *system_io = get_system_io();
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
@@ -192,7 +193,7 @@ static void pc_q35_init(MachineState *machine)
         rom_memory = pci_memory;
     } else {
         pci_memory = NULL;
-        rom_memory = get_system_memory();
+        rom_memory = system_memory;
     }
 
     pc_guest_info_init(pcms);
@@ -215,7 +216,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
+    pc_memory_init(pcms, system_memory, rom_memory, &ram_memory,
                    pci_hole64_size);
 
     object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
@@ -224,7 +225,7 @@ static void pc_q35_init(MachineState *machine)
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
                              OBJECT(pci_memory), NULL);
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_SYSTEM_MEM,
-                             OBJECT(get_system_memory()), NULL);
+                             OBJECT(system_memory), NULL);
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_IO_MEM,
                              OBJECT(system_io), NULL);
     object_property_set_int(OBJECT(q35_host), PCI_HOST_BELOW_4G_MEM_SIZE,
-- 
2.39.1


