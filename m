Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF3A65EEED
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:39:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJO-0002yV-7E; Thu, 05 Jan 2023 09:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJF-0002p7-7N; Thu, 05 Jan 2023 09:33:33 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJC-0006vC-RT; Thu, 05 Jan 2023 09:33:32 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w1so24198529wrt.8;
 Thu, 05 Jan 2023 06:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uXlrvOa3A/irt3N+CTuOpnNg0yCdkaNUaBnHde+1e/4=;
 b=EGkLae+aa7DCTgooD4E7AWXwhGT9RKLCmyTKxq4naIZX1UvZsM2v5Zxa32we1Rt+DQ
 ICkvZ6T/l8wdnYsymnB74RKebWTr2Gu2DAa5bb2oGBBEbjNjwQBpH04Nw0/Gfnd3LR/Y
 c08FzQYbCzyb4HYwhx87B1GB2oj25t6GDK/MiOtUdA8AexuUgBRFwVVPP1Syk1fPtR7W
 +4Ka6JaEJ2VioxqMw0OAFu6UsHby9DAZ8GgsN9mY2KisCrpO1FekmzHXJ5wCPizQk2gy
 ZBITdmrDdZVsSbeSuzjV/9J49S5lAoY45mptD4L4PgS1vmv98g4MiUvJJg2B0CEVHDCL
 z02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uXlrvOa3A/irt3N+CTuOpnNg0yCdkaNUaBnHde+1e/4=;
 b=AcVCAu58WIPWYQAbapBgsjIvx95NDttcWtUsPoed4uYsaF0+iTlZDXKtEm7agNwufP
 pl1kWQ5VCKXZhgzgLHTRLehoM0+6T4wXSo9hQQB0vGbPGdEYPB8XMa+K6/zYdv/foBfz
 LbGEfG00JbjjxEYYyCT4LyFzI0+pHVWA39a9E5quBaeuNRG+XC0ZwPU5F6E9V/2rbeHJ
 cSqgNfepMoEmqu84S1k5VSqqn088LVIoWWPQb2aHiKLFWA8gwBLSZNXtvRrFT/xyftYn
 bhzZ5cnwKpG0EAjctXij//EWtbND6NlJSOv0dHzZBA5qSterV42npFfbJe76bDEDTZtd
 ap6w==
X-Gm-Message-State: AFqh2kqd6CA0JD+XdvE2Nu49xAjpiJGtKB2mokpidhUJImzrQtkiAUPq
 m7QKnQNqQuESRP0HO4VPofPsTTcO3A0Vgg==
X-Google-Smtp-Source: AMrXdXtj0SdMc6mm3wNWpOXMcYNjYX0cZvtcHuTsKX7nIboVnS0x3qAmjYK8TtJz/zUILJ8sNZKJXw==
X-Received: by 2002:adf:e610:0:b0:272:ca60:e5ad with SMTP id
 p16-20020adfe610000000b00272ca60e5admr31385532wrm.59.1672929209578; 
 Thu, 05 Jan 2023 06:33:29 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:29 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 21/31] hw/isa/piix4: Make PIIX4's ACPI and USB functions
 optional
Date: Thu,  5 Jan 2023 15:32:18 +0100
Message-Id: <20230105143228.244965-22-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42b.google.com
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

This aligns PIIX4 with PIIX3.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-30-shentey@gmail.com>
---
 hw/isa/piix4.c  | 44 ++++++++++++++++++++++++++++++++------------
 hw/mips/malta.c |  6 ++++--
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index de60ceef73..de4133f573 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -51,9 +51,16 @@ struct PIIX4State {
     PCIIDEState ide;
     UHCIState uhci;
     PIIX4PMState pm;
+
+    uint32_t smb_io_base;
+
     /* Reset Control Register */
     MemoryRegion rcr_mem;
     uint8_t rcr;
+
+    bool has_acpi;
+    bool has_usb;
+    bool smm_enabled;
 };
 
 OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
@@ -234,17 +241,26 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     }
 
     /* USB */
-    qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
-    if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
-        return;
+    if (s->has_usb) {
+        object_initialize_child(OBJECT(dev), "uhci", &s->uhci,
+                                TYPE_PIIX4_USB_UHCI);
+        qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
+        if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
+            return;
+        }
     }
 
     /* ACPI controller */
-    qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
-    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
-        return;
+    if (s->has_acpi) {
+        object_initialize_child(OBJECT(s), "pm", &s->pm, TYPE_PIIX4_PM);
+        qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
+        qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", s->smb_io_base);
+        qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", s->smm_enabled);
+        if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
+            return;
+        }
+        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
     }
-    qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
 
     pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
 }
@@ -255,13 +271,16 @@ static void piix4_init(Object *obj)
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
-    object_initialize_child(obj, "uhci", &s->uhci, TYPE_PIIX4_USB_UHCI);
-
-    object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
-    qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", 0x1100);
-    qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", 0);
 }
 
+static Property piix4_props[] = {
+    DEFINE_PROP_UINT32("smb_io_base", PIIX4State, smb_io_base, 0),
+    DEFINE_PROP_BOOL("has-acpi", PIIX4State, has_acpi, true),
+    DEFINE_PROP_BOOL("has-usb", PIIX4State, has_usb, true),
+    DEFINE_PROP_BOOL("smm-enabled", PIIX4State, smm_enabled, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void piix4_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -280,6 +299,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
      */
     dc->user_creatable = false;
     dc->hotpluggable = false;
+    device_class_set_props(dc, piix4_props);
 }
 
 static const TypeInfo piix4_info = {
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index ef3e10dc4d..a930a91f00 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1448,8 +1448,10 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, true,
-                                            TYPE_PIIX4_PCI_DEVICE);
+    piix4 = pci_new_multifunction(PIIX4_PCI_DEVFN, true,
+                                  TYPE_PIIX4_PCI_DEVICE);
+    qdev_prop_set_uint32(DEVICE(piix4), "smb_io_base", 0x1100);
+    pci_realize_and_unref(piix4, pci_bus, &error_fatal);
     isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
 
     dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "ide"));
-- 
2.39.0


