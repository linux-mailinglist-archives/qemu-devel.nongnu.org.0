Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5AA6AD114
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:06:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIww-00072j-HM; Mon, 06 Mar 2023 17:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwp-0006wv-TX
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:47 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwl-0006nx-T9
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:47 -0500
Received: by mail-pl1-x62a.google.com with SMTP id x11so7550660pln.12
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140283;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qUFbOZZ5FU+gsShKlpocvlGsQua6rirJE5ys9meJ4h0=;
 b=iqyzRLynO/tN4qpQWJ2QcO3mRkcoefAaK8C2atJ2HXIBDshC7GaHQmwiE45GCFrHWV
 JtySd5BJ2TKn1NiPKoAbvdp4czg0JvC9rjcWOa7Swiq/cb+7KEiWfOpnBNqFXRxidqd6
 WJQw7Frv4wJcLYhIlW7MUEuRO/AUxujeTnDgcJPSeixR7L8k6qLTg8m3qXR3EY48REgn
 iQthZQaZ2a+nji5ubilb8uG3yAnnUV1Jn/Q4UDUDzXJ6qxDMSFsEY6gbWcaDguILPvty
 +nJEjWVHK9lSDAc5No9H33/20iW4hb/BstbmM94Z8jRC1HGTYojvruIpp4YirQxSiDSA
 M0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140283;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qUFbOZZ5FU+gsShKlpocvlGsQua6rirJE5ys9meJ4h0=;
 b=OH9xDGNbFShjfA8+gy79ByT904L3M3uwA/332uUWdiAl/NBPr2IauogWr8hfM5VPsA
 XdxxIRzK14paaD9GvVRutLvmOT6SdzyLTKQD7ODh8QJiV9S7wfbQh24iZBLuzkpX0bjk
 YgdJOtuYRCGBidRD6p3Qcrqg6lBkJtJVMXwouK7jjlW0BFfeXLFs4gUGCRatvWsx02WR
 YKUWYGPwiJsFCnfwJmdXuHXqpF7V2Yrkz4oVHyHtjp623hZztjS1LGXvu/kaXAfGNQKn
 zEOCVgnsuEpNnSJ3fU6ZWB5HuxWaiEuc3FQZG9+i7+XDUPMGBc/2PHBZclIGIJREhyRs
 TTJw==
X-Gm-Message-State: AO0yUKU95IuaMlxEQaItPYCgy3Kw0phk5+66A7rHLWQ8uWwXloJSJA/I
 srZyLbjhlNY7npAGHYE86wikxJK76EsZX9hZnog=
X-Google-Smtp-Source: AK7set9gZ3doQtesOfGDXStcFEd7b8ZyhUwPpfiVEVmBOCfomSMmo1OSAPTzJOxj1UwsFwv9qCCylA==
X-Received: by 2002:a17:90b:3886:b0:234:1645:5266 with SMTP id
 mu6-20020a17090b388600b0023416455266mr12837629pjb.30.1678140283091; 
 Mon, 06 Mar 2023 14:04:43 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 f6-20020a17090ac28600b00233cde36909sm8253524pjt.21.2023.03.06.14.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:42 -0800 (PST)
Subject: [PULL 16/22] hw/riscv/virt: Add a switch to disable ACPI
Date: Mon,  6 Mar 2023 14:02:53 -0800
Message-Id: <20230306220259.7748-17-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Sunil V L <sunilvl@ventanamicro.com>

ACPI will be enabled by default. Add a switch to turn off
for testing and debug purposes.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-ID: <20230302091212.999767-3-sunilvl@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/riscv/virt.c         | 29 +++++++++++++++++++++++++++++
 include/hw/riscv/virt.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5a059489b5..90579a4c0e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -50,6 +50,7 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 #include "hw/acpi/aml-build.h"
+#include "qapi/qapi-visit-common.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -1533,6 +1534,7 @@ static void virt_machine_instance_init(Object *obj)
 
     s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+    s->acpi = ON_OFF_AUTO_AUTO;
 }
 
 static char *virt_get_aia_guests(Object *obj, Error **errp)
@@ -1607,6 +1609,28 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
     s->have_aclint = value;
 }
 
+bool virt_is_acpi_enabled(RISCVVirtState *s)
+{
+    return s->acpi != ON_OFF_AUTO_OFF;
+}
+
+static void virt_get_acpi(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+    OnOffAuto acpi = s->acpi;
+
+    visit_type_OnOffAuto(v, name, &acpi, errp);
+}
+
+static void virt_set_acpi(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &s->acpi, errp);
+}
+
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
                                                         DeviceState *dev)
 {
@@ -1678,6 +1702,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
                  "should be between 0 and %d.", VIRT_IRQCHIP_MAX_GUESTS);
     object_class_property_set_description(oc, "aia-guests", str);
+    object_class_property_add(oc, "acpi", "OnOffAuto",
+                              virt_get_acpi, virt_set_acpi,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "acpi",
+                                          "Enable ACPI");
 }
 
 static const TypeInfo virt_machine_typeinfo = {
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 6c7885bf89..62efebaa32 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -58,6 +58,7 @@ struct RISCVVirtState {
     int aia_guests;
     char *oem_id;
     char *oem_table_id;
+    OnOffAuto acpi;
 };
 
 enum {
@@ -123,4 +124,5 @@ enum {
 #define FDT_APLIC_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
                                  1 + FDT_APLIC_INT_CELLS)
 
+bool virt_is_acpi_enabled(RISCVVirtState *s);
 #endif
-- 
2.39.2


