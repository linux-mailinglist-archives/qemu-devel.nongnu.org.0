Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784E257311B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:29:27 +0200 (CEST)
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXkL-0001DC-2L
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZW-0005bw-H5
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:14 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZU-0004nV-Nb
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:14 -0400
Received: by mail-ed1-x530.google.com with SMTP id t3so12857492edd.0
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d5wvoUqATSvMX82nH9ks317lgXhND7qx1Yhp+Jpwjpw=;
 b=eKqa2AeTgAMV8L/QVttch9bOHBpXGbrdxGzHPaS2OWQGEmkPJqV8nuQKkhTMAEgmY4
 8zc8mS665M7dUHd3WM0y5gMka5bUO2IhZQCu9Oz/BZpr1khEbnzgpk1WCm8WvATYkWN9
 L38XfAKdjfajYyPoABrnnXECQ9RFkMF4xFOmYvNY3AVzO/t75GCgvDXUeVpeQZDLdh71
 gf5p6/KsWlAchMolRsY2iuUGcpAS1J4tpWlZGj9r2PUhfi1xEXYsafXk7pkDooDw1Vtn
 czP02NJKTaPFLTo9nMRCMFp8/G57JDOT/G2Xg2QNcgqR0fLCijVkThFjTk+9dsHe5g7l
 tqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d5wvoUqATSvMX82nH9ks317lgXhND7qx1Yhp+Jpwjpw=;
 b=F+b5Lh7ZZMOyP9IsfPwWeHSVoZga2x/INH8UKlgbYV7Wz01ASW5Pffitba1NPXqf+a
 /T1mzCum21aLbKQwB/qRTMg6ZtOdtU98JTIgGAoWmwHuVIF5a3JRVa4MiNCbRc2LXN1p
 /BJzz7trLp7S04VquEPweJqofim5zQLNOdk8KZaaAZY5arP3j90iDxlA7KqNitBETX7Q
 VRu8gjgUQIUdd1WwzgdvgCkEU089yO6hDa9GAZuQOXlWtgisO69oYA7u4z/WXhfFpU9F
 dJxIS72/SZiFEgREFk6Q6MdPYcpKra7oezd/CIgUbQUAAwVaHEFlsVe2yyQWcuYt2jgE
 ldug==
X-Gm-Message-State: AJIora9HDtmL6cAtMAii/xySPqjfricEeJ/GKSAAfuEyl+ISv275KQgL
 yIB0TfSMUFCnFdUwmGOG6jvCPRhB6R0=
X-Google-Smtp-Source: AGRyM1v011CerVcdi5lWidUDebxZzdpShPuIWn1Lt0TU7NLYKBTYaks9PGJ0kLgU4Qgk3Mtsm/Sgxg==
X-Received: by 2002:a50:ce1d:0:b0:43a:742f:9db3 with SMTP id
 y29-20020a50ce1d000000b0043a742f9db3mr3170433edi.308.1657700290922; 
 Wed, 13 Jul 2022 01:18:10 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-210-047.77.183.pool.telefonica.de. [77.183.210.47])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7dccd000000b00435a62d35b5sm7483431edu.45.2022.07.13.01.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:18:10 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 01/11] hw/i386/pc: QOM'ify DMA creation
Date: Wed, 13 Jul 2022 10:17:25 +0200
Message-Id: <20220713081735.112016-2-shentey@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220713081735.112016-1-shentey@gmail.com>
References: <20220713081735.112016-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Just like in the real hardware, create the DMA in the southbridges.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc.c      | 3 ---
 hw/i386/pc_piix.c | 2 ++
 hw/isa/lpc_ich9.c | 3 +++
 hw/isa/piix3.c    | 9 +++++++--
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 774cb2bf07..c3602d166d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -47,7 +47,6 @@
 #include "multiboot.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/intc/i8259.h"
-#include "hw/dma/i8257.h"
 #include "hw/timer/i8254.h"
 #include "hw/input/i8042.h"
 #include "hw/irq.h"
@@ -1200,8 +1199,6 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         pcspk_init(pcms->pcspk, isa_bus, pit);
     }
 
-    i8257_dma_init(isa_bus, 0);
-
     /* Super I/O */
     pc_superio_init(isa_bus, create_fdctrl, pcms->i8042_enabled,
                     pcms->vmport != ON_OFF_AUTO_ON);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index a234989ac3..7ad677e967 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -26,6 +26,7 @@
 #include CONFIG_DEVICES
 
 #include "qemu/units.h"
+#include "hw/dma/i8257.h"
 #include "hw/loader.h"
 #include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
@@ -217,6 +218,7 @@ static void pc_init1(MachineState *machine,
         pci_bus = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
+        i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
     }
     isa_bus_irqs(isa_bus, x86ms->gsi);
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 4553b5925b..8694e58b21 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -34,6 +34,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qemu/range.h"
+#include "hw/dma/i8257.h"
 #include "hw/isa/isa.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
@@ -722,6 +723,8 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
     qdev_init_gpio_out_named(dev, lpc->gsi, ICH9_GPIO_GSI, GSI_NUM_PINS);
 
     isa_bus_irqs(isa_bus, lpc->gsi);
+
+    i8257_dma_init(isa_bus, 0);
 }
 
 static bool ich9_rst_cnt_needed(void *opaque)
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 48f9ab1096..44a9998752 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
+#include "hw/dma/i8257.h"
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
@@ -295,9 +296,11 @@ static const MemoryRegionOps rcr_ops = {
 static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    ISABus *isa_bus;
 
-    if (!isa_bus_new(DEVICE(d), get_system_memory(),
-                     pci_address_space_io(dev), errp)) {
+    isa_bus = isa_bus_new(DEVICE(d), get_system_memory(),
+                          pci_address_space_io(dev), errp);
+    if (!isa_bus) {
         return;
     }
 
@@ -307,6 +310,8 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
     qemu_register_reset(piix3_reset, d);
+
+    i8257_dma_init(isa_bus, 0);
 }
 
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
-- 
2.37.1


