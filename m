Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D2A662CBB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:29:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvuP-0003dE-Bp; Mon, 09 Jan 2023 12:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtk-0002lf-3r; Mon, 09 Jan 2023 12:25:24 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvti-0001Nt-7l; Mon, 09 Jan 2023 12:25:23 -0500
Received: by mail-ej1-x62b.google.com with SMTP id az20so2854588ejc.1;
 Mon, 09 Jan 2023 09:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nl9YHfs8H5C/I/vJkfFSixEY1FD1I5X9ikT4zscR/sc=;
 b=HUzg5cKKoiKxVsaGFwhM3KHd7XI38m9h6yjJkAmOkSngEaT/1TEOXWCKXCfrDKwPMy
 9aXhgPrbkinRIoRcUlA0+Y/l8dc/o6BRm260XJkJErrO0xJYUaCv6nn+mtKejRKo8C5Y
 8a1DJdixrwMsL11FBI2aNC0VkQ+8KnukKdbdmy0kMz4xU/2lFeKgORq0sY2p0IJvwmd1
 9V9phY/d6mKu0qNZbuVdCIuIWcj4+u1zn4T6wPOD/hFaOBd6E9b0b0uCiOGLBzEzCc+X
 uoN/xuTI/i7KF/913NRlK+eGs9YB7fjuB9LOxxb/4ahFeD+FHUF80sBmCqfE/1Hg9tss
 HxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nl9YHfs8H5C/I/vJkfFSixEY1FD1I5X9ikT4zscR/sc=;
 b=yo6KWt14LeTemSIBS12UGM+1mH6IEsmQHgF9a+yXIjwf9KzXwfDt5jF6NGPnlSvV10
 GkVEhlhEiTIKjuRGoYWbyAMSElGHLFHtT3gDzNms6jrXDkRTsHlajtw4yuXedX058jnD
 hCc4rUU+Jvsc03qvYdSxSlvrh3uELua4fU4sMZjCZBxsME5Dkc13t/xmeeim2u7C1UXG
 Zq8PcVVqjmqiuDygXSIyX+hIOlVXpfe1CXKSWCCrpckqXNfIodJQ6USi/ffbK3nDH3GB
 P6ATIeE+45Hg+ye+eM0uM54u41OWMmCw/WI0V07rga4ZTfONZ9n++VFx/igpDMHfSziL
 4TWg==
X-Gm-Message-State: AFqh2krFzYo7FKdlUipmGI8PxiLOBLHPjxEOd9f/lfBDWL2mq0MkZzIT
 4UWkeLfehYqU/5U2zliuOSgTXzwtrxAT5w==
X-Google-Smtp-Source: AMrXdXt3Bvdk4UQRnEd8iMdAfGRzlPZ3FNtdpipbex8dxpjzjBva52QU86tRIGWsP+5loZwe4IdvwA==
X-Received: by 2002:a17:906:d9c7:b0:84d:4923:366d with SMTP id
 qk7-20020a170906d9c700b0084d4923366dmr3397102ejb.44.1673285119081; 
 Mon, 09 Jan 2023 09:25:19 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:18 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 23/33] hw/isa/piix4: Make PIIX4's ACPI and USB functions
 optional
Date: Mon,  9 Jan 2023 18:23:36 +0100
Message-Id: <20230109172347.1830-24-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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
index 94d4c49bf5..4a2e0edd98 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1449,8 +1449,10 @@ void mips_malta_init(MachineState *machine)
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


