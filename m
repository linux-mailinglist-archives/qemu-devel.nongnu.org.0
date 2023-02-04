Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBD168AAD4
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 16:11:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOKC7-0002Ut-Gw; Sat, 04 Feb 2023 10:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKC5-0002U3-1d; Sat, 04 Feb 2023 10:11:09 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKC3-0006bQ-Ar; Sat, 04 Feb 2023 10:11:08 -0500
Received: by mail-ej1-x62c.google.com with SMTP id p26so22795845ejx.13;
 Sat, 04 Feb 2023 07:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Z9BSrGLPwa8H52MdZBz+kDsknrSpQNb66zdwdFnT9g=;
 b=cLP8qQbbKfrL5sf1m8dzcqVjo3JiWDFYGh95ky9Ja/DPV/J7AWcuy+dP4XKTfhX+3Y
 +HGzUayZq+rCb066EoQrYIBMutlTJamd9YjW8x49Nr4A7q0M0o8OPLyAM/wy29Jivo85
 piw+W/8brvFGKbAL4kGJhn4TspmRG2MOOSdnonzpnXRCARIG7/ZKgspe7qFjEADFvzuM
 bXEJiYbsVgDCy2mhMEDHsoDeHmHloi2e2g3NB+jFBJNH+jZ8Fn/z44r4eR+zollOPCvm
 1k5Qg2cj/rsIy/6PkFnGEIQ2THHHjlp4WU0ZUGELAZrEOZYMKOacFT0SgthxQZE2hiYy
 cfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Z9BSrGLPwa8H52MdZBz+kDsknrSpQNb66zdwdFnT9g=;
 b=Ca32l0eZEW/Qlb1Akt0oPJmyGrN7BonHbWaIi7y7NfTR/AzIkMLEQXVnLyMXxovYI0
 v8BP/1b67EVJLgTJP9r1+ZdI2RWDGvqfPfLK2P94KCDvIRWlgCbEiwvxs6rYOCd3Ytr8
 j39iRVn0JSV1QN+OQRjiDGUczUChOB8FDcKPVbzzyYF8QGsYDLcw+p6Brd+6Tt27O4CP
 W8AqIdyTagEri3odB/zYZ+dk69C7KlghQ+H4qjY6ZnJoSYNIDfaNEawwM5wjiwsuYQ7z
 hhgUwEXcDuYm69hp7U2JgDg/LNhvlVkSJFumfI+Sg/v8Q6GrezEqGNvS8HD3ElGaunR6
 ppwA==
X-Gm-Message-State: AO0yUKXNwvjPX2B5IDD7+7vVhDBsAR2AljjwKVClK7px++B3z2lt5hF7
 5ijYIfkYw5XnhMIBVCtCgT0c6DwzqRo=
X-Google-Smtp-Source: AK7set/lmeMdEbTBXfAU2Ve05oH2LD8UW4pImsbw7kco8U+gLjdfVSz03Yr+5lMlQ0LwbS2KEcfZ/w==
X-Received: by 2002:a17:906:135a:b0:881:d1ad:1640 with SMTP id
 x26-20020a170906135a00b00881d1ad1640mr13454640ejb.57.1675523465366; 
 Sat, 04 Feb 2023 07:11:05 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-183-077-083.77.183.pool.telefonica.de. [77.183.77.83])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0088a2aebb146sm2937922ejt.52.2023.02.04.07.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 07:11:04 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 7/9] hw/pci-host/pam: Make init_pam() usage more readable
Date: Sat,  4 Feb 2023 16:10:25 +0100
Message-Id: <20230204151027.39007-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204151027.39007-1-shentey@gmail.com>
References: <20230204151027.39007-1-shentey@gmail.com>
MIME-Version: 1.0
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


