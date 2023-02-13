Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BACE3694C5D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:21:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbZa-0004hT-Kg; Mon, 13 Feb 2023 11:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZR-0004e6-8Z; Mon, 13 Feb 2023 11:20:49 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZP-0007vf-D7; Mon, 13 Feb 2023 11:20:48 -0500
Received: by mail-ej1-x62c.google.com with SMTP id sa10so33142888ejc.9;
 Mon, 13 Feb 2023 08:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sf/C8wu96e3AGJMHTR9jYdOWMQtcAUGt9XEkTJUN5LE=;
 b=n6iO3jpPPZhif11AqIVl5wkooqk46jWJM8wEsOQPNFsgeZfSg9jWmW7UD1UEidkZYt
 FE9URyLTc26tk40FAvOIFX+V9oyn0o/VQyl91tQVH7KV8pFkHjgEERpjuy9FObstT/t6
 1r5VPU9yY4A/DFtbTOAYlu+EbOiBfUD8r/k1ej5wNygr4XJN+YzMyY0kR4cAtzrg0u3j
 i4kAQNE9kDCzCEhWhAEFBYUs78Z2Qm36sXWGPumkbGMLx9EWgHKtW/ToyZzxL5VgTPnc
 pgCgCPJ9MoerWGD2ffeNZAL0HDwRGsB9rsthZn0L68HAShpUh720ZA5Mqqv5ulQiBfBM
 d4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sf/C8wu96e3AGJMHTR9jYdOWMQtcAUGt9XEkTJUN5LE=;
 b=5EdffMFr3/oO+GBDTxJwf/zugBk+53Y/srr4OqnXnNSK/fQnxfLWNdGBAuLoUOpMJb
 4XN+81+Sksm0jpwCcXm8mqmY2sw1d0Wpe6HJc+V3BJEFqBVm7WBdx5wJSXMhGkmY/VL/
 IHfq4vu4UgIdJiCpdjhDOQeAHF7XkTl7OhqbPEKZ3+7TKBoOtWEik8xkjr9iODfODfNV
 /RuxCz63MP1pLTwG4+B5UonpNGVwspHOifdKmFcP2caSW4rJ2YoP/PQzgtciE6DGmBHV
 WS3B3GIig02GXy22ijdanvA8DvHhwadDhYyRbZEUUQYcjWvoMqWyuksQVBm2TNpdXIZd
 r8PQ==
X-Gm-Message-State: AO0yUKU5NhrzdOspxVo6HqfO9aBmROcJVCDxrMybaPYz5EUy74EsKyVE
 wuaTXb/qDfANFyvgSKe+vTfeBkxeIm4=
X-Google-Smtp-Source: AK7set+kJbSw1XuHvRWbfKYq3XznVw8u4dKTrNpeLhsr7vAEc4PFyaytGSn1bl7fVlymPT/yp+z3Bw==
X-Received: by 2002:a17:906:4e54:b0:878:545b:e540 with SMTP id
 g20-20020a1709064e5400b00878545be540mr26659614ejw.51.1676305245741; 
 Mon, 13 Feb 2023 08:20:45 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906025400b008841aa86484sm6979952ejl.211.2023.02.13.08.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:20:45 -0800 (PST)
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
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 7/9] hw/pci-host/pam: Make init_pam() usage more readable
Date: Mon, 13 Feb 2023 17:20:02 +0100
Message-Id: <20230213162004.2797-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213162004.2797-1-shentey@gmail.com>
References: <20230213162004.2797-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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

Unlike pam_update() which takes the subject -- PAMMemoryRegion -- as
first argument, init_pam() takes it as fifth (!) argument. This makes it
quite hard to figure out what an init_pam() invocation actually
initializes. By moving the subject to the front this should become
clearer.

While at it, lower the DeviceState parameter to Object, also
communicating more clearly that this parameter is just the owner rather
than some (heavy?) dependency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci-host/pam.h |  5 +++--
 hw/pci-host/i440fx.c      | 10 +++++-----
 hw/pci-host/pam.c         | 12 ++++++------
 hw/pci-host/q35.c         |  8 ++++----
 4 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/include/hw/pci-host/pam.h b/include/hw/pci-host/pam.h
index c1fd06ba2a..005916f826 100644
--- a/include/hw/pci-host/pam.h
+++ b/include/hw/pci-host/pam.h
@@ -87,8 +87,9 @@ typedef struct PAMMemoryRegion {
     unsigned current;
 } PAMMemoryRegion;
 
-void init_pam(DeviceState *dev, MemoryRegion *ram, MemoryRegion *system,
-              MemoryRegion *pci, PAMMemoryRegion *mem, uint32_t start, uint32_t size);
+void init_pam(PAMMemoryRegion *mem, Object *owner, MemoryRegion *ram,
+              MemoryRegion *system, MemoryRegion *pci,
+              uint32_t start, uint32_t size);
 void pam_update(PAMMemoryRegion *mem, int idx, uint8_t val);
 
 #endif /* QEMU_PAM_H */
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 9c6882d3fc..61e7b97ff4 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -292,12 +292,12 @@ PCIBus *i440fx_init(const char *pci_type,
     object_property_add_const_link(qdev_get_machine(), "smram",
                                    OBJECT(&f->smram));
 
-    init_pam(dev, f->ram_memory, f->system_memory, f->pci_address_space,
-             &f->pam_regions[0], PAM_BIOS_BASE, PAM_BIOS_SIZE);
+    init_pam(&f->pam_regions[0], OBJECT(d), f->ram_memory, f->system_memory,
+             f->pci_address_space, PAM_BIOS_BASE, PAM_BIOS_SIZE);
     for (i = 0; i < ARRAY_SIZE(f->pam_regions) - 1; ++i) {
-        init_pam(dev, f->ram_memory, f->system_memory, f->pci_address_space,
-                 &f->pam_regions[i+1], PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE,
-                 PAM_EXPAN_SIZE);
+        init_pam(&f->pam_regions[i + 1], OBJECT(d), f->ram_memory,
+                 f->system_memory, f->pci_address_space,
+                 PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE, PAM_EXPAN_SIZE);
     }
 
     ram_size = ram_size / 8 / 1024 / 1024;
diff --git a/hw/pci-host/pam.c b/hw/pci-host/pam.c
index 454dd120db..68e9884d27 100644
--- a/hw/pci-host/pam.c
+++ b/hw/pci-host/pam.c
@@ -30,24 +30,24 @@
 #include "qemu/osdep.h"
 #include "hw/pci-host/pam.h"
 
-void init_pam(DeviceState *dev, MemoryRegion *ram_memory,
+void init_pam(PAMMemoryRegion *mem, Object *owner, MemoryRegion *ram_memory,
               MemoryRegion *system_memory, MemoryRegion *pci_address_space,
-              PAMMemoryRegion *mem, uint32_t start, uint32_t size)
+              uint32_t start, uint32_t size)
 {
     int i;
 
     /* RAM */
-    memory_region_init_alias(&mem->alias[3], OBJECT(dev), "pam-ram", ram_memory,
+    memory_region_init_alias(&mem->alias[3], owner, "pam-ram", ram_memory,
                              start, size);
     /* ROM (XXX: not quite correct) */
-    memory_region_init_alias(&mem->alias[1], OBJECT(dev), "pam-rom", ram_memory,
+    memory_region_init_alias(&mem->alias[1], owner, "pam-rom", ram_memory,
                              start, size);
     memory_region_set_readonly(&mem->alias[1], true);
 
     /* XXX: should distinguish read/write cases */
-    memory_region_init_alias(&mem->alias[0], OBJECT(dev), "pam-pci", pci_address_space,
+    memory_region_init_alias(&mem->alias[0], owner, "pam-pci", pci_address_space,
                              start, size);
-    memory_region_init_alias(&mem->alias[2], OBJECT(dev), "pam-pci", ram_memory,
+    memory_region_init_alias(&mem->alias[2], owner, "pam-pci", ram_memory,
                              start, size);
 
     memory_region_transaction_begin();
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index fa05844319..fd18920e7f 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -645,12 +645,12 @@ static void mch_realize(PCIDevice *d, Error **errp)
     object_property_add_const_link(qdev_get_machine(), "smram",
                                    OBJECT(&mch->smram));
 
-    init_pam(DEVICE(mch), mch->ram_memory, mch->system_memory,
-             mch->pci_address_space, &mch->pam_regions[0],
+    init_pam(&mch->pam_regions[0], OBJECT(mch), mch->ram_memory,
+             mch->system_memory, mch->pci_address_space,
              PAM_BIOS_BASE, PAM_BIOS_SIZE);
     for (i = 0; i < ARRAY_SIZE(mch->pam_regions) - 1; ++i) {
-        init_pam(DEVICE(mch), mch->ram_memory, mch->system_memory,
-                 mch->pci_address_space, &mch->pam_regions[i+1],
+        init_pam(&mch->pam_regions[i + 1], OBJECT(mch), mch->ram_memory,
+                 mch->system_memory, mch->pci_address_space,
                  PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE, PAM_EXPAN_SIZE);
     }
 }
-- 
2.39.1


