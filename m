Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AA96897E5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:39:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNuNW-000844-2G; Fri, 03 Feb 2023 06:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNT-00082f-P4
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:12 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNR-0001EF-3W
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:11 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so5807832wmb.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 03:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T7gfeI3mnZ+Wy6rurWRcclNKo/AI2l33cgu5mda3V+c=;
 b=y0H+WM/0RHQyjaSUvRiTy+/3im9WNQXEoc+hyue/zdwO841cTsyjcKxBjKK+5Y9ePH
 PfIZoPsBaCJ/c0aYPqXSI7fHtpS+sDaYyK3hZX2myB55QRvSPs/tHQcHQYV6DxvfBIfq
 B4FbtEWNE12zePp+BzYqpVY9zHrpVZq5I1MdqbpoTudSAzBH93H9o4pUp756NvY4Q0IU
 5JOsru0y4GpfmFI9KcZLKNT9qdZxNw3uLyNKhEQYUVc5cwVc0nAMbSaSf6XU01ylIRDu
 +lFRcerS3xGOguQs4bOgmKSh51fFSWWU4e8KkvRVQX6ipGU9/LAdH+Ddmrj5evFa4Pu+
 K+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T7gfeI3mnZ+Wy6rurWRcclNKo/AI2l33cgu5mda3V+c=;
 b=y//ugFVOatM1dlu3WF+ysMV8FJp/BqgqYJ0u92rUpV4xIK1mzvePuQAzV4t2Y28BX3
 lCq0niYcWW53CgoEtuGbbJylL3fgi7TLRSi6tHLnTyWABh+V8Q8uSJ/4r3aSzCNO7U3y
 iVQuccPKblSobcixdx/0Z/SrF5c3GHCo3PxmZXJ3JRK+/D29WtyjWf1tDNKDDg+oCNHj
 BkIGOlYHogFs2U8dUWDxKtHYORzPqsTr9M6dnPqzRj8wBjr9s2viG4Zx4pQxG5Eb8/vK
 dLa+/470/DLf4SCCJfeHDRc3xzq4TfbVs6T5EbEZyVX5xMUr4oliXl1Z7PQdMPGIOgLy
 9QZQ==
X-Gm-Message-State: AO0yUKWsO9iR529qJ0JnkfsWeBxz73tCK/GV2CwKwV4O81sD0LUH+E7Y
 XCF4llyvnN4q/ZrHlUvNNxoiupbDnOVHBHLY
X-Google-Smtp-Source: AK7set8Pz+d8AWJP1aBvlRJq0HZVK72zJNp7WX8Df/J1mtHKjTxtmsscba1fWi3E5w4L01GSg4Up6A==
X-Received: by 2002:a05:600c:288:b0:3d3:513c:240b with SMTP id
 8-20020a05600c028800b003d3513c240bmr8646952wmk.7.1675424227498; 
 Fri, 03 Feb 2023 03:37:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p30-20020a1c545e000000b003de2fc8214esm2531614wmi.20.2023.02.03.03.37.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 03:37:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 3/9] hw/arm/nrf51: QOM-alias 'flash-size' property in SoC
 object
Date: Fri,  3 Feb 2023 12:36:44 +0100
Message-Id: <20230203113650.78146-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203113650.78146-1-philmd@linaro.org>
References: <20230203113650.78146-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

No need to use an intermediate 'flash-size' property in the
SoC object. Alias the property, so when the machine (here
microbit) sets the value on the SoC, it is propagated to
the flash object.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/microbit.c          |  5 ++++-
 hw/arm/nrf51_soc.c         | 10 +---------
 hw/nvram/nrf51_nvm.c       |  6 +++++-
 include/hw/arm/nrf51_soc.h |  1 -
 4 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index 50df362088..79b5574884 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -36,6 +36,7 @@ static void microbit_init(MachineState *machine)
     MicrobitMachineState *s = MICROBIT_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mr;
+    int64_t flash_size;
 
     object_initialize_child(OBJECT(machine), "nrf51", &s->nrf51,
                             TYPE_NRF51_SOC);
@@ -43,6 +44,8 @@ static void microbit_init(MachineState *machine)
     object_property_set_link(OBJECT(&s->nrf51), "memory",
                              OBJECT(system_memory), &error_fatal);
     sysbus_realize(SYS_BUS_DEVICE(&s->nrf51), &error_fatal);
+    flash_size = object_property_get_int(OBJECT(&s->nrf51),
+                                         "flash-size", &error_abort);
 
     /*
      * Overlap the TWI stub device into the SoC.  This is a microbit-specific
@@ -57,7 +60,7 @@ static void microbit_init(MachineState *machine)
                                         mr, -1);
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-                       0, s->nrf51.flash_size);
+                       0, flash_size);
 }
 
 static void microbit_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 34da0d62f0..cc4a636c51 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -24,9 +24,7 @@
  * are supported in the future, add a sub-class of NRF51SoC for
  * the specific variants
  */
-#define NRF51822_FLASH_PAGES    256
 #define NRF51822_SRAM_PAGES     16
-#define NRF51822_FLASH_SIZE     (NRF51822_FLASH_PAGES * NRF51_PAGE_SIZE)
 #define NRF51822_SRAM_SIZE      (NRF51822_SRAM_PAGES * NRF51_PAGE_SIZE)
 
 #define BASE_TO_IRQ(base) ((base >> 12) & 0x1F)
@@ -122,11 +120,6 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
                        BASE_TO_IRQ(NRF51_RNG_BASE)));
 
     /* UICR, FICR, NVMC, FLASH */
-    if (!object_property_set_uint(OBJECT(&s->nvm), "flash-size",
-                                  s->flash_size, errp)) {
-        return;
-    }
-
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->nvm), errp)) {
         return;
     }
@@ -199,6 +192,7 @@ static void nrf51_soc_init(Object *obj)
     object_initialize_child(obj, "rng", &s->rng, TYPE_NRF51_RNG);
 
     object_initialize_child(obj, "nvm", &s->nvm, TYPE_NRF51_NVM);
+    object_property_add_alias(obj, "flash-size", OBJECT(&s->nvm), "flash-size");
 
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_NRF51_GPIO);
 
@@ -215,8 +209,6 @@ static Property nrf51_soc_properties[] = {
     DEFINE_PROP_LINK("memory", NRF51State, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("sram-size", NRF51State, sram_size, NRF51822_SRAM_SIZE),
-    DEFINE_PROP_UINT32("flash-size", NRF51State, flash_size,
-                       NRF51822_FLASH_SIZE),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvram/nrf51_nvm.c b/hw/nvram/nrf51_nvm.c
index 7f1db8c423..bfae028fcd 100644
--- a/hw/nvram/nrf51_nvm.c
+++ b/hw/nvram/nrf51_nvm.c
@@ -26,6 +26,9 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 
+#define NRF51822_FLASH_PAGES    256
+#define NRF51822_FLASH_SIZE     (NRF51822_FLASH_PAGES * NRF51_PAGE_SIZE)
+
 /*
  * FICR Registers Assignments
  * CODEPAGESIZE      0x010
@@ -358,7 +361,8 @@ static void nrf51_nvm_reset(DeviceState *dev)
 }
 
 static Property nrf51_nvm_properties[] = {
-    DEFINE_PROP_UINT32("flash-size", NRF51NVMState, flash_size, 0x40000),
+    DEFINE_PROP_UINT32("flash-size", NRF51NVMState,
+                       flash_size, NRF51822_FLASH_SIZE),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index e52a56e75e..8cf0c21614 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -45,7 +45,6 @@ struct NRF51State {
     MemoryRegion twi;
 
     uint32_t sram_size;
-    uint32_t flash_size;
 
     MemoryRegion *board_memory;
 
-- 
2.38.1


