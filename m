Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A767666BE83
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:01:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHP5f-0005RS-3l; Mon, 16 Jan 2023 07:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP5J-0005Nd-IJ; Mon, 16 Jan 2023 07:59:33 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP5H-00017c-Oy; Mon, 16 Jan 2023 07:59:33 -0500
Received: by mail-ej1-x636.google.com with SMTP id v6so24894785ejg.6;
 Mon, 16 Jan 2023 04:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/GmSyQtA9EZqK3gmKwXH6/dze8F/QLFLhSnRdmS42qw=;
 b=a0EzVJVjBHm/IwUy/rPSwVl3/wJuG9rN6Rn8qibz2yqOvMOrJyOuqgkaLOQxK3NtfP
 5jRjnVeuZr1+gkF7jFfdy0ZfTTE48AM26G3DcIcyw+YVuGmkV0cp7HpVYuJ3Q8rdkSah
 AOjQOOs9MwNYKYdoWuH/Pq/GzbNkqsrjld4wmm97B8oQTDsQlEuD8Eyb6f38yDRRofdb
 e017G0XXPX7laWFNAdvjAPqFHfS/5Lw4ICkUqdoKiL+SeTqOlILXDwOVFPiJS9SjLJed
 uR02+wWAkkXM6jRhia5uHtc+WpwMEPY0ziaNClu3yOSobyTsQNiyoolIXbT/D+Zz2udg
 T+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/GmSyQtA9EZqK3gmKwXH6/dze8F/QLFLhSnRdmS42qw=;
 b=mW95g2Hp0JsrdZ9PGwQ1MDIxwhbiEMuSHartFuPu7rzkopxhdD4hjoFi07xYeGcmd1
 y0sduxLgtUSqbPaYtWkJ+/osJIXSmfMbto+HMWkpPsUfgWWaiOjOx+dCIdw2KM9kmhJh
 b6lDr9M5kmQCO4e7vDU/ri1XAkNa93rPMdvKdmF6zjbEYFeH6DPBwnCBjPZ0FUWh2EuY
 AuZU5xIwct/pI6DcpiUaWT6rcrp0Kt2SPJ82ml2pEaqKB5q56Na7CoemKPuVrvEx8ACX
 pohoNGpZe36myS/lsIfygycfjU8po6EWgRFiGNp0kQker/obc3DRkygueFK7yG2mhFgq
 BgBw==
X-Gm-Message-State: AFqh2krORWhTmmyBoJG7zFy+66AMaoH3Sov3AIlCtM/n4eHyIYdvUAP5
 IVxOeLKjvwncUViDKrE2SjMKRgtD09Y=
X-Google-Smtp-Source: AMrXdXuO/95i0AUc7D4L/3+Orw2P/6c4nYTqkiJcRNEuVcYchQnTiC3sfUWzAIoeIisaMKJsADkajg==
X-Received: by 2002:a17:906:6881:b0:84d:4d6c:a462 with SMTP id
 n1-20020a170906688100b0084d4d6ca462mr23840629ejr.25.1673873969655; 
 Mon, 16 Jan 2023 04:59:29 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 um41-20020a170907cb2900b0086c4fbb8507sm3201517ejc.225.2023.01.16.04.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 04:59:29 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 6/8] hw/acpi/acpi_aml_interface: Extract qbus_build_aml()
Date: Mon, 16 Jan 2023 13:58:40 +0100
Message-Id: <20230116125842.66817-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116125842.66817-1-shentey@gmail.com>
References: <20230116125842.66817-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/acpi/acpi_aml_interface.h |  3 +++
 hw/acpi/acpi_interface.c             | 10 ++++++++++
 hw/i2c/smbus_ich9.c                  |  5 +----
 hw/isa/lpc_ich9.c                    |  5 +----
 hw/isa/piix3.c                       |  5 +----
 5 files changed, 16 insertions(+), 12 deletions(-)

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
diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index ee50ba1f2c..52ba77f3fc 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -97,13 +97,10 @@ static void ich9_smbus_realize(PCIDevice *d, Error **errp)
 
 static void build_ich9_smb_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
-    BusChild *kid;
     ICH9SMBState *s = ICH9_SMB_DEVICE(adev);
     BusState *bus = BUS(s->smb.smbus);
 
-    QTAILQ_FOREACH(kid, &bus->children, sibling) {
-            call_dev_aml_func(DEVICE(kid->child), scope);
-    }
+    qbus_build_aml(bus, scope);
 }
 
 static void ich9_smb_class_init(ObjectClass *klass, void *data)
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 0ab0a341be..d5d4b0f177 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -813,7 +813,6 @@ static void ich9_send_gpe(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
     Aml *field;
-    BusChild *kid;
     ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
     BusState *bus = BUS(s->isa_bus);
     Aml *sb_scope = aml_scope("\\_SB");
@@ -835,9 +834,7 @@ static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     aml_append(sb_scope, field);
     aml_append(scope, sb_scope);
 
-    QTAILQ_FOREACH(kid, &bus->children, sibling) {
-            call_dev_aml_func(DEVICE(kid->child), scope);
-    }
+    qbus_build_aml(bus, scope);
 }
 
 static void ich9_lpc_class_init(ObjectClass *klass, void *data)
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index eabad7ba58..93077bb3b9 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -317,7 +317,6 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
     Aml *field;
-    BusChild *kid;
     Aml *sb_scope = aml_scope("\\_SB");
     BusState *bus = qdev_get_child_bus(DEVICE(adev), "isa.0");
 
@@ -333,9 +332,7 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     aml_append(sb_scope, field);
     aml_append(scope, sb_scope);
 
-    QTAILQ_FOREACH(kid, &bus->children, sibling) {
-        call_dev_aml_func(DEVICE(kid->child), scope);
-    }
+    qbus_build_aml(bus, scope);
 }
 
 static void pci_piix3_class_init(ObjectClass *klass, void *data)
-- 
2.39.0


