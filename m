Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F395A65B768
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 22:37:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCSTG-0008HS-Qi; Mon, 02 Jan 2023 16:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCSTD-0008H3-TN
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:47 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCSTC-0005BZ-6a
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:47 -0500
Received: by mail-ej1-x635.google.com with SMTP id m18so69165458eji.5
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 13:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Di8D1ZLAqNG4YBVeY21LWd3M3jwmUnOPUPIRfWvH74o=;
 b=oKrx+5YbmTLqbEyB0IFlqqHxQljKl/Fp1de0CQdBSfdKl10T7XcJA8XTNLwawbTkeh
 j5cv6e8K3sfV/6QNn70B21D7ZKgQZTo6P0tzupn4POy+aqrOfkP+od97KKCbHnOo6Fpj
 sPkN9L6tV5zGaOfBboViBOI31hupccc6I1zTDQGrZnwnnQcNQ7H1IESNC/LCsbAvfHAZ
 tHza0+AzW+kC0P4eZuGrQfVFLSnww6j6TKQuz3rfwRxSJJBD6CJQdyvobGr3WA3BHfc3
 pRH+0ycpzvBgWh/4lVAbvjxJL97sgxaxg9vbiPlGIZI0NsS7h9yctI5oRHM+0gDXCPgf
 wI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Di8D1ZLAqNG4YBVeY21LWd3M3jwmUnOPUPIRfWvH74o=;
 b=tyEED/tkk/sGmL0r0CAV5X5nq7V4izfCWPHup5rEexRVSULD1ldSelIJZStiNKl8Q+
 m89u7FDFQ5TDSEQt59JjnURvj22L4irpU6XY+tgPGHfqmBJPhkYfCKVQF5mvMT0DyzC4
 t9c0dR0NZ57NuW4zldNjLRVdUWhUjxD0MW3j72frOGYvxgFz5JnNP3ulhjsRg0a9Oe3D
 6oz2o8q0ZPOna/wdfnWeGnjnGcjGouYwEgrIVEXfyjGLA3VHMNvOV2Coes4LMEPZitBp
 8pQmYirqihssChYIe0QtMwzJjgxzddo90wboZzDF53xV2cRpkUlqEAcMJoIC5E5Nk0kU
 S9Kw==
X-Gm-Message-State: AFqh2kpBHEwnmSh0o3yzyaihA49qecEM+G0H+3165I9VPJOKNi18dECO
 8xbqFIpYTje7QESCbzJah248WDOJvXU=
X-Google-Smtp-Source: AMrXdXuZ+eoqe1BE27lbsYyf/6auDgeXSZ1ibYoD7I6UMu7gzvCwnSHmEmW7pvlF2BvjpLremBPADA==
X-Received: by 2002:a17:907:a407:b0:84c:7974:8a73 with SMTP id
 sg7-20020a170907a40700b0084c79748a73mr22076362ejc.57.1672695344686; 
 Mon, 02 Jan 2023 13:35:44 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:44 -0800 (PST)
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
Subject: [PATCH 6/6] hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
Date: Mon,  2 Jan 2023 22:35:04 +0100
Message-Id: <20230102213504.14646-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102213504.14646-1-shentey@gmail.com>
References: <20230102213504.14646-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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

During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
TYPE_PIIX3_DEVICE. Remove this redundancy.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c             |  4 +---
 hw/isa/piix.c                 | 20 --------------------
 include/hw/southbridge/piix.h |  1 -
 3 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7ef0054b3a..76d98183ac 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled) {
         DeviceState *dev;
         PCIDevice *pci_dev;
-        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
-                                         : TYPE_PIIX3_DEVICE;
         int i;
 
         pci_bus = i440fx_init(pci_type,
@@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
                                        : pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_new_multifunction(-1, true, type);
+        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
         object_property_set_bool(OBJECT(pci_dev), "has-usb",
                                  machine_usb(machine), &error_abort);
         object_property_set_bool(OBJECT(pci_dev), "has-acpi",
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 98e9b12661..e4587352c9 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -33,7 +33,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/ide/piix.h"
 #include "hw/isa/isa.h"
-#include "hw/xen/xen.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
@@ -465,24 +464,6 @@ static const TypeInfo piix3_info = {
     .class_init    = piix3_class_init,
 };
 
-static void piix3_xen_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    k->realize = piix3_realize;
-    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
-    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
-    dc->vmsd = &vmstate_piix3;
-}
-
-static const TypeInfo piix3_xen_info = {
-    .name          = TYPE_PIIX3_XEN_DEVICE,
-    .parent        = TYPE_PIIX_PCI_DEVICE,
-    .instance_init = piix3_init,
-    .class_init    = piix3_xen_class_init,
-};
-
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
     ERRP_GUARD();
@@ -534,7 +515,6 @@ static void piix3_register_types(void)
 {
     type_register_static(&piix_pci_type_info);
     type_register_static(&piix3_info);
-    type_register_static(&piix3_xen_info);
     type_register_static(&piix4_info);
 }
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 65ad8569da..b1fc94a742 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -77,7 +77,6 @@ struct PIIXState {
 OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
 
 #define TYPE_PIIX3_DEVICE "PIIX3"
-#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
 #endif
-- 
2.39.0


