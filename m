Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4AD682BF0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:55:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpD7-0006HI-Fj; Tue, 31 Jan 2023 06:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD5-0006Cg-AV; Tue, 31 Jan 2023 06:53:59 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD3-0002MA-N6; Tue, 31 Jan 2023 06:53:59 -0500
Received: by mail-ed1-x531.google.com with SMTP id fi26so14124286edb.7;
 Tue, 31 Jan 2023 03:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3yIebqAQdVBnY9ggCXk4emJQdJ27qXicTYyoeqC3khY=;
 b=XyLMrjl/Q+8QA4nrLKNE5rosrDCTYg8HRwZwgp9r3dQAN2GOpI+G/KUYYdrfI4DFVw
 ba+rF9IQB6lY56RJrupP5qNGoANofHpEdfvPFfWMAdRWpoNg23S9tV3n8q8J0BMQFzxq
 rU2wc+o61rnq/yEeEt9WiqQ5G9euJMb6gmcIY24wOmu6OU1PNoMahHvzI25VVCrBoAST
 iQeqphRB9/UYXH0bSE925rGcUjwRNiY1t/Tgq03hKJKdqm22dJoSMFi+WVf9NNTnD0wv
 K3T5TGVk/TXhtegYgMQaWJXrRg6b0PMu1MsI62YnskFlE2WqUmdRLIeVnfsg98l955sR
 6a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3yIebqAQdVBnY9ggCXk4emJQdJ27qXicTYyoeqC3khY=;
 b=BXZ4CDEP6sZc71cp0cNRlbV/sJaDrrRC+oUpwzPHrdviTlJD1u9d2yLJ2DCDhbkwMM
 6Rnx9ai5jOs7meegwwgyX/ycEY5VYGbIHORIJZxx0Wl73imKZ7IyFm9pjdmS4yV68Qc2
 zNutffKugboOojc1eKBm91A0Mk1jCu91lzJsW8PUoz1riP5LyqN6yxfkqaD+KE1doZXd
 rk30XrfCP3AgVtKNvDgIixZ4wjvZYa1mj/HJAG2y/wzH56p7vKASjAD30dPjzt/C3yYC
 Jvry4Z72RNS/x0e2q5V959MzQUph4QcsIF8MGDQSgQx1LI+lsTydHEvhyXW+OCA1nTve
 jpuw==
X-Gm-Message-State: AO0yUKUIx6r1NekL9i3rp7xQo0DLp8h0x6hi5tFiEwED9jnMD+9xTu7s
 sD2zl1E6VR9vW6pLMgyXuor0s/yjK4w=
X-Google-Smtp-Source: AK7set+WqbUVBLCchQZClUcOZOhi+CFOr/KwU0n4LRtVnZ2f1lG3rb8MeOAxRkEBV/cyev3c0Y9eKg==
X-Received: by 2002:a05:6402:5508:b0:49e:9751:2f17 with SMTP id
 fi8-20020a056402550800b0049e97512f17mr13598542edb.17.1675166035786; 
 Tue, 31 Jan 2023 03:53:55 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:53:55 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 06/20] hw/i386/pc_{q35,
 piix}: Minimize usage of get_system_memory()
Date: Tue, 31 Jan 2023 12:53:12 +0100
Message-Id: <20230131115326.12454-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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
index bc4fd06c1e..3ae2f41cf3 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -124,6 +124,7 @@ static void pc_q35_init(MachineState *machine)
     DeviceState *lpc_dev;
     BusState *idebus[MAX_SATA_PORTS];
     ISADevice *rtc_state;
+    MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *system_io = get_system_io();
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
@@ -191,7 +192,7 @@ static void pc_q35_init(MachineState *machine)
         rom_memory = pci_memory;
     } else {
         pci_memory = NULL;
-        rom_memory = get_system_memory();
+        rom_memory = system_memory;
     }
 
     pc_guest_info_init(pcms);
@@ -214,7 +215,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
+    pc_memory_init(pcms, system_memory, rom_memory, &ram_memory,
                    pci_hole64_size);
 
     object_property_add_child(OBJECT(machine), "q35", phb);
@@ -223,7 +224,7 @@ static void pc_q35_init(MachineState *machine)
     object_property_set_link(phb, MCH_HOST_PROP_PCI_MEM,
                              OBJECT(pci_memory), NULL);
     object_property_set_link(phb, MCH_HOST_PROP_SYSTEM_MEM,
-                             OBJECT(get_system_memory()), NULL);
+                             OBJECT(system_memory), NULL);
     object_property_set_link(phb, MCH_HOST_PROP_IO_MEM,
                              OBJECT(system_io), NULL);
     object_property_set_int(phb, PCI_HOST_BELOW_4G_MEM_SIZE,
-- 
2.39.1


