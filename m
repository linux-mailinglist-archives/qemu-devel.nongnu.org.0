Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1B365B76C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 22:37:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCSTE-0008H1-4Z; Mon, 02 Jan 2023 16:35:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCSTB-0008Fw-Jk
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:45 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCSTA-0005B7-10
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:45 -0500
Received: by mail-ej1-x631.google.com with SMTP id qk9so69227582ejc.3
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 13:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7hyvY3JWBoATeou/9rB1bwHPuTVRUibflv0giDEMRFI=;
 b=FFEt7jlJJ+TZncL9s1i0SklCgyxtm7oXcgRQkgj1jE/dUm5xg4LuIlrUbaq8eTpWQk
 lusWPMYsPPe89MlCOjXfmbss+PluOmAxo6TNTCn9VkwqzVNEZ3pVIGV+6zPOo/B7hbEh
 FmoABY83bkE7ljMZ/86Ed1q7lLc0TapiAISU8cMWHLoCo4wI4jM8GQazvPxntgfkxhiz
 2ZSA4IZW5Si/6jksdfwVNRNxrFq3EWZxMZttbBJnMHMVsowEnu9KUUccK7YbD9iPZamu
 DParMymbvqglGiQez25zSFsN1UKJDDtUYdY3QfXN5LHP3fVI24Qal2+w+ixfoMNzXLhj
 V9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7hyvY3JWBoATeou/9rB1bwHPuTVRUibflv0giDEMRFI=;
 b=k5whUmxWj7JcJvUfQmDmfxhRRsdbKLyNQLjNxLWXycobtjKJle8Jo61fg9YnYfCUWA
 dUmCjXE2F8Ab2gHh7pUPtwqSR+sa++bxChs9F+VafjrFIQVuecEh2lk9/Dy9ohwgrzv0
 ecTuM2NbWuTLc06cIvnP6tV4sW+ed+htG9NdoGfY5Zr1grUwvt/v45Ue2zL3J+X/1lRJ
 s59L0eTDidWFU49LOm8kHiIx9ESp0hKdOiRpnQqGf9t4q0mndlp5cz8SYnKP/6nkK6iB
 5HSsKnKhpa1Zy/fxM/o8cDEmkxz8LjqS02JLrfUjy2dV9ND00Iu0yOMiTQeIZJ7q+6Dv
 yzVA==
X-Gm-Message-State: AFqh2kqFhFA9qla5krTB8osQ/U7XIdb39WKpmW2CuW/bv2Eph7XIAi9U
 MftPCfsxwsp2iesaYUsWkKeVrX0Tfog=
X-Google-Smtp-Source: AMrXdXvIXbwA5JGbCDQQQ/3trRrkBQ1pENW/JDFoCpw2RIHuU1jqIwyoQaXoQv83ATNGp2NKk0iVhw==
X-Received: by 2002:a17:906:1410:b0:7c0:eba3:e2e with SMTP id
 p16-20020a170906141000b007c0eba30e2emr32660029ejc.31.1672695342501; 
 Mon, 02 Jan 2023 13:35:42 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:42 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/6] hw/isa/piix: Avoid Xen-specific variant of
 piix_write_config()
Date: Mon,  2 Jan 2023 22:35:02 +0100
Message-Id: <20230102213504.14646-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102213504.14646-1-shentey@gmail.com>
References: <20230102213504.14646-1-shentey@gmail.com>
MIME-Version: 1.0
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

Subscribe to pci_bus_fire_intx_routing_notifier() instead which allows for
having a common piix_write_config() for all PIIX device models.

While at it, move the subscription into machine code in order to resolve
TYPE_PIIX3_XEN_DEVICE.

In a possible future followup, pci_bus_fire_intx_routing_notifier() could
be adjusted in such a way that subscribing to it doesn't require
knowledge of the device firing it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 18 ++++++++++++++++++
 hw/isa/piix.c     | 22 +---------------------
 2 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c02f68010d..7ef0054b3a 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -86,6 +86,21 @@ static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
     return (pci_intx + slot_addend) & 3;
 }
 
+static void piix_intx_routing_notifier_xen(PCIDevice *dev)
+{
+    int i;
+
+    /* Scan for updates to PCI link routes (0x60-0x63). */
+    for (i = 0; i < PIIX_NUM_PIRQS; i++) {
+        uint8_t v = dev->config_read(dev, PIIX_PIRQCA + i, 1);
+        if (v & 0x80) {
+            v = 0;
+        }
+        v &= 0xf;
+        xen_set_pci_link_route(i, v);
+    }
+}
+
 /* PC hardware initialisation */
 static void pc_init1(MachineState *machine,
                      const char *host_type, const char *pci_type)
@@ -248,6 +263,9 @@ static void pc_init1(MachineState *machine,
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
 
         if (xen_enabled()) {
+            pci_device_set_intx_routing_notifier(
+                        pci_dev, piix_intx_routing_notifier_xen);
+
             /*
              * Xen supports additional interrupt routes from the PCI devices to
              * the IOAPIC: the four pins of each PCI device on the bus are also
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index ac04781f46..d4cdb3dadb 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -125,26 +125,6 @@ static void piix_write_config(PCIDevice *dev, uint32_t address, uint32_t val,
     }
 }
 
-static void piix3_write_config_xen(PCIDevice *dev,
-                                   uint32_t address, uint32_t val, int len)
-{
-    int i;
-
-    /* Scan for updates to PCI link routes (0x60-0x63). */
-    for (i = 0; i < len; i++) {
-        uint8_t v = (val >> (8 * i)) & 0xff;
-        if (v & 0x80) {
-            v = 0;
-        }
-        v &= 0xf;
-        if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
-            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
-        }
-    }
-
-    piix_write_config(dev, address, val, len);
-}
-
 static void piix_reset(DeviceState *dev)
 {
     PIIXState *d = PIIX_PCI_DEVICE(dev);
@@ -490,7 +470,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config_xen;
+    k->config_write = piix_write_config;
     k->realize = piix3_realize;
     /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
-- 
2.39.0


