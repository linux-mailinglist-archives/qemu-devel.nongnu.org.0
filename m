Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCA766C3DD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:30:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRQm-0001Jv-7m; Mon, 16 Jan 2023 10:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQk-0001Ir-8W; Mon, 16 Jan 2023 10:29:50 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQi-00086W-Kv; Mon, 16 Jan 2023 10:29:50 -0500
Received: by mail-ej1-x631.google.com with SMTP id kt14so10023720ejc.3;
 Mon, 16 Jan 2023 07:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0LyHCLycQ/SrUG8WLZEXiUnOm83Y3IxqhjP2L2hOFIg=;
 b=o6OEBQGh76Blf1OSvymyC/ESxDHopZv02/xco7ZwRrggnhq6ima+ITMDknaBFWGy9N
 WeJrSIvRyzm6LVZALeKNsIT4KGmHgfuU1A/Xl0OcvOcMcxxo4jE/sJ6n/I5ulziocAvI
 gRevrt/aDt7FAECVI9JJMG8qhaG9ksyHo9q6FgJziil6H1oZH/OhZO9tdGr3K7yChOd9
 qZLQedY9KA5b4DC//r2tx9Ncl/yrL9tsg4cTgImmA56TK7b4pQ0OxXhj6v5oYM0zz7sy
 4tD/nr/tulMI/BpeEBWMBgs04LUY73t/OuA/+XwpUuK2M0UBb/YOJ6/FBVPYznGvqvIh
 RaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0LyHCLycQ/SrUG8WLZEXiUnOm83Y3IxqhjP2L2hOFIg=;
 b=nbPcQTM2UMf3LuXQPMG8wcCDFEaXQNL0nZQ39VALtNV9P/CP8JACRyfyyMyX3su2+t
 sN52l7bvvoHCV/7TcAZSDA4r1DxffU3TOimBRuM2IoNxB27GMlPI/SCHNXrhgoaC5iGV
 CBuYfQNXarPGfoalBwfCc6ciHUwF2V8/PIvuQNA2OT/BM2Zo8bMwn9FiGe9rtZY+Qjz7
 5gPP6n3XqwQwUZQog8pSEBpBMKURfEmTgXtD6PLEKar4mLXNDweyM4cvKy+nj8NLl4n4
 YeqPCg10skSg3S22dC+P3MG57fhXszs2LvOe0OIkED95nT6HOze34HWoc5Jpq9QpXeNY
 5kTw==
X-Gm-Message-State: AFqh2kohbbq4DgOQIk4quv0xz0zJLGPXSFKwu39AB7uWnBxsPzt7B88Q
 Mo4PYEpCLCztsQ3ICRRHi8uhLBRjBbw=
X-Google-Smtp-Source: AMrXdXt3N6CKJFemKejbDkqhXXM+C5oXWovnr8GE9TqmGDResUXDnKfRIw8pUT8hEfwBgLh+xU1rUA==
X-Received: by 2002:a17:906:1419:b0:84c:9016:79ae with SMTP id
 p25-20020a170906141900b0084c901679aemr52851395ejc.53.1673882987397; 
 Mon, 16 Jan 2023 07:29:47 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170906b08300b007c0688a68cbsm12180764ejy.176.2023.01.16.07.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:29:47 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 6/7] hw/isa/isa-bus: Turn isa_build_aml() into
 qbus_build_aml()
Date: Mon, 16 Jan 2023 16:29:07 +0100
Message-Id: <20230116152908.147275-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116152908.147275-1-shentey@gmail.com>
References: <20230116152908.147275-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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

Frees isa-bus.c from implicit ACPI dependency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/acpi/acpi_aml_interface.h |  3 +++
 include/hw/isa/isa.h                 |  1 -
 hw/acpi/acpi_interface.c             | 10 ++++++++++
 hw/i386/acpi-microvm.c               |  3 ++-
 hw/isa/isa-bus.c                     | 10 ----------
 5 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/include/hw/acpi/acpi_aml_interface.h b/include/hw/acpi/acpi_aml_interface.h
index 436da069d6..11748a8866 100644
--- a/include/hw/acpi/acpi_aml_interface.h
+++ b/include/hw/acpi/acpi_aml_interface.h
@@ -3,6 +3,7 @@
 
 #include "qom/object.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/qdev-core.h"
 
 #define TYPE_ACPI_DEV_AML_IF "acpi-dev-aml-interface"
 typedef struct AcpiDevAmlIfClass AcpiDevAmlIfClass;
@@ -46,4 +47,6 @@ static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
     }
 }
 
+void qbus_build_aml(BusState *bus, Aml *scope);
+
 #endif
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 6c8a8a92cb..25acd5c34c 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -86,7 +86,6 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp);
 ISADevice *isa_create_simple(ISABus *bus, const char *name);
 
 ISADevice *isa_vga_init(ISABus *bus);
-void isa_build_aml(ISABus *bus, Aml *scope);
 
 /**
  * isa_register_ioport: Install an I/O port region on the ISA bus.
diff --git a/hw/acpi/acpi_interface.c b/hw/acpi/acpi_interface.c
index c668d361f6..8637ff18fc 100644
--- a/hw/acpi/acpi_interface.c
+++ b/hw/acpi/acpi_interface.c
@@ -2,6 +2,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/acpi_aml_interface.h"
 #include "qemu/module.h"
+#include "qemu/queue.h"
 
 void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event)
 {
@@ -12,6 +13,15 @@ void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event)
     }
 }
 
+void qbus_build_aml(BusState *bus, Aml *scope)
+{
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+        call_dev_aml_func(DEVICE(kid->child), scope);
+    }
+}
+
 static void register_types(void)
 {
     static const TypeInfo acpi_dev_if_info = {
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index d8a444d06c..fec22d85c1 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -26,6 +26,7 @@
 
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/generic_event_device.h"
@@ -129,7 +130,7 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
 
     sb_scope = aml_scope("_SB");
     fw_cfg_add_acpi_dsdt(sb_scope, x86ms->fw_cfg);
-    isa_build_aml(ISA_BUS(isabus), sb_scope);
+    qbus_build_aml(BUS(isabus), sb_scope);
     build_ged_aml(sb_scope, GED_DEVICE, x86ms->acpi_dev,
                   GED_MMIO_IRQ, AML_SYSTEM_MEMORY, GED_MMIO_BASE);
     acpi_dsdt_add_power_button(sb_scope);
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 1bee1a47f1..f155b80010 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -24,7 +24,6 @@
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "hw/isa/isa.h"
-#include "hw/acpi/acpi_aml_interface.h"
 
 static ISABus *isabus;
 
@@ -188,15 +187,6 @@ ISADevice *isa_vga_init(ISABus *bus)
     }
 }
 
-void isa_build_aml(ISABus *bus, Aml *scope)
-{
-    BusChild *kid;
-
-    QTAILQ_FOREACH(kid, &bus->parent_obj.children, sibling) {
-        call_dev_aml_func(DEVICE(kid->child), scope);
-    }
-}
-
 static void isabus_bridge_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-- 
2.39.0


