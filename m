Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5942366AE4A
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 23:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGp0Q-00013C-PX; Sat, 14 Jan 2023 17:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0M-00012v-Dm
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:28:02 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0K-0003if-P5
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:28:02 -0500
Received: by mail-ej1-x632.google.com with SMTP id bk15so2533471ejb.9
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 14:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Br9tsj3IszJMPOMTWZCrt0qVOVX2hHgtMo+eZ0RApoM=;
 b=nvNOaq23564DWWNxLQqqhfw24gV5in2WPsF97XF3MUNvqgEuaqoHhNcRTLM2xM6wAu
 2OxcRDHAEhdxZj9z2OXo852xJmbIluHUSfsspmEQspjfocKK9hzZKp/GplZYhwwNupjJ
 u5VDvcNL8EUja42gcbuzEauZb0qLFfM9XmJ1c6nJMYyeZkwjAjWoCp7FG3FOU9QS1Tgj
 imYssAWaO0EnTtmQJUZVaCRm6fW+lkk1SJurR+18R4WXIxPqUVFBMSyUnz15ZWmYrsZA
 i0a6kp/Z3gKTBZgxz5cu9JRsqBH1/zDo3ghZwZ6oFykXpgTqmeuRjn9BR2PeP9eyIJqI
 dyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Br9tsj3IszJMPOMTWZCrt0qVOVX2hHgtMo+eZ0RApoM=;
 b=tOykuNyJHIHCKPbBb8VyiDjFP+1uoLe7rShBfvcovC4LRwsITKCxE1FORGDbDEteFl
 01SUMhQ+rA88g/GGHpvuo1+fRT3Yb4C1xXECrlruB91GxyLuG/qWG2eoYfHNhtks7jWV
 Qkm0Y23TeFvVjy1DqkYJQ2XP/ppGjH0KB7ZnN1VsG8OX9yKMA7/d7qg1oLVWnENbnO2H
 ZUFMOQCoyebKpWI7oPyAovUDmdwbRcneFsiuBLfbEDAKdF4ccCQHRVAiRDzd3OhKGbDi
 OzyaoRwym1l++w2r4YaOVpsp/nL7enAIpTMe6cb55xfyAIQO0yuRokiFhyCq4HWBhoIA
 K/TA==
X-Gm-Message-State: AFqh2kord8/rVUs7NtJ22sr3OD7qWk4kElV0tn6IrNvFpDq1KIeqC+xq
 Q8B9/JDT7EUAmJZFV4X33qbYl/B72gk=
X-Google-Smtp-Source: AMrXdXtFTAdidrtpnRcuLXM7y29iIce1SBuDBQSd0BHrLlfnhZISx9HyojEHKdgyBAYui2yAdi87UQ==
X-Received: by 2002:a17:907:8c0c:b0:7fd:f1b5:7fd5 with SMTP id
 ta12-20020a1709078c0c00b007fdf1b57fd5mr77500462ejc.19.1673735279193; 
 Sat, 14 Jan 2023 14:27:59 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-013-123-004.77.13.pool.telefonica.de. [77.13.123.4])
 by smtp.gmail.com with ESMTPSA id
 og5-20020a1709071dc500b0084d420503a3sm8324840ejc.178.2023.01.14.14.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 14:27:58 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 5/7] hw/acpi/acpi_aml_interface: Extract qbus_build_aml()
Date: Sat, 14 Jan 2023 23:27:36 +0100
Message-Id: <20230114222738.282478-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114222738.282478-1-shentey@gmail.com>
References: <20230114222738.282478-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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
 include/hw/acpi/acpi_aml_interface.h | 11 +++++++++++
 hw/i2c/smbus_ich9.c                  |  5 +----
 hw/isa/lpc_ich9.c                    |  5 +----
 hw/isa/piix3.c                       |  5 +----
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/include/hw/acpi/acpi_aml_interface.h b/include/hw/acpi/acpi_aml_interface.h
index 436da069d6..cb2f1c9910 100644
--- a/include/hw/acpi/acpi_aml_interface.h
+++ b/include/hw/acpi/acpi_aml_interface.h
@@ -2,7 +2,9 @@
 #define ACPI_AML_INTERFACE_H
 
 #include "qom/object.h"
+#include "qemu/queue.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/qdev-core.h"
 
 #define TYPE_ACPI_DEV_AML_IF "acpi-dev-aml-interface"
 typedef struct AcpiDevAmlIfClass AcpiDevAmlIfClass;
@@ -46,4 +48,13 @@ static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
     }
 }
 
+static inline void qbus_build_aml(BusState *bus, Aml *scope)
+{
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+        call_dev_aml_func(DEVICE(kid->child), scope);
+    }
+}
+
 #endif
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


