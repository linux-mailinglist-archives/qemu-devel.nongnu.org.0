Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498486D3E49
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:43:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEp3-0001gr-RH; Mon, 03 Apr 2023 03:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEp0-0001g1-B3
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEoy-0006ec-OC
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id l27so28262823wrb.2
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680507703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bFBFz6LEBXPSgQcOvP8yki+MQL0SlRe8vWuNcy1ofyc=;
 b=JnS3k4VnUoa2yBgFGDVDqacBd2DdaZDlI+9R3AWOFhe3KjznQtcT72nyHz3M0NNxPI
 BHk7+yVafEuJZsDmpI86KxWZdZSFBDFQejFdT++2yketIkY99aI1HrLv2dP9MnPjHQBs
 epvt+PyDpEF8mjOGr9ueoeGBlgS296BEv6sUEJ1Plv/gcSrfBpTUUOoN369ZxcDeBnJJ
 fC5SM5o/FYODXJeS0jB6XOoeGVOgSkOpHdlRV5MgT+SPRphnIdELNl11dGfm/A0PKLPN
 PjSXjmBBRUqR2fA/eTLELJx/ttMNy1M7gpFYGMCRRK1Cbtc4/GQjStDehV6+jgrR63Ry
 NCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680507703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bFBFz6LEBXPSgQcOvP8yki+MQL0SlRe8vWuNcy1ofyc=;
 b=v2UzDqd0Xdap05NtgfBKe9+0C549Z7aK3sUZ1gtksJpAkmsZ2iUP/Tl+izU9fiFNw/
 LvrJyeZmWNmPfEE+Ybq71659EdcVWmcRAeO4AUIOFBzg2YZodFGPeuFAkOJcoMmFwBxS
 TPvny3Z5QLD/mIIn6aukXJtzBp5d7YzEEpywbdpPLjYj8Y51rWMFleDaAXDLIT8Y0ace
 hJm2gCrLaiaY3tTo7P2z8R1GQ+IgVtsI/Ch7hFfrxQKe4cJvY0JTD9i/IfjZq4Rywqnt
 N6LiwXYb43q39dl6ZW3rb05KGDCqzSmoweqaqA/jzBc7YuzyjOi26Pim4+SlQdTG1UvY
 RDpg==
X-Gm-Message-State: AAQBX9dBgZGIO7uau/VTKCTdB4H47Ex8C59n8ExPn8dUwMmlUR5/QEJQ
 IFK9/vn+W+f5P3kq5P3Vyu/Pf5QHyZ3CGg==
X-Google-Smtp-Source: AKy350YQYzXtoXYV33vsug2IkHk8dVMjKWMW4Vgyul9fIIKt/0YfXdy2ovrIHW0LfhNXns7sxctNuA==
X-Received: by 2002:adf:fd51:0:b0:2ce:adda:f45a with SMTP id
 h17-20020adffd51000000b002ceaddaf45amr25195402wrs.62.1680507703148; 
 Mon, 03 Apr 2023 00:41:43 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:42 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 7/7] hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE
Date: Mon,  3 Apr 2023 09:41:24 +0200
Message-Id: <20230403074124.3925-8-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x430.google.com
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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
Message-Id: <20230312120221.99183-7-shentey@gmail.com>
---
 include/hw/southbridge/piix.h |  1 -
 hw/i386/pc_piix.c             |  5 ++---
 hw/isa/piix3.c                | 15 ---------------
 3 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 0bf48e936d..51be04e984 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -64,7 +64,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
                          TYPE_PIIX3_PCI_DEVICE)
 
 #define TYPE_PIIX3_DEVICE "PIIX3"
-#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
 #endif
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1b70470dcd..7ca0d6d14e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -237,8 +237,6 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled) {
         PIIX3State *piix3;
         PCIDevice *pci_dev;
-        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
-                                         : TYPE_PIIX3_DEVICE;
 
         pci_bus = i440fx_init(pci_type,
                               i440fx_host,
@@ -251,7 +249,8 @@ static void pc_init1(MachineState *machine,
                                        : pc_pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true,
+                                                  TYPE_PIIX3_DEVICE);
 
         if (xen_enabled()) {
             pci_device_set_intx_routing_notifier(
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 418940139d..0d6992af67 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -29,7 +29,6 @@
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
-#include "hw/xen/xen.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
@@ -366,24 +365,10 @@ static const TypeInfo piix3_info = {
     .class_init    = piix3_class_init,
 };
 
-static void piix3_xen_class_init(ObjectClass *klass, void *data)
-{
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    k->realize = piix3_realize;
-}
-
-static const TypeInfo piix3_xen_info = {
-    .name          = TYPE_PIIX3_XEN_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
-    .class_init    = piix3_xen_class_init,
-};
-
 static void piix3_register_types(void)
 {
     type_register_static(&piix3_pci_type_info);
     type_register_static(&piix3_info);
-    type_register_static(&piix3_xen_info);
 }
 
 type_init(piix3_register_types)
-- 
2.40.0


