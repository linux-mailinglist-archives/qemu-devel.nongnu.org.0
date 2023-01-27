Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE967EB77
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 17:48:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLRtH-0002NM-37; Fri, 27 Jan 2023 11:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRt6-0002Kz-Nq; Fri, 27 Jan 2023 11:47:41 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRt5-0005fL-4B; Fri, 27 Jan 2023 11:47:40 -0500
Received: by mail-ed1-x534.google.com with SMTP id n6so2608282edo.9;
 Fri, 27 Jan 2023 08:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQLYhAFF4ygzxvntMyjp9iGgiLluMw3q8mDqHiv7CTQ=;
 b=qHyWiHS/Jx28ZO4drM2kjjHrw5y64xVQ7BUV2wzbBKXXkANu65TFeLxBaAARLFNoKQ
 3cTzpfRb7bgyFxLS+eASlBeuLEsxk2VX5SR1Qikuxwa5X1DWTC0DXwBukLjrNbUnX5jL
 5VkWc6bMp2GSbhtzBYDoeR5MRVzVo9Yw9WpyJVgyODwgIO5v7nB/IQlXheWe2zqVe3vh
 CbLTeJqgwC8SPSrJ0qOB6DxJjyLiZDY4+mkiR9Mc+x+A79iKxv47DDlyc/1oiaReVk0V
 lyUCzoe/DTkxAStzNm6AAOxu1MollCaFN+nlIdtiOgHnAZkl+LRHkzW671Um8WCxJFaY
 nrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQLYhAFF4ygzxvntMyjp9iGgiLluMw3q8mDqHiv7CTQ=;
 b=gQm++H/l7RmdmwC49OZ8yLG3H5XV/vAmRz5EVFm1kc7XislNWg7H5c3dP9P3//9u4b
 +KUCCbZS8Kd+aHX3IjlYH6wBX9Fte3B8B+DI5iwEBKLdF/uvIsSvIW8spNGEefbYp+QE
 xvPETEYPZkGwxfz8VnicyT+60THQORlTVU2gvwH6oeB44zQQISMgj4DT2d+jXwiKyW8G
 X/bH4V80iXhYKNS1JNYObsolnMPa7jV6SFSWBniiy6D9Ce82Hu0Rn7QE177mo7QxcGjE
 yWl4Pja7DKFlorvJFwfTNNEnmY7qrIlFd4smrmoUZZUByyrbR0bsWNIVUdEmdLZoqDRx
 PRXg==
X-Gm-Message-State: AFqh2koZKcVhBWDuBZ4hMwADZYHQIwOuT5iSkFVWAT+yjMt76fqkUZ9S
 G3cUVkkza+6pC0r21wSWmhbQqZtEM3/IUA==
X-Google-Smtp-Source: AMrXdXu/V9W2wsKwVOx1xN8Ydfy16lGud8QYvFSnhw0VxfXVZlgUxQfDBknwT9kijeV7epZ5l0E7RA==
X-Received: by 2002:a05:6402:4496:b0:49e:ca5:244a with SMTP id
 er22-20020a056402449600b0049e0ca5244amr45909191edb.1.1674838056988; 
 Fri, 27 Jan 2023 08:47:36 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056402050f00b0049ef70a2894sm2574414edv.38.2023.01.27.08.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 08:47:36 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 6/7] hw/i386/pc_{q35,
 piix}: Minimize usage of get_system_memory()
Date: Fri, 27 Jan 2023 17:47:17 +0100
Message-Id: <20230127164718.98156-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127164718.98156-1-shentey@gmail.com>
References: <20230127164718.98156-1-shentey@gmail.com>
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
index a97846ab9b..b97979bebb 100644
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
 
     object_property_add_child(OBJECT(machine), "q35", OBJECT(phb));
@@ -223,7 +224,7 @@ static void pc_q35_init(MachineState *machine)
     object_property_set_link(OBJECT(phb), MCH_HOST_PROP_PCI_MEM,
                              OBJECT(pci_memory), NULL);
     object_property_set_link(OBJECT(phb), MCH_HOST_PROP_SYSTEM_MEM,
-                             OBJECT(get_system_memory()), NULL);
+                             OBJECT(system_memory), NULL);
     object_property_set_link(OBJECT(phb), MCH_HOST_PROP_IO_MEM,
                              OBJECT(system_io), NULL);
     object_property_set_int(OBJECT(phb), PCI_HOST_BELOW_4G_MEM_SIZE,
-- 
2.39.1


