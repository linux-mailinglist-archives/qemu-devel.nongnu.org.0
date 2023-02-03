Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D8689C66
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:58:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxUC-0002WO-Du; Fri, 03 Feb 2023 09:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUA-0002Uz-EM
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:18 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxU7-0005xE-V4
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:18 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso6214958wms.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T7gfeI3mnZ+Wy6rurWRcclNKo/AI2l33cgu5mda3V+c=;
 b=zfE1tKdxzx0uKfjd8INXMPrMnB30oF7VsFg/WfIThH1WKj6dF5HDFNGOi1gnr7j8bv
 hHklH0PQrZ6CYOWT4Z6k4p3HUixcEmoLOI945v9q1D+eIQSdHwPX9iWqTYeGQ2goS5Kz
 qc6H3N5zdlQJLlue2g/+8PMOkG55OYiyl0oLLS6EzWqMgC4stLNsS9v7heAASRzz4j+K
 uCPPwTeNLi8a1VscZhIvUk93GFdsTlkR5cJnQ9BwNbUdLXj+7O9vr6JBZctYtrFMe2By
 aN3jnnZnvST1aYx52mQUEwI85pCD6s0oNCGgfITT4RbTT1D8KLZWsSx6glEjX61r0hFR
 MLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T7gfeI3mnZ+Wy6rurWRcclNKo/AI2l33cgu5mda3V+c=;
 b=Ppnn/UCf6jGJliO8MyFvof3VDvOsjSx2HoBgYoHvSRbI67nmxVrx6Rwh/RJn1dmL2m
 SIhXF++Nq7U5Fj7jR+3UHF1ew6mz+OY5ZNq+HjglN0t/zExLfu/Uy/DlRbcpW6Pm0Eoz
 urM2/ZYNT/UNOyYylwOd3cuZMWO+Fx8AKJDMbIhHvXQeUlfWPjNgPHw4qlyJUNiVX6CS
 LMjkxg6vTMigAN9Kjc9IGyybq6tu1HkOzezchl06/sxW64uJYnYVzY/GGlisW3N3fIZs
 ByJ0QeepFZBjXi0TIobWo9Gk71xbgYstLDeKLXRrc4uZyXH9EgiaK6fcX4ruxTac/pTV
 3ORw==
X-Gm-Message-State: AO0yUKV5LgJOmHeTllmJPB2Zc2WL/ixMSYFs3fkbMSIiWugYNR5EhGFt
 55svd4bTrUmJCximrFWaXSgGlQfb+hk4/Mnm
X-Google-Smtp-Source: AK7set8/10zYS/FESlC3R/DkI0eVPpwLqq1SbGQyGKU3SkNJt1rji5e/lArZ2nrao2qh1f7jM//q9A==
X-Received: by 2002:a05:600c:314a:b0:3df:ee43:860b with SMTP id
 h10-20020a05600c314a00b003dfee43860bmr812324wmo.23.1675436174176; 
 Fri, 03 Feb 2023 06:56:14 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b003da28dfdedcsm3332092wmo.5.2023.02.03.06.56.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 07/15] hw/arm/nrf51: Alias 'flash-size' QOM property in SoC
 object
Date: Fri,  3 Feb 2023 15:55:28 +0100
Message-Id: <20230203145536.17585-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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


